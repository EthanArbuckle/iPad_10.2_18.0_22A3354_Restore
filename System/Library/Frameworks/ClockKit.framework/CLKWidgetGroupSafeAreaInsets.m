@implementation CLKWidgetGroupSafeAreaInsets

void __CLKWidgetGroupSafeAreaInsets_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  id v7;

  v2 = a2;
  +[CLKDeviceMetrics metricsWithDevice:identitySizeClass:](CLKDeviceMetrics, "metricsWithDevice:identitySizeClass:", v2, 2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scaledValue:", 6.0);
  v4 = v3;
  v5 = _CLKWidgetGroupHorizontalMargin(v2);
  v6 = _CLKWidgetGroupBottomMargin(v2);

  CLKWidgetGroupSafeAreaInsets__safeAreaInsets_0 = v4;
  CLKWidgetGroupSafeAreaInsets__safeAreaInsets_1 = v5;
  CLKWidgetGroupSafeAreaInsets__safeAreaInsets_2 = *(_QWORD *)&v6;
  CLKWidgetGroupSafeAreaInsets__safeAreaInsets_3 = v5;

}

@end
