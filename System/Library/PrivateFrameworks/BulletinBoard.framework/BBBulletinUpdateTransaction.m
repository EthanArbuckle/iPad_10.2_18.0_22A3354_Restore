@implementation BBBulletinUpdateTransaction

+ (id)transactionWithBulletinUpdate:(id)a3 transactionID:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithBulletinUpdate:transactionID:", v6, a4);

  return v7;
}

- (id)_initWithBulletinUpdate:(id)a3 transactionID:(unint64_t)a4
{
  id v7;
  BBBulletinUpdateTransaction *v8;
  uint64_t v9;
  BBBulletinUpdate *bulletinUpdate;
  void *v12;
  objc_super v13;

  v7 = a3;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBBulletinUpdateTransaction.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transactionID > 0"));

  }
  v13.receiver = self;
  v13.super_class = (Class)BBBulletinUpdateTransaction;
  v8 = -[BBBulletinUpdateTransaction init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    bulletinUpdate = v8->_bulletinUpdate;
    v8->_bulletinUpdate = (BBBulletinUpdate *)v9;

    v8->_transactionID = a4;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[BBBulletinUpdateTransaction bulletinUpdate](self, "bulletinUpdate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[BBBulletinUpdateTransaction transactionID](self, "transactionID") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  BBBulletinUpdateTransaction *v4;
  BBBulletinUpdateTransaction *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  BOOL v9;

  v4 = (BBBulletinUpdateTransaction *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[BBBulletinUpdateTransaction bulletinUpdate](self, "bulletinUpdate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[BBBulletinUpdateTransaction bulletinUpdate](v5, "bulletinUpdate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSEqualObjects())
      {
        v8 = -[BBBulletinUpdateTransaction transactionID](self, "transactionID");
        v9 = v8 == -[BBBulletinUpdateTransaction transactionID](v5, "transactionID");
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBBulletinUpdateTransaction bulletinUpdate](self, "bulletinUpdate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("Bulletin Update"));

  v6 = (id)objc_msgSend(v3, "appendInteger:withName:", -[BBBulletinUpdateTransaction transactionID](self, "transactionID"), CFSTR("Transaction ID"));
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[BBBulletinUpdateTransaction bulletinUpdate](self, "bulletinUpdate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("bulletinUpdate"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[BBBulletinUpdateTransaction transactionID](self, "transactionID"), CFSTR("transactionID"));
}

- (BBBulletinUpdateTransaction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BBBulletinUpdateTransaction *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bulletinUpdate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transactionID"));

  v7 = -[BBBulletinUpdateTransaction _initWithBulletinUpdate:transactionID:](self, "_initWithBulletinUpdate:transactionID:", v5, v6);
  return v7;
}

- (BBBulletinUpdate)bulletinUpdate
{
  return self->_bulletinUpdate;
}

- (unint64_t)transactionID
{
  return self->_transactionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bulletinUpdate, 0);
}

@end
