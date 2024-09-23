@implementation _HMDSecureRemoteQueuedMessage

- (_HMDSecureRemoteQueuedMessage)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (_HMDSecureRemoteQueuedMessage)initWithMessage:(id)a3
{
  id v5;
  _HMDSecureRemoteQueuedMessage *v6;
  _HMDSecureRemoteQueuedMessage *v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  HMFTimer *timer;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_HMDSecureRemoteQueuedMessage;
  v6 = -[_HMDSecureRemoteQueuedMessage init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_message, a3);
    objc_msgSend(v5, "timeout");
    if (v8 <= 0.0)
    {
      v10 = *(double *)&secureSessionMessageTimeout;
    }
    else
    {
      objc_msgSend(v5, "timeout");
      v10 = v9;
    }
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 1, v10);
    timer = v7->_timer;
    v7->_timer = (HMFTimer *)v11;

  }
  return v7;
}

- (NSString)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HMDSecureRemoteQueuedMessage message](self, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)propertyDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[_HMDSecureRemoteQueuedMessage message](self, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR(", Message = %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (HMDRemoteMessage)message
{
  return self->_message;
}

- (HMFTimer)timer
{
  return self->_timer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
