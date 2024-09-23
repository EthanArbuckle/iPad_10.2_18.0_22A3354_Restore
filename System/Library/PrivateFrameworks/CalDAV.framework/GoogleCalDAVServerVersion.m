@implementation GoogleCalDAVServerVersion

- (GoogleCalDAVServerVersion)init
{
  GoogleCalDAVServerVersion *v2;
  void *v3;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GoogleCalDAVServerVersion;
  v2 = -[CalDAVServerVersion init](&v6, sel_init);
  if (v2)
  {
    v5 = 0;
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(GSE|ESF)"), 1, &v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVConcreteServerVersion setRegularExpression:](v2, "setRegularExpression:", v3);

    -[CalDAVServerVersion setSupportsChecksumming:](v2, "setSupportsChecksumming:", 0);
    -[CalDAVServerVersion setExpandPropertyReportIsUnreliable:](v2, "setExpandPropertyReportIsUnreliable:", 1);
    -[CalDAVServerVersion setSupportsTimeRangeFilterOnInbox:](v2, "setSupportsTimeRangeFilterOnInbox:", 0);
  }
  return v2;
}

- (id)type
{
  return CFSTR("Google");
}

- (id)supportedCalendarComponentSets
{
  return CFSTR("kCalDAVDoesNotSupportCalendarCreation");
}

- (BOOL)requiresOpeningAttachmentAsLink
{
  return 1;
}

- (BOOL)shouldUseDeleteAndAddInsteadOfMoveBetweenCalendars
{
  return 1;
}

@end
