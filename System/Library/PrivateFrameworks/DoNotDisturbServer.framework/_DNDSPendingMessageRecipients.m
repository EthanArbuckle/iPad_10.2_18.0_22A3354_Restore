@implementation _DNDSPendingMessageRecipients

- (_DNDSPendingMessageRecipients)initWithLastUpdateDate:(id)a3 deviceIdentifiers:(id)a4
{
  id v6;
  id v7;
  _DNDSPendingMessageRecipients *v8;
  uint64_t v9;
  NSDate *lastUpdateDate;
  uint64_t v11;
  NSSet *deviceIdentifiers;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_DNDSPendingMessageRecipients;
  v8 = -[_DNDSPendingMessageRecipients init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    lastUpdateDate = v8->_lastUpdateDate;
    v8->_lastUpdateDate = (NSDate *)v9;

    v11 = objc_msgSend(v7, "copy");
    deviceIdentifiers = v8->_deviceIdentifiers;
    v8->_deviceIdentifiers = (NSSet *)v11;

  }
  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", self->_lastUpdateDate, 1, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("sendDate: %@; deviceIdentifiers: %@"), v4, self->_deviceIdentifiers);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSDate)lastUpdateDate
{
  return self->_lastUpdateDate;
}

- (NSSet)deviceIdentifiers
{
  return self->_deviceIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifiers, 0);
  objc_storeStrong((id *)&self->_lastUpdateDate, 0);
}

@end
