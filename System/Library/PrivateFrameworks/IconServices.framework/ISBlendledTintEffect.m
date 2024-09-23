@implementation ISBlendledTintEffect

- (ISBlendledTintEffect)initWithColor:(id)a3
{
  id v5;
  ISBlendledTintEffect *v6;
  ISBlendledTintEffect *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISBlendledTintEffect;
  v6 = -[ISBlendledTintEffect init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_color, a3);

  return v7;
}

- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (void *)MEMORY[0x1E0C9DDB8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "filterWithName:", CFSTR("CIConstantColorGenerator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISBlendledTintEffect color](self, "color");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ciColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v11, *MEMORY[0x1E0C9E1C0]);

  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIBlendWithMask"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forKey:", v7, *MEMORY[0x1E0C9E210]);

  objc_msgSend(v12, "setValue:forKey:", v8, *MEMORY[0x1E0C9E190]);
  objc_msgSend(v9, "outputImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forKey:", v13, *MEMORY[0x1E0C9E1F8]);

  return v12;
}

- (IFColor)color
{
  return (IFColor *)objc_getProperty(self, a2, 8, 1);
}

- (void)setColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
