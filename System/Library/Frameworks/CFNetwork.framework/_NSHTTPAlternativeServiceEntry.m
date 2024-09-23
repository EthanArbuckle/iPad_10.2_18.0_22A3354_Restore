@implementation _NSHTTPAlternativeServiceEntry

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (void)setServiceType:(int64_t)a3
{
  self->_serviceType = a3;
}

- (void)setPort:(int64_t)a3
{
  self->_port = a3;
}

- (void)setPartition:(id)a3
{
  id v4;
  __CFString *v5;
  NSString *partition;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
    v5 = (__CFString *)v4;
  else
    v5 = CFSTR("none");
  partition = self->_partition;
  self->_partition = &v5->isa;

}

- (void)setHost:(id)a3
{
  objc_storeStrong((id *)&self->_host, a3);
}

- (void)setAlternatePort:(int64_t)a3
{
  self->_alternatePort = a3;
}

- (void)setAlternateHost:(id)a3
{
  objc_storeStrong((id *)&self->_alternateHost, a3);
}

- (NSString)host
{
  return self->_host;
}

- (NSString)alternateHost
{
  return self->_alternateHost;
}

- (BOOL)isEqual:(id)a3
{
  _NSHTTPAlternativeServiceEntry *v4;
  _NSHTTPAlternativeServiceEntry *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  int64_t v11;
  BOOL v12;

  v4 = (_NSHTTPAlternativeServiceEntry *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[_NSHTTPAlternativeServiceEntry host](self, "host");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_NSHTTPAlternativeServiceEntry host](v5, "host");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[_NSHTTPAlternativeServiceEntry partition](self, "partition");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[_NSHTTPAlternativeServiceEntry partition](v5, "partition");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqual:", v9)
          && (v10 = -[_NSHTTPAlternativeServiceEntry port](self, "port"),
              v10 == -[_NSHTTPAlternativeServiceEntry port](v5, "port")))
        {
          v11 = -[_NSHTTPAlternativeServiceEntry serviceType](self, "serviceType");
          v12 = v11 == -[_NSHTTPAlternativeServiceEntry serviceType](v5, "serviceType");
        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (int64_t)port
{
  return self->_port;
}

- (NSString)partition
{
  return self->_partition;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (_NSHTTPAlternativeServiceEntry)init
{
  _NSHTTPAlternativeServiceEntry *v2;
  _NSHTTPAlternativeServiceEntry *v3;
  NSString *partition;
  uint64_t v5;
  NSDate *expirationDate;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_NSHTTPAlternativeServiceEntry;
  v2 = -[_NSHTTPAlternativeServiceEntry init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    partition = v2->_partition;
    v2->_partition = (NSString *)CFSTR("none");

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 86400.0);
    v5 = objc_claimAutoreleasedReturnValue();
    expirationDate = v3->_expirationDate;
    v3->_expirationDate = (NSDate *)v5;

  }
  return v3;
}

- (int64_t)alternatePort
{
  return self->_alternatePort;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;

  -[_NSHTTPAlternativeServiceEntry host](self, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[_NSHTTPAlternativeServiceEntry port](self, "port");
  -[_NSHTTPAlternativeServiceEntry partition](self, "partition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  v8 = v5 ^ v4 ^ v7 ^ -[_NSHTTPAlternativeServiceEntry serviceType](self, "serviceType");

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_partition, 0);
  objc_storeStrong((id *)&self->_alternateHost, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _NSHTTPAlternativeServiceEntry *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(_NSHTTPAlternativeServiceEntry);
  -[_NSHTTPAlternativeServiceEntry alternateHost](self, "alternateHost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NSHTTPAlternativeServiceEntry setAlternateHost:](v4, "setAlternateHost:", v5);

  -[_NSHTTPAlternativeServiceEntry setAlternatePort:](v4, "setAlternatePort:", -[_NSHTTPAlternativeServiceEntry alternatePort](self, "alternatePort"));
  -[_NSHTTPAlternativeServiceEntry host](self, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NSHTTPAlternativeServiceEntry setHost:](v4, "setHost:", v6);

  -[_NSHTTPAlternativeServiceEntry setPort:](v4, "setPort:", -[_NSHTTPAlternativeServiceEntry port](self, "port"));
  -[_NSHTTPAlternativeServiceEntry partition](self, "partition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NSHTTPAlternativeServiceEntry setPartition:](v4, "setPartition:", v7);

  -[_NSHTTPAlternativeServiceEntry expirationDate](self, "expirationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NSHTTPAlternativeServiceEntry setExpirationDate:](v4, "setExpirationDate:", v8);

  -[_NSHTTPAlternativeServiceEntry setServiceType:](v4, "setServiceType:", -[_NSHTTPAlternativeServiceEntry serviceType](self, "serviceType"));
  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<_NSHTTPAlternativeServiceEntry> {\n \t\t\tHost = %@ \n \t\t\tPort = %ld \n \t\t\tPartition = %@ \n \t\t\tAlternate-Host = %@ \n \t\t\tAlternate-Port = %ld \n \t\t\tExpiration = %@ \n} "), self->_host, self->_port, self->_partition, self->_alternateHost, self->_alternatePort, self->_expirationDate);
}

@end
