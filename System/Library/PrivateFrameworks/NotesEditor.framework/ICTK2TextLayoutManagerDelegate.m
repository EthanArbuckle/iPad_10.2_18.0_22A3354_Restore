@implementation ICTK2TextLayoutManagerDelegate

- (id)textLayoutManager:(id)a3 textLayoutFragmentForLocation:(id)a4 inTextElement:(id)a5
{
  id v5;
  ICTextLayoutFragment *v6;
  void *v7;
  ICTextLayoutFragment *v8;

  v5 = a5;
  v6 = [ICTextLayoutFragment alloc];
  objc_msgSend(v5, "elementRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ICTextLayoutFragment initWithTextElement:range:](v6, "initWithTextElement:range:", v5, v7);

  return v8;
}

@end
