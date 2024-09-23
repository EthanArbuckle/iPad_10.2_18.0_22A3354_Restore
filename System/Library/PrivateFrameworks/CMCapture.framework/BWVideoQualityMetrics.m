@implementation BWVideoQualityMetrics

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    vqm_luxThreshold = 0x4062C00000000000;
    vqm_luxTransition = 0x4072C00000000000;
  }
}

+ (id)filterMetadata:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v5 = *MEMORY[0x1E0D06C40];
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D06C40]);
  if (v6)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);
  return v4;
}

+ (double)_luxThreshold
{
  return *(double *)&vqm_luxThreshold;
}

+ (double)_luxTransition
{
  return *(double *)&vqm_luxTransition;
}

- (void)reset
{
  self->_totalLux = 0;
  self->_frames = 0;
}

- (void)processMetadata:(id)a3
{
  self->_totalLux += (int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D06C40]), "intValue");
  ++self->_frames;
}

- (double)_computeLuxScore
{
  double result;
  double v3;
  _BOOL4 v4;

  result = ((double)self->_totalLux / (double)self->_frames
          - (*(double *)&vqm_luxThreshold
           + *(double *)&vqm_luxTransition * -0.5))
         / *(double *)&vqm_luxTransition;
  v3 = 1.0;
  v4 = result > 1.0 || result < 0.0;
  if (result < 0.0 && result <= 1.0)
    v3 = 0.0;
  if (v4)
    return v3;
  return result;
}

- (double)computeQualityScore
{
  double result;

  if (!self->_frames)
    return 1.0;
  -[BWVideoQualityMetrics _computeLuxScore](self, "_computeLuxScore");
  return result;
}

- (unsigned)qualityScoringVersion
{
  return 1;
}

@end
