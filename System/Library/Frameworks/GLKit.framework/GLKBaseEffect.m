@implementation GLKBaseEffect

- (GLKBaseEffect)init
{
  GLKBaseEffect *v2;
  GLKEffectPropertyConstantColor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GLKBaseEffect;
  v2 = -[GLKBaseEffect init](&v5, sel_init);
  if (v2)
  {
    v2->_propertyArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v2->_transform = objc_alloc_init(GLKEffectPropertyTransform);
    v3 = objc_alloc_init(GLKEffectPropertyConstantColor);
    v2->_constantColorProp = v3;
    -[NSMutableArray addObject:](v2->_propertyArray, "addObject:", v3);
    *(_WORD *)&v2->_colorMaterialEnabled = 0;
    v2->_lightModelAmbientColor = (_GLKVector4)xmmword_20DC81340;
    v2->_lightingType = 0;
    v2->_fog = 0;
    *(_OWORD *)&v2->_light0 = 0u;
    *(_OWORD *)&v2->_light2 = 0u;
    *(_OWORD *)&v2->_texture2d0 = 0u;
    v2->_textureOrder = 0;
    *(_DWORD *)&v2->_lightModelTwoSided = 16843008;
    -[GLKBaseEffect setLabel:](v2, "setLabel:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("GLKBaseEffect")));
    v2->_effect = 0;
  }
  return v2;
}

- (void)setTextureOrder:(NSArray *)textureOrder
{
  NSArray *v3;
  NSUInteger v6;
  NSArray *v7;
  uint64_t v8;
  id v9;
  NSArray *v10;

  v3 = self->_textureOrder;
  if (v3 != textureOrder)
  {
    if (!textureOrder)
    {

      v10 = 0;
LABEL_13:
      self->_textureOrder = v10;
      self->_effectStale = 1;
      return;
    }
    v6 = -[NSArray count](textureOrder, "count");
    v7 = self->_textureOrder;
    if (!v7 || -[NSArray count](v7, "count") != v6)
      goto LABEL_12;
    if (v6)
    {
      v8 = 0;
      while (1)
      {
        v9 = -[NSArray objectAtIndex:](textureOrder, "objectAtIndex:", v8);
        if (v9 != -[NSArray objectAtIndex:](self->_textureOrder, "objectAtIndex:", v8))
          break;
        if (v6 == ++v8)
          return;
      }
      if (v6 != v8)
      {
LABEL_12:

        v10 = textureOrder;
        goto LABEL_13;
      }
    }
  }
}

- (GLKEffectPropertyLight)light0
{
  GLKEffectPropertyLight *result;
  GLKEffectPropertyLight *v4;

  result = self->_light0;
  if (!result)
  {
    v4 = -[GLKEffectPropertyLight initWithTransform:lightingType:firstLight:]([GLKEffectPropertyLight alloc], "initWithTransform:lightingType:firstLight:", self->_transform, self->_lightingType, 1);
    self->_light0 = v4;
    -[NSMutableArray addObject:](self->_propertyArray, "addObject:", v4);
    self->_material = -[GLKBaseEffect material](self, "material");
    *(_WORD *)&self->_propertyArrayStale = 257;
    return self->_light0;
  }
  return result;
}

- (GLKEffectPropertyLight)light1
{
  GLKEffectPropertyLight *result;
  GLKEffectPropertyLight *v4;

  result = self->_light1;
  if (!result)
  {
    v4 = -[GLKEffectPropertyLight initWithTransform:lightingType:firstLight:]([GLKEffectPropertyLight alloc], "initWithTransform:lightingType:firstLight:", self->_transform, self->_lightingType, 0);
    self->_light1 = v4;
    -[NSMutableArray addObject:](self->_propertyArray, "addObject:", v4);
    self->_material = -[GLKBaseEffect material](self, "material");
    *(_WORD *)&self->_propertyArrayStale = 257;
    return self->_light1;
  }
  return result;
}

- (GLKEffectPropertyLight)light2
{
  GLKEffectPropertyLight *result;
  GLKEffectPropertyLight *v4;

  result = self->_light2;
  if (!result)
  {
    v4 = -[GLKEffectPropertyLight initWithTransform:lightingType:firstLight:]([GLKEffectPropertyLight alloc], "initWithTransform:lightingType:firstLight:", self->_transform, self->_lightingType, 0);
    self->_light2 = v4;
    -[NSMutableArray addObject:](self->_propertyArray, "addObject:", v4);
    self->_material = -[GLKBaseEffect material](self, "material");
    *(_WORD *)&self->_propertyArrayStale = 257;
    return self->_light2;
  }
  return result;
}

- (GLKEffectPropertyMaterial)material
{
  GLKEffectPropertyMaterial *result;
  GLKEffectPropertyMaterial *v4;

  result = self->_material;
  if (!result)
  {
    v4 = objc_alloc_init(GLKEffectPropertyMaterial);
    self->_material = v4;
    -[NSMutableArray addObject:](self->_propertyArray, "addObject:", v4);
    result = -[GLKBaseEffect material](self, "material");
    self->_material = result;
    *(_WORD *)&self->_propertyArrayStale = 257;
  }
  return result;
}

- (GLKEffectPropertyTexture)texture2d0
{
  GLKEffectPropertyTexture *result;
  GLKEffectPropertyTexture *v4;

  result = self->_texture2d0;
  if (!result)
  {
    v4 = objc_alloc_init(GLKEffectPropertyTexture);
    self->_texture2d0 = v4;
    -[NSMutableArray addObject:](self->_propertyArray, "addObject:", v4);
    *(_WORD *)&self->_propertyArrayStale = 257;
    return self->_texture2d0;
  }
  return result;
}

- (GLKEffectPropertyTexture)texture2d1
{
  GLKEffectPropertyTexture *result;
  GLKEffectPropertyTexture *v4;

  result = self->_texture2d1;
  if (!result)
  {
    v4 = objc_alloc_init(GLKEffectPropertyTexture);
    self->_texture2d1 = v4;
    -[NSMutableArray addObject:](self->_propertyArray, "addObject:", v4);
    *(_WORD *)&self->_propertyArrayStale = 257;
    return self->_texture2d1;
  }
  return result;
}

- (GLKEffectPropertyFog)fog
{
  GLKEffectPropertyFog *result;
  GLKEffectPropertyFog *v4;

  result = self->_fog;
  if (!result)
  {
    v4 = objc_alloc_init(GLKEffectPropertyFog);
    self->_fog = v4;
    -[NSMutableArray addObject:](self->_propertyArray, "addObject:", v4);
    *(_WORD *)&self->_propertyArrayStale = 257;
    return self->_fog;
  }
  return result;
}

- (void)setConstantColor:(GLKVector4)constantColor
{
  -[GLKEffectPropertyConstantColor setColor:](self->_constantColorProp, "setColor:", *(_QWORD *)&constantColor.x, *(_QWORD *)&constantColor.v[2]);
}

- (GLKVector4)constantColor
{
  uint64_t v2;
  uint64_t v3;
  GLKVector4 result;

  v2 = -[GLKEffectPropertyConstantColor color](self->_constantColorProp, "color");
  *(_QWORD *)&result.v[2] = v3;
  *(_QWORD *)&result.x = v2;
  return result;
}

- (void)setLightModelAmbientColor:(GLKVector4)lightModelAmbientColor
{
  float v3;
  float v4;
  float v5;
  float v6;
  float32x4_t v7;
  int8x16_t v8;
  GLKEffect *effect;

  v7.i64[0] = __PAIR64__(LODWORD(v4), LODWORD(v3));
  v7.i64[1] = __PAIR64__(LODWORD(v6), LODWORD(v5));
  v8 = (int8x16_t)vceqq_f32(v7, (float32x4_t)self->_lightModelAmbientColor);
  *(int8x8_t *)v8.i8 = vand_s8((int8x8_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL), vand_s8(*(int8x8_t *)v8.i8, (int8x8_t)0x100000001));
  if (!vand_s8((int8x8_t)vdup_lane_s32(*(int32x2_t *)v8.i8, 1), *(int8x8_t *)v8.i8).u32[0])
  {
    self->_lightModelAmbientColor.x = v3;
    self->_lightModelAmbientColor.y = v4;
    self->_lightModelAmbientColor.z = v5;
    self->_lightModelAmbientColor.w = v6;
    effect = self->_effect;
    if (effect)
      -[GLKEffect setLightModelAmbientColor:](effect, "setLightModelAmbientColor:", *(_QWORD *)&lightModelAmbientColor.x, *(_QWORD *)&lightModelAmbientColor.v[2]);
  }
}

- (void)setColorMaterialEnabled:(GLBOOLean)colorMaterialEnabled
{
  GLKEffect *effect;

  if (self->_colorMaterialEnabled != colorMaterialEnabled)
  {
    self->_colorMaterialEnabled = colorMaterialEnabled;
    effect = self->_effect;
    if (effect)
      -[GLKEffect setColorMaterialEnabled:](effect, "setColorMaterialEnabled:");
  }
}

- (void)setLightModelTwoSided:(GLBOOLean)lightModelTwoSided
{
  GLKEffect *effect;

  if (self->_lightModelTwoSided != lightModelTwoSided)
  {
    self->_lightModelTwoSided = lightModelTwoSided;
    effect = self->_effect;
    if (effect)
      -[GLKEffect setLightModelTwoSided:](effect, "setLightModelTwoSided:");
  }
}

- (void)setLightingType:(GLKLightingType)lightingType
{
  uint64_t v3;
  GLKEffectPropertyLight *light0;
  GLKEffectPropertyLight *light1;
  GLKEffectPropertyLight *light2;

  if (self->_lightingType != lightingType)
  {
    v3 = *(_QWORD *)&lightingType;
    light0 = self->_light0;
    if (light0)
      -[GLKEffectPropertyLight setLightingType:](light0, "setLightingType:", *(_QWORD *)&lightingType);
    light1 = self->_light1;
    if (light1)
      -[GLKEffectPropertyLight setLightingType:](light1, "setLightingType:", v3);
    light2 = self->_light2;
    if (light2)
      -[GLKEffectPropertyLight setLightingType:](light2, "setLightingType:", v3);
    self->_lightingType = v3;
    self->_effectStale = 1;
  }
}

- (void)setUseConstantColor:(GLBOOLean)useConstantColor
{
  if (self->_useConstantColor != useConstantColor)
  {
    self->_useConstantColor = useConstantColor;
    self->_effectStale = 1;
  }
}

- (BOOL)perVertexLightingEnabled
{
  if (self->_lightingType)
    return 0;
  if (-[GLKEffectPropertyLight enabled](self->_light0, "enabled")
    || -[GLKEffectPropertyLight enabled](self->_light1, "enabled"))
  {
    return 1;
  }
  return -[GLKEffectPropertyLight enabled](self->_light2, "enabled") != 0;
}

- (BOOL)perPixelLightingEnabled
{
  if (self->_lightingType != 1)
    return 0;
  if (-[GLKEffectPropertyLight enabled](self->_light0, "enabled")
    || -[GLKEffectPropertyLight enabled](self->_light1, "enabled"))
  {
    return 1;
  }
  return -[GLKEffectPropertyLight enabled](self->_light2, "enabled") != 0;
}

- (void)updateBaseEffect
{
  GLKEffect *effect;
  GLKEffect *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  effect = self->_effect;
  if (effect)
  {
    if (self->_propertyArrayStale)
    {

      self->_effect = -[GLKEffect initWithPropertyArray:]([GLKEffect alloc], "initWithPropertyArray:", self->_propertyArray);
    }
  }
  else
  {
    -[NSMutableArray insertObject:atIndex:](self->_propertyArray, "insertObject:atIndex:", self->_transform, 0);
    v4 = -[GLKEffect initWithPropertyArray:]([GLKEffect alloc], "initWithPropertyArray:", self->_propertyArray);
    self->_effect = v4;
    *(float *)&v5 = self->_lightModelAmbientColor.x;
    *(float *)&v6 = self->_lightModelAmbientColor.y;
    *(float *)&v7 = self->_lightModelAmbientColor.z;
    *(float *)&v8 = self->_lightModelAmbientColor.w;
    -[GLKEffect setLightModelAmbientColor:](v4, "setLightModelAmbientColor:", v5, v6, v7, v8);
    -[GLKEffect setColorMaterialEnabled:](self->_effect, "setColorMaterialEnabled:", self->_colorMaterialEnabled);
    -[GLKEffect setLightModelTwoSided:](self->_effect, "setLightModelTwoSided:", self->_lightModelTwoSided);
  }
  -[GLKEffect setLabel:](self->_effect, "setLabel:", -[GLKBaseEffect label](self, "label"));
  -[GLKEffectPropertyConstantColor setEnabled:](self->_constantColorProp, "setEnabled:", self->_useConstantColor);
  if (self->_textureOrder)
    -[GLKEffect setTextureOrder:](self->_effect, "setTextureOrder:");
}

- (void)prepareToDraw
{
  if (self->_effectStale)
  {
    -[GLKBaseEffect updateBaseEffect](self, "updateBaseEffect");
    *(_WORD *)&self->_propertyArrayStale = 0;
  }
  -[GLKEffect bind](self->_effect, "bind");
}

- (id)description
{
  id v3;
  const char *v4;
  const char *v5;
  GLKEffectPropertyConstantColor *constantColorProp;
  float v7;
  float v8;
  float v9;
  float v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("self = %p - %@\n{\n"), self, self->_label);
  if (self->_lightingType)
    v4 = "GLKLightingTypePerPixel";
  else
    v4 = "GLKLightingTypePerVertex";
  objc_msgSend(v3, "appendFormat:", CFSTR("lightingType:       %s\n"), v4);
  if (self->_lightModelTwoSided)
    v5 = "GL_TRUE";
  else
    v5 = "GL_FALSE";
  objc_msgSend(v3, "appendFormat:", CFSTR("lightModelTwoSided: %s\n"), v5);
  if (self->_transform)
    objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), -[GLKEffectPropertyTransform description](-[GLKBaseEffect transform](self, "transform"), "description"));
  else
    objc_msgSend(v3, "appendFormat:", CFSTR("transform = \t\t\tNULL\n"), v12);
  if (self->_light0)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("light0 = %p\n"), -[GLKBaseEffect light0](self, "light0"));
    objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), -[GLKEffectPropertyLight description](-[GLKBaseEffect light0](self, "light0"), "description"));
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("light0 = \tNULL\n"), v13);
  }
  if (self->_light1)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("light1 = %p\n"), -[GLKBaseEffect light1](self, "light1"));
    objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), -[GLKEffectPropertyLight description](-[GLKBaseEffect light1](self, "light1"), "description"));
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("light1 = \tNULL\n"), v14);
  }
  if (self->_light2)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("light2 = %p\n"), -[GLKBaseEffect light2](self, "light2"));
    objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), -[GLKEffectPropertyLight description](-[GLKBaseEffect light2](self, "light2"), "description"));
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("light2 = \tNULL\n"), v15);
  }
  if (self->_material)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("material = %p\n"), -[GLKBaseEffect material](self, "material"));
    objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), -[GLKEffectPropertyMaterial description](-[GLKBaseEffect material](self, "material"), "description"));
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("material = \tNULL\n"), v16);
  }
  if (self->_texture2d0)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("texture2d0 = %p\n"), -[GLKBaseEffect texture2d0](self, "texture2d0"));
    objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), -[GLKEffectPropertyTexture description](-[GLKBaseEffect texture2d0](self, "texture2d0"), "description"));
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("texture2d0 = \t\tNULL\n"), v17);
  }
  if (self->_texture2d1)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("texture2d1 = %p\n"), -[GLKBaseEffect texture2d1](self, "texture2d1"));
    objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), -[GLKEffectPropertyTexture description](-[GLKBaseEffect texture2d1](self, "texture2d1"), "description"));
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("texture2d1 = \t\tNULL\n"), v18);
  }
  constantColorProp = self->_constantColorProp;
  if (constantColorProp)
  {
    -[GLKEffectPropertyConstantColor color](constantColorProp, "color");
    objc_msgSend(v3, "appendFormat:", CFSTR("constantColor = {%f,%f,%f,%f}\n"), v9, v10, v7, v8);
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("constantColor = \tNULL\n"), v19, v21, v22, v23);
  }
  if (self->_fog)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("fog = %p\n"), -[GLKBaseEffect fog](self, "fog"));
    objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), -[GLKEffectPropertyFog description](-[GLKBaseEffect fog](self, "fog"), "description"));
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("fog = \t\t\t\tNULL\n"), v20);
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("}"));
  return v3;
}

- (void)dealloc
{
  GLKEffect *effect;
  objc_super v4;

  effect = self->_effect;
  if (effect)

  v4.receiver = self;
  v4.super_class = (Class)GLKBaseEffect;
  -[GLKBaseEffect dealloc](&v4, sel_dealloc);
}

- (GLBOOLean)colorMaterialEnabled
{
  return self->_colorMaterialEnabled;
}

- (GLBOOLean)lightModelTwoSided
{
  return self->_lightModelTwoSided;
}

- (GLKEffectPropertyTransform)transform
{
  return self->_transform;
}

- (GLKLightingType)lightingType
{
  return self->_lightingType;
}

- (GLKVector4)lightModelAmbientColor
{
  GLKVector4 result;

  *(_QWORD *)&result.v[2] = a2;
  *(_QWORD *)&result.x = self;
  return result;
}

- (NSArray)textureOrder
{
  return self->_textureOrder;
}

- (GLKEffectPropertyConstantColor)constantColorProp
{
  return self->_constantColorProp;
}

- (GLBOOLean)useConstantColor
{
  return self->_useConstantColor;
}

- (unsigned)propertyArrayStale
{
  return self->_propertyArrayStale;
}

- (void)setPropertyArrayStale:(unsigned __int8)a3
{
  self->_propertyArrayStale = a3;
}

- (NSMutableArray)propertyArray
{
  return self->_propertyArray;
}

- (unsigned)effectStale
{
  return self->_effectStale;
}

- (void)setEffectStale:(unsigned __int8)a3
{
  self->_effectStale = a3;
}

- (GLKEffect)effect
{
  return self->_effect;
}

- (void)setEffect:(id)a3
{
  self->_effect = (GLKEffect *)a3;
}

- (unsigned)programName
{
  return self->_programName;
}

- (void)setProgramName:(unsigned int)a3
{
  self->_programName = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(NSString *)label
{
  objc_setProperty_nonatomic_copy(self, a2, label, 120);
}

@end
