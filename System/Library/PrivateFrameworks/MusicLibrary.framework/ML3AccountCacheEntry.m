@implementation ML3AccountCacheEntry

- (ML3AccountCacheEntry)initWithAppleID:(id)a3 altDSID:(id)a4
{
  id v7;
  id v8;
  ML3AccountCacheEntry *v9;
  ML3AccountCacheEntry *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ML3AccountCacheEntry;
  v9 = -[ML3AccountCacheEntry init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appleID, a3);
    objc_storeStrong((id *)&v10->_altDSID, a4);
  }

  return v10;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
  objc_storeStrong((id *)&self->_appleID, a3);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_storeStrong((id *)&self->_altDSID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
}

@end
