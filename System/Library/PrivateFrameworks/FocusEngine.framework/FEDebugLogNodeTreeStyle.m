@implementation FEDebugLogNodeTreeStyle

void __40___FEDebugLogNodeTreeStyle_defaultStyle__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_FEDebugLogNodeTreeStyle styleWithNode:lastNode:intermediate:trailing:](_FEDebugLogNodeTreeStyle, "styleWithNode:lastNode:intermediate:trailing:", CFSTR(" ├ "), CFSTR(" └ "), CFSTR(" │ "), CFSTR("   "));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = v0;

}

@end
