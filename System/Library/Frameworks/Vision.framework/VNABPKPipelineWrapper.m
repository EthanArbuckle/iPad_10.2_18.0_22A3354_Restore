@implementation VNABPKPipelineWrapper

- (VNABPKPipelineWrapper)init
{
  VNABPKPipelineWrapper *v2;
  void *v3;
  objc_class *v4;
  ABPKPoseEstimationPipeline *v5;
  ABPKPoseEstimationPipeline *bodyPosePipeline;
  objc_super v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  Class (*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)VNABPKPipelineWrapper;
  v2 = -[VNABPKPipelineWrapper init](&v8, sel_init);
  if (v2)
  {
    if (!AltruisticBodyPoseKitLibraryCore_frameworkLibrary)
    {
      v13 = xmmword_1E45438C0;
      v14 = 0;
      AltruisticBodyPoseKitLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (AltruisticBodyPoseKitLibraryCore_frameworkLibrary)
    {
      v9 = 0;
      v10 = &v9;
      v11 = 0x2050000000;
      v3 = (void *)getABPKPoseEstimationPipelineClass_softClass;
      v12 = getABPKPoseEstimationPipelineClass_softClass;
      if (!getABPKPoseEstimationPipelineClass_softClass)
      {
        *(_QWORD *)&v13 = MEMORY[0x1E0C809B0];
        *((_QWORD *)&v13 + 1) = 3221225472;
        v14 = __getABPKPoseEstimationPipelineClass_block_invoke;
        v15 = &unk_1E4548FA8;
        v16 = &v9;
        __getABPKPoseEstimationPipelineClass_block_invoke((uint64_t)&v13);
        v3 = (void *)v10[3];
      }
      v4 = objc_retainAutorelease(v3);
      _Block_object_dispose(&v9, 8);
      v5 = (ABPKPoseEstimationPipeline *)objc_alloc_init(v4);
      bodyPosePipeline = v2->_bodyPosePipeline;
      v2->_bodyPosePipeline = v5;

    }
  }
  return v2;
}

- (ABPKPoseEstimationPipeline)bodyPosePipeline
{
  return self->_bodyPosePipeline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyPosePipeline, 0);
}

@end
