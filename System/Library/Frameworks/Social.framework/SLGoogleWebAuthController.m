@implementation SLGoogleWebAuthController

- (SLGoogleWebAuthController)initWithAccountDescription:(id)a3 presentationBlock:(id)a4
{
  -[SLGoogleWebAuthController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);

  return 0;
}

- (SLGoogleWebAuthController)initWithAccount:(id)a3 accountStore:(id)a4 presentationBlock:(id)a5
{
  -[SLGoogleWebAuthController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);

  return 0;
}

- (SLGoogleWebAuthController)initWithYouTubeUsername:(id)a3 accountDescription:(id)a4 presentationBlock:(id)a5
{
  -[SLGoogleWebAuthController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);

  return 0;
}

- (SLGoogleWebAuthController)initWithNibName:(id)a3 bundle:(id)a4
{
  -[SLGoogleWebAuthController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);

  return 0;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
}

@end
