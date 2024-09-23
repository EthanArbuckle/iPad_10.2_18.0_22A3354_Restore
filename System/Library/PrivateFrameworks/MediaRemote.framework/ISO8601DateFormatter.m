@implementation ISO8601DateFormatter

void ___ISO8601DateFormatter_block_invoke()
{
  void *v0;
  id v1;

  v1 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setTimeZone:", v0);

}

@end
