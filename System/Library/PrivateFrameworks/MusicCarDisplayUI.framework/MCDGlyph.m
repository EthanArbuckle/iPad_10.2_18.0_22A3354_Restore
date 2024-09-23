@implementation MCDGlyph

+ (id)glyphFactory:(id)a3 pointSize:(double)a4 weight:(int64_t)a5 scale:(int64_t)a6
{
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = (void *)MEMORY[0x24BEBD660];
  v10 = a3;
  objc_msgSend(v9, "configurationWithPointSize:weight:scale:", a5, a6, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BEBDAB0], "_currentTraitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "systemImageNamed:compatibleWithTraitCollection:", v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "imageWithSymbolConfiguration:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)imageNamed:(id)a3 ofSize:(double)a4
{
  return +[MCDGlyph glyphFactory:pointSize:weight:scale:](MCDGlyph, "glyphFactory:pointSize:weight:scale:", a3, 4, 0, a4);
}

@end
