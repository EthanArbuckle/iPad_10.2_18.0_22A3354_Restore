@implementation PKFreeTransformGestureRecognizer

- (PKFreeTransformGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  char *v4;
  PKFreeTransformGestureRecognizer *v5;
  uint64_t v6;
  __int128 v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKFreeTransformGestureRecognizer;
  v4 = -[PKFreeTransformGestureRecognizer initWithTarget:action:](&v9, sel_initWithTarget_action_, a3, a4);
  v5 = (PKFreeTransformGestureRecognizer *)v4;
  if (v4)
  {
    *((_QWORD *)v4 + 35) = 0x4024000000000000;
    *((_QWORD *)v4 + 37) = 0x4024000000000000;
    v6 = MEMORY[0x1E0C9BAA8];
    v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)(v4 + 376) = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)(v4 + 392) = v7;
    *(_OWORD *)(v4 + 408) = *(_OWORD *)(v6 + 32);
    *((_QWORD *)v4 + 41) = 0x3FE0000000000000;
    *((_QWORD *)v4 + 38) = 15;
    objc_msgSend(v4, "setRequiresExclusiveTouchType:", 0);
    -[PKFreeTransformGestureRecognizer clearTouches](v5, "clearTouches");
  }
  return v5;
}

- (BOOL)scaleIsGrowing
{
  double v2;

  -[PKFreeTransformGestureRecognizer deltaScale](self, "deltaScale");
  return v2 > 0.01;
}

- (BOOL)scaleIsShrinking
{
  double v2;

  -[PKFreeTransformGestureRecognizer deltaScale](self, "deltaScale");
  return v2 < -0.1;
}

- (double)scale
{
  double v3;
  double v4;

  -[PKFreeTransformGestureRecognizer freeTransform](self, "freeTransform");
  return sqrt(v4 * v4 + v3 * v3);
}

- (CGAffineTransform)clampTransform:(SEL)a3 minScale:(CGAffineTransform *)a4 maxScale:(double)a5
{
  double v10;
  double v11;
  CGFloat v12;
  __int128 v13;
  CGAffineTransform *v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CGAffineTransform v19;
  CGAffineTransform t2;
  CGAffineTransform v21;
  CGAffineTransform v22;

  v10 = sqrt(a4->b * a4->b + a4->a * a4->a);
  if (v10 < a5)
  {
    -[CGAffineTransform scaleDamping](self, "scaleDamping");
    v12 = ((v10 - a5) * v11 * 0.5 + a5) / v10;
    CGAffineTransformMakeScale(&v21, v12, v12);
    v13 = *(_OWORD *)&a4->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&t2.c = v13;
    *(_OWORD *)&t2.tx = *(_OWORD *)&a4->tx;
    v14 = &v21;
LABEL_5:
    self = CGAffineTransformConcat(&v22, v14, &t2);
    v17 = *(_OWORD *)&v22.c;
    *(_OWORD *)&a4->a = *(_OWORD *)&v22.a;
    *(_OWORD *)&a4->c = v17;
    *(_OWORD *)&a4->tx = *(_OWORD *)&v22.tx;
    goto LABEL_6;
  }
  if (v10 > a6)
  {
    -[CGAffineTransform scaleDamping](self, "scaleDamping");
    CGAffineTransformMakeScale(&v19, (a6 + (v10 - a6) * v15) / v10, (a6 + (v10 - a6) * v15) / v10);
    v16 = *(_OWORD *)&a4->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&t2.c = v16;
    *(_OWORD *)&t2.tx = *(_OWORD *)&a4->tx;
    v14 = &v19;
    goto LABEL_5;
  }
LABEL_6:
  v18 = *(_OWORD *)&a4->c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&a4->a;
  *(_OWORD *)&retstr->c = v18;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&a4->tx;
  return self;
}

- (CGAffineTransform)freeTransform
{
  void *v5;
  BOOL v6;
  CGAffineTransform *result;
  uint64_t v8;
  __int128 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __int128 v31;
  double v32;
  __int128 v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  uint64_t v74;
  double v75;
  uint64_t v76;
  uint64_t v77;
  double v78;
  double v79;
  double v80;
  double v81;
  __int128 v82;
  __int128 v83;
  double v84;
  double v85;
  CGAffineTransform t1;
  double v87;
  double v88;
  CGAffineTransform t2;
  CGAffineTransform v90;
  double v91;
  double v92;

  -[PKFreeTransformGestureRecognizer touches](self, "touches");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 2)
  {
    v6 = -[PKFreeTransformGestureRecognizer isScaling](self, "isScaling");

    if (!v6)
      return -[PKFreeTransformGestureRecognizer unscaledFreeTransform](self, "unscaledFreeTransform");
  }
  else
  {

  }
  v8 = MEMORY[0x1E0C9BAA8];
  v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v9;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v8 + 32);
  if (-[PKFreeTransformGestureRecognizer allowSingleTouchDrag](self, "allowSingleTouchDrag")
    && (-[PKFreeTransformGestureRecognizer touches](self, "touches"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "count"),
        v10,
        v11 == 1))
  {
    -[PKFreeTransformGestureRecognizer touchStartLocations](self, "touchStartLocations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKFreeTransformGestureRecognizer touches](self, "touches");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "CGPointValue");
    v17 = v16;
    v19 = v18;

    -[PKFreeTransformGestureRecognizer touches](self, "touches");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKFreeTransformGestureRecognizer view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "superview");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "locationInView:", v23);
    v25 = v24;
    v27 = v26;

    CGAffineTransformMakeTranslation(retstr, v25 - v17, v27 - v19);
    if (-[PKFreeTransformGestureRecognizer axisAligned](self, "axisAligned"))
    {
      -[PKFreeTransformGestureRecognizer accumulatedTransform](self, "accumulatedTransform");
      v28 = sqrt(v92 * v92 + v91 * v91);
      -[PKFreeTransformGestureRecognizer minScale](self, "minScale");
      v30 = v29 / v28;
      -[PKFreeTransformGestureRecognizer maxScale](self, "maxScale");
      v31 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&t2.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&t2.c = v31;
      *(_OWORD *)&t2.tx = *(_OWORD *)&retstr->tx;
      -[PKFreeTransformGestureRecognizer clampTransform:minScale:maxScale:](self, "clampTransform:minScale:maxScale:", &t2, v30, v32 / v28);
      v33 = *(_OWORD *)&v90.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&v90.a;
      *(_OWORD *)&retstr->c = v33;
      *(_OWORD *)&retstr->tx = *(_OWORD *)&v90.tx;
    }
  }
  else
  {
    -[PKFreeTransformGestureRecognizer touches](self, "touches");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "count");

    if (v35 == 2)
    {
      -[PKFreeTransformGestureRecognizer touchStartLocations](self, "touchStartLocations");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKFreeTransformGestureRecognizer touches](self, "touches");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectForKey:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "CGPointValue");
      v41 = v40;
      v43 = v42;

      -[PKFreeTransformGestureRecognizer touchStartLocations](self, "touchStartLocations");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKFreeTransformGestureRecognizer touches](self, "touches");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "objectAtIndexedSubscript:", 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectForKey:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "CGPointValue");
      v49 = v48;
      v51 = v50;

      -[PKFreeTransformGestureRecognizer touches](self, "touches");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "objectAtIndexedSubscript:", 0);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKFreeTransformGestureRecognizer view](self, "view");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "superview");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "locationInView:", v55);
      v57 = v56;
      v59 = v58;

      -[PKFreeTransformGestureRecognizer touches](self, "touches");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "objectAtIndexedSubscript:", 1);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKFreeTransformGestureRecognizer view](self, "view");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "superview");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "locationInView:", v63);
      v65 = v64;
      v67 = v66;

      if (-[PKFreeTransformGestureRecognizer axisAligned](self, "axisAligned"))
      {
        -[PKFreeTransformGestureRecognizer accumulatedTransform](self, "accumulatedTransform");
        v84 = v51;
        v85 = v59;
        v68 = v43;
        v69 = sqrt(v88 * v88 + v87 * v87);
        -[PKFreeTransformGestureRecognizer minScale](self, "minScale");
        v70 = v57;
        v71 = v49;
        v72 = v41;
        *(double *)&v74 = v73 / v69;
        -[PKFreeTransformGestureRecognizer maxScale](self, "maxScale");
        *(double *)&v76 = v75 / v69;
        -[PKFreeTransformGestureRecognizer scaleDamping](self, "scaleDamping");
        DKDTransformMakeAxisAligned((uint64_t)retstr, v72, v68, v71, v84, v70, v85, v65, v67, v74, v76, v77);
      }
      else
      {
        DKDTransformMakeFree(0, (uint64_t)retstr, v41, v43, v49, v51, v57, v59, v65, v67);
      }
      v78 = sqrt(retstr->b * retstr->b + retstr->a * retstr->a);
      -[PKFreeTransformGestureRecognizer previousScale](self, "previousScale");
      v80 = v78 - v79;
      -[PKFreeTransformGestureRecognizer setPreviousScale:](self, "setPreviousScale:", v78);
      -[PKFreeTransformGestureRecognizer deltaScale](self, "deltaScale");
      -[PKFreeTransformGestureRecognizer setDeltaScale:](self, "setDeltaScale:", v81 * 0.6 + v80 * 0.4);
    }
  }
  -[PKFreeTransformGestureRecognizer accumulatedTransform](self, "accumulatedTransform");
  v82 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t2.c = v82;
  *(_OWORD *)&t2.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformConcat(&v90, &t1, &t2);
  v83 = *(_OWORD *)&v90.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v90.a;
  *(_OWORD *)&retstr->c = v83;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v90.tx;
  return result;
}

- (CGAffineTransform)unscaledFreeTransform
{
  uint64_t v5;
  __int128 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGAffineTransform *result;
  double v45;
  double v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGAffineTransform v57;
  CGAffineTransform v58;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v61;

  v5 = MEMORY[0x1E0C9BAA8];
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  -[PKFreeTransformGestureRecognizer touches](self, "touches");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 == 2)
  {
    -[PKFreeTransformGestureRecognizer touchStartLocations](self, "touchStartLocations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKFreeTransformGestureRecognizer touches](self, "touches");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "CGPointValue");
    v14 = v13;
    v16 = v15;

    -[PKFreeTransformGestureRecognizer touchStartLocations](self, "touchStartLocations");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKFreeTransformGestureRecognizer touches](self, "touches");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "CGPointValue");
    v22 = v21;
    v24 = v23;

    -[PKFreeTransformGestureRecognizer touches](self, "touches");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKFreeTransformGestureRecognizer view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "superview");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "locationInView:", v28);
    v55 = v30;
    v56 = v29;

    -[PKFreeTransformGestureRecognizer touches](self, "touches");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectAtIndexedSubscript:", 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKFreeTransformGestureRecognizer view](self, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "superview");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "locationInView:", v34);
    v36 = v35;
    v38 = v37;

    v39 = v14;
    v40 = v22;
    v41 = (v14 + v22) * 0.5;
    v42 = v24;
    v43 = (v16 + v24) * 0.5;
    v53 = (v55 + v38) * 0.5;
    v54 = (v56 + v36) * 0.5;
    if (-[PKFreeTransformGestureRecognizer axisAligned](self, "axisAligned"))
      return CGAffineTransformMakeTranslation(retstr, v54 - v41, v53 - v43);
    v45 = atan2(v16 - v42, v39 - v40);
    v46 = atan2(v55 - v38, v56 - v36);
    CGAffineTransformMakeTranslation(retstr, -v41, -v43);
    CGAffineTransformMakeRotation(&t2, v46 - v45);
    v47 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v47;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformConcat(&v61, &t1, &t2);
    v48 = *(_OWORD *)&v61.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v61.a;
    *(_OWORD *)&retstr->c = v48;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v61.tx;
    CGAffineTransformMakeTranslation(&v58, v54, v53);
    v49 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v49;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformConcat(&v61, &t1, &v58);
    v50 = *(_OWORD *)&v61.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v61.a;
    *(_OWORD *)&retstr->c = v50;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v61.tx;
    -[PKFreeTransformGestureRecognizer accumulatedTransform](self, "accumulatedTransform");
    v51 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v51;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformConcat(&v61, &v57, &t1);
  }
  else
  {
    result = -[PKFreeTransformGestureRecognizer freeTransform](self, "freeTransform");
  }
  v52 = *(_OWORD *)&v61.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v61.a;
  *(_OWORD *)&retstr->c = v52;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v61.tx;
  return result;
}

- (CGPoint)locationInView:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGPoint result;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v6 = *MEMORY[0x1E0C9D538];
  v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[PKFreeTransformGestureRecognizer touches](self, "touches", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11), "locationInView:", v4);
        v6 = v6 + v12;
        v5 = v5 + v13;
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  -[PKFreeTransformGestureRecognizer touches](self, "touches");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    -[PKFreeTransformGestureRecognizer touches](self, "touches");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 1.0 / (double)(unint64_t)objc_msgSend(v16, "count");
    v6 = v6 * v17;
    v5 = v5 * v17;

  }
  v18 = v6;
  v19 = v5;
  result.y = v19;
  result.x = v18;
  return result;
}

- (void)resetStartingTouches
{
  __int128 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _OWORD v20[3];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v20[0] = *MEMORY[0x1E0C9BAA8];
  v20[1] = v3;
  v20[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[PKFreeTransformGestureRecognizer setAccumulatedTransform:](self, "setAccumulatedTransform:", v20);
  -[PKFreeTransformGestureRecognizer touchStartLocations](self, "touchStartLocations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PKFreeTransformGestureRecognizer touches](self, "touches");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        -[PKFreeTransformGestureRecognizer touchStartLocations](self, "touchStartLocations");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x1E0CB3B18];
        -[PKFreeTransformGestureRecognizer view](self, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "superview");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "locationInView:", v13);
        objc_msgSend(v11, "valueWithCGPoint:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v14, v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v6);
  }

}

- (void)reset
{
  double v3;
  __int128 v4;
  _OWORD v5[3];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKFreeTransformGestureRecognizer;
  -[PKFreeTransformGestureRecognizer reset](&v6, sel_reset);
  -[PKFreeTransformGestureRecognizer clearTouches](self, "clearTouches");
  -[PKFreeTransformGestureRecognizer setCanBegin:](self, "setCanBegin:", 0);
  -[PKFreeTransformGestureRecognizer scaleThreshold](self, "scaleThreshold");
  -[PKFreeTransformGestureRecognizer setIsScaling:](self, "setIsScaling:", v3 <= 0.0);
  -[PKFreeTransformGestureRecognizer setIsPanning:](self, "setIsPanning:", 0);
  -[PKFreeTransformGestureRecognizer setDeltaScale:](self, "setDeltaScale:", 0.0);
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[PKFreeTransformGestureRecognizer setAccumulatedTransform:](self, "setAccumulatedTransform:", v5);
}

- (void)resetAndAccumulateTransform
{
  _OWORD v3[3];
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v5 = 0u;
  v6 = 0u;
  v4 = 0u;
  -[PKFreeTransformGestureRecognizer freeTransform](self, "freeTransform");
  -[PKFreeTransformGestureRecognizer resetStartingTouches](self, "resetStartingTouches");
  v3[0] = v4;
  v3[1] = v5;
  v3[2] = v6;
  -[PKFreeTransformGestureRecognizer setAccumulatedTransform:](self, "setAccumulatedTransform:", v3);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4 rejectExcessTouches:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  PKFreeTransformGestureRecognizer *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  double v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[PKFreeTransformGestureRecognizer touches](self, "touches");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  v12 = objc_msgSend(v8, "count") + v11;

  if (v12 >= 3 && !a5)
  {
    v13 = self;
    v14 = 5;
LABEL_6:
    -[PKFreeTransformGestureRecognizer setState:](v13, "setState:", v14);
    goto LABEL_7;
  }
  objc_msgSend(v8, "objectsPassingTest:", &__block_literal_global_7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    v13 = self;
    v14 = 3;
    goto LABEL_6;
  }
  -[PKFreeTransformGestureRecognizer touches](self, "touches");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");
  v19 = objc_msgSend(v8, "count") + v18;

  if (v19 < 3)
  {
    v41 = v9;
    if (-[PKFreeTransformGestureRecognizer state](self, "state") == 1
      || -[PKFreeTransformGestureRecognizer state](self, "state") == 2)
    {
      -[PKFreeTransformGestureRecognizer resetAndAccumulateTransform](self, "resetAndAccumulateTransform");
    }
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v42 = v8;
    v25 = v8;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v44 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          -[PKFreeTransformGestureRecognizer touches](self, "touches");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v30);

          v32 = (void *)MEMORY[0x1E0CB3B18];
          -[PKFreeTransformGestureRecognizer view](self, "view");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "superview");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "locationInView:", v34);
          objc_msgSend(v32, "valueWithCGPoint:");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          -[PKFreeTransformGestureRecognizer touchStartLocations](self, "touchStartLocations");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setObject:forKey:", v35, v30);

          -[PKFreeTransformGestureRecognizer actualTouchStartLocations](self, "actualTouchStartLocations");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setObject:forKey:", v35, v30);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      }
      while (v27);
    }

    v9 = v41;
    v8 = v42;
    if (!-[PKFreeTransformGestureRecognizer state](self, "state"))
    {
      -[PKFreeTransformGestureRecognizer touches](self, "touches");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v38, "count") == 2)
      {

      }
      else
      {
        v39 = -[PKFreeTransformGestureRecognizer allowSingleTouchDrag](self, "allowSingleTouchDrag");

        if (!v39)
          goto LABEL_7;
      }
      -[PKFreeTransformGestureRecognizer startThreshold](self, "startThreshold");
      v13 = self;
      if (v40 > 0.0)
      {
        -[PKFreeTransformGestureRecognizer setCanBegin:](self, "setCanBegin:", 1);
        goto LABEL_7;
      }
      v14 = 1;
      goto LABEL_6;
    }
  }
  else
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v20 = v8;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v48 != v23)
            objc_enumerationMutation(v20);
          -[PKFreeTransformGestureRecognizer ignoreTouch:forEvent:](self, "ignoreTouch:forEvent:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j), v9);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      }
      while (v22);
    }

  }
LABEL_7:

}

BOOL __79__PKFreeTransformGestureRecognizer_touchesBegan_withEvent_rejectExcessTouches___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 2;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[PKFreeTransformGestureRecognizer touchesBegan:withEvent:rejectExcessTouches:](self, "touchesBegan:withEvent:rejectExcessTouches:", a3, a4, 1);
}

- (BOOL)touchesMovedPastThreshold:(double)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[PKFreeTransformGestureRecognizer touches](self, "touches", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[PKFreeTransformGestureRecognizer view](self, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "superview");
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "locationInView:", v13);
        v15 = v14;
        v17 = v16;

        -[PKFreeTransformGestureRecognizer touchStartLocations](self, "touchStartLocations");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKey:", v11);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "CGPointValue");
        LOBYTE(v13) = sqrt((v17 - v21) * (v17 - v21) + (v15 - v20) * (v15 - v20)) > a3;

        v8 |= v13;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8 & 1;
}

- (BOOL)touchesMovedPastScaleThreshold:(double)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v46;

  -[PKFreeTransformGestureRecognizer touches](self, "touches");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 < 2)
    return 0;
  v46 = a3;
  -[PKFreeTransformGestureRecognizer actualTouchStartLocations](self, "actualTouchStartLocations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKFreeTransformGestureRecognizer touches](self, "touches");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "CGPointValue");
  v12 = v11;
  v14 = v13;

  -[PKFreeTransformGestureRecognizer actualTouchStartLocations](self, "actualTouchStartLocations");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKFreeTransformGestureRecognizer touches](self, "touches");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "CGPointValue");
  v20 = v19;
  v22 = v21;

  -[PKFreeTransformGestureRecognizer touches](self, "touches");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKFreeTransformGestureRecognizer view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "superview");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "locationInView:", v26);
  v28 = v27;
  v30 = v29;

  -[PKFreeTransformGestureRecognizer touches](self, "touches");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectAtIndexedSubscript:", 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKFreeTransformGestureRecognizer view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "superview");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "locationInView:", v34);
  v36 = v35;
  v38 = v37;

  v39 = vabdd_f64(sqrt((v14 - v22) * (v14 - v22) + (v12 - v20) * (v12 - v20)), sqrt((v30 - v38) * (v30 - v38) + (v28 - v36) * (v28 - v36)));
  v40 = (v12 + v20) * 0.5 - (v28 + v36) * 0.5;
  v41 = (v14 + v22) * 0.5 - (v30 + v38) * 0.5;
  v42 = sqrt(v41 * v41 + v40 * v40);
  v43 = 1.0;
  v44 = v42 / (v39 * 2.0 + 1.0);
  if (v44 >= 1.0)
  {
    v43 = v44;
    if (v44 > 2.0)
      v43 = 2.0;
  }
  return v39 > v43 * v46;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKFreeTransformGestureRecognizer;
  -[PKFreeTransformGestureRecognizer touchesMoved:withEvent:](&v5, sel_touchesMoved_withEvent_, a3, a4);
  -[PKFreeTransformGestureRecognizer freeTransform](self, "freeTransform", 0, 0, 0, 0);
  if (!-[PKFreeTransformGestureRecognizer state](self, "state"))
  {
    if (-[PKFreeTransformGestureRecognizer canBegin](self, "canBegin")
      && (-[PKFreeTransformGestureRecognizer startThreshold](self, "startThreshold"),
          -[PKFreeTransformGestureRecognizer touchesMovedPastThreshold:](self, "touchesMovedPastThreshold:")))
    {
      -[PKFreeTransformGestureRecognizer setState:](self, "setState:", 1);
      -[PKFreeTransformGestureRecognizer resetStartingTouches](self, "resetStartingTouches");
    }
    else
    {
      -[PKFreeTransformGestureRecognizer cancelThreshold](self, "cancelThreshold");
      if (-[PKFreeTransformGestureRecognizer touchesMovedPastThreshold:](self, "touchesMovedPastThreshold:"))
        -[PKFreeTransformGestureRecognizer setState:](self, "setState:", 5);
    }
  }
  if (!-[PKFreeTransformGestureRecognizer isScaling](self, "isScaling"))
  {
    -[PKFreeTransformGestureRecognizer scaleThreshold](self, "scaleThreshold");
    if (-[PKFreeTransformGestureRecognizer touchesMovedPastScaleThreshold:](self, "touchesMovedPastScaleThreshold:"))
    {
      -[PKFreeTransformGestureRecognizer resetAndAccumulateTransform](self, "resetAndAccumulateTransform");
      -[PKFreeTransformGestureRecognizer setIsScaling:](self, "setIsScaling:", 1);
    }
  }
  if (!-[PKFreeTransformGestureRecognizer isPanning](self, "isPanning")
    && !-[PKFreeTransformGestureRecognizer isScaling](self, "isScaling")
    && (-[PKFreeTransformGestureRecognizer state](self, "state") == 1
     || -[PKFreeTransformGestureRecognizer state](self, "state") == 2))
  {
    if ((-[PKFreeTransformGestureRecognizer allowedPanEdges](self, "allowedPanEdges", 0.0) & 1) != 0)
      -[PKFreeTransformGestureRecognizer setIsPanning:](self, "setIsPanning:", 1);
    else
      -[PKFreeTransformGestureRecognizer setState:](self, "setState:", 4);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  int v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PKFreeTransformGestureRecognizer touches](self, "touches");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v7 - objc_msgSend(v5, "count") == 1
    && -[PKFreeTransformGestureRecognizer allowSingleTouchDrag](self, "allowSingleTouchDrag"))
  {
    v8 = -[PKFreeTransformGestureRecognizer axisAligned](self, "axisAligned");

    if (!v8)
    {
      -[PKFreeTransformGestureRecognizer resetAndAccumulateTransform](self, "resetAndAccumulateTransform");
      v9 = 0;
      goto LABEL_7;
    }
  }
  else
  {

  }
  v9 = 1;
LABEL_7:
  if (-[PKFreeTransformGestureRecognizer axisAligned](self, "axisAligned"))
  {
    -[PKFreeTransformGestureRecognizer setScaleDamping:](self, "setScaleDamping:", 0.0);
    -[PKFreeTransformGestureRecognizer resetAndAccumulateTransform](self, "resetAndAccumulateTransform");
    -[PKFreeTransformGestureRecognizer setScaleDamping:](self, "setScaleDamping:", 0.5);
  }
  -[PKFreeTransformGestureRecognizer touches](self, "touches");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v5);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[PKFreeTransformGestureRecognizer touchStartLocations](self, "touchStartLocations", (_QWORD)v20);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeObjectForKey:", v16);

        -[PKFreeTransformGestureRecognizer actualTouchStartLocations](self, "actualTouchStartLocations");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "removeObjectForKey:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  if (v9)
  {
    if (-[PKFreeTransformGestureRecognizer state](self, "state") == 1)
    {
      v19 = 3;
    }
    else if (-[PKFreeTransformGestureRecognizer state](self, "state") == 2)
    {
      v19 = 3;
    }
    else
    {
      v19 = 5;
    }
    -[PKFreeTransformGestureRecognizer setState:](self, "setState:", v19, (_QWORD)v20);
  }

}

- (void)clearTouches
{
  NSMutableOrderedSet *v3;
  NSMutableOrderedSet *touches;
  NSMapTable *v5;
  NSMapTable *touchStartLocations;
  NSMapTable *v7;
  NSMapTable *actualTouchStartLocations;

  v3 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
  touches = self->_touches;
  self->_touches = v3;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v5 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  touchStartLocations = self->_touchStartLocations;
  self->_touchStartLocations = v5;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v7 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  actualTouchStartLocations = self->_actualTouchStartLocations;
  self->_actualTouchStartLocations = v7;

}

- (double)startThreshold
{
  return self->_startThreshold;
}

- (void)setStartThreshold:(double)a3
{
  self->_startThreshold = a3;
}

- (double)scaleThreshold
{
  return self->_scaleThreshold;
}

- (void)setScaleThreshold:(double)a3
{
  self->_scaleThreshold = a3;
}

- (double)cancelThreshold
{
  return self->_cancelThreshold;
}

- (void)setCancelThreshold:(double)a3
{
  self->_cancelThreshold = a3;
}

- (unint64_t)allowedPanEdges
{
  return self->_allowedPanEdges;
}

- (void)setAllowedPanEdges:(unint64_t)a3
{
  self->_allowedPanEdges = a3;
}

- (BOOL)allowSingleTouchDrag
{
  return self->_allowSingleTouchDrag;
}

- (void)setAllowSingleTouchDrag:(BOOL)a3
{
  self->_allowSingleTouchDrag = a3;
}

- (BOOL)axisAligned
{
  return self->_axisAligned;
}

- (void)setAxisAligned:(BOOL)a3
{
  self->_axisAligned = a3;
}

- (double)minScale
{
  return self->_minScale;
}

- (void)setMinScale:(double)a3
{
  self->_minScale = a3;
}

- (double)maxScale
{
  return self->_maxScale;
}

- (void)setMaxScale:(double)a3
{
  self->_maxScale = a3;
}

- (double)scaleDamping
{
  return self->_scaleDamping;
}

- (void)setScaleDamping:(double)a3
{
  self->_scaleDamping = a3;
}

- (double)previousScale
{
  return self->_previousScale;
}

- (void)setPreviousScale:(double)a3
{
  self->_previousScale = a3;
}

- (NSMutableOrderedSet)touches
{
  return self->_touches;
}

- (BOOL)canBegin
{
  return self->_canBegin;
}

- (void)setCanBegin:(BOOL)a3
{
  self->_canBegin = a3;
}

- (BOOL)isScaling
{
  return self->_isScaling;
}

- (void)setIsScaling:(BOOL)a3
{
  self->_isScaling = a3;
}

- (BOOL)isPanning
{
  return self->_isPanning;
}

- (void)setIsPanning:(BOOL)a3
{
  self->_isPanning = a3;
}

- (double)deltaScale
{
  return self->_deltaScale;
}

- (void)setDeltaScale:(double)a3
{
  self->_deltaScale = a3;
}

- (CGAffineTransform)accumulatedTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[8].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[7].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[8].d;
  return self;
}

- (void)setAccumulatedTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_accumulatedTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_accumulatedTransform.c = v4;
  *(_OWORD *)&self->_accumulatedTransform.tx = v3;
}

- (NSMapTable)touchStartLocations
{
  return self->_touchStartLocations;
}

- (void)setTouchStartLocations:(id)a3
{
  objc_storeStrong((id *)&self->_touchStartLocations, a3);
}

- (NSMapTable)actualTouchStartLocations
{
  return self->_actualTouchStartLocations;
}

- (void)setActualTouchStartLocations:(id)a3
{
  objc_storeStrong((id *)&self->_actualTouchStartLocations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actualTouchStartLocations, 0);
  objc_storeStrong((id *)&self->_touchStartLocations, 0);
  objc_storeStrong((id *)&self->_touches, 0);
}

@end
