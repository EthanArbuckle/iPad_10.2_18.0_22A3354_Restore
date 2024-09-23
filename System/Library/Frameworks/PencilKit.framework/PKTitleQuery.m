@implementation PKTitleQuery

- (PKTitleQuery)initWithDrawing:(id)a3
{
  id v5;
  PKTitleQuery *v6;
  PKTitleQuery *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CHTitleQuery *titleQuery;
  void *v13;
  objc_super v15;

  v5 = a3;
  objc_msgSend(v5, "recognitionSession");
  v6 = (PKTitleQuery *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v15.receiver = self;
    v15.super_class = (Class)PKTitleQuery;
    v7 = -[PKTitleQuery init](&v15, sel_init);
    objc_storeStrong((id *)&v7->_drawing, a3);
    v8 = objc_alloc(MEMORY[0x1E0D16898]);
    -[PKTitleQuery drawing](v7, "drawing");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recognitionSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "initWithRecognitionSession:", v10);
    titleQuery = v7->_titleQuery;
    v7->_titleQuery = (CHTitleQuery *)v11;

    -[PKTitleQuery titleQuery](v7, "titleQuery");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", v7);

    self = v7;
    v6 = self;
  }

  return v6;
}

- (void)start
{
  id v2;

  -[PKTitleQuery titleQuery](self, "titleQuery");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "start");

}

- (void)pause
{
  id v2;

  -[PKTitleQuery titleQuery](self, "titleQuery");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_delegate, 0);
  -[CHTitleQuery setDelegate:](self->_titleQuery, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PKTitleQuery;
  -[PKTitleQuery dealloc](&v3, sel_dealloc);
}

- (NSString)transcribedTitle
{
  void *v2;
  void *v3;

  -[PKTitleQuery titleQuery](self, "titleQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transcribedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)queryDidUpdateResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void (**v9)(_QWORD);
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  PKTitleQuery *v16;
  id v17;
  id v18;

  v4 = a3;
  objc_msgSend(v4, "transcribedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleStrokeIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTitleQuery delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __37__PKTitleQuery_queryDidUpdateResult___block_invoke;
    v14 = &unk_1E7778588;
    v15 = v6;
    v16 = self;
    v17 = v5;
    v8 = v7;
    v18 = v8;
    v9 = (void (**)(_QWORD))_Block_copy(&v11);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "titleQueryDrawingDispatchQueue:", self, v11, v12, v13, v14, v15, v16, v17);
      v10 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v10, v9);

    }
    else
    {
      v9[2](v9);
    }

  }
}

void __37__PKTitleQuery_queryDidUpdateResult___block_invoke(uint64_t a1)
{
  double x;
  double y;
  double width;
  double height;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  PKTitleQueryItem *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v24 = *MEMORY[0x1E0C80C00];
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
        objc_msgSend(*(id *)(a1 + 40), "drawing", (_QWORD)v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "strokeUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_visibleStrokeForIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "_bounds");
        v27.origin.x = v14;
        v27.origin.y = v15;
        v27.size.width = v16;
        v27.size.height = v17;
        v25.origin.x = x;
        v25.origin.y = y;
        v25.size.width = width;
        v25.size.height = height;
        v26 = CGRectUnion(v25, v27);
        x = v26.origin.x;
        y = v26.origin.y;
        width = v26.size.width;
        height = v26.size.height;

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  v18 = -[PKTitleQueryItem initWithTranscribedTitle:bounds:]([PKTitleQueryItem alloc], "initWithTranscribedTitle:bounds:", *(_QWORD *)(a1 + 48), x, y, width, height);
  objc_msgSend(*(id *)(a1 + 56), "titleQuery:didUpdateWithItem:", *(_QWORD *)(a1 + 40), v18);

}

- (PKTitleQueryDelegate)delegate
{
  return (PKTitleQueryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CHTitleQuery)titleQuery
{
  return self->_titleQuery;
}

- (void)setTitleQuery:(id)a3
{
  objc_storeStrong((id *)&self->_titleQuery, a3);
}

- (PKDrawing)drawing
{
  return self->_drawing;
}

- (void)setDrawing:(id)a3
{
  objc_storeStrong((id *)&self->_drawing, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->_titleQuery, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
