@implementation IMServiceReachabilityHandleResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IMServiceReachabilityHandleResult)initWithHandleID:(id)a3 service:(id)a4 isReachable:(BOOL)a5
{
  id v9;
  id v10;
  IMServiceReachabilityHandleResult *v11;
  IMServiceReachabilityHandleResult *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMServiceReachabilityHandleResult;
  v11 = -[IMServiceReachabilityHandleResult init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_handleID, a3);
    objc_storeStrong((id *)&v12->_service, a4);
    v12->_reachable = a5;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *handleID;
  id v5;

  handleID = self->_handleID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", handleID, CFSTR("i"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_service, CFSTR("s"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_reachable, CFSTR("r"));

}

- (IMServiceReachabilityHandleResult)initWithCoder:(id)a3
{
  id v4;
  IMServiceReachabilityHandleResult *v5;
  uint64_t v6;
  NSString *handleID;
  uint64_t v8;
  NSString *service;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IMServiceReachabilityHandleResult;
  v5 = -[IMServiceReachabilityHandleResult init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("i"));
    v6 = objc_claimAutoreleasedReturnValue();
    handleID = v5->_handleID;
    v5->_handleID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("s"));
    v8 = objc_claimAutoreleasedReturnValue();
    service = v5->_service;
    v5->_service = (NSString *)v8;

    v5->_reachable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("r"));
  }

  return v5;
}

- (id)createDictionary
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("r");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMServiceReachabilityHandleResult isReachable](self, "isReachable"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "isReachable");
    if (v6 == -[IMServiceReachabilityHandleResult isReachable](self, "isReachable"))
    {
      objc_msgSend(v5, "service");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMServiceReachabilityHandleResult service](self, "service");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        objc_msgSend(v5, "handleID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMServiceReachabilityHandleResult handleID](self, "handleID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v10, "isEqualToString:", v11);

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[IMServiceReachabilityHandleResult handleID](self, "handleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMServiceReachabilityHandleResult service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IMServiceReachabilityHandleResult isReachable](self, "isReachable");
  v8 = CFSTR("NO");
  if (v7)
    v8 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p [ID: %@ service: %@ isReachable: %@]>"), v4, self, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)handleID
{
  return self->_handleID;
}

- (void)setHandleID:(id)a3
{
  objc_storeStrong((id *)&self->_handleID, a3);
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (BOOL)isReachable
{
  return self->_reachable;
}

- (void)setReachable:(BOOL)a3
{
  self->_reachable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_handleID, 0);
}

@end
