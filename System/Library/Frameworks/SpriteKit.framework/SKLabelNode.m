@implementation SKLabelNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_getTextSprites
{
  return *((id *)self->_skcLabelNode + 70);
}

- (void)setFont:(__CTFont *)a3
{
  SKCLabelNode::setFont((SKCLabelNode *)self->_skcLabelNode, a3);
}

- (void)setUIFont:(id)a3
{
  __CFString *v4;
  CGFloat v5;
  CTFontRef v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "fontName");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pointSize");
  v6 = CTFontCreateWithName(v4, v5, 0);

  SKCLabelNode::setFont((SKCLabelNode *)self->_skcLabelNode, v6);
  CFRelease(v6);

}

- (void)_makeBackingNode
{
  SKCLabelNode *v2;

  v2 = (SKCLabelNode *)operator new();
  SKCLabelNode::SKCLabelNode(v2);
  return v2;
}

- (void)_didMakeBackingNode
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKLabelNode;
  -[SKNode _didMakeBackingNode](&v3, sel__didMakeBackingNode);
  self->_skcLabelNode = -[SKNode _backingNode](self, "_backingNode");
}

- (SKLabelNode)init
{
  SKLabelNode *v2;
  SKLabelNode *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKLabelNode;
  v2 = -[SKNode init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SKLabelNode _initialize](v2, "_initialize");
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SKLabelNode;
  -[SKNode encodeWithCoder:](&v22, sel_encodeWithCoder_, v4);
  -[SKLabelNode fontName](self, "fontName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_fontName"));

  -[SKLabelNode text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_text"));

  -[SKLabelNode attributedText](self, "attributedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("_attributedText"));

  objc_msgSend(v4, "encodeObject:forKey:", MEMORY[0x1E0C9AA60], CFSTR("_textSprites"));
  objc_msgSend(v4, "encodeObject:forKey:", 0, CFSTR("_textSprite"));
  -[SKLabelNode fontColor](self, "fontColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "red");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_fontColorR"));

  -[SKLabelNode fontColor](self, "fontColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "green");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_fontColorG"));

  -[SKLabelNode fontColor](self, "fontColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "blue");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_fontColorB"));

  -[SKLabelNode fontColor](self, "fontColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "alpha");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_fontColorA"));

  -[SKLabelNode color](self, "color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "red");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_colorR"));

  -[SKLabelNode color](self, "color");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "green");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_colorG"));

  -[SKLabelNode color](self, "color");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "blue");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_colorB"));

  -[SKLabelNode color](self, "color");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "alpha");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_colorA"));

  -[SKLabelNode fontSize](self, "fontSize");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_fontSize"));
  -[SKLabelNode colorBlendFactor](self, "colorBlendFactor");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_labelColorBlend"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SKLabelNode blendMode](self, "blendMode"), CFSTR("_labelBlendMode"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)-[SKLabelNode horizontalAlignmentMode](self, "horizontalAlignmentMode"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("_horizontalAlignmentMode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)-[SKLabelNode verticalAlignmentMode](self, "verticalAlignmentMode"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("_verticalAlignmentMode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SKLabelNode numberOfLines](self, "numberOfLines"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("_numberOfLines"));

  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[SKLabelNode preferredMaxLayoutWidth](self, "preferredMaxLayoutWidth");
  *(float *)&v20 = v20;
  objc_msgSend(v19, "numberWithFloat:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("_preferredMaxLayoutWidth"));

}

- (SKLabelNode)initWithCoder:(id)a3
{
  id v4;
  SKLabelNode *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  float v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  objc_super v41;
  _QWORD v42[5];

  v42[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)SKLabelNode;
  v5 = -[SKNode initWithCoder:](&v41, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v42[0] = objc_opt_class();
    v42[1] = objc_opt_class();
    v42[2] = objc_opt_class();
    v42[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_textSprites"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_textSprite"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
      -[SKNode removeChildrenInArray:](v5, "removeChildrenInArray:", v9);
    if (v10 && (!v9 || (objc_msgSend(v9, "containsObject:", v10) & 1) == 0))
      -[SKNode removeChild:](v5, "removeChild:", v10);
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_fontSize"));
    -[SKLabelNode setFontSize:](v5, "setFontSize:");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fontName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKLabelNode setFontName:](v5, "setFontName:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_text"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKLabelNode setText:](v5, "setText:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_attributedText"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKLabelNode setAttributedText:](v5, "setAttributedText:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_horizontalAlignmentMode"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKLabelNode setHorizontalAlignmentMode:](v5, "setHorizontalAlignmentMode:", (int)objc_msgSend(v14, "intValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_verticalAlignmentMode"));
    v15 = objc_claimAutoreleasedReturnValue();
    -[SKLabelNode setVerticalAlignmentMode:](v5, "setVerticalAlignmentMode:", (int)objc_msgSend((id)v15, "intValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_numberOfLines"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v15) = v16 == 0;

    if ((v15 & 1) == 0)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_numberOfLines"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKLabelNode setNumberOfLines:](v5, "setNumberOfLines:", (int)objc_msgSend(v17, "intValue"));

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_preferredMaxLayoutWidth"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18 == 0;

    if (!v19)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_preferredMaxLayoutWidth"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "floatValue");
      -[SKLabelNode setPreferredMaxLayoutWidth:](v5, "setPreferredMaxLayoutWidth:", v21);

    }
    -[SKLabelNode setBlendMode:](v5, "setBlendMode:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_labelBlendMode")));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_labelColorBlend"));
    -[SKLabelNode setColorBlendFactor:](v5, "setColorBlendFactor:");
    v22 = (void *)MEMORY[0x1E0CEA478];
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_fontColorR"));
    v24 = v23;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_fontColorG"));
    v26 = v25;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_fontColorB"));
    v28 = v27;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_fontColorA"));
    objc_msgSend(v22, "colorWithRed:green:blue:alpha:", v24, v26, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKLabelNode setFontColor:](v5, "setFontColor:", v30);

    v31 = (void *)MEMORY[0x1E0CEA478];
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_colorR"));
    v33 = v32;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_colorG"));
    v35 = v34;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_colorB"));
    v37 = v36;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_colorA"));
    objc_msgSend(v31, "colorWithRed:green:blue:alpha:", v33, v35, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKLabelNode setColor:](v5, "setColor:", v39);

  }
  return v5;
}

- (BOOL)isEqualToNode:(id)a3
{
  SKLabelNode *v4;
  SKLabelNode *v5;
  void *v6;
  void *v7;
  id v8;
  CGColor *v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  float v15;
  double v16;
  SKLabelVerticalAlignmentMode v17;
  SKLabelHorizontalAlignmentMode v18;
  CGColor *v19;
  double v20;
  double v21;
  float v22;
  double v23;
  SKBlendMode v24;
  NSInteger v25;
  double v26;
  double v27;
  float v28;
  double v29;
  BOOL v30;
  id v32;
  id v33;
  objc_super v34;

  v4 = (SKLabelNode *)a3;
  if (self == v4)
  {
    v30 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v34.receiver = self;
      v34.super_class = (Class)SKLabelNode;
      if (-[SKNode isEqualToNode:](&v34, sel_isEqualToNode_, v5))
      {
        -[SKLabelNode text](self, "text");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKLabelNode text](v5, "text");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "isEqualToString:", v7))
        {
          -[SKLabelNode fontColor](self, "fontColor");
          v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v9 = (CGColor *)objc_msgSend(v8, "CGColor");
          -[SKLabelNode fontColor](v5, "fontColor");
          v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          if (CGColorEqualToColor(v9, (CGColorRef)objc_msgSend(v10, "CGColor")))
          {
            -[SKLabelNode fontName](self, "fontName");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[SKLabelNode fontName](v5, "fontName");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v11, "isEqualToString:", v12)
              && (-[SKLabelNode fontSize](self, "fontSize"),
                  v14 = v13,
                  -[SKLabelNode fontSize](v5, "fontSize"),
                  v15 = v14,
                  *(float *)&v16 = v16,
                  (COERCE_UNSIGNED_INT(v15 - *(float *)&v16) & 0x60000000) == 0)
              && (v17 = -[SKLabelNode verticalAlignmentMode](self, "verticalAlignmentMode"),
                  v17 == -[SKLabelNode verticalAlignmentMode](v5, "verticalAlignmentMode"))
              && (v18 = -[SKLabelNode horizontalAlignmentMode](self, "horizontalAlignmentMode"),
                  v18 == -[SKLabelNode horizontalAlignmentMode](v5, "horizontalAlignmentMode")))
            {
              -[SKLabelNode color](self, "color");
              v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v19 = (CGColor *)objc_msgSend(v33, "CGColor");
              -[SKLabelNode color](v5, "color");
              v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              if (CGColorEqualToColor(v19, (CGColorRef)objc_msgSend(v32, "CGColor"))
                && (-[SKLabelNode colorBlendFactor](self, "colorBlendFactor"),
                    v21 = v20,
                    -[SKLabelNode colorBlendFactor](v5, "colorBlendFactor"),
                    v22 = v21,
                    *(float *)&v23 = v23,
                    (COERCE_UNSIGNED_INT(v22 - *(float *)&v23) & 0x60000000) == 0)
                && (v24 = -[SKLabelNode blendMode](self, "blendMode"), v24 == -[SKLabelNode blendMode](v5, "blendMode"))
                && (v25 = -[SKLabelNode numberOfLines](self, "numberOfLines"),
                    v25 == -[SKLabelNode numberOfLines](v5, "numberOfLines")))
              {
                -[SKLabelNode preferredMaxLayoutWidth](self, "preferredMaxLayoutWidth");
                v27 = v26;
                -[SKLabelNode preferredMaxLayoutWidth](v5, "preferredMaxLayoutWidth");
                v28 = v27;
                *(float *)&v29 = v29;
                v30 = (COERCE_UNSIGNED_INT(v28 - *(float *)&v29) & 0x60000000) == 0;
              }
              else
              {
                v30 = 0;
              }

            }
            else
            {
              v30 = 0;
            }

          }
          else
          {
            v30 = 0;
          }

        }
        else
        {
          v30 = 0;
        }

      }
      else
      {
        v30 = 0;
      }

    }
    else
    {
      v30 = 0;
    }
  }

  return v30;
}

- (SKLabelNode)initWithFontNamed:(NSString *)fontName
{
  NSString *v4;
  SKLabelNode *v5;
  SKLabelNode *v6;

  v4 = fontName;
  v5 = -[SKLabelNode init](self, "init");
  v6 = v5;
  if (v5)
    -[SKLabelNode setFontName:](v5, "setFontName:", v4);

  return v6;
}

+ (SKLabelNode)labelNodeWithText:(NSString *)text
{
  NSString *v3;
  id v4;

  v3 = text;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setText:", v3);

  return (SKLabelNode *)v4;
}

+ (SKLabelNode)labelNodeWithAttributedText:(NSAttributedString *)attributedText
{
  NSAttributedString *v3;
  id v4;

  v3 = attributedText;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setAttributedText:", v3);

  return (SKLabelNode *)v4;
}

+ (SKLabelNode)labelNodeWithFontNamed:(NSString *)fontName
{
  NSString *v3;
  void *v4;

  v3 = fontName;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFontNamed:", v3);

  return (SKLabelNode *)v4;
}

- (SKLabelVerticalAlignmentMode)verticalAlignmentMode
{
  return *((_QWORD *)self->_skcLabelNode + 82);
}

- (void)setVerticalAlignmentMode:(SKLabelVerticalAlignmentMode)verticalAlignmentMode
{
  _QWORD *skcLabelNode;

  skcLabelNode = self->_skcLabelNode;
  skcLabelNode[82] = verticalAlignmentMode;
  *((_BYTE *)skcLabelNode + 712) = 1;
  SKCNode::setDirty((SKCNode *)skcLabelNode);
}

- (SKLabelHorizontalAlignmentMode)horizontalAlignmentMode
{
  return *((_QWORD *)self->_skcLabelNode + 81);
}

- (void)setHorizontalAlignmentMode:(SKLabelHorizontalAlignmentMode)horizontalAlignmentMode
{
  _QWORD *skcLabelNode;

  skcLabelNode = self->_skcLabelNode;
  skcLabelNode[81] = horizontalAlignmentMode;
  *((_BYTE *)skcLabelNode + 712) = 1;
  SKCNode::setDirty((SKCNode *)skcLabelNode);
}

- (NSInteger)numberOfLines
{
  return *((int *)self->_skcLabelNode + 166);
}

- (void)setNumberOfLines:(NSInteger)numberOfLines
{
  SKCLabelNode::setNumberOfLines((SKCNode *)self->_skcLabelNode, numberOfLines);
}

- (NSLineBreakMode)lineBreakMode
{
  return *((_QWORD *)self->_skcLabelNode + 84);
}

- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode
{
  SKCLabelNode::setLineBreakNode((SKCNode *)self->_skcLabelNode, lineBreakMode);
}

- (CGFloat)preferredMaxLayoutWidth
{
  return *((float *)self->_skcLabelNode + 170);
}

- (void)setPreferredMaxLayoutWidth:(CGFloat)preferredMaxLayoutWidth
{
  float v3;

  v3 = preferredMaxLayoutWidth;
  SKCLabelNode::setPreferredMaxLayoutWidth((SKCNode *)self->_skcLabelNode, v3);
}

- (NSString)fontName
{
  return (NSString *)*((id *)self->_skcLabelNode + 73);
}

- (void)setFontName:(NSString *)fontName
{
  SKCLabelNode::setFontName((id *)self->_skcLabelNode, fontName);
}

- (void)setFontSize:(CGFloat)fontSize
{
  float *skcLabelNode;
  float v4;

  skcLabelNode = (float *)self->_skcLabelNode;
  v4 = fontSize;
  skcLabelNode[148] = v4;
  *((_BYTE *)skcLabelNode + 713) = 1;
  SKCNode::setDirty((SKCNode *)skcLabelNode);
}

- (CGFloat)fontSize
{
  return *((float *)self->_skcLabelNode + 148);
}

- (void)setFontColor:(UIColor *)fontColor
{
  double v4;
  double v5;
  double v6;
  float64x2_t v7;
  float64_t v8;
  float64x2_t v9;
  float32x4_t *skcLabelNode;
  float64_t v11;
  float64_t v12;
  float64_t v13;
  UIColor *v14;

  v14 = fontColor;
  -[UIColor red](v14, "red");
  v13 = v4;
  -[UIColor green](v14, "green");
  v12 = v5;
  -[UIColor blue](v14, "blue");
  v11 = v6;
  -[UIColor alpha](v14, "alpha");
  v7.f64[0] = v11;
  v7.f64[1] = v8;
  v9.f64[0] = v13;
  v9.f64[1] = v12;
  skcLabelNode = (float32x4_t *)self->_skcLabelNode;
  skcLabelNode[38] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v9), v7);
  skcLabelNode[44].i8[8] = 1;
  SKCNode::setDirty((SKCNode *)skcLabelNode);

}

- (UIColor)fontColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", *((float *)self->_skcLabelNode + 152), *((float *)self->_skcLabelNode + 153), *((float *)self->_skcLabelNode + 154), *((float *)self->_skcLabelNode + 155));
}

- (void)setText:(NSString *)text
{
  SKCLabelNode::setText((SKCLabelNode *)self->_skcLabelNode, text);
}

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)*((id *)self->_skcLabelNode + 72);
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
  SKCLabelNode::setAttributedString((SKCLabelNode *)self->_skcLabelNode, attributedText);
}

- (void)setColor:(UIColor *)color
{
  UIColor *v4;
  void *skcLabelNode;
  int v6;
  __int128 v7;
  unsigned int v8;
  unsigned int v9;
  __int128 v10;

  v4 = color;
  -[UIColor componentRGBA](v4, "componentRGBA");
  skcLabelNode = self->_skcLabelNode;
  DWORD1(v7) = v6;
  *((_QWORD *)&v7 + 1) = __PAIR64__(v9, v8);
  v10 = v7;
  (*(void (**)(void *, __int128 *))(*(_QWORD *)skcLabelNode + 184))(skcLabelNode, &v10);

}

- (UIColor)color
{
  double v2;
  double v3;
  double v4;
  double v5;
  _DWORD *skcLabelNode;

  skcLabelNode = self->_skcLabelNode;
  LODWORD(v2) = skcLabelNode[76];
  LODWORD(v3) = skcLabelNode[77];
  LODWORD(v4) = skcLabelNode[78];
  LODWORD(v5) = skcLabelNode[79];
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithComponentRGBA:", v2, v3, v4, v5);
}

- (void)setColorBlendFactor:(CGFloat)colorBlendFactor
{
  void *skcLabelNode;
  float v4;
  float v5;

  skcLabelNode = self->_skcLabelNode;
  v4 = colorBlendFactor;
  v5 = v4;
  (*(void (**)(void *, float *))(*(_QWORD *)skcLabelNode + 192))(skcLabelNode, &v5);
}

- (CGFloat)colorBlendFactor
{
  return *((float *)self->_skcLabelNode + 80);
}

- (void)setBlendMode:(SKBlendMode)blendMode
{
  SKCNode::setBlendMode((SKCNode *)self->super._skcNode, blendMode);
}

- (SKBlendMode)blendMode
{
  return *((_QWORD *)self->super._skcNode + 36);
}

- (id)copy
{
  return -[SKLabelNode copyWithZone:](self, "copyWithZone:", MEMORY[0x1DF0CF2F0](self, a2));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SKLabelNode;
  v4 = -[SKNode copyWithZone:](&v11, sel_copyWithZone_, a3);
  -[SKLabelNode text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v5);

  -[SKLabelNode attributedText](self, "attributedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributedText:", v6);

  -[SKLabelNode fontName](self, "fontName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFontName:", v7);

  -[SKLabelNode fontColor](self, "fontColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFontColor:", v8);

  -[SKLabelNode fontSize](self, "fontSize");
  objc_msgSend(v4, "setFontSize:");
  objc_msgSend(v4, "setHorizontalAlignmentMode:", -[SKLabelNode horizontalAlignmentMode](self, "horizontalAlignmentMode"));
  objc_msgSend(v4, "setVerticalAlignmentMode:", -[SKLabelNode verticalAlignmentMode](self, "verticalAlignmentMode"));
  -[SKLabelNode color](self, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v9);

  -[SKLabelNode colorBlendFactor](self, "colorBlendFactor");
  objc_msgSend(v4, "setColorBlendFactor:");
  objc_msgSend(v4, "setBlendMode:", -[SKLabelNode blendMode](self, "blendMode"));
  objc_msgSend(v4, "setNumberOfLines:", -[SKLabelNode numberOfLines](self, "numberOfLines"));
  -[SKLabelNode preferredMaxLayoutWidth](self, "preferredMaxLayoutWidth");
  objc_msgSend(v4, "setPreferredMaxLayoutWidth:");
  return v4;
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)SKLabelNode;
  -[SKNode frame](&v6, sel_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSString)text
{
  return (NSString *)*((id *)self->_skcLabelNode + 71);
}

- (id)attributedString
{
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGPoint v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SKNode name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKLabelNode text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKLabelNode fontName](self, "fontName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKNode position](self, "position");
  NSStringFromCGPoint(v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SKLabelNode> name:'%@' text:'%@' fontName:'%@' position:%@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  const void *v9;
  __CFDictionary *v10;
  __CFDictionary *v11;
  __CFDictionary *v12;
  __CFDictionary *v13;
  __CFDictionary *v14;
  __CFDictionary *v15;
  __CFDictionary *v16;
  __CFDictionary *v17;
  __CFDictionary *v18;
  CFNumberRef v19;
  CFNumberRef v20;
  __CFDictionary *v21;
  CFNumberRef v22;
  void *v23;
  __CFDictionary *v25;
  __CFDictionary *v26;
  __CFDictionary *v27;
  __CFDictionary *v28;
  __CFDictionary *v29;
  __CFDictionary *v30;
  uint64_t valuePtr;
  _QWORD v32[17];

  v32[15] = *MEMORY[0x1E0C80C00];
  v2 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9AEB8];
  v3 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  Mutable = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("attributedText"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("NSAttributedString"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeAttributedString"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("attrStr"));
  v30 = Mutable;
  v32[0] = Mutable;
  v5 = CFDictionaryCreateMutable(0, 7, v2, v3);
  CFDictionaryAddValue(v5, CFSTR("propertyName"), CFSTR("color"));
  CFDictionaryAddValue(v5, CFSTR("propertyRuntimeType"), CFSTR("CGColor"));
  CFDictionaryAddValue(v5, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  CFDictionaryAddValue(v5, CFSTR("propertyFormat"), CFSTR("color"));
  v29 = v5;
  v32[1] = v5;
  v6 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v6, CFSTR("propertyName"), CFSTR("colorBlendFactor"));
  CFDictionaryAddValue(v6, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v6, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v6, CFSTR("propertyFormat"), CFSTR("CGf"));
  v28 = v6;
  v32[2] = v6;
  v7 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v7, CFSTR("propertyName"), CFSTR("fontColor"));
  CFDictionaryAddValue(v7, CFSTR("propertyRuntimeType"), CFSTR("CGColor"));
  CFDictionaryAddValue(v7, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  CFDictionaryAddValue(v7, CFSTR("propertyFormat"), CFSTR("color"));
  v27 = v7;
  v32[3] = v7;
  v8 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v8, CFSTR("propertyName"), CFSTR("fontName"));
  CFDictionaryAddValue(v8, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v8, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  v9 = (const void *)*MEMORY[0x1E0CA5C20];
  if (*MEMORY[0x1E0CA5C20])
    CFDictionaryAddValue(v8, CFSTR("propertyFormat"), (const void *)*MEMORY[0x1E0CA5C20]);
  v26 = v8;
  v32[4] = v8;
  v10 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v10, CFSTR("propertyName"), CFSTR("fontSize"));
  CFDictionaryAddValue(v10, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v10, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v10, CFSTR("propertyFormat"), CFSTR("CGf"));
  v25 = v10;
  v32[5] = v10;
  v11 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v11, CFSTR("propertyName"), CFSTR("numberOfLines"));
  CFDictionaryAddValue(v11, CFSTR("propertyRuntimeType"), CFSTR("NSInteger"));
  CFDictionaryAddValue(v11, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v11, CFSTR("propertyFormat"), CFSTR("integer"));
  v32[6] = v11;
  v12 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v12, CFSTR("propertyName"), CFSTR("preferredMaxLayoutWidth"));
  CFDictionaryAddValue(v12, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v12, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v12, CFSTR("propertyFormat"), CFSTR("CGf"));
  v32[7] = v12;
  v13 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v13, CFSTR("propertyName"), CFSTR("text"));
  CFDictionaryAddValue(v13, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v13, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  if (v9)
    CFDictionaryAddValue(v13, CFSTR("propertyFormat"), v9);
  v32[8] = v13;
  v14 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v14, CFSTR("propertyName"), CFSTR("blendMode"));
  CFDictionaryAddValue(v14, CFSTR("propertyRuntimeType"), CFSTR("SKBlendMode"));
  CFDictionaryAddValue(v14, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v14, CFSTR("propertyFormat"), CFSTR("integer"));
  v32[9] = v14;
  v15 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v15, CFSTR("propertyName"), CFSTR("horizontalAlignmentMode"));
  CFDictionaryAddValue(v15, CFSTR("propertyRuntimeType"), CFSTR("SKLabelHorizontalAlignmentMode"));
  CFDictionaryAddValue(v15, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v15, CFSTR("propertyFormat"), CFSTR("integer"));
  v32[10] = v15;
  v16 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v16, CFSTR("propertyName"), CFSTR("lineBreakMode"));
  CFDictionaryAddValue(v16, CFSTR("propertyRuntimeType"), CFSTR("NSLineBreakMode"));
  CFDictionaryAddValue(v16, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v16, CFSTR("propertyFormat"), CFSTR("uinteger"));
  v32[11] = v16;
  v17 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v17, CFSTR("propertyName"), CFSTR("verticalAlignmentMode"));
  CFDictionaryAddValue(v17, CFSTR("propertyRuntimeType"), CFSTR("SKLabelVerticalAlignmentMode"));
  CFDictionaryAddValue(v17, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v17, CFSTR("propertyFormat"), CFSTR("integer"));
  v32[12] = v17;
  v18 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v18, CFSTR("propertyName"), CFSTR("visualRepresentation"));
  CFDictionaryAddValue(v18, CFSTR("propertyRuntimeType"), CFSTR("CGImage"));
  CFDictionaryAddValue(v18, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeImage"));
  CFDictionaryAddValue(v18, CFSTR("propertyFormat"), CFSTR("public.data"));
  valuePtr = 8;
  v19 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v18, CFSTR("visibility"), v19);
  CFRelease(v19);
  valuePtr = 1;
  v20 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v18, CFSTR("propertyOptions"), v20);
  CFRelease(v20);
  v32[13] = v18;
  v21 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v21, CFSTR("propertyName"), CFSTR("visualRepresentationOffset"));
  CFDictionaryAddValue(v21, CFSTR("propertyRuntimeType"), CFSTR("CGPoint"));
  CFDictionaryAddValue(v21, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypePoint"));
  CFDictionaryAddValue(v21, CFSTR("propertyFormat"), CFSTR("CGf, CGf"));
  valuePtr = 8;
  v22 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v21, CFSTR("visibility"), v22);
  CFRelease(v22);
  v32[14] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)Mutable
{
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  const void **v20;
  uint64_t v21;
  char v22;
  char v23;
  CFNumberRef v24;
  id v25;
  CGColor *v26;
  size_t NumberOfComponents;
  uint64_t v28;
  CFIndex v29;
  __CFString *v30;
  CFIndex v31;
  uint64_t v32;
  CGColor *v33;
  size_t v34;
  uint64_t v35;
  CFIndex v36;
  CFIndex v37;
  uint64_t v38;
  id v39;
  id v40;
  NSString *v41;
  const CGFloat *Components;
  const void **v43;
  const void **v44;
  uint64_t v45;
  CFNumberRef *v46;
  CFArrayRef v47;
  uint64_t v48;
  CFTypeRef *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  const CGFloat *v54;
  const void **v55;
  const void **v56;
  uint64_t v57;
  CFNumberRef *v58;
  CFArrayRef v59;
  uint64_t v60;
  CFTypeRef *v61;
  NSString *v62;
  id v63;
  __CFString *v64;
  __CFString *v65;
  __CFString *v66;
  __CFString *v67;
  void *v68;
  void *v69;
  id v70;
  id v72;
  id v73;
  CGColorSpace *space;
  CGColorSpace *spacea;
  CFStringRef value;
  CFStringRef valuea;
  id v78;
  const __CFString *v79;
  uint64_t v80;
  _QWORD v81[3];
  double v82;
  double v83;
  const __CFString *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v78 = a4;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("visualRepresentation")))
  {
    objc_msgSend(v78, "createDebugHierarchyVisualRepresentation");
    Mutable = (id *)objc_claimAutoreleasedReturnValue();
    v79 = CFSTR("propertyFormat");
    v80 = *MEMORY[0x1E0CA5C10];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_101;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("visualRepresentationOffset")))
  {
    objc_msgSend(v78, "_untransformedBounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v78, "_anchorPoint");
    v82 = v11 + floor(v15 * v18);
    v83 = v13 + floor(v17 * v19);
    v20 = (const void **)malloc_type_malloc(0x10uLL, 0x6004044C4A2DFuLL);
    v21 = 0;
    v22 = 1;
    do
    {
      v23 = v22;
      v24 = CFNumberCreate(0, kCFNumberCGFloatType, &v82 + v21);
      v22 = 0;
      v20[v21] = v24;
      v21 = 1;
    }
    while ((v23 & 1) != 0);
    Mutable = (id *)CFArrayCreate(0, v20, 2, MEMORY[0x1E0C9B378]);
    CFRelease(*v20);
    CFRelease(v20[1]);
    free(v20);
    goto LABEL_101;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("color")))
  {
    objc_msgSend(v78, "color");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v26 = (CGColor *)objc_msgSend(v25, "CGColor");
    if (v26)
    {
      Mutable = (id *)CFDictionaryCreateMutable(0, 20, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
      space = CGColorGetColorSpace(v26);
      value = CGColorSpaceCopyName(space);
      NumberOfComponents = CGColorGetNumberOfComponents(v26);
      v28 = NumberOfComponents << 32;
      v29 = (int)NumberOfComponents;
      if (NumberOfComponents << 32)
      {
        v30 = CFStringCreateMutable(0, 0);
        v72 = v25;
        v31 = v29 - 1;
        if ((unint64_t)v29 <= 1)
          v32 = 1;
        else
          v32 = v29;
        do
        {
          CFStringAppend(v30, CFSTR("CGf"));
          if (v31)
            CFStringAppend(v30, CFSTR(", "));
          --v31;
          --v32;
        }
        while (v32);
        v25 = v72;
      }
      else
      {
        v30 = &stru_1EA5021F8;
      }
      Components = CGColorGetComponents(v26);
      v43 = (const void **)malloc_type_malloc(v28 >> 29, 0x6004044C4A2DFuLL);
      v44 = v43;
      if (v28 >= 1)
      {
        if (v29 <= 1)
          v45 = 1;
        else
          v45 = v29;
        v46 = (CFNumberRef *)v43;
        do
        {
          *v46++ = CFNumberCreate(0, kCFNumberCGFloatType, Components++);
          --v45;
        }
        while (v45);
      }
      v47 = CFArrayCreate(0, v44, v29, MEMORY[0x1E0C9B378]);
      if (v28 >= 1)
      {
        if (v29 <= 1)
          v48 = 1;
        else
          v48 = v29;
        v49 = v44;
        do
        {
          CFRelease(*v49++);
          --v48;
        }
        while (v48);
      }
      free(v44);
      CGColorSpaceGetModel(space);
      if (v47)
        CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, CFSTR("componentValues"), v47);
      if (v30)
        CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, CFSTR("componentValuesFormat"), v30);
      if (value)
        CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, CFSTR("colorSpaceName"), value);
      if (v47)
        CFRelease(v47);
      if (value)
        CFRelease(value);
      if (!v30)
        goto LABEL_83;
      goto LABEL_82;
    }
    goto LABEL_27;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("fontColor")))
  {
    objc_msgSend(v78, "fontColor");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v33 = (CGColor *)objc_msgSend(v25, "CGColor");
    if (v33)
    {
      Mutable = (id *)CFDictionaryCreateMutable(0, 20, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
      spacea = CGColorGetColorSpace(v33);
      valuea = CGColorSpaceCopyName(spacea);
      v34 = CGColorGetNumberOfComponents(v33);
      v35 = v34 << 32;
      v36 = (int)v34;
      if (v34 << 32)
      {
        v30 = CFStringCreateMutable(0, 0);
        v73 = v25;
        v37 = v36 - 1;
        if ((unint64_t)v36 <= 1)
          v38 = 1;
        else
          v38 = v36;
        do
        {
          CFStringAppend(v30, CFSTR("CGf"));
          if (v37)
            CFStringAppend(v30, CFSTR(", "));
          --v37;
          --v38;
        }
        while (v38);
        v25 = v73;
      }
      else
      {
        v30 = &stru_1EA5021F8;
      }
      v54 = CGColorGetComponents(v33);
      v55 = (const void **)malloc_type_malloc(v35 >> 29, 0x6004044C4A2DFuLL);
      v56 = v55;
      if (v35 >= 1)
      {
        if (v36 <= 1)
          v57 = 1;
        else
          v57 = v36;
        v58 = (CFNumberRef *)v55;
        do
        {
          *v58++ = CFNumberCreate(0, kCFNumberCGFloatType, v54++);
          --v57;
        }
        while (v57);
      }
      v59 = CFArrayCreate(0, v56, v36, MEMORY[0x1E0C9B378]);
      if (v35 >= 1)
      {
        if (v36 <= 1)
          v60 = 1;
        else
          v60 = v36;
        v61 = v56;
        do
        {
          CFRelease(*v61++);
          --v60;
        }
        while (v60);
      }
      free(v56);
      CGColorSpaceGetModel(spacea);
      if (v59)
        CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, CFSTR("componentValues"), v59);
      if (v30)
        CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, CFSTR("componentValuesFormat"), v30);
      if (valuea)
        CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, CFSTR("colorSpaceName"), valuea);
      if (v59)
        CFRelease(v59);
      if (valuea)
        CFRelease(valuea);
      if (!v30)
        goto LABEL_83;
LABEL_82:
      CFRelease(v30);
      goto LABEL_83;
    }
LABEL_27:
    Mutable = 0;
LABEL_83:

    goto LABEL_101;
  }
  v39 = v78;
  v40 = v9;
  if (!objc_msgSend(v40, "length"))
    goto LABEL_91;
  NSSelectorFromString((NSString *)v40);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v41 = (NSString *)v40;
  }
  else
  {
    if ((unint64_t)objc_msgSend(v40, "length") < 2)
    {
      objc_msgSend(v40, "uppercaseString");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v40, "substringToIndex:", 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "uppercaseString");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "substringFromIndex:", 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "stringByAppendingString:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(CFSTR("is"), "stringByAppendingString:", v53);
    v62 = (NSString *)objc_claimAutoreleasedReturnValue();
    NSSelectorFromString(v62);
    v41 = (objc_opt_respondsToSelector() & 1) != 0 ? v62 : 0;

  }
  if (v41)
  {
    objc_msgSend(v39, "valueForKey:", v41);
    Mutable = (id *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_91:
    if (Mutable)
    {
      v63 = v39;
      v64 = (__CFString *)v40;
      if (v63)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v63);
        *(double *)&v65 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      }
      else
      {
        *(double *)&v65 = COERCE_DOUBLE(&stru_1EA5021F8);
      }
      if (v64)
        v66 = v64;
      else
        v66 = &stru_1EA5021F8;
      *(double *)&v67 = COERCE_DOUBLE(v66);
      v81[0] = CFSTR("propertyName");
      v81[1] = CFSTR("objectDescription");
      v82 = *(double *)&v67;
      v83 = *(double *)&v65;
      v81[2] = CFSTR("errorDescription");
      v84 = &stru_1EA5021F8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, v81, 3);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DebugHierarchyErrorDomain"), 100, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      v70 = objc_retainAutorelease(v69);
      *Mutable = v70;

      v41 = 0;
      Mutable = 0;
    }
    else
    {
      v41 = 0;
    }
  }

LABEL_101:
  return Mutable;
}

+ (id)_labelNodeWithFontNamed:(id)a3
{
  return objc_alloc_init((Class)objc_opt_class());
}

+ (id)_labelNodeWithFontTexture:(id)a3 fontDataString:(id)a4
{
  return objc_alloc_init((Class)objc_opt_class());
}

@end
