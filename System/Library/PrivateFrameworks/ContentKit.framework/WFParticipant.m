@implementation WFParticipant

- (WFParticipant)initWithURL:(id)a3 name:(id)a4 emailAddress:(id)a5 status:(int64_t)a6 role:(int64_t)a7 type:(int64_t)a8 sourceIdentifier:(id)a9 isManaged:(BOOL)a10 isCurrentUser:(BOOL)a11 contactPredicate:(id)a12
{
  id v19;
  id v20;
  id v21;
  id v22;
  WFParticipant *v23;
  WFParticipant *v24;
  uint64_t v25;
  NSString *name;
  uint64_t v27;
  NSString *emailAddress;
  uint64_t v29;
  NSString *sourceIdentifier;
  WFParticipant *v31;
  id obj;
  id v35;
  objc_super v36;

  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a9;
  v35 = a12;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFParticipant.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("URL"));

  }
  v36.receiver = self;
  v36.super_class = (Class)WFParticipant;
  v23 = -[WFParticipant init](&v36, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_URL, a3);
    v25 = objc_msgSend(v20, "copy");
    name = v24->_name;
    v24->_name = (NSString *)v25;

    v27 = objc_msgSend(v21, "copy");
    emailAddress = v24->_emailAddress;
    v24->_emailAddress = (NSString *)v27;

    v24->_status = a6;
    v24->_role = a7;
    v24->_type = a8;
    v29 = objc_msgSend(v22, "copy");
    sourceIdentifier = v24->_sourceIdentifier;
    v24->_sourceIdentifier = (NSString *)v29;

    v24->_managed = a10;
    v24->_currentUser = a11;
    objc_storeStrong((id *)&v24->_contactPredicate, a12);
    v31 = v24;
  }

  return v24;
}

- (WFParticipant)initWithEKParticipant:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  WFParticipant *v13;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;

  v3 = a3;
  objc_msgSend(v3, "owner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v5, "isManaged");
  objc_msgSend(v3, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emailAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v3, "participantStatus");
  v8 = objc_msgSend(v3, "participantRole");
  v9 = objc_msgSend(v3, "participantType");
  objc_msgSend(v5, "source");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sourceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v3, "isCurrentUser");
  objc_msgSend(v3, "contactPredicate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  BYTE1(v15) = (_BYTE)v4;
  LOBYTE(v15) = v18;
  v13 = -[WFParticipant initWithURL:name:emailAddress:status:role:type:sourceIdentifier:isManaged:isCurrentUser:contactPredicate:](self, "initWithURL:name:emailAddress:status:role:type:sourceIdentifier:isManaged:isCurrentUser:contactPredicate:", v17, v6, v7, v16, v8, v9, v11, v15, v12);

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;

  -[WFParticipant URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[WFParticipant name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[WFParticipant emailAddress](self, "emailAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v6 ^ v8 ^ -[WFParticipant status](self, "status");
  v10 = -[WFParticipant role](self, "role");
  v11 = v10 ^ -[WFParticipant type](self, "type");
  -[WFParticipant sourceIdentifier](self, "sourceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");
  v14 = v9 ^ v13 ^ -[WFParticipant isManaged](self, "isManaged");
  v15 = -[WFParticipant isCurrentUser](self, "isCurrentUser");
  -[WFParticipant contactPredicate](self, "contactPredicate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v14 ^ v15 ^ objc_msgSend(v16, "hash");

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  WFParticipant *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  int v25;
  int64_t v26;
  int64_t v27;
  int64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  _BOOL4 v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  uint64_t v43;
  void *v44;
  id v45;

  v4 = (WFParticipant *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFParticipant URL](self, "URL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFParticipant URL](v4, "URL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5;
      v8 = v6;
      v9 = v8;
      if (v7 == v8)
      {

      }
      else
      {
        v10 = 0;
        v11 = v8;
        v12 = v7;
        if (!v7 || !v8)
          goto LABEL_47;
        v13 = objc_msgSend(v7, "isEqual:", v8);

        if (!v13)
        {
          v10 = 0;
LABEL_48:

          goto LABEL_49;
        }
      }
      -[WFParticipant name](self, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFParticipant name](v4, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v14;
      v16 = v15;
      v11 = v16;
      if (v12 == v16)
      {

      }
      else
      {
        v10 = 0;
        v17 = v16;
        v18 = v12;
        if (!v12 || !v16)
          goto LABEL_46;
        v19 = objc_msgSend(v12, "isEqualToString:", v16);

        if (!v19)
        {
          v10 = 0;
LABEL_47:

          goto LABEL_48;
        }
      }
      -[WFParticipant emailAddress](self, "emailAddress");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFParticipant emailAddress](v4, "emailAddress");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v20;
      v22 = v21;
      v17 = v22;
      if (v18 == v22)
      {

      }
      else
      {
        v10 = 0;
        v23 = v22;
        v24 = v18;
        if (!v18 || !v22)
          goto LABEL_45;
        v25 = objc_msgSend(v18, "isEqualToString:", v22);

        if (!v25)
        {
LABEL_31:
          v10 = 0;
LABEL_46:

          goto LABEL_47;
        }
      }
      v26 = -[WFParticipant status](self, "status");
      if (v26 != -[WFParticipant status](v4, "status"))
        goto LABEL_31;
      v27 = -[WFParticipant role](self, "role");
      if (v27 != -[WFParticipant role](v4, "role"))
        goto LABEL_31;
      v28 = -[WFParticipant type](self, "type");
      if (v28 != -[WFParticipant type](v4, "type"))
        goto LABEL_31;
      -[WFParticipant sourceIdentifier](self, "sourceIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFParticipant sourceIdentifier](v4, "sourceIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v29;
      v31 = v30;
      v45 = v31;
      if (v24 == v31)
      {

      }
      else
      {
        v10 = 0;
        if (!v24)
        {
          v32 = v31;
          v33 = 0;
          goto LABEL_43;
        }
        v32 = v31;
        v33 = v24;
        if (!v31)
        {
LABEL_43:
          v41 = v33;

          goto LABEL_44;
        }
        v34 = v31;
        LODWORD(v43) = objc_msgSend(v24, "isEqualToString:", v31);

        if (!(_DWORD)v43)
        {
LABEL_35:
          v10 = 0;
LABEL_44:
          v23 = v45;
LABEL_45:

          goto LABEL_46;
        }
      }
      v35 = -[WFParticipant isManaged](self, "isManaged", v43);
      if (v35 != -[WFParticipant isManaged](v4, "isManaged"))
        goto LABEL_35;
      v36 = -[WFParticipant isCurrentUser](self, "isCurrentUser");
      if (v36 != -[WFParticipant isCurrentUser](v4, "isCurrentUser"))
        goto LABEL_35;
      -[WFParticipant contactPredicate](self, "contactPredicate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFParticipant contactPredicate](v4, "contactPredicate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v37;
      v40 = v38;
      v44 = v40;
      if (v39 == v40)
      {
        v10 = 1;
      }
      else
      {
        v10 = 0;
        if (v39 && v40)
          v10 = objc_msgSend(v39, "isEqual:", v40);
      }

      v32 = v44;
      v33 = v39;
      goto LABEL_43;
    }
    v10 = 0;
  }
LABEL_49:

  return v10;
}

- (BOOL)isEquivalentToParticipant:(id)a3
{
  WFParticipant *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  _BOOL4 v10;

  v4 = (WFParticipant *)a3;
  if (v4 == self)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFParticipant URL](self, "URL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFParticipant URL](v4, "URL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqual:", v6))
      {
        -[WFParticipant emailAddress](self, "emailAddress");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFParticipant emailAddress](v4, "emailAddress");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isEqualToString:", v8))
        {
          v9 = -[WFParticipant isCurrentUser](self, "isCurrentUser");
          v10 = v9 ^ -[WFParticipant isCurrentUser](v4, "isCurrentUser") ^ 1;
        }
        else
        {
          LOBYTE(v10) = 0;
        }

      }
      else
      {
        LOBYTE(v10) = 0;
      }

    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }

  return v10;
}

- (id)wfSerializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[WFParticipant URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFParticipant URL](self, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("URL"));

  }
  -[WFParticipant name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFParticipant name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("name"));

  }
  -[WFParticipant emailAddress](self, "emailAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[WFParticipant emailAddress](self, "emailAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("emailAddress"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[WFParticipant status](self, "status"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("participantStatus"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[WFParticipant role](self, "role"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("participantRole"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[WFParticipant type](self, "type"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("participantType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[WFParticipant isCurrentUser](self, "isCurrentUser"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("isCurrentUser"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[WFParticipant isManaged](self, "isManaged"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("isManaged"));

  -[WFParticipant sourceIdentifier](self, "sourceIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[WFParticipant sourceIdentifier](self, "sourceIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("sourceIdentifier"));

  }
  v20 = CFSTR("link.contentkit.ekparticipant");
  v21[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (int64_t)status
{
  return self->_status;
}

- (int64_t)role
{
  return self->_role;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (BOOL)isManaged
{
  return self->_managed;
}

- (BOOL)isCurrentUser
{
  return self->_currentUser;
}

- (NSPredicate)contactPredicate
{
  return self->_contactPredicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactPredicate, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v4;
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
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  objc_class *v25;

  v4 = a3;
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.ekparticipant"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v5, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("emailAddress"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)a1;
    objc_msgSend(v5, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("participantStatus"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v11, "integerValue");

    objc_msgSend(v5, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("participantRole"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    objc_msgSend(v5, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("participantType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");

    objc_msgSend(v5, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("isCurrentUser"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLValue");

    objc_msgSend(v5, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("isManaged"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue");

    objc_msgSend(v5, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceIdentifier"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE1(v23) = v17;
    LOBYTE(v23) = v19;
    v21 = (void *)objc_msgSend([v25 alloc], "initWithURL:name:emailAddress:status:role:type:sourceIdentifier:isManaged:isCurrentUser:contactPredicate:", v8, v9, v10, v24, v13, v15, v20, v23, 0);

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

@end
