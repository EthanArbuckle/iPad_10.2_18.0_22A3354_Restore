@implementation PKPassKitSwiftUIObjcBridge

+ (CGImage)buttonImageForSize:(CGSize)a3 scale:(double)a4 type:(int64_t)a5 style:(int64_t)a6
{
  return (CGImage *)PKCreateApplePayButtonImage();
}

+ (id)accessibilityTitleForType:(int64_t)a3
{
  return (id)PKApplePayButtonAccessibilityTitleForType();
}

+ (BOOL)didAddPasses:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "succeeded");
  else
    v4 = 0;

  return v4;
}

+ (BOOL)passbookHasBeenDeleted
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE6EC08], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "passbookHasBeenDeleted");

  return v3;
}

+ (id)localizedDeletableWalletStringFor:(id)a3
{
  return (id)PKLocalizedDeletableString((NSString *)a3);
}

@end
