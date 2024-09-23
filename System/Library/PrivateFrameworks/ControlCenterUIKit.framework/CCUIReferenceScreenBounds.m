@implementation CCUIReferenceScreenBounds

void __CCUIReferenceScreenBounds_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_referenceBounds");
  CCUIReferenceScreenBounds___referenceScreenBounds_0 = v0;
  CCUIReferenceScreenBounds___referenceScreenBounds_1 = v1;
  CCUIReferenceScreenBounds___referenceScreenBounds_2 = v2;
  CCUIReferenceScreenBounds___referenceScreenBounds_3 = v3;

}

@end
