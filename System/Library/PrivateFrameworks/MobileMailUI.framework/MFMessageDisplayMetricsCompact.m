@implementation MFMessageDisplayMetricsCompact

- (double)topToSenderBaseline
{
  double result;

  -[MFMessageDisplayMetrics _scaledFloatWithValue:fontStyle:](self, "_scaledFloatWithValue:fontStyle:", *MEMORY[0x1E0DC4A88], 34.0);
  return result;
}

- (double)baselineToBaselineSpacing
{
  double result;

  -[MFMessageDisplayMetrics _scaledFloatWithValue:fontStyle:](self, "_scaledFloatWithValue:fontStyle:", *MEMORY[0x1E0DC4B10], 20.0);
  return result;
}

- (double)firstSeparatorToSubjectBaseline
{
  double result;

  -[MFMessageDisplayMetrics _scaledFloatWithValue:fontStyle:](self, "_scaledFloatWithValue:fontStyle:", *MEMORY[0x1E0DC4B58], 32.0);
  return result;
}

- (double)headerBottomPadding
{
  double result;

  -[MFMessageDisplayMetrics _scaledFloatWithValue:fontStyle:](self, "_scaledFloatWithValue:fontStyle:", *MEMORY[0x1E0DC4AD0], 20.0);
  return result;
}

- (double)statusIndicatorVerticalSpacing
{
  double result;

  -[MFMessageDisplayMetrics _scaledFloatWithValue:fontStyle:](self, "_scaledFloatWithValue:fontStyle:", *MEMORY[0x1E0DC4B10], 22.0);
  return result;
}

@end
