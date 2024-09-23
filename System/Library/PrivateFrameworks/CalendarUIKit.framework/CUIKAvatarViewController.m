@implementation CUIKAvatarViewController

+ (id)createAvatarViewController
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C97488], "defaultSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97478]), "initWithSettings:", v2);

  return v3;
}

@end
