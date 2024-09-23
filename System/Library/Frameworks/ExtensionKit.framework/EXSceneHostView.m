@implementation EXSceneHostView

void __34___EXSceneHostView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "bounds");
  objc_msgSend(v3, "setFrame:");

}

@end
