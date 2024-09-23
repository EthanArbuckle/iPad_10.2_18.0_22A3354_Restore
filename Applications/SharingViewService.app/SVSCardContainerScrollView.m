@implementation SVSCardContainerScrollView

- (SVSCardContainerScrollView)initWithGestureRecognizerEvaluator:(id)a3
{
  id v4;
  SVSCardContainerScrollView *v5;
  id v6;
  id recognizerEvaluator;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVSCardContainerScrollView;
  v5 = -[SVSCardContainerScrollView init](&v9, "init");
  if (v5)
  {
    v6 = objc_retainBlock(v4);
    recognizerEvaluator = v5->_recognizerEvaluator;
    v5->_recognizerEvaluator = v6;

  }
  return v5;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  unsigned __int8 v6;
  uint64_t (**v7)(_QWORD, _QWORD);
  objc_super v9;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SVSCardContainerScrollView panGestureRecognizer](self, "panGestureRecognizer"));

  if (v5 == v4)
  {
    v7 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[SVSCardContainerScrollView recognizerEvaluator](self, "recognizerEvaluator"));
    v6 = ((uint64_t (**)(_QWORD, id))v7)[2](v7, v4);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SVSCardContainerScrollView;
    v6 = -[SVSCardContainerScrollView gestureRecognizerShouldBegin:](&v9, "gestureRecognizerShouldBegin:", v4);
  }

  return v6;
}

- (id)recognizerEvaluator
{
  return self->_recognizerEvaluator;
}

- (void)setRecognizerEvaluator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_recognizerEvaluator, 0);
}

@end
