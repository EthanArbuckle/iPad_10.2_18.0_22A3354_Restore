@implementation _SFAnalysisOptions

- (_SFAnalysisOptions)initWithPriority:(int64_t)a3 aneContext:(id)a4 cpuContext:(id)a5 gpuContext:(id)a6 keepANEModelLoaded:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  _SFAnalysisOptions *v15;
  _SFAnalysisOptions *v16;
  uint64_t v17;
  NSString *aneContext;
  uint64_t v19;
  NSString *cpuContext;
  uint64_t v21;
  NSString *gpuContext;
  objc_super v24;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)_SFAnalysisOptions;
  v15 = -[_SFAnalysisOptions init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_priority = a3;
    v17 = objc_msgSend(v12, "copy");
    aneContext = v16->_aneContext;
    v16->_aneContext = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    cpuContext = v16->_cpuContext;
    v16->_cpuContext = (NSString *)v19;

    v21 = objc_msgSend(v14, "copy");
    gpuContext = v16->_gpuContext;
    v16->_gpuContext = (NSString *)v21;

    v16->_keepANEModelLoaded = a7;
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t priority;
  id v5;

  priority = self->_priority;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", priority, CFSTR("_priority"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_aneContext, CFSTR("_aneContext"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cpuContext, CFSTR("_cpuContext"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_gpuContext, CFSTR("_gpuContext"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_keepANEModelLoaded, CFSTR("_keepANEModelLoaded"));

}

- (_SFAnalysisOptions)initWithCoder:(id)a3
{
  id v4;
  _SFAnalysisOptions *v5;
  uint64_t v6;
  NSString *aneContext;
  uint64_t v8;
  NSString *cpuContext;
  uint64_t v10;
  NSString *gpuContext;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SFAnalysisOptions;
  v5 = -[_SFAnalysisOptions init](&v13, sel_init);
  if (v5)
  {
    v5->_priority = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_priority"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_aneContext"));
    v6 = objc_claimAutoreleasedReturnValue();
    aneContext = v5->_aneContext;
    v5->_aneContext = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_cpuContext"));
    v8 = objc_claimAutoreleasedReturnValue();
    cpuContext = v5->_cpuContext;
    v5->_cpuContext = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_gpuContext"));
    v10 = objc_claimAutoreleasedReturnValue();
    gpuContext = v5->_gpuContext;
    v5->_gpuContext = (NSString *)v10;

    v5->_keepANEModelLoaded = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_keepANEModelLoaded"));
  }

  return v5;
}

- (int64_t)priority
{
  return self->_priority;
}

- (NSString)aneContext
{
  return self->_aneContext;
}

- (NSString)cpuContext
{
  return self->_cpuContext;
}

- (NSString)gpuContext
{
  return self->_gpuContext;
}

- (BOOL)keepANEModelLoaded
{
  return self->_keepANEModelLoaded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gpuContext, 0);
  objc_storeStrong((id *)&self->_cpuContext, 0);
  objc_storeStrong((id *)&self->_aneContext, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
