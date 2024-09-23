@implementation ASVGestureFeedbackGenerator

- (ASVGestureFeedbackGenerator)initWithSnapToGenerator:(id)a3 snapAwayFromGenerator:(id)a4
{
  id v7;
  id v8;
  ASVGestureFeedbackGenerator *v9;
  ASVGestureFeedbackGenerator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASVGestureFeedbackGenerator;
  v9 = -[ASVGestureFeedbackGenerator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_snapToScaleFeedbackGenerator, a3);
    objc_storeStrong((id *)&v10->_snapAwayFromScaleFeedbackGenerator, a4);
  }

  return v10;
}

- (void)prepare
{
  void *v3;
  id v4;

  -[ASVGestureFeedbackGenerator snapToScaleFeedbackGenerator](self, "snapToScaleFeedbackGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepare");

  -[ASVGestureFeedbackGenerator snapAwayFromScaleFeedbackGenerator](self, "snapAwayFromScaleFeedbackGenerator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepare");

}

- (ASVFeedbackGenerator)snapToScaleFeedbackGenerator
{
  return self->_snapToScaleFeedbackGenerator;
}

- (void)setSnapToScaleFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_snapToScaleFeedbackGenerator, a3);
}

- (ASVFeedbackGenerator)snapAwayFromScaleFeedbackGenerator
{
  return self->_snapAwayFromScaleFeedbackGenerator;
}

- (void)setSnapAwayFromScaleFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_snapAwayFromScaleFeedbackGenerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapAwayFromScaleFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_snapToScaleFeedbackGenerator, 0);
}

@end
