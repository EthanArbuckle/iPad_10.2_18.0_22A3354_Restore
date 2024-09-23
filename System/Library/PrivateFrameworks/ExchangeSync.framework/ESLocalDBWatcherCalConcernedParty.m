@implementation ESLocalDBWatcherCalConcernedParty

- (ESLocalDBWatcherCalConcernedParty)initWithConcernedParty:(id)a3 accountID:(id)a4
{
  id v6;
  id v7;
  ESLocalDBWatcherCalConcernedParty *v8;
  ESLocalDBWatcherCalConcernedParty *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ESLocalDBWatcherCalConcernedParty;
  v8 = -[ESLocalDBWatcherCalConcernedParty init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_concernedParty, v6);
    objc_storeStrong((id *)&v9->_accountID, a4);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  id WeakRetained;
  id v7;
  char v8;
  NSString *accountID;
  void *v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    WeakRetained = objc_loadWeakRetained(&self->_concernedParty);
    objc_msgSend(v5, "concernedParty");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (WeakRetained == v7)
    {
      accountID = self->_accountID;
      objc_msgSend(v5, "accountID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[NSString isEqual:](accountID, "isEqual:", v10);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  id WeakRetained;
  uint64_t v4;
  NSUInteger v5;

  WeakRetained = objc_loadWeakRetained(&self->_concernedParty);
  v4 = objc_msgSend(WeakRetained, "hash");
  v5 = -[NSString hash](self->_accountID, "hash") ^ v4;

  return v5;
}

- (id)concernedParty
{
  return objc_loadWeakRetained(&self->_concernedParty);
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_destroyWeak(&self->_concernedParty);
}

@end
