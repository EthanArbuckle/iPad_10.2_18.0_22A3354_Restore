@implementation WFPosterContentItem

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Wallpaper"), CFSTR("Wallpaper"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Wallpapers"), CFSTR("Wallpapers"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Wallpapers"));
}

+ (BOOL)canLowercaseTypeDescription
{
  return 1;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BE196F8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)poster
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPosterContentItem getRepresentationsForType:error:](self, "getRepresentationsForType:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v8 = a3;
  v9 = a4;
  if ((Class)objc_opt_class() == a5)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2050000000;
    v11 = (void *)getPRSServiceClass_softClass_47222;
    v21 = getPRSServiceClass_softClass_47222;
    v12 = MEMORY[0x24BDAC760];
    if (!getPRSServiceClass_softClass_47222)
    {
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __getPRSServiceClass_block_invoke_47223;
      v17[3] = &unk_24F8BB430;
      v17[4] = &v18;
      __getPRSServiceClass_block_invoke_47223((uint64_t)v17);
      v11 = (void *)v19[3];
    }
    v13 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v18, 8);
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = __69__WFPosterContentItem_generateObjectRepresentation_options_forClass___block_invoke;
    v14[3] = &unk_24F8BAD90;
    v15 = objc_alloc_init(v13);
    v16 = v8;
    v14[4] = self;
    v10 = v15;
    objc_msgSend(v10, "fetchPosterConfigurationsForRole:completion:", 0, v14);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "badCoercionErrorForObjectClass:", a5);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, id))v8 + 2))(v8, 0, 0, v10);
  }

}

- (BOOL)loadsListThumbnailAsynchronously
{
  return 1;
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__WFPosterContentItem_getListThumbnail_forSize___block_invoke;
  v8[3] = &unk_24F8BADB8;
  v9 = v5;
  v6 = v5;
  -[WFPosterContentItem getObjectRepresentation:forClass:](self, "getObjectRepresentation:forClass:", v8, objc_opt_class());

  return 1;
}

void __48__WFPosterContentItem_getListThumbnail_forSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__WFPosterContentItem_getListThumbnail_forSize___block_invoke_2;
  v6[3] = &unk_24F8BB5E0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __48__WFPosterContentItem_getListThumbnail_forSize___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __69__WFPosterContentItem_generateObjectRepresentation_options_forClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __69__WFPosterContentItem_generateObjectRepresentation_options_forClass___block_invoke_2;
    v17[3] = &unk_24F8BAD40;
    v17[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "if_firstObjectPassingTest:", v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_9;
    }
    v19 = 0;
    v20 = &v19;
    v21 = 0x2050000000;
    v9 = (void *)getPRSPosterSnapshotRequestClass_softClass;
    v22 = getPRSPosterSnapshotRequestClass_softClass;
    if (!getPRSPosterSnapshotRequestClass_softClass)
    {
      v18[0] = v7;
      v18[1] = 3221225472;
      v18[2] = __getPRSPosterSnapshotRequestClass_block_invoke;
      v18[3] = &unk_24F8BB430;
      v18[4] = &v19;
      __getPRSPosterSnapshotRequestClass_block_invoke((uint64_t)v18);
      v9 = (void *)v20[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v19, 8);
    v11 = (void *)objc_msgSend([v10 alloc], "initWithConfiguration:variantType:options:", v8, 0, 0);
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __69__WFPosterContentItem_generateObjectRepresentation_options_forClass___block_invoke_3;
    v15[3] = &unk_24F8BAD68;
    v12 = *(void **)(a1 + 40);
    v13 = *(id *)(a1 + 48);
    v15[4] = *(_QWORD *)(a1 + 32);
    v16 = v13;
    objc_msgSend(v12, "fetchPosterSnapshotsWithRequest:completion:", v11, v15);

  }
  else
  {
    v14 = *(_QWORD *)(a1 + 48);
    WFLocalizedString(CFSTR("Show Wallpaper"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    WFSanitizedPostersError();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v14 + 16))(v14, 0, 0, v11);
  }

LABEL_9:
}

uint64_t __69__WFPosterContentItem_generateObjectRepresentation_options_forClass___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "serverUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "poster");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqual:", v5);

  return v6;
}

void __69__WFPosterContentItem_generateObjectRepresentation_options_forClass___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  objc_msgSend(a2, "snapshots");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(objc_retainAutorelease(v6), "image");
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC14E0]), "initWithCGImage:scale:orientation:", v7, 1, 1.0);
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "poster");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, _QWORD))(v9 + 16))(v9, v8, v11, 0);

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 40);
    WFLocalizedString(CFSTR("Show Wallpaper"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    WFSanitizedPostersError();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v12 + 16))(v12, 0, 0, v10);
  }

}

@end
