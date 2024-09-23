@implementation ScrollDecelerationTestProcessor

- (ScrollDecelerationTestProcessor)initWithTestName:(id)a3 browserController:(id)a4
{
  ScrollDecelerationTestProcessor *v4;
  ScrollDecelerationTestProcessor *v5;
  ScrollDecelerationTestProcessor *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ScrollDecelerationTestProcessor;
  v4 = -[ContentInteractionTestRunner initWithTestName:browserController:](&v8, sel_initWithTestName_browserController_, a3, a4);
  v5 = v4;
  if (v4)
    v6 = v4;

  return v5;
}

- (BOOL)startPageAction:(id)a3
{
  id v4;
  objc_super v6;

  v4 = a3;
  -[ScrollDecelerationTestProcessor setIterationsRemaining:](self, "setIterationsRemaining:", -[ContentInteractionTestRunner iterations](self, "iterations"));
  -[ScrollDecelerationTestProcessor setState:](self, "setState:", 0);
  v6.receiver = self;
  v6.super_class = (Class)ScrollDecelerationTestProcessor;
  LOBYTE(self) = -[ContentInteractionTestRunner startPageAction:](&v6, sel_startPageAction_, v4);

  return (char)self;
}

- (BOOL)performActionForPage:(id)a3
{
  int64_t v4;
  BOOL result;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t *v10;
  void *v11;
  uint64_t v12;
  ScrollDecelerationTestProcessor *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  ScrollDecelerationTestProcessor *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  ScrollDecelerationTestProcessor *v24;

  v4 = -[ScrollDecelerationTestProcessor state](self, "state", a3);
  result = 0;
  switch(v4)
  {
    case 0:
      -[ScrollDecelerationTestProcessor setState:](self, "setState:", 1);
      -[ContentInteractionTestRunner startTrackingFrameRate](self, "startTrackingFrameRate");
      return 1;
    case 1:
      -[ContentInteractionTestRunner pageWebView](self, "pageWebView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "scrollView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "setContentOffset:animated:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __56__ScrollDecelerationTestProcessor_performActionForPage___block_invoke;
      v23 = &unk_1E9CF1900;
      v24 = self;
      v8 = 1000.0;
      v9 = 0.25;
      v10 = &v20;
      goto LABEL_5;
    case 3:
      -[ContentInteractionTestRunner pageWebView](self, "pageWebView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "scrollView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __56__ScrollDecelerationTestProcessor_performActionForPage___block_invoke_2;
      v18 = &unk_1E9CF1900;
      v19 = self;
      v8 = -1000.0;
      v9 = 0.25;
      v10 = &v15;
LABEL_5:
      objc_msgSend(v7, "_simulateScrollWithTranslation:duration:willBeginDragging:didEndDragging:willBeginDecelerating:didEndDecelerating:", 0, 0, 0, v10, 0.0, v8, v9, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24);
      -[ScrollDecelerationTestProcessor setState:](self, "setState:", 2);

      return 1;
    case 4:
      v12 = -[ScrollDecelerationTestProcessor iterationsRemaining](self, "iterationsRemaining") - 1;
      -[ScrollDecelerationTestProcessor setIterationsRemaining:](self, "setIterationsRemaining:", v12);
      if ((_DWORD)v12)
      {
        v13 = self;
        v14 = 0;
      }
      else
      {
        -[ContentInteractionTestRunner endTrackingFrameRate](self, "endTrackingFrameRate");
        v13 = self;
        v14 = 5;
      }
      -[ScrollDecelerationTestProcessor setState:](v13, "setState:", v14);
      return 1;
    case 5:
      return result;
    default:
      return 1;
  }
}

uint64_t __56__ScrollDecelerationTestProcessor_performActionForPage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
}

uint64_t __56__ScrollDecelerationTestProcessor_performActionForPage___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setState:", 4);
}

- (int)iterationsRemaining
{
  return self->_iterationsRemaining;
}

- (void)setIterationsRemaining:(int)a3
{
  self->_iterationsRemaining = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

@end
