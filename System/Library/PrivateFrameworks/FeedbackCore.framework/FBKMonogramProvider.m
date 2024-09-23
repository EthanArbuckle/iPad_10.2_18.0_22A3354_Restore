@implementation FBKMonogramProvider

+ (id)imageWithUser:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v6;
  void *v7;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  v7 = (void *)_s12FeedbackCore19FBKMonogramProviderC5image4user4sizeSo7UIImageCSo7FBKUserC_So6CGSizeVtFZ_0(v6, width, height);

  return v7;
}

- (_TtC12FeedbackCore19FBKMonogramProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FBKMonogramProvider();
  return -[FBKMonogramProvider init](&v3, sel_init);
}

@end
