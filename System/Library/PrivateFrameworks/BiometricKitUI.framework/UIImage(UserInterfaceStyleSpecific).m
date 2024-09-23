@implementation UIImage(UserInterfaceStyleSpecific)

+ (id)userInterfaceStyleSpecificImageInBundle:()UserInterfaceStyleSpecific
{
  id v4;
  void *v5;
  int v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  v4 = a3;
  +[BKUIDevice sharedInstance](BKUIDevice, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isIdiomPad");

  if (v6)
    v7 = CFSTR("ipad");
  else
    v7 = CFSTR("iphone");
  objc_msgSend(MEMORY[0x1E0CEAB40], "_currentTraitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceStyle");

  if (v9 == 2)
    v10 = CFSTR("-dark");
  else
    v10 = CFSTR("-light");
  -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageNamed:inBundle:", v11, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
