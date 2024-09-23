@implementation WFArticleContentItem

- (WFArticle)article
{
  return (WFArticle *)-[WFContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)htmlRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  -[WFArticleContentItem article](self, "article");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "body");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v2, "excerpt");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(v2, "title");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v8;

  }
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
    v12.super_class = (Class)WFArticleContentItem;
    -[WFContentItem defaultSourceForRepresentation:](&v12, sel_defaultSourceForRepresentation_, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    return v11;
  }
}

+ (id)propertyBuilders
{
  uint64_t v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[10];

  v24[8] = *MEMORY[0x24BDAC8D0];
  WFLocalizedContentPropertyNameMarker(CFSTR("Title"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("article.title"), v21, objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v20;
  WFLocalizedContentPropertyNameMarker(CFSTR("Author"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("article.author"), v19, objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v18;
  WFLocalizedContentPropertyNameMarker(CFSTR("Published Date"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("article.publishedDate"), v17, objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v16;
  v3 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __40__WFArticleContentItem_propertyBuilders__block_invoke;
  v23[3] = &__block_descriptor_40_e43_v32__0__WFArticleContentItem_8_16___v____24l;
  v23[4] = a1;
  WFLocalizedContentPropertyNameMarker(CFSTR("Body"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", v23, v15, objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v4;
  v22[0] = v3;
  v22[1] = 3221225472;
  v22[2] = __40__WFArticleContentItem_propertyBuilders__block_invoke_2;
  v22[3] = &__block_descriptor_40_e43_v32__0__WFArticleContentItem_8_16___v____24l;
  v22[4] = a1;
  WFLocalizedContentPropertyNameMarker(CFSTR("Excerpt"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", v22, v5, objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v6;
  WFLocalizedContentPropertyNameMarker(CFSTR("Number of Words"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("article.numberOfWords"), v7, objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v8;
  WFLocalizedContentPropertyNameMarker(CFSTR("Main Image URL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("article.mainImageURL"), v9, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v10;
  WFLocalizedContentPropertyNameMarker(CFSTR("URL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("article.URL"), v11, objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)fileWithHTML:(id)a3 named:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  +[WFRichTextContentItem normalizedHTMLDocumentFromHTML:](WFRichTextContentItem, "normalizedHTMLDocumentFromHTML:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83F8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[WFFileRepresentation fileWithData:ofType:proposedFilename:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:", v7, v8, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "localizedTypeDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFFileRepresentation fileWithData:ofType:proposedFilename:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:", v7, v8, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (id)stringConversionBehavior
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "propertyForName:", CFSTR("Body"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentItemStringConversionBehavior accessingProperty:](WFContentItemStringConversionBehavior, "accessingProperty:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)htmlCoercionHandler
{
  return +[WFCoercionHandler block:availabilityCheck:](WFCoercionHandler, "block:availabilityCheck:", &__block_literal_global_6416, &__block_literal_global_47);
}

+ (id)stringCoercionHandler
{
  return +[WFCoercionHandler asynchronousBlock:availabilityCheck:](WFCoercionHandler, "asynchronousBlock:availabilityCheck:", &__block_literal_global_49, &__block_literal_global_52);
}

+ (id)dateCoercionHandler
{
  return +[WFCoercionHandler block:availabilityCheck:](WFCoercionHandler, "block:availabilityCheck:", &__block_literal_global_53, &__block_literal_global_56);
}

+ (id)URLCoercionHandler
{
  return +[WFCoercionHandler block:availabilityCheck:](WFCoercionHandler, "block:availabilityCheck:", &__block_literal_global_57, &__block_literal_global_58);
}

+ (id)imageCoercionHandler
{
  return +[WFCoercionHandler asynchronousBlock:availabilityCheck:](WFCoercionHandler, "asynchronousBlock:availabilityCheck:", &__block_literal_global_59, &__block_literal_global_61);
}

+ (id)coercions
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[6];

  v20[5] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83F8]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "htmlCoercionHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToType:handler:](WFCoercion, "coercionToType:handler:", v19, v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v17;
  v3 = objc_opt_class();
  objc_msgSend(a1, "stringCoercionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToClass:handler:](WFCoercion, "coercionToClass:handler:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v5;
  v6 = objc_opt_class();
  objc_msgSend(a1, "dateCoercionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToClass:handler:](WFCoercion, "coercionToClass:handler:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v8;
  v9 = objc_opt_class();
  objc_msgSend(a1, "URLCoercionHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToClass:handler:](WFCoercion, "coercionToClass:handler:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v11;
  v12 = objc_opt_class();
  objc_msgSend(a1, "imageCoercionHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToClass:handler:](WFCoercion, "coercionToClass:handler:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
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
  return WFDeferrableLocalizedStringWithKey(CFSTR("Article (singular)"), CFSTR("Article"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Articles"), CFSTR("Articles"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Articles"));
}

BOOL __44__WFArticleContentItem_imageCoercionHandler__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "article");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainImageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

void __44__WFArticleContentItem_imageCoercionHandler__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a2, "article");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mainImageURL");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  +[WFContentItem itemWithObject:](WFContentItem, "itemWithObject:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestedType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "options");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "getRepresentationsForType:options:completionHandler:", v10, v11, v6);
}

BOOL __42__WFArticleContentItem_URLCoercionHandler__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "article");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

id __42__WFArticleContentItem_URLCoercionHandler__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "article");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "article");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

BOOL __43__WFArticleContentItem_dateCoercionHandler__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "article");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "publishedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

id __43__WFArticleContentItem_dateCoercionHandler__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "article");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "publishedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Article Publish Date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL __45__WFArticleContentItem_stringCoercionHandler__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = a2;
  objc_msgSend(v2, "article");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "body");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v2, "article");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "excerpt");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v2, "article");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v9 != 0;

    }
  }

  return v5;
}

void __45__WFArticleContentItem_stringCoercionHandler__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;

  v6 = a4;
  v7 = a3;
  v8 = a2;
  objc_msgSend(v8, "article");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_opt_class();
  objc_msgSend(v8, "htmlRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "fileWithHTML:named:", v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = MEMORY[0x24BDAC760];
  v18 = v10;
  v19 = v6;
  v14 = v10;
  v15 = v6;
  objc_msgSend(v7, "options", v17, 3221225472, __45__WFArticleContentItem_stringCoercionHandler__block_invoke_2, &unk_24C4E2F00);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFRichTextContentItem loadAttributedStringInWebViewFromHTMLFile:handler:attributedStringOptions:documentAttributes:name:coercionOptions:](WFRichTextContentItem, "loadAttributedStringInWebViewFromHTMLFile:handler:attributedStringOptions:documentAttributes:name:coercionOptions:", v13, &v17, 0, 0, v14, v16);
}

void __45__WFArticleContentItem_stringCoercionHandler__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    objc_msgSend(a2, "string");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v7, *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v6, 0);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(v4 + 16))(*(_QWORD *)(a1 + 40), 0, a4);
  }
}

BOOL __43__WFArticleContentItem_htmlCoercionHandler__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = a2;
  objc_msgSend(v2, "article");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "body");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v2, "article");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "excerpt");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v2, "article");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v9 != 0;

    }
  }

  return v5;
}

id __43__WFArticleContentItem_htmlCoercionHandler__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  v3 = (void *)objc_opt_class();
  objc_msgSend(v2, "htmlRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "article");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileWithHTML:named:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __40__WFArticleContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v6 = a4;
  objc_msgSend(v13, "article");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "body");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v13, "article");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fileWithHTML:named:", v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v12);

  }
  else
  {
    v6[2](v6, 0);
  }

}

void __40__WFArticleContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v6 = a4;
  objc_msgSend(v13, "article");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "excerpt");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v13, "article");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fileWithHTML:named:", v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v12);

  }
  else
  {
    v6[2](v6, 0);
  }

}

- (BOOL)getListSubtitle:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void (**)(id, void *))a3;
  -[WFArticleContentItem article](self, "article");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "publishedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setDateStyle:", 3);
    objc_msgSend(v7, "setTimeStyle:", 1);
    objc_msgSend(v7, "setDoesRelativeDateFormatting:", 1);
    if (v4)
    {
      objc_msgSend(v7, "stringFromDate:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v8);

    }
  }

  return v6 != 0;
}

@end
