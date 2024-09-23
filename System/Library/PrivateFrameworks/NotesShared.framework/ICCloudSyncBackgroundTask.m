@implementation ICCloudSyncBackgroundTask

- (ICCloudSyncBackgroundTask)initWithCloudContext:(id)a3
{
  id v5;
  ICCloudSyncBackgroundTask *v6;
  ICCloudSyncBackgroundTask *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICCloudSyncBackgroundTask;
  v6 = -[ICCloudSyncBackgroundTask init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cloudContext, a3);

  return v7;
}

+ (id)makeTaskRequest
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92680]), "initWithIdentifier:", CFSTR("com.apple.notes.cloud.backgroundSync"));
  objc_msgSend(v2, "setRequiresNetworkConnectivity:", 1);
  objc_msgSend(v2, "setRequiresExternalPower:", 1);
  return v2;
}

- (void)runTaskWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D64288], "postBasicEvent:", 24);
  -[ICCloudSyncBackgroundTask cloudContext](self, "cloudContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__ICCloudSyncBackgroundTask_runTaskWithCompletion___block_invoke;
  v7[3] = &unk_1E76C75F0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "syncWithReason:completionHandler:", CFSTR("BackgroundSyncTask"), v7);

}

void __51__ICCloudSyncBackgroundTask_runTaskWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  if (v5)
    v3 = 13;
  else
    v3 = 12;
  objc_msgSend(MEMORY[0x1E0D64288], "postBasicEvent:", v3);
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

}

- (void)handleTaskExpiration
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D64288], "postBasicEvent:", 14);
  -[ICCloudSyncBackgroundTask cloudContext](self, "cloudContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelEverythingWithCompletionHandler:", 0);

  +[ICBackgroundTaskScheduler sharedScheduler](ICBackgroundTaskScheduler, "sharedScheduler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheduleTask:completion:", objc_opt_class(), 0);

}

- (ICCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudContext, 0);
}

@end
