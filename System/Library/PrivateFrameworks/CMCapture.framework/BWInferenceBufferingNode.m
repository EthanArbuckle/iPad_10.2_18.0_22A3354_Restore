@implementation BWInferenceBufferingNode

- (BWInferenceBufferingNode)initWithConvEngineSupportWithCaptureDevice:(id)a3 scheduler:(id)a4 priority:(unsigned int)a5
{
  BWInferenceBufferingNode *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BWInferenceBufferingNode;
  v5 = -[BWInferenceNode initWithConvEngineSupportWithCaptureDevice:scheduler:priority:](&v7, sel_initWithConvEngineSupportWithCaptureDevice_scheduler_priority_, a3, a4, *(_QWORD *)&a5);
  if (v5)
    v5->_ringBuffers = objc_alloc_init(BWInferenceResultRingBuffers);
  return v5;
}

- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("PrimaryFormat"));
}

- (int)addInferenceOfType:(int)a3 version:(id)a4 configuration:(id)a5 ringBufferCapacity:(int)a6
{
  uint64_t v7;
  uint64_t v8;
  objc_super v11;

  v7 = *(_QWORD *)&a4.var0;
  v8 = *(_QWORD *)&a3;
  -[BWInferenceResultRingBuffers setupRingBuffer:inferencesOfType:](self->_ringBuffers, "setupRingBuffer:inferencesOfType:", *(_QWORD *)&a6, *(_QWORD *)&a3);
  v11.receiver = self;
  v11.super_class = (Class)BWInferenceBufferingNode;
  return -[BWInferenceNode addInferenceOfType:version:configuration:](&v11, sel_addInferenceOfType_version_configuration_, v8, v7 & 0xFFFFFFFFFFFFLL, a5);
}

- (BWInferenceResultRingBuffers)ringBuffers
{
  return self->_ringBuffers;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceBufferingNode;
  -[BWInferenceNode dealloc](&v3, sel_dealloc);
}

- (void)willEmitSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  objc_super v5;

  -[BWInferenceResultRingBuffers insertInferenceResultsFromSampleBuffer:](self->_ringBuffers, "insertInferenceResultsFromSampleBuffer:");
  v5.receiver = self;
  v5.super_class = (Class)BWInferenceBufferingNode;
  -[BWInferenceNode willEmitSampleBuffer:](&v5, sel_willEmitSampleBuffer_, a3);
}

@end
