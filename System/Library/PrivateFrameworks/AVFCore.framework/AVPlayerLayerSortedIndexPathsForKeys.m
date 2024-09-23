@implementation AVPlayerLayerSortedIndexPathsForKeys

uint64_t __AVPlayerLayerSortedIndexPathsForKeys_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v5 = objc_msgSend(a2, "length");
  v6 = objc_msgSend(a3, "length");
  v7 = objc_msgSend(a2, "length");
  v8 = v7;
  if (v5 == v6)
  {
    if (v7)
    {
      v9 = 0;
      v8 = 1;
      while (1)
      {
        v10 = objc_msgSend(a2, "indexAtPosition:", v9);
        if (v10 < objc_msgSend(a3, "indexAtPosition:", v9))
          break;
        v11 = objc_msgSend(a2, "indexAtPosition:", v9);
        if (v11 > objc_msgSend(a3, "indexAtPosition:", v9))
          return v8;
        if (objc_msgSend(a2, "length") <= (unint64_t)++v9)
          return 0;
      }
      return -1;
    }
  }
  else if (v7 < objc_msgSend(a3, "length"))
  {
    return -1;
  }
  else
  {
    return 1;
  }
  return v8;
}

@end
