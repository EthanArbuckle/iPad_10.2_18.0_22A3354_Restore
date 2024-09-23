@implementation _UIFontPickerUIServiceFontPickerViewController

- (void)viewDidLoad
{
  _TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController *v2;

  v2 = self;
  sub_1000217AC();

}

- (void)_pickerDidSelectFont:(id)a3
{
  void *v5;
  _TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController *v6;
  _TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController *v7;
  _TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController *v8;
  _TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController *v9;
  id v10;

  v5 = (void *)objc_opt_self(_UIFontPickerActionClientToHost);
  v6 = (_TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController *)a3;
  v7 = self;
  v10 = objc_msgSend(v5, "actionForPickerDidSelectFont:", v6);
  v8 = (_TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController *)-[_UIFontPickerUIServiceFontPickerViewController _hostedWindowScene](v7, "_hostedWindowScene");
  if (v8)
  {
    v9 = v8;
    -[_UIFontPickerUIServiceFontPickerViewController sendAction:](v8, "sendAction:", v10);

    v6 = v7;
    v7 = v9;
  }

}

- (void)_pickerDidCancel
{
  void *v3;
  _TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController *v4;
  _TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController *v5;
  _TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController *v6;
  id v7;

  v3 = (void *)objc_opt_self(_UIFontPickerActionClientToHost);
  v4 = self;
  v7 = objc_msgSend(v3, "actionForPickerDidCancel");
  v5 = (_TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController *)-[_UIFontPickerUIServiceFontPickerViewController _hostedWindowScene](v4, "_hostedWindowScene");
  if (v5)
  {
    v6 = v5;
    -[_UIFontPickerUIServiceFontPickerViewController sendAction:](v5, "sendAction:", v7);

    v4 = v6;
  }

}

- (void)applyFontPickerConfiguration:(id)a3
{
  void *v3;

  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController_contentViewController);
  if (v3)
    objc_msgSend(v3, "_setConfiguration:", a3);
}

- (void)applySelectedFontDescriptors:(id)a3 scrollToVisible:(BOOL)a4
{
  id v4;
  unint64_t v6;
  _TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController *v7;

  v4 = a3;
  if (a3)
  {
    v6 = sub_100021D74();
    v4 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v6);
  }
  v7 = self;
  sub_100021A40((uint64_t)v4);

  swift_bridgeObjectRelease(v4);
}

- (void)applyHideNavigationBar:(BOOL)a3
{
  sub_100021B60((uint64_t)self, (uint64_t)a2, a3, (SEL *)&selRef__setHideNavigationBar_);
}

- (void)applyShowsGrabber:(BOOL)a3
{
  sub_100021B60((uint64_t)self, (uint64_t)a2, a3, (SEL *)&selRef__setShowsGrabber_);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  objc_class *ObjectType;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController_contentViewController) = 0;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return -[_UIFontPickerUIServiceFontPickerViewController initWithNavigationBarClass:toolbarClass:](&v9, "initWithNavigationBarClass:toolbarClass:", a3, a4);
}

- (_TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController)initWithRootViewController:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController_contentViewController) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[_UIFontPickerUIServiceFontPickerViewController initWithRootViewController:](&v7, "initWithRootViewController:", a3);
}

- (_TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController *v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType(self);
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = v8;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController_contentViewController) = 0;
    v10 = a4;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController_contentViewController) = 0;
    v11 = a4;
  }
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = -[_UIFontPickerUIServiceFontPickerViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", a3, a4);

  return v12;
}

- (_TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController_contentViewController) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[_UIFontPickerUIServiceFontPickerViewController initWithCoder:](&v7, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController_contentViewController));
}

@end
