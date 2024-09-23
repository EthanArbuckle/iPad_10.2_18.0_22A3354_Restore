@implementation GKHomeScreenIconsGetVariant

uint64_t __GKHomeScreenIconsGetVariant_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scale");
  v2 = v1;

  v4 = v2;
  result = objc_msgSend(MEMORY[0x1E0DC3870], "_iconVariantForUIApplicationIconFormat:scale:", 2, &v4);
  GKHomeScreenIconsGetVariant_iconVariant = result;
  return result;
}

@end
