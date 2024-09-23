@implementation InterAppAudioApp

- (id)init:(const InterAppAudioAppInfo *)a3 iconSize:(float)a4
{
  InterAppAudioApp *v5;
  InterAppAudioApp *v6;
  int var1;
  const __CFString *v8;
  UIImage *var2;
  UIImage *v10;
  NSURL *v11;
  NSString *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)InterAppAudioApp;
  v5 = -[InterAppAudioApp init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_isHost = a3->var0;
    var1 = a3->var1;
    v5->_isCurrentApp = var1 == getpid();
    v6->_key = a3->var1;
    v6->_isForeground = -[InterAppAudioApp processRunningOnForeground:](v6, "processRunningOnForeground:");
    var2 = (UIImage *)a3->var2;
    if (!var2)
      var2 = (UIImage *)IPCAUIcons::GetIconFromBundle((IPCAUIcons *)a3->var4, v8);
    v6->_icon = var2;
    v6->_url = (NSURL *)a3->var5;
    v6->_name = &a3->var3->isa;
    v10 = var2;
    v11 = v6->_url;
    v12 = v6->_name;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)InterAppAudioApp;
  -[InterAppAudioApp dealloc](&v3, sel_dealloc);
}

- (BOOL)processRunningOnForeground:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  BKSApplicationStateMonitor *appMonitor;
  char v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = *(_QWORD *)&a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  if (!self->appMonitor)
    self->appMonitor = (BKSApplicationStateMonitor *)objc_alloc_init(MEMORY[0x1E0CFE2F8]);
  v5 = dispatch_semaphore_create(0);
  appMonitor = self->appMonitor;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__InterAppAudioApp_processRunningOnForeground___block_invoke;
  v9[3] = &unk_1E29198D0;
  v9[4] = v5;
  v9[5] = &v10;
  -[BKSApplicationStateMonitor applicationInfoForPID:completion:](appMonitor, "applicationInfoForPID:completion:", v3, v9);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v5);
  v7 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<InterAppAudioApp %p: '%@' url %@>"), self, self->_name, self->_url);
}

- (int64_t)key
{
  return self->_key;
}

- (NSString)name
{
  return self->_name;
}

- (UIImage)icon
{
  return self->_icon;
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)isHost
{
  return self->_isHost;
}

- (BOOL)isCurrentApp
{
  return self->_isCurrentApp;
}

- (BOOL)isForeground
{
  return self->_isForeground;
}

intptr_t __47__InterAppAudioApp_processRunningOnForeground___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0CFE2A0])
    && objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0CFE298]), "BOOLValue"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
