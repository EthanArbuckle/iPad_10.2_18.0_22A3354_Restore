@implementation BWMatteMediaSuppressionNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3, a4);
}

- (BWMatteMediaSuppressionNode)initWithBehavior:(unsigned int)a3
{
  BWMatteMediaSuppressionNode *v4;
  BWNodeInput *v5;
  BWNodeOutput *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWMatteMediaSuppressionNode;
  v4 = -[BWNode init](&v8, sel_init);
  if (v4)
  {
    v5 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v4);
    -[BWNodeInput setFormatRequirements:](v5, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeInput setPassthroughMode:](v5, "setPassthroughMode:", 1);
    -[BWNode addInput:](v4, "addInput:", v5);

    v6 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v4);
    -[BWNodeOutput setFormatRequirements:](v6, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeOutput setPassthroughMode:](v6, "setPassthroughMode:", 1);
    -[BWNode addOutput:](v4, "addOutput:", v6);

    v4->_behavior = a3;
  }
  return v4;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  void *v6;
  unsigned int behavior;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  CMGetAttachment(a3, CFSTR("BWStillImageCaptureSettings"), 0);
  v6 = (void *)CMGetAttachment(a3, CFSTR("StillSettings"), 0);
  if ((objc_msgSend((id)objc_msgSend(v6, "processingSettings"), "provideDemosaicedRaw") & 1) != 0)
    goto LABEL_28;
  behavior = self->_behavior;
  if ((behavior & 1) != 0)
  {
    v8 = BWSampleBufferGetAttachedMedia(a3, (uint64_t)CFSTR("Depth")) == 0;
    if ((behavior & 2) == 0)
      goto LABEL_8;
LABEL_6:
    if ((v8 & 1) == 0)
      v8 = BWSampleBufferHasDetectedFaces(a3, 0, 0, 1, 0, 1) ^ 1;
    goto LABEL_8;
  }
  v8 = 0;
  if ((behavior & 2) != 0)
    goto LABEL_6;
LABEL_8:
  if ((behavior & 4) == 0 || (v8 & 1) != 0)
  {
    if (!v8)
      goto LABEL_28;
  }
  else if ((BWSampleBufferHasDetectedFaces(a3, 0, 0, 1, 1, 1) & 1) != 0)
  {
    goto LABEL_28;
  }
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", 0x1E495AF38, CFSTR("PersonSemanticsHair"), CFSTR("PersonSemanticsSkin"), CFSTR("PersonSemanticsTeeth"), CFSTR("PersonSemanticsGlasses"), 0);
  v10 = BWStillImageProcessingFlagsForSampleBuffer(a3);
  if (self->_smartStyleReversibilityEnabled)
  {
    v11 = v10 & 0x1000;
    if (objc_msgSend((id)objc_msgSend(v6, "requestedSettings"), "smartStyleReversibilitySupported")
      && v11 == 0)
    {
      v13 = BWSemanticSegmentationMatteAttachedMediaKeysSupportedByDemosaicedRaw();
      if (v13)
        objc_msgSend(v9, "removeObjectsInArray:", v13);
    }
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v14 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v9);
        BWSampleBufferRemoveAttachedMedia(a3, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
      }
      v15 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }
LABEL_28:
  -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
}

- (void)setSmartStyleReversibilityEnabled:(BOOL)a3
{
  self->_smartStyleReversibilityEnabled = a3;
}

- (BOOL)smartStyleReversibilityEnabled
{
  return self->_smartStyleReversibilityEnabled;
}

@end
