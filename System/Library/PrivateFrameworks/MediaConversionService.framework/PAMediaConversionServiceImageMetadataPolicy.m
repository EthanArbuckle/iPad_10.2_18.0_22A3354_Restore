@implementation PAMediaConversionServiceImageMetadataPolicy

- (BOOL)metadataNeedsProcessing:(id)a3
{
  return 0;
}

- (id)processMetadata:(id)a3
{
  return a3;
}

+ (id)standardPolicy
{
  void *v4;
  void *v6;
  void *v7;

  v4 = (void *)objc_opt_class();
  if ((objc_msgSend(v4, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PAMediaConversionServiceImageMetadataPolicy.m"), 33, CFSTR("Subclasses must override %@"), v7);

  }
  if (standardPolicy_onceToken != -1)
    dispatch_once(&standardPolicy_onceToken, &__block_literal_global_407);
  return (id)standardPolicy_standardPolicy;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __61__PAMediaConversionServiceImageMetadataPolicy_standardPolicy__block_invoke()
{
  PAMediaConversionServiceImageMetadataPolicy *v0;
  void *v1;

  v0 = objc_alloc_init(PAMediaConversionServiceImageMetadataPolicy);
  v1 = (void *)standardPolicy_standardPolicy;
  standardPolicy_standardPolicy = (uint64_t)v0;

}

@end
