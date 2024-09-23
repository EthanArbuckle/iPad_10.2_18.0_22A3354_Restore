@implementation TVLatencyColorimeterSetupBaseViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (TVLatencyColorimeterSetupMainController)mainController
{
  return self->_mainController;
}

- (void)setMainController:(id)a3
{
  objc_storeStrong((id *)&self->_mainController, a3);
}

- (UIView)animationContainerView
{
  return self->_animationContainerView;
}

- (void)setAnimationContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_animationContainerView, a3);
}

- (TVLatencyColorimeterTrainingView)trainingView
{
  return self->_trainingView;
}

- (void)setTrainingView:(id)a3
{
  objc_storeStrong((id *)&self->_trainingView, a3);
}

- (UIImageView)statusImageViewIcon
{
  return self->_statusImageViewIcon;
}

- (void)setStatusImageViewIcon:(id)a3
{
  objc_storeStrong((id *)&self->_statusImageViewIcon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainController, 0);
  objc_storeStrong((id *)&self->_statusImageViewIcon, 0);
  objc_storeStrong((id *)&self->_trainingView, 0);
  objc_storeStrong((id *)&self->_animationContainerView, 0);
}

@end
