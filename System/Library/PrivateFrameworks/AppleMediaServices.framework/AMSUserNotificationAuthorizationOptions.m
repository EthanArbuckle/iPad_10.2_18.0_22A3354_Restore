@implementation AMSUserNotificationAuthorizationOptions

- (AMSUserNotificationAuthorizationOptions)init
{
  return -[AMSUserNotificationAuthorizationOptions initWithOptionsDictionary:](self, "initWithOptionsDictionary:", 0);
}

- (AMSUserNotificationAuthorizationOptions)initWithOptionsDictionary:(id)a3
{
  id v4;
  AMSUserNotificationAuthorizationOptions *v5;
  void *v6;
  void *v7;
  void *metricsOverlay;
  NSDictionary *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUserNotificationAuthorizationOptions;
  v5 = -[AMSUserNotificationAuthorizationOptions init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AMSUserNotificationAuthorizationOptionsAuthorizationOptions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AMSUserNotificationAuthorizationOptionsAuthorizationOptions"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_authorizationOptions = objc_msgSend(v7, "unsignedIntegerValue");

    }
    else
    {
      v5->_authorizationOptions = 38;
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AMSUserNotificationAuthorizationOptionsMetricsOverlay"));
    metricsOverlay = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = metricsOverlay;

      if (!v9)
      {
LABEL_10:
        objc_msgSend(v4, "ams_objectForKey:defaultValue:", CFSTR("AMSUserNotificationAuthorizationOptionsUserInitiated"), MEMORY[0x1E0C9AAA0]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_userInitiated = objc_msgSend(v10, "BOOLValue");

        goto LABEL_11;
      }
      v9 = v9;
      metricsOverlay = v5->_metricsOverlay;
      v5->_metricsOverlay = v9;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_10;
  }
LABEL_11:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSUserNotificationAuthorizationOptions optionsDictionary](self, "optionsDictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCodingKeyOptionsDictionary"));

}

- (AMSUserNotificationAuthorizationOptions)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  AMSUserNotificationAuthorizationOptions *v8;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "ams_PLISTClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v6, CFSTR("kCodingKeyOptionsDictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    self = -[AMSUserNotificationAuthorizationOptions initWithOptionsDictionary:](self, "initWithOptionsDictionary:", v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)optionsDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AMSUserNotificationAuthorizationOptions authorizationOptions](self, "authorizationOptions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v4, CFSTR("AMSUserNotificationAuthorizationOptionsAuthorizationOptions"));

  -[AMSUserNotificationAuthorizationOptions metricsOverlay](self, "metricsOverlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v5, CFSTR("AMSUserNotificationAuthorizationOptionsMetricsOverlay"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSUserNotificationAuthorizationOptions userInitiated](self, "userInitiated"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v6, CFSTR("AMSUserNotificationAuthorizationOptionsUserInitiated"));

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;

  -[AMSUserNotificationAuthorizationOptions optionsDictionary](self, "optionsDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject ams_generateDescriptionWithSubObjects:](self, "ams_generateDescriptionWithSubObjects:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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

    if (!v5)
    {
      v8 = 0;
      goto LABEL_7;
    }
    -[AMSUserNotificationAuthorizationOptions optionsDictionary](self, "optionsDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "optionsDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToDictionary:", v7);

  }
  else
  {
    v5 = 0;
    v8 = 0;
    v6 = v4;
  }

LABEL_7:
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[AMSUserNotificationAuthorizationOptions optionsDictionary](self, "optionsDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  v7 = (void *)objc_msgSend(v4, "initWithOptionsDictionary:", v6);

  return v7;
}

- (unint64_t)authorizationOptions
{
  return self->_authorizationOptions;
}

- (void)setAuthorizationOptions:(unint64_t)a3
{
  self->_authorizationOptions = a3;
}

- (NSDictionary)metricsOverlay
{
  return self->_metricsOverlay;
}

- (void)setMetricsOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_metricsOverlay, a3);
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsOverlay, 0);
}

@end
