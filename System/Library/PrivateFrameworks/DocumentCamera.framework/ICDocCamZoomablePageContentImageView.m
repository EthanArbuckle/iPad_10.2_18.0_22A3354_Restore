@implementation ICDocCamZoomablePageContentImageView

- (BOOL)_accessibilityRespondsToUserInteraction
{
  return 1;
}

- (id)_accessibilityScrollAncestorForSelector:(SEL)a3
{
  BOOL v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = sel_accessibilityScrollRightPage == a3 || sel_accessibilityScrollLeftPage == a3;
  if (v3
    && (-[ICDocCamZoomablePageContentImageView nextResponder](self, "nextResponder"),
        (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v5, "nextResponder");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
      if (!v6)
        goto LABEL_10;
    }
  }
  else
  {
LABEL_10:
    v7 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ICDocCamZoomablePageContentImageView _accessibilityScrollAncestorForSelector:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

    v5 = 0;
  }
  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "type");

  if (v9 == 2)
  {
    -[ICDocCamZoomablePageContentImageView pageContentViewDelegate](self, "pageContentViewDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[ICDocCamZoomablePageContentImageView pageContentViewDelegate](self, "pageContentViewDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pageContentViewDidPencilDown");

    }
  }
  v12.receiver = self;
  v12.super_class = (Class)ICDocCamZoomablePageContentImageView;
  -[ICDocCamZoomablePageContentImageView touchesBegan:withEvent:](&v12, sel_touchesBegan_withEvent_, v6, v7);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  int v9;
  ICDocCamZoomablePageContentImageView *v10;
  ICDocCamZoomablePageContentImageView *v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[ICDocCamZoomablePageContentImageView pageContentViewDelegate](self, "pageContentViewDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isTouchingAnalyzableContentAtPoint:withEvent:", v7, x, y);

  if (v9)
  {
    v13.receiver = self;
    v13.super_class = (Class)ICDocCamZoomablePageContentImageView;
    -[ICDocCamZoomablePageContentImageView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
    v10 = (ICDocCamZoomablePageContentImageView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = self;
  }
  v11 = v10;

  return v11;
}

- (ICDocCamZoomablePageContentViewDelegate)pageContentViewDelegate
{
  return (ICDocCamZoomablePageContentViewDelegate *)objc_loadWeakRetained((id *)&self->_pageContentViewDelegate);
}

- (void)setPageContentViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pageContentViewDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pageContentViewDelegate);
}

- (void)_accessibilityScrollAncestorForSelector:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CE8E000, a1, a3, "invalid nil value for '%s'", a5, a6, a7, a8, 2u);
}

@end
