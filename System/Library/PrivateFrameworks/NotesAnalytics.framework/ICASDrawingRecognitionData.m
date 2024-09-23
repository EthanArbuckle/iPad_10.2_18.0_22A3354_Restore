@implementation ICASDrawingRecognitionData

- (ICASDrawingRecognitionData)initWithCountOfPencilStrokes:(id)a3 countOfFingerStrokes:(id)a4 countOfRecognizedHandwrittenCharacters:(id)a5 countOfRecognizedLines:(id)a6 handwritingLanguage:(id)a7 drawingID:(id)a8
{
  id v15;
  id v16;
  id v17;
  ICASDrawingRecognitionData *v18;
  ICASDrawingRecognitionData *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)ICASDrawingRecognitionData;
  v18 = -[ICASDrawingRecognitionData init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_countOfPencilStrokes, a3);
    objc_storeStrong((id *)&v19->_countOfFingerStrokes, a4);
    objc_storeStrong((id *)&v19->_countOfRecognizedHandwrittenCharacters, a5);
    objc_storeStrong((id *)&v19->_countOfRecognizedLines, a6);
    objc_storeStrong((id *)&v19->_handwritingLanguage, a7);
    objc_storeStrong((id *)&v19->_drawingID, a8);
  }

  return v19;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("DrawingRecognitionData");
}

- (id)toDict
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[6];
  _QWORD v25[7];

  v25[6] = *MEMORY[0x1E0C80C00];
  v24[0] = CFSTR("countOfPencilStrokes");
  -[ICASDrawingRecognitionData countOfPencilStrokes](self, "countOfPencilStrokes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[ICASDrawingRecognitionData countOfPencilStrokes](self, "countOfPencilStrokes");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_opt_new();
  }
  v22 = (void *)v3;
  v25[0] = v3;
  v24[1] = CFSTR("countOfFingerStrokes");
  -[ICASDrawingRecognitionData countOfFingerStrokes](self, "countOfFingerStrokes");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[ICASDrawingRecognitionData countOfFingerStrokes](self, "countOfFingerStrokes", v20);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v25[1] = v4;
  v24[2] = CFSTR("countOfRecognizedHandwrittenCharacters");
  -[ICASDrawingRecognitionData countOfRecognizedHandwrittenCharacters](self, "countOfRecognizedHandwrittenCharacters", v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ICASDrawingRecognitionData countOfRecognizedHandwrittenCharacters](self, "countOfRecognizedHandwrittenCharacters");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v25[2] = v7;
  v24[3] = CFSTR("countOfRecognizedLines");
  -[ICASDrawingRecognitionData countOfRecognizedLines](self, "countOfRecognizedLines");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[ICASDrawingRecognitionData countOfRecognizedLines](self, "countOfRecognizedLines");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_opt_new();
  }
  v11 = (void *)v10;
  v25[3] = v10;
  v24[4] = CFSTR("handwritingLanguage");
  -[ICASDrawingRecognitionData handwritingLanguage](self, "handwritingLanguage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[ICASDrawingRecognitionData handwritingLanguage](self, "handwritingLanguage");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_opt_new();
  }
  v14 = (void *)v13;
  v25[4] = v13;
  v24[5] = CFSTR("drawingID");
  -[ICASDrawingRecognitionData drawingID](self, "drawingID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[ICASDrawingRecognitionData drawingID](self, "drawingID");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = objc_opt_new();
  }
  v17 = (void *)v16;
  v25[5] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSNumber)countOfPencilStrokes
{
  return self->_countOfPencilStrokes;
}

- (NSNumber)countOfFingerStrokes
{
  return self->_countOfFingerStrokes;
}

- (NSNumber)countOfRecognizedHandwrittenCharacters
{
  return self->_countOfRecognizedHandwrittenCharacters;
}

- (NSNumber)countOfRecognizedLines
{
  return self->_countOfRecognizedLines;
}

- (NSString)handwritingLanguage
{
  return self->_handwritingLanguage;
}

- (NSString)drawingID
{
  return self->_drawingID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawingID, 0);
  objc_storeStrong((id *)&self->_handwritingLanguage, 0);
  objc_storeStrong((id *)&self->_countOfRecognizedLines, 0);
  objc_storeStrong((id *)&self->_countOfRecognizedHandwrittenCharacters, 0);
  objc_storeStrong((id *)&self->_countOfFingerStrokes, 0);
  objc_storeStrong((id *)&self->_countOfPencilStrokes, 0);
}

@end
