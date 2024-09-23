@implementation MFMessageDisplayMetricsRegular

- (double)topToSenderBaseline
{
  double v3;
  double v4;
  double v5;

  -[MFMessageDisplayMetrics _scaledFloatWithValue:fontStyle:](self, "_scaledFloatWithValue:fontStyle:", *MEMORY[0x1E0DC4A88], 34.0);
  v4 = v3;
  if (!-[MFMessageDisplayMetrics hasGenerousMargins](self, "hasGenerousMargins"))
    return v4;
  -[MFMessageDisplayMetrics layoutMargins](self, "layoutMargins");
  return v4 + v5 * 0.4;
}

- (double)baselineToBaselineSpacing
{
  double result;

  -[MFMessageDisplayMetrics _scaledFloatWithValue:fontStyle:](self, "_scaledFloatWithValue:fontStyle:", *MEMORY[0x1E0DC4B10], 22.0);
  return result;
}

- (double)recipientBaselineToFirstSeparator
{
  double result;

  -[MFMessageDisplayMetrics _scaledFloatWithValue:fontStyle:](self, "_scaledFloatWithValue:fontStyle:", *MEMORY[0x1E0DC4AB8], 20.0);
  return result;
}

- (double)firstSeparatorToSubjectBaseline
{
  double result;

  -[MFMessageDisplayMetrics _scaledFloatWithValue:fontStyle:](self, "_scaledFloatWithValue:fontStyle:", *MEMORY[0x1E0DC4B58], 56.0);
  return result;
}

- (double)headerBottomPadding
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x1E0CC68B0], "sharedFontMetricCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedFont:forKey:", &__block_literal_global_6, CFSTR("messageRegularDisplayMetrics.bodyFont"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CC68B0], "sharedFontMetricCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__MFMessageDisplayMetricsRegular_headerBottomPadding__block_invoke_2;
  v9[3] = &unk_1E9A03318;
  v5 = v3;
  v10 = v5;
  objc_msgSend(v4, "cachedFloat:forKey:", v9, CFSTR("messageRegularDisplayMetrics.headerBottomPadding"));
  v7 = v6;

  return v7;
}

id __53__MFMessageDisplayMetricsRegular_headerBottomPadding__block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 0x10000, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v0, 0.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t __53__MFMessageDisplayMetricsRegular_headerBottomPadding__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_scaledValueForValue:", 56.0);
  objc_msgSend(*(id *)(a1 + 32), "lineHeight");
  return UIRoundToViewScale();
}

- (double)statusIndicatorVerticalSpacing
{
  double result;

  -[MFMessageDisplayMetrics _scaledFloatWithValue:fontStyle:](self, "_scaledFloatWithValue:fontStyle:", *MEMORY[0x1E0DC4B10], 24.0);
  return result;
}

@end
