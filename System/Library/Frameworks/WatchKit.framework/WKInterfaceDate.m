@implementation WKInterfaceDate

- (void)setTimeZone:(id)a3
{
  id v4;

  objc_msgSend(a3, "name");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v4, CFSTR("timezone"));

}

- (void)setCalendar:(id)a3
{
  id v4;

  objc_msgSend(a3, "calendarIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v4, CFSTR("calendar"));

}

- (void)setTextColor:(id)a3
{
  id v4;

  +[SPColorWrapper wrapperForColor:](SPColorWrapper, "wrapperForColor:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v4, CFSTR("color"));

}

@end
