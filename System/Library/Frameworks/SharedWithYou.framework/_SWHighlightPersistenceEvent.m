@implementation _SWHighlightPersistenceEvent

- (_SWHighlightPersistenceEvent)initWithHighlight:(id)a3 type:(int64_t)a4
{
  _SWHighlightPersistenceEvent *v4;
  _SWHighlightPersistenceEvent *v5;
  _SWHighlightPersistenceEvent *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SWHighlightPersistenceEvent;
  v4 = -[SWHighlightPersistenceEvent initWithHighlight:type:](&v8, sel_initWithHighlight_type_, a3, a4);
  v5 = v4;
  if (v4)
    v6 = v4;

  return v5;
}

@end
