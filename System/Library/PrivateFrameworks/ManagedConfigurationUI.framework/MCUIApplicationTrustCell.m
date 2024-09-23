@implementation MCUIApplicationTrustCell

- (void)setText:(id)a3 color:(id)a4 enabled:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a5;
  v14 = a4;
  v8 = (void *)MEMORY[0x1E0CEA718];
  v9 = a3;
  objc_msgSend(v8, "cellConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v5)
  {
    objc_msgSend(v10, "textProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setColor:", v14);

  }
  objc_msgSend(v11, "textProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAlignment:", 1);

  objc_msgSend(v11, "setText:", v9);
  -[MCUIApplicationTrustCell setContentConfiguration:](self, "setContentConfiguration:", v11);
  -[MCUIApplicationTrustCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v5);

}

@end
