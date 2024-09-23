@implementation CLLocation(CLSTimeZones)

- (id)timeZone
{
  void *v2;
  void *v3;

  +[CLSTimeZones sharedInstance](CLSTimeZones, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeZoneWithLocation:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
