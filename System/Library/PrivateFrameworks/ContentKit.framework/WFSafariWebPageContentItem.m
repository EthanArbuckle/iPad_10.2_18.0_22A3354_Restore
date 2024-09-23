@implementation WFSafariWebPageContentItem

- (WFSafariWebPage)webPage
{
  return (WFSafariWebPage *)-[WFContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (void)getSerializedItem:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = objc_opt_class();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__WFSafariWebPageContentItem_getSerializedItem___block_invoke;
  v7[3] = &unk_24C4E33B0;
  v8 = v4;
  v6 = v4;
  -[WFContentItem coerceToItemClass:completionHandler:](self, "coerceToItemClass:completionHandler:", v5, v7);

}

- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v7 = a3;
  if ((Class)objc_opt_class() == a5)
  {
    -[WFSafariWebPageContentItem webPage](self, "webPage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "documentHTML");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __77__WFSafariWebPageContentItem_generateObjectRepresentations_options_forClass___block_invoke;
    v11[3] = &unk_24C4DFAC0;
    v12 = v7;
    +[WFArticle fetchArticleFromURL:pageHTML:completionHandler:](WFArticle, "fetchArticleFromURL:pageHTML:completionHandler:", v9, v10, v11);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "badCoercionErrorForObjectClass:", a5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v8);
  }

}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if ((Class)objc_opt_class() == a3)
  {
    -[WFSafariWebPageContentItem webPage](self, "webPage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URL");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v10 = (void *)v9;
    -[WFContentItem name](self, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v10, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  if ((Class)objc_opt_class() == a3)
  {
    -[WFSafariWebPageContentItem webPage](self, "webPage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectionText");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v7 = 0;
  return v7;
}

- (id)generateFileRepresentationForType:(id)a3 options:(id)a4 error:(id *)a5
{
  void *v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a3;
  if (objc_msgSend(v7, "conformsToUTType:", *MEMORY[0x24BDF83F8]))
  {
    -[WFSafariWebPageContentItem webPage](self, "webPage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectionHTML");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
    {
      -[WFSafariWebPageContentItem webPage](self, "webPage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "documentHTML");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[WFContentItem name](self, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSafariWebPageContentItem webPage](self, "webPage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFFileRepresentation fileWithData:ofType:proposedFilename:originalURL:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:originalURL:", v10, v7, v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  if ((objc_msgSend(v4, "conformsToClass:", objc_opt_class()) & 1) == 0)
  {
    -[WFSafariWebPageContentItem webPage](self, "webPage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "conformsToUTType:", *MEMORY[0x24BDF83F8]))
    {
      objc_msgSend(v6, "selectionHTML");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v5 = 1;
      }
      else
      {
        objc_msgSend(v6, "documentHTML");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v8 != 0;

      }
    }
    else
    {
      if ((objc_msgSend(v4, "conformsToUTType:", *MEMORY[0x24BDF8510]) & 1) == 0
        && !objc_msgSend(v4, "conformsToClass:", objc_opt_class()))
      {
        v10.receiver = self;
        v10.super_class = (Class)WFSafariWebPageContentItem;
        v5 = -[WFContentItem canGenerateRepresentationForType:](&v10, sel_canGenerateRepresentationForType_, v4);
        goto LABEL_11;
      }
      objc_msgSend(v6, "selectionText");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "length") != 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  v5 = 1;
LABEL_12:

  return v5;
}

- (id)defaultSourceForRepresentation:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  objc_super v12;

  v4 = a3;
  objc_msgSend(v4, "wfType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToClass:", objc_opt_class());

  if (v6)
  {
    objc_msgSend(v4, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFURLContentItem attributionSetContentOfURL:](WFURLContentItem, "attributionSetContentOfURL:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)WFSafariWebPageContentItem;
    -[WFContentItem defaultSourceForRepresentation:](&v12, sel_defaultSourceForRepresentation_, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    return v11;
  }
}

void __77__WFSafariWebPageContentItem_generateObjectRepresentations_options_forClass___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v2 + 16))(v2, v4, 0);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32), 0);
  }
}

void __48__WFSafariWebPageContentItem_getSerializedItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getSerializedItem:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

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
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  WFLocalizedString(CFSTR("Page Contents"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_8480, v2, objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Page Selection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_16, v4, objc_opt_class(), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  WFLocalizedString(CFSTR("Page URL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("webPage.URL"), v6, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "conformsToClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v4, "conformsToUTType:", *MEMORY[0x24BDF83F8]) & 1) != 0
    || (objc_msgSend(v4, "conformsToUTType:", *MEMORY[0x24BDF8510]) & 1) != 0
    || (objc_msgSend(v4, "conformsToClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___WFSafariWebPageContentItem;
    v5 = objc_msgSendSuper2(&v7, sel_supportedTypeMustBeDeterminedByInstance_, v4);
  }

  return v5;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)ownedPasteboardTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", CFSTR("com.apple.active-webpage"));
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
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83F8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8510]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("Web");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Safari web page"), CFSTR("Safari web page"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Safari web pages"), CFSTR("Safari web pages"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Safari web pages"));
}

+ (BOOL)canLowercaseTypeDescription
{
  return 0;
}

void __46__WFSafariWebPageContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void (**v5)(id, void *);
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
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(a2, "webPage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectionHTML");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83F8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pageTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFFileRepresentation fileWithData:ofType:proposedFilename:originalURL:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:originalURL:", v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[WFContentItem itemWithFile:](WFRichTextContentItem, "itemWithFile:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectionText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "dataUsingEncoding:", 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8510]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pageTitle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFFileRepresentation fileWithData:ofType:proposedFilename:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:", v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v24[0] = v18;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "wfType");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFileRepresentations:forType:", v19, v20);

      +[WFContentItem itemWithFile:](WFStringContentItem, "itemWithFile:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v21;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSubItems:forClass:", v22, objc_opt_class());

    }
    v5[2](v5, v12);

  }
  else
  {
    v5[2](v5, 0);
  }

}

void __46__WFSafariWebPageContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void (**v5)(id, void *);
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a4;
  v6 = a2;
  objc_msgSend(v6, "webPage");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "documentHTML");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83F8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pageTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFFileRepresentation fileWithData:ofType:proposedFilename:originalURL:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:originalURL:", v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "attributionSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cachingIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFContentItem itemWithFile:attributionSet:cachingIdentifier:](WFRichTextContentItem, "itemWithFile:attributionSet:cachingIdentifier:", v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v5[2](v5, v14);
}

@end
