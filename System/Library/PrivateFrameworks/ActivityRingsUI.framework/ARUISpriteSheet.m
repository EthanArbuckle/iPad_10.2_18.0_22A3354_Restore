@implementation ARUISpriteSheet

- (NSArray)sprites
{
  return self->_sprites;
}

- (ARUISpriteTexture)texture
{
  return self->_texture;
}

- (ARUISpriteSheet)initWithTexture:(id)a3 sprites:(id)a4
{
  id v7;
  id v8;
  ARUISpriteSheet *v9;
  ARUISpriteSheet *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ARUISpriteSheet;
  v9 = -[ARUISpriteSheet init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_texture, a3);
    objc_storeStrong((id *)&v10->_sprites, a4);
  }

  return v10;
}

- (ARUISpriteSheet)initWithSpriteSheet:(id)a3
{
  id v4;
  ARUISpriteSheet *v5;
  void *v6;
  uint64_t v7;
  ARUISpriteTexture *texture;
  id v9;
  void *v10;
  uint64_t v11;
  NSArray *sprites;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ARUISpriteSheet;
  v5 = -[ARUISpriteSheet init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "texture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    texture = v5->_texture;
    v5->_texture = (ARUISpriteTexture *)v7;

    v9 = objc_alloc(MEMORY[0x24BDBCE30]);
    objc_msgSend(v4, "sprites");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithArray:copyItems:", v10, 1);
    sprites = v5->_sprites;
    v5->_sprites = (NSArray *)v11;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ARUISpriteSheet;
  -[ARUISpriteSheet description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "substringWithRange:", 0, objc_msgSend(v3, "length") - 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@, texture: %@, sprites: %@>"), v4, self->_texture, self->_sprites);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ARUISpriteSheet initWithSpriteSheet:](+[ARUISpriteSheet allocWithZone:](ARUISpriteSheet, "allocWithZone:", a3), "initWithSpriteSheet:", self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_texture, 0);
  objc_storeStrong((id *)&self->_sprites, 0);
}

@end
