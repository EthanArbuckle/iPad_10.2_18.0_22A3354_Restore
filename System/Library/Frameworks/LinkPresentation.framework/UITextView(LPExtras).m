@implementation UITextView(LPExtras)

+ (LPInertTextView)_lp_createInertTextView
{
  return objc_alloc_init(LPInertTextView);
}

@end
