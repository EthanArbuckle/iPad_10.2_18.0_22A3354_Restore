@implementation AVTAvatarToStaticTransition

- (AVTAvatarToStaticTransition)initWithModel:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5 logger:(id)a6
{
  _BOOL8 v8;
  id v11;
  AVTAvatarToStaticTransition *v12;
  AVTAvatarToStaticTransition *v13;
  objc_super v15;

  v8 = a4;
  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AVTAvatarToStaticTransition;
  v12 = -[AVTTransition initWithModel:animated:setupHandler:completionHandler:logger:](&v15, sel_initWithModel_animated_setupHandler_completionHandler_logger_, v11, v8, 0, a5, a6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_avatarTransitionModel, a3);

  return v13;
}

- (void)performTransition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  _QWORD v14[5];
  void (**v15)(_QWORD);
  void (**v16)(_QWORD);
  _QWORD v17[5];
  _QWORD v18[5];

  -[AVTTransition logger](self, "logger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTTransition description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logPerformTransition:", v4);

  -[AVTAvatarToStaticTransition avatarTransitionModel](self, "avatarTransitionModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "liveView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "avatar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Can't perform transition without an AVTView with an avatar"));
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __48__AVTAvatarToStaticTransition_performTransition__block_invoke;
  v18[3] = &unk_1EA51D188;
  v18[4] = self;
  v9 = (void (**)(_QWORD))MEMORY[0x1DF0D0754](v18);
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __48__AVTAvatarToStaticTransition_performTransition__block_invoke_2;
  v17[3] = &unk_1EA51D188;
  v17[4] = self;
  v10 = (void (**)(_QWORD))MEMORY[0x1DF0D0754](v17);
  if (-[AVTTransition animated](self, "animated"))
  {
    objc_msgSend(MEMORY[0x1E0D00658], "friendlyPose");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __48__AVTAvatarToStaticTransition_performTransition__block_invoke_3;
    v14[3] = &unk_1EA520388;
    v14[4] = self;
    v15 = v9;
    v16 = v10;
    objc_msgSend(v6, "transitionToPose:duration:completionHandler:", v11, v14, 0.25);

  }
  else
  {
    v9[2](v9);
    v10[2](v10);
    objc_msgSend(MEMORY[0x1E0D00658], "friendlyPose");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transitionToPose:duration:completionHandler:", v12, 0, 0.0);

    -[AVTTransition completionHandler](self, "completionHandler");
    v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v13[2](v13, 1);

  }
}

void __48__AVTAvatarToStaticTransition_performTransition__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "avatarTransitionModel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "transitionStaticViewToFront");

}

void __48__AVTAvatarToStaticTransition_performTransition__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "avatarTransitionModel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "applyBaseAlpha");

}

void __48__AVTAvatarToStaticTransition_performTransition__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logTransition:state:reachedStage:", v3, objc_msgSend(*(id *)(a1 + 32), "state"), 1);

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 1)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v4 = MEMORY[0x1E0C809B0];
    v5 = (void *)MEMORY[0x1E0CEABB0];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__AVTAvatarToStaticTransition_performTransition__block_invoke_4;
    v7[3] = &unk_1EA51D810;
    v8 = *(id *)(a1 + 48);
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __48__AVTAvatarToStaticTransition_performTransition__block_invoke_5;
    v6[3] = &unk_1EA51D250;
    v6[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "animateWithDuration:animations:completion:", v7, v6, 0.2);

  }
}

uint64_t __48__AVTAvatarToStaticTransition_performTransition__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __48__AVTAvatarToStaticTransition_performTransition__block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void (**v6)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logTransition:state:reachedStage:", v5, objc_msgSend(*(id *)(a1 + 32), "state"), 2);

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v6 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, a2);

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
