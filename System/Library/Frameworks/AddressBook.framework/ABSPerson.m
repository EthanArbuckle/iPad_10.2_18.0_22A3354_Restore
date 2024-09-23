@implementation ABSPerson

+ (void)initialize
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___ABSPerson;
  objc_msgSendSuper2(&v2, sel_initialize);
  +[ABSAddressBook ABInitialize](ABSAddressBook, "ABInitialize");
}

+ (id)defaultKeysToFetch
{
  if (defaultKeysToFetch_cn_once_token_1 != -1)
    dispatch_once(&defaultKeysToFetch_cn_once_token_1, &__block_literal_global);
  return (id)defaultKeysToFetch_cn_once_object_1;
}

void __31__ABSPerson_defaultKeysToFetch__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[10];

  v7[9] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDBA2C0];
  v7[0] = *MEMORY[0x24BDBA2C8];
  v7[1] = v0;
  v1 = *MEMORY[0x24BDBA340];
  v7[2] = *MEMORY[0x24BDBA310];
  v7[3] = v1;
  v2 = *MEMORY[0x24BDBA328];
  v7[4] = *MEMORY[0x24BDBA3F0];
  v7[5] = v2;
  v3 = *MEMORY[0x24BDBA320];
  v7[6] = *MEMORY[0x24BDBA318];
  v7[7] = v3;
  v7[8] = *MEMORY[0x24BDBA2D8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "copy");
  v6 = (void *)defaultKeysToFetch_cn_once_object_1;
  defaultKeysToFetch_cn_once_object_1 = v5;

}

+ (unsigned)typeForProperty:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x24BDBAC70], "contactPropertiesByABSPropertyID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "absPropertyType");

  return v7;
}

+ (id)localizedNameForProperty:(int)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "nameForProperty:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", v3, &stru_24C2F52F8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)nameForProperty:(int)a3
{
  switch(a3)
  {
    case 20:
      return CFSTR("Prefix");
    case 0:
      return CFSTR("First");
    case 6:
      return CFSTR("Middle");
    case 1:
      return CFSTR("Last");
    case 21:
      return CFSTR("Suffix");
    case 19:
      return CFSTR("Nickname");
    case 7:
      return CFSTR("FirstPhonetic");
    case 8:
      return CFSTR("MiddlePhonetic");
    case 9:
      return CFSTR("LastPhonetic");
    case 10:
      return CFSTR("Organization");
    case 11:
      return CFSTR("Department");
    case 18:
      return CFSTR("JobTitle");
    case 17:
      return CFSTR("Birthday");
    case 14:
      return CFSTR("Note");
    case 3:
      return CFSTR("Phone");
    case 4:
      return CFSTR("Email");
    case 22:
      return CFSTR("URLs");
    case 12:
      return CFSTR("Date");
    case 13:
      return CFSTR("IM");
    case 46:
      return CFSTR("SocialProfile");
    case 5:
      return CFSTR("Address");
    case 23:
      return CFSTR("RelatedNames");
  }
  return CFSTR("UNKNOWN_PROPERTY");
}

+ (unsigned)compositeNameFormat
{
  return objc_msgSend(a1, "compositeNameFormatForPerson:", 0);
}

+ (unsigned)compositeNameFormatForPerson:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBACC0], "descriptorForRequiredKeysForNameOrder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "completeCNImplIfNeededWithKeysToFetch:", v5);

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDBACC0];
    objc_msgSend(v3, "cnImpl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "nameOrderForContact:", v8);

    +[ABSConstantsMapping CNToABCompositeNameFormatConstantsMapping](ABSConstantsMapping, "CNToABCompositeNameFormatConstantsMapping");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mappedConstant:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "intValue");

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (void)setCompositeNameFormat:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  +[ABSConstantsMapping ABtoCNContactDisplayNameOrderConstantsMapping](ABSConstantsMapping, "ABtoCNContactDisplayNameOrderConstantsMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mappedConstant:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (int)objc_msgSend(v6, "intValue");

  objc_msgSend(MEMORY[0x24BDBAD10], "sharedDefaults");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDisplayNameOrder:", v7);

}

+ (id)copyCompositeNameDelimiterForPerson:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBACC0], "descriptorForRequiredKeysForStyle:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "completeCNImplIfNeededWithKeysToFetch:", v5);

    v7 = 0;
    if (v6)
    {
      v8 = (void *)MEMORY[0x24BDBACC0];
      objc_msgSend(v3, "cnImpl");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "delimiterForContact:", v9);
      v7 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = CFSTR(" ");
  }

  return (id)v7;
}

+ (unsigned)sortOrdering
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;

  objc_msgSend(MEMORY[0x24BDBAD10], "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sortOrder");

  +[ABSConstantsMapping CNToABPersonSortOrderingConstantsMapping](ABSConstantsMapping, "CNToABPersonSortOrderingConstantsMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mappedConstant:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  return v7;
}

+ (BOOL)shortNameFormatEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBAD10], "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isShortNameFormatEnabled");

  return v3;
}

+ (BOOL)shortNameFormatPrefersNicknames
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBAD10], "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shortNameFormatPrefersNicknames");

  return v3;
}

+ (id)vCardRepresentationForPeople:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[3];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBAD08], "descriptorForRequiredKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v12, "completeCNImplIfNeededWithKeysToFetch:", v5))
        {
          objc_msgSend(v12, "cnImpl");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = (void *)MEMORY[0x24BDBACA0];
          objc_msgSend(v12, "cnImpl");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "makeContactAndMergeValuesFromAvailableKeysInContact:", v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v6, "addObject:", v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  v20 = 0;
  objc_msgSend(MEMORY[0x24BDBAD08], "dataWithContacts:error:", v6, &v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v20;
  v18 = v17;
  if (!v16)
    NSLog(CFSTR("Error creating vCard data: %@"), v17);

  return v16;
}

+ (id)createPeopleInSource:(id)a3 withVCardRepresentation:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v15 = 0;
  objc_msgSend(MEMORY[0x24BDBAD08], "contactsWithData:error:", a4, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  v9 = v8;
  if (v7)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __58__ABSPerson_createPeopleInSource_withVCardRepresentation___block_invoke;
    v12[3] = &unk_24C2F4758;
    v14 = a1;
    v13 = v6;
    objc_msgSend(v7, "_cn_map:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    NSLog(CFSTR("Error deserializing vCard: %@"), v8);
    v10 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v10;
}

id __58__ABSPerson_createPeopleInSource_withVCardRepresentation___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  v4 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithMutableContact:source:", v3, *(_QWORD *)(a1 + 32));

  return v4;
}

- (ABSPerson)init
{
  return -[ABSPerson initWithMutableContact:source:](self, "initWithMutableContact:source:", 0, 0);
}

- (ABSPerson)initWithMutableContact:(id)a3
{
  return -[ABSPerson initWithMutableContact:source:](self, "initWithMutableContact:source:", a3, 0);
}

- (ABSPerson)initWithSource:(id)a3
{
  return -[ABSPerson initWithMutableContact:source:](self, "initWithMutableContact:source:", 0, a3);
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE19248], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABSPerson compositeName](self, "compositeName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("name"), v4);

  v6 = (id)objc_msgSend(v3, "appendName:intValue:", CFSTR("iOSLegacyIdentifier"), -[ABSPerson id](self, "id"));
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (ABSPerson)initWithMutableContact:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  ABSPerson *v8;
  uint64_t v9;
  NSMutableSet *nonNilSetProperties;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ABSPerson;
  v8 = -[ABSPerson init](&v12, sel_init);
  if (v8)
  {
    if (!v6)
    {
      v6 = objc_alloc_init(MEMORY[0x24BDBAD50]);
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v9 = objc_claimAutoreleasedReturnValue();
      nonNilSetProperties = v8->_nonNilSetProperties;
      v8->_nonNilSetProperties = (NSMutableSet *)v9;

    }
    objc_storeStrong((id *)&v8->_cnImpl, v6);
    objc_storeWeak((id *)&v8->_source, v7);
  }

  return v8;
}

- (CNMutableContact)cnImpl
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_cnImpl)
  {
    -[ABSPerson revertedRecordIdentifier](self, "revertedRecordIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[ABSPerson addressBook](self, "addressBook");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[ABSPerson revertedRecordIdentifier](self, "revertedRecordIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(v4, "peopleWithCNIdentifiers:", v6);

    }
  }
  return self->_cnImpl;
}

- (BOOL)completeCNImplIfNeededWithKeysToFetch:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  -[ABSPerson cnImpl](self, "cnImpl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "areKeysAvailable:", v4);

  if ((v6 & 1) == 0)
  {
    -[ABSPerson addressBook](self, "addressBook");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      NSLog(CFSTR("Record doesn't belong to an address book, can't fault in missing values…"));
      v9 = 0;
      goto LABEL_6;
    }
    -[ABSPerson addressBook](self, "addressBook");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "completePerson:withKeysToFetch:", self, v4);

  }
  v9 = 1;
LABEL_6:

  return v9;
}

- (int)id
{
  void *v2;
  int v3;

  -[ABSPerson cnImpl](self, "cnImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "iOSLegacyIdentifier");

  if (v3)
    return v3;
  else
    return -1;
}

- (ABSSource)source
{
  ABSSource **p_source;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;

  p_source = &self->_source;
  WeakRetained = objc_loadWeakRetained((id *)&self->_source);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_source);
    if (!v5)
    {
LABEL_6:
      -[ABSPerson addressBook](self, "addressBook");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "defaultSource");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_storeWeak((id *)p_source, v5);
    }
  }
  else
  {
    if (-[ABSPerson id](self, "id") == -1)
      goto LABEL_6;
    -[ABSPerson addressBook](self, "addressBook");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sourceForRecord:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeWeak((id *)p_source, v5);
    if (!v5)
      goto LABEL_6;
  }
  return (ABSSource *)v5;
}

- (NSString)CNIdentifierString
{
  void *v2;
  void *v3;

  -[ABSPerson cnImpl](self, "cnImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unsigned)type
{
  return 0;
}

- (NSString)compositeName
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBACC0], "descriptorForRequiredKeysForStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ABSPerson completeCNImplIfNeededWithKeysToFetch:](self, "completeCNImplIfNeededWithKeysToFetch:", v4);

  v6 = 0;
  if (v5)
  {
    v7 = (void *)MEMORY[0x24BDBACC0];
    -[ABSPerson cnImpl](self, "cnImpl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromContact:style:", v8, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (id)compositeNameIgnoringOrganization:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBACC0]);
  objc_msgSend(v5, "setStyle:", 0);
  objc_msgSend(v5, "setIgnoresOrganization:", v3);
  -[ABSPerson stringFromFormatter:](self, "stringFromFormatter:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)shortName
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BDBACC0]);
  objc_msgSend(v3, "setStyle:", 1000);
  -[ABSPerson stringFromFormatter:](self, "stringFromFormatter:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)stringFromFormatter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "descriptorForRequiredKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ABSPerson completeCNImplIfNeededWithKeysToFetch:](self, "completeCNImplIfNeededWithKeysToFetch:", v6);

  if (v7)
  {
    -[ABSPerson cnImpl](self, "cnImpl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromContact:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)copyValueForProperty:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  CFTypeRef v22;
  _QWORD v24[2];

  v3 = *(_QWORD *)&a3;
  v24[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBAC70], "contactPropertiesByABSPropertyID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_13;
  objc_msgSend(v7, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ABSPerson completeCNImplIfNeededWithKeysToFetch:](self, "completeCNImplIfNeededWithKeysToFetch:", v9);

  if (!v10)
    goto LABEL_13;
  -[ABSPerson cnImpl](self, "cnImpl");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "key");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isKeyAvailable:", v12);

  if (v13)
  {
    -[ABSPerson cnImpl](self, "cnImpl");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CNValueForContact:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v15, "count"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v15, "length"))
        goto LABEL_10;
    }
    -[ABSPerson nonNilSetProperties](self, "nonNilSetProperties");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
      goto LABEL_10;
    v17 = (void *)v16;
    -[ABSPerson nonNilSetProperties](self, "nonNilSetProperties");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "containsObject:", v19);

    if (!v20)
    {
      v22 = 0;
    }
    else
    {
LABEL_10:
      v21 = (void *)objc_msgSend(v15, "copy");
      v22 = (CFTypeRef)objc_msgSend(v7, "ABSValueFromCNValue:", v21);

      if (v22)
        v22 = CFRetain(v22);
    }

  }
  else
  {
LABEL_13:
    v22 = 0;
  }

  return (void *)v22;
}

- (BOOL)setValue:(void *)a3 forProperty:(int)a4 withError:(__CFError *)a5
{
  uint64_t v6;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  id v28;
  _QWORD v29[2];

  v6 = *(_QWORD *)&a4;
  v29[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBAC70], "contactPropertiesByABSPropertyID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[ABSPerson nonNilSetProperties](self, "nonNilSetProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3 && v12)
    {
      -[ABSPerson nonNilSetProperties](self, "nonNilSetProperties");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v14);

    }
    v28 = 0;
    v15 = objc_msgSend(v11, "convertABSValue:toCNValue:error:", a3, &v28, a5);
    v16 = v28;
    if (v15)
    {
      objc_msgSend(v11, "key");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[ABSPerson completeCNImplIfNeededWithKeysToFetch:](self, "completeCNImplIfNeededWithKeysToFetch:", v18);

      if (v19)
      {
        -[ABSPerson cnImpl](self, "cnImpl");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "key");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "isKeyAvailable:", v21);

        if (v22)
        {
          v23 = (void *)objc_msgSend(v16, "copy");
          -[ABSPerson cnImpl](self, "cnImpl");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setCNValue:onContact:", v23, v24);

          -[ABSPerson addressBook](self, "addressBook");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "recordUpdated:", self);

          v26 = 1;
LABEL_13:

          goto LABEL_14;
        }
      }
      else if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ABSAddressBookErrorDomain"), 1, 0);
        v26 = 0;
        *a5 = (__CFError *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    v26 = 0;
    goto LABEL_13;
  }
  v26 = 1;
LABEL_14:

  return v26;
}

- (BOOL)removeProperty:(int)a3 withError:(id *)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  _QWORD v21[2];

  v5 = *(_QWORD *)&a3;
  v21[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBAC70], "contactPropertiesByABSPropertyID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_7;
  objc_msgSend(v9, "key");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ABSPerson completeCNImplIfNeededWithKeysToFetch:](self, "completeCNImplIfNeededWithKeysToFetch:", v11);

  if (!v12)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ABSAddressBookErrorDomain"), 1, 0);
      v19 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    v19 = 0;
    goto LABEL_8;
  }
  -[ABSPerson cnImpl](self, "cnImpl");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "key");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isKeyAvailable:", v14);

  if (!v15)
    goto LABEL_7;
  objc_msgSend(v9, "nilValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABSPerson cnImpl](self, "cnImpl");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCNValue:onContact:", v16, v17);

  -[ABSPerson addressBook](self, "addressBook");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "recordUpdated:", self);

  v19 = 1;
LABEL_8:

  return v19;
}

- (id)linkedPeople
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[ABSPerson addressBook](self, "addressBook");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "peopleLinkedToPerson:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*(unsigned int (**)(void))(*MEMORY[0x24BE191C0] + 16))())
  {
    v7[0] = self;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  return v4;
}

- (unsigned)compositeNameFormat
{
  return objc_msgSend((id)objc_opt_class(), "compositeNameFormatForPerson:", self);
}

- (id)copyCompositeNameDelimiter
{
  return (id)objc_msgSend((id)objc_opt_class(), "copyCompositeNameDelimiterForPerson:", self);
}

- (BOOL)setImageData:(id)a3 withError:(id *)a4
{
  const __CFData *v6;
  const __CFData *v7;
  __int128 v8;
  __CFData *v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  v6 = (const __CFData *)a3;
  v7 = v6;
  v8 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
  v20 = *MEMORY[0x24BDBF090];
  v21 = v8;
  if (v6)
  {
    v9 = ABSCreateThumbnailDataAndCropRectFromImageData(v6, (double *)&v20);
    if (!v9)
    {
      LOBYTE(v10) = 0;
      goto LABEL_11;
    }
  }
  else
  {
    v9 = 0;
  }
  v11 = *MEMORY[0x24BDBA3E8];
  v22[0] = *MEMORY[0x24BDBA2F0];
  v22[1] = v11;
  v22[2] = *MEMORY[0x24BDBA270];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 3, v20, v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ABSPerson completeCNImplIfNeededWithKeysToFetch:](self, "completeCNImplIfNeededWithKeysToFetch:", v12);

  if (v10)
  {
    -[ABSPerson cnImpl](self, "cnImpl");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setImageData:", v7);

    -[ABSPerson cnImpl](self, "cnImpl");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setThumbnailImageData:", v9);

    v15 = v20;
    v16 = v21;
    -[ABSPerson cnImpl](self, "cnImpl");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCropRect:", v15, v16);

    -[ABSPerson addressBook](self, "addressBook");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "recordUpdated:", self);

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ABSAddressBookErrorDomain"), 1, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v9)
    CFRelease(v9);
LABEL_11:

  return v10;
}

- (id)copyImageData
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v9[0] = *MEMORY[0x24BDBA2F0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ABSPerson completeCNImplIfNeededWithKeysToFetch:](self, "completeCNImplIfNeededWithKeysToFetch:", v3);

  if (!v4)
    return 0;
  -[ABSPerson cnImpl](self, "cnImpl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

- (id)copyImageDataWithFormat:(int)a3
{
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    if (a3 == 2)
      return -[ABSPerson copyImageData](self, "copyImageData");
    return 0;
  }
  v9[0] = *MEMORY[0x24BDBA3E8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ABSPerson completeCNImplIfNeededWithKeysToFetch:](self, "completeCNImplIfNeededWithKeysToFetch:", v5);

  if (!v6)
    return 0;
  -[ABSPerson cnImpl](self, "cnImpl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "thumbnailImageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)hasImageData
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  char v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v8[0] = *MEMORY[0x24BDBA2E8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ABSPerson completeCNImplIfNeededWithKeysToFetch:](self, "completeCNImplIfNeededWithKeysToFetch:", v3);

  if (!v4)
    return 0;
  -[ABSPerson cnImpl](self, "cnImpl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "imageDataAvailable");

  return v6;
}

- (BOOL)removeImageDataWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  BOOL result;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BDBA2F0];
  v24[0] = *MEMORY[0x24BDBA2F0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ABSPerson completeCNImplIfNeededWithKeysToFetch:](self, "completeCNImplIfNeededWithKeysToFetch:", v6);

  if (!v7)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ABSAddressBookErrorDomain"), 1, 0);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a3 = v23;
      return result;
    }
    return 0;
  }
  -[ABSPerson cnImpl](self, "cnImpl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isKeyAvailable:", v5);

  if (!v9)
    return 0;
  -[ABSPerson cnImpl](self, "cnImpl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImageData:", 0);

  -[ABSPerson cnImpl](self, "cnImpl");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isKeyAvailable:", *MEMORY[0x24BDBA3E8]);

  if (v12)
  {
    -[ABSPerson cnImpl](self, "cnImpl");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setThumbnailImageData:", 0);

  }
  -[ABSPerson cnImpl](self, "cnImpl");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isKeyAvailable:", *MEMORY[0x24BDBA270]);

  if (v15)
  {
    v16 = *MEMORY[0x24BDBF090];
    v17 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v18 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v19 = *(double *)(MEMORY[0x24BDBF090] + 24);
    -[ABSPerson cnImpl](self, "cnImpl");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCropRect:", v16, v17, v18, v19);

  }
  -[ABSPerson addressBook](self, "addressBook");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "recordUpdated:", self);

  return 1;
}

- (int64_t)comparePersonByName:(id)a3 sortOrdering:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v21;
  _QWORD v22[2];

  v4 = *(_QWORD *)&a4;
  v22[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  +[ABSConstantsMapping ABToCNContactSortOrderConstantsMapping](ABSConstantsMapping, "ABToCNContactSortOrderConstantsMapping");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mappedConstant:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (int)objc_msgSend(v9, "intValue");

  objc_msgSend(MEMORY[0x24BDBACA0], "comparatorForNameSortOrder:", v10);
  v11 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBACA0], "descriptorForAllComparatorKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = -[ABSPerson completeCNImplIfNeededWithKeysToFetch:](self, "completeCNImplIfNeededWithKeysToFetch:", v13);

  if (!(_DWORD)v10)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x24BDBACA0], "descriptorForAllComparatorKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v6, "completeCNImplIfNeededWithKeysToFetch:", v15);

  if (v16)
  {
    -[ABSPerson cnImpl](self, "cnImpl");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cnImpl");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = ((uint64_t (**)(_QWORD, void *, void *))v11)[2](v11, v17, v18);

  }
  else
  {
LABEL_4:
    v19 = 0;
  }

  return v19;
}

+ (id)propertyKeyForPropertyID:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x24BDBAC70], "contactPropertiesByABSPropertyID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setAddressBook:(id)a3
{
  objc_storeWeak((id *)&self->_addressBook, a3);
  -[ABSPerson setNonNilSetProperties:](self, "setNonNilSetProperties:", 0);
}

- (void)replaceRecordStorageWithCNObject:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      NSLog(CFSTR("Storage of ABSPerson must be of type CNMutableContact."));
      v6 = objc_msgSend(v5, "mutableCopy");

      v5 = (void *)v6;
    }
    v7 = v5;
  }
  else
  {
    -[ABSPerson cnImpl](self, "cnImpl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABSPerson setRevertedRecordIdentifier:](self, "setRevertedRecordIdentifier:", v9);

    v7 = 0;
  }
  v10 = v7;
  -[ABSPerson setCnImpl:](self, "setCnImpl:", v7);

}

- (BOOL)getIdentifier:(int *)a3 label:(id *)a4 forMultiValueMatchingValue:(id)a5 property:(int)a6
{
  uint64_t v6;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void *v25;
  id v26;
  id v27;

  v6 = *(_QWORD *)&a6;
  v10 = a5;
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBAC70], "contactPropertiesByABSPropertyID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    v16 = v15 != 0;
    if (v15)
    {
      v17 = -[ABSPerson copyValueForProperty:](self, "copyValueForProperty:", v6);
      objc_msgSend(v17, "allValues");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = MEMORY[0x24BDAC760];
      v23 = 3221225472;
      v24 = __69__ABSPerson_getIdentifier_label_forMultiValueMatchingValue_property___block_invoke;
      v25 = &unk_24C2F4780;
      v26 = v15;
      v27 = v10;
      v19 = objc_msgSend(v18, "_cn_indexOfFirstObjectPassingTest:", &v22);

      if (a3)
        *a3 = objc_msgSend(v17, "identifierAtIndex:", v19, v22, v23, v24, v25, v26);
      if (a4)
      {
        objc_msgSend(v17, "labelAtIndex:", v19);
        v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a4 = v20;

      }
    }

  }
  else
  {
    v16 = 1;
  }

  return v16;
}

uint64_t __69__ABSPerson_getIdentifier_label_forMultiValueMatchingValue_property___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isABSLabeledValueValue:equalToValue:", *(_QWORD *)(a1 + 40), a2);
}

- (id)soundIdentifierForMultivalueIdentifier:(int)a3
{
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  __CFString *v9;
  int v11;
  __CFString *v12;
  __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v14[0] = *MEMORY[0x24BDBA3E0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ABSPerson completeCNImplIfNeededWithKeysToFetch:](self, "completeCNImplIfNeededWithKeysToFetch:", v5);

  if (!v6)
    return 0;
  -[ABSPerson cnImpl](self, "cnImpl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textAlert");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  switch(a3)
  {
    case -102:
      objc_msgSend(v8, "vibration");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case -5:
      v11 = objc_msgSend(v8, "ignoreMute");
      v12 = CFSTR("YES");
      if (!v11)
        v12 = 0;
      v9 = v12;
      break;
    case -2:
      objc_msgSend(v8, "sound");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v13 = 0;
      goto LABEL_13;
  }
  v13 = v9;
LABEL_13:

  return v13;
}

- (void)setValue:(id)a3 forSoundIdentifier:(int)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v17[0] = *MEMORY[0x24BDBA3E0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ABSPerson completeCNImplIfNeededWithKeysToFetch:](self, "completeCNImplIfNeededWithKeysToFetch:", v7);

  if (v8)
  {
    -[ABSPerson cnImpl](self, "cnImpl");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textAlert");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc(MEMORY[0x24BDBAD48]);
    objc_msgSend(v10, "sound");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "vibration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithSound:vibration:ignoreMute:", v12, v13, objc_msgSend(v10, "ignoreMute"));

    switch(a4)
    {
      case -102:
        objc_msgSend(v14, "setVibration:", v6);
        break;
      case -5:
        objc_msgSend(v14, "setIgnoreMute:", objc_msgSend(CFSTR("YES"), "isEqualToString:", v6));
        break;
      case -2:
        objc_msgSend(v14, "setSound:", v6);
        break;
    }
    -[ABSPerson cnImpl](self, "cnImpl");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextAlert:", v14);

    -[ABSPerson addressBook](self, "addressBook");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "recordUpdated:", self);

  }
}

- (ABSAddressBook)addressBook
{
  return (ABSAddressBook *)objc_loadWeakRetained((id *)&self->_addressBook);
}

- (void)setSource:(id)a3
{
  objc_storeWeak((id *)&self->_source, a3);
}

- (void)setCnImpl:(id)a3
{
  objc_storeStrong((id *)&self->_cnImpl, a3);
}

- (NSString)revertedRecordIdentifier
{
  return self->_revertedRecordIdentifier;
}

- (void)setRevertedRecordIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_revertedRecordIdentifier, a3);
}

- (NSMutableSet)nonNilSetProperties
{
  return self->_nonNilSetProperties;
}

- (void)setNonNilSetProperties:(id)a3
{
  objc_storeStrong((id *)&self->_nonNilSetProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonNilSetProperties, 0);
  objc_storeStrong((id *)&self->_revertedRecordIdentifier, 0);
  objc_storeStrong((id *)&self->_cnImpl, 0);
  objc_destroyWeak((id *)&self->_source);
  objc_destroyWeak((id *)&self->_addressBook);
}

@end
