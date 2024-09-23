@implementation IKJSBrowser

- (double)cornerRadius
{
  void *v2;
  double v3;
  double v4;

  -[IKJSBrowser bridge](self, "bridge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cornerRadius");
  v4 = v3;

  return v4;
}

- (void)setCornerRadius:(double)a3
{
  id v4;

  -[IKJSBrowser bridge](self, "bridge");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", a3);

}

- (double)interitemSpacing
{
  void *v2;
  double v3;
  double v4;

  -[IKJSBrowser bridge](self, "bridge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interitemSpacing");
  v4 = v3;

  return v4;
}

- (void)setInteritemSpacing:(double)a3
{
  id v4;

  -[IKJSBrowser bridge](self, "bridge");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteritemSpacing:", a3);

}

- (NSDictionary)maskInset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[IKJSBrowser bridge](self, "bridge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maskInset");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("top"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("left"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("bottom"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v15, CFSTR("right"));

  v16 = (void *)objc_msgSend(v11, "copy");
  return (NSDictionary *)v16;
}

- (void)setMaskInset:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  id v17;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("top"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;
  objc_msgSend(v4, "objectForKey:", CFSTR("left"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;
  objc_msgSend(v4, "objectForKey:", CFSTR("bottom"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;
  objc_msgSend(v4, "objectForKey:", CFSTR("right"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  -[IKJSBrowser bridge](self, "bridge");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMaskInset:", v7, v10, v13, v16);

}

- (void)present
{
  id v2;

  -[IKJSBrowser bridge](self, "bridge");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "present");

}

- (IKAppBrowserBridge)bridge
{
  return self->_bridge;
}

- (void)setBridge:(id)a3
{
  objc_storeStrong((id *)&self->_bridge, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bridge, 0);
  objc_storeStrong((id *)&self->_maskInset, 0);
}

@end
