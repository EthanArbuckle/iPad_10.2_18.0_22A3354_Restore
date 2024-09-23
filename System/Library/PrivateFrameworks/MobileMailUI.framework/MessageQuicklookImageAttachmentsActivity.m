@implementation MessageQuicklookImageAttachmentsActivity

- (MessageQuicklookImageAttachmentsActivity)initWithAttachmentHandlingDelegate:(id)a3 context:(int64_t)a4 url:(id)a5
{
  id v7;
  id v8;
  MessageQuicklookImageAttachmentsActivity *v9;
  MessageQuicklookImageAttachmentsActivity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)MessageQuicklookImageAttachmentsActivity;
  v9 = -[UIActivity init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    -[MessageQuicklookImageAttachmentsActivity setDelegate:](v9, "setDelegate:", v7);
    -[MessageQuicklookImageAttachmentsActivity setUrl:](v10, "setUrl:", v8);
  }

  return v10;
}

- (id)activityType
{
  return CFSTR("com.apple.mobilemail.activity.Quicklook");
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("QUICK_LOOK"), &stru_1E9A04480, CFSTR("Main"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)activityImage
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", *MEMORY[0x1E0CC6828]);
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

- (void)_cleanup
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MessageQuicklookImageAttachmentsActivity;
  -[UIActivity _cleanup](&v5, sel__cleanup);
  -[MessageQuicklookImageAttachmentsActivity delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageQuicklookImageAttachmentsActivity url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewURL:", v4);

}

- (ContentRepresentationHandlingDelegate)delegate
{
  return (ContentRepresentationHandlingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
