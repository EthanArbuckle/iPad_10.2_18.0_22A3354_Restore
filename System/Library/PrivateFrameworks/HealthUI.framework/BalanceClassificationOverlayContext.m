@implementation BalanceClassificationOverlayContext

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8HealthUI35BalanceClassificationOverlayContext_selectedClassification;
  v4 = sub_1D7B49588();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8HealthUI35BalanceClassificationOverlayContext_dataSourceDelegate));
}

@end
