@implementation IDSFirewallEntry

- (IDSFirewallEntry)initWithURI:(id)a3
{
  return -[IDSFirewallEntry initWithURI:andLastSeenDate:](self, "initWithURI:andLastSeenDate:", a3, 0);
}

- (IDSFirewallEntry)initWithURI:(id)a3 andLastSeenDate:(id)a4
{
  id v7;
  id v8;
  IDSFirewallEntry *v9;
  IDSFirewallEntry *v10;
  NSDate *v11;
  IDSFirewallEntry *v12;
  NSDate *lastSeen;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v15.receiver = self;
    v15.super_class = (Class)IDSFirewallEntry;
    v9 = -[IDSFirewallEntry init](&v15, sel_init);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_uri, a3);
      if (v8)
      {
        v11 = (NSDate *)v8;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
      }
      lastSeen = v10->_lastSeen;
      v10->_lastSeen = v11;

      v10->_isDonated = 0;
    }
    self = v10;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[IDSFirewallEntry uri](self, "uri");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uri");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

      if (v7)
      {
        -[IDSFirewallEntry lastSeen](self, "lastSeen");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "lastSeen");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

        if (v10)
        {
          -[IDSFirewallEntry mergeID](self, "mergeID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11 || (objc_msgSend(v4, "mergeID"), (v15 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
          {
            -[IDSFirewallEntry mergeID](self, "mergeID");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "mergeID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v12, "isEqual:", v13);

            if (v11)
            {
LABEL_13:

              goto LABEL_9;
            }
            v15 = 0;
          }
          else
          {
            v14 = 1;
          }

          goto LABEL_13;
        }
      }
    }
  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IDSFirewallEntry uri](self, "uri");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSFirewallEntry lastSeen](self, "lastSeen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IDSFirewallEntry isDonated](self, "isDonated"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[IDSFirewallEntry mergeID](self, "mergeID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<IDSFirewallEntry %p>: uri %@ lastSeen %@ isDonated %@ mergeID %@"), self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc((Class)objc_opt_class());
  -[IDSFirewallEntry uri](self, "uri");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSFirewallEntry lastSeen](self, "lastSeen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithURI:andLastSeenDate:", v5, v6);

  -[IDSFirewallEntry mergeID](self, "mergeID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMergeID:", v8);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[IDSFirewallEntry uri](self, "uri");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("firewall-uri"));

  -[IDSFirewallEntry lastSeen](self, "lastSeen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("firewall-lastseen"));

  -[IDSFirewallEntry mergeID](self, "mergeID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("firewall-mergeid"));

  objc_msgSend(v7, "encodeBool:forKey:", -[IDSFirewallEntry isDonated](self, "isDonated"), CFSTR("firewall-isdonated"));
}

- (IDSFirewallEntry)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  IDSFirewallEntry *v9;
  IDSFirewallEntry *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firewall-uri"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firewall-lastseen"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firewall-mergeid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("firewall-isdonated"));

  v9 = -[IDSFirewallEntry initWithURI:andLastSeenDate:]([IDSFirewallEntry alloc], "initWithURI:andLastSeenDate:", v5, v6);
  v10 = v9;
  if (v7)
    -[IDSFirewallEntry setMergeID:](v9, "setMergeID:", v7);
  -[IDSFirewallEntry setIsDonated:](v10, "setIsDonated:", v8);

  return v10;
}

- (IDSURI)uri
{
  return self->_uri;
}

- (NSDate)lastSeen
{
  return self->_lastSeen;
}

- (NSString)mergeID
{
  return self->_mergeID;
}

- (void)setMergeID:(id)a3
{
  objc_storeStrong((id *)&self->_mergeID, a3);
}

- (BOOL)isDonated
{
  return self->_isDonated;
}

- (void)setIsDonated:(BOOL)a3
{
  self->_isDonated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergeID, 0);
  objc_storeStrong((id *)&self->_lastSeen, 0);
  objc_storeStrong((id *)&self->_uri, 0);
}

@end
