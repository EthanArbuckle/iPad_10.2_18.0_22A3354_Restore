@implementation DYExperimentOverrideEnable

- (DYExperimentOverrideEnable)initWithName:(id)a3
{
  return -[DYExperimentOverrideEnable initWithName:captureArchivePath:overrides:](self, "initWithName:captureArchivePath:overrides:", a3, 0, 0);
}

- (DYExperimentOverrideEnable)initWithName:(id)a3 captureArchivePath:(id)a4 overrides:(id)a5
{
  DYExperimentOverrideEnable *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DYExperimentOverrideEnable;
  v7 = -[DYExperiment initWithName:results:](&v9, sel_initWithName_results_, a3, 0);
  if (v7)
  {
    v7->_overrideTypeStrings = (NSSet *)a5;
    v7->_properties = (NSMutableDictionary *)objc_opt_new();
    v7->super._captureArchivePath = (NSString *)a4;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYExperimentOverrideEnable)initWithCoder:(id)a3
{
  DYExperimentOverrideEnable *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)DYExperimentOverrideEnable;
  v4 = -[DYExperiment initWithCoder:](&v15, sel_initWithCoder_);
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDBCF20];
    v6 = objc_opt_class();
    v4->_overrideTypeStrings = (NSSet *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("overrideTypeStrings"));
    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v4->_properties = (NSMutableDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0), CFSTR("properties"));
    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v4->_perFunctionProfilingData = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0), CFSTR("perFunctionProfilingData"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DYExperimentOverrideEnable;
  -[DYExperiment encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_overrideTypeStrings, CFSTR("overrideTypeStrings"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_properties, CFSTR("properties"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_perFunctionProfilingData, CFSTR("perFunctionProfilingData"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DYExperimentOverrideEnable;
  v4 = -[DYExperiment copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[14] = -[NSMutableDictionary mutableCopy](self->_properties, "mutableCopy");
  v4[15] = -[NSSet copy](self->_overrideTypeStrings, "copy");
  v4[16] = -[NSArray copy](self->_perFunctionProfilingData, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYExperimentOverrideEnable;
  -[DYExperiment dealloc](&v3, sel_dealloc);
}

- (BOOL)isPresentFrameEnabled
{
  return !-[NSSet containsObject:](self->_overrideTypeStrings, "containsObject:", CFSTR("DYFunctionPlayerOverrideDisablePresent"));
}

- (NSMutableDictionary)properties
{
  return self->_properties;
}

- (NSSet)overrideTypeStrings
{
  return self->_overrideTypeStrings;
}

@end
