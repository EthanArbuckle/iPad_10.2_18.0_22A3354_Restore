@implementation CSPageControl

- (CSPageControl)initWithFrame:(CGRect)a3
{
  CSPageControl *v3;
  CSPageControl *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSPageControl;
  v3 = -[CSPageControl initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_cameraPageIndex = 0x7FFFFFFFFFFFFFFFLL;
    -[CSPageControl setBackgroundStyle:](v3, "setBackgroundStyle:", 2);
    -[CSPageControl _updateForLegibility](v4, "_updateForLegibility");
    -[CSPageControl _setCustomIndicatorSpacing:](v4, "_setCustomIndicatorSpacing:", 5.5);
  }
  return v4;
}

- (CGSize)sizeForNumberOfPages:(int64_t)a3
{
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v5.receiver = self;
  v5.super_class = (Class)CSPageControl;
  -[CSPageControl sizeForNumberOfPages:](&v5, sel_sizeForNumberOfPages_, a3);
  v4 = 10.0;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)defaultSize
{
  double v2;
  double v3;
  CGSize result;

  if (defaultSize_onceToken != -1)
    dispatch_once(&defaultSize_onceToken, &__block_literal_global_7);
  v2 = *(double *)&defaultSize___DefaultSize_0;
  v3 = *(double *)&defaultSize___DefaultSize_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __28__CSPageControl_defaultSize__block_invoke()
{
  CSPageControl *v0;
  uint64_t v1;
  CSPageControl *v2;

  v0 = [CSPageControl alloc];
  v2 = -[CSPageControl initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CSPageControl setNumberOfPages:](v2, "setNumberOfPages:", 3);
  -[CSPageControl sizeForNumberOfPages:](v2, "sizeForNumberOfPages:", 3);
  defaultSize___DefaultSize_0 = v1;
  defaultSize___DefaultSize_1 = 0x4028000000000000;

}

+ (CGRect)suggestedFrameForPageBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(a1, "defaultSize");
  objc_msgSend(a1, "suggestedFrameForPageBounds:desiredSize:", x, y, width, height, v8, v9);
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

+ (CGRect)suggestedFrameForPageBounds:(CGRect)a3 desiredSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v13;
  CGRect v14;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if ((unint64_t)(objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation") - 1) <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userInterfaceIdiom");

  }
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  CGRectGetMaxY(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  CGRectGetMidX(v14);
  SBFMainScreenScale();
  BSRectRoundForScale();
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (void)setCameraPageIndex:(unint64_t)a3
{
  if (self->_cameraPageIndex != a3)
  {
    self->_cameraPageIndex = a3;
    -[CSPageControl _rebuildIndicators](self, "_rebuildIndicators");
  }
}

- (void)setLegibilitySettings:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](self->_sbLegibilitySettings, "sb_isEqualToLegibilitySettings:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_sbLegibilitySettings, a3);
    -[CSPageControl _updateForLegibility](self, "_updateForLegibility");
  }

}

- (void)_rebuildIndicators
{
  void *v3;

  -[CSPageControl _invalidateIndicators](self, "_invalidateIndicators");
  -[CSPageControl setPreferredIndicatorImage:](self, "setPreferredIndicatorImage:", 0);
  if (self->_cameraPageIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CSPageControl _cameraIndicator](self, "_cameraIndicator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSPageControl setIndicatorImage:forPage:](self, "setIndicatorImage:forPage:", v3, self->_cameraPageIndex);

  }
  -[CSPageControl _updateForLegibility](self, "_updateForLegibility");
}

- (void)_updateForLegibility
{
  void *v3;
  id v4;

  -[CSPageControl _pageIndicatorColor](self, "_pageIndicatorColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPageControl setPageIndicatorTintColor:](self, "setPageIndicatorTintColor:", v3);

  -[CSPageControl _currentPageIndicatorColor](self, "_currentPageIndicatorColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSPageControl setCurrentPageIndicatorTintColor:](self, "setCurrentPageIndicatorTintColor:", v4);

}

- (id)_cameraIndicator
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 12.25);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("camera.fill"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPageControl setContentVerticalAlignment:](self, "setContentVerticalAlignment:", 2);

  return v4;
}

- (id)_pageIndicatorColor
{
  void *v2;
  void *v3;

  -[_UILegibilitySettings primaryColor](self->_sbLegibilitySettings, "primaryColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.45);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_currentPageIndicatorColor
{
  return (id)-[_UILegibilitySettings primaryColor](self->_sbLegibilitySettings, "primaryColor");
}

- (unint64_t)cameraPageIndex
{
  return self->_cameraPageIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sbLegibilitySettings, 0);
}

@end
