@implementation CNUIUserActionItem

- (BOOL)shouldPromoteLoneActionToBeDefault
{
  return (-[CNUIUserActionItem options](self, "options") & 0x20) == 0;
}

- (BOOL)isSuggested
{
  return (-[CNUIUserActionItem options](self, "options") >> 3) & 1;
}

- (BOOL)shouldGroupByBundleIdentifier
{
  return (-[CNUIUserActionItem options](self, "options") >> 1) & 1;
}

- (unint64_t)options
{
  return self->_options;
}

- (int64_t)group
{
  return self->_group;
}

+ (id)itemWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 url:(id)a6 isSensitive:(BOOL)a7 group:(int64_t)a8 options:(unint64_t)a9
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  _CNUIUserActionURLItem *v18;

  v10 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = -[_CNUIUserActionURLItem initWithType:contactProperty:bundleIdentifier:url:isSensitive:group:options:]([_CNUIUserActionURLItem alloc], "initWithType:contactProperty:bundleIdentifier:url:isSensitive:group:options:", v17, v16, v15, v14, v10, a8, a9);

  return v18;
}

+ (id)itemWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 url:(id)a6 group:(int64_t)a7 options:(unint64_t)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  _CNUIUserActionURLItem *v17;

  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[_CNUIUserActionURLItem initWithType:contactProperty:bundleIdentifier:url:group:options:]([_CNUIUserActionURLItem alloc], "initWithType:contactProperty:bundleIdentifier:url:group:options:", v16, v15, v14, v13, a7, a8);

  return v17;
}

- (CNUIUserActionItem)initWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 group:(int64_t)a6 options:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  CNUIUserActionItem *v16;
  CNUIUserActionItem *v17;
  uint64_t v18;
  NSString *bundleIdentifier;
  CNUIUserActionItem *v20;
  objc_super v22;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CNUIUserActionItem;
  v16 = -[CNUIUserActionItem init](&v22, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_type, a3);
    objc_storeStrong((id *)&v17->_contactProperty, a4);
    v18 = objc_msgSend(v15, "copy");
    bundleIdentifier = v17->_bundleIdentifier;
    v17->_bundleIdentifier = (NSString *)v18;

    v17->_group = a6;
    v17->_options = a7;
    v20 = v17;
  }

  return v17;
}

- (NSString)sanitizedTargetHandle
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;

  -[CNUIUserActionItem contactProperty](self, "contactProperty");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C967C0]);
  if ((v7 & 1) == 0)
  {
    -[CNUIUserActionItem contactProperty](self, "contactProperty");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "key");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96868]))
    {

      goto LABEL_9;
    }
  }
  -[CNUIUserActionItem targetHandle](self, "targetHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_cn_requiresPhoneNumberSanitizing");

  if ((v7 & 1) == 0)
  {

    if ((v9 & 1) != 0)
      goto LABEL_7;
LABEL_9:
    -[CNUIUserActionItem targetHandle](self, "targetHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    return (NSString *)v11;
  }

  if (!v9)
    goto LABEL_9;
LABEL_7:
  -[CNUIUserActionItem targetHandle](self, "targetHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_cn_stringBySanitizingPhoneNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (NSString)label
{
  void *v3;
  void *v4;

  if (-[CNUIUserActionItem shouldUseApplicationNameForLabel](self, "shouldUseApplicationNameForLabel"))
  {
    -[CNUIUserActionItem applicationNameForLabel](self, "applicationNameForLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNUIUserActionItem contactProperty](self, "contactProperty");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "label");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v3;
}

- (NSString)targetHandle
{
  id v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;

  if (targetHandle_cn_once_token_1 != -1)
    dispatch_once(&targetHandle_cn_once_token_1, &__block_literal_global_65);
  v3 = (id)targetHandle_cn_once_object_1;
  -[CNUIUserActionItem contactProperty](self, "contactProperty");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  -[CNUIUserActionItem contactProperty](self, "contactProperty");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v6)[2](v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (CNContactProperty)contactProperty
{
  return self->_contactProperty;
}

uint64_t __34__CNUIUserActionItem_targetHandle__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "formattedStringValue");
}

- (BOOL)shouldUseApplicationNameForLabel
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;

  -[CNUIUserActionItem bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", *MEMORY[0x1E0C965C0]);

  if ((v4 & 1) != 0)
    return 1;
  -[CNUIUserActionItem bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.Chatterbox")))
  {

    return 1;
  }
  -[CNUIUserActionItem bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("com.apple.Speakerbox"));

  if ((v7 & 1) != 0)
    return 1;
  return !-[CNUIUserActionItem isHandledByFirstPartyApp](self, "isHandledByFirstPartyApp");
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)isHandledByFirstPartyApp
{
  void *v2;
  char v3;

  -[CNUIUserActionItem bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("com.apple"));

  return v3;
}

id __34__CNUIUserActionItem_targetHandle__block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

- (NSString)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedRecentContactMetadata, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_contactProperty, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

void __34__CNUIUserActionItem_targetHandle__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = *MEMORY[0x1E0C966A8];
  v0 = (void *)objc_msgSend(&__block_literal_global_8_1, "copy");
  v9[0] = v0;
  v8[1] = *MEMORY[0x1E0C967C0];
  v1 = (void *)objc_msgSend(&__block_literal_global_10, "copy");
  v9[1] = v1;
  v8[2] = *MEMORY[0x1E0C96740];
  v2 = (void *)objc_msgSend(&__block_literal_global_12_1, "copy");
  v9[2] = v2;
  v8[3] = *MEMORY[0x1E0C96868];
  v3 = (void *)objc_msgSend(&__block_literal_global_14_0, "copy");
  v9[3] = v3;
  v8[4] = *MEMORY[0x1E0C967F0];
  v4 = (void *)objc_msgSend(&__block_literal_global_16_0, "copy");
  v9[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)targetHandle_cn_once_object_1;
  targetHandle_cn_once_object_1 = v6;

}

+ (id)payItemWithLabel:(id)a3 targetStringValue:(id)a4 url:(id)a5 bundleIdentifier:(id)a6
{
  id v9;
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _CNUIUserActionURLItem *v23;
  _CNUIUserActionURLItem *v24;
  uint64_t v25;
  void *v26;
  _CNUIUserActionURLItem *v27;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  v11 = (objc_class *)MEMORY[0x1E0C97360];
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v11);
  objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", v13, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEmailAddresses:", v16);

  v17 = (void *)MEMORY[0x1E0C97280];
  v18 = *MEMORY[0x1E0C966A8];
  objc_msgSend(v14, "emailAddresses");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v14, v18, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = [_CNUIUserActionURLItem alloc];
  v24 = v23;
  v25 = *MEMORY[0x1E0C96630];
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[_CNUIUserActionURLItem initWithType:contactProperty:bundleIdentifier:url:isSensitive:group:options:](v24, "initWithType:contactProperty:bundleIdentifier:url:isSensitive:group:options:", v25, v22, v10, v26, 1, 10, 0);

  }
  else
  {
    v27 = -[_CNUIUserActionURLItem initWithType:contactProperty:bundleIdentifier:url:isSensitive:group:options:](v23, "initWithType:contactProperty:bundleIdentifier:url:isSensitive:group:options:", v25, v22, v10, 0, 1, 10, 0);
  }

  return v27;
}

+ (id)emailItemWithLabel:(id)a3 targetStringValue:(id)a4 url:(id)a5 bundleIdentifier:(id)a6
{
  id v9;
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _CNUIUserActionURLItem *v23;
  _CNUIUserActionURLItem *v24;
  uint64_t v25;
  void *v26;
  _CNUIUserActionURLItem *v27;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  v11 = (objc_class *)MEMORY[0x1E0C97360];
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v11);
  objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", v13, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEmailAddresses:", v16);

  v17 = (void *)MEMORY[0x1E0C97280];
  v18 = *MEMORY[0x1E0C966A8];
  objc_msgSend(v14, "emailAddresses");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v14, v18, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = [_CNUIUserActionURLItem alloc];
  v24 = v23;
  v25 = *MEMORY[0x1E0C96618];
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[_CNUIUserActionURLItem initWithType:contactProperty:bundleIdentifier:url:group:options:](v24, "initWithType:contactProperty:bundleIdentifier:url:group:options:", v25, v22, v10, v26, 1, 0);

  }
  else
  {
    v27 = -[_CNUIUserActionURLItem initWithType:contactProperty:bundleIdentifier:url:group:options:](v23, "initWithType:contactProperty:bundleIdentifier:url:group:options:", *MEMORY[0x1E0C96618], v22, v10, 0, 1, 0);
  }

  return v27;
}

+ (id)textItemWithLabel:(id)a3 targetStringValue:(id)a4 url:(id)a5 bundleIdentifier:(id)a6 group:(int64_t)a7 options:(unint64_t)a8
{
  id v13;
  id v14;
  objc_class *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _CNUIUserActionURLItem *v27;
  _CNUIUserActionURLItem *v28;
  uint64_t v29;
  void *v30;
  _CNUIUserActionURLItem *v31;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a6;
  v15 = (objc_class *)MEMORY[0x1E0C97360];
  v16 = a4;
  v17 = a3;
  v18 = objc_alloc_init(v15);
  objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", v17, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setEmailAddresses:", v20);

  v21 = (void *)MEMORY[0x1E0C97280];
  v22 = *MEMORY[0x1E0C966A8];
  objc_msgSend(v18, "emailAddresses");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v18, v22, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = [_CNUIUserActionURLItem alloc];
  v28 = v27;
  v29 = *MEMORY[0x1E0C96620];
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", v13);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[_CNUIUserActionURLItem initWithType:contactProperty:bundleIdentifier:url:group:options:](v28, "initWithType:contactProperty:bundleIdentifier:url:group:options:", v29, v26, v14, v30, a7, a8);

  }
  else
  {
    v31 = -[_CNUIUserActionURLItem initWithType:contactProperty:bundleIdentifier:url:group:options:](v27, "initWithType:contactProperty:bundleIdentifier:url:group:options:", *MEMORY[0x1E0C96620], v26, v14, 0, a7, a8);
  }

  return v31;
}

+ (id)textItemWithLabel:(id)a3 targetPhoneNumber:(id)a4 url:(id)a5 bundleIdentifier:(id)a6 group:(int64_t)a7 options:(unint64_t)a8
{
  id v13;
  id v14;
  objc_class *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _CNUIUserActionURLItem *v29;
  _CNUIUserActionURLItem *v30;
  uint64_t v31;
  void *v32;
  _CNUIUserActionURLItem *v33;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a6;
  v15 = (objc_class *)MEMORY[0x1E0C97360];
  v16 = a4;
  v17 = a3;
  v18 = objc_alloc_init(v15);
  v19 = (void *)MEMORY[0x1E0C97338];
  objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "labeledValueWithLabel:value:", v17, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v35[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPhoneNumbers:", v22);

  v23 = (void *)MEMORY[0x1E0C97280];
  v24 = *MEMORY[0x1E0C967C0];
  objc_msgSend(v18, "phoneNumbers");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "firstObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "identifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v18, v24, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = [_CNUIUserActionURLItem alloc];
  v30 = v29;
  v31 = *MEMORY[0x1E0C96620];
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", v13);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[_CNUIUserActionURLItem initWithType:contactProperty:bundleIdentifier:url:group:options:](v30, "initWithType:contactProperty:bundleIdentifier:url:group:options:", v31, v28, v14, v32, a7, a8);

  }
  else
  {
    v33 = -[_CNUIUserActionURLItem initWithType:contactProperty:bundleIdentifier:url:group:options:](v29, "initWithType:contactProperty:bundleIdentifier:url:group:options:", *MEMORY[0x1E0C96620], v28, v14, 0, a7, a8);
  }

  return v33;
}

+ (id)videoItemWithLabel:(id)a3 targetStringValue:(id)a4 url:(id)a5 bundleIdentifier:(id)a6 group:(int64_t)a7 options:(unint64_t)a8
{
  id v13;
  id v14;
  objc_class *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _CNUIUserActionURLItem *v27;
  _CNUIUserActionURLItem *v28;
  uint64_t v29;
  void *v30;
  _CNUIUserActionURLItem *v31;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a6;
  v15 = (objc_class *)MEMORY[0x1E0C97360];
  v16 = a4;
  v17 = a3;
  v18 = objc_alloc_init(v15);
  objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", v17, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setEmailAddresses:", v20);

  v21 = (void *)MEMORY[0x1E0C97280];
  v22 = *MEMORY[0x1E0C966A8];
  objc_msgSend(v18, "emailAddresses");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v18, v22, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = [_CNUIUserActionURLItem alloc];
  v28 = v27;
  v29 = *MEMORY[0x1E0C96658];
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", v13);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[_CNUIUserActionURLItem initWithType:contactProperty:bundleIdentifier:url:group:options:](v28, "initWithType:contactProperty:bundleIdentifier:url:group:options:", v29, v26, v14, v30, a7, a8);

  }
  else
  {
    v31 = -[_CNUIUserActionURLItem initWithType:contactProperty:bundleIdentifier:url:group:options:](v27, "initWithType:contactProperty:bundleIdentifier:url:group:options:", *MEMORY[0x1E0C96658], v26, v14, 0, a7, a8);
  }

  return v31;
}

+ (id)voiceItemWithLabel:(id)a3 targetStringValue:(id)a4 url:(id)a5 bundleIdentifier:(id)a6 group:(int64_t)a7 options:(unint64_t)a8
{
  id v13;
  id v14;
  objc_class *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _CNUIUserActionURLItem *v29;
  _CNUIUserActionURLItem *v30;
  uint64_t v31;
  void *v32;
  _CNUIUserActionURLItem *v33;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a6;
  v15 = (objc_class *)MEMORY[0x1E0C97360];
  v16 = a4;
  v17 = a3;
  v18 = objc_alloc_init(v15);
  v19 = (void *)MEMORY[0x1E0C97338];
  objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "labeledValueWithLabel:value:", v17, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v35[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPhoneNumbers:", v22);

  v23 = (void *)MEMORY[0x1E0C97280];
  v24 = *MEMORY[0x1E0C967C0];
  objc_msgSend(v18, "phoneNumbers");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "firstObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "identifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v18, v24, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = [_CNUIUserActionURLItem alloc];
  v30 = v29;
  v31 = *MEMORY[0x1E0C965F8];
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", v13);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[_CNUIUserActionURLItem initWithType:contactProperty:bundleIdentifier:url:group:options:](v30, "initWithType:contactProperty:bundleIdentifier:url:group:options:", v31, v28, v14, v32, a7, a8);

  }
  else
  {
    v33 = -[_CNUIUserActionURLItem initWithType:contactProperty:bundleIdentifier:url:group:options:](v29, "initWithType:contactProperty:bundleIdentifier:url:group:options:", *MEMORY[0x1E0C965F8], v28, v14, 0, a7, a8);
  }

  return v33;
}

+ (id)ttyItemWithLabel:(id)a3 targetStringValue:(id)a4 url:(id)a5 bundleIdentifier:(id)a6
{
  id v9;
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _CNUIUserActionURLItem *v25;
  _CNUIUserActionURLItem *v26;
  uint64_t v27;
  void *v28;
  _CNUIUserActionURLItem *v29;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  v11 = (objc_class *)MEMORY[0x1E0C97360];
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v11);
  v15 = (void *)MEMORY[0x1E0C97338];
  objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "labeledValueWithLabel:value:", v13, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v31[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPhoneNumbers:", v18);

  v19 = (void *)MEMORY[0x1E0C97280];
  v20 = *MEMORY[0x1E0C967C0];
  objc_msgSend(v14, "phoneNumbers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v14, v20, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = [_CNUIUserActionURLItem alloc];
  v26 = v25;
  v27 = *MEMORY[0x1E0C96638];
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", v9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[_CNUIUserActionURLItem initWithType:contactProperty:bundleIdentifier:url:group:options:](v26, "initWithType:contactProperty:bundleIdentifier:url:group:options:", v27, v24, v10, v28, 4, 0);

  }
  else
  {
    v29 = -[_CNUIUserActionURLItem initWithType:contactProperty:bundleIdentifier:url:group:options:](v25, "initWithType:contactProperty:bundleIdentifier:url:group:options:", *MEMORY[0x1E0C96638], v24, v10, 0, 4, 0);
  }

  return v29;
}

+ (id)ttyRelayItemWithLabel:(id)a3 targetStringValue:(id)a4 url:(id)a5 bundleIdentifier:(id)a6
{
  id v9;
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _CNUIUserActionURLItem *v25;
  _CNUIUserActionURLItem *v26;
  uint64_t v27;
  void *v28;
  _CNUIUserActionURLItem *v29;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  v11 = (objc_class *)MEMORY[0x1E0C97360];
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v11);
  v15 = (void *)MEMORY[0x1E0C97338];
  objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "labeledValueWithLabel:value:", v13, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v31[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPhoneNumbers:", v18);

  v19 = (void *)MEMORY[0x1E0C97280];
  v20 = *MEMORY[0x1E0C967C0];
  objc_msgSend(v14, "phoneNumbers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v14, v20, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = [_CNUIUserActionURLItem alloc];
  v26 = v25;
  v27 = *MEMORY[0x1E0C96648];
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", v9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[_CNUIUserActionURLItem initWithType:contactProperty:bundleIdentifier:url:group:options:](v26, "initWithType:contactProperty:bundleIdentifier:url:group:options:", v27, v24, v10, v28, 4, 0);

  }
  else
  {
    v29 = -[_CNUIUserActionURLItem initWithType:contactProperty:bundleIdentifier:url:group:options:](v25, "initWithType:contactProperty:bundleIdentifier:url:group:options:", *MEMORY[0x1E0C96648], v24, v10, 0, 4, 0);
  }

  return v29;
}

- (id)url
{
  CNUIUserActionItem *v2;
  id v3;

  v2 = self;
  CNUnimplementedMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)itemWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 userActivity:(id)a6 isSuggested:(BOOL)a7 options:(unint64_t)a8
{
  uint64_t v11;
  unint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _CNUIUserActionUserActivityItem *v17;

  if (a7)
    v11 = 9;
  else
    v11 = 7;
  if (a7)
    v12 = a8 | 8;
  else
    v12 = a8;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[_CNUIUserActionUserActivityItem initWithType:contactProperty:bundleIdentifier:userActivity:group:options:]([_CNUIUserActionUserActivityItem alloc], "initWithType:contactProperty:bundleIdentifier:userActivity:group:options:", v16, v15, v14, v13, v11, v12);

  return v17;
}

+ (id)itemWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 userActivity:(id)a6 group:(int64_t)a7 options:(unint64_t)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  _CNUIUserActionUserActivityItem *v17;

  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[_CNUIUserActionUserActivityItem initWithType:contactProperty:bundleIdentifier:userActivity:group:options:]([_CNUIUserActionUserActivityItem alloc], "initWithType:contactProperty:bundleIdentifier:userActivity:group:options:", v16, v15, v14, v13, a7, a8);

  return v17;
}

+ (id)payItemWithLabel:(id)a3 targetStringValue:(id)a4 userActivity:(id)a5 bundleIdentifier:(id)a6
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _CNUIUserActionUserActivityItem *v23;
  _CNUIUserActionUserActivityItem *v24;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v9 = (objc_class *)MEMORY[0x1E0C97360];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v9);
  objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", v13, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEmailAddresses:", v16);

  v17 = (void *)MEMORY[0x1E0C97280];
  v18 = *MEMORY[0x1E0C966A8];
  objc_msgSend(v14, "emailAddresses");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v14, v18, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = [_CNUIUserActionUserActivityItem alloc];
  v24 = -[_CNUIUserActionUserActivityItem initWithType:contactProperty:bundleIdentifier:userActivity:group:options:](v23, "initWithType:contactProperty:bundleIdentifier:userActivity:group:options:", *MEMORY[0x1E0C96630], v22, v10, v11, 10, 0);

  return v24;
}

+ (id)emailItemWithLabel:(id)a3 targetStringValue:(id)a4 userActivity:(id)a5 bundleIdentifier:(id)a6
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _CNUIUserActionUserActivityItem *v23;
  _CNUIUserActionUserActivityItem *v24;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v9 = (objc_class *)MEMORY[0x1E0C97360];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v9);
  objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", v13, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEmailAddresses:", v16);

  v17 = (void *)MEMORY[0x1E0C97280];
  v18 = *MEMORY[0x1E0C966A8];
  objc_msgSend(v14, "emailAddresses");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v14, v18, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = [_CNUIUserActionUserActivityItem alloc];
  v24 = -[_CNUIUserActionUserActivityItem initWithType:contactProperty:bundleIdentifier:userActivity:group:options:](v23, "initWithType:contactProperty:bundleIdentifier:userActivity:group:options:", *MEMORY[0x1E0C96618], v22, v10, v11, 1, 0);

  return v24;
}

+ (id)textItemWithLabel:(id)a3 targetStringValue:(id)a4 userActivity:(id)a5 bundleIdentifier:(id)a6 group:(int64_t)a7 options:(unint64_t)a8
{
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _CNUIUserActionUserActivityItem *v27;
  _CNUIUserActionUserActivityItem *v28;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v13 = (objc_class *)MEMORY[0x1E0C97360];
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = objc_alloc_init(v13);
  objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", v17, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setEmailAddresses:", v20);

  v21 = (void *)MEMORY[0x1E0C97280];
  v22 = *MEMORY[0x1E0C966A8];
  objc_msgSend(v18, "emailAddresses");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v18, v22, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = [_CNUIUserActionUserActivityItem alloc];
  v28 = -[_CNUIUserActionUserActivityItem initWithType:contactProperty:bundleIdentifier:userActivity:group:options:](v27, "initWithType:contactProperty:bundleIdentifier:userActivity:group:options:", *MEMORY[0x1E0C96620], v26, v14, v15, a7, a8);

  return v28;
}

+ (id)videoItemWithLabel:(id)a3 targetStringValue:(id)a4 userActivity:(id)a5 bundleIdentifier:(id)a6 group:(int64_t)a7 options:(unint64_t)a8
{
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _CNUIUserActionUserActivityItem *v27;
  _CNUIUserActionUserActivityItem *v28;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v13 = (objc_class *)MEMORY[0x1E0C97360];
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = objc_alloc_init(v13);
  objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", v17, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setEmailAddresses:", v20);

  v21 = (void *)MEMORY[0x1E0C97280];
  v22 = *MEMORY[0x1E0C966A8];
  objc_msgSend(v18, "emailAddresses");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v18, v22, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = [_CNUIUserActionUserActivityItem alloc];
  v28 = -[_CNUIUserActionUserActivityItem initWithType:contactProperty:bundleIdentifier:userActivity:group:options:](v27, "initWithType:contactProperty:bundleIdentifier:userActivity:group:options:", *MEMORY[0x1E0C96658], v26, v14, v15, a7, a8);

  return v28;
}

+ (id)voiceItemWithLabel:(id)a3 targetStringValue:(id)a4 userActivity:(id)a5 bundleIdentifier:(id)a6 group:(int64_t)a7 options:(unint64_t)a8
{
  return (id)objc_msgSend(a1, "_voiceItemWithLabel:targetStringValue:propertyKey:userActivity:bundleIdentifier:group:options:", a3, a4, *MEMORY[0x1E0C967C0], a5, a6, a7, a8);
}

+ (id)voiceItemWithLabel:(id)a3 targetStringValue:(id)a4 propertyKey:(id)a5 userActivity:(id)a6 bundleIdentifier:(id)a7 group:(int64_t)a8 options:(unint64_t)a9
{
  return (id)objc_msgSend(a1, "_voiceItemWithLabel:targetStringValue:propertyKey:userActivity:bundleIdentifier:group:options:", a3, a4, a5, a6, a7, a8);
}

+ (id)_voiceItemWithLabel:(id)a3 targetStringValue:(id)a4 propertyKey:(id)a5 userActivity:(id)a6 bundleIdentifier:(id)a7 group:(int64_t)a8 options:(unint64_t)a9
{
  id v14;
  unint64_t v15;
  objc_class *v16;
  id v17;
  id v18;
  id v19;
  int64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _CNUIUserActionUserActivityItem *v32;
  _CNUIUserActionUserActivityItem *v33;
  id v35;
  id v36;
  void *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v14 = a4;
  v15 = (unint64_t)a5;
  v16 = (objc_class *)MEMORY[0x1E0C97360];
  v17 = a7;
  v18 = a6;
  v19 = objc_alloc_init(v16);
  if (v15 | *MEMORY[0x1E0C967C0] && !objc_msgSend((id)v15, "isEqual:"))
  {
    if (v15 | *MEMORY[0x1E0C966A8] && !objc_msgSend((id)v15, "isEqual:"))
    {
      v30 = 0;
      goto LABEL_8;
    }
    v20 = a8;
    objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", v35, v14, v35);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setEmailAddresses:", v27);

    objc_msgSend(v19, "emailAddresses");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = a8;
    v21 = (void *)MEMORY[0x1E0C97338];
    objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v14, v35);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "labeledValueWithLabel:value:", v35, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPhoneNumbers:", v24);

    objc_msgSend(v19, "phoneNumbers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28 = v25;
  objc_msgSend(v25, "firstObject");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "identifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  a8 = v20;
LABEL_8:
  objc_msgSend(MEMORY[0x1E0C97280], "contactPropertyWithContactNoCopy:propertyKey:identifier:", v19, v15, v30, v35);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = [_CNUIUserActionUserActivityItem alloc];
  v33 = -[_CNUIUserActionUserActivityItem initWithType:contactProperty:bundleIdentifier:userActivity:group:options:](v32, "initWithType:contactProperty:bundleIdentifier:userActivity:group:options:", *MEMORY[0x1E0C965F8], v31, v17, v18, a8, a9);

  return v33;
}

- (id)performActionWithContext:(id)a3
{
  id v4;
  CNUIUserActionItem *v5;
  id v6;

  v4 = a3;
  v5 = self;
  CNAbstractMethodException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (id)curateActionWithContext:(id)a3 withKeysToFetch:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "actionCurator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "curateUserAction:withKeysToFetch:", self, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)associateWithRecentContactMetadata:(id)a3
{
  NSDictionary *v4;
  NSDictionary *associatedRecentContactMetadata;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  associatedRecentContactMetadata = self->_associatedRecentContactMetadata;
  self->_associatedRecentContactMetadata = v4;

}

- (id)applicationNameForLabel
{
  cn_objectResultWithObjectLock();
  return (id)objc_claimAutoreleasedReturnValue();
}

id __45__CNUIUserActionItem_applicationNameForLabel__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
  {

    objc_msgSend((id)objc_opt_class(), "workspace");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "applicationForBundleIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedName");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 16);
    *(_QWORD *)(v7 + 16) = v6;

    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  }
  return v2;
}

+ (CNLSApplicationWorkspace)workspace
{
  return objc_alloc_init(CNLSApplicationWorkspace);
}

uint64_t __34__CNUIUserActionItem_targetHandle__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "username");
}

uint64_t __34__CNUIUserActionItem_targetHandle__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "username");
}

id __34__CNUIUserActionItem_targetHandle__block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = a2;
  objc_msgSend(v3, "street");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "city");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postalCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "country");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@, %@, %@ %@ %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)shouldCurateIfPerformed
{
  _BOOL8 v3;

  if ((-[CNUIUserActionItem options](self, "options") & 4) != 0)
    LOBYTE(v3) = 1;
  else
    return (-[CNUIUserActionItem options](self, "options") >> 3) & 1;
  return v3;
}

- (CNUIUserActionItem)initWithItem:(id)a3 contactProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  CNUIUserActionItem *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "group");
  v11 = objc_msgSend(v7, "options");

  v12 = -[CNUIUserActionItem initWithType:contactProperty:bundleIdentifier:group:options:](self, "initWithType:contactProperty:bundleIdentifier:group:options:", v8, v6, v9, v10, v11);
  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionItem type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("type"));

  -[CNUIUserActionItem label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("label"));

  -[CNUIUserActionItem targetHandle](self, "targetHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("targetHandle"));

  -[CNUIUserActionItem bundleIdentifier](self, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:withName:", v10, CFSTR("bundleIdentifier"));

  v12 = (id)objc_msgSend(v3, "appendName:integerValue:", CFSTR("group"), -[CNUIUserActionItem group](self, "group"));
  v13 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", CFSTR("options"), -[CNUIUserActionItem options](self, "options"));
  objc_msgSend(v3, "build");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  CNUIUserActionItem *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A40];
  v6 = objc_opt_class();
  v7 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __30__CNUIUserActionItem_isEqual___block_invoke;
  v25[3] = &unk_1EA603108;
  v25[4] = self;
  v26 = v4;
  v23[0] = v7;
  v23[1] = 3221225472;
  v23[2] = __30__CNUIUserActionItem_isEqual___block_invoke_2;
  v23[3] = &unk_1EA603108;
  v23[4] = self;
  v8 = v26;
  v24 = v8;
  v9 = (void *)MEMORY[0x1DF0D6388](v23);
  v21[0] = v7;
  v21[1] = 3221225472;
  v21[2] = __30__CNUIUserActionItem_isEqual___block_invoke_3;
  v21[3] = &unk_1EA603108;
  v21[4] = self;
  v10 = v8;
  v22 = v10;
  v11 = (void *)MEMORY[0x1DF0D6388](v21);
  v15 = v7;
  v16 = 3221225472;
  v17 = __30__CNUIUserActionItem_isEqual___block_invoke_4;
  v18 = &unk_1EA603108;
  v19 = self;
  v20 = v10;
  v12 = v10;
  v13 = (void *)MEMORY[0x1DF0D6388](&v15);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v12, v6, self, v25, v9, v11, v13, 0, v15, v16, v17, v18, v19);

  return (char)self;
}

uint64_t __30__CNUIUserActionItem_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __30__CNUIUserActionItem_isEqual___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __30__CNUIUserActionItem_isEqual___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "sanitizedTargetHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sanitizedTargetHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __30__CNUIUserActionItem_isEqual___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];

  v3 = (void *)MEMORY[0x1E0D13A78];
  v4 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __26__CNUIUserActionItem_hash__block_invoke;
  v13[3] = &unk_1EA603130;
  v13[4] = self;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __26__CNUIUserActionItem_hash__block_invoke_2;
  v12[3] = &unk_1EA603130;
  v12[4] = self;
  v5 = (void *)MEMORY[0x1DF0D6388](v12, a2);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __26__CNUIUserActionItem_hash__block_invoke_3;
  v11[3] = &unk_1EA603130;
  v11[4] = self;
  v6 = (void *)MEMORY[0x1DF0D6388](v11);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __26__CNUIUserActionItem_hash__block_invoke_4;
  v10[3] = &unk_1EA603130;
  v10[4] = self;
  v7 = (void *)MEMORY[0x1DF0D6388](v10);
  v8 = objc_msgSend(v3, "hashWithBlocks:", v13, v5, v6, v7, 0);

  return v8;
}

uint64_t __26__CNUIUserActionItem_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __26__CNUIUserActionItem_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __26__CNUIUserActionItem_hash__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "targetHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __26__CNUIUserActionItem_hash__block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (void)setTeamIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)associatedRecentContactMetadata
{
  return self->_associatedRecentContactMetadata;
}

+ (id)itemWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 dialRequest:(id)a6 isSuggested:(BOOL)a7 options:(unint64_t)a8
{
  uint64_t v11;
  unint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _CNUIUserActionDialRequestItem *v17;

  if (a7)
    v11 = 8;
  else
    v11 = 7;
  if (a7)
    v12 = a8 | 8;
  else
    v12 = a8;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[_CNUIUserActionDialRequestItem initWithType:contactProperty:bundleIdentifier:dialRequest:group:options:]([_CNUIUserActionDialRequestItem alloc], "initWithType:contactProperty:bundleIdentifier:dialRequest:group:options:", v16, v15, v14, v13, v11, v12);

  return v17;
}

+ (id)itemWithType:(id)a3 contactProperty:(id)a4 bundleIdentifier:(id)a5 dialRequest:(id)a6 group:(int64_t)a7 options:(unint64_t)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  _CNUIUserActionDialRequestItem *v17;

  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[_CNUIUserActionDialRequestItem initWithType:contactProperty:bundleIdentifier:dialRequest:group:options:]([_CNUIUserActionDialRequestItem alloc], "initWithType:contactProperty:bundleIdentifier:dialRequest:group:options:", v16, v15, v14, v13, a7, a8);

  return v17;
}

+ (id)videoItemWithLabel:(id)a3 targetStringValue:(id)a4 dialRequest:(id)a5 bundleIdentifier:(id)a6 group:(int64_t)a7 options:(unint64_t)a8
{
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _CNUIUserActionDialRequestItem *v27;
  _CNUIUserActionDialRequestItem *v28;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v13 = (objc_class *)MEMORY[0x1E0C97360];
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = objc_alloc_init(v13);
  objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", v17, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setEmailAddresses:", v20);

  v21 = (void *)MEMORY[0x1E0C97280];
  v22 = *MEMORY[0x1E0C966A8];
  objc_msgSend(v18, "emailAddresses");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v18, v22, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = [_CNUIUserActionDialRequestItem alloc];
  v28 = -[_CNUIUserActionDialRequestItem initWithType:contactProperty:bundleIdentifier:dialRequest:group:options:](v27, "initWithType:contactProperty:bundleIdentifier:dialRequest:group:options:", *MEMORY[0x1E0C96658], v26, v14, v15, a7, a8);

  return v28;
}

+ (id)voiceItemWithLabel:(id)a3 targetStringValue:(id)a4 dialRequest:(id)a5 bundleIdentifier:(id)a6 group:(int64_t)a7 options:(unint64_t)a8
{
  return (id)objc_msgSend(a1, "_voiceItemWithLabel:targetStringValue:propertyKey:dialRequest:bundleIdentifier:group:options:", a3, a4, *MEMORY[0x1E0C967C0], a5, a6, a7, a8);
}

+ (id)voiceItemWithLabel:(id)a3 targetStringValue:(id)a4 propertyKey:(id)a5 dialRequest:(id)a6 bundleIdentifier:(id)a7 group:(int64_t)a8 options:(unint64_t)a9
{
  return (id)objc_msgSend(a1, "_voiceItemWithLabel:targetStringValue:propertyKey:dialRequest:bundleIdentifier:group:options:", a3, a4, a5, a6, a7, a8);
}

+ (id)_voiceItemWithLabel:(id)a3 targetStringValue:(id)a4 propertyKey:(id)a5 dialRequest:(id)a6 bundleIdentifier:(id)a7 group:(int64_t)a8 options:(unint64_t)a9
{
  id v14;
  unint64_t v15;
  objc_class *v16;
  id v17;
  id v18;
  id v19;
  int64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _CNUIUserActionDialRequestItem *v32;
  _CNUIUserActionDialRequestItem *v33;
  id v35;
  id v36;
  void *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v14 = a4;
  v15 = (unint64_t)a5;
  v16 = (objc_class *)MEMORY[0x1E0C97360];
  v17 = a7;
  v18 = a6;
  v19 = objc_alloc_init(v16);
  if (v15 | *MEMORY[0x1E0C967C0] && !objc_msgSend((id)v15, "isEqual:"))
  {
    if (v15 | *MEMORY[0x1E0C966A8] && !objc_msgSend((id)v15, "isEqual:"))
    {
      v30 = 0;
      goto LABEL_8;
    }
    v20 = a8;
    objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", v35, v14, v35);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setEmailAddresses:", v27);

    objc_msgSend(v19, "emailAddresses");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = a8;
    v21 = (void *)MEMORY[0x1E0C97338];
    objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v14, v35);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "labeledValueWithLabel:value:", v35, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPhoneNumbers:", v24);

    objc_msgSend(v19, "phoneNumbers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28 = v25;
  objc_msgSend(v25, "firstObject");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "identifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  a8 = v20;
LABEL_8:
  objc_msgSend(MEMORY[0x1E0C97280], "contactPropertyWithContactNoCopy:propertyKey:identifier:", v19, v15, v30, v35);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = [_CNUIUserActionDialRequestItem alloc];
  v33 = -[_CNUIUserActionDialRequestItem initWithType:contactProperty:bundleIdentifier:dialRequest:group:options:](v32, "initWithType:contactProperty:bundleIdentifier:dialRequest:group:options:", *MEMORY[0x1E0C965F8], v31, v17, v18, a8, a9);

  return v33;
}

+ (id)actionItemForContactProperty:(id)a3 actionType:(id)a4 bundleIdentifier:(id)a5
{
  return +[CNUIUserActionItem actionItemForContactProperty:actionType:bundleIdentifier:callProviderManager:](CNUIUserActionItem, "actionItemForContactProperty:actionType:bundleIdentifier:callProviderManager:", a3, a4, a5, 0);
}

+ (id)actionItemForContactProperty:(id)a3 actionType:(id)a4 bundleIdentifier:(id)a5 callProviderManager:(id)a6
{
  id v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  CNHandle *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  id v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;

  v9 = a3;
  v10 = (unint64_t)a4;
  v11 = (unint64_t)a5;
  v12 = a6;
  objc_msgSend(v9, "key");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0C967C0];
  if (v13 | *MEMORY[0x1E0C967C0]
    && (v15 = (void *)v13,
        objc_msgSend(v9, "key"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "isEqual:", v14),
        v16,
        v15,
        !v17))
  {
    objc_msgSend(v9, "key");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = *MEMORY[0x1E0C966A8];
    if (v31 | *MEMORY[0x1E0C966A8])
    {
      v33 = (void *)v31;
      objc_msgSend(v9, "key");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "isEqual:", v32);

      if (!v35)
      {
        objc_msgSend(v9, "key");
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = *MEMORY[0x1E0C96868];
        if (!(v38 | *MEMORY[0x1E0C96868]))
          goto LABEL_28;
        v40 = (void *)v38;
        objc_msgSend(v9, "key");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "isEqual:", v39);

        if (v42)
          goto LABEL_28;
        objc_msgSend(v9, "key");
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = *MEMORY[0x1E0C96740];
        if (!(v43 | *MEMORY[0x1E0C96740]))
          goto LABEL_28;
        v45 = (void *)v43;
        objc_msgSend(v9, "key");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "isEqual:", v44);

        if (!v47)
        {
          v19 = 0;
          v20 = 0;
        }
        else
        {
LABEL_28:
          objc_msgSend(v9, "value");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "username");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "value");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "userIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
            goto LABEL_5;
        }
LABEL_29:
        v30 = 0;
        goto LABEL_30;
      }
    }
    objc_msgSend(v9, "value");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v9, "value");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "formattedStringValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v20 = 0;
  if (!v19)
    goto LABEL_29;
LABEL_5:
  objc_msgSend(v9, "key");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = +[CNHandle handleTypeForPropertyKey:](CNHandle, "handleTypeForPropertyKey:", v21);

  v23 = -[CNHandle initWithStringValue:customIdentifier:type:]([CNHandle alloc], "initWithStringValue:customIdentifier:type:", v19, v20, v22);
  v24 = *MEMORY[0x1E0C965F8];
  if (!(v10 | *MEMORY[0x1E0C965F8]) || objc_msgSend((id)v10, "isEqual:", *MEMORY[0x1E0C965F8]))
  {
    if (!(v11 | *MEMORY[0x1E0C965E8]) || objc_msgSend((id)v11, "isEqual:"))
    {
      v25 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v9, "contact");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_cnui_telephonyURLFutureWithHandle:contact:", v23, v26);
      v27 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (!(v11 | *MEMORY[0x1E0C965C0]) || objc_msgSend((id)v11, "isEqual:"))
    {
      v37 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v9, "contact");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "_cnui_faceTimeAudioURLFutureWithHandle:contact:", v23, v26);
      v27 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_31:
    +[CNUIUserActionItem thirdPartyCallActionItemForHandle:contactProperty:actionType:bundleIdentifier:callProviderManager:](CNUIUserActionItem, "thirdPartyCallActionItemForHandle:contactProperty:actionType:bundleIdentifier:callProviderManager:", v23, v9, v10, v11, v12);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v24 = *MEMORY[0x1E0C96658];
  if (!(v10 | *MEMORY[0x1E0C96658]) || objc_msgSend((id)v10, "isEqual:", *MEMORY[0x1E0C96658]))
  {
    if (!(v11 | *MEMORY[0x1E0C965C0]) || objc_msgSend((id)v11, "isEqual:"))
    {
      v36 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v9, "contact");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "_cnui_faceTimeVideoURLFutureWithHandle:contact:", v23, v26);
      v27 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    goto LABEL_31;
  }
  v24 = *MEMORY[0x1E0C96620];
  if (v10 | *MEMORY[0x1E0C96620] && !objc_msgSend((id)v10, "isEqual:", *MEMORY[0x1E0C96620]))
  {
    v24 = *MEMORY[0x1E0C96638];
    if (v10 | *MEMORY[0x1E0C96638] && !objc_msgSend((id)v10, "isEqual:", *MEMORY[0x1E0C96638]))
    {
      v24 = *MEMORY[0x1E0C96648];
      if (v10 | *MEMORY[0x1E0C96648] && !objc_msgSend((id)v10, "isEqual:", *MEMORY[0x1E0C96648]))
      {
        v24 = *MEMORY[0x1E0C96618];
        if (v10 | *MEMORY[0x1E0C96618] && !objc_msgSend((id)v10, "isEqual:", *MEMORY[0x1E0C96618]))
        {
          v30 = 0;
          goto LABEL_12;
        }
        v57 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v9, "contact");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "_cnui_mailURLFutureWithHandle:contact:", v23, v26);
        v27 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v54 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v9, "contact");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "_cnui_ttyRelayURLFutureWithHandle:contact:", v23, v26);
        v27 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v53 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v9, "contact");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "_cnui_ttyURLFutureWithHandle:contact:", v23, v26);
      v27 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (v11 | *MEMORY[0x1E0C965D8]
      && (objc_msgSend((id)v11, "isEqual:") & 1) == 0
      && v11 | *MEMORY[0x1E0C965E0]
      && !objc_msgSend((id)v11, "isEqual:"))
    {
      v55 = (void *)MEMORY[0x1E0CB3B10];
      objc_msgSend(v9, "contact");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "_cnui_sendMessageIntentWithHandle:contact:", v23, v56);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      +[CNUIUserActionItem itemWithType:contactProperty:bundleIdentifier:userActivity:group:options:](CNUIUserActionItem, "itemWithType:contactProperty:bundleIdentifier:userActivity:group:options:", v24, v9, v11, v28, 0, 0);
      v29 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    v52 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v9, "contact");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "_cnui_messagesURLFutureWithHandle:contact:", v23, v26);
    v27 = objc_claimAutoreleasedReturnValue();
  }
LABEL_10:
  v28 = (void *)v27;

  +[CNUIUserActionItem itemWithType:contactProperty:bundleIdentifier:url:group:options:](CNUIUserActionItem, "itemWithType:contactProperty:bundleIdentifier:url:group:options:", v24, v9, v11, v28, 0, 0);
  v29 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v30 = (void *)v29;

LABEL_12:
LABEL_30:
  v50 = v30;

  return v50;
}

+ (id)thirdPartyCallActionItemForHandle:(id)a3 contactProperty:(id)a4 actionType:(id)a5 bundleIdentifier:(id)a6 callProviderManager:(id)a7
{
  id v11;
  id v12;
  unint64_t v13;
  id v14;
  id v15;
  CNTUCallProviderManager *v16;
  CNTUCallProviderManager *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;

  v11 = a3;
  v12 = a4;
  v13 = (unint64_t)a5;
  v14 = a6;
  v15 = a7;
  if (v13 | *MEMORY[0x1E0C965F8]
    && (objc_msgSend((id)v13, "isEqual:") & 1) == 0
    && v13 | *MEMORY[0x1E0C96658]
    && !objc_msgSend((id)v13, "isEqual:"))
  {
    v23 = 0;
  }
  else
  {
    if (v15)
      v16 = (CNTUCallProviderManager *)v15;
    else
      v16 = objc_alloc_init(CNTUCallProviderManager);
    v17 = v16;
    -[CNTUCallProviderManager thirdPartyCallProviderWithBundleIdentifier:](v16, "thirdPartyCallProviderWithBundleIdentifier:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = *MEMORY[0x1E0C96658];
      v20 = v13 | *MEMORY[0x1E0C96658];
      objc_msgSend(v12, "contact");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        v22 = objc_msgSend((id)v13, "isEqual:", v19);
      else
        v22 = 1;
      objc_msgSend(v18, "dialRequestForHandle:contact:video:", v11, v21, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      +[CNUIUserActionItem itemWithType:contactProperty:bundleIdentifier:dialRequest:group:options:](CNUIUserActionItem, "itemWithType:contactProperty:bundleIdentifier:dialRequest:group:options:", v13, v12, v14, v24, 0, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = 0;
    }

  }
  return v23;
}

@end
