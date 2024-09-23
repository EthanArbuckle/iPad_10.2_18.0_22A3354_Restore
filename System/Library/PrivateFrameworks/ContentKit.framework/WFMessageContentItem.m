@implementation WFMessageContentItem

- (WFMessage)message
{
  return (WFMessage *)-[WFContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  void *v8;

  if ((Class)objc_opt_class() == a3)
  {
    -[WFMessageContentItem message](self, "message");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "content");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)generateObjectRepresentationsForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v8 = a4;
  if ((Class)objc_opt_class() == a3)
  {
    -[WFMessageContentItem message](self, "message");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "senderHandles");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "if_compactMap:", &__block_literal_global_16751);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count"))
    {
      v13 = CFSTR("Phone numbers");
LABEL_8:
      WFLocalizedContentPropertyNameMarker(v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFObjectRepresentation objects:named:](WFObjectRepresentation, "objects:named:", v12, v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
      goto LABEL_11;
    }
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  if ((Class)objc_opt_class() == a3)
  {
    -[WFMessageContentItem message](self, "message");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "senderHandles");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "if_compactMap:", &__block_literal_global_28_16755);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count"))
    {
      v13 = CFSTR("Email addresses");
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v18.receiver = self;
  v18.super_class = (Class)WFMessageContentItem;
  -[WFContentItem generateObjectRepresentationsForClass:options:error:](&v18, sel_generateObjectRepresentationsForClass_options_error_, a3, v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v9;
}

id __76__WFMessageContentItem_generateObjectRepresentationsForClass_options_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (+[WFContact predictedTypeForHandleValue:](WFContact, "predictedTypeForHandleValue:", v2) == 1)
  {
    +[WFEmailAddress addressWithEmailAddress:](WFEmailAddress, "addressWithEmailAddress:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __76__WFMessageContentItem_generateObjectRepresentationsForClass_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (+[WFContact predictedTypeForHandleValue:](WFContact, "predictedTypeForHandleValue:", v2))
  {
    v3 = 0;
  }
  else
  {
    +[WFPhoneNumber phoneNumberWithPhoneNumberString:](WFPhoneNumber, "phoneNumberWithPhoneNumberString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
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
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  WFLocalizedContentPropertyNameMarker(CFSTR("Content"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("message.content"), v2, objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Recipients"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("message.recipients"), v4, objc_opt_class(), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "multipleValues:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  WFLocalizedContentPropertyNameMarker(CFSTR("Sender"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("message.senderHandles"), v7, objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "multipleValues:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 3);
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
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("Sharing");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Message"), CFSTR("Message"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Messages"), CFSTR("Messages"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Messages"));
}

@end
