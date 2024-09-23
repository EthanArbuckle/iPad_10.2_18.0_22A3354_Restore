@implementation SFBrowsingAssistant

- (SFBrowsingAssistant)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  SFBrowsingAssistant *result;

  v5 = OBJC_IVAR___SFBrowsingAssistant_assistant;
  type metadata accessor for BrowsingAssistant();
  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();

  result = (SFBrowsingAssistant *)sub_18BAC18C4();
  __break(1u);
  return result;
}

- (SFBrowsingAssistant)init
{
  return (SFBrowsingAssistant *)sub_18BA4CD14();
}

- (SFBrowsingAssistantDataSource)dataSource
{
  return (SFBrowsingAssistantDataSource *)sub_18BA4CE20((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFBrowsingAssistant_dataSource);
}

- (void)setDataSource:(id)a3
{
  sub_18BA4CEC0();
}

- (SFBrowsingAssistantDelegate)delegate
{
  return (SFBrowsingAssistantDelegate *)sub_18BA4CE20((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFBrowsingAssistant_delegate);
}

- (void)setDelegate:(id)a3
{
  sub_18BA4CEC0();
}

- (double)detentHeight
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  SFBrowsingAssistant *v8;
  id v9;
  double result;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double Width;
  id v21;
  double v22;
  uint64_t v23;
  CGRect v24;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFEB588);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFBrowsingAssistant_assistant);
  v8 = self;
  v9 = objc_msgSend(v7, sel_view);
  if (v9)
  {
    v11 = v9;
    objc_msgSend(v9, sel_bounds);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    v24.origin.x = v13;
    v24.origin.y = v15;
    v24.size.width = v17;
    v24.size.height = v19;
    Width = CGRectGetWidth(v24);
    v21 = sub_18B90AF4C();
    sub_18BAC08B0();

    v22 = sub_18B90DDDC((uint64_t)v6, Width);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

    return v22;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)viewDidLoad
{
  SFBrowsingAssistant *v2;

  v2 = self;
  SFBrowsingAssistant.viewDidLoad()();

}

- (BOOL)stepperFocused
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR___SFBrowsingAssistant_assistant)
                 + OBJC_IVAR____TtC12MobileSafari17BrowsingAssistant_globalHeaderFooter);
  if (v2 && (v3 = *(void **)(v2 + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant16MainHeaderFooter_stepper)) != 0)
    return objc_msgSend(v3, sel_isFocusedInPageMenu);
  else
    return 0;
}

- (void)setStepperFocused:(BOOL)a3
{
  SFBrowsingAssistant *v4;

  v4 = self;
  sub_18B90E91C(a3);

}

- (void)readerVisibilityDidChange
{
  SFBrowsingAssistant *v2;

  v2 = self;
  SFBrowsingAssistant.readerVisibilityDidChange()();

}

- (void)reloadData
{
  void *v2;
  SFBrowsingAssistant *v3;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFBrowsingAssistant_assistant);
  v3 = self;
  if (objc_msgSend(v2, sel_isViewLoaded))
    sub_18B90EC58(0, 255, (uint64_t)CGRectMake, 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  sub_18BA4D774(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillAppear_, (SEL *)&selRef_browsingAssistantWillAppear_);
}

- (void)viewWillDisappear:(BOOL)a3
{
  sub_18BA4D774(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillDisappear_, (SEL *)&selRef_browsingAssistantWillDisappear_);
}

- (SFBrowsingAssistant)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  SFBrowsingAssistant *result;

  v4 = a4;
  result = (SFBrowsingAssistant *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_18B913BBC((uint64_t)self + OBJC_IVAR___SFBrowsingAssistant_dataSource);
  sub_18B913BBC((uint64_t)self + OBJC_IVAR___SFBrowsingAssistant_delegate);
}

@end
