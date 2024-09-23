@implementation _KSTextReplacementEntry(Sorting)

- (const)shortcutForSorting
{
  const __CFString *result;

  result = (const __CFString *)objc_msgSend(a1, "shortcut");
  if (!result)
    return &stru_24E732B90;
  return result;
}

@end
