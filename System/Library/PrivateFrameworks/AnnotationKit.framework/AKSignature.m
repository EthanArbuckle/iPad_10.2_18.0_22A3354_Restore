@implementation AKSignature

- (AKSignature)initWithDrawing:(id)a3 path:(CGPath *)a4 baselineOffset:(double)a5 creationDate:(id)a6 descriptionTag:(int64_t)a7 customDescription:(id)a8
{
  id v14;
  id v15;
  id v16;
  AKSignature *v17;
  uint64_t v18;
  NSUUID *uniqueID;
  uint64_t v20;
  PKDrawing *drawing;
  CGMutablePathRef MutableCopy;
  void *v23;
  objc_super v25;

  v14 = a3;
  v15 = a6;
  v16 = a8;
  v25.receiver = self;
  v25.super_class = (Class)AKSignature;
  v17 = -[AKSignature init](&v25, sel_init);
  if (v17)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v18 = objc_claimAutoreleasedReturnValue();
    uniqueID = v17->_uniqueID;
    v17->_uniqueID = (NSUUID *)v18;

    v17->_baselineOffset = a5;
    objc_storeStrong((id *)&v17->_creationDate, a6);
    v20 = objc_msgSend(v14, "copy");
    drawing = v17->_drawing;
    v17->_drawing = (PKDrawing *)v20;

    if (a4)
      MutableCopy = CGPathCreateMutableCopy(a4);
    else
      MutableCopy = 0;
    v17->_path = MutableCopy;
    v17->_descriptionTag = a7;
    if (a7 == -1)
      v23 = v16;
    else
      v23 = 0;
    objc_storeStrong((id *)&v17->_customDescription, v23);
  }

  return v17;
}

- (AKSignature)initWithDrawing:(id)a3 path:(CGPath *)a4 baselineOffset:(double)a5 creationDate:(id)a6
{
  void *v9;
  id v10;
  void *v11;
  AKSignature *v12;

  v9 = (void *)MEMORY[0x24BDBCE60];
  v10 = a3;
  objc_msgSend(v9, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[AKSignature initWithDrawing:path:baselineOffset:creationDate:descriptionTag:customDescription:](self, "initWithDrawing:path:baselineOffset:creationDate:descriptionTag:customDescription:", v10, a4, v11, 0, 0, a5);

  return v12;
}

- (AKSignature)initWithDrawing:(id)a3 path:(CGPath *)a4 baselineOffset:(double)a5
{
  void *v8;
  id v9;
  void *v10;
  AKSignature *v11;

  v8 = (void *)MEMORY[0x24BDBCE60];
  v9 = a3;
  objc_msgSend(v8, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AKSignature initWithDrawing:path:baselineOffset:creationDate:](self, "initWithDrawing:path:baselineOffset:creationDate:", v9, a4, v10, a5);

  return v11;
}

- (id)initForTesting
{
  AKSignature *v2;
  uint64_t v3;
  NSUUID *uniqueID;

  v2 = -[AKSignature init](self, "init");
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("12345678-1234-1234-1234-123456789012"));
    uniqueID = v2->_uniqueID;
    v2->_uniqueID = (NSUUID *)v3;

  }
  return v2;
}

- (AKSignature)init
{
  return (AKSignature *)MEMORY[0x24BEDD108](self, sel_initWithDrawing_path_baselineOffset_);
}

- (BOOL)isEqual:(id)a3
{
  AKSignature *v4;
  AKSignature *v5;
  AKSignature *v6;
  void *v7;
  void *v8;
  int v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  char v16;
  void *v17;

  v4 = (AKSignature *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v16 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        -[AKSignature uniqueID](self, "uniqueID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKSignature uniqueID](v6, "uniqueID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqual:", v8);

        if (!v9
          || (v10 = -[AKSignature descriptionTag](self, "descriptionTag"),
              v10 != -[AKSignature descriptionTag](v6, "descriptionTag")))
        {
          v16 = 0;
LABEL_19:

          goto LABEL_20;
        }
        -[AKSignature customDescription](self, "customDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11
          || (-[AKSignature customDescription](v6, "customDescription"),
              (v17 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
        {
          -[AKSignature customDescription](self, "customDescription");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            -[AKSignature customDescription](self, "customDescription");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[AKSignature customDescription](v6, "customDescription");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v13, "isEqualToString:", v14) ^ 1;

          }
          else
          {
            LOBYTE(v15) = 0;
          }

          if (v11)
            goto LABEL_18;
          v17 = 0;
        }
        else
        {
          LOBYTE(v15) = 1;
        }

LABEL_18:
        v16 = v15 ^ 1;
        goto LABEL_19;
      }
    }
    v16 = 0;
  }
LABEL_20:

  return v16;
}

- (void)dealloc
{
  CGPath *path;
  objc_super v4;

  path = self->_path;
  if (path)
    CGPathRelease(path);
  v4.receiver = self;
  v4.super_class = (Class)AKSignature;
  -[AKSignature dealloc](&v4, sel_dealloc);
}

- (PKDrawing)drawing
{
  return self->_drawing;
}

- (CGRect)pathBounds
{
  PKDrawing *drawing;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  CGPath *path;
  CGRect result;

  drawing = self->_drawing;
  if (drawing)
  {
    -[PKDrawing bounds](drawing, "bounds");
  }
  else
  {
    path = self->_path;
    if (path)
    {
      *(CGRect *)&v4 = CGPathGetBoundingBox(path);
    }
    else
    {
      v4 = *MEMORY[0x24BDBF090];
      v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
    }
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)setPath:(CGPath *)a3
{
  CGPath *path;

  path = self->_path;
  if (path != a3)
  {
    if (path)
      CGPathRelease(path);
    self->_path = a3;
    if (a3)
      CGPathRetain(a3);
  }
}

- (CGPath)path
{
  return self->_path;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[AKSignature uniqueID](self, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v4, CFSTR("uniqueID"));

  -[AKSignature baselineOffset](self, "baselineOffset");
  objc_msgSend(v13, "encodeDouble:forKey:", CFSTR("baselineOffset"));
  -[AKSignature creationDate](self, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v5, CFSTR("creationDate"));

  objc_msgSend(v13, "encodeBool:forKey:", -[AKSignature shouldPersist](self, "shouldPersist"), CFSTR("shouldPersist"));
  if (-[AKSignature descriptionTag](self, "descriptionTag"))
  {
    objc_msgSend(v13, "encodeInteger:forKey:", -[AKSignature descriptionTag](self, "descriptionTag"), CFSTR("descriptionTag"));
    if (-[AKSignature descriptionTag](self, "descriptionTag") == -1)
    {
      -[AKSignature customDescription](self, "customDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[AKSignature customDescription](self, "customDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "encodeObject:forKey:", v7, CFSTR("customDescription"));

      }
    }
  }
  if (-[AKSignature path](self, "path"))
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "encodeCGPath:", -[AKSignature path](self, "path"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeObject:forKey:", v8, CFSTR("path"));

  }
  -[AKSignature drawing](self, "drawing");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v13;
  if (v9)
  {
    -[AKSignature drawing](self, "drawing");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serialize");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("drawing"));
    v10 = v13;
  }

}

- (AKSignature)initWithCoder:(id)a3
{
  id v4;
  AKSignature *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *customDescription;
  int64_t v11;
  void *v12;
  const CGPath *v13;
  void *v14;
  void *v15;
  id v16;
  id v18;

  v4 = a3;
  v5 = -[AKSignature init](self, "init");
  if (!v5)
    goto LABEL_18;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignature setUniqueID:](v5, "setUniqueID:", v6);

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("baselineOffset"));
  -[AKSignature setBaselineOffset:](v5, "setBaselineOffset:");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignature setCreationDate:](v5, "setCreationDate:", v7);

  -[AKSignature setShouldPersist:](v5, "setShouldPersist:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldPersist")));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("descriptionTag")))
  {
    v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("descriptionTag"));
    v5->_descriptionTag = v8;
    if (v8 == -1)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customDescription"));
      v9 = objc_claimAutoreleasedReturnValue();
      customDescription = v5->_customDescription;
      v5->_customDescription = (NSString *)v9;
LABEL_9:

    }
  }
  else if (objc_msgSend(v4, "containsValueForKey:", CFSTR("caption")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("caption"));
    customDescription = (void *)objc_claimAutoreleasedReturnValue();
    if (customDescription)
    {
      v11 = +[AKSignatureDescription signatureDescriptionTagFromStringValue:](AKSignatureDescription, "signatureDescriptionTagFromStringValue:", customDescription);
      v5->_descriptionTag = v11;
      if (v11 == -1)
        objc_storeStrong((id *)&v5->_customDescription, customDescription);
    }
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("path")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (const CGPath *)objc_msgSend(MEMORY[0x24BDBCE50], "newCGPathDecodedFromData:", v12);
    -[AKSignature setPath:](v5, "setPath:", v13);
    CGPathRelease(v13);

  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("drawing")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("drawing"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v18 = 0;
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE3380]), "initWithData:error:", v14, &v18);
      v16 = v18;
      objc_storeStrong((id *)&v5->_drawing, v15);
      if (v16)
        NSLog(CFSTR("Encountered error while decoding signature: %@"), v16);

    }
  }
LABEL_18:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSUUID copyWithZone:](self->_uniqueID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v6;

  *(double *)(v5 + 72) = self->_baselineOffset;
  v8 = -[NSDate copyWithZone:](self->_creationDate, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v8;

  *(_BYTE *)(v5 + 56) = self->_shouldPersist;
  *(_QWORD *)(v5 + 88) = self->_descriptionTag;
  v10 = -[NSString copyWithZone:](self->_customDescription, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v10;

  *(_QWORD *)(v5 + 16) = CGPathCreateMutableCopy(self->_path);
  v12 = -[PKDrawing copy](self->_drawing, "copy");
  v13 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v12;

  return (id)v5;
}

- (NSString)accessibilityLabel
{
  void *v2;
  void *v3;

  +[AKController akBundle](AKController, "akBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Signature"), &stru_24F1A83D0, CFSTR("AKSignature"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)accessibilityValue
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[AKSignature descriptionTag](self, "descriptionTag");
  if ((unint64_t)(v3 - 1) < 5)
  {
    +[AKSignatureDescription stringValueForSignatureDescriptionTag:](AKSignatureDescription, "stringValueForSignatureDescriptionTag:", -[AKSignature descriptionTag](self, "descriptionTag"));
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  if (v3 == -1)
  {
    -[AKSignature customDescription](self, "customDescription");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v5 = (void *)v4;
    if (v4)
      return v5;
  }
  -[AKSignature creationDate](self, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    +[AKController akBundle](AKController, "akBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Created %@"), &stru_24F1A83D0, CFSTR("AKSignature"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v6, 3, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v9, v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldPersist
{
  return self->_shouldPersist;
}

- (void)setShouldPersist:(BOOL)a3
{
  self->_shouldPersist = a3;
}

- (NSUUID)uniqueID
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUniqueID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (void)setBaselineOffset:(double)a3
{
  self->_baselineOffset = a3;
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (int64_t)descriptionTag
{
  return self->_descriptionTag;
}

- (void)setDescriptionTag:(int64_t)a3
{
  self->_descriptionTag = a3;
}

- (NSString)customDescription
{
  return self->_customDescription;
}

- (void)setCustomDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customDescription, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_drawing, 0);
}

@end
