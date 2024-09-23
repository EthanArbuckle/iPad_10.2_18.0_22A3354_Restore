@implementation DDParsecYeaAction

- (id)createViewController
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DDParsecYeaAction;
  -[DDParsecAction createViewController](&v3, sel_createViewController);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)localizedName
{
  return CFSTR("Report a correct hint (Internal)");
}

- (unint64_t)relevancy
{
  return 1;
}

- (id)feedbackListener
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__DDParsecYeaAction_feedbackListener__block_invoke;
  block[3] = &unk_1E42580C8;
  block[4] = self;
  if (feedbackListener_once != -1)
    dispatch_once(&feedbackListener_once, block);
  return (id)feedbackListener__session;
}

void __37__DDParsecYeaAction_feedbackListener__block_invoke()
{
  void *v0;
  double v1;
  const __CFString *v2;
  double Helper_x8__kPARLookupClient;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  double v12;
  double Helper_x8__OBJC_CLASS___PARSession;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE90]);
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString length](v17, "length"))
  {
    v2 = v17;
  }
  else
  {

    v2 = CFSTR("1.0");
  }
  v18 = (__CFString *)v2;
  Helper_x8__kPARLookupClient = gotLoadHelper_x8__kPARLookupClient(v1);
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@/%@"), Helper_x8__kPARLookupClient, **(_QWORD **)(v4 + 2048), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.lookup"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  gotLoadHelper_x8__OBJC_CLASS___PARSessionConfiguration(v9);
  v11 = (void *)objc_msgSend(objc_alloc(*(Class *)(v10 + 2016)), "initWithId:userAgent:", v8, v7);
  Helper_x8__OBJC_CLASS___PARSession = gotLoadHelper_x8__OBJC_CLASS___PARSession(v12);
  objc_msgSend(*(id *)(v14 + 2008), "sessionWithConfiguration:", v11, Helper_x8__OBJC_CLASS___PARSession);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)feedbackListener__session;
  feedbackListener__session = v15;

}

- (void)report
{
  void *v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  if (self->super.super.super._result)
  {
    DDResultGetParsecRawDomain();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    DDResultGetMatchedString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    gotLoadHelper_x8__OBJC_CLASS___SFLookupHintRelevancyFeedback(v4);
    v6 = (void *)objc_msgSend(objc_alloc(*(Class *)(v5 + 1216)), "initWithContext:hintRange:domain:discarded:grade:", v3, 0, objc_msgSend(v3, "length"), v8, DDShouldUseDebugHighlightForResult(), -[DDParsecYeaAction relevancy](self, "relevancy"));
    -[DDParsecYeaAction feedbackListener](self, "feedbackListener");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didGradeLookupHintRelevancy:", v6);

  }
}

- (void)prepareViewControllerForActionController:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[DDParsecYeaAction report](self, "report");
  v5.receiver = self;
  v5.super_class = (Class)DDParsecYeaAction;
  -[DDAction prepareViewControllerForActionController:](&v5, sel_prepareViewControllerForActionController_, v4);

}

- (void)performFromView:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[DDParsecYeaAction report](self, "report");
  v5.receiver = self;
  v5.super_class = (Class)DDParsecYeaAction;
  -[DDAction performFromView:](&v5, sel_performFromView_, v4);

}

- (BOOL)hasUserInterface
{
  return 1;
}

@end
