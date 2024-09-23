@implementation NEIKEv2ChildSAProposal

- (NEIKEv2ChildSAProposal)init
{
  NEIKEv2ChildSAProposal *v2;
  NEIKEv2ChildSAProposal *v3;
  NEIKEv2ChildSAProposal *v4;
  NSObject *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NEIKEv2ChildSAProposal;
  v2 = -[NEIKEv2ChildSAProposal init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NEIKEv2ChildSAProposal setProtocol:](v2, "setProtocol:", 3);
    v3->_noESNTransformPresent = 1;
    v4 = v3;
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
  SEL v10;
  SEL v11;
  id Property;
  void *v13;
  const char *v14;
  void *v15;
  SEL v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  const char *v21;
  id v22;
  void *v24;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v8 = v7;
  if (self)
  {
    objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", self->_proposalNumber, CFSTR("Number"), v5, a4);
    objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v9, 80, 1), CFSTR("Local SPI"), v5, a4);
    objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v10, 88, 1), CFSTR("Remote SPI"), v5, a4);
    Property = objc_getProperty(self, v11, 96, 1);
  }
  else
  {
    objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", 0, CFSTR("Number"), v5, a4);
    objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", 0, CFSTR("Local SPI"), v5, a4);
    objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", 0, CFSTR("Remote SPI"), v5, a4);
    Property = 0;
  }
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", Property, CFSTR("Chosen Encryption"), v5, a4);
  -[NEIKEv2ChildSAProposal encryptionProtocols](self, "encryptionProtocols");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v13, CFSTR("Encryption"), v5, a4);

  if (self)
  {
    objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v14, 104, 1), CFSTR("Chosen Integrity"), v5, a4);
    -[NEIKEv2ChildSAProposal integrityProtocols](self, "integrityProtocols");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v15, CFSTR("Integrity"), v5, a4);

    v17 = objc_getProperty(self, v16, 112, 1);
  }
  else
  {
    objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", 0, CFSTR("Chosen Integrity"), v5, a4);
    objc_msgSend(0, "integrityProtocols");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v24, CFSTR("Integrity"), v5, a4);

    v17 = 0;
  }
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v17, CFSTR("Chosen KE"), v5, a4);
  -[NEIKEv2ChildSAProposal kemProtocols](self, "kemProtocols");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v18, CFSTR("KE"), v5, a4);

  -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](self);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v19, CFSTR("Chosen ADDKE"), v5, a4);

  -[NEIKEv2ChildSAProposal additionalKEMProtocols](self, "additionalKEMProtocols");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v20, CFSTR("ADDKE"), v5, a4);

  if (self)
    v22 = objc_getProperty(self, v21, 72, 1);
  else
    v22 = 0;
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v22, CFSTR("Unsupported Transform Types"), v5, a4);
  if (-[NEIKEv2ChildSAProposal lifetimeSeconds](self, "lifetimeSeconds"))
    objc_msgSend(v8, "appendPrettyInt:withName:andIndent:options:", (int)-[NEIKEv2ChildSAProposal lifetimeSeconds](self, "lifetimeSeconds"), CFSTR("Lifetime"), v5, a4);
  return v8;
}

- (id)description
{
  return -[NEIKEv2ChildSAProposal descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  BOOL v14;
  id Property;
  id v16;
  SEL v17;
  id v18;
  const char *v19;
  void *v20;
  id v21;
  id v22;
  SEL v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  const char *v31;
  id v32;
  id v33;
  SEL v34;
  id v35;
  const char *v36;
  void *v37;
  id v38;
  id v39;
  SEL v40;
  int v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  const char *v48;
  id v49;
  id v50;
  SEL v51;
  id v52;
  const char *v53;
  void *v54;
  id v55;
  id v56;
  SEL v57;
  int v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  unint64_t v72;

  v4 = a3;
  if (v4 && objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[NEIKEv2ChildSAProposal protocol](self, "protocol");
    if (v6 == objc_msgSend(v5, "protocol"))
    {
      -[NEIKEv2ChildSAProposal encryptionProtocols](self, "encryptionProtocols");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "encryptionProtocols");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[NEIKEv2ChildSAProposal encryptionProtocols](self, "encryptionProtocols");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "encryptionProtocols");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_47;
      }
      if (self)
        Property = objc_getProperty(self, v13, 96, 1);
      else
        Property = 0;
      v16 = Property;
      v18 = objc_getProperty(v5, v17, 96, 1);
      if (v16 == v18)
      {

      }
      else
      {
        v20 = v18;
        if (self)
          v21 = objc_getProperty(self, v19, 96, 1);
        else
          v21 = 0;
        v22 = v21;
        v24 = objc_msgSend(v22, "isEqual:", objc_getProperty(v5, v23, 96, 1));

        if (!v24)
          goto LABEL_47;
      }
      -[NEIKEv2ChildSAProposal integrityProtocols](self, "integrityProtocols");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "integrityProtocols");
      v26 = objc_claimAutoreleasedReturnValue();
      if (v25 == (void *)v26)
      {

      }
      else
      {
        v27 = (void *)v26;
        -[NEIKEv2ChildSAProposal integrityProtocols](self, "integrityProtocols");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "integrityProtocols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v28, "isEqual:", v29);

        if (!v30)
          goto LABEL_47;
      }
      if (self)
        v32 = objc_getProperty(self, v31, 104, 1);
      else
        v32 = 0;
      v33 = v32;
      v35 = objc_getProperty(v5, v34, 104, 1);
      if (v33 == v35)
      {

      }
      else
      {
        v37 = v35;
        if (self)
          v38 = objc_getProperty(self, v36, 104, 1);
        else
          v38 = 0;
        v39 = v38;
        v41 = objc_msgSend(v39, "isEqual:", objc_getProperty(v5, v40, 104, 1));

        if (!v41)
          goto LABEL_47;
      }
      -[NEIKEv2ChildSAProposal kemProtocols](self, "kemProtocols");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "kemProtocols");
      v43 = objc_claimAutoreleasedReturnValue();
      if (v42 == (void *)v43)
      {

      }
      else
      {
        v44 = (void *)v43;
        -[NEIKEv2ChildSAProposal kemProtocols](self, "kemProtocols");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "kemProtocols");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v45, "isEqual:", v46);

        if (!v47)
          goto LABEL_47;
      }
      if (self)
        v49 = objc_getProperty(self, v48, 112, 1);
      else
        v49 = 0;
      v50 = v49;
      v52 = objc_getProperty(v5, v51, 112, 1);
      if (v50 == v52)
      {

      }
      else
      {
        v54 = v52;
        if (self)
          v55 = objc_getProperty(self, v53, 112, 1);
        else
          v55 = 0;
        v56 = v55;
        v58 = objc_msgSend(v56, "isEqual:", objc_getProperty(v5, v57, 112, 1));

        if (!v58)
          goto LABEL_47;
      }
      -[NEIKEv2ChildSAProposal additionalKEMProtocols](self, "additionalKEMProtocols");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "additionalKEMProtocols");
      v60 = objc_claimAutoreleasedReturnValue();
      if (v59 == (void *)v60)
      {

      }
      else
      {
        v61 = (void *)v60;
        -[NEIKEv2ChildSAProposal additionalKEMProtocols](self, "additionalKEMProtocols");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "additionalKEMProtocols");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v62, "isEqual:", v63);

        if (!v64)
          goto LABEL_47;
      }
      -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](self);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](v5);
      v66 = objc_claimAutoreleasedReturnValue();
      if (v65 == (void *)v66)
      {

      }
      else
      {
        v67 = (void *)v66;
        -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](self);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](v5);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend(v68, "isEqual:", v69);

        if (!v70)
          goto LABEL_47;
      }
      v72 = -[NEIKEv2ChildSAProposal lifetimeSeconds](self, "lifetimeSeconds");
      v14 = v72 == objc_msgSend(v5, "lifetimeSeconds");
      goto LABEL_48;
    }
LABEL_47:
    v14 = 0;
LABEL_48:

    goto LABEL_49;
  }
  v14 = 0;
LABEL_49:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  id Property;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;

  v3 = -[NEIKEv2ChildSAProposal protocol](self, "protocol");
  -[NEIKEv2ChildSAProposal encryptionProtocols](self, "encryptionProtocols");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  if (self)
    Property = objc_getProperty(self, v6, 96, 1);
  else
    Property = 0;
  v8 = objc_msgSend(Property, "hash");
  -[NEIKEv2ChildSAProposal integrityProtocols](self, "integrityProtocols");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");

  if (self)
    v12 = objc_getProperty(self, v11, 104, 1);
  else
    v12 = 0;
  v13 = objc_msgSend(v12, "hash");
  -[NEIKEv2ChildSAProposal kemProtocols](self, "kemProtocols");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");

  if (self)
    v17 = objc_getProperty(self, v16, 112, 1);
  else
    v17 = 0;
  v18 = v5 ^ v3 ^ v8 ^ v10 ^ v13 ^ v15 ^ objc_msgSend(v17, "hash");
  -[NEIKEv2ChildSAProposal additionalKEMProtocols](self, "additionalKEMProtocols");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hash");

  -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](self);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");

  return v18 ^ v22 ^ -[NEIKEv2ChildSAProposal lifetimeSeconds](self, "lifetimeSeconds");
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  void *v5;
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  unint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  SEL v33;
  id v34;
  SEL v35;
  const char *v36;
  void *v37;
  const char *v38;
  unsigned __int8 proposalNumber;
  id Property;
  const char *v41;
  void *v42;
  const char *v43;
  id v44;
  const char *v45;
  void *v46;
  const char *v47;
  id v48;
  const char *v49;
  void *v50;
  const char *v51;
  id v52;
  const char *v53;
  void *v54;
  const char *v55;
  id v56;
  const char *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  _BYTE *v64;
  id obj;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setProtocol:", -[NEIKEv2ChildSAProposal protocol](self, "protocol"));
  -[NEIKEv2ChildSAProposal encryptionProtocols](self, "encryptionProtocols");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0x1E0C99000uLL;
  if (v5)
  {
    v7 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NEIKEv2ChildSAProposal encryptionProtocols](self, "encryptionProtocols");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithArray:copyItems:", v8, 1);
    objc_msgSend(v4, "setEncryptionProtocols:", v9);

  }
  -[NEIKEv2ChildSAProposal integrityProtocols](self, "integrityProtocols");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NEIKEv2ChildSAProposal integrityProtocols](self, "integrityProtocols");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithArray:copyItems:", v12, 1);
    objc_msgSend(v4, "setIntegrityProtocols:", v13);

  }
  -[NEIKEv2ChildSAProposal kemProtocols](self, "kemProtocols");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NEIKEv2ChildSAProposal kemProtocols](self, "kemProtocols");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithArray:copyItems:", v16, 1);
    objc_msgSend(v4, "setKemProtocols:", v17);

  }
  if (!self)
  {
    objc_msgSend(v4, "setAdditionalKEMProtocols:", 0);
    v37 = 0;
LABEL_21:

    goto LABEL_22;
  }
  -[NEIKEv2ChildSAProposal additionalKEMProtocols](self, "additionalKEMProtocols");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v64 = v4;
    v19 = objc_alloc(MEMORY[0x1E0C99E08]);
    -[NEIKEv2ChildSAProposal additionalKEMProtocols](self, "additionalKEMProtocols");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithCapacity:", objc_msgSend(v20, "count"));

    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    -[NEIKEv2ChildSAProposal additionalKEMProtocols](self, "additionalKEMProtocols");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v67 != v24)
            objc_enumerationMutation(obj);
          v26 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i);
          v27 = v6;
          v28 = objc_alloc(*(Class *)(v6 + 3360));
          -[NEIKEv2ChildSAProposal additionalKEMProtocols](self, "additionalKEMProtocols");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKeyedSubscript:", v26);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)objc_msgSend(v28, "initWithArray:copyItems:", v30, 1);
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v31, v26);

          v6 = v27;
        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
      }
      while (v23);
    }

    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v21);
    v4 = v64;
  }
  else
  {
    v32 = 0;
  }
  objc_msgSend(v4, "setAdditionalKEMProtocols:", v32, v64);

  if (objc_getProperty(self, v33, 72, 1))
  {
    v34 = objc_alloc(MEMORY[0x1E0C99E60]);
    v37 = (void *)objc_msgSend(v34, "initWithSet:", objc_getProperty(self, v35, 72, 1));
    if (v4)
      objc_setProperty_atomic(v4, v36, v37, 72);
    goto LABEL_21;
  }
LABEL_22:
  objc_msgSend(v4, "setLifetimeSeconds:", -[NEIKEv2ChildSAProposal lifetimeSeconds](self, "lifetimeSeconds"));
  if (self)
  {
    proposalNumber = self->_proposalNumber;
    if (!v4)
      goto LABEL_25;
    goto LABEL_24;
  }
  proposalNumber = 0;
  if (v4)
LABEL_24:
    v4[8] = proposalNumber;
LABEL_25:
  if (self)
    Property = objc_getProperty(self, v38, 80, 1);
  else
    Property = 0;
  v42 = (void *)objc_msgSend(Property, "copy");
  if (v4)
    objc_setProperty_atomic(v4, v41, v42, 80);

  if (self)
    v44 = objc_getProperty(self, v43, 88, 1);
  else
    v44 = 0;
  v46 = (void *)objc_msgSend(v44, "copy");
  if (v4)
    objc_setProperty_atomic(v4, v45, v46, 88);

  if (self)
    v48 = objc_getProperty(self, v47, 96, 1);
  else
    v48 = 0;
  v50 = (void *)objc_msgSend(v48, "copy");
  if (v4)
    objc_setProperty_atomic(v4, v49, v50, 96);

  if (self)
    v52 = objc_getProperty(self, v51, 104, 1);
  else
    v52 = 0;
  v54 = (void *)objc_msgSend(v52, "copy");
  if (v4)
    objc_setProperty_atomic(v4, v53, v54, 104);

  if (self)
    v56 = objc_getProperty(self, v55, 112, 1);
  else
    v56 = 0;
  v58 = (void *)objc_msgSend(v56, "copy");
  if (v4)
    objc_setProperty_atomic(v4, v57, v58, 112);

  -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](self);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    v60 = objc_alloc(MEMORY[0x1E0C99D80]);
    -[NEIKEv2IKESAProposal chosenAdditionalKEMProtocols](self);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (void *)objc_msgSend(v60, "initWithDictionary:copyItems:", v61, 1);
    -[NEIKEv2IKESAProposal setChosenAdditionalKEMProtocols:](v4, v62);

  }
  return v4;
}

- (unint64_t)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(unint64_t)a3
{
  self->_protocol = a3;
}

- (NSArray)encryptionProtocols
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEncryptionProtocols:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSArray)integrityProtocols
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIntegrityProtocols:(id)a3
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
  objc_storeStrong((id *)&self->_chosenAdditionalKETransforms, 0);
  objc_storeStrong((id *)&self->_chosenKEMProtocol, 0);
  objc_storeStrong((id *)&self->_chosenIntegrityProtocol, 0);
  objc_storeStrong((id *)&self->_chosenEncryptionProtocol, 0);
  objc_storeStrong((id *)&self->_remoteSPI, 0);
  objc_storeStrong((id *)&self->_spi, 0);
  objc_storeStrong((id *)&self->_unsupportedTransformTypes, 0);
  objc_storeStrong((id *)&self->_additionalKEMProtocols, 0);
  objc_storeStrong((id *)&self->_kemProtocols, 0);
  objc_storeStrong((id *)&self->_integrityProtocols, 0);
  objc_storeStrong((id *)&self->_encryptionProtocols, 0);
  objc_storeStrong((id *)&self->_chosenAdditionalKEMProtocols, 0);
}

- (id)encryptionProtocol
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
    if (objc_getProperty(self, a2, 104, 1))
    {
      v2 = objc_getProperty(v2, v3, 104, 1);
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

- (NSObject)copyFromRemote:(int)a3 preferRemoteProposal:(char)a4 checkKEMethod:
{
  _BYTE *v7;
  _BYTE *v8;
  NSObject *v9;
  SEL v10;
  const char *v11;
  id Property;
  const char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  int v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  int v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  SEL v33;
  _QWORD *v34;
  unint64_t v35;
  const char *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t j;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  SEL v46;
  unint64_t v47;
  BOOL v48;
  uint64_t v49;
  BOOL v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  void *v55;
  void *v56;
  int v57;
  const char *v58;
  void *v59;
  void *v60;
  SEL v61;
  SEL v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t m;
  uint64_t v73;
  NSObject *v74;
  NEIKEv2KEMProtocol *v75;
  const char *v76;
  NEIKEv2KEMProtocol *v77;
  void *v78;
  id v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t n;
  void *v85;
  void *v86;
  id v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t ii;
  uint64_t v99;
  id v100;
  NEIKEv2KEMProtocol *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  NEIKEv2KEMProtocol *v108;
  NSObject *v109;
  NSObject *v110;
  void *v112;
  NEIKEv2KEMProtocol *v113;
  void *v114;
  void *v115;
  _BYTE *v116;
  int v117;
  char v118;
  char v119;
  void *v120;
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
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  uint8_t v160[128];
  uint8_t buf[4];
  const char *v162;
  uint64_t v163;

  v163 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = v7;
  if (!a1)
  {
    v74 = 0;
    goto LABEL_165;
  }
  if (!v7)
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v162 = "-[NEIKEv2ChildSAProposal copyFromRemote:preferRemoteProposal:checkKEMethod:]";
      _os_log_fault_impl(&dword_19BD16000, v9, OS_LOG_TYPE_FAULT, "%s called with null remote", buf, 0xCu);
    }
    goto LABEL_163;
  }
  v9 = objc_msgSend(a1, "copy");
  if (!objc_getProperty(v8, v10, 80, 1))
  {
    ne_log_obj();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_162;
    *(_WORD *)buf = 0;
    v22 = "Remote proposal has invalid SPI";
LABEL_167:
    _os_log_error_impl(&dword_19BD16000, v21, OS_LOG_TYPE_ERROR, v22, buf, 2u);
    goto LABEL_162;
  }
  Property = objc_getProperty(v8, v11, 80, 1);
  if (v9)
  {
    objc_setProperty_atomic(v9, v13, Property, 88);
    if (v8[8])
    {
      LOBYTE(v9[1].isa) = v8[8];
      goto LABEL_7;
    }
LABEL_161:
    ne_log_obj();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v22 = "Remote proposal has invalid proposal number 0";
      goto LABEL_167;
    }
    goto LABEL_162;
  }
  if (!v8[8])
    goto LABEL_161;
LABEL_7:
  if (a3)
  {
    v151 = 0uLL;
    v152 = 0uLL;
    v149 = 0uLL;
    v150 = 0uLL;
    objc_msgSend(v8, "encryptionProtocols");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v149, v160, 16);
    if (!v15)
      goto LABEL_34;
    v16 = *(_QWORD *)v150;
LABEL_10:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v150 != v16)
        objc_enumerationMutation(v14);
      v18 = *(_QWORD *)(*((_QWORD *)&v149 + 1) + 8 * v17);
      -[NSObject encryptionProtocols](v9, "encryptionProtocols");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "indexOfObject:", v18);

      if (v20 != 0x7FFFFFFFFFFFFFFFLL)
        break;
      if (v15 == ++v17)
      {
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v149, v160, 16);
        if (v15)
          goto LABEL_10;
        goto LABEL_34;
      }
    }
    -[NSObject encryptionProtocols](v9, "encryptionProtocols");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v15, "objectAtIndexedSubscript:", v20);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v30;
    if (!v9)
    {

      v34 = 0;
      LOBYTE(v15) = 0;
      goto LABEL_33;
    }
    objc_setProperty_atomic(v9, v31, v30, 96);

    v34 = objc_getProperty(v9, v33, 96, 1);
    if (v34)
    {
      v35 = v34[2];
      if (v35 <= 0x1F && ((1 << v35) & 0xD01C0000) != 0)
        goto LABEL_32;
    }
    goto LABEL_56;
  }
  v147 = 0uLL;
  v148 = 0uLL;
  v145 = 0uLL;
  v146 = 0uLL;
  -[NSObject encryptionProtocols](v9, "encryptionProtocols");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v145, v159, 16);
  if (!v15)
    goto LABEL_34;
  v118 = a4;
  v23 = a3;
  v24 = *(_QWORD *)v146;
  while (2)
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v146 != v24)
        objc_enumerationMutation(v14);
      v26 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * i);
      objc_msgSend(v8, "encryptionProtocols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "containsObject:", v26);

      if (v28)
      {
        if (v9)
        {
          objc_setProperty_atomic(v9, v29, v26, 96);
          v34 = objc_getProperty(v9, v46, 96, 1);
          a3 = v23;
          if (v34)
          {
            v47 = v34[2];
            v48 = v47 > 0x1F;
            v49 = (1 << v47) & 0xD01C0000;
            v50 = v48 || v49 == 0;
            a4 = v118;
            if (!v50)
            {
LABEL_32:
              LOBYTE(v15) = 1;
LABEL_33:

              goto LABEL_34;
            }
LABEL_56:
            LOBYTE(v15) = 0;
            goto LABEL_33;
          }
          LOBYTE(v15) = 0;
        }
        else
        {
          v34 = 0;
          LOBYTE(v15) = 0;
          a3 = v23;
        }
        a4 = v118;
        goto LABEL_33;
      }
    }
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v145, v159, 16);
    if (v15)
      continue;
    break;
  }
  a3 = v23;
  a4 = v118;
LABEL_34:

  if (!v9 || !objc_getProperty(v9, v36, 96, 1))
  {
    ne_log_obj();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_162;
    *(_WORD *)buf = 0;
    v22 = "No chosen encryption protocol";
    goto LABEL_167;
  }
  if ((v15 & 1) == 0)
  {
    if (a3)
    {
      v143 = 0uLL;
      v144 = 0uLL;
      v141 = 0uLL;
      v142 = 0uLL;
      objc_msgSend(v8, "integrityProtocols");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v141, v158, 16);
      if (v38)
      {
        v39 = v38;
        v119 = a4;
        v40 = a3;
        v41 = *(_QWORD *)v142;
        while (2)
        {
          for (j = 0; j != v39; ++j)
          {
            if (*(_QWORD *)v142 != v41)
              objc_enumerationMutation(v37);
            v43 = *(_QWORD *)(*((_QWORD *)&v141 + 1) + 8 * j);
            -[NSObject integrityProtocols](v9, "integrityProtocols");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v44, "indexOfObject:", v43);

            if (v45 != 0x7FFFFFFFFFFFFFFFLL)
            {
              -[NSObject integrityProtocols](v9, "integrityProtocols");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "objectAtIndexedSubscript:", v45);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_setProperty_atomic(v9, v61, v60, 104);

              goto LABEL_68;
            }
          }
          v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v141, v158, 16);
          if (v39)
            continue;
          goto LABEL_68;
        }
      }
    }
    else
    {
      v139 = 0uLL;
      v140 = 0uLL;
      v137 = 0uLL;
      v138 = 0uLL;
      -[NSObject integrityProtocols](v9, "integrityProtocols");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v137, v157, 16);
      if (v51)
      {
        v52 = v51;
        v119 = a4;
        v40 = a3;
        v53 = *(_QWORD *)v138;
        while (2)
        {
          for (k = 0; k != v52; ++k)
          {
            if (*(_QWORD *)v138 != v53)
              objc_enumerationMutation(v37);
            v55 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * k);
            objc_msgSend(v8, "integrityProtocols");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = objc_msgSend(v56, "containsObject:", v55);

            if (v57)
            {
              objc_setProperty_atomic(v9, v58, v55, 104);
              goto LABEL_68;
            }
          }
          v52 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v137, v157, 16);
          if (v52)
            continue;
          break;
        }
LABEL_68:
        a3 = v40;
        a4 = v119;
      }
    }

    if (!objc_getProperty(v9, v62, 104, 1))
    {
      ne_log_obj();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v22 = "No chosen integrity protocol";
        goto LABEL_167;
      }
LABEL_162:

LABEL_163:
      v74 = 0;
      goto LABEL_164;
    }
  }
  if ((a4 & 1) == 0)
  {
    v9 = v9;
    v74 = v9;
    goto LABEL_164;
  }
  -[NSObject kemProtocols](v9, "kemProtocols");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "kemProtocols");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v64;
  if (!v64)
  {
    v74 = v9;
    goto LABEL_155;
  }
  if (!v63)
  {
    v75 = -[NEIKEv2KEMProtocol initWithMethod:]([NEIKEv2KEMProtocol alloc], "initWithMethod:", 0);
    goto LABEL_90;
  }
  objc_msgSend(v64, "firstObject");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v63, "indexOfObject:", v66);

  if (v67 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v63, "objectAtIndexedSubscript:", v67);
    v75 = (NEIKEv2KEMProtocol *)objc_claimAutoreleasedReturnValue();
LABEL_90:
    v77 = v75;
    if (!v75)
      goto LABEL_144;
    goto LABEL_91;
  }
  if (a3)
  {
    v135 = 0uLL;
    v136 = 0uLL;
    v133 = 0uLL;
    v134 = 0uLL;
    v68 = v65;
    v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v133, v156, 16);
    if (v69)
    {
      v70 = v69;
      v71 = *(_QWORD *)v134;
      while (2)
      {
        for (m = 0; m != v70; ++m)
        {
          if (*(_QWORD *)v134 != v71)
            objc_enumerationMutation(v68);
          v73 = objc_msgSend(v63, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * m));
          if (v73 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v63, "objectAtIndexedSubscript:", v73);
            v108 = (NEIKEv2KEMProtocol *)objc_claimAutoreleasedReturnValue();
            goto LABEL_142;
          }
        }
        v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v133, v156, 16);
        if (v70)
          continue;
        break;
      }
    }
  }
  else
  {
    v131 = 0uLL;
    v132 = 0uLL;
    v129 = 0uLL;
    v130 = 0uLL;
    v68 = v63;
    v81 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v129, v155, 16);
    if (v81)
    {
      v82 = v81;
      v83 = *(_QWORD *)v130;
      while (2)
      {
        for (n = 0; n != v82; ++n)
        {
          if (*(_QWORD *)v130 != v83)
            objc_enumerationMutation(v68);
          v85 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * n);
          if (objc_msgSend(v65, "containsObject:", v85))
          {
            v108 = v85;
LABEL_142:
            v77 = v108;
            goto LABEL_143;
          }
        }
        v82 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v129, v155, 16);
        if (v82)
          continue;
        break;
      }
    }
  }
  v77 = 0;
LABEL_143:

  if (!v77)
  {
LABEL_144:
    ne_log_obj();
    v109 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, v109, OS_LOG_TYPE_ERROR, "No chosen KE method", buf, 2u);
    }

    v74 = 0;
    goto LABEL_155;
  }
LABEL_91:
  objc_setProperty_atomic(v9, v76, v77, 112);
  objc_msgSend(v8, "additionalKEMProtocols");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v78)
  {
    -[NSObject additionalKEMProtocols](v9, "additionalKEMProtocols");
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    if (v80)
      -[NEIKEv2IKESAProposal setChosenAdditionalKEMProtocols:](v9, MEMORY[0x1E0C9AA70]);
    v74 = v9;

    goto LABEL_155;
  }
  v114 = v65;
  v112 = v63;
  v113 = v77;
  if (-[NEIKEv2KEMProtocol method](v77, "method"))
    v79 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v77, 0);
  else
    v79 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v86 = v79;
  v87 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v88 = 6;
  v115 = v87;
  v116 = v8;
  v117 = a3;
  while (2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject additionalKEMProtocols](v9, "additionalKEMProtocols");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "objectForKeyedSubscript:", v89);
    v91 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "additionalKEMProtocols");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "objectForKeyedSubscript:", v89);
    v93 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v93)
    {
LABEL_123:
      v100 = 0;
LABEL_138:

      if (++v88 == 13)
      {
        v107 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v87);
        -[NEIKEv2IKESAProposal setChosenAdditionalKEMProtocols:](v9, v107);

        v74 = v9;
        v63 = v112;
        goto LABEL_154;
      }
      continue;
    }
    break;
  }
  if (!v91)
  {
    v101 = -[NEIKEv2KEMProtocol initWithMethod:]([NEIKEv2KEMProtocol alloc], "initWithMethod:", 0);
    objc_msgSend(v87, "setObject:forKeyedSubscript:", v101, v89);

    goto LABEL_123;
  }
  v120 = v89;
  if (a3)
  {
    v127 = 0uLL;
    v128 = 0uLL;
    v125 = 0uLL;
    v126 = 0uLL;
    v94 = v93;
    v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v125, v154, 16);
    if (v95)
    {
      v96 = v95;
      v97 = *(_QWORD *)v126;
      do
      {
        for (ii = 0; ii != v96; ++ii)
        {
          if (*(_QWORD *)v126 != v97)
            objc_enumerationMutation(v94);
          v99 = objc_msgSend(v91, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * ii));
          if (v99 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v91, "objectAtIndexedSubscript:", v99);
            v100 = (id)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v86, "containsObject:", v100))
              goto LABEL_135;

          }
        }
        v96 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v125, v154, 16);
      }
      while (v96);
      v93 = v94;
LABEL_147:
      v87 = v115;
    }
    else
    {
      v93 = v94;
    }
    v89 = v120;
LABEL_150:

  }
  else
  {
    v123 = 0uLL;
    v124 = 0uLL;
    v121 = 0uLL;
    v122 = 0uLL;
    v94 = v91;
    v102 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v121, v153, 16);
    if (!v102)
    {
      v91 = v94;
      goto LABEL_150;
    }
    v103 = v102;
    v104 = *(_QWORD *)v122;
LABEL_126:
    v105 = 0;
    while (1)
    {
      if (*(_QWORD *)v122 != v104)
        objc_enumerationMutation(v94);
      v106 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * v105);
      if ((objc_msgSend(v86, "containsObject:", v106) & 1) == 0)
      {
        if (objc_msgSend(v93, "containsObject:", v106))
          break;
      }
      if (v103 == ++v105)
      {
        v103 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v121, v153, 16);
        if (v103)
          goto LABEL_126;
        v91 = v94;
        goto LABEL_147;
      }
    }
    v100 = v106;
LABEL_135:

    a3 = v117;
    v87 = v115;
    v89 = v120;
    if (v100)
    {
      objc_msgSend(v115, "setObject:forKeyedSubscript:", v100, v120);
      v8 = v116;
      if (objc_msgSend(v100, "method"))
        objc_msgSend(v86, "addObject:", v100);
      goto LABEL_138;
    }
  }
  v8 = v116;
  v63 = v112;
  ne_log_obj();
  v110 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19BD16000, v110, OS_LOG_TYPE_ERROR, "No chosen additional KE methods", buf, 2u);
  }

  v74 = 0;
LABEL_154:

  v65 = v114;
LABEL_155:

LABEL_164:
LABEL_165:

  return v74;
}

- (void)copyForRekey
{
  void *v1;
  const char *v2;
  void *v3;
  SEL v4;
  SEL v5;
  SEL v6;
  SEL v7;

  if (!a1)
    return 0;
  v1 = (void *)objc_msgSend(a1, "copy");
  v3 = v1;
  if (v1)
  {
    objc_setProperty_atomic(v1, v2, 0, 80);
    objc_setProperty_atomic(v3, v4, 0, 88);
    objc_setProperty_atomic(v3, v5, 0, 96);
    objc_setProperty_atomic(v3, v6, 0, 104);
    objc_setProperty_atomic(v3, v7, 0, 112);
    -[NEIKEv2IKESAProposal setChosenAdditionalKEMProtocols:](v3, 0);
  }
  return v3;
}

- (void)copyWithoutKEM
{
  void *v1;
  const char *v2;
  void *v3;

  if (!a1)
    return 0;
  v1 = (void *)objc_msgSend(a1, "copy");
  v3 = v1;
  if (v1)
  {
    objc_setProperty_atomic(v1, v2, 0, 112);
    -[NEIKEv2IKESAProposal setChosenAdditionalKEMProtocols:](v3, 0);
  }
  objc_msgSend(v3, "setKemProtocols:", 0);
  objc_msgSend(v3, "setAdditionalKEMProtocols:", 0);
  return v3;
}

- (uint64_t)matchesLocalProposal:(int)a3 preferRemoteProposal:(int)a4 checkKEMethod:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  const char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  NSObject *v25;
  char *v26;
  void *v27;
  const char *v28;
  unint64_t v29;
  BOOL v30;
  unsigned int v31;
  char v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  NEIKEv2KEMProtocol *v47;
  id v48;
  void *v49;
  uint64_t v50;
  int v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t j;
  void *v63;
  id v64;
  void *v65;
  NSObject *v66;
  char *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  BOOL v78;
  id v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  NSObject *v90;
  char *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  int v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
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
  unsigned __int8 v124;
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  NEIKEv2KEMProtocol *v129;
  uint8_t v130[128];
  uint8_t buf[4];
  const char *v132;
  __int16 v133;
  void *v134;
  _BYTE v135[128];
  uint64_t v136;

  v136 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = v7;
  if (!a1)
    goto LABEL_51;
  if (!v7)
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      goto LABEL_49;
    *(_DWORD *)buf = 136315138;
    v132 = "-[NEIKEv2ChildSAProposal matchesLocalProposal:preferRemoteProposal:checkKEMethod:]";
    v16 = "%s called with null localProposal";
    goto LABEL_12;
  }
  objc_msgSend((id)a1, "encryptionProtocols");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v132 = "-[NEIKEv2ChildSAProposal matchesLocalProposal:preferRemoteProposal:checkKEMethod:]";
      v13 = "BACKTRACE %s called with null self.encryptionProtocols";
      v14 = v12;
      v15 = 12;
LABEL_17:
      _os_log_error_impl(&dword_19BD16000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
      goto LABEL_49;
    }
    goto LABEL_49;
  }
  objc_msgSend(v8, "encryptionProtocols");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      goto LABEL_49;
    *(_DWORD *)buf = 136315138;
    v132 = "-[NEIKEv2ChildSAProposal matchesLocalProposal:preferRemoteProposal:checkKEMethod:]";
    v16 = "%s called with null localProposal.encryptionProtocols";
LABEL_12:
    _os_log_fault_impl(&dword_19BD16000, v12, OS_LOG_TYPE_FAULT, v16, buf, 0xCu);
    goto LABEL_49;
  }
  if (objc_getProperty((id)a1, v11, 72, 1))
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v13 = "Not matching proposal with unsupported transform type";
LABEL_16:
      v14 = v12;
      v15 = 2;
      goto LABEL_17;
    }
    goto LABEL_49;
  }
  if ((*(_BYTE *)(a1 + 9) & 1) == 0)
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v13 = "Not matching proposal missing No ESN transform";
      goto LABEL_16;
    }
LABEL_49:

    goto LABEL_50;
  }
  v99 = a3;
  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  objc_msgSend(v8, "encryptionProtocols");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v120, v135, 16);
  if (!v18)
    goto LABEL_26;
  v19 = v18;
  v20 = *(_QWORD *)v121;
LABEL_20:
  v21 = 0;
  while (1)
  {
    if (*(_QWORD *)v121 != v20)
      objc_enumerationMutation(v17);
    v22 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * v21);
    objc_msgSend((id)a1, "encryptionProtocols");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "containsObject:", v22);

    if (v24)
      break;
    if (v19 == ++v21)
    {
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v120, v135, 16);
      if (!v19)
      {
LABEL_26:

        ne_log_large_obj();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          objc_msgSend((id)a1, "encryptionProtocols");
          v26 = (char *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "encryptionProtocols");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v132 = v26;
          v133 = 2112;
          v134 = v27;
          v28 = "Failed to match encryption algorithms (%@ vs %@)";
          goto LABEL_28;
        }
        goto LABEL_29;
      }
      goto LABEL_20;
    }
  }
  if (v22)
  {
    v29 = *(_QWORD *)(v22 + 16);
    v30 = v29 >= 0x20;
    v31 = (0xD01C0000 >> v29) & 1;
    if (v30)
      v32 = 0;
    else
      v32 = v31;
  }
  else
  {
    v32 = 0;
  }

  objc_msgSend(v8, "integrityProtocols");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "count"))
  {
    objc_msgSend((id)a1, "integrityProtocols");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "count");

    if (v35)
    {
      v118 = 0u;
      v119 = 0u;
      v116 = 0u;
      v117 = 0u;
      objc_msgSend(v8, "integrityProtocols");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v116, v130, 16);
      if (!v37)
        goto LABEL_44;
      v38 = v37;
      v39 = *(_QWORD *)v117;
LABEL_38:
      v40 = 0;
      while (1)
      {
        if (*(_QWORD *)v117 != v39)
          objc_enumerationMutation(v36);
        v41 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * v40);
        objc_msgSend((id)a1, "integrityProtocols");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v41) = objc_msgSend(v42, "containsObject:", v41);

        if ((v41 & 1) != 0)
          break;
        if (v38 == ++v40)
        {
          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v116, v130, 16);
          if (!v38)
          {
LABEL_44:

            ne_log_large_obj();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              objc_msgSend((id)a1, "integrityProtocols");
              v26 = (char *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "integrityProtocols");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v132 = v26;
              v133 = 2112;
              v134 = v27;
              v28 = "Failed to match integrity algorithms (%@ vs %@)";
LABEL_28:
              _os_log_impl(&dword_19BD16000, v25, OS_LOG_TYPE_INFO, v28, buf, 0x16u);

            }
LABEL_29:

LABEL_50:
            a1 = 0;
            goto LABEL_51;
          }
          goto LABEL_38;
        }
      }

      goto LABEL_53;
    }
  }
  else
  {

  }
  if ((v32 & 1) == 0)
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_49;
    *(_WORD *)buf = 0;
    v13 = "Failed to match integrity algorithms, none provided";
    goto LABEL_16;
  }
LABEL_53:
  if (!a4
    || (objc_msgSend(v8, "kemProtocols"),
        v44 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend((id)a1, "kemProtocols"),
        v45 = objc_claimAutoreleasedReturnValue(),
        !(v45 | v44)))
  {
    a1 = 1;
    goto LABEL_51;
  }
  v46 = (void *)v45;
  v47 = -[NEIKEv2KEMProtocol initWithMethod:]([NEIKEv2KEMProtocol alloc], "initWithMethod:", 0);
  v129 = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v129, 1);
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v44 || !v46)
  {
    if (v44)
      v46 = v96;
    else
      v44 = (uint64_t)v96;
    v48 = v96;
  }
  objc_msgSend(v46, "firstObject");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend((id)v44, "indexOfObject:", v49);

  v51 = v99;
  if (v50 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v99)
    {
      v114 = 0uLL;
      v115 = 0uLL;
      v112 = 0uLL;
      v113 = 0uLL;
      v52 = v46;
      v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v112, v128, 16);
      if (v53)
      {
        v54 = v53;
        v55 = *(_QWORD *)v113;
        while (2)
        {
          for (i = 0; i != v54; ++i)
          {
            if (*(_QWORD *)v113 != v55)
              objc_enumerationMutation(v52);
            v57 = objc_msgSend((id)v44, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * i));
            if (v57 != 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend((id)v44, "objectAtIndexedSubscript:", v57);
              v64 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_86;
            }
          }
          v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v112, v128, 16);
          if (v54)
            continue;
          break;
        }
LABEL_82:
        v58 = 0;
LABEL_87:
        v51 = v99;
        goto LABEL_88;
      }
    }
    else
    {
      v110 = 0uLL;
      v111 = 0uLL;
      v108 = 0uLL;
      v109 = 0uLL;
      v52 = (id)v44;
      v59 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v108, v127, 16);
      if (v59)
      {
        v60 = v59;
        v61 = *(_QWORD *)v109;
        while (2)
        {
          for (j = 0; j != v60; ++j)
          {
            if (*(_QWORD *)v109 != v61)
              objc_enumerationMutation(v52);
            v63 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * j);
            if (objc_msgSend(v46, "containsObject:", v63))
            {
              v64 = v63;
LABEL_86:
              v58 = v64;
              goto LABEL_87;
            }
          }
          v60 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v108, v127, 16);
          if (v60)
            continue;
          goto LABEL_82;
        }
      }
    }
    v58 = 0;
LABEL_88:

    goto LABEL_89;
  }
  objc_msgSend((id)v44, "objectAtIndexedSubscript:", v50);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_89:
  if (!v58)
  {
    ne_log_large_obj();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      objc_msgSend((id)a1, "kemProtocols");
      v67 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "kemProtocols");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v132 = v67;
      v133 = 2112;
      v134 = v68;
      _os_log_impl(&dword_19BD16000, v66, OS_LOG_TYPE_INFO, "Failed to match Key Exchange methods (%@ vs %@)", buf, 0x16u);

    }
    v124 = 0;
    goto LABEL_147;
  }
  objc_msgSend((id)a1, "additionalKEMProtocols");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (v65)
  {

  }
  else
  {
    objc_msgSend(v8, "additionalKEMProtocols");
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v69)
    {
      v124 = 1;
      goto LABEL_147;
    }
  }
  v94 = v44;
  v93 = v58;
  if (objc_msgSend(v58, "method"))
    v70 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v58, 0);
  else
    v70 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v71 = v70;
  v72 = 6;
  v95 = v46;
  while (1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "additionalKEMProtocols");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "objectForKeyedSubscript:", v73);
    v75 = objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)a1, "additionalKEMProtocols");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "objectForKeyedSubscript:", v73);
    v77 = objc_claimAutoreleasedReturnValue();

    if (v75 | v77)
      break;
LABEL_134:

    if (++v72 == 13)
    {
      v124 = 1;
      goto LABEL_146;
    }
  }
  if (v75)
    v78 = v77 == 0;
  else
    v78 = 1;
  if (v78)
  {
    if (v75)
      v77 = (uint64_t)v96;
    else
      v75 = (uint64_t)v96;
    v79 = v96;
  }
  v97 = v72;
  v98 = v73;
  if (v51)
  {
    v106 = 0uLL;
    v107 = 0uLL;
    v104 = 0uLL;
    v105 = 0uLL;
    v80 = (id)v77;
    v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v104, v126, 16);
    if (!v81)
    {
      v77 = (uint64_t)v80;
      goto LABEL_143;
    }
    v82 = v81;
    v83 = *(_QWORD *)v105;
LABEL_113:
    v84 = 0;
    while (1)
    {
      if (*(_QWORD *)v105 != v83)
        objc_enumerationMutation(v80);
      v85 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v84);
      if ((objc_msgSend(v71, "containsObject:", v85) & 1) == 0)
      {
        if (objc_msgSend((id)v75, "containsObject:", v85))
          goto LABEL_131;
      }
      if (v82 == ++v84)
      {
        v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v104, v126, 16);
        if (v82)
          goto LABEL_113;
        v77 = (uint64_t)v80;
        goto LABEL_137;
      }
    }
  }
  v102 = 0uLL;
  v103 = 0uLL;
  v100 = 0uLL;
  v101 = 0uLL;
  v80 = (id)v75;
  v86 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v100, v125, 16);
  if (v86)
  {
    v87 = v86;
    v88 = *(_QWORD *)v101;
LABEL_123:
    v89 = 0;
    while (1)
    {
      if (*(_QWORD *)v101 != v88)
        objc_enumerationMutation(v80);
      v85 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v89);
      if ((objc_msgSend(v71, "containsObject:", v85) & 1) == 0)
      {
        if (objc_msgSend((id)v77, "containsObject:", v85))
          break;
      }
      if (v87 == ++v89)
      {
        v87 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v100, v125, 16);
        if (v87)
          goto LABEL_123;
        v75 = (uint64_t)v80;
LABEL_137:
        v73 = v98;
        goto LABEL_143;
      }
    }
LABEL_131:
    if (objc_msgSend(v85, "method"))
      objc_msgSend(v71, "addObject:", v85);

    v51 = v99;
    v46 = v95;
    v72 = v97;
    v73 = v98;
    goto LABEL_134;
  }
  v75 = (uint64_t)v80;
LABEL_143:

  ne_log_large_obj();
  v90 = objc_claimAutoreleasedReturnValue();
  v46 = v95;
  if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
  {
    objc_msgSend((id)a1, "additionalKEMProtocols");
    v91 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "additionalKEMProtocols");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v132 = v91;
    v133 = 2112;
    v134 = v92;
    _os_log_impl(&dword_19BD16000, v90, OS_LOG_TYPE_INFO, "Failed to match Additional Key Exchange methods (%@ vs %@)", buf, 0x16u);

  }
  v124 = 0;

LABEL_146:
  v58 = v93;
  v44 = v94;
LABEL_147:

  a1 = v124;
LABEL_51:

  return a1;
}

- (uint64_t)isAValidResponse
{
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  uint64_t v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (objc_getProperty(a1, a2, 72, 1))
    return 0;
  if ((a1[9] & 1) == 0)
    return 0;
  if (!a1[8])
    return 0;
  objc_msgSend(a1, "kemProtocols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 > 1)
    return 0;
  objc_msgSend(a1, "encryptionProtocols");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 != 1)
    return 0;
  objc_msgSend(a1, "encryptionProtocols");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v8 && (v9 = v8[2] - 18, v9 <= 0xD))
    v10 = qword_19BED7418[v9];
  else
    v10 = 1;

  objc_msgSend(a1, "integrityProtocols");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12 != v10)
    return 0;
  objc_msgSend(a1, "additionalKEMProtocols");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    return 1;
  objc_msgSend(a1, "kemProtocols");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15 != 1)
    return 0;
  objc_msgSend(a1, "additionalKEMProtocols");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v16, "count") + 1);
  objc_msgSend(a1, "kemProtocols");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v19);

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v20 = v16;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(v20, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i), (_QWORD)v29);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "count") != 1)
          goto LABEL_31;
        objc_msgSend(v25, "firstObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v17, "containsObject:", v26) & 1) != 0)
        {

LABEL_31:
          v27 = 0;
          goto LABEL_32;
        }
        if (objc_msgSend(v26, "method"))
          objc_msgSend(v17, "addObject:", v26);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      v27 = 1;
      if (v22)
        continue;
      break;
    }
  }
  else
  {
    v27 = 1;
  }
LABEL_32:

  return v27;
}

+ (NSObject)chooseChildSAProposalFromLocalProposals:(void *)a3 remoteProposals:(int)a4 preferRemoteProposals:(char)a5 checkKEMethod:
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v27;
  NSObject *obj;
  _QWORD v29[5];
  char v30;
  char v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[5];
  char v37;
  char v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint8_t v44[128];
  uint8_t buf[4];
  const char *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  objc_opt_self();
  if (!v8)
  {
    ne_log_obj();
    obj = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_FAULT))
      goto LABEL_21;
    *(_DWORD *)buf = 136315138;
    v46 = "+[NEIKEv2ChildSAProposal chooseChildSAProposalFromLocalProposals:remoteProposals:preferRemoteProposals:checkKEMethod:]";
    v27 = "%s called with null localProposals";
LABEL_29:
    _os_log_fault_impl(&dword_19BD16000, obj, OS_LOG_TYPE_FAULT, v27, buf, 0xCu);
    goto LABEL_21;
  }
  if (!v9)
  {
    ne_log_obj();
    obj = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_FAULT))
      goto LABEL_21;
    *(_DWORD *)buf = 136315138;
    v46 = "+[NEIKEv2ChildSAProposal chooseChildSAProposalFromLocalProposals:remoteProposals:preferRemoteProposals:checkKEMethod:]";
    v27 = "%s called with null remoteProposals";
    goto LABEL_29;
  }
  if (!a4)
  {
    v34 = 0uLL;
    v35 = 0uLL;
    v32 = 0uLL;
    v33 = 0uLL;
    obj = v8;
    v18 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v33 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __118__NEIKEv2ChildSAProposal_chooseChildSAProposalFromLocalProposals_remoteProposals_preferRemoteProposals_checkKEMethod___block_invoke_2;
          v29[3] = &unk_1E3CC0A28;
          v29[4] = v22;
          v30 = 0;
          v31 = a5;
          v23 = objc_msgSend(v9, "indexOfObjectPassingTest:", v29);
          if (v23 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v9, "objectAtIndexedSubscript:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = -[NEIKEv2ChildSAProposal copyFromRemote:preferRemoteProposal:checkKEMethod:](v22, v25, 0, a5);

            goto LABEL_24;
          }
        }
        v19 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
        if (v19)
          continue;
        break;
      }
    }
    goto LABEL_21;
  }
  v41 = 0uLL;
  v42 = 0uLL;
  v39 = 0uLL;
  v40 = 0uLL;
  obj = v9;
  v10 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (!v10)
  {
LABEL_21:
    v17 = 0;
    goto LABEL_24;
  }
  v11 = v10;
  v12 = *(_QWORD *)v40;
  v13 = MEMORY[0x1E0C809B0];
  while (2)
  {
    for (j = 0; j != v11; ++j)
    {
      if (*(_QWORD *)v40 != v12)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
      v36[0] = v13;
      v36[1] = 3221225472;
      v36[2] = __118__NEIKEv2ChildSAProposal_chooseChildSAProposalFromLocalProposals_remoteProposals_preferRemoteProposals_checkKEMethod___block_invoke;
      v36[3] = &unk_1E3CC0A28;
      v36[4] = v15;
      v37 = a4;
      v38 = a5;
      v16 = objc_msgSend(v8, "indexOfObjectPassingTest:", v36);
      if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v16);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[NEIKEv2ChildSAProposal copyFromRemote:preferRemoteProposal:checkKEMethod:](v24, v15, 1, a5);

        goto LABEL_24;
      }
    }
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v11)
      continue;
    break;
  }
  v17 = 0;
LABEL_24:

  return v17;
}

uint64_t __118__NEIKEv2ChildSAProposal_chooseChildSAProposalFromLocalProposals_remoteProposals_preferRemoteProposals_checkKEMethod___block_invoke(uint64_t a1, void *a2)
{
  return -[NEIKEv2ChildSAProposal matchesLocalProposal:preferRemoteProposal:checkKEMethod:](*(_QWORD *)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

uint64_t __118__NEIKEv2ChildSAProposal_chooseChildSAProposalFromLocalProposals_remoteProposals_preferRemoteProposals_checkKEMethod___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return -[NEIKEv2ChildSAProposal matchesLocalProposal:preferRemoteProposal:checkKEMethod:](a2, *(void **)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

@end
