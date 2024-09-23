@implementation GCGenericDevicePhysicalInputElementModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDevicePhysicalInputElementModel)init
{
  -[GCGenericDevicePhysicalInputElementModel doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (GCGenericDevicePhysicalInputElementModel)initWithCoder:(id)a3
{
  id v3;
  GCGenericDevicePhysicalInputElementModel *v4;
  uint64_t v5;
  NSString *identifier;
  uint64_t v7;
  NSArray *names;
  uint64_t v9;
  NSNumber *analog;
  uint64_t v11;
  NSString *localizedNameKey;
  uint64_t v13;
  NSString *symbolName;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)GCGenericDevicePhysicalInputElementModel;
  v3 = a3;
  v4 = -[GCGenericDevicePhysicalInputElementModel init](&v16, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"), v16.receiver, v16.super_class);
  v5 = objc_claimAutoreleasedReturnValue();
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v5;

  objc_msgSend(v3, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("names"));
  v7 = objc_claimAutoreleasedReturnValue();
  names = v4->_names;
  v4->_names = (NSArray *)v7;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("analog"));
  v9 = objc_claimAutoreleasedReturnValue();
  analog = v4->_analog;
  v4->_analog = (NSNumber *)v9;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedNameKey"));
  v11 = objc_claimAutoreleasedReturnValue();
  localizedNameKey = v4->_localizedNameKey;
  v4->_localizedNameKey = (NSString *)v11;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbolName"));
  v13 = objc_claimAutoreleasedReturnValue();

  symbolName = v4->_symbolName;
  v4->_symbolName = (NSString *)v13;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[GCGenericDevicePhysicalInputElementModel identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[GCGenericDevicePhysicalInputElementModel names](self, "names");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("names"));

  -[GCGenericDevicePhysicalInputElementModel isAnalog](self, "isAnalog");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("analog"));

  -[GCGenericDevicePhysicalInputElementModel localizedNameKey](self, "localizedNameKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("localizedNameKey"));

  -[GCGenericDevicePhysicalInputElementModel symbolName](self, "symbolName");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("symbolName"));

}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !-[GCGenericDevicePhysicalInputElementModel isMemberOfClass:](self, "isMemberOfClass:", objc_msgSend((id)objc_opt_class(), "modelClass")))
    {
      goto LABEL_12;
    }
LABEL_6:
    -[GCGenericDevicePhysicalInputElementModel identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "isEqual:", v6))
    {
      v15 = 0;
LABEL_26:

      goto LABEL_27;
    }
    -[GCGenericDevicePhysicalInputElementModel names](self, "names");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "names");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "isEqual:", v8))
    {
      v15 = 0;
LABEL_25:

      goto LABEL_26;
    }
    -[GCGenericDevicePhysicalInputElementModel isAnalog](self, "isAnalog");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "isAnalog");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "isEqual:", v10))
    {
      v15 = 0;
LABEL_24:

      goto LABEL_25;
    }
    -[GCGenericDevicePhysicalInputElementModel localizedNameKey](self, "localizedNameKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedNameKey");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v11 == (void *)v12)
    {
      v24 = (void *)v12;
      v25 = v11;
    }
    else
    {
      v22 = v10;
      -[GCGenericDevicePhysicalInputElementModel localizedNameKey](self, "localizedNameKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedNameKey");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v14;
      if (!objc_msgSend(v14, "isEqual:"))
      {
        v15 = 0;
        v10 = v22;
LABEL_22:

LABEL_23:
        goto LABEL_24;
      }
      v24 = v13;
      v25 = v11;
      v10 = v22;
    }
    -[GCGenericDevicePhysicalInputElementModel symbolName](self, "symbolName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "symbolName");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v16 == (void *)v17)
    {

      v15 = 1;
    }
    else
    {
      v18 = (void *)v17;
      -[GCGenericDevicePhysicalInputElementModel symbolName](self, "symbolName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "symbolName");
      v23 = v9;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v21, "isEqual:", v19);

      v9 = v23;
    }
    v13 = v24;
    v11 = v25;
    if (v25 == v24)
      goto LABEL_23;
    goto LABEL_22;
  }
  if ((-[GCGenericDevicePhysicalInputElementModel isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
    goto LABEL_6;
LABEL_12:
  v15 = 0;
LABEL_27:

  return v15;
}

+ (id)description
{
  return CFSTR("Element");
}

- (id)debugDescription
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDevicePhysicalInputElementModel identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDevicePhysicalInputElementModel names](self, "names");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDevicePhysicalInputElementModel isAnalog](self, "isAnalog");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDevicePhysicalInputElementModel localizedNameKey](self, "localizedNameKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDevicePhysicalInputElementModel symbolName](self, "symbolName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p> {\n\t identifier = %@\n\t names = %@\n\t analog = %@\n\t localizedNameKey = %@\n\t symbolName = %@\n}"), v4, self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)names
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)isAnalog
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)localizedNameKey
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)symbolName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_localizedNameKey, 0);
  objc_storeStrong((id *)&self->_analog, 0);
  objc_storeStrong((id *)&self->_names, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  NSString *v9;
  Class v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20[7];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v20[0] = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("Type"), objc_opt_class(), v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v20[0];
  if (!v7)
  {
    if (a4)
    {
      v23[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v17;
      v23[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v8, "localizedFailureReason");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v18;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v19);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_11;
  }
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("GCGenericDevicePhysicalInput%@ModelBuilder"), v7);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = NSClassFromString(v9);
  if (!v10
    || v10 == (Class)objc_opt_class()
    || (-[objc_class isSubclassOfClass:](v10, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    if (a4)
    {
      v21[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v14;
      v21[1] = *MEMORY[0x1E0CB2D68];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("'%@' is not a valid element type."), v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = v15;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_10;
  }
  v11 = (void *)objc_msgSend([v10 alloc], "initWithDictionaryRepresentation:error:", v6, a4);
  if (!v11)
  {
LABEL_10:

LABEL_11:
    v12 = 0;
    goto LABEL_7;
  }

  objc_msgSend(v11, "build");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
LABEL_7:

  return v12;
}

@end
