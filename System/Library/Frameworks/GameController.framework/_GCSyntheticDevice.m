@implementation _GCSyntheticDevice

+ (_QWORD)deviceWithDescription:(void *)a3 creator:
{
  id v4;
  uint64_t (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  id v13;
  void *v14;
  _QWORD *v15;
  void *v17;

  v4 = a2;
  v5 = a3;
  v6 = (void *)objc_opt_self();
  if (v6 == (void *)objc_opt_class())
  {
    objc_msgSend(v6, "doesNotRecognizeSelector:", sel_deviceWithDescription_creator_);
    v15 = 0;
  }
  else
  {
    objc_msgSend(v4, "controllerIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "devicePropertiesWithDescription:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "controllerIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("_GCSyntheticDeviceIdentifier"));

    if (!v9)
    {
      unk_254DEC4F8(&off_254DEC660, "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", sel_deviceWithDescription_creator_, v6, CFSTR("_GCSyntheticDevice.m"), 28, CFSTR("Assertion failed: deviceProperties != ((void *)0)"));

    }
    v11 = v5[2](v5, v9);
    if (v11)
    {
      v12 = v11;
      v13 = objc_alloc((Class)v6);
      objc_msgSend(v4, "persistentIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[_GCSyntheticDevice initWithIdentifier:controllerIdentifier:persistentIdentifier:service:](v13, v8, v7, v14, v12);

    }
    else
    {
      v15 = 0;
    }

  }
  return v15;
}

- (_QWORD)initWithIdentifier:(void *)a3 controllerIdentifier:(void *)a4 persistentIdentifier:(int)a5 service:
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_super v19;

  if (!a1)
    return 0;
  v19.receiver = a1;
  v19.super_class = (Class)_GCSyntheticDevice;
  v8 = a4;
  v9 = a3;
  v10 = a2;
  v11 = objc_msgSendSuper2(&v19, sel_init);
  v12 = objc_msgSend(v10, "copyWithZone:", 0, v19.receiver, v19.super_class);

  v13 = (void *)v11[2];
  v11[2] = v12;

  v14 = objc_msgSend(v9, "copyWithZone:", 0);
  v15 = (void *)v11[3];
  v11[3] = v14;

  v16 = objc_msgSend(v8, "copy");
  v17 = (void *)v11[4];
  v11[4] = v16;

  *((_DWORD *)v11 + 2) = a5;
  return v11;
}

+ (id)devicePropertiesWithDescription:(id)a3
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (_GCSyntheticDevice)init
{
  -[_GCSyntheticDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  mach_port_deallocate(*MEMORY[0x24BDAEC58], self->_serviceIdentity);
  v3.receiver = self;
  v3.super_class = (Class)_GCSyntheticDevice;
  -[_GCSyntheticDevice dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  id Property;
  const char *v7;
  id v8;
  id v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self)
      Property = objc_getProperty(self, v5, 16, 1);
    else
      Property = 0;
    v8 = Property;
    if (v4)
      v9 = objc_getProperty(v4, v7, 16, 1);
    else
      v9 = 0;
    v10 = objc_msgSend(v8, "isEqual:", v9);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = -[NSString isEqual:](self->_identifier, "isEqual:", v4);
    else
      v10 = 0;
  }

  return v10;
}

- (id)identifier
{
  if (result)
    return objc_getProperty(result, a2, 16, 1);
  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ '%@'>"), objc_opt_class(), self->_identifier);
}

- (id)debugDescription
{
  objc_class *v3;
  void *v4;
  void *v5;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ %p '%@'>"), v4, self, self->_identifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)serviceIdentity
{
  if (result)
    return *(unsigned int *)(result + 8);
  return result;
}

- (id)controllerIdentifier
{
  if (result)
    return objc_getProperty(result, a2, 24, 1);
  return result;
}

- (id)persistentIdentifier
{
  if (result)
    return objc_getProperty(result, a2, 32, 1);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_controllerIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
