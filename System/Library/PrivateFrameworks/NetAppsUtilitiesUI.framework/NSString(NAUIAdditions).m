@implementation NSString(NAUIAdditions)

- (BOOL)naui_containsCJKScripts
{
  unint64_t v2;
  _BOOL8 v3;

  if (!objc_msgSend(a1, "length"))
    return 0;
  v2 = 0;
  do
  {
    objc_msgSend(a1, "characterAtIndex:", v2);
    v3 = NAUIIsCJKCharacter();
    if (v3)
      break;
    ++v2;
  }
  while (v2 < objc_msgSend(a1, "length"));
  return v3;
}

@end
