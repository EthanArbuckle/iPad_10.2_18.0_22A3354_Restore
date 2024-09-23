@implementation CSTitleElementViewAdapter

- (id)view
{
  void *v2;
  void *v3;

  -[CSTitleElementViewAdapter viewController](self, "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSTitleElementViewAdapter viewController](self, "viewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setView:", v4);

}

- (UIViewController)viewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___CSTitleElementViewAdapter_hostingController));
}

- (BOOL)animatesChanges
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___CSTitleElementViewAdapter_animatesChanges;
  swift_beginAccess();
  return *v2;
}

- (void)setAnimatesChanges:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___CSTitleElementViewAdapter_animatesChanges;
  swift_beginAccess();
  *v4 = a3;
}

- (NSString)text
{
  void (*v2)(uint64_t);
  CSTitleElementViewAdapter *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void (**)(uint64_t))(**(_QWORD **)((char *)&self->super.isa
                                                    + OBJC_IVAR___CSTitleElementViewAdapter_coordinator)
                                      + 152);
  v3 = self;
  v4 = swift_retain();
  v2(v4);

  swift_release();
  v5 = (void *)sub_1A9D443BC();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (void)setText:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CSTitleElementViewAdapter *v7;

  v4 = sub_1A9D443C8();
  v6 = v5;
  v7 = self;
  sub_1A9D3FF28(v4, v6);

}

- (UIColor)textColor
{
  uint64_t (*v2)(uint64_t);
  CSTitleElementViewAdapter *v3;
  uint64_t v4;
  void *v5;

  v2 = *(uint64_t (**)(uint64_t))(**(_QWORD **)((char *)&self->super.isa
                                                       + OBJC_IVAR___CSTitleElementViewAdapter_coordinator)
                                         + 200);
  v3 = self;
  v4 = swift_retain();
  v5 = (void *)v2(v4);

  swift_release();
  return (UIColor *)v5;
}

- (void)setTextColor:(id)a3
{
  id v4;
  CSTitleElementViewAdapter *v5;

  v4 = a3;
  v5 = self;
  sub_1A9D40424(v4);

}

- (UIFont)font
{
  uint64_t (*v2)(uint64_t);
  CSTitleElementViewAdapter *v3;
  uint64_t v4;
  void *v5;

  v2 = *(uint64_t (**)(uint64_t))(**(_QWORD **)((char *)&self->super.isa
                                                       + OBJC_IVAR___CSTitleElementViewAdapter_coordinator)
                                         + 248);
  v3 = self;
  v4 = swift_retain();
  v5 = (void *)v2(v4);

  swift_release();
  return (UIFont *)v5;
}

- (void)setFont:(id)a3
{
  id v4;
  CSTitleElementViewAdapter *v5;

  v4 = a3;
  v5 = self;
  sub_1A9D408AC(v4);

}

- (int64_t)textAlignment
{
  uint64_t (*v2)(uint64_t);
  CSTitleElementViewAdapter *v3;
  uint64_t v4;
  int64_t v5;

  v2 = *(uint64_t (**)(uint64_t))(**(_QWORD **)((char *)&self->super.isa
                                                       + OBJC_IVAR___CSTitleElementViewAdapter_coordinator)
                                         + 296);
  v3 = self;
  v4 = swift_retain();
  v5 = v2(v4);

  swift_release();
  return v5;
}

- (void)setTextAlignment:(int64_t)a3
{
  void (*v4)(int64_t);
  CSTitleElementViewAdapter *v5;

  v4 = *(void (**)(int64_t))(**(_QWORD **)((char *)&self->super.isa
                                                           + OBJC_IVAR___CSTitleElementViewAdapter_coordinator)
                                             + 304);
  v5 = self;
  swift_retain();
  v4(a3);

  swift_release();
}

- (double)minimumScaleFactor
{
  double (*v2)(uint64_t);
  CSTitleElementViewAdapter *v3;
  uint64_t v4;
  double v5;

  v2 = *(double (**)(uint64_t))(**(_QWORD **)((char *)&self->super.isa
                                                      + OBJC_IVAR___CSTitleElementViewAdapter_coordinator)
                                        + 344);
  v3 = self;
  v4 = swift_retain();
  v5 = v2(v4);

  swift_release();
  return v5;
}

- (void)setMinimumScaleFactor:(double)a3
{
  void (*v4)(uint64_t, double);
  CSTitleElementViewAdapter *v5;
  uint64_t v6;

  v4 = *(void (**)(uint64_t, double))(**(_QWORD **)((char *)&self->super.isa
                                                            + OBJC_IVAR___CSTitleElementViewAdapter_coordinator)
                                              + 352);
  v5 = self;
  v6 = swift_retain();
  v4(v6, a3);

  swift_release();
}

- (CGRect)frame
{
  uint64_t (*v2)(void);
  CSTitleElementViewAdapter *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x70);
  v3 = self;
  v4 = (void *)v2();
  v5 = objc_msgSend(v4, sel_view);

  if (v5)
  {
    objc_msgSend(v5, sel_frame);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    v6 = v11;
    v7 = v13;
    v8 = v15;
    v9 = v17;
  }
  else
  {
    __break(1u);
  }
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t (*v7)(void);
  CSTitleElementViewAdapter *v8;
  void *v9;
  id v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x70);
  v8 = self;
  v9 = (void *)v7();
  v10 = objc_msgSend(v9, sel_view);

  if (v10)
  {
    objc_msgSend(v10, sel_setFrame_, x, y, width, height);

  }
  else
  {
    __break(1u);
  }
}

- (BOOL)visible
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___CSTitleElementViewAdapter_visible;
  swift_beginAccess();
  return *v2;
}

- (void)setVisible:(BOOL)a3
{
  BOOL *v5;
  CSTitleElementViewAdapter *v6;

  v5 = (BOOL *)self + OBJC_IVAR___CSTitleElementViewAdapter_visible;
  swift_beginAccess();
  *v5 = a3;
  v6 = self;
  sub_1A9D419A4(a3);

}

- (CSTitleElementViewAdapter)initWithFrame:(CGRect)a3
{
  return (CSTitleElementViewAdapter *)_s13CoverSheetKit23TitleElementViewAdapterC5frameACSo6CGRectV_tcfc_0();
}

- (CSTitleElementViewAdapter)init
{
  CSTitleElementViewAdapter *result;

  result = (CSTitleElementViewAdapter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release();
}

@end
