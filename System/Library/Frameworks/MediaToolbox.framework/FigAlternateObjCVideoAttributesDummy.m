@implementation FigAlternateObjCVideoAttributesDummy

- (id)codecTypes
{
  return &unk_1E3028860;
}

- (id)immersiveAttributes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_alloc_init(FigAlternateObjCVideoImmersiveAttributesDummy);
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

- (id)videoLayoutAttributes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_alloc_init(FigAlternateObjCVideoLayoutAttributesDummy);
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

@end
