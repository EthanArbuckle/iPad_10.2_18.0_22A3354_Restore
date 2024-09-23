@implementation GCSMouseProfile

- (GCSMouseProfile)init
{
  id v2;

  +[NSException exceptionWithName:reason:userInfo:](&off_254DF4E20, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("abstract method"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (GCSMouseProfile)initWithBundleIdentifier:(id)a3 trackingSpeed:(double)a4 useLinearTracking:(BOOL)a5
{
  id v8;
  NSString *v9;
  NSString *bundleIdentifier;
  double v11;
  GCSMouseProfile *v12;
  objc_super v14;

  v8 = a3;
  if (objc_msgSend(v8, "length")
    && (v14.receiver = self,
        v14.super_class = (Class)GCSMouseProfile,
        (self = -[GCSMouseProfile init](&v14, sel_init)) != 0))
  {
    v9 = (NSString *)objc_msgSend(v8, "copy");
    bundleIdentifier = self->_bundleIdentifier;
    self->_bundleIdentifier = v9;

    v11 = -1.0;
    if (a4 > 0.0)
      v11 = a4;
    self->_trackingSpeed = v11;
    self->_useLinearTracking = a5;
    self = self;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[GCSMouseProfile initWithBundleIdentifier:trackingSpeed:useLinearTracking:]([GCSMouseProfile alloc], "initWithBundleIdentifier:trackingSpeed:useLinearTracking:", self->_bundleIdentifier, self->_useLinearTracking, self->_trackingSpeed);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCSMouseProfile)initWithCoder:(id)a3
{
  id v4;
  GCSMouseProfile *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  double v8;
  GCSMouseProfile *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GCSMouseProfile;
  v5 = -[GCSMouseProfile init](&v11, sel_init);
  if (v5
    && (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier")),
        v6 = objc_claimAutoreleasedReturnValue(),
        bundleIdentifier = v5->_bundleIdentifier,
        v5->_bundleIdentifier = (NSString *)v6,
        bundleIdentifier,
        v5->_bundleIdentifier))
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("trackingSpeed"));
    if (v8 <= 0.0)
      v8 = -1.0;
    v5->_trackingSpeed = v8;
    v5->_useLinearTracking = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useLinearTracking"));
    v9 = v5;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  if (self->_trackingSpeed > 0.0)
  {
    +[NSNumber numberWithDouble:](&off_254DF4058, "numberWithDouble:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("trackingSpeed"));

  }
  objc_msgSend(v5, "encodeBool:forKey:", self->_useLinearTracking, CFSTR("trackingSpeed"));

}

- (GCSMouseProfile)initWithJSONObject:(id)a3
{
  id v4;
  NSString *v5;
  NSString *bundleIdentifier;
  void *v7;
  double v8;
  void *v9;
  GCSMouseProfile *v10;
  objc_super v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_7;
  v12.receiver = self;
  v12.super_class = (Class)GCSMouseProfile;
  self = -[GCSMouseProfile init](&v12, sel_init);
  if (!self)
    goto LABEL_7;
  objc_msgSend(v4, "_gcs_stringForJSONKey:", CFSTR("_bundleIdentifier"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v5;

  if (self->_bundleIdentifier)
  {
    objc_msgSend(v4, "_gcs_numberForJSONKey:", CFSTR("_trackingSpeed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    self->_trackingSpeed = v8;

    if (self->_trackingSpeed <= 0.0)
      self->_trackingSpeed = -1.0;
    objc_msgSend(v4, "_gcs_numberForJSONKey:", CFSTR("_useLinearTracking"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_useLinearTracking = objc_msgSend(v9, "BOOLValue");

    self = self;
    v10 = self;
  }
  else
  {
LABEL_7:
    v10 = 0;
  }

  return v10;
}

- (GCSJSONObject)jsonObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_bundleIdentifier, CFSTR("_bundleIdentifier"));
  if (self->_trackingSpeed > 0.0)
  {
    +[NSNumber numberWithDouble:](&off_254DF4058, "numberWithDouble:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("_trackingSpeed"));

  }
  +[NSNumber numberWithBool:](&off_254DF4058, "numberWithBool:", self->_useLinearTracking);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("_useLinearTracking"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return (GCSJSONObject *)v6;
}

- (void)setTrackingSpeed:(double)a3
{
  if (a3 <= 0.0)
    a3 = -1.0;
  self->_trackingSpeed = a3;
}

+ (id)defaultIdentifier
{
  return CFSTR("com.apple.default");
}

+ (id)newDefaultProfile
{
  GCSMouseProfile *v2;
  void *v3;
  GCSMouseProfile *v4;

  v2 = [GCSMouseProfile alloc];
  +[GCSMouseProfile defaultIdentifier](GCSMouseProfile, "defaultIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[GCSMouseProfile initWithBundleIdentifier:trackingSpeed:useLinearTracking:](v2, "initWithBundleIdentifier:trackingSpeed:useLinearTracking:", v3, 0, -1.0);

  return v4;
}

- (double)trackingSpeed
{
  return self->_trackingSpeed;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)useLinearTracking
{
  return self->_useLinearTracking;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
