@implementation FAInviteLinkMetadataProvider

- (FAInviteLinkMetadataProvider)initWithContext:(id)a3
{
  FAInviteContext *v4;
  FAInviteLinkMetadataProvider *v5;
  FAInviteContext *context;
  objc_super v8;

  v4 = (FAInviteContext *)a3;
  v8.receiver = self;
  v8.super_class = (Class)FAInviteLinkMetadataProvider;
  v5 = -[FAInviteLinkMetadataProvider init](&v8, sel_init);
  context = v5->_context;
  v5->_context = v4;

  return v5;
}

- (void)loadMetatadataWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD v18[4];
  NSObject *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v22[4];
  NSObject *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;

  v4 = a3;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__3;
  v32[4] = __Block_byref_object_dispose__3;
  v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__3;
  v30[4] = __Block_byref_object_dispose__3;
  v31 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__3;
  v28[4] = __Block_byref_object_dispose__3;
  v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__3;
  v26[4] = __Block_byref_object_dispose__3;
  v27 = 0;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  dispatch_group_enter(v5);
  -[FAInviteContext imageURL](self->_context, "imageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __61__FAInviteLinkMetadataProvider_loadMetatadataWithCompletion___block_invoke;
  v22[3] = &unk_24C88CF60;
  v24 = v32;
  v25 = v28;
  v8 = v5;
  v23 = v8;
  -[FAInviteLinkMetadataProvider loadImageWithURL:enableTextOverlay:completion:](self, "loadImageWithURL:enableTextOverlay:completion:", v6, 1, v22);

  -[FAInviteContext iconURL](self->_context, "iconURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  v18[1] = 3221225472;
  v18[2] = __61__FAInviteLinkMetadataProvider_loadMetatadataWithCompletion___block_invoke_2;
  v18[3] = &unk_24C88CF60;
  v20 = v30;
  v21 = v26;
  v10 = v8;
  v19 = v10;
  -[FAInviteLinkMetadataProvider loadImageWithURL:enableTextOverlay:completion:](self, "loadImageWithURL:enableTextOverlay:completion:", v9, 0, v18);

  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __61__FAInviteLinkMetadataProvider_loadMetatadataWithCompletion___block_invoke_3;
  v12[3] = &unk_24C88CF88;
  v14 = v28;
  v15 = v26;
  v12[4] = self;
  v13 = v4;
  v16 = v32;
  v17 = v30;
  v11 = v4;
  dispatch_group_notify(v10, MEMORY[0x24BDAC9B8], v12);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

}

void __61__FAInviteLinkMetadataProvider_loadMetatadataWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __61__FAInviteLinkMetadataProvider_loadMetatadataWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __61__FAInviteLinkMetadataProvider_loadMetatadataWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(uint64_t, _QWORD);
  uint64_t v3;
  id v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v1 = *(_QWORD *)(a1 + 40);
    v2 = *(void (**)(uint64_t, _QWORD))(v1 + 16);
LABEL_5:
    v2(v1, 0);
    return;
  }
  v3 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v2 = *(void (**)(uint64_t, _QWORD))(v3 + 16);
    v1 = *(_QWORD *)(a1 + 40);
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "linkMetadataWithImage:icon:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v3 + 16))(v3, v4, 0);

}

- (void)loadImageWithURL:(id)a3 enableTextOverlay:(BOOL)a4 completion:(id)a5
{
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  BOOL v12;

  v8 = a5;
  v9 = v8;
  if (a3)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __78__FAInviteLinkMetadataProvider_loadImageWithURL_enableTextOverlay_completion___block_invoke;
    v10[3] = &unk_24C88CFB0;
    v12 = a4;
    v10[4] = self;
    v11 = v8;
    -[FAInviteLinkMetadataProvider fetchImageFromURL:completion:](self, "fetchImageFromURL:completion:", a3, v10);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
  }

}

void __78__FAInviteLinkMetadataProvider_loadImageWithURL_enableTextOverlay_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "overlaidTextColorString");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        _FALogSystem();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v20) = 0;
          _os_log_impl(&dword_20DE41000, v10, OS_LOG_TYPE_DEFAULT, "Server specifying overlaid text color", (uint8_t *)&v20, 2u);
        }

        objc_msgSend(*(id *)(a1 + 32), "_colorForString:", v9);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          _FALogSystem();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v20) = 0;
            _os_log_impl(&dword_20DE41000, v13, OS_LOG_TYPE_DEFAULT, "We have an overlaid text color, adding properties to LPImage", (uint8_t *)&v20, 2u);
          }

          v14 = objc_alloc_init(MEMORY[0x24BDDA8A0]);
          objc_msgSend(v14, "setOverlaidTextColor:", v12);

          if (v14)
          {
            v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA898]), "initWithPlatformImage:properties:", v5, v14);

LABEL_18:
            (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

            goto LABEL_19;
          }
        }
        else
        {

        }
      }
    }
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA898]), "initWithPlatformImage:", v5);
    goto LABEL_18;
  }
  if (v6)
  {
    _FALogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "description");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      v21 = v18;
      v22 = 2112;
      v23 = v19;
      _os_log_impl(&dword_20DE41000, v16, OS_LOG_TYPE_DEFAULT, "%@ - unable to load image: %@", (uint8_t *)&v20, 0x16u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_19:

}

- (void)fetchImageFromURL:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x24BE04D20];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedImageFetcher");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchImageAtURL:completionHandler:", v7, v6);

}

- (id)_colorForString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v21 = 0;
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCharactersToBeSkipped:", v5);

    v6 = objc_msgSend(v4, "scanUpToString:intoString:", CFSTR("("), 0);
    objc_msgSend(v4, "scanString:intoString:", CFSTR("("), 0);
    v7 = objc_msgSend(v4, "scanInt:", (char *)&v21 + 4);
    v8 = objc_msgSend(v4, "scanString:intoString:", CFSTR(","), 0);
    v9 = objc_msgSend(v4, "scanInt:", &v21);
    v10 = objc_msgSend(v4, "scanString:intoString:", CFSTR(","), 0);
    v11 = objc_msgSend(v4, "scanInt:", (char *)&v20 + 4);
    v12 = objc_msgSend(v4, "scanString:intoString:", CFSTR(","), 0);
    v13 = objc_msgSend(v4, "scanFloat:", &v20);
    if (v6 && v7 && v8 && v9 && v10 && v11)
    {
      v14 = *(float *)&v20;
      if ((v12 & v13) == 0)
        v14 = 1.0;
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", (double)SHIDWORD(v21) / 255.0, (double)(int)v21 / 255.0, (double)SHIDWORD(v20) / 255.0, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22[0] = CFSTR("black");
      objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = CFSTR("white");
      v23[0] = v16;
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "objectForKeyedSubscript:", v3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)linkMetadataWithImage:(id)a3 icon:(id)a4
{
  id v6;
  id v7;
  FAInviteLinkMetadata *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(FAInviteLinkMetadata);
  -[FAInviteLinkMetadata setContext:](v8, "setContext:", self->_context);
  if (!v6)
  {
    -[FAInviteLinkMetadataProvider _defaultImage](self, "_defaultImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FAInviteLinkMetadata setImage:](v8, "setImage:", v9);

    if (v7)
      goto LABEL_3;
LABEL_5:
    -[FAInviteLinkMetadataProvider _defaultIcon](self, "_defaultIcon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FAInviteLinkMetadata setIcon:](v8, "setIcon:", v10);

    goto LABEL_6;
  }
  -[FAInviteLinkMetadata setImage:](v8, "setImage:", v6);
  if (!v7)
    goto LABEL_5;
LABEL_3:
  -[FAInviteLinkMetadata setIcon:](v8, "setIcon:", v7);
LABEL_6:

  return v8;
}

- (id)_imageNamed:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BEBD640];
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA898]), "initWithPlatformImage:", v7);
  return v8;
}

- (id)_defaultImage
{
  return -[FAInviteLinkMetadataProvider _imageNamed:](self, "_imageNamed:", CFSTR("family-asset-frame-background-A"));
}

- (id)_defaultIcon
{
  return -[FAInviteLinkMetadataProvider _imageNamed:](self, "_imageNamed:", CFSTR("family"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
