@implementation ControlConfigurationViewController

- (_TtC27ActionButtonConfigurationUI34ControlConfigurationViewController)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC27ActionButtonConfigurationUI34ControlConfigurationViewController *result;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_completionHandler);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_rootSheetPresentationControllerBehaviorAssertion) = 0;
  v5 = a3;

  result = (_TtC27ActionButtonConfigurationUI34ControlConfigurationViewController *)sub_235E615F8();
  __break(1u);
  return result;
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC27ActionButtonConfigurationUI34ControlConfigurationViewController *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_rootSheetPresentationControllerBehaviorAssertion);
  v5 = self;
  if (v4)
    objc_msgSend(v4, sel_invalidate);
  v6.receiver = self;
  v6.super_class = ObjectType;
  -[WFWidgetConfigurationViewController dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_235E34DD0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_completionHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_configuredAction));
  swift_unknownObjectRelease();
}

- (void)viewIsAppearing:(BOOL)a3
{
  _TtC27ActionButtonConfigurationUI34ControlConfigurationViewController *v4;

  v4 = self;
  sub_235E3A2B4(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC27ActionButtonConfigurationUI34ControlConfigurationViewController *v4;

  v4 = self;
  sub_235E3A554(a3);

}

- (void)widgetConfigurationViewController:(id)a3 didFinishWithIntent:(id)a4
{
  id v6;
  id v7;
  _TtC27ActionButtonConfigurationUI34ControlConfigurationViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_235E3A600(v6, v7);

}

- (_TtC27ActionButtonConfigurationUI34ControlConfigurationViewController)initWithOptions:(id)a3
{
  id v3;
  _TtC27ActionButtonConfigurationUI34ControlConfigurationViewController *result;

  v3 = a3;
  result = (_TtC27ActionButtonConfigurationUI34ControlConfigurationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
