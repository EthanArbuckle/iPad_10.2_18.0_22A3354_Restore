@implementation UIFont(CUIKPlatforms)

+ (uint64_t)cuik_preferredTightLeadingFontForTextStyle:()CUIKPlatforms
{
  return objc_msgSend(a1, "_preferredFontForTextStyle:addingSymbolicTraits:", a3, 0x8000);
}

+ (uint64_t)cuik_preferredTightLeadingBoldFontForTextStyle:()CUIKPlatforms
{
  return objc_msgSend(a1, "_preferredFontForTextStyle:addingSymbolicTraits:", a3, 32770);
}

+ (id)cuik_createFontFromFont:()CUIKPlatforms withFontGrade:
{
  return (id)CTFontCreateCopyOfSystemUIFontWithGrade();
}

@end
