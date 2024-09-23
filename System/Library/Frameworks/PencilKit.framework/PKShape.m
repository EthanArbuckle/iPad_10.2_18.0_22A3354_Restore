@implementation PKShape

- (PKShape)initWithShapeType:(int64_t)a3 strokes:(id)a4 originalStroke:(id)a5
{
  id v9;
  id v10;
  PKShape *v11;
  PKShape *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKShape;
  v11 = -[PKShape init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_strokes, a4);
    objc_storeStrong((id *)&v12->_originalStroke, a5);
  }

  return v12;
}

- (BOOL)fillable
{
  return +[PKShape isFillableForShapeType:](PKShape, "isFillableForShapeType:", self->_type);
}

+ (id)snapToShapeActionNameForNumShapes:(unint64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  _PencilKitBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 > 1)
    v6 = CFSTR("Snap to Shapes");
  else
    v6 = CFSTR("Snap to Shape");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, v6, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)isFillableForShapeType:(int64_t)a3
{
  return ((unint64_t)a3 < 0xD) & (0x1F1Eu >> a3);
}

- (int64_t)type
{
  return self->_type;
}

- (NSArray)strokes
{
  return self->_strokes;
}

- (PKStroke)originalStroke
{
  return self->_originalStroke;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalStroke, 0);
  objc_storeStrong((id *)&self->_strokes, 0);
}

@end
