@implementation ICASPdfNavIxData

- (ICASPdfNavIxData)initWithHasGestures:(id)a3 hasScroll:(id)a4 hasPagination:(id)a5 hasPinchZoom:(id)a6 hasPinchToExpandState:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ICASPdfNavIxData *v17;
  ICASPdfNavIxData *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ICASPdfNavIxData;
  v17 = -[ICASPdfNavIxData init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_hasGestures, a3);
    objc_storeStrong((id *)&v18->_hasScroll, a4);
    objc_storeStrong((id *)&v18->_hasPagination, a5);
    objc_storeStrong((id *)&v18->_hasPinchZoom, a6);
    objc_storeStrong((id *)&v18->_hasPinchToExpandState, a7);
  }

  return v18;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("PdfNavIxData");
}

- (id)toDict
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("hasGestures");
  -[ICASPdfNavIxData hasGestures](self, "hasGestures");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[ICASPdfNavIxData hasGestures](self, "hasGestures", v19);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_opt_new();
  }
  v4 = (void *)v3;
  v22[0] = v3;
  v21[1] = CFSTR("hasScroll");
  -[ICASPdfNavIxData hasScroll](self, "hasScroll", v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[ICASPdfNavIxData hasScroll](self, "hasScroll");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_opt_new();
  }
  v7 = (void *)v6;
  v22[1] = v6;
  v21[2] = CFSTR("hasPagination");
  -[ICASPdfNavIxData hasPagination](self, "hasPagination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[ICASPdfNavIxData hasPagination](self, "hasPagination");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_opt_new();
  }
  v10 = (void *)v9;
  v22[2] = v9;
  v21[3] = CFSTR("hasPinchZoom");
  -[ICASPdfNavIxData hasPinchZoom](self, "hasPinchZoom");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[ICASPdfNavIxData hasPinchZoom](self, "hasPinchZoom");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = objc_opt_new();
  }
  v13 = (void *)v12;
  v22[3] = v12;
  v21[4] = CFSTR("hasPinchToExpandState");
  -[ICASPdfNavIxData hasPinchToExpandState](self, "hasPinchToExpandState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[ICASPdfNavIxData hasPinchToExpandState](self, "hasPinchToExpandState");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = objc_opt_new();
  }
  v16 = (void *)v15;
  v22[4] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSNumber)hasGestures
{
  return self->_hasGestures;
}

- (NSNumber)hasScroll
{
  return self->_hasScroll;
}

- (NSNumber)hasPagination
{
  return self->_hasPagination;
}

- (NSNumber)hasPinchZoom
{
  return self->_hasPinchZoom;
}

- (NSNumber)hasPinchToExpandState
{
  return self->_hasPinchToExpandState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasPinchToExpandState, 0);
  objc_storeStrong((id *)&self->_hasPinchZoom, 0);
  objc_storeStrong((id *)&self->_hasPagination, 0);
  objc_storeStrong((id *)&self->_hasScroll, 0);
  objc_storeStrong((id *)&self->_hasGestures, 0);
}

@end
