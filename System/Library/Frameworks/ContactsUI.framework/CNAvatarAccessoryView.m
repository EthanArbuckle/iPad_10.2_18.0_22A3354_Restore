@implementation CNAvatarAccessoryView

+ (id)mediaContextBadgeWithImageData:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0D13D20];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithImageData:", v4);

  return v5;
}

+ (id)badgeWithSystemImageNamed:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0D13D38];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithSystemImageNamed:", v4);

  return v5;
}

@end
