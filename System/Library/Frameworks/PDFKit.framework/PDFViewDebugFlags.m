@implementation PDFViewDebugFlags

- (PDFViewDebugFlags)initWithView:(id)a3
{
  id v4;
  PDFViewDebugFlags *v5;
  PDFViewDebugFlags *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PDFViewDebugFlags;
  v5 = -[PDFViewDebugFlags init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_pdfView, v4);
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", v6, CFSTR("PDFKit2_ColorTileEdge"), 1, v6);

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", v6, CFSTR("PDFKit2_HighlightDetectedAnnotations"), 1, v6);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("PDFKit2_ColorTileEdge"), self);

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("PDFKit2_HighlightDetectedAnnotations"), self);

  v5.receiver = self;
  v5.super_class = (Class)PDFViewDebugFlags;
  -[PDFViewDebugFlags dealloc](&v5, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  objc_super v15;

  v10 = a3;
  v11 = a5;
  if (a6 == self)
  {
    WeakRetained = objc_loadWeakRetained((id *)a6 + 1);
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("PDFKit2_ColorTileEdge")))
    {
      objc_msgSend(WeakRetained, "forceTileRefresh");
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("PDFKit2_HighlightDetectedAnnotations")))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "BOOLValue");

      objc_msgSend(WeakRetained, "drawDetectedAnnotationBounds:", v14);
    }

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)PDFViewDebugFlags;
    -[PDFViewDebugFlags observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, v11, a6);
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pdfView);
}

@end
