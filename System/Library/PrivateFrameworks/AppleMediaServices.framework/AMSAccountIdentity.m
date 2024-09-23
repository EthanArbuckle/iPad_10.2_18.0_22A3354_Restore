@implementation AMSAccountIdentity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AMSAccountIdentity altDSID](self, "altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCodingKeyAltDSID"));

  -[AMSAccountIdentity dsid](self, "dsid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kCodingKeyDSID"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[AMSAccountIdentity altDSID](self, "altDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AMSAccountIdentity dsid](self, "dsid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AMSAccountIdentity)initWithDSID:(id)a3 altDSID:(id)a4
{
  id v6;
  id v7;
  AMSAccountIdentity *v8;
  AMSAccountIdentity *v9;
  uint64_t v10;
  NSNumber *dsid;
  uint64_t v12;
  NSString *altDSID;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AMSAccountIdentity;
  v8 = -[AMSAccountIdentity init](&v15, sel_init);
  if (!v8)
    goto LABEL_5;
  v9 = 0;
  if (v6 && v7)
  {
    v10 = objc_msgSend(v6, "copy");
    dsid = v8->_dsid;
    v8->_dsid = (NSNumber *)v10;

    v12 = objc_msgSend(v7, "copy");
    altDSID = v8->_altDSID;
    v8->_altDSID = (NSString *)v12;

LABEL_5:
    v9 = v8;
  }

  return v9;
}

- (AMSAccountIdentity)initWithCoder:(id)a3
{
  id v4;
  AMSAccountIdentity *v5;
  uint64_t v6;
  NSString *altDSID;
  uint64_t v8;
  NSNumber *dsid;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSAccountIdentity;
  v5 = -[AMSAccountIdentity init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyAltDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyDSID"));
    v8 = objc_claimAutoreleasedReturnValue();
    dsid = v5->_dsid;
    v5->_dsid = (NSNumber *)v8;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_altDSID, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSNumber copyWithZone:](self->_dsid, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = 0;
    v10 = 0;
    v6 = v4;
LABEL_9:

    goto LABEL_10;
  }
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "altDSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSAccountIdentity altDSID](self, "altDSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      objc_msgSend(v5, "dsid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSAccountIdentity dsid](self, "dsid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToNumber:", v9);

    }
    else
    {
      v10 = 0;
    }

    goto LABEL_9;
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSAccountIdentity;
  -[AMSAccountIdentity description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" (altDSID: %@, dsid: %@)"), self->_altDSID, self->_dsid);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
