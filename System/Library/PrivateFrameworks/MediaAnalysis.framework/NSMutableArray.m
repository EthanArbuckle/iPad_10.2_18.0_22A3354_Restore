@implementation NSMutableArray

uint64_t __49__NSMutableArray_PHAssetResource__vcp_sortBySize__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;

  v4 = a3;
  objc_msgSend(a2, "vcp_size");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "vcp_size");
  v11 = v9 * v10;
  if (v6 * v8 < v11)
    v12 = -1;
  else
    v12 = v6 * v8 > v11;

  return v12;
}

@end
