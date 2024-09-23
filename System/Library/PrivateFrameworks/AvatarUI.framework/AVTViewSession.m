@implementation AVTViewSession

- (AVTViewSession)initWithBecomeActiveHandler:(id)a3 tearDownHandler:(id)a4 aspectRatio:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  id v10;
  AVTViewSession *v11;
  uint64_t v12;
  id becomeActiveHandler;
  uint64_t v14;
  id tearDownHandler;
  objc_super v17;

  height = a5.height;
  width = a5.width;
  v9 = a3;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AVTViewSession;
  v11 = -[AVTViewSession init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    becomeActiveHandler = v11->_becomeActiveHandler;
    v11->_becomeActiveHandler = (id)v12;

    v14 = objc_msgSend(v10, "copy");
    tearDownHandler = v11->_tearDownHandler;
    v11->_tearDownHandler = (id)v14;

    v11->_active = 0;
    v11->_aspectRatio.width = width;
    v11->_aspectRatio.height = height;
  }

  return v11;
}

- (void)activateWithAVTView:(id)a3 container:(id)a4 updater:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  if (!-[AVTViewSession isActive](self, "isActive"))
  {
    -[AVTViewSession setActive:](self, "setActive:", 1);
    -[AVTViewSession setAvtView:](self, "setAvtView:", v11);
    -[AVTViewSession setAvtViewContainer:](self, "setAvtViewContainer:", v8);
    -[AVTViewSession setAvtViewUpdater:](self, "setAvtViewUpdater:", v9);
    -[AVTViewSession becomeActiveHandler](self, "becomeActiveHandler");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, AVTViewSession *))v10)[2](v10, self);

  }
}

- (void)tearDownWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  AVTViewSession *v13;
  id v14;

  v4 = a3;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __48__AVTViewSession_tearDownWithCompletionHandler___block_invoke;
  v12 = &unk_1EA51D490;
  v13 = self;
  v14 = v4;
  v5 = v4;
  v6 = (void (**)(_QWORD))MEMORY[0x1DF0D0754](&v9);
  if (-[AVTViewSession isActive](self, "isActive", v9, v10, v11, v12, v13)
    && (-[AVTViewSession setActive:](self, "setActive:", 0),
        -[AVTViewSession tearDownHandler](self, "tearDownHandler"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    -[AVTViewSession tearDownHandler](self, "tearDownHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, AVTViewSession *, void (**)(_QWORD)))v8)[2](v8, self, v6);

  }
  else
  {
    v6[2](v6);
  }

}

uint64_t __48__AVTViewSession_tearDownWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionDidTearDown:", *(_QWORD *)(a1 + 32));

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (UIView)avtViewContainer
{
  return self->_avtViewContainer;
}

- (void)setAvtViewContainer:(id)a3
{
  self->_avtViewContainer = (UIView *)a3;
}

- (AVTView)avtView
{
  return self->_avtView;
}

- (void)setAvtView:(id)a3
{
  self->_avtView = (AVTView *)a3;
}

- (AVTViewUpdater)avtViewUpdater
{
  return self->_avtViewUpdater;
}

- (void)setAvtViewUpdater:(id)a3
{
  self->_avtViewUpdater = (AVTViewUpdater *)a3;
}

- (CGSize)aspectRatio
{
  double width;
  double height;
  CGSize result;

  width = self->_aspectRatio.width;
  height = self->_aspectRatio.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)becomeActiveHandler
{
  return self->_becomeActiveHandler;
}

- (id)tearDownHandler
{
  return self->_tearDownHandler;
}

- (AVTViewSessionDelegate)delegate
{
  return (AVTViewSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_tearDownHandler, 0);
  objc_storeStrong(&self->_becomeActiveHandler, 0);
}

@end
