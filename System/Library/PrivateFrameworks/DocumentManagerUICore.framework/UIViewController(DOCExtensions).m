@implementation UIViewController(DOCExtensions)

- (BOOL)doc_isAppearing
{
  return objc_msgSend(a1, "_appearState") == 1;
}

- (uint64_t)doc_hasAppearedOrIsAppearing
{
  if ((objc_msgSend(a1, "doc_hasAppeared") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "doc_isAppearing");
}

- (BOOL)doc_hasAppeared
{
  return objc_msgSend(a1, "_appearState") == 2;
}

- (BOOL)doc_hasDisappeared
{
  return objc_msgSend(a1, "_appearState") == 0;
}

- (BOOL)doc_isDisappearing
{
  return objc_msgSend(a1, "_appearState") == 3;
}

- (uint64_t)doc_hasDisappearedOrIsDisappearing
{
  if ((objc_msgSend(a1, "doc_hasDisappeared") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "doc_isDisappearing");
}

@end
