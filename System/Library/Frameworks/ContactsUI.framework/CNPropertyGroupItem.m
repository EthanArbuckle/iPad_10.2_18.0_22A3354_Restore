@implementation CNPropertyGroupItem

- (NSString)displayValue
{
  void *v3;
  void *v4;
  void *v5;

  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyGroupItem displayStringForValue:](self, "displayStringForValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)displayStringForValue:(id)a3
{
  return (id)objc_msgSend(a3, "description");
}

- (CNCardPropertyGroup)group
{
  return (CNCardPropertyGroup *)objc_loadWeakRetained((id *)&self->_group);
}

+ (CNPropertyGroupItem)propertyGroupItemWithLabeledValue:(id)a3 group:(id)a4 contact:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "propertyGroupItemWithLabeledValue:group:contact:environment:", v10, v9, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNPropertyGroupItem *)v12;
}

+ (CNPropertyGroupItem)propertyGroupItemWithLabeledValue:(id)a3 group:(id)a4 contact:(id)a5 environment:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v12, "property");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend((id)objc_msgSend(a1, "newPropertyGroupItemForProperty:", v14), "initWithLabeledValue:group:contact:environment:", v13, v12, v11, v10);

  return (CNPropertyGroupItem *)v15;
}

- (CNPropertyGroupItem)initWithLabeledValue:(id)a3 group:(id)a4 contact:(id)a5 environment:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  CNPropertyGroupItem *v16;
  void *v17;
  void *v18;
  CNLabeledValue *labeledValue;
  CNLabeledValue *v20;
  CNLabeledValue *originalLabeledValue;
  void *v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = -[CNPropertyGroupItem initWithGroup:](self, "initWithGroup:", v13);
  if (v16)
  {
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v16, CFSTR("CNPropertyGroupItem.m"), 124, 0);

      }
    }
    objc_storeStrong((id *)&v16->_labeledValue, a3);
    objc_msgSend(v13, "property");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)*MEMORY[0x1E0C96668];

    labeledValue = v16->_labeledValue;
    if (v17 == v18)
      v20 = (CNLabeledValue *)-[CNLabeledValue copy](labeledValue, "copy");
    else
      v20 = labeledValue;
    originalLabeledValue = v16->_originalLabeledValue;
    v16->_originalLabeledValue = v20;

    objc_storeStrong((id *)&v16->_contact, a5);
    objc_storeStrong((id *)&v16->_environment, a6);
  }

  return v16;
}

- (CNPropertyGroupItem)initWithGroup:(id)a3
{
  id v4;
  CNPropertyGroupItem *v5;
  CNPropertyGroupItem *v6;
  uint64_t v7;
  NSString *property;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNPropertyGroupItem;
  v5 = -[CNPropertyGroupItem init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_group, v4);
    objc_msgSend(v4, "property");
    v7 = objc_claimAutoreleasedReturnValue();
    property = v6->_property;
    v6->_property = (NSString *)v7;

  }
  return v6;
}

+ (id)newPropertyGroupItemForProperty:(id)a3
{
  return objc_alloc((Class)objc_msgSend(a1, "classForProperty:", a3));
}

- (BOOL)supportsLabel
{
  return 1;
}

+ (Class)classForProperty:(id)a3
{
  id v3;
  objc_class *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C967C0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C966A8]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96690]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("birthdays")) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96740]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C967F0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96868]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C968A0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96680]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96888]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96840]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C967B0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96800]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C966A0]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96668]) & 1) == 0)
  {
    objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96860]);
  }
  v4 = (objc_class *)(id)objc_opt_self();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CNPropertyGroupItem labeledValue](self, "labeledValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "labeledValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CNContactProperty)contactProperty
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C97280];
  -[CNPropertyGroupItem contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyGroupItem property](self, "property");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNContactProperty *)v8;
}

- (BOOL)isFavorite
{
  return -[CNPropertyGroupItem isFavoriteOfActionType:bundleIdentifier:](self, "isFavoriteOfActionType:bundleIdentifier:", 0, 0);
}

- (BOOL)isFavoriteOfActionType:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[CNCapabilitiesManager defaultCapabilitiesManager](CNCapabilitiesManager, "defaultCapabilitiesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "areFavoritesAvailable");

  if (!v9)
    goto LABEL_4;
  v10 = *MEMORY[0x1E0C967C0];
  v24[0] = *MEMORY[0x1E0C966A8];
  v24[1] = v10;
  v11 = *MEMORY[0x1E0C96740];
  v24[2] = *MEMORY[0x1E0C96868];
  v24[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyGroupItem property](self, "property");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "containsObject:", v13);

  if (v14)
  {
    -[CNPropertyGroupItem environment](self, "environment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "inProcessFavorites");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNPropertyGroupItem contact](self, "contact");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyGroupItem property](self, "property");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyGroupItem labeledValue](self, "labeledValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "entriesForContact:propertyKey:labeledValueIdentifier:actionType:bundleIdentifier:", v17, v18, v20, v6, v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count") != 0;

  }
  else
  {
LABEL_4:
    v22 = 0;
  }

  return v22;
}

- (NSString)property
{
  return self->_property;
}

- (CNUIContactsEnvironment)environment
{
  return self->_environment;
}

- (CNContact)contact
{
  return self->_contact;
}

- (BOOL)isSuggested
{
  void *v2;
  char v3;

  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSuggested");

  return v3;
}

- (CNLabeledValue)labeledValue
{
  return self->_labeledValue;
}

- (NSString)displayLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C97338];
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyGroupItem property](self, "property");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedDisplayStringForLabel:propertyName:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)allowsIMessage
{
  return self->_allowsIMessage;
}

- (BOOL)allowsEmail
{
  return self->_allowsEmail;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_originalLabeledValue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_property, 0);
  objc_destroyWeak((id *)&self->_group);
  objc_storeStrong((id *)&self->_labeledValue, 0);
}

- (void)setAllowsTTY:(BOOL)a3
{
  self->_allowsTTY = a3;
}

- (void)setAllowsPhone:(BOOL)a3
{
  self->_allowsPhone = a3;
}

- (void)setAllowsIMessage:(BOOL)a3
{
  self->_allowsIMessage = a3;
}

- (void)setAllowsEmail:(BOOL)a3
{
  self->_allowsEmail = a3;
}

- (BOOL)isEquivalentToItem:(id)a3 whenEditing:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  BOOL v7;

  v4 = a4;
  v6 = a3;
  v7 = (!v4 || !-[CNPropertyGroupItem isReadonly](self, "isReadonly") && (objc_msgSend(v6, "isReadonly") & 1) == 0)
    && -[CNPropertyGroupItem isEquivalentToItem:](self, "isEquivalentToItem:", v6);

  return v7;
}

- (BOOL)isReadonly
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (!-[CNPropertyGroupItem policyFlags](self, "policyFlags"))
  {
    -[CNPropertyGroupItem group](self, "group");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "policyForItem:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "isReadonly"))
      v5 = 2;
    else
      v5 = 1;
    -[CNPropertyGroupItem setPolicyFlags:](self, "setPolicyFlags:", v5);

  }
  return (-[CNPropertyGroupItem policyFlags](self, "policyFlags") >> 1) & 1;
}

- (unint64_t)policyFlags
{
  return self->_policyFlags;
}

- (void)setPolicyFlags:(unint64_t)a3
{
  self->_policyFlags = a3;
}

- (BOOL)isEquivalentToItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[CNPropertyGroupItem contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 0;
  }
  else
  {
    -[CNPropertyGroupItem normalizedValue](self, "normalizedValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "normalizedValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  return v9;
}

- (CNPropertyGroupItem)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNPropertyGroupItem.m"), 89, CFSTR("Use the factory method to create instances of this class."));

  return 0;
}

- (CNPropertyGroupItem)initWithLabel:(id)a3 group:(id)a4 contact:(id)a5 environment:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  CNPropertyGroupItem *v18;
  uint64_t v19;
  CNLabeledValue *originalLabeledValue;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  objc_msgSend((id)objc_opt_class(), "initialValueForLabel:group:", v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "property");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("birthdays"));

  if (v16)
    objc_msgSend(MEMORY[0x1E0C97338], "entryWithIdentifier:label:value:", v10, v10, v14);
  else
    objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", v10, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[CNPropertyGroupItem initWithLabeledValue:group:contact:environment:](self, "initWithLabeledValue:group:contact:environment:", v17, v11, v13, v12);

  if (v18)
  {
    objc_msgSend((id)objc_opt_class(), "emptyValueForLabel:", v10);
    v19 = objc_claimAutoreleasedReturnValue();
    originalLabeledValue = v18->_originalLabeledValue;
    v18->_originalLabeledValue = (CNLabeledValue *)v19;

  }
  return v18;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  const __CFString *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CNPropertyGroupItem property](self, "property");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CNPropertyGroupItem isReadonly](self, "isReadonly");
  v11 = &stru_1E20507A8;
  if (v10)
    v11 = CFSTR(", RO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> [%@] %@: %@ (contact%@)"), v4, self, v5, v7, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (int)anyContactLegacyIdentifier
{
  void *v2;
  void *v3;
  int v4;

  -[CNPropertyGroupItem contactProperty](self, "contactProperty");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "iOSLegacyIdentifier");

  return v4;
}

- (int)labeledValueMultiValueIdentifierForChosenSourceContact
{
  void *v2;
  int v3;

  -[CNPropertyGroupItem contactProperty](self, "contactProperty");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "multiValueIdentifier");

  return v3;
}

- (CNMutableContact)mutableContact
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[CNPropertyGroupItem contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CNPropertyGroupItem contact](self, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (CNMutableContact *)v5;
}

- (id)contactViewCache
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[CNPropertyGroupItem delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CNPropertyGroupItem delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contactViewCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)normalizedValue
{
  void *v2;
  void *v3;

  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)placeholderString
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C97200];
  -[CNPropertyGroupItem property](self, "property");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSArray)standardLabels
{
  void *v3;
  void *v4;

  -[CNPropertyGroupItem group](self, "group");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "labelsForItem:options:", self, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)extendedLabels
{
  void *v3;
  void *v4;

  -[CNPropertyGroupItem group](self, "group");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "labelsForItem:options:", self, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)promotedExtendedLabels
{
  void *v3;
  void *v4;

  -[CNPropertyGroupItem group](self, "group");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "labelsForItem:options:", self, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)valueForDisplayString:(id)a3
{
  return a3;
}

- (BOOL)isValidValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emptyValueForLabel:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNPropertyGroupItem displayStringForValue:](self, "displayStringForValue:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
      v10 = objc_msgSend(v4, "isEqual:", v8) ^ 1;
    else
      LOBYTE(v10) = 0;

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (id)replacementForInvalidValue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_opt_class();
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emptyValueForLabel:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEmpty
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (BOOL)shouldDisableLabelButton
{
  return 0;
}

- (BOOL)showValueWithLabelStyle
{
  return 0;
}

- (BOOL)canRemove
{
  return !-[CNPropertyGroupItem isReadonly](self, "isReadonly");
}

- (NSURL)defaultActionURL
{
  return 0;
}

- (BOOL)canReorder
{
  return 0;
}

- (id)bestValue:(id)a3
{
  CNPropertyGroupItem *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  CNPropertyGroupItem *v15;
  void *v16;
  void *v17;

  v4 = (CNPropertyGroupItem *)a3;
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[CNPropertyGroupItem labeledValue](v4, "labeledValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_9;
  }
  else
  {

  }
  -[CNPropertyGroupItem labeledValue](v4, "labeledValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "value");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[CNPropertyGroupItem labeledValue](self, "labeledValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v4;
    if (!v14)
      goto LABEL_10;
  }
  else
  {

  }
LABEL_9:
  v15 = self;
LABEL_10:
  -[CNPropertyGroupItem labeledValue](v15, "labeledValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "value");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)bestLabel:(id)a3
{
  CNPropertyGroupItem *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CNPropertyGroupItem *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v4 = (CNPropertyGroupItem *)a3;
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else
  {
    -[CNPropertyGroupItem labeledValue](v4, "labeledValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v4;
    if (v8)
      goto LABEL_7;
  }
  v10 = (void *)*MEMORY[0x1E0C97000];
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "compare:options:", v12, 1);

  if (v13)
    v9 = self;
  else
    v9 = v4;
LABEL_7:
  -[CNPropertyGroupItem labeledValue](v9, "labeledValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "label");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)mergeItem:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  if (!-[CNPropertyGroupItem isEquivalentToItem:whenEditing:](self, "isEquivalentToItem:whenEditing:")
    && !-[CNPropertyGroupItem isEquivalentToItem:whenEditing:](self, "isEquivalentToItem:whenEditing:", v16, 1))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNPropertyGroupItem.m"), 476, CFSTR("These two items can’t be merged"));

  }
  -[CNPropertyGroupItem bestValue:](self, "bestValue:", v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyGroupItem bestLabel:](self, "bestLabel:", v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v16, "labeledValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v10)
    {
      objc_msgSend(v16, "contact");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPropertyGroupItem setContact:](self, "setContact:", v11);

      objc_msgSend(v16, "labeledValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v13 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v13;
    }
  }
  objc_msgSend(MEMORY[0x1E0C97338], "entryWithIdentifier:label:value:", v8, v6, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyGroupItem setLabeledValue:](self, "setLabeledValue:", v14);

}

- (id)updateWithLabel:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CNPropertyGroupItem labeledValue](self, "labeledValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "labeledValueBySettingLabel:value:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CNPropertyGroupItem setLabeledValue:](self, "setLabeledValue:", v10);

  return v10;
}

- (void)updateLabeledValueWithValue:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v13;
  if (v5 != v13)
  {
    -[CNPropertyGroupItem delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[CNPropertyGroupItem delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "propertyItem:willChangeValue:", self, v13);

    }
    -[CNPropertyGroupItem labeledValue](self, "labeledValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyGroupItem updateWithLabel:value:](self, "updateWithLabel:value:", v11, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyGroupItem setLabeledValue:](self, "setLabeledValue:", v12);

    v6 = v13;
  }

}

- (void)updateLabeledValueWithLabel:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v9)
  {
    -[CNPropertyGroupItem labeledValue](self, "labeledValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyGroupItem updateWithLabel:value:](self, "updateWithLabel:value:", v9, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyGroupItem setLabeledValue:](self, "setLabeledValue:", v8);

  }
}

- (BOOL)isValidIdentifier:(id)a3
{
  void *v4;
  char v5;

  if (a3)
    return 1;
  -[CNPropertyGroupItem property](self, "property");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C96680]);

  return v5;
}

- (BOOL)modified
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || (-[CNPropertyGroupItem originalLabeledValue](self, "originalLabeledValue"),
        (v2 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CNPropertyGroupItem labeledValue](self, "labeledValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyGroupItem originalLabeledValue](self, "originalLabeledValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "isEqual:", v6);

    if (v5)
    {

      if (!v7)
        return v7 ^ 1;
    }
    else
    {

      if ((v7 & 1) == 0)
      {
        LOBYTE(v7) = 0;
        return v7 ^ 1;
      }
    }
  }
  -[CNPropertyGroupItem property](self, "property");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C967C0]);

  if (v9)
  {
    -[CNPropertyGroupItem labeledValue](self, "labeledValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNPropertyGroupItem originalLabeledValue](self, "originalLabeledValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 || (objc_msgSend(v13, "stringValue"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v11, "stringValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = objc_msgSend(v15, "isEqual:", v16);

      if (v14)
      {
LABEL_16:

        return v7 ^ 1;
      }
    }
    else
    {
      LOBYTE(v7) = 1;
    }

    goto LABEL_16;
  }
  LOBYTE(v7) = 1;
  return v7 ^ 1;
}

- (void)_removeSuggestion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emptyValueForLabel:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyGroupItem updateLabeledValueWithValue:](self, "updateLabeledValueWithValue:", v6);

  -[CNPropertyGroupItem saveChangesImmediately:](self, "saveChangesImmediately:", 0);
}

- (id)labeledValueToCurateFromSuggestion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C97338];
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "labeledValueWithLabel:value:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)confirmSuggestion
{
  id v3;

  -[CNPropertyGroupItem labeledValueToCurateFromSuggestion](self, "labeledValueToCurateFromSuggestion");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CNPropertyGroupItem _removeSuggestion](self, "_removeSuggestion");
  -[CNPropertyGroupItem setLabeledValue:](self, "setLabeledValue:", v3);
  -[CNPropertyGroupItem saveChangesImmediately:](self, "saveChangesImmediately:", 1);

}

- (void)saveChangesImmediately:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  char v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _BOOL4 v60;
  _BOOL4 v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  void *v73;
  uint8_t buf[4];
  id v75;
  __int16 v76;
  void *v77;
  _BYTE v78[128];
  uint64_t v79;

  v3 = a3;
  v79 = *MEMORY[0x1E0C80C00];
  if (-[CNPropertyGroupItem modified](self, "modified"))
  {
    -[CNPropertyGroupItem mutableContact](self, "mutableContact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[CNPropertyGroupItem labeledValue](self, "labeledValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPropertyGroupItem contactViewCache](self, "contactViewCache");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "policyForContact:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v9, "isReadonly") & 1) == 0)
      {
        objc_msgSend(v6, "value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[CNPropertyGroupItem isValidValue:](self, "isValidValue:", v10);

        -[CNPropertyGroupItem property](self, "property");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v10) = +[CNContactView isMultiValueProperty:](CNContactView, "isMultiValueProperty:", v12);

        if ((_DWORD)v10)
        {
          v60 = v11;
          v61 = v3;
          v65 = v6;
          v67 = v9;
          -[CNPropertyGroupItem property](self, "property");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v5;
          objc_msgSend(v5, "valueForKey:", v13);
          v14 = objc_claimAutoreleasedReturnValue();

          v63 = (void *)v14;
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v14);
          v69 = 0u;
          v70 = 0u;
          v71 = 0u;
          v72 = 0u;
          v15 = (id)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
          if (v16)
          {
            v17 = v16;
            v18 = 0;
            v19 = *(_QWORD *)v70;
            while (2)
            {
              v20 = 0;
              v64 = v18 + v17;
              do
              {
                if (*(_QWORD *)v70 != v19)
                  objc_enumerationMutation(v15);
                v21 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v20);
                objc_msgSend(v21, "identifier");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v22, "isEqualToString:", v7) & 1) != 0)
                {
                  objc_msgSend(v21, "identifier");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = -[CNPropertyGroupItem isValidIdentifier:](self, "isValidIdentifier:", v23);

                  if (v24)
                  {
                    if (v60)
                    {
                      v6 = v65;
                      objc_msgSend(v15, "setObject:atIndexedSubscript:", v65, v18 + v20);

                      v5 = v62;
                    }
                    else
                    {
                      objc_msgSend(v15, "removeObjectAtIndex:", v18 + v20);

                      -[CNPropertyGroupItem environment](self, "environment");
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v31, "recentsManager");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();

                      v33 = (void *)MEMORY[0x1E0C97280];
                      -[CNPropertyGroupItem contact](self, "contact");
                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                      -[CNPropertyGroupItem property](self, "property");
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      -[CNPropertyGroupItem originalLabeledValue](self, "originalLabeledValue");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v36, "identifier");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v33, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v34, v35, v37);
                      v38 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend((id)objc_opt_class(), "deleteCoreRecentsEntriesMatchingProperty:recentsManager:", v38, v32);
                      v5 = v62;
                      v6 = v65;
                    }
                    v3 = v61;
                    goto LABEL_29;
                  }
                }
                else
                {

                }
                ++v20;
              }
              while (v17 != v20);
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
              v18 = v64;
              if (v17)
                continue;
              break;
            }
          }

          v5 = v62;
          v6 = v65;
          v3 = v61;
          if (v60)
            objc_msgSend(v15, "addObject:", v65);
LABEL_29:
          CNUILogContactCard();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            -[CNPropertyGroupItem property](self, "property");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v75 = v40;
            v76 = 2050;
            v77 = v5;
            _os_log_impl(&dword_18AC56000, v39, OS_LOG_TYPE_DEFAULT, "[CNPropertyGroupItem] updating contact value (multivalue) for property %{public}@, contact %{public}p", buf, 0x16u);

          }
          -[CNPropertyGroupItem property](self, "property");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setValue:forKey:", v15, v41);

          v9 = v67;
          v28 = v63;
        }
        else
        {
          CNUILogContactCard();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
          if (v11)
          {
            if (v26)
            {
              -[CNPropertyGroupItem property](self, "property");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v75 = v27;
              v76 = 2050;
              v77 = v5;
              _os_log_impl(&dword_18AC56000, v25, OS_LOG_TYPE_DEFAULT, "[CNPropertyGroupItem] updating contact value for property %{public}@, contact %{public}p", buf, 0x16u);

            }
            objc_msgSend(v6, "value");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNPropertyGroupItem property](self, "property");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setValue:forKey:", v28, v29);

          }
          else
          {
            if (v26)
            {
              -[CNPropertyGroupItem property](self, "property");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v75 = v30;
              v76 = 2050;
              v77 = v5;
              _os_log_impl(&dword_18AC56000, v25, OS_LOG_TYPE_DEFAULT, "[CNPropertyGroupItem] updating contact value for property %{public}@, contact %{public}p to nil", buf, 0x16u);

            }
            -[CNPropertyGroupItem property](self, "property");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setValue:forKey:", 0, v28);
          }
        }

      }
      -[CNPropertyGroupItem contactViewCache](self, "contactViewCache");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "contactStore");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3 && v43)
      {
        if (-[CNPropertyGroupItem shouldCreateNewMeContactToSaveChangesTo](self, "shouldCreateNewMeContactToSaveChangesTo"))
        {
          v66 = v6;
          v68 = v9;
          -[CNPropertyGroupItem contact](self, "contact");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          +[CNDonatedMeCardPersistenceHelper defaultKeysForValuesToPersist](CNDonatedMeCardPersistenceHelper, "defaultKeysForValuesToPersist");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = +[CNDonatedMeCardPersistenceHelper mutableCopyOfContact:byCopyingValuesForKeysOnly:](CNDonatedMeCardPersistenceHelper, "mutableCopyOfContact:byCopyingValuesForKeysOnly:", v44, v45);

          CNUILogContactCard();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134349056;
            v75 = v46;
            _os_log_impl(&dword_18AC56000, v47, OS_LOG_TYPE_DEFAULT, "[CNPropertyGroupItem] creating new me contact %{public}p", buf, 0xCu);
          }

          -[CNPropertyGroupItem property](self, "property");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "isEqualToString:", *MEMORY[0x1E0C967B0]);
          -[CNPropertyGroupItem labeledValue](self, "labeledValue");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v50;
          if ((v49 & 1) != 0)
          {
            objc_msgSend(v50, "value");
          }
          else
          {
            v73 = v50;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
          }
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C971A0], "contactPropertiesByKey");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNPropertyGroupItem property](self, "property");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "objectForKeyedSubscript:", v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "setCNValue:onContact:", v56, v46);

          +[CNDonatedMeCardPersistenceHelper createNewMeContact:inStore:](CNDonatedMeCardPersistenceHelper, "createNewMeContact:inStore:", v46, v43);
          v6 = v66;
          v9 = v68;
        }
        else
        {
          CNUILogContactCard();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134349056;
            v75 = v5;
            _os_log_impl(&dword_18AC56000, v52, OS_LOG_TYPE_DEFAULT, "[CNPropertyGroupItem] saving contact %{public}p", buf, 0xCu);
          }

          -[CNPropertyGroupItem delegate](self, "delegate");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_opt_respondsToSelector();

          if ((v54 & 1) != 0)
          {
            v46 = objc_alloc_init(MEMORY[0x1E0C973D0]);
            -[CNPropertyGroupItem delegate](self, "delegate");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "setIgnoresGuardianRestrictions:", objc_msgSend(v55, "propertyItemCanIgnoreGuardianRestrictions"));

          }
          else
          {
            v46 = 0;
          }
          objc_msgSend(v5, "saveContactInStore:group:container:request:", v43, 0, 0, v46);
        }

      }
    }

  }
}

- (BOOL)shouldCreateNewMeContactToSaveChangesTo
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;

  if (!-[CNPropertyGroupItem modified](self, "modified"))
    return 0;
  -[CNPropertyGroupItem mutableContact](self, "mutableContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isSuggestedMe"))
  {
    v4 = *MEMORY[0x1E0D137F8];
    -[CNPropertyGroupItem mutableContact](self, "mutableContact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "linkedContacts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setLabeledValue:(id)a3
{
  objc_storeStrong((id *)&self->_labeledValue, a3);
}

- (void)setProperty:(id)a3
{
  objc_storeStrong((id *)&self->_property, a3);
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (CNPropertyGroupItemDelegate)delegate
{
  return (CNPropertyGroupItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)allowsPhone
{
  return self->_allowsPhone;
}

- (BOOL)allowsTTY
{
  return self->_allowsTTY;
}

- (CNLabeledValue)originalLabeledValue
{
  return self->_originalLabeledValue;
}

- (void)setOriginalLabeledValue:(id)a3
{
  objc_storeStrong((id *)&self->_originalLabeledValue, a3);
}

+ (id)emptyValueForLabel:(id)a3
{
  return &stru_1E20507A8;
}

+ (CNPropertyGroupItem)propertyGroupItemWithLabel:(id)a3 group:(id)a4 contact:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "propertyGroupItemWithLabel:group:contact:environment:", v10, v9, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNPropertyGroupItem *)v12;
}

+ (CNPropertyGroupItem)propertyGroupItemWithLabel:(id)a3 group:(id)a4 contact:(id)a5 environment:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v12, "property");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend((id)objc_msgSend(a1, "newPropertyGroupItemForProperty:", v14), "initWithLabel:group:contact:environment:", v13, v12, v11, v10);

  return (CNPropertyGroupItem *)v15;
}

+ (void)deleteCoreRecentsEntriesMatchingProperty:(id)a3 recentsManager:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v13[0] = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recentContactsMatchingContactProperties:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__CNPropertyGroupItem_deleteCoreRecentsEntriesMatchingProperty_recentsManager___block_invoke;
  v11[3] = &unk_1E204BDA8;
  v12 = v5;
  v10 = v5;
  objc_msgSend(v9, "addSuccessBlock:", v11);

}

uint64_t __79__CNPropertyGroupItem_deleteCoreRecentsEntriesMatchingProperty_recentsManager___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeRecents:completionHandler:", a2, 0);
}

@end
