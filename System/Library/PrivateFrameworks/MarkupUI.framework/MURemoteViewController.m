@implementation MURemoteViewController

+ (id)serviceViewControllerInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2555C9198);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_animateExitWithInfo_, 0, 0);

  return v2;
}

+ (id)exportedInterface
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2555B1540);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_serviceDidFinishwithResults_andSandboxExtension_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_serviceDidFinishwithResults_andSandboxExtension_, 1, 0);

  return v2;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MURemoteViewController;
  -[MURemoteViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[MURemoteViewController setShouldResignFirstResponder:](self, "setShouldResignFirstResponder:", 0);
  -[MURemoteViewController becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MURemoteViewController;
  -[_UIRemoteViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[MURemoteViewController setShouldResignFirstResponder:](self, "setShouldResignFirstResponder:", 1);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)motionEnded:(int64_t)a3 withEvent:(id)a4
{
  id v6;
  objc_super v7;
  objc_super v8;

  v6 = a4;
  if (a3 != 1)
  {
    v8.receiver = self;
    v8.super_class = (Class)MURemoteViewController;
    if (-[MURemoteViewController respondsToSelector:](&v8, sel_respondsToSelector_, sel_motionEnded_withEvent_))
    {
      v7.receiver = self;
      v7.super_class = (Class)MURemoteViewController;
      -[MURemoteViewController motionEnded:withEvent:](&v7, sel_motionEnded_withEvent_, a3, v6);
    }
  }

}

- (void)serviceDidFinishwithResults:(id)a3 andSandboxExtension:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    -[MURemoteViewController setSandboxExtensionHandle:](self, "setSandboxExtensionHandle:", sandbox_extension_consume());
  }
  -[MURemoteViewController finishedWithResultsCompletionBlock](self, "finishedWithResultsCompletionBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MURemoteViewController finishedWithResultsCompletionBlock](self, "finishedWithResultsCompletionBlock");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v8)[2](v8, v9);

  }
}

- (void)beginDismissWithInfo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animateExitWithInfo:", v4);

  if (-[MURemoteViewController sandboxExtensionHandle](self, "sandboxExtensionHandle"))
  {
    -[MURemoteViewController sandboxExtensionHandle](self, "sandboxExtensionHandle");
    sandbox_extension_release();
    -[MURemoteViewController setSandboxExtensionHandle:](self, "setSandboxExtensionHandle:", 0);
  }

}

- (id)finishedWithResultsCompletionBlock
{
  return self->_finishedWithResultsCompletionBlock;
}

- (void)setFinishedWithResultsCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1480);
}

- (int64_t)sandboxExtensionHandle
{
  return self->_sandboxExtensionHandle;
}

- (void)setSandboxExtensionHandle:(int64_t)a3
{
  self->_sandboxExtensionHandle = a3;
}

- (BOOL)shouldResignFirstResponder
{
  return self->_shouldResignFirstResponder;
}

- (void)setShouldResignFirstResponder:(BOOL)a3
{
  self->_shouldResignFirstResponder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finishedWithResultsCompletionBlock, 0);
}

@end
