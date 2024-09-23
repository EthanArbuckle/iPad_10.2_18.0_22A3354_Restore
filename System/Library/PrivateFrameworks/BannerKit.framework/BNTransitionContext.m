@implementation BNTransitionContext

+ (id)transitionContextForTransitionFromViewController:(id)a3 toViewController:(id)a4 inContainerView:(id)a5
{
  id v8;
  id v9;
  id v10;
  id *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id *)objc_alloc_init((Class)a1);
  v12 = v11[1];
  objc_msgSend(v12, "_setContainerView:", v8);

  objc_msgSend(v12, "_setFromViewController:", v10);
  objc_msgSend(v12, "_setToViewController:", v9);

  return v11;
}

+ (id)transitionContextForTransitionOfViewController:(id)a3 fromFrame:(CGRect)a4 toFrame:(CGRect)a5 inContainerView:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  id v16;
  id v17;
  id *v18;
  id v19;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a4.size.height;
  v11 = a4.size.width;
  v12 = a4.origin.y;
  v13 = a4.origin.x;
  v16 = a6;
  v17 = a3;
  v18 = (id *)objc_alloc_init((Class)a1);
  v19 = v18[1];
  objc_msgSend(v19, "_setContainerView:", v16);

  objc_msgSend(v19, "_setToViewController:", v17);
  objc_msgSend(v19, "_setToStartFrame:", v13, v12, v11, v10);
  objc_msgSend(v19, "_setToEndFrame:", x, y, width, height);

  return v18;
}

- (BNTransitionContext)init
{
  BNTransitionContext *v2;
  _UIViewControllerOneToOneTransitionContext *v3;
  _UIViewControllerOneToOneTransitionContext *transitionContext;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BNTransitionContext;
  v2 = -[BNTransitionContext init](&v6, sel_init);
  if (v2)
  {
    v3 = (_UIViewControllerOneToOneTransitionContext *)objc_alloc_init(MEMORY[0x1E0CEAF50]);
    transitionContext = v2->_transitionContext;
    v2->_transitionContext = v3;

  }
  return v2;
}

- (void)setAnimated:(BOOL)a3
{
  -[_UIViewControllerOneToOneTransitionContext _setIsAnimated:](self->_transitionContext, "_setIsAnimated:", a3);
}

- (UIViewControllerTransitionCoordinator)transitionCoordinator
{
  return (UIViewControllerTransitionCoordinator *)-[_UIViewControllerOneToOneTransitionContext _transitionCoordinator](self->_transitionContext, "_transitionCoordinator");
}

- (CGRect)fromStartFrame
{
  _UIViewControllerOneToOneTransitionContext *transitionContext;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  transitionContext = self->_transitionContext;
  -[_UIViewControllerOneToOneTransitionContext fromViewController](transitionContext, "fromViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIViewControllerOneToOneTransitionContext initialFrameForViewController:](transitionContext, "initialFrameForViewController:", v3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)setFromStartFrame:(CGRect)a3
{
  -[_UIViewControllerOneToOneTransitionContext _setFromStartFrame:](self->_transitionContext, "_setFromStartFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGRect)fromEndFrame
{
  _UIViewControllerOneToOneTransitionContext *transitionContext;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  transitionContext = self->_transitionContext;
  -[_UIViewControllerOneToOneTransitionContext fromViewController](transitionContext, "fromViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIViewControllerOneToOneTransitionContext finalFrameForViewController:](transitionContext, "finalFrameForViewController:", v3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)setFromEndFrame:(CGRect)a3
{
  -[_UIViewControllerOneToOneTransitionContext _setFromEndFrame:](self->_transitionContext, "_setFromEndFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGRect)toEndFrame
{
  _UIViewControllerOneToOneTransitionContext *transitionContext;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  transitionContext = self->_transitionContext;
  -[_UIViewControllerOneToOneTransitionContext toViewController](transitionContext, "toViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIViewControllerOneToOneTransitionContext finalFrameForViewController:](transitionContext, "finalFrameForViewController:", v3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)setToEndFrame:(CGRect)a3
{
  -[_UIViewControllerOneToOneTransitionContext _setToEndFrame:](self->_transitionContext, "_setToEndFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGRect)toStartFrame
{
  _UIViewControllerOneToOneTransitionContext *transitionContext;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  transitionContext = self->_transitionContext;
  -[_UIViewControllerOneToOneTransitionContext toViewController](transitionContext, "toViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIViewControllerOneToOneTransitionContext initialFrameForViewController:](transitionContext, "initialFrameForViewController:", v3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)setToStartFrame:(CGRect)a3
{
  -[_UIViewControllerOneToOneTransitionContext _setToStartFrame:](self->_transitionContext, "_setToStartFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)performTransitionWithAnimator:(id)a3
{
  id v4;
  _UIViewControllerOneToOneTransitionContext *transitionContext;
  id v6;

  v4 = a3;
  transitionContext = self->_transitionContext;
  v6 = v4;
  if (v4)
  {
    -[_UIViewControllerOneToOneTransitionContext _setAnimator:](transitionContext, "_setAnimator:", v4);
    objc_msgSend(v6, "animateTransition:", self);
  }
  else
  {
    -[_UIViewControllerOneToOneTransitionContext __runAlongsideAnimations](transitionContext, "__runAlongsideAnimations");
    -[BNTransitionContext completeTransition:](self, "completeTransition:", 1);
  }

}

- (void)explictlyCompleteTransition:(BOOL)a3
{
  self->_complete = 1;
  -[_UIViewControllerOneToOneTransitionContext completeTransition:](self->_transitionContext, "completeTransition:", a3);
}

- (BOOL)isAnimated
{
  return -[_UIViewControllerOneToOneTransitionContext isAnimated](self->_transitionContext, "isAnimated");
}

- (UIView)containerView
{
  return (UIView *)-[_UIViewControllerOneToOneTransitionContext containerView](self->_transitionContext, "containerView");
}

- (BOOL)isInteractive
{
  return -[_UIViewControllerOneToOneTransitionContext isInteractive](self->_transitionContext, "isInteractive");
}

- (BOOL)transitionWasCancelled
{
  return -[_UIViewControllerOneToOneTransitionContext transitionWasCancelled](self->_transitionContext, "transitionWasCancelled");
}

- (int64_t)presentationStyle
{
  return -[_UIViewControllerOneToOneTransitionContext presentationStyle](self->_transitionContext, "presentationStyle");
}

- (void)updateInteractiveTransition:(double)a3
{
  -[_UIViewControllerOneToOneTransitionContext updateInteractiveTransition:](self->_transitionContext, "updateInteractiveTransition:", a3);
}

- (void)finishInteractiveTransition
{
  -[_UIViewControllerOneToOneTransitionContext finishInteractiveTransition](self->_transitionContext, "finishInteractiveTransition");
}

- (void)cancelInteractiveTransition
{
  -[_UIViewControllerOneToOneTransitionContext cancelInteractiveTransition](self->_transitionContext, "cancelInteractiveTransition");
}

- (void)pauseInteractiveTransition
{
  -[_UIViewControllerOneToOneTransitionContext pauseInteractiveTransition](self->_transitionContext, "pauseInteractiveTransition");
}

- (void)completeTransition:(BOOL)a3
{
  if (!self->_explicitCompletionRequired)
    -[BNTransitionContext explictlyCompleteTransition:](self, "explictlyCompleteTransition:", a3);
}

- (id)viewControllerForKey:(id)a3
{
  return (id)-[_UIViewControllerOneToOneTransitionContext viewControllerForKey:](self->_transitionContext, "viewControllerForKey:", a3);
}

- (id)viewForKey:(id)a3
{
  return (id)-[_UIViewControllerOneToOneTransitionContext viewForKey:](self->_transitionContext, "viewForKey:", a3);
}

- (CGAffineTransform)targetTransform
{
  CGAffineTransform *result;

  result = (CGAffineTransform *)self->_transitionContext;
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform targetTransform](result, "targetTransform");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (CGRect)initialFrameForViewController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[_UIViewControllerOneToOneTransitionContext initialFrameForViewController:](self->_transitionContext, "initialFrameForViewController:", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)finalFrameForViewController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[_UIViewControllerOneToOneTransitionContext finalFrameForViewController:](self->_transitionContext, "finalFrameForViewController:", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)__runAlongsideAnimations
{
  -[_UIViewControllerOneToOneTransitionContext __runAlongsideAnimations](self->_transitionContext, "__runAlongsideAnimations");
}

- (NSString)revocationReason
{
  return self->_revocationReason;
}

- (void)setRevocationReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isExplicitCompletionRequired
{
  return self->_explicitCompletionRequired;
}

- (void)setExplicitCompletionRequired:(BOOL)a3
{
  self->_explicitCompletionRequired = a3;
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revocationReason, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

@end
