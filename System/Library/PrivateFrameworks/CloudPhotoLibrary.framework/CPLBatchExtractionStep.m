@implementation CPLBatchExtractionStep

- (CPLBatchExtractionStep)initWithStorage:(id)a3 scopeIdentifier:(id)a4
{
  id v7;
  id v8;
  CPLBatchExtractionStep *v9;
  CPLBatchExtractionStep *v10;
  uint64_t v11;
  NSString *scopeIdentifier;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CPLBatchExtractionStep;
  v9 = -[CPLBatchExtractionStep init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storage, a3);
    v11 = objc_msgSend(v8, "copy");
    scopeIdentifier = v10->_scopeIdentifier;
    v10->_scopeIdentifier = (NSString *)v11;

  }
  return v10;
}

- (BOOL)extractToBatch:(id)a3 maximumCount:(unint64_t)a4 maximumResourceSize:(unint64_t)a5 error:(id *)a6
{
  if (a6)
  {
    +[CPLErrors notImplementedError](CPLErrors, "notImplementedError", a3, a4, a5);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)shouldResetFromThisStepWithIncomingChange:(id)a3
{
  return 1;
}

- (void)resetConditionallyFromNewIncomingChange:(id)a3
{
  if (-[CPLBatchExtractionStep shouldResetFromThisStepWithIncomingChange:](self, "shouldResetFromThisStepWithIncomingChange:", a3))
  {
    -[CPLBatchExtractionStep reset](self, "reset");
  }
}

- (id)shortDescription
{
  return CFSTR("none");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CPLBatchExtractionStep shortDescription](self, "shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CPLBatchExtractionStrategyStorage)storage
{
  return self->_storage;
}

- (NSString)scopeIdentifier
{
  return self->_scopeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopeIdentifier, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
