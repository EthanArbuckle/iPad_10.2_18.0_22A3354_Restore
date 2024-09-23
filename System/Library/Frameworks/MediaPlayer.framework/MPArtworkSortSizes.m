@implementation MPArtworkSortSizes

uint64_t __MPArtworkSortSizes_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL8 v11;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(a2, "CGSizeValue");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "CGSizeValue");
  v11 = v8 != v10 || v6 != v9;
  if (v8 < v10 || v6 < v9)
    v13 = -1;
  else
    v13 = v11;

  return v13;
}

@end
