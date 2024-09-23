@implementation DASessionSettings

+ (DASessionSettings)sessionSettingsWithDictionary:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:", v4);

  return (DASessionSettings *)v5;
}

- (DASessionSettings)init
{
  return -[DASessionSettings initWithDictionary:](self, "initWithDictionary:", 0);
}

- (DASessionSettings)initWithDictionary:(id)a3
{
  id v4;
  DASessionSettings *v5;
  DASessionSettings *v6;
  NSString *deviceIdentifier;
  void **p_deviceIdentifier;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DASessionSettings;
  v5 = -[DASessionSettings init](&v23, "init");
  v6 = v5;
  if (!v5)
    goto LABEL_22;
  p_deviceIdentifier = (void **)&v5->_deviceIdentifier;
  deviceIdentifier = v5->_deviceIdentifier;
  v5->_displayDeviceIdentifier = 0;
  v5->_deviceIdentifier = (NSString *)&stru_10013CDC8;

  v6->_fullscreenPromptsEnabled = 1;
  v6->_allowCellularSizeThreshold = 0x100000;
  if (!v4)
    goto LABEL_22;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("displayDeviceIdentifier")));
  if (v9)
  {
    v10 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
      v6->_displayDeviceIdentifier = objc_msgSend(v9, "BOOLValue");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceIdentifier")));
  if (!v11)
    goto LABEL_11;
  v12 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
  {
    objc_storeStrong((id *)&v6->_deviceIdentifier, v11);
    goto LABEL_12;
  }
  v13 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringValue"));
    v15 = *p_deviceIdentifier;
    *p_deviceIdentifier = (void *)v14;

  }
  else
  {
LABEL_11:
    v6->_displayDeviceIdentifier = 0;
  }
LABEL_12:
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fullscreenPromptsEnabled")));
  if (v16)
  {
    v17 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
      v6->_fullscreenPromptsEnabled = objc_msgSend(v16, "BOOLValue");
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("allowCellularSizeThreshold")));
  if (v18)
  {
    v19 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
    {
      v20 = objc_msgSend(v18, "integerValue");
      if ((uint64_t)v20 < 0)
        v21 = -1;
      else
        v21 = (uint64_t)v20;
      v6->_allowCellularSizeThreshold = v21;
    }
  }

LABEL_22:
  return v6;
}

- (id)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[4];

  v9[0] = CFSTR("displayDeviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[DASessionSettings displayDeviceIdentifier](self, "displayDeviceIdentifier")));
  v10[0] = v3;
  v9[1] = CFSTR("deviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DASessionSettings deviceIdentifier](self, "deviceIdentifier"));
  v10[1] = v4;
  v9[2] = CFSTR("fullscreenPromptsEnabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[DASessionSettings fullscreenPromptsEnabled](self, "fullscreenPromptsEnabled")));
  v10[2] = v5;
  v9[3] = CFSTR("allowCellularSizeThreshold");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[DASessionSettings allowCellularSizeThreshold](self, "allowCellularSizeThreshold")));
  v10[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 4));

  return v7;
}

+ (id)acceptableValueClasses
{
  if (qword_10016E900 != -1)
    dispatch_once(&qword_10016E900, &stru_100133940);
  return (id)qword_10016E8F8;
}

- (BOOL)isEqualToSessionSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  BOOL v10;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DASessionSettings deviceIdentifier](self, "deviceIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceIdentifier"));
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7
    && (v8 = -[DASessionSettings displayDeviceIdentifier](self, "displayDeviceIdentifier"),
        v8 == objc_msgSend(v4, "displayDeviceIdentifier"))
    && (v9 = -[DASessionSettings fullscreenPromptsEnabled](self, "fullscreenPromptsEnabled"),
        v9 == objc_msgSend(v4, "fullscreenPromptsEnabled")))
  {
    v12 = -[DASessionSettings allowCellularSizeThreshold](self, "allowCellularSizeThreshold");
    v10 = v12 == objc_msgSend(v4, "allowCellularSizeThreshold");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  DASessionSettings *v4;
  unsigned __int8 v5;
  uint64_t v6;

  v4 = (DASessionSettings *)a3;
  v5 = self == v4;
  v6 = objc_opt_class(DASessionSettings);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    v5 = -[DASessionSettings isEqualToSessionSettings:](self, "isEqualToSessionSettings:", v4);

  return v5;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[DASessionSettings displayDeviceIdentifier](self, "displayDeviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DASessionSettings deviceIdentifier](self, "deviceIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; displayDeviceIdentifier: %d; deviceIdentifier: %@; fullscreenPromptsEnabled: %d; allowCellularSizeThreshold: %lu>"),
                   v5,
                   self,
                   v6,
                   v7,
                   -[DASessionSettings fullscreenPromptsEnabled](self, "fullscreenPromptsEnabled"),
                   -[DASessionSettings allowCellularSizeThreshold](self, "allowCellularSizeThreshold")));

  return v8;
}

- (BOOL)displayDeviceIdentifier
{
  return self->_displayDeviceIdentifier;
}

- (void)setDisplayDeviceIdentifier:(BOOL)a3
{
  self->_displayDeviceIdentifier = a3;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIdentifier, a3);
}

- (BOOL)fullscreenPromptsEnabled
{
  return self->_fullscreenPromptsEnabled;
}

- (void)setFullscreenPromptsEnabled:(BOOL)a3
{
  self->_fullscreenPromptsEnabled = a3;
}

- (unint64_t)allowCellularSizeThreshold
{
  return self->_allowCellularSizeThreshold;
}

- (void)setAllowCellularSizeThreshold:(unint64_t)a3
{
  self->_allowCellularSizeThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end
