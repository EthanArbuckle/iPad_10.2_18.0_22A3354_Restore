@implementation SGRealtimeSuggestionsTuple

- (unint64_t)suggestionsCount
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;

  -[SGRealtimeSuggestionsTuple contacts](self, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[SGRealtimeSuggestionsTuple events](self, "events");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") + v4;
  -[SGRealtimeSuggestionsTuple reminders](self, "reminders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  -[SGRealtimeSuggestionsTuple deliveries](self, "deliveries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 + v8 + objc_msgSend(v9, "count");
  -[SGRealtimeSuggestionsTuple walletOrders](self, "walletOrders");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  -[SGRealtimeSuggestionsTuple walletPasses](self, "walletPasses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10 + v12 + objc_msgSend(v13, "count");

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setContacts:", self->_contacts);
  objc_msgSend(v4, "setEvents:", self->_events);
  objc_msgSend(v4, "setReminders:", self->_reminders);
  objc_msgSend(v4, "setDeliveries:", self->_deliveries);
  objc_msgSend(v4, "setInvalidatedIdentifiers:", self->_invalidatedIdentifiers);
  objc_msgSend(v4, "setWalletOrders:", self->_walletOrders);
  objc_msgSend(v4, "setWalletPasses:", self->_walletPasses);
  return v4;
}

- (id)combinedSuggestions
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  v4 = v3;
  if (self->_contacts)
    objc_msgSend(v3, "addObjectsFromArray:");
  if (self->_events)
    objc_msgSend(v4, "addObjectsFromArray:");
  if (self->_reminders)
    objc_msgSend(v4, "addObjectsFromArray:");
  if (self->_deliveries)
    objc_msgSend(v4, "addObjectsFromArray:");
  if (self->_walletOrders)
    objc_msgSend(v4, "addObjectsFromArray:");
  if (self->_walletPasses)
    objc_msgSend(v4, "addObjectsFromArray:");
  return v4;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<SGRealtimeSuggestionsTuple c:%tu e:%tu r:%tu d:%tu i:%tu o:%tu p:%tu>"), -[NSArray count](self->_contacts, "count"), -[NSArray count](self->_events, "count"), -[NSArray count](self->_reminders, "count"), -[NSArray count](self->_deliveries, "count"), -[NSArray count](self->_invalidatedIdentifiers, "count"), -[NSArray count](self->_walletOrders, "count"), -[NSArray count](self->_walletPasses, "count"));
}

- (NSArray)contacts
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContacts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)events
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEvents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)reminders
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReminders:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)deliveries
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDeliveries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSArray)invalidatedIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInvalidatedIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSArray)walletOrders
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWalletOrders:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSArray)walletPasses
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWalletPasses:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletPasses, 0);
  objc_storeStrong((id *)&self->_walletOrders, 0);
  objc_storeStrong((id *)&self->_invalidatedIdentifiers, 0);
  objc_storeStrong((id *)&self->_deliveries, 0);
  objc_storeStrong((id *)&self->_reminders, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
}

@end
