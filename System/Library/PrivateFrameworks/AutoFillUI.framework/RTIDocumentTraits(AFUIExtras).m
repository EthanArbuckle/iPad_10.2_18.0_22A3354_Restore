@implementation RTIDocumentTraits(AFUIExtras)

- (uint64_t)_isExplicitAutoFillInvocation
{
  uint64_t result;
  unint64_t v3;

  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  result = objc_msgSend(a1, "isExplicitAutoFillMode");
  if ((_DWORD)result)
  {
    v3 = objc_msgSend(a1, "autofillMode");
    if (v3 <= 9)
      return (0x282u >> v3) & 1;
    else
      return 0;
  }
  return result;
}

- (uint64_t)_afui_isSingleLineDocument
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(a1, "isSingleLineDocument");
  else
    return 0;
}

@end
