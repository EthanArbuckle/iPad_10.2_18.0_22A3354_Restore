@implementation EMKGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  objc_msgSend(a3, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "touchHasEmojiSignificance:", v5);

  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceivePress:(id)a4
{
  return 0;
}

@end
