@implementation NSObject

void __83__NSObject_SCN_DisplayLinkExtensions__SCN_setupDisplayLinkWithQueue_screen_policy___block_invoke(uint64_t a1, double a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "SCN_displayLinkCallback:", a2);
    WeakRetained = v4;
  }

}

@end
