@implementation AACustodianshipInfo

- (AACustodianshipInfo)initWithID:(id)a3 status:(int64_t)a4 ownerHandle:(id)a5
{
  id v9;
  id v10;
  AACustodianshipInfo *v11;
  AACustodianshipInfo *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AACustodianshipInfo;
  v11 = -[AACustodianshipInfo init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_custodianID, a3);
    v12->_status = a4;
    objc_storeStrong((id *)&v12->_ownerHandle, a5);
  }

  return v12;
}

- (AACustodianshipInfo)initWithCoder:(id)a3
{
  id v4;
  AACustodianshipInfo *v5;
  uint64_t v6;
  NSUUID *custodianID;
  uint64_t v8;
  NSString *ownerHandle;

  v4 = a3;
  v5 = -[AACustodianshipInfo init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_custodianID"));
    v6 = objc_claimAutoreleasedReturnValue();
    custodianID = v5->_custodianID;
    v5->_custodianID = (NSUUID *)v6;

    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_status"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ownerHandle"));
    v8 = objc_claimAutoreleasedReturnValue();
    ownerHandle = v5->_ownerHandle;
    v5->_ownerHandle = (NSString *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *custodianID;
  id v5;

  custodianID = self->_custodianID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", custodianID, CFSTR("_custodianID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("_status"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ownerHandle, CFSTR("_ownerHandle"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = (_QWORD *)objc_opt_new();
  v5 = -[NSUUID copy](self->_custodianID, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v4[2] = self->_status;
  v7 = -[NSString copy](self->_ownerHandle, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (id)statusDescription
{
  int64_t v2;

  v2 = -[AACustodianshipInfo status](self, "status");
  if ((unint64_t)(v2 + 1) > 5)
    return 0;
  else
    return *(&off_1E416E5B8 + v2 + 1);
}

- (NSUUID)custodianID
{
  return self->_custodianID;
}

- (int64_t)status
{
  return self->_status;
}

- (NSString)ownerHandle
{
  return self->_ownerHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerHandle, 0);
  objc_storeStrong((id *)&self->_custodianID, 0);
}

@end
