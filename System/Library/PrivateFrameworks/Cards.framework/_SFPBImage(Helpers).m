@implementation _SFPBImage(Helpers)

+ (id)imageWithData:()Helpers
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x24BE850D0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setImageData:", v4);

  return v5;
}

@end
