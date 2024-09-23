@implementation ASVHitTestDecision

- (ASVHitTestDecision)initWithOriginalResult:(id)a3 interpolatedResult:(id)a4 finalResult:(id)a5
{
  id v9;
  id v10;
  id v11;
  ASVHitTestDecision *v12;
  ASVHitTestDecision *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ASVHitTestDecision;
  v12 = -[ASVHitTestDecision init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_originalResult, a3);
    objc_storeStrong((id *)&v13->_interpolatedResult, a4);
    objc_storeStrong((id *)&v13->_finalResult, a5);
  }

  return v13;
}

- (ASVHitTestResult)interpolatedOrFinalResult
{
  ASVHitTestResult *interpolatedResult;

  interpolatedResult = self->_interpolatedResult;
  if (!interpolatedResult)
    interpolatedResult = self->_finalResult;
  return interpolatedResult;
}

- (ASVRealHitTestResult)originalResult
{
  return self->_originalResult;
}

- (void)setOriginalResult:(id)a3
{
  objc_storeStrong((id *)&self->_originalResult, a3);
}

- (ASVHitTestResult)interpolatedResult
{
  return self->_interpolatedResult;
}

- (void)setInterpolatedResult:(id)a3
{
  objc_storeStrong((id *)&self->_interpolatedResult, a3);
}

- (ASVHitTestResult)finalResult
{
  return self->_finalResult;
}

- (void)setFinalResult:(id)a3
{
  objc_storeStrong((id *)&self->_finalResult, a3);
}

- (void)setInterpolatedOrFinalResult:(id)a3
{
  objc_storeStrong((id *)&self->_interpolatedOrFinalResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interpolatedOrFinalResult, 0);
  objc_storeStrong((id *)&self->_finalResult, 0);
  objc_storeStrong((id *)&self->_interpolatedResult, 0);
  objc_storeStrong((id *)&self->_originalResult, 0);
}

@end
