@implementation CNAutocompleteFetchContext

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CNAutocompleteFetchContext sendingAddress](self, "sendingAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSendingAddress:", v5);

  -[CNAutocompleteFetchContext sendingAddressAccountIdentifier](self, "sendingAddressAccountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSendingAddressAccountIdentifier:", v6);

  -[CNAutocompleteFetchContext domainIdentifier](self, "domainIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDomainIdentifier:", v7);

  -[CNAutocompleteFetchContext otherAddressesAlreadyChosen](self, "otherAddressesAlreadyChosen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOtherAddressesAlreadyChosen:", v8);

  -[CNAutocompleteFetchContext title](self, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v9);

  -[CNAutocompleteFetchContext date](self, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDate:", v10);

  -[CNAutocompleteFetchContext locationUUID](self, "locationUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocationUUID:", v11);

  -[CNAutocompleteFetchContext bundleIdentifiers](self, "bundleIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBundleIdentifiers:", v12);

  objc_msgSend(v4, "setPredictsBasedOnOutgoingInteraction:", -[CNAutocompleteFetchContext predictsBasedOnOutgoingInteraction](self, "predictsBasedOnOutgoingInteraction"));
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteFetchContext sendingAddress](self, "sendingAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("sending address"), v4);

  -[CNAutocompleteFetchContext sendingAddressAccountIdentifier](self, "sendingAddressAccountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("sending account"), v6);

  -[CNAutocompleteFetchContext domainIdentifier](self, "domainIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("domain"), v8);

  -[CNAutocompleteFetchContext otherAddressesAlreadyChosen](self, "otherAddressesAlreadyChosen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("related contacts"), v10);

  -[CNAutocompleteFetchContext title](self, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("title"), v12);

  -[CNAutocompleteFetchContext date](self, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("date"), v14);

  -[CNAutocompleteFetchContext locationUUID](self, "locationUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("location"), v16);

  -[CNAutocompleteFetchContext bundleIdentifiers](self, "bundleIdentifiers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "componentsJoinedByString:", CFSTR("+"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("bundleIdentifiers"), v19);

  v21 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("predictsBasedOnOutgoingInteraction"), -[CNAutocompleteFetchContext predictsBasedOnOutgoingInteraction](self, "predictsBasedOnOutgoingInteraction"));
  objc_msgSend(v3, "build");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  NSString *sendingAddress;
  int v6;
  NSString *sendingAddressAccountIdentifier;
  NSString *domainIdentifier;
  NSArray *otherAddressesAlreadyChosen;
  NSString *title;
  NSDate *date;
  NSString *locationUUID;
  NSArray *bundleIdentifiers;

  if (self == a3)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !self->_predictsBasedOnOutgoingInteraction == (*((_BYTE *)a3 + 8) != 0))
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      sendingAddress = self->_sendingAddress;
      if (!((unint64_t)sendingAddress | *((_QWORD *)a3 + 2))
        || (v6 = -[NSString isEqual:](sendingAddress, "isEqual:")) != 0)
      {
        sendingAddressAccountIdentifier = self->_sendingAddressAccountIdentifier;
        if (!((unint64_t)sendingAddressAccountIdentifier | *((_QWORD *)a3 + 3))
          || (v6 = -[NSString isEqual:](sendingAddressAccountIdentifier, "isEqual:")) != 0)
        {
          domainIdentifier = self->_domainIdentifier;
          if (!((unint64_t)domainIdentifier | *((_QWORD *)a3 + 4))
            || (v6 = -[NSString isEqual:](domainIdentifier, "isEqual:")) != 0)
          {
            otherAddressesAlreadyChosen = self->_otherAddressesAlreadyChosen;
            if (!((unint64_t)otherAddressesAlreadyChosen | *((_QWORD *)a3 + 6))
              || (v6 = -[NSArray isEqual:](otherAddressesAlreadyChosen, "isEqual:")) != 0)
            {
              title = self->_title;
              if (!((unint64_t)title | *((_QWORD *)a3 + 9))
                || (v6 = -[NSString isEqual:](title, "isEqual:")) != 0)
              {
                date = self->_date;
                if (!((unint64_t)date | *((_QWORD *)a3 + 7)) || (v6 = -[NSDate isEqual:](date, "isEqual:")) != 0)
                {
                  locationUUID = self->_locationUUID;
                  if (!((unint64_t)locationUUID | *((_QWORD *)a3 + 8))
                    || (v6 = -[NSString isEqual:](locationUUID, "isEqual:")) != 0)
                  {
                    bundleIdentifiers = self->_bundleIdentifiers;
                    if (!((unint64_t)bundleIdentifiers | *((_QWORD *)a3 + 10))
                      || (v6 = -[NSArray isEqual:](bundleIdentifiers, "isEqual:")) != 0)
                    {
                      LOBYTE(v6) = 1;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_sendingAddress);
  v4 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_sendingAddressAccountIdentifier) - v3 + 32 * v3;
  v5 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_domainIdentifier) - v4 + 32 * v4;
  v6 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_otherAddressesAlreadyChosen) - v5 + 32 * v5;
  v7 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_title) - v6 + 32 * v6;
  v8 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_date) - v7 + 32 * v7;
  v9 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_locationUUID) - v8 + 32 * v8;
  v10 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_bundleIdentifiers);
  return self->_predictsBasedOnOutgoingInteraction
       - (v10
        - v9
        + 32 * v9)
       + 32 * (v10 - v9 + 32 * v9)
       + 0x198CB38E0830FLL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNAutocompleteFetchContext)initWithCoder:(id)a3
{
  id v4;
  CNAutocompleteFetchContext *v5;
  uint64_t v6;
  NSString *sendingAddress;
  uint64_t v8;
  NSString *sendingAddressAccountIdentifier;
  uint64_t v10;
  NSString *domainIdentifier;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *otherAddressesAlreadyChosen;
  uint64_t v17;
  NSString *title;
  uint64_t v19;
  NSString *locationUUID;
  uint64_t v21;
  NSDate *date;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSArray *bundleIdentifiers;
  CNAutocompleteFetchContext *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CNAutocompleteFetchContext;
  v5 = -[CNAutocompleteFetchContext init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sendingAddress"));
    v6 = objc_claimAutoreleasedReturnValue();
    sendingAddress = v5->_sendingAddress;
    v5->_sendingAddress = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sendingAddressAccountIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    sendingAddressAccountIdentifier = v5->_sendingAddressAccountIdentifier;
    v5->_sendingAddressAccountIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domainIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    domainIdentifier = v5->_domainIdentifier;
    v5->_domainIdentifier = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("otherAddressesAlreadyChosen"));
    v15 = objc_claimAutoreleasedReturnValue();
    otherAddressesAlreadyChosen = v5->_otherAddressesAlreadyChosen;
    v5->_otherAddressesAlreadyChosen = (NSArray *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v17 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locationUUID"));
    v19 = objc_claimAutoreleasedReturnValue();
    locationUUID = v5->_locationUUID;
    v5->_locationUUID = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v21 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v21;

    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("bundleIdentifiers"));
    v26 = objc_claimAutoreleasedReturnValue();
    bundleIdentifiers = v5->_bundleIdentifiers;
    v5->_bundleIdentifiers = (NSArray *)v26;

    v5->_predictsBasedOnOutgoingInteraction = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("predictsBasedOnOutgoingInteraction"));
    v28 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *sendingAddress;
  id v5;

  sendingAddress = self->_sendingAddress;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sendingAddress, CFSTR("sendingAddress"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sendingAddressAccountIdentifier, CFSTR("sendingAddressAccountIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_domainIdentifier, CFSTR("domainIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_otherAddressesAlreadyChosen, CFSTR("otherAddressesAlreadyChosen"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_locationUUID, CFSTR("locationUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifiers, CFSTR("bundleIdentifiers"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_predictsBasedOnOutgoingInteraction, CFSTR("predictsBasedOnOutgoingInteraction"));

}

- (BOOL)isValid:(id *)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[CNAutocompleteFetchContext otherAddressesAlreadyChosen](self, "otherAddressesAlreadyChosen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_cn_any:", *MEMORY[0x1E0D13838]);

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB2D68];
    v12[0] = CFSTR("otherAddressesAlreadyChosen contains NSNull");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("CNContactAutocompleteErrorDomain"), 2, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a3)
      *a3 = objc_retainAutorelease(v8);

  }
  return v5 ^ 1;
}

- (NSString)sendingAddress
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSendingAddress:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)sendingAddressAccountIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSendingAddressAccountIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)domainIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDomainIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSArray)relatedContacts
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRelatedContacts:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSArray)otherAddressesAlreadyChosen
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOtherAddressesAlreadyChosen:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSString)locationUUID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLocationUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSArray)bundleIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBundleIdentifiers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (BOOL)predictsBasedOnOutgoingInteraction
{
  return self->_predictsBasedOnOutgoingInteraction;
}

- (void)setPredictsBasedOnOutgoingInteraction:(BOOL)a3
{
  self->_predictsBasedOnOutgoingInteraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_locationUUID, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_otherAddressesAlreadyChosen, 0);
  objc_storeStrong((id *)&self->_relatedContacts, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_sendingAddressAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_sendingAddress, 0);
}

@end
