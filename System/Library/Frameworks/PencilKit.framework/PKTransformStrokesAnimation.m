@implementation PKTransformStrokesAnimation

- (id)initWithStrokes:(double)a3 startTime:(double)a4 duration:(double)a5 destinationFrame:(double)a6 fadeOutDuration:(double)a7
{
  id v18;
  id *v19;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  uint64_t v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v40 = *MEMORY[0x1E0C80C00];
  v18 = a2;
  if (a1)
  {
    v38.receiver = a1;
    v38.super_class = (Class)PKTransformStrokesAnimation;
    v19 = (id *)objc_msgSendSuper2(&v38, sel_init);
    a1 = v19;
    if (v19)
    {
      objc_storeStrong(v19 + 1, a2);
      *((double *)a1 + 2) = a3;
      *((double *)a1 + 3) = a4;
      *((double *)a1 + 9) = a5;
      *((double *)a1 + 10) = a6;
      *((double *)a1 + 11) = a7;
      *((double *)a1 + 12) = a8;
      *((double *)a1 + 4) = a9;
      x = *MEMORY[0x1E0C9D628];
      y = *(double *)(MEMORY[0x1E0C9D628] + 8);
      width = *(double *)(MEMORY[0x1E0C9D628] + 16);
      height = *(double *)(MEMORY[0x1E0C9D628] + 24);
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v24 = v18;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v35;
        do
        {
          v28 = 0;
          do
          {
            if (*(_QWORD *)v35 != v27)
              objc_enumerationMutation(v24);
            objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v28), "renderBounds", (_QWORD)v34);
            v44.origin.x = v29;
            v44.origin.y = v30;
            v44.size.width = v31;
            v44.size.height = v32;
            v41.origin.x = x;
            v41.origin.y = y;
            v41.size.width = width;
            v41.size.height = height;
            v42 = CGRectUnion(v41, v44);
            x = v42.origin.x;
            y = v42.origin.y;
            width = v42.size.width;
            height = v42.size.height;
            ++v28;
          }
          while (v26 != v28);
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        }
        while (v26);
      }

      *((CGFloat *)a1 + 5) = x;
      *((CGFloat *)a1 + 6) = y;
      *((CGFloat *)a1 + 7) = width;
      *((CGFloat *)a1 + 8) = height;
      v43.origin.x = x;
      v43.origin.y = y;
      v43.size.width = width;
      v43.size.height = height;
      *(CGRect *)(a1 + 13) = CGRectUnion(v43, *(CGRect *)(a1 + 9));
    }
  }

  return a1;
}

- (void)newStrokesAtTime:(uint64_t)a1
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  void *v26;
  _OWORD v27[3];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v3 = *(double *)(a1 + 24);
  v4 = a2 - *(double *)(a1 + 16);
  v5 = v4 / v3;
  if (v4 / v3 > 1.0)
    v5 = 1.0;
  v6 = v5 * v5 * (v5 * -2.0 + 3.0);
  v33 = 0u;
  v34 = 0u;
  v7 = *(double *)(a1 + 40);
  if (*(double *)(a1 + 32) >= v3)
    v8 = v3;
  else
    v8 = *(double *)(a1 + 32);
  v32 = 0uLL;
  +[PKMetalUtility transformConvertingRect:toRect:percent:](PKMetalUtility, "transformConvertingRect:toRect:percent:", v7, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(_QWORD *)&v6);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = *(id *)(a1 + 8);
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = fmax(1.0 - v4 / v8, 0.0);
    v12 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v14, "ink");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "color");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "alphaComponent");
        objc_msgSend(v16, "colorWithAlphaComponent:", v11 * v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v14, "mutableCopy");
        v27[0] = v32;
        v27[1] = v33;
        v27[2] = v34;
        objc_msgSend(v19, "_applyTransform:", v27);
        objc_msgSend(v14, "ink");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "ink");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "weight");
        +[PKInk inkWithIdentifier:color:weight:](PKInk, "inkWithIdentifier:color:weight:", v21, v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setInk:", v23);

        objc_msgSend(v26, "addObject:", v19);
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    }
    while (v10);
  }

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokes, 0);
}

@end
