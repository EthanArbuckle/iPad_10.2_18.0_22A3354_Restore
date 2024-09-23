@implementation PKTextAttachmentDrawingViewProvider

+ (Class)tiledViewClassForDrawingClass:(Class)a3
{
  void *v5;

  v5 = (void *)objc_opt_class();
  if (+[PKDrawing drawingClassForPaper](PKDrawing, "drawingClassForPaper") == a3
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = (void *)objc_msgSend(a1, "tiledViewClassForPaper");
  }
  if ((Class)objc_opt_class() == a3 && (objc_opt_respondsToSelector() & 1) != 0)
    v5 = (void *)objc_msgSend(a1, "inlineDrawingTiledViewClassForPaper");
  return (Class)v5;
}

+ (void)registerViewProviderClassIfNecessary
{
  if ((registerViewProviderClassIfNecessary_didRegister & 1) == 0
    && +[PKMetalUtility isMetalAvailable](PKMetalUtility, "isMetalAvailable"))
  {
    objc_msgSend(MEMORY[0x1E0DC12B0], "registerTextAttachmentViewProviderClass:forFileType:", objc_opt_class(), CFSTR("com.apple.drawing"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(MEMORY[0x1E0DC12B0], "registerTextAttachmentViewProviderClass:forFileType:", objc_opt_class(), CFSTR("com.apple.paper"));
    registerViewProviderClassIfNecessary_didRegister = 1;
  }
}

- (id)location
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[PKTextAttachmentDrawingViewProvider updatedLocationForRecycledViewProvider](self, "updatedLocationForRecycledViewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PKTextAttachmentDrawingViewProvider;
    -[NSTextAttachmentViewProvider location](&v8, sel_location);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)loadView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  -[NSTextAttachmentViewProvider textAttachment](self, "textAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pkInserting");

  -[NSTextAttachmentViewProvider textAttachment](self, "textAttachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPkInserting:", 0);

  -[NSTextAttachmentViewProvider textAttachment](self, "textAttachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[PKTextAttachmentDrawingViewProvider drawingClassForFileType:](PKTextAttachmentDrawingViewProvider, "drawingClassForFileType:", v7);

  v9 = objc_alloc(+[PKTextAttachmentDrawingViewProvider drawingViewClassForDrawingClass:](PKTextAttachmentDrawingViewProvider, "drawingViewClassForDrawingClass:", v8));
  -[NSTextAttachmentViewProvider textAttachment](self, "textAttachment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithAttachment:drawingClass:inserted:", v10, v8, v4);
  -[NSTextAttachmentViewProvider setView:](self, "setView:", v11);

  -[NSTextAttachmentViewProvider view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[NSTextAttachmentViewProvider textAttachment](self, "textAttachment");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setBounds:", v14, v16, v18, v20);

  -[NSTextAttachmentViewProvider textAttachment](self, "textAttachment");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setEmbeddingType:", 1);

  -[NSTextAttachmentViewProvider textAttachment](self, "textAttachment");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setStandaloneAlignment:", 1);

  -[NSTextAttachmentViewProvider textAttachment](self, "textAttachment");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setLineLayoutPadding:", 0.0);

}

+ (Class)drawingClassForFileType:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.paper")))
    return +[PKDrawing drawingClassForPaper](PKDrawing, "drawingClassForPaper");
  else
    return (Class)(id)objc_opt_class();
}

+ (Class)drawingViewClassForDrawingClass:(Class)a3
{
  void *v5;
  uint64_t v6;

  v5 = (void *)objc_opt_class();
  if (+[PKDrawing drawingClassForPaper](PKDrawing, "drawingClassForPaper") == a3
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(a1, "drawingViewClassForPaper");
LABEL_7:
    v5 = (void *)v6;
    return (Class)v5;
  }
  if ((Class)objc_opt_class() == a3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(a1, "inlineDrawingViewClassForPaper");
    goto LABEL_7;
  }
  return (Class)v5;
}

- (NSTextLocation)updatedLocationForRecycledViewProvider
{
  return self->_updatedLocationForRecycledViewProvider;
}

- (void)setUpdatedLocationForRecycledViewProvider:(id)a3
{
  objc_storeStrong((id *)&self->_updatedLocationForRecycledViewProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedLocationForRecycledViewProvider, 0);
}

@end
