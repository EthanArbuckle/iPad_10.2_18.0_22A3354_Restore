@implementation NSString(TextDirectionality)

- (uint64_t)wf_hasStrongRTLCharacter
{
  unint64_t v2;
  uint64_t IsMemberOf;

  if (!objc_msgSend(a1, "length"))
    return 0;
  v2 = 0;
  do
  {
    objc_msgSend(a1, "characterAtIndex:", v2);
    IsMemberOf = CFUniCharIsMemberOf();
    if ((_DWORD)IsMemberOf)
      break;
    ++v2;
  }
  while (objc_msgSend(a1, "length") > v2);
  return IsMemberOf;
}

@end
