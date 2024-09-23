@implementation BWFrameRateGovernorNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3, a4);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (void)setPreservesMotionDataFromDroppedFrames:(BOOL)a3
{
  self->_preservesMotionDataFromDroppedFrames = a3;
}

- (void)setDropsStartupFramesWithUnstableAE:(BOOL)a3
{
  self->_dropsStartupFramesWithUnstableAE = a3;
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  uint64_t aeStabilityTuning;
  int v4;
  int v5;
  objc_super v6;

  if (self->_preservesMotionDataFromDroppedFrames && !*(_QWORD *)&self->_activeBracketSequenceRate)
    *(_QWORD *)&self->_activeBracketSequenceRate = -[BWMotionDataPreserver initWithName:]([BWMotionDataPreserver alloc], "initWithName:", -[BWNode description](self, "description"));
  aeStabilityTuning = self->_aeStabilityTuning;
  if (aeStabilityTuning <= 2)
  {
    v4 = dword_1A32B1988[aeStabilityTuning];
    v5 = dword_1A32B1994[aeStabilityTuning];
    HIDWORD(self->_frameCount) = v4;
    *(_DWORD *)&self->_aeStableAfterStartStreaming = v5;
  }
  v6.receiver = self;
  v6.super_class = (Class)BWFrameRateGovernorNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v6, sel_prepareForCurrentConfigurationToBecomeLive);
}

- (void)setDropsStillBracketFramesToMaintainConsistentFrameRate:(BOOL)a3
{
  self->_dropsStillBracketFramesToMaintainConsistentFrameRate = a3;
}

- (BWFrameRateGovernorNode)init
{
  char *v2;
  BWNodeInput *v3;
  BWVideoFormatRequirements *v4;
  BWNodeOutput *v5;
  BWVideoFormatRequirements *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BWFrameRateGovernorNode;
  v2 = -[BWNode init](&v11, sel_init);
  if (v2)
  {
    v3 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v2);
    v4 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWNodeInput setFormatRequirements:](v3, "setFormatRequirements:", v4);

    -[BWNodeInput setPassthroughMode:](v3, "setPassthroughMode:", 1);
    objc_msgSend(v2, "addInput:", v3);

    v5 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v2);
    v6 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWNodeOutput setFormatRequirements:](v5, "setFormatRequirements:", v6);

    -[BWNodeOutput setPassthroughMode:](v5, "setPassthroughMode:", 1);
    objc_msgSend(v2, "addOutput:", v5);

    v7 = MEMORY[0x1E0CA2E18];
    v8 = *MEMORY[0x1E0CA2E18];
    *(_OWORD *)(v2 + 108) = *MEMORY[0x1E0CA2E18];
    v9 = *(_QWORD *)(v7 + 16);
    *(_QWORD *)(v2 + 124) = v9;
    *(_OWORD *)(v2 + 132) = v8;
    *(_QWORD *)(v2 + 148) = v9;
  }
  return (BWFrameRateGovernorNode *)v2;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v4;
  int v7;
  void *v8;
  const __CFDictionary *v9;
  char flags;
  void *v11;
  int aeStableTimeoutFrameCount;
  _BOOL4 v13;
  int v14;
  char v15;
  _OWORD *v16;
  double v17;
  int v18;
  double v19;
  int epoch_high;
  int v21;
  int v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  CMTime v26;
  CMTime v27;
  CMTime time;
  CMTime rhs;
  CMTime lhs;
  CMTime v31;
  CMTime v32;

  v7 = objc_msgSend((id)CMGetAttachment(a3, CFSTR("StillImageCaptureType"), 0), "intValue");
  v8 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  memset(&v32, 0, sizeof(v32));
  v9 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05D00], 0);
  CMTimeMakeFromDictionary(&v32, v9);
  flags = v32.flags;
  if ((v32.flags & 1) == 0)
  {
    CMSampleBufferGetPresentationTimeStamp(&v31, a3);
    v32 = v31;
    flags = v31.flags;
  }
  if ((flags & 1) == 0 || !v8)
  {
    fig_log_get_emitter();
    v25 = v4;
    LODWORD(v24) = 0;
    FigDebugAssert3();
    goto LABEL_52;
  }
  if (!self->_motionDataPreserver && self->_aeStabilityTuning == 2)
  {
    v11 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
    if (objc_msgSend(v11, "isEqual:", *MEMORY[0x1E0D05A28]))
    {
      HIDWORD(self->_frameCount) = 8;
      *(_DWORD *)&self->_aeStableAfterStartStreaming = 8;
    }
  }
  ++self->_motionDataPreserver;
  if (self->_dropsStartupFramesWithUnstableAE && !LOBYTE(self->_frameCount))
  {
    if ((objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D067A0]), "BOOLValue") & 1) != 0
      || objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D06788]), "BOOLValue"))
    {
      aeStableTimeoutFrameCount = self->_aeStableTimeoutFrameCount;
      v13 = aeStableTimeoutFrameCount >= *(_DWORD *)&self->_aeStableAfterStartStreaming
         || (uint64_t)self->_motionDataPreserver > SHIDWORD(self->_frameCount);
      LOBYTE(self->_frameCount) = v13;
      v14 = aeStableTimeoutFrameCount + 1;
    }
    else
    {
      v14 = 0;
      v13 = (uint64_t)self->_motionDataPreserver > SHIDWORD(self->_frameCount);
      LOBYTE(self->_frameCount) = v13;
    }
    self->_aeStableTimeoutFrameCount = v14;
    if (!v13)
      goto LABEL_56;
  }
  if (!self->_dropsStillBracketFramesToMaintainConsistentFrameRate)
  {
LABEL_51:
    *(CMTime *)(&self->_preservesMotionDataFromDroppedFrames + 4) = v32;
LABEL_52:
    objc_msgSend(*(id *)&self->_activeBracketSequenceRate, "prependPreservedMotionDataToSampleBuffer:", a3, v24, v25);
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
    return;
  }
  memset(&v31, 0, sizeof(v31));
  lhs = v32;
  rhs = *(CMTime *)(&self->_preservesMotionDataFromDroppedFrames + 4);
  CMTimeSubtract(&v31, &lhs, &rhs);
  if ((v7 & 0xFFFFFFFE) != 4)
  {
    v15 = 0;
    goto LABEL_40;
  }
  if ((objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D10]), "BOOLValue") & 1) == 0)
  {
    if (HIDWORD(self->_lastEmittedStreamingFrameDuration.epoch) || (v31.flags & 1) == 0)
      goto LABEL_39;
    lhs = v31;
    v16 = (_OWORD *)((char *)&self->_lastEmittedPTS.epoch + 4);
    rhs = *(CMTime *)((char *)&self->_lastEmittedPTS.epoch + 4);
    v17 = 1.0 / CMTimeGetSeconds(&rhs);
    if (v17 <= 21.0)
    {
      rhs = lhs;
      v19 = 1.0 / CMTimeGetSeconds(&rhs);
      if (v19 > 21.0)
      {
        v18 = 2;
        goto LABEL_38;
      }
      if (v7 == 4 && v19 > 15.0)
      {
        *(_OWORD *)&rhs.value = *v16;
        rhs.epoch = *(_QWORD *)&self->_lastEmittedStreamingFrameDuration.flags;
        v27 = lhs;
        CMTimeSubtract(&v26, &rhs, &v27);
        if (CMTimeGetSeconds(&v26) > 0.002)
        {
          v18 = 4;
          goto LABEL_38;
        }
      }
    }
    else if (v7 == 4 && v17 < 25.0)
    {
      *(_OWORD *)&rhs.value = *v16;
      rhs.epoch = *(_QWORD *)&self->_lastEmittedStreamingFrameDuration.flags;
      v27 = lhs;
      CMTimeSubtract(&time, &rhs, &v27);
      if (CMTimeGetSeconds(&time) > 0.002)
      {
        v18 = 3;
LABEL_38:
        HIDWORD(self->_lastEmittedStreamingFrameDuration.epoch) = v18;
LABEL_39:
        v15 = 1;
        goto LABEL_40;
      }
    }
    v18 = 1;
    goto LABEL_38;
  }
  v15 = 0;
LABEL_40:
  epoch_high = HIDWORD(self->_lastEmittedStreamingFrameDuration.epoch);
  if (epoch_high && v7 != 4 && v7 != 5)
  {
    HIDWORD(self->_lastEmittedStreamingFrameDuration.epoch) = 0;
    goto LABEL_49;
  }
  if ((epoch_high - 2) > 2)
    goto LABEL_49;
  v21 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D06910]), "intValue");
  v22 = HIDWORD(self->_lastEmittedStreamingFrameDuration.epoch);
  if (v22 == 4)
  {
    v23 = v21 & 0x80000003;
    goto LABEL_55;
  }
  if (v22 == 3)
  {
    v23 = v21 % 5;
LABEL_55:
    if (v23 == 1)
      goto LABEL_56;
LABEL_49:
    if ((v15 & 1) == 0)
      *(CMTime *)((char *)&self->_lastEmittedPTS.epoch + 4) = v31;
    goto LABEL_51;
  }
  if (v22 != 2 || (v21 & 1) != 0)
    goto LABEL_49;
LABEL_56:
  objc_msgSend(*(id *)&self->_activeBracketSequenceRate, "preserveMotionDataForSoonToBeDroppedSampleBuffer:", a3);
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWFrameRateGovernorNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (id)nodeSubType
{
  return CFSTR("FrameRateGovernor");
}

- (BOOL)dropsStillBracketFramesToMaintainConsistentFrameRate
{
  return self->_dropsStillBracketFramesToMaintainConsistentFrameRate;
}

- (BOOL)dropsStartupFramesWithUnstableAE
{
  return self->_dropsStartupFramesWithUnstableAE;
}

- (void)setAeStabilityTuning:(int)a3
{
  self->_aeStabilityTuning = a3;
}

- (int)aeStabilityTuning
{
  return self->_aeStabilityTuning;
}

- (BOOL)preservesMotionDataFromDroppedFrames
{
  return self->_preservesMotionDataFromDroppedFrames;
}

@end
