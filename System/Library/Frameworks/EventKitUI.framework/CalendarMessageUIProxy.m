@implementation CalendarMessageUIProxy

+ (Class)CalendarComposeRecipientClass
{
  objc_class *v2;

  v2 = (objc_class *)CalendarComposeRecipientClass_class;
  if (!CalendarComposeRecipientClass_class)
  {
    v2 = __MessageUIClassFromString(CFSTR("MFCalendarComposeRecipient"));
    CalendarComposeRecipientClass_class = (uint64_t)v2;
  }
  return v2;
}

+ (Class)MailComposeRecipientClass
{
  objc_class *v2;

  v2 = (objc_class *)MailComposeRecipientClass_class;
  if (!MailComposeRecipientClass_class)
  {
    v2 = __MessageUIClassFromString(CFSTR("MailComposeRecipient"));
    MailComposeRecipientClass_class = (uint64_t)v2;
  }
  return v2;
}

+ (Class)ComposeRecipientViewClass
{
  objc_class *v2;

  v2 = (objc_class *)ComposeRecipientViewClass_class;
  if (!ComposeRecipientViewClass_class)
  {
    v2 = __MessageUIClassFromString(CFSTR("MFComposeRecipientTextView"));
    ComposeRecipientViewClass_class = (uint64_t)v2;
  }
  return v2;
}

+ (Class)RecipientTableViewCellClass
{
  objc_class *v2;

  v2 = (objc_class *)RecipientTableViewCellClass_class;
  if (!RecipientTableViewCellClass_class)
  {
    v2 = __MessageUIClassFromString(CFSTR("MFRecipientTableViewCell"));
    RecipientTableViewCellClass_class = (uint64_t)v2;
  }
  return v2;
}

+ (Class)SearchShadowViewClass
{
  objc_class *v2;

  v2 = (objc_class *)SearchShadowViewClass_class;
  if (!SearchShadowViewClass_class)
  {
    v2 = __MessageUIClassFromString(CFSTR("MFSearchShadowView"));
    SearchShadowViewClass_class = (uint64_t)v2;
  }
  return v2;
}

+ (Class)MFContactsSearchManagerClass
{
  objc_class *v2;

  v2 = (objc_class *)MFContactsSearchManagerClass_class;
  if (!MFContactsSearchManagerClass_class)
  {
    v2 = __MessageUIClassFromString(CFSTR("MFContactsSearchManager"));
    MFContactsSearchManagerClass_class = (uint64_t)v2;
  }
  return v2;
}

+ (Class)MFContactsSearchResultsModelClass
{
  objc_class *v2;

  v2 = (objc_class *)MFContactsSearchResultsModelClass_class;
  if (!MFContactsSearchResultsModelClass_class)
  {
    v2 = __MessageUIClassFromString(CFSTR("MFContactsSearchResultsModel"));
    MFContactsSearchResultsModelClass_class = (uint64_t)v2;
  }
  return v2;
}

+ (Class)MFMailComposeViewControllerClass
{
  objc_class *v2;

  v2 = (objc_class *)MFMailComposeViewControllerClass_class;
  if (!MFMailComposeViewControllerClass_class)
  {
    v2 = __MessageUIClassFromString(CFSTR("MFMailComposeViewController"));
    MFMailComposeViewControllerClass_class = (uint64_t)v2;
  }
  return v2;
}

+ (Class)MFMessageComposeViewControllerClass
{
  objc_class *v2;

  v2 = (objc_class *)MFMessageComposeViewControllerClass_class;
  if (!MFMessageComposeViewControllerClass_class)
  {
    v2 = __MessageUIClassFromString(CFSTR("MFMessageComposeViewController"));
    MFMessageComposeViewControllerClass_class = (uint64_t)v2;
  }
  return v2;
}

+ (Class)MFAutocompleteResultsTableViewController
{
  objc_class *v2;

  v2 = (objc_class *)MFAutocompleteResultsTableViewController_class;
  if (!MFAutocompleteResultsTableViewController_class)
  {
    v2 = __MessageUIClassFromString(CFSTR("MFAutocompleteResultsTableViewController"));
    MFAutocompleteResultsTableViewController_class = (uint64_t)v2;
  }
  return v2;
}

@end
