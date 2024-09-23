@implementation ICUTType

+ (id)typeWithIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CEC3F8], "exportedTypeWithIdentifier:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (UTType)noteSpotlightType
{
  return (UTType *)objc_msgSend(a1, "typeWithIdentifier:", CFSTR("com.apple.notes.spotlightrecord"));
}

@end
