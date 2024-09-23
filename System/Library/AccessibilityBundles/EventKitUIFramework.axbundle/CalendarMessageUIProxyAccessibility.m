@implementation CalendarMessageUIProxyAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CalendarMessageUIProxy");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CalendarMessageUIProxy"), CFSTR("CalendarComposeRecipientClass"), "#", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CalendarMessageUIProxy"), CFSTR("MailComposeRecipientClass"), "#", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CalendarMessageUIProxy"), CFSTR("ComposeRecipientViewClass"), "#", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CalendarMessageUIProxy"), CFSTR("RecipientTableViewCellClass"), "#", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CalendarMessageUIProxy"), CFSTR("SearchShadowViewClass"), "#", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CalendarMessageUIProxy"), CFSTR("MFContactsSearchManagerClass"), "#", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CalendarMessageUIProxy"), CFSTR("MFContactsSearchResultsModelClass"), "#", 0);

}

+ (Class)CalendarComposeRecipientClass
{
  id v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CalendarMessageUIProxyAccessibility;
  v2 = objc_msgSendSuper2(&v4, sel_CalendarComposeRecipientClass);
  LoadMessageUI();
  return (Class)v2;
}

+ (Class)MailComposeRecipientClass
{
  id v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CalendarMessageUIProxyAccessibility;
  v2 = objc_msgSendSuper2(&v4, sel_MailComposeRecipientClass);
  LoadMessageUI();
  return (Class)v2;
}

+ (Class)ComposeRecipientViewClass
{
  id v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CalendarMessageUIProxyAccessibility;
  v2 = objc_msgSendSuper2(&v4, sel_ComposeRecipientViewClass);
  LoadMessageUI();
  return (Class)v2;
}

+ (Class)RecipientTableViewCellClass
{
  id v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CalendarMessageUIProxyAccessibility;
  v2 = objc_msgSendSuper2(&v4, sel_RecipientTableViewCellClass);
  LoadMessageUI();
  return (Class)v2;
}

+ (Class)SearchShadowViewClass
{
  id v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CalendarMessageUIProxyAccessibility;
  v2 = objc_msgSendSuper2(&v4, sel_SearchShadowViewClass);
  LoadMessageUI();
  return (Class)v2;
}

+ (Class)MFContactsSearchManagerClass
{
  id v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CalendarMessageUIProxyAccessibility;
  v2 = objc_msgSendSuper2(&v4, sel_MFContactsSearchManagerClass);
  LoadMessageUI();
  return (Class)v2;
}

+ (Class)MFContactsSearchResultsModelClass
{
  id v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CalendarMessageUIProxyAccessibility;
  v2 = objc_msgSendSuper2(&v4, sel_MFContactsSearchResultsModelClass);
  LoadMessageUI();
  return (Class)v2;
}

@end
