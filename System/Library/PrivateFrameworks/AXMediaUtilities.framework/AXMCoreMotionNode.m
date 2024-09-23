@implementation AXMCoreMotionNode

- (AXMCoreMotionNode)initWithIdentifier:(id)a3
{
  AXMCoreMotionNode *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXMCoreMotionNode;
  result = -[AXMVisionEngineNode initWithIdentifier:](&v4, sel_initWithIdentifier_, a3);
  if (result)
  {
    result->_samplesPerSecond = 0;
    result->_lastSampleTime = 0.0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMCoreMotionNode)initWithCoder:(id)a3
{
  id v4;
  AXMCoreMotionNode *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXMCoreMotionNode;
  v5 = -[AXMVisionEngineNode initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_samplesPerSecond = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("AXMCoreMotionNode_samplesPerSecond"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("AXMCoreMotionNode_lastSampleTime"));
    v5->_lastSampleTime = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXMCoreMotionNode;
  v4 = a3;
  -[AXMVisionEngineNode encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_samplesPerSecond, CFSTR("AXMCoreMotionNode_samplesPerSecond"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("AXMCoreMotionNode_lastSampleTime"), self->_lastSampleTime);

}

+ (BOOL)isSupported
{
  return 1;
}

+ (id)title
{
  return CFSTR("Core Motion");
}

- (void)nodeInitialize
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AXMCoreMotionNode;
  -[AXMSourceNode nodeInitialize](&v2, sel_nodeInitialize);
}

- (void)triggerWithCoreMotionManager:(id)a3 deviceOrientation:(int64_t)a4 cacheKey:(id)a5 resultHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  double Current;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (!-[AXMCoreMotionNode samplesPerSecond](self, "samplesPerSecond")
    || (Current = CFAbsoluteTimeGetCurrent(),
        -[AXMCoreMotionNode lastSampleTime](self, "lastSampleTime"),
        Current - v14 >= 1.0 / (double)-[AXMCoreMotionNode samplesPerSecond](self, "samplesPerSecond")))
  {
    +[AXMVisionAnalysisOptions defaultOptions](AXMVisionAnalysisOptions, "defaultOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = CFSTR("sourceProvidesResults");
    v22[1] = CFSTR("diagnosticsEnabled");
    v23[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXMVisionEngineNode areDiagnosticsEnabled](self, "areDiagnosticsEnabled"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXMVisionPipelineContext contextWithSourceParameters:options:](AXMVisionPipelineContext, "contextWithSourceParameters:options:", v17, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && objc_msgSend(v10, "isDeviceMotionAvailable"))
    {
      objc_msgSend(v10, "deviceMotion");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[AXMVisionFeature featureWithDeviceMotion:orientation:](AXMVisionFeature, "featureWithDeviceMotion:orientation:", v19, a4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        objc_msgSend(v18, "appendFeature:", v20);

    }
    v21.receiver = self;
    v21.super_class = (Class)AXMCoreMotionNode;
    -[AXMSourceNode triggerWithContext:cacheKey:resultHandler:](&v21, sel_triggerWithContext_cacheKey_resultHandler_, v18, v11, v12);
    -[AXMCoreMotionNode setLastSampleTime:](self, "setLastSampleTime:", CFAbsoluteTimeGetCurrent());

  }
}

- (unint64_t)samplesPerSecond
{
  return self->_samplesPerSecond;
}

- (void)setSamplesPerSecond:(unint64_t)a3
{
  self->_samplesPerSecond = a3;
}

- (double)lastSampleTime
{
  return self->_lastSampleTime;
}

- (void)setLastSampleTime:(double)a3
{
  self->_lastSampleTime = a3;
}

@end
