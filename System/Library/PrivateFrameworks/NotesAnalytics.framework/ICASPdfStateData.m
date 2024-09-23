@implementation ICASPdfStateData

- (ICASPdfStateData)initWithPdfStartState:(id)a3 pdfEndState:(id)a4 hasSmallStateUsage:(id)a5 hasMediumStateUsage:(id)a6 hasLargeStateUsage:(id)a7 hasFullScreenStateUsage:(id)a8
{
  id v15;
  id v16;
  id v17;
  ICASPdfStateData *v18;
  ICASPdfStateData *v19;
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
  v24.super_class = (Class)ICASPdfStateData;
  v18 = -[ICASPdfStateData init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_pdfStartState, a3);
    objc_storeStrong((id *)&v19->_pdfEndState, a4);
    objc_storeStrong((id *)&v19->_hasSmallStateUsage, a5);
    objc_storeStrong((id *)&v19->_hasMediumStateUsage, a6);
    objc_storeStrong((id *)&v19->_hasLargeStateUsage, a7);
    objc_storeStrong((id *)&v19->_hasFullScreenStateUsage, a8);
  }

  return v19;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("PdfStateData");
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
  v24[0] = CFSTR("pdfStartState");
  -[ICASPdfStateData pdfStartState](self, "pdfStartState");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[ICASPdfStateData pdfStartState](self, "pdfStartState");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_opt_new();
  }
  v22 = (void *)v3;
  v25[0] = v3;
  v24[1] = CFSTR("pdfEndState");
  -[ICASPdfStateData pdfEndState](self, "pdfEndState");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[ICASPdfStateData pdfEndState](self, "pdfEndState", v20);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v25[1] = v4;
  v24[2] = CFSTR("hasSmallStateUsage");
  -[ICASPdfStateData hasSmallStateUsage](self, "hasSmallStateUsage", v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ICASPdfStateData hasSmallStateUsage](self, "hasSmallStateUsage");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v25[2] = v7;
  v24[3] = CFSTR("hasMediumStateUsage");
  -[ICASPdfStateData hasMediumStateUsage](self, "hasMediumStateUsage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[ICASPdfStateData hasMediumStateUsage](self, "hasMediumStateUsage");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_opt_new();
  }
  v11 = (void *)v10;
  v25[3] = v10;
  v24[4] = CFSTR("hasLargeStateUsage");
  -[ICASPdfStateData hasLargeStateUsage](self, "hasLargeStateUsage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[ICASPdfStateData hasLargeStateUsage](self, "hasLargeStateUsage");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_opt_new();
  }
  v14 = (void *)v13;
  v25[4] = v13;
  v24[5] = CFSTR("hasFullScreenStateUsage");
  -[ICASPdfStateData hasFullScreenStateUsage](self, "hasFullScreenStateUsage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[ICASPdfStateData hasFullScreenStateUsage](self, "hasFullScreenStateUsage");
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

- (ICASPdfState)pdfStartState
{
  return self->_pdfStartState;
}

- (ICASPdfState)pdfEndState
{
  return self->_pdfEndState;
}

- (NSNumber)hasSmallStateUsage
{
  return self->_hasSmallStateUsage;
}

- (NSNumber)hasMediumStateUsage
{
  return self->_hasMediumStateUsage;
}

- (NSNumber)hasLargeStateUsage
{
  return self->_hasLargeStateUsage;
}

- (NSNumber)hasFullScreenStateUsage
{
  return self->_hasFullScreenStateUsage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasFullScreenStateUsage, 0);
  objc_storeStrong((id *)&self->_hasLargeStateUsage, 0);
  objc_storeStrong((id *)&self->_hasMediumStateUsage, 0);
  objc_storeStrong((id *)&self->_hasSmallStateUsage, 0);
  objc_storeStrong((id *)&self->_pdfEndState, 0);
  objc_storeStrong((id *)&self->_pdfStartState, 0);
}

@end
