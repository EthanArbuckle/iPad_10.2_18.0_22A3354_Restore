@implementation NSBundle(MediaControls)

+ (id)mediaControlsBundle
{
  if (mediaControlsBundle___once != -1)
    dispatch_once(&mediaControlsBundle___once, &__block_literal_global_44);
  return (id)mediaControlsBundle___mediaControlsBundle;
}

- (uint64_t)mediaControls_localizedStringForKey:()MediaControls inTable:expectedFormat:
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:", a3, &stru_1E581FBA8, a4);
}

@end
