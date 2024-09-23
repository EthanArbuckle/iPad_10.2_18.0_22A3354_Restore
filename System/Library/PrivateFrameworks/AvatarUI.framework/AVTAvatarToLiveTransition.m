@implementation AVTAvatarToLiveTransition

- (AVTAvatarToLiveTransition)initWithModel:(id)a3 animated:(BOOL)a4 setupHandler:(id)a5 completionHandler:(id)a6 logger:(id)a7
{
  _BOOL8 v10;
  id v13;
  AVTAvatarToLiveTransition *v14;
  AVTAvatarToLiveTransition *v15;
  objc_super v17;

  v10 = a4;
  v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AVTAvatarToLiveTransition;
  v14 = -[AVTTransition initWithModel:animated:setupHandler:completionHandler:logger:](&v17, sel_initWithModel_animated_setupHandler_completionHandler_logger_, v13, v10, a5, a6, a7);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_avatarTransitionModel, a3);

  return v15;
}

- (void)performTransition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  _QWORD v15[5];

  -[AVTTransition logger](self, "logger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTTransition description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logPerformTransition:", v4);

  -[AVTAvatarToLiveTransition avatarTransitionModel](self, "avatarTransitionModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "liveView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "avatar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Can't perform transition without an AVTView with an avatar"));
  -[AVTAvatarToLiveTransition avatarTransitionModel](self, "avatarTransitionModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transitionLiveViewToFront");

  -[AVTAvatarToLiveTransition avatarTransitionModel](self, "avatarTransitionModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applyFullAlpha");

  if (-[AVTTransition animated](self, "animated"))
  {
    -[AVTTransition logger](self, "logger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTTransition description](self, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logTransition:state:reachedStage:", v11, -[AVTTransition state](self, "state"), 1);

    if (-[AVTTransition state](self, "state") == 1)
    {
      -[AVTTransition logger](self, "logger");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTTransition description](self, "description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logToLivePoseTransitionBegins:", v13);

      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __46__AVTAvatarToLiveTransition_performTransition__block_invoke;
      v15[3] = &unk_1EA51D188;
      v15[4] = self;
      objc_msgSend(v6, "transitionToFaceTrackingWithDuration:completionHandler:", v15, 0.25);
    }
  }
  else
  {
    objc_msgSend(v6, "transitionToFaceTrackingWithDuration:completionHandler:", 0, 0.0);
    -[AVTTransition completionHandler](self, "completionHandler");
    v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v14[2](v14, 1);

  }
}

void __46__AVTAvatarToLiveTransition_performTransition__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(id, uint64_t);

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logToLivePoseTransitionEnds:", v3);

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logTransition:state:reachedStage:", v5, objc_msgSend(*(id *)(a1 + 32), "state"), 2);

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v6 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
    v6[2](v6, 1);

  }
}

- (AVTAvatarTransitionModel)avatarTransitionModel
{
  return self->_avatarTransitionModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarTransitionModel, 0);
}

@end
