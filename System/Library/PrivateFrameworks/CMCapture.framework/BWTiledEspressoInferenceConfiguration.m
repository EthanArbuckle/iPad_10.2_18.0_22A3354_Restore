@implementation BWTiledEspressoInferenceConfiguration

- (void)setMetalCommandQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (BWTiledEspressoInferenceConfiguration)initWithInferenceType:(int)a3 metalCommandQueue:(id)a4
{
  BWTiledEspressoInferenceConfiguration *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BWTiledEspressoInferenceConfiguration;
  v5 = -[BWInferenceConfiguration initWithInferenceType:](&v7, sel_initWithInferenceType_, *(_QWORD *)&a3);
  if (v5)
    v5->_metalCommandQueue = (MTLCommandQueue *)a4;
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWTiledEspressoInferenceConfiguration;
  -[BWInferenceConfiguration dealloc](&v3, sel_dealloc);
}

- (BOOL)forceSynchronousInference
{
  return self->_forceSynchronousInference;
}

- (void)setForceSynchronousInference:(BOOL)a3
{
  self->_forceSynchronousInference = a3;
}

@end
