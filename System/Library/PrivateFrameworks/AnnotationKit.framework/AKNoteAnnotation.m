@implementation AKNoteAnnotation

+ (id)keyPathsForValuesAffectingHitTestBounds
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKNoteAnnotation;
  objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingHitTestBounds);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF3F0);
  return v4;
}

+ (id)keyPathsForValuesAffectingDrawingBounds
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKNoteAnnotation;
  objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingDrawingBounds);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF408);
  return v4;
}

+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("rectangle")))
  {
    +[AKController akBundle](AKController, "akBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Bounds");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("fillColor")))
  {
    +[AKController akBundle](AKController, "akBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Color");
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("contents")))
    {
LABEL_8:
      v10.receiver = a1;
      v10.super_class = (Class)&OBJC_METACLASS___AKNoteAnnotation;
      objc_msgSendSuper2(&v10, sel_displayNameForUndoablePropertyChangeWithKey_, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    +[AKController akBundle](AKController, "akBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Contents");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24F1A83D0, CFSTR("AnnotationStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_8;
LABEL_9:

  return v8;
}

- (id)keysForValuesToObserveForUndo
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v6.receiver = self;
  v6.super_class = (Class)AKNoteAnnotation;
  -[AKAnnotation keysForValuesToObserveForUndo](&v6, sel_keysForValuesToObserveForUndo);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF420);
  return v4;
}

- (id)keysForValuesToObserveForRedrawing
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v6.receiver = self;
  v6.super_class = (Class)AKNoteAnnotation;
  -[AKAnnotation keysForValuesToObserveForRedrawing](&v6, sel_keysForValuesToObserveForRedrawing);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF438);
  return v4;
}

- (id)displayName
{
  void *v2;
  void *v3;

  +[AKController akBundle](AKController, "akBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Note_Annotation"), CFSTR("Note"), CFSTR("AnnotationStrings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)flattenModelExifOrientation:(int64_t)a3 withModelSize:(CGSize)a4
{
  double height;
  double width;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGAffineTransform v16[2];
  CGRect v17;
  CGRect v18;

  height = a4.height;
  width = a4.width;
  +[AKGeometryHelper adjustOriginalExifOrientationOnAnnotation:flatteningOriginalModelExif:](AKGeometryHelper, "adjustOriginalExifOrientationOnAnnotation:flatteningOriginalModelExif:", self, a3);
  -[AKNoteAnnotation rectangle](self, "rectangle");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  memset(&v16[1], 0, sizeof(CGAffineTransform));
  +[AKGeometryHelper affineTransformFlatteningOriginalModelExif:withOriginalModelSize:](AKGeometryHelper, "affineTransformFlatteningOriginalModelExif:withOriginalModelSize:", a3, width, height);
  v16[0] = v16[1];
  v17.origin.x = v9;
  v17.origin.y = v11;
  v17.size.width = v13;
  v17.size.height = v15;
  v18 = CGRectApplyAffineTransform(v17, v16);
  -[AKNoteAnnotation setRectangle:](self, "setRectangle:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
}

- (void)translateBy:(CGPoint)a3
{
  double y;
  double x;
  _BOOL8 v7;
  double v8;
  double v9;

  y = a3.y;
  x = a3.x;
  if (a3.x != *MEMORY[0x24BDBEFB0] || a3.y != *(double *)(MEMORY[0x24BDBEFB0] + 8))
  {
    v7 = -[AKAnnotation isTranslating](self, "isTranslating");
    -[AKAnnotation setIsTranslating:](self, "setIsTranslating:", 1);
    -[AKNoteAnnotation rectangle](self, "rectangle");
    -[AKNoteAnnotation setRectangle:](self, "setRectangle:", x + v8, y + v9);
    -[AKAnnotation setIsTranslating:](self, "setIsTranslating:", v7);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CFDictionaryRef DictionaryRepresentation;
  void *v6;
  void *v7;
  objc_super v8;
  CGRect v9;

  v8.receiver = self;
  v8.super_class = (Class)AKNoteAnnotation;
  v4 = a3;
  -[AKAnnotation encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[AKNoteAnnotation rectangle](self, "rectangle", v8.receiver, v8.super_class);
  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v9);
  objc_msgSend(v4, "encodeObject:forKey:", DictionaryRepresentation, CFSTR("rectangle"));
  -[AKNoteAnnotation fillColor](self, "fillColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "akEncodeColor:forKey:", v6, CFSTR("fillColor"));

  -[AKNoteAnnotation contents](self, "contents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("contents"));

}

- (AKNoteAnnotation)initWithCoder:(id)a3
{
  id v4;
  AKNoteAnnotation *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFDictionary *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AKNoteAnnotation;
  v5 = -[AKAnnotation initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("rectangle"));
    v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    CGRectMakeWithDictionaryRepresentation(v10, &v5->_rectangle);
    objc_msgSend(v4, "akDecodeColorForKey:", CFSTR("fillColor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKNoteAnnotation setFillColor:](v5, "setFillColor:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contents"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKNoteAnnotation setContents:](v5, "setContents:", v12);

  }
  return v5;
}

- (CGRect)rectangle
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_rectangle, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setRectangle:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_rectangle, &v3, 32, 1, 0);
}

- (UIColor)fillColor
{
  return (UIColor *)objc_getProperty(self, a2, 184, 1);
}

- (void)setFillColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (AKAnnotation)childAnnotation
{
  return (AKAnnotation *)objc_loadWeakRetained((id *)&self->_childAnnotation);
}

- (void)setChildAnnotation:(id)a3
{
  objc_storeWeak((id *)&self->_childAnnotation, a3);
}

- (NSString)contents
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setContents:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);
  objc_destroyWeak((id *)&self->_childAnnotation);
  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end
