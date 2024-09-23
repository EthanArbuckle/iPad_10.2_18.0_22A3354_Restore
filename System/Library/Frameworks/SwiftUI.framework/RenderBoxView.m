@implementation RenderBoxView

+ (Class)layerClass
{
  type metadata accessor for RenderBoxLayer();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC7SwiftUI13RenderBoxView)initWithFrame:(CGRect)a3
{
  return (_TtC7SwiftUI13RenderBoxView *)RenderBoxView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7SwiftUI13RenderBoxView)initWithCoder:(id)a3
{
  return (_TtC7SwiftUI13RenderBoxView *)RenderBoxView.init(coder:)(a3);
}

- (void)dealloc
{
  _TtC7SwiftUI13RenderBoxView *v2;
  id v3;
  objc_super v4;

  v2 = self;
  v3 = -[RenderBoxView layer](v2, sel_layer);
  objc_msgSend(v3, sel_waitUntilAsyncRenderingCompleted);

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for RenderBoxView();
  -[RenderBoxView dealloc](&v4, sel_dealloc);
}

- (BOOL)isOpaque
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RenderBoxView();
  return -[RenderBoxView isOpaque](&v3, sel_isOpaque);
}

- (void)setOpaque:(BOOL)a3
{
  _BOOL8 v3;
  _TtC7SwiftUI13RenderBoxView *v4;
  id v5;
  objc_super v6;

  v3 = a3;
  v4 = self;
  v5 = -[RenderBoxView layer](v4, sel_layer);
  objc_msgSend(v5, sel_setOpaque_, v3);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for RenderBoxView();
  -[RenderBoxView setOpaque:](&v6, sel_setOpaque_, v3);

}

- (void)didMoveToWindow
{
  _TtC7SwiftUI13RenderBoxView *v2;
  _TtC7SwiftUI13RenderBoxView *v3;
  id v4;
  id v5;
  double v6;
  double v7;
  _TtC7SwiftUI13RenderBoxView *v8;
  _TtC7SwiftUI13RenderBoxView *v9;

  v9 = self;
  v2 = (_TtC7SwiftUI13RenderBoxView *)-[RenderBoxView window](v9, sel_window);
  if (v2)
  {
    v3 = v2;
    v4 = -[RenderBoxView layer](v9, sel_layer);
    v5 = -[RenderBoxView screen](v3, sel_screen);
    objc_msgSend(v5, sel_scale);
    v7 = v6;

    objc_msgSend(v4, sel_setContentsScale_, v7);
    -[RenderBoxView setNeedsDisplay](v9, sel_setNeedsDisplay);

    v8 = v3;
  }
  else
  {
    v8 = v9;
  }

}

- (void)setNeedsDisplay
{
  _TtC7SwiftUI13RenderBoxView *v2;
  id v3;

  v2 = self;
  v3 = -[RenderBoxView layer](v2, sel_layer);
  objc_msgSend(v3, sel_setNeedsDisplay);

}

- (void)RBLayer:(id)a3 draw:(id)a4
{
  void (*v6)(id);
  id v7;
  id v8;
  _TtC7SwiftUI13RenderBoxView *v9;

  v6 = *(void (**)(id))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.super.super.isa) + 0x60);
  v7 = a3;
  v8 = a4;
  v9 = self;
  v6(v8);

}

@end
