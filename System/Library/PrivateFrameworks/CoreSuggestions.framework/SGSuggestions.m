@implementation SGSuggestions

- (SGSuggestions)initWithContacts:(id)a3 events:(id)a4 reminders:(id)a5 walletOrders:(id)a6 walletPasses:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SGSuggestions *v17;
  SGSuggestions *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SGSuggestions;
  v17 = -[SGSuggestions init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_contacts, a3);
    objc_storeStrong((id *)&v18->_events, a4);
    objc_storeStrong((id *)&v18->_reminders, a5);
    objc_storeStrong((id *)&v18->_walletOrders, a6);
    objc_storeStrong((id *)&v18->_walletPasses, a7);
  }

  return v18;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[SGSuggestions\n\t - contacts:%@\n\t- events: %@\n\t- reminders:%@\n\t- orders:%@\n\t- passes: %@\n]"), self->_contacts, self->_events, self->_reminders, self->_walletOrders, self->_walletPasses);
}

- (SGSuggestions)initWithCoder:(id)a3
{
  id v4;
  SGSuggestions *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *contacts;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *events;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *reminders;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSArray *walletOrders;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSArray *walletPasses;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SGSuggestions;
  v5 = -[SGSuggestions init](&v32, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("contacts"));
    v9 = objc_claimAutoreleasedReturnValue();
    contacts = v5->_contacts;
    v5->_contacts = (NSArray *)v9;

    v11 = objc_alloc(MEMORY[0x1E0C99E60]);
    v12 = objc_opt_class();
    v13 = (void *)objc_msgSend(v11, "initWithObjects:", v12, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("events"));
    v14 = objc_claimAutoreleasedReturnValue();
    events = v5->_events;
    v5->_events = (NSArray *)v14;

    v16 = objc_alloc(MEMORY[0x1E0C99E60]);
    v17 = objc_opt_class();
    v18 = (void *)objc_msgSend(v16, "initWithObjects:", v17, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("reminders"));
    v19 = objc_claimAutoreleasedReturnValue();
    reminders = v5->_reminders;
    v5->_reminders = (NSArray *)v19;

    v21 = objc_alloc(MEMORY[0x1E0C99E60]);
    v22 = objc_opt_class();
    v23 = (void *)objc_msgSend(v21, "initWithObjects:", v22, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("walletOrders"));
    v24 = objc_claimAutoreleasedReturnValue();
    walletOrders = v5->_walletOrders;
    v5->_walletOrders = (NSArray *)v24;

    v26 = objc_alloc(MEMORY[0x1E0C99E60]);
    v27 = objc_opt_class();
    v28 = (void *)objc_msgSend(v26, "initWithObjects:", v27, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("walletPasses"));
    v29 = objc_claimAutoreleasedReturnValue();
    walletPasses = v5->_walletPasses;
    v5->_walletPasses = (NSArray *)v29;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *contacts;
  id v5;

  contacts = self->_contacts;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contacts, CFSTR("contacts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_events, CFSTR("events"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reminders, CFSTR("reminders"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_walletOrders, CFSTR("walletOrders"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_walletPasses, CFSTR("walletPasses"));

}

- (NSArray)contacts
{
  return self->_contacts;
}

- (NSArray)events
{
  return self->_events;
}

- (NSArray)reminders
{
  return self->_reminders;
}

- (NSArray)walletOrders
{
  return self->_walletOrders;
}

- (NSArray)walletPasses
{
  return self->_walletPasses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletPasses, 0);
  objc_storeStrong((id *)&self->_walletOrders, 0);
  objc_storeStrong((id *)&self->_reminders, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
