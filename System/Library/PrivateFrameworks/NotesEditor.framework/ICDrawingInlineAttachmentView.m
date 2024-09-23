@implementation ICDrawingInlineAttachmentView

- (id)icaxHintString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Double tap to edit sketch"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("sketch attachment"), &stru_1EA7E9860, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAttachmentView icaxAttachmentViewTypeDescription](self, "icaxAttachmentViewTypeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __ICAccessibilityStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (ICDrawingInlineAttachmentView)initWithTextAttachment:(id)a3 textContainer:(id)a4 forManualRendering:(BOOL)a5
{
  return -[ICAttachmentView initWithFrame:textAttachment:textContainer:forManualRendering:](self, "initWithFrame:textAttachment:textContainer:forManualRendering:", a3, a4, a5, 0.0, 0.0, 0.0, 0.0);
}

- (void)sharedInit:(BOOL)a3
{
  ICDrawingInlineView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  ICDrawingInlineView *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ICDrawingInlineAttachmentView;
  -[ICAttachmentView sharedInit:](&v13, sel_sharedInit_, a3);
  v4 = [ICDrawingInlineView alloc];
  -[ICDrawingInlineAttachmentView bounds](self, "bounds");
  v9 = -[ICDrawingInlineView initWithFrame:forManualRendering:](v4, "initWithFrame:forManualRendering:", -[ICAttachmentView forManualRendering](self, "forManualRendering"), v5, v6, v7, v8);
  -[ICDrawingInlineAttachmentView setDrawingInlineView:](self, "setDrawingInlineView:", v9);

  -[ICDrawingInlineAttachmentView drawingInlineView](self, "drawingInlineView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEditable:", 1);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDrawingInlineAttachmentView setIc_backgroundColor:](self, "setIc_backgroundColor:", v11);

  -[ICDrawingInlineAttachmentView drawingInlineView](self, "drawingInlineView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDrawingInlineAttachmentView addSubview:](self, "addSubview:", v12);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICDrawingInlineAttachmentView;
  -[ICAttachmentView dealloc](&v4, sel_dealloc);
}

- (CGRect)boundsForDisplay
{
  void *v2;
  double v3;
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
  CGRect result;

  -[ICDrawingInlineAttachmentView drawingInlineView](self, "drawingInlineView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "boundsForDisplay");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setAttachment:(id)a3
{
  id v4;
  void *v5;
  uint64_t *v6;
  uint64_t *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  objc_super v28;

  v4 = a3;
  -[ICDrawingInlineAttachmentView attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (uint64_t *)MEMORY[0x1E0D63660];
  v7 = (uint64_t *)MEMORY[0x1E0D635F8];
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *v6;
    -[ICDrawingInlineAttachmentView attachment](self, "attachment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:name:object:", self, v9, v11);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *v7;
    -[ICDrawingInlineAttachmentView attachment](self, "attachment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObserver:name:object:", self, v13, v15);

  }
  v28.receiver = self;
  v28.super_class = (Class)ICDrawingInlineAttachmentView;
  -[ICDrawingInlineAttachmentView setAttachment:](&v28, sel_setAttachment_, v4);
  -[ICDrawingInlineAttachmentView attachment](self, "attachment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDrawingInlineAttachmentView drawingInlineView](self, "drawingInlineView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAttachment:", v16);

  -[ICDrawingInlineAttachmentView drawingInlineView](self, "drawingInlineView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setThumbnailDisplay:", 0);

  -[ICDrawingInlineAttachmentView attachment](self, "attachment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *v6;
    -[ICDrawingInlineAttachmentView attachment](self, "attachment");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", self, sel_didChangeSize, v21, v23);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *v7;
    -[ICDrawingInlineAttachmentView attachment](self, "attachment");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", self, sel_didChangeSize, v25, v27);

  }
}

- (void)setFrame:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ICDrawingInlineAttachmentView;
  -[ICDrawingInlineAttachmentView setFrame:](&v13, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[ICDrawingInlineAttachmentView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[ICDrawingInlineAttachmentView drawingInlineView](self, "drawingInlineView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)setAttachmentContentSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  objc_super v7;

  height = a3.height;
  width = a3.width;
  v7.receiver = self;
  v7.super_class = (Class)ICDrawingInlineAttachmentView;
  -[ICDrawingInlineAttachmentView setAttachmentContentSize:](&v7, sel_setAttachmentContentSize_);
  -[ICDrawingInlineAttachmentView drawingInlineView](self, "drawingInlineView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttachmentContentSize:", width, height);

}

- (void)didTapAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICDrawingInlineAttachmentView attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attachmentModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isReadyToPresent") & 1) != 0)
  {
    -[ICDrawingInlineAttachmentView drawingInlineView](self, "drawingInlineView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isReadyToPresent");

    if (v8)
    {
      v12.receiver = self;
      v12.super_class = (Class)ICDrawingInlineAttachmentView;
      -[ICAttachmentView didTapAttachment:](&v12, sel_didTapAttachment_, v4);
      goto LABEL_8;
    }
  }
  else
  {

  }
  v9 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    -[ICDrawingInlineAttachmentView attachment](self, "attachment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortLoggingDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v11;
    _os_log_impl(&dword_1DD7B0000, v9, OS_LOG_TYPE_INFO, "Not presenting drawing %@ because it's not ready yet", buf, 0xCu);

  }
LABEL_8:

}

- (void)didScrollIntoVisibleRange
{
  id v2;

  -[ICDrawingInlineAttachmentView drawingInlineView](self, "drawingInlineView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didScrollIntoVisibleRange");

}

- (void)didScrollOutOfVisibleRange
{
  id v2;

  -[ICDrawingInlineAttachmentView drawingInlineView](self, "drawingInlineView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didScrollOutOfVisibleRange");

}

- (BOOL)cancelDidScrollIntoVisibleRange
{
  void *v2;
  char v3;

  -[ICDrawingInlineAttachmentView drawingInlineView](self, "drawingInlineView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cancelDidScrollIntoVisibleRange");

  return v3;
}

- (void)didChangeSize
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[ICDrawingInlineAttachmentView attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDrawingInlineAttachmentView attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_refreshObject:mergeChanges:", v5, 1);

  v6.receiver = self;
  v6.super_class = (Class)ICDrawingInlineAttachmentView;
  -[ICDrawingInlineAttachmentView didChangeSize](&v6, sel_didChangeSize);
}

- (BOOL)shouldAddPanGesture
{
  return 1;
}

- (ICDrawingInlineView)drawingInlineView
{
  return self->_drawingInlineView;
}

- (void)setDrawingInlineView:(id)a3
{
  objc_storeStrong((id *)&self->_drawingInlineView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawingInlineView, 0);
}

@end
