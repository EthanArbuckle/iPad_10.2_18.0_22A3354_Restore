@implementation ECFlagChangeMessageActionResults

- (ECFlagChangeMessageActionResults)initWithBuilder:(id)a3
{
  void (**v4)(id, ECFlagChangeMessageActionResultsBuilder *);
  ECFlagChangeMessageActionResults *v5;
  ECFlagChangeMessageActionResultsBuilder *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = (void (**)(id, ECFlagChangeMessageActionResultsBuilder *))a3;
  v11.receiver = self;
  v11.super_class = (Class)ECFlagChangeMessageActionResults;
  v5 = -[ECFlagChangeMessageActionResults init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(ECFlagChangeMessageActionResultsBuilder);
    v4[2](v4, v6);
    -[ECFlagChangeMessageActionResultsBuilder completedUIDs](v6, "completedUIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    v9 = v8;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v5->_completedUIDs, v9);
    if (!v8)

  }
  return v5;
}

- (NSIndexSet)completedUIDs
{
  return self->_completedUIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedUIDs, 0);
}

@end
