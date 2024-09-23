@implementation ANParticipant

- (ANParticipant)initWithSender:(id)a3
{
  id v4;
  ANParticipant *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *idsID;
  uint64_t v9;
  NSString *rapportID;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ANParticipant;
  v5 = -[ANParticipant init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "type");
    if (v6 == 2)
    {
LABEL_5:
      objc_msgSend(v4, "identifier");
      v9 = objc_claimAutoreleasedReturnValue();
      rapportID = v5->_rapportID;
      v5->_rapportID = (NSString *)v9;

      goto LABEL_6;
    }
    if (v6 == 1)
    {
      objc_msgSend(v4, "identifier");
      v7 = objc_claimAutoreleasedReturnValue();
      idsID = v5->_idsID;
      v5->_idsID = (NSString *)v7;

      goto LABEL_5;
    }
  }
LABEL_6:

  return v5;
}

- (NSDictionary)info
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[ANParticipant name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("name"));

  -[ANParticipant rapportID](self, "rapportID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("rapportID"));

  -[ANParticipant idsID](self, "idsID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("idsID"));

  -[ANParticipant homeKitID](self, "homeKitID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("homeKitID"));

  -[ANParticipant homeKitUserID](self, "homeKitUserID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("homeKitUserID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ANParticipant isAccessory](self, "isAccessory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("isAccessory"));

  -[ANParticipant userID](self, "userID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("userID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ANParticipant isEndpoint](self, "isEndpoint"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("isEndpoint"));

  v12 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v12;
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[ANParticipant info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v6 = a3;
  v7 = v6;
  if (!v6)
    goto LABEL_26;
  objc_msgSend(v6, "homeKitID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
LABEL_7:
    objc_msgSend(v7, "homeKitUserID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[ANParticipant homeKitUserID](self, "homeKitUserID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "homeKitUserID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) != 0)
      {
        v10 = 1;
LABEL_21:

LABEL_22:
        if (v8)
        {

        }
        if ((v10 & 1) != 0)
          goto LABEL_25;
LABEL_26:
        v20 = 0;
        goto LABEL_27;
      }
    }
    objc_msgSend(v7, "idsID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[ANParticipant idsID](self, "idsID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "idsID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isEqualToString:", v13) & 1) != 0)
      {
        v10 = 1;
        goto LABEL_19;
      }
      v22 = v13;
      v24 = v12;
    }
    objc_msgSend(v7, "rapportID", v22, v24, v26, v27);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      -[ANParticipant rapportID](self, "rapportID");
      v16 = v4;
      v17 = v3;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "rapportID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v18, "isEqualToString:", v19);

      v3 = v17;
      v4 = v16;

    }
    else
    {
      v10 = 0;
    }
    v13 = v23;
    v12 = v25;
    if (!v11)
    {
LABEL_20:
      if (!v9)
        goto LABEL_22;
      goto LABEL_21;
    }
LABEL_19:

    goto LABEL_20;
  }
  -[ANParticipant homeKitID](self, "homeKitID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "homeKitID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEqualToString:", v4))
  {
    v26 = v4;
    v27 = v3;
    goto LABEL_7;
  }

LABEL_25:
  v20 = 1;
LABEL_27:

  return v20;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[ANParticipant homeKitID](self, "homeKitID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[ANParticipant homeKitUserID](self, "homeKitUserID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[ANParticipant idsID](self, "idsID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[ANParticipant rapportID](self, "rapportID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (id)copy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_opt_new();
  -[ANParticipant name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setName:", v4);

  -[ANParticipant rapportID](self, "rapportID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRapportID:", v5);

  -[ANParticipant idsID](self, "idsID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdsID:", v6);

  -[ANParticipant homeKitID](self, "homeKitID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHomeKitID:", v7);

  -[ANParticipant homeKitUserID](self, "homeKitUserID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHomeKitUserID:", v8);

  -[ANParticipant userID](self, "userID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserID:", v9);

  objc_msgSend(v3, "setIsAccessory:", -[ANParticipant isAccessory](self, "isAccessory"));
  objc_msgSend(v3, "setIsEndpoint:", -[ANParticipant isEndpoint](self, "isEndpoint"));
  return v3;
}

- (void)clearIdentifiers
{
  -[ANParticipant setName:](self, "setName:", &stru_24D370F00);
  -[ANParticipant setRapportID:](self, "setRapportID:", &stru_24D370F00);
  -[ANParticipant setIdsID:](self, "setIdsID:", &stru_24D370F00);
  if (!-[ANParticipant isAccessory](self, "isAccessory"))
    -[ANParticipant setHomeKitID:](self, "setHomeKitID:", &stru_24D370F00);
  -[ANParticipant setHomeKitUserID:](self, "setHomeKitUserID:", &stru_24D370F00);
  -[ANParticipant setUserID:](self, "setUserID:", &stru_24D370F00);
}

- (BOOL)isUser
{
  void *v3;
  BOOL v4;

  if (!-[ANParticipant isAccessory](self, "isAccessory"))
    return 1;
  -[ANParticipant homeKitUserID](self, "homeKitUserID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (ANParticipant)initWithMessage:(id)a3
{
  id v4;
  ANParticipant *v5;
  uint64_t v6;
  NSString *homeKitID;
  uint64_t v8;
  NSString *homeKitUserID;
  uint64_t v10;
  NSString *userID;
  uint64_t v12;
  NSString *name;
  void *v14;
  void *v15;
  ANParticipant *v16;
  objc_super v18;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v18.receiver = self;
    v18.super_class = (Class)ANParticipant;
    v5 = -[ANParticipant init](&v18, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeKitID"));
      v6 = objc_claimAutoreleasedReturnValue();
      homeKitID = v5->_homeKitID;
      v5->_homeKitID = (NSString *)v6;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeKitUserID"));
      v8 = objc_claimAutoreleasedReturnValue();
      homeKitUserID = v5->_homeKitUserID;
      v5->_homeKitUserID = (NSString *)v8;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userID"));
      v10 = objc_claimAutoreleasedReturnValue();
      userID = v5->_userID;
      v5->_userID = (NSString *)v10;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
      v12 = objc_claimAutoreleasedReturnValue();
      name = v5->_name;
      v5->_name = (NSString *)v12;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAccessory"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_isAccessory = objc_msgSend(v14, "BOOLValue");
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isEndpoint"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_isEndpoint = objc_msgSend(v15, "BOOLValue");

    }
    self = v5;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)message
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[ANParticipant homeKitID](self, "homeKitID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("homeKitID"));

  -[ANParticipant homeKitUserID](self, "homeKitUserID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("homeKitUserID"));

  -[ANParticipant userID](self, "userID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("userID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ANParticipant isAccessory](self, "isAccessory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isAccessory"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ANParticipant isEndpoint](self, "isEndpoint"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("isEndpoint"));

  return v3;
}

- (id)messageForCompanion
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCED8];
  -[ANParticipant message](self, "message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_name, CFSTR("name"));
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;
  void *v6;
  id v7;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rapportID, CFSTR("rapportID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_idsID, CFSTR("idsID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_homeKitID, CFSTR("homeKitID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_homeKitUserID, CFSTR("homeKitUserID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userID, CFSTR("userID"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isAccessory);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("isAccessory"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isEndpoint);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("isEndpoint"));

}

- (ANParticipant)initWithCoder:(id)a3
{
  id v4;
  ANParticipant *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *rapportID;
  uint64_t v10;
  NSString *idsID;
  uint64_t v12;
  NSString *homeKitID;
  uint64_t v14;
  NSString *homeKitUserID;
  uint64_t v16;
  NSString *userID;
  void *v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ANParticipant;
  v5 = -[ANParticipant init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rapportID"));
    v8 = objc_claimAutoreleasedReturnValue();
    rapportID = v5->_rapportID;
    v5->_rapportID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idsID"));
    v10 = objc_claimAutoreleasedReturnValue();
    idsID = v5->_idsID;
    v5->_idsID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homeKitID"));
    v12 = objc_claimAutoreleasedReturnValue();
    homeKitID = v5->_homeKitID;
    v5->_homeKitID = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homeKitUserID"));
    v14 = objc_claimAutoreleasedReturnValue();
    homeKitUserID = v5->_homeKitUserID;
    v5->_homeKitUserID = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userID"));
    v16 = objc_claimAutoreleasedReturnValue();
    userID = v5->_userID;
    v5->_userID = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isAccessory"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isAccessory = objc_msgSend(v18, "BOOLValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isEndpoint"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isEndpoint = objc_msgSend(v19, "BOOLValue");

  }
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)rapportID
{
  return self->_rapportID;
}

- (void)setRapportID:(id)a3
{
  objc_storeStrong((id *)&self->_rapportID, a3);
}

- (NSString)idsID
{
  return self->_idsID;
}

- (void)setIdsID:(id)a3
{
  objc_storeStrong((id *)&self->_idsID, a3);
}

- (NSString)homeKitID
{
  return self->_homeKitID;
}

- (void)setHomeKitID:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitID, a3);
}

- (NSString)homeKitUserID
{
  return self->_homeKitUserID;
}

- (void)setHomeKitUserID:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitUserID, a3);
}

- (BOOL)isAccessory
{
  return self->_isAccessory;
}

- (void)setIsAccessory:(BOOL)a3
{
  self->_isAccessory = a3;
}

- (BOOL)isEndpoint
{
  return self->_isEndpoint;
}

- (void)setIsEndpoint:(BOOL)a3
{
  self->_isEndpoint = a3;
}

- (NSString)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
  objc_storeStrong((id *)&self->_userID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_homeKitUserID, 0);
  objc_storeStrong((id *)&self->_homeKitID, 0);
  objc_storeStrong((id *)&self->_idsID, 0);
  objc_storeStrong((id *)&self->_rapportID, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
