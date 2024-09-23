@implementation WKSPInterfaceButton

- (void)setTitle:(id)a3
{
  -[WKSPInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", a3, CFSTR("title"));
}

- (void)setAttributedTitle:(id)a3
{
  -[WKSPInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", a3, CFSTR("title"));
}

- (void)setBackgroundImage:(id)a3
{
  -[WKSPInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", a3, CFSTR("image"));
}

- (void)setBackgroundImageData:(id)a3
{
  -[WKSPInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", a3, CFSTR("image"));
}

- (void)setBackgroundImageNamed:(id)a3
{
  -[WKSPInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", a3, CFSTR("image"));
}

- (void)setEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WKSPInterfaceObject _sendValueChanged:](self, "_sendValueChanged:", v4);

}

@end
