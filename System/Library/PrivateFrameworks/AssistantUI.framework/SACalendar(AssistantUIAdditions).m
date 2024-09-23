@implementation SACalendar(AssistantUIAdditions)

- (id)afui_timeZone
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDBCF38];
  objc_msgSend(a1, "timeZoneId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "timeZoneWithName:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
