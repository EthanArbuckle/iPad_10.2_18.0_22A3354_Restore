@implementation IDSOpportunisticOptions

- (IDSOpportunisticOptions)init
{
  double v2;

  return (IDSOpportunisticOptions *)objc_msgSend_initWithBlocklistedDestinations_expiryDate_destinationsMustBeInContacts_(self, a2, 0, v2, 0, 0);
}

- (IDSOpportunisticOptions)initWithBlocklistedDestinations:(id)a3 expiryDate:(id)a4 destinationsMustBeInContacts:(BOOL)a5
{
  id v9;
  id v10;
  IDSOpportunisticOptions *v11;
  IDSOpportunisticOptions *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IDSOpportunisticOptions;
  v11 = -[IDSOpportunisticOptions init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_blocklistedDestinations, a3);
    objc_storeStrong((id *)&v12->_expiryDate, a4);
    v12->_destinationsMustBeInContacts = a5;
  }

  return v12;
}

- (IDSOpportunisticOptions)initWithDictionary:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  const char *v18;
  double v19;
  IDSOpportunisticOptions *MustBeInContacts;

  v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)CFSTR("IDSOpportunisticOptionsBlocklistedDestinationsKey"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v8, (uint64_t)CFSTR("IDSOpportunisticOptionsExpiryDateKey"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v11, (uint64_t)CFSTR("IDSOpportunisticOptionsDestinationsMustBeInContactsKey"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend_BOOLValue(v13, v14, v15, v16);
  MustBeInContacts = (IDSOpportunisticOptions *)objc_msgSend_initWithBlocklistedDestinations_expiryDate_destinationsMustBeInContacts_(self, v18, (uint64_t)v7, v19, v10, v17);

  return MustBeInContacts;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  uint64_t MustBeInContacts;
  const char *v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_blocklistedDestinations(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)v7, v9, CFSTR("IDSOpportunisticOptionsBlocklistedDestinationsKey"));

  objc_msgSend_expiryDate(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, v15, CFSTR("IDSOpportunisticOptionsExpiryDateKey"));

  v16 = (void *)MEMORY[0x1E0CB37E8];
  MustBeInContacts = objc_msgSend_destinationsMustBeInContacts(self, v17, v18, v19);
  objc_msgSend_numberWithBool_(v16, v21, MustBeInContacts, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v24, (uint64_t)v23, v25, CFSTR("IDSOpportunisticOptionsDestinationsMustBeInContactsKey"));

  return (NSDictionary *)v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  const char *v16;
  double v17;
  void *v18;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_blocklistedDestinations(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_expiryDate(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_destinationsMustBeInContacts(self, v13, v14, v15))
    objc_msgSend_stringWithFormat_(v3, v16, (uint64_t)CFSTR("<%@:%p blocklist: %@, expiry: %@, mustBeContact: %@>"), v17, v4, self, v8, v12, CFSTR("YES"));
  else
    objc_msgSend_stringWithFormat_(v3, v16, (uint64_t)CFSTR("<%@:%p blocklist: %@, expiry: %@, mustBeContact: %@>"), v17, v4, self, v8, v12, CFSTR("NO"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSOpportunisticOptions)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  uint64_t v20;
  const char *v21;
  double v22;
  IDSOpportunisticOptions *MustBeInContacts;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend_setWithObjects_(v4, v8, v6, v9, v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v5, v11, (uint64_t)v10, v12, CFSTR("IDSOpportunisticOptionsBlocklistedDestinationsKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v15, v14, v16, CFSTR("IDSOpportunisticOptionsExpiryDateKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_decodeBoolForKey_(v5, v18, (uint64_t)CFSTR("IDSOpportunisticOptionsDestinationsMustBeInContactsKey"), v19);

  MustBeInContacts = (IDSOpportunisticOptions *)objc_msgSend_initWithBlocklistedDestinations_expiryDate_destinationsMustBeInContacts_(self, v21, (uint64_t)v13, v22, v17, v20);
  return MustBeInContacts;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  uint64_t MustBeInContacts;
  const char *v20;
  double v21;
  id v22;

  v22 = a3;
  objc_msgSend_blocklistedDestinations(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v22, v8, (uint64_t)v7, v9, CFSTR("IDSOpportunisticOptionsBlocklistedDestinationsKey"));

  objc_msgSend_expiryDate(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v22, v14, (uint64_t)v13, v15, CFSTR("IDSOpportunisticOptionsExpiryDateKey"));

  MustBeInContacts = objc_msgSend_destinationsMustBeInContacts(self, v16, v17, v18);
  objc_msgSend_encodeBool_forKey_(v22, v20, MustBeInContacts, v21, CFSTR("IDSOpportunisticOptionsDestinationsMustBeInContactsKey"));

}

- (NSArray)blocklistedDestinations
{
  return self->_blocklistedDestinations;
}

- (void)setBlocklistedDestinations:(id)a3
{
  objc_storeStrong((id *)&self->_blocklistedDestinations, a3);
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (void)setExpiryDate:(id)a3
{
  objc_storeStrong((id *)&self->_expiryDate, a3);
}

- (BOOL)destinationsMustBeInContacts
{
  return self->_destinationsMustBeInContacts;
}

- (void)setDestinationsMustBeInContacts:(BOOL)a3
{
  self->_destinationsMustBeInContacts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_blocklistedDestinations, 0);
}

@end
