@implementation SKLightNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_makeBackingNode
{
  SKCLightNode *v2;

  v2 = (SKCLightNode *)operator new();
  SKCLightNode::SKCLightNode(v2);
  return v2;
}

- (void)_didMakeBackingNode
{
  self->_skcLightNode = -[SKNode _backingNode](self, "_backingNode");
}

- (SKLightNode)init
{
  SKLightNode *v2;
  SKLightNode *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKLightNode;
  v2 = -[SKNode init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SKLightNode commonInit](v2, "commonInit");
    -[SKLightNode setEnabled:](v3, "setEnabled:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKLightNode setLightColor:](v3, "setLightColor:", v4);

    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKLightNode setShadowColor:](v3, "setShadowColor:", v5);

    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKLightNode setAmbientColor:](v3, "setAmbientColor:", v6);

    -[SKLightNode setFalloff:](v3, "setFalloff:", 1.0);
    -[SKLightNode setLightCategoryBitMask:](v3, "setLightCategoryBitMask:", 1);
  }
  return v3;
}

- (SKLightNode)initWithCoder:(id)a3
{
  id v4;
  SKLightNode *v5;
  SKLightNode *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)SKLightNode;
  v5 = -[SKNode initWithCoder:](&v35, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[SKLightNode commonInit](v5, "commonInit");
    -[SKLightNode setEnabled:](v6, "setEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enabled")));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("lightDecay"));
    -[SKLightNode setLightDecay:](v6, "setLightDecay:");
    v7 = (void *)MEMORY[0x1E0CEA478];
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("lightColor.redComponent"));
    v9 = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("lightColor.greenComponent"));
    v11 = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("lightColor.blueComponent"));
    v13 = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("lightColor.alphaComponent"));
    objc_msgSend(v7, "colorWithRed:green:blue:alpha:", v9, v11, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKLightNode setLightColor:](v6, "setLightColor:", v15);

    v16 = (void *)MEMORY[0x1E0CEA478];
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ambientColor.redComponent"));
    v18 = v17;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ambientColor.greenComponent"));
    v20 = v19;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ambientColor.blueComponent"));
    v22 = v21;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ambientColor.alphaComponent"));
    objc_msgSend(v16, "colorWithRed:green:blue:alpha:", v18, v20, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKLightNode setAmbientColor:](v6, "setAmbientColor:", v24);

    v25 = (void *)MEMORY[0x1E0CEA478];
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("shadowColor.redComponent"));
    v27 = v26;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("shadowColor.greenComponent"));
    v29 = v28;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("shadowColor.blueComponent"));
    v31 = v30;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("shadowColor.alphaComponent"));
    objc_msgSend(v25, "colorWithRed:green:blue:alpha:", v27, v29, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKLightNode setShadowColor:](v6, "setShadowColor:", v33);

    -[SKLightNode setLightCategoryBitMask:](v6, "setLightCategoryBitMask:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("lightCategoryBitMask")));
  }

  return v6;
}

- (BOOL)isEqualToNode:(id)a3
{
  SKLightNode *v4;
  SKLightNode *v5;
  _BOOL4 v6;
  uint32_t v7;
  id v8;
  CGColor *v9;
  id v10;
  id v11;
  CGColor *v12;
  id v13;
  id v14;
  CGColor *v15;
  id v16;
  double v17;
  double v18;
  float v19;
  double v20;
  BOOL v21;
  objc_super v23;

  v4 = (SKLightNode *)a3;
  if (self == v4)
  {
    v21 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v23.receiver = self;
      v23.super_class = (Class)SKLightNode;
      if (-[SKNode isEqualToNode:](&v23, sel_isEqualToNode_, v5)
        && (v6 = -[SKLightNode isEnabled](self, "isEnabled"), v6 == -[SKLightNode isEnabled](v5, "isEnabled"))
        && (v7 = -[SKLightNode categoryBitMask](self, "categoryBitMask"),
            v7 == -[SKLightNode categoryBitMask](v5, "categoryBitMask")))
      {
        -[SKLightNode ambientColor](self, "ambientColor");
        v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v9 = (CGColor *)objc_msgSend(v8, "CGColor");
        -[SKLightNode ambientColor](v5, "ambientColor");
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        if (CGColorEqualToColor(v9, (CGColorRef)objc_msgSend(v10, "CGColor")))
        {
          -[SKLightNode lightColor](self, "lightColor");
          v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v12 = (CGColor *)objc_msgSend(v11, "CGColor");
          -[SKLightNode lightColor](v5, "lightColor");
          v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          if (CGColorEqualToColor(v12, (CGColorRef)objc_msgSend(v13, "CGColor")))
          {
            -[SKLightNode shadowColor](self, "shadowColor");
            v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v15 = (CGColor *)objc_msgSend(v14, "CGColor");
            -[SKLightNode shadowColor](v5, "shadowColor");
            v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            if (CGColorEqualToColor(v15, (CGColorRef)objc_msgSend(v16, "CGColor")))
            {
              -[SKLightNode falloff](self, "falloff");
              v18 = v17;
              -[SKLightNode falloff](v5, "falloff");
              v19 = v18;
              *(float *)&v20 = v20;
              v21 = (COERCE_UNSIGNED_INT(v19 - *(float *)&v20) & 0x60000000) == 0;
            }
            else
            {
              v21 = 0;
            }

          }
          else
          {
            v21 = 0;
          }

        }
        else
        {
          v21 = 0;
        }

      }
      else
      {
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  void *v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  void *v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SKLightNode;
  -[SKNode encodeWithCoder:](&v32, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[SKLightNode isEnabled](self, "isEnabled"), CFSTR("enabled"));
  -[SKLightNode lightDecay](self, "lightDecay");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("lightDecay"));
  -[SKLightNode lightColor](self, "lightColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentRGBA");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("lightColor.redComponent"), v7);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("lightColor.greenComponent"), v9);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("lightColor.blueComponent"), v11);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("lightColor.alphaComponent"), v13);
  -[SKLightNode ambientColor](self, "ambientColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentRGBA");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("ambientColor.redComponent"), v16);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("ambientColor.greenComponent"), v18);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("ambientColor.blueComponent"), v20);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("ambientColor.alphaComponent"), v22);
  -[SKLightNode shadowColor](self, "shadowColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "componentRGBA");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("shadowColor.redComponent"), v25);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("shadowColor.greenComponent"), v27);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("shadowColor.blueComponent"), v29);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("shadowColor.alphaComponent"), v31);
  objc_msgSend(v4, "encodeInt32:forKey:", -[SKLightNode lightCategoryBitMask](self, "lightCategoryBitMask"), CFSTR("lightCategoryBitMask"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SKLightNode;
  v4 = -[SKNode copyWithZone:](&v9, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setLightCategoryBitMask:", -[SKLightNode lightCategoryBitMask](self, "lightCategoryBitMask"));
  -[SKLightNode lightColor](self, "lightColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLightColor:", v5);

  -[SKLightNode ambientColor](self, "ambientColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAmbientColor:", v6);

  -[SKLightNode shadowColor](self, "shadowColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShadowColor:", v7);

  objc_msgSend(v4, "setEnabled:", -[SKLightNode isEnabled](self, "isEnabled"));
  -[SKLightNode lightDecay](self, "lightDecay");
  objc_msgSend(v4, "setLightDecay:");
  return v4;
}

- (CGFloat)falloff
{
  return *((float *)self->_skcLightNode + 160);
}

- (void)setFalloff:(CGFloat)falloff
{
  float v3;

  v3 = falloff;
  *((float *)self->_skcLightNode + 160) = v3;
}

- (uint32_t)categoryBitMask
{
  return *((_DWORD *)self->_skcLightNode + 161);
}

- (void)setCategoryBitMask:(uint32_t)categoryBitMask
{
  *((_DWORD *)self->_skcLightNode + 161) = categoryBitMask;
}

- (UIColor)lightColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithVectorRGBA:", *((double *)self->_skcLightNode + 74));
}

- (void)setLightColor:(UIColor *)lightColor
{
  UIColor *v4;
  _OWORD *skcLightNode;
  __int128 v6;
  UIColor *v7;

  v4 = lightColor;
  skcLightNode = self->_skcLightNode;
  v7 = v4;
  -[UIColor vectorRGBA](v4, "vectorRGBA");
  skcLightNode[37] = v6;

}

- (UIColor)ambientColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithVectorRGBA:", *((double *)self->_skcLightNode + 76));
}

- (void)setAmbientColor:(UIColor *)ambientColor
{
  UIColor *v4;
  _OWORD *skcLightNode;
  __int128 v6;
  UIColor *v7;

  v4 = ambientColor;
  skcLightNode = self->_skcLightNode;
  v7 = v4;
  -[UIColor vectorRGBA](v4, "vectorRGBA");
  skcLightNode[38] = v6;

}

- (void)setShadowColor:(UIColor *)shadowColor
{
  UIColor *v4;
  _OWORD *skcLightNode;
  __int128 v6;
  UIColor *v7;

  v4 = shadowColor;
  skcLightNode = self->_skcLightNode;
  v7 = v4;
  -[UIColor vectorRGBA](v4, "vectorRGBA");
  skcLightNode[39] = v6;

}

- (UIColor)shadowColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithVectorRGBA:", *((double *)self->_skcLightNode + 78));
}

- (void)setEnabled:(BOOL)enabled
{
  *((_BYTE *)self->_skcLightNode + 584) = enabled;
}

- (BOOL)isEnabled
{
  return *((_BYTE *)self->_skcLightNode + 584);
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
  void *v10;
  _QWORD v12[7];

  v12[6] = *MEMORY[0x1E0C80C00];
  v2 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9AEB8];
  v3 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  Mutable = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("ambientColor"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("CGColor"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("color"));
  v12[0] = Mutable;
  v5 = CFDictionaryCreateMutable(0, 7, v2, v3);
  CFDictionaryAddValue(v5, CFSTR("propertyName"), CFSTR("categoryBitMask"));
  CFDictionaryAddValue(v5, CFSTR("propertyRuntimeType"), CFSTR("unsigned long"));
  CFDictionaryAddValue(v5, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v5, CFSTR("propertyFormat"), CFSTR("ul"));
  v12[1] = v5;
  v6 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v6, CFSTR("propertyName"), CFSTR("enabled"));
  CFDictionaryAddValue(v6, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v6, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v6, CFSTR("propertyFormat"), CFSTR("b"));
  v12[2] = v6;
  v7 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v7, CFSTR("propertyName"), CFSTR("falloff"));
  CFDictionaryAddValue(v7, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v7, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v7, CFSTR("propertyFormat"), CFSTR("CGf"));
  v12[3] = v7;
  v8 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v8, CFSTR("propertyName"), CFSTR("lightColor"));
  CFDictionaryAddValue(v8, CFSTR("propertyRuntimeType"), CFSTR("CGColor"));
  CFDictionaryAddValue(v8, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  CFDictionaryAddValue(v8, CFSTR("propertyFormat"), CFSTR("color"));
  v12[4] = v8;
  v9 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v9, CFSTR("propertyName"), CFSTR("shadowColor"));
  CFDictionaryAddValue(v9, CFSTR("propertyRuntimeType"), CFSTR("CGColor"));
  CFDictionaryAddValue(v9, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  CFDictionaryAddValue(v9, CFSTR("propertyFormat"), CFSTR("color"));
  v12[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8;
  CGColor *v9;
  CGColorSpace *ColorSpace;
  CFStringRef v11;
  size_t NumberOfComponents;
  uint64_t v13;
  CFIndex v14;
  __CFString *Mutable;
  CFIndex v16;
  uint64_t v17;
  CGColor *v18;
  CGColorSpace *v19;
  CFStringRef v20;
  size_t v21;
  uint64_t v22;
  CFIndex v23;
  __CFString *v24;
  CFIndex v25;
  uint64_t v26;
  CGColor *v27;
  CGColorSpace *v28;
  CFStringRef v29;
  size_t v30;
  uint64_t v31;
  CFIndex v32;
  CFIndex v33;
  uint64_t v34;
  id v35;
  NSString *v36;
  NSString *v37;
  const CGFloat *Components;
  const void **v39;
  const void **v40;
  uint64_t v41;
  CFNumberRef *v42;
  CFArrayRef v43;
  uint64_t v44;
  CFTypeRef *v45;
  const CGFloat *v46;
  const void **v47;
  const void **v48;
  uint64_t v49;
  CFNumberRef *v50;
  CFArrayRef v51;
  uint64_t v52;
  CFTypeRef *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  const CGFloat *v58;
  const void **v59;
  const void **v60;
  uint64_t v61;
  CFNumberRef *v62;
  CFArrayRef v63;
  uint64_t v64;
  CFTypeRef *v65;
  NSString *v66;
  id v67;
  __CFString *v68;
  __CFString *v69;
  __CFString *v70;
  __CFString *v71;
  void *v72;
  void *v73;
  id v74;
  id v76;
  id v77;
  id v78;
  id v79;
  __CFDictionary *theDict;
  _QWORD v81[3];
  _QWORD v82[4];

  v82[3] = *MEMORY[0x1E0C80C00];
  v78 = a3;
  v79 = a4;
  if (objc_msgSend(v78, "isEqualToString:", CFSTR("ambientColor")))
  {
    objc_msgSend(v79, "ambientColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (CGColor *)objc_msgSend(v8, "CGColor");
    if (v9)
    {
      theDict = CFDictionaryCreateMutable(0, 20, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
      ColorSpace = CGColorGetColorSpace(v9);
      v11 = CGColorSpaceCopyName(ColorSpace);
      NumberOfComponents = CGColorGetNumberOfComponents(v9);
      v13 = NumberOfComponents << 32;
      v14 = (int)NumberOfComponents;
      if (NumberOfComponents << 32)
      {
        Mutable = CFStringCreateMutable(0, 0);
        v76 = v8;
        v16 = v14 - 1;
        if ((unint64_t)v14 <= 1)
          v17 = 1;
        else
          v17 = v14;
        do
        {
          CFStringAppend(Mutable, CFSTR("CGf"));
          if (v16)
            CFStringAppend(Mutable, CFSTR(", "));
          --v16;
          --v17;
        }
        while (v17);
        v8 = v76;
      }
      else
      {
        Mutable = &stru_1EA5021F8;
      }
      Components = CGColorGetComponents(v9);
      v39 = (const void **)malloc_type_malloc(v13 >> 29, 0x6004044C4A2DFuLL);
      v40 = v39;
      if (v13 >= 1)
      {
        if (v14 <= 1)
          v41 = 1;
        else
          v41 = v14;
        v42 = (CFNumberRef *)v39;
        do
        {
          *v42++ = CFNumberCreate(0, kCFNumberCGFloatType, Components++);
          --v41;
        }
        while (v41);
      }
      v43 = CFArrayCreate(0, v40, v14, MEMORY[0x1E0C9B378]);
      if (v13 >= 1)
      {
        if (v14 <= 1)
          v44 = 1;
        else
          v44 = v14;
        v45 = v40;
        do
        {
          CFRelease(*v45++);
          --v44;
        }
        while (v44);
      }
      free(v40);
      CGColorSpaceGetModel(ColorSpace);
      if (v43)
        CFDictionaryAddValue(theDict, CFSTR("componentValues"), v43);
      if (Mutable)
        CFDictionaryAddValue(theDict, CFSTR("componentValuesFormat"), Mutable);
      if (v11)
        CFDictionaryAddValue(theDict, CFSTR("colorSpaceName"), v11);
      if (v43)
        CFRelease(v43);
      if (v11)
        CFRelease(v11);
      if (!Mutable)
        goto LABEL_61;
      goto LABEL_60;
    }
    goto LABEL_31;
  }
  if (!objc_msgSend(v78, "isEqualToString:", CFSTR("lightColor")))
  {
    if (objc_msgSend(v78, "isEqualToString:", CFSTR("shadowColor")))
    {
      objc_msgSend(v79, "shadowColor");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v27 = (CGColor *)objc_msgSend(v8, "CGColor");
      if (v27)
      {
        theDict = CFDictionaryCreateMutable(0, 20, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
        v28 = CGColorGetColorSpace(v27);
        v29 = CGColorSpaceCopyName(v28);
        v30 = CGColorGetNumberOfComponents(v27);
        v31 = v30 << 32;
        v32 = (int)v30;
        if (v30 << 32)
        {
          Mutable = CFStringCreateMutable(0, 0);
          v33 = v32 - 1;
          if ((unint64_t)v32 <= 1)
            v34 = 1;
          else
            v34 = v32;
          do
          {
            CFStringAppend(Mutable, CFSTR("CGf"));
            if (v33)
              CFStringAppend(Mutable, CFSTR(", "));
            --v33;
            --v34;
          }
          while (v34);
        }
        else
        {
          Mutable = &stru_1EA5021F8;
        }
        v58 = CGColorGetComponents(v27);
        v59 = (const void **)malloc_type_malloc(v31 >> 29, 0x6004044C4A2DFuLL);
        v60 = v59;
        if (v31 >= 1)
        {
          if (v32 <= 1)
            v61 = 1;
          else
            v61 = v32;
          v62 = (CFNumberRef *)v59;
          do
          {
            *v62++ = CFNumberCreate(0, kCFNumberCGFloatType, v58++);
            --v61;
          }
          while (v61);
        }
        v63 = CFArrayCreate(0, v60, v32, MEMORY[0x1E0C9B378]);
        if (v31 >= 1)
        {
          if (v32 <= 1)
            v64 = 1;
          else
            v64 = v32;
          v65 = v60;
          do
          {
            CFRelease(*v65++);
            --v64;
          }
          while (v64);
        }
        free(v60);
        CGColorSpaceGetModel(v28);
        if (v63)
          CFDictionaryAddValue(theDict, CFSTR("componentValues"), v63);
        if (Mutable)
          CFDictionaryAddValue(theDict, CFSTR("componentValuesFormat"), Mutable);
        if (v29)
          CFDictionaryAddValue(theDict, CFSTR("colorSpaceName"), v29);
        if (v63)
          CFRelease(v63);
        if (v29)
          CFRelease(v29);
        if (!Mutable)
          goto LABEL_61;
LABEL_60:
        CFRelease(Mutable);
        goto LABEL_61;
      }
LABEL_31:
      theDict = 0;
LABEL_61:

      goto LABEL_131;
    }
    v35 = v79;
    v36 = (NSString *)v78;
    if (-[NSString length](v36, "length"))
    {
      NSSelectorFromString(v36);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v37 = v36;
        if (v37)
        {
LABEL_35:
          objc_msgSend(v35, "valueForKey:", v37);
          theDict = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
LABEL_130:

          goto LABEL_131;
        }
      }
      else
      {
        if (-[NSString length](v36, "length") < 2)
        {
          -[NSString uppercaseString](v36, "uppercaseString");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[NSString substringToIndex:](v36, "substringToIndex:", 1);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "uppercaseString");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSString substringFromIndex:](v36, "substringFromIndex:", 1);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "stringByAppendingString:", v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(CFSTR("is"), "stringByAppendingString:", v57);
        v66 = (NSString *)objc_claimAutoreleasedReturnValue();
        NSSelectorFromString(v66);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v37 = v66;
        else
          v37 = 0;

        if (v37)
          goto LABEL_35;
      }
    }
    if (a6)
    {
      v67 = v35;
      v68 = v36;
      if (v67)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v67);
        v69 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v69 = &stru_1EA5021F8;
      }
      if (v68)
        v70 = v68;
      else
        v70 = &stru_1EA5021F8;
      v71 = v70;
      v81[0] = CFSTR("propertyName");
      v81[1] = CFSTR("objectDescription");
      v82[0] = v71;
      v82[1] = v69;
      v81[2] = CFSTR("errorDescription");
      v82[2] = &stru_1EA5021F8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 3);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DebugHierarchyErrorDomain"), 100, v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      v74 = objc_retainAutorelease(v73);
      *a6 = v74;

    }
    v37 = 0;
    theDict = 0;
    goto LABEL_130;
  }
  objc_msgSend(v79, "lightColor");
  v77 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = (CGColor *)objc_msgSend(v77, "CGColor");
  if (v18)
  {
    theDict = CFDictionaryCreateMutable(0, 20, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
    v19 = CGColorGetColorSpace(v18);
    v20 = CGColorSpaceCopyName(v19);
    v21 = CGColorGetNumberOfComponents(v18);
    v22 = v21 << 32;
    v23 = (int)v21;
    if (v21 << 32)
    {
      v24 = CFStringCreateMutable(0, 0);
      v25 = v23 - 1;
      if ((unint64_t)v23 <= 1)
        v26 = 1;
      else
        v26 = v23;
      do
      {
        CFStringAppend(v24, CFSTR("CGf"));
        if (v25)
          CFStringAppend(v24, CFSTR(", "));
        --v25;
        --v26;
      }
      while (v26);
    }
    else
    {
      v24 = &stru_1EA5021F8;
    }
    v46 = CGColorGetComponents(v18);
    v47 = (const void **)malloc_type_malloc(v22 >> 29, 0x6004044C4A2DFuLL);
    v48 = v47;
    if (v22 >= 1)
    {
      if (v23 <= 1)
        v49 = 1;
      else
        v49 = v23;
      v50 = (CFNumberRef *)v47;
      do
      {
        *v50++ = CFNumberCreate(0, kCFNumberCGFloatType, v46++);
        --v49;
      }
      while (v49);
    }
    v51 = CFArrayCreate(0, v48, v23, MEMORY[0x1E0C9B378]);
    if (v22 >= 1)
    {
      if (v23 <= 1)
        v52 = 1;
      else
        v52 = v23;
      v53 = v48;
      do
      {
        CFRelease(*v53++);
        --v52;
      }
      while (v52);
    }
    free(v48);
    CGColorSpaceGetModel(v19);
    if (v51)
      CFDictionaryAddValue(theDict, CFSTR("componentValues"), v51);
    if (v24)
      CFDictionaryAddValue(theDict, CFSTR("componentValuesFormat"), v24);
    if (v20)
      CFDictionaryAddValue(theDict, CFSTR("colorSpaceName"), v20);
    if (v51)
      CFRelease(v51);
    if (v20)
      CFRelease(v20);
    if (v24)
      CFRelease(v24);
  }
  else
  {
    theDict = 0;
  }

LABEL_131:
  return theDict;
}

@end
