@implementation PKStrokeProviderSlice

- (PKStrokeProviderSlice)initWithStroke:(id)a3 tStart:(double)a4 tEnd:(double)a5
{
  id v9;
  PKStrokeProviderSlice *v10;
  CGSize v11;
  uint64_t v12;
  PKStrokeProviderSliceIdentifier *identifier;
  objc_super v15;

  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKStrokeProviderSlice;
  v10 = -[PKStrokeProviderSlice init](&v15, sel_init);
  v11 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  v10->_bounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  v10->_bounds.size = v11;
  objc_storeStrong((id *)&v10->_stroke, a3);
  objc_msgSend(v9, "sliceIdentifierForTStart:tEnd:", a4, a5);
  v12 = objc_claimAutoreleasedReturnValue();
  identifier = v10->_identifier;
  v10->_identifier = (PKStrokeProviderSliceIdentifier *)v12;

  return v10;
}

- (PKStrokeProviderSlice)initWithIdentifier:(id)a3
{
  PKStrokeProviderSliceIdentifier *v4;
  PKStrokeProviderSlice *v5;
  CGSize v6;
  PKStrokeProviderSliceIdentifier *identifier;
  objc_super v9;

  v4 = (PKStrokeProviderSliceIdentifier *)a3;
  v9.receiver = self;
  v9.super_class = (Class)PKStrokeProviderSlice;
  v5 = -[PKStrokeProviderSlice init](&v9, sel_init);
  v6 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  v5->_bounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  v5->_bounds.size = v6;
  identifier = v5->_identifier;
  v5->_identifier = v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PKStrokeProviderSlice identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PKStrokeProviderSlice identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (CHStrokeIdentifier)strokeIdentifier
{
  return (CHStrokeIdentifier *)self->_identifier;
}

- (BOOL)isFinished
{
  return !-[PKStroke _isInProgressScribbleStroke](self->_stroke, "_isInProgressScribbleStroke");
}

- (CHEncodedStrokeIdentifier)encodedStrokeIdentifier
{
  PKStrokeProviderSlice *v2;
  CHEncodedStrokeIdentifier *encodedStrokeIdentifier;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  CHEncodedStrokeIdentifier *v9;
  CHEncodedStrokeIdentifier *v10;
  id v12;

  v2 = self;
  objc_sync_enter(v2);
  encodedStrokeIdentifier = v2->_encodedStrokeIdentifier;
  if (!encodedStrokeIdentifier)
  {
    v4 = (void *)MEMORY[0x1E0CB36F8];
    -[PKStrokeProviderSlice strokeIdentifier](v2, "strokeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v4, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;

    if (v6)
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D16808]), "initWithData:", v6);
      v9 = v2->_encodedStrokeIdentifier;
      v2->_encodedStrokeIdentifier = (CHEncodedStrokeIdentifier *)v8;

    }
    encodedStrokeIdentifier = v2->_encodedStrokeIdentifier;
  }
  v10 = encodedStrokeIdentifier;
  objc_sync_exit(v2);

  return v10;
}

- (CGRect)bounds
{
  PKStrokeProviderSlice *v2;
  void *v3;
  uint64_t v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[8];
  uint64_t v14;
  double *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect result;

  v2 = self;
  objc_sync_enter(v2);
  if (CGRectIsNull(v2->_bounds)
    && (-[PKStrokeProviderSlice stroke](v2, "stroke"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "_pointsCount"),
        v3,
        v4))
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0x7FEFFFFFFFFFFFFFLL;
    v22 = 0;
    v23 = (double *)&v22;
    v24 = 0x2020000000;
    v25 = 0xFFEFFFFFFFFFFFFFLL;
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0x7FEFFFFFFFFFFFFFLL;
    v14 = 0;
    v15 = (double *)&v14;
    v16 = 0x2020000000;
    v17 = 0xFFEFFFFFFFFFFFFFLL;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __31__PKStrokeProviderSlice_bounds__block_invoke;
    v13[3] = &unk_1E7777FD0;
    v13[4] = &v26;
    v13[5] = &v22;
    v13[6] = &v18;
    v13[7] = &v14;
    -[PKStrokeProviderSlice enumeratePointsWithDataStep:usingBlock:](v2, "enumeratePointsWithDataStep:usingBlock:", v13, 0.25);
    *(_QWORD *)&v30.origin.x = v27[3];
    *(_QWORD *)&v30.origin.y = v19[3];
    v30.size.width = v23[3] - v30.origin.x;
    v30.size.height = v15[3] - v30.origin.y;
    v31 = CGRectInset(v30, -1.0, -1.0);
    v32 = CGRectIntegral(v31);
    x = v32.origin.x;
    y = v32.origin.y;
    width = v32.size.width;
    height = v32.size.height;
    v2->_bounds = v32;
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v26, 8);
  }
  else
  {
    x = v2->_bounds.origin.x;
    y = v2->_bounds.origin.y;
    width = v2->_bounds.size.width;
    height = v2->_bounds.size.height;
  }
  objc_sync_exit(v2);

  v9 = x;
  v10 = y;
  v11 = width;
  v12 = height;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

_QWORD *__31__PKStrokeProviderSlice_bounds__block_invoke(_QWORD *result, double a2, double a3)
{
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  double v9;

  v3 = *(_QWORD *)(result[4] + 8);
  v4 = *(double *)(v3 + 24);
  if (v4 >= a2)
    v4 = a2;
  *(double *)(v3 + 24) = v4;
  v5 = *(_QWORD *)(result[5] + 8);
  if (*(double *)(v5 + 24) >= a2)
    a2 = *(double *)(v5 + 24);
  *(double *)(v5 + 24) = a2;
  v6 = *(_QWORD *)(result[6] + 8);
  v7 = *(double *)(v6 + 24);
  if (v7 >= a3)
    v7 = a3;
  *(double *)(v6 + 24) = v7;
  v8 = *(_QWORD *)(result[7] + 8);
  v9 = *(double *)(v8 + 24);
  if (v9 < a3)
    v9 = a3;
  *(double *)(v8 + 24) = v9;
  return result;
}

- (double)startTimestamp
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  -[PKStrokeProviderSlice stroke](self, "stroke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;
  -[PKStrokeProviderSlice stroke](self, "stroke");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKStrokeProviderSlice identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tStart");
  objc_msgSend(v9, "interpolatedTimeoffsetAt:");
  v12 = v7 + v11;

  return v12;
}

- (double)endTimestamp
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  -[PKStrokeProviderSlice stroke](self, "stroke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;
  -[PKStrokeProviderSlice stroke](self, "stroke");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_strokeData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKStrokeProviderSlice identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tEnd");
  objc_msgSend(v9, "interpolatedTimeoffsetAt:");
  v12 = v7 + v11;

  return v12;
}

- (unint64_t)strokeAttributes
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;

  -[PKStrokeProviderSlice stroke](self, "stroke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_shapeType");

  -[PKStrokeProviderSlice stroke](self, "stroke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_isSynthesizedInk");

  -[PKStrokeProviderSlice stroke](self, "stroke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_inputType");

  -[PKStrokeProviderSlice stroke](self, "stroke");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "_isSynthesizedInk") & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    -[PKStrokeProviderSlice stroke](self, "stroke");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "_isPastedStroke") & 1) != 0)
    {
      v10 = 1;
    }
    else
    {
      -[PKStrokeProviderSlice stroke](self, "stroke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "_isSharedStroke");

    }
  }

  -[PKStrokeProviderSlice stroke](self, "stroke");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "_isSafeForStyleInventory");

  -[PKStrokeProviderSlice stroke](self, "stroke");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "_isPastedStroke");

  -[PKStrokeProviderSlice stroke](self, "stroke");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "_isSharedStroke");
  if (v6)
    v19 = (2 * (v4 != 0)) | 4;
  else
    v19 = 2 * (v4 != 0);
  if (!v8)
    v19 |= 8uLL;
  if (v14 | v10)
    v20 = v19;
  else
    v20 = v19 | 0x40;
  if (v16)
    v21 = v20 | 0x10;
  else
    v21 = v20;

  v22 = v21 | 0x20;
  if (!v18)
    v22 = v21;
  if (v22 <= 1)
    return 1;
  else
    return v22;
}

- (int64_t)compareTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;

  v4 = a3;
  -[PKStrokeProviderSlice stroke](self, "stroke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stroke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compareToStroke:", v6);

  if (!v7)
  {
    -[PKStrokeProviderSlice identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tStart");
    v10 = v9;
    objc_msgSend(v4, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tStart");
    v13 = v12;

    if (v10 >= v13)
    {
      -[PKStrokeProviderSlice identifier](self, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "tStart");
      v16 = v15;
      objc_msgSend(v4, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "tStart");
      v19 = v18;

      v7 = v16 > v19;
    }
    else
    {
      v7 = -1;
    }
  }

  return v7;
}

- (CGPoint)_splineControlPoint:(int64_t)a3 transform:(CGAffineTransform *)a4
{
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  float64x2_t v19;
  double v25;
  double v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  double v30;
  float64x2_t v31;
  double v32;
  CGPoint result;

  -[PKStrokeProviderSlice stroke](self, "stroke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_strokeData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKStrokeProviderSlice stroke](self, "stroke");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_pointsCount");

  if (a3 < 0)
  {
    objc_msgSend(v8, "locationAtIndex:", 0);
    v30 = v14;
    v32 = v13;
    v27 = *(float64x2_t *)&a4->c;
    v28 = *(float64x2_t *)&a4->tx;
    v29 = *(float64x2_t *)&a4->a;
    objc_msgSend(v8, "locationAtIndex:", 1);
LABEL_6:
    v19 = vnegq_f64(vaddq_f64(*(float64x2_t *)&a4->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a4->c, v16), *(float64x2_t *)&a4->a, v15)));
    __asm { FMOV            V0.2D, #2.0 }
    v31 = vmlaq_f64(v19, _Q0, vaddq_f64(v28, vmlaq_n_f64(vmulq_n_f64(v27, v30), v29, v32)));
    goto LABEL_7;
  }
  if (v10 <= a3)
  {
    objc_msgSend(v8, "locationAtIndex:", v10 - 1);
    v30 = v18;
    v32 = v17;
    v27 = *(float64x2_t *)&a4->c;
    v28 = *(float64x2_t *)&a4->tx;
    v29 = *(float64x2_t *)&a4->a;
    objc_msgSend(v8, "locationAtIndex:", v10 - 2);
    goto LABEL_6;
  }
  objc_msgSend(v8, "locationAtIndex:", a3);
  v31 = vaddq_f64(*(float64x2_t *)&a4->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a4->c, v11), *(float64x2_t *)&a4->a, v12));
LABEL_7:

  v26 = v31.f64[1];
  v25 = v31.f64[0];
  result.y = v26;
  result.x = v25;
  return result;
}

- (CGPoint)_interpolatedPointForSplineSegment:(int64_t)a3 t:(double)a4 transform:(CGAffineTransform *)a5
{
  uint64_t v8;
  int64_t v9;
  double v10;
  double v11;
  double v12;
  __int128 v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _OWORD v21[3];
  CGPoint result;

  v8 = 0;
  v9 = a3 - 1;
  v11 = *MEMORY[0x1E0C9D538];
  v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v12 = 0.0;
  do
  {
    v13 = *(_OWORD *)&a5->c;
    v21[0] = *(_OWORD *)&a5->a;
    v21[1] = v13;
    v21[2] = *(_OWORD *)&a5->tx;
    -[PKStrokeProviderSlice _splineControlPoint:transform:](self, "_splineControlPoint:transform:", v9 + v8, v21);
    v15 = v14;
    v17 = v16;
    v18 = b((int)v8 - 2, a4);
    v11 = v11 + v18 * v15;
    v10 = v10 + v18 * v17;
    v12 = v12 + v18;
    ++v8;
  }
  while (v8 != 4);
  v19 = v11 / v12;
  v20 = v10 / v12;
  result.y = v20;
  result.x = v19;
  return result;
}

- (double)_interpolatedTimeForSplineSegment:(int64_t)a3 t:(double)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  -[PKStrokeProviderSlice stroke](self, "stroke", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_strokeData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timestampAtIndex:", a3);
  v9 = v8;

  -[PKStrokeProviderSlice stroke](self, "stroke");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_strokeData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timestampAtIndex:", a3 + 1);
  v13 = v12;

  return v9 + (v13 - v9) * (double)a3;
}

- (double)_lengthOfSplineSegment:(unint64_t)a3 transform:(CGAffineTransform *)a4
{
  __int128 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  __int128 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __int128 v22;
  double v23;
  double v24;
  _OWORD v26[3];
  _OWORD v27[3];
  _OWORD v28[3];
  _OWORD v29[3];

  v7 = *(_OWORD *)&a4->c;
  v29[0] = *(_OWORD *)&a4->a;
  v29[1] = v7;
  v29[2] = *(_OWORD *)&a4->tx;
  -[PKStrokeProviderSlice _splineControlPoint:transform:](self, "_splineControlPoint:transform:", a3 - 1, v29);
  v9 = v8;
  v11 = v10;
  v12 = *(_OWORD *)&a4->c;
  v28[0] = *(_OWORD *)&a4->a;
  v28[1] = v12;
  v28[2] = *(_OWORD *)&a4->tx;
  -[PKStrokeProviderSlice _splineControlPoint:transform:](self, "_splineControlPoint:transform:", a3, v28);
  v14 = v13;
  v16 = v15;
  v17 = *(_OWORD *)&a4->c;
  v27[0] = *(_OWORD *)&a4->a;
  v27[1] = v17;
  v27[2] = *(_OWORD *)&a4->tx;
  -[PKStrokeProviderSlice _splineControlPoint:transform:](self, "_splineControlPoint:transform:", a3 + 1, v27);
  v19 = v18;
  v21 = v20;
  v22 = *(_OWORD *)&a4->c;
  v26[0] = *(_OWORD *)&a4->a;
  v26[1] = v22;
  v26[2] = *(_OWORD *)&a4->tx;
  -[PKStrokeProviderSlice _splineControlPoint:transform:](self, "_splineControlPoint:transform:", a3 + 2, v26);
  return approximateSplineLength(v9, v11, v14, v16, v19, v21, v23, v24);
}

- (int64_t)_firstPointIndex
{
  void *v2;
  double v3;
  int64_t v4;

  -[PKStrokeProviderSlice identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tStart");
  v4 = (uint64_t)v3;

  return v4;
}

- (int64_t)_lastPointIndex
{
  int64_t v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  unint64_t v8;
  int64_t v9;

  v3 = -[PKStrokeProviderSlice _firstPointIndex](self, "_firstPointIndex");
  -[PKStrokeProviderSlice identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tEnd");
  v6 = v5;

  -[PKStrokeProviderSlice stroke](self, "stroke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_pointsCount") - 1;

  if (v8 >= (uint64_t)v6)
    v9 = (uint64_t)v6;
  else
    v9 = v8;
  if (v9 <= v3)
    return v3;
  else
    return v9;
}

- (double)_strokeLength
{
  void *v3;
  uint64_t v4;
  double v5;
  int64_t v6;
  void *v7;
  void *v8;
  int64_t v9;
  int64_t v10;
  double v11;
  _OWORD v13[3];
  __int128 v14;
  __int128 v15;
  __int128 v16;

  -[PKStrokeProviderSlice stroke](self, "stroke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_pointsCount");

  v5 = 0.0;
  if (v4 != 1)
  {
    v6 = -[PKStrokeProviderSlice _lastPointIndex](self, "_lastPointIndex");
    v15 = 0u;
    v16 = 0u;
    v14 = 0u;
    -[PKStrokeProviderSlice stroke](self, "stroke");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "transform");
    }
    else
    {
      v15 = 0u;
      v16 = 0u;
      v14 = 0u;
    }

    v9 = -[PKStrokeProviderSlice _firstPointIndex](self, "_firstPointIndex");
    if (v9 < v6)
    {
      v10 = v9;
      do
      {
        v13[0] = v14;
        v13[1] = v15;
        v13[2] = v16;
        -[PKStrokeProviderSlice _lengthOfSplineSegment:transform:](self, "_lengthOfSplineSegment:transform:", v10, v13);
        v5 = v5 + v11;
        ++v10;
      }
      while (v6 != v10);
    }
  }
  return v5;
}

- (void)enumeratePointsWithTimestep:(double)a3 usingBlock:(id)a4
{
  void (**v6)(id, _BYTE *);
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  unint64_t v16;
  double v17;
  double v18;
  float64x2_t v19;
  double v20;
  void *v21;
  void *v22;
  char v23;
  int64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  unint64_t v29;
  double v30;
  unint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  __n128 v39;
  __n128 v40;
  _OWORD v41[3];
  char v42;
  float64x2_t v43;
  float64x2_t v44;
  float64x2_t v45;

  v6 = (void (**)(id, _BYTE *))a4;
  if (v6)
  {
    -[PKStrokeProviderSlice stroke](self, "stroke");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_strokeData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKStrokeProviderSlice stroke](self, "stroke");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "_pointsCount");

    v11 = -[PKStrokeProviderSlice _firstPointIndex](self, "_firstPointIndex");
    v44 = 0u;
    v45 = 0u;
    v43 = 0u;
    -[PKStrokeProviderSlice stroke](self, "stroke");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "transform");
    }
    else
    {
      v44 = 0u;
      v45 = 0u;
      v43 = 0u;
    }

    objc_msgSend(v8, "timestampAtIndex:", v11);
    v15 = v14;
    v16 = v10 - 1;
    if (v10 == 1)
    {
      v42 = 0;
      objc_msgSend(v8, "locationAtIndex:", v11);
      v19 = vaddq_f64(v45, vmlaq_n_f64(vmulq_n_f64(v44, v17), v43, v18));
      v20 = v19.f64[1];
      v40 = (__n128)v19;
      v6[2](v6, &v42);
      if (!v42)
        ((void (*)(void (**)(id, _BYTE *), char *, __n128, double, double))v6[2])(v6, &v42, v40, v20, v15);
    }
    else
    {
      -[PKStrokeProviderSlice stroke](self, "stroke");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_strokeData");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "hasValidPointTimestampData");

      if ((v23 & 1) != 0)
      {
        v24 = -[PKStrokeProviderSlice _lastPointIndex](self, "_lastPointIndex");
        objc_msgSend(v8, "timestampAtIndex:", v11);
        v26 = v25;
        objc_msgSend(v8, "timestampAtIndex:", v24);
        v28 = v27;
        v29 = -[PKStrokeProviderSlice _firstPointIndex](self, "_firstPointIndex");
        while (v15 < v28)
        {
          if (v29 >= v16)
          {
            v36 = v15 - v26;
            v35 = 0.0;
          }
          else
          {
            while (1)
            {
              objc_msgSend(v8, "timestampAtIndex:", v29);
              v26 = v30;
              v31 = v29 + 1;
              objc_msgSend(v8, "timestampAtIndex:", v29 + 1);
              v33 = v32;
              objc_msgSend(v8, "timestampAtIndex:", v29);
              v35 = v33 - v34;
              v36 = v15 - v26;
              if (v15 - v26 < v35)
                break;
              ++v29;
              if (v16 == v31)
              {
                v29 = v16;
                break;
              }
            }
          }
          v41[0] = v43;
          v41[1] = v44;
          v41[2] = v45;
          -[PKStrokeProviderSlice _interpolatedPointForSplineSegment:t:transform:](self, "_interpolatedPointForSplineSegment:t:transform:", v29, v41, v36 / v35);
          v42 = 0;
          v6[2](v6, &v42);
          v15 = v15 + a3;
          if (v42)
            goto LABEL_20;
        }
        v42 = 0;
        objc_msgSend(v8, "locationAtIndex:", v24);
        v39 = (__n128)vaddq_f64(v45, vmlaq_n_f64(vmulq_n_f64(v44, v37), v43, v38));
        ((void (*)(void (**)(id, _BYTE *), char *, __n128, double, double))v6[2])(v6, &v42, v39, v39.n128_f64[1], v28);
      }
      else
      {
        -[PKStrokeProviderSlice enumeratePointsWithDistanceStep:usingBlock:](self, "enumeratePointsWithDistanceStep:usingBlock:", v6, a3 * 240.0);
      }
    }
LABEL_20:

  }
}

- (void)enumeratePointsWithDistanceStep:(double)a3 usingBlock:(id)a4
{
  void (**v6)(id, _BYTE *, double, double, double);
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  unint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  double v42;
  _OWORD v43[3];
  _OWORD v44[3];
  char v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;

  v6 = (void (**)(id, _BYTE *, double, double, double))a4;
  if (v6)
  {
    -[PKStrokeProviderSlice stroke](self, "stroke");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_strokeData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKStrokeProviderSlice stroke](self, "stroke");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "_pointsCount");

    v11 = -[PKStrokeProviderSlice _firstPointIndex](self, "_firstPointIndex");
    v12 = -[PKStrokeProviderSlice _lastPointIndex](self, "_lastPointIndex");
    -[PKStrokeProviderSlice _strokeLength](self, "_strokeLength");
    v14 = v13;
    v47 = 0u;
    v48 = 0u;
    v46 = 0u;
    -[PKStrokeProviderSlice stroke](self, "stroke");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "transform");
    }
    else
    {
      v47 = 0u;
      v48 = 0u;
      v46 = 0u;
    }

    v17 = v10 - 1;
    if (!v17 || v14 == 0.0)
    {
      v45 = 0;
      objc_msgSend(v8, "locationAtIndex:", v11);
      v28 = v27;
      v30 = v29;
      v31 = v46;
      v32 = v47;
      v33 = v48;
      objc_msgSend(v8, "timestampAtIndex:", v11);
      v6[2](v6, &v45, *(double *)&v33 + v30 * *(double *)&v32 + *(double *)&v31 * v28, *((double *)&v33 + 1) + v30 * *((double *)&v32 + 1) + *((double *)&v31 + 1) * v28, v34);
      if (v45)
      {
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      v18 = 0.0;
      v19 = 0.0;
      while (v18 < v14)
      {
        v20 = 0.0;
        if (v11 < v17)
        {
          while (1)
          {
            v44[0] = v46;
            v44[1] = v47;
            v44[2] = v48;
            -[PKStrokeProviderSlice _lengthOfSplineSegment:transform:](self, "_lengthOfSplineSegment:transform:", v11, v44);
            if (v18 - v19 < v20)
              break;
            v19 = v19 + v20;
            if (v17 == ++v11)
            {
              v11 = v17;
              break;
            }
          }
        }
        v43[0] = v46;
        v43[1] = v47;
        v43[2] = v48;
        v21 = (v18 - v19) / v20;
        -[PKStrokeProviderSlice _interpolatedPointForSplineSegment:t:transform:](self, "_interpolatedPointForSplineSegment:t:transform:", v11, v43, v21);
        v23 = v22;
        v25 = v24;
        -[PKStrokeProviderSlice _interpolatedTimeForSplineSegment:t:](self, "_interpolatedTimeForSplineSegment:t:", v11, v21);
        v45 = 0;
        v6[2](v6, &v45, v23, v25, v26);
        v18 = v18 + a3;
        if (v45)
          goto LABEL_17;
      }
    }
    v45 = 0;
    objc_msgSend(v8, "locationAtIndex:", v12);
    v36 = v35;
    v38 = v37;
    v39 = v46;
    v40 = v47;
    v41 = v48;
    objc_msgSend(v8, "timestampAtIndex:", v12);
    v6[2](v6, &v45, *(double *)&v41 + v38 * *(double *)&v40 + *(double *)&v39 * v36, *((double *)&v41 + 1) + v38 * *((double *)&v40 + 1) + *((double *)&v39 + 1) * v36, v42);
    goto LABEL_17;
  }
LABEL_18:

}

- (void)enumeratePointsWithDataStep:(double)a3 usingBlock:(id)a4
{
  void (**v6)(_QWORD, __n128, double);
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  __n128 v17;
  double v18;
  double v19;
  __n128 v20;
  double i;
  _OWORD v22[3];
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;

  v6 = (void (**)(_QWORD, __n128, double))a4;
  -[PKStrokeProviderSlice stroke](self, "stroke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_pointsCount");

  if (v6)
  {
    -[PKStrokeProviderSlice stroke](self, "stroke");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_strokeData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[PKStrokeProviderSlice _firstPointIndex](self, "_firstPointIndex");
    v12 = -[PKStrokeProviderSlice _lastPointIndex](self, "_lastPointIndex");
    v24 = 0u;
    v25 = 0u;
    v23 = 0u;
    -[PKStrokeProviderSlice stroke](self, "stroke");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "transform");
    }
    else
    {
      v24 = 0u;
      v25 = 0u;
      v23 = 0u;
    }

    if (v8 == 1)
    {
      objc_msgSend(v10, "locationAtIndex:", v11);
      v17 = (__n128)vaddq_f64(v25, vmlaq_n_f64(vmulq_n_f64(v24, v15), v23, v16));
      v6[2](v6, v17, v17.n128_f64[1]);
    }
    else
    {
      for (i = (double)v11; i < (double)v12; i = i + a3)
      {
        v22[0] = v23;
        v22[1] = v24;
        v22[2] = v25;
        -[PKStrokeProviderSlice _interpolatedPointForSplineSegment:t:transform:](self, "_interpolatedPointForSplineSegment:t:transform:", (uint64_t)i, v22, i - (double)(uint64_t)i);
        ((void (*)(void (**)(_QWORD, __n128, double)))v6[2])(v6);
      }
    }
    objc_msgSend(v10, "locationAtIndex:", v12);
    v20 = (__n128)vaddq_f64(v25, vmlaq_n_f64(vmulq_n_f64(v24, v18), v23, v19));
    v6[2](v6, v20, v20.n128_f64[1]);

  }
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKStrokeProviderSlice identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKStrokeProviderSlice stroke](self, "stroke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p id=%@ stroke=%@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (PKStrokeProviderSliceIdentifier)identifier
{
  return self->_identifier;
}

- (PKStroke)stroke
{
  return self->_stroke;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stroke, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_encodedStrokeIdentifier, 0);
}

@end
