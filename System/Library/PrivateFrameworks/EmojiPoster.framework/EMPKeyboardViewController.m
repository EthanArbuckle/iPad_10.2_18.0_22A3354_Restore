@implementation EMPKeyboardViewController

+ (id)createKeyboardViewController
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3988]), "initWithServiceRole:", 0);
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 1)
    objc_msgSend(v2, "setResizable:", 1);
  return v2;
}

@end
