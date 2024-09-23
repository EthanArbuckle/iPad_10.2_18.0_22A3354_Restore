@implementation CKWorkoutBalloonView

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6
{
  uint64_t v6;
  void *v9;
  id v10;

  v6 = a5;
  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "linkMetadataForWidth:orientation:", v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKWorkoutBalloonView setMetadata:](self, "setMetadata:", v9);

  }
}

- (void)setMetadata:(id)a3
{
  LPLinkMetadata *v5;
  LPLinkMetadata *v6;

  v5 = (LPLinkMetadata *)a3;
  if (self->_metadata != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_metadata, a3);
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
    v5 = v6;
  }

}

- (void)prepareForReuse
{
  LPLinkMetadata *metadata;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKWorkoutBalloonView;
  -[CKLinkBalloonView prepareForReuse](&v4, sel_prepareForReuse);
  metadata = self->_metadata;
  self->_metadata = 0;

}

- (void)prepareForDisplay
{
  void *v3;
  void *v4;
  objc_super v5;

  -[CKLinkBalloonView linkView](self, "linkView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKLinkBalloonView linkView](self, "linkView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMetadata:", self->_metadata);
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC11C8]), "initWithMetadata:", self->_metadata);
    -[CKLinkBalloonView setLinkView:](self, "setLinkView:", v4);
  }

  v5.receiver = self;
  v5.super_class = (Class)CKWorkoutBalloonView;
  -[CKLinkBalloonView prepareForDisplay](&v5, sel_prepareForDisplay);
}

- (void)tapGestureRecognized:(id)a3
{
  id v4;
  LPLinkMetadata *metadata;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  NSObject *v12;
  id v13;

  v4 = a3;
  metadata = self->_metadata;
  if (metadata
    && (-[LPLinkMetadata originalURL](metadata, "originalURL"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    v7 = (void *)MEMORY[0x1E0C99D50];
    -[LPLinkMetadata originalURL](self->_metadata, "originalURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v7, "dataWithContentsOfURL:options:error:", v8, 0, &v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13;

    if (v9)
      v11 = v10 == 0;
    else
      v11 = 0;
    if (v11)
    {
      -[CKBalloonView delegate](self, "delegate");
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject didTapWorkoutBalloonView:workoutData:](v12, "didTapWorkoutBalloonView:workoutData:", self, v9);
    }
    else
    {
      IMLogHandleForCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CKWorkoutBalloonView tapGestureRecognized:].cold.2((uint64_t)v10, v12);
    }

  }
  else
  {
    IMLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CKWorkoutBalloonView tapGestureRecognized:].cold.1(v10);
  }

}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (void)tapGestureRecognized:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "Link metadata URL is nil", v1, 2u);
}

- (void)tapGestureRecognized:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_ERROR, "Unable to read contents of file with error: %@", (uint8_t *)&v2, 0xCu);
}

@end
