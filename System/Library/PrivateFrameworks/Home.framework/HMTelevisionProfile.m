@implementation HMTelevisionProfile

uint64_t __60__HMTelevisionProfile_HFAdditions__hf_mediaSourceComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || !v6)
    goto LABEL_6;
  v8 = *(void **)(a1 + 32);
  if (!v8)
  {
    v11 = objc_msgSend(v5, "compare:", v7);
    goto LABEL_8;
  }
  if ((v9 = objc_msgSend(v8, "indexOfObject:", v5),
        v10 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v7),
        v9 == 0x7FFFFFFFFFFFFFFFLL)
    && v10 == 0x7FFFFFFFFFFFFFFFLL
    || (v11 = 1, v9 != 0x7FFFFFFFFFFFFFFFLL) && v9 <= v10 && (v11 = -1, v10 != 0x7FFFFFFFFFFFFFFFLL) && v9 >= v10)
  {
LABEL_6:
    v11 = 0;
  }
LABEL_8:

  return v11;
}

@end
