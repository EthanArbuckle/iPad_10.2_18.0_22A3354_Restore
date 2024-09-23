@implementation DOCIconThumbnailRequest

- (DOCIconThumbnailRequest)initWithNode:(id)a3 descriptor:(id)a4 thumbnailGenerator:(id)a5
{
  id v9;
  id v10;
  id v11;
  DOCIconThumbnailRequest *v12;
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
  QLThumbnailGenerationRequest *request;
  void *v40;
  objc_super v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v42.receiver = self;
  v42.super_class = (Class)DOCIconThumbnailRequest;
  v12 = -[DOCIconThumbnailRequest init](&v42, sel_init);
  if (v12)
  {
    objc_msgSend(v9, "nodeURL");
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
        objc_msgSend(v9, "nodeURL");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v44 = v17;
        v45 = 2112;
        v46 = v18;
        _os_log_impl(&dword_2172C6000, v16, OS_LOG_TYPE_DEFAULT, "DOCIconThumbnailRequest: requesting thumbnail from URL for %@: %@", buf, 0x16u);

      }
      v19 = objc_alloc(MEMORY[0x24BDE5EF0]);
      objc_msgSend(v9, "nodeURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "size");
      v22 = v21;
      v24 = v23;
      objc_msgSend(v10, "scale");
      v26 = objc_msgSend(v19, "initWithFileAtURL:size:scale:representationTypes:", v20, 1, v22, v24, v25);
    }
    else
    {
      objc_msgSend(v9, "fpfs_fpItem");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("DOCThumbnailRequest.m"), 275, CFSTR("Attempting to generate a thumbnail request for a node that has no FPItem and no URL"));
        goto LABEL_15;
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
        objc_msgSend(v9, "fpfs_fpItem");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v44 = v31;
        v45 = 2112;
        v46 = v32;
        _os_log_impl(&dword_2172C6000, v30, OS_LOG_TYPE_DEFAULT, "DOCIconThumbnailRequest: requesting thumbnail from FPItem for %@: %@", buf, 0x16u);

      }
      v33 = objc_alloc(MEMORY[0x24BDE5EF0]);
      objc_msgSend(v9, "fpfs_fpItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "size");
      v35 = v34;
      v37 = v36;
      objc_msgSend(v10, "scale");
      v26 = objc_msgSend(v33, "initWithFPItem:size:scale:representationTypes:", v20, 1, v35, v37, v38);
    }
    request = v12->_request;
    v12->_request = (QLThumbnailGenerationRequest *)v26;

LABEL_15:
    objc_msgSend(v10, "minimumSize");
    -[QLThumbnailGenerationRequest setMinimumDimension:](v12->_request, "setMinimumDimension:");
    objc_msgSend(MEMORY[0x24BE2DEF0], "useBlastDoorThumbnails");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLThumbnailGenerationRequest setShouldUseRestrictedExtension:](v12->_request, "setShouldUseRestrictedExtension:", objc_msgSend(v40, "isEnabled"));

    -[QLThumbnailGenerationRequest setIconVariant:](v12->_request, "setIconVariant:", objc_msgSend(v10, "isFolded"));
    objc_storeWeak((id *)&v12->_thumbnailGenerator, v11);
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_thumbnailGenerator);
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)generateThumbnailWithCompletionHandler:(id)a3
{
  QLThumbnailGenerator **p_thumbnailGenerator;
  void (**v5)(id, void *, _QWORD);
  id WeakRetained;
  void *v7;
  id v8;

  p_thumbnailGenerator = &self->_thumbnailGenerator;
  v5 = (void (**)(id, void *, _QWORD))a3;
  WeakRetained = objc_loadWeakRetained((id *)p_thumbnailGenerator);
  objc_msgSend(WeakRetained, "thumbnailIconForRequest:", self->_request);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "UIImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v7, 0);

}

- (DOCIconThumbnailRequest)initWithURL:(id)a3 descriptor:(id)a4 thumbnailGenerator:(id)a5
{
  id v8;
  id v9;
  id v10;
  DOCIconThumbnailRequest *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  QLThumbnailGenerationRequest *request;
  void *v20;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)DOCIconThumbnailRequest;
  v11 = -[DOCIconThumbnailRequest init](&v22, sel_init);
  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x24BDE5EF0]);
    objc_msgSend(v9, "size");
    v14 = v13;
    v16 = v15;
    objc_msgSend(v9, "scale");
    v18 = objc_msgSend(v12, "initWithFileAtURL:size:scale:representationTypes:", v8, 1, v14, v16, v17);
    request = v11->_request;
    v11->_request = (QLThumbnailGenerationRequest *)v18;

    objc_msgSend(v9, "minimumSize");
    -[QLThumbnailGenerationRequest setMinimumDimension:](v11->_request, "setMinimumDimension:");
    objc_msgSend(MEMORY[0x24BE2DEF0], "useBlastDoorThumbnails");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLThumbnailGenerationRequest setShouldUseRestrictedExtension:](v11->_request, "setShouldUseRestrictedExtension:", objc_msgSend(v20, "isEnabled"));

    -[QLThumbnailGenerationRequest setIconVariant:](v11->_request, "setIconVariant:", objc_msgSend(v9, "isFolded"));
    objc_storeWeak((id *)&v11->_thumbnailGenerator, v10);
  }

  return v11;
}

@end
