@implementation PKDrawingPaletteStatisticsEventLogger

- (void)recordHandwritingToolSelected
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("handwritingtool.selected"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEventLazy();

}

void *__70__PKDrawingPaletteStatisticsEventLogger_recordHandwritingToolSelected__block_invoke()
{
  return &unk_1E77ED208;
}

- (void)recordHandwritingToolUsedOverDrawingAttachmentWithTimestamp:(double)a3
{
  double v5;
  id v6;

  -[PKDrawingPaletteStatisticsEventLogger lastHandwritingToolUsedOverDrawingAttachmentTimestamp](self, "lastHandwritingToolUsedOverDrawingAttachmentTimestamp");
  if (v5 != a3 && vabdd_f64(v5, a3) >= fabs(a3 * 1.0e-10))
  {
    -[PKDrawingPaletteStatisticsEventLogger setLastHandwritingToolUsedOverDrawingAttachmentTimestamp:](self, "setLastHandwritingToolUsedOverDrawingAttachmentTimestamp:", a3);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("handwritingtool.usedOverDrawingAttachment"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEventLazy();

  }
}

void *__101__PKDrawingPaletteStatisticsEventLogger_recordHandwritingToolUsedOverDrawingAttachmentWithTimestamp___block_invoke()
{
  return &unk_1E77ED230;
}

- (void)recordInkingToolUsedOverNonDrawingAttachmentWithTimestamp:(double)a3
{
  double v5;
  id v6;

  -[PKDrawingPaletteStatisticsEventLogger lastInkingToolUsedOverNonDrawingAttachmentTimestamp](self, "lastInkingToolUsedOverNonDrawingAttachmentTimestamp");
  if (v5 != a3 && vabdd_f64(v5, a3) >= fabs(a3 * 1.0e-10))
  {
    -[PKDrawingPaletteStatisticsEventLogger setLastInkingToolUsedOverNonDrawingAttachmentTimestamp:](self, "setLastInkingToolUsedOverNonDrawingAttachmentTimestamp:", a3);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pencilkit.%@"), CFSTR("inkingtool.usedOverNonDrawingAttachment"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEventLazy();

  }
}

void *__99__PKDrawingPaletteStatisticsEventLogger_recordInkingToolUsedOverNonDrawingAttachmentWithTimestamp___block_invoke()
{
  return &unk_1E77ED258;
}

- (double)lastHandwritingToolUsedOverDrawingAttachmentTimestamp
{
  return self->_lastHandwritingToolUsedOverDrawingAttachmentTimestamp;
}

- (void)setLastHandwritingToolUsedOverDrawingAttachmentTimestamp:(double)a3
{
  self->_lastHandwritingToolUsedOverDrawingAttachmentTimestamp = a3;
}

- (double)lastInkingToolUsedOverNonDrawingAttachmentTimestamp
{
  return self->_lastInkingToolUsedOverNonDrawingAttachmentTimestamp;
}

- (void)setLastInkingToolUsedOverNonDrawingAttachmentTimestamp:(double)a3
{
  self->_lastInkingToolUsedOverNonDrawingAttachmentTimestamp = a3;
}

@end
