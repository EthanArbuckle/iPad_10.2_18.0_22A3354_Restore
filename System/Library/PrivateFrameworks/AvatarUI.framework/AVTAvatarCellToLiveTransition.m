@implementation AVTAvatarCellToLiveTransition

- (AVTAvatarCellToLiveTransition)initWithModel:(id)a3 animated:(BOOL)a4 setupHandler:(id)a5 completionHandler:(id)a6 logger:(id)a7
{
  _BOOL8 v10;
  id v13;
  AVTAvatarCellToLiveTransition *v14;
  AVTAvatarCellToLiveTransition *v15;
  objc_super v17;

  v10 = a4;
  v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AVTAvatarCellToLiveTransition;
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
  void (**v5)(void);
  void (**v6)(_QWORD, _QWORD);
  _QWORD v7[5];

  -[AVTTransition logger](self, "logger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTTransition description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logPerformTransition:", v4);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__AVTAvatarCellToLiveTransition_performTransition__block_invoke;
  v7[3] = &unk_1EA51D188;
  v7[4] = self;
  v5 = (void (**)(void))MEMORY[0x1DF0D0754](v7);
  v5[2]();
  -[AVTTransition completionHandler](self, "completionHandler");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v6[2](v6, 1);

}

void __50__AVTAvatarCellToLiveTransition_performTransition__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "avatarTransitionModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitionLiveViewToFront");

  objc_msgSend(*(id *)(a1 + 32), "avatarTransitionModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applyFullAlpha");

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
