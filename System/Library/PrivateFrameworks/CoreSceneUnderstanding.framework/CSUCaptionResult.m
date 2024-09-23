@implementation CSUCaptionResult

- (CSUCaptionResult)initWithCaption:(id)a3 score:(float)a4
{
  id v7;
  CSUCaptionResult *v8;
  CSUCaptionResult *v9;
  CSUCaptionResult *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSUCaptionResult;
  v8 = -[CSUCaptionResult init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_score = a4;
    objc_storeStrong((id *)&v8->_caption, a3);
    v10 = v9;
  }

  return v9;
}

- (float)score
{
  return self->_score;
}

- (NSString)caption
{
  return self->_caption;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caption, 0);
}

@end
