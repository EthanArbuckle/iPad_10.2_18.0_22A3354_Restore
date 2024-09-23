@implementation AKTextFieldAnnotation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AKTextFieldAnnotation;
  -[AKRectangularShapeAnnotation encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[AKTextFieldAnnotation fieldName](self, "fieldName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AKTextFieldAnnotation fieldName](self, "fieldName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("fieldName"));

  }
}

- (AKTextFieldAnnotation)initWithCoder:(id)a3
{
  id v4;
  AKTextFieldAnnotation *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKTextFieldAnnotation;
  v5 = -[AKRectangularShapeAnnotation initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fieldName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKTextFieldAnnotation setFieldName:](v5, "setFieldName:", v6);

  }
  return v5;
}

- (NSString)fieldName
{
  return (NSString *)objc_getProperty(self, a2, 312, 1);
}

- (void)setFieldName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 312);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldName, 0);
}

@end
