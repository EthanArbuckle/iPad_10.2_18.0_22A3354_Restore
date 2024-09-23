@implementation SKEffectNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKEffectNode)init
{
  SKEffectNode *v2;
  SKEffectNode *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKEffectNode;
  v2 = -[SKNode init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SKEffectNode setShouldEnableEffects:](v2, "setShouldEnableEffects:", 1);
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKEffectNode;
  -[SKNode encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  -[SKEffectNode filter](self, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_filter"));

  -[SKEffectNode shader](self, "shader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_shader"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SKEffectNode shouldRasterize](self, "shouldRasterize"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("_shouldRasterize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SKEffectNode shouldEnableEffects](self, "shouldEnableEffects"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("_shouldEnableEffects"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SKEffectNode shouldCenterFilter](self, "shouldCenterFilter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("_shouldCenterFilter"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", -[SKEffectNode blendMode](self, "blendMode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("_blendMode"));

}

- (SKEffectNode)initWithCoder:(id)a3
{
  id v4;
  SKEffectNode *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SKEffectNode;
  v5 = -[SKNode initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_blendMode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKEffectNode setBlendMode:](v5, "setBlendMode:", (int)objc_msgSend(v6, "intValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_filter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKEffectNode setFilter:](v5, "setFilter:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_shouldCenterFilter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKEffectNode setShouldCenterFilter:](v5, "setShouldCenterFilter:", objc_msgSend(v8, "BOOLValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_shouldEnableEffects"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKEffectNode setShouldEnableEffects:](v5, "setShouldEnableEffects:", objc_msgSend(v9, "BOOLValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_shouldRasterize"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKEffectNode setShouldRasterize:](v5, "setShouldRasterize:", objc_msgSend(v10, "BOOLValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_shader"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKEffectNode setShader:](v5, "setShader:", v11);

  }
  return v5;
}

- (void)_makeBackingNode
{
  SKCEffectNode *v2;

  v2 = (SKCEffectNode *)operator new();
  SKCEffectNode::SKCEffectNode(v2);
  return v2;
}

- (void)_didMakeBackingNode
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKEffectNode;
  -[SKNode _didMakeBackingNode](&v3, sel__didMakeBackingNode);
  self->_skcEffectNode = -[SKNode _backingNode](self, "_backingNode");
}

- (NSString)description
{
  void *v2;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  CGPoint v13;
  CGRect v14;

  v4 = (void *)MEMORY[0x1E0CB3940];
  -[SKNode name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SKEffectNode shouldEnableEffects](self, "shouldEnableEffects"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[SKEffectNode filter](self, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SKEffectNode filter](self, "filter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "name");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("nil");
  }
  -[SKNode position](self, "position");
  NSStringFromCGPoint(v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKNode calculateAccumulatedFrame](self, "calculateAccumulatedFrame");
  NSStringFromCGRect(v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<SKEffectNode> name:'%@' shouldEnableEffects:'%@' filter:'%@' position:%@ accumulatedFrame:%@"), v5, v6, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {

  }
  return (NSString *)v11;
}

- (BOOL)isEqualToNode:(id)a3
{
  SKEffectNode *v4;
  SKEffectNode *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  SKBlendMode v11;
  _BOOL4 v12;
  objc_super v14;

  v4 = (SKEffectNode *)a3;
  if (self == v4)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v14.receiver = self;
      v14.super_class = (Class)SKEffectNode;
      if (-[SKNode isEqualToNode:](&v14, sel_isEqualToNode_, v5)
        && (v6 = -[SKEffectNode shouldEnableEffects](self, "shouldEnableEffects"),
            v6 == -[SKEffectNode shouldEnableEffects](v5, "shouldEnableEffects")))
      {
        -[SKEffectNode filter](self, "filter");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKEffectNode filter](v5, "filter");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 == v9
          && (v10 = -[SKEffectNode shouldCenterFilter](self, "shouldCenterFilter"),
              v10 == -[SKEffectNode shouldCenterFilter](v5, "shouldCenterFilter"))
          && (v11 = -[SKEffectNode blendMode](self, "blendMode"), v11 == -[SKEffectNode blendMode](v5, "blendMode")))
        {
          v12 = -[SKEffectNode shouldRasterize](self, "shouldRasterize");
          v7 = v12 ^ -[SKEffectNode shouldRasterize](v5, "shouldRasterize") ^ 1;
        }
        else
        {
          LOBYTE(v7) = 0;
        }

      }
      else
      {
        LOBYTE(v7) = 0;
      }

    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }

  return v7;
}

- (void)setWarpGeometry:(id)a3
{
  SKCEffectNode::setWarpGeometry((id *)self->_skcEffectNode, (SKWarpGeometry *)a3);
}

- (SKWarpGeometry)warpGeometry
{
  return (SKWarpGeometry *)*((id *)self->_skcEffectNode + 89);
}

- (void)setSubdivisionLevels:(int64_t)a3
{
  SKCEffectNode::setSubdivisionLevels((SKCNode *)self->_skcEffectNode, a3);
}

- (int64_t)subdivisionLevels
{
  return *((unsigned int *)self->_skcEffectNode + 180);
}

- (void)setFilter:(CIFilter *)filter
{
  CIFilter *v5;

  objc_storeStrong((id *)self->_skcEffectNode + 70, filter);
  v5 = filter;
  SKCNode::setDirty((SKCNode *)self->_skcEffectNode);

}

- (CIFilter)filter
{
  return (CIFilter *)*((id *)self->_skcEffectNode + 70);
}

- (BOOL)shouldEnableEffects
{
  return SKCEffectNode::getEnableEffects((SKCEffectNode *)self->_skcEffectNode);
}

- (void)setShouldEnableEffects:(BOOL)shouldEnableEffects
{
  SKCEffectNode::setEnableEffects((SKCNode *)self->_skcEffectNode, shouldEnableEffects);
}

- (void)setShouldRasterize:(BOOL)shouldRasterize
{
  SKCEffectNode::setShouldRasterize((SKCNode *)self->_skcEffectNode, shouldRasterize);
}

- (BOOL)shouldRasterize
{
  return SKCEffectNode::getShouldRasterize((SKCEffectNode *)self->_skcEffectNode);
}

- (SKBlendMode)blendMode
{
  return *((_QWORD *)self->super._skcNode + 36);
}

- (void)setBlendMode:(SKBlendMode)blendMode
{
  SKCNode::setBlendMode((SKCNode *)self->super._skcNode, blendMode);
}

- (void)_scaleFactorChangedFrom:(float)a3 to:(float)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKEffectNode;
  -[SKNode _scaleFactorChangedFrom:to:](&v4, sel__scaleFactorChangedFrom_to_);
}

- (void)_flippedChangedFrom:(BOOL)a3 to:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKEffectNode;
  -[SKNode _flippedChangedFrom:to:](&v4, sel__flippedChangedFrom_to_, a3, a4);
}

- (BOOL)shouldCenterFilter
{
  return *((_BYTE *)self->_skcEffectNode + 568);
}

- (void)setShouldCenterFilter:(BOOL)shouldCenterFilter
{
  *((_BYTE *)self->_skcEffectNode + 568) = shouldCenterFilter;
}

- (void)setShader:(SKShader *)shader
{
  SKShader *v5;

  v5 = shader;
  objc_storeStrong((id *)self->_skcEffectNode + 72, shader);
  SKCNode::setDirty((SKCNode *)self->_skcEffectNode);
  SKCNode::recomputeFlags((SKCNode *)self->_skcEffectNode, 1);
  -[SKShader _addTargetNode:](v5, "_addTargetNode:", self);

}

- (SKShader)shader
{
  return (SKShader *)*((id *)self->_skcEffectNode + 72);
}

- (SKAttributeValue)valueForAttributeNamed:(NSString *)key
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKEffectNode;
  -[SKNode valueForAttributeNamed:](&v4, sel_valueForAttributeNamed_, key);
  return (SKAttributeValue *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setValue:(SKAttributeValue *)value forAttributeNamed:(NSString *)key
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKEffectNode;
  -[SKNode setValue:forAttributeNamed:](&v4, sel_setValue_forAttributeNamed_, value, key);
}

+ (id)debugHierarchyPropertyDescriptions
{
  const CFDictionaryKeyCallBacks *v2;
  const CFDictionaryValueCallBacks *v3;
  __CFDictionary *Mutable;
  __CFDictionary *v5;
  __CFDictionary *v6;
  __CFDictionary *v7;
  __CFDictionary *v8;
  __CFDictionary *v9;
  __CFDictionary *v10;
  void *v11;
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v2 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9AEB8];
  v3 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  Mutable = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("attributeValues"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v13[0] = Mutable;
  v5 = CFDictionaryCreateMutable(0, 7, v2, v3);
  CFDictionaryAddValue(v5, CFSTR("propertyName"), CFSTR("filter"));
  CFDictionaryAddValue(v5, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v5, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v13[1] = v5;
  v6 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v6, CFSTR("propertyName"), CFSTR("shouldCenterFilter"));
  CFDictionaryAddValue(v6, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v6, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v6, CFSTR("propertyFormat"), CFSTR("b"));
  v13[2] = v6;
  v7 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v7, CFSTR("propertyName"), CFSTR("shouldEnableEffects"));
  CFDictionaryAddValue(v7, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v7, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v7, CFSTR("propertyFormat"), CFSTR("b"));
  v13[3] = v7;
  v8 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v8, CFSTR("propertyName"), CFSTR("shouldRasterize"));
  CFDictionaryAddValue(v8, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v8, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v8, CFSTR("propertyFormat"), CFSTR("b"));
  v13[4] = v8;
  v9 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v9, CFSTR("propertyName"), CFSTR("shader"));
  CFDictionaryAddValue(v9, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v9, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v13[5] = v9;
  v10 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v10, CFSTR("propertyName"), CFSTR("blendMode"));
  CFDictionaryAddValue(v10, CFSTR("propertyRuntimeType"), CFSTR("SKBlendMode"));
  CFDictionaryAddValue(v10, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v10, CFSTR("propertyFormat"), CFSTR("uinteger"));
  v13[6] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8;
  id v9;
  NSString *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  id v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (NSString *)v8;
  if (-[NSString length](v10, "length"))
  {
    NSSelectorFromString(v10);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v11 = v10;
      if (v11)
      {
LABEL_4:
        objc_msgSend(v9, "valueForKey:", v11);
        a6 = (id *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
    }
    else
    {
      if (-[NSString length](v10, "length") < 2)
      {
        -[NSString uppercaseString](v10, "uppercaseString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[NSString substringToIndex:](v10, "substringToIndex:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "uppercaseString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSString substringFromIndex:](v10, "substringFromIndex:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByAppendingString:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(CFSTR("is"), "stringByAppendingString:", v15);
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      NSSelectorFromString(v16);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = v16;
      else
        v11 = 0;

      if (v11)
        goto LABEL_4;
    }
  }
  if (a6)
  {
    v17 = v9;
    v18 = v10;
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v17);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = &stru_1EA5021F8;
    }
    if (v18)
      v20 = v18;
    else
      v20 = &stru_1EA5021F8;
    v21 = v20;
    v26[0] = CFSTR("propertyName");
    v26[1] = CFSTR("objectDescription");
    v27[0] = v21;
    v27[1] = v19;
    v26[2] = CFSTR("errorDescription");
    v27[2] = &stru_1EA5021F8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DebugHierarchyErrorDomain"), 100, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_retainAutorelease(v23);
    *a6 = v24;

    v11 = 0;
    a6 = 0;
  }
  else
  {
    v11 = 0;
  }
LABEL_21:

  return a6;
}

@end
