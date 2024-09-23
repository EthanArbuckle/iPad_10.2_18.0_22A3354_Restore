@implementation DMFSetAppAnalyticsEnabledRequest

+ (id)permittedPlatforms
{
  return &unk_1E6EF4D60;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFSetAppAnalyticsEnabledRequest)initWithCoder:(id)a3
{
  id v4;
  DMFSetAppAnalyticsEnabledRequest *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DMFSetAppAnalyticsEnabledRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(&v5->super.super._handlesNotifications + 1) = objc_msgSend(v6, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMFSetAppAnalyticsEnabledRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFSetAppAnalyticsEnabledRequest enabled](self, "enabled", v6.receiver, v6.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("enabled"));

}

- (BOOL)enabled
{
  return *(&self->super.super._handlesNotifications + 1);
}

- (void)setEnabled:(BOOL)a3
{
  *(&self->super.super._handlesNotifications + 1) = a3;
}

@end
