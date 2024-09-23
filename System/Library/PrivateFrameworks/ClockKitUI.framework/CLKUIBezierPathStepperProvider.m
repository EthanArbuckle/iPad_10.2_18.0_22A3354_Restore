@implementation CLKUIBezierPathStepperProvider

- (CLKUIBezierPathStepperProvider)init
{
  CLKUIBezierPathStepperProvider *v2;
  CLKUIBezierPathStepper *v3;
  CLKUIBezierPathStepper *pathStepper;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLKUIBezierPathStepperProvider;
  v2 = -[CLKUIBezierPathStepperProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CLKUIBezierPathStepper);
    pathStepper = v2->_pathStepper;
    v2->_pathStepper = v3;

    v2->_pathLength = 0.0;
    v2->_offsetNorth = 0.0;
  }
  return v2;
}

- (void)setPath:(id)a3
{
  double v5;
  UIBezierPath *v6;

  v6 = (UIBezierPath *)a3;
  if (self->_path != v6)
  {
    objc_storeStrong((id *)&self->_path, a3);
    -[CLKUIBezierPathStepper setPath:](self->_pathStepper, "setPath:", v6);
    -[CLKUIBezierPathStepper totalLength](self->_pathStepper, "totalLength");
    self->_pathLength = v5;
    -[CLKUIBezierPathStepperProvider _calculateNorthOffset](self, "_calculateNorthOffset");
  }

}

- (void)_calculateNorthOffset
{
  void (**v3)(_QWORD, double);
  double v4;
  double v5;
  double v6;
  double pathLength;
  double v8;
  double v9;
  _QWORD aBlock[9];
  _QWORD v11[4];
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0x7FEFFFFFFFFFFFFFLL;
  v16 = 0;
  v17 = (double *)&v16;
  v18 = 0x2020000000;
  v19 = 0x7FF8000000000000;
  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0x7FF8000000000000;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0xBFF0000000000000;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__CLKUIBezierPathStepperProvider__calculateNorthOffset__block_invoke;
  aBlock[3] = &unk_1E86E0390;
  aBlock[4] = self;
  aBlock[5] = v11;
  aBlock[6] = v20;
  aBlock[7] = &v16;
  aBlock[8] = &v12;
  v3 = (void (**)(_QWORD, double))_Block_copy(aBlock);
  if (self->_pathLength > 0.0)
  {
    v4 = 0.0;
    do
    {
      v3[2](v3, v4);
      v4 = v4 + 0.25;
    }
    while (v4 < self->_pathLength);
  }
  ((void (*)(void (**)(_QWORD, double)))v3[2])(v3);
  v5 = v17[3];
  v6 = v13[3];
  pathLength = self->_pathLength;
  if (vabdd_f64(v6, v5) <= pathLength * 0.5)
  {
    v9 = (v6 - v5) * 0.5;
  }
  else
  {
    if (pathLength - v5 <= v6)
      v8 = v6 + v5 - pathLength;
    else
      v8 = v5 + v6 + pathLength;
    v9 = v8 * 0.5;
  }
  self->_offsetNorth = v9 / pathLength;

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

void __55__CLKUIBezierPathStepperProvider__calculateNorthOffset__block_invoke(_QWORD *a1, double a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1[4] + 8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapOffsetsToPathPositions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "point");
  v10 = *(double *)(*(_QWORD *)(a1[5] + 8) + 24);
  if (v9 < v10 && v10 >= 0.0 && v9 == *(double *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v12 = a1[7];
    goto LABEL_10;
  }
  if (v9 > v10 && v10 == *(double *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v12 = a1[8];
LABEL_10:
    *(double *)(*(_QWORD *)(v12 + 8) + 24) = a2;
  }
  v13 = *(_QWORD *)(a1[6] + 8);
  if (v9 < *(double *)(v13 + 24))
    *(double *)(v13 + 24) = v9;
  *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = v9;

}

- (void)pointAtOffset:(double)a3 outPoint:(CGPoint *)a4 outTangent:(CGVector *)a5
{
  double v7;
  CLKUIBezierPathStepper *pathStepper;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = self->_offsetNorth + a3;
  if (v7 > 1.0)
    v7 = v7 + -1.0;
  pathStepper = self->_pathStepper;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_pathLength * v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIBezierPathStepper mapOffsetsToPathPositions:](pathStepper, "mapOffsetsToPathPositions:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tangent");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v12, "point");
  a4->x = v17;
  a4->y = v18;
  a5->dx = v14;
  a5->dy = v16;

}

- (UIBezierPath)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_pathStepper, 0);
}

@end
