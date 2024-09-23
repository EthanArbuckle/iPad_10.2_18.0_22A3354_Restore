@implementation MUCircleProgressObservingView

- (MUCircleProgressObservingView)initWithFrame:(CGRect)a3
{
  double y;
  double x;
  MUCircleProgressView *v6;
  double v7;
  double v8;
  MUCircleProgressObservingView *v9;
  MUCircleProgressObservingView *v10;
  id *p_progressView;
  MUEdgeLayout *v12;
  double v13;
  double v14;
  MUCircleProgressObservingView *v15;
  objc_super v17;

  y = a3.origin.y;
  x = a3.origin.x;
  v6 = -[MUCircleProgressView initWithFrame:]([MUCircleProgressView alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[MUCircleProgressView frame](v6, "frame");
  v8 = v7;
  -[MUCircleProgressView frame](v6, "frame");
  v17.receiver = self;
  v17.super_class = (Class)MUCircleProgressObservingView;
  v9 = -[MUCircleProgressObservingView initWithFrame:](&v17, sel_initWithFrame_, x, y, v8);
  v10 = v9;
  if (v9)
  {
    p_progressView = (id *)&v9->_progressView;
    objc_storeStrong((id *)&v9->_progressView, v6);
    -[MUCircleProgressObservingView addSubview:](v10, "addSubview:", *p_progressView);
    v12 = -[MUEdgeLayout initWithItem:container:]([MUEdgeLayout alloc], "initWithItem:container:", *p_progressView, v10);
    -[MUConstraintLayout activate](v12, "activate");

    LODWORD(v13) = 1148846080;
    objc_msgSend(*p_progressView, "setContentHuggingPriority:forAxis:", 0, v13);
    LODWORD(v14) = 1148846080;
    objc_msgSend(*p_progressView, "setContentHuggingPriority:forAxis:", 1, v14);
    v15 = v10;
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[NSProgress removeObserver:forKeyPath:context:](self->_progress, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), _ProgressKVOContext);
  -[NSProgress removeObserver:forKeyPath:context:](self->_progress, "removeObserver:forKeyPath:context:", self, CFSTR("indeterminate"), _ProgressKVOContext);
  v3.receiver = self;
  v3.super_class = (Class)MUCircleProgressObservingView;
  -[MUCircleProgressObservingView dealloc](&v3, sel_dealloc);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[MUCircleProgressView intrinsicContentSize](self->_progressView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIImage)image
{
  return -[MUCircleProgressView image](self->_progressView, "image");
}

- (void)setImage:(id)a3
{
  -[MUCircleProgressView setImage:](self->_progressView, "setImage:", a3);
}

- (void)setProgress:(id)a3
{
  NSProgress *v5;
  NSProgress **p_progress;
  NSProgress *progress;
  NSProgress *v8;

  v5 = (NSProgress *)a3;
  p_progress = &self->_progress;
  progress = self->_progress;
  if (progress != v5)
  {
    v8 = v5;
    -[NSProgress removeObserver:forKeyPath:context:](progress, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), _ProgressKVOContext);
    -[NSProgress removeObserver:forKeyPath:context:](*p_progress, "removeObserver:forKeyPath:context:", self, CFSTR("indeterminate"), _ProgressKVOContext);
    objc_storeStrong((id *)&self->_progress, a3);
    -[NSProgress addObserver:forKeyPath:options:context:](*p_progress, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 0, _ProgressKVOContext);
    -[NSProgress addObserver:forKeyPath:options:context:](*p_progress, "addObserver:forKeyPath:options:context:", self, CFSTR("indeterminate"), 0, _ProgressKVOContext);
    -[MUCircleProgressObservingView _updateProgressView](self, "_updateProgressView");
    v5 = v8;
  }

}

- (id)primaryAction
{
  return -[MUCircleProgressView primaryAction](self->_progressView, "primaryAction");
}

- (void)setPrimaryAction:(id)a3
{
  -[MUCircleProgressView setPrimaryAction:](self->_progressView, "setPrimaryAction:", a3);
}

- (void)_updateProgressView
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[MUCircleProgressView setIndeterminate:](self->_progressView, "setIndeterminate:", -[NSProgress isIndeterminate](self->_progress, "isIndeterminate"));
  -[NSProgress fractionCompleted](self->_progress, "fractionCompleted");
  -[MUCircleProgressView setProgress:](self->_progressView, "setProgress:");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v7;
  _QWORD block[5];

  if ((void *)_ProgressKVOContext == a6)
  {
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3, a4, a5))
    {
      -[MUCircleProgressObservingView _updateProgressView](self, "_updateProgressView");
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __80__MUCircleProgressObservingView_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_1E2E01970;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MUCircleProgressObservingView;
    -[MUCircleProgressObservingView observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

uint64_t __80__MUCircleProgressObservingView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateProgressView");
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
}

@end
