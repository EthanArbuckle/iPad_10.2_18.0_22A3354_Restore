@implementation MessageMarkupDocumentActivity

- (MessageMarkupDocumentActivity)initWithAttachmentHandlingDelegate:(id)a3 context:(int64_t)a4
{
  id v6;
  MessageMarkupDocumentActivity *v7;
  MessageMarkupDocumentActivity *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MessageMarkupDocumentActivity;
  v7 = -[UIActivity init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[MessageMarkupDocumentActivity setDelegate:](v7, "setDelegate:", v6);
    -[MessageMarkupDocumentActivity setContext:](v8, "setContext:", a4);
  }

  return v8;
}

- (id)activityType
{
  return CFSTR("com.apple.mobilemail.markupDocument");
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("MARKUP_DOCUMENT"), &stru_1E9A04480, CFSTR("Main"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)activityImage
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", *MEMORY[0x1E0CC6800]);
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

- (ContentRepresentationHandlingDelegate)delegate
{
  return (ContentRepresentationHandlingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
