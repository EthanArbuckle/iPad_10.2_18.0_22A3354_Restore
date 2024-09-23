@implementation WFDropboxItemContentItem

- (id)metadata
{
  return (id)-[WFDropboxItemContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  void (**v6)(id, void *, _QWORD);
  void *v7;
  void *v8;
  WFDropboxSessionManager *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  void (**v20)(id, void *, _QWORD);

  v6 = (void (**)(id, void *, _QWORD))a3;
  +[WFAccount accounts](WFDropboxAccount, "accounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(WFDropboxSessionManager);
  objc_msgSend(v8, "credential");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDropboxSessionManager setCredential:](v9, "setCredential:", v10);

  -[WFDropboxItemContentItem metadata](self, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isDirectory"))
  {
    v12 = (void *)MEMORY[0x24BE194F8];
    v13 = (void *)MEMORY[0x24BE19628];
    objc_msgSend(v11, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "createTemporaryDirectoryWithFilename:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fileWithURL:options:", v15, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v6[2](v6, v16, 0);
  }
  else
  {
    -[WFDropboxItemContentItem representedFileType](self, "representedFileType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDropboxItemContentItem name](self, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __71__WFDropboxItemContentItem_generateFileRepresentation_options_forType___block_invoke;
    v19[3] = &unk_24F8B7FA0;
    v20 = v6;
    -[WFDropboxSessionManager downloadFile:ofType:proposedFilename:completionHandler:](v9, "downloadFile:ofType:proposedFilename:completionHandler:", v11, v17, v18, v19);

  }
}

- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  WFDropboxSessionManager *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;

  v7 = a3;
  if ((Class)objc_opt_class() == a5)
  {
    +[WFAccount accounts](WFDropboxAccount, "accounts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc_init(WFDropboxSessionManager);
    objc_msgSend(v10, "credential");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDropboxSessionManager setCredential:](v11, "setCredential:", v12);

    -[WFDropboxItemContentItem metadata](self, "metadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __74__WFDropboxItemContentItem_generateObjectRepresentation_options_forClass___block_invoke;
    v14[3] = &unk_24F8B7FC8;
    v14[4] = self;
    v15 = v7;
    -[WFDropboxSessionManager getSharedLinkForFile:completionHandler:](v11, "getSharedLinkForFile:completionHandler:", v13, v14);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "badCoercionErrorForObjectClass:", a5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v8);

  }
}

- (BOOL)hasStringOutput
{
  void *v2;
  void *v3;
  char v4;

  -[WFDropboxItemContentItem representedFileType](self, "representedFileType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "conformsToUTType:", *MEMORY[0x24BDF8510]);
  else
    v4 = 1;

  return v4;
}

- (id)outputTypes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[WFDropboxItemContentItem representedFileType](self, "representedFileType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8510]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)WFDropboxItemContentItem;
  -[WFDropboxItemContentItem outputTypes](&v8, sel_outputTypes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedSetByAddingObjectsFromOrderedSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)overrideFilename
{
  void *v2;
  void *v3;

  -[WFDropboxItemContentItem objectRepresentationForClass:](self, "objectRepresentationForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "specifiedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)representedFileType
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BEC14A0];
  -[WFDropboxItemContentItem representedFilename](self, "representedFilename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeFromFilename:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)representedFilename
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;

  -[WFDropboxItemContentItem overrideFilename](self, "overrideFilename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BEC14A0], "typeFromFilename:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDeclared");

  if (!v6)
  {
LABEL_5:
    -[WFDropboxItemContentItem metadata](self, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v7 = v3;
LABEL_6:

  return v7;
}

- (void)getPreferredFileSize:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  -[WFDropboxItemContentItem metadata](self, "metadata");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileSize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, objc_msgSend(v6, "longLongValue"));

}

- (void)getPreferredFileExtension:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  -[WFDropboxItemContentItem representedFilename](self, "representedFilename");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a3 + 2))(v5, v6);

}

- (BOOL)canEncodeWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  objc_msgSend(v3, "wfFileCoder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "wfFileCoder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "targetPlatform") == 0;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (id)richListTitle
{
  void *v2;
  void *v3;

  -[WFDropboxItemContentItem metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)getListSubtitle:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  void *v14;

  v4 = (void (**)(id, id))a3;
  if (v4)
  {
    -[WFDropboxItemContentItem metadata](self, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isDirectory");

    if (v6)
    {
      WFLocalizedString(CFSTR("Folder"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v7);
    }
    else
    {
      -[WFDropboxItemContentItem metadata](self, "metadata");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "clientModifiedDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v7 = v9;
      }
      else
      {
        -[WFDropboxItemContentItem metadata](self, "metadata");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "serverModifiedDate");
        v7 = (id)objc_claimAutoreleasedReturnValue();

      }
      v12 = objc_alloc_init(MEMORY[0x24BDD1500]);
      objc_msgSend(v12, "setDoesRelativeDateFormatting:", 1);
      objc_msgSend(v12, "setDateStyle:", 1);
      objc_msgSend(v7, "timeIntervalSinceNow");
      objc_msgSend(v12, "setTimeStyle:", fabs(v13) < 172800.0);
      objc_msgSend(v12, "stringFromDate:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v14);

    }
  }

  return 1;
}

- (BOOL)getListAltText:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void (**)(id, void *))a3;
  -[WFDropboxItemContentItem metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDirectory");
  if ((v6 & 1) == 0)
  {
    v7 = objc_alloc(MEMORY[0x24BE19500]);
    objc_msgSend(v5, "fileSize");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithByteCount:", objc_msgSend(v8, "longLongValue"));

    if (v4)
    {
      objc_msgSend(v9, "formattedString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v10);

    }
  }

  return v6 ^ 1;
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  void (**v5)(id, void *, _QWORD);
  void *v6;
  int v7;
  void *v8;
  void *v9;

  v5 = (void (**)(id, void *, _QWORD))a3;
  -[WFDropboxItemContentItem metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isDirectory");

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BEC14E0], "actionKitImageNamed:", CFSTR("Folder"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_6;
    goto LABEL_5;
  }
  -[WFDropboxItemContentItem preferredFileType](self, "preferredFileType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "documentIcon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
LABEL_5:
    v5[2](v5, v8, 0);
LABEL_6:

  return v8 != 0;
}

void __74__WFDropboxItemContentItem_generateObjectRepresentation_options_forClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "metadata");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, id))(v4 + 16))(v4, v7, v8, v6);

}

uint64_t __71__WFDropboxItemContentItem_generateFileRepresentation_options_forType___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)propertyBuilders
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE19490], "block:name:class:", &__block_literal_global_38821, CFSTR("Creation Date"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfo:", *MEMORY[0x24BE197F0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tense:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeUnits:", 8444);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x24BE19490], "block:name:class:", &__block_literal_global_114, CFSTR("Last Modified Date"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userInfo:", *MEMORY[0x24BE197F8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tense:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeUnits:", 8444);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)stringConversionBehavior
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BE19468];
  objc_msgSend(a1, "propertyForName:", CFSTR("Name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessingProperty:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)isAvailableOnPlatform:(int64_t)a3
{
  return a3 == 0;
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

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8350]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BE196E0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Dropbox file"), CFSTR("Dropbox file"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Dropbox files"), CFSTR("Dropbox files"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Dropbox files"));
}

void __44__WFDropboxItemContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a4;
  objc_msgSend(v10, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientModifiedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v5[2](v5, v7);
  }
  else
  {
    objc_msgSend(v10, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serverModifiedDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v9);

  }
}

uint64_t __44__WFDropboxItemContentItem_propertyBuilders__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a4 + 16))(a4, 0);
}

@end
