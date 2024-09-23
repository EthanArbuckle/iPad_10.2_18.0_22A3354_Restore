@implementation AVTSkinnerVariantPair

- (uint64_t)originalSkinner
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (void)setOriginalSkinner:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variantSkinner, 0);
  objc_storeStrong((id *)&self->_originalSkinner, 0);
}

@end
