@implementation CKContextUIElement

- (CKContextUIElement)initWithText:(id)a3 className:(id)a4
{
  id v7;
  id v8;
  CKContextUIElement *v9;
  CKContextUIElement *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKContextUIElement;
  v9 = -[CKContextUIElement init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_text, a3);
    objc_storeStrong((id *)&v10->_className, a4);
  }

  return v10;
}

- (CKContextUIElement)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  CKContextUIElement *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  NSString *v15;
  __int128 v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKContextUIElement;
  v5 = -[CKContextUIElement init](&v21, sel_init);
  if (!v5)
  {
LABEL_7:
    v6 = v5;
    goto LABEL_8;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
  v6 = (CKContextUIElement *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_storeStrong((id *)v5 + 3, v6);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("className"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v7;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("superviewClassNames"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sceneIdentifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v11;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("fontSize"));
    *((_DWORD *)v5 + 3) = v13;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("density"));
    *((_DWORD *)v5 + 4) = v14;
    v5[8] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("onScreen"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("frameInWindow"));
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (-[NSString length](v15, "length"))
    {
      *(CGRect *)(v5 + 72) = CGRectFromString(v15);
    }
    else
    {
      v16 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
      *(_OWORD *)(v5 + 72) = *MEMORY[0x1E0C9D648];
      *(_OWORD *)(v5 + 88) = v16;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("absoluteOriginOnScreen"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "CGPointValue");
    *((_QWORD *)v5 + 7) = v18;
    *((_QWORD *)v5 + 8) = v19;

    goto LABEL_7;
  }
LABEL_8:

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *text;
  id v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  text = self->_text;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", text, CFSTR("text"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_className, CFSTR("className"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_superviewClassNames, CFSTR("superviewClassNames"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sceneIdentifier, CFSTR("sceneIdentifier"));
  *(float *)&v6 = self->_fontSize;
  objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("fontSize"), v6);
  *(float *)&v7 = self->_density;
  objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("density"), v7);
  objc_msgSend(v5, "encodeBool:forKey:", self->_onScreen, CFSTR("onScreen"));
  NSStringFromCGRect(self->_frameInWindow);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("frameInWindow"));

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", self->_absoluteOriginOnScreen.x, self->_absoluteOriginOnScreen.y);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("absoluteOriginOnScreen"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)-[NSString copy](self->_text, "copy");
  objc_msgSend(v4, "setText:", v5);

  v6 = (void *)-[NSString copy](self->_className, "copy");
  objc_msgSend(v4, "setClassName:", v6);

  v7 = (void *)-[NSArray copy](self->_superviewClassNames, "copy");
  objc_msgSend(v4, "setSuperviewClassNames:", v7);

  v8 = (void *)-[NSString copy](self->_sceneIdentifier, "copy");
  objc_msgSend(v4, "setSceneIdentifier:", v8);

  *(float *)&v9 = self->_fontSize;
  objc_msgSend(v4, "setFontSize:", v9);
  *(float *)&v10 = self->_density;
  objc_msgSend(v4, "setDensity:", v10);
  objc_msgSend(v4, "setFrameInWindow:", self->_frameInWindow.origin.x, self->_frameInWindow.origin.y, self->_frameInWindow.size.width, self->_frameInWindow.size.height);
  objc_msgSend(v4, "setAbsoluteOriginOnScreen:", self->_absoluteOriginOnScreen.x, self->_absoluteOriginOnScreen.y);
  objc_msgSend(v4, "setOnScreen:", self->_onScreen);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CKContextUIElement *v4;
  unint64_t v5;
  BOOL v6;

  v4 = (CKContextUIElement *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[CKContextUIElement hash](self, "hash");
      v6 = v5 == -[CKContextUIElement hash](v4, "hash");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_text, "hash");
  v4 = -[NSString hash](self->_className, "hash") - v3 + 32 * v3;
  v5 = -[NSArray hash](self->_superviewClassNames, "hash") - v4 + 32 * v4;
  v6 = (unint64_t)(self->_absoluteOriginOnScreen.y
                        + (double)(31
                                 * (unint64_t)(self->_absoluteOriginOnScreen.x
                                                    + (double)(31
                                                             * (unint64_t)(self->_frameInWindow.size.height
                                                                                + (double)(31
                                                                                         * (unint64_t)(self->_frameInWindow.size.width + (double)(31 * (unint64_t)(self->_frameInWindow.origin.y + (double)(31 * (unint64_t)(self->_frameInWindow.origin.x + (double)(31 * (unint64_t)(float)(self->_density + (float)(31 * (unint64_t)(float)(self->_fontSize + (float)(31 * (-[NSString hash](self->_sceneIdentifier, "hash") - v5 + 32 * v5) + 28629151))))))))))))))));
  return self->_onScreen - v6 + 32 * v6;
}

- (int64_t)compareByPosition:(id)a3
{
  double v4;
  double v5;
  double y;
  double x;

  objc_msgSend(a3, "frameInWindow");
  y = self->_frameInWindow.origin.y;
  if (y < v5)
    return -1;
  if (y > v5)
    return 1;
  x = self->_frameInWindow.origin.x;
  if (x >= v4)
    return x > v4;
  else
    return -1;
}

- (id)description
{
  void *v3;
  double fontSize;
  CGFloat width;
  CGFloat height;
  const __CFString *v7;
  NSString *className;
  NSString *sceneIdentifier;
  void *v10;
  void *v11;
  CGPoint absoluteOriginOnScreen;
  CGPoint origin;

  v3 = (void *)MEMORY[0x1E0CB3940];
  fontSize = self->_fontSize;
  origin = self->_frameInWindow.origin;
  absoluteOriginOnScreen = self->_absoluteOriginOnScreen;
  width = self->_frameInWindow.size.width;
  height = self->_frameInWindow.size.height;
  if (self->_onScreen)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  className = self->_className;
  sceneIdentifier = self->_sceneIdentifier;
  -[NSArray componentsJoinedByString:](self->_superviewClassNames, "componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Class: %@, FontSize: %.f, Origin:(%.f, %.f), AbsoluteOriginOnScreen:(%.f, %.f), Size:(%.f, %.f), SceneIdentifier: %@, On Screen:%@\nSuperViews:%@\nContent: %@\n"), className, *(_QWORD *)&fontSize, origin, absoluteOriginOnScreen, *(_QWORD *)&width, *(_QWORD *)&height, sceneIdentifier, v7, v10, self->_text);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)toJSONSerializableDictionary
{
  id v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_text, CFSTR("text"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_className, CFSTR("className"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_superviewClassNames, CFSTR("superviewClassNames"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_sceneIdentifier, CFSTR("sceneIdentifier"));
  *(float *)&v4 = self->_fontSize;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("fontSize"));

  *(float *)&v6 = self->_density;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("density"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_frameInWindow.origin.x);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("x"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_frameInWindow.origin.y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("y"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteOriginOnScreen.x);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("absoluteOriginX"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteOriginOnScreen.y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("abosluteOriginY"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_frameInWindow.size.width);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("width"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_frameInWindow.size.height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("height"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_onScreen);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("onScreen"));

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (NSString)className
{
  return self->_className;
}

- (void)setClassName:(id)a3
{
  objc_storeStrong((id *)&self->_className, a3);
}

- (NSArray)superviewClassNames
{
  return self->_superviewClassNames;
}

- (void)setSuperviewClassNames:(id)a3
{
  objc_storeStrong((id *)&self->_superviewClassNames, a3);
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setSceneIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sceneIdentifier, a3);
}

- (float)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(float)a3
{
  self->_fontSize = a3;
}

- (float)density
{
  return self->_density;
}

- (void)setDensity:(float)a3
{
  self->_density = a3;
}

- (CGRect)frameInWindow
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frameInWindow.origin.x;
  y = self->_frameInWindow.origin.y;
  width = self->_frameInWindow.size.width;
  height = self->_frameInWindow.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrameInWindow:(CGRect)a3
{
  self->_frameInWindow = a3;
}

- (CGPoint)absoluteOriginOnScreen
{
  double x;
  double y;
  CGPoint result;

  x = self->_absoluteOriginOnScreen.x;
  y = self->_absoluteOriginOnScreen.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAbsoluteOriginOnScreen:(CGPoint)a3
{
  self->_absoluteOriginOnScreen = a3;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (void)setOnScreen:(BOOL)a3
{
  self->_onScreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_superviewClassNames, 0);
  objc_storeStrong((id *)&self->_className, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
