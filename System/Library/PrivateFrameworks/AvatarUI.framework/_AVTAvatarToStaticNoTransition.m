@implementation _AVTAvatarToStaticNoTransition

- (_AVTAvatarToStaticNoTransition)initWithModel:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5 logger:(id)a6
{
  _BOOL8 v8;
  id v11;
  _AVTAvatarToStaticNoTransition *v12;
  _AVTAvatarToStaticNoTransition *v13;
  objc_super v15;

  v8 = a4;
  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_AVTAvatarToStaticNoTransition;
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
  void (**v5)(id, uint64_t);

  -[_AVTAvatarToStaticNoTransition avatarTransitionModel](self, "avatarTransitionModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionStaticViewToFront");

  -[_AVTAvatarToStaticNoTransition avatarTransitionModel](self, "avatarTransitionModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applyBaseAlpha");

  -[AVTTransition completionHandler](self, "completionHandler");
  v5 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
  v5[2](v5, 1);

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
