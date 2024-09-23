@implementation WFEKParticipantContentItem

- (WFParticipant)participant
{
  return (WFParticipant *)-[WFContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)emailAddress
{
  void *v2;
  void *v3;
  void *v4;

  -[WFEKParticipantContentItem participant](self, "participant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "emailAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[WFEmailAddress addressWithEmailAddress:](WFEmailAddress, "addressWithEmailAddress:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)role
{
  void *v2;
  unint64_t v3;
  void *v4;

  -[WFEKParticipantContentItem participant](self, "participant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "role");

  if (v3 <= 4)
  {
    WFLocalizedContentPropertyPossibleValueMarker(off_24C4DC1C8[v3]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)status
{
  void *v2;
  void *v3;

  -[WFEKParticipantContentItem participant](self, "participant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFStatusPropertyValueForEKParticipantStatus(objc_msgSend(v2, "status"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isCurrentUser
{
  void *v2;
  char v3;

  -[WFEKParticipantContentItem participant](self, "participant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentUser");

  return v3;
}

- (id)type
{
  void *v2;
  unint64_t v3;
  void *v4;

  -[WFEKParticipantContentItem participant](self, "participant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  if (v3 <= 4)
  {
    WFLocalizedContentPropertyPossibleValueMarker(off_24C4DC230[v3]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)defaultSourceForRepresentation:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  objc_super v17;

  v4 = a3;
  objc_msgSend(v4, "wfType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToClass:", objc_opt_class());

  if (v6)
  {
    objc_msgSend(v4, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc(MEMORY[0x24BDD9BD0]);
    v9 = (void *)objc_msgSend(v8, "initWithBundleIdentifier:", *MEMORY[0x24BEC16A0]);
    objc_msgSend(MEMORY[0x24BDD9BF0], "sharedResolver");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resolvedAppMatchingDescriptor:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "sourceIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentItem cachingIdentifier](self, "cachingIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFContentAttributionSet attributionSetWithAccountBasedAppDescriptor:accountIdentifier:disclosureLevel:originalItemIdentifier:](WFContentAttributionSet, "attributionSetWithAccountBasedAppDescriptor:accountIdentifier:disclosureLevel:originalItemIdentifier:", v11, v12, 1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    return v14;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)WFEKParticipantContentItem;
    -[WFContentItem defaultSourceForRepresentation:](&v17, sel_defaultSourceForRepresentation_, v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    return v16;
  }
}

- (BOOL)getListSubtitle:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = (void (**)(id, void *))a3;
  -[WFEKParticipantContentItem participant](self, "participant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emailAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "length");
  v8 = v7;
  if (v4 && v7)
    v4[2](v4, v6);

  return v8 != 0;
}

+ (id)coercions
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_opt_class();
  objc_msgSend(a1, "contactCoercionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToClass:handler:](WFCoercion, "coercionToClass:handler:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v6 = objc_opt_class();
  objc_msgSend(a1, "emailAddressCoercionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCoercion coercionToClass:handler:](WFCoercion, "coercionToClass:handler:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)emailAddressCoercionHandler
{
  return +[WFCoercionHandler block:availabilityCheck:](WFCoercionHandler, "block:availabilityCheck:", &__block_literal_global_1819, &__block_literal_global_17);
}

+ (id)contactCoercionHandler
{
  return +[WFCoercionHandler asynchronousBlock:availabilityCheck:](WFCoercionHandler, "asynchronousBlock:availabilityCheck:", &__block_literal_global_19, &__block_literal_global_21);
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
  void *v11;
  id v13;
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
  WFLocalizedContentPropertyNameMarker(CFSTR("Status"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("status"), v24, objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "possibleStatuses");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "possibleValues:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v21;
  WFLocalizedContentPropertyNameMarker(CFSTR("Role"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("role"), v20, objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "possibleRoles");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "possibleValues:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v17;
  WFLocalizedContentPropertyNameMarker(CFSTR("Type"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("type"), v16, objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "possibleTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "possibleValues:", v14);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v2;
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Me"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("isCurrentUser"), v3, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Not Me"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "negativeName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Participant"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "singularItemName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v9;
  WFLocalizedContentPropertyNameMarker(CFSTR("Email Address"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("emailAddress"), v10, objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 5);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)stringConversionBehavior
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "propertyForName:", CFSTR("Name"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentItemStringConversionBehavior accessingProperty:](WFContentItemStringConversionBehavior, "accessingProperty:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)possibleRoles
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x24BDAC8D0];
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Unknown"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Required"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Optional"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Chair"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Non-participant"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)possibleStatuses
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
  _QWORD v12[9];

  v12[8] = *MEMORY[0x24BDAC8D0];
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Accepted"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Completed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Declined"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v4;
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Delegated"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v5;
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("In Process"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v6;
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Pending"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v7;
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Tentative"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[6] = v8;
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Unknown"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[7] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)possibleTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x24BDAC8D0];
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Room"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Group"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Person"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Resource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Unknown"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Event attendee"), CFSTR("Event attendee"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Event attendees"), CFSTR("Event attendees"));
}

+ (id)localizedFilterDescription
{
  return WFLocalizedString(CFSTR("Event Attendee"));
}

+ (id)localizedPluralFilterDescription
{
  return WFLocalizedString(CFSTR("Event Attendees"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Event attendees"));
}

BOOL __52__WFEKParticipantContentItem_contactCoercionHandler__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "participant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactPredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

void __52__WFEKParticipantContentItem_contactCoercionHandler__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a4;
  v7 = a2;
  objc_msgSend(a3, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "participant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("WFCoercionOptionEKParticipantExcludeMeContact"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "BOOLValue"))
  {

    goto LABEL_5;
  }
  v12 = objc_msgSend(v9, "isCurrentUser");

  if (!v12)
  {
LABEL_5:
    objc_msgSend(v8, "permissionRequestor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __52__WFEKParticipantContentItem_contactCoercionHandler__block_invoke_2;
    v14[3] = &unk_24C4E2C28;
    v16 = v6;
    v15 = v9;
    objc_msgSend(v13, "allowContactsAccessWithCompletionHandler:", v14);

    goto LABEL_6;
  }
  (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
LABEL_6:

}

void __52__WFEKParticipantContentItem_contactCoercionHandler__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "contactPredicate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v6;
    objc_msgSend(v5, "contactsMatchingPredicate:error:", v7, &v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v14;

    if (!objc_msgSend(v8, "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contactsWithName:", v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v11;
    }
    v12 = *(_QWORD *)(a1 + 40);
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, id))(v12 + 16))(v12, v13, v9);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD, id))(v12 + 16))(v12, 0, v9);
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v9 = v6;
  }

}

BOOL __57__WFEKParticipantContentItem_emailAddressCoercionHandler__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "participant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "emailAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

id __57__WFEKParticipantContentItem_emailAddressCoercionHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "participant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("WFCoercionOptionEKParticipantExcludeMeContact"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "BOOLValue"))
  {

    goto LABEL_5;
  }
  v10 = objc_msgSend(v6, "isCurrentUser");

  if ((v10 & 1) == 0)
  {
LABEL_5:
    objc_msgSend(v4, "emailAddress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v12, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v11 = 0;
LABEL_6:

  return v11;
}

@end
