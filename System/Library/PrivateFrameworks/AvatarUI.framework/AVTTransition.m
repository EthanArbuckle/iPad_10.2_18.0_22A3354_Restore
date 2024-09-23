@implementation AVTTransition

- (AVTTransition)initWithModel:(id)a3 animated:(BOOL)a4 setupHandler:(id)a5 completionHandler:(id)a6 logger:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  AVTTransition *v17;
  AVTTransition *v18;
  uint64_t v19;
  id setupHandler;
  uint64_t v21;
  id completionHandler;
  objc_super v24;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)AVTTransition;
  v17 = -[AVTTransition init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_model, a3);
    v18->_animated = a4;
    if (v14)
    {
      v19 = objc_msgSend(v14, "copy");
      setupHandler = v18->_setupHandler;
      v18->_setupHandler = (id)v19;

    }
    if (v15)
    {
      v21 = objc_msgSend(v15, "copy");
      completionHandler = v18->_completionHandler;
      v18->_completionHandler = (id)v21;

    }
    objc_storeStrong((id *)&v18->_logger, a7);
  }

  return v18;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void (**v7)(id, _QWORD);
  _QWORD v8[5];

  -[AVTTransition logger](self, "logger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTTransition description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logStartTransition:state:", v4, -[AVTTransition state](self, "state"));

  if (-[AVTTransition state](self, "state") == 2)
  {
    -[AVTTransition completionHandler](self, "completionHandler");
    v7 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0);

  }
  else
  {
    if (-[AVTTransition state](self, "state"))
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-[AVTTransition start] was called twice"));
    -[AVTTransition setState:](self, "setState:", 1);
    -[AVTTransition setupHandler](self, "setupHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[AVTTransition setupHandler](self, "setupHandler");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __22__AVTTransition_start__block_invoke;
      v8[3] = &unk_1EA51D250;
      v8[4] = self;
      ((void (**)(_QWORD, _QWORD *))v6)[2](v6, v8);

    }
    else
    {
      -[AVTTransition performTransition](self, "performTransition");
    }
  }
}

void __22__AVTTransition_start__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logSetupHandlerCompletedForTransition:state:finished:", v5, objc_msgSend(*(id *)(a1 + 32), "state"), a2);

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 1)
  {
    v6 = *(void **)(a1 + 32);
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v6, "performTransition");
    }
    else
    {
      objc_msgSend(v6, "completionHandler");
      v7 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0);

    }
  }
}

- (void)cancel
{
  void *v3;
  void *v4;
  int64_t v5;
  void (**v6)(id, _QWORD);

  -[AVTTransition logger](self, "logger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTTransition description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logCancelTransition:", v4);

  v5 = -[AVTTransition state](self, "state");
  -[AVTTransition setState:](self, "setState:", 2);
  -[AVTTransition performCancellation](self, "performCancellation");
  if (v5 == 1)
  {
    -[AVTTransition completionHandler](self, "completionHandler");
    v6 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0);

  }
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVTTransition;
  -[AVTTransition description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AVTTransition model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" model: %p"), v5);

  v6 = -[AVTTransition animated](self, "animated");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  objc_msgSend(v4, "appendFormat:", CFSTR(" animated: %@"), v7);
  v8 = (void *)objc_msgSend(v4, "copy");

  return (NSString *)v8;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (AVTTransitionModel)model
{
  return self->_model;
}

- (id)setupHandler
{
  return self->_setupHandler;
}

- (void)setSetupHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_setupHandler, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
