@implementation WFEmailContentItem

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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[6];

  v16[5] = *MEMORY[0x24BDAC8D0];
  WFLocalizedContentPropertyNameMarker(CFSTR("Subject"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("email.subject"), v15, objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v14;
  WFLocalizedContentPropertyNameMarker(CFSTR("Sender"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_22140, v13, objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v12;
  WFLocalizedContentPropertyNameMarker(CFSTR("Recipients"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_14_22142, v2, objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "multipleValues:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v4;
  WFLocalizedContentPropertyNameMarker(CFSTR("Attachments"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_17_22145, v5, objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "multipleValues:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v7;
  WFLocalizedContentPropertyNameMarker(CFSTR("Content"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_23_22147, v8, objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83F8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("Sharing");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Email"), CFSTR("Email"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Emails"), CFSTR("Emails"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Emails"));
}

void __38__WFEmailContentItem_propertyBuilders__block_invoke_22(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  objc_msgSend(a2, "email");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__WFEmailContentItem_propertyBuilders__block_invoke_2_24;
  v8[3] = &unk_24C4E2ED8;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "fetchContentRepresentationWithCompletionHandler:", v8);

}

void __38__WFEmailContentItem_propertyBuilders__block_invoke_2_24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    getWFContentItemLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "+[WFEmailContentItem propertyBuilders]_block_invoke_2";
      v10 = 2114;
      v11 = v6;
      _os_log_impl(&dword_20BBAD000, v7, OS_LOG_TYPE_ERROR, "%s Could not get email content due to error: %{public}@", (uint8_t *)&v8, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __38__WFEmailContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  objc_msgSend(a2, "email");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__WFEmailContentItem_propertyBuilders__block_invoke_4;
  v8[3] = &unk_24C4E33B0;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "fetchAttachmentsWithCompletionHandler:", v8);

}

void __38__WFEmailContentItem_propertyBuilders__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    getWFContentItemLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "+[WFEmailContentItem propertyBuilders]_block_invoke_4";
      v10 = 2114;
      v11 = v6;
      _os_log_impl(&dword_20BBAD000, v7, OS_LOG_TYPE_ERROR, "%s Could not get email content due to error: %{public}@", (uint8_t *)&v8, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __38__WFEmailContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a2, "email");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recipients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a4)[2](v6, v7);

}

void __38__WFEmailContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a2, "email");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sender");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a4)[2](v6, v7);

}

- (WFEmail)email
{
  return (WFEmail *)-[WFContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if ((Class)objc_opt_class() == a3
    && (-[WFEmailContentItem email](self, "email"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "sender"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    -[WFEmailContentItem email](self, "email");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sender");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFEmailContentItem email](self, "email");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sender");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "address");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v10, v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  if ((Class)objc_opt_class() == a5)
  {
    -[WFEmailContentItem email](self, "email");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __68__WFEmailContentItem_generateObjectRepresentation_options_forClass___block_invoke;
    v12[3] = &unk_24C4E2F28;
    v14 = v8;
    v12[4] = self;
    v13 = v9;
    objc_msgSend(v11, "fetchContentRepresentationWithCompletionHandler:", v12);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "badCoercionErrorForObjectClass:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, v10);

  }
}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v8, "conformsToUTType:", *MEMORY[0x24BDF83F8]))
  {
    -[WFEmailContentItem email](self, "email");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __65__WFEmailContentItem_generateFileRepresentation_options_forType___block_invoke;
    v11[3] = &unk_24C4E2ED8;
    v12 = v7;
    objc_msgSend(v9, "fetchContentRepresentationWithCompletionHandler:", v11);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "badCoercionErrorForType:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v10);

  }
}

uint64_t __65__WFEmailContentItem_generateFileRepresentation_options_forType___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__WFEmailContentItem_generateObjectRepresentation_options_forClass___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__WFEmailContentItem_generateObjectRepresentation_options_forClass___block_invoke_2;
  v7[3] = &unk_24C4E2F00;
  v4 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 32);
  v9 = v4;
  v5 = a2;
  objc_msgSend(v8, "name", v7[0], 3221225472, __68__WFEmailContentItem_generateObjectRepresentation_options_forClass___block_invoke_2, &unk_24C4E2F00, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFRichTextContentItem loadAttributedStringInWebViewFromHTMLFile:handler:attributedStringOptions:documentAttributes:name:coercionOptions:](WFRichTextContentItem, "loadAttributedStringInWebViewFromHTMLFile:handler:attributedStringOptions:documentAttributes:name:coercionOptions:", v5, v7, 0, 0, v6, *(_QWORD *)(a1 + 40));

}

void __68__WFEmailContentItem_generateObjectRepresentation_options_forClass___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v6 = *(_QWORD *)(a1 + 40);
  v7 = a4;
  objc_msgSend(a2, "string");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, id))(v6 + 16))(v6, v9, v8, v7);

}

@end
