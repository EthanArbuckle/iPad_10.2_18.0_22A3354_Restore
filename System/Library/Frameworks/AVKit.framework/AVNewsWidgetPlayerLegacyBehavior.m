@implementation AVNewsWidgetPlayerLegacyBehavior

- (id)playerForContentTransitionType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[AVNewsWidgetPlayerLegacyBehavior legacyDelegate](self, "legacyDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVNewsWidgetPlayerBehavior behaviorContext](self, "behaviorContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playerViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerViewController:playerForContentTransitionType:", v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)willBeginContentTransition
{
  void *v3;
  void *v4;
  id v5;

  -[AVNewsWidgetPlayerLegacyBehavior legacyDelegate](self, "legacyDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AVNewsWidgetPlayerBehavior behaviorContext](self, "behaviorContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerViewControllerWillBeginContentTransition:", v4);

}

- (void)didUpdateContentTransitionProgress:(double)a3
{
  void *v5;
  void *v6;
  id v7;

  -[AVNewsWidgetPlayerLegacyBehavior legacyDelegate](self, "legacyDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AVNewsWidgetPlayerBehavior behaviorContext](self, "behaviorContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playerViewController:didUpdateContentTransitionProgress:", v6, a3);

}

- (void)willCompleteContentTransition
{
  void *v3;
  void *v4;
  id v5;

  -[AVNewsWidgetPlayerLegacyBehavior legacyDelegate](self, "legacyDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AVNewsWidgetPlayerBehavior behaviorContext](self, "behaviorContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerViewControllerWillCompleteContentTransition:", v4);

}

- (void)didCompleteContentTransition
{
  void *v3;
  void *v4;
  id v5;

  -[AVNewsWidgetPlayerLegacyBehavior legacyDelegate](self, "legacyDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AVNewsWidgetPlayerBehavior behaviorContext](self, "behaviorContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerViewControllerDidCompleteContentTransition:", v4);

}

- (void)willCancelContentTransition
{
  void *v3;
  void *v4;
  id v5;

  -[AVNewsWidgetPlayerLegacyBehavior legacyDelegate](self, "legacyDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AVNewsWidgetPlayerBehavior behaviorContext](self, "behaviorContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerViewControllerWillCancelContentTransition:", v4);

}

- (void)didCancelContentTransition
{
  void *v3;
  void *v4;
  id v5;

  -[AVNewsWidgetPlayerLegacyBehavior legacyDelegate](self, "legacyDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AVNewsWidgetPlayerBehavior behaviorContext](self, "behaviorContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerViewControllerDidCancelContentTransition:", v4);

}

- (AVPlayerViewControllerContentTransitioning_NewsOnly)legacyDelegate
{
  return (AVPlayerViewControllerContentTransitioning_NewsOnly *)objc_loadWeakRetained((id *)&self->_legacyDelegate);
}

- (void)setLegacyDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_legacyDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_legacyDelegate);
}

@end
