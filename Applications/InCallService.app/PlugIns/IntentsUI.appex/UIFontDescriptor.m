@implementation UIFontDescriptor

+ (id)phPreferredFontDescriptorForTextStyle:(id)a3
{
  return objc_msgSend(a1, "phPreferredFontDescriptorForTextStyle:addingSymbolicTraits:", a3, 0);
}

+ (id)phPreferredFontDescriptorForTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4
{
  return +[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a3, *(_QWORD *)&a4, 1);
}

+ (id)voicemailHeadlineShortFontDescriptor
{
  if (qword_1000921D8 != -1)
    dispatch_once(&qword_1000921D8, &stru_10007D390);
  return (id)qword_1000921D0;
}

+ (id)voicemailCaptionRegularFontDescriptor
{
  if (qword_1000921E8 != -1)
    dispatch_once(&qword_1000921E8, &stru_10007D3B0);
  return (id)qword_1000921E0;
}

@end
