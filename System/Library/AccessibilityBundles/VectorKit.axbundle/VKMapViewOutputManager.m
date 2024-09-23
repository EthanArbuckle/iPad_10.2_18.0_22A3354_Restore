@implementation VKMapViewOutputManager

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VKMapViewOutputManager;
  -[VKMapViewOutputManager dealloc](&v4, sel_dealloc);
}

- (VKMapViewOutputManager)init
{
  VKMapViewOutputManager *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VKMapViewOutputManager;
  v2 = -[VKMapViewOutputManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKMapViewOutputManager setOutputQueue:](v2, "setOutputQueue:", v3);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__handleAccessibilityAnnouncementDidFinish_, *MEMORY[0x24BDF71D0], 0);

  }
  return v2;
}

+ (id)sharedOutputManager
{
  if (+[VKMapViewOutputManager sharedOutputManager]::_OutputManagerOnceToken != -1)
    dispatch_once(&+[VKMapViewOutputManager sharedOutputManager]::_OutputManagerOnceToken, &__block_literal_global_5);
  return (id)+[VKMapViewOutputManager sharedOutputManager]::_OutputManager;
}

void __45__VKMapViewOutputManager_sharedOutputManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)+[VKMapViewOutputManager sharedOutputManager]::_OutputManager;
  +[VKMapViewOutputManager sharedOutputManager]::_OutputManager = v0;

}

- (void)_handleAccessibilityAnnouncementDidFinish:(id)a3
{
  void *v3;
  id v4;

  -[VKMapViewOutputManager outputQueue](self, "outputQueue", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v3);
    objc_msgSend(v4, "removeLastObject");

  }
}

- (void)clearOutputQueue
{
  id v2;

  -[VKMapViewOutputManager outputQueue](self, "outputQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (unint64_t)outputQueueCount
{
  void *v2;
  unint64_t v3;

  -[VKMapViewOutputManager outputQueue](self, "outputQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)queueOutput:(id)a3
{
  void *v4;
  id argument;

  argument = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[VKMapViewOutputManager outputQueue](self, "outputQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
      objc_msgSend(v4, "insertObject:atIndex:", argument, 0);
    else
      UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], argument);

  }
}

- (NSMutableArray)outputQueue
{
  return self->_outputQueue;
}

- (void)setOutputQueue:(id)a3
{
  objc_storeStrong((id *)&self->_outputQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputQueue, 0);
}

@end
