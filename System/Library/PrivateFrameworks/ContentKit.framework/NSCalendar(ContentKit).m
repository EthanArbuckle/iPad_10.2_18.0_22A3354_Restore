@implementation NSCalendar(ContentKit)

- (id)wf_dateFromComponentsInCurrentTimeZone:()ContentKit
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(a1, "timeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v5);

  objc_msgSend(a1, "dateFromComponents:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
