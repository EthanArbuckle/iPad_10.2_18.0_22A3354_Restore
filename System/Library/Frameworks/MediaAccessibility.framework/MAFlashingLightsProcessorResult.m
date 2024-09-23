@implementation MAFlashingLightsProcessorResult

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MAFlashingLightsProcessorResult surfaceProcessed](self, "surfaceProcessed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[MAFlashingLightsProcessorResult mitigationLevel](self, "mitigationLevel");
  objc_msgSend(v5, "numberWithFloat:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[MAFlashingLightsProcessorResult intensityLevel](self, "intensityLevel");
  objc_msgSend(v7, "numberWithFloat:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("MAFlashingLightsProcessorResult<%p>: Processed: %@, Mitigation: %@, Intensity: %@"), self, v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)surfaceProcessed
{
  return self->surfaceProcessed;
}

- (void)setSurfaceProcessed:(BOOL)a3
{
  self->surfaceProcessed = a3;
}

- (float)mitigationLevel
{
  return self->mitigationLevel;
}

- (void)setMitigationLevel:(float)a3
{
  self->mitigationLevel = a3;
}

- (float)intensityLevel
{
  return self->intensityLevel;
}

- (void)setIntensityLevel:(float)a3
{
  self->intensityLevel = a3;
}

@end
