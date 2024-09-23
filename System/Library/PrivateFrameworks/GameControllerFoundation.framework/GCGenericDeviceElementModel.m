@implementation GCGenericDeviceElementModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceElementModel)init
{
  -[GCGenericDeviceElementModel doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (GCGenericDeviceElementModel)initWithCoder:(id)a3
{
  id v3;
  GCGenericDeviceElementModel *v4;
  uint64_t v5;
  NSPredicate *predicate;
  uint64_t v7;
  NSString *identifier;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GCGenericDeviceElementModel;
  v3 = a3;
  v4 = -[GCGenericDeviceElementModel init](&v11, sel_init);
  v4->_elementCookie = objc_msgSend(v3, "decodeIntForKey:", CFSTR("elementCookie"), v11.receiver, v11.super_class);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predicate"));
  v5 = objc_claimAutoreleasedReturnValue();
  predicate = v4->_predicate;
  v4->_predicate = (NSPredicate *)v5;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v7 = objc_claimAutoreleasedReturnValue();
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v7;

  v4->_optional = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("optional"));
  v4->_typeOverride = objc_msgSend(v3, "decodeIntForKey:", CFSTR("typeOverride"));
  v4->_calibrationMin = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("calibrationMin"));
  v9 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("calibrationMax"));

  v4->_calibrationMax = v9;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeInt:forKey:", -[GCGenericDeviceElementModel elementCookie](self, "elementCookie"), CFSTR("elementCookie"));
  -[GCGenericDeviceElementModel predicate](self, "predicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("predicate"));

  -[GCGenericDeviceElementModel identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(v6, "encodeBool:forKey:", -[GCGenericDeviceElementModel optional](self, "optional"), CFSTR("optional"));
  objc_msgSend(v6, "encodeInt:forKey:", -[GCGenericDeviceElementModel typeOverride](self, "typeOverride"), CFSTR("typeOverride"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[GCGenericDeviceElementModel calibrationMin](self, "calibrationMin"), CFSTR("calibrationMin"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[GCGenericDeviceElementModel calibrationMax](self, "calibrationMax"), CFSTR("calibrationMax"));

}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  uint64_t v6;
  int v7;
  BOOL v8;
  void *v9;
  void *v10;
  int v11;
  int v12;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((-[GCGenericDeviceElementModel isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    {
LABEL_9:
      v8 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !-[GCGenericDeviceElementModel isMemberOfClass:](self, "isMemberOfClass:", objc_msgSend((id)objc_opt_class(), "modelClass")))
    {
      goto LABEL_9;
    }
  }
  if (-[GCGenericDeviceElementModel elementCookie](self, "elementCookie")
    && (v6 = -[GCGenericDeviceElementModel elementCookie](self, "elementCookie"),
        (_DWORD)v6 == objc_msgSend(v5, "elementCookie")))
  {
    v7 = 0;
  }
  else
  {
    -[GCGenericDeviceElementModel predicate](self, "predicate");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend((id)v6, "isEqual:", v3))
    {
      v8 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v7 = 1;
  }
  -[GCGenericDeviceElementModel identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", v10)
    && (v11 = -[GCGenericDeviceElementModel optional](self, "optional"),
        v11 == objc_msgSend(v5, "optional")))
  {
    v12 = -[GCGenericDeviceElementModel typeOverride](self, "typeOverride");
    v8 = v12 == objc_msgSend(v5, "typeOverride");
  }
  else
  {
    v8 = 0;
  }

  if (v7)
    goto LABEL_18;
LABEL_19:

  return v8;
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

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceElementModel identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceElementModel predicate](self, "predicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p> {\n\t identifier = %@\n\t predicate = %@\n\t optional = %d\n\t type (override) = %i\n}"), v4, self, v5, v6, -[GCGenericDeviceElementModel optional](self, "optional"), -[GCGenericDeviceElementModel typeOverride](self, "typeOverride"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unsigned)elementCookie
{
  return self->_elementCookie;
}

- (void)setElementCookie:(unsigned int)a3
{
  self->_elementCookie = a3;
}

- (NSPredicate)predicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)optional
{
  return self->_optional;
}

- (int)typeOverride
{
  return self->_typeOverride;
}

- (int64_t)calibrationMin
{
  return self->_calibrationMin;
}

- (int64_t)calibrationMax
{
  return self->_calibrationMax;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

+ (id)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[2];
  _QWORD v65[2];
  const __CFString *v66;
  _QWORD v67[4];
  _QWORD v68[4];
  _QWORD v69[2];
  _QWORD v70[4];

  v70[2] = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_opt_new();
  v55 = 0;
  objc_msgSend(a3, "gc_requiredObjectForKey:ofClass:error:", CFSTR("Predicate"), objc_opt_class(), &v55);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v55;
  if (!v7)
  {
    if (a4)
    {
      v69[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v70[0] = v25;
      v69[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v8, "localizedFailureReason");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v70[1] = v26;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v70, v69, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v27);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_46;
  }
  +[NSPredicate predicateWithFormat:](&off_1F03AA788, "predicateWithFormat:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (a4)
    {
      v67[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = v43;
      v67[1] = *MEMORY[0x1E0CB2D68];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("String is not a valid predicate: %@"), v7);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v68[1] = v44;
      v67[2] = *MEMORY[0x1E0CB3388];
      v45 = v8;
      if (!v8)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v68[2] = v45;
      v67[3] = CFSTR("GCFailingKeyPathErrorKey");
      v66 = CFSTR("Predicate");
      +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", &v66, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v68[3] = v46;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v68, v67, 4);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v47);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      if (!v8)
    }

    goto LABEL_46;
  }
  objc_msgSend(v6, "setPredicate:", v9);

  v54 = 0;
  objc_msgSend(a3, "gc_requiredObjectForKey:ofClass:error:", CFSTR("Identifier"), objc_opt_class(), &v54);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v54;
  if (!v10)
  {
    if (a4)
    {
      v64[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = v28;
      v64[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v11, "localizedFailureReason");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v65[1] = v29;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v30);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_46;
  }
  objc_msgSend(v6, "setIdentifier:", v10);

  v53 = 0;
  objc_msgSend(a3, "gc_objectForKey:ofClass:error:", CFSTR("Optional"), objc_opt_class(), &v53);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v53;
  v14 = v13;
  if (!v12 && v13)
  {
    if (a4)
    {
      v62[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = v31;
      v62[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v14, "localizedFailureReason");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v63[1] = v32;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v33);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_46;
  }
  if (v12)
    objc_msgSend(v6, "setOptional:", objc_msgSend(v12, "BOOLValue"));

  v52 = 0;
  objc_msgSend(a3, "gc_objectForKey:ofClass:error:", CFSTR("TypeOverride"), objc_opt_class(), &v52);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v52;
  v17 = v16;
  if (!v15 && v16)
  {
    if (a4)
    {
      v60[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = v34;
      v60[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v17, "localizedFailureReason");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v61[1] = v35;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v36);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_46;
  }
  if (v15)
    objc_msgSend(v6, "setTypeOverride:", objc_msgSend(v15, "intValue"));

  v51 = 0;
  objc_msgSend(a3, "gc_objectForKey:ofClass:error:", CFSTR("CalibrationMin"), objc_opt_class(), &v51);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v51;
  v20 = v19;
  if (!v18 && v19)
  {
    if (a4)
    {
      v58[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = v37;
      v58[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v20, "localizedFailureReason");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v59[1] = v38;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v39);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_46;
  }
  if (v18)
    objc_msgSend(v6, "setCalibrationMin:", objc_msgSend(v18, "integerValue"));

  v50 = 0;
  objc_msgSend(a3, "gc_objectForKey:ofClass:error:", CFSTR("CalibrationMax"), objc_opt_class(), &v50);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v50;
  v23 = v22;
  if (!v21 && v22)
  {
    if (a4)
    {
      v56[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = v40;
      v56[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v23, "localizedFailureReason");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v57[1] = v41;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v42);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_46:
    v24 = 0;
    goto LABEL_47;
  }
  if (v21)
    objc_msgSend(v6, "setCalibrationMax:", objc_msgSend(v21, "integerValue"));

  objc_msgSend(v6, "build");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_47:

  return v24;
}

@end
