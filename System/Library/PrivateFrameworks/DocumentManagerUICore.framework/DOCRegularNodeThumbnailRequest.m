@implementation DOCRegularNodeThumbnailRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderIcon, 0);
  objc_storeStrong((id *)&self->_thumbnailRequest, 0);
  objc_destroyWeak((id *)&self->_thumbnailGenerator);
}

void __73__DOCRegularNodeThumbnailRequest_generateThumbnailWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(v10, "UIImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {

    if (v8)
    {
      objc_msgSend(v10, "UIImage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "badgedFolderIconForBadge:style:", v9, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {

      objc_msgSend(v6, "plainFolderImageWithStyle:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 0;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (DOCRegularNodeThumbnailRequest)initWithNode:(id)a3 descriptor:(id)a4 thumbnailGenerator:(id)a5
{
  id v9;
  id v10;
  id v11;
  DOCRegularNodeThumbnailRequest *v12;
  void *v13;
  NSObject **v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  NSObject **v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  QLThumbnailGenerationRequest *thumbnailRequest;
  void *v40;
  uint64_t v41;
  DOCThumbnailFolderIcon *folderIcon;
  void *v44;
  void *v45;
  void *v46;
  objc_super v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_25:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCThumbnailRequest.m"), 145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("descriptor"));

    if (v11)
      goto LABEL_4;
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCThumbnailRequest.m"), 144, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("node"));

  if (!v10)
    goto LABEL_25;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_26:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCThumbnailRequest.m"), 146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("thumbnailGenerator"));

LABEL_4:
  v47.receiver = self;
  v47.super_class = (Class)DOCRegularNodeThumbnailRequest;
  v12 = -[DOCRegularNodeThumbnailRequest init](&v47, sel_init);
  if (!v12)
    goto LABEL_22;
  objc_msgSend(v9, "fpfs_fpItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (NSObject **)MEMORY[0x24BE2DF90];
    v15 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v15 = *v14;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      objc_msgSend(v9, "displayName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fpfs_fpItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v49 = v17;
      v50 = 2112;
      v51 = v18;
      _os_log_impl(&dword_2172C6000, v16, OS_LOG_TYPE_DEFAULT, "DOCRegularNodeThumbnailRequest: requesting thumbnail from FPItem for %@: %@", buf, 0x16u);

    }
    v19 = objc_alloc(MEMORY[0x24BDE5EF0]);
    objc_msgSend(v9, "fpfs_fpItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "size");
    v22 = v21;
    v24 = v23;
    objc_msgSend(v10, "scale");
    v26 = objc_msgSend(v19, "initWithFPItem:size:scale:representationTypes:", v20, 4, v22, v24, v25);
  }
  else
  {
    objc_msgSend(v9, "nodeURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("DOCThumbnailRequest.m"), 162, CFSTR("Attempting to generate a thumbnail request for a node that has no FPItem and no URL"));
      goto LABEL_18;
    }
    v28 = (NSObject **)MEMORY[0x24BE2DF90];
    v29 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v29 = *v28;
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = v29;
      objc_msgSend(v9, "displayName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "nodeURL");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v49 = v31;
      v50 = 2112;
      v51 = v32;
      _os_log_impl(&dword_2172C6000, v30, OS_LOG_TYPE_DEFAULT, "DOCRegularNodeThumbnailRequest: requesting thumbnail from URL for %@: %@", buf, 0x16u);

    }
    v33 = objc_alloc(MEMORY[0x24BDE5EF0]);
    objc_msgSend(v9, "nodeURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "size");
    v35 = v34;
    v37 = v36;
    objc_msgSend(v10, "scale");
    v26 = objc_msgSend(v33, "initWithFileAtURL:size:scale:representationTypes:", v20, 4, v35, v37, v38);
  }
  thumbnailRequest = v12->_thumbnailRequest;
  v12->_thumbnailRequest = (QLThumbnailGenerationRequest *)v26;

LABEL_18:
  objc_msgSend(v10, "minimumSize");
  -[QLThumbnailGenerationRequest setMinimumDimension:](v12->_thumbnailRequest, "setMinimumDimension:");
  objc_msgSend(MEMORY[0x24BE2DEF0], "useBlastDoorThumbnails");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLThumbnailGenerationRequest setShouldUseRestrictedExtension:](v12->_thumbnailRequest, "setShouldUseRestrictedExtension:", objc_msgSend(v40, "isEnabled"));

  objc_storeWeak((id *)&v12->_thumbnailGenerator, v11);
  if (objc_msgSend(v9, "isFolder"))
  {
    +[DOCThumbnailFolderIcon folderIconForDescriptor:](DOCThumbnailFolderIcon, "folderIconForDescriptor:", v10);
    v41 = objc_claimAutoreleasedReturnValue();
    folderIcon = v12->_folderIcon;
    v12->_folderIcon = (DOCThumbnailFolderIcon *)v41;

  }
  else
  {
    -[QLThumbnailGenerationRequest setIconMode:](v12->_thumbnailRequest, "setIconMode:", 1);
    -[QLThumbnailGenerationRequest setIconVariant:](v12->_thumbnailRequest, "setIconVariant:", 2);
  }
  v12->_style = objc_msgSend(v10, "style");
LABEL_22:

  return v12;
}

- (void)generateThumbnailWithCompletionHandler:(id)a3
{
  id v4;
  id WeakRetained;
  QLThumbnailGenerationRequest *thumbnailRequest;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailGenerator);
  thumbnailRequest = self->_thumbnailRequest;
  v9 = v4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __73__DOCRegularNodeThumbnailRequest_generateThumbnailWithCompletionHandler___block_invoke;
  v10[3] = &unk_24D72AD60;
  v10[4] = self;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __73__DOCRegularNodeThumbnailRequest_generateThumbnailWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_24D72AD88;
  v8[4] = self;
  v7 = v4;
  objc_msgSend(WeakRetained, "generateThumbnailForRequest:updateHandler:statusHandler:completionHandler:", thumbnailRequest, 0, v10, v8);

}

void __73__DOCRegularNodeThumbnailRequest_generateThumbnailWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void (**v2)(void);
  void (**v3)(void);

  if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "thumbnailGenerationRequiresDownloadHandler");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

- (void)cancel
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailGenerator);
  objc_msgSend(WeakRetained, "cancelRequest:", self->_thumbnailRequest);

}

@end
