@implementation CMISharpnessScoreResult

- (CMISharpnessScoreResult)initWithFullImageScore:(float)a3 facesScore:(id)a4
{
  id v7;
  CMISharpnessScoreResult *v8;
  CMISharpnessScoreResult *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CMISharpnessScoreResult;
  v8 = -[CMISharpnessScoreResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_fullImageScore = a3;
    objc_storeStrong((id *)&v8->_facesScores, a4);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }

  return v9;
}

- (float)fullImageScore
{
  return self->_fullImageScore;
}

- (NSArray)facesScores
{
  return self->_facesScores;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_facesScores, 0);
}

@end
