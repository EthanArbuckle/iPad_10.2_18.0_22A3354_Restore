@implementation FAActivityViewController

- (FAActivityViewController)initWithItemSource:(id)a3 eventType:(id)a4
{
  id v7;
  id v8;
  FAInviteInPersonActivity *v9;
  int v10;
  void *v11;
  void *v12;
  FAActivityViewController *v13;
  FAInviteRecipientEvaluator *v14;
  FAInviteRecipientEvaluator *inviteRecipientEvaluator;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  objc_super v22;
  _QWORD v23[4];
  _QWORD v24[3];
  FAInviteInPersonActivity *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(FAInviteInPersonActivity);
  v10 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE30950]);

  v26[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22.receiver = self;
  v22.super_class = (Class)FAActivityViewController;
  v13 = -[FAActivityViewController initWithActivityItems:applicationActivities:shouldSuggestFamilyMembers:](&v22, sel_initWithActivityItems_applicationActivities_shouldSuggestFamilyMembers_, v11, v12, v10 ^ 1u);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_itemSource, a3);
    v14 = objc_alloc_init(FAInviteRecipientEvaluator);
    inviteRecipientEvaluator = v13->_inviteRecipientEvaluator;
    v13->_inviteRecipientEvaluator = v14;

    v16 = *MEMORY[0x24BE8F6A8];
    if (v10)
    {
      v24[0] = *MEMORY[0x24BE8F690];
      v24[1] = v16;
      v24[2] = *MEMORY[0x24BE8F6B8];
      v17 = (void *)MEMORY[0x24BDBCE30];
      v18 = v24;
      v19 = 3;
    }
    else
    {
      v23[0] = *MEMORY[0x24BE8F690];
      v23[1] = v16;
      v23[2] = *MEMORY[0x24BE8F6B8];
      v23[3] = CFSTR("FAInviteInPersonActivity");
      v17 = (void *)MEMORY[0x24BDBCE30];
      v18 = v23;
      v19 = 4;
    }
    objc_msgSend(v17, "arrayWithObjects:count:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[FAActivityViewController setIncludedActivityTypes:](v13, "setIncludedActivityTypes:", v20);

    -[FAActivityViewController setAirDropDelegate:](v13, "setAirDropDelegate:", v13);
    -[FAActivityViewController setAllowsCustomPresentationStyle:](v13, "setAllowsCustomPresentationStyle:", 1);
  }

  return v13;
}

- (void)_prepareActivity:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSArray *recipientAddresses;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  objc_super v14;
  _QWORD v15[4];
  id v16;
  FAActivityViewController *v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  recipientAddresses = self->_recipientAddresses;
  self->_recipientAddresses = 0;

  -[FAActivityViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "linkMetadataForActivityViewController:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15[1] = 3221225472;
  v15[2] = __56__FAActivityViewController__prepareActivity_completion___block_invoke;
  v15[3] = &unk_24C88C3C8;
  v16 = v6;
  v17 = self;
  v18 = v10;
  v19 = v7;
  v14.receiver = self;
  v14.super_class = (Class)FAActivityViewController;
  v15[0] = MEMORY[0x24BDAC760];
  v11 = v7;
  v12 = v10;
  v13 = v6;
  -[FAActivityViewController _prepareActivity:completion:](&v14, sel__prepareActivity_completion_, v13, v15);

}

uint64_t __56__FAActivityViewController__prepareActivity_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  __CFString *v33;
  __CFString *v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "activityType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)*MEMORY[0x24BE8F6B8];

  v4 = *(void **)(a1 + 32);
  if (v2 == v3)
  {
    v11 = v4;
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v11, "messageComposeViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMessageComposeDelegate:", v12);

    objc_msgSend(*(id *)(a1 + 48), "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "messageBubbleTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = objc_alloc(MEMORY[0x24BDDD0D0]);
      objc_msgSend(*(id *)(a1 + 48), "bubbleMetadata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v16, "initWithLinkMetadata:", v17);

      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDD0C8]), "initWithAlternateLayout:", v9);
      v43[0] = *MEMORY[0x24BE4FDA0];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setRequiredCapabilities:", v19);

      v20 = objc_alloc(MEMORY[0x24BDDD0C0]);
      v21 = objc_alloc_init(MEMORY[0x24BDDD0E8]);
      v22 = (void *)objc_msgSend(v20, "initWithSession:", v21);

      objc_msgSend(v22, "setLayout:", v18);
      objc_msgSend(*(id *)(a1 + 48), "context");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "buildInviteMessageBubbleURL:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setURL:", v24);

      objc_msgSend(*(id *)(a1 + 48), "context");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "messageBubbleSubTitle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setSummaryText:", v26);

      objc_msgSend(v11, "messageComposeViewController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setMessage:", v22);
    }
    else
    {
      objc_msgSend(v11, "messageComposeViewController");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "bubbleMetadata");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dataRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "bubbleMetadata");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "URL");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addRichLinkData:withWebpageURL:", v22, v41);

    }
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(v4, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x24BE8F6A8];

  if (v5 == v6)
  {
    objc_msgSend(*(id *)(a1 + 48), "mailMetadata");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v28 = objc_alloc(MEMORY[0x24BDDA8A8]);
    objc_msgSend(v11, "originalURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v28, "initWithURL:", v29);

    objc_msgSend(v9, "setMetadata:", v11);
    objc_msgSend(v9, "HTMLFragmentString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "context");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "mailMessageBodyHTML");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v31;
    v33 = &stru_24C8A3000;
    if (v31)
      v33 = (__CFString *)v31;
    v34 = v33;

    -[__CFString stringByAppendingString:](v34, "stringByAppendingString:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = *(_QWORD *)(a1 + 40);
    v36 = *(id *)(a1 + 32);
    objc_msgSend(v36, "mailComposeViewController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setMailComposeDelegate:", v35);

    objc_msgSend(v36, "mailComposeViewController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setMessageBody:isHTML:", v22, 1);

    objc_msgSend(v36, "mailComposeViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "context");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v39, "mailMessageSubject");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setSubject:", v40);

    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 32), "activityType");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v7 == CFSTR("FAInviteInPersonActivity"))
  {
    v8 = *(void **)(a1 + 40);
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v8, "presentingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPresentingViewController:", v10);

    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activityViewController:willStartAsyncActivity:", *(_QWORD *)(a1 + 40), v9);
LABEL_12:

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _FALogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v9;
    v15 = 2048;
    v16 = a4;
    _os_log_impl(&dword_20DE41000, v7, OS_LOG_TYPE_DEFAULT, "%@ MFMessageComposeVC delegate callback - didFinishWithResult:%ld", (uint8_t *)&v13, 0x16u);

  }
  -[FAActivityViewController activity](self, "activity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[FAActivityViewController activity](self, "activity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "messageComposeViewController:didFinishWithResult:", v6, a4);

  }
}

- (void)messageComposeViewController:(id)a3 shouldSendMessage:(id)a4 toRecipients:(id)a5 completion:(id)a6
{
  NSArray *v8;
  id v9;
  NSObject *v10;
  NSArray *recipientAddresses;
  NSArray *v12;
  FAInviteRecipientEvaluator *inviteRecipientEvaluator;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = (NSArray *)a5;
  v9 = a6;
  _FALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = CFSTR("FAActivityViewController.m");
    _os_log_impl(&dword_20DE41000, v10, OS_LOG_TYPE_DEFAULT, "%@ MFMessageComposeVC delegate callback - shouldSendMessage", (uint8_t *)&v19, 0xCu);
  }

  recipientAddresses = self->_recipientAddresses;
  self->_recipientAddresses = v8;
  v12 = v8;

  inviteRecipientEvaluator = self->_inviteRecipientEvaluator;
  -[FAActivityViewController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "linkMetadataForActivityViewController:", self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAActivityViewController activity](self, "activity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activityViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAInviteRecipientEvaluator validateRecipients:inviteContext:presenter:completion:](inviteRecipientEvaluator, "validateRecipients:inviteContext:presenter:completion:", v12, v16, v18, v9);

}

- (void)mailComposeController:(id)a3 shouldSendMail:(id)a4 toRecipients:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  NSArray *v11;
  NSArray *recipientAddresses;
  FAInviteRecipientEvaluator *inviteRecipientEvaluator;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a6;
  v9 = a5;
  _FALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = CFSTR("FAActivityViewController.m");
    _os_log_impl(&dword_20DE41000, v10, OS_LOG_TYPE_DEFAULT, "%@ MFMessageComposeVC delegate callback - shouldSendMail", (uint8_t *)&v19, 0xCu);
  }

  -[FAActivityViewController _parseRecipientAddresses:](self, "_parseRecipientAddresses:", v9);
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  recipientAddresses = self->_recipientAddresses;
  self->_recipientAddresses = v11;

  inviteRecipientEvaluator = self->_inviteRecipientEvaluator;
  -[FAActivityViewController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "linkMetadataForActivityViewController:", self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAActivityViewController activity](self, "activity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activityViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAInviteRecipientEvaluator validateRecipients:inviteContext:presenter:completion:](inviteRecipientEvaluator, "validateRecipients:inviteContext:presenter:completion:", v9, v16, v18, v8);

}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  int64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  _FALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = CFSTR("FAActivityViewController.m");
    v16 = 2048;
    v17 = a4;
    _os_log_impl(&dword_20DE41000, v10, OS_LOG_TYPE_DEFAULT, "%@ MFMessageComposeVC delegate callback - didFinishWithResult:%ld", (uint8_t *)&v14, 0x16u);
  }

  -[FAActivityViewController activity](self, "activity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[FAActivityViewController activity](self, "activity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mailComposeController:didFinishWithResult:error:", v8, a4, v9);

  }
}

- (id)_parseRecipientAddresses:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BE19258]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "firstEmailAddressInString:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v4, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v4;
}

- (void)activityViewControllerDidFinishAirdropTransfer:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  self->_didCompleteAirdropTransfer = 1;
  v10 = v4;
  objc_msgSend(v4, "completionWithItemsHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v10, "completionWithItemsHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activityType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t, _QWORD, _QWORD))v6)[2](v6, v8, 1, 0, 0);

  }
  objc_msgSend(v10, "presentingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (NSArray)recipientAddresses
{
  return self->_recipientAddresses;
}

- (void)setRecipientAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_recipientAddresses, a3);
}

- (BOOL)didCompleteAirdropTransfer
{
  return self->_didCompleteAirdropTransfer;
}

- (void)setDidCompleteAirdropTransfer:(BOOL)a3
{
  self->_didCompleteAirdropTransfer = a3;
}

- (FAActivityViewControllerDelegate)delegate
{
  return (FAActivityViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recipientAddresses, 0);
  objc_storeStrong((id *)&self->_inviteRecipientEvaluator, 0);
  objc_storeStrong((id *)&self->_itemSource, 0);
}

@end
