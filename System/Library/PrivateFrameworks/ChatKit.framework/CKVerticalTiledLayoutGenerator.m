@implementation CKVerticalTiledLayoutGenerator

- (void)willParseTiles
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKVerticalTiledLayoutGenerator;
  -[CKTiledLayoutGenerator willParseTiles](&v3, sel_willParseTiles);
  self->_origin = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_enqueuedCaptionTileInfo.index = 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)parseNextTiles
{
  return -[CKVerticalTiledLayoutGenerator _parseTileRequiringFullWidth](self, "_parseTileRequiringFullWidth")
      || -[CKVerticalTiledLayoutGenerator _parseSpecialSequence](self, "_parseSpecialSequence")
      || -[CKVerticalTiledLayoutGenerator _parseSpecialTileTriplet](self, "_parseSpecialTileTriplet")
      || -[CKVerticalTiledLayoutGenerator _parseTileTriplet](self, "_parseTileTriplet")
      || -[CKVerticalTiledLayoutGenerator _parseTilePair](self, "_parseTilePair")
      || -[CKVerticalTiledLayoutGenerator _parseSingleTile](self, "_parseSingleTile");
}

- (void)didParseTiles
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKVerticalTiledLayoutGenerator;
  -[CKTiledLayoutGenerator didParseTiles](&v3, sel_didParseTiles);
  -[CKVerticalTiledLayoutGenerator _dequeueCaption](self, "_dequeueCaption");
}

- (BOOL)_parseSingleTile
{
  _BOOL4 v3;
  _OWORD v5[3];

  memset(v5, 0, sizeof(v5));
  v3 = -[CKTiledLayoutGenerator scanAnyTile:](self, "scanAnyTile:", v5);
  if (v3)
    -[CKVerticalTiledLayoutGenerator _addRowWithContiguousTiles:count:](self, "_addRowWithContiguousTiles:count:", v5, 1);
  return v3;
}

- (BOOL)_parseTilePair
{
  void *v3;
  BOOL v4;
  _OWORD v6[6];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[CKTiledLayoutGenerator scanState](self, "scanState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v6, 0, sizeof(v6));
  if (!-[CKVerticalTiledLayoutGenerator _scanTilePair:](self, "_scanTilePair:", v6))
    goto LABEL_5;
  if (!-[CKVerticalTiledLayoutGenerator _addRowWithContiguousTiles:count:](self, "_addRowWithContiguousTiles:count:", v6, 2))
  {
    -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v3);
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v4 = 1;
LABEL_6:

  return v4;
}

- (BOOL)_parseTileTriplet
{
  void *v3;
  BOOL v4;
  _OWORD v6[9];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[CKTiledLayoutGenerator scanState](self, "scanState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v6, 0, sizeof(v6));
  if (!-[CKVerticalTiledLayoutGenerator _scanTileTriplet:](self, "_scanTileTriplet:", v6))
    goto LABEL_5;
  if (!-[CKVerticalTiledLayoutGenerator _addRowWithContiguousTiles:count:](self, "_addRowWithContiguousTiles:count:", v6, 3))
  {
    -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v3);
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v4 = 1;
LABEL_6:

  return v4;
}

- (BOOL)_parseTileRequiringFullWidth
{
  _BOOL4 v3;
  _OWORD v5[3];

  memset(v5, 0, sizeof(v5));
  v3 = -[CKVerticalTiledLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", v5);
  if (v3)
    -[CKVerticalTiledLayoutGenerator _addRowWithContiguousTiles:count:](self, "_addRowWithContiguousTiles:count:", v5, 1);
  return v3;
}

- (BOOL)_parseSpecialTileTriplet
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
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
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  BOOL v37;
  __int128 *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _OWORD v49[3];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  -[CKTiledLayoutGenerator scanState](self, "scanState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v50 = 0u;
  memset(v49, 0, sizeof(v49));
  v47 = 0u;
  v48 = 0u;
  v46 = 0u;
  if (-[CKVerticalTiledLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0))
    goto LABEL_37;
  if (!-[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &v46))
    goto LABEL_37;
  if (-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0))
    goto LABEL_37;
  if (!-[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", v49))
    goto LABEL_37;
  if (-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0))
    goto LABEL_37;
  if (!-[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &v50))
    goto LABEL_37;
  if (-[CKVerticalTiledLayoutGenerator _hasLeftSuboptimalRow](self, "_hasLeftSuboptimalRow"))
    goto LABEL_37;
  -[CKTiledLayoutGenerator interTileSpacing](self, "interTileSpacing");
  v5 = v4;
  v7 = v6;
  -[CKVerticalTiledLayoutGenerator referenceWidth](self, "referenceWidth");
  v9 = v8 - v5;
  v10 = v9 * 0.75;
  -[CKTiledLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, v9 * 0.5);
  v12 = v11 + v11;
  -[CKTiledLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, v10 * 0.5);
  v14 = v13 + v13;
  v40 = 0uLL;
  *(double *)&v41 = v12 * 0.5;
  *((double *)&v41 + 1) = v7 + v14;
  *(double *)&v42 = v5 + v12 * 0.5;
  *((_QWORD *)&v42 + 1) = 0;
  *(double *)&v43 = v12 * 0.5;
  *((double *)&v43 + 1) = v14 * 0.5;
  *(double *)&v44 = *(double *)&v42;
  *((double *)&v44 + 1) = v7 + v14 * 0.5;
  *(double *)&v45 = v12 * 0.5;
  *((double *)&v45 + 1) = v14 * 0.5;
  if (!-[CKVerticalTiledLayoutGenerator _addRowWithTiles:imageFrames:count:](self, "_addRowWithTiles:imageFrames:count:", &v46, &v40, 3))
  {
LABEL_37:
    -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v3);
    if (-[CKVerticalTiledLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0))
      goto LABEL_38;
    if (!-[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &v46))
      goto LABEL_38;
    if (-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0))
      goto LABEL_38;
    if (!-[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", v49))
      goto LABEL_38;
    if (-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0))
      goto LABEL_38;
    if (!-[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &v50))
      goto LABEL_38;
    if (-[CKVerticalTiledLayoutGenerator _hasLeftSuboptimalRow](self, "_hasLeftSuboptimalRow"))
      goto LABEL_38;
    -[CKTiledLayoutGenerator interTileSpacing](self, "interTileSpacing");
    v16 = v15;
    v18 = v17;
    -[CKVerticalTiledLayoutGenerator referenceWidth](self, "referenceWidth");
    v20 = v19 - v16;
    v21 = v20 * 0.75;
    -[CKTiledLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, v20 * 0.5);
    v23 = v22 + v22;
    -[CKTiledLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, v21 * 0.5);
    v25 = v24 + v24;
    v40 = 0uLL;
    *(double *)&v41 = v23 * 0.5;
    *((double *)&v41 + 1) = v25 * 0.5;
    *(double *)&v42 = v16 + v23 * 0.5;
    *((_QWORD *)&v42 + 1) = 0;
    *(double *)&v43 = v23 * 0.5;
    *((double *)&v43 + 1) = v18 + v25;
    *(_QWORD *)&v44 = 0;
    *((double *)&v44 + 1) = v16 + v25 * 0.5;
    *(double *)&v45 = v23 * 0.5;
    *((double *)&v45 + 1) = v25 * 0.5;
    if (!-[CKVerticalTiledLayoutGenerator _addRowWithTiles:imageFrames:count:](self, "_addRowWithTiles:imageFrames:count:", &v46, &v40, 3))
    {
LABEL_38:
      -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v3);
      if (-[CKVerticalTiledLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0))
        goto LABEL_26;
      if (!-[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &v46))
        goto LABEL_26;
      if (-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0))
        goto LABEL_26;
      if (!-[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", v49))
        goto LABEL_26;
      if (-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0))
        goto LABEL_26;
      if (!-[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &v50))
        goto LABEL_26;
      if (-[CKVerticalTiledLayoutGenerator _hasLeftSuboptimalRow](self, "_hasLeftSuboptimalRow"))
        goto LABEL_26;
      -[CKTiledLayoutGenerator interTileSpacing](self, "interTileSpacing");
      v27 = v26;
      v29 = v28;
      -[CKVerticalTiledLayoutGenerator referenceWidth](self, "referenceWidth");
      v31 = v30 - v27;
      v32 = v31 * 0.75;
      -[CKTiledLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, v31 * 0.5);
      v34 = v33 + v33;
      -[CKTiledLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, v32 * 0.5);
      v36 = v35 + v35;
      v40 = 0uLL;
      *(double *)&v41 = v34 * 0.5;
      *((double *)&v41 + 1) = v36 * 0.5;
      *(_QWORD *)&v42 = 0;
      *((double *)&v42 + 1) = v27 + v36 * 0.5;
      *(double *)&v43 = v34 * 0.5;
      *((double *)&v43 + 1) = v36 * 0.5;
      *(double *)&v44 = v27 + v34 * 0.5;
      *((_QWORD *)&v44 + 1) = 0;
      *(double *)&v45 = v34 * 0.5;
      *((double *)&v45 + 1) = v29 + v36;
      if (!-[CKVerticalTiledLayoutGenerator _addRowWithTiles:imageFrames:count:](self, "_addRowWithTiles:imageFrames:count:", &v46, &v40, 3))
      {
LABEL_26:
        -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v3);
        if (-[CKVerticalTiledLayoutGenerator _scanTripletWithLargeLead:](self, "_scanTripletWithLargeLead:", &v46))
        {
          v37 = 1;
          -[CKVerticalTiledLayoutGenerator _addRowWithContiguousTiles:count:](self, "_addRowWithContiguousTiles:count:", &v46, 1);
          if (-[CKVerticalTiledLayoutGenerator _addRowWithContiguousTiles:count:](self, "_addRowWithContiguousTiles:count:", v49, 2))
          {
            goto LABEL_34;
          }
          v37 = 1;
          -[CKVerticalTiledLayoutGenerator _addRowWithContiguousTiles:count:](self, "_addRowWithContiguousTiles:count:", v49, 1);
          v38 = &v50;
        }
        else
        {
          -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v3);
          if (!-[CKVerticalTiledLayoutGenerator _scanTripletWithRearrangment:](self, "_scanTripletWithRearrangment:", &v46)|| (v40 = v46, v41 = v47, v42 = v48, v43 = v50, v44 = v51, v45 = v52, !-[CKVerticalTiledLayoutGenerator _addRowWithContiguousTiles:count:](self, "_addRowWithContiguousTiles:count:", &v40, 2)))
          {
            -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v3);
            v37 = 0;
            goto LABEL_34;
          }
          v38 = v49;
          v37 = 1;
        }
        -[CKVerticalTiledLayoutGenerator _addRowWithContiguousTiles:count:](self, "_addRowWithContiguousTiles:count:", v38, 1);
        goto LABEL_34;
      }
    }
  }
  v37 = 1;
LABEL_34:

  return v37;
}

- (BOOL)_parseSpecialSequence
{
  _BOOL4 v3;
  char v5;

  v5 = 0;
  v3 = -[CKVerticalTiledLayoutGenerator _parseSpecialSubsequenceWithRowRequired:rowParsed:](self, "_parseSpecialSubsequenceWithRowRequired:rowParsed:", 1, &v5);
  if (v3)
  {
    do
    {
      if (!v5)
        break;
      v5 = 0;
    }
    while (-[CKVerticalTiledLayoutGenerator _parseSpecialSubsequenceWithRowRequired:rowParsed:](self, "_parseSpecialSubsequenceWithRowRequired:rowParsed:", 0, &v5));
  }
  return v3;
}

- (BOOL)_parseSpecialSubsequenceWithRowRequired:(BOOL)a3 rowParsed:(BOOL *)a4
{
  void *v7;
  void *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  BOOL v12;
  BOOL v13;
  uint64_t v15;
  _OWORD v16[9];
  _BYTE v17[152];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[CKTiledLayoutGenerator scanState](self, "scanState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v17, 0, 144);
  if (-[CKVerticalTiledLayoutGenerator _scanSpecialSequenceBlock:](self, "_scanSpecialSequenceBlock:", v17))
  {
    -[CKTiledLayoutGenerator scanState](self, "scanState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v16, 0, sizeof(v16));
    v15 = 0;
    v9 = -[CKVerticalTiledLayoutGenerator _scanSpecialSequenceRow:count:](self, "_scanSpecialSequenceRow:count:", v16, &v15);
    if (v9)
    {
      v10 = v9;
      v11 = -[CKVerticalTiledLayoutGenerator _addSpecialSequenceBlock:](self, "_addSpecialSequenceBlock:", v17);
      if (v10 && v11)
      {
        if (-[CKVerticalTiledLayoutGenerator _addRowWithContiguousTiles:count:](self, "_addRowWithContiguousTiles:count:", v16, v15))
        {
          v12 = 1;
        }
        else
        {
          -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v8);
          v12 = 0;
        }
        v13 = 1;
LABEL_15:

        if (!a4)
          goto LABEL_17;
        goto LABEL_16;
      }
    }
    else
    {
      if (a3 || -[CKVerticalTiledLayoutGenerator _hasLeftSuboptimalRow](self, "_hasLeftSuboptimalRow"))
      {
        v12 = 0;
        v13 = 0;
        goto LABEL_15;
      }
      LOBYTE(v11) = -[CKVerticalTiledLayoutGenerator _addSpecialSequenceBlock:](self, "_addSpecialSequenceBlock:", v17);
    }
    v13 = v11;
    v12 = 0;
    goto LABEL_15;
  }
  v12 = 0;
  v13 = 0;
  if (a4)
LABEL_16:
    *a4 = v12;
LABEL_17:
  if (!v13)
    -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v7);

  return v13;
}

- (BOOL)_scanTileRequiringNewRow:(id *)a3
{
  void *v5;
  _BOOL4 v6;
  _OWORD v8[2];
  __int128 v9;

  -[CKTiledLayoutGenerator scanState](self, "scanState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKVerticalTiledLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", a3))
  {
LABEL_2:
    LOBYTE(v6) = 1;
    goto LABEL_3;
  }
  v9 = 0u;
  memset(v8, 0, sizeof(v8));
  v6 = -[CKTiledLayoutGenerator scanAnyTile:](self, "scanAnyTile:", v8);
  if (v6 && !BYTE8(v9))
  {
    if (!objc_msgSend(v5, "scannedBatchHasCaption") || !BYTE9(v9))
    {
      -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v5);
      LOBYTE(v6) = 0;
      goto LABEL_3;
    }
    goto LABEL_2;
  }
LABEL_3:

  return v6;
}

- (BOOL)_scanTilePair:(id *)a3
{
  void *v5;
  $AA7438D7D1A0E3C1B13DD04217278145 *v6;
  BOOL v7;

  -[CKTiledLayoutGenerator scanState](self, "scanState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKVerticalTiledLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0)
    || !-[CKTiledLayoutGenerator scanAnyTile:](self, "scanAnyTile:", a3)
    || -[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    || (a3 ? (v6 = a3 + 1) : (v6 = 0), !-[CKTiledLayoutGenerator scanAnyTile:](self, "scanAnyTile:", v6)))
  {
    -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v5);
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)_scanTileTriplet:(id *)a3
{
  void *v5;
  $AA7438D7D1A0E3C1B13DD04217278145 *v6;
  $AA7438D7D1A0E3C1B13DD04217278145 *v7;
  BOOL v8;

  -[CKTiledLayoutGenerator scanState](self, "scanState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKVerticalTiledLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0)
    || !-[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", a3)
    || -[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    || (a3 ? (v6 = a3 + 1) : (v6 = 0),
        !-[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", v6)
     || -[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
     || (a3 ? (v7 = a3 + 2) : (v7 = 0),
         !-[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", v7)
      || -[CKVerticalTiledLayoutGenerator _hasLeftSuboptimalRow](self, "_hasLeftSuboptimalRow"))))
  {
    -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v5);
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)_scanSpecialSequenceBlock:(id *)a3
{
  return -[CKVerticalTiledLayoutGenerator _scanNonPanoramaSequence:count:](self, "_scanNonPanoramaSequence:count:", a3, 3);
}

- (BOOL)_scanSpecialSequenceRow:(id *)a3 count:(int64_t *)a4
{
  void *v7;
  int64_t v8;
  BOOL v9;

  -[CKTiledLayoutGenerator scanState](self, "scanState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKVerticalTiledLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", a3))
  {
    v8 = 1;
  }
  else
  {
    -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v7);
    if (-[CKVerticalTiledLayoutGenerator _scanNonPanoramaSequence:count:](self, "_scanNonPanoramaSequence:count:", a3, 3)&& !-[CKVerticalTiledLayoutGenerator _hasLeftSuboptimalRow](self, "_hasLeftSuboptimalRow"))
    {
      v8 = 3;
    }
    else
    {
      -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v7);
      if (!-[CKVerticalTiledLayoutGenerator _scanNonPanoramaSequence:count:](self, "_scanNonPanoramaSequence:count:", a3, 2)|| -[CKVerticalTiledLayoutGenerator _hasLeftSuboptimalRow](self, "_hasLeftSuboptimalRow"))
      {
        -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v7);
        v9 = 0;
        goto LABEL_11;
      }
      v8 = 2;
    }
  }
  if (a4)
    *a4 = v8;
  v9 = 1;
LABEL_11:

  return v9;
}

- (BOOL)_scanNonPanoramaSequence:(id *)a3 count:(int64_t)a4
{
  int64_t v7;
  void *v8;
  $AA7438D7D1A0E3C1B13DD04217278145 *v9;
  $AA7438D7D1A0E3C1B13DD04217278145 *v10;
  BOOL v11;
  void *v14;
  uint64_t v15;

  v7 = a4 - 1;
  if (a4 <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKVerticalTiledLayoutGenerator.m"), 439, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count >= 2"));

  }
  -[CKTiledLayoutGenerator scanState](self, "scanState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKVerticalTiledLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0)
    || (v15 = 0, !-[CKTiledLayoutGenerator scanTile:type:](self, "scanTile:type:", a3, &v15))
    || (unint64_t)(v15 - 5) > 0xFFFFFFFFFFFFFFFDLL)
  {
LABEL_15:
    -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v8);
    v11 = 0;
    goto LABEL_16;
  }
  if (a4 >= 2)
  {
    v9 = a3 + 1;
    while (!-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0))
    {
      v10 = a3 ? v9 : 0;
      if (!-[CKTiledLayoutGenerator scanTile:ofType:](self, "scanTile:ofType:", v10, v15))
        break;
      ++v9;
      if (!--v7)
        goto LABEL_14;
    }
    goto LABEL_15;
  }
LABEL_14:
  v11 = 1;
LABEL_16:

  return v11;
}

- (BOOL)_scanTripletWithLargeLead:(id *)a3
{
  void *v5;
  BOOL v6;
  void *v9;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKVerticalTiledLayoutGenerator.m"), 465, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tileInfos != NULL"));

  }
  -[CKTiledLayoutGenerator scanState](self, "scanState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CKVerticalTiledLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0)
    && -[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", a3)
    && !-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[1])
    && !-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[2])
    && -[CKVerticalTiledLayoutGenerator _isAtEndOfRow](self, "_isAtEndOfRow"))
  {
    goto LABEL_80;
  }
  -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v5);
  if (!-[CKVerticalTiledLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0)
    && -[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", a3)
    && !-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &a3[1])
    && !-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &a3[2])
    && -[CKVerticalTiledLayoutGenerator _isAtEndOfRow](self, "_isAtEndOfRow"))
  {
    goto LABEL_80;
  }
  -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v5);
  if (!-[CKVerticalTiledLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0)
    && -[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", a3)
    && !-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &a3[1])
    && !-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[CKTiledLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[2])
    && -[CKVerticalTiledLayoutGenerator _isAtEndOfRow](self, "_isAtEndOfRow"))
  {
    goto LABEL_80;
  }
  -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v5);
  if (!-[CKVerticalTiledLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0)
    && -[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", a3)
    && !-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[CKTiledLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[1])
    && !-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[CKTiledLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[2])
    && -[CKVerticalTiledLayoutGenerator _isAtEndOfRow](self, "_isAtEndOfRow"))
  {
    goto LABEL_80;
  }
  if ((-[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v5),
        !-[CKVerticalTiledLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0))
    && -[CKTiledLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", a3)
    && !-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[1])
    && !-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[2])
    && -[CKVerticalTiledLayoutGenerator _isAtEndOfRow](self, "_isAtEndOfRow")
    || (-[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v5),
        !-[CKVerticalTiledLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0))
    && -[CKTiledLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", a3)
    && !-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[1])
    && !-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &a3[2])
    && -[CKVerticalTiledLayoutGenerator _isAtEndOfRow](self, "_isAtEndOfRow")
    || (-[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v5),
        !-[CKVerticalTiledLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0))
    && -[CKTiledLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", a3)
    && !-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[1])
    && !-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[CKTiledLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[2])
    && -[CKVerticalTiledLayoutGenerator _isAtEndOfRow](self, "_isAtEndOfRow")
    || (-[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v5),
        !-[CKVerticalTiledLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0))
    && -[CKTiledLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", a3)
    && !-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &a3[1])
    && !-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &a3[2])
    && -[CKVerticalTiledLayoutGenerator _isAtEndOfRow](self, "_isAtEndOfRow")
    || (-[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v5),
        !-[CKVerticalTiledLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0))
    && -[CKTiledLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", a3)
    && !-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &a3[1])
    && !-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[2])
    && -[CKVerticalTiledLayoutGenerator _isAtEndOfRow](self, "_isAtEndOfRow")
    || (-[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v5),
        !-[CKVerticalTiledLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0))
    && -[CKTiledLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", a3)
    && !-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &a3[1])
    && !-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[CKTiledLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[2])
    && -[CKVerticalTiledLayoutGenerator _isAtEndOfRow](self, "_isAtEndOfRow")
    || (-[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v5),
        !-[CKVerticalTiledLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0))
    && -[CKTiledLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", a3)
    && !-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[CKTiledLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[1])
    && !-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[CKTiledLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[2])
    && -[CKVerticalTiledLayoutGenerator _isAtEndOfRow](self, "_isAtEndOfRow"))
  {
LABEL_80:
    v6 = 1;
  }
  else
  {
    -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v5);
    v6 = 0;
  }

  return v6;
}

- (BOOL)_scanTripletWithRearrangment:(id *)a3
{
  void *v5;
  BOOL v6;
  void *v9;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKVerticalTiledLayoutGenerator.m"), 594, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tileInfos != NULL"));

  }
  -[CKTiledLayoutGenerator scanState](self, "scanState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CKVerticalTiledLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0)
    && -[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", a3)
    && !-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[1])
    && !-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &a3[2])
    && -[CKVerticalTiledLayoutGenerator _isAtEndOfRow](self, "_isAtEndOfRow")
    || (-[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v5),
        !-[CKVerticalTiledLayoutGenerator _scanTileRequiringFullWidth:](self, "_scanTileRequiringFullWidth:", 0))
    && -[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", a3)
    && !-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[CKTiledLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[1])
    && !-[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0)
    && -[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &a3[2])
    && -[CKVerticalTiledLayoutGenerator _isAtEndOfRow](self, "_isAtEndOfRow"))
  {
    v6 = 1;
  }
  else
  {
    -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v5);
    v6 = 0;
  }

  return v6;
}

- (BOOL)_hasLeftSuboptimalRow
{
  void *v3;
  BOOL v4;

  -[CKTiledLayoutGenerator scanState](self, "scanState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", 0))
    v4 = -[CKVerticalTiledLayoutGenerator _isAtEndOfRow](self, "_isAtEndOfRow");
  else
    v4 = 0;
  -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v3);

  return v4;
}

- (BOOL)_isAtEndOfRow
{
  void *v3;
  BOOL v4;

  -[CKTiledLayoutGenerator scanState](self, "scanState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CKTiledLayoutGenerator isAtEnd](self, "isAtEnd")
    || -[CKVerticalTiledLayoutGenerator _scanTileRequiringNewRow:](self, "_scanTileRequiringNewRow:", 0);
  -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v3);

  return v4;
}

- (void)_enqueueCaptionWithTileInfo:(id *)a3
{
  __int128 v5;
  __int128 v6;

  -[CKVerticalTiledLayoutGenerator _dequeueCaption](self, "_dequeueCaption");
  v6 = *(_OWORD *)&a3->var1.height;
  v5 = *(_OWORD *)&a3->var2.height;
  *(_OWORD *)&self->_enqueuedCaptionTileInfo.index = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_enqueuedCaptionTileInfo.imageSize.height = v6;
  *(_OWORD *)&self->_enqueuedCaptionTileInfo.minimumSize.height = v5;
}

- (BOOL)_hasEnqueuedCaption
{
  return self->_enqueuedCaptionTileInfo.index != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_dequeueCaption
{
  _BOOL4 v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double x;
  double y;
  double v11;
  CGRect v13;

  v3 = -[CKVerticalTiledLayoutGenerator _hasEnqueuedCaption](self, "_hasEnqueuedCaption");
  if (v3)
  {
    if (-[CKVerticalTiledLayoutGenerator shouldDisplayCaptionsBelowBatches](self, "shouldDisplayCaptionsBelowBatches")
      || self->_enqueuedCaptionTileInfo.index >= 1)
    {
      -[CKTiledLayoutGenerator captionPadding](self, "captionPadding");
      self->_origin.y = v4 + self->_origin.y;
    }
    -[CKVerticalTiledLayoutGenerator referenceWidth](self, "referenceWidth");
    -[CKTiledLayoutGenerator captionSizeForTileAtIndex:proposedSize:](self, "captionSizeForTileAtIndex:proposedSize:", self->_enqueuedCaptionTileInfo.index);
    v6 = v5;
    v8 = v7;
    x = self->_origin.x;
    y = self->_origin.y;
    -[CKTiledLayoutGenerator parsedFrame:type:forTileAtIndex:](self, "parsedFrame:type:forTileAtIndex:", 1, self->_enqueuedCaptionTileInfo.index, x, y, v5, v7);
    v13.origin.x = x;
    v13.origin.y = y;
    v13.size.width = v6;
    v13.size.height = v8;
    self->_origin.y = CGRectGetMaxY(v13);
    if (-[CKVerticalTiledLayoutGenerator shouldDisplayCaptionsBelowBatches](self, "shouldDisplayCaptionsBelowBatches")
      || self->_enqueuedCaptionTileInfo.index >= 1)
    {
      -[CKTiledLayoutGenerator captionPadding](self, "captionPadding");
      self->_origin.y = self->_origin.y + v11;
    }
    self->_enqueuedCaptionTileInfo.index = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v3;
}

- (BOOL)_addRowWithContiguousTiles:(id *)a3 count:(int64_t)a4
{
  uint64_t v7;
  CGFloat *p_height;
  int64_t v9;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  BOOL v14;
  _QWORD v16[6];
  _OWORD v17[3];
  _QWORD v18[6];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v23 = -[CKTiledLayoutGenerator numberOfMagneticGuidelines](self, "numberOfMagneticGuidelines") > 0;
  v7 = MEMORY[0x1E0C809B0];
  if (*((_BYTE *)v21 + 24))
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __67__CKVerticalTiledLayoutGenerator__addRowWithContiguousTiles_count___block_invoke;
    v19[3] = &unk_1E274FFF8;
    v19[4] = &v20;
    -[CKVerticalTiledLayoutGenerator _enumerateRowFramesWithContiguousTiles:count:useMagneticGuidelines:block:](self, "_enumerateRowFramesWithContiguousTiles:count:useMagneticGuidelines:block:", a3, a4, 1, v19);
  }
  if (a4 >= 2)
  {
    p_height = &a3->var2.height;
    v9 = a4;
    while (*(p_height - 1) == *MEMORY[0x1E0C9D820] && *p_height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      p_height += 6;
      if (!--v9)
        goto LABEL_11;
    }
    v11 = *((unsigned __int8 *)v21 + 24);
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __67__CKVerticalTiledLayoutGenerator__addRowWithContiguousTiles_count___block_invoke_2;
    v18[3] = &unk_1E2750020;
    v18[4] = &v24;
    v18[5] = a3;
    -[CKVerticalTiledLayoutGenerator _enumerateRowFramesWithContiguousTiles:count:useMagneticGuidelines:block:](self, "_enumerateRowFramesWithContiguousTiles:count:useMagneticGuidelines:block:", a3, a4, v11, v18);
  }
LABEL_11:
  if (*((_BYTE *)v25 + 24))
  {
    v12 = *(_OWORD *)&a3->var1.height;
    v17[0] = *(_OWORD *)&a3->var0;
    v17[1] = v12;
    v17[2] = *(_OWORD *)&a3->var2.height;
    -[CKVerticalTiledLayoutGenerator _willAddRowWithFirstTileInfo:](self, "_willAddRowWithFirstTileInfo:", v17);
    v13 = *((unsigned __int8 *)v21 + 24);
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __67__CKVerticalTiledLayoutGenerator__addRowWithContiguousTiles_count___block_invoke_3;
    v16[3] = &unk_1E2750048;
    v16[4] = self;
    v16[5] = a3;
    -[CKVerticalTiledLayoutGenerator _enumerateRowFramesWithContiguousTiles:count:useMagneticGuidelines:block:](self, "_enumerateRowFramesWithContiguousTiles:count:useMagneticGuidelines:block:", a3, a4, v13, v16);
    v14 = *((_BYTE *)v25 + 24) != 0;
  }
  else
  {
    v14 = 0;
  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v14;
}

uint64_t __67__CKVerticalTiledLayoutGenerator__addRowWithContiguousTiles_count___block_invoke(uint64_t result, double a2, double a3, double a4, uint64_t a5, _BYTE *a6)
{
  if (a4 < 0.0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
    *a6 = 1;
  }
  return result;
}

void __67__CKVerticalTiledLayoutGenerator__addRowWithContiguousTiles_count___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  uint64_t v13;
  double v14;
  double v15;
  CGRect v16;

  v13 = *(_QWORD *)(a1 + 40) + 48 * a2;
  v15 = *(double *)(v13 + 24);
  v14 = *(double *)(v13 + 32);
  if (CGRectGetWidth(*(CGRect *)&a4) < v15
    || (v16.origin.x = a4, v16.origin.y = a5, v16.size.width = a6, v16.size.height = a7, CGRectGetHeight(v16) < v14))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
}

void __67__CKVerticalTiledLayoutGenerator__addRowWithContiguousTiles_count___block_invoke_3(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  double v11;
  double MaxY;
  CGRect v13;

  objc_msgSend(*(id *)(a1 + 32), "parsedFrame:type:forTileAtIndex:", 0, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48 * a2));
  v11 = *(double *)(*(_QWORD *)(a1 + 32) + 1320);
  v13.origin.x = a3;
  v13.origin.y = a4;
  v13.size.width = a5;
  v13.size.height = a6;
  MaxY = CGRectGetMaxY(v13);
  if (v11 >= MaxY)
    MaxY = v11;
  *(double *)(*(_QWORD *)(a1 + 32) + 1320) = MaxY;
}

- (void)_enumerateRowFramesWithContiguousTiles:(id *)a3 count:(int64_t)a4 useMagneticGuidelines:(BOOL)a5 block:(id)a6
{
  _BOOL8 v6;
  void (**v10)(id, int64_t, _BYTE *, double, double, double, double);
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat *p_height;
  double v16;
  int64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGPoint *p_origin;
  double y;
  double v24;
  int64_t v25;
  double v26;
  double x;
  CGFloat *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  char v35;

  v6 = a5;
  v10 = (void (**)(id, int64_t, _BYTE *, double, double, double, double))a6;
  -[CKTiledLayoutGenerator interTileSpacing](self, "interTileSpacing");
  v12 = v11;
  v14 = v13;
  if (a4 < 1)
  {
    v16 = 0.0;
  }
  else
  {
    p_height = &a3->var1.height;
    v16 = 0.0;
    v17 = a4;
    do
    {
      v16 = v16 + *(p_height - 1) / *p_height;
      p_height += 6;
      --v17;
    }
    while (v17);
  }
  -[CKVerticalTiledLayoutGenerator referenceWidth](self, "referenceWidth");
  v19 = (v18 - (double)(a4 - 1) * v12) / v16;
  -[CKTiledLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, v19);
  v21 = v20;
  p_origin = &self->_origin;
  y = self->_origin.y;
  v24 = -0.0;
  if (y > 0.0)
    v24 = v14;
  if (a4 >= 1)
  {
    v25 = 0;
    v26 = y + v24;
    x = p_origin->x;
    v28 = &a3->var1.height;
    v29 = p_origin->x;
    do
    {
      v30 = x + *(v28 - 1) / *v28 * v19;
      if (v25 >= a4 - 1)
        v31 = 0.0;
      else
        v31 = v12 * 0.5;
      -[CKTiledLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", v6, v31 + v30);
      v33 = v32 - v31;
      -[CKVerticalTiledLayoutGenerator referenceWidth](self, "referenceWidth");
      if (v33 >= v34)
        v33 = v34;
      v35 = 0;
      v10[2](v10, v25, &v35, v29, v26, v33 - v29, v21);
      if (v35)
        break;
      x = v12 + v30;
      v29 = v12 + v33;
      ++v25;
      v28 += 6;
    }
    while (a4 != v25);
  }

}

- (BOOL)_addRowWithTiles:(id *)a3 imageFrames:(CGRect *)a4 count:(int64_t)a5
{
  int64_t v5;
  $AA7438D7D1A0E3C1B13DD04217278145 *v7;
  CGFloat *p_height;
  CGFloat *v10;
  int64_t v11;
  __int128 v12;
  double x;
  double y;
  double v15;
  CGSize *p_size;
  int64_t var0;
  double width;
  double height;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  double MaxY;
  _OWORD v27[3];
  CGRect v28;

  v5 = a5;
  v7 = a3;
  if (a5 < 2)
  {
LABEL_6:
    v12 = *(_OWORD *)&a3->var1.height;
    v27[0] = *(_OWORD *)&a3->var0;
    v27[1] = v12;
    v27[2] = *(_OWORD *)&a3->var2.height;
    -[CKVerticalTiledLayoutGenerator _willAddRowWithFirstTileInfo:](self, "_willAddRowWithFirstTileInfo:", v27);
    x = self->_origin.x;
    y = self->_origin.y;
    if (y > 0.0)
    {
      -[CKTiledLayoutGenerator interTileSpacing](self, "interTileSpacing");
      y = y + v15;
    }
    if (v5 >= 1)
    {
      p_size = &a4->size;
      do
      {
        var0 = v7->var0;
        ++v7;
        width = p_size[-1].width;
        height = p_size[-1].height;
        v20 = p_size->width;
        v21 = p_size->height;
        p_size += 2;
        v22 = x + width;
        v23 = y + height;
        -[CKTiledLayoutGenerator parsedFrame:type:forTileAtIndex:](self, "parsedFrame:type:forTileAtIndex:", 0, var0, x + width, y + height, v20, v21);
        v24 = self->_origin.y;
        v28.origin.x = v22;
        v28.origin.y = v23;
        v28.size.width = v20;
        v28.size.height = v21;
        MaxY = CGRectGetMaxY(v28);
        if (v24 >= MaxY)
          MaxY = v24;
        self->_origin.y = MaxY;
        --v5;
      }
      while (v5);
    }
    return 1;
  }
  else
  {
    p_height = &a4->size.height;
    v10 = &a3->var2.height;
    v11 = a5;
    while (*(p_height - 1) >= *(v10 - 1) && *p_height >= *v10)
    {
      p_height += 4;
      v10 += 6;
      if (!--v11)
        goto LABEL_6;
    }
    return 0;
  }
}

- (BOOL)_addSpecialSequenceBlock:(id *)a3
{
  int64_t v5;
  double width;
  double height;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _BOOL4 v26;
  __int128 v28;
  __int128 v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = -[CKTiledLayoutGenerator scanSpecialSequenceCount](self, "scanSpecialSequenceCount");
  width = a3->var1.width;
  height = a3->var1.height;
  -[CKTiledLayoutGenerator interTileSpacing](self, "interTileSpacing");
  v9 = v8;
  v11 = v10;
  -[CKVerticalTiledLayoutGenerator referenceWidth](self, "referenceWidth");
  -[CKTiledLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, height * ((v12 - v9) / 3.0 / width));
  v14 = v13;
  -[CKVerticalTiledLayoutGenerator referenceWidth](self, "referenceWidth");
  v16 = v15;
  v17 = v11 + v14 * 2.0;
  v28 = 0u;
  v29 = 0u;
  if ((v5 & 1) != 0)
  {
    -[CKTiledLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 1, v15 / 3.0, v28, v29);
    v20 = v25 + v9 * -0.5;
    v28 = 0uLL;
    *(double *)&v29 = v20;
    *((double *)&v29 + 1) = v14;
    v22 = v11 + v14;
    v14 = v17 - (v11 + v14);
    v23 = v25 + v9 * 0.5;
    v24 = v16 - v23;
    v19 = 0.0;
    v21 = 0.0;
  }
  else
  {
    -[CKTiledLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 1, (v15 + v15) / 3.0, v28, v29);
    v28 = 0uLL;
    *(double *)&v29 = v18 + v9 * -0.5;
    *((double *)&v29 + 1) = v11 + v14 * 2.0;
    v19 = v18 + v9 * 0.5;
    v20 = v16 - v19;
    v21 = v11 + v14;
    v17 = v17 - (v11 + v14);
    v22 = 0.0;
    v23 = v19;
    v24 = v16 - v19;
  }
  v30 = v19;
  v31 = v22;
  v32 = v20;
  v33 = v14;
  v34 = v23;
  v35 = v21;
  v36 = v24;
  v37 = v17;
  v26 = -[CKVerticalTiledLayoutGenerator _addRowWithTiles:imageFrames:count:](self, "_addRowWithTiles:imageFrames:count:", a3, &v28, 3);
  if (v26)
    -[CKTiledLayoutGenerator setScanSpecialSequenceCount:](self, "setScanSpecialSequenceCount:", v5 + 1, v28, v29);
  return v26;
}

- (void)_willAddRowWithFirstTileInfo:(id *)a3
{
  double v5;
  __int128 v6;
  _OWORD v7[3];

  if (a3->var4
    && !-[CKVerticalTiledLayoutGenerator _dequeueCaption](self, "_dequeueCaption")
    && a3->var3
    && a3->var0 >= 1)
  {
    -[CKTiledLayoutGenerator noCaptionSpacing](self, "noCaptionSpacing");
    self->_origin.y = v5 + self->_origin.y;
  }
  if (a3->var3)
  {
    v6 = *(_OWORD *)&a3->var1.height;
    v7[0] = *(_OWORD *)&a3->var0;
    v7[1] = v6;
    v7[2] = *(_OWORD *)&a3->var2.height;
    -[CKVerticalTiledLayoutGenerator _enqueueCaptionWithTileInfo:](self, "_enqueueCaptionWithTileInfo:", v7);
    if (!-[CKVerticalTiledLayoutGenerator shouldDisplayCaptionsBelowBatches](self, "shouldDisplayCaptionsBelowBatches"))
      -[CKVerticalTiledLayoutGenerator _dequeueCaption](self, "_dequeueCaption");
  }
}

- (double)referenceWidth
{
  return self->_referenceWidth;
}

- (void)setReferenceWidth:(double)a3
{
  self->_referenceWidth = a3;
}

- (BOOL)shouldDisplayCaptionsBelowBatches
{
  return self->_shouldDisplayCaptionsBelowBatches;
}

- (void)setShouldDisplayCaptionsBelowBatches:(BOOL)a3
{
  self->_shouldDisplayCaptionsBelowBatches = a3;
}

@end
