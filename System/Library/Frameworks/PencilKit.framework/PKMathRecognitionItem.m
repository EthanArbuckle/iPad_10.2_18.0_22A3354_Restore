@implementation PKMathRecognitionItem

- (char)initWithStrokeGroupItem:(void *)a3 uuid:
{
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  int v14;
  char v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  objc_super v53;
  _BYTE v54[128];
  _QWORD v55[3];

  v55[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (!a1)
    goto LABEL_39;
  v53.receiver = a1;
  v53.super_class = (Class)PKMathRecognitionItem;
  a1 = (char *)objc_msgSendSuper2(&v53, sel_init);
  if (!a1)
    goto LABEL_39;
  if (v6)
    v8 = (void *)v6[1];
  else
    v8 = 0;
  v9 = v8;
  objc_msgSend(v9, "mathResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredTranscription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)a1 + 1, a2);
  if (v6)
  {
    v12 = *((_OWORD *)v6 + 2);
    v13 = *((_OWORD *)v6 + 3);
  }
  else
  {
    v12 = 0uLL;
    v13 = 0uLL;
  }
  *(_OWORD *)(a1 + 136) = v12;
  *(_OWORD *)(a1 + 152) = v13;
  if ((unint64_t)objc_msgSend(v11, "length") <= 1)
  {
    a1[64] = 0;
    goto LABEL_11;
  }
  v14 = objc_msgSend(v11, "characterAtIndex:", objc_msgSend(v11, "length") - 1);
  a1[64] = v14 == 61;
  if (v14 != 61)
  {
LABEL_11:
    v15 = objc_msgSend(v11, "hasSuffix:", CFSTR("\\hline \\end{array}"));
    a1[64] = v15;
    a1[65] = v15;
  }
  objc_storeStrong((id *)a1 + 9, v11);
  v48 = v11;
  if (v6)
    v16 = (void *)v6[1];
  else
    v16 = 0;
  v17 = v16;
  objc_msgSend(v17, "mathResult");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "selectedTranscriptionPathIndex");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v20 = (void *)v6[1];
  else
    v20 = 0;
  v21 = v20;
  objc_msgSend(v21, "mathResult");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "transcriptionPaths");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v19)
  {
    if (v6)
      v25 = (void *)v6[1];
    else
      v25 = 0;
    v26 = v25;
    objc_msgSend(v26, "mathResult");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "selectedTranscriptionPathIndex");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectAtIndexedSubscript:", objc_msgSend(v28, "integerValue"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)*((_QWORD *)a1 + 7);
    *((_QWORD *)a1 + 7) = v30;

  }
  else
  {
    v32 = objc_msgSend(v23, "copy");
    v26 = (id)*((_QWORD *)a1 + 7);
    *((_QWORD *)a1 + 7) = v32;
  }

  if (v7)
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    -[PKMathRecognitionItem strokesForIdentifier](a1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v34)
    {
      v35 = v34;
      v36 = 0;
      v37 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v50 != v37)
            objc_enumerationMutation(v33);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "_strokeUUID");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "isEqual:", v7);

          v36 |= v40;
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      }
      while (v35);

      if ((v36 & 1) != 0)
        goto LABEL_35;
    }
    else
    {

    }
    -[PKMathRecognitionItem strokesForIdentifier](a1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "firstObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "_strokeUUID");
    v43 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PKMathRecognitionItem strokesForIdentifier](a1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "firstObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "_strokeUUID");
    v43 = objc_claimAutoreleasedReturnValue();
  }

  v7 = (id)v43;
LABEL_35:
  if (v7)
  {
    v44 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v44 = (id)objc_claimAutoreleasedReturnValue();
  }
  v45 = (void *)*((_QWORD *)a1 + 10);
  *((_QWORD *)a1 + 10) = v44;

  -[PKMathRecognitionItem heroStroke](a1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  a1[66] = (objc_msgSend(v46, "_flags") & 0x20000000000) != 0;

LABEL_39:
  return a1;
}

- (id)strokesForIdentifier
{
  void *v2;
  uint64_t v3;

  if (a1)
  {
    objc_msgSend(a1, "triggerStrokes");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v2, "count"))
    {
      -[PKMathRecognitionItem _anyEqualSignStrokes](a1);
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v3;
    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (_QWORD)heroStroke
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[2];
    if (!v2)
    {
      -[PKMathRecognitionItem _findHeroStroke]((id *)a1);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)v1[2];
      v1[2] = v3;

      v2 = (void *)v1[2];
    }
    a1 = v2;
  }
  return a1;
}

- (BOOL)isGraphable
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  if (!a1)
    return 0;
  if (!*(_BYTE *)(a1 + 48))
  {
    -[PKMathRecognitionItem mathResult](a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "preferredTranscription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v5, "count") >= 3)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lowercaseString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEqual:", CFSTR("y")) & 1) != 0)
      {
        v1 = 1;
        objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqual:", CFSTR("="));

        if ((v9 & 1) != 0)
          goto LABEL_10;
      }
      else
      {

      }
    }
    v1 = 0;
LABEL_10:

    return v1;
  }
  return *(_BYTE *)(a1 + 49) != 0;
}

- (id)mathResult
{
  _QWORD *v1;
  _QWORD *v2;
  void *v3;

  if (a1)
  {
    v1 = *(_QWORD **)(a1 + 8);
    if (v1)
      v1 = (_QWORD *)v1[1];
    v2 = v1;
    objc_msgSend(v2, "mathResult");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isLowConfidenceMath
{
  void *v2;
  char v3;

  -[PKMathRecognitionItem mathResult]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasLowConfidence");

  return v3;
}

- (id)originalExpression
{
  void *v1;
  void *v2;

  if (a1)
  {
    -[PKMathRecognitionItem mathResult](a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "preferredTranscription");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (NSString)expression
{
  NSString *updatedExpression;

  updatedExpression = self->_updatedExpression;
  if (!updatedExpression)
    updatedExpression = self->_expression;
  return updatedExpression;
}

- (void)_updateVariable:(void *)a3 valueString:
{
  id v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  if (a1)
  {
    v5 = a3;
    v6 = a2;
    -[PKMathRecognitionItem originalExpression](a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v7, "mutableCopy");

    if (v6)
    {
      v9 = v6[5];
      v8 = v6[6];
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }

    objc_msgSend(v12, "replaceCharactersInRange:withString:", v9, v8, v5);
    v10 = objc_msgSend(v12, "copy");
    v11 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = v10;

    *(_BYTE *)(a1 + 67) = 1;
  }
}

- (id)_stringForVariable:(id)a1
{
  id v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    -[PKMathRecognitionItem originalExpression]((uint64_t)v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v6 = v3[5];
      v5 = v3[6];
    }
    else
    {
      v5 = 0;
      v6 = 0;
    }

    objc_msgSend(v4, "substringWithRange:", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E777DEE8);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (NSNumber)strokeGroupIdentifier
{
  PKStrokeGroupItem *strokeGroupItem;
  PKStrokeGroupItem *v3;
  void *v4;

  strokeGroupItem = self->_strokeGroupItem;
  if (strokeGroupItem)
    strokeGroupItem = (PKStrokeGroupItem *)strokeGroupItem->_strokeGroupItem;
  v3 = strokeGroupItem;
  -[PKStrokeGroupItem strokeGroupIdentifier](v3, "strokeGroupIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (id)stableIdentifier
{
  _QWORD *v1;
  _QWORD *v2;
  void *v3;

  if (a1)
  {
    v1 = *(_QWORD **)(a1 + 8);
    if (v1)
      v1 = (_QWORD *)v1[1];
    v2 = v1;
    objc_msgSend(v2, "strokeGroupStableIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)changeIdentifier
{
  _QWORD *v1;
  _QWORD *v2;
  void *v3;

  if (a1)
  {
    v1 = *(_QWORD **)(a1 + 8);
    if (v1)
      v1 = (_QWORD *)v1[1];
    v2 = v1;
    objc_msgSend(v2, "strokeGroupIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (NSArray)strokes
{
  PKStrokeGroupItem *strokeGroupItem;

  strokeGroupItem = self->_strokeGroupItem;
  if (strokeGroupItem)
    return strokeGroupItem->_strokes;
  else
    return 0;
}

- (id)strokeUUIDs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(a1, "strokes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "strokes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "_strokeUUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (double)boundsForEqualSign
{
  void *v2;
  double v3;

  if (!a1)
    return 0.0;
  -[PKMathRecognitionItem strokesForEqualSign](a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PKMathRecognitionItem _boundsForStrokes:]((uint64_t)a1, v2);

  return v3;
}

- (id)strokesForEqualSign
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;

  v1 = a1;
  if (a1)
  {
    if (a1[64])
    {
      if (!a1[65])
      {
        -[PKMathRecognitionItem mathResult]((uint64_t)a1);
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "symbolStrokeIndexes");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "lastObject");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

        goto LABEL_13;
      }
    }
    else if (!a1[65])
    {
      -[PKMathRecognitionItem mathResult]((uint64_t)a1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "preferredTranscription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v7);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v2, "count");
      while (--v8 >= 0)
      {
        objc_msgSend(v2, "objectAtIndexedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("="));

        if (v10)
        {
          -[PKMathRecognitionItem mathResult]((uint64_t)v1);
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "symbolStrokeIndexes");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectAtIndexedSubscript:", v8);
          v4 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_10;
        }
      }

    }
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    -[PKMathRecognitionItem _strokesForStrokeIndexes:](v1, v4);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (double)_boundsForStrokes:(uint64_t)a1
{
  id v3;
  void *v4;
  CGFloat y;
  double x;
  CGFloat height;
  CGFloat width;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "renderBounds");
          v26.origin.x = v13;
          v26.origin.y = v14;
          v26.size.width = v15;
          v26.size.height = v16;
          v24.origin.x = x;
          v24.origin.y = y;
          v24.size.width = width;
          v24.size.height = height;
          v25 = CGRectUnion(v24, v26);
          x = v25.origin.x;
          y = v25.origin.y;
          width = v25.size.width;
          height = v25.size.height;
        }
        v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }
  }
  else
  {
    x = 0.0;
  }

  return x;
}

- (double)boundsForAnyEqualSign
{
  void *v2;
  double v3;

  if (!a1)
    return 0.0;
  -[PKMathRecognitionItem _anyEqualSignStrokes](a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PKMathRecognitionItem _boundsForStrokes:]((uint64_t)a1, v2);

  return v3;
}

- (id)_anyEqualSignStrokes
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMathRecognitionItem mathResult]((uint64_t)v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredTranscription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "count");
    while (v7-- >= 1)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("="));

      if (v10)
      {
        -[PKMathRecognitionItem mathResult]((uint64_t)v1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "symbolStrokeIndexes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", v7);
        v13 = objc_claimAutoreleasedReturnValue();

        v2 = (void *)v13;
        break;
      }
    }
    -[PKMathRecognitionItem _strokesForStrokeIndexes:](v1, v2);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (double)boundsForVerticalExpressionLine
{
  void *v2;
  double v3;

  if (!a1)
    return 0.0;
  -[PKMathRecognitionItem strokesForVerticalExpressionLine](a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PKMathRecognitionItem _boundsForStrokes:]((uint64_t)a1, v2);

  return v3;
}

- (id)strokesForVerticalExpressionLine
{
  id v1;
  void *v2;

  v1 = a1;
  if (a1)
  {
    -[PKMathRecognitionItem _strokeIndexesForVerticalExpressionLine](a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMathRecognitionItem _strokesForStrokeIndexes:](v1, v2);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (CGRect)boundsForTriggerStrokes
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if (-[PKMathRecognitionItem shouldBeSolved](self, "shouldBeSolved"))
  {
    if (-[PKMathRecognitionItem isVerticalExpression](self, "isVerticalExpression"))
      v3 = -[PKMathRecognitionItem boundsForVerticalExpressionLine](self);
    else
      v3 = -[PKMathRecognitionItem boundsForEqualSign](self);
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D628];
    v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (NSArray)triggerStrokes
{
  void *v3;

  if (-[PKMathRecognitionItem shouldBeSolved](self, "shouldBeSolved"))
  {
    if (-[PKMathRecognitionItem isVerticalExpression](self, "isVerticalExpression"))
      -[PKMathRecognitionItem strokesForVerticalExpressionLine](self);
    else
      -[PKMathRecognitionItem strokesForEqualSign](self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v3;
}

- (id)_strokesForStrokeIndexes:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t i;
  NSObject *v10;
  uint8_t v11[16];

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "strokes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "firstIndex");
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (i = v6; i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v3, "indexGreaterThanIndex:", i))
      {
        if (i >= objc_msgSend(v4, "count"))
        {
          v10 = os_log_create("com.apple.pencilkit", ");
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v11 = 0;
            _os_log_error_impl(&dword_1BE213000, v10, OS_LOG_TYPE_ERROR, "Stroke index out of bounds", v11, 2u);
          }
        }
        else
        {
          objc_msgSend(v4, "objectAtIndexedSubscript:", i);
          v10 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v10);
        }

      }
    }
    v7 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)symbolStrokes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0C99E10];
  -[PKMathRecognitionItem strokes](self, "strokes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedSetWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C99E60];
  -[PKMathRecognitionItem triggerStrokes](self, "triggerStrokes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minusSet:", v8);

  objc_msgSend(v5, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

- (double)_boundsForStrokeIndexes:(void *)a1
{
  void *v3;
  double v4;

  if (!a1)
    return 0.0;
  -[PKMathRecognitionItem _strokesForStrokeIndexes:](a1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKMathRecognitionItem _boundsForStrokes:]((uint64_t)a1, v3);

  return v4;
}

- (id)_strokeIndexesForVerticalExpressionLine
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  v1 = a1;
  if (a1)
  {
    if (a1[65])
    {
      -[PKMathRecognitionItem mathResult]((uint64_t)a1);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "preferredTranscription");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = objc_msgSend(v5, "count");
      while (--v6 >= 0)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("\\hline"));

        if (v8)
        {
          -[PKMathRecognitionItem mathResult]((uint64_t)v1);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "symbolStrokeIndexes");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectAtIndexedSubscript:", v6);
          v1 = (id)objc_claimAutoreleasedReturnValue();

          return v1;
        }
      }

    }
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

- (NSArray)tappableStrokes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  if (self)
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMathRecognitionItem mathResult]((uint64_t)self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredTranscription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
    {
      v8 = 0;
      while (1)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("\\hline")))
          break;
        objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("="));

        if (v11)
          goto LABEL_7;
LABEL_8:
        if (++v8 >= (unint64_t)objc_msgSend(v7, "count"))
          goto LABEL_9;
      }

LABEL_7:
      -[PKMathRecognitionItem mathResult]((uint64_t)self);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "symbolStrokeIndexes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "addIndexes:", v14);
      goto LABEL_8;
    }
LABEL_9:
    v15 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    v15 = 0;
  }
  -[PKMathRecognitionItem _strokesForStrokeIndexes:](self, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v16;
}

- (NSString)expressionToPresent
{
  PKStrokeGroupItem *strokeGroupItem;
  PKStrokeGroupItem *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  strokeGroupItem = self->_strokeGroupItem;
  if (strokeGroupItem)
    strokeGroupItem = (PKStrokeGroupItem *)strokeGroupItem->_strokeGroupItem;
  v4 = strokeGroupItem;
  -[PKStrokeGroupItem mathResult](v4, "mathResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredTranscription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PKMathRecognitionItem shouldBeSolved](self, "shouldBeSolved")
    && !-[PKMathRecognitionItem isVerticalExpression](self, "isVerticalExpression"))
  {
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("="));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  return (NSString *)v6;
}

- (double)suggestedHeightForResult
{
  void *v1;
  double v2;
  double v3;

  if (!a1)
    return 0.0;
  -[PKMathRecognitionItem mathResult](a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "baseCharacterHeight");
  v3 = v2;

  return v3;
}

- (double)suggestedDistanceBetweenDigits
{
  double v1;
  __int128 v3;
  void *v4;
  void *v5;
  id v6;
  double v7;
  _QWORD v9[4];
  id v10;
  void *v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t *v14;
  _QWORD v15[4];
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double *v23;
  uint64_t v24;
  uint64_t v25;

  v1 = 0.0;
  if (a1 && objc_msgSend(a1, "isVerticalExpression"))
  {
    v22 = 0;
    v23 = (double *)&v22;
    v24 = 0x2020000000;
    v25 = 0;
    v18 = 0;
    v19 = (double *)&v18;
    v20 = 0x2020000000;
    v21 = 0;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x4010000000;
    v15[3] = "";
    v3 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    v16 = *MEMORY[0x1E0C9D628];
    v17 = v3;
    objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMathRecognitionItem mathResult]((uint64_t)a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__PKMathRecognitionItem_suggestedDistanceBetweenDigits__block_invoke;
    v9[3] = &unk_1E777D020;
    v6 = v4;
    v10 = v6;
    v11 = a1;
    v12 = v15;
    v13 = &v22;
    v14 = &v18;
    objc_msgSend(v5, "enumerateTokensInPreferredTranscriptionPathWithBlock:", v9);

    v7 = v19[3];
    if (v7 > 0.0)
      v1 = v23[3] / v7;

    _Block_object_dispose(v15, 8);
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v22, 8);
  }
  return v1;
}

void __55__PKMathRecognitionItem_suggestedDistanceBetweenDigits__block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  BOOL v4;
  _BOOL4 IsNull;
  _OWORD *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  _BOOL4 v16;
  BOOL v17;
  double MinX;
  double v19;
  uint64_t v20;
  __int128 v21;
  id v22;
  CGRect v23;
  CGRect v24;

  v22 = a2;
  objc_msgSend(v22, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") == 1 && objc_msgSend(v3, "rangeOfCharacterFromSet:", a1[4]) == 0;
  IsNull = CGRectIsNull(*(CGRect *)(*(_QWORD *)(a1[6] + 8) + 32));
  v6 = (_OWORD *)MEMORY[0x1E0C9D628];
  if (v4)
  {
    v7 = (void *)a1[5];
    objc_msgSend(v22, "strokeIndexes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKMathRecognitionItem _boundsForStrokeIndexes:](v7, v8);
    v11 = v10;
    v13 = v12;
    v15 = v14;

  }
  else
  {
    v9 = *MEMORY[0x1E0C9D628];
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v23.origin.x = v9;
  v23.origin.y = v11;
  v23.size.width = v13;
  v23.size.height = v15;
  v16 = CGRectIsNull(v23);
  v17 = v16;
  if (!v16 && !IsNull)
  {
    v24.origin.x = v9;
    v24.origin.y = v11;
    v24.size.width = v13;
    v24.size.height = v15;
    MinX = CGRectGetMinX(v24);
    v19 = MinX - CGRectGetMinX(*(CGRect *)(*(_QWORD *)(a1[6] + 8) + 32));
    if (v19 > 0.0)
    {
      *(double *)(*(_QWORD *)(a1[7] + 8) + 24) = v19 + *(double *)(*(_QWORD *)(a1[7] + 8) + 24);
      *(double *)(*(_QWORD *)(a1[8] + 8) + 24) = *(double *)(*(_QWORD *)(a1[8] + 8) + 24) + 1.0;
    }
  }
  v20 = *(_QWORD *)(a1[6] + 8);
  if (v17)
  {
    v21 = v6[1];
    *(_OWORD *)(v20 + 32) = *v6;
    *(_OWORD *)(v20 + 48) = v21;
  }
  else
  {
    *(double *)(v20 + 32) = v9;
    *(CGFloat *)(v20 + 40) = v11;
    *(CGFloat *)(v20 + 48) = v13;
    *(CGFloat *)(v20 + 56) = v15;
  }

}

- (BOOL)isValidForDrawing:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PKMathRecognitionItem strokes](self, "strokes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "_strokeUUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "_visibleStrokeForIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v12 = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_11:

  return v12;
}

- (NSArray)scrubbableVariables
{
  NSArray *scrubbableVariables;
  NSArray *allTokens;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;

  scrubbableVariables = self->_scrubbableVariables;
  if (!scrubbableVariables)
  {
    allTokens = self->_allTokens;
    if (allTokens)
    {
      v5 = allTokens;
      +[PKMathVariable variablesForTokens:item:]((uint64_t)PKMathVariable, v5, self);
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v7 = self->_scrubbableVariables;
      self->_scrubbableVariables = v6;

      scrubbableVariables = self->_scrubbableVariables;
    }
    else
    {
      scrubbableVariables = 0;
    }
  }
  return scrubbableVariables;
}

- (id)_strokeIndexesForCharacterRange:(uint64_t)a3
{
  void *v6;
  void *v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  _QWORD v16[4];

  if (!a1)
    return 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__30;
  v14 = __Block_byref_object_dispose__30;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[PKMathRecognitionItem mathResult](a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__PKMathRecognitionItem__strokeIndexesForCharacterRange___block_invoke;
  v9[3] = &unk_1E777D048;
  v9[6] = a2;
  v9[7] = a3;
  v9[4] = v16;
  v9[5] = &v10;
  objc_msgSend(v6, "enumerateTokensInPreferredTranscriptionPathWithBlock:", v9);

  v7 = (void *)objc_msgSend((id)v11[5], "copy");
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(v16, 8);
  return v7;
}

void __57__PKMathRecognitionItem__strokeIndexesForCharacterRange___block_invoke(NSRange *a1, void *a2)
{
  void *v3;
  NSUInteger v4;
  void *v5;
  void *v6;
  id v7;
  NSRange v8;

  v7 = a2;
  objc_msgSend(v7, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1[2].location + 8) + 24);
  v8.length = objc_msgSend(v3, "length");
  v8.location = v4;
  if (NSIntersectionRange(a1[48], v8).length)
  {
    v5 = *(void **)(*(_QWORD *)(a1[2].length + 8) + 40);
    objc_msgSend(v7, "strokeIndexes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addIndexes:", v6);

  }
  *(_QWORD *)(*(_QWORD *)(a1[2].location + 8) + 24) += objc_msgSend(v3, "length") + 1;

}

- (unint64_t)isRecentlyModified
{
  unint64_t v1;
  void *v2;
  double v3;
  double v4;
  double v5;

  v1 = (unint64_t)a1;
  if (a1)
  {
    objc_msgSend(a1, "strokes");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v4 = v3;
      v5 = -[PKMathRecognitionItem mostRecentStrokeTimestamp]((void *)v1);
      if (v5 < *(double *)(v1 + 40))
        v5 = *(double *)(v1 + 40);
      v1 = v4 - v5 < 5.0;
    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

- (double)mostRecentStrokeTimestamp
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t i;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0.0;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "strokes", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v14;
    v5 = 0.0;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(v1);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v7, "timestamp");
        v9 = v8;
        objc_msgSend(v7, "path");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count"))
        {
          objc_msgSend(v10, "timestampAtIndex:", objc_msgSend(v10, "count") - 1);
          v9 = v9 + v11;
        }
        if (v5 < v9)
          v5 = v9;

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v3);
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (BOOL)isRecentlyCreated
{
  _BOOL8 v1;
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  v1 = (_BOOL8)a1;
  if (a1)
  {
    if ((objc_msgSend(a1, "isVerticalExpression") & 1) != 0)
      -[PKMathRecognitionItem strokesForVerticalExpressionLine]((_BYTE *)v1);
    else
      -[PKMathRecognitionItem _anyEqualSignStrokes]((id)v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v2, "count"))
    {
      objc_msgSend((id)v1, "strokes");
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v3;
    }
    if (objc_msgSend(v2, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v5 = v4;
      objc_msgSend(v2, "valueForKeyPath:", CFSTR("@min.timestamp"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "doubleValue");
      v8 = v7;

      v1 = v5 - v8 < 10.0;
    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

- (uint64_t)characterRangeForTriggerSymbol
{
  int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;

  if (!a1)
    return 0;
  v2 = objc_msgSend(a1, "isVerticalExpression");
  objc_msgSend(a1, "expression");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("\\hline");
  else
    v5 = CFSTR("=");
  v6 = objc_msgSend(v3, "rangeOfString:options:", v5, 4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  return v6;
}

- (uint64_t)hasAnyErrorsOrAlternatives
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v1 = *(id *)(a1 + 96);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v6, "alternatives", (_QWORD)v12);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "count"))
        {

LABEL_14:
          v10 = 1;
          goto LABEL_15;
        }
        objc_msgSend(v6, "errors");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count");

        if (v9)
          goto LABEL_14;
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v10 = 0;
      if (v3)
        continue;
      break;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_15:

  return v10;
}

- (uint64_t)hasAnyErrors
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 96);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v9 != v3)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "errors", (_QWORD)v8);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "count");

        if (v6)
        {
          v2 = 1;
          goto LABEL_12;
        }
      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_12:

  return v2;
}

- (id)alternativesTokens
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  PKMathRecognitionToken *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  _QWORD v47[5];
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[16];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    v2 = 0;
    return v2;
  }
  v1 = a1;
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 56), "count") < 2)
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
    return v2;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMathRecognitionItem mathResult](v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "tokenColumnCount");

  if (v4 < 1)
    goto LABEL_30;
  v5 = 0;
  v6 = 0;
  v44 = (void *)v1;
LABEL_6:
  -[PKMathRecognitionItem mathResult](v1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v1 + 56), "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transcriptionWithPath:columnRange:", v8, v6, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKMathRecognitionItem mathResult](v1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tokenRowsAtColumnIndex:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    v45 = v5;
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v12 = *(id *)(v1 + 56);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (!v13)
      goto LABEL_23;
    v14 = v13;
    v15 = *(_QWORD *)v51;
    while (1)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v51 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        if (v6 >= objc_msgSend(v17, "length"))
        {
          v19 = os_log_create("com.apple.pencilkit", "Math");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v20 = v19;
            v21 = "Unexpected column index for available transcription path";
LABEL_19:
            _os_log_impl(&dword_1BE213000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
          }
        }
        else
        {
          v18 = objc_msgSend(v17, "indexAtPosition:", v6);
          if (v18 < objc_msgSend(v10, "count"))
          {
            objc_msgSend(v11, "addIndex:", v18);
            continue;
          }
          v19 = os_log_create("com.apple.pencilkit", "Math");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v20 = v19;
            v21 = "Unexpected row index in available transcription path";
            goto LABEL_19;
          }
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      if (!v14)
      {
LABEL_23:

        v1 = (uint64_t)v44;
        v22 = v45;
        if ((unint64_t)objc_msgSend(v11, "count") >= 2)
        {
          v23 = objc_alloc_init(PKMathRecognitionToken);
          -[PKMathRecognitionToken setItem:](v23, "setItem:", v44);
          -[PKMathRecognitionToken setType:](v23, "setType:", 4);
          -[PKMathRecognitionToken setCharacterRange:](v23, "setCharacterRange:", v45, objc_msgSend(v46, "length"));
          -[PKMathRecognitionItem mathResult]((uint64_t)v44);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "strokeIndexesForColumnsInRange:", v6, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v43 = v25;
          -[PKMathRecognitionToken setBounds:](v23, "setBounds:", -[PKMathRecognitionItem _boundsForStrokeIndexes:](v44, v25));
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count") - 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v47[0] = MEMORY[0x1E0C809B0];
          v47[1] = 3221225472;
          v47[2] = __43__PKMathRecognitionItem_alternativesTokens__block_invoke;
          v47[3] = &unk_1E777D070;
          v47[4] = v44;
          v48 = v10;
          v27 = v26;
          v49 = v27;
          objc_msgSend(v11, "enumerateIndexesUsingBlock:", v47);
          -[PKMathRecognitionToken setAlternatives:](v23, "setAlternatives:", v27);
          v42 = v27;
          -[PKMathRecognitionToken setRenderableAlternatives:](v23, "setRenderableAlternatives:", v27);
          -[PKMathRecognitionToken setColumnIndex:](v23, "setColumnIndex:", v6);
          -[PKMathRecognitionItem mathResult]((uint64_t)v44);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v27) = objc_opt_respondsToSelector();

          if ((v27 & 1) != 0)
          {
            -[PKMathRecognitionItem mathResult]((uint64_t)v44);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "renderableLatexCandidatesForColumnIndex:", v6);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v30, "objectsAtIndexes:", v11);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            v40 = objc_msgSend(v31, "count");
            -[PKMathRecognitionToken alternatives](v23, "alternatives");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "count");

            if (v40 == v33)
              -[PKMathRecognitionToken setRenderableAlternatives:](v23, "setRenderableAlternatives:", v31);

            v22 = v45;
          }
          objc_msgSend(v41, "addObject:", v23);

        }
        v34 = objc_msgSend(v46, "length");

        v5 = v22 + v34 + 1;
        ++v6;
        -[PKMathRecognitionItem mathResult]((uint64_t)v44);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "tokenColumnCount");

        if ((uint64_t)v6 >= v36)
        {
LABEL_30:
          v37 = v41;
          v2 = (void *)objc_msgSend(v41, "copy");
          goto LABEL_34;
        }
        goto LABEL_6;
      }
    }
  }
  v38 = os_log_create("com.apple.pencilkit", "Math");
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE213000, v38, OS_LOG_TYPE_DEFAULT, "Unexpected number of rows", buf, 2u);
  }

  v2 = (void *)MEMORY[0x1E0C9AA60];
  v37 = v41;
LABEL_34:

  return v2;
}

void __43__PKMathRecognitionItem_alternativesTokens__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v12, "string");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "appendString:", v13);

          if (v12 != v6)
            objc_msgSend(v14, "appendString:", CFSTR(" "));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
  else
  {
    v14 = 0;
  }

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v14);
}

- (void)_updateFromOldItem:(_QWORD *)a1
{
  _QWORD *v3;
  const char *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a2;
  if (a1)
  {
    v14 = v3;
    if (v3)
      v5 = (void *)v3[12];
    else
      v5 = 0;
    objc_setProperty_nonatomic_copy(a1, v4, v5, 96);
    -[PKMathRecognitionItem changeIdentifier]((uint64_t)a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMathRecognitionItem changeIdentifier]((uint64_t)v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqualToNumber:", v7))
      goto LABEL_7;
    -[PKMathRecognitionItem stableIdentifier]((uint64_t)a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMathRecognitionItem stableIdentifier]((uint64_t)v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToNumber:", v9);

    v3 = v14;
    if (v10)
    {
      v11 = objc_msgSend(*((id *)v14 + 7), "copy");
      v12 = (void *)a1[7];
      a1[7] = v11;

      -[PKMathRecognitionItem mathResult]((uint64_t)v14);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "selectedTranscriptionPathIndex");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKMathRecognitionItem mathResult]((uint64_t)a1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSelectedTranscriptionPathIndex:", v7);

LABEL_7:
      v3 = v14;
    }
  }

}

- (id)_findHeroStroke
{
  id *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v1 = a1;
  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "uuid");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v1, "triggerStrokes", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          objc_msgSend(v8, "_strokeUUID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqual:", v2);

          if ((v10 & 1) != 0)
          {
            objc_storeStrong(v1 + 2, v8);
            v1 = v8;
            goto LABEL_12;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v5)
          continue;
        break;
      }
    }
    v1 = 0;
LABEL_12:

  }
  return v1;
}

- (id)_heroStrokeInDrawing:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  if (a1)
  {
    -[PKMathRecognitionItem heroStroke](a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "_strokeUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_visibleStrokeForIdentifier:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_updatePreferredTranscriptionChangingToken:(void *)a3 withAlternative:
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  NSObject *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v33 = a2;
  v32 = a3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[PKMathRecognitionItem mathResult](a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transcriptionPaths");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v35;
      v11 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v35 != v10)
            objc_enumerationMutation(v6);
          v13 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          if (objc_msgSend(*(id *)(a1 + 56), "containsObject:", v13))
          {
            -[PKMathRecognitionItem mathResult](a1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "transcriptionWithPath:columnRange:", v13, objc_msgSend(v33, "columnIndex"), 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v15, "isEqualToString:", v32))
            {
              objc_msgSend(v31, "addObject:", v13);
              if (v11 == 0x7FFFFFFFFFFFFFFFLL)
                v11 = v9 + i;
            }

          }
        }
        v9 += v8;
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v8);
    }
    else
    {
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    }

    v16 = objc_msgSend(v31, "copy");
    v17 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = v16;

    -[PKMathRecognitionItem mathResult](a1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "selectedTranscriptionPathIndex");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "integerValue");

    if (v11 == v20)
    {
      v21 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        -[PKMathRecognitionItem mathResult](a1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "preferredTranscription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138477827;
        v39 = v23;
        _os_log_impl(&dword_1BE213000, v21, OS_LOG_TYPE_DEFAULT, "Candidate selection didn't lead to change in transcription for expression: %{private}@", buf, 0xCu);

      }
      v24 = v21;
    }
    else
    {
      v24 = *(id *)(a1 + 72);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKMathRecognitionItem mathResult](a1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setSelectedTranscriptionPathIndex:", v25);

      -[PKMathRecognitionItem mathResult](a1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "preferredTranscription");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v28;

      v21 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v30 = *(void **)(a1 + 72);
        *(_DWORD *)buf = 138478083;
        v39 = v30;
        v40 = 2113;
        v41 = v24;
        _os_log_impl(&dword_1BE213000, v21, OS_LOG_TYPE_DEFAULT, "Set preferred transcription: %{private}@, for expression: %{private}@", buf, 0x16u);
      }
    }

  }
}

- (uint64_t)_tagAsRecentlyUpdated
{
  uint64_t v1;
  uint64_t v2;

  if (result)
  {
    v1 = result;
    result = objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    *(_QWORD *)(v1 + 40) = v2;
  }
  return result;
}

- (void)_logRecentlyModifiedAndCreated
{
  void *v2;
  NSObject *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  double v11;
  NSObject *v12;
  int v13;
  double v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "strokes");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v2, "count"))
    {
      v3 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_DEFAULT, "Recently modified debug: no strokes", (uint8_t *)&v13, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v5 = v4;
    objc_msgSend(v2, "valueForKeyPath:", CFSTR("@min.timestamp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    if ((objc_msgSend(a1, "isVerticalExpression") & 1) != 0)
      -[PKMathRecognitionItem strokesForVerticalExpressionLine](a1);
    else
      -[PKMathRecognitionItem _anyEqualSignStrokes](a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      v10 = v9;

      v2 = v10;
    }
    v11 = -[PKMathRecognitionItem mostRecentStrokeTimestamp](a1);
    v12 = os_log_create("com.apple.pencilkit", "Math");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134218240;
      v14 = v5 - v8;
      v15 = 2048;
      v16 = v5 - v11;
      _os_log_impl(&dword_1BE213000, v12, OS_LOG_TYPE_DEFAULT, "Recently modified debug: Modified diff: %g, created diff: %g", (uint8_t *)&v13, 0x16u);
    }

  }
}

- (BOOL)shouldBeSolved
{
  return self->_shouldBeSolved;
}

- (BOOL)isVerticalExpression
{
  return self->_isVerticalExpression;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)sortIndex
{
  return self->_sortIndex;
}

- (BOOL)shouldSolveMathFlagIsSet
{
  return self->_shouldSolveMathFlagIsSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeIdentifier, 0);
  objc_storeStrong((id *)&self->_stableIdentifier, 0);
  objc_storeStrong((id *)&self->_allTokens, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_expression, 0);
  objc_storeStrong((id *)&self->_availableTranscriptionPaths, 0);
  objc_storeStrong((id *)&self->_updatedExpression, 0);
  objc_storeStrong((id *)&self->_scrubbableVariables, 0);
  objc_storeStrong((id *)&self->_heroStroke, 0);
  objc_storeStrong((id *)&self->_strokeGroupItem, 0);
}

@end
