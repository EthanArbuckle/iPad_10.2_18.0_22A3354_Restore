@implementation IMAudioController_iOS

- (IMAudioController_iOS)initWithContentsOfURLs:(id)a3
{
  const char *v3;
  uint64_t v4;
  IMAudioController_iOS *v5;
  void *v6;
  const char *v7;
  const char *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IMAudioController_iOS;
  v5 = -[IMAudioController initWithContentsOfURLs:](&v10, sel_initWithContentsOfURLs_, a3);
  if (v5)
  {
    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v6, v7, (uint64_t)v5, sel_audioSessionInterruption_, *MEMORY[0x24BDB15D8], 0);
    objc_msgSend_addObserver_selector_name_object_(v6, v8, (uint64_t)v5, sel_applicationWillResignActive, *MEMORY[0x24BDF75D8], 0);

  }
  return v5;
}

- (void)dealloc
{
  uint64_t v2;
  void *v4;
  const char *v5;
  objc_super v6;

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_(v4, v5, (uint64_t)self);

  v6.receiver = self;
  v6.super_class = (Class)IMAudioController_iOS;
  -[IMAudioController dealloc](&v6, sel_dealloc);
}

- (void)audioSessionInterruption:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;

  objc_msgSend_setInterrupted_(self, a2, 1);
  objc_msgSend_audioPlayer(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stop(v6, v7, v8);

  objc_msgSend_setInterrupted_(self, v9, 0);
}

- (void)applicationWillResignActive
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  id v5;

  objc_msgSend_audioPlayer(self, a2, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stop(v5, v3, v4);

}

@end
