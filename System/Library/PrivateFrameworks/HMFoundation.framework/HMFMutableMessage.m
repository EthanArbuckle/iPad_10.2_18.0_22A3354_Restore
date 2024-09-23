@implementation HMFMutableMessage

- (void)setHeaderValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (a4)
  {
    v6 = a4;
    v7 = a3;
    -[HMFMessage headers](self, "headers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, v6);
    -[HMFMessage internal](self, "internal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v9, "setHeaders:", v10);

  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HMFMessage internal](self, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copyWithZone:", a3);

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v6);

  v7 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithInternalMessage:", v5);
  return v7;
}

- (void)setUserInfoValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (a4)
  {
    v6 = a4;
    v7 = a3;
    -[HMFMessage userInfo](self, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, v6);
    -[HMFMessage internal](self, "internal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v9, "setUserInfo:", v10);

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  HMFMessage *v6;

  -[HMFMessage internal](self, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copyWithZone:", a3);

  v6 = -[HMFMessage initWithInternalMessage:](+[HMFMessage allocWithZone:](HMFMessage, "allocWithZone:", a3), "initWithInternalMessage:", v5);
  return v6;
}

- (void)setTransport:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMFMessage internal](self, "internal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTransport:", v4);

}

- (void)setQualityOfService:(int64_t)a3
{
  id v4;

  -[HMFMessage internal](self, "internal");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQualityOfService:", a3);

}

- (void)setActivity:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMFMessage internal](self, "internal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActivity:", v4);

}

- (void)setName:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[HMFMessage internal](self, "internal");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setName:", v4);

  }
}

- (void)setTimeout:(double)a3
{
  if (a3 >= 0.0)
    -[HMFMessageInternal setTimeout:](self->super._internal, "setTimeout:");
}

- (void)setUserInfo:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = (void *)MEMORY[0x1A1AC355C]();
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier(0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138543618;
        v10 = v7;
        v11 = 2112;
        v12 = v4;
        _os_log_impl(&dword_19B546000, v6, OS_LOG_TYPE_FAULT, "%{public}@Invalid userInfo class provided, %@, for message, see <rdar://problem/37677418>", (uint8_t *)&v9, 0x16u);

      }
      objc_autoreleasePoolPop(v5);
    }
  }
  -[HMFMessage internal](self, "internal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUserInfo:", v4);

}

- (void)setHeaders:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMFMessage internal](self, "internal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHeaders:", v4);

}

- (void)setUntrustedClientIdentifier:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[HMFMutableMessage setHeaderValue:forKey:](self, "setHeaderValue:forKey:", v4, CFSTR("HMF.untrustedClientIdentifier"));

}

@end
