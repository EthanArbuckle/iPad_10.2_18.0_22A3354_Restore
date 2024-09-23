@implementation MultiAppFallbackGradientView

- (_TtC20ProductPageExtension28MultiAppFallbackGradientView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  uint64_t v9;
  id v10;
  _TtC20ProductPageExtension28MultiAppFallbackGradientView *v11;
  _TtC20ProductPageExtension28MultiAppFallbackGradientView *v12;
  char *v13;
  void *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = OBJC_IVAR____TtC20ProductPageExtension28MultiAppFallbackGradientView_overlayGradientView;
  v10 = objc_allocWithZone((Class)type metadata accessor for GradientView());
  v11 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v9) = (Class)objc_msgSend(v10, "init");

  v16.receiver = v11;
  v16.super_class = ObjectType;
  v12 = -[MultiCornerGradientView initWithFrame:](&v16, "initWithFrame:", x, y, width, height);
  v13 = sub_100082458();

  v14 = *(Class *)((char *)&v12->super.super.super.super.isa
                 + OBJC_IVAR____TtC20ProductPageExtension28MultiAppFallbackGradientView_overlayGradientView);
  *(Class *)((char *)&v12->super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension28MultiAppFallbackGradientView_overlayGradientView) = (Class)v13;

  return v12;
}

- (void)layoutSubviews
{
  char *v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self, a2);
  v2 = (char *)v4.receiver;
  -[MultiCornerGradientView layoutSubviews](&v4, "layoutSubviews");
  v3 = *(id *)&v2[OBJC_IVAR____TtC20ProductPageExtension28MultiAppFallbackGradientView_overlayGradientView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28MultiAppFallbackGradientView_overlayGradientView));
}

@end
