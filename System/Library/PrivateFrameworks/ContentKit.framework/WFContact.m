@implementation WFContact

- (BOOL)hasValueForPropertyID:(int)a3
{
  return 0;
}

- (id)valueForPropertyID:(int)a3
{
  return 0;
}

- (WFContact)contactWithPropertyID:(int)a3 multivalueIndex:(int64_t)a4
{
  return 0;
}

- (WFFileRepresentation)vCardRepresentation
{
  WFFileRepresentation *vCardRepresentation;
  WFFileRepresentation *v4;
  WFFileRepresentation *v5;

  vCardRepresentation = self->_vCardRepresentation;
  if (!vCardRepresentation)
  {
    -[WFContact vCardRepresentationWithFullData:](self, "vCardRepresentationWithFullData:", 0);
    v4 = (WFFileRepresentation *)objc_claimAutoreleasedReturnValue();
    v5 = self->_vCardRepresentation;
    self->_vCardRepresentation = v4;

    vCardRepresentation = self->_vCardRepresentation;
  }
  return vCardRepresentation;
}

- (WFFileRepresentation)fullDataVCardRepresentation
{
  WFFileRepresentation *fullDataVCardRepresentation;
  WFFileRepresentation *v4;
  WFFileRepresentation *v5;

  fullDataVCardRepresentation = self->_fullDataVCardRepresentation;
  if (!fullDataVCardRepresentation)
  {
    -[WFContact vCardRepresentationWithFullData:](self, "vCardRepresentationWithFullData:", 1);
    v4 = (WFFileRepresentation *)objc_claimAutoreleasedReturnValue();
    v5 = self->_fullDataVCardRepresentation;
    self->_fullDataVCardRepresentation = v4;

    fullDataVCardRepresentation = self->_fullDataVCardRepresentation;
  }
  return fullDataVCardRepresentation;
}

- (id)vCardRepresentationWithFullData:(BOOL)a3
{
  return 0;
}

- (id)attributionSetWithCachingIdentifier:(id)a3
{
  return 0;
}

- (NSString)formattedName
{
  return 0;
}

- (NSString)namePrefix
{
  return 0;
}

- (NSString)firstName
{
  return 0;
}

- (NSString)middleName
{
  return 0;
}

- (NSString)lastName
{
  return 0;
}

- (NSString)nameSuffix
{
  return 0;
}

- (NSString)organization
{
  return 0;
}

- (NSData)imageData
{
  return 0;
}

- (NSData)thumbnailImageData
{
  return 0;
}

- (WFContactLabeledValue)birthday
{
  return 0;
}

- (NSDate)creationDate
{
  return (NSDate *)-[WFContact valueForPropertyID:](self, "valueForPropertyID:", 26);
}

- (NSDate)modificationDate
{
  return (NSDate *)-[WFContact valueForPropertyID:](self, "valueForPropertyID:", 27);
}

- (NSArray)dates
{
  return 0;
}

- (NSArray)phoneNumbers
{
  return 0;
}

- (NSArray)emailAddresses
{
  return 0;
}

- (NSArray)streetAddresses
{
  return 0;
}

- (NSArray)URLs
{
  return 0;
}

- (NSArray)instantMessageAddresses
{
  return 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)WFContact;
  -[WFContact description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContact formattedName](self, "formattedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

- (WFContact)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  WFContact *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vCardFile"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("propertyId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("multivalueId"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "longValue");
  objc_msgSend((id)objc_opt_class(), "contactWithVCardData:propertyID:multivalueIndex:", v6, v8, v10);
  v11 = (WFContact *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[WFContact fullDataVCardRepresentation](self, "fullDataVCardRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("vCardFile"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[WFContact propertyID](self, "propertyID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("propertyId"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -[WFContact multivalueIndex](self, "multivalueIndex"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("multivalueId"));

}

- (id)wfSerializedRepresentation
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  -[WFContact vCardRepresentation](self, "vCardRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[WFContact multivalueIndex](self, "multivalueIndex");
    v14[0] = v4;
    v13[0] = CFSTR("WFContactData");
    v13[1] = CFSTR("WFContactProperty");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[WFContact propertyID](self, "propertyID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v6;
    v13[2] = CFSTR("WFContactMultivalue");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = CFSTR("link.contentkit.contact");
    v12 = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int)propertyID
{
  return self->_propertyID;
}

- (int64_t)multivalueIndex
{
  return self->_multivalueIndex;
}

- (NSString)nickname
{
  return self->_nickname;
}

- (BOOL)hasImageData
{
  return self->_hasImageData;
}

- (NSArray)socialProfiles
{
  return self->_socialProfiles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socialProfiles, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_fullDataVCardRepresentation, 0);
  objc_storeStrong((id *)&self->_vCardRepresentation, 0);
}

+ (Class)preferredConcreteSubclass
{
  return (Class)objc_opt_class();
}

+ (id)contactsWithVCardData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_msgSend(a1, "preferredConcreteSubclass"), "contactsWithVCardData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)contactWithVCardData:(id)a3 propertyID:(int)a4 multivalueIndex:(int64_t)a5
{
  uint64_t v6;
  id v8;
  void *v9;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  objc_msgSend((id)objc_msgSend(a1, "preferredConcreteSubclass"), "contactWithVCardData:propertyID:multivalueIndex:", v8, v6, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (int64_t)predictedTypeForHandleValue:(id)a3
{
  return objc_msgSend(a1, "predictedTypeForHandleValue:allowsCustomHandles:", a3, 0);
}

+ (int64_t)predictedTypeForHandleValue:(id)a3 allowsCustomHandles:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  _BOOL4 v6;
  _BOOL4 v7;
  int64_t v9;

  v4 = a4;
  v5 = a3;
  v6 = +[WFEmailAddress stringContainsEmailAddresses:](WFEmailAddress, "stringContainsEmailAddresses:", v5);
  v7 = +[WFPhoneNumber stringContainsPhoneNumbers:](WFPhoneNumber, "stringContainsPhoneNumbers:", v5);

  if (v6 && !v7)
    return 1;
  if (v7 && !v6)
    return 0;
  v9 = 2;
  if (!v4)
    v9 = 0;
  if (!v6 || !v7)
    return v9;
  else
    return 1;
}

+ (id)addContactsChangeObserver:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_msgSend(a1, "preferredConcreteSubclass"), "addContactsChangeObserver:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)removeContactsChangeObserver:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend((id)objc_msgSend(a1, "preferredConcreteSubclass"), "removeContactsChangeObserver:", v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v17;

  v4 = a3;
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.contact"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WFIsINPerson"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    +[WFINPersonContact objectWithWFSerializedRepresentation:](WFINPersonContact, "objectWithWFSerializedRepresentation:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFContactData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFContactProperty"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    objc_msgSend(v5, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFContactMultivalue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "longLongValue");

    if (v13 == 0x7FFFFFFF || v13 == 0x7FFFFFFFFFFFFFFFLL)
      v15 = -1;
    else
      v15 = v13;
    if (v11 - 3 < 2 && v15 == -1)
      v17 = 0xFFFFFFFFLL;
    else
      v17 = v11;
    objc_msgSend(a1, "contactWithVCardData:propertyID:multivalueIndex:", v9, v17, v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)INPersonRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  id v28;
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
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v44;
  WFContact *v45;
  id obj;
  id obja;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[WFContact namePrefix](self, "namePrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNamePrefix:", v4);

  -[WFContact firstName](self, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGivenName:", v5);

  -[WFContact middleName](self, "middleName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMiddleName:", v6);

  -[WFContact lastName](self, "lastName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFamilyName:", v7);

  -[WFContact nameSuffix](self, "nameSuffix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNameSuffix:", v8);

  -[WFContact nickname](self, "nickname");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v3;
  objc_msgSend(v3, "setNickname:", v9);

  v10 = (void *)objc_opt_new();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v45 = self;
  -[WFContact phoneNumbers](self, "phoneNumbers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v53 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        v16 = objc_alloc(MEMORY[0x24BDD9F38]);
        objc_msgSend(v15, "value");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "normalizedPhoneNumber");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "value");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "label");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        INPersonHandleLabelForContactLabel(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v16, "initWithValue:type:label:", v18, 2, v21);

        objc_msgSend(v10, "addObject:", v22);
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v12);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[WFContact emailAddresses](v45, "emailAddresses");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v49 != v25)
          objc_enumerationMutation(obja);
        v27 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
        v28 = objc_alloc(MEMORY[0x24BDD9F38]);
        objc_msgSend(v27, "value");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "address");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "value");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "label");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        INPersonHandleLabelForContactLabel(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_msgSend(v28, "initWithValue:type:label:", v30, 1, v33);

        objc_msgSend(v10, "addObject:", v34);
      }
      v24 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v24);
  }

  objc_msgSend(v10, "firstObject");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v10, "count") < 2)
  {

    v10 = 0;
  }
  else
  {
    objc_msgSend(v10, "removeObjectAtIndex:", 0);
  }
  -[WFContact imageData](v45, "imageData");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v36, "length"))
  {
    v37 = (void *)MEMORY[0x24BDD9DA8];
    -[WFContact imageData](v45, "imageData");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "imageWithImageData:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v39 = 0;
  }

  v40 = objc_alloc(MEMORY[0x24BDD9F30]);
  -[WFContact contactIdentifierForINPerson](v45, "contactIdentifierForINPerson");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v40, "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:aliases:suggestionType:", v35, v44, 0, v39, v41, 0, v10, 0);

  return v42;
}

- (id)contactIdentifierForINPerson
{
  return 0;
}

+ (id)labelFromINPersonHandleLabel:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD99B0]))
  {
    getCNLabelHome();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD99E8]))
  {
    getCNLabelWork();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD99D0]))
  {
    getCNLabelOther();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD99F8]))
  {
    getCNLabelPhoneNumberiPhone();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD99C8]))
  {
    getCNLabelPhoneNumberMobile();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD99C0]))
  {
    getCNLabelPhoneNumberMain();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD99B8]))
  {
    getCNLabelPhoneNumberHomeFax();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD99F0]))
  {
    getCNLabelPhoneNumberWorkFax();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD99D8]))
  {
    getCNLabelPhoneNumberPager();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

+ (id)cnContactWithINPerson:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id CNLabeledValueClass_10637;
  void *v26;
  WFCNContactStore *v27;
  void *v28;
  BOOL v29;
  id v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  BOOL v50;
  void *v51;
  uint64_t v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(uint64_t);
  void *v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v55 = a3;
  v67 = 0;
  v68 = &v67;
  v69 = 0x2050000000;
  v4 = (void *)getCNMutableContactClass_softClass;
  v70 = getCNMutableContactClass_softClass;
  if (!getCNMutableContactClass_softClass)
  {
    v62 = MEMORY[0x24BDAC760];
    v63 = 3221225472;
    v64 = __getCNMutableContactClass_block_invoke;
    v65 = &unk_24C4E3118;
    v66 = &v67;
    __getCNMutableContactClass_block_invoke((uint64_t)&v62);
    v4 = (void *)v68[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v67, 8);
  v53 = objc_opt_new();
  v56 = (void *)objc_opt_new();
  v57 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v55, "personHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v55, "personHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);

  }
  objc_msgSend(v55, "aliases", v53);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v9);

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v59 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend(v14, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = objc_msgSend(v14, "type");
          if (v16 == 1)
          {
            CNLabeledValueClass_10637 = getCNLabeledValueClass_10637();
            objc_msgSend(v14, "label");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "labelFromINPersonHandleLabel:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "value");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(CNLabeledValueClass_10637, "labeledValueWithLabel:value:", v19, v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "addObject:", v23);
          }
          else
          {
            if (v16 != 2)
              continue;
            v17 = getCNLabeledValueClass_10637();
            objc_msgSend(v14, "label");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "labelFromINPersonHandleLabel:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = 0;
            v68 = &v67;
            v69 = 0x2050000000;
            v20 = (void *)getCNPhoneNumberClass_softClass_10638;
            v70 = getCNPhoneNumberClass_softClass_10638;
            if (!getCNPhoneNumberClass_softClass_10638)
            {
              v62 = MEMORY[0x24BDAC760];
              v63 = 3221225472;
              v64 = __getCNPhoneNumberClass_block_invoke_10639;
              v65 = &unk_24C4E3118;
              v66 = &v67;
              __getCNPhoneNumberClass_block_invoke_10639((uint64_t)&v62);
              v20 = (void *)v68[3];
            }
            v21 = objc_retainAutorelease(v20);
            _Block_object_dispose(&v67, 8);
            objc_msgSend(v14, "value");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "phoneNumberWithStringValue:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "labeledValueWithLabel:value:", v19, v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "addObject:", v24);

          }
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
    }
    while (v11);
  }

  objc_msgSend(v55, "contactIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26 || objc_msgSend(v57, "count"))
  {

    goto LABEL_23;
  }
  v32 = objc_msgSend(v56, "count") == 0;

  if (!v32)
  {
LABEL_23:
    objc_msgSend(v55, "nameComponents");
    v27 = (WFCNContactStore *)objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
      objc_msgSend(v55, "displayName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28 == 0;

      if (v29)
      {
        v27 = 0;
      }
      else
      {
        v30 = objc_alloc_init(MEMORY[0x24BDD1738]);
        objc_msgSend(v55, "displayName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "personNameComponentsFromString:", v31);
        v27 = (WFCNContactStore *)objc_claimAutoreleasedReturnValue();

      }
    }
    -[WFCNContactStore namePrefix](v27, "namePrefix");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      -[WFCNContactStore namePrefix](v27, "namePrefix");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setNamePrefix:", v36);

    }
    -[WFCNContactStore nameSuffix](v27, "nameSuffix");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      -[WFCNContactStore nameSuffix](v27, "nameSuffix");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setNameSuffix:", v38);

    }
    -[WFCNContactStore givenName](v27, "givenName");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      -[WFCNContactStore givenName](v27, "givenName");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setGivenName:", v40);

    }
    -[WFCNContactStore middleName](v27, "middleName");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      -[WFCNContactStore middleName](v27, "middleName");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setMiddleName:", v42);

    }
    -[WFCNContactStore familyName](v27, "familyName");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      -[WFCNContactStore familyName](v27, "familyName");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setFamilyName:", v44);

    }
    -[WFCNContactStore nickname](v27, "nickname");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      -[WFCNContactStore nickname](v27, "nickname");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setNickname:", v46);

    }
    objc_msgSend(v55, "image");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v47, "_requiresRetrieval") & 1) == 0)
    {
      objc_msgSend(v55, "image");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "_imageData");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v49 == 0;

      if (v50)
      {
LABEL_45:
        objc_msgSend(v54, "setPhoneNumbers:", v56);
        objc_msgSend(v54, "setEmailAddresses:", v57);
        +[WFCNContact contactWithCNContact:](WFCNContact, "contactWithCNContact:", v54);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_46;
      }
      objc_msgSend(v55, "image");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "_imageData");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setImageData:", v51);

    }
    goto LABEL_45;
  }
  v27 = objc_alloc_init(WFCNContactStore);
  objc_msgSend(v55, "contactIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCNContactStore contactWithIdentifier:](v27, "contactWithIdentifier:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_46:
  return v34;
}

@end
