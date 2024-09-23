@implementation CAMImageAnalysisInstructionLabel

- (CAMImageAnalysisInstructionLabel)initWithFrame:(CGRect)a3
{
  CAMImageAnalysisInstructionLabel *v3;
  CAMImageAnalysisInstructionLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMImageAnalysisInstructionLabel;
  v3 = -[CAMInstructionLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CAMImageAnalysisInstructionLabel _updateText](v3, "_updateText");
  return v4;
}

- (void)setInstruction:(int64_t)a3
{
  id v4;

  if (self->_instruction != a3)
  {
    self->_instruction = a3;
    -[CAMImageAnalysisInstructionLabel _updateText](self, "_updateText");
    -[CAMInstructionLabel delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "instructionLabelDidChangeIntrinsicContentSize:", self);

  }
}

- (void)_updateText
{
  int64_t v3;
  __CFString *v4;
  uint64_t v5;
  id v6;

  v3 = -[CAMImageAnalysisInstructionLabel instruction](self, "instruction");
  if (v3)
  {
    if (v3 != 1)
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = CFSTR("IMAGE_ANALYSIS_INSTRUCTION_NO_TEXT_FOUND");
  }
  else
  {
    v4 = CFSTR("IMAGE_ANALYSIS_INSTRUCTION_SELECT_TEXT");
  }
  CAMLocalizedFrameworkString(v4, 0);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v6 = (id)v5;
  -[CAMInstructionLabel setText:](self, "setText:", v5);

}

- (int64_t)instruction
{
  return self->_instruction;
}

@end
