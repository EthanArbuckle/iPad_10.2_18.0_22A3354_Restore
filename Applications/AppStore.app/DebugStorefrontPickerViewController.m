@implementation DebugStorefrontPickerViewController

- (_TtC8AppStore35DebugStorefrontPickerViewController)initWithCoder:(id)a3
{
  _TtC8AppStore35DebugStorefrontPickerViewController *result;

  result = (_TtC8AppStore35DebugStorefrontPickerViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/DebugStorefrontPickerViewController.swift", 50, 2, 39, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC8AppStore35DebugStorefrontPickerViewController *v2;

  v2 = self;
  sub_1002954EC();

}

- (void)viewDidLayoutSubviews
{
  _TtC8AppStore35DebugStorefrontPickerViewController *v2;

  v2 = self;
  sub_100295AA8();

}

- (void)setStorefront
{
  _TtC8AppStore35DebugStorefrontPickerViewController *v2;

  v2 = self;
  dispatch thunk of StorefrontPickerPagePresenter.updateStorefront()();

}

- (void)setStorefrontToUS
{
  void *v2;
  _TtC8AppStore35DebugStorefrontPickerViewController *v3;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore35DebugStorefrontPickerViewController_countryPicker);
  v3 = self;
  objc_msgSend(v2, "selectRow:inComponent:animated:", 157, 0, 1);
  dispatch thunk of StorefrontPickerPagePresenter.didSelectCountry(at:)(157);
  objc_msgSend(*(id *)((char *)&v3->super.super.super.isa+ OBJC_IVAR____TtC8AppStore35DebugStorefrontPickerViewController_languagePicker), "selectRow:inComponent:animated:", 0, 0, 1);
  dispatch thunk of StorefrontPickerPagePresenter.didSelectLanguage(at:)(0);

}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id v5;
  _TtC8AppStore35DebugStorefrontPickerViewController *v6;
  int64_t v7;

  v5 = a3;
  v6 = self;
  v7 = sub_100296440((uint64_t)v5);

  return v7;
}

- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4
{
  id v5;
  _TtC8AppStore35DebugStorefrontPickerViewController *v6;
  id v7;
  double result;
  void *v9;
  uint64_t v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double Width;
  CGRect v19;

  v5 = a3;
  v6 = self;
  v7 = -[DebugStorefrontPickerViewController view](v6, "view");
  if (v7)
  {
    v9 = v7;
    v10 = sub_100008FE4(0, (unint64_t *)&qword_10082B220, UIView_ptr);
    *(_QWORD *)&v11 = LayoutMarginsAware<>.layoutFrame.getter(v10).n128_u64[0];
    v13 = v12;
    v15 = v14;
    v17 = v16;

    v19.origin.x = v11;
    v19.origin.y = v13;
    v19.size.width = v15;
    v19.size.height = v17;
    Width = CGRectGetWidth(v19);

    return Width;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v7;
  _TtC8AppStore35DebugStorefrontPickerViewController *v8;
  uint64_t v9;
  uint64_t v10;
  NSString v11;

  v7 = a3;
  v8 = self;
  sub_1002964E0((uint64_t)v7, a4);
  v10 = v9;

  if (v10)
  {
    v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v10);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v7;
  _TtC8AppStore35DebugStorefrontPickerViewController *v8;

  v7 = a3;
  v8 = self;
  sub_100296598((uint64_t)v7, a4);

}

- (_TtC8AppStore35DebugStorefrontPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8AppStore35DebugStorefrontPickerViewController *result;

  v4 = a4;
  result = (_TtC8AppStore35DebugStorefrontPickerViewController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.DebugStorefrontPickerViewController", 44, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore35DebugStorefrontPickerViewController_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35DebugStorefrontPickerViewController_countryPicker));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35DebugStorefrontPickerViewController_languagePicker));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35DebugStorefrontPickerViewController_submitButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35DebugStorefrontPickerViewController_backToUSButton));
}

@end
