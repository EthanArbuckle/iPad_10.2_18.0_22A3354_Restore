@implementation MOEventBundleProcessorResult

- (id)init:(id)a3 sourceAppBundleIds:(id)a4 removedAppBundleIds:(id)a5
{
  id v9;
  id v10;
  id v11;
  MOEventBundleProcessorResult *v12;
  id *p_isa;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MOEventBundleProcessorResult;
  v12 = -[MOEventBundleProcessorResult init](&v15, sel_init);
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_processedBundles, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *processedBundles;
  id v5;

  processedBundles = self->_processedBundles;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", processedBundles, CFSTR("coderKeyMOEventBundleProcessorResultBundles"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceAppBundleIds, CFSTR("coderKeyMOEventBundleProcessorResultSourceBundleIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_removedAppBundleIds, CFSTR("coderKeyMOEventBundleProcessorResultSourceRemovedBundleIDs"));

}

- (MOEventBundleProcessorResult)initWithCoder:(id)a3
{
  id v4;
  MOEventBundleProcessorResult *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *processedBundles;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSSet *sourceAppBundleIds;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSSet *removedAppBundleIds;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MOEventBundleProcessorResult;
  v5 = -[MOEventBundleProcessorResult init](&v22, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("coderKeyMOEventBundleProcessorResultBundles"));
    v9 = objc_claimAutoreleasedReturnValue();
    processedBundles = v5->_processedBundles;
    v5->_processedBundles = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("coderKeyMOEventBundleProcessorResultSourceBundleIDs"));
    v14 = objc_claimAutoreleasedReturnValue();
    sourceAppBundleIds = v5->_sourceAppBundleIds;
    v5->_sourceAppBundleIds = (NSSet *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("coderKeyMOEventBundleProcessorResultSourceRemovedBundleIDs"));
    v19 = objc_claimAutoreleasedReturnValue();
    removedAppBundleIds = v5->_removedAppBundleIds;
    v5->_removedAppBundleIds = (NSSet *)v19;

  }
  return v5;
}

- (NSArray)processedBundles
{
  return self->_processedBundles;
}

- (void)setProcessedBundles:(id)a3
{
  objc_storeStrong((id *)&self->_processedBundles, a3);
}

- (NSSet)sourceAppBundleIds
{
  return self->_sourceAppBundleIds;
}

- (void)setSourceAppBundleIds:(id)a3
{
  objc_storeStrong((id *)&self->_sourceAppBundleIds, a3);
}

- (NSSet)removedAppBundleIds
{
  return self->_removedAppBundleIds;
}

- (void)setRemovedAppBundleIds:(id)a3
{
  objc_storeStrong((id *)&self->_removedAppBundleIds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedAppBundleIds, 0);
  objc_storeStrong((id *)&self->_sourceAppBundleIds, 0);
  objc_storeStrong((id *)&self->_processedBundles, 0);
}

@end
