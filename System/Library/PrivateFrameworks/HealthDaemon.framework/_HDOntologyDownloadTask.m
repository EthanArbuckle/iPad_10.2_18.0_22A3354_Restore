@implementation _HDOntologyDownloadTask

- (_HDOntologyDownloadTask)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (id)initForDownloader:(id)a3 session:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  id v11;
  _HDOntologyDownloadTask *v12;
  _HDOntologyDownloadTask *v13;
  dispatch_group_t v14;
  OS_dispatch_group *downloadGroup;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_HDOntologyDownloadTask;
  v12 = -[_HDOntologyDownloadTask init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_downloader, a3);
    objc_storeStrong((id *)&v13->_session, a4);
    objc_storeStrong((id *)&v13->_queue, a5);
    v14 = dispatch_group_create();
    downloadGroup = v13->_downloadGroup;
    v13->_downloadGroup = (OS_dispatch_group *)v14;

  }
  return v13;
}

- (void)downloadShardsForEntries:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  dispatch_group_t v8;
  uint64_t v9;
  NSObject *v10;
  NSArray *v11;
  NSArray *downloadTasks;
  NSObject *queue;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  dispatch_group_t v18;

  v6 = a4;
  v7 = a3;
  v8 = dispatch_group_create();
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __63___HDOntologyDownloadTask_downloadShardsForEntries_completion___block_invoke;
  v17[3] = &unk_1E6CFBFB0;
  v17[4] = self;
  v18 = v8;
  v10 = v8;
  objc_msgSend(v7, "hk_map:", v17);
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();

  downloadTasks = self->_downloadTasks;
  self->_downloadTasks = v11;

  queue = self->_queue;
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __63___HDOntologyDownloadTask_downloadShardsForEntries_completion___block_invoke_2;
  v15[3] = &unk_1E6CE9C08;
  v15[4] = self;
  v16 = v6;
  v14 = v6;
  dispatch_group_notify(v10, queue, v15);

}

- (id)_taskError
{
  void *v2;
  void *v3;

  -[NSArray hk_firstObjectPassingTest:](self->_downloadTasks, "hk_firstObjectPassingTest:", &__block_literal_global_130);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadTasks, 0);
  objc_storeStrong((id *)&self->_downloadGroup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_downloader, 0);
}

@end
