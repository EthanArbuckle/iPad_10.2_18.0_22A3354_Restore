@implementation NSObjectDescriptionObjectHandler

id __fc_NSObjectDescriptionObjectHandler_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  if (a2)
  {
    if (objc_msgSend(a2, "conformsToProtocol:", &unk_1EE658600))
      v3 = a2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
