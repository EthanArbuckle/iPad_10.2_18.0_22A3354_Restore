@implementation WFSendEmailActionUIKitUserInterface

- (void)showWithEmailContent:(id)a3 preferredSendingEmailAddress:(id)a4 isManaged:(BOOL)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD block[5];
  id v20;
  id v21;
  BOOL v22;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = v13;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSendEmailActionUIKitUserInterface.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("emailContent"));

    if (v14)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSendEmailActionUIKitUserInterface.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v13)
    goto LABEL_5;
LABEL_3:
  -[WFSendEmailActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", v14);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __117__WFSendEmailActionUIKitUserInterface_showWithEmailContent_preferredSendingEmailAddress_isManaged_completionHandler___block_invoke;
  block[3] = &unk_24E343308;
  v22 = a5;
  block[4] = self;
  v20 = v11;
  v21 = v12;
  v15 = v12;
  v16 = v11;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)finishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[WFSendEmailActionUIKitUserInterface completionHandler](self, "completionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFSendEmailActionUIKitUserInterface completionHandler](self, "completionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v5)[2](v5, 0, v6);

  }
  -[WFSendEmailActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", 0);

}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFSendEmailActionUIKitUserInterface *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __79__WFSendEmailActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v5[3] = &unk_24E3439E8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFSendEmailActionUIKitUserInterface;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[WFEmbeddableActionUserInterface cancelPresentationWithCompletionHandler:](&v4, sel_cancelPresentationWithCompletionHandler_, v5);

}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __87__WFSendEmailActionUIKitUserInterface_mailComposeController_didFinishWithResult_error___block_invoke;
  v5[3] = &unk_24E3438C0;
  v5[4] = self;
  v5[5] = a4;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, v5, a5);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

void __87__WFSendEmailActionUIKitUserInterface_mailComposeController_didFinishWithResult_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2 == 3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 5, 0);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v2)
    {
      v4 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;
LABEL_7:
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v4);

}

uint64_t __79__WFSendEmailActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithError:", v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __117__WFSendEmailActionUIKitUserInterface_showWithEmailContent_preferredSendingEmailAddress_isManaged_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  void *v29;
  uint64_t v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDDD0A0]);
  if (*(_BYTE *)(a1 + 56))
    v3 = 2;
  else
    v3 = 1;
  v4 = (void *)objc_msgSend(v2, "initWithURL:sourceAccountManagement:", 0, v3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setMailComposeDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "subject");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (const __CFString *)v6;
    else
      v8 = &stru_24E343BE0;
    objc_msgSend(v5, "setSubject:", v8);

    objc_msgSend(*(id *)(a1 + 40), "toRecipients");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "if_map:", &__block_literal_global_90);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setToRecipients:", v10);

    objc_msgSend(*(id *)(a1 + 40), "ccRecipients");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "if_map:", &__block_literal_global_150);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCcRecipients:", v12);

    objc_msgSend(*(id *)(a1 + 40), "bccRecipients");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "if_map:", &__block_literal_global_151);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBccRecipients:", v14);

    if (objc_msgSend(*(id *)(a1 + 48), "length"))
      objc_msgSend(v5, "setPreferredSendingEmailAddress:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "body");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v5;
    objc_msgSend(v5, "setMessageBody:isHTML:", v15, objc_msgSend(*(id *)(a1 + 40), "isHTML"));

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = a1;
    objc_msgSend(*(id *)(a1 + 40), "attachments");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v33 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v21, "mappedData");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "wfType");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "MIMEType");
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = (void *)v24;
          if (v24)
            v26 = (const __CFString *)v24;
          else
            v26 = CFSTR("application/octet-stream");
          objc_msgSend(v21, "filename");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addAttachmentData:mimeType:fileName:", v22, v26, v27);

        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v18);
    }

    v5 = v16;
    objc_msgSend(*(id *)(v30 + 32), "presentContent:", v16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v28 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "wf_mailComposerUnavailableError");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v28)[2](v28, 0, v29);

  }
}

uint64_t __117__WFSendEmailActionUIKitUserInterface_showWithEmailContent_preferredSendingEmailAddress_isManaged_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "address");
}

uint64_t __117__WFSendEmailActionUIKitUserInterface_showWithEmailContent_preferredSendingEmailAddress_isManaged_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "address");
}

uint64_t __117__WFSendEmailActionUIKitUserInterface_showWithEmailContent_preferredSendingEmailAddress_isManaged_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "address");
}

@end
