@implementation MessagePrintQuicklookableAttachmentActivity

- (MessagePrintQuicklookableAttachmentActivity)initWithPrintPageRenderer:(id)a3
{
  id v5;
  MessagePrintQuicklookableAttachmentActivity *v6;
  MessagePrintQuicklookableAttachmentActivity *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MessagePrintQuicklookableAttachmentActivity;
  v6 = -[UIActivity init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pageRenderer, a3);

  return v7;
}

- (id)activityType
{
  return (id)*MEMORY[0x1E0D96E00];
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PRINT"), &stru_1E9A04480, CFSTR("Main"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)activityImage
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", *MEMORY[0x1E0CC6820]);
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D80C28], "sharedPrintController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MessagePrintQuicklookableAttachmentActivity pageRenderer](self, "pageRenderer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrintPageRenderer:", v3);

  objc_msgSend(v4, "presentAnimated:completionHandler:", 1, 0);
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 1);

}

- (UIPrintPageRenderer)pageRenderer
{
  return self->_pageRenderer;
}

- (void)setPageRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_pageRenderer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageRenderer, 0);
}

@end
