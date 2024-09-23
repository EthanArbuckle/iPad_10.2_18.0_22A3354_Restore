@implementation _KSTextReplacementEntry(Sorting)

- (const)shortcutForSorting
{
  const __CFString *result;

  result = (const __CFString *)objc_msgSend(a1, "shortcut");
  if (!result)
    return &stru_25107A038;
  return result;
}

@end
