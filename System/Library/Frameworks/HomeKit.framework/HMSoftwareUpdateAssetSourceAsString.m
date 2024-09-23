@implementation HMSoftwareUpdateAssetSourceAsString

BOOL __HMSoftwareUpdateAssetSourceAsString_block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_msgSend(a3, "integerValue");
  if (v5 == v6)
    *a4 = 1;
  return v5 == v6;
}

@end
