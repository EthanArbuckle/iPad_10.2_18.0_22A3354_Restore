@implementation QuickTypePFLBackgroundTask

- (QuickTypePFLBackgroundTask)initWithURL:(id)a3
{
  id v4;
  QuickTypePFLBackgroundTask *v5;
  QuickTypePFLBackgroundTask *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)QuickTypePFLBackgroundTask;
  v5 = -[MLBackgroundTask init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[QuickTypePFLBackgroundTask setUrl:](v5, "setUrl:", v4);

  return v6;
}

+ (Class)taskRunnerClass
{
  return (Class)objc_opt_class();
}

- (id)activityForScheduling
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v14;
  if (v3)
  {
    v5 = (void *)MEMORY[0x24BE2E218];
    v6 = *MEMORY[0x24BE2E2A0];
    v7 = *MEMORY[0x24BE2E270];
    v8 = *MEMORY[0x24BE2E238];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extensionLaunchActivityWithName:priority:forExtensionIdentifier:withReason:duration:startingAfter:startingBefore:", CFSTR("com.apple.NLPLearner.QuickTypePFLExtension"), v6, CFSTR("com.apple.NLPLearner.QuickTypePFLExtension"), v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = CFSTR("QuickTypePFLBackgroundTask");
    v16[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUserInfo:", v12);

    objc_msgSend(v11, "setRequiresDeviceInactivity:", 1);
    objc_msgSend(v11, "setCpuIntensive:", 1);
    objc_msgSend(v11, "setRequiresPlugin:", 1);
    objc_msgSend(v11, "setMemoryIntensive:", 1);
    objc_msgSend(v11, "setRequiresNetwork:", 1);
    objc_msgSend(v11, "setRequiresInexpensiveNetworking:", 1);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[QuickTypePFLBackgroundTask activityForScheduling].cold.1(self, (uint64_t)v4);
    v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QuickTypePFLBackgroundTask;
  v4 = a3;
  -[MLBackgroundTask encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[QuickTypePFLBackgroundTask url](self, "url", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("url"));

}

- (QuickTypePFLBackgroundTask)initWithCoder:(id)a3
{
  id v4;
  QuickTypePFLBackgroundTask *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)QuickTypePFLBackgroundTask;
  v5 = -[MLBackgroundTask initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[QuickTypePFLBackgroundTask setUrl:](v5, "setUrl:", v6);

  }
  return v5;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)activityForScheduling
{
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "taskIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_22630F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to archive task %@: %@", (uint8_t *)&v4, 0x16u);

}

@end
