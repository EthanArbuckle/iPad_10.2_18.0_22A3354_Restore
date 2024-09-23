@implementation GCGenericDeviceModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceModel)init
{
  -[GCGenericDeviceModel doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (GCGenericDeviceModel)initWithCoder:(id)a3
{
  id v3;
  GCGenericDeviceModel *v4;
  uint64_t v5;
  NSString *productCategory;
  uint64_t v7;
  NSString *productName;
  uint64_t v9;
  NSNumber *formFitting;
  uint64_t v11;
  GCGenericDeviceDriverModel *driver;
  uint64_t v13;
  GCGenericDevicePhysicalInputModel *physicalInput;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)GCGenericDeviceModel;
  v3 = a3;
  v4 = -[GCGenericDeviceModel init](&v16, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productCategory"), v16.receiver, v16.super_class);
  v5 = objc_claimAutoreleasedReturnValue();
  productCategory = v4->_productCategory;
  v4->_productCategory = (NSString *)v5;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productName"));
  v7 = objc_claimAutoreleasedReturnValue();
  productName = v4->_productName;
  v4->_productName = (NSString *)v7;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("formFitting"));
  v9 = objc_claimAutoreleasedReturnValue();
  formFitting = v4->_formFitting;
  v4->_formFitting = (NSNumber *)v9;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("driver"));
  v11 = objc_claimAutoreleasedReturnValue();
  driver = v4->_driver;
  v4->_driver = (GCGenericDeviceDriverModel *)v11;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("physicalInput"));
  v13 = objc_claimAutoreleasedReturnValue();

  physicalInput = v4->_physicalInput;
  v4->_physicalInput = (GCGenericDevicePhysicalInputModel *)v13;

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
  -[GCGenericDeviceModel productCategory](self, "productCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("productCategory"));

  -[GCGenericDeviceModel productName](self, "productName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("productName"));

  -[GCGenericDeviceModel isFormFitting](self, "isFormFitting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("formFitting"));

  -[GCGenericDeviceModel driver](self, "driver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("driver"));

  -[GCGenericDeviceModel physicalInput](self, "physicalInput");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("physicalInput"));

}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !-[GCGenericDeviceModel isMemberOfClass:](self, "isMemberOfClass:", objc_msgSend((id)objc_opt_class(), "modelClass")))
    {
      goto LABEL_10;
    }
LABEL_6:
    -[GCGenericDeviceModel productCategory](self, "productCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "productCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqual:", v7))
    {
      v11 = 0;
LABEL_32:

      goto LABEL_33;
    }
    -[GCGenericDeviceModel productName](self, "productName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "productName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 != v9)
    {
      -[GCGenericDeviceModel productName](self, "productName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "productName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v10;
      if (!objc_msgSend(v10, "isEqual:", v3))
      {
        v11 = 0;
        goto LABEL_30;
      }
    }
    -[GCGenericDeviceModel isFormFitting](self, "isFormFitting");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "isFormFitting");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v12 == (void *)v13)
    {
      v34 = (void *)v13;
    }
    else
    {
      -[GCGenericDeviceModel isFormFitting](self, "isFormFitting");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "isFormFitting");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v15;
      if (!objc_msgSend(v15, "isEqual:", v32))
      {
        v11 = 0;
LABEL_28:

LABEL_29:
        if (v8 == v9)
        {
LABEL_31:

          goto LABEL_32;
        }
LABEL_30:

        goto LABEL_31;
      }
      v34 = v14;
    }
    -[GCGenericDeviceModel driver](self, "driver");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "driver");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)v16;
    if ((void *)v16 == v17)
    {
      v28 = v12;
      v29 = v3;
    }
    else
    {
      -[GCGenericDeviceModel driver](self, "driver");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "driver");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v18;
      if (!objc_msgSend(v18, "isEqual:"))
      {
        v11 = 0;
        v25 = v35;
        goto LABEL_26;
      }
      v28 = v12;
      v29 = v3;
    }
    -[GCGenericDeviceModel physicalInput](self, "physicalInput");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "physicalInput");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

      v11 = 1;
    }
    else
    {
      v21 = (void *)v20;
      -[GCGenericDeviceModel physicalInput](self, "physicalInput");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "physicalInput");
      v27 = v9;
      v23 = v8;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v22, "isEqual:", v24);

      v8 = v23;
      v9 = v27;

    }
    v25 = v35;
    v12 = v28;
    v3 = v29;
    if (v35 == v17)
    {
LABEL_27:

      v14 = v34;
      if (v12 == v34)
        goto LABEL_29;
      goto LABEL_28;
    }
LABEL_26:

    goto LABEL_27;
  }
  if ((-[GCGenericDeviceModel isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
    goto LABEL_6;
LABEL_10:
  v11 = 0;
LABEL_33:

  return v11;
}

+ (id)description
{
  return CFSTR("Model");
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
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceModel productCategory](self, "productCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceModel productName](self, "productName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceModel isFormFitting](self, "isFormFitting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceModel driver](self, "driver");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceModel physicalInput](self, "physicalInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "debugDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p> {\n\t productCategory = %@\n\t productName = %@\n\t formFitting = %@\n\t driver = %@\n\t physicalInput = %@\n}"), v14, self, v4, v5, v6, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)productCategory
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)productName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)isFormFitting
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (GCGenericDeviceDriverModel)driver
{
  return (GCGenericDeviceDriverModel *)objc_getProperty(self, a2, 32, 1);
}

- (GCGenericDevicePhysicalInputModel)physicalInput
{
  return (GCGenericDevicePhysicalInputModel *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalInput, 0);
  objc_storeStrong((id *)&self->_driver, 0);
  objc_storeStrong((id *)&self->_formFitting, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_productCategory, 0);
}

+ (GCGenericDeviceModel)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  NSString *v12;
  Class v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  id v20[7];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v20[0] = 0;
  objc_msgSend(a3, "gc_objectForKey:ofClass:error:", CFSTR("ProductClass"), objc_opt_class(), v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v20[0];
  v9 = v8;
  if (v7)
    v10 = 1;
  else
    v10 = v8 == 0;
  if (!v10)
  {
    if (a4)
    {
      v23[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      v24[0] = v12;
      v23[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v9, "localizedFailureReason");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v17;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v18);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    goto LABEL_20;
  }
  v11 = objc_opt_class();
  if (v7)
  {
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("GCGeneric%@ModelBuilder"), v7);
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    v13 = NSClassFromString(v12);
    if (!v13 || (-[objc_class isSubclassOfClass:](v13, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
    {
      if (!a4)
      {
LABEL_19:

        goto LABEL_20;
      }
      v21[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v17;
      v21[1] = *MEMORY[0x1E0CB2D68];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("'%@' is not a valid product class."), v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = v18;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v19);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_18:
      goto LABEL_19;
    }

  }
  else
  {
    v13 = (Class)v11;
  }
  v14 = (void *)objc_msgSend([v13 alloc], "initWithDictionaryRepresentation:error:", a3, a4);
  if (!v14)
  {
LABEL_20:

    v15 = 0;
    goto LABEL_13;
  }

  objc_msgSend(v14, "build");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v14;
LABEL_13:

  return (GCGenericDeviceModel *)v15;
}

@end
