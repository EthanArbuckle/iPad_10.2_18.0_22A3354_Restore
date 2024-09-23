@implementation AVAnnotationShapeRepresentation

- (AVAnnotationShapeRepresentation)initWithShape:(id)a3
{
  AVAnnotationShapeRepresentation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVAnnotationShapeRepresentation;
  v4 = -[AVAnnotationRepresentation _initWithRepresentationType:](&v6, sel__initWithRepresentationType_, CFSTR("AVAnnotationRepresentationTypeShape"));
  if (v4)
  {
    v4->_shape = (NSString *)objc_msgSend(a3, "copy");
    v4->_strokeColor = (CGColor *)FigCreateCGColorSRGBFromArray();
    v4->_strokeWidth = 1;
    v4->_dashed = 0;
    v4->_hasShadow = 0;
  }
  return v4;
}

- (id)_initWithPropertyList:(id)a3 binaryData:(id)a4
{
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)AVAnnotationShapeRepresentation;
  v5 = -[AVAnnotationRepresentation _initWithPropertyList:binaryData:](&v20, sel__initWithPropertyList_binaryData_, a3, a4);
  if (!v5)
    goto LABEL_17;
  v6 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAnnotationRepresentationArchiveKeyShape"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_17;
  v5[4] = objc_msgSend(v6, "copy");
  v7 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAnnotationRepresentationArchiveKeyStrokeColor"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v7, "count") != 4)
    goto LABEL_17;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
LABEL_7:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v10)
        objc_enumerationMutation(v7);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_17;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        if (v9)
          goto LABEL_7;
        break;
      }
    }
  }
  v5[5] = FigCreateCGColorSRGBFromArray();
  v12 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAnnotationRepresentationArchiveKeyStrokeWidth"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v5[6] = objc_msgSend(v12, "integerValue"),
        v13 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAnnotationRepresentationArchiveKeyDashed")),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) == 0)
    || (*((_BYTE *)v5 + 56) = objc_msgSend(v13, "BOOLValue"),
        v14 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAnnotationRepresentationArchiveKeyHasShadow")),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_17:

    return 0;
  }
  *((_BYTE *)v5 + 57) = objc_msgSend(v14, "BOOLValue");
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAnnotationShapeRepresentation;
  -[AVAnnotationRepresentation dealloc](&v3, sel_dealloc);
}

- (CGColor)strokeColor
{
  return self->_strokeColor;
}

- (void)setStrokeColor:(CGColor *)a3
{
  CGColor *v4;

  v4 = CGColorRetain(a3);
  CGColorRelease(self->_strokeColor);
  self->_strokeColor = v4;
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  int64_t v6;
  int v7;
  _BOOL4 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVAnnotationShapeRepresentation;
  v5 = -[AVAnnotationRepresentation isEqual:](&v10, sel_isEqual_);
  if (a3 != self)
  {
    if (a3
      && (objc_opt_class(), (objc_opt_isKindOfClass() & v5) == 1)
      && -[NSString isEqualToString:](-[AVAnnotationShapeRepresentation shape](self, "shape"), "isEqualToString:", objc_msgSend(a3, "shape"))&& CGColorEqualToColor(-[AVAnnotationShapeRepresentation strokeColor](self, "strokeColor"), (CGColorRef)objc_msgSend(a3, "strokeColor"))&& (v6 = -[AVAnnotationShapeRepresentation strokeWidth](self, "strokeWidth"), v6 == objc_msgSend(a3, "strokeWidth"))&& (v7 = -[AVAnnotationShapeRepresentation dashed](self, "dashed"), v7 == objc_msgSend(a3, "dashed")))
    {
      v9 = -[AVAnnotationShapeRepresentation hasShadow](self, "hasShadow");
      return v9 ^ objc_msgSend(a3, "hasShadow") ^ 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVAnnotationShapeRepresentation;
  v3 = -[AVAnnotationRepresentation hash](&v9, sel_hash);
  v4 = -[NSString hash](-[AVAnnotationShapeRepresentation shape](self, "shape"), "hash");
  -[AVAnnotationShapeRepresentation strokeColor](self, "strokeColor");
  v5 = v4 ^ objc_msgSend((id)FigCopyCGColorSRGBAsArray(), "hash") ^ v3;
  v6 = v5 ^ objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AVAnnotationShapeRepresentation strokeWidth](self, "strokeWidth")), "hash");
  v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AVAnnotationShapeRepresentation dashed](self, "dashed")), "hash");
  return v6 ^ v7 ^ objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AVAnnotationShapeRepresentation hasShadow](self, "hasShadow")), "hash");
}

- (id)_propertyListAndBinaryData:(id *)a3
{
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVAnnotationShapeRepresentation;
  v5 = -[AVAnnotationRepresentation _propertyListAndBinaryData:](&v7, sel__propertyListAndBinaryData_);
  objc_msgSend(v5, "setObject:forKey:", -[AVAnnotationShapeRepresentation shape](self, "shape"), CFSTR("AVAnnotationRepresentationArchiveKeyShape"));
  -[AVAnnotationShapeRepresentation strokeColor](self, "strokeColor");
  objc_msgSend(v5, "setObject:forKey:", (id)FigCopyCGColorSRGBAsArray(), CFSTR("AVAnnotationRepresentationArchiveKeyStrokeColor"));
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AVAnnotationShapeRepresentation strokeWidth](self, "strokeWidth")), CFSTR("AVAnnotationRepresentationArchiveKeyStrokeWidth"));
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AVAnnotationShapeRepresentation dashed](self, "dashed")), CFSTR("AVAnnotationRepresentationArchiveKeyDashed"));
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AVAnnotationShapeRepresentation hasShadow](self, "hasShadow")), CFSTR("AVAnnotationRepresentationArchiveKeyHasShadow"));
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
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@>"), NSStringFromClass(v4), self, -[AVAnnotationShapeRepresentation shape](self, "shape"));
}

- (NSString)shape
{
  return self->_shape;
}

- (void)setShape:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeWidth:(int64_t)a3
{
  self->_strokeWidth = a3;
}

- (BOOL)dashed
{
  return self->_dashed;
}

- (void)setDashed:(BOOL)a3
{
  self->_dashed = a3;
}

- (BOOL)hasShadow
{
  return self->_hasShadow;
}

- (void)setHasShadow:(BOOL)a3
{
  self->_hasShadow = a3;
}

@end
