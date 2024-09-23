@implementation NUSlideViewAnimator

- (void)setMediaTimingFunction:(id)a3
{
  NUAnimationFactory *v4;
  id v5;

  v5 = a3;
  if (v5)
  {
    v4 = -[NUAnimationFactory initWithMediaTimingFunction:]([NUAnimationFactory alloc], "initWithMediaTimingFunction:", v5);
    -[NUSlideViewAnimator setAnimationFactory:](self, "setAnimationFactory:", v4);

  }
  else
  {
    -[NUSlideViewAnimator setAnimationFactory:](self, "setAnimationFactory:", 0);
  }

}

- (void)setAnimationFactory:(id)a3
{
  objc_storeStrong((id *)&self->_animationFactory, a3);
}

- (NUSlideViewAnimator)initWithBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NUSlideViewAnimator *result;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)NUSlideViewAnimator;
  result = -[NUSlideViewAnimator init](&v8, sel_init);
  if (result)
  {
    result->_animating = 0;
    result->_duration = 0.75;
    result->_bounds.origin.x = x;
    result->_bounds.origin.y = y;
    result->_bounds.size.width = width;
    result->_bounds.size.height = height;
    result->_translateBoundsPadding = 1.0;
  }
  return result;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void)translateFromView:(id)a3 toView:(id)a4 direction:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  NUSlideViewAnimator *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _OWORD v33[3];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  -[NUSlideViewAnimator setAnimating:](self, "setAnimating:", 1);
  v38 = 0u;
  v39 = 0u;
  v37 = 0u;
  -[NUSlideViewAnimator toViewTransformForDirection:](self, "toViewTransformForDirection:", a5);
  v35 = 0u;
  v36 = 0u;
  v34 = 0u;
  -[NUSlideViewAnimator fromViewTransformForDirection:](self, "fromViewTransformForDirection:", a5);
  v33[0] = v37;
  v33[1] = v38;
  v33[2] = v39;
  objc_msgSend(v11, "setTransform:", v33);
  -[NUSlideViewAnimator animationFactory](self, "animationFactory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[NUSlideViewAnimator animationOptionsForAnimationFactory:](self, "animationOptionsForAnimationFactory:", v13);

  v15 = (void *)MEMORY[0x24BDF6F90];
  -[NUSlideViewAnimator duration](self, "duration");
  v17 = v16;
  -[NUSlideViewAnimator animationFactory](self, "animationFactory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __69__NUSlideViewAnimator_translateFromView_toView_direction_completion___block_invoke;
  v27[3] = &unk_24D5A1CB8;
  v28 = v11;
  v29 = v10;
  v30 = v34;
  v31 = v35;
  v32 = v36;
  v23[0] = v19;
  v23[1] = 3221225472;
  v23[2] = __69__NUSlideViewAnimator_translateFromView_toView_direction_completion___block_invoke_2;
  v23[3] = &unk_24D5A1CE0;
  v25 = self;
  v26 = v12;
  v24 = v29;
  v20 = v12;
  v21 = v29;
  v22 = v11;
  objc_msgSend(v15, "_animateWithDuration:delay:options:factory:animations:completion:", v14, v18, v27, v23, v17, 0.0);

}

uint64_t __69__NUSlideViewAnimator_translateFromView_toView_direction_completion___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  __int128 v4;
  _OWORD v6[3];
  _OWORD v7[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v7[0] = *MEMORY[0x24BDBD8B8];
  v7[1] = v3;
  v7[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v2, "setTransform:", v7);
  v4 = *(_OWORD *)(a1 + 64);
  v6[0] = *(_OWORD *)(a1 + 48);
  v6[1] = v4;
  v6[2] = *(_OWORD *)(a1 + 80);
  return objc_msgSend(*(id *)(a1 + 40), "setTransform:", v6);
}

uint64_t __69__NUSlideViewAnimator_translateFromView_toView_direction_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  __int128 v3;
  uint64_t v4;
  _OWORD v6[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v6[0] = *MEMORY[0x24BDBD8B8];
  v6[1] = v3;
  v6[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v2, "setTransform:", v6);
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "setAnimating:", 0);
}

- (CGAffineTransform)fromViewTransformForDirection:(SEL)a3
{
  double Height;
  double v8;
  double v9;
  double Width;
  CGAffineTransform *result;
  double v12;
  double v13;
  double v14;
  CGRect v15;
  CGRect v16;

  -[NUSlideViewAnimator bounds](self, "bounds");
  Height = CGRectGetHeight(v15);
  -[NUSlideViewAnimator translateBoundsPadding](self, "translateBoundsPadding");
  v9 = v8;
  -[NUSlideViewAnimator bounds](self, "bounds");
  Width = CGRectGetWidth(v16);
  result = (CGAffineTransform *)-[NUSlideViewAnimator translateBoundsPadding](self, "translateBoundsPadding");
  v12 = Height + v9;
  v14 = Width + v13;
  switch(a4)
  {
    case 0uLL:
      goto LABEL_3;
    case 1uLL:
      v12 = -v12;
LABEL_3:
      v14 = 0.0;
      goto LABEL_6;
    case 2uLL:
      v14 = -v14;
      goto LABEL_5;
    case 3uLL:
LABEL_5:
      v12 = 0.0;
LABEL_6:
      result = CGAffineTransformMakeTranslation(retstr, v14, v12);
      break;
    default:
      return result;
  }
  return result;
}

- (CGAffineTransform)toViewTransformForDirection:(SEL)a3
{
  double Height;
  double v8;
  double v9;
  double Width;
  CGAffineTransform *result;
  double v12;
  double v13;
  double v14;
  CGRect v15;
  CGRect v16;

  -[NUSlideViewAnimator bounds](self, "bounds");
  Height = CGRectGetHeight(v15);
  -[NUSlideViewAnimator translateBoundsPadding](self, "translateBoundsPadding");
  v9 = v8;
  -[NUSlideViewAnimator bounds](self, "bounds");
  Width = CGRectGetWidth(v16);
  result = (CGAffineTransform *)-[NUSlideViewAnimator translateBoundsPadding](self, "translateBoundsPadding");
  v12 = Height + v9;
  v14 = Width + v13;
  switch(a4)
  {
    case 0uLL:
      v12 = -v12;
      goto LABEL_3;
    case 1uLL:
LABEL_3:
      v14 = 0.0;
      goto LABEL_6;
    case 2uLL:
      goto LABEL_5;
    case 3uLL:
      v14 = -v14;
LABEL_5:
      v12 = 0.0;
LABEL_6:
      result = CGAffineTransformMakeTranslation(retstr, v14, v12);
      break;
    default:
      return result;
  }
  return result;
}

- (unint64_t)animationOptionsForAnimationFactory:(id)a3
{
  if (a3)
    return 393216;
  else
    return 0;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (CAMediaTimingFunction)mediaTimingFunction
{
  return self->_mediaTimingFunction;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (double)translateBoundsPadding
{
  return self->_translateBoundsPadding;
}

- (void)setTranslateBoundsPadding:(double)a3
{
  self->_translateBoundsPadding = a3;
}

- (NUAnimationFactory)animationFactory
{
  return self->_animationFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationFactory, 0);
  objc_storeStrong((id *)&self->_mediaTimingFunction, 0);
}

@end
