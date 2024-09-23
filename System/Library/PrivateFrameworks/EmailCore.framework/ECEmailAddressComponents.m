@implementation ECEmailAddressComponents

- (void)setDisplayName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (ECEmailAddress)emailAddressValue
{
  ECEmailAddressComponents *v2;
  id v3;

  v2 = self;
  objc_sync_enter(v2);
  if (-[ECEmailAddressComponents _nts_isValid](v2, "_nts_isValid"))
    v3 = -[ECEmailAddress _initWithComponents:]([ECEmailAddress alloc], "_initWithComponents:", v2);
  else
    v3 = 0;
  objc_sync_exit(v2);

  return (ECEmailAddress *)v3;
}

- (BOOL)_nts_isValid
{
  BOOL v3;
  void *v4;
  char v5;

  v3 = -[ECEmailAddressComponents _nts_getValidatedLocalPart:domain:idnaDomain:displayName:](self, "_nts_getValidatedLocalPart:domain:idnaDomain:displayName:", 0, 0, 0, 0);
  if (self->_groupList)
  {
    -[NSString ecemailaddress_trimmedAndQuotedDisplayName](self->_displayName, "ecemailaddress_trimmedAndQuotedDisplayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
      v5 = -[NSArray ef_all:](self->_groupList, "ef_all:", &__block_literal_global_157);
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }
  return v3 ^ v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  uint64_t v5;
  id v6;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 2, self->_localPart);
  objc_storeStrong(v4 + 3, self->_domain);
  objc_storeStrong(v4 + 4, self->_idnaDomain);
  objc_storeStrong(v4 + 1, self->_simpleAddress);
  objc_storeStrong(v4 + 6, self->_displayName);
  if (self->_groupList)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_groupList, 1);
    v6 = v4[5];
    v4[5] = (id)v5;
  }
  else
  {
    v6 = v4[5];
    v4[5] = 0;
  }

  return v4;
}

- (ECEmailAddressComponents)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ECEmailAddressComponents;
  return -[ECEmailAddressComponents init](&v3, sel_init);
}

- (ECEmailAddressComponents)initWithString:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  id v7;
  id v8;
  id v9;
  ECEmailAddressComponents *v10;
  id v12;
  id v13;
  id v14;
  id v15;

  v4 = a3;
  v14 = 0;
  v15 = 0;
  v12 = 0;
  v13 = 0;
  v5 = +[ECEmailAddressParser parseEmailAddressString:displayName:localPart:domain:groupList:](ECEmailAddressParser, "parseEmailAddressString:displayName:localPart:domain:groupList:", v4, &v15, &v14, &v13, &v12);
  v6 = v15;
  v7 = v14;
  v8 = v13;
  v9 = v12;
  if (v5)
  {
    self = (ECEmailAddressComponents *)-[ECEmailAddressComponents _initWithString:displayName:localPart:domain:groupList:](self, "_initWithString:displayName:localPart:domain:groupList:", v4, v6, v7, v8, v9);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSArray)groupList
{
  ECEmailAddressComponents *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[NSArray objectEnumerator](v2->_groupList, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSArray *)v4;
}

- (id)_initWithString:(id)a3 displayName:(id)a4 localPart:(id)a5 domain:(id)a6 groupList:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  ECEmailAddressComponents *v16;
  ECEmailAddressComponents *v17;
  uint64_t v18;
  NSString *domain;
  uint64_t v20;
  objc_super v22;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)ECEmailAddressComponents;
  v16 = -[ECEmailAddressComponents init](&v22, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_displayName, a4);
    objc_storeStrong((id *)&v17->_localPart, a5);
    objc_storeStrong((id *)&v17->_groupList, a7);
    if (+[ECIDNAEncoder encodingRequiredForDomainName:](ECIDNAEncoder, "encodingRequiredForDomainName:", v14))
    {
      objc_msgSend(v14, "ecemailaddress_uniquedDomain");
      v18 = objc_claimAutoreleasedReturnValue();
      domain = v17->_domain;
      v17->_domain = (NSString *)v18;
    }
    else
    {
      objc_msgSend(v14, "ecemailaddress_uniquedDomain");
      v20 = objc_claimAutoreleasedReturnValue();
      domain = v17->_idnaDomain;
      v17->_idnaDomain = (NSString *)v20;
    }

  }
  return v17;
}

- (BOOL)_nts_getValidatedLocalPart:(id *)a3 domain:(id *)a4 idnaDomain:(id *)a5 displayName:(id *)a6
{
  void *v11;
  _BOOL4 v12;
  void *v13;
  BOOL v14;

  -[NSString ecemailaddress_trimmedAndQuotedDisplayName](self->_displayName, "ecemailaddress_trimmedAndQuotedDisplayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
    v12 = +[ECEmailAddressParser validateDisplayName:](ECEmailAddressParser, "validateDisplayName:", v11);
  else
    v12 = 1;
  -[NSString ecemailaddress_trimmedAndQuotedLocalPart](self->_localPart, "ecemailaddress_trimmedAndQuotedLocalPart");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length")
    && (v12 & +[ECEmailAddressParser validateLocalPart:](ECEmailAddressParser, "validateLocalPart:", v13)) == 1
    && -[ECEmailAddressComponents _nts_getValidatedDomain:idnaDomain:avoidReparse:](self, "_nts_getValidatedDomain:idnaDomain:avoidReparse:", a4, a5, 0))
  {
    if (a3)
      *a3 = objc_retainAutorelease(v13);
    if (a6)
      *a6 = objc_retainAutorelease(v11);
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)_nts_getValidatedDomain:(id *)a3 idnaDomain:(id *)a4 avoidReparse:(BOOL)a5
{
  void *v9;
  NSString *v10;
  NSString *domain;
  id v12;
  _BOOL4 v13;
  BOOL v14;

  if (self->_idnaDomain && !self->_domain)
  {
    +[ECIDNADecoder stringByDecodingDomainName:](ECIDNADecoder, "stringByDecodingDomainName:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ecemailaddress_uniquedDomain");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    domain = self->_domain;
    self->_domain = v10;

  }
  if (!self->_domain)
  {
    v12 = 0;
LABEL_15:
    v14 = 0;
    goto LABEL_16;
  }
  +[ECIDNAEncoder stringByEncodingDomainName:](ECIDNAEncoder, "stringByEncodingDomainName:");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = v12 != 0;
  if (v12 && !a5)
    v13 = +[ECEmailAddressParser validateDomain:](ECEmailAddressParser, "validateDomain:", self->_domain);
  if (!v13)
    goto LABEL_15;
  if (a3)
    *a3 = objc_retainAutorelease(self->_domain);
  if (a4)
  {
    v12 = objc_retainAutorelease(v12);
    *a4 = v12;
  }
  v14 = 1;
LABEL_16:

  return v14;
}

- (NSString)simpleAddress
{
  ECEmailAddressComponents *v2;
  NSString *simpleAddress;
  _BOOL4 v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *v11;
  NSString *v12;
  id v14;
  id v15;

  v2 = self;
  objc_sync_enter(v2);
  simpleAddress = v2->_simpleAddress;
  if (!simpleAddress)
  {
    if (v2->_groupList)
    {
      simpleAddress = 0;
    }
    else
    {
      v14 = 0;
      v15 = 0;
      v4 = -[ECEmailAddressComponents _nts_getValidatedLocalPart:domain:idnaDomain:displayName:](v2, "_nts_getValidatedLocalPart:domain:idnaDomain:displayName:", &v15, &v14, 0, 0);
      v5 = v15;
      v6 = v14;
      v7 = v6;
      if (v4)
      {
        v8 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "_lp_userVisibleHost");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("%@@%@"), v5, v9);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = v2->_simpleAddress;
        v2->_simpleAddress = (NSString *)v10;

      }
      simpleAddress = v2->_simpleAddress;
    }
  }
  v12 = simpleAddress;
  objc_sync_exit(v2);

  return v12;
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)_nts_isValidDomain
{
  BOOL v3;
  void *v4;
  char v5;

  v3 = -[ECEmailAddressComponents _nts_getValidatedDomain:idnaDomain:avoidReparse:](self, "_nts_getValidatedDomain:idnaDomain:avoidReparse:", 0, 0, 1);
  if (self->_groupList)
  {
    -[NSString ecemailaddress_trimmedAndQuotedDisplayName](self->_displayName, "ecemailaddress_trimmedAndQuotedDisplayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
      v5 = -[NSArray ef_all:](self->_groupList, "ef_all:", &__block_literal_global_156);
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }
  return v3 ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_groupList, 0);
  objc_storeStrong((id *)&self->_idnaDomain, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_localPart, 0);
  objc_storeStrong((id *)&self->_simpleAddress, 0);
}

+ (ECEmailAddressComponents)componentsWithString:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithString:", v4);

  return (ECEmailAddressComponents *)v5;
}

+ (ECEmailAddressComponents)componentsWithEmailAddress:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEmailAddress:", v4);

  return (ECEmailAddressComponents *)v5;
}

- (ECEmailAddressComponents)initWithEmailAddress:(id)a3
{
  id v4;
  void *v5;
  ECEmailAddressComponents *v6;

  v4 = a3;
  objc_msgSend(v4, "components");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (ECEmailAddressComponents *)objc_msgSend(v5, "copy");

  if (!v6)
    v6 = (ECEmailAddressComponents *)objc_msgSend(0, "init");

  return v6;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[ECEmailAddressComponents domain](self, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECEmailAddressComponents idnaDomain](self, "idnaDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37A0];
  v6 = objc_opt_class();
  -[ECEmailAddressComponents displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECEmailAddressComponents localPart](self, "localPart");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p> displayName=%@ localPart=%@ domain=%@"), v6, self, v7, v8, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) == 0)
    objc_msgSend(v9, "appendFormat:", CFSTR(" idnaDomain=%@"), v4);
  -[ECEmailAddressComponents groupList](self, "groupList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "ef_map:", &__block_literal_global_145);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR(" groupList={%@}"), v13);

  }
  return (NSString *)v9;
}

id __44__ECEmailAddressComponents_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "debugDescription");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)ef_publicDescription
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternal");
  v5 = (void *)MEMORY[0x1E0D1EF48];
  if (v4)
  {
    -[ECEmailAddressComponents simpleAddress](self, "simpleAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ECEmailAddressComponents localPart](self, "localPart");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ECEmailAddressComponents domain](self, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ec_partiallyRedactedStringForAddress:localPart:domain:", v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ECEmailAddressComponents simpleAddress](self, "simpleAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fullyRedactedStringForString:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> %@"), objc_opt_class(), self, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[ECEmailAddressComponents localPart](self, "localPart");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[ECEmailAddressComponents domain](self, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[ECEmailAddressComponents groupList](self, "groupList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 33 * (33 * v5 + v8) + objc_msgSend(v9, "hash") + 35937;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  ECEmailAddressComponents *v4;
  ECEmailAddressComponents *v5;
  uint64_t v6;
  uint64_t (**v7)(_QWORD, _QWORD, _QWORD);
  unsigned int (**v8)(_QWORD, _QWORD, _QWORD);
  ECEmailAddressComponents *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = (ECEmailAddressComponents *)a3;
  v5 = v4;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = MEMORY[0x1E0C809B0];
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __36__ECEmailAddressComponents_isEqual___block_invoke_2;
        v21[3] = &unk_1E7120E48;
        v22 = &__block_literal_global_149;
        v7 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCC97B8](v21);
        v19[0] = v6;
        v19[1] = 3221225472;
        v19[2] = __36__ECEmailAddressComponents_isEqual___block_invoke_4;
        v19[3] = &unk_1E7120E70;
        v20 = &__block_literal_global_149;
        v8 = (unsigned int (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCC97B8](v19);
        v9 = v5;
        -[ECEmailAddressComponents localPart](self, "localPart");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ECEmailAddressComponents domain](self, "domain");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[ECEmailAddressComponents localPart](v9, "localPart");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ECEmailAddressComponents domain](v9, "domain");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v10 || v12 || v11 || v13)
        {
          if (((uint64_t (**)(_QWORD, void *, void *))v7)[2](v7, v10, v12))
          {
            v16 = ((uint64_t (**)(_QWORD, void *, void *))v7)[2](v7, v11, v14);
            goto LABEL_15;
          }
        }
        else if (((unsigned int (**)(_QWORD, NSArray *, NSArray *))v8)[2](v8, self->_groupList, v9->_groupList))
        {
          -[ECEmailAddressComponents displayName](self, "displayName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[ECEmailAddressComponents displayName](v9, "displayName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = ((uint64_t (**)(_QWORD, void *, void *))v7)[2](v7, v18, v15);

LABEL_15:
          goto LABEL_16;
        }
        v16 = 0;
        goto LABEL_15;
      }
    }
    v16 = 0;
  }
LABEL_16:

  return v16;
}

uint64_t __36__ECEmailAddressComponents_isEqual___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  uint64_t v8;

  v6 = a4;
  v7 = v6;
  if (a2 && a3)
    v8 = (*((uint64_t (**)(id))v6 + 2))(v6);
  else
    v8 = (a2 | a3) == 0;

  return v8;
}

uint64_t __36__ECEmailAddressComponents_isEqual___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, id, id, _QWORD *);
  id v9;
  id v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __36__ECEmailAddressComponents_isEqual___block_invoke_3;
  v13[3] = &unk_1E7120E20;
  v14 = v5;
  v15 = v6;
  v8 = *(uint64_t (**)(uint64_t, id, id, _QWORD *))(v7 + 16);
  v9 = v6;
  v10 = v5;
  v11 = v8(v7, v10, v9, v13);

  return v11;
}

BOOL __36__ECEmailAddressComponents_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "compare:options:range:locale:", *(_QWORD *)(a1 + 40), 1, 0, objc_msgSend(*(id *)(a1 + 32), "length"), 0) == 0;
}

uint64_t __36__ECEmailAddressComponents_isEqual___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, id, id, _QWORD *);
  id v9;
  id v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __36__ECEmailAddressComponents_isEqual___block_invoke_5;
  v13[3] = &unk_1E7120E20;
  v14 = v5;
  v15 = v6;
  v8 = *(uint64_t (**)(uint64_t, id, id, _QWORD *))(v7 + 16);
  v9 = v6;
  v10 = v5;
  v11 = v8(v7, v10, v9, v13);

  return v11;
}

uint64_t __36__ECEmailAddressComponents_isEqual___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToSet:", v3);

  return v4;
}

- (NSString)localPart
{
  ECEmailAddressComponents *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_localPart;
  objc_sync_exit(v2);

  return v3;
}

- (void)setLocalPart:(id)a3
{
  ECEmailAddressComponents *v4;
  uint64_t v5;
  NSString *localPart;
  NSString *simpleAddress;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_localPart != v8)
  {
    v5 = -[NSString copy](v8, "copy");
    localPart = v4->_localPart;
    v4->_localPart = (NSString *)v5;

    simpleAddress = v4->_simpleAddress;
    v4->_simpleAddress = 0;

  }
  objc_sync_exit(v4);

}

- (NSString)domain
{
  ECEmailAddressComponents *v2;
  uint64_t v3;
  NSString *domain;
  NSString *v5;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_idnaDomain && !v2->_domain)
  {
    +[ECIDNADecoder stringByDecodingDomainName:](ECIDNADecoder, "stringByDecodingDomainName:");
    v3 = objc_claimAutoreleasedReturnValue();
    domain = v2->_domain;
    v2->_domain = (NSString *)v3;

  }
  v5 = v2->_domain;
  objc_sync_exit(v2);

  return v5;
}

- (void)setDomain:(id)a3
{
  id v4;
  ECEmailAddressComponents *v5;
  uint64_t v6;
  NSString *domain;
  NSString *idnaDomain;
  NSString *simpleAddress;
  NSString *v10;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(v4, "ecemailaddress_uniquedDomain");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v5->_domain != v10)
  {
    +[ECIDNADecoder stringByDecodingDomainName:](ECIDNADecoder, "stringByDecodingDomainName:");
    v6 = objc_claimAutoreleasedReturnValue();
    domain = v5->_domain;
    v5->_domain = (NSString *)v6;

    idnaDomain = v5->_idnaDomain;
    v5->_idnaDomain = 0;

    simpleAddress = v5->_simpleAddress;
    v5->_simpleAddress = 0;

  }
  objc_sync_exit(v5);

}

- (NSString)idnaDomain
{
  ECEmailAddressComponents *v2;
  uint64_t v3;
  NSString *idnaDomain;
  NSString *v5;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_domain && !v2->_idnaDomain)
  {
    +[ECIDNAEncoder stringByEncodingDomainName:](ECIDNAEncoder, "stringByEncodingDomainName:");
    v3 = objc_claimAutoreleasedReturnValue();
    idnaDomain = v2->_idnaDomain;
    v2->_idnaDomain = (NSString *)v3;

  }
  v5 = v2->_idnaDomain;
  objc_sync_exit(v2);

  return v5;
}

- (void)setIDNADomain:(id)a3
{
  id v4;
  ECEmailAddressComponents *v5;
  NSString *domain;
  NSString *simpleAddress;
  NSString *obj;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(v4, "ecemailaddress_uniquedDomain");
  obj = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v5->_idnaDomain != obj)
  {
    objc_storeStrong((id *)&v5->_idnaDomain, obj);
    domain = v5->_domain;
    v5->_domain = 0;

    simpleAddress = v5->_simpleAddress;
    v5->_simpleAddress = 0;

  }
  objc_sync_exit(v5);

}

- (void)setGroupList:(id)a3
{
  ECEmailAddressComponents *v4;
  uint64_t v5;
  NSArray *groupList;
  NSString *simpleAddress;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v8, "copy");
  groupList = v4->_groupList;
  v4->_groupList = (NSArray *)v5;

  simpleAddress = v4->_simpleAddress;
  v4->_simpleAddress = 0;

  objc_sync_exit(v4);
}

uint64_t __46__ECEmailAddressComponents__nts_isValidDomain__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_msgSend(v2, "groupList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 0;
  else
    v4 = objc_msgSend(v2, "_nts_isValidDomain");

  return v4;
}

uint64_t __40__ECEmailAddressComponents__nts_isValid__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_msgSend(v2, "groupList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 0;
  else
    v4 = objc_msgSend(v2, "_nts_isValid");

  return v4;
}

- (NSString)stringValue
{
  ECEmailAddressComponents *v2;
  ECEmailAddressFormatter *v3;
  id v4;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  if (-[ECEmailAddressComponents _nts_isValid](v2, "_nts_isValid"))
  {
    v3 = objc_alloc_init(ECEmailAddressFormatter);
    -[ECEmailAddressFormatter setShouldIncludeDisplayName:](v3, "setShouldIncludeDisplayName:", 1);
    v4 = -[ECEmailAddress _initWithComponents:]([ECEmailAddress alloc], "_initWithComponents:", v2);
    -[ECEmailAddressFormatter stringFromEmailAddress:](v3, "stringFromEmailAddress:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  objc_sync_exit(v2);

  return (NSString *)v5;
}

- (NSString)idnaAddress
{
  ECEmailAddressComponents *v2;
  id v3;
  id v4;
  _BOOL4 v5;
  void *v6;
  id v8;
  id v9;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_groupList)
  {
    v3 = 0;
    v4 = 0;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  v8 = 0;
  v9 = 0;
  v5 = -[ECEmailAddressComponents _nts_getValidatedLocalPart:domain:idnaDomain:displayName:](v2, "_nts_getValidatedLocalPart:domain:idnaDomain:displayName:", &v9, 0, &v8, 0);
  v4 = v9;
  v3 = v8;
  if (!v5)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@@%@"), v4, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  objc_sync_exit(v2);
  return (NSString *)v6;
}

@end
