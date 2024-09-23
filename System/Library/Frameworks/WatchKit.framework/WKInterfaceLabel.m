@implementation WKInterfaceLabel

- (void)setText:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[WKInterfaceObject _sendValueChanged:](self, "_sendValueChanged:", v4);

}

- (void)setTextColor:(id)a3
{
  id v4;

  +[SPColorWrapper wrapperForColor:](SPColorWrapper, "wrapperForColor:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v4, CFSTR("color"));

}

- (void)setAttributedText:(id)a3
{
  id v4;

  _WKValidatedAttributedString(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:](self, "_sendValueChanged:", v4);

}

@end
