@implementation PDFRenderingProperties

- (PDFRenderingProperties)init
{
  PDFRenderingProperties *v2;
  PDFRenderingPropertiesPrivate *v3;
  PDFRenderingPropertiesPrivate *v4;
  uint64_t v5;
  PDFRenderingPropertiesPrivate *v6;
  UIColor *pageColor;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PDFRenderingProperties;
  v2 = -[PDFRenderingProperties init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PDFRenderingPropertiesPrivate);
    v4 = v2->_private;
    v2->_private = v3;

    objc_storeWeak((id *)&v2->_private->pdfView, 0);
    objc_storeWeak((id *)&v2->_private->pdfLayerController, 0);
    v2->_private->displayBox = 1;
    v2->_private->shouldAntiAlias = 1;
    v2->_private->greekingThreshold = 0.0;
    v2->_private->interpolationQuality = 2;
    v2->_private->lineWidthThreshold = 0.75;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v2->_private;
    pageColor = v6->pageColor;
    v6->pageColor = (UIColor *)v5;

    v2->_private->enablePageShadows = 1;
    v2->_private->enableTileEdgeColoring = GetDefaultsWriteColorWidgetBackgrounds();
    v2->_private->enableAccessibilityDrawing = GetDefaultsWriteDrawAccessibility();
    v2->_private->screenScaleFactor = PDFScreenGetBackingScaleFactor();
    v2->_private->enableTileUpdates = 1;
    *(_WORD *)&v2->_private->enableBackgroundImages = 1;
    v2->_private->deviceColorSpace = 0;
  }
  return v2;
}

- (void)dealloc
{
  CGColorSpace *deviceColorSpace;
  objc_super v4;

  deviceColorSpace = self->_private->deviceColorSpace;
  if (deviceColorSpace)
    CGColorSpaceRelease(deviceColorSpace);
  v4.receiver = self;
  v4.super_class = (Class)PDFRenderingProperties;
  -[PDFRenderingProperties dealloc](&v4, sel_dealloc);
}

- (void)setPDFView:(id)a3
{
  objc_storeWeak((id *)&self->_private->pdfView, a3);
}

- (PDFView)pdfView
{
  return (PDFView *)objc_loadWeakRetained((id *)&self->_private->pdfView);
}

- (void)setPDFLayerController:(id)a3
{
  objc_storeWeak((id *)&self->_private->pdfLayerController, a3);
}

- (PDFLayerController)pdfLayerController
{
  return (PDFLayerController *)objc_loadWeakRetained((id *)&self->_private->pdfLayerController);
}

- (void)setDisplayBox:(int64_t)a3
{
  PDFRenderingPropertiesPrivate *v3;

  if ((unint64_t)a3 < 5)
  {
    v3 = self->_private;
    if (v3->displayBox != a3)
    {
      v3->displayBox = a3;
      -[PDFRenderingProperties _notifyPropertyChanged:](self, "_notifyPropertyChanged:", 0);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB78], CFSTR("setDisplayBox: %ld out of bounds"), a3);
  }
}

- (int64_t)displayBox
{
  return self->_private->displayBox;
}

- (void)setShouldAntiAlias:(BOOL)a3
{
  PDFRenderingPropertiesPrivate *v3;

  v3 = self->_private;
  if (v3->shouldAntiAlias != a3)
  {
    v3->shouldAntiAlias = a3;
    -[PDFRenderingProperties _notifyPropertyChanged:](self, "_notifyPropertyChanged:", 1);
  }
}

- (BOOL)shouldAntiAlias
{
  return self->_private->shouldAntiAlias;
}

- (void)setGreekingThreshold:(double)a3
{
  PDFRenderingPropertiesPrivate *v3;

  v3 = self->_private;
  if (v3->greekingThreshold != a3)
  {
    v3->greekingThreshold = a3;
    -[PDFRenderingProperties _notifyPropertyChanged:](self, "_notifyPropertyChanged:", 2);
  }
}

- (double)greekingThreshold
{
  return self->_private->greekingThreshold;
}

- (void)setInterpolationQuality:(int64_t)a3
{
  PDFRenderingPropertiesPrivate *v3;

  if ((unint64_t)a3 < 3)
  {
    v3 = self->_private;
    if (v3->interpolationQuality != a3)
    {
      v3->interpolationQuality = a3;
      -[PDFRenderingProperties _notifyPropertyChanged:](self, "_notifyPropertyChanged:", 4);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB78], CFSTR("setInterpolationQuality: illegal value passed in"));
  }
}

- (int64_t)interpolationQuality
{
  return self->_private->interpolationQuality;
}

- (void)setLineWidthThreshold:(double)a3
{
  PDFRenderingPropertiesPrivate *v3;

  v3 = self->_private;
  if (v3->lineWidthThreshold != a3)
  {
    v3->lineWidthThreshold = a3;
    -[PDFRenderingProperties _notifyPropertyChanged:](self, "_notifyPropertyChanged:", 3);
  }
}

- (double)lineWidthThreshold
{
  return self->_private->lineWidthThreshold;
}

- (void)setPageColor:(id)a3
{
  UIColor *v5;
  PDFRenderingPropertiesPrivate *v6;
  id *p_pageColor;
  UIColor *pageColor;
  UIColor *v9;

  v5 = (UIColor *)a3;
  v6 = self->_private;
  pageColor = v6->pageColor;
  p_pageColor = (id *)&v6->pageColor;
  if (pageColor != v5)
  {
    v9 = v5;
    objc_storeStrong(p_pageColor, a3);
    -[PDFRenderingProperties _notifyPropertyChanged:](self, "_notifyPropertyChanged:", 5);
    v5 = v9;
  }

}

- (UIColor)pageColor
{
  return self->_private->pageColor;
}

- (void)setEnablePageShadows:(BOOL)a3
{
  PDFRenderingPropertiesPrivate *v3;

  v3 = self->_private;
  if (v3->enablePageShadows != a3)
  {
    v3->enablePageShadows = a3;
    -[PDFRenderingProperties _notifyPropertyChanged:](self, "_notifyPropertyChanged:", 6);
  }
}

- (BOOL)enablePageShadows
{
  return self->_private->enablePageShadows;
}

- (void)setScreenScaleFactor:(double)a3
{
  self->_private->screenScaleFactor = a3;
}

- (double)screenScaleFactor
{
  return self->_private->screenScaleFactor;
}

- (void)setEnableTileUpdates:(BOOL)a3
{
  self->_private->enableTileUpdates = a3;
}

- (BOOL)enableTileUpdates
{
  return self->_private->enableTileUpdates;
}

- (void)setEnableBackgroundImages:(BOOL)a3
{
  self->_private->enableBackgroundImages = a3;
}

- (BOOL)enableBackgroundImages
{
  return self->_private->enableBackgroundImages;
}

- (void)setIsUsingPDFExtensionView:(BOOL)a3
{
  self->_private->isUsingPDFExtensionView = a3;
}

- (BOOL)isUsingPDFExtensionView
{
  return self->_private->isUsingPDFExtensionView;
}

- (void)setDeviceColorSpace:(CGColorSpace *)a3
{
  PDFRenderingPropertiesPrivate *v5;
  CGColorSpace *deviceColorSpace;
  CGColorSpace *v7;

  v5 = self->_private;
  deviceColorSpace = v5->deviceColorSpace;
  if (deviceColorSpace)
  {
    CGColorSpaceRelease(deviceColorSpace);
    v5 = self->_private;
  }
  v5->deviceColorSpace = a3;
  v7 = self->_private->deviceColorSpace;
  if (v7)
    CGColorSpaceRetain(v7);
}

- (CGColorSpace)deviceColorSpace
{
  return self->_private->deviceColorSpace;
}

- (void)_notifyPropertyChanged:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v7 = CFSTR("PDFRenderingPropertyKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("PDFRenderingPropertiesChanged"), self, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
