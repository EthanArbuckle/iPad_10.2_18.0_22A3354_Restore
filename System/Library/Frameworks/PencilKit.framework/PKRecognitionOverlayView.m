@implementation PKRecognitionOverlayView

- (PKRecognitionOverlayView)initWithFrame:(CGRect)a3 visualizationManager:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  CHVisualizationManager *v9;
  PKRecognitionOverlayView *v10;
  CHVisualizationManager *visualizationManager;
  CHVisualizationManager *v12;
  void *v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (CHVisualizationManager *)a4;
  v15.receiver = self;
  v15.super_class = (Class)PKRecognitionOverlayView;
  v10 = -[PKRecognitionOverlayView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  visualizationManager = v10->_visualizationManager;
  v10->_visualizationManager = v9;
  v12 = v9;

  -[CHVisualizationManager setDelegate:](v12, "setDelegate:", v10);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKRecognitionOverlayView setBackgroundColor:](v10, "setBackgroundColor:", v13);
  return v10;
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGContext *CurrentContext;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGAffineTransform v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  -[PKRecognitionOverlayView drawingTransform](self, "drawingTransform");
  CGContextConcatCTM(CurrentContext, &v14);
  -[PKRecognitionOverlayView visualizationManager](self, "visualizationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionOverlayView bounds](self, "bounds");
  objc_msgSend(v9, "drawVisualizationInRect:context:viewBounds:", CurrentContext, x, y, width, height, v10, v11, v12, v13);

  CGContextRestoreGState(CurrentContext);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PKRecognitionOverlayView visualizationManager](self, "visualizationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)PKRecognitionOverlayView;
  -[PKRecognitionOverlayView dealloc](&v4, sel_dealloc);
}

- (CGAffineTransform)drawingTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[9].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[8].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[9].d;
  return self;
}

- (void)setDrawingTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_drawingTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_drawingTransform.c = v4;
  *(_OWORD *)&self->_drawingTransform.tx = v3;
}

- (CHVisualizationManager)visualizationManager
{
  return self->_visualizationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualizationManager, 0);
}

@end
