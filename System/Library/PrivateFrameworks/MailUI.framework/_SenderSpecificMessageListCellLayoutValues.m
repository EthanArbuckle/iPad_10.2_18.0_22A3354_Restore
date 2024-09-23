@implementation _SenderSpecificMessageListCellLayoutValues

- (BOOL)isSubjectVisible
{
  return 0;
}

- (int64_t)linesOfSummaryForCompactHeight:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
    return 1;
  else
    return objc_msgSend(MEMORY[0x1E0C99EA0], "em_linesOfPreview", v3, v4) + 1;
}

@end
