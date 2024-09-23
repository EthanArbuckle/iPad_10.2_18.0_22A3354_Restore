@implementation CNUILikenessRenderingScope(CNAvatarImageRenderingScope)

- (BOOL)avatarViewStyle
{
  return objc_msgSend(a1, "style") == 1;
}

- (uint64_t)avatarViewBackgroundStyle
{
  uint64_t result;

  result = objc_msgSend(a1, "backgroundStyle");
  if ((unint64_t)(result - 1) >= 4)
    return 0;
  return result;
}

@end
