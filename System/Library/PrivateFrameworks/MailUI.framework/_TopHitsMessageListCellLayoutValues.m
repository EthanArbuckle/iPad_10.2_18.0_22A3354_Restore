@implementation _TopHitsMessageListCellLayoutValues

- (int64_t)linesOfSummaryForCompactHeight:(BOOL)a3
{
  return 1;
}

- (BOOL)useSelectedColorForConfigurationState:(id)a3 backgroundConfiguration:(id)a4
{
  id v4;
  char v5;
  char v6;
  char v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "isSelected");
  v6 = objc_msgSend(v4, "isFocused");
  v7 = objc_msgSend(v4, "isFocusSystemActive");

  if ((v6 & 1) != 0)
    return v5;
  else
    return v5 & (v7 ^ 1);
}

@end
