@implementation UIWebBrowserFindOnPageHighlighterAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIWebBrowserFindOnPageHighlighter");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setSearchText:(id)a3 matchLimit:(unint64_t)a4
{
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIWebBrowserFindOnPageHighlighterAccessibility;
  v5 = a3;
  -[UIWebBrowserFindOnPageHighlighterAccessibility setSearchText:matchLimit:](&v6, sel_setSearchText_matchLimit_, v5, a4);
  UIAccessibilityPostNotification(0xBD2u, v5);

}

@end
