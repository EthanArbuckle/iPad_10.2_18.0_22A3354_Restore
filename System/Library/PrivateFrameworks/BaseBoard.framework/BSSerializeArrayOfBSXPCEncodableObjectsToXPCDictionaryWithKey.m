@implementation BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey

xpc_object_t __BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey_block_invoke(uint64_t a1, void *a2)
{
  return BSCreateSerializedBSXPCEncodableObject(a2);
}

@end
