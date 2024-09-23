@implementation SRCardStackNavigationTransitionContext

- (SRCardStackNavigationTransitionContext)initWithCompletion:(id)a3
{
  id v4;
  SRCardStackNavigationTransitionContext *v5;
  id v6;
  id completion;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SRCardStackNavigationTransitionContext;
  v5 = -[SRCardStackNavigationTransitionContext init](&v9, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    completion = v5->_completion;
    v5->_completion = v6;

  }
  return v5;
}

- (SRCardStackNavigationTransitionContext)init
{
  return -[SRCardStackNavigationTransitionContext initWithCompletion:](self, "initWithCompletion:", &stru_100123D30);
}

- (int64_t)semanticContentAttribute
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionContext toPlatteredCardView](self, "toPlatteredCardView"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionContext toPlatteredCardView](self, "toPlatteredCardView"));
    v5 = objc_msgSend(v4, "semanticContentAttribute");

  }
  else
  {
    v5 = 0;
  }

  return (int64_t)v5;
}

- (void)completeTransition:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;

  v3 = a3;
  if (-[SRCardStackNavigationTransitionContext _isCompleted](self, "_isCompleted"))
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_FAULT))
      sub_1000A0304(v5);
  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionContext _completion](self, "_completion"));
    v7 = (void *)v6;
    if (v6)
    {
      (*(void (**)(uint64_t, _BOOL8))(v6 + 16))(v6, v3);
    }
    else
    {
      v8 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v9 = 136315138;
        v10 = "-[SRCardStackNavigationTransitionContext completeTransition:]";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s No completion block was provided for execution, so just marking the transaction as complete and returning", (uint8_t *)&v9, 0xCu);
      }
    }
    -[SRCardStackNavigationTransitionContext _setCompleted:](self, "_setCompleted:", 1);
    -[SRCardStackNavigationTransitionContext _setCompletion:](self, "_setCompletion:", 0);

  }
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (void)setPercentComplete:(double)a3
{
  self->_percentComplete = a3;
}

- (CGRect)backgroundPlatteredCardViewOriginalFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_backgroundPlatteredCardViewOriginalFrame.origin.x;
  y = self->_backgroundPlatteredCardViewOriginalFrame.origin.y;
  width = self->_backgroundPlatteredCardViewOriginalFrame.size.width;
  height = self->_backgroundPlatteredCardViewOriginalFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBackgroundPlatteredCardViewOriginalFrame:(CGRect)a3
{
  self->_backgroundPlatteredCardViewOriginalFrame = a3;
}

- (SiriSharedUIDarkening)backgroundPlatteredCardView
{
  return self->_backgroundPlatteredCardView;
}

- (void)setBackgroundPlatteredCardView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundPlatteredCardView, a3);
}

- (CGRect)fromPlatteredCardViewOriginalFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_fromPlatteredCardViewOriginalFrame.origin.x;
  y = self->_fromPlatteredCardViewOriginalFrame.origin.y;
  width = self->_fromPlatteredCardViewOriginalFrame.size.width;
  height = self->_fromPlatteredCardViewOriginalFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFromPlatteredCardViewOriginalFrame:(CGRect)a3
{
  self->_fromPlatteredCardViewOriginalFrame = a3;
}

- (SiriSharedUIDarkening)fromPlatteredCardView
{
  return self->_fromPlatteredCardView;
}

- (void)setFromPlatteredCardView:(id)a3
{
  objc_storeStrong((id *)&self->_fromPlatteredCardView, a3);
}

- (SiriSharedUIDarkening)toPlatteredCardView
{
  return self->_toPlatteredCardView;
}

- (void)setToPlatteredCardView:(id)a3
{
  objc_storeStrong((id *)&self->_toPlatteredCardView, a3);
}

- (double)transitionDuration
{
  return self->_transitionDuration;
}

- (void)setTransitionDuration:(double)a3
{
  self->_transitionDuration = a3;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (id)_completion
{
  return self->_completion;
}

- (void)_setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)_isCompleted
{
  return self->_completed;
}

- (void)_setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_toPlatteredCardView, 0);
  objc_storeStrong((id *)&self->_fromPlatteredCardView, 0);
  objc_storeStrong((id *)&self->_backgroundPlatteredCardView, 0);
}

@end
