@implementation VNRecognizedTextBlockObservation

- (VNRecognizedTextBlockObservation)initWithRequestRevision:(unint64_t)a3 crOutputRegion:(id)a4
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  VNRecognizedTextBlockObservation *v26;
  void *v27;
  CROutputRegion *crOutputRegion;
  void *v29;
  VNRecognizedTextBlockObservation *v30;
  objc_super v32;

  v7 = a4;
  objc_msgSend(v7, "boundingQuad");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topLeft");
  v10 = v9;
  v12 = 1.0 - v11;
  objc_msgSend(v7, "boundingQuad");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topRight");
  v15 = v14;
  v17 = 1.0 - v16;
  objc_msgSend(v7, "boundingQuad");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomRight");
  v20 = v19;
  v22 = 1.0 - v21;
  objc_msgSend(v7, "boundingQuad");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bottomLeft");
  v32.receiver = self;
  v32.super_class = (Class)VNRecognizedTextBlockObservation;
  v26 = -[VNRectangleObservation initWithRequestRevision:topLeft:topRight:bottomRight:bottomLeft:](&v32, sel_initWithRequestRevision_topLeft_topRight_bottomRight_bottomLeft_, a3, v10, v12, v15, v17, v20, v22, v25, 1.0 - v24);

  if (v26)
  {
    objc_storeStrong((id *)&v26->_crOutputRegion, a4);
    -[CROutputRegion rawConfidence](v26->_crOutputRegion, "rawConfidence");
    -[VNObservation setConfidence:](v26, "setConfidence:");
    -[CROutputRegion trackingID](v26->_crOutputRegion, "trackingID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    crOutputRegion = v26->_crOutputRegion;
    if (v27)
      -[CROutputRegion trackingID](crOutputRegion, "trackingID");
    else
      -[CROutputRegion uuid](crOutputRegion, "uuid");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNObservation setUUID:](v26, "setUUID:", v29);

    v30 = v26;
  }

  return v26;
}

- (NSArray)getChildren
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  VNRecognizedTextBlock *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[CROutputRegion children](self->_crOutputRegion, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = -[VNRecognizedTextBlock initWithRequestRevision:crOutputRegion:]([VNRecognizedTextBlock alloc], "initWithRequestRevision:crOutputRegion:", -[VNObservation requestRevision](self, "requestRevision"), *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)topCandidates:(unint64_t)a3
{
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  VNRecognizedTextBlock *v16;
  VNRecognizedTextBlock *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[CROutputRegion candidates](self->_crOutputRegion, "candidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v24[0] = self->_crOutputRegion;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = objc_msgSend(v6, "count");
  if (v7 >= a3)
    v8 = a3;
  else
    v8 = v7;
  objc_msgSend(v6, "subarrayWithRange:", 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14);
        v16 = [VNRecognizedTextBlock alloc];
        v17 = -[VNRecognizedTextBlock initWithRequestRevision:crOutputRegion:](v16, "initWithRequestRevision:crOutputRegion:", -[VNObservation requestRevision](self, "requestRevision", (_QWORD)v19), v15);
        if (v17)
          objc_msgSend(v5, "addObject:", v17);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  return v5;
}

- (id)boundingBoxForRange:(_NSRange)a3 error:(id *)a4
{
  void *v5;
  void *v6;
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
  VNRectangleObservation *v21;

  -[CROutputRegion quadForTextInCharacterRange:](self->_crOutputRegion, "quadForTextInCharacterRange:", a3.location, a3.length, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "topLeft");
    v8 = v7;
    v10 = 1.0 - v9;
    objc_msgSend(v6, "topRight");
    v12 = v11;
    v14 = 1.0 - v13;
    objc_msgSend(v6, "bottomLeft");
    v16 = v15;
    v18 = 1.0 - v17;
    objc_msgSend(v6, "bottomRight");
    v21 = -[VNRectangleObservation initWithRequestRevision:topLeft:topRight:bottomRight:bottomLeft:]([VNRectangleObservation alloc], "initWithRequestRevision:topLeft:topRight:bottomRight:bottomLeft:", -[VNObservation requestRevision](self, "requestRevision"), v8, v10, v12, v14, v20, 1.0 - v19, v16, v18);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (NSString)getTranscript
{
  void *v2;
  void *v3;
  void *v4;

  -[VNRecognizedTextBlockObservation topCandidates:](self, "topCandidates:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSArray)getLines
{
  void *v3;
  void *v4;
  id v5;
  NSArray *v6;
  _QWORD v8[4];
  id v9;
  VNRecognizedTextBlockObservation *v10;

  -[CROutputRegion contentsWithTypes:](self->_crOutputRegion, "contentsWithTypes:", 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__VNRecognizedTextBlockObservation_getLines__block_invoke;
  v8[3] = &unk_1E4547F30;
  v5 = v4;
  v9 = v5;
  v10 = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);
  v6 = (NSArray *)v5;

  return v6;
}

- (id)getCROutputRegion
{
  return self->_crOutputRegion;
}

- (BOOL)shouldBeWrappedWithNextLine
{
  void *v2;
  char v3;

  -[VNRecognizedTextBlockObservation getCROutputRegion](self, "getCROutputRegion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "type") == 8)
    v3 = objc_msgSend(v2, "shouldWrapToNextLine");
  else
    v3 = 0;

  return v3;
}

- (NSArray)getRecognizedLanguages
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[VNRecognizedTextBlockObservation getCROutputRegion](self, "getCROutputRegion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recognizedLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "recognizedLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v6;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNRecognizedTextBlockObservation;
  -[VNRecognizedTextBlockObservation debugDescription](&v7, sel_debugDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNRecognizedTextBlockObservation getTranscript](self, "getTranscript");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" transcript=\"%@\"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getDataDetectorResults:(id *)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  VNDataDetectorResult *v10;
  void *v11;
  VNDataDetectorResult *v12;
  uint64_t v13;
  uint64_t v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  -[CROutputRegion contentsWithTypes:](self->_crOutputRegion, "contentsWithTypes:", 2048);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v16, "count"));
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = v16;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          v10 = [VNDataDetectorResult alloc];
          objc_msgSend(v9, "ddResult");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[VNDataDetectorResult initWithDDScannerResult:observation:](v10, "initWithDDScannerResult:observation:", v11, self);

          v13 = objc_msgSend(v9, "dataType");
          if ((unint64_t)(v13 - 1) >= 9)
            v14 = 0;
          else
            v14 = v13;
          -[VNDataDetectorResult setType:](v12, "setType:", v14);
          objc_msgSend(v4, "addObject:", v12);

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v6);
    }

  }
  else
  {
    v4 = 0;
  }

  kdebug_trace();
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crOutputRegion, 0);
}

void __44__VNRecognizedTextBlockObservation_getLines__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  VNRecognizedTextBlockObservation *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = -[VNRecognizedTextBlockObservation initWithRequestRevision:crOutputRegion:]([VNRecognizedTextBlockObservation alloc], "initWithRequestRevision:crOutputRegion:", objc_msgSend(*(id *)(a1 + 40), "requestRevision"), v4);

  objc_msgSend(v3, "addObject:", v5);
}

@end
