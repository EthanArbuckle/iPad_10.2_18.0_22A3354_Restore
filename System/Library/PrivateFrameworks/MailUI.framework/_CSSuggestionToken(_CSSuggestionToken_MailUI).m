@implementation _CSSuggestionToken(_CSSuggestionToken_MailUI)

- (const)tokenKindAccessibilityDescription
{
  unint64_t v1;

  v1 = objc_msgSend(a1, "tokenKind");
  if (v1 > 0x2E)
    return CFSTR("suggestion");
  else
    return off_1E99E0FB0[v1];
}

@end
