@implementation AVAnnotationUnknownRepresentation

- (id)_initWithPropertyList:(id)a3 binaryData:(id)a4
{
  _QWORD *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVAnnotationUnknownRepresentation;
  v6 = -[AVAnnotationRepresentation _initWithPropertyList:binaryData:](&v8, sel__initWithPropertyList_binaryData_);
  if (v6)
  {
    v6[4] = objc_msgSend(a3, "copy");
    v6[5] = objc_msgSend(a4, "copy");
    objc_msgSend(v6, "_setRepresentationType:", CFSTR("AVAnnotationRepresentationTypeUnknown"));
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAnnotationUnknownRepresentation;
  -[AVAnnotationRepresentation dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVAnnotationUnknownRepresentation;
  v5 = -[AVAnnotationRepresentation isEqual:](&v9, sel_isEqual_);
  if (a3 != self)
  {
    if (!a3)
      goto LABEL_7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_7;
    v8 = 0;
    v6 = objc_msgSend(a3, "_propertyListAndBinaryData:", &v8);
    if (v5)
    {
      if (-[NSDictionary isEqualToDictionary:](self->_properties, "isEqualToDictionary:", v6))
      {
        LOBYTE(v5) = -[NSData isEqualToData:](self->_binaryData, "isEqualToData:", v8);
        return v5;
      }
LABEL_7:
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVAnnotationUnknownRepresentation;
  v3 = -[AVAnnotationRepresentation hash](&v6, sel_hash);
  v4 = -[NSDictionary hash](self->_properties, "hash") ^ v3;
  return v4 ^ -[NSData hash](self->_binaryData, "hash");
}

- (id)_propertyListAndBinaryData:(id *)a3
{
  if (a3)
    *a3 = self->_binaryData;
  return (id)-[NSDictionary mutableCopy](self->_properties, "mutableCopy");
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>"), NSStringFromClass(v4), self);
}

@end
