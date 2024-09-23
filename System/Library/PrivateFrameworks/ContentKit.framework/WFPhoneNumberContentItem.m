@implementation WFPhoneNumberContentItem

+ (id)propertyBuilders
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  WFLocalizedContentPropertyNameMarker(CFSTR("Label"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("phoneNumber.localizedLabel"), v2, objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentProperty possibleLabelsForClass:localized:](WFContentProperty, "possibleLabelsForClass:localized:", objc_opt_class(), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "possibleValues:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)contentCategories
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Phone number"), CFSTR("Phone number"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Phone numbers"), CFSTR("Phone numbers"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Phone numbers"));
}

+ (int64_t)tableTemplateSubjectType
{
  return 2;
}

- (WFPhoneNumber)phoneNumber
{
  return (WFPhoneNumber *)-[WFContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
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

  -[WFPhoneNumberContentItem phoneNumber](self, "phoneNumber", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((Class)objc_opt_class() == a3)
  {
    objc_msgSend(v7, "formattedPhoneNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentItem name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v9, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  if ((Class)objc_opt_class() == a3)
  {
    v11 = (void *)MEMORY[0x24BDBCF48];
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v7, "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "URLHostAllowedCharacterSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAddingPercentEncodingWithAllowedCharacters:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("tel:%@"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLWithString:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("Call %@"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "formattedPhoneNumber");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringWithFormat:", v18, v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v8 = a3;
  v9 = a4;
  if ((Class)objc_opt_class() == a5)
  {
    objc_msgSend(v9, "permissionRequestor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __75__WFPhoneNumberContentItem_generateObjectRepresentations_options_forClass___block_invoke;
    v12[3] = &unk_24C4E2C28;
    v12[4] = self;
    v13 = v8;
    objc_msgSend(v11, "allowContactsAccessWithCompletionHandler:", v12);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "badCoercionErrorForObjectClass:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v10);

  }
}

void __75__WFPhoneNumberContentItem_generateObjectRepresentations_options_forClass___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "phoneNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("/.()- "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsJoinedByString:", &stru_24C4E3948);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *(_QWORD *)(a1 + 40);
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __75__WFPhoneNumberContentItem_generateObjectRepresentations_options_forClass___block_invoke_2;
    v17 = &unk_24C4DDFC0;
    v18 = v6;
    v19 = v8;
    v10 = v8;
    v11 = v6;
    objc_msgSend(v3, "allContactsWithSortOrder:passingTest:", 0, &v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation objects:](WFObjectRepresentation, "objects:", v12, v14, v15, v16, v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v13, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __75__WFPhoneNumberContentItem_generateObjectRepresentations_options_forClass___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "phoneNumbers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v15 = v3;
      v7 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "value");
          v9 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v9, "string");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "componentsSeparatedByCharactersInSet:", *(_QWORD *)(a1 + 32));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "componentsJoinedByString:", &stru_24C4E3948);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          LOBYTE(v9) = objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", v12);
          if ((v9 & 1) != 0)
          {
            v13 = 1;
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v6)
          continue;
        break;
      }
      v13 = 0;
LABEL_12:
      v3 = v15;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)richListTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  -[WFContentItem internalRepresentation](self, "internalRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "specifiedName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {

    }
    else
    {
      -[WFPhoneNumberContentItem phoneNumber](self, "phoneNumber");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contactName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[WFPhoneNumberContentItem phoneNumber](self, "phoneNumber");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "contactName");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_5;
      }
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)WFPhoneNumberContentItem;
  -[WFContentItem richListTitle](&v10, sel_richListTitle);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

  return v5;
}

- (BOOL)getListAltText:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = (void (**)(id, void *))a3;
  -[WFPhoneNumberContentItem phoneNumber](self, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "length");
  v8 = v7;
  if (v4 && v7)
    v4[2](v4, v6);

  return v8 != 0;
}

- (BOOL)getListSubtitle:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  objc_super v11;

  v4 = (void (**)(id, void *))a3;
  -[WFPhoneNumberContentItem phoneNumber](self, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contactName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (v4)
    {
      -[WFPhoneNumberContentItem phoneNumber](self, "phoneNumber");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "formattedPhoneNumber");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v8);

    }
    v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WFPhoneNumberContentItem;
    v9 = -[WFContentItem getListSubtitle:](&v11, sel_getListSubtitle_, v4);
  }

  return v9;
}

@end
