@implementation CCUIControlHostView

- (CCUIControlHostView)initWithFrame:(CGRect)a3 instance:(id)a4
{
  return (CCUIControlHostView *)sub_1D031A75C(a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CCUIControlHostView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _sSo19CCUIControlHostViewC18ControlCenterUIKitE5coderABSgSo7NSCoderC_tcfc_0();
}

- (CHUISControlInstance)controlInstance
{
  return (CHUISControlInstance *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                         + OBJC_IVAR___CCUIControlHostView_controlInstance));
}

- (CCUIControlHostViewDelegate)delegate
{
  return (CCUIControlHostViewDelegate *)(id)MEMORY[0x1D17E090C]((char *)self+ OBJC_IVAR___CCUIControlHostView_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (int64_t)gridSizeClass
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIControlHostView_templateView), sel_gridSizeClass);
}

- (void)setGridSizeClass:(int64_t)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIControlHostView_templateView), sel_setGridSizeClass_, a3);
}

- (double)continuousCornerRadius
{
  double result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIControlHostView_templateView), sel_continuousCornerRadius);
  return result;
}

- (void)setContinuousCornerRadius:(double)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIControlHostView_templateView), sel_setContinuousCornerRadius_, a3);
}

- (CCUIModuleContentMetrics)contentMetrics
{
  return (CCUIModuleContentMetrics *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR___CCUIControlHostView_templateView), sel_contentMetrics);
}

- (void)setContentMetrics:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIControlHostView_templateView), sel_setContentMetrics_, a3);
}

- (BOOL)isResizing
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIControlHostView_templateView), sel_isResizing);
}

- (void)setResizing:(BOOL)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIControlHostView_templateView), sel_setResizing_, a3);
}

- (NSString)cameraCapturePrewarmReason
{
  void *v2;

  if (*(_QWORD *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR___CCUIControlHostView_cameraCapturePrewarmReason))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1D031D52C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (void)setCameraCapturePrewarmReason:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;

  if (a3)
  {
    v4 = sub_1D031D538();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___CCUIControlHostView_cameraCapturePrewarmReason);
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease();
}

- (void)layoutSubviews
{
  CCUIControlHostView *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIControlHostView;
  v2 = self;
  -[CCUIControlHostView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR___CCUIControlHostView_templateView);
  -[CCUIControlHostView bounds](v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);

}

- (BOOL)performPrimaryActionForControlTemplateView:(id)a3
{
  id v4;
  CCUIControlHostView *v5;
  CCUIControlHostViewDelegate *v6;
  unsigned int v7;

  v4 = a3;
  v5 = self;
  v6 = -[CCUIControlHostView delegate](v5, sel_delegate);
  if (!v6
    || (v7 = -[CCUIControlHostViewDelegate controlHostViewShouldPerformPrimaryAction:](v6, sel_controlHostViewShouldPerformPrimaryAction_, v5), swift_unknownObjectRelease(), v7))
  {
    sub_1D031B6E0();
  }

  return 0;
}

- (void)controlInstanceViewModelDidChange:(id)a3
{
  id v4;
  CCUIControlHostView *v5;

  v4 = a3;
  v5 = self;
  _sSo19CCUIControlHostViewC18ControlCenterUIKitE015controlInstanceC14ModelDidChangeyySo012CHUISControlH0CF_0();

}

- (BOOL)showsMenuAsPrimaryAction
{
  return 0;
}

- (NSString)menuDisplayName
{
  return (NSString *)(id)sub_1D031D52C();
}

- (id)contextMenuItems
{
  CCUIControlHostView *v2;
  unint64_t v3;
  void *v4;

  v2 = self;
  v3 = (unint64_t)CCUIControlHostView.contextMenuItems()();

  if (v3)
  {
    sub_1D0317E94(0, &qword_1EFC12270);
    v4 = (void *)sub_1D031D568();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (UIMenu)contextMenu
{
  CCUIControlHostView *v2;
  id v3;

  v2 = self;
  v3 = CCUIControlHostView.contextMenu.getter();

  return (UIMenu *)v3;
}

- (CCUIControlHostView)initWithFrame:(CGRect)a3
{
  CCUIControlHostView *result;

  result = (CCUIControlHostView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1D0317E4C((uint64_t)self + OBJC_IVAR___CCUIControlHostView_delegate);
  swift_bridgeObjectRelease();

}

@end
