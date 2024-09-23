@implementation NSBundle(MPAdditions)

+ (id)mediaPlayerBundle
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__NSBundle_MPAdditions__mediaPlayerBundle__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a2;
  v3[5] = a1;
  if (mediaPlayerBundle___once != -1)
    dispatch_once(&mediaPlayerBundle___once, v3);
  return (id)mediaPlayerBundle___mediaPlayerBundle;
}

@end
