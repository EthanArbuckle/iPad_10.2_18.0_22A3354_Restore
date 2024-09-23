@implementation CPLDerivativesGenerationStatistics

- (CPLDerivativesGenerationStatistics)initWithSourceResource:(id)a3
{
  id v5;
  CPLDerivativesGenerationStatistics *v6;
  CPLDerivativesGenerationStatistics *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLDerivativesGenerationStatistics;
  v6 = -[CPLDerivativesGenerationStatistics init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sourceResource, a3);
    v7->_startTime = CFAbsoluteTimeGetCurrent();
  }

  return v7;
}

- (void)didEndGeneratingDerivatives
{
  double startTime;
  CFAbsoluteTime Current;

  startTime = self->_startTime;
  Current = CFAbsoluteTimeGetCurrent();
  if (startTime >= Current)
    Current = startTime;
  self->_endTime = Current;
}

- (double)generationDuration
{
  return self->_endTime - self->_startTime;
}

- (CPLResource)sourceResource
{
  return self->_sourceResource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceResource, 0);
}

@end
