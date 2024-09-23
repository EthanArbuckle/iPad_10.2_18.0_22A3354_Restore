@implementation SiriUICardSnippetViewController

- (void)emitInstrumentationEvent:(id)a3
{
  id v4;
  SiriUICardSnippetViewController *v5;

  v4 = a3;
  v5 = self;
  SiriUICardSnippetViewController.emitInstrumentationEvent(_:)(v4);

}

- (void)informHostOfBackgroundColor:(id)a3
{
  id v5;
  SiriUICardSnippetViewController *v6;
  SiriUICardSnippetViewController *v7;
  UIColor_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  SiriUICardSnippetViewController.informHostOfBackgroundColor(_:)(v8);

}

- (void)informHostOfBackgroundMaterial:(int64_t)a3
{
  SiriUICardSnippetViewController *v4;

  v4 = self;
  SiriUICardSnippetViewController.informHostOfBackgroundMaterial(_:)(a3);

}

@end
