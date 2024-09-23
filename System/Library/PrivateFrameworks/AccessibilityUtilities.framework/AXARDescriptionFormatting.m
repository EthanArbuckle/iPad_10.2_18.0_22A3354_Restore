@implementation AXARDescriptionFormatting

+ (id)descriptionForDistance:(float)a3 objectFrame:(CGRect)a4 viewBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;
  void *v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend(a1, "_descriptionForDistance:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_visibilityDescriptionForObjectFrame:viewBounds:", x, y, width, height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_descriptionForDistance:(float)a3
{
  void *v3;
  double v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a3 == 0.0)
  {
    v3 = 0;
  }
  else
  {
    v4 = a3;
    if (_descriptionForDistance__onceToken != -1)
      dispatch_once(&_descriptionForDistance__onceToken, &__block_literal_global_28);
    v5 = objc_alloc(MEMORY[0x1E0CB3758]);
    objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithDoubleValue:unit:", v6, v4);

    objc_msgSend((id)_descriptionForDistance__formatter, "stringFromMeasurement:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DISTANCE_DESCRIPTION"), &stru_1E24CAB08, CFSTR("ARDescriptionFormatting"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v11, v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

void __53__AXARDescriptionFormatting__descriptionForDistance___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v0 = objc_opt_new();
  v1 = (void *)_descriptionForDistance__formatter;
  _descriptionForDistance__formatter = v0;

  objc_msgSend((id)_descriptionForDistance__formatter, "setUnitStyle:", 3);
  objc_msgSend((id)_descriptionForDistance__formatter, "setUnitOptions:", 2);
  objc_msgSend((id)_descriptionForDistance__formatter, "numberFormatter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMaximumFractionDigits:", 0);

}

+ (double)_valueForPercentageFromRawValue:(double)a3
{
  double v4;
  NSObject *v5;

  v4 = round(a3 * 10.0) / 10.0;
  if (fabs(v4 + -1.0) < 2.22044605e-16 && fabs(a3 + -1.0) > 2.22044605e-16)
    return 0.9;
  if (fabs(v4) < 2.22044605e-16)
  {
    v4 = 0.1;
    if (fabs(a3) <= 2.22044605e-16)
    {
      AXLogCommon();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        +[AXARDescriptionFormatting _valueForPercentageFromRawValue:].cold.1(v5, a3);

    }
  }
  return v4;
}

+ (id)_visibilityDescriptionForObjectFrame:(CGRect)a3 viewBounds:(CGRect)a4
{
  double x;
  CGFloat y;
  CGFloat width;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  double height;
  CGFloat v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  x = a4.origin.x;
  height = a4.size.height;
  v37 = a3.origin.x;
  y = a3.origin.y;
  width = a3.size.width;
  v34 = a3.size.height;
  v35 = a4.size.width;
  v8 = a4.origin.y;
  v38 = CGRectIntersection(a3, a4);
  v9 = v38.origin.x;
  v10 = v38.origin.y;
  v11 = v38.size.width;
  v12 = v38.size.height;
  if (CGRectIsNull(v38))
  {
LABEL_8:
    v27 = 0;
    return v27;
  }
  v39.origin.x = v9;
  v39.origin.y = v10;
  v39.size.width = v11;
  v39.size.height = v12;
  v32 = CGRectGetWidth(v39);
  v40.origin.x = v9;
  v40.origin.y = v10;
  v40.size.width = v11;
  v40.size.height = v12;
  v31 = CGRectGetHeight(v40);
  v41.origin.x = x;
  v41.origin.y = v8;
  v41.size.width = v35;
  v41.size.height = height;
  v13 = CGRectGetWidth(v41);
  v42.origin.x = x;
  v42.origin.y = v8;
  v42.size.width = v35;
  v42.size.height = height;
  v14 = v13 * CGRectGetHeight(v42);
  v43.origin.x = v37;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = v34;
  v33 = CGRectGetWidth(v43);
  v44.origin.x = v37;
  v44.origin.y = y;
  v44.size.width = width;
  v44.size.height = v34;
  v15 = CGRectGetHeight(v44);
  if (v14 <= 0.0 || (v16 = v33 * v15, v16 <= 0.0))
  {
    AXLogCommon();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      +[AXARDescriptionFormatting _visibilityDescriptionForObjectFrame:viewBounds:].cold.1(v28, x, v8, v35, height, v37, y, width, v34);

    goto LABEL_8;
  }
  v17 = v32 * v31 / v16;
  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("VISIBILITY_PERCENTAGE"), &stru_1E24CAB08, CFSTR("ARDescriptionFormatting"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_valueForPercentageFromRawValue:", v17);
  AXFormatFloatWithPercentage();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringWithFormat:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("COVERAGE_PERCENTAGE"), &stru_1E24CAB08, CFSTR("ARDescriptionFormatting"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_valueForPercentageFromRawValue:", v32 * v31 / v14);
  AXFormatFloatWithPercentage();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringWithFormat:", v25, v26);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (void)_valueForPercentageFromRawValue:(os_log_t)log .cold.1(os_log_t log, double a2)
{
  int v2;
  double v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a2;
  _os_log_fault_impl(&dword_18C62B000, log, OS_LOG_TYPE_FAULT, "Had raw value %f, but should not have gotten here if the asset was not on screen at all", (uint8_t *)&v2, 0xCu);
}

+ (void)_visibilityDescriptionForObjectFrame:(double)a3 viewBounds:(double)a4 .cold.1(NSObject *a1, double a2, double a3, double a4, double a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;
  NSRect v21;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromRect(*(NSRect *)&a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21.origin.x = a6;
  v21.origin.y = a7;
  v21.size.width = a8;
  v21.size.height = a9;
  NSStringFromRect(v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 138412546;
  v17 = v14;
  v18 = 2112;
  v19 = v15;
  _os_log_fault_impl(&dword_18C62B000, a1, OS_LOG_TYPE_FAULT, "Unable to get view bounds: %@ or object frame: %@", (uint8_t *)&v16, 0x16u);

}

@end
