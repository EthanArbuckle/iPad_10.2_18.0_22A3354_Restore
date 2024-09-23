@implementation PHASEDistanceModelParameters

- (PHASEDistanceModelParameters)init
{
  -[PHASEDistanceModelParameters doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEDistanceModelParameters)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)initInternal
{
  PHASEDistanceModelParameters *v2;
  PHASEDistanceModelParameters *v3;
  PHASEDistanceModelFadeOutParameters *fadeOutParameters;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHASEDistanceModelParameters;
  v2 = -[PHASEDistanceModelParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    fadeOutParameters = v2->_fadeOutParameters;
    v2->_fadeOutParameters = 0;

  }
  return v3;
}

- (PHASEDistanceModelFadeOutParameters)fadeOutParameters
{
  return self->_fadeOutParameters;
}

- (void)setFadeOutParameters:(PHASEDistanceModelFadeOutParameters *)fadeOutParameters
{
  objc_storeStrong((id *)&self->_fadeOutParameters, fadeOutParameters);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fadeOutParameters, 0);
}

@end
