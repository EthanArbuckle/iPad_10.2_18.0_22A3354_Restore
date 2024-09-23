@implementation WFContactPropertyIDsFromActionProperties

void *__WFContactPropertyIDsFromActionProperties_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Phone")) & 1) != 0)
  {
    v3 = &unk_24F93AF88;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Email")) & 1) != 0)
  {
    v3 = &unk_24F93AFA0;
  }
  else if (objc_msgSend(v2, "isEqualToString:", CFSTR("URL")))
  {
    v3 = &unk_24F93AFB8;
  }
  else
  {
    v3 = &unk_24F93AFD0;
  }

  return v3;
}

@end
