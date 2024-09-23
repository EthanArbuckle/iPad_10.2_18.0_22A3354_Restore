@implementation HMBProcessingOptions

- (HMBProcessingOptions)initWithLabel:(id)a3
{
  id v4;
  HMBProcessingOptions *v5;
  uint64_t v6;
  NSString *label;
  HMBProcessingOptions *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMBProcessingOptions;
  v5 = -[HMBProcessingOptions init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    label = v5->_label;
    v5->_label = (NSString *)v6;

    v5->_shouldEnqueueMirrorOutput = 1;
    v5->_qualityOfService = 17;
    v8 = v5;
  }

  return v5;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBProcessingOptions label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Label"), v5);
  objc_msgSend(v3, "addObject:", v6);

  if (!-[HMBProcessingOptions shouldEnqueueMirrorOutput](self, "shouldEnqueueMirrorOutput"))
  {
    v7 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMBProcessingOptions shouldEnqueueMirrorOutput](self, "shouldEnqueueMirrorOutput");
    HMFBooleanToString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Enqueue Mirror Output"), v8);
    objc_msgSend(v3, "addObject:", v9);

  }
  if (-[HMBProcessingOptions shouldRollBackIfMirrorOutputFails](self, "shouldRollBackIfMirrorOutputFails"))
  {
    v10 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMBProcessingOptions shouldRollBackIfMirrorOutputFails](self, "shouldRollBackIfMirrorOutputFails");
    HMFBooleanToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("Roll Back"), v11);
    objc_msgSend(v3, "addObject:", v12);

  }
  if (-[HMBProcessingOptions disallowsCellularAccessForMirrorOutput](self, "disallowsCellularAccessForMirrorOutput"))
  {
    v13 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMBProcessingOptions disallowsCellularAccessForMirrorOutput](self, "disallowsCellularAccessForMirrorOutput");
    HMFBooleanToString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("Disallow Cellular"), v14);
    objc_msgSend(v3, "addObject:", v15);

  }
  if (-[HMBProcessingOptions requiresModelCreation](self, "requiresModelCreation"))
  {
    v16 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMBProcessingOptions requiresModelCreation](self, "requiresModelCreation");
    HMFBooleanToString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithName:value:", CFSTR("Require Model Creation"), v17);
    objc_msgSend(v3, "addObject:", v18);

  }
  if (-[HMBProcessingOptions disallowsModelCreation](self, "disallowsModelCreation"))
  {
    v19 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMBProcessingOptions disallowsModelCreation](self, "disallowsModelCreation");
    HMFBooleanToString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithName:value:", CFSTR("Disallow Model Creation"), v20);
    objc_msgSend(v3, "addObject:", v21);

  }
  v22 = (void *)objc_msgSend(v3, "copy");

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  int64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  _BOOL4 v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMBProcessingOptions label](self, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8)
      && (v9 = -[HMBProcessingOptions shouldEnqueueMirrorOutput](self, "shouldEnqueueMirrorOutput"),
          v9 == objc_msgSend(v6, "shouldEnqueueMirrorOutput"))
      && (v10 = -[HMBProcessingOptions qualityOfService](self, "qualityOfService"),
          v10 == objc_msgSend(v6, "qualityOfService"))
      && (v11 = -[HMBProcessingOptions shouldRollBackIfMirrorOutputFails](self, "shouldRollBackIfMirrorOutputFails"),
          v11 == objc_msgSend(v6, "shouldRollBackIfMirrorOutputFails"))
      && (v12 = -[HMBProcessingOptions disallowsCellularAccessForMirrorOutput](self, "disallowsCellularAccessForMirrorOutput"), v12 == objc_msgSend(v6, "disallowsCellularAccessForMirrorOutput"))&& (v13 = -[HMBProcessingOptions requiresModelCreation](self, "requiresModelCreation"), v13 == objc_msgSend(v6, "requiresModelCreation")))
    {
      v16 = -[HMBProcessingOptions disallowsModelCreation](self, "disallowsModelCreation");
      v14 = v16 ^ objc_msgSend(v6, "disallowsModelCreation") ^ 1;
    }
    else
    {
      LOBYTE(v14) = 0;
    }

  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMBProcessingOptions label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (HMBProcessingOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMBProcessingOptions *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMBPBO.label"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMBProcessingOptions initWithLabel:](self, "initWithLabel:", v5);
  -[HMBProcessingOptions setShouldEnqueueMirrorOutput:](v6, "setShouldEnqueueMirrorOutput:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMBPBO.enqueue")));
  -[HMBProcessingOptions setQualityOfService:](v6, "setQualityOfService:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMBPBO.qos")));
  -[HMBProcessingOptions setShouldRollBackIfMirrorOutputFails:](v6, "setShouldRollBackIfMirrorOutputFails:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMBPBO.r")));
  -[HMBProcessingOptions setDisallowsCellularAccessForMirrorOutput:](v6, "setDisallowsCellularAccessForMirrorOutput:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMBPBO.dca")));
  -[HMBProcessingOptions setRequiresModelCreation:](v6, "setRequiresModelCreation:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMBPBO.rmc")));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMBPBO.dmc"));

  -[HMBProcessingOptions setDisallowsModelCreation:](v6, "setDisallowsModelCreation:", v7);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[HMBProcessingOptions label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("HMBPBO.label"));

  objc_msgSend(v5, "encodeBool:forKey:", -[HMBProcessingOptions shouldEnqueueMirrorOutput](self, "shouldEnqueueMirrorOutput"), CFSTR("HMBPBO.enqueue"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[HMBProcessingOptions qualityOfService](self, "qualityOfService"), CFSTR("HMBPBO.qos"));
  objc_msgSend(v5, "encodeBool:forKey:", -[HMBProcessingOptions shouldRollBackIfMirrorOutputFails](self, "shouldRollBackIfMirrorOutputFails"), CFSTR("HMBPBO.r"));
  objc_msgSend(v5, "encodeBool:forKey:", -[HMBProcessingOptions disallowsCellularAccessForMirrorOutput](self, "disallowsCellularAccessForMirrorOutput"), CFSTR("HMBPBO.dca"));
  objc_msgSend(v5, "encodeBool:forKey:", -[HMBProcessingOptions requiresModelCreation](self, "requiresModelCreation"), CFSTR("HMBPBO.rmc"));
  objc_msgSend(v5, "encodeBool:forKey:", -[HMBProcessingOptions disallowsModelCreation](self, "disallowsModelCreation"), CFSTR("HMBPBO.dmc"));

}

- (NSString)label
{
  return self->_label;
}

- (BOOL)shouldEnqueueMirrorOutput
{
  return self->_shouldEnqueueMirrorOutput;
}

- (void)setShouldEnqueueMirrorOutput:(BOOL)a3
{
  self->_shouldEnqueueMirrorOutput = a3;
}

- (BOOL)shouldRollBackIfMirrorOutputFails
{
  return self->_shouldRollBackIfMirrorOutputFails;
}

- (void)setShouldRollBackIfMirrorOutputFails:(BOOL)a3
{
  self->_shouldRollBackIfMirrorOutputFails = a3;
}

- (BOOL)disallowsCellularAccessForMirrorOutput
{
  return self->_disallowsCellularAccessForMirrorOutput;
}

- (void)setDisallowsCellularAccessForMirrorOutput:(BOOL)a3
{
  self->_disallowsCellularAccessForMirrorOutput = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (HMFActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (unint64_t)transactionItemsBatchLimit
{
  return self->_transactionItemsBatchLimit;
}

- (void)setTransactionItemsBatchLimit:(unint64_t)a3
{
  self->_transactionItemsBatchLimit = a3;
}

- (BOOL)requiresModelCreation
{
  return self->_requiresModelCreation;
}

- (void)setRequiresModelCreation:(BOOL)a3
{
  self->_requiresModelCreation = a3;
}

- (BOOL)disallowsModelCreation
{
  return self->_disallowsModelCreation;
}

- (void)setDisallowsModelCreation:(BOOL)a3
{
  self->_disallowsModelCreation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

+ (id)optionsWithLabel:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLabel:", v4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
