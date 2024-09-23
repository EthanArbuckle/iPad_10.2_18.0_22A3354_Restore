@implementation PKTextInputStrokeProvider

- (PKTextInputStrokeProvider)initWithDrawing:(id)a3
{
  id v4;
  PKTextInputStrokeProvider *v5;
  uint64_t v6;
  NSNumber *versionNumber;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTextInputStrokeProvider;
  v5 = -[PKStrokeProvider initWithDrawing:](&v9, sel_initWithDrawing_, v4);
  if (v5)
  {
    ++strokeProviderVersionCounter;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v6 = objc_claimAutoreleasedReturnValue();
    versionNumber = v5->_versionNumber;
    v5->_versionNumber = (NSNumber *)v6;

  }
  return v5;
}

- (NSNumber)strokeProviderVersion
{
  return self->_versionNumber;
}

- (CGRect)boundsForSliceIdentifiers:(id)a3
{
  id v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CGRect v29;
  CGRect v30;
  CGRect result;
  CGRect v32;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v9);
        -[PKStrokeProvider sliceForIdentifier:](self, "sliceForIdentifier:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v12), (_QWORD)v23);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "bounds");
          v32.origin.x = v15;
          v32.origin.y = v16;
          v32.size.width = v17;
          v32.size.height = v18;
          v29.origin.x = x;
          v29.origin.y = y;
          v29.size.width = width;
          v29.size.height = height;
          v30 = CGRectUnion(v29, v32);
          x = v30.origin.x;
          y = v30.origin.y;
          width = v30.size.width;
          height = v30.size.height;
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  v19 = x;
  v20 = y;
  v21 = width;
  v22 = height;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGPoint)centroidForSlicesWithIdentifiers:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t i;
  void *v12;
  void *v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CGPoint result;
  CGRect v30;
  CGRect v31;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v24;
    v9 = 0.0;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v6);
        -[PKStrokeProvider sliceForIdentifier:](self, "sliceForIdentifier:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), (_QWORD)v23);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          objc_msgSend(v12, "bounds");
          x = v30.origin.x;
          y = v30.origin.y;
          width = v30.size.width;
          height = v30.size.height;
          MidX = CGRectGetMidX(v30);
          v31.origin.x = x;
          v31.origin.y = y;
          v31.size.width = width;
          v31.size.height = height;
          v10 = v10 + MidX;
          v9 = v9 + CGRectGetMidY(v31);
        }
        else
        {
          --v5;
        }

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
    v10 = 0.0;
  }

  if (v5 < 1)
  {
    v19 = *MEMORY[0x1E0C9D538];
    v20 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    v19 = v10 / (double)v5;
    v20 = v9 / (double)v5;
  }

  v21 = v19;
  v22 = v20;
  result.y = v22;
  result.x = v21;
  return result;
}

- (CGPoint)startingPointForSlicesWithIdentifiers:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  double *v23;
  uint64_t v24;
  __n128 (*v25)(__n128 *, __n128 *);
  uint64_t (*v26)();
  const char *v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  CGPoint result;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = 0;
  v23 = (double *)&v22;
  v24 = 0x4012000000;
  v25 = __Block_byref_object_copy__21;
  v26 = __Block_byref_object_dispose__21;
  v27 = "";
  v28 = *MEMORY[0x1E0C9D538];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v4;
  v6 = 0;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v29, 16);
  if (!v7)
  {
    v12 = v5;
    goto LABEL_15;
  }
  v8 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v19 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      if (v6)
      {
        if (-[PKStrokeProvider compareOrderOfStrokeWithIdentifier:toStrokeWithIdentifier:](self, "compareOrderOfStrokeWithIdentifier:toStrokeWithIdentifier:", v6, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i)) == 1)
        {
          v11 = v10;

          v6 = v11;
        }
      }
      else
      {
        v6 = v10;
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v29, 16);
  }
  while (v7);

  if (v6)
  {
    -[PKStrokeProvider sliceForIdentifier:](self, "sliceForIdentifier:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __67__PKTextInputStrokeProvider_startingPointForSlicesWithIdentifiers___block_invoke;
    v17[3] = &unk_1E77775D8;
    v17[4] = &v22;
    objc_msgSend(v12, "enumeratePointsWithDistanceStep:usingBlock:", v17, 1.0);
LABEL_15:

  }
  v13 = v23[6];
  v14 = v23[7];

  _Block_object_dispose(&v22, 8);
  v15 = v13;
  v16 = v14;
  result.y = v16;
  result.x = v15;
  return result;
}

uint64_t __67__PKTextInputStrokeProvider_startingPointForSlicesWithIdentifiers___block_invoke(uint64_t result, _BYTE *a2, double a3, double a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  *(double *)(v4 + 48) = a3;
  *(double *)(v4 + 56) = a4;
  *a2 = 1;
  return result;
}

- (BOOL)slicesWithIdentifiers:(id)a3 significantlyOverlapRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  int v27;
  BOOL v28;
  id v30;
  _QWORD r2[5];
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[PKTextInputStrokeProvider boundsForSliceIdentifiers:](self, "boundsForSliceIdentifiers:", v9);
  *(CGFloat *)r2 = x;
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = height;
  if (CGRectIntersectsRect(v36, v43))
  {
    v30 = v9;
    v10 = objc_msgSend(v9, "count");
    v32 = 0u;
    v33 = 0u;
    memset(&r2[1], 0, 32);
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &r2[1], v34, 16);
    if (v12)
    {
      v13 = 0;
      v14 = 0;
      v15 = llround((double)v10 * 0.7);
      v16 = v10 - v15;
      v17 = *(_QWORD *)r2[3];
LABEL_4:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)r2[3] != v17)
          objc_enumerationMutation(v11);
        -[PKStrokeProvider sliceForIdentifier:](self, "sliceForIdentifier:", *(_QWORD *)(r2[2] + 8 * v18));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "bounds");
        v20 = v37.origin.x;
        v21 = v37.origin.y;
        v22 = v37.size.width;
        v23 = v37.size.height;
        if (CGRectGetHeight(v37) > 0.0)
        {
          v38.origin.x = v20;
          v38.origin.y = v21;
          v38.size.width = v22;
          v38.size.height = v23;
          if (CGRectGetWidth(v38) > 0.0)
          {
            v39.origin.x = v20;
            v39.origin.y = v21;
            v39.size.width = v22;
            v39.size.height = v23;
            *(_QWORD *)&v44.origin.x = r2[0];
            v44.origin.y = y;
            v44.size.width = width;
            v44.size.height = height;
            v40 = CGRectIntersection(v39, v44);
            v24 = CGRectGetHeight(v40);
            v41.origin.x = v20;
            v41.origin.y = v21;
            v41.size.width = v22;
            v41.size.height = v23;
            v25 = CGRectGetHeight(v41);
            *(_QWORD *)&v42.origin.x = r2[0];
            v42.origin.y = y;
            v42.size.width = width;
            v42.size.height = height;
            v26 = CGRectGetHeight(v42);
            if (v24 / v25 >= 0.6 || v24 / v26 >= 0.6)
            {
              if (++v14 >= v15)
              {
                v27 = 1;
                goto LABEL_20;
              }
            }
            else
            {
              if (v13 >= v16)
              {
                v27 = 0;
LABEL_20:

                goto LABEL_21;
              }
              ++v13;
            }
          }
        }

        if (v12 == ++v18)
        {
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &r2[1], v34, 16);
          if (v12)
            goto LABEL_4;
          break;
        }
      }
    }
    v27 = 0;
LABEL_21:

    v28 = v27 != 0;
    v9 = v30;
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (BOOL)containsStrokeWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKStrokeProvider drawing](self, "drawing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_visibleStrokeForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (id)strokesForSliceIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        -[PKStrokeProvider sliceForIdentifier:](self, "sliceForIdentifier:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stroke");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionNumber, 0);
}

@end
