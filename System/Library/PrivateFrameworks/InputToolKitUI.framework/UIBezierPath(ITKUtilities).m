@implementation UIBezierPath(ITKUtilities)

- (uint64_t)itk_CGPath
{
  return objc_msgSend(objc_retainAutorelease(a1), "CGPath");
}

- (void)itk_appendRect:()ITKUtilities
{
  void *v2;
  id v3;

  +[ITKQuad quadFromCGRect:](ITKQuad, "quadFromCGRect:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "itk_appendBezierPath:", v2);

}

- (void)itk_appendBezierPath:()ITKUtilities
{
  id v4;

  v4 = a3;
  if (v4 && (objc_msgSend(v4, "isEmpty") & 1) == 0)
    objc_msgSend(a1, "appendPath:", v4);

}

- (double)itk_centroid
{
  void *v1;
  unint64_t v2;
  unint64_t v3;
  double v4;
  double v5;
  uint64_t v6;
  unint64_t v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  objc_msgSend(a1, "itk_allPoints");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count");
  v3 = v2;
  v4 = *MEMORY[0x24BDBEFB0];
  v5 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  if (v2 >= 3)
  {
    v6 = 0;
    v7 = v2 - 1;
    v8 = 0.0;
    do
    {
      objc_msgSend(v1, "objectAtIndexedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "itk_pointValue");
      v11 = v10;
      v13 = v12;

      if (v7 == v6)
        v14 = 0;
      else
        v14 = v6 + 1;
      objc_msgSend(v1, "objectAtIndexedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "itk_pointValue");
      v17 = v16;
      v19 = v18;
      ++v6;

      ITKCrossPoints();
      v4 = v4 + (v11 + v17) * v20;
      v5 = v5 + (v13 + v19) * v20;
      v8 = v8 + v20 * 0.5;
    }
    while (v3 != v6);
    ITKMultiplyPointScalar();
    if (v21 >= 0.0)
      v4 = v21;
    else
      v4 = -v21;
  }

  return v4;
}

- (double)itk_lengthIgnoringCurves
{
  const CGPath *v1;
  double v2;
  _QWORD block[7];
  _QWORD v5[6];
  __int128 v6;
  _QWORD v7[6];
  __int128 v8;
  uint64_t v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x2020000000;
  v12 = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x4012000000;
  v7[3] = __Block_byref_object_copy_;
  v7[4] = __Block_byref_object_dispose_;
  v7[5] = &unk_23F102635;
  v8 = *MEMORY[0x24BE51E38];
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x4012000000;
  v5[3] = __Block_byref_object_copy_;
  v5[4] = __Block_byref_object_dispose_;
  v5[5] = &unk_23F102635;
  v6 = *MEMORY[0x24BE51E38];
  v1 = (const CGPath *)objc_msgSend(a1, "itk_CGPath");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__UIBezierPath_ITKUtilities__itk_lengthIgnoringCurves__block_invoke;
  block[3] = &unk_250FA0DB0;
  block[4] = v5;
  block[5] = v7;
  block[6] = &v9;
  CGPathApplyWithBlock(v1, block);
  v2 = v10[3];
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(v7, 8);
  _Block_object_dispose(&v9, 8);
  return v2;
}

- (uint64_t)itk_allPoints
{
  return objc_msgSend((id)objc_opt_class(), "itk_allPointsFromCGPath:", objc_msgSend(a1, "itk_CGPath"));
}

+ (id)itk_allPointsFromCGPath:()ITKUtilities
{
  id v4;
  id v5;
  _QWORD block[4];
  id v8;

  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__UIBezierPath_ITKUtilities__itk_allPointsFromCGPath___block_invoke;
  block[3] = &unk_250FA0DD8;
  v5 = v4;
  v8 = v5;
  CGPathApplyWithBlock(a3, block);

  return v5;
}

- (uint64_t)itk_applyTransform:()ITKUtilities
{
  __int128 v3;
  _OWORD v5[3];

  v3 = a3[1];
  v5[0] = *a3;
  v5[1] = v3;
  v5[2] = a3[2];
  return objc_msgSend(a1, "applyTransform:", v5);
}

- (id)itk_pathFromFlippingInRect:()ITKUtilities
{
  id v10;
  const CGPath *v11;
  id v12;
  _QWORD block[4];
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v10 = objc_alloc_init(MEMORY[0x24BEBD420]);
  v11 = (const CGPath *)objc_msgSend(a1, "itk_CGPath");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__UIBezierPath_ITKUtilities__itk_pathFromFlippingInRect___block_invoke;
  block[3] = &unk_250FA0E00;
  v12 = v10;
  v15 = v12;
  v16 = a2;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  CGPathApplyWithBlock(v11, block);

  return v12;
}

- (id)debugQuickLookObject
{
  id v1;
  double v2;
  CGFloat v3;
  _BYTE *v4;
  CGAffineTransform *v5;
  CGFloat v6;
  double v7;
  _BYTE v9[48];
  _BYTE v10[48];

  v1 = a1;
  objc_msgSend(v1, "bounds");
  if (v2 < 2.0)
  {
    v3 = 150.0;
    v4 = v10;
    v5 = (CGAffineTransform *)v10;
    v6 = 150.0;
LABEL_5:
    CGAffineTransformMakeScale(v5, v3, v6);
    objc_msgSend(v1, "itk_applyTransform:", v4);
    return v1;
  }
  objc_msgSend(v1, "bounds");
  v3 = 20.0;
  if (v7 < 20.0)
  {
    v4 = v9;
    v5 = (CGAffineTransform *)v9;
    v6 = 20.0;
    goto LABEL_5;
  }
  return v1;
}

- (uint64_t)itk_subpathArray
{
  return objc_msgSend((id)objc_opt_class(), "itk_subpathArrayFromCGPath:", objc_msgSend(a1, "itk_CGPath"));
}

+ (id)itk_subpathArrayFromCGPath:()ITKUtilities
{
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;

  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__8;
  v12[4] = __Block_byref_object_dispose__9;
  v13 = objc_alloc_init(MEMORY[0x24BEBD420]);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__UIBezierPath_ITKUtilities__itk_subpathArrayFromCGPath___block_invoke;
  v9[3] = &unk_250FA0E28;
  v11 = v12;
  v5 = v4;
  v10 = v5;
  CGPathApplyWithBlock(a3, v9);
  v6 = v10;
  v7 = v5;

  _Block_object_dispose(v12, 8);
  return v7;
}

- (id)itk_pathByFittingToRect:()ITKUtilities
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v21;
  CGAffineTransform v22;

  objc_msgSend(a1, "bounds");
  ITKCenterOfRect();
  v3 = v2;
  v5 = v4;
  ITKCenterOfRect();
  v7 = v6;
  v9 = v8;
  ITKSizeRatioFromSizes();
  v11 = v10;
  v13 = v12;
  memset(&v22, 0, sizeof(v22));
  CGAffineTransformMakeTranslation(&v22, -v3, -v5);
  t1 = v22;
  CGAffineTransformMakeScale(&t2, v11, v13);
  CGAffineTransformConcat(&v21, &t1, &t2);
  v22 = v21;
  v18 = v21;
  CGAffineTransformMakeTranslation(&v17, v7, v9);
  CGAffineTransformConcat(&v21, &v18, &v17);
  v22 = v21;
  v14 = (void *)objc_msgSend(a1, "copy");
  v16 = v22;
  objc_msgSend(v14, "itk_applyTransform:", &v16);
  objc_msgSend(v14, "bounds");
  if ((ITKNearlyEqualRects() & 1) == 0)
    objc_msgSend(MEMORY[0x24BE51EB8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "ITKNearlyEqualRects(endBounds, result.bounds)", "-[UIBezierPath(ITKUtilities) itk_pathByFittingToRect:]", 0, 0, CFSTR("path itk_transformToFitRect did not give a correct result"));
  return v14;
}

- (id)itk_unionAndFlattenWithPath:()ITKUtilities
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isEmpty") & 1) == 0)
  {
    objc_msgSend(a1, "_itk_flattenWithPath:clipType:", v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)itk_intersectAndFlattenWithPath:()ITKUtilities
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isEmpty") & 1) == 0)
  {
    objc_msgSend(a1, "_itk_flattenWithPath:clipType:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_itk_flattenWithPath:()ITKUtilities clipType:
{
  id v6;
  id v7;
  void *v8;
  const CGPath *v9;
  uint64_t *v10;
  const CGPath *v11;
  uint64_t *v12;
  const CGPath *v13;
  const CGPath *v14;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  void **v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *__p;
  void *v25;
  _QWORD v26[7];
  void *v27;
  uint64_t v28[3];

  v6 = a3;
  memset(v28, 0, sizeof(v28));
  ClipperLib::Clipper::Clipper((ClipperLib::Clipper *)&v19, 0);
  v7 = a1;
  if (v6 && (objc_msgSend(v6, "isEmpty") & 1) == 0)
  {
    memset(&v18, 0, sizeof(v18));
    CGAffineTransformMakeScale(&v18, 10000.0, 10000.0);
    if ((objc_msgSend(v7, "isEmpty") & 1) == 0)
    {
      v9 = (const CGPath *)MEMORY[0x24266546C](objc_msgSend(v7, "itk_CGPath"), &v18);
      v10 = ITKClipperPathsFromCGPath(v9, 1.0);
      ClipperLib::ClipperBase::AddPaths((uint64_t)&v19 + (_QWORD)*(v19 - 3), v10, 0, 1);
      CGPathRelease(v9);
      *(_QWORD *)&v17.a = v10;
      std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v17);
      MEMORY[0x242665874](v10, 0x20C40960023A9);
    }
    v11 = (const CGPath *)MEMORY[0x24266546C](objc_msgSend(v6, "itk_CGPath"), &v18);
    v12 = ITKClipperPathsFromCGPath(v11, 1.0);
    ClipperLib::ClipperBase::AddPaths((uint64_t)&v19 + (_QWORD)*(v19 - 3), v12, 1, 1);
    CGPathRelease(v11);
    *(_QWORD *)&v17.a = v12;
    std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v17);
    MEMORY[0x242665874](v12, 0x20C40960023A9);
    ClipperLib::Clipper::Execute((uint64_t)&v19, a4, v28, 0);
    v13 = (const CGPath *)objc_msgSend((id)objc_opt_class(), "_cgPathFromClipperPath:", v28);
    v16 = v18;
    memset(&v17, 0, sizeof(v17));
    CGAffineTransformInvert(&v17, &v16);
    v14 = (const CGPath *)MEMORY[0x24266546C](v13, &v17);
    CGPathRelease(v13);
    objc_msgSend(MEMORY[0x24BEBD420], "itk_pathFromCGPath:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    CGPathRelease(v14);
  }
  else
  {
    v8 = v7;
  }
  v19 = (void **)&off_250FA1278;
  v27 = &unk_250FA12C0;
  std::__list_imp<long long>::clear(v26);
  if (__p)
  {
    v25 = __p;
    operator delete(__p);
  }
  if (v22)
  {
    v23 = v22;
    operator delete(v22);
  }
  if (v20)
  {
    v21 = v20;
    operator delete(v20);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v27);
  v19 = (void **)v28;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v19);

  return v8;
}

- (id)itk_expandWithOffset:()ITKUtilities
{
  const CGPath *v3;
  void *v4;
  uint64_t *v5;
  uint64_t *v6;
  const CGPath *v7;
  uint64_t v9[33];
  void **v10;

  v3 = (const CGPath *)objc_msgSend(a1, "itk_CGPath");
  if ((objc_msgSend((id)objc_opt_class(), "itk_cgPathcontainsAnyCurveToPoints:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = ITKClipperPathsFromCGPath(v3, 1.0);
    v6 = (uint64_t *)operator new();
    std::vector<std::vector<ClipperLib::IntPoint>>::vector(v6, 4uLL);
    ClipperLib::ClipperOffset::ClipperOffset((ClipperLib::ClipperOffset *)v9, 2.0, 0.25);
    ClipperLib::ClipperOffset::AddPaths((uint64_t)v9, v5, 2, 0);
    ClipperLib::ClipperOffset::Execute(v9, v6, a2);
    v7 = (const CGPath *)objc_msgSend((id)objc_opt_class(), "_cgPathFromClipperPath:", v6);
    v10 = (void **)v6;
    std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v10);
    MEMORY[0x242665874](v6, 0x20C40960023A9);
    v10 = (void **)v5;
    std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v10);
    MEMORY[0x242665874](v5, 0x20C40960023A9);
    objc_msgSend(MEMORY[0x24BEBD420], "itk_pathFromCGPath:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CGPathRelease(v7);
    ClipperLib::ClipperOffset::~ClipperOffset((ClipperLib::ClipperOffset *)v9);
  }
  return v4;
}

+ (id)itk_groupAndRoundPaths:()ITKUtilities radius:offset:
{
  id v8;
  uint64_t v9;
  id v10;
  uint64_t *v11;
  const CGPath *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  void *v17;
  double v18;
  uint64_t v19[33];
  _QWORD v20[5];
  void **v21;
  void ***v22;
  uint64_t v23;
  __n128 (*v24)(uint64_t, uint64_t);
  void (*v25)(_QWORD *);
  void *v26;
  uint64_t (**v27)(ClipperLib::Clipper *__hidden);
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *__p;
  void *v33;
  _QWORD v34[7];
  void *v35;
  uint64_t v36[3];
  _QWORD v37[5];
  void **v38;

  v8 = a5;
  v9 = MEMORY[0x24BDAC760];
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __67__UIBezierPath_ITKUtilities__itk_groupAndRoundPaths_radius_offset___block_invoke;
  v37[3] = &__block_descriptor_40_e29_B32__0__UIBezierPath_8Q16_B24l;
  v37[4] = a1;
  if ((objc_msgSend(v8, "itk_containsObjectPassingTest:", v37) & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    memset(v36, 0, sizeof(v36));
    v21 = 0;
    v22 = &v21;
    v23 = 0x15012000000;
    v24 = __Block_byref_object_copy__15;
    v25 = __Block_byref_object_dispose__16;
    v26 = &unk_23F102635;
    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __67__UIBezierPath_ITKUtilities__itk_groupAndRoundPaths_radius_offset___block_invoke_18;
    v20[3] = &unk_250FA0E70;
    v20[4] = &v21;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v20, ClipperLib::Clipper::Clipper((ClipperLib::Clipper *)&v27, 0));
    ClipperLib::Clipper::Execute((uint64_t)(v22 + 6), 1, v36, 0);
    v11 = (uint64_t *)operator new();
    std::vector<std::vector<ClipperLib::IntPoint>>::vector(v11, 4uLL);
    ClipperLib::ClipperOffset::ClipperOffset((ClipperLib::ClipperOffset *)v19, 2.0, 0.25);
    ClipperLib::ClipperOffset::AddPaths((uint64_t)v19, v36, 2, 0);
    ClipperLib::ClipperOffset::Execute(v19, v11, a3);
    v12 = (const CGPath *)objc_msgSend(a1, "_cgPathFromClipperPath:", v11);
    v38 = (void **)v11;
    std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v38);
    MEMORY[0x242665874](v11, 0x20C40960023A9);
    objc_msgSend(a1, "itk_subpathArrayFromCGPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CGPathRelease(v12);
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __67__UIBezierPath_ITKUtilities__itk_groupAndRoundPaths_radius_offset___block_invoke_2;
    v15[3] = &unk_250FA0E98;
    v17 = a1;
    v18 = a2;
    v10 = objc_alloc_init(MEMORY[0x24BEBD420]);
    v16 = v10;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v15);

    ClipperLib::ClipperOffset::~ClipperOffset((ClipperLib::ClipperOffset *)v19);
    _Block_object_dispose(&v21, 8);
    v27 = &off_250FA1278;
    v35 = &unk_250FA12C0;
    std::__list_imp<long long>::clear(v34);
    if (__p)
    {
      v33 = __p;
      operator delete(__p);
    }
    if (v30)
    {
      v31 = v30;
      operator delete(v30);
    }
    if (v28)
    {
      v29 = v28;
      operator delete(v28);
    }
    ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v35);
    v21 = (void **)v36;
    std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v21);
  }

  return v10;
}

+ (uint64_t)itk_cgPathcontainsAnyCurveToPoints:()ITKUtilities
{
  uint64_t v3;
  _QWORD block[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__UIBezierPath_ITKUtilities__itk_cgPathcontainsAnyCurveToPoints___block_invoke;
  block[3] = &unk_250FA0EC0;
  block[4] = &v6;
  CGPathApplyWithBlock(path, block);
  v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (CGPath)_cgPathFromClipperPath:()ITKUtilities
{
  CGPath *Mutable;
  uint64_t **v5;
  uint64_t **v6;
  uint64_t *v7;
  uint64_t *v8;
  char v9;

  Mutable = CGPathCreateMutable();
  v6 = *a3;
  v5 = a3[1];
  while (v6 != v5)
  {
    v7 = *v6;
    v8 = v6[1];
    if (*v6 != v8)
    {
      v9 = 1;
      do
      {
        if ((v9 & 1) != 0)
          CGPathMoveToPoint(Mutable, 0, (double)**v6, (double)(*v6)[1]);
        else
          CGPathAddLineToPoint(Mutable, 0, (double)*v7, (double)v7[1]);
        v9 = 0;
        v7 += 3;
      }
      while (v7 != v8);
    }
    CGPathCloseSubpath(Mutable);
    v6 += 3;
  }
  return Mutable;
}

+ (CGPath)itk_newRoundedPathWithRadius:()ITKUtilities points:
{
  id v6;
  void *v7;
  id v8;
  CGPath *Mutable;
  unint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  double v52;
  CGFloat radius;
  CGFloat x;
  double v55;
  double v56;
  double v57;

  v6 = a4;
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(a1, "_processPointsForRounding:withRadius:", v7, a2);
  objc_msgSend(a1, "_processPointsForNarrowAngles:", v7);
  v8 = v7;

  Mutable = CGPathCreateMutable();
  v10 = 0;
  v52 = a2;
  while (objc_msgSend(v8, "count", *(_QWORD *)&v52) > v10)
  {
    objc_msgSend(v8, "objectAtIndex:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "itk_pointValue");
    v13 = v12;
    v15 = v14;

    objc_msgSend(v8, "objectAtIndex:", (v10 + 1) % objc_msgSend(v8, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "itk_pointValue");
    v18 = v17;
    v20 = v19;

    objc_msgSend(v8, "objectAtIndex:", (v10 + 2) % objc_msgSend(v8, "count"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "itk_pointValue");
    v57 = v22;
    v24 = v23;

    objc_msgSend(v8, "objectAtIndex:", (v10 + 3) % objc_msgSend(v8, "count"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "itk_pointValue");
    v55 = v27;
    v56 = v26;

    v28 = v13;
    objc_msgSend(MEMORY[0x24BEBD420], "itk_clampedRadius:p1:p2:p3:", a2, v13, v15, v18, v20, v57, v24);
    v30 = v29;
    objc_msgSend(MEMORY[0x24BEBD420], "itk_clampedRadius:p1:p2:p3:", a2, v18, v20, v57, v24, v56, v55);
    v32 = v31;
    radius = fmin(v30, v31);
    objc_msgSend(MEMORY[0x24BEBD420], "itk_calculateCenterForPoints:p2:p3:radius:", v28, v15, v18, v20, v57, v24);
    v34 = v33;
    v36 = v35;
    objc_msgSend(MEMORY[0x24BEBD420], "itk_projectPoint:lineStart:lineEnd:");
    x = v37;
    v39 = v38;
    objc_msgSend(MEMORY[0x24BEBD420], "itk_projectPoint:lineStart:lineEnd:", v34, v36, v18, v20, v57, v24);
    if (!v10)
      CGPathMoveToPoint(Mutable, 0, x, v39);
    objc_msgSend(MEMORY[0x24BEBD420], "itk_calculateCenterForPoints:p2:p3:radius:", v18, v20, v57, v24, v56, v55, v32);
    objc_msgSend(MEMORY[0x24BEBD420], "itk_projectPoint:lineStart:lineEnd:");
    v41 = v40;
    v43 = v42;
    ITKAngleBetweenPoints();
    v45 = v44;
    ITKAngleBetweenPoints();
    v47 = v46;
    ITKNormalizeAngleInRadians();
    v49 = v48;
    ITKNormalizeAngleInRadians();
    CGPathAddArc(Mutable, 0, v34, v36, radius, v45, v47, v49 >= v50);
    a2 = v52;
    ++v10;
    CGPathAddLineToPoint(Mutable, 0, v41, v43);
  }
  CGPathCloseSubpath(Mutable);

  return Mutable;
}

+ (void)_processPointsForNarrowAngles:()ITKUtilities
{
  unint64_t i;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v25;

  v25 = a3;
  for (i = 0; objc_msgSend(v25, "count") > i; ++i)
  {
    v4 = objc_msgSend(v25, "count");
    v5 = objc_msgSend(v25, "count");
    objc_msgSend(v25, "objectAtIndex:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itk_pointValue");
    v8 = v7;
    v10 = v9;
    v11 = (i + 1) % v4;

    objc_msgSend(v25, "objectAtIndex:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "itk_pointValue");
    v14 = v13;
    v16 = v15;

    objc_msgSend(v25, "objectAtIndex:", (i + 2) % v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "itk_pointValue");
    v19 = v18;
    v21 = v20;

    ITKAngleBetweenPoints();
    v23 = fabs(v22);
    if (v23 < 0.785398163 || v23 > 5.49778714)
    {
      objc_msgSend(MEMORY[0x24BEBD420], "itk_projectPoint:lineStart:lineEnd:", v8, v10, v14, v16, v19, v21);
      objc_msgSend(MEMORY[0x24BDD1968], "itk_valueWithPoint:");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:atIndexedSubscript:", v24, v11);

    }
  }

}

+ (void)_processPointsForRounding:()ITKUtilities withRadius:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  _QWORD v17[5];
  id v18;

  v5 = a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__8;
  v17[4] = __Block_byref_object_dispose__9;
  v18 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__8;
  v15 = __Block_byref_object_dispose__9;
  v16 = 0;
  v6 = (void *)objc_msgSend(v5, "copy");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __67__UIBezierPath_ITKUtilities___processPointsForRounding_withRadius___block_invoke;
  v10[3] = &unk_250FA0EE8;
  *(double *)&v10[6] = a1 / 3.0;
  v10[4] = v17;
  v10[5] = &v11;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  if (v12[5])
    objc_msgSend(v5, "removeObjectsAtIndexes:");
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itk_pointValue");
  objc_msgSend(v5, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itk_pointValue");
  v9 = ITKNearlyEqualPointsWithThreshold();

  if (v9)
    objc_msgSend(v5, "removeLastObject");
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(v17, 8);
}

+ (id)itk_shiftLinePerpendicularlyFromPoint:()ITKUtilities to:radius:
{
  id v8;
  double v9;
  long double v10;

  v8 = objc_alloc_init(MEMORY[0x24BE51EC8]);
  if (a1 != a3 && a2 != a4)
  {
    ITKSlopeOfLine();
    v10 = atan(fabs(v9));
    cos(v10);
  }
  ITKAddPoints();
  objc_msgSend(v8, "setStartPoint:");
  ITKAddPoints();
  objc_msgSend(v8, "setEndPoint:");
  return v8;
}

+ (double)itk_clampedRadius:()ITKUtilities p1:p2:p3:
{
  return fmin(fmin(fmin(a1, fmax(vabdd_f64(a2, a4), vabdd_f64(a3, a5)) * 0.5), fmax(vabdd_f64(a2, a6), vabdd_f64(a3, a7)) * 0.5), fmax(vabdd_f64(a4, a6), vabdd_f64(a5, a7)) * 0.5);
}

+ (uint64_t)itk_signForRadiusWithVectorStart:()ITKUtilities end:otherPoint:
{
  uint64_t result;

  if (a1 != a3)
    return ITKSlopeOfLine();
  return result;
}

+ (void)itk_calculateCenterForPoints:()ITKUtilities p2:p3:radius:
{
  double v15;
  void *v16;
  double v17;
  void *v18;

  objc_msgSend(a1, "itk_signForRadiusWithVectorStart:end:otherPoint:");
  objc_msgSend(MEMORY[0x24BEBD420], "itk_shiftLinePerpendicularlyFromPoint:to:radius:", a2, a3, a4, a5, v15 * a8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD420], "itk_signForRadiusWithVectorStart:end:otherPoint:", a6, a7, a4, a5, a2, a3);
  objc_msgSend(MEMORY[0x24BEBD420], "itk_shiftLinePerpendicularlyFromPoint:to:radius:", a6, a7, a4, a5, v17 * a8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "startPoint");
  objc_msgSend(v16, "endPoint");
  objc_msgSend(v18, "startPoint");
  objc_msgSend(v18, "endPoint");
  ITKIntersectionOfLines();

}

+ (double)itk_projectPoint:()ITKUtilities lineStart:lineEnd:
{
  double v6;
  double v10;
  double v11;
  id v12;
  id v13;
  __int128 v15;

  v6 = a3;
  v15 = *MEMORY[0x24BDBEFB0];
  if (a3 != a5)
  {
    if (a4 == a6)
    {
      return a1;
    }
    else
    {
      ITKSlopeOfLine();
      v11 = v10;
      v12 = objc_alloc_init(MEMORY[0x24BE51EC0]);
      objc_msgSend(v12, "setA:", v11);
      objc_msgSend(v12, "setB:", a4 - v11 * v6);
      v13 = objc_alloc_init(MEMORY[0x24BE51EC0]);
      objc_msgSend(v13, "setA:", -1.0 / v11);
      objc_msgSend(v13, "setB:", a2 + 1.0 / v11 * a1);
      ITKIntersectsLine();

      return *(double *)&v15;
    }
  }
  return v6;
}

+ (id)itk_roundAndGroupNormalizedQuadsForHighlight:()ITKUtilities aspectRatio:expansionScale:radiusToAvgHeightRatio:
{
  id v9;
  id v10;
  _QWORD *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t *v22;
  const CGPath *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  CGAffineTransform v29;
  _QWORD v30[4];
  id v31;
  id v32;
  void *v33;
  double v34;
  void **v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *__p;
  void *v41;
  _QWORD v42[7];
  void *v43;
  uint64_t v44[3];
  _QWORD v45[8];
  _QWORD v46[4];
  id v47;
  double v48;
  double v49;
  _QWORD v50[3];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  ClipperLib::ClipperOffset *(*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  void *v56;
  _BYTE v57[264];
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  _QWORD *v61;
  _QWORD v62[6];
  _BYTE v63[264];
  void **v64;

  v9 = a6;
  v10 = objc_alloc_init(MEMORY[0x24BEBD420]);
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x13812000000;
  v62[3] = __Block_byref_object_copy__24;
  v62[4] = __Block_byref_object_dispose__25;
  v62[5] = &unk_23F102635;
  ClipperLib::ClipperOffset::ClipperOffset((ClipperLib::ClipperOffset *)v63, 2.0, 0.25);
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 0;
  v11 = (_QWORD *)operator new();
  std::vector<std::vector<ClipperLib::IntPoint>>::vector(v11, 4uLL);
  v61 = v11;
  v51 = 0;
  v52 = &v51;
  v53 = 0x13812000000;
  v54 = __Block_byref_object_copy__24;
  v55 = __Block_byref_object_dispose__25;
  v56 = &unk_23F102635;
  ClipperLib::ClipperOffset::ClipperOffset((ClipperLib::ClipperOffset *)v57, 2.0, 0.25);
  memset(v50, 0, sizeof(v50));
  ITKMultiplySizeScalar();
  v13 = v12;
  v15 = v14;
  v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v17 = MEMORY[0x24BDAC760];
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = __125__UIBezierPath_ITKUtilities__itk_roundAndGroupNormalizedQuadsForHighlight_aspectRatio_expansionScale_radiusToAvgHeightRatio___block_invoke;
  v46[3] = &unk_250FA0F10;
  v18 = v16;
  v47 = v18;
  v48 = v13;
  v49 = v15;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v46);
  v45[0] = v17;
  v45[1] = 3221225472;
  v45[2] = __125__UIBezierPath_ITKUtilities__itk_roundAndGroupNormalizedQuadsForHighlight_aspectRatio_expansionScale_radiusToAvgHeightRatio___block_invoke_2;
  v45[3] = &unk_250FA0F38;
  *(double *)&v45[7] = a3;
  v45[4] = v62;
  v45[5] = &v58;
  v45[6] = &v51;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v45);
  v19 = v59[3];
  if (v19)
  {
    v35 = (void **)v59[3];
    std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v35);
    MEMORY[0x242665874](v19, 0x20C40960023A9);
  }
  memset(v44, 0, sizeof(v44));
  ClipperLib::ClipperOffset::Execute(v52 + 6, v44, 0.0);
  ClipperLib::Clipper::Clipper((ClipperLib::Clipper *)&v35, 0);
  ClipperLib::ClipperBase::AddPaths((uint64_t)&v35 + (_QWORD)*(v35 - 3), v44, 0, 1);
  v20 = (void *)MEMORY[0x24BEBD420];
  ITKRectWithSize();
  objc_msgSend(v20, "bezierPathWithRect:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = ITKClipperPathsFromCGPath((const CGPath *)objc_msgSend(v21, "itk_CGPath"), 1.0);
  ClipperLib::ClipperBase::AddPaths((uint64_t)&v35 + (_QWORD)*(v35 - 3), v22, 1, 1);
  ClipperLib::Clipper::Execute((uint64_t)&v35, 0, v44, 0);
  v23 = (const CGPath *)objc_msgSend(a1, "_cgPathFromClipperPath:", v44);
  v64 = (void **)v22;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v64);
  MEMORY[0x242665874](v22, 0x20C40960023A9);
  objc_msgSend(a1, "itk_subpathArrayFromCGPath:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  CGPathRelease(v23);
  if (v24)
  {
    objc_msgSend(a1, "mapPaths:toQuads:", v24, v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      v30[0] = v17;
      v30[1] = 3221225472;
      v30[2] = __125__UIBezierPath_ITKUtilities__itk_roundAndGroupNormalizedQuadsForHighlight_aspectRatio_expansionScale_radiusToAvgHeightRatio___block_invoke_3;
      v30[3] = &unk_250FA0F60;
      v33 = a1;
      v31 = v25;
      v34 = a4;
      v32 = v10;
      objc_msgSend(v24, "enumerateObjectsUsingBlock:", v30);

    }
  }
  CGAffineTransformMakeScale(&v29, 1.0 / v13, 1.0 / v15);
  objc_msgSend(v10, "itk_applyTransform:", &v29);
  v27 = v10;

  v35 = (void **)&off_250FA1278;
  v43 = &unk_250FA12C0;
  std::__list_imp<long long>::clear(v42);
  if (__p)
  {
    v41 = __p;
    operator delete(__p);
  }
  if (v38)
  {
    v39 = v38;
    operator delete(v38);
  }
  if (v36)
  {
    v37 = v36;
    operator delete(v36);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v43);
  v35 = (void **)v44;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v35);

  v35 = (void **)v50;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v35);
  _Block_object_dispose(&v51, 8);
  ClipperLib::ClipperOffset::~ClipperOffset((ClipperLib::ClipperOffset *)v57);
  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(v62, 8);
  ClipperLib::ClipperOffset::~ClipperOffset((ClipperLib::ClipperOffset *)v63);

  return v27;
}

+ (double)radiusForQuads:()ITKUtilities radiusRatio:
{
  id v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = objc_msgSend(v5, "count");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "sideLength", (_QWORD)v14);
        v10 = v10 + v12;
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
  }

  return v10 / (double)v6 * a1;
}

+ (id)mapPaths:()ITKUtilities toQuads:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithArray:", v6);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __47__UIBezierPath_ITKUtilities__mapPaths_toQuads___block_invoke;
  v14[3] = &unk_250FA0F88;
  v15 = v8;
  v9 = v7;
  v16 = v9;
  v10 = v8;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v14);
  v11 = v16;
  v12 = v9;

  return v12;
}

@end
