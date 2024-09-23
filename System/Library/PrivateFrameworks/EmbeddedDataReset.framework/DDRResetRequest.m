@implementation DDRResetRequest

- (DDRResetRequest)initWithMode:(int64_t)a3 options:(id)a4 reason:(id)a5
{
  id v9;
  id v10;
  DDRResetRequest *v11;
  DDRResetRequest *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)DDRResetRequest;
  v11 = -[DDRResetRequest init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_mode = a3;
    objc_storeStrong((id *)&v11->_options, a4);
    objc_storeStrong((id *)&v12->_reason, a5);
  }

  return v12;
}

- (DDRResetRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  DDRResetRequest *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("options"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mode"));
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("reason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[DDRResetRequest initWithMode:options:reason:](self, "initWithMode:options:reason:", v6, v5, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *reason;
  id v5;

  reason = self->_reason;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", reason, CFSTR("reason"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_options, CFSTR("options"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_mode, CFSTR("mode"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)mode
{
  return self->_mode;
}

- (DDRResetOptions)options
{
  return self->_options;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
