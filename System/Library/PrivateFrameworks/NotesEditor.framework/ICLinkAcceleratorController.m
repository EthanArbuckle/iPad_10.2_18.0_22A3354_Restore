@implementation ICLinkAcceleratorController

- (ICLinkAcceleratorController)initWithCloudConfiguration:(id)a3 mode:(int64_t)a4
{
  return (ICLinkAcceleratorController *)LinkAcceleratorController.init(cloudConfiguration:mode:)(a3, a4);
}

- (ICLinkAcceleratorControllerDelegate)delegate
{
  return (ICLinkAcceleratorControllerDelegate *)sub_1DD9366A0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICLinkAcceleratorController_delegate);
}

- (void)setDelegate:(id)a3
{
  sub_1DD936740();
}

- (ICLinkEditorDelegate)linkDelegate
{
  return (ICLinkEditorDelegate *)sub_1DD9366A0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICLinkAcceleratorController_linkDelegate);
}

- (void)setLinkDelegate:(id)a3
{
  sub_1DD936740();
}

- (BOOL)isShowing
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___ICLinkAcceleratorController_isShowing;
  swift_beginAccess();
  return *v2;
}

- (void)setIsShowing:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___ICLinkAcceleratorController_isShowing;
  swift_beginAccess();
  *v4 = a3;
}

- (void)presentLinkAcceleratorIfNecessaryWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  ICLinkAcceleratorController *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBFA130);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1DD9D2344();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1F03F7958;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1F03F7450;
  v12[5] = v11;
  v13 = self;
  sub_1DD939D00((uint64_t)v7, (uint64_t)&unk_1F03F73C0, (uint64_t)v12);
  swift_release();
}

- (void)updateAcceleratorOriginWith:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void (*v7)(double, double, double, double);
  ICLinkAcceleratorController *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = *(void (**)(double, double, double, double))((**(_QWORD **)((char *)&self->super.isa
                                                                            + OBJC_IVAR___ICLinkAcceleratorController_viewController) & *MEMORY[0x1E0DEEDD8])
                                                             + 0x110);
  v8 = self;
  v7(x, y, width, height);

}

- (void)didSelectAutocompleteItem:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  ICLinkAcceleratorController *v10;
  uint64_t v11;

  v5 = sub_1DD9D094C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a3;
  v10 = self;
  sub_1DD9D08E0();
  if ((sub_1DD9D08F8() & 1) != 0)
    sub_1DD93834C();
  else
    sub_1DD938B98();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

}

- (BOOL)handleArrowUp
{
  uint64_t (*v2)(void);
  ICLinkAcceleratorController *v3;
  char v4;

  v2 = *(uint64_t (**)(void))((**(_QWORD **)((char *)&self->super.isa
                                          + OBJC_IVAR___ICLinkAcceleratorController_viewController) & *MEMORY[0x1E0DEEDD8])
                           + 0x148);
  v3 = self;
  v4 = v2();

  return v4 & 1;
}

- (BOOL)handleArrowDown
{
  uint64_t (*v2)(void);
  ICLinkAcceleratorController *v3;
  char v4;

  v2 = *(uint64_t (**)(void))((**(_QWORD **)((char *)&self->super.isa
                                          + OBJC_IVAR___ICLinkAcceleratorController_viewController) & *MEMORY[0x1E0DEEDD8])
                           + 0x130);
  v3 = self;
  v4 = v2();

  return v4 & 1;
}

- (BOOL)handleUseCurrentSuggestion
{
  ICLinkAcceleratorController *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = LinkAcceleratorController.handleUseCurrentSuggestion()();

  return v3;
}

- (void)hideAccelerator
{
  ICLinkAcceleratorController *v2;

  v2 = self;
  LinkAcceleratorController.hideAccelerator()();

}

- (ICLinkAcceleratorController)init
{
  ICLinkAcceleratorController *result;

  result = (ICLinkAcceleratorController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  sub_1DD8FF058((uint64_t)self + OBJC_IVAR___ICLinkAcceleratorController_delegate);
  sub_1DD8FF058((uint64_t)self + OBJC_IVAR___ICLinkAcceleratorController_linkDelegate);
}

@end
