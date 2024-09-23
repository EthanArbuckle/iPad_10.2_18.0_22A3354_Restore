@implementation CKTranscriptHeaderCell

- (CKTranscriptHeaderCell)initWithFrame:(CGRect)a3
{
  CKTranscriptHeaderCell *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  UIActivityIndicatorView *loadingIndicator;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKTranscriptHeaderCell;
  v3 = -[CKTranscriptCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "showsLoadMoreItem");

    if (v5)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "transcriptLoadingIndicatorStyle");

      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", v7);
      loadingIndicator = v3->_loadingIndicator;
      v3->_loadingIndicator = (UIActivityIndicatorView *)v8;

      -[UIActivityIndicatorView sizeToFit](v3->_loadingIndicator, "sizeToFit");
      -[UIActivityIndicatorView startAnimating](v3->_loadingIndicator, "startAnimating");
      -[CKEditableCollectionViewCell contentView](v3, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", v3->_loadingIndicator);

    }
  }
  return v3;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKTranscriptHeaderCell;
  -[CKTranscriptCell prepareForReuse](&v3, sel_prepareForReuse);
  -[CKTranscriptHeaderCell _stopLoadingIndicatorAnimatingIfNeeded](self, "_stopLoadingIndicatorAnimatingIfNeeded");
}

- (void)dealloc
{
  objc_super v3;

  -[CKTranscriptHeaderCell _stopLoadingIndicatorAnimatingIfNeeded](self, "_stopLoadingIndicatorAnimatingIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)CKTranscriptHeaderCell;
  -[CKTranscriptHeaderCell dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviewsForAlignmentContents
{
  void *v3;
  int v4;
  void *v5;
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
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CKTranscriptHeaderCell;
  -[CKEditableCollectionViewCell layoutSubviewsForAlignmentContents](&v19, sel_layoutSubviewsForAlignmentContents);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showsLoadMoreItem");

  if (v4)
  {
    -[CKTranscriptHeaderCell loadingIndicator](self, "loadingIndicator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;
    -[CKEditableCollectionViewCell contentAlignmentRect](self, "contentAlignmentRect");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    if (CKMainScreenScale_once_19 != -1)
      dispatch_once(&CKMainScreenScale_once_19, &__block_literal_global_47);
    v18 = *(double *)&CKMainScreenScale_sMainScreenScale_19;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_19 == 0.0)
      v18 = 1.0;
    objc_msgSend(v5, "setFrame:", 1.0 / v18 * (v11 * v18 + floor((v15 * v18 - v7 * v18) * 0.5)), 1.0 / v18 * (v13 * v18 + floor((v17 * v18 - v9 * v18) * 0.5)), v7 * v18 * (1.0 / v18), v9 * v18 * (1.0 / v18));

  }
}

+ (double)defaultCellHeight
{
  void *v2;
  int v3;
  double result;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsLoadMoreItem");

  result = 0.0;
  if (v3)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "theme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "transcriptLoadingIndicatorStyle");

    objc_msgSend(MEMORY[0x1E0CEA2C8], "defaultSizeForStyle:", v7);
    return v8;
  }
  return result;
}

- (void)startAnimatingActivityIndicator
{
  if (!-[UIActivityIndicatorView isAnimating](self->_loadingIndicator, "isAnimating"))
    -[UIActivityIndicatorView startAnimating](self->_loadingIndicator, "startAnimating");
}

- (void)_stopLoadingIndicatorAnimatingIfNeeded
{
  void *v3;
  int v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showsLoadMoreItem");

  if (v4)
  {
    if (-[UIActivityIndicatorView isAnimating](self->_loadingIndicator, "isAnimating"))
      -[UIActivityIndicatorView stopAnimating](self->_loadingIndicator, "stopAnimating");
  }
}

- (UIActivityIndicatorView)loadingIndicator
{
  return self->_loadingIndicator;
}

- (void)setLoadingIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_loadingIndicator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
}

@end
