@implementation WKInterfaceImage

- (void)setImage:(id)a3
{
  -[WKInterfaceObject _setImage:forProperty:](self, "_setImage:forProperty:", a3, &stru_24D3BD200);
}

- (void)setImageData:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[WKInterfaceObject _setImageData:forProperty:](self, "_setImageData:forProperty:", v4, &stru_24D3BD200);

}

- (void)setImageNamed:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[WKInterfaceObject _setImageNamed:forProperty:](self, "_setImageNamed:forProperty:", v4, &stru_24D3BD200);

}

- (void)setTintColor:(id)a3
{
  id v4;

  +[SPColorWrapper wrapperForColor:](SPColorWrapper, "wrapperForColor:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v4, CFSTR("tintColor"));

}

- (void)startAnimating
{
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", &stru_24D3BD200, CFSTR(".start"));
}

- (void)startAnimatingWithImagesInRange:(_NSRange)a3 duration:(double)a4 repeatCount:(int64_t)a5
{
  NSUInteger length;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  length = a3.length;
  v14[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3.location);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", length);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v10;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v11;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v13, CFSTR(".start"));

}

- (void)stopAnimating
{
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", &stru_24D3BD200, CFSTR(".stop"));
}

@end
