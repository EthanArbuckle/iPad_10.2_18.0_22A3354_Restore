@implementation AKFollowUpTearDownContext

- (AKFollowUpTearDownContext)initWithCoder:(id)a3
{
  id v4;
  AKFollowUpTearDownContext *v5;
  uint64_t v6;
  NSString *altDSID;
  uint64_t v8;
  NSString *akAction;
  uint64_t v10;
  NSString *itemIdentifier;
  uint64_t v12;
  NSString *txnid;
  uint64_t v14;
  NSString *idmsData;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AKFollowUpTearDownContext;
  v5 = -[AKFollowUpTearDownContext init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_altDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_akAction"));
    v8 = objc_claimAutoreleasedReturnValue();
    akAction = v5->_akAction;
    v5->_akAction = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_itemIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_txnid"));
    v12 = objc_claimAutoreleasedReturnValue();
    txnid = v5->_txnid;
    v5->_txnid = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_idmsData"));
    v14 = objc_claimAutoreleasedReturnValue();
    idmsData = v5->_idmsData;
    v5->_idmsData = (NSString *)v14;

    v5->_isContinuityPush = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isContinuityPush"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *altDSID;
  id v5;

  altDSID = self->_altDSID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", altDSID, CFSTR("_altDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_akAction, CFSTR("_akAction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemIdentifier, CFSTR("_itemIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_txnid, CFSTR("_txnid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_idmsData, CFSTR("_idmsData"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isContinuityPush, CFSTR("_isContinuityPush"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p> identifier: %@, action: %@, altDSID: %@, txnid: %@"), objc_opt_class(), self, self->_itemIdentifier, self->_akAction, self->_altDSID, self->_txnid);
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)akAction
{
  return self->_akAction;
}

- (void)setAkAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)txnid
{
  return self->_txnid;
}

- (void)setTxnid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)idmsData
{
  return self->_idmsData;
}

- (void)setIdmsData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isContinuityPush
{
  return self->_isContinuityPush;
}

- (void)setIsContinuityPush:(BOOL)a3
{
  self->_isContinuityPush = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idmsData, 0);
  objc_storeStrong((id *)&self->_txnid, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_akAction, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end
