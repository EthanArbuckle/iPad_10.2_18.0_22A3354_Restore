@implementation DAResolveRecipientsRequest

- (DAResolveRecipientsRequest)initWithEmailAddresses:(id)a3
{
  id v4;
  DAResolveRecipientsRequest *v5;
  DAResolveRecipientsRequest *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DAResolveRecipientsRequest;
  v5 = -[DAResolveRecipientsRequest init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[DAResolveRecipientsRequest setEmailAddresses:](v5, "setEmailAddresses:", v4);
    -[DAResolveRecipientsRequest setRetrieveCertificates:](v6, "setRetrieveCertificates:", 1);
    -[DAResolveRecipientsRequest setRetrieveAvailablilty:](v6, "setRetrieveAvailablilty:", 0);
    -[DAResolveRecipientsRequest setStartTime:](v6, "setStartTime:", 0);
    -[DAResolveRecipientsRequest setEndTime:](v6, "setEndTime:", 0);
  }

  return v6;
}

- (DAResolveRecipientsRequest)initWithEmailAddresses:(id)a3 retrieveCertificates:(BOOL)a4 retrieveAvailability:(BOOL)a5 withStartTime:(id)a6 endTime:(id)a7
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  DAResolveRecipientsRequest *v15;
  DAResolveRecipientsRequest *v16;
  objc_super v18;

  v9 = a5;
  v10 = a4;
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)DAResolveRecipientsRequest;
  v15 = -[DAResolveRecipientsRequest init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    -[DAResolveRecipientsRequest setEmailAddresses:](v15, "setEmailAddresses:", v12);
    -[DAResolveRecipientsRequest setRetrieveCertificates:](v16, "setRetrieveCertificates:", v10);
    -[DAResolveRecipientsRequest setRetrieveAvailablilty:](v16, "setRetrieveAvailablilty:", v9);
    -[DAResolveRecipientsRequest setStartTime:](v16, "setStartTime:", v13);
    -[DAResolveRecipientsRequest setEndTime:](v16, "setEndTime:", v14);
  }

  return v16;
}

- (unint64_t)hash
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[DAResolveRecipientsRequest emailAddresses](self, "emailAddresses", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "hash");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[DAResolveRecipientsRequest emailAddresses](self, "emailAddresses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "emailAddresses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)DAResolveRecipientsRequest;
  -[DAResolveRecipientsRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAResolveRecipientsRequest emailAddresses](self, "emailAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ emailAddresses %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void)setEmailAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_emailAddresses, a3);
}

- (BOOL)retrieveCertificates
{
  return self->_retrieveCertificates;
}

- (void)setRetrieveCertificates:(BOOL)a3
{
  self->_retrieveCertificates = a3;
}

- (BOOL)retrieveAvailablilty
{
  return self->_retrieveAvailablilty;
}

- (void)setRetrieveAvailablilty:(BOOL)a3
{
  self->_retrieveAvailablilty = a3;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
  objc_storeStrong((id *)&self->_endTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
}

@end
