@implementation GCGenericDeviceRumbleActuatorModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceRumbleActuatorModel)init
{
  -[GCGenericDeviceRumbleActuatorModel doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (GCGenericDeviceRumbleActuatorModel)initWithCoder:(id)a3
{
  id v3;
  GCGenericDeviceRumbleActuatorModel *v4;
  uint64_t v5;
  NSString *name;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GCGenericDeviceRumbleActuatorModel;
  v3 = a3;
  v4 = -[GCGenericDeviceRumbleActuatorModel init](&v8, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"), v8.receiver, v8.super_class);
  v5 = objc_claimAutoreleasedReturnValue();

  name = v4->_name;
  v4->_name = (NSString *)v5;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GCGenericDeviceRumbleActuatorModel name](self, "name");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

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
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((-[GCGenericDeviceRumbleActuatorModel isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    {
LABEL_7:
      v7 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !-[GCGenericDeviceRumbleActuatorModel isMemberOfClass:](self, "isMemberOfClass:", objc_msgSend((id)objc_opt_class(), "modelClass")))
    {
      goto LABEL_7;
    }
  }
  -[GCGenericDeviceRumbleActuatorModel name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

LABEL_8:
  return v7;
}

+ (id)description
{
  return CFSTR("Rumble Actuator");
}

- (id)debugDescription
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceRumbleActuatorModel name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p> {\n\t name = %@\n}"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  id v15[7];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v15[0] = 0;
  objc_msgSend(v6, "gc_requiredObjectForKey:ofClass:error:", CFSTR("Name"), objc_opt_class(), v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15[0];
  if (v8)
  {
    objc_msgSend(v7, "setName:", v8);

    objc_msgSend(v7, "build");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
    {
      v16[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v12;
      v16[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v9, "localizedFailureReason");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v13;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v10 = 0;
  }

  return v10;
}

@end
