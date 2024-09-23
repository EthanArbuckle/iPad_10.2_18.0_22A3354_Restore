@implementation WKFullscreenAnimationController

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WKFullscreenAnimationController;
  -[WKFullscreenAnimationController dealloc](&v3, sel_dealloc);
}

- (UIViewControllerContextTransitioning)context
{
  return (UIViewControllerContextTransitioning *)self->_context.m_ptr;
}

- (void)_createViewsForTransitionContext:(id)a3
{
  id v5;
  void *m_ptr;
  void *v7;
  __int128 v8;
  _OWORD v9[3];

  v5 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  m_ptr = self->_maskView.m_ptr;
  self->_maskView.m_ptr = v5;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    v5 = self->_maskView.m_ptr;
  }
  objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "blackColor"));
  objc_msgSend(self->_maskView.m_ptr, "setBounds:", self->_initialMaskViewBounds.origin.x, self->_initialMaskViewBounds.origin.y, self->_initialMaskViewBounds.size.width, self->_initialMaskViewBounds.size.height);
  objc_msgSend(self->_maskView.m_ptr, "setCenter:", self->_initialMaskViewCenter.x, self->_initialMaskViewCenter.y);
  objc_msgSend(self->_animatingView.m_ptr, "setMaskView:", self->_maskView.m_ptr);
  v7 = self->_animatingView.m_ptr;
  v8 = *(_OWORD *)&self->_initialAnimatingViewTransform.c;
  v9[0] = *(_OWORD *)&self->_initialAnimatingViewTransform.a;
  v9[1] = v8;
  v9[2] = *(_OWORD *)&self->_initialAnimatingViewTransform.tx;
  objc_msgSend(v7, "setTransform:", v9);
  objc_msgSend((id)objc_msgSend(a3, "containerView"), "addSubview:", self->_animatingView.m_ptr);
}

- (double)transitionDuration:(id)a3
{
  return 0.2;
}

- (void)configureInitialAndFinalStatesForTransition:(id)a3
{
  void *m_ptr;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  CGRect *p_initialFrame;
  CGSize size;
  CGRect *p_finalFrame;
  CGSize v12;
  void *v13;
  void *v14;
  float v15;
  const FloatRect *v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat MidX;
  CGFloat MidY;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  const FloatRect *v37;
  float v38;
  float v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  _BOOL4 animatingIn;
  CGAffineTransform *v45;
  CGAffineTransform *v46;
  __int128 v47;
  __int128 v48;
  double v49;
  CGAffineTransform v50;
  CGAffineTransform t1;
  CGAffineTransform v52;
  CGAffineTransform v53;
  CGAffineTransform v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  if (a3)
    CFRetain(a3);
  m_ptr = self->_context.m_ptr;
  self->_context.m_ptr = a3;
  if (m_ptr)
    CFRelease(m_ptr);
  v6 = objc_msgSend(a3, "viewForKey:", *MEMORY[0x1E0CEBDB0]);
  v7 = objc_msgSend(a3, "viewForKey:", *MEMORY[0x1E0CEBDC0]);
  v8 = !self->_animatingIn;
  if (self->_animatingIn)
    p_initialFrame = &self->_initialFrame;
  else
    p_initialFrame = &self->_finalFrame;
  size = p_initialFrame->size;
  v56.origin = p_initialFrame->origin;
  v56.size = size;
  if (v8)
    p_finalFrame = &self->_initialFrame;
  else
    p_finalFrame = &self->_finalFrame;
  v12 = p_finalFrame->size;
  v55.origin = p_finalFrame->origin;
  v55.size = v12;
  if (v8)
    v13 = (void *)v6;
  else
    v13 = (void *)v7;
  if (v13)
    CFRetain(v13);
  v14 = self->_animatingView.m_ptr;
  self->_animatingView.m_ptr = v13;
  if (v14)
    CFRelease(v14);
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v53, &v56);
  v15 = *(float *)&v53.b / *((float *)&v53.b + 1);
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v52, &v55);
  WebCore::largestRectWithAspectRatioInsideRect((WebCore *)&v52, v15, v16);
  *(_QWORD *)&v54.a = __PAIR64__(v18, v17);
  *(_QWORD *)&v54.b = __PAIR64__(v20, v19);
  WebCore::FloatRect::operator CGRect();
  v23 = v21;
  v24 = v22;
  v25 = *MEMORY[0x1E0C9D538];
  v26 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v27 = *MEMORY[0x1E0C9D538];
  v28 = v26;
  if (!self->_animatingIn)
    objc_msgSend(self->_animatingView.m_ptr, "bounds", v27, v26);
  self->_initialMaskViewBounds.origin.x = v27;
  self->_initialMaskViewBounds.origin.y = v28;
  self->_initialMaskViewBounds.size.width = v21;
  self->_initialMaskViewBounds.size.height = v22;
  objc_msgSend(self->_animatingView.m_ptr, "bounds");
  MidX = CGRectGetMidX(v57);
  objc_msgSend(self->_animatingView.m_ptr, "bounds");
  MidY = CGRectGetMidY(v58);
  self->_initialMaskViewCenter.x = MidX;
  self->_initialMaskViewCenter.y = MidY;
  if (self->_animatingIn)
  {
    objc_msgSend(self->_animatingView.m_ptr, "bounds");
    v25 = v31;
    v26 = v32;
    v23 = v33;
    v24 = v34;
  }
  self->_finalMaskViewBounds.origin.x = v25;
  self->_finalMaskViewBounds.origin.y = v26;
  self->_finalMaskViewBounds.size.width = v23;
  self->_finalMaskViewBounds.size.height = v24;
  objc_msgSend(self->_animatingView.m_ptr, "bounds");
  v35 = CGRectGetMidX(v59);
  objc_msgSend(self->_animatingView.m_ptr, "bounds");
  v36 = CGRectGetMidY(v60);
  self->_finalMaskViewCenter.x = v35;
  self->_finalMaskViewCenter.y = v36;
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v54, &v55);
  *(float *)&v35 = *(float *)&v54.b / *((float *)&v54.b + 1);
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v53, &v56);
  WebCore::smallestRectWithAspectRatioAroundRect((WebCore *)&v53, *(float *)&v35, v37);
  memset(&v54, 0, sizeof(v54));
  CGAffineTransformMakeScale(&v54, v38 / v55.size.width, v39 / v55.size.height);
  memset(&v53, 0, sizeof(v53));
  v40 = CGRectGetMidX(v56);
  v41 = v40 - CGRectGetMidX(v55);
  v42 = CGRectGetMidY(v56);
  v43 = CGRectGetMidY(v55);
  CGAffineTransformMakeTranslation(&v53, v41, v42 - v43);
  t1 = v54;
  memset(&v52, 0, sizeof(v52));
  v50 = v53;
  CGAffineTransformConcat(&v52, &t1, &v50);
  animatingIn = self->_animatingIn;
  v45 = (CGAffineTransform *)MEMORY[0x1E0C9BAA8];
  if (self->_animatingIn)
    v46 = &v52;
  else
    v46 = (CGAffineTransform *)MEMORY[0x1E0C9BAA8];
  v47 = *(_OWORD *)&v46->c;
  *(_OWORD *)&self->_initialAnimatingViewTransform.a = *(_OWORD *)&v46->a;
  *(_OWORD *)&self->_initialAnimatingViewTransform.c = v47;
  *(_OWORD *)&self->_initialAnimatingViewTransform.tx = *(_OWORD *)&v46->tx;
  if (!animatingIn)
    v45 = &v52;
  v48 = *(_OWORD *)&v45->c;
  *(_OWORD *)&self->_finalAnimatingViewTransform.a = *(_OWORD *)&v45->a;
  *(_OWORD *)&self->_finalAnimatingViewTransform.c = v48;
  *(_OWORD *)&self->_finalAnimatingViewTransform.tx = *(_OWORD *)&v45->tx;
  v49 = 0.0;
  if (!animatingIn)
    v49 = 1.0;
  self->_initialBackgroundAlpha = v49;
  self->_finalBackgroundAlpha = (double)animatingIn;
}

- (void)animateTransition:(id)a3
{
  void *v5;
  _QWORD v6[6];
  _QWORD v7[5];

  -[WKFullscreenAnimationController configureInitialAndFinalStatesForTransition:](self, "configureInitialAndFinalStatesForTransition:");
  -[WKFullscreenAnimationController _createViewsForTransitionContext:](self, "_createViewsForTransitionContext:", a3);
  v5 = (void *)objc_msgSend((id)objc_msgSend(a3, "containerView"), "window");
  objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, self->_initialBackgroundAlpha));
  v6[5] = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__WKFullscreenAnimationController_animateTransition___block_invoke;
  v7[3] = &unk_1E34BAF80;
  v7[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__WKFullscreenAnimationController_animateTransition___block_invoke_2;
  v6[3] = &unk_1E34CF218;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v7, v6, 0.2, 0.0);
}

uint64_t __53__WKFullscreenAnimationController_animateTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateWithProgress:", 1.0);
}

uint64_t __53__WKFullscreenAnimationController_animateTransition___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "animationEnded:", objc_msgSend(*(id *)(a1 + 40), "transitionWasCancelled") ^ 1);
  return objc_msgSend(*(id *)(a1 + 40), "completeTransition:", objc_msgSend(*(id *)(a1 + 40), "transitionWasCancelled") ^ 1);
}

- (void)animationEnded:(BOOL)a3
{
  _BOOL4 v3;
  void *m_ptr;
  void *v6;

  v3 = a3;
  if (-[WKFullscreenAnimationController isAnimatingIn](self, "isAnimatingIn") && !v3
    || !-[WKFullscreenAnimationController isAnimatingIn](self, "isAnimatingIn") && v3)
  {
    objc_msgSend(self->_animatingView.m_ptr, "removeFromSuperview");
  }
  objc_msgSend(self->_animatingView.m_ptr, "setMaskView:", 0);
  m_ptr = self->_maskView.m_ptr;
  self->_maskView.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v6 = self->_animatingView.m_ptr;
  self->_animatingView.m_ptr = 0;
  if (v6)
    CFRelease(v6);
}

- (void)startInteractiveTransition:(id)a3
{
  -[WKFullscreenAnimationController configureInitialAndFinalStatesForTransition:](self, "configureInitialAndFinalStatesForTransition:");
  -[WKFullscreenAnimationController _createViewsForTransitionContext:](self, "_createViewsForTransitionContext:", a3);
}

- (void)updateWithProgress:(double)a3
{
  float64x2_t v4;
  float64x2_t v5;
  void *m_ptr;
  void *v7;
  _OWORD v9[3];

  v4 = vmlaq_n_f64(*(float64x2_t *)&self->_initialAnimatingViewTransform.a, vsubq_f64(*(float64x2_t *)&self->_finalAnimatingViewTransform.a, *(float64x2_t *)&self->_initialAnimatingViewTransform.a), a3);
  v5 = vmlaq_n_f64(*(float64x2_t *)&self->_initialAnimatingViewTransform.c, vsubq_f64(*(float64x2_t *)&self->_finalAnimatingViewTransform.c, *(float64x2_t *)&self->_initialAnimatingViewTransform.c), a3);
  m_ptr = self->_animatingView.m_ptr;
  v9[0] = v4;
  v9[1] = v5;
  v9[2] = vmlaq_n_f64(*(float64x2_t *)&self->_initialAnimatingViewTransform.tx, vsubq_f64(*(float64x2_t *)&self->_finalAnimatingViewTransform.tx, *(float64x2_t *)&self->_initialAnimatingViewTransform.tx), a3);
  objc_msgSend(m_ptr, "setTransform:", v9);
  objc_msgSend(self->_maskView.m_ptr, "setBounds:", self->_initialMaskViewBounds.origin.x+ a3 * (self->_finalMaskViewBounds.origin.x - self->_initialMaskViewBounds.origin.x), self->_initialMaskViewBounds.origin.y+ a3 * (self->_finalMaskViewBounds.origin.y - self->_initialMaskViewBounds.origin.y), self->_initialMaskViewBounds.size.width+ a3 * (self->_finalMaskViewBounds.size.width - self->_initialMaskViewBounds.size.width), self->_initialMaskViewBounds.size.height+ a3 * (self->_finalMaskViewBounds.size.height - self->_initialMaskViewBounds.size.height));
  objc_msgSend(self->_maskView.m_ptr, "setCenter:", self->_initialMaskViewCenter.x + a3 * (self->_finalMaskViewCenter.x - self->_finalMaskViewCenter.x), self->_initialMaskViewCenter.y + a3 * (self->_finalMaskViewCenter.y - self->_finalMaskViewCenter.y));
  v7 = (void *)objc_msgSend(self->_animatingView.m_ptr, "window");
  objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, self->_initialBackgroundAlpha + a3 * (self->_finalBackgroundAlpha - self->_initialBackgroundAlpha)));
}

- (void)updateWithProgress:(double)a3 scale:(double)a4 translation:(CGSize)a5 anchor:(CGPoint)a6
{
  CGFloat height;
  CGFloat width;
  __int128 v10;
  void *m_ptr;
  void *v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;

  height = a5.height;
  width = a5.width;
  v10 = *(_OWORD *)&self->_initialAnimatingViewTransform.c;
  *(_OWORD *)&v17.a = *(_OWORD *)&self->_initialAnimatingViewTransform.a;
  *(_OWORD *)&v17.c = v10;
  *(_OWORD *)&v17.tx = *(_OWORD *)&self->_initialAnimatingViewTransform.tx;
  *(_OWORD *)&v16.a = *(_OWORD *)&v17.a;
  *(_OWORD *)&v16.c = v10;
  *(_OWORD *)&v16.tx = *(_OWORD *)&v17.tx;
  CGAffineTransformScale(&v17, &v16, a4, a4);
  v14 = v17;
  CGAffineTransformTranslate(&v15, &v14, width, height);
  v17 = v15;
  m_ptr = self->_animatingView.m_ptr;
  v13 = v15;
  objc_msgSend(m_ptr, "setTransform:", &v13);
  v12 = (void *)objc_msgSend(self->_animatingView.m_ptr, "window");
  objc_msgSend(v12, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, self->_initialBackgroundAlpha + a3 * (self->_finalBackgroundAlpha - self->_initialBackgroundAlpha)));
}

- (void)updateWithProgress:(double)a3 translation:(CGSize)a4 anchor:(CGPoint)a5
{
  float64x2_t v6;
  float64x2_t v7;
  void *m_ptr;
  CGFloat height;
  float64x2_t v10;
  void *v11;
  _OWORD v13[3];

  v6 = vmlaq_n_f64(*(float64x2_t *)&self->_initialAnimatingViewTransform.a, vsubq_f64(*(float64x2_t *)&self->_finalAnimatingViewTransform.a, *(float64x2_t *)&self->_initialAnimatingViewTransform.a), a3);
  v7 = vmlaq_n_f64(*(float64x2_t *)&self->_initialAnimatingViewTransform.c, vsubq_f64(*(float64x2_t *)&self->_finalAnimatingViewTransform.c, *(float64x2_t *)&self->_initialAnimatingViewTransform.c), a3);
  m_ptr = self->_animatingView.m_ptr;
  v13[0] = v6;
  height = a4.height;
  v10 = vaddq_f64(*(float64x2_t *)&self->_initialAnimatingViewTransform.tx, vaddq_f64((float64x2_t)a4, *(float64x2_t *)&self->_initialAnimatingViewTransform.tx));
  v13[1] = v7;
  v13[2] = v10;
  objc_msgSend(m_ptr, "setTransform:", v13);
  v11 = (void *)objc_msgSend(self->_animatingView.m_ptr, "window");
  objc_msgSend(v11, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, self->_initialBackgroundAlpha + a3 * (self->_finalBackgroundAlpha - self->_initialBackgroundAlpha)));
}

- (void)end:(BOOL)a3
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  WKFullscreenAnimationController *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  WKFullscreenAnimationController *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  WKFullscreenAnimationController *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  WKFullscreenAnimationController *v24;

  if (a3)
  {
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __39__WKFullscreenAnimationController_end___block_invoke;
    v23 = &unk_1E34BAF80;
    v24 = self;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __39__WKFullscreenAnimationController_end___block_invoke_2;
    v18 = &unk_1E34CF1C8;
    v19 = self;
    v3 = &v20;
    v4 = &v15;
  }
  else
  {
    v9 = self;
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __39__WKFullscreenAnimationController_end___block_invoke_3;
    v13 = &unk_1E34BAF80;
    v14 = self;
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __39__WKFullscreenAnimationController_end___block_invoke_4;
    v8 = &unk_1E34CF1C8;
    v3 = &v10;
    v4 = &v5;
  }
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v3, v4, 0.2, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18,
    v19,
    v20,
    v21,
    v22,
    v23,
    v24);
}

uint64_t __39__WKFullscreenAnimationController_end___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateWithProgress:", 0.0);
}

uint64_t __39__WKFullscreenAnimationController_end___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "cancelInteractiveTransition");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "completeTransition:", 0);
}

uint64_t __39__WKFullscreenAnimationController_end___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateWithProgress:", 1.0);
}

uint64_t __39__WKFullscreenAnimationController_end___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "finishInteractiveTransition");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "completeTransition:", 1);
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 248);
}

- (CGRect)initialFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_initialFrame.origin.x;
  y = self->_initialFrame.origin.y;
  width = self->_initialFrame.size.width;
  height = self->_initialFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInitialFrame:(CGRect)a3
{
  self->_initialFrame = a3;
}

- (CGRect)finalFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_finalFrame.origin.x;
  y = self->_finalFrame.origin.y;
  width = self->_finalFrame.size.width;
  height = self->_finalFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFinalFrame:(CGRect)a3
{
  self->_finalFrame = a3;
}

- (BOOL)isAnimatingIn
{
  return self->_animatingIn;
}

- (void)setAnimatingIn:(BOOL)a3
{
  self->_animatingIn = a3;
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *v5;

  m_ptr = self->_context.m_ptr;
  self->_context.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_animatingView.m_ptr;
  self->_animatingView.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->_maskView.m_ptr;
  self->_maskView.m_ptr = 0;
  if (v5)
    CFRelease(v5);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 25) = 0;
  *((_QWORD *)self + 26) = 0;
  *((_QWORD *)self + 27) = 0;
  return self;
}

@end
