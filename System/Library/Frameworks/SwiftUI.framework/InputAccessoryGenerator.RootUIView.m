@implementation InputAccessoryGenerator.RootUIView

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  CGSize result;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC7SwiftUI23InputAccessoryGeneratorP33_5C36F4A49E2E2562B910FE6399D2C51E10RootUIView_host);
  if (v2)
  {
    objc_msgSend(v2, sel_intrinsicContentSize);
  }
  else
  {
    v3 = 0.0;
    v4 = 0.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  char *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  -[InputAccessoryGenerator.RootUIView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtCC7SwiftUI23InputAccessoryGeneratorP33_5C36F4A49E2E2562B910FE6399D2C51E10RootUIView_host];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
    objc_msgSend(v4, sel_setFrame_);

    v2 = v4;
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;
  CGSize result;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC7SwiftUI23InputAccessoryGeneratorP33_5C36F4A49E2E2562B910FE6399D2C51E10RootUIView_host);
  if (v3)
  {
    objc_msgSend(v3, sel_sizeThatFits_, a3.width, a3.height);
  }
  else
  {
    v4 = 0.0;
    v5 = 0.0;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (_TtCC7SwiftUI23InputAccessoryGeneratorP33_5C36F4A49E2E2562B910FE6399D2C51E10RootUIView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC7SwiftUI23InputAccessoryGeneratorP33_5C36F4A49E2E2562B910FE6399D2C51E10RootUIView_host) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[InputAccessoryGenerator.RootUIView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtCC7SwiftUI23InputAccessoryGeneratorP33_5C36F4A49E2E2562B910FE6399D2C51E10RootUIView)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC7SwiftUI23InputAccessoryGeneratorP33_5C36F4A49E2E2562B910FE6399D2C51E10RootUIView_host) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[InputAccessoryGenerator.RootUIView initWithCoder:](&v7, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC7SwiftUI23InputAccessoryGeneratorP33_5C36F4A49E2E2562B910FE6399D2C51E10RootUIView_host));
}

@end
