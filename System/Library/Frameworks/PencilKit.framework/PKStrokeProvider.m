@implementation PKStrokeProvider

- (PKStrokeProvider)initWithDrawing:(id)a3
{
  id v4;
  PKStrokeProvider *v5;
  uint64_t v6;
  PKDrawing *drawing;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *strokeIdsByEncoding;
  PKHandwritingTranscriptionCache *v11;
  PKHandwritingTranscriptionCache *transcriptionCache;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKStrokeProvider;
  v5 = -[PKStrokeProvider init](&v14, sel_init);
  v6 = objc_msgSend(v4, "copy");
  drawing = v5->_drawing;
  v5->_drawing = (PKDrawing *)v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_disabled = objc_msgSend(v8, "BOOLForKey:", CFSTR("PKDrawingRecognitionDisableUpdates"));

  v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  strokeIdsByEncoding = v5->_strokeIdsByEncoding;
  v5->_strokeIdsByEncoding = v9;

  v11 = objc_alloc_init(PKHandwritingTranscriptionCache);
  transcriptionCache = v5->_transcriptionCache;
  v5->_transcriptionCache = v11;

  return v5;
}

- (PKStrokeProvider)initWithDrawing:(id)a3 visibleOnscreenStrokes:(id)a4 shouldProcessVisibleStrokes:(BOOL)a5 transcriptionCache:(id)a6
{
  id v10;
  id v11;
  id v12;
  PKStrokeProvider *v13;
  uint64_t v14;
  NSArray *visibleOnscreenStrokes;
  uint64_t v16;
  PKHandwritingTranscriptionCache *transcriptionCache;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = -[PKStrokeProvider initWithDrawing:](self, "initWithDrawing:", v10);
  if (v13)
  {
    v14 = objc_msgSend(v11, "copy");
    visibleOnscreenStrokes = v13->_visibleOnscreenStrokes;
    v13->_visibleOnscreenStrokes = (NSArray *)v14;

    v13->_shouldProcessVisibleStrokes = a5;
    v16 = objc_msgSend(v12, "copy");
    transcriptionCache = v13->_transcriptionCache;
    v13->_transcriptionCache = (PKHandwritingTranscriptionCache *)v16;

  }
  return v13;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKStrokeProvider;
  -[PKStrokeProvider description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKStrokeProvider strokeProviderVersion](self, "strokeProviderVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKStrokeProvider orderedStrokes](self, "orderedStrokes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" version: %@, strokes: %ld"), v4, objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)cachedTranscriptionForStrokeGroup:(id)a3
{
  -[PKHandwritingTranscriptionCache cachedTranscriptionForStrokeGroup:](self->_transcriptionCache, "cachedTranscriptionForStrokeGroup:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)cachedTranscriptionsIntersectingStrokeGroup:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKHandwritingTranscriptionCache allCachedGroups](self->_transcriptionCache, "allCachedGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __64__PKStrokeProvider_cachedTranscriptionsIntersectingStrokeGroup___block_invoke;
  v21[3] = &unk_1E777A098;
  v6 = v4;
  v22 = v6;
  objc_msgSend(v5, "indexesOfObjectsPassingTest:", v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    -[PKHandwritingTranscriptionCache allCachedGroups](self->_transcriptionCache, "allCachedGroups");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectsAtIndexes:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v9, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v11);
          -[PKHandwritingTranscriptionCache cachedTranscriptionForStrokeGroup:](self->_transcriptionCache, "cachedTranscriptionForStrokeGroup:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v10, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v12);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __64__PKStrokeProvider_cachedTranscriptionsIntersectingStrokeGroup___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "intersectsSet:", *(_QWORD *)(a1 + 32));
}

- (void)updateTranscriptionCache:(id)a3
{
  PKHandwritingTranscriptionCache *v4;
  PKHandwritingTranscriptionCache *transcriptionCache;
  id v6;

  v6 = a3;
  v4 = (PKHandwritingTranscriptionCache *)objc_msgSend(v6, "copy");
  transcriptionCache = self->_transcriptionCache;
  self->_transcriptionCache = v4;

}

- (CHStrokeProviderVersion)strokeProviderVersion
{
  void *v2;
  void *v3;

  -[PKStrokeProvider drawing](self, "drawing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "version");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CHStrokeProviderVersion *)v3;
}

- (id)slices
{
  PKStrokeProvider *v2;
  NSMutableOrderedSet *strokeSlices;
  NSMutableOrderedSet *v4;
  NSArray *v5;
  void *v6;
  uint64_t v7;
  NSMutableOrderedSet *v8;

  v2 = self;
  objc_sync_enter(v2);
  strokeSlices = v2->_strokeSlices;
  if (strokeSlices)
  {
    v4 = strokeSlices;
  }
  else
  {
    if (v2->_shouldProcessVisibleStrokes)
    {
      v5 = v2->_visibleOnscreenStrokes;
    }
    else
    {
      -[PKStrokeProvider drawing](v2, "drawing");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "strokes");
      v5 = (NSArray *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend((id)objc_opt_class(), "slicesForStrokes:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v2->_strokeSlices;
    v2->_strokeSlices = (NSMutableOrderedSet *)v7;

    v4 = v2->_strokeSlices;
  }
  objc_sync_exit(v2);

  return v4;
}

+ (id)slicesForStrokes:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  double **v12;
  double *v13;
  double *v14;
  PKStrokeProviderSlice *v15;
  PKStrokeProviderSlice *v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v18, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = v18;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v8, "_strokeMask");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9 == 0;

        if (v10)
        {
          v16 = -[PKStrokeProviderSlice initWithStroke:tStart:tEnd:]([PKStrokeProviderSlice alloc], "initWithStroke:tStart:tEnd:", v8, 0.0, (double)(unint64_t)objc_msgSend(v8, "_pointsCount"));
          objc_msgSend(v3, "addObject:", v16);

        }
        else
        {
          objc_msgSend(v8, "_strokeMask");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (double **)objc_msgSend(v11, "centerlineSlices");

          v13 = *v12;
          v14 = v12[1];
          while (v13 != v14)
          {
            v15 = -[PKStrokeProviderSlice initWithStroke:tStart:tEnd:]([PKStrokeProviderSlice alloc], "initWithStroke:tStart:tEnd:", v8, *v13, v13[1]);
            objc_msgSend(v3, "addObject:", v15);

            v13 += 2;
          }
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

  return v3;
}

- (NSArray)orderedStrokes
{
  void *v2;
  void *v3;

  if (self->_disabled)
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[PKStrokeProvider slices](self, "slices");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSArray *)v2;
}

- (BOOL)enumerateChangesSinceVersion:(id)a3 usingBlock:(id)a4
{
  return 0;
}

- (int64_t)compareOrderOfStrokeWithIdentifier:(id)a3 toStrokeWithIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKStrokeProviderSlice *v9;
  unint64_t v10;
  PKStrokeProviderSlice *v11;
  unint64_t v12;
  int64_t v13;

  v6 = a3;
  v7 = a4;
  -[PKStrokeProvider slices](self, "slices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKStrokeProviderSlice initWithIdentifier:]([PKStrokeProviderSlice alloc], "initWithIdentifier:", v6);
  v10 = objc_msgSend(v8, "indexOfObject:", v9);

  v11 = -[PKStrokeProviderSlice initWithIdentifier:]([PKStrokeProviderSlice alloc], "initWithIdentifier:", v7);
  v12 = objc_msgSend(v8, "indexOfObject:", v11);

  if (v10 < v12)
    v13 = -1;
  else
    v13 = v10 != v12;

  return v13;
}

- (unint64_t)compareStyleOfStrokeWithIdentifier:(id)a3 toStrokeWithIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  CGColor *v15;
  id v16;
  unint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v25;

  v6 = a4;
  -[PKStrokeProvider strokeForIdentifier:](self, "strokeForIdentifier:", a3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKStrokeProvider strokeForIdentifier:](self, "strokeForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stroke");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stroke");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ink");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ink");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = objc_msgSend(v12, "isEqual:", v13);

  objc_msgSend(v10, "color");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = (CGColor *)objc_msgSend(v14, "CGColor");
  objc_msgSend(v11, "color");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  LODWORD(v15) = CGColorEqualToColor(v15, (CGColorRef)objc_msgSend(v16, "CGColor"));
  v17 = v17;

  if ((_DWORD)v15)
    v17 = v17 | 2;
  objc_msgSend(v8, "_maxWidthForStroke");
  v19 = v18;
  objc_msgSend(v9, "_maxWidthForStroke");
  if (vabdd_f64(v19, v20) < 3.0)
  {
    objc_msgSend(v10, "weight");
    v22 = v21;
    objc_msgSend(v11, "weight");
    if (v22 == v23)
      v17 |= 4uLL;
  }

  return v17;
}

- (CGSize)drawingCanvasSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[PKDrawing bounds](self->_drawing, "bounds");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (int64_t)compareOrderOfStroke:(id)a3 toStroke:(id)a4
{
  return objc_msgSend(a3, "compareTo:", a4);
}

- (BOOL)isStroke:(id)a3 versionOfStrokeWithIdentifier:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = a4;
  objc_msgSend(a3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  objc_msgSend(v7, "strokeUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "strokeUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "strokeUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isValidStrokeIdentifier:(id)a3
{
  id v4;
  void *v5;
  PKStrokeProviderSlice *v6;
  char v7;

  v4 = a3;
  -[PKStrokeProvider slices](self, "slices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKStrokeProviderSlice initWithIdentifier:]([PKStrokeProviderSlice alloc], "initWithIdentifier:", v4);
  v7 = objc_msgSend(v5, "containsObject:", v6);

  return v7;
}

- (id)strokeForIdentifier:(id)a3
{
  -[PKStrokeProvider sliceForIdentifier:](self, "sliceForIdentifier:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_cacheStrokeIdentifier:(id)a3 withEncodedStrokeIdentifier:(id)a4
{
  id v6;
  PKStrokeProvider *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  if (v9)
  {
    if (v6)
    {
      -[NSMutableDictionary objectForKey:](v7->_strokeIdsByEncoding, "objectForKey:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        -[NSMutableDictionary setObject:forKey:](v7->_strokeIdsByEncoding, "setObject:forKey:", v9, v6);
    }
  }
  objc_sync_exit(v7);

}

- (id)_cachedStrokeIdentifier:(id)a3
{
  id v4;
  PKStrokeProvider *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](v5->_strokeIdsByEncoding, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_sync_exit(v5);

  return v6;
}

- (id)strokeIdentifierFromData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v11;

  v4 = a3;
  -[PKStrokeProvider _cachedStrokeIdentifier:](self, "_cachedStrokeIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (_MergedGlobals_131 != -1)
      dispatch_once(&_MergedGlobals_131, &__block_literal_global_40);
    v6 = (void *)MEMORY[0x1E0CB3710];
    v7 = qword_1ECEE6240;
    objc_msgSend(v4, "encodedStrokeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v7, v8, &v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;

    -[PKStrokeProvider _cacheStrokeIdentifier:withEncodedStrokeIdentifier:](self, "_cacheStrokeIdentifier:withEncodedStrokeIdentifier:", v5, v4);
  }

  return v5;
}

void __45__PKStrokeProvider_strokeIdentifierFromData___block_invoke()
{
  Class v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v0 = NSClassFromString(CFSTR("PKStrokeProviderSliceIdentifierCoherence"));
  v1 = (void *)MEMORY[0x1E0C99E60];
  v2 = objc_opt_class();
  if (v0)
  {
    v8[0] = v2;
    v8[1] = v0;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setWithArray:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)qword_1ECEE6240;
    qword_1ECEE6240 = v4;

  }
  else
  {
    objc_msgSend(v1, "setWithObject:", v2);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)qword_1ECEE6240;
    qword_1ECEE6240 = v6;

  }
}

- (id)encodedStrokeIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v14;

  v4 = a3;
  -[PKStrokeProvider strokeForIdentifier:](self, "strokeForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || (objc_msgSend(v5, "encodedStrokeIdentifier"), (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v14;
    if (v8)
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16808]), "initWithData:", v8);
    else
      v7 = 0;

  }
  -[PKStrokeProvider _cacheStrokeIdentifier:withEncodedStrokeIdentifier:](self, "_cacheStrokeIdentifier:withEncodedStrokeIdentifier:", v4, v7);
  if (v7)
  {
    v10 = v7;
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0D16808]);
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v11, "initWithData:", v12);

  }
  return v10;
}

- (NSOrderedSet)visibleStrokeEncodedIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", self->_visibleOnscreenStrokes);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E40];
  -[PKStrokeProvider drawing](self, "drawing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "strokes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedSetWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intersectOrderedSet:", v7);

  +[PKStrokeProvider _identifiersForStrokes:](PKStrokeProvider, "_identifiersForStrokes:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v10);
        -[PKStrokeProvider encodedStrokeIdentifier:](self, "encodedStrokeIdentifier:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return (NSOrderedSet *)v9;
}

- (id)sliceForIdentifier:(id)a3
{
  id v4;
  void *v5;
  PKStrokeProviderSlice *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  -[PKStrokeProvider slices](self, "slices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKStrokeProviderSlice initWithIdentifier:]([PKStrokeProviderSlice alloc], "initWithIdentifier:", v4);
  v7 = objc_msgSend(v5, "indexOfObject:", v6);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)_identifiersForStrokes:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
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
  objc_msgSend(a3, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKStrokeProvider slicesForStrokes:](PKStrokeProvider, "slicesForStrokes:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "strokeIdentifier", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v5;
}

- (int64_t)groupingPriority
{
  return self->groupingPriority;
}

- (PKDrawing)drawing
{
  return self->_drawing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->_transcriptionCache, 0);
  objc_storeStrong((id *)&self->_strokeIdsByEncoding, 0);
  objc_storeStrong((id *)&self->_visibleOnscreenStrokes, 0);
  objc_storeStrong((id *)&self->_strokeSlices, 0);
}

@end
