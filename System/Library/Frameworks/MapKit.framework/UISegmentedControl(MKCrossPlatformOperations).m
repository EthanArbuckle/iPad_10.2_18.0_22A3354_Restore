@implementation UISegmentedControl(MKCrossPlatformOperations)

- (uint64_t)_mapkit_selectedSegmentIndex
{
  uint64_t result;

  result = objc_msgSend(a1, "selectedSegmentIndex");
  if (result == -1)
    return 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (uint64_t)_mapkit_setSelectedSegmentIndex:()MKCrossPlatformOperations
{
  uint64_t v4;

  if (a3 > 0x7FFFFFFFFFFFFFFELL || (v4 = a3, objc_msgSend(a1, "numberOfSegments") <= a3))
    v4 = -1;
  return objc_msgSend(a1, "setSelectedSegmentIndex:", v4);
}

- (void)_mapkit_setTitle:()MKCrossPlatformOperations forSegmentAtIndex:insertIfNeeded:
{
  id v8;
  id v9;

  v8 = a3;
  if ((a4 & 0x8000000000000000) == 0)
  {
    v9 = v8;
    if (objc_msgSend(a1, "numberOfSegments") <= a4 && a5)
      objc_msgSend(a1, "insertSegmentWithTitle:atIndex:animated:", v9, a4, 0);
    else
      objc_msgSend(a1, "setTitle:forSegmentAtIndex:", v9, a4);
    v8 = v9;
  }

}

@end
