@implementation HKChartSeriesPointMarker

+ (id)chartPointWithColor:(id)a3 radius:(double)a4 style:(int64_t)a5
{
  id v7;
  void *v8;
  double v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;

  v7 = a3;
  if (a5 == 2)
  {
    v8 = 0;
  }
  else
  {
    v9 = a4 + a4;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", v9, v9);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__HKChartSeriesPointMarker_chartPointWithColor_radius_style___block_invoke;
    v12[3] = &unk_1E9C40E10;
    v15 = 0;
    v16 = 0;
    v14 = a5;
    v17 = v9;
    v18 = v9;
    v13 = v7;
    objc_msgSend(v10, "imageWithActions:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

void __61__HKChartSeriesPointMarker_chartPointWithColor_radius_style___block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;
  uint64_t v4;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 == 1)
  {
    _drawHollowCircleInContext(v3, *(void **)(a1 + 32), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72));
  }
  else if (!v4)
  {
    _drawSolidCircleInContext(v3, *(void **)(a1 + 32), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72));
  }
}

+ (id)chartPointWithLineSeriesPresentationStyle:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "pointColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "radius");
  v6 = v5;
  v7 = objc_msgSend(v3, "pointMarkerStyle");

  +[HKChartSeriesPointMarker chartPointWithColor:radius:style:](HKChartSeriesPointMarker, "chartPointWithColor:radius:style:", v4, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
