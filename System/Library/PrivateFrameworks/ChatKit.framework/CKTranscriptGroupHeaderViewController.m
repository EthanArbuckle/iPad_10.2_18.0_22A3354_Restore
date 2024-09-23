@implementation CKTranscriptGroupHeaderViewController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptGroupHeaderViewController;
  -[CKTranscriptGroupHeaderViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  CKTranscriptGroupHeaderView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CKTranscriptGroupHeaderView *v10;

  v3 = [CKTranscriptGroupHeaderView alloc];
  -[CKTranscriptHeaderViewController conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CKTranscriptGroupHeaderView initWithFrame:conversation:](v3, "initWithFrame:conversation:", v4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  -[CKTranscriptGroupHeaderViewController setView:](self, "setView:", v10);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptHeaderViewController conversation](self, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__handleConversationRecipientsChanged_, CFSTR("CKConversationParticipantsDidChangeNotification"), v6);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__handleConversationRecipientsChanged_, *MEMORY[0x1E0D373C0], 0);

  -[CKTranscriptGroupHeaderView textView](v10, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptGroupHeaderViewController _groupHeaderComposeRecipients](self, "_groupHeaderComposeRecipients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRecipients:", v9);

}

- (BOOL)shouldInvalidateOnAddressBookChange
{
  return 0;
}

- (UIButton)headerButton
{
  void *v2;
  void *v3;

  -[CKTranscriptGroupHeaderViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIButton *)v3;
}

- (id)_groupHeaderComposeRecipients
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;

  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[CKTranscriptHeaderViewController conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v5, "count"));

  -[CKTranscriptHeaderViewController conversation](self, "conversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__CKTranscriptGroupHeaderViewController__groupHeaderComposeRecipients__block_invoke;
  v13[3] = &unk_1E2758970;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);

  v10 = v14;
  v11 = v9;

  return v11;
}

void __70__CKTranscriptGroupHeaderViewController__groupHeaderComposeRecipients__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  CKIMGroupHeaderRecipient *v7;

  v3 = a2;
  v7 = -[CKIMComposeRecipient initWithHandle:]([CKIMGroupHeaderRecipient alloc], "initWithHandle:", v3);
  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayNameForChat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKIMGroupHeaderRecipient setDisplayString:](v7, "setDisplayString:", v6);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

- (void)_handleConversationRecipientsChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[CKTranscriptGroupHeaderViewController view](self, "view", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptGroupHeaderViewController _groupHeaderComposeRecipients](self, "_groupHeaderComposeRecipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRecipients:", v5);

}

@end
