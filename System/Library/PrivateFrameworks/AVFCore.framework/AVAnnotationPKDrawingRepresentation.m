@implementation AVAnnotationPKDrawingRepresentation

- (AVAnnotationPKDrawingRepresentation)initWithDrawingData:(id)a3
{
  AVAnnotationPKDrawingRepresentation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVAnnotationPKDrawingRepresentation;
  v4 = -[AVAnnotationRepresentation _initWithRepresentationType:](&v6, sel__initWithRepresentationType_, CFSTR("AVAnnotationRepresentationTypePKDrawing"));
  if (v4)
    v4->_drawingData = (NSData *)objc_msgSend(a3, "copy");
  return v4;
}

- (id)_initWithPropertyList:(id)a3 binaryData:(id)a4
{
  _QWORD *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVAnnotationPKDrawingRepresentation;
  v5 = -[AVAnnotationRepresentation _initWithPropertyList:binaryData:](&v8, sel__initWithPropertyList_binaryData_, a3);
  v6 = v5;
  if (a4 && v5)
  {
    v5[4] = objc_msgSend(a4, "copy");
  }
  else
  {

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAnnotationPKDrawingRepresentation;
  -[AVAnnotationRepresentation dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVAnnotationPKDrawingRepresentation;
  v5 = -[AVAnnotationRepresentation isEqual:](&v7, sel_isEqual_);
  if (a3 != self)
    LOBYTE(v5) = a3
              && (objc_opt_class(), (objc_opt_isKindOfClass() & v5) == 1)
              && -[NSData isEqualToData:](-[AVAnnotationPKDrawingRepresentation drawingData](self, "drawingData"), "isEqualToData:", objc_msgSend(a3, "drawingData"));
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVAnnotationPKDrawingRepresentation;
  v3 = -[AVAnnotationRepresentation hash](&v5, sel_hash);
  return -[NSData hash](-[AVAnnotationPKDrawingRepresentation drawingData](self, "drawingData"), "hash") ^ v3;
}

- (id)_propertyListAndBinaryData:(id *)a3
{
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVAnnotationPKDrawingRepresentation;
  v5 = -[AVAnnotationRepresentation _propertyListAndBinaryData:](&v7, sel__propertyListAndBinaryData_);
  if (a3)
    *a3 = -[AVAnnotationPKDrawingRepresentation drawingData](self, "drawingData");
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

- (NSData)drawingData
{
  return self->_drawingData;
}

- (void)setDrawingData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
