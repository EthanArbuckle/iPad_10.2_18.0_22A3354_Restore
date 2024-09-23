@implementation WKInterfaceGroup

- (void)setCornerRadius:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v4, CFSTR("radius"));

}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  _QWORD v13[5];

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  v13[4] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("top");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3.top);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v12[1] = CFSTR("left");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", left);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  v12[2] = CFSTR("bottom");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", bottom);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  v12[3] = CFSTR("right");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", right);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v11, CFSTR("contentInset"));

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
  -[WKInterfaceObject _setImage:forProperty:](self, "_setImage:forProperty:", a3, &stru_24D3BD200);
}

- (void)setBackgroundImageData:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[WKInterfaceObject _setImageData:forProperty:](self, "_setImageData:forProperty:", v4, &stru_24D3BD200);

}

- (void)setBackgroundImageNamed:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[WKInterfaceObject _setImageNamed:forProperty:](self, "_setImageNamed:forProperty:", v4, &stru_24D3BD200);

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
