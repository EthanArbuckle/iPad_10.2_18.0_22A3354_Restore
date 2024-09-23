@implementation AEProgressIndicatorView

- (AEProgressIndicatorView)initWithFrame:(CGRect)a3 progress:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  AEProgressIndicatorView *v11;
  AEProgressIndicatorView *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AEProgressIndicatorView;
  v11 = -[PLRoundProgressView initWithFrame:style:](&v14, sel_initWithFrame_style_, 0, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->__progress, a4);
    -[NSProgress addObserver:forKeyPath:options:context:](v12->__progress, "addObserver:forKeyPath:options:context:", v12, CFSTR("fractionCompleted"), 4, AEProgressIndicatorViewObserverContext);
  }

  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[AEProgressIndicatorView _progress](self, "_progress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), AEProgressIndicatorViewObserverContext);

  v4.receiver = self;
  v4.super_class = (Class)AEProgressIndicatorView;
  -[PLRoundProgressView dealloc](&v4, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  objc_super v12;

  v10 = a4;
  v11 = v10;
  if ((void *)AEProgressIndicatorViewObserverContext == a6)
  {
    objc_msgSend(v10, "fractionCompleted");
    -[PLRoundProgressView setProgress:](self, "setProgress:");
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)AEProgressIndicatorView;
    -[AEProgressIndicatorView observeValueForKeyPath:ofObject:change:context:](&v12, sel_observeValueForKeyPath_ofObject_change_context_, a3, v10, a5, a6);
  }

}

- (NSProgress)_progress
{
  return self->__progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__progress, 0);
}

@end
