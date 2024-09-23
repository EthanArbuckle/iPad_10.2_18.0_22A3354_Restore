@implementation CNAPITriageSession

- (CNAPITriageSession)initWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CNAPITriageSession *v8;

  v4 = a3;
  +[CNContactsLoggerProvider defaultProvider](CNContactsLoggerProvider, "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "apiTriageLogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D13BB8], "defaultProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNAPITriageSession initWithRequest:triageLogger:timeProvider:](self, "initWithRequest:triageLogger:timeProvider:", v4, v6, v7);

  return v8;
}

- (CNAPITriageSession)initWithRequest:(id)a3 triageLogger:(id)a4 timeProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNAPITriageSession *v12;
  CNAPITriageSession *v13;
  CNAPITriageSession *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNAPITriageSession;
  v12 = -[CNAPITriageSession init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_logger, a4);
    objc_storeStrong((id *)&v13->_timeProvider, a5);
    v13->_hasClientCalloutTime = 0;
    v14 = v13;
  }

  return v13;
}

- (void)closeWithContacts:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CNAPITriageSession normalizeCollectionOfContacts:](self, "normalizeCollectionOfContacts:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[CNAPITriageLogger request:containsContact:](self->_logger, "request:containsContact:", self->_request, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
  -[CNAPITriageSession close](self, "close");

}

- (void)close
{
  double v3;
  double v4;

  -[CNTimeProvider timestamp](self->_timeProvider, "timestamp");
  self->_timeSessionEnded = v3;
  v4 = v3 - self->_timeSessionBegan;
  if (self->_hasClientCalloutTime)
  {
    v4 = v4 - self->_clientCalloutTime;
    -[CNAPITriageLogger request:spentTimeInClientCode:](self->_logger, "request:spentTimeInClientCode:", self->_request);
  }
  -[CNAPITriageLogger didExecuteFetchRequest:duration:](self->_logger, "didExecuteFetchRequest:duration:", self->_request, v4);
}

- (void)open
{
  double v3;

  -[CNTimeProvider timestamp](self->_timeProvider, "timestamp");
  self->_timeSessionBegan = v3;
  -[CNAPITriageLogger willExecuteFetchRequest:](self->_logger, "willExecuteFetchRequest:", self->_request);
}

- (id)normalizeCollectionOfContacts:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;

  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = v6;
  v8 = v4;
  if (!v7)
  {
    objc_opt_class();
    v9 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (v11)
    {
      objc_msgSend(v11, "allValues");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_cn_flatten");
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = v9;
      v13 = &unk_1EE1A6488;
      if (objc_msgSend(v8, "conformsToProtocol:", v13))
        v14 = v8;
      else
        v14 = 0;
      v15 = v14;

      if (!v15)
      {
        v16 = os_log_create("com.apple.contacts", "api-triage");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          -[CNAPITriageSession normalizeCollectionOfContacts:].cold.1((uint64_t)v8, v16);

        v8 = (id)MEMORY[0x1E0C9AA60];
      }
    }

  }
  return v8;
}

- (void)closeWithContacts:(id)a3 orError:(id)a4
{
  if (a3)
    -[CNAPITriageSession closeWithContacts:](self, "closeWithContacts:", a3, a4);
  else
    -[CNAPITriageSession closeWithError:](self, "closeWithError:", a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_timeProvider, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (CNAPITriageLogger)logger
{
  return (CNAPITriageLogger *)objc_getProperty(self, a2, 8, 1);
}

- (CNTimeProvider)timeProvider
{
  return (CNTimeProvider *)objc_getProperty(self, a2, 16, 1);
}

- (void)addClientCalloutTime:(double)a3
{
  self->_clientCalloutTime = self->_clientCalloutTime + a3;
  self->_hasClientCalloutTime = 1;
}

- (CNAPITriageSession)init
{
  CNAPITriageSession *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (void)closeWithError:(id)a3
{
  -[CNAPITriageLogger request:encounteredError:](self->_logger, "request:encounteredError:", self->_request, a3);
  -[CNAPITriageSession close](self, "close");
}

- (void)closeWithResult:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (objc_msgSend(v4, "isSuccess"))
  {
    objc_msgSend(v4, "value");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    -[CNAPITriageSession closeWithContacts:](self, "closeWithContacts:", v5);
  }
  else
  {
    objc_msgSend(v4, "error");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    -[CNAPITriageSession closeWithError:](self, "closeWithError:", v5);
  }

}

- (CNContactFetchRequest)request
{
  return (CNContactFetchRequest *)objc_getProperty(self, a2, 56, 1);
}

- (void)normalizeCollectionOfContacts:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_18F8BD000, a2, OS_LOG_TYPE_FAULT, "Session closed with invalid collection of contacts: %@", (uint8_t *)&v2, 0xCu);
}

@end
