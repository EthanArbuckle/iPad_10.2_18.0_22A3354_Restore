@implementation FCContentColorMap

- (FCContentColorMap)initWithColors:(id)a3
{
  id v4;
  FCContentColorMap *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FCContentColorMap;
  v5 = -[FCContentColorMap init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v5->_colors, v8);

  }
  return v5;
}

- (NSArray)colors
{
  return self->_colors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colors, 0);
}

@end
