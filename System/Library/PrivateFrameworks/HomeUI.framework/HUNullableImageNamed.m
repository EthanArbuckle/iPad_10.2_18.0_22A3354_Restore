@implementation HUNullableImageNamed

id __HUNullableImageNamed_block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CEA638];
  v2 = *(_QWORD *)(a1 + 32);
  HUHomeUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageNamed:inBundle:compatibleWithTraitCollection:", v2, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
