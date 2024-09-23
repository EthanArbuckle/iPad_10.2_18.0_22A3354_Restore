@implementation BWSceneClassifierFrameGateNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWSceneClassifierFrameGateNode)initWithMaxOutputFrameRate:(int)a3
{
  BWSceneClassifierFrameGateNode *v5;
  BWNodeInput *v6;
  BWNodeOutput *v7;
  objc_super v9;

  if (a3 <= 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)BWSceneClassifierFrameGateNode;
    v5 = -[BWNode init](&v9, sel_init);
    if (v5)
    {
      v6 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v5);
      -[BWNodeInput setPassthroughMode:](v6, "setPassthroughMode:", 1);
      -[BWNode addInput:](v5, "addInput:", v6);

      v7 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v5);
      -[BWNodeOutput setPassthroughMode:](v7, "setPassthroughMode:", 1);
      -[BWNode addOutput:](v5, "addOutput:", v7);

      v5->_maxFrameRate = a3;
      v5->_discardsBlurryFrames = 1;
    }
  }
  return v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BWSceneClassifierFrameGateNode;
  -[BWNode dealloc](&v2, sel_dealloc);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("SceneClassifierFrameGate");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3, a4);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  const __CFDictionary *v6;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  $95D729B680665BEAEFA1D6FCA8238556 *p_lastEmittedPTS;
  float v10;
  float maxFrameRate;
  void *v12;
  int v13;
  int v14;
  CMTime v16;
  CMTime time;
  CMTime lhs;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  ++self->_inputFrameCount;
  if (!objc_msgSend((id)CMGetAttachment(a3, CFSTR("UprightExifOrientation"), 0), "intValue"))
  {
    if (self->_inputFrameCount < 31)
      return;
    CMSetAttachment(a3, CFSTR("UprightExifOrientation"), &unk_1E49FA530, 1u);
  }
  v6 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05D00], 0);
  if (v6)
    CMTimeMakeFromDictionary(&lhs, v6);
  else
    CMSampleBufferGetPresentationTimeStamp(&lhs, a3);
  value = lhs.value;
  flags = lhs.flags;
  timescale = lhs.timescale;
  epoch = lhs.epoch;
  p_lastEmittedPTS = &self->_lastEmittedPTS;
  if ((self->_lastEmittedPTS.flags & 1) != 0 && (lhs.flags & 1) != 0)
  {
    lhs.value = value;
    lhs.timescale = timescale;
    *(_OWORD *)&v16.value = *(_OWORD *)&p_lastEmittedPTS->value;
    v16.epoch = self->_lastEmittedPTS.epoch;
    CMTimeSubtract(&time, &lhs, &v16);
    v10 = 0.95 / CMTimeGetSeconds(&time);
    maxFrameRate = (float)self->_maxFrameRate;
    if (!self->_discardsBlurryFrames || v10 > maxFrameRate)
    {
      if (v10 > maxFrameRate)
        return;
LABEL_18:
      p_lastEmittedPTS->value = value;
      self->_lastEmittedPTS.timescale = timescale;
      self->_lastEmittedPTS.flags = flags;
      self->_lastEmittedPTS.epoch = epoch;
      -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
      return;
    }
  }
  else if (!self->_discardsBlurryFrames)
  {
    goto LABEL_18;
  }
  v12 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v13 = objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D067D0]), "intValue");
  v14 = objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D06AB8]), "intValue");
  if (v13 == 4 || v14 != 1)
    goto LABEL_18;
}

- (void)setDiscardsBlurryFrames:(BOOL)a3
{
  self->_discardsBlurryFrames = a3;
}

- (BOOL)discardsBlurryFrames
{
  return self->_discardsBlurryFrames;
}

@end
