@implementation INCodableEnumAttributeRelationshipValueTransformer

BOOL __79___INCodableEnumAttributeRelationshipValueTransformer__transformedNumberValue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = objc_msgSend(a2, "index");
  return v3 == objc_msgSend(*(id *)(a1 + 32), "integerValue");
}

uint64_t __79___INCodableEnumAttributeRelationshipValueTransformer__transformedStringValue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end
