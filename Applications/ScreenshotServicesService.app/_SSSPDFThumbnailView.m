@implementation _SSSPDFThumbnailView

- (void)layoutSubviews
{
  _SSSPDFPageMiniMapView *miniMapView;
  PDFThumbnailView *thumbnailView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SSSPDFThumbnailView;
  -[_SSSPDFThumbnailView layoutSubviews](&v5, "layoutSubviews");
  miniMapView = self->_miniMapView;
  -[_SSSPDFThumbnailView bounds](self, "bounds");
  -[_SSSPDFPageMiniMapView setFrame:](miniMapView, "setFrame:");
  thumbnailView = self->_thumbnailView;
  -[_SSSPDFThumbnailView bounds](self, "bounds");
  -[PDFThumbnailView setFrame:](thumbnailView, "setFrame:");
}

- (void)setPdfView:(id)a3
{
  PDFView **p_pdfView;
  PDFView *v6;

  p_pdfView = &self->_pdfView;
  v6 = (PDFView *)a3;
  if (*p_pdfView != v6 || !-[_SSSPDFThumbnailView isShowingThumbnailOptionView](self, "isShowingThumbnailOptionView"))
  {
    objc_storeStrong((id *)&self->_pdfView, a3);
    -[_SSSPDFPageMiniMapView removeFromSuperview](self->_miniMapView, "removeFromSuperview");
    -[PDFThumbnailView removeFromSuperview](self->_thumbnailView, "removeFromSuperview");
    if (*p_pdfView && -[_SSSPDFThumbnailView shouldShowThumbnailOptionView](self, "shouldShowThumbnailOptionView"))
    {
      if (-[_SSSPDFThumbnailView shouldUseMiniMapView](self, "shouldUseMiniMapView"))
        -[_SSSPDFThumbnailView createMiniMapView](self, "createMiniMapView");
      else
        -[_SSSPDFThumbnailView createThumbnailView](self, "createThumbnailView");
    }
    -[_SSSPDFThumbnailView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setScrollViewVisibleRectInPDFView:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGRect *p_scrollViewVisibleRectInPDFView;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_scrollViewVisibleRectInPDFView = &self->_scrollViewVisibleRectInPDFView;
  if (!CGRectEqualToRect(self->_scrollViewVisibleRectInPDFView, a3))
  {
    p_scrollViewVisibleRectInPDFView->origin.x = x;
    p_scrollViewVisibleRectInPDFView->origin.y = y;
    p_scrollViewVisibleRectInPDFView->size.width = width;
    p_scrollViewVisibleRectInPDFView->size.height = height;
    -[_SSSPDFPageMiniMapView setScrollViewVisibleRectInPDFView:](self->_miniMapView, "setScrollViewVisibleRectInPDFView:", x, y, width, height);
    -[_SSSPDFThumbnailView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShouldUpdate:(BOOL)a3
{
  -[_SSSPDFPageMiniMapView setShouldUpdate:](self->_miniMapView, "setShouldUpdate:", a3);
}

- (BOOL)shouldUpdate
{
  return -[_SSSPDFPageMiniMapView shouldUpdate](self->_miniMapView, "shouldUpdate");
}

- (BOOL)isShowingThumbnailOptionView
{
  return self->_thumbnailView || self->_miniMapView != 0;
}

- (BOOL)shouldShowThumbnailOptionView
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDFView document](self->_pdfView, "document"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)shouldUseMiniMapView
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDFView document](self->_pdfView, "document"));
  v3 = objc_msgSend(v2, "pageCount") == (id)1;

  return v3;
}

- (void)createThumbnailView
{
  PDFThumbnailView *v3;
  PDFThumbnailView *thumbnailView;
  PDFThumbnailView *v5;
  PDFThumbnailView *v6;
  void *v7;

  v3 = (PDFThumbnailView *)objc_alloc_init((Class)PDFThumbnailView);
  thumbnailView = self->_thumbnailView;
  self->_thumbnailView = v3;

  -[PDFThumbnailView setPDFView:](self->_thumbnailView, "setPDFView:", self->_pdfView);
  -[PDFThumbnailView setThumbnailSize:](self->_thumbnailView, "setThumbnailSize:", 45.0, 45.0);
  -[PDFThumbnailView setLayoutMode:](self->_thumbnailView, "setLayoutMode:", 0);
  v5 = self->_thumbnailView;
  -[_SSSPDFThumbnailView bounds](self, "bounds");
  -[PDFThumbnailView setFrame:](v5, "setFrame:");
  v6 = self->_thumbnailView;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[PDFThumbnailView setBackgroundColor:](v6, "setBackgroundColor:", v7);

  -[_SSSPDFThumbnailView addSubview:](self, "addSubview:", self->_thumbnailView);
}

- (void)createMiniMapView
{
  _SSSPDFPageMiniMapView *v3;
  _SSSPDFPageMiniMapView *miniMapView;

  v3 = objc_alloc_init(_SSSPDFPageMiniMapView);
  miniMapView = self->_miniMapView;
  self->_miniMapView = v3;

  -[_SSSPDFPageMiniMapView setPdfView:](self->_miniMapView, "setPdfView:", self->_pdfView);
  -[_SSSPDFPageMiniMapView setPageIndex:](self->_miniMapView, "setPageIndex:", 0);
  -[_SSSPDFPageMiniMapView setScrollViewVisibleRectInPDFView:](self->_miniMapView, "setScrollViewVisibleRectInPDFView:", self->_scrollViewVisibleRectInPDFView.origin.x, self->_scrollViewVisibleRectInPDFView.origin.y, self->_scrollViewVisibleRectInPDFView.size.width, self->_scrollViewVisibleRectInPDFView.size.height);
  -[_SSSPDFThumbnailView addSubview:](self, "addSubview:", self->_miniMapView);
}

- (PDFView)pdfView
{
  return self->_pdfView;
}

- (CGRect)scrollViewVisibleRectInPDFView
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_scrollViewVisibleRectInPDFView.origin.x;
  y = self->_scrollViewVisibleRectInPDFView.origin.y;
  width = self->_scrollViewVisibleRectInPDFView.size.width;
  height = self->_scrollViewVisibleRectInPDFView.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (_SSSPDFPageMiniMapView)miniMapView
{
  return self->_miniMapView;
}

- (void)setMiniMapView:(id)a3
{
  objc_storeStrong((id *)&self->_miniMapView, a3);
}

- (PDFThumbnailView)thumbnailView
{
  return self->_thumbnailView;
}

- (void)setThumbnailView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailView, 0);
  objc_storeStrong((id *)&self->_miniMapView, 0);
  objc_storeStrong((id *)&self->_pdfView, 0);
}

@end
