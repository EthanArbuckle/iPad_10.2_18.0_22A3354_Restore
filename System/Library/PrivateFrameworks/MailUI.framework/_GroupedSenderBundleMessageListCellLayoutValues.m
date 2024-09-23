@implementation _GroupedSenderBundleMessageListCellLayoutValues

- (BOOL)isSubjectVisible
{
  return 1;
}

- (int64_t)linesOfSummaryForCompactHeight:(BOOL)a3
{
  if (a3)
    return 0;
  else
    return objc_msgSend(MEMORY[0x1E0C99EA0], "em_linesOfPreview");
}

@end
