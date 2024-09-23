@implementation AVAnnotationTextRepresentation

- (AVAnnotationTextRepresentation)initWithText:(id)a3 font:(id)a4
{
  AVAnnotationTextRepresentation *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVAnnotationTextRepresentation;
  v6 = -[AVAnnotationRepresentation _initWithRepresentationType:](&v8, sel__initWithRepresentationType_, CFSTR("AVAnnotationRepresentationTypeText"));
  if (v6)
  {
    v6->_text = (NSString *)objc_msgSend(a3, "copy");
    v6->_font = (NSString *)objc_msgSend(a4, "copy");
    v6->_backgroundColor = (CGColor *)FigCreateCGColorSRGBFromArray();
    v6->_foregroundColor = (CGColor *)FigCreateCGColorSRGBFromArray();
    v6->_link = 0;
    v6->_hasShadow = 0;
    v6->_hasUnderline = 0;
    v6->_writingMode = 0;
  }
  return v6;
}

- (id)_initWithPropertyList:(id)a3 binaryData:(id)a4
{
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)AVAnnotationTextRepresentation;
  v5 = -[AVAnnotationRepresentation _initWithPropertyList:binaryData:](&v32, sel__initWithPropertyList_binaryData_, a3, a4);
  if (!v5)
    goto LABEL_31;
  v6 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAnnotationRepresentationArchiveKeyText"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_31;
  v5[4] = objc_msgSend(v6, "copy");
  v7 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAnnotationRepresentationArchiveKeyFont"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_31;
  v5[5] = objc_msgSend(v7, "copy");
  v8 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAnnotationRepresentationArchiveKeyBackgroundColor"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v8, "count") != 4)
    goto LABEL_31;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
LABEL_8:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v11)
        objc_enumerationMutation(v8);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_31;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        if (v10)
          goto LABEL_8;
        break;
      }
    }
  }
  v5[6] = FigCreateCGColorSRGBFromArray();
  v13 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAnnotationRepresentationArchiveKeyForegroundColor"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v13, "count") != 4)
    goto LABEL_31;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
LABEL_18:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v16)
        objc_enumerationMutation(v13);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_31;
      if (v15 == ++v17)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
        if (v15)
          goto LABEL_18;
        break;
      }
    }
  }
  v5[7] = FigCreateCGColorSRGBFromArray();
  v18 = objc_msgSend(a3, "objectForKey:", CFSTR("AVAnnotationRepresentationArchiveKeyLink"));
  if (v18)
  {
    v19 = (void *)v18;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = objc_msgSend(v19, "copy");
      goto LABEL_27;
    }
LABEL_31:

    return 0;
  }
LABEL_27:
  v5[8] = v18;
  v20 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAnnotationRepresentationArchiveKeyHasShadow"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_31;
  *((_BYTE *)v5 + 72) = objc_msgSend(v20, "BOOLValue");
  v21 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAnnotationRepresentationArchiveKeyHasUnderline"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_31;
  *((_BYTE *)v5 + 73) = objc_msgSend(v21, "BOOLValue");
  v22 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAnnotationRepresentationArchiveKeyWritingMode"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_31;
  v5[10] = objc_msgSend(v22, "integerValue");
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_backgroundColor);
  CGColorRelease(self->_foregroundColor);

  v3.receiver = self;
  v3.super_class = (Class)AVAnnotationTextRepresentation;
  -[AVAnnotationRepresentation dealloc](&v3, sel_dealloc);
}

- (CGColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(CGColor *)a3
{
  CGColor *v4;

  v4 = CGColorRetain(a3);
  CGColorRelease(self->_backgroundColor);
  self->_backgroundColor = v4;
}

- (CGColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(CGColor *)a3
{
  CGColor *v4;

  v4 = CGColorRetain(a3);
  CGColorRelease(self->_foregroundColor);
  self->_foregroundColor = v4;
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  NSString *v6;
  int v7;
  int v8;
  int64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVAnnotationTextRepresentation;
  v5 = -[AVAnnotationRepresentation isEqual:](&v11, sel_isEqual_);
  if (a3 != self)
  {
    if (!a3)
      goto LABEL_17;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_17;
    if (v5)
      v5 = -[NSString isEqualToString:](-[AVAnnotationTextRepresentation text](self, "text"), "isEqualToString:", objc_msgSend(a3, "text"))&& -[NSString isEqualToString:](-[AVAnnotationTextRepresentation font](self, "font"), "isEqualToString:", objc_msgSend(a3, "font"))&& CGColorEqualToColor(-[AVAnnotationTextRepresentation backgroundColor](self, "backgroundColor"), (CGColorRef)objc_msgSend(a3, "backgroundColor"))&& CGColorEqualToColor(-[AVAnnotationTextRepresentation foregroundColor](self, "foregroundColor"), (CGColorRef)objc_msgSend(a3, "foregroundColor"));
    v6 = -[AVAnnotationTextRepresentation link](self, "link");
    if (v6 == (NSString *)objc_msgSend(a3, "link"))
    {
      if (v5)
        goto LABEL_15;
    }
    else if (v5)
    {
      if (!-[NSString isEqualToString:](-[AVAnnotationTextRepresentation link](self, "link"), "isEqualToString:", objc_msgSend(a3, "link")))
      {
LABEL_17:
        LOBYTE(v5) = 0;
        return v5;
      }
LABEL_15:
      v7 = -[AVAnnotationTextRepresentation hasShadow](self, "hasShadow");
      if (v7 == objc_msgSend(a3, "hasShadow"))
      {
        v8 = -[AVAnnotationTextRepresentation hasUnderline](self, "hasUnderline");
        if (v8 == objc_msgSend(a3, "hasUnderline"))
        {
          v10 = -[AVAnnotationTextRepresentation writingMode](self, "writingMode");
          LOBYTE(v5) = v10 == objc_msgSend(a3, "writingMode");
          return v5;
        }
      }
      goto LABEL_17;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AVAnnotationTextRepresentation;
  v3 = -[AVAnnotationRepresentation hash](&v12, sel_hash);
  v4 = -[NSString hash](-[AVAnnotationTextRepresentation text](self, "text"), "hash");
  v5 = v4 ^ -[NSString hash](-[AVAnnotationTextRepresentation font](self, "font"), "hash");
  -[AVAnnotationTextRepresentation backgroundColor](self, "backgroundColor");
  v6 = v5 ^ objc_msgSend((id)FigCopyCGColorSRGBAsArray(), "hash");
  -[AVAnnotationTextRepresentation foregroundColor](self, "foregroundColor");
  v7 = v6 ^ objc_msgSend((id)FigCopyCGColorSRGBAsArray(), "hash") ^ v3;
  v8 = v7 ^ -[NSString hash](-[AVAnnotationTextRepresentation link](self, "link"), "hash");
  v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AVAnnotationTextRepresentation hasShadow](self, "hasShadow")), "hash");
  v10 = v8 ^ v9 ^ objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AVAnnotationTextRepresentation hasUnderline](self, "hasUnderline")), "hash");
  return v10 ^ objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AVAnnotationTextRepresentation writingMode](self, "writingMode")), "hash");
}

- (id)_propertyListAndBinaryData:(id *)a3
{
  id v5;
  NSString *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVAnnotationTextRepresentation;
  v5 = -[AVAnnotationRepresentation _propertyListAndBinaryData:](&v8, sel__propertyListAndBinaryData_);
  objc_msgSend(v5, "setObject:forKey:", -[AVAnnotationTextRepresentation text](self, "text"), CFSTR("AVAnnotationRepresentationArchiveKeyText"));
  objc_msgSend(v5, "setObject:forKey:", -[AVAnnotationTextRepresentation font](self, "font"), CFSTR("AVAnnotationRepresentationArchiveKeyFont"));
  -[AVAnnotationTextRepresentation backgroundColor](self, "backgroundColor");
  objc_msgSend(v5, "setObject:forKey:", (id)FigCopyCGColorSRGBAsArray(), CFSTR("AVAnnotationRepresentationArchiveKeyBackgroundColor"));
  -[AVAnnotationTextRepresentation foregroundColor](self, "foregroundColor");
  objc_msgSend(v5, "setObject:forKey:", (id)FigCopyCGColorSRGBAsArray(), CFSTR("AVAnnotationRepresentationArchiveKeyForegroundColor"));
  v6 = -[AVAnnotationTextRepresentation link](self, "link");
  if (v6)
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("AVAnnotationRepresentationArchiveKeyLink"));
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AVAnnotationTextRepresentation hasShadow](self, "hasShadow")), CFSTR("AVAnnotationRepresentationArchiveKeyHasShadow"));
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AVAnnotationTextRepresentation hasUnderline](self, "hasUnderline")), CFSTR("AVAnnotationRepresentationArchiveKeyHasUnderline"));
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AVAnnotationTextRepresentation writingMode](self, "writingMode")), CFSTR("AVAnnotationRepresentationArchiveKeyWritingMode"));
  if (a3)
    *a3 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "data");
  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, text = %@>"), NSStringFromClass(v4), self, -[AVAnnotationTextRepresentation text](self, "text"));
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)hasShadow
{
  return self->_hasShadow;
}

- (void)setHasShadow:(BOOL)a3
{
  self->_hasShadow = a3;
}

- (BOOL)hasUnderline
{
  return self->_hasUnderline;
}

- (void)setHasUnderline:(BOOL)a3
{
  self->_hasUnderline = a3;
}

- (int64_t)writingMode
{
  return self->_writingMode;
}

- (void)setWritingMode:(int64_t)a3
{
  self->_writingMode = a3;
}

@end
