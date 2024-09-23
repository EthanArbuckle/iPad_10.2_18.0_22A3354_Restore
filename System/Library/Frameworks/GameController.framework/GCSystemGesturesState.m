@implementation GCSystemGesturesState

- (GCSystemGesturesState)init
{
  void *v3;
  void *v4;
  GCSystemGesturesState *v5;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = -[GCSystemGesturesState initWithEnabledSystemGestures:disabledSystemGestures:bundleIdentifier:](self, "initWithEnabledSystemGestures:disabledSystemGestures:bundleIdentifier:", v3, v4, CFSTR("N/A"));

  return v5;
}

- (GCSystemGesturesState)initWithEnabledSystemGestures:(id)a3 disabledSystemGestures:(id)a4 bundleIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  GCSystemGesturesState *v12;
  GCSystemGesturesState *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)GCSystemGesturesState;
  v12 = -[GCSystemGesturesState init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_disabledSystemGestureInputNames, a4);
    objc_storeStrong((id *)&v13->_enabledSystemGestureInputNames, a3);
    objc_storeStrong((id *)&v13->_bundleIdentifier, a5);
  }

  return v13;
}

- (id)description
{
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ (%@) enabled: %@ disabled: %@>"), objc_opt_class(), self->_bundleIdentifier, self->_enabledSystemGestureInputNames, self->_disabledSystemGestureInputNames);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (NSSet)disabledSystemGestureInputNames
{
  return self->_disabledSystemGestureInputNames;
}

- (void)setDisabledSystemGestureInputNames:(id)a3
{
  objc_storeStrong((id *)&self->_disabledSystemGestureInputNames, a3);
}

- (NSSet)enabledSystemGestureInputNames
{
  return self->_enabledSystemGestureInputNames;
}

- (void)setEnabledSystemGestureInputNames:(id)a3
{
  objc_storeStrong((id *)&self->_enabledSystemGestureInputNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledSystemGestureInputNames, 0);
  objc_storeStrong((id *)&self->_disabledSystemGestureInputNames, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCSystemGesturesState)initWithCoder:(id)a3
{
  id v4;
  GCSystemGesturesState *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSSet *disabledSystemGestureInputNames;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSSet *enabledSystemGestureInputNames;
  uint64_t v14;
  NSString *bundleIdentifier;

  v4 = a3;
  v5 = -[GCSystemGesturesState init](self, "init");
  if (v5)
  {
    v6 = objc_opt_class();
    +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", v6, objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("_disabledSystemGestureInputNames"));
    v8 = objc_claimAutoreleasedReturnValue();
    disabledSystemGestureInputNames = v5->_disabledSystemGestureInputNames;
    v5->_disabledSystemGestureInputNames = (NSSet *)v8;

    v10 = objc_opt_class();
    +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("_enabledSystemGestureInputNames"));
    v12 = objc_claimAutoreleasedReturnValue();
    enabledSystemGestureInputNames = v5->_enabledSystemGestureInputNames;
    v5->_enabledSystemGestureInputNames = (NSSet *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *disabledSystemGestureInputNames;
  id v5;

  disabledSystemGestureInputNames = self->_disabledSystemGestureInputNames;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", disabledSystemGestureInputNames, CFSTR("_disabledSystemGestureInputNames"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_enabledSystemGestureInputNames, CFSTR("_enabledSystemGestureInputNames"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("_bundleIdentifier"));

}

@end
