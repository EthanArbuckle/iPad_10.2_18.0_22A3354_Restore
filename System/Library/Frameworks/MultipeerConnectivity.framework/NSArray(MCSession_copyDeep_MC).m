@implementation NSArray(MCSession_copyDeep_MC)

- (uint64_t)copyDeep_MC
{
  uint64_t v2;
  void **v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(a1, "count");
  v3 = (void **)((char *)v8 - ((8 * v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (v2)
  {
    v4 = 0;
    do
    {
      v3[v4] = (void *)objc_msgSend((id)objc_msgSend(a1, "objectAtIndex:", v4), "copy");
      ++v4;
    }
    while (v2 != v4);
  }
  for (i = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:count:", v3, v2); v2; --v2)
  {
    v6 = *v3++;

  }
  return i;
}

@end
