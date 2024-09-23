@implementation FormatProgressCircleView.NonAnimatingLayerDelegate

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  _TtCC8NewsFeed24FormatProgressCircleViewP33_BE65CBDFEC505C025C8981C6A836484825NonAnimatingLayerDelegate *v8;
  id v9;

  v6 = objc_allocWithZone(MEMORY[0x1E0C99E38]);
  v7 = a3;
  v8 = self;
  v9 = objc_msgSend(v6, sel_init);

  return v9;
}

- (_TtCC8NewsFeed24FormatProgressCircleViewP33_BE65CBDFEC505C025C8981C6A836484825NonAnimatingLayerDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FormatProgressCircleView.NonAnimatingLayerDelegate();
  return -[FormatProgressCircleView.NonAnimatingLayerDelegate init](&v3, sel_init);
}

@end
