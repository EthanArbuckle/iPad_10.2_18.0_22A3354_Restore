@implementation ExportView

- (_TtC13FTMInternal_410ExportView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC13FTMInternal_410ExportView *result;

  v5 = OBJC_IVAR____TtC13FTMInternal_410ExportView_label;
  v6 = objc_allocWithZone((Class)UILabel);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  *(_QWORD *)&self->label[OBJC_IVAR____TtC13FTMInternal_410ExportView_delegate] = 0;
  swift_unknownObjectWeakInit();

  result = (_TtC13FTMInternal_410ExportView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100211390, "FTMInternal_4/ExportView.swift", 30, 2, 69, 0);
  __break(1u);
  return result;
}

- (void)didTapExportButton:(id)a3
{
  id v4;
  _TtC13FTMInternal_410ExportView *v5;

  v4 = a3;
  v5 = self;
  sub_10014C500();

}

- (_TtC13FTMInternal_410ExportView)initWithFrame:(CGRect)a3
{
  _TtC13FTMInternal_410ExportView *result;

  result = (_TtC13FTMInternal_410ExportView *)_swift_stdlib_reportUnimplementedInitializer("FTMInternal_4.ExportView", 24, "init(frame:)", 12, 0, (__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_10014C77C((uint64_t)self + OBJC_IVAR____TtC13FTMInternal_410ExportView_delegate);
  swift_bridgeObjectRelease(*(_QWORD *)&self->label[OBJC_IVAR____TtC13FTMInternal_410ExportView_labelText]);
}

@end
