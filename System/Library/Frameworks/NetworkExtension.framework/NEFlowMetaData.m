@implementation NEFlowMetaData

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NEFlowMetaData sourceAppSigningIdentifier](self, "sourceAppSigningIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFlowMetaData sourceAppUniqueIdentifier](self, "sourceAppUniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@[%@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NEFlowMetaData)initWithCoder:(id)a3
{
  id v4;
  NEFlowMetaData *v5;
  uint64_t v6;
  NSString *sourceAppSigningIdentifier;
  uint64_t v8;
  NSData *sourceAppUniqueIdentifier;
  uint64_t v10;
  NSData *sourceAppAuditToken;
  uint64_t v12;
  NSUUID *filterFlowIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NEFlowMetaData;
  v5 = -[NEFlowMetaData init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceAppSigningIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    sourceAppSigningIdentifier = v5->_sourceAppSigningIdentifier;
    v5->_sourceAppSigningIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceAppUniqueIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    sourceAppUniqueIdentifier = v5->_sourceAppUniqueIdentifier;
    v5->_sourceAppUniqueIdentifier = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceAppAuditToken"));
    v10 = objc_claimAutoreleasedReturnValue();
    sourceAppAuditToken = v5->_sourceAppAuditToken;
    v5->_sourceAppAuditToken = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("filterFlowID"));
    v12 = objc_claimAutoreleasedReturnValue();
    filterFlowIdentifier = v5->_filterFlowIdentifier;
    v5->_filterFlowIdentifier = (NSUUID *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[NEFlowMetaData sourceAppSigningIdentifier](self, "sourceAppSigningIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sourceAppSigningIdentifier"));

  -[NEFlowMetaData sourceAppUniqueIdentifier](self, "sourceAppUniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sourceAppUniqueIdentifier"));

  -[NEFlowMetaData sourceAppAuditToken](self, "sourceAppAuditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sourceAppAuditToken"));

  -[NEFlowMetaData filterFlowIdentifier](self, "filterFlowIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("filterFlowID"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NEFlowMetaData *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NEFlowMetaData *v14;
  BOOL v16;
  objc_super v17;

  v4 = +[NEFlowMetaData allocWithZone:](NEFlowMetaData, "allocWithZone:", a3);
  -[NEFlowMetaData sourceAppUniqueIdentifier](self, "sourceAppUniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFlowMetaData sourceAppSigningIdentifier](self, "sourceAppSigningIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[NEFlowMetaData fastOpenRequested](self, "fastOpenRequested");
  v7 = -[NEFlowMetaData multipathRequested](self, "multipathRequested");
  -[NEFlowMetaData sourceAppAuditToken](self, "sourceAppAuditToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFlowMetaData filterFlowIdentifier](self, "filterFlowIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  v11 = v6;
  v12 = v8;
  v13 = v9;
  if (v4)
  {
    v17.receiver = v4;
    v17.super_class = (Class)NEFlowMetaData;
    v14 = -[NEFlowMetaData init](&v17, sel_init);
    v4 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_sourceAppSigningIdentifier, v6);
      objc_storeStrong((id *)&v4->_sourceAppUniqueIdentifier, v5);
      v4->_fastOpenRequested = v16;
      v4->_multipathRequested = v7;
      objc_storeStrong((id *)&v4->_sourceAppAuditToken, v8);
      objc_storeStrong((id *)&v4->_filterFlowIdentifier, v9);
    }
  }

  return v4;
}

- (NSData)sourceAppUniqueIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)sourceAppSigningIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)sourceAppAuditToken
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)filterFlowIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)fastOpenRequested
{
  return self->_fastOpenRequested;
}

- (BOOL)multipathRequested
{
  return self->_multipathRequested;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterFlowIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceAppAuditToken, 0);
  objc_storeStrong((id *)&self->_sourceAppSigningIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceAppUniqueIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
