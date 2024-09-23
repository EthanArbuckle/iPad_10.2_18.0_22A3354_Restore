@implementation _GCSyntheticControllerDescription

- (_GCSyntheticControllerDescription)initWithControllerIdentifier:(id)a3 persistentIdentifier:(id)a4
{
  id v5;
  id v6;
  _GCSyntheticControllerDescription *v7;
  uint64_t v8;
  NSCopying *controllerIdentifier;
  uint64_t v10;
  NSString *persistentIdentifier;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_GCSyntheticControllerDescription;
  v5 = a4;
  v6 = a3;
  v7 = -[_GCSyntheticControllerDescription init](&v13, sel_init);
  v8 = objc_msgSend(v6, "copyWithZone:", 0, v13.receiver, v13.super_class);

  controllerIdentifier = v7->_controllerIdentifier;
  v7->_controllerIdentifier = (NSCopying *)v8;

  v10 = objc_msgSend(v5, "copy");
  persistentIdentifier = v7->_persistentIdentifier;
  v7->_persistentIdentifier = (NSString *)v10;

  return v7;
}

- (_GCSyntheticControllerDescription)init
{
  -[_GCSyntheticControllerDescription doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (unint64_t)hash
{
  return -[NSCopying hash](self->_controllerIdentifier, "hash");
}

- (BOOL)isEqualToDescription:(id)a3
{
  return -[NSCopying isEqual:](self->_controllerIdentifier, "isEqual:", *((_QWORD *)a3 + 1));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[_GCSyntheticControllerDescription isEqualToDescription:](self, "isEqualToDescription:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = -[NSCopying isEqual:](self->_controllerIdentifier, "isEqual:", v4);
  }
  v6 = v5;
LABEL_7:

  return v6;
}

- (id)description
{
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ '%@'>"), objc_opt_class(), self->_controllerIdentifier);
}

- (id)debugDescription
{
  objc_class *v3;
  void *v4;
  void *v5;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ %p '%@'>"), v4, self, self->_controllerIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSCopying)controllerIdentifier
{
  return (NSCopying *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)persistentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_controllerIdentifier, 0);
}

@end
