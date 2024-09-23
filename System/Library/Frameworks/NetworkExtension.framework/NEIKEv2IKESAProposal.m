@implementation NEIKEv2IKESAProposal

- (NEIKEv2IKESAProposal)init
{
  NEIKEv2IKESAProposal *v2;
  NEIKEv2IKESAProposal *v3;
  NEIKEv2IKESAProposal *v4;
  NSObject *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NEIKEv2IKESAProposal;
  v2 = -[NEIKEv2IKESAProposal init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_19BD16000, v6, OS_LOG_TYPE_FAULT, "[super init] failed", v7, 2u);
    }

  }
  return v3;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  SEL v9;
  id Property;
  void *v11;
  const char *v12;
  void *v13;
  SEL v14;
  id v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  void *v20;
  SEL v21;
  id v22;
  void *v23;
  NEIKEv2AuthenticationProtocol *authenticationProtocol;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v8 = v7;
  if (self)
  {
    objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", self->_proposalNumber, CFSTR("Number"), v5, a4);
    Property = objc_getProperty(self, v9, 88, 1);
  }
  else
  {
    objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", 0, CFSTR("Number"), v5, a4);
    Property = 0;
  }
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", Property, CFSTR("Chosen Encryption"), v5, a4);
  -[NEIKEv2IKESAProposal encryptionProtocols](self, "encryptionProtocols");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("Encryption"), v5, a4);

  if (self)
  {
    objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v12, 96, 1), CFSTR("Chosen Integrity"), v5, a4);
    -[NEIKEv2IKESAProposal integrityProtocols](self, "integrityProtocols");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v13, CFSTR("Integrity"), v5, a4);

    v15 = objc_getProperty(self, v14, 104, 1);
  }
  else
  {
    objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", 0, CFSTR("Chosen Integrity"), v5, a4);
    objc_msgSend(0, "integrityProtocols");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v26, CFSTR("Integrity"), v5, a4);

    v15 = 0;
  }
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v15, CFSTR("Chosen PRF"), v5, a4);
  -[NEIKEv2IKESAProposal prfProtocols](self, "prfProtocols");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v16, CFSTR("PRF"), v5, a4);

  if (self)
  {
    objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v17, 112, 1), CFSTR("Chosen KE"), v5, a4);
    -[NEIKEv2IKESAProposal kemProtocols](self, "kemProtocols");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v18, CFSTR("KE"), v5, a4);

    -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](self);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v19, CFSTR("Chosen ADDKE"), v5, a4);

    -[NEIKEv2IKESAProposal additionalKEMProtocols](self, "additionalKEMProtocols");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v20, CFSTR("ADDKE"), v5, a4);

    v22 = objc_getProperty(self, v21, 80, 1);
  }
  else
  {
    objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", 0, CFSTR("Chosen KE"), v5, a4);
    objc_msgSend(0, "kemProtocols");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v27, CFSTR("KE"), v5, a4);

    -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v28, CFSTR("Chosen ADDKE"), v5, a4);

    objc_msgSend(0, "additionalKEMProtocols");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v29, CFSTR("ADDKE"), v5, a4);

    v22 = 0;
  }
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v22, CFSTR("Unsupported Transform Types"), v5, a4);
  -[NEIKEv2IKESAProposal eapProtocols](self, "eapProtocols");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v23, CFSTR("EAP"), v5, a4);

  if (-[NEIKEv2IKESAProposal lifetimeSeconds](self, "lifetimeSeconds"))
    objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", (int)-[NEIKEv2IKESAProposal lifetimeSeconds](self, "lifetimeSeconds"), CFSTR("Lifetime"), v5, a4);
  if (self)
    authenticationProtocol = self->_authenticationProtocol;
  else
    authenticationProtocol = 0;
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", authenticationProtocol, CFSTR("Authentication"), v5, a4);
  return v8;
}

- (id)description
{
  return -[NEIKEv2IKESAProposal descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  id v30;
  NEIKEv2IKESAProposal *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  const char *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  SEL v42;
  const char *v43;
  void *v44;
  const char *v45;
  unsigned __int8 proposalNumber;
  id Property;
  const char *v48;
  void *v49;
  const char *v50;
  id v51;
  const char *v52;
  void *v53;
  const char *v54;
  id v55;
  const char *v56;
  void *v57;
  const char *v58;
  id v59;
  const char *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  NEIKEv2AuthenticationProtocol *authenticationProtocol;
  void *v67;
  _BYTE *v69;
  id obj;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[NEIKEv2IKESAProposal encryptionProtocols](self, "encryptionProtocols");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NEIKEv2IKESAProposal encryptionProtocols](self, "encryptionProtocols");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithArray:copyItems:", v7, 1);
    objc_msgSend(v4, "setEncryptionProtocols:", v8);

  }
  -[NEIKEv2IKESAProposal integrityProtocols](self, "integrityProtocols");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NEIKEv2IKESAProposal integrityProtocols](self, "integrityProtocols");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithArray:copyItems:", v11, 1);
    objc_msgSend(v4, "setIntegrityProtocols:", v12);

  }
  -[NEIKEv2IKESAProposal prfProtocols](self, "prfProtocols");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NEIKEv2IKESAProposal prfProtocols](self, "prfProtocols");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithArray:copyItems:", v15, 1);
    objc_msgSend(v4, "setPrfProtocols:", v16);

  }
  -[NEIKEv2IKESAProposal kemProtocols](self, "kemProtocols");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NEIKEv2IKESAProposal kemProtocols](self, "kemProtocols");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithArray:copyItems:", v19, 1);
    objc_msgSend(v4, "setKemProtocols:", v20);

  }
  if (self
    && (-[NEIKEv2IKESAProposal additionalKEMProtocols](self, "additionalKEMProtocols"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v21,
        v21))
  {
    v69 = v4;
    v22 = objc_alloc(MEMORY[0x1E0C99E08]);
    -[NEIKEv2IKESAProposal additionalKEMProtocols](self, "additionalKEMProtocols");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithCapacity:", objc_msgSend(v23, "count"));

    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    -[NEIKEv2IKESAProposal additionalKEMProtocols](self, "additionalKEMProtocols");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v72 != v27)
            objc_enumerationMutation(obj);
          v29 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i);
          v30 = objc_alloc(MEMORY[0x1E0C99D20]);
          -[NEIKEv2IKESAProposal additionalKEMProtocols](self, "additionalKEMProtocols");
          v31 = self;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForKeyedSubscript:", v29);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (void *)objc_msgSend(v30, "initWithArray:copyItems:", v33, 1);
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v34, v29);

          self = v31;
        }
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
      }
      while (v26);
    }

    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v24);
    v4 = v69;
  }
  else
  {
    v35 = 0;
  }
  objc_msgSend(v4, "setAdditionalKEMProtocols:", v35, v69);

  -[NEIKEv2IKESAProposal eapProtocols](self, "eapProtocols");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    v38 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NEIKEv2IKESAProposal eapProtocols](self, "eapProtocols");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v38, "initWithArray:copyItems:", v39, 1);
    objc_msgSend(v4, "setEapProtocols:", v40);

  }
  if (self)
  {
    if (objc_getProperty(self, v37, 80, 1))
    {
      v41 = objc_alloc(MEMORY[0x1E0C99E60]);
      v44 = (void *)objc_msgSend(v41, "initWithSet:", objc_getProperty(self, v42, 80, 1));
      if (v4)
        objc_setProperty_atomic(v4, v43, v44, 80);

    }
    objc_msgSend(v4, "setLifetimeSeconds:", -[NEIKEv2IKESAProposal lifetimeSeconds](self, "lifetimeSeconds"));
    proposalNumber = self->_proposalNumber;
    if (v4)
      goto LABEL_28;
  }
  else
  {
    objc_msgSend(v4, "setLifetimeSeconds:", objc_msgSend(0, "lifetimeSeconds"));
    proposalNumber = 0;
    if (v4)
LABEL_28:
      v4[8] = proposalNumber;
  }
  if (self)
    Property = objc_getProperty(self, v45, 88, 1);
  else
    Property = 0;
  v49 = (void *)objc_msgSend(Property, "copy");
  if (v4)
    objc_setProperty_atomic(v4, v48, v49, 88);

  if (self)
    v51 = objc_getProperty(self, v50, 96, 1);
  else
    v51 = 0;
  v53 = (void *)objc_msgSend(v51, "copy");
  if (v4)
    objc_setProperty_atomic(v4, v52, v53, 96);

  if (self)
    v55 = objc_getProperty(self, v54, 104, 1);
  else
    v55 = 0;
  v57 = (void *)objc_msgSend(v55, "copy");
  if (v4)
    objc_setProperty_atomic(v4, v56, v57, 104);

  if (self)
    v59 = objc_getProperty(self, v58, 112, 1);
  else
    v59 = 0;
  v61 = (void *)objc_msgSend(v59, "copy");
  if (v4)
    objc_setProperty_atomic(v4, v60, v61, 112);

  -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](self);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    v63 = objc_alloc(MEMORY[0x1E0C99D80]);
    -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](self);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = (void *)objc_msgSend(v63, "initWithDictionary:copyItems:", v64, 1);
    -[NEIKEv2IKESAProposal setChosenAdditionalKEMProtocols:](v4, v65);

  }
  if (self)
    authenticationProtocol = self->_authenticationProtocol;
  else
    authenticationProtocol = 0;
  v67 = (void *)-[NEIKEv2AuthenticationProtocol copy](authenticationProtocol, "copy");
  -[NEConfigurationManager setAppGroupMap:]((uint64_t)v4, v67);

  return v4;
}

- (NSArray)encryptionProtocols
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEncryptionProtocols:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)integrityProtocols
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIntegrityProtocols:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSArray)prfProtocols
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPrfProtocols:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSArray)kemProtocols
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setKemProtocols:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDictionary)additionalKEMProtocols
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAdditionalKEMProtocols:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSArray)eapProtocols
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEapProtocols:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (unint64_t)lifetimeSeconds
{
  return self->_lifetimeSeconds;
}

- (void)setLifetimeSeconds:(unint64_t)a3
{
  self->_lifetimeSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationProtocol, 0);
  objc_storeStrong((id *)&self->_chosenAdditionalKETransforms, 0);
  objc_storeStrong((id *)&self->_chosenKEMProtocol, 0);
  objc_storeStrong((id *)&self->_chosenPRFProtocol, 0);
  objc_storeStrong((id *)&self->_chosenIntegrityProtocol, 0);
  objc_storeStrong((id *)&self->_chosenEncryptionProtocol, 0);
  objc_storeStrong((id *)&self->_unsupportedTransformTypes, 0);
  objc_storeStrong((id *)&self->_eapProtocols, 0);
  objc_storeStrong((id *)&self->_additionalKEMProtocols, 0);
  objc_storeStrong((id *)&self->_kemProtocols, 0);
  objc_storeStrong((id *)&self->_prfProtocols, 0);
  objc_storeStrong((id *)&self->_integrityProtocols, 0);
  objc_storeStrong((id *)&self->_encryptionProtocols, 0);
  objc_storeStrong((id *)&self->_chosenAdditionalKEMProtocols, 0);
}

- (id)chosenAdditionalKEMProtocols
{
  id *v1;
  id v2;

  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    v2 = v1[2];
    objc_sync_exit(v1);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)setChosenAdditionalKEMProtocols:(void *)a1
{
  void *v2;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id *v16;
  id v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v2 = a2;
  v24 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = v4;
  if (a1)
  {
    if (objc_msgSend(v4, "count"))
    {
      v18 = v2;
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v7 = v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v20 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
            objc_msgSend(v7, "objectForKeyedSubscript:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "method");

            if (v14)
              objc_msgSend(v6, "addObject:", v12);
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v9);
      }

      if (objc_msgSend(v6, "count"))
      {
        objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_);
        v15 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }
      v2 = v18;

    }
    else
    {
      v15 = 0;
    }
    v16 = a1;
    objc_sync_enter(v16);
    objc_storeStrong(v16 + 2, v2);
    v17 = v16[15];
    v16[15] = (id)v15;

    objc_sync_exit(v16);
  }

}

- (id)encryptionProtocol
{
  id v2;
  const char *v3;
  void *v4;

  v2 = self;
  if (self)
  {
    if (objc_getProperty(self, a2, 88, 1))
    {
      v2 = objc_getProperty(v2, v3, 88, 1);
    }
    else
    {
      objc_msgSend(v2, "encryptionProtocols");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstObject");
      v2 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return v2;
}

- (id)integrityProtocol
{
  id v2;
  const char *v3;
  void *v4;

  v2 = self;
  if (self)
  {
    if (objc_getProperty(self, a2, 96, 1))
    {
      v2 = objc_getProperty(v2, v3, 96, 1);
    }
    else
    {
      objc_msgSend(v2, "integrityProtocols");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstObject");
      v2 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return v2;
}

- (id)prfProtocol
{
  id v2;
  const char *v3;
  void *v4;

  v2 = self;
  if (self)
  {
    if (objc_getProperty(self, a2, 104, 1))
    {
      v2 = objc_getProperty(v2, v3, 104, 1);
    }
    else
    {
      objc_msgSend(v2, "prfProtocols");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstObject");
      v2 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return v2;
}

- (id)kemProtocol
{
  id v2;
  const char *v3;
  void *v4;

  v2 = self;
  if (self)
  {
    if (objc_getProperty(self, a2, 112, 1))
    {
      v2 = objc_getProperty(v2, v3, 112, 1);
    }
    else
    {
      objc_msgSend(v2, "kemProtocols");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstObject");
      v2 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return v2;
}

- (uint64_t)hasEAPMethods
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  objc_msgSend(a1, "eapProtocols", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v7;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v7 != v3)
          objc_enumerationMutation(v1);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * i), "method"))
        {
          v2 = 1;
          goto LABEL_12;
        }
      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_12:

  return v2;
}

- (NSObject)copyFromRemote:(int)a3 preferRemoteProposal:
{
  _BYTE *v5;
  _BYTE *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  const char *v26;
  char v27;
  void *v28;
  void *v29;
  const char *v30;
  void *v31;
  SEL v32;
  _QWORD *v33;
  unint64_t v34;
  SEL v35;
  unint64_t v36;
  BOOL v37;
  uint64_t v38;
  const char *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  void *v54;
  int v55;
  const char *v56;
  void *v57;
  void *v58;
  SEL v59;
  SEL v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t k;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t m;
  void *v73;
  void *v74;
  int v75;
  const char *v76;
  void *v77;
  void *v78;
  SEL v79;
  SEL v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  int v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t n;
  uint64_t v117;
  id v118;
  NEIKEv2KEMProtocol *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  void *v125;
  NSObject *v126;
  NSObject *v127;
  void *v129;
  NSObject *v130;
  void *v131;
  int v132;
  _BYTE *v133;
  void *v134;
  NSObject *v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  _BYTE v176[128];
  _BYTE v177[128];
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  _BYTE v181[128];
  _BYTE v182[128];
  _BYTE v183[128];
  _BYTE v184[128];
  uint8_t v185[128];
  uint8_t buf[4];
  const char *v187;
  uint64_t v188;

  v188 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!a1)
  {
    v126 = 0;
    goto LABEL_159;
  }
  if (!v5)
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v187 = "-[NEIKEv2IKESAProposal copyFromRemote:preferRemoteProposal:]";
      _os_log_fault_impl(&dword_19BD16000, v8, OS_LOG_TYPE_FAULT, "%s called with null remote", buf, 0xCu);
    }
    v126 = 0;
    goto LABEL_158;
  }
  v7 = objc_msgSend(a1, "copy");
  v8 = v7;
  if (!v6[8])
  {
    ne_log_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_156;
    *(_WORD *)buf = 0;
    v18 = "Remote proposal has invalid proposal number 0";
LABEL_106:
    _os_log_error_impl(&dword_19BD16000, v17, OS_LOG_TYPE_ERROR, v18, buf, 2u);
    goto LABEL_156;
  }
  if (v7)
    LOBYTE(v7[1].isa) = v6[8];
  if (a3)
  {
    v174 = 0uLL;
    v175 = 0uLL;
    v172 = 0uLL;
    v173 = 0uLL;
    objc_msgSend(v6, "encryptionProtocols");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v172, v185, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v173;
LABEL_9:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v173 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v172 + 1) + 8 * v13);
        -[NSObject encryptionProtocols](v8, "encryptionProtocols");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "indexOfObject:", v14);

        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v172, v185, 16);
          if (v11)
            goto LABEL_9;
          goto LABEL_26;
        }
      }
      -[NSObject encryptionProtocols](v8, "encryptionProtocols");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectAtIndexedSubscript:", v16);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v29;
      if (!v8)
      {

        goto LABEL_176;
      }
      objc_setProperty_atomic(v8, v30, v29, 88);

      v33 = objc_getProperty(v8, v32, 88, 1);
      if (!v33 || (v34 = v33[2], v34 > 0x1F) || ((1 << v34) & 0xD01C0000) == 0)
      {
LABEL_177:
        v27 = 0;
        goto LABEL_39;
      }
LABEL_38:
      v27 = 1;
LABEL_39:

      goto LABEL_40;
    }
  }
  else
  {
    v170 = 0uLL;
    v171 = 0uLL;
    v168 = 0uLL;
    v169 = 0uLL;
    -[NSObject encryptionProtocols](v7, "encryptionProtocols");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v168, v184, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v169;
LABEL_20:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v169 != v21)
          objc_enumerationMutation(v9);
        v23 = *(void **)(*((_QWORD *)&v168 + 1) + 8 * v22);
        objc_msgSend(v6, "encryptionProtocols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "containsObject:", v23);

        if (v25)
          break;
        if (v20 == ++v22)
        {
          v20 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v168, v184, 16);
          if (v20)
            goto LABEL_20;
          goto LABEL_26;
        }
      }
      if (!v8)
      {
LABEL_176:
        v33 = 0;
        goto LABEL_177;
      }
      objc_setProperty_atomic(v8, v26, v23, 88);
      v33 = objc_getProperty(v8, v35, 88, 1);
      if (!v33)
        goto LABEL_177;
      v36 = v33[2];
      v37 = v36 > 0x1F;
      v38 = (1 << v36) & 0xD01C0000;
      if (v37 || v38 == 0)
        goto LABEL_177;
      goto LABEL_38;
    }
  }
LABEL_26:
  v27 = 0;
LABEL_40:

  if (!v8 || !objc_getProperty(v8, v40, 88, 1))
  {
    ne_log_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_156;
    *(_WORD *)buf = 0;
    v18 = "No chosen encryption protocol";
    goto LABEL_106;
  }
  if ((v27 & 1) == 0)
  {
    if (a3)
    {
      v166 = 0uLL;
      v167 = 0uLL;
      v164 = 0uLL;
      v165 = 0uLL;
      objc_msgSend(v6, "integrityProtocols");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v164, v183, 16);
      if (v42)
      {
        v43 = v42;
        v44 = *(_QWORD *)v165;
        while (2)
        {
          for (i = 0; i != v43; ++i)
          {
            if (*(_QWORD *)v165 != v44)
              objc_enumerationMutation(v41);
            v46 = *(_QWORD *)(*((_QWORD *)&v164 + 1) + 8 * i);
            -[NSObject integrityProtocols](v8, "integrityProtocols");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v47, "indexOfObject:", v46);

            if (v48 != 0x7FFFFFFFFFFFFFFFLL)
            {
              -[NSObject integrityProtocols](v8, "integrityProtocols");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "objectAtIndexedSubscript:", v48);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_setProperty_atomic(v8, v59, v58, 96);

              goto LABEL_66;
            }
          }
          v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v164, v183, 16);
          if (v43)
            continue;
          break;
        }
      }
    }
    else
    {
      v162 = 0uLL;
      v163 = 0uLL;
      v160 = 0uLL;
      v161 = 0uLL;
      -[NSObject integrityProtocols](v8, "integrityProtocols");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v160, v182, 16);
      if (v49)
      {
        v50 = v49;
        v51 = *(_QWORD *)v161;
        while (2)
        {
          for (j = 0; j != v50; ++j)
          {
            if (*(_QWORD *)v161 != v51)
              objc_enumerationMutation(v41);
            v53 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * j);
            objc_msgSend(v6, "integrityProtocols");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend(v54, "containsObject:", v53);

            if (v55)
            {
              objc_setProperty_atomic(v8, v56, v53, 96);
              goto LABEL_66;
            }
          }
          v50 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v160, v182, 16);
          if (v50)
            continue;
          break;
        }
      }
    }
LABEL_66:

    if (!objc_getProperty(v8, v60, 96, 1))
    {
      ne_log_obj();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v18 = "No chosen integrity protocol";
        goto LABEL_106;
      }
      goto LABEL_156;
    }
  }
  if (a3)
  {
    v158 = 0uLL;
    v159 = 0uLL;
    v156 = 0uLL;
    v157 = 0uLL;
    objc_msgSend(v6, "prfProtocols");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v156, v181, 16);
    if (v62)
    {
      v63 = v62;
      v64 = *(_QWORD *)v157;
      while (2)
      {
        for (k = 0; k != v63; ++k)
        {
          if (*(_QWORD *)v157 != v64)
            objc_enumerationMutation(v61);
          v66 = *(_QWORD *)(*((_QWORD *)&v156 + 1) + 8 * k);
          -[NSObject prfProtocols](v8, "prfProtocols");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = objc_msgSend(v67, "indexOfObject:", v66);

          if (v68 != 0x7FFFFFFFFFFFFFFFLL)
          {
            -[NSObject prfProtocols](v8, "prfProtocols");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "objectAtIndexedSubscript:", v68);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_setProperty_atomic(v8, v79, v78, 104);

            goto LABEL_88;
          }
        }
        v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v156, v181, 16);
        if (v63)
          continue;
        break;
      }
    }
  }
  else
  {
    v154 = 0uLL;
    v155 = 0uLL;
    v152 = 0uLL;
    v153 = 0uLL;
    -[NSObject prfProtocols](v8, "prfProtocols");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v152, v180, 16);
    if (v69)
    {
      v70 = v69;
      v71 = *(_QWORD *)v153;
      while (2)
      {
        for (m = 0; m != v70; ++m)
        {
          if (*(_QWORD *)v153 != v71)
            objc_enumerationMutation(v61);
          v73 = *(void **)(*((_QWORD *)&v152 + 1) + 8 * m);
          objc_msgSend(v6, "prfProtocols");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = objc_msgSend(v74, "containsObject:", v73);

          if (v75)
          {
            objc_setProperty_atomic(v8, v76, v73, 104);
            goto LABEL_88;
          }
        }
        v70 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v152, v180, 16);
        if (v70)
          continue;
        break;
      }
    }
  }
LABEL_88:

  if (!objc_getProperty(v8, v80, 104, 1))
  {
    ne_log_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v18 = "No chosen PRF protocol";
      goto LABEL_106;
    }
LABEL_156:
    v126 = 0;
    goto LABEL_157;
  }
  -[NSObject kemProtocols](v8, "kemProtocols");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "kemProtocols");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "firstObject");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = objc_msgSend(v81, "indexOfObject:", v83);

  if (v84 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3)
    {
      v150 = 0uLL;
      v151 = 0uLL;
      v148 = 0uLL;
      v149 = 0uLL;
      objc_msgSend(v6, "kemProtocols");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v148, v179, 16);
      if (!v86)
        goto LABEL_115;
      v87 = v86;
      v88 = *(_QWORD *)v149;
LABEL_93:
      v89 = 0;
      while (1)
      {
        if (*(_QWORD *)v149 != v88)
          objc_enumerationMutation(v85);
        v90 = *(_QWORD *)(*((_QWORD *)&v148 + 1) + 8 * v89);
        -[NSObject kemProtocols](v8, "kemProtocols");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = objc_msgSend(v91, "indexOfObject:", v90);

        if (v92 != 0x7FFFFFFFFFFFFFFFLL)
          break;
        if (v87 == ++v89)
        {
          v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v148, v179, 16);
          if (!v87)
          {
LABEL_115:

            goto LABEL_153;
          }
          goto LABEL_93;
        }
      }
      -[NSObject kemProtocols](v8, "kemProtocols");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "objectAtIndexedSubscript:", v92);
      v17 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v146 = 0uLL;
      v147 = 0uLL;
      v144 = 0uLL;
      v145 = 0uLL;
      -[NSObject kemProtocols](v8, "kemProtocols");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v144, v178, 16);
      if (!v95)
        goto LABEL_115;
      v96 = v95;
      v97 = *(_QWORD *)v145;
LABEL_109:
      v98 = 0;
      while (1)
      {
        if (*(_QWORD *)v145 != v97)
          objc_enumerationMutation(v85);
        v99 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * v98);
        objc_msgSend(v6, "kemProtocols");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = objc_msgSend(v100, "containsObject:", v99);

        if (v101)
          break;
        if (v96 == ++v98)
        {
          v96 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v144, v178, 16);
          if (!v96)
            goto LABEL_115;
          goto LABEL_109;
        }
      }
      v17 = v99;
    }

    if (v17)
      goto LABEL_119;
    goto LABEL_153;
  }
  -[NSObject kemProtocols](v8, "kemProtocols");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "objectAtIndexedSubscript:", v84);
  v17 = objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
LABEL_153:
    ne_log_obj();
    v127 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, v127, OS_LOG_TYPE_ERROR, "No chosen KE method", buf, 2u);
    }

    v17 = 0;
    goto LABEL_156;
  }
LABEL_119:
  objc_setProperty_atomic(v8, v94, v17, 112);
  objc_msgSend(v6, "additionalKEMProtocols");
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v103)
  {
    -[NSObject additionalKEMProtocols](v8, "additionalKEMProtocols");
    v129 = (void *)objc_claimAutoreleasedReturnValue();

    if (v129)
      -[NEIKEv2IKESAProposal setChosenAdditionalKEMProtocols:](v8, MEMORY[0x1E0C9AA70]);
    v126 = v8;
    goto LABEL_157;
  }
  v132 = a3;
  v104 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v17, 0);
  v105 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v106 = 6;
  v131 = v105;
  v133 = v6;
  v135 = v8;
  while (1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject additionalKEMProtocols](v8, "additionalKEMProtocols");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "objectForKeyedSubscript:", v107);
    v109 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "additionalKEMProtocols");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "objectForKeyedSubscript:", v107);
    v111 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v111)
      goto LABEL_136;
    if (v109)
      break;
    v119 = -[NEIKEv2KEMProtocol initWithMethod:]([NEIKEv2KEMProtocol alloc], "initWithMethod:", 0);
    objc_msgSend(v105, "setObject:forKeyedSubscript:", v119, v107);

LABEL_136:
    v118 = 0;
LABEL_151:

    ++v106;
    v8 = v135;
    if (v106 == 13)
    {
      v125 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v105);
      -[NEIKEv2IKESAProposal setChosenAdditionalKEMProtocols:](v135, v125);

      v126 = v135;
      goto LABEL_170;
    }
  }
  v134 = v107;
  if (v132)
  {
    v142 = 0uLL;
    v143 = 0uLL;
    v140 = 0uLL;
    v141 = 0uLL;
    v112 = v111;
    v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v140, v177, 16);
    if (v113)
    {
      v114 = v113;
      v115 = *(_QWORD *)v141;
      do
      {
        for (n = 0; n != v114; ++n)
        {
          if (*(_QWORD *)v141 != v115)
            objc_enumerationMutation(v112);
          v117 = objc_msgSend(v109, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v140 + 1) + 8 * n));
          if (v117 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v109, "objectAtIndexedSubscript:", v117);
            v118 = (id)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v104, "containsObject:", v118))
              goto LABEL_148;

          }
        }
        v114 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v140, v177, 16);
      }
      while (v114);
      v111 = v112;
LABEL_163:
      v105 = v131;
      v107 = v134;
    }
    else
    {
      v111 = v112;
    }
LABEL_166:

  }
  else
  {
    v138 = 0uLL;
    v139 = 0uLL;
    v136 = 0uLL;
    v137 = 0uLL;
    v112 = v109;
    v120 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v136, v176, 16);
    if (!v120)
    {
      v109 = v112;
      goto LABEL_166;
    }
    v121 = v120;
    v122 = *(_QWORD *)v137;
LABEL_139:
    v123 = 0;
    while (1)
    {
      if (*(_QWORD *)v137 != v122)
        objc_enumerationMutation(v112);
      v124 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * v123);
      if ((objc_msgSend(v104, "containsObject:", v124) & 1) == 0)
      {
        if (objc_msgSend(v111, "containsObject:", v124))
          break;
      }
      if (v121 == ++v123)
      {
        v121 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v136, v176, 16);
        if (v121)
          goto LABEL_139;
        v109 = v112;
        goto LABEL_163;
      }
    }
    v118 = v124;
LABEL_148:

    v105 = v131;
    v107 = v134;
    if (v118)
    {
      objc_msgSend(v131, "setObject:forKeyedSubscript:", v118, v134);
      v6 = v133;
      if (objc_msgSend(v118, "method"))
        objc_msgSend(v104, "addObject:", v118);
      goto LABEL_151;
    }
  }
  v6 = v133;
  ne_log_obj();
  v130 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19BD16000, v130, OS_LOG_TYPE_ERROR, "No chosen additional KE methods", buf, 2u);
  }

  v126 = 0;
  v8 = v135;
LABEL_170:

LABEL_157:
LABEL_158:

LABEL_159:
  return v126;
}

- (void)matchesLocalProposal:(int)a3 preferRemoteProposal:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  const char *v18;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  NSObject *v28;
  char *v29;
  void *v30;
  const char *v31;
  unint64_t v32;
  BOOL v33;
  unsigned int v34;
  char v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  char *v77;
  void *v78;
  void *v79;
  NEIKEv2KEMProtocol *v80;
  void *v81;
  uint64_t v82;
  unint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  BOOL v89;
  id v90;
  void *v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  NSObject *v104;
  char *v105;
  void *v106;
  void *v107;
  void *v108;
  int v109;
  uint64_t v110;
  void *v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  unsigned __int8 v140;
  _BYTE v141[128];
  _BYTE v142[128];
  NEIKEv2KEMProtocol *v143;
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  uint8_t v147[128];
  uint8_t buf[4];
  const char *v149;
  __int16 v150;
  void *v151;
  _BYTE v152[128];
  uint64_t v153;

  v153 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!a1)
    goto LABEL_30;
  if (!v5)
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      goto LABEL_28;
    *(_DWORD *)buf = 136315138;
    v149 = "-[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:]";
    v18 = "%s called with null localProposal";
    goto LABEL_27;
  }
  objc_msgSend(a1, "encryptionProtocols");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    *(_DWORD *)buf = 136315138;
    v149 = "-[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:]";
    v15 = "BACKTRACE %s called with null self.encryptionProtocols";
LABEL_23:
    v16 = v14;
    v17 = 12;
    goto LABEL_24;
  }
  objc_msgSend(v6, "encryptionProtocols");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      goto LABEL_28;
    *(_DWORD *)buf = 136315138;
    v149 = "-[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:]";
    v18 = "%s called with null localProposal.encryptionProtocols";
LABEL_27:
    _os_log_fault_impl(&dword_19BD16000, v14, OS_LOG_TYPE_FAULT, v18, buf, 0xCu);
    goto LABEL_28;
  }
  objc_msgSend(a1, "prfProtocols");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    *(_DWORD *)buf = 136315138;
    v149 = "-[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:]";
    v15 = "BACKTRACE %s called with null self.prfProtocols";
    goto LABEL_23;
  }
  objc_msgSend(v6, "prfProtocols");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      goto LABEL_28;
    *(_DWORD *)buf = 136315138;
    v149 = "-[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:]";
    v18 = "%s called with null localProposal.prfProtocols";
    goto LABEL_27;
  }
  objc_msgSend(a1, "kemProtocols");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    *(_DWORD *)buf = 136315138;
    v149 = "-[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:]";
    v15 = "BACKTRACE %s called with null self.kemProtocols";
    goto LABEL_23;
  }
  objc_msgSend(v6, "kemProtocols");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      goto LABEL_28;
    *(_DWORD *)buf = 136315138;
    v149 = "-[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:]";
    v18 = "%s called with null localProposal.kemProtocols";
    goto LABEL_27;
  }
  if (objc_getProperty(a1, v13, 80, 1))
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v15 = "Not matching proposal with unsupported transform type";
LABEL_12:
      v16 = v14;
      v17 = 2;
LABEL_24:
      _os_log_error_impl(&dword_19BD16000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
    }
LABEL_28:

    goto LABEL_29;
  }
  v138 = 0u;
  v139 = 0u;
  v136 = 0u;
  v137 = 0u;
  objc_msgSend(v6, "encryptionProtocols");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v136, v152, 16);
  if (!v21)
    goto LABEL_39;
  v22 = v21;
  v23 = *(_QWORD *)v137;
LABEL_33:
  v24 = 0;
  while (1)
  {
    if (*(_QWORD *)v137 != v23)
      objc_enumerationMutation(v20);
    v25 = *(_QWORD *)(*((_QWORD *)&v136 + 1) + 8 * v24);
    objc_msgSend(a1, "encryptionProtocols");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "containsObject:", v25);

    if (v27)
      break;
    if (v22 == ++v24)
    {
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v136, v152, 16);
      if (!v22)
      {
LABEL_39:

        ne_log_large_obj();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(a1, "encryptionProtocols");
          v29 = (char *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "encryptionProtocols");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v149 = v29;
          v150 = 2112;
          v151 = v30;
          v31 = "Failed to match encryption algorithms (%@ vs %@)";
          goto LABEL_72;
        }
        goto LABEL_73;
      }
      goto LABEL_33;
    }
  }
  if (v25)
  {
    v32 = *(_QWORD *)(v25 + 16);
    v33 = v32 >= 0x20;
    v34 = (0xD01C0000 >> v32) & 1;
    if (v33)
      v35 = 0;
    else
      v35 = v34;
  }
  else
  {
    v35 = 0;
  }

  objc_msgSend(v6, "integrityProtocols");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v36, "count"))
  {
    objc_msgSend(a1, "integrityProtocols");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "count");

    if (v38)
    {
      v134 = 0u;
      v135 = 0u;
      v132 = 0u;
      v133 = 0u;
      objc_msgSend(v6, "integrityProtocols");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v132, v147, 16);
      if (!v40)
        goto LABEL_55;
      v41 = v40;
      v42 = *(_QWORD *)v133;
LABEL_49:
      v43 = 0;
      while (1)
      {
        if (*(_QWORD *)v133 != v42)
          objc_enumerationMutation(v39);
        v44 = *(_QWORD *)(*((_QWORD *)&v132 + 1) + 8 * v43);
        objc_msgSend(a1, "integrityProtocols");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v44) = objc_msgSend(v45, "containsObject:", v44);

        if ((v44 & 1) != 0)
          break;
        if (v41 == ++v43)
        {
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v132, v147, 16);
          if (!v41)
          {
LABEL_55:

            ne_log_large_obj();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(a1, "integrityProtocols");
              v29 = (char *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "integrityProtocols");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v149 = v29;
              v150 = 2112;
              v151 = v30;
              v31 = "Failed to match integrity algorithms (%@ vs %@)";
              goto LABEL_72;
            }
            goto LABEL_73;
          }
          goto LABEL_49;
        }
      }

      goto LABEL_62;
    }
  }
  else
  {

  }
  if ((v35 & 1) == 0)
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    *(_WORD *)buf = 0;
    v15 = "Failed to match integrity algorithms, none provided";
    goto LABEL_12;
  }
LABEL_62:
  v130 = 0u;
  v131 = 0u;
  v128 = 0u;
  v129 = 0u;
  objc_msgSend(v6, "prfProtocols");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v128, v146, 16);
  if (!v47)
    goto LABEL_70;
  v48 = v47;
  v49 = *(_QWORD *)v129;
LABEL_64:
  v50 = 0;
  while (1)
  {
    if (*(_QWORD *)v129 != v49)
      objc_enumerationMutation(v46);
    v51 = *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * v50);
    objc_msgSend(a1, "prfProtocols");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v51) = objc_msgSend(v52, "containsObject:", v51);

    if ((v51 & 1) != 0)
      break;
    if (v48 == ++v50)
    {
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v128, v146, 16);
      if (!v48)
      {
LABEL_70:

        ne_log_large_obj();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(a1, "prfProtocols");
          v29 = (char *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "prfProtocols");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v149 = v29;
          v150 = 2112;
          v151 = v30;
          v31 = "Failed to match PRF algorithms (%@ vs %@)";
LABEL_72:
          _os_log_impl(&dword_19BD16000, v28, OS_LOG_TYPE_INFO, v31, buf, 0x16u);

        }
LABEL_73:

LABEL_29:
        a1 = 0;
        goto LABEL_30;
      }
      goto LABEL_64;
    }
  }

  objc_msgSend(v6, "kemProtocols");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "kemProtocols");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "firstObject");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v53, "indexOfObject:", v55);

  if (v56 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3)
    {
      v126 = 0uLL;
      v127 = 0uLL;
      v124 = 0uLL;
      v125 = 0uLL;
      objc_msgSend(a1, "kemProtocols");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v124, v145, 16);
      if (!v58)
        goto LABEL_94;
      v59 = v58;
      v60 = *(_QWORD *)v125;
LABEL_78:
      v61 = 0;
      while (1)
      {
        if (*(_QWORD *)v125 != v60)
          objc_enumerationMutation(v57);
        v62 = *(_QWORD *)(*((_QWORD *)&v124 + 1) + 8 * v61);
        objc_msgSend(v6, "kemProtocols");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v63, "indexOfObject:", v62);

        if (v64 != 0x7FFFFFFFFFFFFFFFLL)
          break;
        if (v59 == ++v61)
        {
          v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v124, v145, 16);
          if (!v59)
          {
LABEL_94:

LABEL_101:
            ne_log_large_obj();
            v76 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(a1, "kemProtocols");
              v77 = (char *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "kemProtocols");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v149 = v77;
              v150 = 2112;
              v151 = v78;
              _os_log_impl(&dword_19BD16000, v76, OS_LOG_TYPE_INFO, "Failed to match Key Exchange methods (%@ vs %@)", buf, 0x16u);

            }
            v74 = 0;
            v140 = 0;
            goto LABEL_152;
          }
          goto LABEL_78;
        }
      }
      objc_msgSend(v6, "kemProtocols");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "objectAtIndexedSubscript:", v64);
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_98;
    }
    v122 = 0uLL;
    v123 = 0uLL;
    v120 = 0uLL;
    v121 = 0uLL;
    objc_msgSend(v6, "kemProtocols");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v120, v144, 16);
    if (!v66)
      goto LABEL_94;
    v67 = v66;
    v68 = *(_QWORD *)v121;
LABEL_88:
    v69 = 0;
    while (1)
    {
      if (*(_QWORD *)v121 != v68)
        objc_enumerationMutation(v57);
      v70 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * v69);
      objc_msgSend(a1, "kemProtocols");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v71, "containsObject:", v70);

      if (v72)
        break;
      if (v67 == ++v69)
      {
        v67 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v120, v144, 16);
        if (!v67)
          goto LABEL_94;
        goto LABEL_88;
      }
    }
    v65 = v70;
  }
  else
  {
    objc_msgSend(v6, "kemProtocols");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "objectAtIndexedSubscript:", v56);
    v65 = (id)objc_claimAutoreleasedReturnValue();
  }
  v74 = v65;
LABEL_98:

  if (!v74)
    goto LABEL_101;
  objc_msgSend(a1, "additionalKEMProtocols");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (v75)
  {

  }
  else
  {
    objc_msgSend(v6, "additionalKEMProtocols");
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v79)
    {
      v140 = 1;
      goto LABEL_152;
    }
  }
  v80 = -[NEIKEv2KEMProtocol initWithMethod:]([NEIKEv2KEMProtocol alloc], "initWithMethod:", 0);
  v143 = v80;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v143, 1);
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  v107 = v74;
  v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v74, 0);
  v82 = 6;
  v83 = 0x1E0CB3000uLL;
  v109 = a3;
  while (1)
  {
    objc_msgSend(*(id *)(v83 + 2024), "numberWithUnsignedInteger:", v82);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "additionalKEMProtocols");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "objectForKeyedSubscript:", v84);
    v86 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "additionalKEMProtocols");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "objectForKeyedSubscript:", v84);
    v88 = objc_claimAutoreleasedReturnValue();

    if (v86 | v88)
      break;
LABEL_140:

    if (++v82 == 13)
    {
      v140 = 1;
      goto LABEL_151;
    }
  }
  if (v86)
    v89 = v88 == 0;
  else
    v89 = 1;
  if (v89)
  {
    if (v86)
      v88 = (uint64_t)v108;
    else
      v86 = (uint64_t)v108;
    v90 = v108;
  }
  v110 = v82;
  v111 = v84;
  if (a3)
  {
    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    v91 = (void *)v88;
    v92 = (id)v88;
    v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v116, v142, 16);
    if (!v93)
    {
      v103 = v92;
      goto LABEL_148;
    }
    v94 = v93;
    v95 = (void *)v86;
    v96 = *(_QWORD *)v117;
LABEL_119:
    v97 = 0;
    while (1)
    {
      if (*(_QWORD *)v117 != v96)
        objc_enumerationMutation(v92);
      v98 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * v97);
      if ((objc_msgSend(v81, "containsObject:", v98) & 1) == 0)
      {
        if (objc_msgSend(v95, "containsObject:", v98))
          goto LABEL_137;
      }
      if (v94 == ++v97)
      {
        v94 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v116, v142, 16);
        if (v94)
          goto LABEL_119;
        v103 = v92;
        v84 = v111;
        v86 = (uint64_t)v95;
        goto LABEL_148;
      }
    }
  }
  v91 = (void *)v88;
  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  v92 = (id)v86;
  v99 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v112, v141, 16);
  if (v99)
  {
    v100 = v99;
    v95 = (void *)v86;
    v101 = *(_QWORD *)v113;
LABEL_129:
    v102 = 0;
    while (1)
    {
      if (*(_QWORD *)v113 != v101)
        objc_enumerationMutation(v92);
      v98 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * v102);
      if ((objc_msgSend(v81, "containsObject:", v98) & 1) == 0)
      {
        if (objc_msgSend(v91, "containsObject:", v98))
          break;
      }
      if (v100 == ++v102)
      {
        v100 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v112, v141, 16);
        if (v100)
          goto LABEL_129;
        v86 = (uint64_t)v92;
        v84 = v111;
        goto LABEL_147;
      }
    }
LABEL_137:
    if (objc_msgSend(v98, "method"))
      objc_msgSend(v81, "addObject:", v98);

    v82 = v110;
    v84 = v111;
    a3 = v109;
    v83 = 0x1E0CB3000;
    goto LABEL_140;
  }
  v86 = (uint64_t)v92;
LABEL_147:
  v103 = v91;
LABEL_148:

  ne_log_large_obj();
  v104 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(a1, "additionalKEMProtocols");
    v105 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "additionalKEMProtocols");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v149 = v105;
    v150 = 2112;
    v151 = v106;
    _os_log_impl(&dword_19BD16000, v104, OS_LOG_TYPE_INFO, "Failed to match Additional Key Exchange methods (%@ vs %@)", buf, 0x16u);

  }
  v140 = 0;

LABEL_151:
  v74 = v107;
LABEL_152:

  a1 = (void *)v140;
LABEL_30:

  return a1;
}

- (char)softLifetimeSecondsForInitiator:(char *)result
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;

  if (result)
  {
    v3 = result;
    v4 = objc_msgSend(result, "lifetimeSeconds");
    v5 = objc_msgSend(v3, "lifetimeSeconds");
    v6 = v5;
    if (v4 < 0xB)
    {
      result = (char *)objc_msgSend(v3, "lifetimeSeconds");
      v8 = -2;
      if (!a2)
        v8 = -1;
      v9 = &result[v8];
      if (v6 >= 2)
        return v9;
    }
    else
    {
      v7 = 8;
      if (!a2)
        v7 = 9;
      return (char *)(v5 * v7 / 0xAuLL);
    }
  }
  return result;
}

- (uint64_t)isAValidResponse
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  unint64_t v13;
  void *v14;
  _QWORD *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (objc_getProperty(a1, a2, 80, 1))
    return 0;
  if (!a1[8])
    return 0;
  objc_msgSend(a1, "kemProtocols");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 != 1)
    return 0;
  objc_msgSend(a1, "prfProtocols");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 != 1)
    return 0;
  objc_msgSend(a1, "encryptionProtocols");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 != 1)
    return 0;
  objc_msgSend(a1, "encryptionProtocols");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {

    goto LABEL_11;
  }
  v13 = v12[2] - 29;

  if (v13 < 3)
    return 0;
LABEL_11:
  objc_msgSend(a1, "encryptionProtocols");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v15 && (v16 = v15[2] - 18, v16 <= 0xD))
    v17 = qword_19BED73A8[v16];
  else
    v17 = 1;

  objc_msgSend(a1, "integrityProtocols");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19 != v17)
    return 0;
  objc_msgSend(a1, "additionalKEMProtocols");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
    return 1;
  objc_msgSend(a1, "additionalKEMProtocols");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v21, "count") + 1);
  objc_msgSend(a1, "kemProtocols");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v24);

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v25 = v21;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v33 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(v25, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i), (_QWORD)v32);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v30, "count") != 1)
          goto LABEL_32;
        objc_msgSend(v30, "firstObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v22, "containsObject:", v31) & 1) != 0)
        {

LABEL_32:
          v3 = 0;
          goto LABEL_33;
        }
        if (objc_msgSend(v31, "method"))
          objc_msgSend(v22, "addObject:", v31);

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      v3 = 1;
      if (v27)
        continue;
      break;
    }
  }
  else
  {
    v3 = 1;
  }
LABEL_33:

  return v3;
}

+ (NSObject)chooseSAProposalFromLocalProposals:(void *)a3 remoteProposals:(int)a4 preferRemoteProposals:
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *j;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  const char *v25;
  void *v26;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint8_t v38[128];
  uint8_t buf[4];
  const char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_opt_self();
  v26 = v6;
  if (!v6)
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
LABEL_29:
      v9 = 0;
      goto LABEL_25;
    }
    *(_DWORD *)buf = 136315138;
    v40 = "+[NEIKEv2IKESAProposal chooseSAProposalFromLocalProposals:remoteProposals:preferRemoteProposals:]";
    v25 = "%s called with null localProposals";
LABEL_31:
    _os_log_fault_impl(&dword_19BD16000, v8, OS_LOG_TYPE_FAULT, v25, buf, 0xCu);
    goto LABEL_29;
  }
  if (!v7)
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      goto LABEL_29;
    *(_DWORD *)buf = 136315138;
    v40 = "+[NEIKEv2IKESAProposal chooseSAProposalFromLocalProposals:remoteProposals:preferRemoteProposals:]";
    v25 = "%s called with null remoteProposals";
    goto LABEL_31;
  }
  if (a4)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v8 = v7;
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v34;
      v11 = MEMORY[0x1E0C809B0];
      while (2)
      {
        for (i = 0; i != v9; i = ((char *)i + 1))
        {
          if (*(_QWORD *)v34 != v10)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          v32[0] = v11;
          v32[1] = 3221225472;
          v32[2] = __97__NEIKEv2IKESAProposal_chooseSAProposalFromLocalProposals_remoteProposals_preferRemoteProposals___block_invoke;
          v32[3] = &unk_1E3CC0A00;
          v32[4] = v13;
          v14 = objc_msgSend(v26, "indexOfObjectPassingTest:", v32, v26);
          if (v14 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v26, "objectAtIndexedSubscript:", v14);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v20;
            v22 = v13;
            v23 = 1;
            goto LABEL_24;
          }
        }
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        if (v9)
          continue;
        break;
      }
    }
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v8 = v6;
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    if (v9)
    {
      v15 = *(_QWORD *)v29;
      v16 = MEMORY[0x1E0C809B0];
      while (2)
      {
        for (j = 0; j != v9; j = ((char *)j + 1))
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(v8);
          v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j);
          v27[0] = v16;
          v27[1] = 3221225472;
          v27[2] = __97__NEIKEv2IKESAProposal_chooseSAProposalFromLocalProposals_remoteProposals_preferRemoteProposals___block_invoke_2;
          v27[3] = &unk_1E3CC0A00;
          v27[4] = v18;
          v19 = objc_msgSend(v7, "indexOfObjectPassingTest:", v27, v26);
          if (v19 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v7, "objectAtIndexedSubscript:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v18;
            v22 = v21;
            v23 = 0;
LABEL_24:
            v9 = -[NEIKEv2IKESAProposal copyFromRemote:preferRemoteProposal:](v20, v22, v23);

            goto LABEL_25;
          }
        }
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        if (v9)
          continue;
        break;
      }
    }
  }
LABEL_25:

  return v9;
}

void *__97__NEIKEv2IKESAProposal_chooseSAProposalFromLocalProposals_remoteProposals_preferRemoteProposals___block_invoke(uint64_t a1, void *a2)
{
  return -[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:](*(void **)(a1 + 32), a2, 1);
}

void *__97__NEIKEv2IKESAProposal_chooseSAProposalFromLocalProposals_remoteProposals_preferRemoteProposals___block_invoke_2(uint64_t a1, void *a2)
{
  return -[NEIKEv2IKESAProposal matchesLocalProposal:preferRemoteProposal:](a2, *(void **)(a1 + 32), 0);
}

@end
