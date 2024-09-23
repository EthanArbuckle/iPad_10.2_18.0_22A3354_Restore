@implementation NFApplet

- (void)_initManagedBySP
{
  self->_managedBySP = 0;
}

- (id)description
{
  void *v2;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  int activationState;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  id v12;
  id v13;
  id v14;
  const __CFString *v15;
  const __CFString *v16;
  id v17;
  id v18;
  uint64_t groupActivationStyle;
  NSData *discretionaryData;
  __CFString *v21;
  NSUInteger v22;
  id v23;
  __CFString *v24;
  NSUInteger v25;
  __CFString *v26;
  const __CFString *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  const __CFString *v36;
  NSData *moduleIdentifierAsData;
  NSData *packageIdentifierAsData;
  NSUInteger v39;
  const __CFString *v40;
  const __CFString *v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t appletGPState;
  uint64_t family;
  NSUInteger v46;
  id v47;
  const __CFString *v48;
  NSData *groupHeadIDAsData;
  void *v50;
  void *v51;
  const __CFString *v52;
  const __CFString *v53;
  __CFString *v54;
  __CFString *v55;
  __CFString *v56;
  __CFString *v57;
  __CFString *v58;
  objc_super v59;

  if ((self->_family - 1) > 7u)
    v4 = CFSTR("UNKNOWN");
  else
    v4 = (const __CFString *)*((_QWORD *)&off_1E3B51F98 + (char)(self->_family - 1));
  v53 = v4;
  v5 = -[NFApplet lifecycleState](self, "lifecycleState");
  v6 = CFSTR("UNKNOWN");
  if (v5 <= 14)
  {
    switch(v5)
    {
      case 1:
        v6 = CFSTR("loaded");
        break;
      case 3:
        v6 = CFSTR("installed");
        break;
      case 7:
        v6 = CFSTR("selectable");
        break;
    }
  }
  else if (v5 > 128)
  {
    if (v5 == 129)
    {
      v6 = CFSTR("terminated");
    }
    else if (v5 == 130)
    {
      v6 = CFSTR("frozen");
    }
  }
  else if (v5 == 15)
  {
    v6 = CFSTR("personalized");
  }
  else if (v5 == 23)
  {
    v6 = CFSTR("pre-personalized");
  }
  v52 = v6;
  activationState = self->_activationState;
  if (activationState == 128)
  {
    v8 = CFSTR("non-activatable");
  }
  else if (activationState == 1)
  {
    v8 = CFSTR("activated");
  }
  else if (self->_activationState)
  {
    v8 = CFSTR("UNKNOWN");
  }
  else
  {
    v8 = CFSTR("deactivated");
  }
  v48 = v8;
  v47 = objc_alloc(MEMORY[0x1E0CB3940]);
  v59.receiver = self;
  v59.super_class = (Class)NFApplet;
  -[NFApplet description](&v59, sel_description);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData NF_asHexString](self->_identifierAsData, "NF_asHexString");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  family = self->_family;
  appletGPState = self->_appletGPState;
  if (-[NFApplet isGPLocked](self, "isGPLocked"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v42 = self->_activationState;
  v43 = v9;
  if (self->_authTransientSupport)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (self->_authTransientConfigurable)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v40 = v11;
  v41 = v10;
  groupHeadIDAsData = self->_groupHeadIDAsData;
  if (groupHeadIDAsData)
  {
    v12 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[NSData NF_asHexString](self->_groupHeadIDAsData, "NF_asHexString");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (__CFString *)objc_msgSend(v12, "initWithFormat:", CFSTR("groupHead=%@ "), v34);
  }
  else
  {
    v58 = &stru_1E3B54F18;
  }
  v46 = -[NSArray count](self->_groupMemberIDs, "count");
  if (v46)
  {
    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[NSArray componentsJoinedByString:](self->_groupMemberIDs, "componentsJoinedByString:", CFSTR(", "));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (__CFString *)objc_msgSend(v13, "initWithFormat:", CFSTR("groupMembers={%@} "), v33);
  }
  else
  {
    v57 = &stru_1E3B54F18;
  }
  v39 = -[NSArray count](self->_referencedAppIDs, "count");
  if (v39)
  {
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[NSArray componentsJoinedByString:](self->_referencedAppIDs, "componentsJoinedByString:", CFSTR(", "));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (__CFString *)objc_msgSend(v14, "initWithFormat:", CFSTR("referencedApps={%@} "), v32);
  }
  else
  {
    v56 = &stru_1E3B54F18;
  }
  if (self->_isContainer)
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  if (self->_isProxy)
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  v35 = v16;
  v36 = v15;
  packageIdentifierAsData = self->_packageIdentifierAsData;
  if (packageIdentifierAsData)
  {
    v17 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[NSData NF_asHexString](self->_packageIdentifierAsData, "NF_asHexString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (__CFString *)objc_msgSend(v17, "initWithFormat:", CFSTR("packageIdentifier=%@ "), v31);
  }
  else
  {
    v55 = &stru_1E3B54F18;
  }
  moduleIdentifierAsData = self->_moduleIdentifierAsData;
  if (moduleIdentifierAsData)
  {
    v18 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[NSData NF_asHexString](self->_moduleIdentifierAsData, "NF_asHexString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (__CFString *)objc_msgSend(v18, "initWithFormat:", CFSTR("moduleIdentifier=%@ "), v30);
  }
  else
  {
    v54 = &stru_1E3B54F18;
  }
  groupActivationStyle = self->_groupActivationStyle;
  discretionaryData = self->_discretionaryData;
  if (discretionaryData)
    v21 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("discretionaryData=%@ "), self->_discretionaryData);
  else
    v21 = &stru_1E3B54F18;
  v22 = -[NSArray count](self->_multiSEApplicationGroupMemberIDs, "count");
  if (v22)
  {
    v23 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[NSArray componentsJoinedByString:](self->_multiSEApplicationGroupMemberIDs, "componentsJoinedByString:", CFSTR(", "));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (__CFString *)objc_msgSend(v23, "initWithFormat:", CFSTR("multiSsdMembers={%@} "), v2);
  }
  else
  {
    v24 = &stru_1E3B54F18;
  }
  v25 = -[NSData length](self->_typeFSystemCode, "length");
  if (v25)
    v26 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("systemCode=%@ "), self->_typeFSystemCode);
  else
    v26 = &stru_1E3B54F18;
  if (self->_managedBySP)
    v27 = CFSTR("managedBySP=Y");
  else
    v27 = &stru_1E3B54F18;
  v28 = (void *)objc_msgSend(v47, "initWithFormat:", CFSTR("%@ { identifier=%@ family=0x%x(%@) lifecycle=0x%x(%@) locked=%@ activation=0x%x(%@) authTransient=%@ authTransientConfigurable=%@ %@%@%@isContainer=%@ isProxy=%@ %@%@activationStyle=%d %@ %@%@seOS=%lu%@instanceACL=%@}"), v51, v50, family, v53, appletGPState, v52, v43, v42, v48, v41, v40, v58, v57, v56, v36, v35,
                  v55,
                  v54,
                  groupActivationStyle,
                  v21,
                  v24,
                  v26,
                  self->_seOS,
                  v27,
                  self->_instanceACL);
  if (v25)

  if (v22)
  {

  }
  if (discretionaryData)

  if (moduleIdentifierAsData)
  {

  }
  if (packageIdentifierAsData)
  {

  }
  if (v39)
  {

  }
  if (v46)
  {

  }
  if (groupHeadIDAsData)
  {

  }
  return v28;
}

- (id)asDictionary
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  int activationState;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSData *groupHeadIDAsData;
  void *v20;
  NSArray *groupMemberIDs;
  NSArray *referencedAppIDs;
  NSData *packageIdentifierAsData;
  void *v24;
  NSData *moduleIdentifierAsData;
  void *v26;
  NSData *discretionaryData;
  NSArray *multiSEApplicationGroupMemberIDs;
  NSData *typeFSystemCode;
  NSData *instanceACL;
  void *v32;
  NSString *seIdentifier;
  void *v34;
  id v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;

  if ((self->_family - 1) > 7u)
    v3 = CFSTR("UNKNOWN");
  else
    v3 = (const __CFString *)*((_QWORD *)&off_1E3B51F98 + (char)(self->_family - 1));
  v38 = v3;
  v4 = -[NFApplet lifecycleState](self, "lifecycleState");
  v5 = CFSTR("UNKNOWN");
  if (v4 <= 14)
  {
    switch(v4)
    {
      case 1:
        v5 = CFSTR("loaded");
        break;
      case 3:
        v5 = CFSTR("installed");
        break;
      case 7:
        v5 = CFSTR("selectable");
        break;
    }
  }
  else if (v4 > 128)
  {
    if (v4 == 129)
    {
      v5 = CFSTR("terminated");
    }
    else if (v4 == 130)
    {
      v5 = CFSTR("frozen");
    }
  }
  else if (v4 == 15)
  {
    v5 = CFSTR("personalized");
  }
  else if (v4 == 23)
  {
    v5 = CFSTR("pre-personalized");
  }
  v37 = v5;
  activationState = self->_activationState;
  if (activationState == 128)
  {
    v7 = CFSTR("non-activatable");
  }
  else if (activationState == 1)
  {
    v7 = CFSTR("activated");
  }
  else if (self->_activationState)
  {
    v7 = CFSTR("UNKNOWN");
  }
  else
  {
    v7 = CFSTR("deactivated");
  }
  v36 = v7;
  v35 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[NSData NF_asHexString](self->_identifierAsData, "NF_asHexString");
  v8 = objc_claimAutoreleasedReturnValue();
  seIdentifier = self->_seIdentifier;
  v34 = (void *)v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_family);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_appletGPState);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_activationState);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_authTransientSupport)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (self->_authTransientConfigurable)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  if (self->_isContainer)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  if (self->_isProxy)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_groupActivationStyle);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_seOS);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_managedBySP);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v35, "initWithObjectsAndKeys:", v34, CFSTR("identifier"), seIdentifier, CFSTR("seid"), v32, CFSTR("family"), v38, CFSTR("familyStr"), v9, CFSTR("lifecycleState"), v37, CFSTR("lifecycleStr"), v10, CFSTR("activationState"), v36, CFSTR("activationStr"), v11,
                  CFSTR("authTransientSupport"),
                  v12,
                  CFSTR("authTransientConfigurable"),
                  v13,
                  CFSTR("containerInstance"),
                  v14,
                  CFSTR("proxyInstance"),
                  v15,
                  CFSTR("groupActivationStyle"),
                  v16,
                  CFSTR("seOS"),
                  v17,
                  CFSTR("managedBySP"),
                  0);

  groupHeadIDAsData = self->_groupHeadIDAsData;
  if (groupHeadIDAsData)
  {
    -[NSData NF_asHexString](groupHeadIDAsData, "NF_asHexString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v20, CFSTR("groupHead"));

  }
  groupMemberIDs = self->_groupMemberIDs;
  if (groupMemberIDs)
    objc_msgSend(v18, "setObject:forKey:", groupMemberIDs, CFSTR("groupMembers"));
  referencedAppIDs = self->_referencedAppIDs;
  if (referencedAppIDs)
    objc_msgSend(v18, "setObject:forKey:", referencedAppIDs, CFSTR("referencedApps"));
  packageIdentifierAsData = self->_packageIdentifierAsData;
  if (packageIdentifierAsData)
  {
    -[NSData NF_asHexString](packageIdentifierAsData, "NF_asHexString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v24, CFSTR("packageIdentifier"));

  }
  moduleIdentifierAsData = self->_moduleIdentifierAsData;
  if (moduleIdentifierAsData)
  {
    -[NSData NF_asHexString](moduleIdentifierAsData, "NF_asHexString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v26, CFSTR("moduleIdentifier"));

  }
  discretionaryData = self->_discretionaryData;
  if (discretionaryData)
    objc_msgSend(v18, "setObject:forKey:", discretionaryData, CFSTR("discretionary"));
  multiSEApplicationGroupMemberIDs = self->_multiSEApplicationGroupMemberIDs;
  if (multiSEApplicationGroupMemberIDs)
    objc_msgSend(v18, "setObject:forKey:", multiSEApplicationGroupMemberIDs, CFSTR("multiSEApplicationGroup"));
  typeFSystemCode = self->_typeFSystemCode;
  if (typeFSystemCode)
    objc_msgSend(v18, "setObject:forKey:", typeFSystemCode, CFSTR("typeFSystemCode"));
  instanceACL = self->_instanceACL;
  if (instanceACL)
    objc_msgSend(v18, "setObject:forKey:", instanceACL, CFSTR("instanceACL"));
  return v18;
}

- (BOOL)isEqual:(id)a3
{
  NFApplet *v4;
  NFApplet *v5;
  BOOL v6;

  v4 = (NFApplet *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[NFApplet isEqualToApplet:](self, "isEqualToApplet:", v5);

  return v6;
}

- (BOOL)isEqualToApplet:(id)a3
{
  NFApplet *v4;
  void *v5;
  void *v6;
  int64_t v7;
  BOOL v8;

  v4 = (NFApplet *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    -[NFApplet identifierAsData](self, "identifierAsData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFApplet identifierAsData](v4, "identifierAsData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToData:", v6))
    {
      v7 = -[NFApplet seOS](self, "seOS");
      v8 = v7 == -[NFApplet seOS](v4, "seOS");
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (BOOL)isTypeF
{
  return -[NSData length](self->_typeFSystemCode, "length") != 0;
}

- (BOOL)suppressTypeB
{
  NSData *moduleIdentifierAsData;
  void *v4;
  char v5;
  NSData *v6;
  void *v7;

  moduleIdentifierAsData = self->_moduleIdentifierAsData;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &MID_MIFARE_MCM, 16);
  if (-[NSData isEqualToData:](moduleIdentifierAsData, "isEqualToData:", v4))
  {
    v5 = 1;
  }
  else
  {
    v6 = self->_moduleIdentifierAsData;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &MID_DREAMWORKS, 10);
    v5 = -[NSData isEqualToData:](v6, "isEqualToData:", v7);

  }
  return v5;
}

- (BOOL)suppressTypeA
{
  NSData *moduleIdentifierAsData;
  void *v3;

  moduleIdentifierAsData = self->_moduleIdentifierAsData;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &MID_JPKI, 10);
  LOBYTE(moduleIdentifierAsData) = -[NSData isEqualToData:](moduleIdentifierAsData, "isEqualToData:", v3);

  return (char)moduleIdentifierAsData;
}

- (unsigned)supportedTypeFSystem
{
  if (-[NSData length](self->_typeFSystemCode, "length") != 2)
    return 0;
  if (*(_WORD *)-[NSData bytes](self->_typeFSystemCode, "bytes") == 768)
    return 1;
  if (*(_WORD *)-[NSData bytes](self->_typeFSystemCode, "bytes") != 2176)
    return 0;
  return 2;
}

- (void)setInstanceACL:(id)a3
{
  objc_storeStrong((id *)&self->_instanceACL, a3);
}

- (NFApplet)initWithCoder:(id)a3
{
  id v4;
  NFApplet *v5;
  uint64_t v6;
  NSString *seIdentifier;
  uint64_t v8;
  NSData *identifierAsData;
  uint64_t v10;
  NSData *discretionaryData;
  uint64_t v12;
  NSData *groupHeadIDAsData;
  uint64_t v14;
  NSArray *groupMemberIDs;
  uint64_t v16;
  NSArray *referencedAppIDs;
  uint64_t v18;
  NSData *packageIdentifierAsData;
  uint64_t v20;
  NSData *moduleIdentifierAsData;
  uint64_t v22;
  NSArray *multiSEApplicationGroupMemberIDs;
  uint64_t v24;
  NSData *typeFSystemCode;
  uint64_t v26;
  NSData *instanceACL;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NFApplet;
  v5 = -[NFApplet init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("seid"));
    v6 = objc_claimAutoreleasedReturnValue();
    seIdentifier = v5->_seIdentifier;
    v5->_seIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifierAsData = v5->_identifierAsData;
    v5->_identifierAsData = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("discretionary"));
    v10 = objc_claimAutoreleasedReturnValue();
    discretionaryData = v5->_discretionaryData;
    v5->_discretionaryData = (NSData *)v10;

    v5->_family = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("family"));
    v5->_appletGPState = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("lifecycleState"));
    v5->_activationState = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("activationState"));
    v5->_authTransientSupport = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("authTransientSupport"));
    v5->_authTransientConfigurable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("authTransientConfigurable"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupHead"));
    v12 = objc_claimAutoreleasedReturnValue();
    groupHeadIDAsData = v5->_groupHeadIDAsData;
    v5->_groupHeadIDAsData = (NSData *)v12;

    objc_msgSend(MEMORY[0x1E0DE78C0], "coder:decodeArrayOfClass:forKey:", v4, objc_opt_class(), CFSTR("groupMembers"));
    v14 = objc_claimAutoreleasedReturnValue();
    groupMemberIDs = v5->_groupMemberIDs;
    v5->_groupMemberIDs = (NSArray *)v14;

    objc_msgSend(MEMORY[0x1E0DE78C0], "coder:decodeArrayOfClass:forKey:", v4, objc_opt_class(), CFSTR("referencedApps"));
    v16 = objc_claimAutoreleasedReturnValue();
    referencedAppIDs = v5->_referencedAppIDs;
    v5->_referencedAppIDs = (NSArray *)v16;

    v5->_isContainer = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("containerInstance"));
    v5->_isProxy = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("proxyInstance"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("packageIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    packageIdentifierAsData = v5->_packageIdentifierAsData;
    v5->_packageIdentifierAsData = (NSData *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("moduleIdentifier"));
    v20 = objc_claimAutoreleasedReturnValue();
    moduleIdentifierAsData = v5->_moduleIdentifierAsData;
    v5->_moduleIdentifierAsData = (NSData *)v20;

    v5->_groupActivationStyle = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("groupActivationStyle"));
    objc_msgSend(MEMORY[0x1E0DE78C0], "coder:decodeArrayOfClass:forKey:", v4, objc_opt_class(), CFSTR("multiSEApplicationGroup"));
    v22 = objc_claimAutoreleasedReturnValue();
    multiSEApplicationGroupMemberIDs = v5->_multiSEApplicationGroupMemberIDs;
    v5->_multiSEApplicationGroupMemberIDs = (NSArray *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("typeFSystemCode"));
    v24 = objc_claimAutoreleasedReturnValue();
    typeFSystemCode = v5->_typeFSystemCode;
    v5->_typeFSystemCode = (NSData *)v24;

    v5->_seOS = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("seOS"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("instanceACL"));
    v26 = objc_claimAutoreleasedReturnValue();
    instanceACL = v5->_instanceACL;
    v5->_instanceACL = (NSData *)v26;

    -[NFApplet _initManagedBySP](v5, "_initManagedBySP");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *seIdentifier;
  id v5;

  seIdentifier = self->_seIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", seIdentifier, CFSTR("seid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifierAsData, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_discretionaryData, CFSTR("discretionary"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_family, CFSTR("family"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_appletGPState, CFSTR("lifecycleState"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_activationState, CFSTR("activationState"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_authTransientSupport, CFSTR("authTransientSupport"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_authTransientConfigurable, CFSTR("authTransientConfigurable"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupHeadIDAsData, CFSTR("groupHead"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupMemberIDs, CFSTR("groupMembers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_referencedAppIDs, CFSTR("referencedApps"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isContainer, CFSTR("containerInstance"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isProxy, CFSTR("proxyInstance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_packageIdentifierAsData, CFSTR("packageIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_moduleIdentifierAsData, CFSTR("moduleIdentifier"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_groupActivationStyle, CFSTR("groupActivationStyle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_multiSEApplicationGroupMemberIDs, CFSTR("multiSEApplicationGroup"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_typeFSystemCode, CFSTR("typeFSystemCode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_seOS, CFSTR("seOS"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_instanceACL, CFSTR("instanceACL"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;

  v5 = objc_alloc_init((Class)objc_opt_class());
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_seIdentifier, "copyWithZone:", a3);
    v7 = (void *)*((_QWORD *)v5 + 11);
    *((_QWORD *)v5 + 11) = v6;

    v8 = -[NSData copyWithZone:](self->_identifierAsData, "copyWithZone:", a3);
    v9 = (void *)*((_QWORD *)v5 + 12);
    *((_QWORD *)v5 + 12) = v8;

    v10 = -[NSData copyWithZone:](self->_discretionaryData, "copyWithZone:", a3);
    v11 = (void *)*((_QWORD *)v5 + 13);
    *((_QWORD *)v5 + 13) = v10;

    *((_BYTE *)v5 + 76) = self->_family;
    *((_BYTE *)v5 + 75) = self->_appletGPState;
    *((_BYTE *)v5 + 77) = self->_activationState;
    *((_BYTE *)v5 + 78) = self->_authTransientSupport;
    *((_BYTE *)v5 + 79) = self->_authTransientConfigurable;
    v12 = -[NSData copyWithZone:](self->_groupHeadIDAsData, "copyWithZone:", a3);
    v13 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v12;

    v14 = -[NSArray copyWithZone:](self->_groupMemberIDs, "copyWithZone:", a3);
    v15 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v14;

    v16 = -[NSArray copyWithZone:](self->_referencedAppIDs, "copyWithZone:", a3);
    v17 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v16;

    *((_BYTE *)v5 + 73) = self->_isContainer;
    *((_BYTE *)v5 + 74) = self->_isProxy;
    v18 = -[NSData copyWithZone:](self->_packageIdentifierAsData, "copyWithZone:", a3);
    v19 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v18;

    v20 = -[NSData copyWithZone:](self->_moduleIdentifierAsData, "copyWithZone:", a3);
    v21 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v20;

    *((_BYTE *)v5 + 72) = self->_groupActivationStyle;
    v22 = -[NSArray copyWithZone:](self->_multiSEApplicationGroupMemberIDs, "copyWithZone:", a3);
    v23 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v22;

    v24 = -[NSData copyWithZone:](self->_typeFSystemCode, "copyWithZone:", a3);
    v25 = (void *)*((_QWORD *)v5 + 8);
    *((_QWORD *)v5 + 8) = v24;

    *((_BYTE *)v5 + 80) = self->_managedBySP;
    objc_storeStrong((id *)v5 + 15, self->_instanceACL);
  }
  return v5;
}

- (NSArray)groupMemberIDs
{
  return self->_groupMemberIDs;
}

- (NSArray)multiSEGroupMemberIDs
{
  return self->_multiSEApplicationGroupMemberIDs;
}

- (NSString)groupHeadID
{
  return (NSString *)-[NSData NF_asHexString](self->_groupHeadIDAsData, "NF_asHexString");
}

- (BOOL)isContainer
{
  return self->_isContainer;
}

- (BOOL)isProxy
{
  return self->_isProxy;
}

- (NSString)identifier
{
  return (NSString *)-[NSData NF_asHexString](self->_identifierAsData, "NF_asHexString");
}

- (NSString)packageIdentifier
{
  return (NSString *)-[NSData NF_asHexString](self->_packageIdentifierAsData, "NF_asHexString");
}

- (NSString)moduleIdentifier
{
  return (NSString *)-[NSData NF_asHexString](self->_moduleIdentifierAsData, "NF_asHexString");
}

- (unsigned)groupActivationStyle
{
  return self->_groupActivationStyle;
}

- (NFAppletCollection)appletCollection
{
  return (NFAppletCollection *)objc_loadWeakRetained((id *)&self->_appletCollection);
}

- (void)setAppletCollection:(id)a3
{
  objc_storeWeak((id *)&self->_appletCollection, a3);
}

- (NFApplet)groupHead
{
  NFAppletCollection **p_appletCollection;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  void *v10;

  p_appletCollection = &self->_appletCollection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_appletCollection);

  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFApplet.m"), 446, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_appletCollection!=nil"));

  }
  if (self->_groupHeadIDAsData)
  {
    v6 = objc_loadWeakRetained((id *)p_appletCollection);
    -[NSData NF_asHexString](self->_groupHeadIDAsData, "NF_asHexString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appletWithIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return (NFApplet *)v8;
}

- (NSArray)groupMembers
{
  NFAppletCollection **p_appletCollection;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  const char *v21;
  const char *v22;
  void *v24;
  const char *ClassName;
  const char *Name;
  NSArray *obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  p_appletCollection = &self->_appletCollection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_appletCollection);

  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFApplet.m"), 453, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_appletCollection!=nil"));

  }
  if (self->_groupMemberIDs)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_groupMemberIDs, "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = self->_groupMemberIDs;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v30 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          v11 = objc_loadWeakRetained((id *)p_appletCollection);
          objc_msgSend(v11, "appletWithIdentifier:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            objc_msgSend(v5, "addObject:", v12);
          }
          else
          {
            dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
            Logger = NFLogGetLogger();
            if (Logger)
            {
              v14 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              v17 = 45;
              if (isMetaClass)
                v17 = 43;
              v14(5, "%c[%{public}s %{public}s]:%i No applet for %{public}@", v17, ClassName, Name, 461, 0);
            }
            dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
            NFSharedLogGetLogger();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v19 = object_getClass(self);
              if (class_isMetaClass(v19))
                v20 = 43;
              else
                v20 = 45;
              v21 = object_getClassName(self);
              v22 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              v34 = v20;
              v35 = 2082;
              v36 = v21;
              v37 = 2082;
              v38 = v22;
              v39 = 1024;
              v40 = 461;
              v41 = 2114;
              v42 = 0;
              _os_log_impl(&dword_19B5EB000, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No applet for %{public}@", buf, 0x2Cu);
            }

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
      }
      while (v7);
    }

  }
  else
  {
    v5 = 0;
  }
  return (NSArray *)v5;
}

- (NSArray)referencedApps
{
  NFAppletCollection **p_appletCollection;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  const char *v21;
  const char *v22;
  void *v24;
  const char *ClassName;
  const char *Name;
  NSArray *obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  p_appletCollection = &self->_appletCollection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_appletCollection);

  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFApplet.m"), 472, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_appletCollection!=nil"));

  }
  if (self->_referencedAppIDs)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_referencedAppIDs, "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = self->_referencedAppIDs;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v30 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          v11 = objc_loadWeakRetained((id *)p_appletCollection);
          objc_msgSend(v11, "appletWithIdentifier:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            objc_msgSend(v5, "addObject:", v12);
          }
          else
          {
            dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
            Logger = NFLogGetLogger();
            if (Logger)
            {
              v14 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              v17 = 45;
              if (isMetaClass)
                v17 = 43;
              v14(5, "%c[%{public}s %{public}s]:%i No applet for %{public}@", v17, ClassName, Name, 480, 0);
            }
            dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
            NFSharedLogGetLogger();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v19 = object_getClass(self);
              if (class_isMetaClass(v19))
                v20 = 43;
              else
                v20 = 45;
              v21 = object_getClassName(self);
              v22 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              v34 = v20;
              v35 = 2082;
              v36 = v21;
              v37 = 2082;
              v38 = v22;
              v39 = 1024;
              v40 = 480;
              v41 = 2114;
              v42 = 0;
              _os_log_impl(&dword_19B5EB000, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No applet for %{public}@", buf, 0x2Cu);
            }

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
      }
      while (v7);
    }

  }
  else
  {
    v5 = 0;
  }
  return (NSArray *)v5;
}

- (id)multiSSDMembers
{
  NFAppletCollection **p_appletCollection;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  const char *v21;
  const char *v22;
  void *v24;
  const char *ClassName;
  const char *Name;
  NSArray *obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  p_appletCollection = &self->_appletCollection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_appletCollection);

  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFApplet.m"), 491, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_appletCollection!=nil"));

  }
  if (self->_multiSEApplicationGroupMemberIDs)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_multiSEApplicationGroupMemberIDs, "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = self->_multiSEApplicationGroupMemberIDs;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v30 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          v11 = objc_loadWeakRetained((id *)p_appletCollection);
          objc_msgSend(v11, "appletWithIdentifier:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            objc_msgSend(v5, "addObject:", v12);
          }
          else
          {
            dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
            Logger = NFLogGetLogger();
            if (Logger)
            {
              v14 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              v17 = 45;
              if (isMetaClass)
                v17 = 43;
              v14(5, "%c[%{public}s %{public}s]:%i No applet for %{public}@", v17, ClassName, Name, 499, 0);
            }
            dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
            NFSharedLogGetLogger();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v19 = object_getClass(self);
              if (class_isMetaClass(v19))
                v20 = 43;
              else
                v20 = 45;
              v21 = object_getClassName(self);
              v22 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              v34 = v20;
              v35 = 2082;
              v36 = v21;
              v37 = 2082;
              v38 = v22;
              v39 = 1024;
              v40 = 499;
              v41 = 2114;
              v42 = 0;
              _os_log_impl(&dword_19B5EB000, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No applet for %{public}@", buf, 0x2Cu);
            }

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
      }
      while (v7);
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)isGPLocked
{
  int appletGPState;

  appletGPState = (char)self->_appletGPState;
  return appletGPState < 0 && (appletGPState + 125) < 0xFEu;
}

- (BOOL)containsSubKeys
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[NFApplet identifierAsData](self, "identifierAsData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &AID_PURPLE_TRUST_AIR_CCC_0, 13);
  if ((objc_msgSend(v3, "isEqualToData:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[NFApplet identifierAsData](self, "identifierAsData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &AID_PURPLE_TRUST_AIR_HOME, 12);
    if ((objc_msgSend(v6, "isEqualToData:", v7) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      -[NFApplet identifierAsData](self, "identifierAsData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &AID_PURPLE_TRUST_AIR_HYDRA, 12);
      if ((objc_msgSend(v8, "isEqualToData:", v9) & 1) != 0)
      {
        v5 = 1;
      }
      else
      {
        -[NFApplet identifierAsData](self, "identifierAsData");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &AID_LYON, 9);
        v5 = objc_msgSend(v10, "isEqualToData:", v11);

      }
    }

  }
  return v5;
}

- (unsigned)lifecycleState
{
  int appletGPState;
  unsigned int v3;
  unint64_t v4;

  appletGPState = self->_appletGPState;
  if (appletGPState != 129 && appletGPState != 130)
  {
    HIDWORD(v4) = (appletGPState & 0x7F) - 1;
    LODWORD(v4) = HIDWORD(v4);
    v3 = v4 >> 1;
    if (v3 > 0xB)
      LOBYTE(appletGPState) = 0;
    else
      LOBYTE(appletGPState) = byte_19B68A960[v3];
  }
  return appletGPState;
}

- (unint64_t)rawGPState
{
  return self->_appletGPState;
}

- (NSString)seIdentifier
{
  return self->_seIdentifier;
}

- (NSData)identifierAsData
{
  return self->_identifierAsData;
}

- (NSData)discretionaryData
{
  return self->_discretionaryData;
}

- (unsigned)family
{
  return self->_family;
}

- (unsigned)activationState
{
  return self->_activationState;
}

- (int64_t)seOS
{
  return self->_seOS;
}

- (BOOL)authTransientSupport
{
  return self->_authTransientSupport;
}

- (BOOL)authTransientConfigurable
{
  return self->_authTransientConfigurable;
}

- (BOOL)managedBySP
{
  return self->_managedBySP;
}

- (NSData)instanceACL
{
  return self->_instanceACL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceACL, 0);
  objc_storeStrong((id *)&self->_discretionaryData, 0);
  objc_storeStrong((id *)&self->_identifierAsData, 0);
  objc_storeStrong((id *)&self->_seIdentifier, 0);
  objc_storeStrong((id *)&self->_typeFSystemCode, 0);
  objc_storeStrong((id *)&self->_multiSEApplicationGroupMemberIDs, 0);
  objc_storeStrong((id *)&self->_moduleIdentifierAsData, 0);
  objc_storeStrong((id *)&self->_packageIdentifierAsData, 0);
  objc_storeStrong((id *)&self->_referencedAppIDs, 0);
  objc_storeStrong((id *)&self->_groupMemberIDs, 0);
  objc_storeStrong((id *)&self->_groupHeadIDAsData, 0);
  objc_destroyWeak((id *)&self->_appletCollection);
}

- (NFApplet)initWithDictionary:(id)a3
{
  id v4;
  NFApplet *v5;
  void *v6;
  uint64_t v7;
  NSData *identifierAsData;
  uint64_t v9;
  NSString *seIdentifier;
  uint64_t v11;
  NSData *discretionaryData;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSData *groupHeadIDAsData;
  void *v21;
  uint64_t v22;
  NSArray *groupMemberIDs;
  void *v24;
  uint64_t v25;
  NSArray *referencedAppIDs;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSData *packageIdentifierAsData;
  void *v32;
  uint64_t v33;
  NSData *moduleIdentifierAsData;
  void *v35;
  void *v36;
  uint64_t v37;
  NSArray *multiSEApplicationGroupMemberIDs;
  void *v39;
  uint64_t v40;
  NSData *typeFSystemCode;
  void *v42;
  uint64_t v43;
  NSData *instanceACL;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)NFApplet;
  v5 = -[NFApplet init](&v46, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "NF_dataWithHexString:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_8;
      v7 = objc_msgSend(v6, "copy");
    }
    identifierAsData = v5->_identifierAsData;
    v5->_identifierAsData = (NSData *)v7;

LABEL_8:
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("seid"));
    v9 = objc_claimAutoreleasedReturnValue();
    seIdentifier = v5->_seIdentifier;
    v5->_seIdentifier = (NSString *)v9;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("discretionary"));
    v11 = objc_claimAutoreleasedReturnValue();
    discretionaryData = v5->_discretionaryData;
    v5->_discretionaryData = (NSData *)v11;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("family"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_family = objc_msgSend(v13, "intValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lifecycleState"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_appletGPState = objc_msgSend(v14, "unsignedCharValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activationState"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_activationState = objc_msgSend(v15, "intValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("authTransientSupport"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_authTransientSupport = objc_msgSend(v16, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("authTransientConfigurable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_authTransientConfigurable = objc_msgSend(v17, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("groupHead"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_14;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "NF_dataWithHexString:", v18);
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_14;
      v19 = objc_msgSend(v18, "copy");
    }
    groupHeadIDAsData = v5->_groupHeadIDAsData;
    v5->_groupHeadIDAsData = (NSData *)v19;

LABEL_14:
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groupMembers"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    groupMemberIDs = v5->_groupMemberIDs;
    v5->_groupMemberIDs = (NSArray *)v22;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("referencedApps"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    referencedAppIDs = v5->_referencedAppIDs;
    v5->_referencedAppIDs = (NSArray *)v25;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("containerInstance"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isContainer = objc_msgSend(v27, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("proxyInstance"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isProxy = objc_msgSend(v28, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("packageIdentifier"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
      goto LABEL_20;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "NF_dataWithHexString:", v29);
      v30 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_20;
      v30 = objc_msgSend(v29, "copy");
    }
    packageIdentifierAsData = v5->_packageIdentifierAsData;
    v5->_packageIdentifierAsData = (NSData *)v30;

LABEL_20:
    objc_msgSend(v4, "objectForKey:", CFSTR("moduleIdentifier"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "NF_dataWithHexString:", v32);
        v33 = objc_claimAutoreleasedReturnValue();
LABEL_25:
        moduleIdentifierAsData = v5->_moduleIdentifierAsData;
        v5->_moduleIdentifierAsData = (NSData *)v33;

        goto LABEL_26;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = objc_msgSend(v32, "copy");
        goto LABEL_25;
      }
    }
LABEL_26:
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groupActivationStyle"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_groupActivationStyle = objc_msgSend(v35, "intValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("multiSEApplicationGroup"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "copy");
    multiSEApplicationGroupMemberIDs = v5->_multiSEApplicationGroupMemberIDs;
    v5->_multiSEApplicationGroupMemberIDs = (NSArray *)v37;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("typeFSystemCode"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "copy");
    typeFSystemCode = v5->_typeFSystemCode;
    v5->_typeFSystemCode = (NSData *)v40;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("seOS"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_seOS = objc_msgSend(v42, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("instanceACL"));
    v43 = objc_claimAutoreleasedReturnValue();
    instanceACL = v5->_instanceACL;
    v5->_instanceACL = (NSData *)v43;

    -[NFApplet _initManagedBySP](v5, "_initManagedBySP");
  }

  return v5;
}

- (void)_setIsActive:(BOOL)a3
{
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *Name;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (self->_activationState == 128)
  {
    v5 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v11 = 45;
      if (isMetaClass)
        v11 = 43;
      v7(4, "%c[%{public}s %{public}s]:%i Applet is non-activatable", v11, ClassName, Name, 625);
    }
    dispatch_get_specific(*v5);
    NFSharedLogGetLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = object_getClass(self);
      if (class_isMetaClass(v13))
        v14 = 43;
      else
        v14 = 45;
      *(_DWORD *)buf = 67109890;
      v17 = v14;
      v18 = 2082;
      v19 = object_getClassName(self);
      v20 = 2082;
      v21 = sel_getName(a2);
      v22 = 1024;
      v23 = 625;
      _os_log_impl(&dword_19B5EB000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Applet is non-activatable", buf, 0x22u);
    }

  }
  else
  {
    self->_activationState = a3;
  }
}

+ (id)aidListForPrinting:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@"), v4);
  return v12;
}

- (BOOL)isPPSEControllable
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = self->_referencedAppIDs;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = objc_alloc(MEMORY[0x1E0C99D50]);
          v9 = (void *)objc_msgSend(v8, "initWithBytes:length:", &NF_PPSE_APPLET_IDENTIFIER, 14, (_QWORD)v14);
          objc_msgSend(v9, "NF_asHexString");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v7, "caseInsensitiveCompare:", v10);

          if (!v11)
          {
            v12 = 1;
            goto LABEL_12;
          }
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v4)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_12:

  return v12;
}

@end
