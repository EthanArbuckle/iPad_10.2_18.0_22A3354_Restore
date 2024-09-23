@implementation BCSBusinessLogo

+ (id)itemFromStatement:(sqlite3_stmt *)a3
{
  void *v4;
  sqlite3_int64 v5;
  void *v6;
  BCSBusinessLogo *v7;
  BCSEmailLogoParquetMessage *v8;
  BCSBusinessLogo *v9;
  BCSBusinessLogo *v10;

  sqlite3_column_int64(a3, 0);
  BCSEmailStoreDataFromStatement(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = sqlite3_column_int64(a3, 2);
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", sqlite3_column_double(a3, 3));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  if (v4 && v5 == 2)
  {
    v8 = -[BCSEmailLogoParquetMessage initWithData:]([BCSEmailLogoParquetMessage alloc], "initWithData:", v4);
    if (v8)
    {
      v9 = -[BCSBusinessLogo initWithMessage:logoURL:]([BCSBusinessLogo alloc], "initWithMessage:logoURL:", v8, 0);
      v7 = v9;
      if (v9)
      {
        -[BCSItem setExpirationDate:](v9, "setExpirationDate:", v6);
        v10 = v7;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (void)updateStatementValues:(sqlite3_stmt *)a3 withItemIdentifier:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  double v9;
  id v10;

  sqlite3_bind_int64(a3, 1, objc_msgSend(a4, "truncatedHash"));
  -[BCSBusinessLogo message](self, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_retainAutorelease(v7);
  sqlite3_bind_blob(a3, 2, (const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), 0);
  sqlite3_bind_int64(a3, 3, 2);
  -[BCSItem expirationDate](self, "expirationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  sqlite3_bind_double(a3, 4, v9);

}

- (BCSBusinessLogo)initWithBusinessId:(id)a3 logo:(id)a4
{
  id v6;
  id v7;
  BCSBusinessLogo *v8;
  BCSEmailLogoParquetMessage *v9;
  BCSEmailLogoParquetMessage *message;
  BCSBusinessLogoItemIdentifier *v11;
  void *v12;
  BCSBusinessLogoItemIdentifier *v13;
  BCSBusinessLogoItemIdentifier *identifier;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BCSBusinessLogo;
  v8 = -[BCSItem init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(BCSEmailLogoParquetMessage);
    message = v8->_message;
    v8->_message = v9;

    -[BCSEmailLogoParquetMessage setBusinessId:](v8->_message, "setBusinessId:", v6);
    -[BCSEmailLogoParquetMessage setLogo:](v8->_message, "setLogo:", v7);
    v11 = [BCSBusinessLogoItemIdentifier alloc];
    -[BCSEmailLogoParquetMessage businessId](v8->_message, "businessId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (BCSBusinessLogoItemIdentifier *)-[BCSBusinessLogoItemIdentifier initWithBusinessId:](v11, v12);
    identifier = v8->_identifier;
    v8->_identifier = v13;

  }
  return v8;
}

- (BCSBusinessLogo)initWithBusinessId:(id)a3 logoURL:(id)a4 logoFormat:(id)a5
{
  id v8;
  id v9;
  id v10;
  BCSBusinessLogo *v11;
  BCSEmailLogoParquetMessage *v12;
  BCSEmailLogoParquetMessage *message;
  BCSBusinessLogoItemIdentifier *v14;
  void *v15;
  BCSBusinessLogoItemIdentifier *v16;
  BCSBusinessLogoItemIdentifier *identifier;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BCSBusinessLogo;
  v11 = -[BCSItem init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_alloc_init(BCSEmailLogoParquetMessage);
    message = v11->_message;
    v11->_message = v12;

    -[BCSEmailLogoParquetMessage setBusinessId:](v11->_message, "setBusinessId:", v8);
    -[BCSEmailLogoParquetMessage setLogoFormat:](v11->_message, "setLogoFormat:", v10);
    objc_storeStrong((id *)&v11->_logoURL, a4);
    v14 = [BCSBusinessLogoItemIdentifier alloc];
    -[BCSEmailLogoParquetMessage businessId](v11->_message, "businessId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (BCSBusinessLogoItemIdentifier *)-[BCSBusinessLogoItemIdentifier initWithBusinessId:](v14, v15);
    identifier = v11->_identifier;
    v11->_identifier = v16;

  }
  return v11;
}

- (BCSBusinessLogo)initWithMessage:(id)a3 logoURL:(id)a4
{
  id v6;
  id v7;
  BCSBusinessLogo *v8;
  uint64_t v9;
  BCSEmailLogoParquetMessage *message;
  uint64_t v11;
  NSURL *logoURL;
  BCSBusinessLogoItemIdentifier *v13;
  void *v14;
  BCSBusinessLogoItemIdentifier *v15;
  BCSBusinessLogoItemIdentifier *identifier;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BCSBusinessLogo;
  v8 = -[BCSItem init](&v18, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    message = v8->_message;
    v8->_message = (BCSEmailLogoParquetMessage *)v9;

    v11 = objc_msgSend(v7, "copy");
    logoURL = v8->_logoURL;
    v8->_logoURL = (NSURL *)v11;

    v13 = [BCSBusinessLogoItemIdentifier alloc];
    -[BCSEmailLogoParquetMessage businessId](v8->_message, "businessId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (BCSBusinessLogoItemIdentifier *)-[BCSBusinessLogoItemIdentifier initWithBusinessId:](v13, v14);
    identifier = v8->_identifier;
    v8->_identifier = v15;

  }
  return v8;
}

- (NSString)businessId
{
  return -[BCSEmailLogoParquetMessage businessId](self->_message, "businessId");
}

- (NSData)logo
{
  return -[BCSEmailLogoParquetMessage logo](self->_message, "logo");
}

- (void)setLogo:(id)a3
{
  -[BCSEmailLogoParquetMessage setLogo:](self->_message, "setLogo:", a3);
}

- (NSString)logoFormat
{
  return -[BCSEmailLogoParquetMessage logoFormat](self->_message, "logoFormat");
}

- (id)itemIdentifier
{
  void *v2;
  void *v3;

  -[BCSBusinessLogo identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)truncatedHash
{
  void *v2;
  int64_t v3;

  -[BCSBusinessLogo identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "truncatedHash");

  return v3;
}

- (int64_t)type
{
  void *v2;
  int64_t v3;

  -[BCSBusinessLogo identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  return v3;
}

- (BOOL)matchesItemIdentifying:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[BCSBusinessLogo identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "matchesItemIdentifying:", v4);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    -[BCSBusinessLogo message](self, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copyWithZone:", a3);
    v8 = (void *)v5[6];
    v5[6] = v7;

    -[BCSBusinessLogo logoURL](self, "logoURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copyWithZone:", a3);
    v11 = (void *)v5[4];
    v5[4] = v10;

    -[BCSBusinessLogo identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copyWithZone:", a3);
    v14 = (void *)v5[5];
    v5[5] = v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[BCSBusinessLogo message](self, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("Message"));

  -[BCSBusinessLogo logoURL](self, "logoURL");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("LogoURL"));

}

- (BCSBusinessLogo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  BCSEmailLogoParquetMessage *v6;
  void *v7;
  BCSBusinessLogo *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Message"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BCSEmailLogoParquetMessage initWithData:]([BCSEmailLogoParquetMessage alloc], "initWithData:", v5);
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LogoURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[BCSBusinessLogo initWithMessage:logoURL:](self, "initWithMessage:logoURL:", v6, v7);

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setBusinessId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setLogoFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)logoURL
{
  return self->_logoURL;
}

- (void)setLogoURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BCSBusinessLogoItemIdentifier)identifier
{
  return self->_identifier;
}

- (BCSEmailLogoParquetMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_logoURL, 0);
  objc_storeStrong((id *)&self->_logoFormat, 0);
  objc_storeStrong((id *)&self->_businessId, 0);
}

@end
