@implementation ARFaceAnchor(NormalizedFaceRect)

- (CGFloat)normalizedFaceRect
{
  CGSize v1;
  void *v2;
  void *v3;
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  CGRect v7;

  v1 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  v7.origin = (CGPoint)*MEMORY[0x24BDBF090];
  v7.size = v1;
  objc_msgSend(a1, "trackingData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BE059D0]);
    v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      CGRectMakeWithDictionaryRepresentation(v4, &v7);

  }
  return v7.origin.x;
}

@end
