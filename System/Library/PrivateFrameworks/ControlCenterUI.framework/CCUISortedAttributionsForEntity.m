@implementation CCUISortedAttributionsForEntity

uint64_t __CCUISortedAttributionsForEntity_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unsigned int v5;
  unsigned int v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "unsignedIntValue");
  v6 = objc_msgSend(v4, "unsignedIntValue");

  if (v5 < v6)
    return -1;
  else
    return v5 != v6;
}

@end
