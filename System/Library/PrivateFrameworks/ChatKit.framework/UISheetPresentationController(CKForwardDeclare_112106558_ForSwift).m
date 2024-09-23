@implementation UISheetPresentationController(CKForwardDeclare_112106558_ForSwift)

- (double)_ck_exteriorDismissPadding
{
  double result;

  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0.0;
  objc_msgSend(a1, "_exteriorDismissPadding");
  return result;
}

- (uint64_t)_ck_setExteriorDismissPadding:()CKForwardDeclare_112106558_ForSwift
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a1, "_setExteriorDismissPadding:", a2);
  return result;
}

@end
