@implementation NTKCubicColorCurve

- (NTKCubicColorCurve)initWithCubicColorCurveElements:(id)a3
{
  id v4;
  NTKCubicColorCurve *v5;
  void *v6;
  uint64_t v7;
  NTKCubicSpline *v8;
  NTKCubicSpline *spline;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  void *v13;
  double v14;
  double v15;
  __int128 v16;
  NTKCubicColorCurve *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NTKCubicColorCurve;
  v5 = -[NTKCubicColorCurve init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_88);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "count");
    v5->_count = v7;
    v5->_fractions = (float *)malloc_type_malloc(4 * v7, 0x100004052888210uLL);
    *(_QWORD *)v5->_colors = malloc_type_malloc(16 * v5->_count, 0x1000040451B5BE8uLL);
    v8 = -[NTKCubicSpline initWithNumberOfControlPoints:isClosed:]([NTKCubicSpline alloc], "initWithNumberOfControlPoints:isClosed:", LODWORD(v5->_count), 0);
    spline = v5->_spline;
    v5->_spline = v8;

    v10 = -[NTKCubicSpline controlPointsBuffer](v5->_spline, "controlPointsBuffer");
    if (v5->_count)
    {
      v11 = (_QWORD *)v10;
      v12 = 0;
      do
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "fraction");
        *(float *)&v14 = v14;
        *(_QWORD *)(*v11 + 8 * v12) = __PAIR64__(LODWORD(v14), (float)(int)v12);
        objc_msgSend(v13, "fraction");
        *(float *)&v15 = v15;
        v5->_fractions[v12] = *(float *)&v15;
        objc_msgSend(v13, "color");
        *(_OWORD *)(*(_QWORD *)v5->_colors + 16 * v12) = v16;

        ++v12;
      }
      while (v5->_count > v12);
    }
    -[NTKCubicSpline process](v5->_spline, "process");
    v17 = v5;

  }
  return v5;
}

uint64_t __54__NTKCubicColorCurve_initWithCubicColorCurveElements___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "fraction");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "fraction");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (NTKCubicColorCurve)initWithColorCurveElements:(id)a3
{
  id v4;
  NTKCubicColorCurve *v5;
  void *v6;
  uint64_t v7;
  NTKCubicSpline *v8;
  NTKCubicSpline *spline;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  void *v13;
  unsigned int v14;
  float v15;
  void *v16;
  __int128 v17;
  NTKCubicColorCurve *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NTKCubicColorCurve;
  v5 = -[NTKCubicColorCurve init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_17_0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "count");
    v5->_count = v7;
    v5->_fractions = (float *)malloc_type_malloc(4 * v7, 0x100004052888210uLL);
    *(_QWORD *)v5->_colors = malloc_type_malloc(16 * v5->_count, 0x1000040451B5BE8uLL);
    v8 = -[NTKCubicSpline initWithNumberOfControlPoints:isClosed:]([NTKCubicSpline alloc], "initWithNumberOfControlPoints:isClosed:", LODWORD(v5->_count), 0);
    spline = v5->_spline;
    v5->_spline = v8;

    v10 = -[NTKCubicSpline controlPointsBuffer](v5->_spline, "controlPointsBuffer");
    if (v5->_count)
    {
      v11 = (_QWORD *)v10;
      v12 = 0;
      do
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "fraction");
        *(_QWORD *)(*v11 + 8 * v12) = __PAIR64__(v14, (float)(int)v12);
        objc_msgSend(v13, "fraction");
        v5->_fractions[v12] = v15;
        objc_msgSend(v13, "color");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        CLKUIConvertToRGBfFromUIColor_fast();
        *(_OWORD *)(*(_QWORD *)v5->_colors + 16 * v12) = v17;

        ++v12;
      }
      while (v5->_count > v12);
    }
    -[NTKCubicSpline process](v5->_spline, "process");
    v18 = v5;

  }
  return v5;
}

uint64_t __49__NTKCubicColorCurve_initWithColorCurveElements___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  double v10;
  void *v11;
  uint64_t v12;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "fraction");
  objc_msgSend(v4, "numberWithFloat:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "fraction");
  v9 = v8;

  LODWORD(v10) = v9;
  objc_msgSend(v7, "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "compare:", v11);

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_fractions);
  free(*(void **)self->_colors);
  v3.receiver = self;
  v3.super_class = (Class)NTKCubicColorCurve;
  -[NTKCubicColorCurve dealloc](&v3, sel_dealloc);
}

- (id)colorForFraction:(float)a3
{
  -[NTKCubicColorCurve rgbfColorForFraction:](self, "rgbfColorForFraction:", a3);
  return (id)CLKUIConvertToUIColorFromRGBf_fast();
}

- (uint64_t)rgbfColorForFraction:(uint64_t)result
{
  uint64_t v2;
  uint64_t v3;
  float v4;
  float v5;
  double v6;

  if (*(_QWORD *)(result + 40) != 1)
  {
    v2 = 0;
    v3 = *(_QWORD *)(result + 32);
    while (1)
    {
      v4 = *(float *)(v3 + 4 * v2);
      if (v4 <= a2)
      {
        v5 = *(float *)(v3 + 4 * v2 + 4);
        if (v5 > a2)
          break;
      }
      if (*(_QWORD *)(result + 40) - 1 == ++v2)
        return result;
    }
    v6 = (a2 - v4) / (float)(v5 - v4) + (double)(int)v2;
    *(float *)&v6 = v6;
    return objc_msgSend(*(id *)(result + 16), "interpolateAt:", v6);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spline, 0);
}

@end
