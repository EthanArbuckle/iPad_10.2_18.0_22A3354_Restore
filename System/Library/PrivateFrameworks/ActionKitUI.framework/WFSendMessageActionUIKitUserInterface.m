@implementation WFSendMessageActionUIKitUserInterface

- (void)showWithRecipients:(id)a3 content:(id)a4 attachments:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x24BDD1620];
  v15 = (void *)MEMORY[0x24BDBCF20];
  v16 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __98__WFSendMessageActionUIKitUserInterface_showWithRecipients_content_attachments_completionHandler___block_invoke;
  v22[3] = &unk_24E343778;
  v22[4] = self;
  v23 = v10;
  v24 = v11;
  v25 = v13;
  v18 = v13;
  v19 = v11;
  v20 = v10;
  v21 = (id)objc_msgSend(v14, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v12, v17, v22);

}

- (void)showWithRecipients:(id)a3 content:(id)a4 files:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  void *v15;
  void *v16;
  _QWORD block[4];
  id v18;
  id v19;
  WFSendMessageActionUIKitUserInterface *v20;
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  if ((objc_msgSend(MEMORY[0x24BDDD0A8], "canSendText") & 1) != 0)
  {
    -[WFSendMessageActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", v13);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __92__WFSendMessageActionUIKitUserInterface_showWithRecipients_content_files_completionHandler___block_invoke;
    block[3] = &unk_24E343AD0;
    v18 = v10;
    v19 = v11;
    v20 = self;
    v21 = v12;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    v14 = v18;
  }
  else
  {
    v22 = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("Cannot send messages. iMessage may not be enabled."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3328, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v16);

  }
}

- (void)finishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[WFSendMessageActionUIKitUserInterface completionHandler](self, "completionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFSendMessageActionUIKitUserInterface completionHandler](self, "completionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v5)[2](v5, 0, v6);

  }
  -[WFSendMessageActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", 0);

}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFSendMessageActionUIKitUserInterface *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __81__WFSendMessageActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v5[3] = &unk_24E3439E8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFSendMessageActionUIKitUserInterface;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[WFEmbeddableActionUserInterface cancelPresentationWithCompletionHandler:](&v4, sel_cancelPresentationWithCompletionHandler_, v5);

}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  if (a4 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __90__WFSendMessageActionUIKitUserInterface_messageComposeViewController_didFinishWithResult___block_invoke;
  v9[3] = &unk_24E3439C0;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v9);

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)files
{
  return self->_files;
}

- (void)setFiles:(id)a3
{
  objc_storeStrong((id *)&self->_files, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_files, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

uint64_t __90__WFSendMessageActionUIKitUserInterface_messageComposeViewController_didFinishWithResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", *(_QWORD *)(a1 + 40));
}

uint64_t __81__WFSendMessageActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithError:", v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __92__WFSendMessageActionUIKitUserInterface_showWithRecipients_content_files_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDDD0A8]);
  objc_msgSend(*(id *)(a1 + 32), "if_map:", &__block_literal_global_4580);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRecipients:", v3);

  objc_msgSend(v2, "setBody:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "setMessageComposeDelegate:", *(_QWORD *)(a1 + 48));
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v17 = a1;
  v4 = *(id *)(a1 + 56);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "filename");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "wfType");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        WFLivePhotoFileType();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "conformsToUTType:", v12);

        if (v13)
        {

          v10 = 0;
        }
        if (objc_msgSend(v9, "representationType"))
        {
          objc_msgSend(v9, "fileURL");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addAttachmentURL:withAlternateFilename:", v14, v10);
        }
        else
        {
          objc_msgSend(v9, "data");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "wfType");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "string");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addAttachmentData:typeIdentifier:filename:", v14, v16, v10);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(v17 + 48), "presentContent:", v2);
}

uint64_t __92__WFSendMessageActionUIKitUserInterface_showWithRecipients_content_files_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "address");
}

void __98__WFSendMessageActionUIKitUserInterface_showWithRecipients_content_attachments_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "showWithRecipients:content:files:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v4, *(_QWORD *)(a1 + 56));

}

@end
