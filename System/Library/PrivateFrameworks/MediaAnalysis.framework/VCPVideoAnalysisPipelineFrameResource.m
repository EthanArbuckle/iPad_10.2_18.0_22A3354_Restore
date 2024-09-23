@implementation VCPVideoAnalysisPipelineFrameResource

- (VCPVideoAnalysisPipelineFrameResource)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  char *v4;
  VCPVideoAnalysisPipelineFrameResource *v5;
  uint64_t v6;
  __int128 v7;
  void *v8;
  NSDictionary *actionAnalysisResults;
  NSDictionary *fullAnalysisResults;
  VCPFrameAnalysisStats *v11;
  VCPFrameAnalysisStats *frameStats;
  VCPVideoAnalysisPipelineFrameResource *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)VCPVideoAnalysisPipelineFrameResource;
  v4 = -[VCPVideoAnalysisPipelineFrameResource init](&v15, sel_init);
  v5 = (VCPVideoAnalysisPipelineFrameResource *)v4;
  if (v4)
  {
    *((_QWORD *)v4 + 1) = a3;
    v6 = MEMORY[0x1E0CA2E40];
    v7 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    *(_OWORD *)(v4 + 56) = *MEMORY[0x1E0CA2E40];
    *(_OWORD *)(v4 + 72) = v7;
    *(_OWORD *)(v4 + 88) = *(_OWORD *)(v6 + 32);
    v8 = (void *)*((_QWORD *)v4 + 3);
    *((_QWORD *)v4 + 3) = 0;

    actionAnalysisResults = v5->_actionAnalysisResults;
    v5->_actionAnalysisResults = 0;

    fullAnalysisResults = v5->_fullAnalysisResults;
    v5->_fullAnalysisResults = 0;

    v5->_frameFlags = 0;
    v11 = objc_alloc_init(VCPFrameAnalysisStats);
    frameStats = v5->_frameStats;
    v5->_frameStats = v11;

    v13 = v5;
  }

  return v5;
}

- (void)dealloc
{
  opaqueCMSampleBuffer *frameSampleBuffer;
  objc_super v4;

  frameSampleBuffer = self->_frameSampleBuffer;
  if (frameSampleBuffer)
  {
    CFRelease(frameSampleBuffer);
    self->_frameSampleBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPVideoAnalysisPipelineFrameResource;
  -[VCPVideoAnalysisPipelineFrameResource dealloc](&v4, sel_dealloc);
}

- (opaqueCMSampleBuffer)frameSampleBuffer
{
  return self->_frameSampleBuffer;
}

- (void)setFrameSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  self->_frameSampleBuffer = a3;
}

- ($C7CBA4C8288BA02ADCCB8E56B4665FF4)predictedTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var3;
  return self;
}

- (void)setPredictedTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_predictedTimeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_predictedTimeRange.start.epoch = v4;
  *(_OWORD *)&self->_predictedTimeRange.start.value = v3;
}

- (VCPFrameAnalysisStats)frameStats
{
  return self->_frameStats;
}

- (void)setFrameStats:(id)a3
{
  objc_storeStrong((id *)&self->_frameStats, a3);
}

- (NSDictionary)sceneAnalysisResults
{
  return self->_sceneAnalysisResults;
}

- (void)setSceneAnalysisResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)actionAnalysisResults
{
  return self->_actionAnalysisResults;
}

- (void)setActionAnalysisResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)fullAnalysisResults
{
  return self->_fullAnalysisResults;
}

- (void)setFullAnalysisResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)frameFlags
{
  return self->_frameFlags;
}

- (void)setFrameFlags:(unint64_t)a3
{
  self->_frameFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullAnalysisResults, 0);
  objc_storeStrong((id *)&self->_actionAnalysisResults, 0);
  objc_storeStrong((id *)&self->_sceneAnalysisResults, 0);
  objc_storeStrong((id *)&self->_frameStats, 0);
}

@end
