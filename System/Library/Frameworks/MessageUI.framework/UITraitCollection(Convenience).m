@implementation UITraitCollection(Convenience)

- (BOOL)mf_useSplitViewStyling
{
  return (unint64_t)(objc_msgSend(a1, "_splitViewControllerContext") - 1) < 3;
}

- (uint64_t)mf_supportsPopoverPresentation
{
  uint64_t result;

  result = objc_msgSend(a1, "userInterfaceIdiom");
  if (result)
    return objc_msgSend(a1, "horizontalSizeClass") == 2;
  return result;
}

- (uint64_t)mf_hasCompactDimension
{
  uint64_t result;

  result = objc_msgSend(a1, "horizontalSizeClass");
  if (result != 1)
    return objc_msgSend(a1, "verticalSizeClass") == 1;
  return result;
}

- (BOOL)mf_usePrimarySidebarStyling
{
  return (unint64_t)(objc_msgSend(a1, "_splitViewControllerContext") - 1) < 2;
}

@end
