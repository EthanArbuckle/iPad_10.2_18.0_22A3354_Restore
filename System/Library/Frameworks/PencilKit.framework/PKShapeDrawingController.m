@implementation PKShapeDrawingController

- (_QWORD)initWithDelegate:(_QWORD *)a1
{
  id v3;
  id v4;
  _BYTE *v5;
  _BYTE *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  __int128 v11;
  PKAveragePointGenerator *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  objc_super v30;

  v3 = a2;
  if (a1)
  {
    v30.receiver = a1;
    v30.super_class = (Class)PKShapeDrawingController;
    v4 = objc_msgSendSuper2(&v30, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak((id *)v4 + 24, v3);
      v5 = (_BYTE *)a1[9];
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a1[11] - (_QWORD)v5) >> 3) <= 9)
      {
        v6 = (_BYTE *)a1[10];
        v7 = (char *)operator new(0xF0uLL);
        v8 = &v7[24 * ((v6 - v5) / 24)];
        v9 = v8;
        if (v6 != v5)
        {
          v10 = &v7[24 * ((v6 - v5) / 24)];
          do
          {
            v11 = *(_OWORD *)(v6 - 24);
            v9 = v10 - 24;
            *((_QWORD *)v10 - 1) = *((_QWORD *)v6 - 1);
            *(_OWORD *)(v10 - 24) = v11;
            v6 -= 24;
            v10 -= 24;
          }
          while (v6 != v5);
        }
        a1[9] = v9;
        a1[10] = v8;
        a1[11] = v7 + 240;
        if (v5)
          operator delete(v5);
      }
      a1[20] = 0x3FC999999999999ALL;
      v12 = objc_alloc_init(PKAveragePointGenerator);
      v13 = (void *)a1[15];
      a1[15] = v12;

      v14 = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", CFSTR("internalSettings.shapeRecognition.minimumDelay"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      PKDynamicCast(v14, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v17, "doubleValue");
        a1[20] = v18;
      }
      a1[21] = 0x3FE6666666666666;
      v19 = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKey:", CFSTR("internalSettings.shapeRecognition.maximumDelay"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      PKDynamicCast(v19, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v22, "doubleValue");
        a1[21] = v23;
      }
      a1[22] = 0x3FE0000000000000;
      v24 = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKey:", CFSTR("internalSettings.shapeRecognition.maximumFastDelay"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      PKDynamicCast(v24, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        objc_msgSend(v27, "doubleValue");
        a1[22] = v28;
      }

    }
  }

  return a1;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  return self;
}

- (uint64_t)isScratchOutActive
{
  id WeakRetained;
  char v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 192));
  v2 = objc_opt_respondsToSelector();

  return v2 & 1;
}

+ (CGMutablePathRef)_createNormalizedPathFromPath:(uint64_t)a1
{
  double width;
  double height;
  CGAffineTransform v6;
  CGAffineTransform t1;
  CGAffineTransform transform;
  CGRect BoundingBox;

  objc_opt_self();
  BoundingBox = CGPathGetBoundingBox(a2);
  width = BoundingBox.size.width;
  height = BoundingBox.size.height;
  memset(&transform, 0, sizeof(transform));
  CGAffineTransformMakeTranslation(&t1, -BoundingBox.origin.x, -BoundingBox.origin.y);
  CGAffineTransformMakeScale(&v6, 1.0 / width, 1.0 / height);
  CGAffineTransformConcat(&transform, &t1, &v6);
  return CGPathCreateMutableCopyByTransformingPath(a2, &transform);
}

void __48__PKShapeDrawingController__normalizedHeartPath__block_invoke()
{
  __CFString *v0;
  CGPath *Mutable;
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  int v9;
  unint64_t v10;
  int v11;
  void *v12;
  double v13;
  CGFloat v14;
  void *v15;
  double v16;
  CGFloat v17;
  int v18;
  int v19;
  void *v20;
  double v21;
  CGFloat v22;
  void *v23;
  double v24;
  CGFloat v25;
  int v26;
  int v27;
  uint64_t i;
  void *v29;
  CGFloat v30;
  CGMutablePathRef v31;
  uint64_t v32;
  unint64_t v33;
  CGFloat v34[7];

  v34[6] = *(CGFloat *)MEMORY[0x1E0C80C00];
  v0 = CFSTR("M 76.9531 23.4375 C 78.1738 23.4375 79.8828 22.6562 81.1035 21.875 C 116.016 -0.634766 138.77 -26.6113 138.77 -53.125 C 138.77 -74.9023 123.779 -90.4297 104.199 -90.4297 C 92.2363 -90.4297 82.4707 -83.6914 76.9531 -73.3398 C 71.4844 -83.6426 61.7188 -90.4297 49.707 -90.4297 C 30.127 -90.4297 15.1367 -74.9023 15.1367 -53.125 C 15.1367 -26.6113 37.8906 -0.634766 72.8516 21.875 C 74.0723 22.6562 75.7812 23.4375 76.9531 23.4375 Z");
  v32 = objc_opt_self();
  Mutable = CGPathCreateMutable();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("M 76.9531 23.4375 C 78.1738 23.4375 79.8828 22.6562 81.1035 21.875 C 116.016 -0.634766 138.77 -26.6113 138.77 -53.125 C 138.77 -74.9023 123.779 -90.4297 104.199 -90.4297 C 92.2363 -90.4297 82.4707 -83.6914 76.9531 -73.3398 C 71.4844 -83.6426 61.7188 -90.4297 49.707 -90.4297 C 30.127 -90.4297 15.1367 -74.9023 15.1367 -53.125 C 15.1367 -26.6113 37.8906 -0.634766 72.8516 21.875 C 74.0723 22.6562 75.7812 23.4375 76.9531 23.4375 Z"), "componentsSeparatedByCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "count");
  v5 = v4;
  if (v4)
  {
    v6 = 0;
    v7 = v4 - 2;
    v33 = v4 - 6;
    while (1)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("M"));
      v10 = v6 + 1;
      v11 = v6 + 1 < v7 ? v9 : 0;
      if (v11 == 1)
        break;
      v18 = objc_msgSend(v8, "isEqualToString:", CFSTR("L"));
      if (v10 < v7)
        v19 = v18;
      else
        v19 = 0;
      if (v19 == 1)
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v6 + 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "doubleValue");
        v22 = v21;

        objc_msgSend(v3, "objectAtIndexedSubscript:", v6 + 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "doubleValue");
        v25 = v24;

        CGPathAddLineToPoint(Mutable, 0, v22, v25);
        goto LABEL_13;
      }
      v26 = objc_msgSend(v8, "isEqualToString:", CFSTR("C"));
      if (v10 < v33)
        v27 = v26;
      else
        v27 = 0;
      if (v27 == 1)
      {
        for (i = 0; i != 6; ++i)
        {
          objc_msgSend(v3, "objectAtIndexedSubscript:", v10 + i);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "doubleValue");
          v34[i] = v30;

        }
        CGPathAddCurveToPoint(Mutable, 0, v34[0], v34[1], v34[2], v34[3], v34[4], v34[5]);
        v10 += 6;
      }
      else if (objc_msgSend(v8, "isEqualToString:", CFSTR("Z")))
      {
        CGPathCloseSubpath(Mutable);

        goto LABEL_25;
      }
LABEL_14:

      v6 = v10;
      if (v10 >= v5)
        goto LABEL_25;
    }
    objc_msgSend(v3, "objectAtIndexedSubscript:", v6 + 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    objc_msgSend(v3, "objectAtIndexedSubscript:", v6 + 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;

    CGPathMoveToPoint(Mutable, 0, v14, v17);
LABEL_13:
    v10 = v6 + 3;
    goto LABEL_14;
  }
LABEL_25:
  v31 = +[PKShapeDrawingController _createNormalizedPathFromPath:](v32, Mutable);
  CGPathRelease(Mutable);

  qword_1ECEE64C8 = (uint64_t)v31;
}

- (double)_arrowRadiusForStroke:(void *)a1 inputScale:(double)a2
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;

  v3 = a1;
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    v6 = 0;
    v7 = 0.0;
    do
    {
      objc_msgSend(v4, "radiusAtIndex:", v6);
      v7 = v7 + v8;
      ++v6;
    }
    while (v5 != v6);
    v9 = v7 / (double)v5 + 5.0;
  }
  else
  {
    v9 = 10.0;
  }

  return v9 * a2;
}

void __48__PKShapeDrawingController_shapeRecognizerQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.pencilkit.shapeRecognizer", attr);
  v2 = (void *)qword_1ECEE64D8;
  qword_1ECEE64D8 = (uint64_t)v1;

}

void __43__PKShapeDrawingController_shapeRecognizer__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16830]), "initWithMode:locale:", 3, 0);
  objc_msgSend(v0, "characterSetForStrings:", &unk_1E77ECE98);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setActiveCharacterSet:", v1);

  objc_msgSend(v0, "setMaxRecognitionResultCount:", 3);
  objc_msgSend(v0, "setMinimumDrawingSize:", 0.0, 0.0);
  v2 = (void *)qword_1ECEE64E8;
  qword_1ECEE64E8 = (uint64_t)v0;

}

void __57__PKShapeDrawingController_recognitionResultsForDrawing___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (a1[4])
  {
    if (qword_1ECEE64F0 != -1)
      dispatch_once(&qword_1ECEE64F0, &__block_literal_global_18_0);
    v2 = (id)qword_1ECEE64E8;
  }
  else
  {
    v2 = 0;
  }
  v6 = v2;
  objc_msgSend(v2, "recognitionResultsForDrawing:options:", a1[5], 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __49__PKShapeDrawingController__chDrawingFromStroke___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "addPoint:");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (id)_arrowStrokesWithInputScale:(void *)a3 firstPt:(double)a4 secondPt:(double)a5 radius:(double)a6 averageInputPoint:(double)a7 sourceStroke:(double)a8
{
  id v17;
  double *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  double *v27;
  double *v28;
  double *v29;
  char *v30;
  double *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  double *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  void *v43;
  void *v44;
  _OWORD v46[8];
  _OWORD v47[8];
  double *v48;
  double *v49;
  uint64_t v50;
  double *v51;
  double *v52;
  double *v53;
  _QWORD v54[3];

  v54[2] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = (double *)operator new(0x10uLL);
  v19 = 1.0 / sqrt((a8 - a6) * (a8 - a6) + (a7 - a5) * (a7 - a5));
  v20 = (a7 - a5) * v19;
  v21 = (a8 - a6) * v19;
  v22 = a5 + (a9 + a9) * v20;
  v23 = a6 + (a9 + a9) * v21;
  v24 = v21 * a9;
  v25 = -(v20 * a9);
  *v18 = v24 + v22;
  v18[1] = v25 + v23;
  v52 = v18 + 2;
  v53 = v18 + 2;
  v51 = v18;
  v27 = (double *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v53, 2uLL);
  v28 = v51;
  v29 = v52;
  v27[2] = a5;
  v30 = (char *)(v27 + 2);
  v27[3] = a6;
  v31 = v27 + 4;
  if (v29 != v28)
  {
    do
    {
      *((_OWORD *)v30 - 1) = *((_OWORD *)v29 - 1);
      v30 -= 16;
      v29 -= 2;
    }
    while (v29 != v28);
    v28 = v51;
  }
  v51 = (double *)v30;
  v52 = v27 + 4;
  v53 = &v27[2 * v26];
  if (v28)
    operator delete(v28);
  v52 = v31;
  v48 = 0;
  v49 = 0;
  v50 = 0;
  PKPointsFromLineSegments((uint64_t *)&v51, &v48, a4 * 6.0);
  v32 = a2[5];
  v47[4] = a2[4];
  v47[5] = v32;
  v33 = a2[7];
  v47[6] = a2[6];
  v47[7] = v33;
  v34 = a2[1];
  v47[0] = *a2;
  v47[1] = v34;
  v35 = a2[3];
  v47[2] = a2[2];
  v47[3] = v35;
  -[PKShapeDrawingController _strokeFromPoints:inputScale:averageInputPoint:sourceStroke:](a1, &v48, (uint64_t)v47, v17, a4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v51;
  *v51 = v22 - v24;
  v37[1] = v23 - v25;
  std::vector<CGPoint>::resize((uint64_t)&v48, 0);
  PKPointsFromLineSegments((uint64_t *)&v51, &v48, a4 * 6.0);
  v38 = a2[5];
  v46[4] = a2[4];
  v46[5] = v38;
  v39 = a2[7];
  v46[6] = a2[6];
  v46[7] = v39;
  v40 = a2[1];
  v46[0] = *a2;
  v46[1] = v40;
  v41 = a2[3];
  v46[2] = a2[2];
  v46[3] = v41;
  -[PKShapeDrawingController _strokeFromPoints:inputScale:averageInputPoint:sourceStroke:](a1, &v48, (uint64_t)v46, v17, a4);
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = (void *)v42;
  v44 = 0;
  if (v36 && v42)
  {
    v54[0] = v36;
    v54[1] = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v48)
  {
    v49 = v48;
    operator delete(v48);
  }
  if (v51)
  {
    v52 = v51;
    operator delete(v51);
  }

  return v44;
}

- (id)_strokeFromPoints:(uint64_t)a3 inputScale:(void *)a4 averageInputPoint:(double)a5 sourceStroke:
{
  id v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  double v22;
  double *v23;
  double *v24;
  unint64_t v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  double v31;
  char *v32;
  __int128 v33;
  PKStrokePath *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  PKStrokeGenerator *v40;
  PKStrokePath *v41;
  id v42;
  void *v43;
  __int128 v44;
  void *v45;
  id WeakRetained;
  char v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  long double v54;
  long double v55;
  double v56;
  double *v57;
  uint64_t v58;
  double *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  void *v69;
  void *v71;
  PKAveragePointGenerator *v72;
  _OWORD v73[8];
  _OWORD v74[3];
  _PKStrokePoint v75;
  _OWORD v76[2];
  char *v77;
  char *v78;
  uint8_t buf[88];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = v9;
  if (a2[1] == *a2)
  {
    v45 = 0;
  }
  else
  {
    v11 = *(double *)(a1 + 152);
    objc_msgSend(v9, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "count");

    if (v13)
    {
      objc_msgSend(v10, "ink");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.ink.fountainpen"));

      LODWORD(v13) = v15 ^ 1;
    }
    v16 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "ink");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ink");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_weight");
      v20 = v19;
      objc_msgSend(v10, "ink");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = objc_msgSend(v21, "_weightIsUndefined");
      _os_log_impl(&dword_1BE213000, v16, OS_LOG_TYPE_INFO, "Generating shape with ink: %@, weight: %g, undefined: %d", buf, 0x1Cu);

    }
    v22 = fmax(v11, 0.1);
    if ((_DWORD)v13)
    {
      v72 = objc_alloc_init(PKAveragePointGenerator);
      -[PKAveragePointGenerator addStroke:]((uint64_t)v72, v10);
      memset(buf, 0, sizeof(buf));
      -[PKAveragePointGenerator currentStrokePoint]((uint64_t)v72, (double *)buf);
      v24 = *a2;
      v23 = a2[1];
      v25 = ((char *)v23 - (char *)*a2) >> 4;
      std::vector<PKCompressedStrokePoint>::vector(&v77, v25);
      objc_msgSend(v10, "timestamp");
      v27 = v26;
      if (v23 != v24)
      {
        v28 = 0;
        v29 = 0;
        v30 = 0;
        v31 = v22 / (double)v25;
        if (v25 <= 1)
          v25 = 1;
        do
        {
          v75.location = *(CGPoint *)&(*a2)[v28];
          v75.timestamp = v27 + v31 * (double)v30;
          *(_OWORD *)&v75.radius = *(_OWORD *)&buf[24];
          *(_OWORD *)&v75.edgeWidth = *(_OWORD *)&buf[40];
          *(_OWORD *)&v75.azimuth = *(_OWORD *)&buf[56];
          *(_OWORD *)&v75.opacity = *(_OWORD *)&buf[72];
          PKCompressStrokePoint((PKCompressedStrokePoint *)&v75, v27, (float32x2_t *)v76);
          v32 = &v77[v29];
          v33 = v76[1];
          *(_OWORD *)v32 = v76[0];
          *((_OWORD *)v32 + 1) = v33;
          ++v30;
          v29 += 32;
          v28 += 2;
        }
        while (v25 != v30);
      }
      v34 = [PKStrokePath alloc];
      v36 = v77;
      v35 = v78;
      v37 = objc_msgSend(v10, "_inputType");
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (v35 - v36) >> 5;
      v40 = (PKStrokeGenerator *)v72;
      v41 = -[PKStrokePath initWithPoints:count:immutableCount:inputType:timestamp:UUID:](v34, "initWithPoints:count:immutableCount:inputType:timestamp:UUID:", v36, v39, v39, v37, v38, v27);

      v42 = objc_alloc((Class)objc_opt_class());
      objc_msgSend(v10, "ink");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v74[0] = *MEMORY[0x1E0C9BAA8];
      v74[1] = v44;
      v74[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v45 = (void *)objc_msgSend(v42, "initWithInk:strokePath:transform:mask:", v43, v41, v74, 0);

      if (v77)
      {
        v78 = v77;
        operator delete(v77);
      }
    }
    else
    {
      v40 = -[PKStrokeGenerator initWithStrokeNoiseSmoothing:]([PKStrokeGenerator alloc], "initWithStrokeNoiseSmoothing:", 0);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 192));
      v47 = objc_opt_respondsToSelector();

      if ((v47 & 1) != 0)
      {
        v48 = objc_loadWeakRetained((id *)(a1 + 192));
        v49 = objc_msgSend(v48, "shapeDrawingControllerMaximumSupportedContentVersion:", a1);

      }
      else
      {
        v49 = 3;
      }
      objc_msgSend(v10, "ink");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKStrokeGenerator setupForInk:maximumSupportedContentVersion:](v40, "setupForInk:maximumSupportedContentVersion:", v50, v49);

      -[PKStrokeGenerator setAdditionalRollAngle:](v40, "setAdditionalRollAngle:", 0.0);
      *(_QWORD *)(a3 + 104) = 0;
      if (v10)
      {
        objc_msgSend(v10, "path");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "count");
        if (v52)
        {
          v53 = 0;
          v54 = 0.0;
          do
          {
            v55 = 0.0;
            memset(buf, 0, sizeof(buf));
            if (v51)
            {
              objc_msgSend(v51, "decompressedPointAt:", v53);
              v55 = *(double *)&buf[56];
            }
            if (v53)
            {
              DKDMixAnglesInRadians(v54, v55, 1.0 / (double)(unint64_t)(v53 + 1));
              v55 = v56;
            }
            ++v53;
            v54 = v55;
          }
          while (v52 != v53);
        }
        else
        {
          v55 = 0.0;
        }
        *(long double *)(a3 + 24) = v55;

      }
      v57 = *a2;
      v58 = (((char *)a2[1] - (char *)*a2) >> 4) - 1;
      if (((char *)a2[1] - (char *)*a2) >> 4 == 1)
      {
        v62 = 0.0;
      }
      else
      {
        v61 = *v57;
        v60 = v57[1];
        v59 = v57 + 3;
        v62 = 0.0;
        do
        {
          v63 = *(v59 - 1);
          v64 = *v59;
          v62 = v62 + sqrt((v60 - *v59) * (v60 - *v59) + (v61 - v63) * (v61 - v63));
          v59 += 2;
          v60 = v64;
          v61 = v63;
          --v58;
        }
        while (v58);
      }
      *(double *)(a3 + 40) = v62 / (v22 * a5);
      v65 = *(_OWORD *)(a3 + 80);
      v73[4] = *(_OWORD *)(a3 + 64);
      v73[5] = v65;
      v66 = *(_OWORD *)(a3 + 112);
      v73[6] = *(_OWORD *)(a3 + 96);
      v73[7] = v66;
      v67 = *(_OWORD *)(a3 + 16);
      v73[0] = *(_OWORD *)a3;
      v73[1] = v67;
      v68 = *(_OWORD *)(a3 + 48);
      v73[2] = *(_OWORD *)(a3 + 32);
      v73[3] = v68;
      -[PKStrokeGenerator strokeFromPoints:sourceStroke:inputScale:averageInputPoint:](v40, "strokeFromPoints:sourceStroke:inputScale:averageInputPoint:", a2, v10, v73, a5);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v10, "_clipPlane");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "_setClipPlane:", v69);

  }
  return v45;
}

- (id)_generateLine:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(uint64_t *)a5 averageInputPoint:(double)a6 shapeTypeOut:
{
  id v11;
  id v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  CGPath *Mutable;
  double v23;
  CGFloat v24;
  CGFloat v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  double v38;
  void *v39;
  uint64_t v40;
  double v41;
  double v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  double v47;
  void *v48;
  _OWORD v50[8];
  _OWORD v51[8];
  _OWORD v52[8];
  double *v53;
  double *v54;
  uint64_t v55;

  v11 = a2;
  v12 = a3;
  v53 = 0;
  v54 = 0;
  v55 = 0;
  objc_msgSend(v11, "startLocation");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v11, "endLocation");
  v18 = v17;
  v20 = v19;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, v14, v16);
  objc_msgSend(v11, "controlPoint");
  v24 = v23;
  objc_msgSend(v11, "controlPoint");
  CGPathAddQuadCurveToPoint(Mutable, 0, v24, v25, v18, v20);
  PKPointsFromPath(Mutable, (const void **)&v53, a6 * 6.0, a6 * 0.1);
  CGPathRelease(Mutable);
  v26 = a4[5];
  v52[4] = a4[4];
  v52[5] = v26;
  v27 = a4[7];
  v52[6] = a4[6];
  v52[7] = v27;
  v28 = a4[1];
  v52[0] = *a4;
  v52[1] = v28;
  v29 = a4[3];
  v52[2] = a4[2];
  v52[3] = v29;
  -[PKShapeDrawingController _strokeFromPoints:inputScale:averageInputPoint:sourceStroke:](a1, &v53, (uint64_t)v52, v12, a6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
    objc_msgSend(v21, "addObject:", v30);
  if (objc_msgSend(v11, "startEndpointType") == 1)
  {
    v31 = -[PKShapeDrawingController _arrowRadiusForStroke:inputScale:](v12, a6);
    objc_msgSend(v11, "controlPoint");
    v33 = v32;
    v34 = a4[5];
    v51[4] = a4[4];
    v51[5] = v34;
    v35 = a4[7];
    v51[6] = a4[6];
    v51[7] = v35;
    v36 = a4[1];
    v51[0] = *a4;
    v51[1] = v36;
    v37 = a4[3];
    v51[2] = a4[2];
    v51[3] = v37;
    -[PKShapeDrawingController _arrowStrokesWithInputScale:firstPt:secondPt:radius:averageInputPoint:sourceStroke:](a1, v51, v12, a6, v14, v16, v38, v33, v31);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObjectsFromArray:", v39);

    v40 = 5;
  }
  else
  {
    v31 = 0.0;
    v40 = 6;
  }
  if (objc_msgSend(v11, "endEndpointType") == 1)
  {
    if (v31 == 0.0)
      v31 = -[PKShapeDrawingController _arrowRadiusForStroke:inputScale:](v12, a6);
    objc_msgSend(v11, "controlPoint");
    v42 = v41;
    v43 = a4[5];
    v50[4] = a4[4];
    v50[5] = v43;
    v44 = a4[7];
    v50[6] = a4[6];
    v50[7] = v44;
    v45 = a4[1];
    v50[0] = *a4;
    v50[1] = v45;
    v46 = a4[3];
    v50[2] = a4[2];
    v50[3] = v46;
    -[PKShapeDrawingController _arrowStrokesWithInputScale:firstPt:secondPt:radius:averageInputPoint:sourceStroke:](a1, v50, v12, a6, v18, v20, v47, v42, v31);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObjectsFromArray:", v48);

    v40 = 5;
  }
  if (a5)
    *a5 = v40;

  if (v53)
  {
    v54 = v53;
    operator delete(v53);
  }

  return v21;
}

- (double)aspectRatioAdjustedSizeFromResult:(void *)a1
{
  id v1;
  double v2;
  double v3;
  double v4;
  double v5;

  v1 = a1;
  objc_msgSend(v1, "size");
  if (v2 <= 0.0 || v3 <= 0.0)
  {
    v5 = *MEMORY[0x1E0C9D820];
  }
  else
  {
    v4 = 1.0;
    if (v2 / v3 >= 1.0)
    {
      v4 = v2 / v3;
      if (v2 / v3 > 1.0)
        v4 = 1.0;
    }
    v5 = (v2 + v3) * 0.5 * v4;
  }

  return v5;
}

- (id)_generatePentagon:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:
{
  id v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int v18;
  float64x2_t *v19;
  float64x2_t v20;
  double v21;
  __double2 v22;
  float64x2_t v23;
  float64x2_t *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  float64x2_t *v30;
  float64x2_t *v31;
  float64x2_t *v37;
  float64x2_t *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char *v43;
  float64x2_t *v44;
  char *v45;
  float64x2_t *v46;
  float64x2_t *v47;
  double *v48;
  double *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  void *v56;
  float64_t v58;
  float64x2_t v59;
  float64_t v60;
  float64x2_t v61;
  _OWORD v62[8];
  float64x2_t v63;
  CGAffineTransform v64;
  void *__p;
  float64x2_t *v66;
  float64x2_t *v67;
  double *v68;
  double *v69;
  uint64_t v70;
  _QWORD v71[3];

  v71[1] = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v12 = -[PKShapeDrawingController aspectRatioAdjustedSizeFromResult:](v9);
  v13 = 0;
  if (v12 > 0.0)
  {
    v14 = v11;
    if (v11 > 0.0)
    {
      v68 = 0;
      v69 = 0;
      v70 = 0;
      __p = 0;
      v66 = 0;
      v67 = 0;
      objc_msgSend(v9, "center");
      v58 = v16;
      v60 = v15;
      memset(&v64, 0, sizeof(v64));
      objc_msgSend(v9, "rotation");
      CGAffineTransformMakeRotation(&v64, v17 * 3.14159265 / 180.0);
      v18 = 0;
      v19 = v66;
      v20.f64[0] = v60;
      v20.f64[1] = v58;
      v61 = v20;
      v21 = 2.19911486;
      do
      {
        v22 = __sincos_stret(v21);
        v23 = vaddq_f64(v61, vaddq_f64(*(float64x2_t *)&v64.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v64.c, v14 * v22.__sinval * 0.5), *(float64x2_t *)&v64.a, v12 * v22.__cosval * 0.5)));
        if (v19 >= v67)
        {
          v59 = v23;
          v24 = (float64x2_t *)__p;
          v25 = ((char *)v19 - (_BYTE *)__p) >> 4;
          v26 = v25 + 1;
          if ((unint64_t)(v25 + 1) >> 60)
            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
          v27 = (char *)v67 - (_BYTE *)__p;
          if (((char *)v67 - (_BYTE *)__p) >> 3 > v26)
            v26 = v27 >> 3;
          if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF0)
            v28 = 0xFFFFFFFFFFFFFFFLL;
          else
            v28 = v26;
          if (v28)
          {
            v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v67, v28);
            v24 = (float64x2_t *)__p;
            v19 = v66;
          }
          else
          {
            v29 = 0;
          }
          v30 = (float64x2_t *)&v29[16 * v25];
          *v30 = v59;
          v31 = v30 + 1;
          if (v19 != v24)
          {
            do
            {
              v30[-1] = v19[-1];
              --v30;
              --v19;
            }
            while (v19 != v24);
            v24 = (float64x2_t *)__p;
          }
          __p = v30;
          v66 = v31;
          v67 = (float64x2_t *)&v29[16 * v28];
          if (v24)
            operator delete(v24);
          v19 = v31;
        }
        else
        {
          *v19++ = v23;
        }
        v66 = v19;
        v21 = v21 + 1.25663706;
        ++v18;
      }
      while (v18 != 5);
      __asm { FMOV            V2.2D, #0.5 }
      v63 = vmlaq_f64(vmulq_f64(v19[-1], _Q2), _Q2, *(float64x2_t *)__p);
      std::vector<CGPoint>::insert((uint64_t)&__p, (char *)__p, (char *)&v63);
      v37 = v66;
      if (v66 >= v67)
      {
        v39 = ((char *)v66 - (_BYTE *)__p) >> 4;
        v40 = v39 + 1;
        if ((unint64_t)(v39 + 1) >> 60)
          std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
        v41 = (char *)v67 - (_BYTE *)__p;
        if (((char *)v67 - (_BYTE *)__p) >> 3 > v40)
          v40 = v41 >> 3;
        if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFF0)
          v42 = 0xFFFFFFFFFFFFFFFLL;
        else
          v42 = v40;
        if (v42)
          v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v67, v42);
        else
          v43 = 0;
        v44 = (float64x2_t *)&v43[16 * v39];
        v45 = &v43[16 * v42];
        *v44 = v63;
        v38 = v44 + 1;
        v47 = (float64x2_t *)__p;
        v46 = v66;
        if (v66 != __p)
        {
          do
          {
            v44[-1] = v46[-1];
            --v44;
            --v46;
          }
          while (v46 != v47);
          v46 = (float64x2_t *)__p;
        }
        __p = v44;
        v66 = v38;
        v67 = (float64x2_t *)v45;
        if (v46)
          operator delete(v46);
      }
      else
      {
        *v66 = v63;
        v38 = v37 + 1;
      }
      v66 = v38;
      PKPointsFromLineSegments((uint64_t *)&__p, &v68, a5 * 6.0);
      if (objc_msgSend(v10, "_pathHasClockwisePointOrdering"))
      {
        if (v68 != v69)
        {
          v48 = v69 - 2;
          if (v69 - 2 > v68)
          {
            v49 = v68 + 2;
            do
            {
              v50 = *((_OWORD *)v49 - 1);
              *((_OWORD *)v49 - 1) = *(_OWORD *)v48;
              *(_OWORD *)v48 = v50;
              v48 -= 2;
              _CF = v49 >= v48;
              v49 += 2;
            }
            while (!_CF);
          }
        }
      }
      v51 = a4[5];
      v62[4] = a4[4];
      v62[5] = v51;
      v52 = a4[7];
      v62[6] = a4[6];
      v62[7] = v52;
      v53 = a4[1];
      v62[0] = *a4;
      v62[1] = v53;
      v54 = a4[3];
      v62[2] = a4[2];
      v62[3] = v54;
      -[PKShapeDrawingController _strokeFromPoints:inputScale:averageInputPoint:sourceStroke:](a1, &v68, (uint64_t)v62, v10, a5);
      v55 = objc_claimAutoreleasedReturnValue();
      v56 = (void *)v55;
      if (v55)
      {
        v71[0] = v55;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }

      if (__p)
      {
        v66 = (float64x2_t *)__p;
        operator delete(__p);
      }
      if (v68)
      {
        v69 = v68;
        operator delete(v68);
      }
    }
  }

  return v13;
}

- (id)_generateRectangle:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  double *v29;
  double *v30;
  unint64_t v31;
  double *v32;
  double *v33;
  double *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  double *v40;
  double *v41;
  double *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char *v47;
  char *v48;
  double *v49;
  double *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  char *v56;
  double *v57;
  double *v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char *v63;
  double *v64;
  double *v65;
  double *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char *v71;
  double *v72;
  char *v73;
  char *v74;
  char *v75;
  __int128 v76;
  BOOL v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  void *v83;
  void *v84;
  uint64_t v86;
  double v87;
  _OWORD v89[8];
  void *__p;
  double *v91;
  unint64_t v92;
  void *v93;
  char *v94;
  uint64_t v95;
  _QWORD v96[2];

  v96[1] = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v93 = 0;
  v94 = 0;
  v95 = 0;
  __p = 0;
  v92 = 0;
  objc_msgSend(v8, "lowerLeftPoint");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v8, "lowerRightPoint");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v8, "upperRightPoint");
  v19 = v18;
  v21 = v20;
  objc_msgSend(v8, "upperLeftPoint");
  v86 = v22;
  v24 = v23;
  v25 = v11 + (v15 - v11) * 0.5;
  v87 = v13 + (v17 - v13) * 0.5;
  v26 = 1;
  v27 = v92 - (_QWORD)__p;
  if ((unint64_t)((uint64_t)(v92 - (_QWORD)__p) >> 3) > 1)
    v26 = v27 >> 3;
  if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF0)
    v28 = 0xFFFFFFFFFFFFFFFLL;
  else
    v28 = v26;
  if (v28)
    v29 = (double *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v92, v28);
  else
    v29 = 0;
  v30 = v29;
  v31 = (unint64_t)&v29[2 * v28];
  *v30 = v25;
  v30[1] = v87;
  v32 = v30 + 2;
  __p = v30;
  v92 = v31;
  v91 = v30 + 2;
  if ((unint64_t)(v30 + 2) >= v31)
  {
    v34 = (double *)__p;
    v35 = ((char *)v32 - (_BYTE *)__p) >> 4;
    v36 = v35 + 1;
    if ((unint64_t)(v35 + 1) >> 60)
      goto LABEL_104;
    v37 = v31 - (_QWORD)__p;
    if (v37 >> 3 > v36)
      v36 = v37 >> 3;
    if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFF0)
      v38 = 0xFFFFFFFFFFFFFFFLL;
    else
      v38 = v36;
    if (v38)
    {
      v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v92, v38);
      v34 = (double *)__p;
      v32 = v91;
    }
    else
    {
      v39 = 0;
    }
    v40 = (double *)&v39[16 * v35];
    v31 = (unint64_t)&v39[16 * v38];
    *v40 = v15;
    v40[1] = v17;
    v33 = v40 + 2;
    if (v32 != v34)
    {
      do
      {
        *((_OWORD *)v40 - 1) = *((_OWORD *)v32 - 1);
        v40 -= 2;
        v32 -= 2;
      }
      while (v32 != v34);
      v34 = (double *)__p;
    }
    __p = v40;
    v91 = v33;
    v92 = v31;
    if (v34)
    {
      operator delete(v34);
      v31 = v92;
    }
  }
  else
  {
    *v32 = v15;
    v30[3] = v17;
    v33 = v30 + 4;
  }
  v91 = v33;
  if ((unint64_t)v33 >= v31)
  {
    v42 = (double *)__p;
    v43 = ((char *)v33 - (_BYTE *)__p) >> 4;
    v44 = v43 + 1;
    if ((unint64_t)(v43 + 1) >> 60)
      goto LABEL_104;
    v45 = v31 - (_QWORD)__p;
    if (v45 >> 3 > v44)
      v44 = v45 >> 3;
    if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFF0)
      v46 = 0xFFFFFFFFFFFFFFFLL;
    else
      v46 = v44;
    if (v46)
    {
      v47 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v92, v46);
      v42 = (double *)__p;
      v33 = v91;
    }
    else
    {
      v47 = 0;
    }
    v48 = &v47[16 * v43];
    v31 = (unint64_t)&v47[16 * v46];
    *(_QWORD *)v48 = v19;
    *((_QWORD *)v48 + 1) = v21;
    v41 = (double *)(v48 + 16);
    if (v33 != v42)
    {
      do
      {
        *((_OWORD *)v48 - 1) = *((_OWORD *)v33 - 1);
        v48 -= 16;
        v33 -= 2;
      }
      while (v33 != v42);
      v42 = (double *)__p;
    }
    __p = v48;
    v91 = v41;
    v92 = v31;
    if (v42)
    {
      operator delete(v42);
      v31 = v92;
    }
  }
  else
  {
    *(_QWORD *)v33 = v19;
    *((_QWORD *)v33 + 1) = v21;
    v41 = v33 + 2;
  }
  v91 = v41;
  if ((unint64_t)v41 >= v31)
  {
    v50 = (double *)__p;
    v51 = ((char *)v41 - (_BYTE *)__p) >> 4;
    v52 = v51 + 1;
    if ((unint64_t)(v51 + 1) >> 60)
      goto LABEL_104;
    v53 = v31 - (_QWORD)__p;
    if (v53 >> 3 > v52)
      v52 = v53 >> 3;
    if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFF0)
      v54 = 0xFFFFFFFFFFFFFFFLL;
    else
      v54 = v52;
    if (v54)
    {
      v55 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v92, v54);
      v50 = (double *)__p;
      v41 = v91;
    }
    else
    {
      v55 = 0;
    }
    v56 = &v55[16 * v51];
    v31 = (unint64_t)&v55[16 * v54];
    *(_QWORD *)v56 = v24;
    *((_QWORD *)v56 + 1) = v86;
    v49 = (double *)(v56 + 16);
    if (v41 != v50)
    {
      do
      {
        *((_OWORD *)v56 - 1) = *((_OWORD *)v41 - 1);
        v56 -= 16;
        v41 -= 2;
      }
      while (v41 != v50);
      v50 = (double *)__p;
    }
    __p = v56;
    v91 = v49;
    v92 = v31;
    if (v50)
    {
      operator delete(v50);
      v31 = v92;
    }
  }
  else
  {
    *(_QWORD *)v41 = v24;
    *((_QWORD *)v41 + 1) = v86;
    v49 = v41 + 2;
  }
  v91 = v49;
  if ((unint64_t)v49 >= v31)
  {
    v58 = (double *)__p;
    v59 = ((char *)v49 - (_BYTE *)__p) >> 4;
    v60 = v59 + 1;
    if ((unint64_t)(v59 + 1) >> 60)
      goto LABEL_104;
    v61 = v31 - (_QWORD)__p;
    if (v61 >> 3 > v60)
      v60 = v61 >> 3;
    if ((unint64_t)v61 >= 0x7FFFFFFFFFFFFFF0)
      v62 = 0xFFFFFFFFFFFFFFFLL;
    else
      v62 = v60;
    if (v62)
    {
      v63 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v92, v62);
      v58 = (double *)__p;
      v49 = v91;
    }
    else
    {
      v63 = 0;
    }
    v64 = (double *)&v63[16 * v59];
    v31 = (unint64_t)&v63[16 * v62];
    *v64 = v11;
    v64[1] = v13;
    v57 = v64 + 2;
    if (v49 != v58)
    {
      do
      {
        *((_OWORD *)v64 - 1) = *((_OWORD *)v49 - 1);
        v64 -= 2;
        v49 -= 2;
      }
      while (v49 != v58);
      v58 = (double *)__p;
    }
    __p = v64;
    v91 = v57;
    v92 = v31;
    if (v58)
    {
      operator delete(v58);
      v31 = v92;
    }
  }
  else
  {
    *v49 = v11;
    v49[1] = v13;
    v57 = v49 + 2;
  }
  v91 = v57;
  if ((unint64_t)v57 < v31)
  {
    *v57 = v25;
    v57[1] = v87;
    v65 = v57 + 2;
    goto LABEL_90;
  }
  v66 = (double *)__p;
  v67 = ((char *)v57 - (_BYTE *)__p) >> 4;
  v68 = v67 + 1;
  if ((unint64_t)(v67 + 1) >> 60)
LABEL_104:
    std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
  v69 = v31 - (_QWORD)__p;
  if (v69 >> 3 > v68)
    v68 = v69 >> 3;
  if ((unint64_t)v69 >= 0x7FFFFFFFFFFFFFF0)
    v70 = 0xFFFFFFFFFFFFFFFLL;
  else
    v70 = v68;
  if (v70)
  {
    v71 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v92, v70);
    v66 = (double *)__p;
    v57 = v91;
  }
  else
  {
    v71 = 0;
  }
  v72 = (double *)&v71[16 * v67];
  v73 = &v71[16 * v70];
  *v72 = v25;
  v72[1] = v87;
  v65 = v72 + 2;
  if (v57 != v66)
  {
    do
    {
      *((_OWORD *)v72 - 1) = *((_OWORD *)v57 - 1);
      v72 -= 2;
      v57 -= 2;
    }
    while (v57 != v66);
    v66 = (double *)__p;
  }
  __p = v72;
  v91 = v65;
  v92 = (unint64_t)v73;
  if (v66)
    operator delete(v66);
LABEL_90:
  v91 = v65;
  PKPointsFromLineSegments((uint64_t *)&__p, (double **)&v93, a5 * 6.0);
  if (objc_msgSend(v9, "_pathHasClockwisePointOrdering"))
  {
    if (v93 != v94)
    {
      v74 = v94 - 16;
      if (v94 - 16 > v93)
      {
        v75 = (char *)v93 + 16;
        do
        {
          v76 = *((_OWORD *)v75 - 1);
          *((_OWORD *)v75 - 1) = *(_OWORD *)v74;
          *(_OWORD *)v74 = v76;
          v74 -= 16;
          v77 = v75 >= v74;
          v75 += 16;
        }
        while (!v77);
      }
    }
  }
  v78 = a4[5];
  v89[4] = a4[4];
  v89[5] = v78;
  v79 = a4[7];
  v89[6] = a4[6];
  v89[7] = v79;
  v80 = a4[1];
  v89[0] = *a4;
  v89[1] = v80;
  v81 = a4[3];
  v89[2] = a4[2];
  v89[3] = v81;
  -[PKShapeDrawingController _strokeFromPoints:inputScale:averageInputPoint:sourceStroke:](a1, (double **)&v93, (uint64_t)v89, v9, a5);
  v82 = objc_claimAutoreleasedReturnValue();
  v83 = (void *)v82;
  if (v82)
  {
    v96[0] = v82;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 1);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v84 = 0;
  }

  if (__p)
  {
    v91 = (double *)__p;
    operator delete(__p);
  }
  if (v93)
  {
    v94 = (char *)v93;
    operator delete(v93);
  }

  return v84;
}

- (id)_generateOutlineArrow:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:
{
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  __int128 v24;
  CGPath *Mutable;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  void *v37;
  double v39;
  CGFloat x;
  double v41;
  _OWORD v42[8];
  CGAffineTransform v43;
  CGAffineTransform v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  CGAffineTransform m;
  double *v48;
  double *v49;
  uint64_t v50;
  _QWORD v51[2];
  CGRect v52;

  v51[1] = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  objc_msgSend(v9, "size");
  v13 = v12;
  v14 = 0;
  if (v12 > 0.0)
  {
    v15 = v11;
    if (v11 > 0.0)
    {
      v48 = 0;
      v49 = 0;
      v50 = 0;
      objc_msgSend(v9, "rotation");
      v17 = v16;
      objc_msgSend(v9, "center");
      v19 = v18;
      v21 = v20;
      objc_msgSend(v9, "controlPoint");
      x = v22;
      v41 = v23;
      v24 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&m.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&m.c = v24;
      *(_OWORD *)&m.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      *(_OWORD *)&v46.a = *(_OWORD *)&m.a;
      *(_OWORD *)&v46.c = v24;
      *(_OWORD *)&v46.tx = *(_OWORD *)&m.tx;
      CGAffineTransformTranslate(&m, &v46, v19, v21);
      v44 = m;
      CGAffineTransformRotate(&v45, &v44, v17 * -3.14159265 / 180.0);
      m = v45;
      v43 = v45;
      CGAffineTransformTranslate(&v45, &v43, -v19, -v21);
      m = v45;
      Mutable = CGPathCreateMutable();
      v39 = a5;
      v26 = v19 - v13 * 0.5;
      v27 = v15 * 0.5;
      v28 = v21 - v15 * 0.5;
      v52.origin.x = v26;
      v52.origin.y = v28;
      v52.size.width = v13;
      v52.size.height = v15;
      v29 = CGRectGetMaxY(v52) - v41;
      v30 = v15 + v29 * -2.0;
      v31 = v28 + v29 + v30 * 0.5;
      CGPathMoveToPoint(Mutable, &m, v26, v31);
      CGPathAddLineToPoint(Mutable, &m, v26, v30 * 0.5 + v31);
      CGPathAddLineToPoint(Mutable, &m, x, v41);
      CGPathAddLineToPoint(Mutable, &m, x, v41 - (v29 + v30));
      CGPathAddLineToPoint(Mutable, &m, v13 + v26, v27 + v28);
      CGPathAddLineToPoint(Mutable, &m, x, v41 + v29);
      CGPathAddLineToPoint(Mutable, &m, x, v41 - v30);
      CGPathAddLineToPoint(Mutable, &m, v26, v28 + v29);
      CGPathCloseSubpath(Mutable);
      PKPointsFromPath(Mutable, (const void **)&v48, v39 * 6.0, v39 * 0.1);
      CGPathRelease(Mutable);
      v32 = a4[5];
      v42[4] = a4[4];
      v42[5] = v32;
      v33 = a4[7];
      v42[6] = a4[6];
      v42[7] = v33;
      v34 = a4[1];
      v42[0] = *a4;
      v42[1] = v34;
      v35 = a4[3];
      v42[2] = a4[2];
      v42[3] = v35;
      -[PKShapeDrawingController _strokeFromPoints:inputScale:averageInputPoint:sourceStroke:](a1, &v48, (uint64_t)v42, v10, v39);
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = (void *)v36;
      if (v36)
      {
        v51[0] = v36;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }

      if (v48)
      {
        v49 = v48;
        operator delete(v48);
      }
    }
  }

  return v14;
}

- (id)_generateTriangle:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  double *v27;
  double *v28;
  unint64_t v29;
  double *v30;
  double *v31;
  double *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char *v37;
  double *v38;
  double *v39;
  double *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;
  char *v46;
  double *v47;
  double *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char *v53;
  double *v54;
  double *v55;
  double *v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char *v61;
  double *v62;
  char *v63;
  char *v64;
  char *v65;
  __int128 v66;
  BOOL v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  void *v73;
  void *v74;
  _OWORD v77[8];
  void *__p;
  double *v79;
  unint64_t v80;
  void *v81;
  char *v82;
  uint64_t v83;
  _QWORD v84[2];

  v84[1] = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v81 = 0;
  v82 = 0;
  v83 = 0;
  __p = 0;
  v80 = 0;
  objc_msgSend(v8, "vertex1");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v8, "vertex2");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v8, "vertex3");
  v19 = v18;
  v21 = v20;
  v22 = v11 + (v15 - v11) * 0.5;
  v23 = v13 + (v17 - v13) * 0.5;
  v24 = 1;
  v25 = v80 - (_QWORD)__p;
  if ((unint64_t)((uint64_t)(v80 - (_QWORD)__p) >> 3) > 1)
    v24 = v25 >> 3;
  if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF0)
    v26 = 0xFFFFFFFFFFFFFFFLL;
  else
    v26 = v24;
  if (v26)
    v27 = (double *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v80, v26);
  else
    v27 = 0;
  v28 = v27;
  v29 = (unint64_t)&v27[2 * v26];
  *v28 = v22;
  v28[1] = v23;
  v30 = v28 + 2;
  __p = v28;
  v80 = v29;
  v79 = v28 + 2;
  if ((unint64_t)(v28 + 2) >= v29)
  {
    v32 = (double *)__p;
    v33 = ((char *)v30 - (_BYTE *)__p) >> 4;
    v34 = v33 + 1;
    if ((unint64_t)(v33 + 1) >> 60)
      goto LABEL_88;
    v35 = v29 - (_QWORD)__p;
    if (v35 >> 3 > v34)
      v34 = v35 >> 3;
    if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF0)
      v36 = 0xFFFFFFFFFFFFFFFLL;
    else
      v36 = v34;
    if (v36)
    {
      v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v80, v36);
      v32 = (double *)__p;
      v30 = v79;
    }
    else
    {
      v37 = 0;
    }
    v38 = (double *)&v37[16 * v33];
    v29 = (unint64_t)&v37[16 * v36];
    *v38 = v15;
    v38[1] = v17;
    v31 = v38 + 2;
    if (v30 != v32)
    {
      do
      {
        *((_OWORD *)v38 - 1) = *((_OWORD *)v30 - 1);
        v38 -= 2;
        v30 -= 2;
      }
      while (v30 != v32);
      v32 = (double *)__p;
    }
    __p = v38;
    v79 = v31;
    v80 = v29;
    if (v32)
    {
      operator delete(v32);
      v29 = v80;
    }
  }
  else
  {
    *v30 = v15;
    v28[3] = v17;
    v31 = v28 + 4;
  }
  v79 = v31;
  if ((unint64_t)v31 >= v29)
  {
    v40 = (double *)__p;
    v41 = ((char *)v31 - (_BYTE *)__p) >> 4;
    v42 = v41 + 1;
    if ((unint64_t)(v41 + 1) >> 60)
      goto LABEL_88;
    v43 = v29 - (_QWORD)__p;
    if (v43 >> 3 > v42)
      v42 = v43 >> 3;
    if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFF0)
      v44 = 0xFFFFFFFFFFFFFFFLL;
    else
      v44 = v42;
    if (v44)
    {
      v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v80, v44);
      v40 = (double *)__p;
      v31 = v79;
    }
    else
    {
      v45 = 0;
    }
    v46 = &v45[16 * v41];
    v29 = (unint64_t)&v45[16 * v44];
    *(_QWORD *)v46 = v19;
    *((_QWORD *)v46 + 1) = v21;
    v39 = (double *)(v46 + 16);
    if (v31 != v40)
    {
      do
      {
        *((_OWORD *)v46 - 1) = *((_OWORD *)v31 - 1);
        v46 -= 16;
        v31 -= 2;
      }
      while (v31 != v40);
      v40 = (double *)__p;
    }
    __p = v46;
    v79 = v39;
    v80 = v29;
    if (v40)
    {
      operator delete(v40);
      v29 = v80;
    }
  }
  else
  {
    *(_QWORD *)v31 = v19;
    *((_QWORD *)v31 + 1) = v21;
    v39 = v31 + 2;
  }
  v79 = v39;
  if ((unint64_t)v39 >= v29)
  {
    v48 = (double *)__p;
    v49 = ((char *)v39 - (_BYTE *)__p) >> 4;
    v50 = v49 + 1;
    if ((unint64_t)(v49 + 1) >> 60)
      goto LABEL_88;
    v51 = v29 - (_QWORD)__p;
    if (v51 >> 3 > v50)
      v50 = v51 >> 3;
    if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFF0)
      v52 = 0xFFFFFFFFFFFFFFFLL;
    else
      v52 = v50;
    if (v52)
    {
      v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v80, v52);
      v48 = (double *)__p;
      v39 = v79;
    }
    else
    {
      v53 = 0;
    }
    v54 = (double *)&v53[16 * v49];
    v29 = (unint64_t)&v53[16 * v52];
    *v54 = v11;
    v54[1] = v13;
    v47 = v54 + 2;
    if (v39 != v48)
    {
      do
      {
        *((_OWORD *)v54 - 1) = *((_OWORD *)v39 - 1);
        v54 -= 2;
        v39 -= 2;
      }
      while (v39 != v48);
      v48 = (double *)__p;
    }
    __p = v54;
    v79 = v47;
    v80 = v29;
    if (v48)
    {
      operator delete(v48);
      v29 = v80;
    }
  }
  else
  {
    *v39 = v11;
    v39[1] = v13;
    v47 = v39 + 2;
  }
  v79 = v47;
  if ((unint64_t)v47 < v29)
  {
    *v47 = v22;
    v47[1] = v23;
    v55 = v47 + 2;
    goto LABEL_74;
  }
  v56 = (double *)__p;
  v57 = ((char *)v47 - (_BYTE *)__p) >> 4;
  v58 = v57 + 1;
  if ((unint64_t)(v57 + 1) >> 60)
LABEL_88:
    std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
  v59 = v29 - (_QWORD)__p;
  if (v59 >> 3 > v58)
    v58 = v59 >> 3;
  if ((unint64_t)v59 >= 0x7FFFFFFFFFFFFFF0)
    v60 = 0xFFFFFFFFFFFFFFFLL;
  else
    v60 = v58;
  if (v60)
  {
    v61 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v80, v60);
    v56 = (double *)__p;
    v47 = v79;
  }
  else
  {
    v61 = 0;
  }
  v62 = (double *)&v61[16 * v57];
  v63 = &v61[16 * v60];
  *v62 = v22;
  v62[1] = v23;
  v55 = v62 + 2;
  if (v47 != v56)
  {
    do
    {
      *((_OWORD *)v62 - 1) = *((_OWORD *)v47 - 1);
      v62 -= 2;
      v47 -= 2;
    }
    while (v47 != v56);
    v56 = (double *)__p;
  }
  __p = v62;
  v79 = v55;
  v80 = (unint64_t)v63;
  if (v56)
    operator delete(v56);
LABEL_74:
  v79 = v55;
  PKPointsFromLineSegments((uint64_t *)&__p, (double **)&v81, a5 * 6.0);
  if (objc_msgSend(v9, "_pathHasClockwisePointOrdering"))
  {
    if (v81 != v82)
    {
      v64 = v82 - 16;
      if (v82 - 16 > v81)
      {
        v65 = (char *)v81 + 16;
        do
        {
          v66 = *((_OWORD *)v65 - 1);
          *((_OWORD *)v65 - 1) = *(_OWORD *)v64;
          *(_OWORD *)v64 = v66;
          v64 -= 16;
          v67 = v65 >= v64;
          v65 += 16;
        }
        while (!v67);
      }
    }
  }
  v68 = a4[5];
  v77[4] = a4[4];
  v77[5] = v68;
  v69 = a4[7];
  v77[6] = a4[6];
  v77[7] = v69;
  v70 = a4[1];
  v77[0] = *a4;
  v77[1] = v70;
  v71 = a4[3];
  v77[2] = a4[2];
  v77[3] = v71;
  -[PKShapeDrawingController _strokeFromPoints:inputScale:averageInputPoint:sourceStroke:](a1, (double **)&v81, (uint64_t)v77, v9, a5);
  v72 = objc_claimAutoreleasedReturnValue();
  v73 = (void *)v72;
  if (v72)
  {
    v84[0] = v72;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 1);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v74 = 0;
  }

  if (__p)
  {
    v79 = (double *)__p;
    operator delete(__p);
  }
  if (v81)
  {
    v82 = (char *)v81;
    operator delete(v81);
  }

  return v74;
}

- (id)_generateManhattanLine:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  char *v47;
  char *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v57;
  void *v58;
  _OWORD v59[8];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  void *__p;
  char *v65;
  char *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v57 = a3;
  v58 = v9;
  v67 = 0;
  v68 = 0;
  v69 = 0;
  v66 = 0;
  objc_msgSend(v9, "startLocation");
  v11 = v10;
  v13 = v12;
  v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v66, 1uLL);
  *(_QWORD *)v14 = v11;
  *((_QWORD *)v14 + 1) = v13;
  __p = v14;
  v66 = &v14[16 * v15];
  v65 = v14 + 16;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  objc_msgSend(v9, "pathPoints");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = a1;
  v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v61 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * i), "CGPointValue");
        v23 = v21;
        v24 = v22;
        v25 = v65;
        if (v65 >= v66)
        {
          v27 = (char *)__p;
          v28 = (v65 - (_BYTE *)__p) >> 4;
          v29 = v28 + 1;
          if ((unint64_t)(v28 + 1) >> 60)
            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
          v30 = v66 - (_BYTE *)__p;
          if ((v66 - (_BYTE *)__p) >> 3 > v29)
            v29 = v30 >> 3;
          if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF0)
            v31 = 0xFFFFFFFFFFFFFFFLL;
          else
            v31 = v29;
          if (v31)
          {
            v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v66, v31);
            v27 = (char *)__p;
            v25 = v65;
          }
          else
          {
            v32 = 0;
          }
          v33 = &v32[16 * v28];
          *(_QWORD *)v33 = v23;
          *((_QWORD *)v33 + 1) = v24;
          v34 = v33;
          if (v25 != v27)
          {
            do
            {
              *((_OWORD *)v34 - 1) = *((_OWORD *)v25 - 1);
              v34 -= 16;
              v25 -= 16;
            }
            while (v25 != v27);
            v27 = (char *)__p;
          }
          v26 = v33 + 16;
          __p = v34;
          v65 = v33 + 16;
          v66 = &v32[16 * v31];
          if (v27)
            operator delete(v27);
        }
        else
        {
          *(_QWORD *)v65 = v21;
          *((_QWORD *)v25 + 1) = v22;
          v26 = v25 + 16;
        }
        v65 = v26;
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
    }
    while (v18);
  }

  objc_msgSend(v58, "endLocation");
  v37 = v35;
  v38 = v36;
  v39 = v65;
  if (v65 >= v66)
  {
    v41 = (char *)__p;
    v42 = (v65 - (_BYTE *)__p) >> 4;
    v43 = v42 + 1;
    if ((unint64_t)(v42 + 1) >> 60)
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    v44 = v66 - (_BYTE *)__p;
    if ((v66 - (_BYTE *)__p) >> 3 > v43)
      v43 = v44 >> 3;
    if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF0)
      v45 = 0xFFFFFFFFFFFFFFFLL;
    else
      v45 = v43;
    if (v45)
    {
      v46 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v66, v45);
      v41 = (char *)__p;
      v39 = v65;
    }
    else
    {
      v46 = 0;
    }
    v47 = &v46[16 * v42];
    v48 = &v46[16 * v45];
    *(_QWORD *)v47 = v37;
    *((_QWORD *)v47 + 1) = v38;
    v40 = v47 + 16;
    if (v39 != v41)
    {
      do
      {
        *((_OWORD *)v47 - 1) = *((_OWORD *)v39 - 1);
        v47 -= 16;
        v39 -= 16;
      }
      while (v39 != v41);
      v41 = (char *)__p;
    }
    __p = v47;
    v65 = v40;
    v66 = v48;
    if (v41)
      operator delete(v41);
  }
  else
  {
    *(_QWORD *)v65 = v35;
    *((_QWORD *)v39 + 1) = v36;
    v40 = v39 + 16;
  }
  v65 = v40;
  PKPointsFromLineSegments((uint64_t *)&__p, (double **)&v67, a5 * 6.0);
  v49 = a4[5];
  v59[4] = a4[4];
  v59[5] = v49;
  v50 = a4[7];
  v59[6] = a4[6];
  v59[7] = v50;
  v51 = a4[1];
  v59[0] = *a4;
  v59[1] = v51;
  v52 = a4[3];
  v59[2] = a4[2];
  v59[3] = v52;
  -[PKShapeDrawingController _strokeFromPoints:inputScale:averageInputPoint:sourceStroke:](v17, (double **)&v67, (uint64_t)v59, v57, a5);
  v53 = objc_claimAutoreleasedReturnValue();
  v54 = (void *)v53;
  if (v53)
  {
    v70 = v53;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v55 = 0;
  }

  if (__p)
  {
    v65 = (char *)__p;
    operator delete(__p);
  }
  if (v67)
  {
    v68 = v67;
    operator delete(v67);
  }

  return v55;
}

- (id)_generateHeart:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:
{
  id v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  uint64_t v18;
  const CGPath *v19;
  double *v20;
  double *v21;
  __int128 v22;
  BOOL v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  void *v29;
  _OWORD v31[8];
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGAffineTransform block;
  CGAffineTransform transform;
  double *v37;
  double *v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v12 = -[PKShapeDrawingController aspectRatioAdjustedSizeFromResult:](v9);
  v13 = 0;
  if (v12 > 0.0)
  {
    v14 = v11;
    if (v11 > 0.0)
    {
      v37 = 0;
      v38 = 0;
      v39 = 0;
      objc_msgSend(v9, "center");
      memset(&transform, 0, sizeof(transform));
      CGAffineTransformMakeTranslation(&transform, v15, v16);
      v34 = transform;
      objc_msgSend(v9, "rotation");
      CGAffineTransformRotate(&block, &v34, v17 * 3.14159265 / 180.0);
      transform = block;
      v33 = block;
      CGAffineTransformScale(&block, &v33, v12, v14);
      transform = block;
      v32 = block;
      CGAffineTransformTranslate(&block, &v32, -0.5, -0.5);
      transform = block;
      v18 = objc_opt_self();
      *(_QWORD *)&block.a = MEMORY[0x1E0C809B0];
      *(_QWORD *)&block.b = 3221225472;
      *(_QWORD *)&block.c = __48__PKShapeDrawingController__normalizedHeartPath__block_invoke;
      *(_QWORD *)&block.d = &__block_descriptor_40_e5_v8__0l;
      *(_QWORD *)&block.tx = v18;
      if (qword_1ECEE64D0 != -1)
        dispatch_once(&qword_1ECEE64D0, &block);
      v19 = CGPathCreateMutableCopyByTransformingPath((CGPathRef)qword_1ECEE64C8, &transform);
      PKPointsFromPath(v19, (const void **)&v37, a5 * 6.0, a5 * 0.1);
      CGPathRelease(v19);
      if ((objc_msgSend(v10, "_pathHasClockwisePointOrdering") & 1) == 0 && v37 != v38)
      {
        v20 = v38 - 2;
        if (v38 - 2 > v37)
        {
          v21 = v37 + 2;
          do
          {
            v22 = *((_OWORD *)v21 - 1);
            *((_OWORD *)v21 - 1) = *(_OWORD *)v20;
            *(_OWORD *)v20 = v22;
            v20 -= 2;
            v23 = v21 >= v20;
            v21 += 2;
          }
          while (!v23);
        }
      }
      v24 = a4[5];
      v31[4] = a4[4];
      v31[5] = v24;
      v25 = a4[7];
      v31[6] = a4[6];
      v31[7] = v25;
      v26 = a4[1];
      v31[0] = *a4;
      v31[1] = v26;
      v27 = a4[3];
      v31[2] = a4[2];
      v31[3] = v27;
      -[PKShapeDrawingController _strokeFromPoints:inputScale:averageInputPoint:sourceStroke:](a1, &v37, (uint64_t)v31, v10, a5);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v28;
      if (v28)
      {
        v40[0] = v28;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }

      if (v37)
      {
        v38 = v37;
        operator delete(v37);
      }
    }
  }

  return v13;
}

- (id)_generateCloud:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:
{
  id v9;
  id v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;
  uint64_t v29;
  CGPath *Mutable;
  uint64_t v31;
  uint64_t v32;
  const CGPath *v33;
  const CGPath *v34;
  char *v35;
  char *v36;
  __int128 v37;
  BOOL v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  void *v44;
  void *v46;
  _OWORD v47[8];
  CGAffineTransform v48;
  CGAffineTransform v49;
  CGAffineTransform v50;
  CGAffineTransform transform;
  void *__p;
  char *v53;
  uint64_t v54;
  CGAffineTransform v55;
  CGAffineTransform v56;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform m;
  CGAffineTransform v60;
  CGAffineTransform v61;
  CGAffineTransform v62;
  CGAffineTransform v63;
  _QWORD v64[3];

  v64[1] = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  __p = 0;
  v53 = 0;
  v54 = 0;
  objc_msgSend(v9, "center");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v9, "size");
  v17 = v16;
  v18 = 0;
  if (v16 > 0.0)
  {
    v19 = v15;
    if (v15 > 0.0)
    {
      v46 = v10;
      objc_msgSend(v9, "rotation");
      if (v19 <= v17)
        v21 = v19;
      else
        v21 = v17;
      if (v19 <= v17)
        v22 = v17;
      else
        v22 = v19;
      if (v19 <= v17)
        v23 = v20;
      else
        v23 = v20 + 90.0;
      objc_opt_self();
      v24 = v21 * 1.42857143;
      v25 = 1;
      if (v21 * 1.42857143 < v22)
      {
        v26 = 400.0;
        v27 = v21 * 1.42857143;
        while (1)
        {
          v26 = v26 + 80.0;
          v24 = v21 * (v26 / 280.0);
          if (v24 > v22 && v24 - v22 > v22 - v27)
            break;
          ++v25;
          v27 = v21 * (v26 / 280.0);
          if (v24 >= v22)
            goto LABEL_20;
        }
        v24 = v27;
      }
LABEL_20:
      memset(&transform, 0, sizeof(transform));
      CGAffineTransformMakeTranslation(&transform, v12, v14);
      v50 = transform;
      CGAffineTransformRotate(&v63, &v50, v23 * 3.14159265 / 180.0);
      transform = v63;
      v49 = v63;
      CGAffineTransformScale(&v63, &v49, v24, v21);
      transform = v63;
      v48 = v63;
      CGAffineTransformTranslate(&v63, &v48, -0.5, -0.5);
      transform = v63;
      v29 = objc_opt_self();
      Mutable = CGPathCreateMutable();
      memset(&v60, 0, sizeof(v60));
      CGAffineTransformMakeTranslation(&v60, 160.0, 0.0);
      objc_opt_self();
      CGPathAddArc(Mutable, 0, 137.5, 59.5, 55.5, -1.03876237, 2.87379342, 1);
      CGPathAddArc(Mutable, 0, 65.5, 136.0, 65.0, -1.26852383, 2.07935753, 1);
      CGPathAddArc(Mutable, 0, 70.0, 212.0, 41.0, -2.65976523, 1.03454926, 1);
      CGPathAddArc(Mutable, 0, 132.0, 232.0, 44.0, 2.78456263, 0.869410475, 1);
      v31 = v25;
      do
      {
        m = v60;
        objc_opt_self();
        CGPathAddArc(Mutable, &m, 40.0, 222.0, 58.0, 2.27242155, 0.869171107, 1);
        t1 = v60;
        CGAffineTransformMakeTranslation(&t2, 80.0, 0.0);
        CGAffineTransformConcat(&v63, &t1, &t2);
        v60 = v63;
        --v31;
      }
      while (v31);
      v56 = v60;
      objc_opt_self();
      v62 = v56;
      CGAffineTransformMakeTranslation(&v61, -240.0, 0.0);
      CGAffineTransformConcat(&v63, &v62, &v61);
      v56 = v63;
      CGPathAddArc(Mutable, &v56, 268.0, 232.0, 44.0, 2.2664888, 0.368228686, 1);
      CGPathAddArc(Mutable, &v56, 330.0, 212.0, 41.0, 2.09887078, -0.474399883, 1);
      CGPathAddArc(Mutable, &v56, 335.0, 136.0, 65.0, 1.05539318, -1.85885177, 1);
      CGPathAddArc(Mutable, &v56, 262.5, 59.5, 55.5, 0.279104812, -2.09669403, 1);
      v32 = 0;
      do
      {
        v62 = v60;
        CGAffineTransformMakeTranslation(&v61, -80.0, 0.0);
        CGAffineTransformConcat(&v63, &v62, &v61);
        v60 = v63;
        v55 = v63;
        objc_opt_self();
        CGPathAddArc(Mutable, &v55, 40.0, 58.0, 58.0, dbl_1BE4FEA10[v32 == 0], dbl_1BE4FEA20[v25 - 1 == v32], 1);
        ++v32;
      }
      while (v25 != v32);
      v33 = +[PKShapeDrawingController _createNormalizedPathFromPath:](v29, Mutable);
      CGPathRelease(Mutable);
      v10 = v46;
      v34 = CGPathCreateMutableCopyByTransformingPath(v33, &transform);
      CGPathRelease(v33);
      PKPointsFromPath(v34, (const void **)&__p, a5 * 6.0, a5 * 0.1);
      CGPathRelease(v34);
      if ((objc_msgSend(v46, "_pathHasClockwisePointOrdering") & 1) == 0 && __p != v53)
      {
        v35 = v53 - 16;
        if (v53 - 16 > __p)
        {
          v36 = (char *)__p + 16;
          do
          {
            v37 = *((_OWORD *)v36 - 1);
            *((_OWORD *)v36 - 1) = *(_OWORD *)v35;
            *(_OWORD *)v35 = v37;
            v35 -= 16;
            v38 = v36 >= v35;
            v36 += 16;
          }
          while (!v38);
        }
      }
      v39 = a4[5];
      v47[4] = a4[4];
      v47[5] = v39;
      v40 = a4[7];
      v47[6] = a4[6];
      v47[7] = v40;
      v41 = a4[1];
      v47[0] = *a4;
      v47[1] = v41;
      v42 = a4[3];
      v47[2] = a4[2];
      v47[3] = v42;
      -[PKShapeDrawingController _strokeFromPoints:inputScale:averageInputPoint:sourceStroke:](a1, (double **)&__p, (uint64_t)v47, v46, a5);
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = (void *)v43;
      if (v43)
      {
        v64[0] = v43;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }

      if (__p)
      {
        v53 = (char *)__p;
        operator delete(__p);
      }
    }
  }

  return v18;
}

- (id)_generateStar:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:
{
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPath *Mutable;
  double v17;
  int v18;
  double v19;
  __double2 v20;
  __double2 v21;
  __double2 v22;
  double c;
  double ty;
  double tx;
  double d;
  double v27;
  double v28;
  double *v29;
  double *v30;
  __int128 v31;
  BOOL v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  void *v38;
  double v40;
  double v41;
  double v42;
  double a;
  double b;
  double v45;
  double v46;
  double v47;
  _OWORD v48[8];
  CGAffineTransform v49;
  double *v50;
  double *v51;
  uint64_t v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = 0;
  v42 = -[PKShapeDrawingController aspectRatioAdjustedSizeFromResult:](v9) * 0.5;
  if (v42 > 0.0)
  {
    v41 = v12 * 0.5;
    if (v12 * 0.5 > 0.0)
    {
      v50 = 0;
      v51 = 0;
      v52 = 0;
      objc_msgSend(v9, "center", v12 * 0.5);
      v46 = v14;
      v47 = v13;
      memset(&v49, 0, sizeof(v49));
      objc_msgSend(v9, "rotation");
      CGAffineTransformMakeRotation(&v49, v15 * 3.14159265 / 180.0);
      Mutable = CGPathCreateMutable();
      v40 = a5;
      v17 = v42 * 0.4;
      v45 = v41 * 0.4;
      v18 = 5;
      v19 = -1.57079633;
      do
      {
        v20 = __sincos_stret(v19);
        v21 = __sincos_stret(v19 + -0.628318531);
        v22 = __sincos_stret(v19 + 0.628318531);
        c = v49.c;
        tx = v49.tx;
        ty = v49.ty;
        a = v49.a;
        b = v49.b;
        d = v49.d;
        v27 = v47 + v49.tx + v45 * v21.__sinval * v49.c + v49.a * (v17 * v21.__cosval);
        v28 = v46 + v49.ty + v45 * v21.__sinval * v49.d + v49.b * (v17 * v21.__cosval);
        if (v18 == 5)
          CGPathMoveToPoint(Mutable, 0, v27, v28);
        else
          CGPathAddLineToPoint(Mutable, 0, v27, v28);
        v17 = v42 * 0.4;
        CGPathAddLineToPoint(Mutable, 0, v47 + tx + v41 * v20.__sinval * c + a * (v42 * v20.__cosval), v46 + ty + v41 * v20.__sinval * d + b * (v42 * v20.__cosval));
        CGPathAddLineToPoint(Mutable, 0, v47 + tx + v45 * v22.__sinval * c + a * (v17 * v22.__cosval), v46 + ty + v45 * v22.__sinval * d + b * (v17 * v22.__cosval));
        v19 = v19 + 1.25663706;
        --v18;
      }
      while (v18);
      PKPointsFromPath(Mutable, (const void **)&v50, v40 * 6.0, v40 * 0.1);
      CGPathRelease(Mutable);
      if (objc_msgSend(v10, "_pathHasClockwisePointOrdering"))
      {
        if (v50 != v51)
        {
          v29 = v51 - 2;
          if (v51 - 2 > v50)
          {
            v30 = v50 + 2;
            do
            {
              v31 = *((_OWORD *)v30 - 1);
              *((_OWORD *)v30 - 1) = *(_OWORD *)v29;
              *(_OWORD *)v29 = v31;
              v29 -= 2;
              v32 = v30 >= v29;
              v30 += 2;
            }
            while (!v32);
          }
        }
      }
      v33 = a4[5];
      v48[4] = a4[4];
      v48[5] = v33;
      v34 = a4[7];
      v48[6] = a4[6];
      v48[7] = v34;
      v35 = a4[1];
      v48[0] = *a4;
      v48[1] = v35;
      v36 = a4[3];
      v48[2] = a4[2];
      v48[3] = v36;
      -[PKShapeDrawingController _strokeFromPoints:inputScale:averageInputPoint:sourceStroke:](a1, &v50, (uint64_t)v48, v10, v40);
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = (void *)v37;
      if (v37)
      {
        v53[0] = v37;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }

      if (v50)
      {
        v51 = v50;
        operator delete(v50);
      }
    }
  }

  return v11;
}

- (id)_generateChatBubble:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:
{
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  __int128 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  CGPath *Mutable;
  __double2 v33;
  double *v34;
  double *v35;
  __int128 v36;
  BOOL v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  void *v43;
  double v45;
  _OWORD v46[8];
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGAffineTransform v49;
  CGAffineTransform v50;
  CGAffineTransform v51;
  CGAffineTransform v52;
  CGAffineTransform m;
  double *v54;
  double *v55;
  uint64_t v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  objc_msgSend(v9, "size");
  v13 = v12;
  v14 = 0;
  if (v12 > 0.0)
  {
    v15 = v11;
    if (v11 > 0.0)
    {
      v45 = a5;
      v54 = 0;
      v55 = 0;
      v56 = 0;
      objc_msgSend(v9, "center");
      v17 = v16;
      v19 = v18;
      if (v13 >= v15)
        v20 = v15;
      else
        v20 = v13;
      v21 = v20 * 0.5;
      v22 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&m.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&m.c = v22;
      *(_OWORD *)&m.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      *(_OWORD *)&v52.a = *(_OWORD *)&m.a;
      *(_OWORD *)&v52.c = v22;
      *(_OWORD *)&v52.tx = *(_OWORD *)&m.tx;
      CGAffineTransformTranslate(&m, &v52, v17, v19);
      v50 = m;
      CGAffineTransformScale(&v51, &v50, v13 * 0.5 / v21, v15 * 0.5 / v21);
      m = v51;
      v49 = v51;
      CGAffineTransformTranslate(&v51, &v49, -v17, -v19);
      m = v51;
      objc_msgSend(v9, "stemLocation");
      v24 = v23;
      v26 = v25;
      objc_msgSend(v9, "stemWidth");
      v28 = v27;
      v47 = m;
      CGAffineTransformInvert(&v48, &v47);
      v29 = v48.tx + v26 * v48.c + v48.a * v24;
      v30 = v48.ty + v26 * v48.d + v48.b * v24;
      v31 = atan2(v30 - v19, v29 - v17);
      Mutable = CGPathCreateMutable();
      CGPathAddArc(Mutable, &m, v17, v19, v21, v31 + v28 * -0.5, v31 + v28 * 0.5, 1);
      CGPathAddLineToPoint(Mutable, &m, v29, v30);
      v33 = __sincos_stret(v31 + v28 * -0.5);
      CGPathAddLineToPoint(Mutable, &m, v17 + v33.__cosval * v21, v19 + v33.__sinval * v21);
      PKPointsFromPath(Mutable, (const void **)&v54, v45 * 6.0, v45 * 0.1);
      CGPathRelease(Mutable);
      if (objc_msgSend(v10, "_pathHasClockwisePointOrdering"))
      {
        if (v54 != v55)
        {
          v34 = v55 - 2;
          if (v55 - 2 > v54)
          {
            v35 = v54 + 2;
            do
            {
              v36 = *((_OWORD *)v35 - 1);
              *((_OWORD *)v35 - 1) = *(_OWORD *)v34;
              *(_OWORD *)v34 = v36;
              v34 -= 2;
              v37 = v35 >= v34;
              v35 += 2;
            }
            while (!v37);
          }
        }
      }
      v38 = a4[5];
      v46[4] = a4[4];
      v46[5] = v38;
      v39 = a4[7];
      v46[6] = a4[6];
      v46[7] = v39;
      v40 = a4[1];
      v46[0] = *a4;
      v46[1] = v40;
      v41 = a4[3];
      v46[2] = a4[2];
      v46[3] = v41;
      -[PKShapeDrawingController _strokeFromPoints:inputScale:averageInputPoint:sourceStroke:](a1, &v54, (uint64_t)v46, v10, v45);
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = (void *)v42;
      if (v42)
      {
        v57[0] = v42;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }

      if (v54)
      {
        v55 = v54;
        operator delete(v54);
      }
    }
  }

  return v14;
}

- (id)_generateOval:(void *)a3 sourceStroke:(_OWORD *)a4 inputScale:(double)a5 averageInputPoint:
{
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  const CGPath *v23;
  double *v24;
  double *v25;
  __int128 v26;
  BOOL v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  void *v33;
  _OWORD v35[8];
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform transform;
  double *v40;
  double *v41;
  uint64_t v42;
  _QWORD v43[2];
  CGRect v44;

  v43[1] = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  objc_msgSend(v9, "size");
  v13 = v12;
  v14 = 0;
  if (v12 > 0.0)
  {
    v15 = v11;
    if (v11 > 0.0)
    {
      v40 = 0;
      v41 = 0;
      v42 = 0;
      objc_msgSend(v9, "center");
      v17 = v16;
      v19 = v18;
      memset(&transform, 0, sizeof(transform));
      CGAffineTransformMakeTranslation(&transform, v16, v18);
      v37 = transform;
      objc_msgSend(v9, "rotation");
      CGAffineTransformRotate(&v38, &v37, v20 * 3.14159265 / 180.0);
      transform = v38;
      v36 = v38;
      CGAffineTransformTranslate(&v38, &v36, -v17, -v19);
      transform = v38;
      objc_msgSend(v9, "center");
      v44.origin.x = v21 - v13 * 0.5;
      v44.origin.y = v22 - v15 * 0.5;
      v44.size.width = v13;
      v44.size.height = v15;
      v23 = CGPathCreateWithEllipseInRect(v44, &transform);
      PKPointsFromPath(v23, (const void **)&v40, a5 * 6.0, a5 * 0.1);
      CGPathRelease(v23);
      if (objc_msgSend(v10, "_pathHasClockwisePointOrdering"))
      {
        if (v40 != v41)
        {
          v24 = v41 - 2;
          if (v41 - 2 > v40)
          {
            v25 = v40 + 2;
            do
            {
              v26 = *((_OWORD *)v25 - 1);
              *((_OWORD *)v25 - 1) = *(_OWORD *)v24;
              *(_OWORD *)v24 = v26;
              v24 -= 2;
              v27 = v25 >= v24;
              v25 += 2;
            }
            while (!v27);
          }
        }
      }
      v28 = a4[5];
      v35[4] = a4[4];
      v35[5] = v28;
      v29 = a4[7];
      v35[6] = a4[6];
      v35[7] = v29;
      v30 = a4[1];
      v35[0] = *a4;
      v35[1] = v30;
      v31 = a4[3];
      v35[2] = a4[2];
      v35[3] = v31;
      -[PKShapeDrawingController _strokeFromPoints:inputScale:averageInputPoint:sourceStroke:](a1, &v40, (uint64_t)v35, v10, a5);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = (void *)v32;
      if (v32)
      {
        v43[0] = v32;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }

      if (v40)
      {
        v41 = v40;
        operator delete(v40);
      }
    }
  }

  return v14;
}

- (uint64_t)_shapeTypeFromResultName:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("freeform")) & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("rectangle")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_27;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("triangle")) & 1) != 0)
    {
      v5 = 3;
      goto LABEL_27;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("oval")) & 1) != 0)
    {
      v5 = 1;
      goto LABEL_27;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("star")) & 1) != 0)
    {
      v5 = 8;
      goto LABEL_27;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("heart")) & 1) != 0)
    {
      v5 = 9;
      goto LABEL_27;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("chat bubble")) & 1) != 0)
    {
      v5 = 10;
      goto LABEL_27;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("pentagon")) & 1) != 0)
    {
      v5 = 4;
      goto LABEL_27;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("line")) & 1) != 0)
    {
      v5 = 6;
      goto LABEL_27;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("outline arrow")) & 1) != 0)
    {
      v5 = 11;
      goto LABEL_27;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("arrow")) & 1) != 0)
    {
      v5 = 5;
      goto LABEL_27;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("manhattan line")) & 1) != 0)
    {
      v5 = 7;
      goto LABEL_27;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("cloud")) & 1) != 0)
    {
      v5 = 12;
      goto LABEL_27;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("scratchout"))
      && _os_feature_enabled_impl()
      && (-[PKShapeDrawingController isScratchOutActive](a1) & 1) != 0)
    {
      v5 = 13;
      goto LABEL_27;
    }
  }
  v5 = 0;
LABEL_27:

  return v5;
}

- (id)shapeFromStroke:(_OWORD *)a3 inputScale:(void *)a4 averageInputPoint:(double)a5 allowedShapeTypes:
{
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  PKAveragePointGenerator *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  double v25;
  void *v26;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  uint64_t v31;
  unint64_t i;
  CGFloat v33;
  CGFloat v34;
  id v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  NSObject *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  NSObject *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  void *v58;
  int v59;
  int v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  void *v81;
  double v82;
  double v83;
  double v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  id WeakRetained;
  char v102;
  double v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  void *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  NSObject *v113;
  uint64_t v114;
  void *v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t j;
  void *v120;
  id v121;
  void *v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t k;
  void *v127;
  int v128;
  int v129;
  PKShape *v130;
  NSObject *v131;
  id v133;
  void *v134;
  void *v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  _OWORD v144[8];
  _OWORD v145[8];
  _OWORD v146[8];
  _OWORD v147[8];
  _OWORD v148[8];
  _OWORD v149[8];
  _OWORD v150[8];
  _OWORD v151[8];
  _OWORD v152[8];
  _OWORD v153[8];
  _OWORD v154[8];
  _OWORD v155[8];
  uint64_t v156;
  uint64_t v157;
  uint64_t *v158;
  uint64_t v159;
  uint64_t (*v160)(uint64_t, uint64_t);
  void (*v161)(uint64_t);
  id v162;
  _BYTE v163[128];
  _BYTE v164[128];
  void *v165;
  void *v166;
  __int128 block;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  uint64_t v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;

  v175 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v133 = a4;
  v135 = v9;
  if (!a1)
    goto LABEL_102;
  if (!memcmp(a3, &PKInputPointZero, 0x80uLL))
  {
    objc_msgSend(v9, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      objc_msgSend(v9, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timestampAtIndex:", 0);
      v14 = v13;

      objc_msgSend(v9, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timestampAtIndex:", objc_msgSend(v16, "count") - 1);
      v18 = v17;

      *(double *)(a1 + 152) = v18 - v14;
    }
    v19 = v9;
    v20 = objc_alloc_init(PKAveragePointGenerator);
    -[PKAveragePointGenerator addStroke:]((uint64_t)v20, v19);
    -[PKAveragePointGenerator currentInputPoint]((uint64_t)v20, (uint64_t)&block);

    v21 = v172;
    a3[4] = v171;
    a3[5] = v21;
    v22 = v174;
    a3[6] = v173;
    a3[7] = v22;
    v23 = v168;
    *a3 = block;
    a3[1] = v23;
    v24 = v170;
    a3[2] = v169;
    a3[3] = v24;
  }
  v156 = 0;
  if (*(_BYTE *)(a1 + 185))
  {
    v25 = 1.0;
    if (a5 <= 0.0)
    {
LABEL_16:
      v36 = v9;
      v37 = objc_alloc_init(MEMORY[0x1E0D16800]);
      v157 = 0;
      v158 = &v157;
      v159 = 0x2020000000;
      LOBYTE(v160) = 0;
      v38 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&block = MEMORY[0x1E0C809B0];
      *((_QWORD *)&block + 1) = 3221225472;
      *(_QWORD *)&v168 = __49__PKShapeDrawingController__chDrawingFromStroke___block_invoke;
      *((_QWORD *)&v168 + 1) = &unk_1E7779758;
      v39 = v37;
      *(_QWORD *)&v169 = v39;
      *((_QWORD *)&v169 + 1) = &v157;
      objc_msgSend(v36, "enumeratePointsWithTimestep:usingBlock:", &block, 0.00833333333);
      if (*((_BYTE *)v158 + 24))
      {
        objc_msgSend(v39, "endStroke");
        v40 = v39;
      }
      else
      {
        v40 = 0;
      }

      _Block_object_dispose(&v157, 8);
      v42 = v40;
      v157 = 0;
      v158 = &v157;
      v159 = 0x3032000000;
      v160 = __Block_byref_object_copy__32;
      v161 = __Block_byref_object_dispose__32;
      v162 = 0;
      if (qword_1ECEE64E0 != -1)
        dispatch_once(&qword_1ECEE64E0, &__block_literal_global_79);
      v43 = (id)qword_1ECEE64D8;
      *(_QWORD *)&block = v38;
      *((_QWORD *)&block + 1) = 3221225472;
      *(_QWORD *)&v168 = __57__PKShapeDrawingController_recognitionResultsForDrawing___block_invoke;
      *((_QWORD *)&v168 + 1) = &unk_1E777CFF8;
      *(_QWORD *)&v170 = &v157;
      *(_QWORD *)&v169 = a1;
      v44 = v42;
      *((_QWORD *)&v169 + 1) = v44;
      dispatch_sync(v43, &block);

      v45 = (id)v158[5];
      _Block_object_dispose(&v157, 8);

      a5 = v25;
      v41 = v45;
      goto LABEL_23;
    }
    objc_msgSend(v9, "_strokeData");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v31 = objc_msgSend(v26, "_pointsCount");
    if (v31)
    {
      for (i = 0; i != v31; ++i)
      {
        objc_msgSend(v26, "interpolatedLocationAt:", (double)i);
        v178.origin.x = v33;
        v178.origin.y = v34;
        v178.size.width = 0.0;
        v178.size.height = 0.0;
        v176.origin.x = x;
        v176.origin.y = y;
        v176.size.width = width;
        v176.size.height = height;
        v177 = CGRectUnion(v176, v178);
        x = v177.origin.x;
        y = v177.origin.y;
        width = v177.size.width;
        height = v177.size.height;
      }
    }

    if (1.0 / a5 * width > 4.0 || 1.0 / a5 * height > 4.0)
    {
      v25 = a5;
      goto LABEL_16;
    }
  }
  v41 = 0;
LABEL_23:
  v134 = v41;
  if (objc_msgSend(v41, "count"))
  {
    objc_msgSend(v134, "objectAtIndexedSubscript:", 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v134, "count") < 2)
    {
      v47 = 0;
    }
    else
    {
      objc_msgSend(v134, "objectAtIndexedSubscript:", 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v46, "string");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = -[PKShapeDrawingController _shapeTypeFromResultName:](a1, v48);

    if (v133
      && (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v156),
          v49 = (void *)objc_claimAutoreleasedReturnValue(),
          v50 = objc_msgSend(v133, "containsObject:", v49),
          v49,
          (v50 & 1) == 0))
    {
      v156 = 0;
    }
    else if (v156)
    {
      v51 = os_log_create("com.apple.pencilkit", "Actions");
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v46, "string");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(block) = 138412290;
        *(_QWORD *)((char *)&block + 4) = v52;
        _os_log_impl(&dword_1BE213000, v51, OS_LOG_TYPE_DEFAULT, "Shape recognized %@.", (uint8_t *)&block, 0xCu);

      }
      switch(v156)
      {
        case 1:
          v65 = a3[5];
          v153[4] = a3[4];
          v153[5] = v65;
          v66 = a3[7];
          v153[6] = a3[6];
          v153[7] = v66;
          v67 = a3[1];
          v153[0] = *a3;
          v153[1] = v67;
          v68 = a3[3];
          v153[2] = a3[2];
          v153[3] = v68;
          -[PKShapeDrawingController _generateOval:sourceStroke:inputScale:averageInputPoint:](a1, v46, v135, v153, a5);
          v57 = objc_claimAutoreleasedReturnValue();
          goto LABEL_72;
        case 2:
          v69 = a3[5];
          v155[4] = a3[4];
          v155[5] = v69;
          v70 = a3[7];
          v155[6] = a3[6];
          v155[7] = v70;
          v71 = a3[1];
          v155[0] = *a3;
          v155[1] = v71;
          v72 = a3[3];
          v155[2] = a3[2];
          v155[3] = v72;
          -[PKShapeDrawingController _generateRectangle:sourceStroke:inputScale:averageInputPoint:](a1, v46, v135, v155, a5);
          v57 = objc_claimAutoreleasedReturnValue();
          goto LABEL_72;
        case 3:
          v73 = a3[5];
          v154[4] = a3[4];
          v154[5] = v73;
          v74 = a3[7];
          v154[6] = a3[6];
          v154[7] = v74;
          v75 = a3[1];
          v154[0] = *a3;
          v154[1] = v75;
          v76 = a3[3];
          v154[2] = a3[2];
          v154[3] = v76;
          -[PKShapeDrawingController _generateTriangle:sourceStroke:inputScale:averageInputPoint:](a1, v46, v135, v154, a5);
          v57 = objc_claimAutoreleasedReturnValue();
          goto LABEL_72;
        case 4:
          v77 = a3[5];
          v149[4] = a3[4];
          v149[5] = v77;
          v78 = a3[7];
          v149[6] = a3[6];
          v149[7] = v78;
          v79 = a3[1];
          v149[0] = *a3;
          v149[1] = v79;
          v80 = a3[3];
          v149[2] = a3[2];
          v149[3] = v80;
          -[PKShapeDrawingController _generatePentagon:sourceStroke:inputScale:averageInputPoint:](a1, v46, v135, v149, a5);
          v57 = objc_claimAutoreleasedReturnValue();
          goto LABEL_72;
        case 5:
        case 6:
          v53 = a3[5];
          v148[4] = a3[4];
          v148[5] = v53;
          v54 = a3[7];
          v148[6] = a3[6];
          v148[7] = v54;
          v55 = a3[1];
          v148[0] = *a3;
          v148[1] = v55;
          v56 = a3[3];
          v148[2] = a3[2];
          v148[3] = v56;
          -[PKShapeDrawingController _generateLine:sourceStroke:inputScale:averageInputPoint:shapeTypeOut:](a1, v46, v135, v148, &v156, a5);
          v57 = objc_claimAutoreleasedReturnValue();
          goto LABEL_72;
        case 7:
          if ((unint64_t)objc_msgSend(v134, "count") < 2)
          {
            v84 = 100.0;
          }
          else
          {
            objc_msgSend(v134, "objectAtIndexedSubscript:", 1);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "score");
            v83 = v82;

            v84 = fabs(v83);
          }
          objc_msgSend(v46, "score");
          v58 = 0;
          if (fabs(v103) < 0.0001 && v84 > 2.0)
          {
            v104 = a3[5];
            v146[4] = a3[4];
            v146[5] = v104;
            v105 = a3[7];
            v146[6] = a3[6];
            v146[7] = v105;
            v106 = a3[1];
            v146[0] = *a3;
            v146[1] = v106;
            v107 = a3[3];
            v146[2] = a3[2];
            v146[3] = v107;
            -[PKShapeDrawingController _generateManhattanLine:sourceStroke:inputScale:averageInputPoint:](a1, v46, v135, v146, a5);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
          }
          if (v58 || !v47 || v84 >= 1.0)
            goto LABEL_73;
          objc_msgSend(v47, "string");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          v156 = -[PKShapeDrawingController _shapeTypeFromResultName:](a1, v108);

          if ((unint64_t)(v156 - 5) > 1)
            break;
          v109 = a3[5];
          v145[4] = a3[4];
          v145[5] = v109;
          v110 = a3[7];
          v145[6] = a3[6];
          v145[7] = v110;
          v111 = a3[1];
          v145[0] = *a3;
          v145[1] = v111;
          v112 = a3[3];
          v145[2] = a3[2];
          v145[3] = v112;
          -[PKShapeDrawingController _generateLine:sourceStroke:inputScale:averageInputPoint:shapeTypeOut:](a1, v47, v135, v145, &v156, a5);
          v57 = objc_claimAutoreleasedReturnValue();
          goto LABEL_72;
        case 8:
          v85 = a3[5];
          v152[4] = a3[4];
          v152[5] = v85;
          v86 = a3[7];
          v152[6] = a3[6];
          v152[7] = v86;
          v87 = a3[1];
          v152[0] = *a3;
          v152[1] = v87;
          v88 = a3[3];
          v152[2] = a3[2];
          v152[3] = v88;
          -[PKShapeDrawingController _generateStar:sourceStroke:inputScale:averageInputPoint:](a1, v46, v135, v152, a5);
          v57 = objc_claimAutoreleasedReturnValue();
          goto LABEL_72;
        case 9:
          v89 = a3[5];
          v151[4] = a3[4];
          v151[5] = v89;
          v90 = a3[7];
          v151[6] = a3[6];
          v151[7] = v90;
          v91 = a3[1];
          v151[0] = *a3;
          v151[1] = v91;
          v92 = a3[3];
          v151[2] = a3[2];
          v151[3] = v92;
          -[PKShapeDrawingController _generateHeart:sourceStroke:inputScale:averageInputPoint:](a1, v46, v135, v151, a5);
          v57 = objc_claimAutoreleasedReturnValue();
          goto LABEL_72;
        case 10:
          v93 = a3[5];
          v150[4] = a3[4];
          v150[5] = v93;
          v94 = a3[7];
          v150[6] = a3[6];
          v150[7] = v94;
          v95 = a3[1];
          v150[0] = *a3;
          v150[1] = v95;
          v96 = a3[3];
          v150[2] = a3[2];
          v150[3] = v96;
          -[PKShapeDrawingController _generateChatBubble:sourceStroke:inputScale:averageInputPoint:](a1, v46, v135, v150, a5);
          v57 = objc_claimAutoreleasedReturnValue();
          goto LABEL_72;
        case 11:
          v97 = a3[5];
          v147[4] = a3[4];
          v147[5] = v97;
          v98 = a3[7];
          v147[6] = a3[6];
          v147[7] = v98;
          v99 = a3[1];
          v147[0] = *a3;
          v147[1] = v99;
          v100 = a3[3];
          v147[2] = a3[2];
          v147[3] = v100;
          -[PKShapeDrawingController _generateOutlineArrow:sourceStroke:inputScale:averageInputPoint:](a1, v46, v135, v147, a5);
          v57 = objc_claimAutoreleasedReturnValue();
          goto LABEL_72;
        case 12:
          v61 = a3[5];
          v144[4] = a3[4];
          v144[5] = v61;
          v62 = a3[7];
          v144[6] = a3[6];
          v144[7] = v62;
          v63 = a3[1];
          v144[0] = *a3;
          v144[1] = v63;
          v64 = a3[3];
          v144[2] = a3[2];
          v144[3] = v64;
          -[PKShapeDrawingController _generateCloud:sourceStroke:inputScale:averageInputPoint:](a1, v46, v135, v144, a5);
          v57 = objc_claimAutoreleasedReturnValue();
          goto LABEL_72;
        case 13:
          if (!-[PKShapeDrawingController isScratchOutActive](a1))
            break;
          if ((unint64_t)objc_msgSend(v135, "_pointsCount") >= 0x3E9)
          {
            v113 = os_log_create("com.apple.pencilkit", "Actions");
            if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
            {
              v114 = objc_msgSend(v135, "_pointsCount");
              LODWORD(block) = 134217984;
              *(_QWORD *)((char *)&block + 4) = v114;
              _os_log_impl(&dword_1BE213000, v113, OS_LOG_TYPE_DEFAULT, "Scratch Out stroke has %lu points, cancelling due to too many.", (uint8_t *)&block, 0xCu);
            }

          }
          else
          {
            WeakRetained = objc_loadWeakRetained((id *)(a1 + 192));
            v102 = objc_msgSend(WeakRetained, "shapeDrawingController:scratchOutStrokesCoveredByStroke:", a1, v135);

            if ((v102 & 1) != 0)
              break;
          }
          v156 = 0;
          v166 = v135;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v166, 1);
          v57 = objc_claimAutoreleasedReturnValue();
LABEL_72:
          v58 = (void *)v57;
LABEL_73:

          if (v58)
            goto LABEL_74;
          goto LABEL_36;
        default:
          break;
      }
    }

  }
LABEL_36:
  v58 = 0;
  if (v135 && *(_BYTE *)(a1 + 184))
  {
    v59 = -[PKShapeDrawingController isScratchOutActive](a1);
    if (v156 == 13)
      v60 = 0;
    else
      v60 = v59;
    if (v60 == 1)
    {
      v165 = v135;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v165, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v58 = 0;
    }
  }
LABEL_74:
  if (objc_msgSend(v58, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(a1 + 216), v115);

    v142 = 0u;
    v143 = 0u;
    v140 = 0u;
    v141 = 0u;
    v116 = v58;
    v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v140, v164, 16);
    if (v117)
    {
      v118 = *(_QWORD *)v141;
      do
      {
        for (j = 0; j != v117; ++j)
        {
          if (*(_QWORD *)v141 != v118)
            objc_enumerationMutation(v116);
          v120 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * j);
          v121 = *(id *)(a1 + 216);
          objc_msgSend(v120, "_setGroupID:", v121);

          objc_msgSend(v120, "_setShapeType:", v156);
        }
        v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v140, v164, 16);
      }
      while (v117);
    }

    if ((unint64_t)objc_msgSend(v116, "count") >= 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v138 = 0u;
      v139 = 0u;
      v136 = 0u;
      v137 = 0u;
      v123 = v116;
      v124 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v136, v163, 16);
      if (v124)
      {
        v125 = *(_QWORD *)v137;
        do
        {
          for (k = 0; k != v124; ++k)
          {
            if (*(_QWORD *)v137 != v125)
              objc_enumerationMutation(v123);
            objc_msgSend(*(id *)(*((_QWORD *)&v136 + 1) + 8 * k), "_setRenderGroupID:", v122);
          }
          v124 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v136, v163, 16);
        }
        while (v124);
      }

    }
  }
  v127 = v134;
  if ((!objc_msgSend(v58, "count") || !v156)
    && ((v128 = -[PKShapeDrawingController isScratchOutActive](a1), v156 == 13) ? (v129 = v128) : (v129 = 0), v129 != 1)
    || (v130 = [PKShape alloc],
        (a1 = -[PKShape initWithShapeType:strokes:originalStroke:](v130, "initWithShapeType:strokes:originalStroke:", v156, v58, v135)) == 0))
  {
    v131 = os_log_create("com.apple.pencilkit", "Actions");
    if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(block) = 0;
      _os_log_impl(&dword_1BE213000, v131, OS_LOG_TYPE_DEFAULT, "Shape recognized <none>.", (uint8_t *)&block, 2u);
    }

    a1 = 0;
    v127 = v134;
  }

LABEL_102:
  return (id)a1;
}

- (id)detectedShapeWithInputScale:(void *)a3 averageInputPoint:(void *)a4 allowedShapeTypes:(double)a5 createCurrentStrokeBlock:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD v22[8];

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 185) || *(_QWORD *)(a1 + 208)) && (*(_BYTE *)(a1 + 64) || *(_BYTE *)(a1 + 65)))
    {
      (*((void (**)(id))v10 + 2))(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "renderBounds");
      if (v14 * a5 < 10.0 && v13 * a5 < 10.0 || v12 == 0)
      {
        a1 = 0;
      }
      else
      {
        v17 = a2[5];
        v22[4] = a2[4];
        v22[5] = v17;
        v18 = a2[7];
        v22[6] = a2[6];
        v22[7] = v18;
        v19 = a2[1];
        v22[0] = *a2;
        v22[1] = v19;
        v20 = a2[3];
        v22[2] = a2[2];
        v22[3] = v20;
        -[PKShapeDrawingController shapeFromStroke:inputScale:averageInputPoint:allowedShapeTypes:](a1, v12, v22, v9, a5);
        a1 = objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      a1 = 0;
    }
  }

  return (id)a1;
}

- (void)_addAngles:(_QWORD *)a1
{
  double v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  __int128 v27;

  if (a1)
  {
    v4 = CACurrentMediaTime();
    v6 = a1[12];
    v5 = a1[13];
    if (v6 == v5 || *(double *)(v5 - 8) < v4 + -0.1)
    {
      v7 = v5 - v6;
      if (v5 - v6 >= 0x121)
      {
        v8 = a1[12];
        do
        {
          v9 = v5 - (v6 + 32);
          if (v5 != v6 + 32)
          {
            memmove((void *)v6, (const void *)(v6 + 32), v5 - (v6 + 32));
            v8 = a1[12];
          }
          v5 = v6 + v9;
          a1[13] = v6 + v9;
          v7 = v6 + v9 - v8;
          v6 = v8;
        }
        while (v7 > 0x120);
        v6 = v8;
      }
      v11 = a2[3];
      v10 = a2[4];
      v12 = a2[13];
      v13 = a1[14];
      if (v5 >= v13)
      {
        v15 = v7 >> 5;
        v16 = (v7 >> 5) + 1;
        v17 = v13 - v6;
        v18 = (uint64_t)(v13 - v6) >> 4;
        if (v18 <= v16)
          v19 = v15 + 1;
        else
          v19 = v18;
        if (v17 >= 0x7FFFFFFFFFFFFFE0)
          v20 = 0x7FFFFFFFFFFFFFFLL;
        else
          v20 = v19;
        v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TimestampedAngles>>(v20);
        v22 = &v21[32 * v15];
        v24 = &v21[32 * v23];
        *(_QWORD *)v22 = v11;
        *((_QWORD *)v22 + 1) = v10;
        *((_QWORD *)v22 + 2) = v12;
        *((double *)v22 + 3) = v4;
        v14 = v22 + 32;
        v26 = (char *)a1[12];
        v25 = (char *)a1[13];
        if (v25 != v26)
        {
          do
          {
            v27 = *((_OWORD *)v25 - 1);
            *((_OWORD *)v22 - 2) = *((_OWORD *)v25 - 2);
            *((_OWORD *)v22 - 1) = v27;
            v22 -= 32;
            v25 -= 32;
          }
          while (v25 != v26);
          v25 = (char *)a1[12];
        }
        a1[12] = v22;
        a1[13] = v14;
        a1[14] = v24;
        if (v25)
          operator delete(v25);
      }
      else
      {
        *(_QWORD *)v5 = v11;
        *(_QWORD *)(v5 + 8) = v10;
        v14 = (char *)(v5 + 32);
        *(_QWORD *)(v5 + 16) = v12;
        *(double *)(v5 + 24) = v4;
      }
      a1[13] = v14;
    }
  }
}

- (void)_addCurrentStrokePoint:(CGFloat)a3
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  __int128 v19;
  double v20;
  double *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  unint64_t v26;
  double *v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  double *v32;
  uint64_t v33;
  char *v34;
  double *v35;
  double *v36;
  __int128 v37;
  CGRect v38;

  if (a1)
  {
    v38.size.width = 1.0;
    v38.size.height = 1.0;
    v38.origin.x = a2;
    v38.origin.y = a3;
    *(CGRect *)(a1 + 32) = CGRectUnion(*(CGRect *)(a1 + 32), v38);
    v6 = *(_QWORD *)(a1 + 24);
    v7 = (int)(a2 * 100.0);
    v8 = (int)(a3 * 100.0);
    v9 = *(char **)(a1 + 16);
    if ((unint64_t)v9 >= v6)
    {
      v11 = *(char **)(a1 + 8);
      v12 = 0xAAAAAAAAAAAAAAABLL * ((v9 - v11) >> 3);
      v13 = v12 + 1;
      if (v12 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
      v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v6 - (_QWORD)v11) >> 3);
      if (2 * v14 > v13)
        v13 = 2 * v14;
      if (v14 >= 0x555555555555555)
        v15 = 0xAAAAAAAAAAAAAAALL;
      else
        v15 = v13;
      if (v15)
      {
        v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>(a1 + 24, v15);
        v11 = *(char **)(a1 + 8);
        v9 = *(char **)(a1 + 16);
      }
      else
      {
        v16 = 0;
      }
      v17 = &v16[24 * v12];
      v18 = &v16[24 * v15];
      *(_QWORD *)v17 = v7;
      *((_QWORD *)v17 + 1) = v8;
      *((_QWORD *)v17 + 2) = 0x3F800000BF800000;
      v10 = v17 + 24;
      if (v9 != v11)
      {
        do
        {
          v19 = *(_OWORD *)(v9 - 24);
          *((_QWORD *)v17 - 1) = *((_QWORD *)v9 - 1);
          *(_OWORD *)(v17 - 24) = v19;
          v17 -= 24;
          v9 -= 24;
        }
        while (v9 != v11);
        v11 = *(char **)(a1 + 8);
      }
      *(_QWORD *)(a1 + 8) = v17;
      *(_QWORD *)(a1 + 16) = v10;
      *(_QWORD *)(a1 + 24) = v18;
      if (v11)
        operator delete(v11);
    }
    else
    {
      *(_QWORD *)v9 = v7;
      *((_QWORD *)v9 + 1) = v8;
      *((_QWORD *)v9 + 2) = 0x3F800000BF800000;
      v10 = v9 + 24;
    }
    *(_QWORD *)(a1 + 16) = v10;
    v20 = CACurrentMediaTime();
    v22 = *(_QWORD *)(a1 + 72);
    v21 = *(double **)(a1 + 80);
    if ((double *)v22 == v21 || *(v21 - 1) < v20 + -0.1)
    {
      v23 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v21 - v22) >> 3);
      if (v23 >= 0xA)
      {
        v24 = *(_QWORD *)(a1 + 72);
        do
        {
          v25 = (char *)v21 - v22 - 24;
          if (v21 != (double *)(v22 + 24))
          {
            memmove((void *)v22, (const void *)(v22 + 24), (size_t)v21 - v22 - 24);
            v24 = *(_QWORD *)(a1 + 72);
          }
          v21 = (double *)&v25[v22];
          *(_QWORD *)(a1 + 80) = &v25[v22];
          v23 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v25[v22 - v24] >> 3);
          v22 = v24;
        }
        while (v23 > 9);
        v22 = v24;
      }
      v26 = *(_QWORD *)(a1 + 88);
      if ((unint64_t)v21 >= v26)
      {
        v28 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v26 - v22) >> 3);
        if (2 * v28 <= v23 + 1)
          v29 = v23 + 1;
        else
          v29 = 2 * v28;
        if (v28 >= 0x555555555555555)
          v30 = 0xAAAAAAAAAAAAAAALL;
        else
          v30 = v29;
        v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::LocalMinimum>>(v30);
        v32 = (double *)&v31[24 * v23];
        v34 = &v31[24 * v33];
        *v32 = a2;
        v32[1] = a3;
        v32[2] = v20;
        v27 = v32 + 3;
        v36 = *(double **)(a1 + 72);
        v35 = *(double **)(a1 + 80);
        if (v35 != v36)
        {
          do
          {
            v37 = *(_OWORD *)(v35 - 3);
            *(v32 - 1) = *(v35 - 1);
            *(_OWORD *)(v32 - 3) = v37;
            v32 -= 3;
            v35 -= 3;
          }
          while (v35 != v36);
          v35 = *(double **)(a1 + 72);
        }
        *(_QWORD *)(a1 + 72) = v32;
        *(_QWORD *)(a1 + 80) = v27;
        *(_QWORD *)(a1 + 88) = v34;
        if (v35)
          operator delete(v35);
      }
      else
      {
        *v21 = a2;
        v21[1] = a3;
        v27 = v21 + 3;
        v21[2] = v20;
      }
      *(_QWORD *)(a1 + 80) = v27;
    }
  }
}

- (void)beginStrokeAtPoint:(CGFloat)a3
{
  void *v6;
  _OWORD *v7;
  __int128 v8;
  CFTimeInterval v9;

  if (a1)
  {
    v6 = *(void **)(a1 + 200);
    *(_QWORD *)(a1 + 200) = 0;

    -[PKAveragePointGenerator reset](*(_QWORD *)(a1 + 120));
    *(_QWORD *)(a1 + 128) = 0;
    *(_WORD *)(a1 + 64) = 0;
    v7 = (_OWORD *)MEMORY[0x1E0C9D628];
    *(_BYTE *)(a1 + 66) = 0;
    v8 = v7[1];
    *(_OWORD *)(a1 + 32) = *v7;
    *(_OWORD *)(a1 + 48) = v8;
    std::vector<ClipperLib::IntPoint>::resize(a1 + 8, 0);
    -[PKShapeDrawingController _addCurrentStrokePoint:](a1, a2, a3);
    v9 = CACurrentMediaTime();
    *(CFTimeInterval *)(a1 + 136) = v9;
    *(CFTimeInterval *)(a1 + 144) = v9;
    *(_QWORD *)(a1 + 152) = 0;
    *(_BYTE *)(a1 + 67) = 1;
  }
}

- (void)addStrokePoint:(CGFloat)a3 inputPoint:(CGFloat)a4
{
  uint64_t *v5;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  double v21;
  id WeakRetained;
  double v23;
  CGFloat v24;
  _OWORD v25[8];
  _OWORD v26[8];

  if (a1)
  {
    v5 = (uint64_t *)(a1 + 8);
    if (*(_QWORD *)(a1 + 16) != *(_QWORD *)(a1 + 8))
    {
      v9 = a2[5];
      v25[4] = a2[4];
      v25[5] = v9;
      v10 = a2[7];
      v25[6] = a2[6];
      v25[7] = v10;
      v11 = a2[1];
      v25[0] = *a2;
      v25[1] = v11;
      v12 = a2[3];
      v25[2] = a2[2];
      v25[3] = v12;
      -[PKShapeDrawingController _addAngles:]((_QWORD *)a1, v25);
      v13 = *(_QWORD *)(a1 + 16);
      v14 = sqrt((a4 - (double)(*(_QWORD *)(v13 - 16) / 100)) * (a4 - (double)(*(_QWORD *)(v13 - 16) / 100))+ (a3 - (double)(*(_QWORD *)(v13 - 24) / 100)) * (a3 - (double)(*(_QWORD *)(v13 - 24) / 100)));
      v15 = 10.0;
      if (!*(_QWORD *)(a1 + 200))
        v15 = 2.0;
      if (v14 > v15)
      {
        -[PKShapeDrawingController _addCurrentStrokePoint:](a1, a3, a4);
        v16 = *(_QWORD *)(a1 + 120);
        v17 = a2[5];
        v26[4] = a2[4];
        v26[5] = v17;
        v18 = a2[7];
        v26[6] = a2[6];
        v26[7] = v18;
        v19 = a2[1];
        v26[0] = *a2;
        v26[1] = v19;
        v20 = a2[3];
        v26[2] = a2[2];
        v26[3] = v20;
        -[PKAveragePointGenerator addInputPoint:](v16, (long double *)v26);
        ++*(_QWORD *)(a1 + 128);
        v21 = CACurrentMediaTime();
        if (*(_QWORD *)(a1 + 200))
        {
          WeakRetained = objc_loadWeakRetained((id *)(a1 + 192));
          objc_msgSend(WeakRetained, "shapeDrawingControllerShapeDetectionCancelled:", a1);

          *(double *)(a1 + 136) = v21;
          v23 = v21;
        }
        else
        {
          v23 = *(double *)(a1 + 136);
        }
        *(double *)(a1 + 144) = v21;
        if (v21 - v23 > 0.3)
        {
          v24 = a3 - (double)(*(_QWORD *)*v5 / 100);
          if (sqrt((a4 - (double)(*(_QWORD *)(*v5 + 8) / 100)) * (a4 - (double)(*(_QWORD *)(*v5 + 8) / 100))+ v24 * v24) < 20.0&& fabs(ClipperLib::Area(v5)) / 10000.0 > 500.0)
          {
            *(_BYTE *)(a1 + 64) = 1;
          }
        }
      }
      -[PKShapeDrawingController _checkDetectedStroke](a1);
    }
  }
}

- (void)_checkDetectedStroke
{
  id v2;
  uint64_t *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  _BOOL8 v14;
  id WeakRetained;
  id v16;

  if (a1)
  {
    v2 = *(id *)(a1 + 200);
    if (v2)
    {

    }
    else if (*(_BYTE *)(a1 + 67))
    {
      v3 = *(uint64_t **)(a1 + 8);
      v4 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 16) - (_QWORD)v3) >> 3);
      if (v4 >= 2)
      {
        v5 = v4 - 1;
        if (v5)
        {
          v8 = *v3;
          v7 = v3[1];
          v6 = v3 + 4;
          v9 = 0.0;
          do
          {
            v10 = *(v6 - 1);
            v11 = *v6;
            v12 = (double)(v8 / 100) - (double)(v10 / 100);
            v9 = v9
               + sqrt(((double)(v7 / 100) - (double)(*v6 / 100)) * ((double)(v7 / 100) - (double)(*v6 / 100)) + v12 * v12);
            v6 += 3;
            v7 = v11;
            v8 = v10;
            --v5;
          }
          while (v5);
          if (v9 >= 10.0)
          {
            v13 = CACurrentMediaTime();
            if (v13 - *(double *)(a1 + 136) > 0.2)
            {
              if (*(_BYTE *)(a1 + 186))
                v14 = *(_BYTE *)(a1 + 66) == 0;
              else
                v14 = 0;
              if (*(_BYTE *)(a1 + 185))
              {
                if (-[PKShapeDrawingController hasMovementStopped](a1))
                {
                  *(_BYTE *)(a1 + 65) = 1;
                  *(double *)(a1 + 152) = *(double *)(a1 + 152) + v13 - *(double *)(a1 + 136);
                  WeakRetained = objc_loadWeakRetained((id *)(a1 + 192));
                  objc_msgSend(WeakRetained, "shapeDrawingControllerShapeGestureDetected:isFastGesture:", a1, v14);

                  *(_BYTE *)(a1 + 66) = 1;
                }
              }
              else if (*(_BYTE *)(a1 + 64) && -[PKShapeDrawingController hasMovementStopped](a1))
              {
                *(double *)(a1 + 152) = *(double *)(a1 + 152) + v13 - *(double *)(a1 + 136);
                v16 = objc_loadWeakRetained((id *)(a1 + 192));
                objc_msgSend(v16, "shapeDrawingControllerShapeGestureDetected:isFastGesture:", a1, v14);

                *(_BYTE *)(a1 + 66) = 1;
              }
            }
          }
        }
      }
    }
  }
}

- (void)resetStroke
{
  __int128 v2;
  void *v3;

  if (a1)
  {
    *(_BYTE *)(a1 + 67) = 0;
    std::vector<TimestampedPoint>::resize(a1 + 72, 0);
    std::vector<TimestampedAngles>::resize(a1 + 96, 0);
    v2 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(a1 + 32) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(a1 + 48) = v2;
    std::vector<ClipperLib::IntPoint>::resize(a1 + 8, 0);
    v3 = *(void **)(a1 + 200);
    *(_QWORD *)(a1 + 200) = 0;

  }
}

- (uint64_t)hasMovementStopped
{
  double v2;
  double v3;
  double v4;
  double v5;
  double *v6;
  double v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double *v14;
  unint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  long double v28;
  long double v29;
  double *v30;
  long double v31;
  long double v32;
  long double v33;
  double v34;
  long double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  _BOOL4 v42;
  uint64_t v43;
  double v44;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  uint8_t buf[4];
  double v55;
  __int16 v56;
  _BOOL4 v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v2 = CACurrentMediaTime();
  v3 = 0.0;
  v4 = 0.0;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 80) - *(_QWORD *)(a1 + 72)) >> 3) >= 2)
  {
    v5 = CACurrentMediaTime();
    v6 = *(double **)(a1 + 72);
    v7 = v6[2];
    v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 80) - (_QWORD)v6) >> 3);
    v4 = 0.0;
    v9 = 0.0;
    v10 = v7;
    if (v8 != 1)
    {
      v11 = v5 - *(double *)(a1 + 160);
      v9 = 0.0;
      v10 = v6[2];
      if (v6[5] <= v11)
      {
        v12 = v6[3];
        v9 = sqrt((v6[4] - v6[1]) * (v6[4] - v6[1]) + (v12 - *v6) * (v12 - *v6));
        if (v8 == 2 || (v13 = v6[8], v13 > v11))
        {
          v10 = v6[5];
        }
        else
        {
          v14 = v6 + 6;
          v15 = v8 - 2;
          do
          {
            v16 = v12;
            v10 = v13;
            v12 = *v14;
            v9 = v9 + sqrt((v14[1] - *(v14 - 2)) * (v14[1] - *(v14 - 2)) + (*v14 - v16) * (*v14 - v16));
            if (!--v15)
              break;
            v13 = v14[5];
            v14 += 3;
          }
          while (v13 <= v11);
        }
      }
    }
    if (v10 - v7 > 0.0)
    {
      v17 = v9 / (v10 - v7);
      if (v17 >= 0.0)
      {
        v4 = v9 / (v10 - v7);
        if (v17 > 400.0)
          v4 = 400.0;
      }
    }
  }
  v19 = *(_QWORD *)(a1 + 96);
  v18 = *(_QWORD *)(a1 + 104);
  v20 = v18 - v19;
  if ((unint64_t)(v18 - v19) >= 0x21)
  {
    v21 = *(double *)(v19 + 24);
    v22 = *(double *)(v18 - 24);
    v3 = 0.0;
    v23 = 0.0;
    v24 = 0.0;
    v25 = 0.0;
    v26 = v21;
    v27 = (v20 >> 5) - 1;
    if (v20 >> 5 != 1)
    {
      v50 = *(double *)(v19 + 24);
      v51 = *(double *)(v18 - 24);
      v52 = v4;
      v53 = v2;
      v28 = *(double *)v19;
      v29 = *(double *)(v19 + 8);
      v30 = (double *)(v19 + 48);
      v31 = *(double *)(v19 + 16);
      do
      {
        v32 = *(v30 - 2);
        v33 = *(v30 - 1);
        v34 = *v30;
        v30 += 4;
        v35 = v34;
        DKDDiffAngleInRadians(v28, v32);
        if (v36 < 0.0)
          v36 = -v36;
        v25 = v25 + v36;
        DKDDiffAngleInRadians(v29, v33);
        if (v37 < 0.0)
          v37 = -v37;
        v24 = v24 + v37;
        DKDDiffAngleInRadians(v31, v35);
        if (v38 < 0.0)
          v38 = -v38;
        v23 = v23 + v38;
        v31 = v35;
        v29 = v33;
        v28 = v32;
        --v27;
      }
      while (v27);
      v26 = *(double *)(v20 + v19 - 8);
      v4 = v52;
      v2 = v53;
      v3 = 0.0;
      v21 = v50;
      v22 = v51;
    }
    v39 = v26 - v21;
    if (v39 > 0.0)
    {
      v3 = v24 / v39;
      if (v22 > 0.15)
      {
        v40 = v23 / v39;
        v41 = v25 / v39;
        if (v3 >= v41)
          v41 = v3;
        if (v41 >= v40)
          v3 = v41;
        else
          v3 = v40;
      }
    }
  }
  if (*(_BYTE *)(a1 + 186))
  {
    v42 = *(_BYTE *)(a1 + 66) == 0;
    v43 = 168;
    if (!*(_BYTE *)(a1 + 66))
      v43 = 176;
  }
  else
  {
    v42 = 0;
    v43 = 168;
  }
  if (v2 - *(double *)(a1 + 136) <= 0.3)
    return 0;
  v44 = (v4 / -400.0 + 1.0) * *(double *)(a1 + v43) + *(double *)(a1 + 160) * (1.0 - (v4 / -400.0 + 1.0));
  if (v2 - *(double *)(a1 + 144) <= v44 || v3 >= 0.5)
    return 0;
  _PKSignpostLog();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v47))
  {
    *(_DWORD *)buf = 134218240;
    v55 = v44;
    v56 = 1024;
    v57 = v42;
    _os_signpost_emit_with_name_impl(&dword_1BE213000, v47, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ShapeRecognition", "%.2fs delay, fast:%d", buf, 0x12u);
  }

  v48 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE213000, v48, OS_LOG_TYPE_INFO, "DISCRETE \"ShapeRecognition\", buf, 2u);
  }

  v49 = os_log_create("com.apple.pencilkit", "Actions");
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v55 = v44;
    v56 = 1024;
    v57 = v42;
    _os_log_impl(&dword_1BE213000, v49, OS_LOG_TYPE_DEFAULT, "Shape recognition triggered with %.2fs delay, fast:%d", buf, 0x12u);
  }

  return 1;
}

+ (uint64_t)hasSnapToShapeEntitlement
{
  objc_opt_self();
  if (qword_1ECEE64F8 != -1)
    dispatch_once(&qword_1ECEE64F8, &__block_literal_global_97);
  return _MergedGlobals_151;
}

void __53__PKShapeDrawingController_hasSnapToShapeEntitlement__block_invoke()
{
  __SecTask *v0;
  __SecTask *v1;
  id v2;

  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    v1 = v0;
    v2 = (id)SecTaskCopyValueForEntitlement(v0, CFSTR("com.apple.PencilKit.allowsSnapToShape"), 0);
    _MergedGlobals_151 = objc_msgSend(v2, "BOOLValue");
    CFRelease(v1);

  }
}

- (void)setDetectedShape:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 200), a2);
}

- (void).cxx_destruct
{
  TimestampedAngles *begin;
  TimestampedPoint *v4;
  IntPoint *v5;

  objc_storeStrong((id *)&self->_shapeRecognizer, 0);
  objc_storeStrong((id *)&self->_smartFillGroupID, 0);
  objc_storeStrong((id *)&self->_smartFillRenderMask, 0);
  objc_storeStrong((id *)&self->_detectedShape, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_averageInputPointGenerator, 0);
  begin = self->_timestampedAngles.__begin_;
  if (begin)
  {
    self->_timestampedAngles.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_timestampedPoints.__begin_;
  if (v4)
  {
    self->_timestampedPoints.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_currentStrokePoints.__begin_;
  if (v5)
  {
    self->_currentStrokePoints.__end_ = v5;
    operator delete(v5);
  }
}

@end
