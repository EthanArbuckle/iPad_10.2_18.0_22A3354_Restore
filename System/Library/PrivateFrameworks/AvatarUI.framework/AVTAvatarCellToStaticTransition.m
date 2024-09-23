@implementation AVTAvatarCellToStaticTransition

- (AVTAvatarCellToStaticTransition)initWithModel:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5 logger:(id)a6
{
  _BOOL8 v8;
  id v11;
  AVTAvatarCellToStaticTransition *v12;
  AVTAvatarCellToStaticTransition *v13;
  objc_super v15;

  v8 = a4;
  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AVTAvatarCellToStaticTransition;
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
  uint64_t v5;
  void (**v6)(_QWORD);
  void (**v7)(_QWORD);
  void (**v8)(_QWORD, _QWORD);
  _QWORD v9[5];
  _QWORD v10[5];

  -[AVTTransition logger](self, "logger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTTransition description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logPerformTransition:", v4);

  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__AVTAvatarCellToStaticTransition_performTransition__block_invoke;
  v10[3] = &unk_1EA51D188;
  v10[4] = self;
  v6 = (void (**)(_QWORD))MEMORY[0x1DF0D0754](v10);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __52__AVTAvatarCellToStaticTransition_performTransition__block_invoke_2;
  v9[3] = &unk_1EA51D188;
  v9[4] = self;
  v7 = (void (**)(_QWORD))MEMORY[0x1DF0D0754](v9);
  v6[2](v6);
  v7[2](v7);
  -[AVTTransition completionHandler](self, "completionHandler");
  v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v8[2](v8, 1);

}

void __52__AVTAvatarCellToStaticTransition_performTransition__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "avatarTransitionModel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "transitionStaticViewToFront");

}

void __52__AVTAvatarCellToStaticTransition_performTransition__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "avatarTransitionModel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "applyBaseAlpha");

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
