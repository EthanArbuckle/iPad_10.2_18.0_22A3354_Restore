@implementation CAMSpatialCaptureInstructionLabel

- (void)setStereoCaptureStatus:(int64_t)a3
{
  if (self->_stereoCaptureStatus != a3)
  {
    self->_stereoCaptureStatus = a3;
    -[CAMSpatialCaptureInstructionLabel _updateText](self, "_updateText");
  }
}

- (void)setUseHoldStillLowLightInstruction:(BOOL)a3
{
  if (self->_useHoldStillLowLightInstruction != a3)
  {
    self->_useHoldStillLowLightInstruction = a3;
    -[CAMSpatialCaptureInstructionLabel _updateText](self, "_updateText");
  }
}

- (void)_updateText
{
  int v3;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = -[CAMSpatialCaptureInstructionLabel stereoCaptureStatus](self, "stereoCaptureStatus");
  if ((~v3 & 3) != 0)
  {
    if ((v3 & 2) != 0)
    {
      CAMLocalizedFrameworkString(CFSTR("SPATIAL_VIDEO_LOW_LIGHT_INSTRUCTION_LABEL"), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[CAMSpatialCaptureInstructionLabel useHoldStillLowLightInstruction](self, "useHoldStillLowLightInstruction"))
      {
        CAMLocalizedFrameworkString(CFSTR("SPATIAL_LOW_LIGHT_HOLD_STILL_INSTRUCTION_LABEL"), 0);
        v6 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v6;
      }
      goto LABEL_7;
    }
    if ((v3 & 4) == 0)
      goto LABEL_9;
    v4 = CFSTR("SPATIAL_VIDEO_SUBJECT_TOO_CLOSE_INSTRUCTION_LABEL");
  }
  else
  {
    v4 = CFSTR("SPATIAL_MORE_LIGHT_REQUIRED_INSTRUCTION_LABEL");
  }
  CAMLocalizedFrameworkString(v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  if (v5)
  {
    -[CAMInstructionLabel setText:](self, "setText:", v5);

  }
LABEL_9:
  -[CAMInstructionLabel delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "instructionLabelDidChangeIntrinsicContentSize:", self);

}

- (int64_t)stereoCaptureStatus
{
  return self->_stereoCaptureStatus;
}

- (BOOL)useHoldStillLowLightInstruction
{
  return self->_useHoldStillLowLightInstruction;
}

@end
