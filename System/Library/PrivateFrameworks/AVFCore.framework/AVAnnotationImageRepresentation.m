@implementation AVAnnotationImageRepresentation

- (AVAnnotationImageRepresentation)initWithImageData:(id)a3 fileType:(id)a4
{
  AVAnnotationImageRepresentation *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVAnnotationImageRepresentation;
  v6 = -[AVAnnotationRepresentation _initWithRepresentationType:](&v8, sel__initWithRepresentationType_, CFSTR("AVAnnotationRepresentationTypeImage"));
  if (v6)
  {
    v6->_imageData = (NSData *)objc_msgSend(a3, "copy");
    v6->_fileType = (NSString *)objc_msgSend(a4, "copy");
  }
  return v6;
}

- (id)_initWithPropertyList:(id)a3 binaryData:(id)a4
{
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVAnnotationImageRepresentation;
  v6 = -[AVAnnotationRepresentation _initWithPropertyList:binaryData:](&v10, sel__initWithPropertyList_binaryData_);
  v7 = v6;
  if (a4
    && v6
    && (v6[4] = objc_msgSend(a4, "copy"),
        v8 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAnnotationRepresentationArchiveKeyFileType")),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7[5] = objc_msgSend(v8, "copy");
  }
  else
  {

    return 0;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAnnotationImageRepresentation;
  -[AVAnnotationRepresentation dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVAnnotationImageRepresentation;
  v5 = -[AVAnnotationRepresentation isEqual:](&v7, sel_isEqual_);
  if (a3 != self)
    LOBYTE(v5) = a3
              && (objc_opt_class(), (objc_opt_isKindOfClass() & v5) == 1)
              && -[NSData isEqualToData:](-[AVAnnotationImageRepresentation imageData](self, "imageData"), "isEqualToData:", objc_msgSend(a3, "imageData"))&& -[NSString isEqualToString:](-[AVAnnotationImageRepresentation fileType](self, "fileType"), "isEqualToString:", objc_msgSend(a3, "fileType"));
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVAnnotationImageRepresentation;
  v3 = -[AVAnnotationRepresentation hash](&v6, sel_hash);
  v4 = -[NSData hash](-[AVAnnotationImageRepresentation imageData](self, "imageData"), "hash");
  return v4 ^ -[NSString hash](-[AVAnnotationImageRepresentation fileType](self, "fileType"), "hash") ^ v3;
}

- (id)_propertyListAndBinaryData:(id *)a3
{
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVAnnotationImageRepresentation;
  v5 = -[AVAnnotationRepresentation _propertyListAndBinaryData:](&v7, sel__propertyListAndBinaryData_);
  objc_msgSend(v5, "setObject:forKey:", -[AVAnnotationImageRepresentation fileType](self, "fileType"), CFSTR("AVAnnotationRepresentationArchiveKeyFileType"));
  if (a3)
    *a3 = -[AVAnnotationImageRepresentation imageData](self, "imageData");
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

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)fileType
{
  return self->_fileType;
}

- (void)setFileType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

@end
