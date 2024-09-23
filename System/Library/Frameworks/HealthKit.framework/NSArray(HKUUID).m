@implementation NSArray(HKUUID)

- (uint64_t)hk_enumerateUUIDsWithError:()HKUUID block:
{
  return _HKEnumerateUUIDsInCollection(a1, a3, a4);
}

- (id)hk_dataForAllUUIDs
{
  id v2;
  id v3;
  _QWORD v5[4];
  id v6;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__NSArray_HKUUID__hk_dataForAllUUIDs__block_invoke;
  v5[3] = &unk_1E37EA3F0;
  v3 = v2;
  v6 = v3;
  objc_msgSend(a1, "hk_enumerateUUIDsWithError:block:", 0, v5);

  return v3;
}

@end
