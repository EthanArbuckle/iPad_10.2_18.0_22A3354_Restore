@implementation WKInterfaceSwitch

- (void)setTitle:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v4, CFSTR("title"));

}

- (void)setAttributedTitle:(id)a3
{
  id v4;

  _WKValidatedAttributedString(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v4, CFSTR("title"));

}

- (void)setOn:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v4, CFSTR("#value"));

}

- (void)setEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v4, CFSTR("enabled"));

}

- (void)setColor:(id)a3
{
  id v4;

  +[SPColorWrapper wrapperForColor:](SPColorWrapper, "wrapperForColor:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v4, CFSTR("color"));

}

@end
