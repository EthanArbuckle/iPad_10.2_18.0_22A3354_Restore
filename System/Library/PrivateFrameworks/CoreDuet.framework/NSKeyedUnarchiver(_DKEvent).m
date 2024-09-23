@implementation NSKeyedUnarchiver(_DKEvent)

- (void)setDk_shouldSkipDecodingMetadata:()_DKEvent
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_dk_shouldSkipDecodingMetadata, v2, (void *)1);

}

- (uint64_t)dk_shouldSkipDecodingMetadata
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, sel_dk_shouldSkipDecodingMetadata);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

@end
