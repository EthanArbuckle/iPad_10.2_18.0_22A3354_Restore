@implementation NISpatialBrowsingConfiguration

+ (id)responderConfigurationWithIdentifier:(id)a3
{
  id v5;
  NISpatialBrowsingConfiguration *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NISpatialBrowsingConfiguration.mm"), 24, CFSTR("deviceIdentifier cannot be nil."));

  }
  v6 = objc_alloc_init(NISpatialBrowsingConfiguration);
  -[NISpatialBrowsingConfiguration setResponder:](v6, "setResponder:", 1);
  -[NISpatialBrowsingConfiguration setDeviceIdentifier:](v6, "setDeviceIdentifier:", v5);

  return v6;
}

- (NISpatialBrowsingConfiguration)init
{
  NISpatialBrowsingConfiguration *v2;
  NISpatialBrowsingConfiguration *v3;
  NSString *deviceIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NISpatialBrowsingConfiguration;
  v2 = -[NIConfiguration initInternal](&v6, sel_initInternal);
  v3 = v2;
  if (v2)
  {
    v2->_responder = 0;
    v2->_updatesPolicy = 1;
    deviceIdentifier = v2->_deviceIdentifier;
    v2->_deviceIdentifier = 0;

    v3->_maxNearbyObjectAge = 10.0;
  }
  return v3;
}

+ (id)new
{
  return objc_alloc_init(NISpatialBrowsingConfiguration);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NISpatialBrowsingConfiguration;
  v4 = -[NIConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setResponder:", self->_responder);
  objc_msgSend(v4, "setDeviceIdentifier:", self->_deviceIdentifier);
  objc_msgSend(v4, "setUpdatesPolicy:", self->_updatesPolicy);
  objc_msgSend(v4, "setMaxNearbyObjectAge:", self->_maxNearbyObjectAge);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NISpatialBrowsingConfiguration;
  -[NIConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_responder, CFSTR("responder"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_deviceIdentifier, CFSTR("deviceIdentifier"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_updatesPolicy, CFSTR("updatesPolicy"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("maxNearbyObjectAge"), self->_maxNearbyObjectAge);

}

- (NISpatialBrowsingConfiguration)initWithCoder:(id)a3
{
  id v4;
  NISpatialBrowsingConfiguration *v5;
  unint64_t v6;
  uint64_t v7;
  char v8;
  double v9;
  double v10;
  NSString *deviceIdentifier;
  NISpatialBrowsingConfiguration *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NISpatialBrowsingConfiguration;
  v5 = -[NIConfiguration initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5 && (v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("updatesPolicy")), v6 < 2))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("responder"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("maxNearbyObjectAge"));
    v10 = v9;
    v5->_responder = v8;
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v7;

    v5->_updatesPolicy = v6;
    v5->_maxNearbyObjectAge = v10;
    v12 = v5;
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
  NISpatialBrowsingConfiguration *v5;
  NISpatialBrowsingConfiguration *v6;
  int v7;
  int responder;
  uint64_t v9;
  int64_t updatesPolicy;
  void *v11;
  BOOL v12;
  char v13;
  void *v14;
  char v15;
  double v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (NISpatialBrowsingConfiguration *)v4;
    v6 = v5;
    if (v5 == self)
    {
      v13 = 1;
    }
    else
    {
      v7 = -[NISpatialBrowsingConfiguration isResponder](v5, "isResponder");
      responder = self->_responder;
      v9 = -[NISpatialBrowsingConfiguration updatesPolicy](v6, "updatesPolicy");
      updatesPolicy = self->_updatesPolicy;
      -[NISpatialBrowsingConfiguration deviceIdentifier](v6, "deviceIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        v12 = 0;
      else
        v12 = self->_deviceIdentifier == 0;

      -[NISpatialBrowsingConfiguration deviceIdentifier](v6, "deviceIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", self->_deviceIdentifier);

      -[NISpatialBrowsingConfiguration maxNearbyObjectAge](v6, "maxNearbyObjectAge");
      v13 = 0;
      if (responder == v7 && v9 == updatesPolicy)
      {
        if (v16 == self->_maxNearbyObjectAge)
          v13 = v12 | v15;
        else
          v13 = 0;
      }
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  _BOOL8 responder;
  int64_t updatesPolicy;
  void *v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_deviceIdentifier, "hash");
  responder = self->_responder;
  updatesPolicy = self->_updatesPolicy;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maxNearbyObjectAge);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3 ^ responder ^ updatesPolicy ^ objc_msgSend(v6, "hash");

  return v7;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NISpatialBrowsingConfiguration descriptionInternal](self, "descriptionInternal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v5, v6);

  return v7;
}

- (id)descriptionInternal
{
  const __CFString *v2;
  const __CFString *v3;

  if (self->_responder)
    v2 = CFSTR("Yes");
  else
    v2 = CFSTR("No");
  if (self->_updatesPolicy == 1)
    v3 = CFSTR("SignificantChanges");
  else
    v3 = CFSTR("Stream");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<maxNearbyObjectAge: %0.2fsec, isResponder: %@, deviceIdentifier: %@, updatesPolicy: %@>"), *(_QWORD *)&self->_maxNearbyObjectAge, v2, self->_deviceIdentifier, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)updatesPolicy
{
  return self->_updatesPolicy;
}

- (void)setUpdatesPolicy:(int64_t)a3
{
  self->_updatesPolicy = a3;
}

- (BOOL)isResponder
{
  return self->_responder;
}

- (void)setResponder:(BOOL)a3
{
  self->_responder = a3;
}

- (NSString)deviceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (double)maxNearbyObjectAge
{
  return self->_maxNearbyObjectAge;
}

- (void)setMaxNearbyObjectAge:(double)a3
{
  self->_maxNearbyObjectAge = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end
