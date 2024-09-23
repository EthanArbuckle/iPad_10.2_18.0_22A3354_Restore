@implementation WKInterfaceButton

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

- (void)setBackgroundColor:(id)a3
{
  id v4;

  +[SPColorWrapper wrapperForColor:](SPColorWrapper, "wrapperForColor:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v4, CFSTR("color"));

}

- (void)setBackgroundImage:(id)a3
{
  -[WKInterfaceObject _setImage:forProperty:](self, "_setImage:forProperty:", a3, CFSTR("image"));
}

- (void)setBackgroundImageData:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[WKInterfaceObject _setImageData:forProperty:](self, "_setImageData:forProperty:", v4, CFSTR("image"));

}

- (void)setBackgroundImageNamed:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[WKInterfaceObject _setImageNamed:forProperty:](self, "_setImageNamed:forProperty:", v4, CFSTR("image"));

}

- (void)setEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v4, CFSTR("enabled"));

}

@end
