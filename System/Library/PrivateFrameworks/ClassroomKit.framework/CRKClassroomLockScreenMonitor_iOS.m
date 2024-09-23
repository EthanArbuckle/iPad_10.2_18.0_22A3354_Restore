@implementation CRKClassroomLockScreenMonitor_iOS

- (void)dealloc
{
  objc_super v3;

  -[CRKClassroomLockScreenMonitor_iOS endObserving](self, "endObserving");
  v3.receiver = self;
  v3.super_class = (Class)CRKClassroomLockScreenMonitor_iOS;
  -[CRKClassroomLockScreenMonitor_iOS dealloc](&v3, sel_dealloc);
}

- (CRKClassroomLockScreenMonitor_iOS)init
{
  CRKClassroomLockScreenMonitor_iOS *v2;
  CRKClassroomLockScreenMonitor_iOS *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRKClassroomLockScreenMonitor_iOS;
  v2 = -[CRKClassroomLockScreenMonitor_iOS init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CRKClassroomLockScreenMonitor_iOS startObserving](v2, "startObserving");
  return v3;
}

- (void)displayClassroomLockScreenWithLabel:(id)a3 passcode:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v5 = a4;
  v6 = (void *)objc_opt_new();
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithInt:", objc_msgSend(v8, "processIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("studentdPID"));

  if (objc_msgSend(v12, "length"))
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("lockedByLabel"));
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("passcode"));
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "enableLockScreenBundle:withContext:", CFSTR("ClassroomLockScreen"), v6);

  v11 = SBSSpringBoardServerPort();
  MEMORY[0x219A22010](v11, 1);
  SBSUndimScreen();

}

- (void)dismissClassroomLockScreen
{
  id v2;

  v2 = (id)objc_opt_new();
  objc_msgSend(v2, "disableLockScreenBundle:withContext:", CFSTR("ClassroomLockScreen"), 0);

}

- (void)startObserving
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[5];
  _QWORD handler[5];

  v3 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __51__CRKClassroomLockScreenMonitor_iOS_startObserving__block_invoke;
  handler[3] = &unk_24D9C8688;
  handler[4] = self;
  v4 = MEMORY[0x24BDAC9B8];
  notify_register_dispatch("com.apple.studentd.lockScreenPluginDidAppear", &self->mDidAppearObserver, MEMORY[0x24BDAC9B8], handler);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __51__CRKClassroomLockScreenMonitor_iOS_startObserving__block_invoke_2;
  v5[3] = &unk_24D9C8688;
  v5[4] = self;
  notify_register_dispatch("com.apple.studentd.lockScreenPluginWantsDismissal", &self->mDidDismissObserver, v4, v5);

}

- (void)endObserving
{
  notify_cancel(self->mDidAppearObserver);
  notify_cancel(self->mDidDismissObserver);
}

- (BOOL)isClassroomLockScreenVisible
{
  return self->_classroomLockScreenVisible;
}

- (void)setClassroomLockScreenVisible:(BOOL)a3
{
  self->_classroomLockScreenVisible = a3;
}

@end
