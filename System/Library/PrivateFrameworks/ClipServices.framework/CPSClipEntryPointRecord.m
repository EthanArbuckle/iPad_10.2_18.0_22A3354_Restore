@implementation CPSClipEntryPointRecord

- (CPSClipEntryPointRecord)initWithSQLiteRow:(id)a3
{
  id v4;
  CPSClipEntryPointRecord *v5;
  uint64_t v6;
  NSString *appClipBundleID;
  uint64_t v8;
  NSString *webClipIdentifier;
  double v10;
  CPSClipEntryPointRecord *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPSClipEntryPointRecord;
  v5 = -[CPSClipEntryPointRecord init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "stringAtIndex:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    appClipBundleID = v5->_appClipBundleID;
    v5->_appClipBundleID = (NSString *)v6;

    objc_msgSend(v4, "stringAtIndex:", 1);
    v8 = objc_claimAutoreleasedReturnValue();
    webClipIdentifier = v5->_webClipIdentifier;
    v5->_webClipIdentifier = (NSString *)v8;

    objc_msgSend(v4, "doubleAtIndex:", 2);
    v5->_lastABRFetchTime = v10;
    v11 = v5;
  }

  return v5;
}

- (NSString)appClipBundleID
{
  return self->_appClipBundleID;
}

- (void)setAppClipBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)webClipIdentifier
{
  return self->_webClipIdentifier;
}

- (void)setWebClipIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)lastABRFetchTime
{
  return self->_lastABRFetchTime;
}

- (void)setLastABRFetchTime:(double)a3
{
  self->_lastABRFetchTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webClipIdentifier, 0);
  objc_storeStrong((id *)&self->_appClipBundleID, 0);
}

@end
