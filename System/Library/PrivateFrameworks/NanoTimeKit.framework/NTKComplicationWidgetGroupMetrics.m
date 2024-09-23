@implementation NTKComplicationWidgetGroupMetrics

+ (NTKComplicationWidgetGroupMetrics)metricsWithSafeAreaInsets:(UIEdgeInsets)a3 nestedContentMetrics:(id)a4
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id v10;
  id *v11;
  id *v12;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v10 = a4;
  v11 = (id *)objc_alloc_init((Class)a1);
  v12 = v11;
  if (v11)
  {
    *((CGFloat *)v11 + 2) = top;
    *((CGFloat *)v11 + 3) = left;
    *((CGFloat *)v11 + 4) = bottom;
    *((CGFloat *)v11 + 5) = right;
    objc_storeStrong(v11 + 1, a4);
  }

  return (NTKComplicationWidgetGroupMetrics *)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  NTKComplicationMetrics *nestedContentMetrics;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __45__NTKComplicationWidgetGroupMetrics_isEqual___block_invoke;
  v15[3] = &unk_1E6BCEA78;
  v15[4] = self;
  v7 = v4;
  v16 = v7;
  v8 = (id)objc_msgSend(v5, "appendEqualsBlocks:", v15, 0);
  nestedContentMetrics = self->_nestedContentMetrics;
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __45__NTKComplicationWidgetGroupMetrics_isEqual___block_invoke_2;
  v13[3] = &unk_1E6BD5E00;
  v14 = v7;
  v10 = v7;
  v11 = (id)objc_msgSend(v5, "appendObject:counterpart:", nestedContentMetrics, v13);
  LOBYTE(nestedContentMetrics) = objc_msgSend(v5, "isEqual");

  return (char)nestedContentMetrics;
}

uint64_t __45__NTKComplicationWidgetGroupMetrics_isEqual___block_invoke(uint64_t a1)
{
  return vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(*(_QWORD *)(a1 + 32) + 16), *(float64x2_t *)(*(_QWORD *)(a1 + 40) + 16)), (int32x4_t)vceqq_f64(*(float64x2_t *)(*(_QWORD *)(a1 + 32) + 32), *(float64x2_t *)(*(_QWORD *)(a1 + 40) + 32)))), 0xFuLL))) & 1;
}

id __45__NTKComplicationWidgetGroupMetrics_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendCGFloat:", self->_safeAreaInsets.top);
  v5 = (id)objc_msgSend(v3, "appendCGFloat:", self->_safeAreaInsets.left);
  v6 = (id)objc_msgSend(v3, "appendCGFloat:", self->_safeAreaInsets.right);
  v7 = (id)objc_msgSend(v3, "appendCGFloat:", self->_safeAreaInsets.bottom);
  v8 = (id)objc_msgSend(v3, "appendObject:", self->_nestedContentMetrics);
  v9 = objc_msgSend(v3, "hash");

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKComplicationWidgetGroupMetrics)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  NTKComplicationWidgetGroupMetrics *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeUIEdgeInsetsForKey:", CFSTR("safeAreaInsets"));
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nestedContentMetrics"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[NTKComplicationWidgetGroupMetrics metricsWithSafeAreaInsets:nestedContentMetrics:](NTKComplicationWidgetGroupMetrics, "metricsWithSafeAreaInsets:nestedContentMetrics:", v13, v6, v8, v10, v12);
  v14 = (NTKComplicationWidgetGroupMetrics *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  double top;
  double left;
  double bottom;
  double right;
  id v8;

  top = self->_safeAreaInsets.top;
  left = self->_safeAreaInsets.left;
  bottom = self->_safeAreaInsets.bottom;
  right = self->_safeAreaInsets.right;
  v8 = a3;
  objc_msgSend(v8, "encodeUIEdgeInsets:forKey:", CFSTR("safeAreaInsets"), top, left, bottom, right);
  objc_msgSend(v8, "encodeObject:forKey:", self->_nestedContentMetrics, CFSTR("nestedContentMetrics"));

}

- (UIEdgeInsets)safeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_safeAreaInsets.top;
  left = self->_safeAreaInsets.left;
  bottom = self->_safeAreaInsets.bottom;
  right = self->_safeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NTKComplicationMetrics)nestedContentMetrics
{
  return self->_nestedContentMetrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nestedContentMetrics, 0);
}

@end
