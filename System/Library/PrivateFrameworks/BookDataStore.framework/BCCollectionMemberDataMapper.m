@implementation BCCollectionMemberDataMapper

- (id)cloudDataFromRecord:(id)a3
{
  id v3;
  BCMutableCollectionMember *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = [BCMutableCollectionMember alloc];
  v8 = (void *)objc_msgSend_initWithRecord_(v4, v5, (uint64_t)v3, v6, v7);

  return v8;
}

- (id)recordFromCloudData:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_configuredRecordFromAttributes(a3, a2, (uint64_t)a3, v3, v4);
}

@end
