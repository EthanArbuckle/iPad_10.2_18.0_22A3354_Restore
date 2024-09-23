@implementation DNDSLegacyBehaviorOverride

- (DNDSLegacyBehaviorOverride)initWithOverrideType:(unint64_t)a3 mode:(unint64_t)a4 effectiveIntervals:(id)a5
{
  id v8;
  DNDSLegacyBehaviorOverride *v9;
  DNDSLegacyBehaviorOverride *v10;
  uint64_t v11;
  NSArray *effectiveIntervals;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)DNDSLegacyBehaviorOverride;
  v9 = -[DNDSLegacyBehaviorOverride init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_overrideType = a3;
    v9->_mode = a4;
    v11 = objc_msgSend(v8, "copy");
    effectiveIntervals = v10->_effectiveIntervals;
    v10->_effectiveIntervals = (NSArray *)v11;

  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDSLegacyBehaviorOverride)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  DNDSLegacyBehaviorOverride *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("overrideType"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("overrideMode"));
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("effectiveIntervals"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[DNDSLegacyBehaviorOverride initWithOverrideType:mode:effectiveIntervals:](self, "initWithOverrideType:mode:effectiveIntervals:", v5, v6, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDSLegacyBehaviorOverride overrideType](self, "overrideType"), CFSTR("overrideType"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDSLegacyBehaviorOverride mode](self, "mode"), CFSTR("overrideMode"));
  -[DNDSLegacyBehaviorOverride effectiveIntervals](self, "effectiveIntervals");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("effectiveIntervals"));

}

- (unint64_t)overrideType
{
  return self->_overrideType;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (NSArray)effectiveIntervals
{
  return self->_effectiveIntervals;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveIntervals, 0);
}

@end
