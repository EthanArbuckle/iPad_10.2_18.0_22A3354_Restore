@implementation NTKComplicationMetrics

+ (id)metricsWithSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4 cornerRadius:(double)a5 opaque:(BOOL)a6
{
  return (id)objc_msgSend(a1, "metricsWithSize:safeAreaInsets:cornerRadius:opaque:widgetGroupMetrics:", a6, 0, a3.width, a3.height, a4.top, a4.left, a4.bottom, a4.right, a5);
}

+ (id)metricsWithSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4 cornerRadius:(double)a5 opaque:(BOOL)a6 widgetGroupMetrics:(id)a7
{
  return (id)objc_msgSend(a1, "metricsWithSize:safeAreaInsets:cornerRadius:opaque:scaleFactor:widgetGroupMetrics:", a6, a7, a3.width, a3.height, a4.top, a4.left, a4.bottom, a4.right, a5, 1.0);
}

+ (id)metricsWithSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4 cornerRadius:(double)a5 opaque:(BOOL)a6 scaleFactor:(double)a7 widgetGroupMetrics:(id)a8
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  CGFloat height;
  CGFloat width;
  id v19;
  id *v20;
  id *v21;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  height = a3.height;
  width = a3.width;
  v19 = a8;
  v20 = (id *)objc_alloc_init((Class)a1);
  v21 = v20;
  if (v20)
  {
    *((CGFloat *)v20 + 5) = width;
    *((CGFloat *)v20 + 6) = height;
    *((CGFloat *)v20 + 7) = top;
    *((CGFloat *)v20 + 8) = left;
    *((CGFloat *)v20 + 9) = bottom;
    *((CGFloat *)v20 + 10) = right;
    *((_BYTE *)v20 + 8) = a6;
    *((double *)v20 + 2) = a5;
    *((double *)v20 + 3) = a7;
    objc_storeStrong(v20 + 4, a8);
  }

  return v21;
}

+ (id)defaultMetricsForFamily:(int64_t)a3 device:(id)a4
{
  id v5;
  uint64_t v6;
  double *v7;
  __int128 v8;
  void *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  double v27;
  uint64_t v28;

  v5 = a4;
  v6 = objc_opt_new();
  v7 = (double *)MEMORY[0x1E0DC49E8];
  v8 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  *(_OWORD *)(v6 + 56) = *MEMORY[0x1E0DC49E8];
  *(_OWORD *)(v6 + 72) = v8;
  *(_BYTE *)(v6 + 8) = 0;
  *(_OWORD *)(v6 + 16) = xmmword_1B755D450;
  v9 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = 0;

  switch(a3)
  {
    case 8:
      CDCircularSmallComplicationDiameter();
      goto LABEL_5;
    case 9:
    case 10:
      CDCircularMediumComplicationDiameter();
LABEL_5:
      *(double *)(v6 + 40) = v10;
      *(double *)(v6 + 48) = v10;
      *(double *)(v6 + 16) = v10 * 0.5;
      break;
    case 11:
      CDGraphicLargeRectangularComplicationInset();
      v12 = v11;
      v13 = MEMORY[0x1BCCA6964](v5);
      v15 = v14;
      v17 = v16;
      v19 = v18;
      CDGraphicLargeRectangularComplicationSize();
      *(_QWORD *)(v6 + 40) = v20;
      *(_QWORD *)(v6 + 48) = v21;
      *(_QWORD *)(v6 + 56) = v12;
      *(_QWORD *)(v6 + 64) = v12;
      *(_QWORD *)(v6 + 72) = v12;
      *(_QWORD *)(v6 + 80) = v12;
      CDGraphicLargeRectangularComplicationCornerRadius();
      *(_QWORD *)(v6 + 16) = v22;
      v23 = MEMORY[0x1BCCA6958](v5);
      +[NTKComplicationMetrics metricsWithSize:safeAreaInsets:cornerRadius:opaque:](NTKComplicationMetrics, "metricsWithSize:safeAreaInsets:cornerRadius:opaque:", 0, v23, v23, *v7, v7[1], v7[2], v7[3], MEMORY[0x1BCCA6970](v5));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKComplicationWidgetGroupMetrics metricsWithSafeAreaInsets:nestedContentMetrics:](NTKComplicationWidgetGroupMetrics, "metricsWithSafeAreaInsets:nestedContentMetrics:", v24, v13, v15, v17, v19);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = *(void **)(v6 + 32);
      *(_QWORD *)(v6 + 32) = v25;

      break;
    case 12:
      CDCircularMediumComplicationDiameter();
      *(double *)(v6 + 40) = v27;
      *(double *)(v6 + 48) = v27;
      *(double *)(v6 + 16) = v27 * 0.5;
      CLKComplicationGraphicExtraLargeCircularScalingFactor();
      *(_QWORD *)(v6 + 24) = v28;
      break;
    default:
      *(_OWORD *)(v6 + 40) = *MEMORY[0x1E0C9D820];
      break;
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  double cornerRadius;
  id v12;
  id v13;
  _BOOL8 opaque;
  id v15;
  id v16;
  double scaleFactor;
  id v18;
  id v19;
  NTKComplicationWidgetGroupMetrics *widgetGroupMetrics;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[4];
  id v35;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __34__NTKComplicationMetrics_isEqual___block_invoke;
  v34[3] = &unk_1E6BCEA50;
  v7 = v4;
  v35 = v7;
  v8 = (id)objc_msgSend(v5, "appendCGSize:counterpart:", v34, self->_size.width, self->_size.height);
  v32[0] = v6;
  v32[1] = 3221225472;
  v32[2] = __34__NTKComplicationMetrics_isEqual___block_invoke_2;
  v32[3] = &unk_1E6BCEA78;
  v32[4] = self;
  v9 = v7;
  v33 = v9;
  v10 = (id)objc_msgSend(v5, "appendEqualsBlocks:", v32, 0);
  cornerRadius = self->_cornerRadius;
  v30[0] = v6;
  v30[1] = 3221225472;
  v30[2] = __34__NTKComplicationMetrics_isEqual___block_invoke_3;
  v30[3] = &unk_1E6BCEAA0;
  v12 = v9;
  v31 = v12;
  v13 = (id)objc_msgSend(v5, "appendCGFloat:counterpart:", v30, cornerRadius);
  opaque = self->_opaque;
  v28[0] = v6;
  v28[1] = 3221225472;
  v28[2] = __34__NTKComplicationMetrics_isEqual___block_invoke_4;
  v28[3] = &unk_1E6BCEAC8;
  v15 = v12;
  v29 = v15;
  v16 = (id)objc_msgSend(v5, "appendBool:counterpart:", opaque, v28);
  scaleFactor = self->_scaleFactor;
  v26[0] = v6;
  v26[1] = 3221225472;
  v26[2] = __34__NTKComplicationMetrics_isEqual___block_invoke_5;
  v26[3] = &unk_1E6BCEAA0;
  v18 = v15;
  v27 = v18;
  v19 = (id)objc_msgSend(v5, "appendCGFloat:counterpart:", v26, scaleFactor);
  widgetGroupMetrics = self->_widgetGroupMetrics;
  v24[0] = v6;
  v24[1] = 3221225472;
  v24[2] = __34__NTKComplicationMetrics_isEqual___block_invoke_6;
  v24[3] = &unk_1E6BCEAF0;
  v25 = v18;
  v21 = v18;
  v22 = (id)objc_msgSend(v5, "appendObject:counterpart:", widgetGroupMetrics, v24);
  LOBYTE(widgetGroupMetrics) = objc_msgSend(v5, "isEqual");

  return (char)widgetGroupMetrics;
}

double __34__NTKComplicationMetrics_isEqual___block_invoke(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 40);
}

uint64_t __34__NTKComplicationMetrics_isEqual___block_invoke_2(uint64_t a1)
{
  return vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(*(_QWORD *)(a1 + 32) + 56), *(float64x2_t *)(*(_QWORD *)(a1 + 40) + 56)), (int32x4_t)vceqq_f64(*(float64x2_t *)(*(_QWORD *)(a1 + 32) + 72), *(float64x2_t *)(*(_QWORD *)(a1 + 40) + 72)))), 0xFuLL))) & 1;
}

double __34__NTKComplicationMetrics_isEqual___block_invoke_3(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 16);
}

uint64_t __34__NTKComplicationMetrics_isEqual___block_invoke_4(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);
}

double __34__NTKComplicationMetrics_isEqual___block_invoke_5(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 24);
}

id __34__NTKComplicationMetrics_isEqual___block_invoke_6(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 32);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  unint64_t v13;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendCGSize:", self->_size.width, self->_size.height);
  v5 = (id)objc_msgSend(v3, "appendCGFloat:", self->_safeAreaInsets.top);
  v6 = (id)objc_msgSend(v3, "appendCGFloat:", self->_safeAreaInsets.left);
  v7 = (id)objc_msgSend(v3, "appendCGFloat:", self->_safeAreaInsets.right);
  v8 = (id)objc_msgSend(v3, "appendCGFloat:", self->_safeAreaInsets.bottom);
  v9 = (id)objc_msgSend(v3, "appendCGFloat:", self->_cornerRadius);
  v10 = (id)objc_msgSend(v3, "appendBool:", self->_opaque);
  v11 = (id)objc_msgSend(v3, "appendCGFloat:", self->_scaleFactor);
  v12 = (id)objc_msgSend(v3, "appendObject:", self->_widgetGroupMetrics);
  v13 = objc_msgSend(v3, "hash");

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKComplicationMetrics)initWithCoder:(id)a3
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  NTKComplicationMetrics *v21;

  v4 = a3;
  objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("size"));
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("cornerRadius"));
  v10 = v9;
  objc_msgSend(v4, "decodeUIEdgeInsetsForKey:", CFSTR("safeAreaInsets"));
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("opaque"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("widgetGroupMetrics"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  +[NTKComplicationMetrics metricsWithSize:safeAreaInsets:cornerRadius:opaque:widgetGroupMetrics:](NTKComplicationMetrics, "metricsWithSize:safeAreaInsets:cornerRadius:opaque:widgetGroupMetrics:", v19, v20, v6, v8, v12, v14, v16, v18, v10);
  v21 = (NTKComplicationMetrics *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  double width;
  double height;
  id v6;

  width = self->_size.width;
  height = self->_size.height;
  v6 = a3;
  objc_msgSend(v6, "encodeCGSize:forKey:", CFSTR("size"), width, height);
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("cornerRadius"), self->_cornerRadius);
  objc_msgSend(v6, "encodeUIEdgeInsets:forKey:", CFSTR("safeAreaInsets"), self->_safeAreaInsets.top, self->_safeAreaInsets.left, self->_safeAreaInsets.bottom, self->_safeAreaInsets.right);
  objc_msgSend(v6, "encodeBool:forKey:", self->_opaque, CFSTR("opaque"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_widgetGroupMetrics, CFSTR("widgetGroupMetrics"));

}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
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

- (BOOL)opaque
{
  return self->_opaque;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (NTKComplicationWidgetGroupMetrics)widgetGroupMetrics
{
  return self->_widgetGroupMetrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetGroupMetrics, 0);
}

@end
