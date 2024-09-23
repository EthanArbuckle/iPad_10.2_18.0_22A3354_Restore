@implementation WFEmailAddressContentItem

- (BOOL)getListAltText:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = (void (**)(id, void *))a3;
  -[WFEmailAddressContentItem emailAddress](self, "emailAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "length");
  v8 = v7;
  if (v4 && v7)
    v4[2](v4, v6);

  return v8 != 0;
}

+ (id)itemsWithTextCheckingResult:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  +[WFEmailAddress addressesWithTextCheckingResult:](WFEmailAddress, "addressesWithTextCheckingResult:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__WFEmailAddressContentItem_itemsWithTextCheckingResult___block_invoke;
  v7[3] = &__block_descriptor_40_e27__24__0__WFEmailAddress_8Q16l;
  v7[4] = a1;
  objc_msgSend(v4, "if_map:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

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
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("emailAddress.localizedLabel"), v2, objc_opt_class());
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
  void *v7;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)contentCategories
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Email address"), CFSTR("Email address"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Email addresses"), CFSTR("Email addresses"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Email addresses"));
}

+ (int64_t)tableTemplateSubjectType
{
  return 2;
}

uint64_t __57__WFEmailAddressContentItem_itemsWithTextCheckingResult___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "itemWithObject:", a2);
}

- (WFEmailAddress)emailAddress
{
  return (WFEmailAddress *)-[WFContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
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
  WFParticipant *v14;
  void *v15;
  void *v16;
  Class EKAttendeeClass;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  if ((Class)objc_opt_class() == a3)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "URLHostAllowedCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "addCharactersInString:", CFSTR("@"));
    v10 = (void *)MEMORY[0x24BDD17C8];
    -[WFEmailAddressContentItem emailAddress](self, "emailAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "address");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAddingPercentEncodingWithAllowedCharacters:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("mailto:%@"), v13);
    v14 = (WFParticipant *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentItem name](self, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v15, v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
LABEL_9:

    return v7;
  }
  if ((Class)objc_opt_class() == a3)
  {
    -[WFEmailAddressContentItem emailAddress](self, "emailAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "address");
    v14 = (WFParticipant *)objc_claimAutoreleasedReturnValue();
    -[WFContentItem name](self, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v14, v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if ((Class)objc_opt_class() == a3)
  {
    EKAttendeeClass = getEKAttendeeClass();
    -[WFEmailAddressContentItem emailAddress](self, "emailAddress");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "address");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x24BDBCF48];
    v21 = (void *)MEMORY[0x24BDD17C8];
    -[WFEmailAddressContentItem emailAddress](self, "emailAddress");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "address");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("mailto:%@"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "URLWithString:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class attendeeWithName:emailAddress:phoneNumber:url:](EKAttendeeClass, "attendeeWithName:emailAddress:phoneNumber:url:", 0, v19, 0, v25);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[WFParticipant initWithEKParticipant:]([WFParticipant alloc], "initWithEKParticipant:", v9);
    +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v7 = 0;
  return v7;
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
    v12[2] = __76__WFEmailAddressContentItem_generateObjectRepresentations_options_forClass___block_invoke;
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

void __76__WFEmailAddressContentItem_generateObjectRepresentations_options_forClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "emailAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "address");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBACA0], "predicateForContactsMatchingEmailAddress:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v6;
    objc_msgSend(v5, "contactsMatchingPredicate:error:", v10, &v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v15;

    v13 = *(_QWORD *)(a1 + 40);
    +[WFObjectRepresentation objects:](WFObjectRepresentation, "objects:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v13 + 16))(v13, v14, v12);

    v6 = v12;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

@end
