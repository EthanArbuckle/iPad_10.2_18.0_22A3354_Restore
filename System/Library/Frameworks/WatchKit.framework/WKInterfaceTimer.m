@implementation WKInterfaceTimer

- (void)setTextColor:(id)a3
{
  id v4;

  +[SPColorWrapper wrapperForColor:](SPColorWrapper, "wrapperForColor:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v4, CFSTR("color"));

}

- (void)setDate:(id)a3
{
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", a3, CFSTR("date"));
}

- (void)start
{
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", MEMORY[0x24BDBD1C8], CFSTR("enabled"));
}

- (void)stop
{
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", MEMORY[0x24BDBD1C0], CFSTR("enabled"));
}

@end
