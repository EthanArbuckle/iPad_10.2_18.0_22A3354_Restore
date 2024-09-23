@implementation WFGenericFileContentItem

- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  WFGenericFileContentItem *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  NSStringFromClass(a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(CFSTR("UIPrintFormatter"), "isEqualToString:", v10);

  if (v11)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __74__WFGenericFileContentItem_generateObjectRepresentation_options_forClass___block_invoke;
    v13[3] = &unk_24C4E2F28;
    v14 = v9;
    v15 = self;
    v16 = v8;
    -[WFContentItem getFileRepresentation:forType:options:](self, "getFileRepresentation:forType:options:", v13, 0, v14);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "badCoercionErrorForObjectClass:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, v12);

  }
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  dispatch_time_t v12;
  objc_super v14;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a4;
  if ((Class)objc_opt_class() == a3)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__16563;
    v22 = __Block_byref_object_dispose__16564;
    v23 = 0;
    v10 = dispatch_semaphore_create(0);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __79__WFGenericFileContentItem_generateObjectRepresentationForClass_options_error___block_invoke;
    v15[3] = &unk_24C4E0CB8;
    v11 = v10;
    v16 = v11;
    v17 = &v18;
    -[WFContentItem getFileRepresentation:forType:options:](self, "getFileRepresentation:forType:options:", v15, 0, v8);
    v12 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v11, v12);
    v9 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)WFGenericFileContentItem;
    -[WFContentItem generateObjectRepresentationForClass:options:error:](&v14, sel_generateObjectRepresentationForClass_options_error_, a3, v8, a5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  WFGenericFileContentItem *v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "isEqualToUTType:", *MEMORY[0x24BDF8658]))
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __71__WFGenericFileContentItem_generateFileRepresentation_options_forType___block_invoke;
    v16[3] = &unk_24C4E0D08;
    v17 = v10;
    v18 = v9;
    v19 = self;
    v20 = v8;
    -[WFContentItem getFileRepresentation:forType:options:](self, "getFileRepresentation:forType:options:", v16, 0, v18);

    v11 = v17;
  }
  else
  {
    if (!objc_msgSend(v10, "isEqualToUTType:", *MEMORY[0x24BDF84E0]))
    {
      objc_msgSend((id)objc_opt_class(), "badCoercionErrorForType:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v12);

      goto LABEL_7;
    }
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __71__WFGenericFileContentItem_generateFileRepresentation_options_forType___block_invoke_3;
    v13[3] = &unk_24C4E1E38;
    v14 = v9;
    v15 = v8;
    -[WFContentItem getFileRepresentation:forType:options:](self, "getFileRepresentation:forType:options:", v13, 0, v14);

    v11 = v14;
  }

LABEL_7:
}

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  BOOL v9;
  unsigned __int8 v10;
  objc_super v12;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("UIPrintFormatter"));
  if ((objc_msgSend(v4, "isEqualToUTType:", *MEMORY[0x24BDF8658]) & 1) != 0 || v8)
  {
    v10 = -[WFGenericFileContentItem isContent](self, "isContent");
LABEL_12:
    v9 = v10;
    goto LABEL_13;
  }
  if ((objc_msgSend(v4, "isEqualToUTType:", *MEMORY[0x24BDF8348]) & 1) == 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)WFGenericFileContentItem;
    v10 = -[WFContentItem canGenerateRepresentationForType:](&v12, sel_canGenerateRepresentationForType_, v4);
    goto LABEL_12;
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (BOOL)isContent
{
  void *v2;
  char v3;

  -[WFContentItem internalRepresentationType](self, "internalRepresentationType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "conformsToUTType:", *MEMORY[0x24BDF8348]);

  return v3;
}

void __71__WFGenericFileContentItem_generateFileRepresentation_options_forType___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  +[WFWebResource webResourceWithFile:](WFWebResource, "webResourceWithFile:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__WFGenericFileContentItem_generateFileRepresentation_options_forType___block_invoke_2;
  v7[3] = &unk_24C4E0CE0;
  v6 = *(id *)(a1 + 56);
  v7[4] = *(_QWORD *)(a1 + 48);
  v8 = v6;
  +[WFWebResourceCapturer getPasteboardRepresentationForWebResource:type:coercionOptions:completionHandler:](WFWebResourceCapturer, "getPasteboardRepresentationForWebResource:type:coercionOptions:completionHandler:", v3, v4, v5, v7);

}

void __71__WFGenericFileContentItem_generateFileRepresentation_options_forType___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  WFWebResourceCapturer *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("WFCoercionOptionPDFIncludeMargin"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  +[WFWebResource webResourceWithFile:](WFWebResource, "webResourceWithFile:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(WFWebResourceCapturer);
  -[WFWebResourceCapturer generatePDFForWebResource:includeMargin:coercionOptions:completionHandler:](v8, "generatePDFForWebResource:includeMargin:coercionOptions:completionHandler:", v9, v7, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __71__WFGenericFileContentItem_generateFileRepresentation_options_forType___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v16)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_10;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("_")))
  {

    v12 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 40);
    if (v10)
    {
      v13 = 0;
      v14 = v10;
      goto LABEL_8;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v13 = 1;
LABEL_8:
  +[WFFileRepresentation fileWithData:ofType:proposedFilename:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:", v16, v9, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v12 + 16))(v12, v15, v11);

  if (v13)
LABEL_10:

}

void __79__WFGenericFileContentItem_generateObjectRepresentationForClass_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  __int128 v21;
  _QWORD v22[4];
  __int128 v23;
  id v24;
  void *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "isTemporaryFile"))
  {
    getWFAppIntentsLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[WFGenericFileContentItem generateObjectRepresentationForClass:options:error:]_block_invoke";
      _os_log_impl(&dword_20BBAD000, v4, OS_LOG_TYPE_DEFAULT, "%s Representation is data or temporary file", buf, 0xCu);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v5, "itemForURL:error:", v6, &v24);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v24;

    if (v7)
    {
      v9 = objc_alloc(MEMORY[0x24BE60048]);
      v10 = (void *)objc_msgSend(v9, "initWithBundleIdentifier:", *MEMORY[0x24BEC16B8]);
      v11 = objc_alloc(MEMORY[0x24BE5FC70]);
      objc_msgSend(v7, "itemIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithValue:typeName:", v12, CFSTR("DOCFileEntity"));

      v14 = objc_alloc(MEMORY[0x24BE60188]);
      v25 = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithIdentifiers:entityType:", v15, CFSTR("DOCFileEntity"));

      getWFAppIntentsLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "itemIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v27 = "-[WFGenericFileContentItem generateObjectRepresentationForClass:options:error:]_block_invoke";
        v28 = 2112;
        v29 = v18;
        _os_log_impl(&dword_20BBAD000, v17, OS_LOG_TYPE_DEFAULT, "%s Fetching entity with identifier %@", buf, 0x16u);

      }
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __79__WFGenericFileContentItem_generateObjectRepresentationForClass_options_error___block_invoke_147;
      v22[3] = &unk_24C4E0C90;
      v21 = *(_OWORD *)(a1 + 32);
      v19 = (id)v21;
      v23 = v21;
      objc_msgSend(v10, "performQuery:completionHandler:", v16, v22);

    }
    else
    {
      getWFAppIntentsLogObject();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v27 = "-[WFGenericFileContentItem generateObjectRepresentationForClass:options:error:]_block_invoke";
        v28 = 2112;
        v29 = v8;
        _os_log_impl(&dword_20BBAD000, v20, OS_LOG_TYPE_ERROR, "%s Could not retreive FPItem with error: %@", buf, 0x16u);
      }

      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    }

  }
}

void __79__WFGenericFileContentItem_generateObjectRepresentationForClass_options_error___block_invoke_147(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  getWFAppIntentsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 136315650;
    v20 = "-[WFGenericFileContentItem generateObjectRepresentationForClass:options:error:]_block_invoke";
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_20BBAD000, v7, OS_LOG_TYPE_DEFAULT, "%s Recieved output: %@ error: %@", (uint8_t *)&v19, 0x20u);

  }
  objc_msgSend(v5, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "value");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v15);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __74__WFGenericFileContentItem_generateObjectRepresentation_options_forClass___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  +[WFWebResource webResourceWithFile:](WFWebResource, "webResourceWithFile:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __74__WFGenericFileContentItem_generateObjectRepresentation_options_forClass___block_invoke_2;
  v6[3] = &unk_24C4E0C68;
  v5 = *(id *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v5;
  +[WFWebResourceCapturer getPrintFormatterForWebResource:coercionOptions:completionHandler:](WFWebResourceCapturer, "getPrintFormatterForWebResource:coercionOptions:completionHandler:", v3, v4, v6);

}

void __74__WFGenericFileContentItem_generateObjectRepresentation_options_forClass___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("_")))
  {

    v9 = *(_QWORD *)(a1 + 40);
LABEL_4:
    objc_msgSend(*(id *)(a1 + 32), "name");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (!v7)
    goto LABEL_4;
LABEL_5:
  (*(void (**)(uint64_t, id, id, id))(v9 + 16))(v9, v10, v7, v8);

}

+ (id)propertyBuilders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[6];

  v25[5] = *MEMORY[0x24BDAC8D0];
  if ((id)objc_opt_class() != a1)
    return 0;
  WFLocalizedContentPropertyNameMarker(CFSTR("File Size"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_16601, v24, objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "userInfo:", CFSTR("WFFileSizeProperty"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v22;
  WFLocalizedContentPropertyNameMarker(CFSTR("File Extension"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_110_16603, v21, objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "userInfo:", CFSTR("WFFileExtensionProperty"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "caseInsensitive:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v18;
  WFLocalizedContentPropertyNameMarker(CFSTR("Creation Date"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_114_16606, v17, objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "userInfo:", CFSTR("WFFileCreationDate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "tense:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeUnits:", 8444);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v13;
  WFLocalizedContentPropertyNameMarker(CFSTR("File Path"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_119, v3, objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo:", MEMORY[0x24BDBD1B8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "caseInsensitive:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v6;
  WFLocalizedContentPropertyNameMarker(CFSTR("Last Modified Date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_122_16609, v7, objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userInfo:", CFSTR("WFFileModificationDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tense:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeUnits:", 8444);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)stringConversionBehavior
{
  void *v4;
  void *v5;
  objc_super v6;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(a1, "propertyForName:", CFSTR("Name"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFContentItemStringConversionBehavior accessingProperty:](WFContentItemStringConversionBehavior, "accessingProperty:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___WFGenericFileContentItem;
    objc_msgSendSuper2(&v6, sel_stringConversionBehavior);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (id)itemWithSerializedItem:(id)a3 forType:(id)a4 named:(id)a5 attributionSet:(id)a6 cachingIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  id obj;
  id obja;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  objc_super v72;
  void *v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v72.receiver = a1;
  v72.super_class = (Class)&OBJC_METACLASS___WFGenericFileContentItem;
  v59 = v14;
  v60 = v13;
  objc_msgSendSuper2(&v72, sel_itemWithSerializedItem_forType_named_attributionSet_cachingIdentifier_, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = v17;
    goto LABEL_53;
  }
  v57 = v16;
  v58 = v15;
  v20 = (void *)objc_opt_new();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v56 = v12;
  v21 = v12;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
  v61 = v21;
  if (!v22)
  {
    v24 = v60;
    goto LABEL_27;
  }
  v23 = v22;
  obj = *(id *)v69;
  v24 = v60;
  do
  {
    for (i = 0; i != v23; ++i)
    {
      if (*(id *)v69 != obj)
        objc_enumerationMutation(v21);
      v26 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i);
      objc_msgSend(MEMORY[0x24BEC14A0], "typeFromPasteboardType:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "allSupportedTypes");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "conformsToTypes:", v28))
      {

LABEL_10:
        if (!v24)
        {
          objc_msgSend(a1, "ownedTypes");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v27, "conformsToTypes:", v29))
          {

            goto LABEL_17;
          }
          objc_msgSend(a1, "ownedPasteboardTypes");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v27, "conformsToTypes:", v34);

          if (v35)
LABEL_17:
            v24 = v27;
          else
            v24 = 0;
        }
        objc_msgSend(v21, "objectForKey:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          objc_msgSend(v20, "addObject:", v27);
LABEL_22:

        goto LABEL_23;
      }
      if ((id)objc_opt_class() != a1)
        goto LABEL_22;
      objc_msgSend(v27, "fileExtension");
      v30 = v20;
      v31 = v24;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "length");

      v24 = v31;
      v20 = v30;
      v21 = v61;

      if (v33)
        goto LABEL_10;
LABEL_23:

    }
    v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
  }
  while (v23);
LABEL_27:

  if (objc_msgSend(v20, "count"))
  {
    v16 = v57;
    v15 = v58;
    if (!v24)
    {
      objc_msgSend(v20, "firstObject");
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v24, "string");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v37, "dataUsingEncoding:", 4);
      v38 = objc_claimAutoreleasedReturnValue();

      v37 = (void *)v38;
    }
    objc_opt_class();
    v60 = v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v55 = v36;
      v39 = *MEMORY[0x24BDF8350];
      if (objc_msgSend(v24, "isEqualToUTType:", *MEMORY[0x24BDF8350]))
        v40 = 0;
      else
        v40 = v24;
      +[WFFileRepresentation fileWithData:ofType:proposedFilename:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:", v37, v40, v59, v37);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "itemWithFile:attributionSet:cachingIdentifier:", v41, v58, v57);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "removeObject:", v24);
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      obja = v20;
      v42 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
      if (v42)
      {
        v43 = v42;
        v44 = *(_QWORD *)v65;
        do
        {
          for (j = 0; j != v43; ++j)
          {
            if (*(_QWORD *)v65 != v44)
              objc_enumerationMutation(obja);
            v46 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
            objc_msgSend(v46, "string");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKey:", v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v48, "dataUsingEncoding:", 4);
              v49 = objc_claimAutoreleasedReturnValue();

              v48 = (void *)v49;
            }
            if (objc_msgSend(v60, "isEqualToUTType:", v39))
              v50 = 0;
            else
              v50 = v46;
            +[WFFileRepresentation fileWithData:ofType:proposedFilename:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:", v48, v50, v59);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = v51;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v73, 1);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setFileRepresentations:forType:", v52, v46);

            v21 = v61;
          }
          v43 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
        }
        while (v43);
      }

      v16 = v57;
      v15 = v58;
      v37 = v54;
      v36 = v55;
    }
    else
    {
      v19 = 0;
    }

    v12 = v56;
  }
  else
  {
    v60 = v24;
    v19 = 0;
    v12 = v56;
    v16 = v57;
    v15 = v58;
  }
  v18 = 0;

LABEL_53:
  return v19;
}

+ (id)ownedTypes
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (id)objc_opt_class();
  v4 = (void *)MEMORY[0x24BDBCF00];
  if (v3 == a1)
  {
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8350]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8348]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "orderedSetWithObjects:", v6, v7, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)objc_opt_new();
  }
  return v5;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BEC14A0], "typeFromPasteboardType:", *MEMORY[0x24BEC1CB8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF84E0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("UIPrintFormatter"), CFSTR("UIKit"), 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("Documents");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __44__WFGenericFileContentItem_propertyBuilders__block_invoke_8(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__WFGenericFileContentItem_propertyBuilders__block_invoke_9;
  v7[3] = &unk_24C4E2ED8;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a2, "getFileRepresentation:forType:", v7, 0);

}

void __44__WFGenericFileContentItem_propertyBuilders__block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "modificationDate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __44__WFGenericFileContentItem_propertyBuilders__block_invoke_6(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__WFGenericFileContentItem_propertyBuilders__block_invoke_7;
  v7[3] = &unk_24C4E2ED8;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a2, "getFileRepresentation:forType:", v7, 0);

}

void __44__WFGenericFileContentItem_propertyBuilders__block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  objc_msgSend(v3, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wf_displayPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);
  }
  else
  {
    objc_msgSend(v8, "filename");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v7);

  }
}

void __44__WFGenericFileContentItem_propertyBuilders__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__WFGenericFileContentItem_propertyBuilders__block_invoke_5;
  v7[3] = &unk_24C4E2ED8;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a2, "getFileRepresentation:forType:", v7, 0);

}

void __44__WFGenericFileContentItem_propertyBuilders__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "creationDate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

uint64_t __44__WFGenericFileContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "getPreferredFileExtension:", a4);
}

void __44__WFGenericFileContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__WFGenericFileContentItem_propertyBuilders__block_invoke_2;
  v7[3] = &unk_24C4E2420;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a2, "getPreferredFileSize:", v7);

}

void __44__WFGenericFileContentItem_propertyBuilders__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  WFFileSize *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = -[WFFileSize initWithByteCount:]([WFFileSize alloc], "initWithByteCount:", a2);
  (*(void (**)(uint64_t, WFFileSize *))(v2 + 16))(v2, v3);

}

@end
