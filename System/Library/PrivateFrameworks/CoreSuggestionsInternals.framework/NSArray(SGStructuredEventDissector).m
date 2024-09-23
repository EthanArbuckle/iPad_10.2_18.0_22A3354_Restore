@implementation NSArray(SGStructuredEventDissector)

- (uint64_t)sg_deepCopyWithoutEmptySchemaObjects
{
  return objc_msgSend(a1, "_pas_mappedArrayWithTransform:", &__block_literal_global_13737);
}

- (BOOL)sg_isEmptySchemaObject
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "sg_deepCopyWithoutEmptySchemaObjects");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count") == 0;

  return v2;
}

@end
