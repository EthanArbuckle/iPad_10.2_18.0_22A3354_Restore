@implementation LSCopyGroupContainerIdentifiersFromEntitlements

uint64_t ___LSCopyGroupContainerIdentifiersFromEntitlements_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a2);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:ofClass:", v3, objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = _CFXPCCreateXPCObjectFromCFObject();
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
