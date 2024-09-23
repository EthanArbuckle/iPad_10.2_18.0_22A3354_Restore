@implementation DocumentAccessoryView

- (_TtC7SwiftUIP33_F9CBE93C642018E3EAE34C65780A39FB21DocumentAccessoryView)initWithCoder:(id)a3
{
  _TtC7SwiftUIP33_F9CBE93C642018E3EAE34C65780A39FB21DocumentAccessoryView *result;

  result = (_TtC7SwiftUIP33_F9CBE93C642018E3EAE34C65780A39FB21DocumentAccessoryView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutMarginsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[DocumentAccessoryView layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  objc_msgSend(v2, sel_setNeedsLayout, v3.receiver, v3.super_class);

}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[DocumentAccessoryView layoutSubviews](&v3, sel_layoutSubviews);
  DocumentAccessoryView.updateRootView()();

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC7SwiftUIP33_F9CBE93C642018E3EAE34C65780A39FB21DocumentAccessoryView *v9;
  char *v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = DocumentAccessoryView.hitTest(_:with:)((uint64_t)a4, x, y);

  return v10;
}

- (_TtC7SwiftUIP33_F9CBE93C642018E3EAE34C65780A39FB21DocumentAccessoryView)initWithFrame:(CGRect)a3
{
  _TtC7SwiftUIP33_F9CBE93C642018E3EAE34C65780A39FB21DocumentAccessoryView *result;

  result = (_TtC7SwiftUIP33_F9CBE93C642018E3EAE34C65780A39FB21DocumentAccessoryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUIP33_F9CBE93C642018E3EAE34C65780A39FB21DocumentAccessoryView_hostingView));
}

@end
