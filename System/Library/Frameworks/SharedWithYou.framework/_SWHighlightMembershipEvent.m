@implementation _SWHighlightMembershipEvent

- (_SWHighlightMembershipEvent)initWithHighlight:(id)a3 type:(int64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SWHighlightMembershipEvent;
  return -[SWHighlightMembershipEvent initWithHighlight:trigger:](&v5, sel_initWithHighlight_trigger_, a3, a4);
}

@end
