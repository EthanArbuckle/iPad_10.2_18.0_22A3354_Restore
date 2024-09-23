@implementation UNLocationNotificationTrigger

+ (UNLocationNotificationTrigger)triggerWithRegion:(CLRegion *)region repeats:(BOOL)repeats
{
  _BOOL8 v4;
  CLRegion *v6;
  void *v7;

  v4 = repeats;
  v6 = region;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithRegion:repeats:", v6, v4);

  return (UNLocationNotificationTrigger *)v7;
}

- (id)_initWithRegion:(id)a3 repeats:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  objc_super v13;

  v4 = a4;
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UNNotificationTrigger.m"), 415, CFSTR("region must not be nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)UNLocationNotificationTrigger;
  v8 = -[UNNotificationTrigger _initWithRepeats:](&v13, sel__initWithRepeats_, v4);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    v10 = (void *)v8[2];
    v8[2] = v9;

  }
  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UNLocationNotificationTrigger;
  v3 = -[UNNotificationTrigger hash](&v7, sel_hash);
  -[UNLocationNotificationTrigger region](self, "region");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9.receiver = self,
        v9.super_class = (Class)UNLocationNotificationTrigger,
        -[UNNotificationTrigger isEqual:](&v9, sel_isEqual_, v4)))
  {
    -[UNLocationNotificationTrigger region](self, "region");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "region");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = UNEqualObjects(v5, v6);

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
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[UNNotificationTrigger repeats](self, "repeats");
  NSStringFromBOOL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNLocationNotificationTrigger region](self, "region");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; repeats: %@, region: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)willTriggerAfterDate:(id)a3 withRequestedDate:(id)a4
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UNLocationNotificationTrigger;
  v4 = a3;
  -[UNNotificationTrigger encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[UNLocationNotificationTrigger region](self, "region", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("region"));

}

- (UNLocationNotificationTrigger)initWithCoder:(id)a3
{
  id v4;
  UNLocationNotificationTrigger *v5;
  void *v6;
  uint64_t v7;
  CLRegion *region;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UNLocationNotificationTrigger;
  v5 = -[UNNotificationTrigger initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", NSClassFromString((NSString *)CFSTR("CLRegion")), CFSTR("region"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    region = v5->_region;
    v5->_region = (CLRegion *)v7;

  }
  return v5;
}

- (CLRegion)region
{
  return self->_region;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
}

@end
