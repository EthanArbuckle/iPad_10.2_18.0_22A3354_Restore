@implementation PKScratchOutController

- (id)intersectedStrokesForStroke:(void *)a3 attachmentView:(void *)a4 drawing:
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v37 = v8;
  if (a1)
  {
    objc_msgSend(v8, "strokeSpatialCache");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = *(void **)(v10 + 24);
    else
      v12 = 0;
    v13 = v12;
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    a1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pointAtIndex:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "location");
    v18 = v17;
    v20 = v19;

    objc_msgSend(v7, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "_pointsCount");

    if (v22)
    {
      for (i = 0; i != v22; ++i)
      {
        objc_msgSend(v7, "path");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "pointAtIndex:", i);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "location");
        v27 = v26;
        v29 = v28;

        objc_msgSend(v9, "strokesIntersectedByPoint:prevPoint:onscreenVisibleStrokes:", v14, v27, v29, v18, v20);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v31 = v30;
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (v32)
        {
          v33 = *(_QWORD *)v39;
          do
          {
            for (j = 0; j != v32; ++j)
            {
              if (*(_QWORD *)v39 != v33)
                objc_enumerationMutation(v31);
              objc_msgSend(v14, "removeObject:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j));
            }
            v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
          }
          while (v32);
        }

        objc_msgSend(v31, "set");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "unionSet:", v35);

        v18 = v27;
        v20 = v29;
      }
    }

  }
  return a1;
}

- (_BYTE)strokeIntersectionBetweenAllStrokes:(void *)a3 textStrokesToDelete:(void *)a4 textStrokesToKeep:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  double v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v18);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = 0;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v13 += objc_msgSend(v9, "containsObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
      v16 = (double)v13;
    }
    else
    {
      v16 = 0.0;
    }

    a1[8] = (double)(unint64_t)objc_msgSend(v11, "count") * 0.7 <= v16;
    objc_msgSend(v11, "minusSet:", v10);
    objc_msgSend(v11, "unionSet:", v9);
    objc_msgSend(v11, "allObjects");
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();

  }
  return a1;
}

- (id)intersectedStrokesFilteredByCoverageThresholdForStroke:(void *)a3 intersectedStrokes:
{
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  PKAveragePointGenerator *v10;
  void *v11;
  const CGPath *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const CGPath *v16;
  const CGPath *v17;
  const CGPath *CopyByFlattening;
  const CGPath *v19;
  double v20;
  const CGPath *CopyByIntersectingPath;
  const __CFArray *SeparateComponents;
  const __CFArray *v23;
  double v24;
  CFIndex Count;
  CFIndex j;
  const CGPath *ValueAtIndex;
  PKAveragePointGenerator *v28;
  void *v29;
  double v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  os_signpost_id_t spid;
  unint64_t v41;
  id v42;
  id v43;
  void *v44;
  id obj;
  const CGPath *maskPath;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *__p;
  void *v54;
  uint64_t v55;
  CGAffineTransform transform;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[16];
  CGFloat lineWidth[2];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v43 = a2;
  v42 = a3;
  if (a1)
  {
    _PKSignpostLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_generate(v5);

    _PKSignpostLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    spid = v6;
    v41 = v6 - 1;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BE213000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "intersectedStrokesFilteredByCoverage", (const char *)&unk_1BE532412, buf, 2u);
    }

    v9 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE213000, v9, OS_LOG_TYPE_INFO, "BEGIN \"intersectedStrokesFilteredByCoverage\", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(PKAveragePointGenerator);
    -[PKAveragePointGenerator addStroke:]((uint64_t)v10, v43);
    v69 = 0;
    v67 = 0u;
    v68 = 0u;
    *(_OWORD *)lineWidth = 0u;
    v66 = 0u;
    *(_OWORD *)buf = 0u;
    objc_msgSend(v43, "path", -[PKAveragePointGenerator currentStrokePoint]((uint64_t)v10, (double *)buf));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (const CGPath *)objc_msgSend(v11, "_newPathRepresentation");
    maskPath = CGPathCreateCopyByStrokingPath(v12, 0, lineWidth[1], kCGLineCapRound, kCGLineJoinRound, 0.0);

    if (maskPath)
    {
      -[PKAveragePointGenerator reset]((uint64_t)v10);
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      obj = v42;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
      if (v13)
      {
        v47 = *(_QWORD *)v61;
        do
        {
          v48 = v13;
          for (i = 0; i != v48; ++i)
          {
            if (*(_QWORD *)v61 != v47)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
            -[PKAveragePointGenerator addStroke:]((uint64_t)v10, v14);
            -[PKAveragePointGenerator currentStrokePoint]((uint64_t)v10, &transform.a);
            v66 = *(_OWORD *)&transform.tx;
            v67 = v57;
            v68 = v58;
            v69 = v59;
            *(_OWORD *)buf = *(_OWORD *)&transform.a;
            *(_OWORD *)lineWidth = *(_OWORD *)&transform.c;
            memset(&transform, 0, sizeof(transform));
            if (v14)
              objc_msgSend(v14, "transform");
            objc_msgSend(v14, "path", spid);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (const CGPath *)objc_msgSend(v15, "_newPathRepresentation");

            v17 = CGPathCreateCopyByStrokingPath(v16, &transform, lineWidth[1], kCGLineCapRound, kCGLineJoinRound, 0.0);
            CopyByFlattening = CGPathCreateCopyByFlattening(v17, 1.0);
            v19 = CopyByFlattening;
            if (CopyByFlattening)
            {
              __p = 0;
              v54 = 0;
              v55 = 0;
              PKPointsFromPath(CopyByFlattening, (const void **)&__p, 6.0, 0.0);
              v20 = __100__PKScratchOutController_intersectedStrokesFilteredByCoverageThresholdForStroke_intersectedStrokes___block_invoke((uint64_t)__p, (uint64_t)v54);
              CopyByIntersectingPath = CGPathCreateCopyByIntersectingPath(v17, maskPath, 1);
              SeparateComponents = CGPathCreateSeparateComponents(CopyByIntersectingPath, 1);
              v23 = SeparateComponents;
              v24 = 0.0;
              if (SeparateComponents)
              {
                Count = CFArrayGetCount(SeparateComponents);
                if (Count >= 1)
                {
                  for (j = 0; j != Count; ++j)
                  {
                    ValueAtIndex = (const CGPath *)CFArrayGetValueAtIndex(v23, j);
                    v50 = 0;
                    v51 = 0;
                    v52 = 0;
                    PKPointsFromPath(ValueAtIndex, (const void **)&v50, 6.0, 0.0);
                    v28 = v10;
                    v29 = (void *)v50;
                    v30 = __100__PKScratchOutController_intersectedStrokesFilteredByCoverageThresholdForStroke_intersectedStrokes___block_invoke(v50, v51);
                    if (v29)
                    {
                      v51 = (uint64_t)v29;
                      operator delete(v29);
                    }
                    v24 = v24 + v30;
                    v10 = v28;
                  }
                }
              }
              CFRelease(v23);
              if (v24 / v20 > 0.03)
                objc_msgSend(v44, "addObject:", v14, v24 / v20);
              CGPathRelease(v16);
              CGPathRelease(v17);
              CGPathRelease(v19);
              CGPathRelease(CopyByIntersectingPath);
              -[PKAveragePointGenerator reset]((uint64_t)v10);
              if (__p)
              {
                v54 = __p;
                operator delete(__p);
              }
            }
            else
            {
              CGPathRelease(v16);
              CGPathRelease(v17);
              CGPathRelease(0);
            }
          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
        }
        while (v13);
      }

      CGPathRelease(maskPath);
      _PKSignpostLog();
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v41 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
      {
        LOWORD(transform.a) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BE213000, v32, OS_SIGNPOST_INTERVAL_END, spid, "intersectedStrokesFilteredByCoverage", (const char *)&unk_1BE532412, (uint8_t *)&transform, 2u);
      }

      v33 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        LOWORD(transform.a) = 0;
        _os_log_impl(&dword_1BE213000, v33, OS_LOG_TYPE_INFO, "END \"intersectedStrokesFilteredByCoverage\", (uint8_t *)&transform, 2u);
      }

      v34 = (void *)objc_msgSend(v44, "copy");
    }
    else
    {
      v35 = os_log_create("com.apple.pencilkit", "Actions");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(transform.a) = 0;
        _os_log_impl(&dword_1BE213000, v35, OS_LOG_TYPE_DEFAULT, "Could not generate a stroking path for scratch out stroke.", (uint8_t *)&transform, 2u);
      }

      _PKSignpostLog();
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v36;
      if (v41 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v36))
      {
        LOWORD(transform.a) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BE213000, v37, OS_SIGNPOST_INTERVAL_END, v6, "intersectedStrokesFilteredByCoverage", (const char *)&unk_1BE532412, (uint8_t *)&transform, 2u);
      }

      v38 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        LOWORD(transform.a) = 0;
        _os_log_impl(&dword_1BE213000, v38, OS_LOG_TYPE_INFO, "END \"intersectedStrokesFilteredByCoverage\", (uint8_t *)&transform, 2u);
      }

      v34 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v34 = 0;
  }

  return v34;
}

double __100__PKScratchOutController_intersectedStrokesFilteredByCoverageThresholdForStroke_intersectedStrokes___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double *v8;
  double v9;
  double v10;
  double v11;
  double result;

  v2 = a2 - a1;
  if (a2 - a1 < 1)
  {
    result = 0.0;
  }
  else
  {
    v3 = v2 >> 4;
    if (v2 >> 4 <= 1)
      v4 = 1;
    else
      v4 = v2 >> 4;
    v5 = a1 + 16 * v3;
    v7 = *(double *)(v5 - 16);
    v6 = *(double *)(v5 - 8);
    v8 = (double *)(a1 + 8);
    v9 = 0.0;
    do
    {
      v11 = *(v8 - 1);
      v10 = *v8;
      v9 = v9 + v11 * v6 - *v8 * v7;
      v8 += 2;
      v7 = v11;
      v6 = v10;
      --v4;
    }
    while (v4);
    result = v9 * 0.5;
  }
  if (result < 0.0)
    return -result;
  return result;
}

@end
