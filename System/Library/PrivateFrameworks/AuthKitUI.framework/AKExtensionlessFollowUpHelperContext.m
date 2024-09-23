@implementation AKExtensionlessFollowUpHelperContext

- (AKExtensionlessFollowUpHelperContext)initWithCoder:(id)a3
{
  id v4;
  AKExtensionlessFollowUpHelperContext *v5;
  uint64_t v6;
  NSString *urlKey;
  uint64_t v8;
  NSString *altDSID;
  uint64_t v10;
  NSString *akAction;
  uint64_t v12;
  NSString *uniqueItemIdentifier;
  uint64_t v14;
  NSDictionary *additionalInfo;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AKExtensionlessFollowUpHelperContext;
  v5 = -[AKExtensionlessFollowUpHelperContext init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_urlKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    urlKey = v5->_urlKey;
    v5->_urlKey = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_altDSID"));
    v8 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_akAction"));
    v10 = objc_claimAutoreleasedReturnValue();
    akAction = v5->_akAction;
    v5->_akAction = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_uniqueItemIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    uniqueItemIdentifier = v5->_uniqueItemIdentifier;
    v5->_uniqueItemIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_additionalInfo"));
    v14 = objc_claimAutoreleasedReturnValue();
    additionalInfo = v5->_additionalInfo;
    v5->_additionalInfo = (NSDictionary *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_presentingViewController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_presentingViewController, v16);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *urlKey;
  id v5;
  id WeakRetained;

  urlKey = self->_urlKey;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", urlKey, CFSTR("_urlKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_altDSID, CFSTR("_altDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_akAction, CFSTR("_akAction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uniqueItemIdentifier, CFSTR("_uniqueItemIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_additionalInfo, CFSTR("_additionalInfo"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  objc_msgSend(v5, "encodeObject:forKey:", WeakRetained, CFSTR("_presentingViewController"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p> urlKey: %@, action: %@, uniqueItemIdentifier: %@"), objc_opt_class(), self, self->_urlKey, self->_akAction, self->_uniqueItemIdentifier);
}

- (NSString)uniqueItemIdentifier
{
  return self->_uniqueItemIdentifier;
}

- (void)setUniqueItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)urlKey
{
  return self->_urlKey;
}

- (void)setUrlKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)akAction
{
  return self->_akAction;
}

- (void)setAkAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)additionalInfo
{
  return self->_additionalInfo;
}

- (void)setAdditionalInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_akAction, 0);
  objc_storeStrong((id *)&self->_urlKey, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_uniqueItemIdentifier, 0);
}

@end
