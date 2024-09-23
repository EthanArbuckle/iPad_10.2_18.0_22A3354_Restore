@implementation AVTComponent

- (int64_t)type
{
  return self->_type;
}

- (void)setMaterial:(id)a3 atIndex:(unint64_t)a4
{
  id v7;
  id v8;

  v7 = a3;
  if (v7 || a4)
  {
    if (a4 >= 3)
      -[AVTComponent setMaterial:atIndex:].cold.1();
    v8 = v7;
    objc_storeStrong((id *)&self->_materials[a4], a3);
    v7 = v8;
  }

}

- (id)materialAtIndex:(unint64_t)a3
{
  AVTMaterial *v5;

  if (a3 > 2)
    return 0;
  v5 = self->_materials[a3];
  if (a3)
  {
    if (!v5)
    {
      -[AVTComponent materialAtIndex:](self, "materialAtIndex:", a3 - 1);
      v5 = (AVTMaterial *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v5;
}

- (AVTComponent)initWithType:(int64_t)a3 assets:(id)a4 morphVariant:(id)a5 imageVariant:(id)a6 materialVariant:(id)a7 morphVariantIntensity:(float)a8 bodyPoseVariantIntensity:(float)a9 textureAssetPresence:(float)a10
{
  id v19;
  id v20;
  id v21;
  id v22;
  AVTComponent *v23;
  AVTComponent *v24;
  objc_super v26;

  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v26.receiver = self;
  v26.super_class = (Class)AVTComponent;
  v23 = -[AVTComponent init](&v26, sel_init);
  v24 = v23;
  if (v23)
  {
    v23->_type = a3;
    objc_storeStrong((id *)&v23->_assets, a4);
    objc_storeStrong((id *)&v24->_morphVariant, a5);
    objc_storeStrong((id *)&v24->_imageVariant, a6);
    objc_storeStrong((id *)&v24->_materialVariant, a7);
    v24->_morphVariantIntensity = a8;
    v24->_bodyPoseVariantIntensity = a9;
    v24->_textureAssetPresence = a10;
  }

  return v24;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AVTComponentTypeToString(self->_type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p, type=%@"), v5, self, v6);

  if (self->_assets)
    objc_msgSend(v7, "appendFormat:", CFSTR(" assets: %@"), self->_assets);
  if (self->_morphVariant)
    objc_msgSend(v7, "appendFormat:", CFSTR(" morph variant: %@"), self->_morphVariant);
  if (self->_imageVariant)
    objc_msgSend(v7, "appendFormat:", CFSTR(" image variant: %@"), self->_imageVariant);
  if (self->_materialVariant)
    objc_msgSend(v7, "appendFormat:", CFSTR(" material variant: %@"), self->_materialVariant);
  objc_msgSend(v7, "appendString:", CFSTR(">"));
  return v7;
}

- (NSArray)assets
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)morphVariant
{
  return self->_morphVariant;
}

- (NSString)imageVariant
{
  return self->_imageVariant;
}

- (NSString)materialVariant
{
  return self->_materialVariant;
}

- (float)morphVariantIntensity
{
  return self->_morphVariantIntensity;
}

- (float)bodyPoseVariantIntensity
{
  return self->_bodyPoseVariantIntensity;
}

- (float)textureAssetPresence
{
  return self->_textureAssetPresence;
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_materialVariant, 0);
  objc_storeStrong((id *)&self->_imageVariant, 0);
  objc_storeStrong((id *)&self->_morphVariant, 0);
  for (i = 40; i != 16; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

- (void)setMaterial:atIndex:.cold.1()
{
  __assert_rtn("-[AVTComponent setMaterial:atIndex:]", "AVTComponent.m", 30, "index < AVT_MAX_COLOR_PRESETS");
}

@end
