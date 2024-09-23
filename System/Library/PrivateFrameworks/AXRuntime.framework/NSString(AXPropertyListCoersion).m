@implementation NSString(AXPropertyListCoersion)

- (id)_axReconstitutedRepresentationForDictionaryKeyReplacement
{
  unint64_t v2;
  void *v3;
  int v4;
  void *v5;
  id v6;

  v2 = objc_msgSend(a1, "length");
  if (v2 > objc_msgSend(CFSTR("_AXSNSNumber"), "length")
    && (objc_msgSend(a1, "substringToIndex:", objc_msgSend(CFSTR("_AXSNSNumber"), "length")),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("_AXSNSNumber")),
        v3,
        v4))
  {
    objc_msgSend(a1, "substringFromIndex:", objc_msgSend(CFSTR("_AXSNSNumber"), "length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v5, "longLongValue"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = a1;
  }
  return v6;
}

@end
