@implementation StateDescription

void ___StateDescription_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v5, "appendString:", CFSTR("|"));
  objc_msgSend(v5, "appendString:", v4);

}

@end
