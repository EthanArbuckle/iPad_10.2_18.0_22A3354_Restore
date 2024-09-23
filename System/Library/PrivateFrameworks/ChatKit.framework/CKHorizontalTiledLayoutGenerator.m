@implementation CKHorizontalTiledLayoutGenerator

- (void)willParseTiles
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKHorizontalTiledLayoutGenerator;
  -[CKTiledLayoutGenerator willParseTiles](&v3, sel_willParseTiles);
  self->_origin = (CGPoint)*MEMORY[0x1E0C9D538];
}

- (BOOL)parseNextTiles
{
  return -[CKHorizontalTiledLayoutGenerator _parseSpecialSequence](self, "_parseSpecialSequence")
      || -[CKHorizontalTiledLayoutGenerator _parseSpecialTileTriplet](self, "_parseSpecialTileTriplet")
      || -[CKHorizontalTiledLayoutGenerator _parseTileTriplet](self, "_parseTileTriplet")
      || -[CKHorizontalTiledLayoutGenerator _parseTilePair](self, "_parseTilePair")
      || -[CKHorizontalTiledLayoutGenerator _parseSingleTile](self, "_parseSingleTile");
}

- (BOOL)_parseSingleTile
{
  void *v3;
  _BOOL4 v4;
  double v5;
  double v6;
  uint64_t v7;
  _QWORD v9[4];
  __int128 v10;
  __int128 v11;
  __int128 v12;

  -[CKTiledLayoutGenerator scanState](self, "scanState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  v4 = -[CKTiledLayoutGenerator scanAnyTile:](self, "scanAnyTile:", &v10);
  if (v4)
  {
    -[CKHorizontalTiledLayoutGenerator referenceHeight](self, "referenceHeight");
    v6 = v5;
    -[CKTiledLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, v5 * (*((double *)&v10 + 1) / *(double *)&v11));
    v9[0] = 0;
    v9[1] = 0;
    v9[2] = v7;
    *(double *)&v9[3] = v6;
    -[CKHorizontalTiledLayoutGenerator _addColumnWithTiles:imageFrames:count:](self, "_addColumnWithTiles:imageFrames:count:", &v10, v9, 1);
  }
  else
  {
    -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v3);
  }

  return v4;
}

- (BOOL)_parseTilePair
{
  void *v3;
  BOOL v4;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[CKTiledLayoutGenerator scanState](self, "scanState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CKTiledLayoutGenerator scanLocation](self, "scanLocation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)&& -[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &v6)&& -[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &v7)&& -[CKTiledLayoutGenerator isAtEnd](self, "isAtEnd"))
  {
    v4 = 1;
    -[CKHorizontalTiledLayoutGenerator _addColumnWithContiguousTiles:count:](self, "_addColumnWithContiguousTiles:count:", &v6, 1);
    -[CKHorizontalTiledLayoutGenerator _addColumnWithContiguousTiles:count:](self, "_addColumnWithContiguousTiles:count:", &v7, 1);
  }
  else
  {
    -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v3);
    if (-[CKTiledLayoutGenerator scanAnyTile:](self, "scanAnyTile:", &v6)
      && -[CKTiledLayoutGenerator scanAnyTile:](self, "scanAnyTile:", &v7)
      && -[CKHorizontalTiledLayoutGenerator _addColumnWithContiguousTiles:count:](self, "_addColumnWithContiguousTiles:count:", &v6, 2))
    {
      v4 = 1;
    }
    else
    {
      -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v3);
      v4 = 0;
    }
  }

  return v4;
}

- (BOOL)_parseTileTriplet
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
  double v37;
  double v38;
  double v39;
  double v40;
  BOOL v41;
  uint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  _OWORD v55[3];
  _OWORD v56[3];
  _OWORD v57[3];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  -[CKTiledLayoutGenerator scanState](self, "scanState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v57, 0, sizeof(v57));
  memset(v56, 0, sizeof(v56));
  memset(v55, 0, sizeof(v55));
  if (-[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", v55))
  {
    if (-[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", v56))
    {
      if (-[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", v57))
      {
        if (!-[CKHorizontalTiledLayoutGenerator _hasLeftSuboptimalColumn](self, "_hasLeftSuboptimalColumn"))
        {
          -[CKTiledLayoutGenerator interTileSpacing](self, "interTileSpacing");
          v5 = v4;
          v7 = v6;
          -[CKHorizontalTiledLayoutGenerator referenceHeight](self, "referenceHeight");
          v9 = v8 - v7;
          -[CKTiledLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, (v8 - v7) * 0.75 * 0.5);
          v11 = v10 + v10;
          -[CKTiledLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, v9 * 0.5);
          v43 = 0;
          v44 = 0;
          v45 = v11 * 0.5;
          v46 = (v12 + v12) * 0.5;
          v47 = v5 + v11 * 0.5;
          v48 = 0.0;
          v49 = v11 * 0.5;
          v50 = v46;
          v51 = 0.0;
          v52 = v7 + v46;
          v53 = v5 + v11;
          v54 = v46;
          if (-[CKHorizontalTiledLayoutGenerator _addColumnWithTiles:imageFrames:count:](self, "_addColumnWithTiles:imageFrames:count:", v55, &v43, 3))
          {
            goto LABEL_21;
          }
        }
      }
    }
  }
  -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v3);
  if (-[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", v55))
  {
    if (-[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", v56))
    {
      if (-[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", v57))
      {
        if (!-[CKHorizontalTiledLayoutGenerator _hasLeftSuboptimalColumn](self, "_hasLeftSuboptimalColumn"))
        {
          -[CKTiledLayoutGenerator interTileSpacing](self, "interTileSpacing");
          v14 = v13;
          v16 = v15;
          -[CKHorizontalTiledLayoutGenerator referenceHeight](self, "referenceHeight");
          v18 = v17 - v16;
          -[CKTiledLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, (v17 - v16) * 0.75 * 0.5);
          v20 = v19 + v19;
          -[CKTiledLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, v18 * 0.5);
          v43 = 0;
          v44 = 0;
          v45 = v14 + v20;
          v46 = (v21 + v21) * 0.5;
          v47 = 0.0;
          v48 = v16 + v46;
          v49 = v20 * 0.5;
          v50 = v46;
          v51 = v14 + v20 * 0.5;
          v52 = v16 + v46;
          v53 = v20 * 0.5;
          v54 = v46;
          if (-[CKHorizontalTiledLayoutGenerator _addColumnWithTiles:imageFrames:count:](self, "_addColumnWithTiles:imageFrames:count:", v55, &v43, 3))
          {
            goto LABEL_21;
          }
        }
      }
    }
  }
  -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v3);
  if (-[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", v55))
  {
    if (-[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", v56))
    {
      if (-[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", v57))
      {
        if (!-[CKHorizontalTiledLayoutGenerator _hasLeftSuboptimalColumn](self, "_hasLeftSuboptimalColumn"))
        {
          -[CKTiledLayoutGenerator interTileSpacing](self, "interTileSpacing");
          v23 = v22;
          v25 = v24;
          -[CKHorizontalTiledLayoutGenerator referenceHeight](self, "referenceHeight");
          v27 = v26 - v25;
          -[CKTiledLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, (v26 - v25) * 0.75 * 0.5);
          v29 = v28 + v28;
          -[CKTiledLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, v27 * 0.5);
          v43 = 0;
          v44 = 0;
          v45 = v29 * 0.5;
          v46 = (v30 + v30) * 0.5;
          v47 = 0.0;
          v48 = v25 + v46;
          v49 = v23 + v29;
          v50 = v46;
          v51 = v23 + v29 * 0.5;
          v52 = 0.0;
          v53 = v29 * 0.5;
          v54 = v46;
          if (-[CKHorizontalTiledLayoutGenerator _addColumnWithTiles:imageFrames:count:](self, "_addColumnWithTiles:imageFrames:count:", v55, &v43, 3))
          {
            goto LABEL_21;
          }
        }
      }
    }
  }
  -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v3);
  if (!-[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", v55))
    goto LABEL_22;
  if (!-[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", v56))
    goto LABEL_22;
  if (!-[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", v57))
    goto LABEL_22;
  if (-[CKHorizontalTiledLayoutGenerator _hasLeftSuboptimalColumn](self, "_hasLeftSuboptimalColumn"))
    goto LABEL_22;
  -[CKTiledLayoutGenerator interTileSpacing](self, "interTileSpacing");
  v32 = v31;
  v34 = v33;
  -[CKHorizontalTiledLayoutGenerator referenceHeight](self, "referenceHeight");
  v36 = v35 - v34;
  -[CKTiledLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, (v35 - v34) * 1.33333337 * 0.5);
  v38 = v37 + v37;
  -[CKTiledLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, v36 * 0.5);
  v40 = v39 + v39;
  v43 = 0;
  v44 = 0;
  v45 = v38 * 0.5;
  v46 = v40 * 0.5;
  v47 = v32 + v38 * 0.5;
  v48 = 0.0;
  v49 = v38 * 0.5;
  v50 = v34 + v40;
  v51 = 0.0;
  v52 = v34 + v40 * 0.5;
  v53 = v38 * 0.5;
  v54 = v40 * 0.5;
  if (-[CKHorizontalTiledLayoutGenerator _addColumnWithTiles:imageFrames:count:](self, "_addColumnWithTiles:imageFrames:count:", v55, &v43, 3))
  {
LABEL_21:
    v41 = 1;
  }
  else
  {
LABEL_22:
    -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v3);
    v41 = 0;
  }

  return v41;
}

- (BOOL)_parseSpecialTileTriplet
{
  void *v3;
  _BOOL4 v4;
  _OWORD v6[3];
  _OWORD v7[3];
  _OWORD v8[3];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[CKTiledLayoutGenerator scanState](self, "scanState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v8, 0, sizeof(v8));
  memset(v7, 0, sizeof(v7));
  memset(v6, 0, sizeof(v6));
  v4 = -[CKHorizontalTiledLayoutGenerator _scanTripletWithLargeLead:](self, "_scanTripletWithLargeLead:", v6);
  if (v4)
  {
    -[CKHorizontalTiledLayoutGenerator _addColumnWithContiguousTiles:count:](self, "_addColumnWithContiguousTiles:count:", v6, 1);
    if (!-[CKHorizontalTiledLayoutGenerator _addColumnWithContiguousTiles:count:](self, "_addColumnWithContiguousTiles:count:", v7, 2))
    {
      -[CKHorizontalTiledLayoutGenerator _addColumnWithContiguousTiles:count:](self, "_addColumnWithContiguousTiles:count:", v7, 1);
      -[CKHorizontalTiledLayoutGenerator _addColumnWithContiguousTiles:count:](self, "_addColumnWithContiguousTiles:count:", v8, 1);
    }
  }
  else
  {
    -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v3);
  }

  return v4;
}

- (BOOL)_parseSpecialSequence
{
  _BOOL4 v3;
  char v5;

  v5 = 0;
  v3 = -[CKHorizontalTiledLayoutGenerator _parseSpecialSubsequenceWithColumnRequired:columnParsed:](self, "_parseSpecialSubsequenceWithColumnRequired:columnParsed:", 1, &v5);
  if (v3)
  {
    do
    {
      if (!v5)
        break;
      v5 = 0;
    }
    while (-[CKHorizontalTiledLayoutGenerator _parseSpecialSubsequenceWithColumnRequired:columnParsed:](self, "_parseSpecialSubsequenceWithColumnRequired:columnParsed:", 0, &v5));
  }
  return v3;
}

- (BOOL)_parseSpecialSubsequenceWithColumnRequired:(BOOL)a3 columnParsed:(BOOL *)a4
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
  if (-[CKHorizontalTiledLayoutGenerator _scanSpecialSequenceBlock:](self, "_scanSpecialSequenceBlock:", v17))
  {
    -[CKTiledLayoutGenerator scanState](self, "scanState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v16, 0, sizeof(v16));
    v15 = 0;
    v9 = -[CKHorizontalTiledLayoutGenerator _scanSpecialSequenceColumn:count:](self, "_scanSpecialSequenceColumn:count:", v16, &v15);
    if (v9)
    {
      v10 = v9;
      v11 = -[CKHorizontalTiledLayoutGenerator _addSpecialSequenceBlock:](self, "_addSpecialSequenceBlock:", v17);
      if (v10 && v11)
      {
        if (-[CKHorizontalTiledLayoutGenerator _addColumnWithContiguousTiles:count:](self, "_addColumnWithContiguousTiles:count:", v16, v15))
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
      if (a3 || -[CKHorizontalTiledLayoutGenerator _hasLeftSuboptimalColumn](self, "_hasLeftSuboptimalColumn"))
      {
        v12 = 0;
        v13 = 0;
        goto LABEL_15;
      }
      LOBYTE(v11) = -[CKHorizontalTiledLayoutGenerator _addSpecialSequenceBlock:](self, "_addSpecialSequenceBlock:", v17);
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

- (BOOL)_scanTripletWithLargeLead:(id *)a3
{
  void *v5;
  BOOL v6;
  void *v9;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKHorizontalTiledLayoutGenerator.m"), 302, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tileInfos != NULL"));

  }
  -[CKTiledLayoutGenerator scanState](self, "scanState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", a3)
    && -[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[1])
    && -[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[2])
    && -[CKHorizontalTiledLayoutGenerator _isAtEndOfColumn](self, "_isAtEndOfColumn"))
  {
    goto LABEL_43;
  }
  -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v5);
  if (-[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", a3))
  {
    if (-[CKTiledLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[1])
      && -[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[2])
      && -[CKHorizontalTiledLayoutGenerator _isAtEndOfColumn](self, "_isAtEndOfColumn"))
    {
      goto LABEL_43;
    }
  }
  -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v5);
  if (-[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", a3))
  {
    if (-[CKTiledLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[1])
      && -[CKTiledLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[2])
      && -[CKHorizontalTiledLayoutGenerator _isAtEndOfColumn](self, "_isAtEndOfColumn"))
    {
      goto LABEL_43;
    }
  }
  if ((-[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v5),
        -[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", a3))
    && -[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[1])
    && -[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[2])
    && -[CKHorizontalTiledLayoutGenerator _isAtEndOfColumn](self, "_isAtEndOfColumn")
    || (-[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v5),
        -[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", a3))
    && -[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &a3[1])
    && -[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &a3[2])
    && -[CKHorizontalTiledLayoutGenerator _isAtEndOfColumn](self, "_isAtEndOfColumn")
    || (-[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v5),
        -[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", a3))
    && -[CKTiledLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[1])
    && -[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", &a3[2])
    && -[CKHorizontalTiledLayoutGenerator _isAtEndOfColumn](self, "_isAtEndOfColumn")
    || (-[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v5),
        -[CKTiledLayoutGenerator scanTileWithPortraitImage:](self, "scanTileWithPortraitImage:", a3))
    && -[CKTiledLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[1])
    && -[CKTiledLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[2])
    && -[CKHorizontalTiledLayoutGenerator _isAtEndOfColumn](self, "_isAtEndOfColumn")
    || (-[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v5),
        -[CKTiledLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", a3))
    && -[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[1])
    && -[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[2])
    && -[CKHorizontalTiledLayoutGenerator _isAtEndOfColumn](self, "_isAtEndOfColumn")
    || (-[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v5),
        -[CKTiledLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", a3))
    && -[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", &a3[1])
    && -[CKTiledLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[2])
    && -[CKHorizontalTiledLayoutGenerator _isAtEndOfColumn](self, "_isAtEndOfColumn")
    || (-[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v5),
        -[CKTiledLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", a3))
    && -[CKTiledLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[1])
    && -[CKTiledLayoutGenerator scanTileWithSquareImage:](self, "scanTileWithSquareImage:", &a3[2])
    && -[CKHorizontalTiledLayoutGenerator _isAtEndOfColumn](self, "_isAtEndOfColumn"))
  {
LABEL_43:
    v6 = 1;
  }
  else
  {
    -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v5);
    v6 = 0;
  }

  return v6;
}

- (BOOL)_scanSpecialSequenceBlock:(id *)a3
{
  return -[CKHorizontalTiledLayoutGenerator _scanNonPanoramaSequence:count:](self, "_scanNonPanoramaSequence:count:", a3, 3);
}

- (BOOL)_scanSpecialSequenceColumn:(id *)a3 count:(int64_t *)a4
{
  void *v7;
  int64_t v8;
  BOOL v9;

  -[CKTiledLayoutGenerator scanState](self, "scanState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKTiledLayoutGenerator scanTile:ofType:](self, "scanTile:ofType:", a3, 4))
  {
    v8 = 1;
  }
  else
  {
    -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v7);
    if (-[CKHorizontalTiledLayoutGenerator _scanNonPanoramaSequence:count:](self, "_scanNonPanoramaSequence:count:", a3, 3)&& !-[CKHorizontalTiledLayoutGenerator _hasLeftSuboptimalColumn](self, "_hasLeftSuboptimalColumn"))
    {
      v8 = 3;
    }
    else
    {
      -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v7);
      if (!-[CKHorizontalTiledLayoutGenerator _scanNonPanoramaSequence:count:](self, "_scanNonPanoramaSequence:count:", a3, 2)|| -[CKHorizontalTiledLayoutGenerator _hasLeftSuboptimalColumn](self, "_hasLeftSuboptimalColumn"))
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
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKHorizontalTiledLayoutGenerator.m"), 463, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count >= 2"));

  }
  -[CKTiledLayoutGenerator scanState](self, "scanState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  if (!-[CKTiledLayoutGenerator scanTile:type:](self, "scanTile:type:", a3, &v15)
    || (unint64_t)(v15 - 5) > 0xFFFFFFFFFFFFFFFDLL)
  {
LABEL_13:
    -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v8);
    v11 = 0;
    goto LABEL_14;
  }
  if (a4 >= 2)
  {
    v9 = a3 + 1;
    do
    {
      v10 = a3 ? v9 : 0;
      if (!-[CKTiledLayoutGenerator scanTile:ofType:](self, "scanTile:ofType:", v10, v15))
        goto LABEL_13;
      ++v9;
    }
    while (--v7);
  }
  v11 = 1;
LABEL_14:

  return v11;
}

- (BOOL)_hasLeftSuboptimalColumn
{
  void *v3;
  BOOL v4;

  -[CKTiledLayoutGenerator scanState](self, "scanState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKTiledLayoutGenerator scanTileWithLandscapeImage:](self, "scanTileWithLandscapeImage:", 0))
    v4 = -[CKTiledLayoutGenerator isAtEnd](self, "isAtEnd");
  else
    v4 = 0;
  -[CKTiledLayoutGenerator setScanState:](self, "setScanState:", v3);

  return v4;
}

- (BOOL)_addColumnWithContiguousTiles:(id *)a3 count:(int64_t)a4
{
  uint64_t v7;
  CGFloat *p_height;
  int64_t v9;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  _QWORD v15[6];
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v21 = -[CKTiledLayoutGenerator numberOfMagneticGuidelines](self, "numberOfMagneticGuidelines") > 0;
  v7 = MEMORY[0x1E0C809B0];
  if (*((_BYTE *)v19 + 24))
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __72__CKHorizontalTiledLayoutGenerator__addColumnWithContiguousTiles_count___block_invoke;
    v17[3] = &unk_1E274FFF8;
    v17[4] = &v18;
    -[CKHorizontalTiledLayoutGenerator _enumerateColumnFramesWithContiguousTiles:count:useMagneticGuidelines:block:](self, "_enumerateColumnFramesWithContiguousTiles:count:useMagneticGuidelines:block:", a3, a4, 1, v17);
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
    v11 = *((unsigned __int8 *)v19 + 24);
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __72__CKHorizontalTiledLayoutGenerator__addColumnWithContiguousTiles_count___block_invoke_2;
    v16[3] = &unk_1E2750020;
    v16[4] = &v22;
    v16[5] = a3;
    -[CKHorizontalTiledLayoutGenerator _enumerateColumnFramesWithContiguousTiles:count:useMagneticGuidelines:block:](self, "_enumerateColumnFramesWithContiguousTiles:count:useMagneticGuidelines:block:", a3, a4, v11, v16);
  }
LABEL_11:
  if (*((_BYTE *)v23 + 24))
  {
    v12 = *((unsigned __int8 *)v19 + 24);
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __72__CKHorizontalTiledLayoutGenerator__addColumnWithContiguousTiles_count___block_invoke_3;
    v15[3] = &unk_1E2750048;
    v15[4] = self;
    v15[5] = a3;
    -[CKHorizontalTiledLayoutGenerator _enumerateColumnFramesWithContiguousTiles:count:useMagneticGuidelines:block:](self, "_enumerateColumnFramesWithContiguousTiles:count:useMagneticGuidelines:block:", a3, a4, v12, v15);
    v13 = *((_BYTE *)v23 + 24) != 0;
  }
  else
  {
    v13 = 0;
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  return v13;
}

uint64_t __72__CKHorizontalTiledLayoutGenerator__addColumnWithContiguousTiles_count___block_invoke(uint64_t result, double a2, double a3, double a4, double a5, uint64_t a6, _BYTE *a7)
{
  if (a5 < 0.0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
    *a7 = 1;
  }
  return result;
}

void __72__CKHorizontalTiledLayoutGenerator__addColumnWithContiguousTiles_count___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
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

void __72__CKHorizontalTiledLayoutGenerator__addColumnWithContiguousTiles_count___block_invoke_3(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  double v11;
  double MaxX;
  CGRect v13;

  objc_msgSend(*(id *)(a1 + 32), "parsedFrame:type:forTileAtIndex:", 0, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48 * a2));
  v11 = *(double *)(*(_QWORD *)(a1 + 32) + 1312);
  v13.origin.x = a3;
  v13.origin.y = a4;
  v13.size.width = a5;
  v13.size.height = a6;
  MaxX = CGRectGetMaxX(v13);
  if (v11 >= MaxX)
    MaxX = v11;
  *(double *)(*(_QWORD *)(a1 + 32) + 1312) = MaxX;
}

- (void)_enumerateColumnFramesWithContiguousTiles:(id *)a3 count:(int64_t)a4 useMagneticGuidelines:(BOOL)a5 block:(id)a6
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
  int64_t v22;
  double y;
  double x;
  double v25;
  double v26;
  CGFloat *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  char v34;

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
      v16 = v16 + *p_height / *(p_height - 1);
      p_height += 6;
      --v17;
    }
    while (v17);
  }
  -[CKHorizontalTiledLayoutGenerator referenceHeight](self, "referenceHeight");
  v19 = (v18 - (double)(a4 - 1) * v14) / v16;
  -[CKTiledLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, v19);
  if (a4 >= 1)
  {
    v21 = v20;
    v22 = 0;
    x = self->_origin.x;
    y = self->_origin.y;
    v25 = -0.0;
    if (x > 0.0)
      v25 = v12;
    v26 = x + v25;
    v27 = &a3->var1.height;
    v28 = self->_origin.y;
    do
    {
      v29 = y + *v27 / *(v27 - 1) * v19;
      if (v22 >= a4 - 1)
        v30 = 0.0;
      else
        v30 = v14 * 0.5;
      -[CKTiledLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", v6, v30 + v29);
      v32 = v31 - v30;
      -[CKHorizontalTiledLayoutGenerator referenceHeight](self, "referenceHeight");
      if (v32 >= v33)
        v32 = v33;
      v34 = 0;
      v10[2](v10, v22, &v34, v26, v28, v21, v32 - v28);
      if (v34)
        break;
      y = v14 + v29;
      v28 = v14 + v32;
      ++v22;
      v27 += 6;
    }
    while (a4 != v22);
  }

}

- (BOOL)_addColumnWithTiles:(id *)a3 imageFrames:(CGRect *)a4 count:(int64_t)a5
{
  int64_t v5;
  $AA7438D7D1A0E3C1B13DD04217278145 *v7;
  CGFloat *p_height;
  CGFloat *v10;
  int64_t v11;
  CGPoint *p_origin;
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
  double MaxX;
  CGRect v27;

  v5 = a5;
  v7 = a3;
  if (a5 < 2)
  {
LABEL_6:
    p_origin = &self->_origin;
    x = self->_origin.x;
    y = self->_origin.y;
    if (x > 0.0)
    {
      -[CKTiledLayoutGenerator interTileSpacing](self, "interTileSpacing");
      x = x + v15;
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
        v24 = p_origin->x;
        v27.origin.x = v22;
        v27.origin.y = v23;
        v27.size.width = v20;
        v27.size.height = v21;
        MaxX = CGRectGetMaxX(v27);
        if (v24 >= MaxX)
          MaxX = v24;
        p_origin->x = MaxX;
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
  -[CKHorizontalTiledLayoutGenerator referenceHeight](self, "referenceHeight");
  -[CKTiledLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 0, width * ((v12 - v11) / 3.0 / height));
  v14 = v13;
  v15 = v9 + v13 * 2.0;
  -[CKHorizontalTiledLayoutGenerator referenceHeight](self, "referenceHeight");
  v17 = v16;
  v28 = 0u;
  v29 = 0u;
  if ((v5 & 1) != 0)
  {
    -[CKTiledLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 1, v16 / 3.0, v28, v29);
    v20 = v25 + v11 * -0.5;
    v28 = 0uLL;
    *(double *)&v29 = v14;
    *((double *)&v29 + 1) = v20;
    v22 = v9 + v14;
    v14 = v15 - (v9 + v14);
    v23 = v25 + v11 * 0.5;
    v24 = v17 - v23;
    v19 = 0.0;
    v21 = 0.0;
  }
  else
  {
    -[CKTiledLayoutGenerator valueByRounding:usingMagneticGuidelines:](self, "valueByRounding:usingMagneticGuidelines:", 1, (v16 + v16) / 3.0, v28, v29);
    v28 = 0uLL;
    *(double *)&v29 = v9 + v14 * 2.0;
    *((double *)&v29 + 1) = v18 + v11 * -0.5;
    v19 = v18 + v11 * 0.5;
    v20 = v17 - v19;
    v21 = v9 + v14;
    v15 = v15 - (v9 + v14);
    v22 = 0.0;
    v23 = v19;
    v24 = v17 - v19;
  }
  v30 = v22;
  v31 = v19;
  v32 = v14;
  v33 = v20;
  v34 = v21;
  v35 = v23;
  v36 = v15;
  v37 = v24;
  v26 = -[CKHorizontalTiledLayoutGenerator _addColumnWithTiles:imageFrames:count:](self, "_addColumnWithTiles:imageFrames:count:", a3, &v28, 3);
  if (v26)
    -[CKTiledLayoutGenerator setScanSpecialSequenceCount:](self, "setScanSpecialSequenceCount:", v5 + 1, v28, v29);
  return v26;
}

- (double)referenceHeight
{
  return self->_referenceHeight;
}

- (void)setReferenceHeight:(double)a3
{
  self->_referenceHeight = a3;
}

@end
