@implementation AVAnnotationPathRepresentation

- (AVAnnotationPathRepresentation)initWithPaths:(id)a3
{
  AVAnnotationPathRepresentation *v4;
  AVAnnotationPathRepresentation *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  AVAnnotationPathRepresentation *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)AVAnnotationPathRepresentation;
  v4 = -[AVAnnotationRepresentation _initWithRepresentationType:](&v27, sel__initWithRepresentationType_, CFSTR("AVAnnotationRepresentationTypePath"));
  v5 = v4;
  if (v4)
  {
    v18 = v4;
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(a3);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v20;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v20 != v15)
                  objc_enumerationMutation(v11);
                objc_msgSend(v12, "addObject:", (id)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "copy"));
              }
              v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
            }
            while (v14);
          }
          objc_msgSend(v6, "addObject:", v12);
        }
        v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v8);
    }
    v5 = v18;
    v18->_paths = (NSArray *)objc_msgSend(v6, "copy");
    v18->_strokeColor = (CGColor *)FigCreateCGColorSRGBFromArray();
    v18->_strokeWidth = 1;
    v18->_dashed = 0;
    v18->_hasShadow = 0;
  }
  return v5;
}

- (id)_initWithPropertyList:(id)a3 binaryData:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)AVAnnotationPathRepresentation;
  v24 = -[AVAnnotationRepresentation _initWithPropertyList:binaryData:](&v37, sel__initWithPropertyList_binaryData_, a3, a4);
  if (v24)
  {
    v4 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAnnotationRepresentationArchiveKeyPaths"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v34;
LABEL_5:
        v8 = 0;
        while (1)
        {
          if (*(_QWORD *)v34 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v8);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            break;
          v31 = 0u;
          v32 = 0u;
          v29 = 0u;
          v30 = 0u;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v30;
LABEL_11:
            v13 = 0;
            while (1)
            {
              if (*(_QWORD *)v30 != v12)
                objc_enumerationMutation(v9);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_33;
              if (v11 == ++v13)
              {
                v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
                if (v11)
                  goto LABEL_11;
                break;
              }
            }
          }
          if (++v8 == v6)
          {
            v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
            if (v6)
              goto LABEL_5;
            goto LABEL_19;
          }
        }
      }
      else
      {
LABEL_19:
        v24[4] = objc_msgSend(v4, "copy");
        v14 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAnnotationRepresentationArchiveKeyStrokeColor"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v14, "count") == 4)
        {
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v38, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v26;
LABEL_23:
            v18 = 0;
            while (1)
            {
              if (*(_QWORD *)v26 != v17)
                objc_enumerationMutation(v14);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                break;
              if (v16 == ++v18)
              {
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v38, 16);
                if (v16)
                  goto LABEL_23;
                goto LABEL_29;
              }
            }
          }
          else
          {
LABEL_29:
            v24[5] = FigCreateCGColorSRGBFromArray();
            v19 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAnnotationRepresentationArchiveKeyStrokeWidth"));
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v24[6] = objc_msgSend(v19, "integerValue");
              v20 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAnnotationRepresentationArchiveKeyDashed"));
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                *((_BYTE *)v24 + 56) = objc_msgSend(v20, "BOOLValue");
                v21 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAnnotationRepresentationArchiveKeyHasShadow"));
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  *((_BYTE *)v24 + 57) = objc_msgSend(v21, "BOOLValue");
                  return v24;
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_33:

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_strokeColor);
  v3.receiver = self;
  v3.super_class = (Class)AVAnnotationPathRepresentation;
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
  v10.super_class = (Class)AVAnnotationPathRepresentation;
  v5 = -[AVAnnotationRepresentation isEqual:](&v10, sel_isEqual_);
  if (a3 != self)
  {
    if (a3
      && (objc_opt_class(), (objc_opt_isKindOfClass() & v5) == 1)
      && -[NSArray isEqualToArray:](-[AVAnnotationPathRepresentation paths](self, "paths"), "isEqualToArray:", objc_msgSend(a3, "paths"))&& CGColorEqualToColor(-[AVAnnotationPathRepresentation strokeColor](self, "strokeColor"), (CGColorRef)objc_msgSend(a3, "strokeColor"))&& (v6 = -[AVAnnotationPathRepresentation strokeWidth](self, "strokeWidth"), v6 == objc_msgSend(a3, "strokeWidth"))&& (v7 = -[AVAnnotationPathRepresentation dashed](self, "dashed"), v7 == objc_msgSend(a3, "dashed")))
    {
      v9 = -[AVAnnotationPathRepresentation hasShadow](self, "hasShadow");
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
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVAnnotationPathRepresentation;
  v3 = -[AVAnnotationRepresentation hash](&v9, sel_hash);
  v4 = -[NSArray hash](-[AVAnnotationPathRepresentation paths](self, "paths"), "hash");
  -[AVAnnotationPathRepresentation strokeColor](self, "strokeColor");
  v5 = v4 ^ objc_msgSend((id)FigCopyCGColorSRGBAsArray(), "hash") ^ v3;
  v6 = v5 ^ objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AVAnnotationPathRepresentation strokeWidth](self, "strokeWidth")), "hash");
  v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AVAnnotationPathRepresentation dashed](self, "dashed")), "hash");
  return v6 ^ v7 ^ objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AVAnnotationPathRepresentation hasShadow](self, "hasShadow")), "hash");
}

- (id)_propertyListAndBinaryData:(id *)a3
{
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVAnnotationPathRepresentation;
  v5 = -[AVAnnotationRepresentation _propertyListAndBinaryData:](&v7, sel__propertyListAndBinaryData_);
  objc_msgSend(v5, "setObject:forKey:", -[AVAnnotationPathRepresentation paths](self, "paths"), CFSTR("AVAnnotationRepresentationArchiveKeyPaths"));
  -[AVAnnotationPathRepresentation strokeColor](self, "strokeColor");
  objc_msgSend(v5, "setObject:forKey:", (id)FigCopyCGColorSRGBAsArray(), CFSTR("AVAnnotationRepresentationArchiveKeyStrokeColor"));
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AVAnnotationPathRepresentation strokeWidth](self, "strokeWidth")), CFSTR("AVAnnotationRepresentationArchiveKeyStrokeWidth"));
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AVAnnotationPathRepresentation dashed](self, "dashed")), CFSTR("AVAnnotationRepresentationArchiveKeyDashed"));
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AVAnnotationPathRepresentation hasShadow](self, "hasShadow")), CFSTR("AVAnnotationRepresentationArchiveKeyHasShadow"));
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
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>"), NSStringFromClass(v4), self);
}

- (NSArray)paths
{
  return self->_paths;
}

- (void)setPaths:(id)a3
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
