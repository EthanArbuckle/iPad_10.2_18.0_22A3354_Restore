@implementation AXGestureRecorderFingerPathCollection

- (AXGestureRecorderFingerPathCollection)init
{
  AXGestureRecorderFingerPathCollection *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXGestureRecorderFingerPathCollection;
  v2 = -[AXGestureRecorderFingerPathCollection init](&v4, sel_init);
  if (v2)

  return 0;
}

- (AXGestureRecorderFingerPathCollection)initWithMaximumFingerPathsCount:(unint64_t)a3
{
  AXGestureRecorderFingerPathCollection *v4;
  AXGestureRecorderFingerPathCollection *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXGestureRecorderFingerPathCollection;
  v4 = -[AXGestureRecorderFingerPathCollection init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[AXGestureRecorderFingerPathCollection setMaximumFingerPathsCount:](v4, "setMaximumFingerPathsCount:", a3);
    -[AXGestureRecorderFingerPathCollection _referenceTimesArrayIndexNeedsRefresh](v5, "_referenceTimesArrayIndexNeedsRefresh");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[AXGestureRecorderFingerPathCollection reset](self, "reset");
  v3.receiver = self;
  v3.super_class = (Class)AXGestureRecorderFingerPathCollection;
  -[AXGestureRecorderFingerPathCollection dealloc](&v3, sel_dealloc);
}

- (unint64_t)fingerPathsCount
{
  void *v2;
  unint64_t v3;

  -[AXGestureRecorderFingerPathCollection fingerPaths](self, "fingerPaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)timestampsCount
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[AXGestureRecorderFingerPathCollection shouldRecordRealTimeGesture](self, "shouldRecordRealTimeGesture"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[AXGestureRecorderFingerPathCollection timesArrays](self, "timesArrays", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v3);
          v6 += objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "count");
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }

    return v6;
  }
  else
  {
    -[AXGestureRecorderFingerPathCollection referenceTimesArray](self, "referenceTimesArray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    return v10;
  }
}

- (NSMutableArray)referenceTimesArray
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  unint64_t v13;
  void *v16;
  unint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (-[AXGestureRecorderFingerPathCollection shouldRecordRealTimeGesture](self, "shouldRecordRealTimeGesture"))
    _AXAssert();
  v3 = -[AXGestureRecorderFingerPathCollection referenceTimesArrayIndex](self, "referenceTimesArrayIndex");
  -[AXGestureRecorderFingerPathCollection timesArrays](self, "timesArrays");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = v5;
    v19 = v4;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v21;
      v11 = 0x7FFFFFFFFFFFFFFFLL;
      v3 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v6);
          v13 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "count", v18, v19, (_QWORD)v20);
          if (v11 == 0x7FFFFFFFFFFFFFFFLL || v13 > v11)
          {
            v11 = v13;
            v3 = v9 + i;
          }
        }
        v9 += v8;
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }
    else
    {
      v3 = 0x7FFFFFFFFFFFFFFFLL;
    }

    -[AXGestureRecorderFingerPathCollection setReferenceTimesArrayIndex:](self, "setReferenceTimesArrayIndex:", v3);
    v5 = v18;
    v4 = v19;
  }
  v16 = 0;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL && v3 < v5)
  {
    objc_msgSend(v4, "objectAtIndex:", v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSMutableArray *)v16;
}

- (id)fingerPathAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[AXGestureRecorderFingerPathCollection fingerPaths](self, "fingerPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fingerPathToAppendForIndex:(unint64_t)a3 forTimestampAtIndex:(unint64_t)a4
{
  if (-[AXGestureRecorderFingerPathCollection shouldRecordRealTimeGesture](self, "shouldRecordRealTimeGesture"))
    -[AXGestureRecorderFingerPathCollection _realTimeFingerPathToAppendForIndex:upToPositionForTimestampAtIndex:](self, "_realTimeFingerPathToAppendForIndex:upToPositionForTimestampAtIndex:", a3, a4);
  else
    -[AXGestureRecorderFingerPathCollection _nonRealTimeFingerPathToAppendForIndex:upToPositionForTimestampAtIndex:](self, "_nonRealTimeFingerPathToAppendForIndex:upToPositionForTimestampAtIndex:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_nonRealTimeFingerPathToAppendForIndex:(unint64_t)a3 upToPositionForTimestampAtIndex:(unint64_t)a4
{
  char *v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  char *v20;
  void *v21;
  void *v22;

  v4 = (char *)a4;
  if (-[AXGestureRecorderFingerPathCollection timestampsCount](self, "timestampsCount") <= a4)
  {
    v11 = 0;
  }
  else
  {
    -[AXGestureRecorderFingerPathCollection pointsArrays](self, "pointsArrays");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXGestureRecorderFingerPathCollection forcesArrays](self, "forcesArrays");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count") <= (unint64_t)v4)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count") > (unint64_t)v4)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "CGPointValue");
        v14 = v13;
        v16 = v15;

        objc_msgSend(v10, "objectAtIndexedSubscript:", v4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "doubleValue");
        v19 = v18;

        if (v4)
        {
          v20 = v4 - 1;
          objc_msgSend(v8, "objectAtIndexedSubscript:", v4 - 1);
          v4 = (char *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectAtIndexedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v21 = 0;
        }
        -[AXGestureRecorderFingerPathCollection _bezierPathToAppendForTouchLocation:unnamedValue:optionalPreviousTouchLocation:optionalPreviousForce:](self, "_bezierPathToAppendForTouchLocation:unnamedValue:optionalPreviousTouchLocation:optionalPreviousForce:", v4, v21, v14, v16, v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "appendBezierPath:", v22);

      }
    }

  }
  return v11;
}

- (id)_realTimeFingerPathToAppendForIndex:(unint64_t)a3 upToPositionForTimestampAtIndex:(unint64_t)a4
{
  char *v4;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  char *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v44;
  double v45;
  _QWORD v46[6];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;

  v4 = (char *)a4;
  if (-[AXGestureRecorderFingerPathCollection timestampsCount](self, "timestampsCount") > a4)
  {
    -[AXGestureRecorderFingerPathCollection timestampAtIndex:](self, "timestampAtIndex:", v4);
    v8 = v7;
    v47 = 0;
    v48 = &v47;
    v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__0;
    v51 = __Block_byref_object_dispose__0;
    v52 = 0;
    -[AXGestureRecorderFingerPathCollection touchPathIndicesToFingerPathIndices](self, "touchPathIndicesToFingerPathIndices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __109__AXGestureRecorderFingerPathCollection__realTimeFingerPathToAppendForIndex_upToPositionForTimestampAtIndex___block_invoke;
    v46[3] = &unk_1E76ABBE8;
    v46[4] = &v47;
    v46[5] = a3;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v46);

    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXGestureRecorderFingerPathCollection replayableGesture](self, "replayableGesture");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "numberOfEvents");

    if (v12 <= (unint64_t)v4)
    {
      _AXAssert();
LABEL_25:
      _Block_object_dispose(&v47, 8);

      return v10;
    }
    while (1)
    {
      -[AXGestureRecorderFingerPathCollection replayableGesture](self, "replayableGesture");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeAtEventIndex:", v4);
      v15 = v14;

      if (v15 >= v8 || (unint64_t)v4 >= v12)
        break;
      ++v4;
    }
    if ((unint64_t)v4 >= v12)
    {
      v44 = v8;
      _AXAssert();
    }
    -[AXGestureRecorderFingerPathCollection replayableGesture](self, "replayableGesture", *(_QWORD *)&v44);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeAtEventIndex:", v4);
    v19 = v18;

    if (v19 != v8)
    {
      v45 = v8;
      _AXAssert();
    }
    if ((unint64_t)v4 >= v12)
      goto LABEL_25;
    -[AXGestureRecorderFingerPathCollection replayableGesture](self, "replayableGesture");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timeAtEventIndex:", v4);
    v22 = v21;

    if (v22 != v8 || v4 == (char *)0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_25;
    -[AXGestureRecorderFingerPathCollection replayableGesture](self, "replayableGesture");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "fingerIdentifiersAtEventIndex:", v4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v24, "containsObject:", v48[5]))
    {
LABEL_24:

      goto LABEL_25;
    }
    -[AXGestureRecorderFingerPathCollection replayableGesture](self, "replayableGesture");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "pointForFingerIdentifier:atEventIndex:", v48[5], v4);
    v27 = v26;
    v29 = v28;

    -[AXGestureRecorderFingerPathCollection replayableGesture](self, "replayableGesture");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "forceForFingerIdentifier:atEventIndex:", v48[5], v4);
    v32 = v31;

    if (v4)
    {
      -[AXGestureRecorderFingerPathCollection replayableGesture](self, "replayableGesture");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v4 - 1;
      objc_msgSend(v33, "fingerIdentifiersAtEventIndex:", v4 - 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "containsObject:", v48[5]);

      if (v36)
      {
        v37 = (void *)MEMORY[0x1E0CB3B18];
        -[AXGestureRecorderFingerPathCollection replayableGesture](self, "replayableGesture");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "pointForFingerIdentifier:atEventIndex:", v48[5], v34);
        objc_msgSend(v37, "valueWithCGPoint:");
        v4 = (char *)objc_claimAutoreleasedReturnValue();

        v39 = (void *)MEMORY[0x1E0CB37E8];
        -[AXGestureRecorderFingerPathCollection replayableGesture](self, "replayableGesture");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "forceForFingerIdentifier:atEventIndex:", v48[5], v34);
        objc_msgSend(v39, "numberWithDouble:");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
        -[AXGestureRecorderFingerPathCollection _bezierPathToAppendForTouchLocation:unnamedValue:optionalPreviousTouchLocation:optionalPreviousForce:](self, "_bezierPathToAppendForTouchLocation:unnamedValue:optionalPreviousTouchLocation:optionalPreviousForce:", v4, v41, v27, v29, v32, *(_QWORD *)&v45);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "appendBezierPath:", v42);

        goto LABEL_24;
      }
      v4 = 0;
    }
    v41 = 0;
    goto LABEL_23;
  }
  v10 = 0;
  return v10;
}

void __109__AXGestureRecorderFingerPathCollection__realTimeFingerPathToAppendForIndex_upToPositionForTimestampAtIndex___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(a3, "unsignedIntegerValue") == *(_QWORD *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (double)timestampAtIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[AXGestureRecorderFingerPathCollection shouldRecordRealTimeGesture](self, "shouldRecordRealTimeGesture"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[AXGestureRecorderFingerPathCollection timesArrays](self, "timesArrays", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    v7 = 0.0;
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (a3 < objc_msgSend(v11, "count"))
          {
            v12 = v11;
            goto LABEL_13;
          }
          a3 -= objc_msgSend(v11, "count");
        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v8)
          continue;
        break;
      }
    }
  }
  else
  {
    -[AXGestureRecorderFingerPathCollection referenceTimesArray](self, "referenceTimesArray");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v12;
LABEL_13:
    objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v7 = v14;

  }
  return v7;
}

- (id)propertyListRepresentationWithName:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSString *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSString *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  AXGestureRecorderFingerPathCollection *v34;
  id v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;
  CGPoint v48;

  v47 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v4 = (void *)objc_opt_new();
  v34 = self;
  -[AXGestureRecorderFingerPathCollection pointsArrays](self, "pointsArrays");
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v42;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v42 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v8);
        v10 = (void *)objc_opt_new();
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v11 = v9;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v38;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v38 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v15), "CGPointValue");
              NSStringFromCGPoint(v48);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "addObject:", v16);

              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          }
          while (v13);
        }

        objc_msgSend(v4, "addObject:", v10);
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v6);
  }
  v17 = objc_msgSend(v4, "count");
  if (!v17)
    goto LABEL_28;
  v18 = v17;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  do
  {
    objc_msgSend(v4, "objectAtIndex:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndex:", 0);
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();
    CGPointFromString(v23);

    v24 = v21 + 1;
    if (v21 + 1 < v18)
    {
      v25 = v21 + 1;
      do
      {
        objc_msgSend(v4, "objectAtIndex:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectAtIndex:", 0);
        v27 = (NSString *)objc_claimAutoreleasedReturnValue();
        CGPointFromString(v27);

        AX_CGPointGetDistanceToPoint();
        if (v28 < 15.0
          && (unint64_t)objc_msgSend(v22, "count") <= 2
          && (unint64_t)objc_msgSend(v26, "count") >= 9)
        {
          if (!v19)
            v19 = (id)objc_msgSend(v4, "mutableCopy");
          objc_msgSend(v19, "removeObjectAtIndex:", v21 - v20++);
        }

        ++v25;
      }
      while (v18 != v25);
    }

    ++v21;
  }
  while (v24 != v18);
  if (!v19)
LABEL_28:
    v19 = v4;
  v29 = (void *)MEMORY[0x1E0C99D80];
  -[AXGestureRecorderFingerPathCollection forcesArrays](v34, "forcesArrays");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXGestureRecorderFingerPathCollection timesArrays](v34, "timesArrays");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "dictionaryWithObjectsAndKeys:", v35, CFSTR("Name"), v19, CFSTR("Points"), v30, CFSTR("Forces"), v31, CFSTR("Times"), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (CGPoint)_interfaceOrientedScreenPointForPoint:(CGPoint)a3 view:(id)a4
{
  double y;
  double x;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v6 = a4;
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:toView:", 0, x, y);
  v9 = v8;
  v11 = v10;

  objc_msgSend(v7, "convertPoint:toWindow:", 0, v9, v11);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (id)_bezierPathToAppendForTouchLocation:(CGPoint)a3 unnamedValue:(double)a4 optionalPreviousTouchLocation:(id)a5 optionalPreviousForce:(id)a6
{
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  __double2 v35;
  __double2 v36;
  double v38;
  double v39;

  y = a3.y;
  x = a3.x;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXGestureRecorderFingerPathCollection minimumFingerLineWidth](self, "minimumFingerLineWidth");
  v15 = v14;
  v16 = a4 / 2000.0;
  -[AXGestureRecorderFingerPathCollection maximumFingerLineWidth](self, "maximumFingerLineWidth");
  v18 = v17;
  -[AXGestureRecorderFingerPathCollection minimumFingerLineWidth](self, "minimumFingerLineWidth");
  v20 = (v15 + v16 * (v18 - v19)) * 0.5;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, x, y, v20, 0.0, 6.28318531);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendPath:", v21);
  if (v11)
  {
    objc_msgSend(v11, "CGPointValue");
    v24 = v23;
    if (v23 != x || v22 != y)
    {
      v39 = v22;
      objc_msgSend(v12, "doubleValue");
      v26 = v25;
      -[AXGestureRecorderFingerPathCollection minimumFingerLineWidth](self, "minimumFingerLineWidth");
      v28 = v27;
      v29 = v26 / 2000.0;
      -[AXGestureRecorderFingerPathCollection maximumFingerLineWidth](self, "maximumFingerLineWidth");
      v31 = v30;
      -[AXGestureRecorderFingerPathCollection minimumFingerLineWidth](self, "minimumFingerLineWidth");
      v33 = (v28 + v29 * (v31 - v32)) * 0.5;
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = atan2(y - v39, x - v24);
      v35 = __sincos_stret(v38 + -1.57079633);
      objc_msgSend(v34, "moveToPoint:", v24 + v33 * v35.__cosval, v39 + v33 * v35.__sinval);
      objc_msgSend(v34, "addLineToPoint:", x + v20 * v35.__cosval, y + v20 * v35.__sinval);
      v36 = __sincos_stret(v38 + 1.57079633);
      objc_msgSend(v34, "addLineToPoint:", x + v20 * v36.__cosval, y + v20 * v36.__sinval);
      objc_msgSend(v34, "addLineToPoint:", v24 + v33 * v36.__cosval, v39 + v33 * v36.__sinval);
      objc_msgSend(v34, "closePath");
      objc_msgSend(v13, "appendPath:", v34);

    }
  }

  return v13;
}

- (void)appendPointsForTouches:(id)a3 referenceView:(id)a4 time:(double)a5
{
  id v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *context;
  id v55;
  id obj;
  void *v57;
  unint64_t v58;
  uint64_t v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  AXGestureRecorderFingerPathCollection *v72;
  _QWORD v73[4];
  id v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v62 = a4;
  -[AXGestureRecorderFingerPathCollection fingerPaths](self, "fingerPaths");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v71, "count");
  v72 = self;
  if (v9 > -[AXGestureRecorderFingerPathCollection maximumFingerPathsCount](self, "maximumFingerPathsCount"))
    goto LABEL_28;
  context = (void *)MEMORY[0x1C3B77550]();
  -[AXGestureRecorderFingerPathCollection timesArrays](self, "timesArrays");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  v12 = v11;
  if (!v10)
  {
    v10 = (void *)objc_opt_new();
    -[AXGestureRecorderFingerPathCollection setTimesArrays:](v72, "setTimesArrays:", v10);
    if (v12)
      goto LABEL_4;
LABEL_6:
    v13 = (void *)objc_opt_new();
    objc_msgSend(v10, "addObject:", v13);
    goto LABEL_7;
  }
  if (!v11)
    goto LABEL_6;
LABEL_4:
  objc_msgSend(v10, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", a5);
  objc_msgSend(v13, "addObject:");
  -[AXGestureRecorderFingerPathCollection pointsArrays](v72, "pointsArrays");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXGestureRecorderFingerPathCollection forcesArrays](v72, "forcesArrays");
  v14 = objc_claimAutoreleasedReturnValue();
  -[AXGestureRecorderFingerPathCollection touchPathIndicesToFingerPathIndices](v72, "touchPathIndicesToFingerPathIndices");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v10;
  if (v9)
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, v9);
  else
    v57 = 0;
  v66 = (void *)v14;
  v61 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v60 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  obj = v8;
  v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
  v55 = v8;
  v52 = v13;
  if (v63)
  {
    v58 = v9;
    v59 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v63; ++i)
      {
        if (*(_QWORD *)v77 != v59)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "_pathIndex");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v18);
        v70 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "locationInView:", v62);
        v21 = v20;
        v23 = v22;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:");
        v68 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_pressure");
        v25 = v24;
        v26 = objc_alloc(MEMORY[0x1E0CB37E8]);
        *(float *)&v27 = v25;
        v28 = (void *)objc_msgSend(v26, "initWithFloat:", v27);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v18);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setObject:forKeyedSubscript:", v28, v29);

        v30 = (void *)MEMORY[0x1E0CB3B18];
        -[AXGestureRecorderFingerPathCollection _interfaceOrientedScreenPointForPoint:view:](v72, "_interfaceOrientedScreenPointForPoint:view:", v62, v21, v23);
        objc_msgSend(v30, "valueWithCGPoint:");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v18);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "setObject:forKeyedSubscript:", v31, v32);

        if (v19)
        {
          v69 = v19;
          v33 = objc_msgSend(v19, "unsignedIntegerValue");
          objc_msgSend(v67, "objectAtIndex:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "objectAtIndex:", v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "lastObject");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "lastObject");
          v64 = v15;
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "objectAtIndex:", v33);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXGestureRecorderFingerPathCollection _bezierPathToAppendForTouchLocation:unnamedValue:optionalPreviousTouchLocation:optionalPreviousForce:](v72, "_bezierPathToAppendForTouchLocation:unnamedValue:optionalPreviousTouchLocation:optionalPreviousForce:", v37, v36, v21, v23, v25);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "appendBezierPath:", v39);
          objc_msgSend(v34, "addObject:", v68);
          objc_msgSend(v35, "addObject:", v28);
          objc_msgSend(v57, "removeIndex:", v33);
          -[AXGestureRecorderFingerPathCollection _didUpdateFingerPathAtIndex:](v72, "_didUpdateFingerPathAtIndex:", v33);

          v40 = (void *)v70;
          v41 = (void *)v68;
          v15 = v64;
        }
        else
        {
          v42 = v28;
          v41 = (void *)v68;
          if (!v71)
          {
            v71 = (void *)objc_opt_new();
            -[AXGestureRecorderFingerPathCollection setFingerPaths:](v72, "setFingerPaths:");
          }
          -[AXGestureRecorderFingerPathCollection _bezierPathToAppendForTouchLocation:unnamedValue:optionalPreviousTouchLocation:optionalPreviousForce:](v72, "_bezierPathToAppendForTouchLocation:unnamedValue:optionalPreviousTouchLocation:optionalPreviousForce:", 0, 0, v21, v23, v25);
          v43 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "addObject:", v43);
          v44 = v67;
          v65 = (void *)v43;
          if (v67)
          {
            v45 = v68;
            v46 = v66;
          }
          else
          {
            v47 = objc_opt_new();
            -[AXGestureRecorderFingerPathCollection setPointsArrays:](v72, "setPointsArrays:", v47);
            v48 = objc_opt_new();

            -[AXGestureRecorderFingerPathCollection setForcesArrays:](v72, "setForcesArrays:", v48);
            v46 = (void *)v48;
            v44 = (void *)v47;
            v45 = v68;
          }
          v35 = (void *)objc_opt_new();
          objc_msgSend(v35, "addObject:", v45);
          v67 = v44;
          objc_msgSend(v44, "addObject:", v35);
          v36 = (void *)objc_opt_new();
          objc_msgSend(v36, "addObject:", v42);
          v66 = v46;
          objc_msgSend(v46, "addObject:", v36);
          if (!v15)
          {
            v15 = (void *)objc_opt_new();
            -[AXGestureRecorderFingerPathCollection setTouchPathIndicesToFingerPathIndices:](v72, "setTouchPathIndicesToFingerPathIndices:", v15);
          }
          v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", v58);
          v40 = (void *)v70;
          objc_msgSend(v15, "setObject:forKey:");
          -[AXGestureRecorderFingerPathCollection _didInsertFingerPathAtIndex:](v72, "_didInsertFingerPathAtIndex:", v58++);
          v28 = v42;
          v34 = v65;
        }

      }
      v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
    }
    while (v63);
  }

  v73[0] = MEMORY[0x1E0C809B0];
  v73[1] = 3221225472;
  v73[2] = __83__AXGestureRecorderFingerPathCollection_appendPointsForTouches_referenceView_time___block_invoke;
  v73[3] = &unk_1E76ABC10;
  v74 = v67;
  v75 = v66;
  v49 = v66;
  v50 = v67;
  objc_msgSend(v57, "enumerateIndexesUsingBlock:", v73);
  -[AXGestureRecorderFingerPathCollection _addPointsToReplayableGesture:forces:time:](v72, "_addPointsToReplayableGesture:forces:time:", v60, v61, a5);
  -[AXGestureRecorderFingerPathCollection _referenceTimesArrayIndexNeedsRefresh](v72, "_referenceTimesArrayIndexNeedsRefresh");

  objc_autoreleasePoolPop(context);
  v8 = v55;
LABEL_28:

}

void __83__AXGestureRecorderFingerPathCollection_appendPointsForTouches_referenceView_time___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

}

- (void)handleLiftForTouches:(id)a3 referenceView:(id)a4 time:(double)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  AXGestureRecorderFingerPathCollection *v41;
  id obj;
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
  v7 = a3;
  -[AXGestureRecorderFingerPathCollection replayableGesture](self, "replayableGesture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "numberOfEvents");

  if (v9)
  {
    v41 = self;
    -[AXGestureRecorderFingerPathCollection replayableGesture](self, "replayableGesture");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v10, "numberOfEvents") - 1;

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v7, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v7, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v37 = v7;
    v13 = v7;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v48 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v18, "_pathIndex", v37));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v19);

          objc_msgSend(v18, "_pressure");
          *(float *)&v20 = v20;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v21);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      }
      while (v15);
    }

    -[AXGestureRecorderFingerPathCollection replayableGesture](v41, "replayableGesture");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "fingerIdentifiersAtEventIndex:", v40);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v23;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v44 != v26)
            objc_enumerationMutation(obj);
          v28 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
          if ((objc_msgSend(v11, "containsObject:", v28, v37) & 1) == 0)
          {
            v29 = (void *)MEMORY[0x1E0CB3B18];
            -[AXGestureRecorderFingerPathCollection replayableGesture](v41, "replayableGesture");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "pointForFingerIdentifier:atEventIndex:", v28, v40);
            objc_msgSend(v29, "valueWithCGPoint:");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "setObject:forKeyedSubscript:", v31, v28);

            v32 = (void *)MEMORY[0x1E0CB37E8];
            -[AXGestureRecorderFingerPathCollection replayableGesture](v41, "replayableGesture");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "forceForFingerIdentifier:atEventIndex:", v28, v40);
            *(float *)&v34 = v34;
            objc_msgSend(v32, "numberWithFloat:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "setObject:forKeyedSubscript:", v35, v28);

          }
        }
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      }
      while (v25);
    }

    -[AXGestureRecorderFingerPathCollection replayableGesture](v41, "replayableGesture");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addPointsByFingerIdentifier:forces:atTime:", v39, v38, a5);

    v7 = v37;
  }

}

- (void)appendFingerPathsFromFingerPathCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id obj;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[AXGestureRecorderFingerPathCollection fingerPaths](self, "fingerPaths");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v5, "count");

    objc_msgSend(v4, "fingerPaths");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[AXGestureRecorderFingerPathCollection fingerPaths](self, "fingerPaths");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "addObjectsFromArray:", v6);
      }
      else
      {
        v9 = (void *)objc_msgSend(v6, "mutableCopy");
        -[AXGestureRecorderFingerPathCollection setFingerPaths:](self, "setFingerPaths:", v9);

      }
    }
    objc_msgSend(v4, "pointsArrays");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[AXGestureRecorderFingerPathCollection pointsArrays](self, "pointsArrays");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "addObjectsFromArray:", v10);
      }
      else
      {
        v13 = (void *)objc_msgSend(v10, "mutableCopy");
        -[AXGestureRecorderFingerPathCollection setPointsArrays:](self, "setPointsArrays:", v13);

      }
    }
    objc_msgSend(v4, "forcesArrays");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[AXGestureRecorderFingerPathCollection forcesArrays](self, "forcesArrays");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "addObjectsFromArray:", v14);
      }
      else
      {
        v17 = (void *)objc_msgSend(v14, "mutableCopy");
        -[AXGestureRecorderFingerPathCollection setForcesArrays:](self, "setForcesArrays:", v17);

      }
    }
    objc_msgSend(v4, "timesArrays");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[AXGestureRecorderFingerPathCollection timesArrays](self, "timesArrays");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        objc_msgSend(v19, "addObjectsFromArray:", v18);
      }
      else
      {
        v21 = (void *)objc_msgSend(v18, "mutableCopy");
        -[AXGestureRecorderFingerPathCollection setTimesArrays:](self, "setTimesArrays:", v21);

      }
    }
    -[AXGestureRecorderFingerPathCollection touchPathIndicesToFingerPathIndices](self, "touchPathIndicesToFingerPathIndices");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v38 = v18;
      v39 = v14;
      v40 = v10;
      v41 = v6;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v23 = v4;
      objc_msgSend(v4, "touchPathIndicesToFingerPathIndices");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v45 != v26)
              objc_enumerationMutation(obj);
            v28 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
            v29 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v23, "touchPathIndicesToFingerPathIndices");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKeyedSubscript:", v28);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "numberWithUnsignedInteger:", objc_msgSend(v31, "unsignedIntegerValue") + v43);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXGestureRecorderFingerPathCollection touchPathIndicesToFingerPathIndices](self, "touchPathIndicesToFingerPathIndices");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setObject:forKeyedSubscript:", v32, v28);

          }
          v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        }
        while (v25);
      }

      v4 = v23;
      v10 = v40;
      v6 = v41;
      v18 = v38;
      v14 = v39;
    }
    else
    {
      objc_msgSend(v4, "touchPathIndicesToFingerPathIndices");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXGestureRecorderFingerPathCollection setTouchPathIndicesToFingerPathIndices:](self, "setTouchPathIndicesToFingerPathIndices:", v34);

    }
    -[AXGestureRecorderFingerPathCollection replayableGesture](self, "replayableGesture");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      -[AXGestureRecorderFingerPathCollection replayableGesture](self, "replayableGesture");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "replayableGesture");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addPointsFromReplayableGesture:", v37);

    }
    else
    {
      objc_msgSend(v4, "replayableGesture");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXGestureRecorderFingerPathCollection setReplayableGesture:](self, "setReplayableGesture:", v36);
    }

    -[AXGestureRecorderFingerPathCollection _referenceTimesArrayIndexNeedsRefresh](self, "_referenceTimesArrayIndexNeedsRefresh");
  }

}

- (void)reset
{
  -[AXGestureRecorderFingerPathCollection setFingerPaths:](self, "setFingerPaths:", 0);
  -[AXGestureRecorderFingerPathCollection setPointsArrays:](self, "setPointsArrays:", 0);
  -[AXGestureRecorderFingerPathCollection setTouchPathIndicesToFingerPathIndices:](self, "setTouchPathIndicesToFingerPathIndices:", 0);
  -[AXGestureRecorderFingerPathCollection setForcesArrays:](self, "setForcesArrays:", 0);
  -[AXGestureRecorderFingerPathCollection setTimesArrays:](self, "setTimesArrays:", 0);
  -[AXGestureRecorderFingerPathCollection setReplayableGesture:](self, "setReplayableGesture:", 0);
  -[AXGestureRecorderFingerPathCollection _referenceTimesArrayIndexNeedsRefresh](self, "_referenceTimesArrayIndexNeedsRefresh");
}

- (void)_referenceTimesArrayIndexNeedsRefresh
{
  -[AXGestureRecorderFingerPathCollection setReferenceTimesArrayIndex:](self, "setReferenceTimesArrayIndex:", 0x7FFFFFFFFFFFFFFFLL);
}

- (void)_addPointsToReplayableGesture:(id)a3 forces:(id)a4 time:(double)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v31 = a4;
  -[AXGestureRecorderFingerPathCollection replayableGesture](self, "replayableGesture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CF4E88]);
    -[AXGestureRecorderFingerPathCollection setReplayableGesture:](self, "setReplayableGesture:", v10);

  }
  -[AXGestureRecorderFingerPathCollection replayableGesture](self, "replayableGesture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "numberOfEvents");

  if (v12)
  {
    -[AXGestureRecorderFingerPathCollection replayableGesture](self, "replayableGesture");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "numberOfEvents") - 1;

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[AXGestureRecorderFingerPathCollection replayableGesture](self, "replayableGesture");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fingerIdentifiersAtEventIndex:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v33 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v22)
          {
            v23 = (void *)MEMORY[0x1E0CB3B18];
            -[AXGestureRecorderFingerPathCollection replayableGesture](self, "replayableGesture");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "pointForFingerIdentifier:atEventIndex:", v21, v14);
            objc_msgSend(v23, "valueWithCGPoint:");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, v21);

            v26 = (void *)MEMORY[0x1E0CB37E8];
            -[AXGestureRecorderFingerPathCollection replayableGesture](self, "replayableGesture");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "forceForFingerIdentifier:atEventIndex:", v21, v14);
            *(float *)&v28 = v28;
            objc_msgSend(v26, "numberWithFloat:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v29, v21);

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v18);
    }

  }
  -[AXGestureRecorderFingerPathCollection replayableGesture](self, "replayableGesture");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addPointsByFingerIdentifier:forces:atTime:", v8, v31, a5);

}

- (void)_didInsertFingerPathAtIndex:(unint64_t)a3
{
  id v5;

  -[AXGestureRecorderFingerPathCollection delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "gestureRecorderFingerPathCollection:didInsertFingerPathAtIndex:", self, a3);

}

- (void)_didUpdateFingerPathAtIndex:(unint64_t)a3
{
  id v5;

  -[AXGestureRecorderFingerPathCollection delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "gestureRecorderFingerPathCollection:didUpdateFingerPathAtIndex:", self, a3);

}

- (AXGestureRecorderFingerPathCollectionDelegate)delegate
{
  return (AXGestureRecorderFingerPathCollectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)maximumFingerPathsCount
{
  return self->_maximumFingerPathsCount;
}

- (void)setMaximumFingerPathsCount:(unint64_t)a3
{
  self->_maximumFingerPathsCount = a3;
}

- (unint64_t)referenceTimesArrayIndex
{
  return self->_referenceTimesArrayIndex;
}

- (void)setReferenceTimesArrayIndex:(unint64_t)a3
{
  self->_referenceTimesArrayIndex = a3;
}

- (NSMutableArray)fingerPaths
{
  return self->_fingerPaths;
}

- (void)setFingerPaths:(id)a3
{
  objc_storeStrong((id *)&self->_fingerPaths, a3);
}

- (NSMutableArray)pointsArrays
{
  return self->_pointsArrays;
}

- (void)setPointsArrays:(id)a3
{
  objc_storeStrong((id *)&self->_pointsArrays, a3);
}

- (NSMutableArray)forcesArrays
{
  return self->_forcesArrays;
}

- (void)setForcesArrays:(id)a3
{
  objc_storeStrong((id *)&self->_forcesArrays, a3);
}

- (NSMutableDictionary)touchPathIndicesToFingerPathIndices
{
  return self->_touchPathIndicesToFingerPathIndices;
}

- (void)setTouchPathIndicesToFingerPathIndices:(id)a3
{
  objc_storeStrong((id *)&self->_touchPathIndicesToFingerPathIndices, a3);
}

- (NSMutableArray)timesArrays
{
  return self->_timesArrays;
}

- (void)setTimesArrays:(id)a3
{
  objc_storeStrong((id *)&self->_timesArrays, a3);
}

- (BOOL)shouldRecordRealTimeGesture
{
  return self->_shouldRecordRealTimeGesture;
}

- (void)setShouldRecordRealTimeGesture:(BOOL)a3
{
  self->_shouldRecordRealTimeGesture = a3;
}

- (double)minimumFingerLineWidth
{
  return self->_minimumFingerLineWidth;
}

- (void)setMinimumFingerLineWidth:(double)a3
{
  self->_minimumFingerLineWidth = a3;
}

- (double)maximumFingerLineWidth
{
  return self->_maximumFingerLineWidth;
}

- (void)setMaximumFingerLineWidth:(double)a3
{
  self->_maximumFingerLineWidth = a3;
}

- (AXMutableReplayableGesture)replayableGesture
{
  return self->_replayableGesture;
}

- (void)setReplayableGesture:(id)a3
{
  objc_storeStrong((id *)&self->_replayableGesture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replayableGesture, 0);
  objc_storeStrong((id *)&self->_timesArrays, 0);
  objc_storeStrong((id *)&self->_touchPathIndicesToFingerPathIndices, 0);
  objc_storeStrong((id *)&self->_forcesArrays, 0);
  objc_storeStrong((id *)&self->_pointsArrays, 0);
  objc_storeStrong((id *)&self->_fingerPaths, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
