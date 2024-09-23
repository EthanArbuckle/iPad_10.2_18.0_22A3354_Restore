@implementation TTICCRVectorMultiTimestamp

- (TTICCRVectorMultiTimestamp)initWithCapacity:(unint64_t)a3
{
  void *i;
  ICTTCRVectorTimestamp *v6;
  TTICCRVectorMultiTimestamp *v7;
  objc_super v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a3; --a3)
  {
    v6 = objc_alloc_init(ICTTCRVectorTimestamp);
    objc_msgSend(i, "addObject:", v6);

  }
  v9.receiver = self;
  v9.super_class = (Class)TTICCRVectorMultiTimestamp;
  v7 = -[ICTTVectorMultiTimestamp initWithTimestamps:](&v9, sel_initWithTimestamps_, i);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TTICCRVectorMultiTimestamp *v4;
  void *v5;
  TTICCRVectorMultiTimestamp *v6;

  v4 = +[TTICCRVectorMultiTimestamp allocWithZone:](TTICCRVectorMultiTimestamp, "allocWithZone:", a3);
  -[ICTTVectorMultiTimestamp timestamps](self, "timestamps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TTICCRVectorMultiTimestamp initWithCapacity:](v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  -[ICTTVectorMultiTimestamp mergeWithTimestamp:](v6, "mergeWithTimestamp:", self);
  return v6;
}

- (BOOL)isDocumentShared
{
  return 1;
}

@end
