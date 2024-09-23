@implementation BalanceMetricOverlayContext

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC8HealthUI27BalanceMetricOverlayContext_selectedMetric;
  v3 = sub_1D7B49504();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
