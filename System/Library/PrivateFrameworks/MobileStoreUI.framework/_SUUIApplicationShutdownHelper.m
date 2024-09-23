@implementation _SUUIApplicationShutdownHelper

- (_SUUIApplicationShutdownHelper)initWithApplicationController:(id)a3
{
  id v5;
  _SUUIApplicationShutdownHelper *v6;
  _SUUIApplicationShutdownHelper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SUUIApplicationShutdownHelper;
  v6 = -[_SUUIApplicationShutdownHelper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_applicationController, a3);

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_taskID != *MEMORY[0x24BEBE030])
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endBackgroundTask:", self->_taskID);

  }
  v4.receiver = self;
  v4.super_class = (Class)_SUUIApplicationShutdownHelper;
  -[_SUUIApplicationShutdownHelper dealloc](&v4, sel_dealloc);
}

- (void)start
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __39___SUUIApplicationShutdownHelper_start__block_invoke;
  v4[3] = &unk_2511F47C0;
  v4[4] = self;
  self->_taskID = objc_msgSend(v3, "beginBackgroundTaskWithExpirationHandler:", v4);

}

- (void)stop
{
  SUUIApplicationController *applicationController;
  unint64_t v4;
  void *v5;

  applicationController = self->_applicationController;
  self->_applicationController = 0;

  v4 = *MEMORY[0x24BEBE030];
  if (self->_taskID != *MEMORY[0x24BEBE030])
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endBackgroundTask:", self->_taskID);

    self->_taskID = v4;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationController, 0);
}

@end
