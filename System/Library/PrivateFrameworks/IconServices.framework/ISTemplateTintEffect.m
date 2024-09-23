@implementation ISTemplateTintEffect

- (ISTemplateTintEffect)initWithColor:(id)a3
{
  id v5;
  ISTemplateTintEffect *v6;
  ISTemplateTintEffect *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISTemplateTintEffect;
  v6 = -[ISTemplateTintEffect init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_color, a3);

  return v7;
}

- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0C9DDB8];
  v6 = a4;
  objc_msgSend(v5, "filterWithName:", CFSTR("CIConstantColorGenerator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISTemplateTintEffect color](self, "color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ciColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v9, *MEMORY[0x1E0C9E1C0]);

  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CISourceInCompositing"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "outputImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v11, *MEMORY[0x1E0C9E1F8]);

  objc_msgSend(v10, "setValue:forKey:", v6, *MEMORY[0x1E0C9E190]);
  return v10;
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
