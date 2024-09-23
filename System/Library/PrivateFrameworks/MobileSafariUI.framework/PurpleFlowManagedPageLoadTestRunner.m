@implementation PurpleFlowManagedPageLoadTestRunner

- (PurpleFlowManagedPageLoadTestRunner)initWithTestName:(id)a3 browserController:(id)a4
{
  PurpleFlowManagedPageLoadTestRunner *v4;
  PurpleFlowManagedPageLoadTestRunner *v5;
  _QWORD handler[4];
  PurpleFlowManagedPageLoadTestRunner *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PurpleFlowManagedPageLoadTestRunner;
  v4 = -[PurplePageLoadTestRunner initWithTestName:browserController:](&v9, sel_initWithTestName_browserController_, a3, a4);
  v5 = v4;
  if (v4)
  {
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __74__PurpleFlowManagedPageLoadTestRunner_initWithTestName_browserController___block_invoke;
    handler[3] = &unk_1E9CF54B8;
    v8 = v4;
    notify_register_dispatch("com.apple.mobilesafari.pageload.proceed", (int *)(&v5->super._showRenderFps + 1), MEMORY[0x1E0C80D38], handler);

  }
  return v5;
}

id __74__PurpleFlowManagedPageLoadTestRunner_initWithTestName_browserController___block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)PurpleFlowManagedPageLoadTestRunner;
  return objc_msgSendSuper2(&v2, sel_startNextPage);
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(*(_DWORD *)(&self->super._showRenderFps + 1));
  v3.receiver = self;
  v3.super_class = (Class)PurpleFlowManagedPageLoadTestRunner;
  -[PageLoadTestRunner dealloc](&v3, sel_dealloc);
}

- (void)startNextPage
{
  notify_post("com.apple.mobilesafari.pageload.startNextPageIfExistsElseFinish");
}

@end
