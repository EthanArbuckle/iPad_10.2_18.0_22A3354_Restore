@implementation GCGenericDeviceRumbleOutputFieldModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceRumbleOutputFieldModel)init
{
  -[GCGenericDeviceRumbleOutputFieldModel doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (GCGenericDeviceRumbleOutputFieldModel)initWithCoder:(id)a3
{
  id v3;
  GCGenericDeviceRumbleOutputFieldModel *v4;
  uint64_t v5;
  GCGenericDeviceDataProcessorExpressionModel *valueExpression;
  uint64_t v7;
  GCGenericDeviceDataProcessorExpressionModel *sizeExpression;
  uint64_t v9;
  GCGenericDeviceDataProcessorExpressionModel *offsetExpression;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GCGenericDeviceRumbleOutputFieldModel;
  v3 = a3;
  v4 = -[GCGenericDeviceRumbleOutputFieldModel init](&v12, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("valueExpression"), v12.receiver, v12.super_class);
  v5 = objc_claimAutoreleasedReturnValue();
  valueExpression = v4->_valueExpression;
  v4->_valueExpression = (GCGenericDeviceDataProcessorExpressionModel *)v5;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sizeExpression"));
  v7 = objc_claimAutoreleasedReturnValue();
  sizeExpression = v4->_sizeExpression;
  v4->_sizeExpression = (GCGenericDeviceDataProcessorExpressionModel *)v7;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("offsetExpression"));
  v9 = objc_claimAutoreleasedReturnValue();

  offsetExpression = v4->_offsetExpression;
  v4->_offsetExpression = (GCGenericDeviceDataProcessorExpressionModel *)v9;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[GCGenericDeviceRumbleOutputFieldModel valueExpression](self, "valueExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("valueExpression"));

  -[GCGenericDeviceRumbleOutputFieldModel offsetExpression](self, "offsetExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("offsetExpression"));

  -[GCGenericDeviceRumbleOutputFieldModel sizeExpression](self, "sizeExpression");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sizeExpression"));

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
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((-[GCGenericDeviceRumbleOutputFieldModel isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    {
LABEL_9:
      v11 = 0;
      goto LABEL_14;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !-[GCGenericDeviceRumbleOutputFieldModel isMemberOfClass:](self, "isMemberOfClass:", objc_msgSend((id)objc_opt_class(), "modelClass")))
    {
      goto LABEL_9;
    }
  }
  -[GCGenericDeviceRumbleOutputFieldModel valueExpression](self, "valueExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[GCGenericDeviceRumbleOutputFieldModel offsetExpression](self, "offsetExpression");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "offsetExpression");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[GCGenericDeviceRumbleOutputFieldModel sizeExpression](self, "sizeExpression");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sizeExpression");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

LABEL_14:
  return v11;
}

+ (id)description
{
  return CFSTR("Rumble Output Field");
}

- (id)debugDescription
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceRumbleOutputFieldModel valueExpression](self, "valueExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceRumbleOutputFieldModel offsetExpression](self, "offsetExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCGenericDeviceRumbleOutputFieldModel sizeExpression](self, "sizeExpression");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p> {\n\t valueExpression = %@\n\t offsetExpression = %@\n\t sizeExpression = %@\n}"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (GCGenericDeviceDataProcessorExpressionModel)valueExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 8, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)sizeExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 24, 1);
}

- (GCGenericDeviceDataProcessorExpressionModel)offsetExpression
{
  return (GCGenericDeviceDataProcessorExpressionModel *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeExpression, 0);
  objc_storeStrong((id *)&self->_offsetExpression, 0);
  objc_storeStrong((id *)&self->_valueExpression, 0);
}

+ (id)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72[7];
  _QWORD v73[4];
  _QWORD v74[4];
  _QWORD v75[2];
  _QWORD v76[2];
  _QWORD v77[4];
  _QWORD v78[4];
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[4];
  _QWORD v82[4];
  _QWORD v83[2];
  _QWORD v84[4];

  v84[2] = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_opt_new();
  v72[0] = 0;
  objc_msgSend(a3, "gc_requiredObjectForKey:ofClass:error:", CFSTR("ValueExpression"), objc_opt_class(), v72);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v72[0];
  if (!v7)
  {
    if (a4)
    {
      v83[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v84[0] = v21;
      v83[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v8, "localizedFailureReason");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v84[1] = v22;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v84, v83, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v23);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_69;
  }
  v71 = 0;
  +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDataProcessorExpressionModel, "modelWithDictionaryRepresentation:error:", v7, &v71);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v71;

  if (!v9)
  {
    if (a4)
    {
      v81[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v10, "localizedDescription");
      v24 = objc_claimAutoreleasedReturnValue();
      v63 = (void *)v24;
      if (!v24)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
        v24 = objc_claimAutoreleasedReturnValue();
      }
      v60 = (void *)v24;
      v82[0] = v24;
      v81[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v10, "localizedFailureReason");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      if (!v25)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating '%@' model for key '%@'."), objc_opt_class(), CFSTR("ValueExpression"));
        v25 = objc_claimAutoreleasedReturnValue();
      }
      v57 = (void *)v25;
      v82[1] = v25;
      v81[2] = *MEMORY[0x1E0CB3388];
      v27 = (uint64_t)v10;
      if (!v10)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v27 = objc_claimAutoreleasedReturnValue();
      }
      v54 = (void *)v27;
      v82[2] = v27;
      v81[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v10, "gc_failingKeyPath");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (!v28)
        v28 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v28, "arrayByAddingObject:", CFSTR("ValueExpression"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v82[3] = v30;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v82, v81, 4);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v31);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      if (!v10)
      if (!v26)

      if (!v63)
    }

    goto LABEL_69;
  }
  objc_msgSend(v6, "setValueExpression:", v9);

  v70 = 0;
  objc_msgSend(a3, "gc_requiredObjectForKey:ofClass:error:", CFSTR("OffsetExpression"), objc_opt_class(), &v70);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v70;
  if (!v11)
  {
    if (a4)
    {
      v79[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v80[0] = v32;
      v79[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v12, "localizedFailureReason");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v80[1] = v33;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v80, v79, 2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v34);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_69;
  }
  v69 = 0;
  +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDataProcessorExpressionModel, "modelWithDictionaryRepresentation:error:", v11, &v69);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v69;

  if (!v13)
  {
    if (a4)
    {
      v77[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v14, "localizedDescription");
      v35 = objc_claimAutoreleasedReturnValue();
      v64 = (void *)v35;
      if (!v35)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
        v35 = objc_claimAutoreleasedReturnValue();
      }
      v61 = (void *)v35;
      v78[0] = v35;
      v77[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v14, "localizedFailureReason");
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = (void *)v36;
      if (!v36)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating '%@' model for key '%@'."), objc_opt_class(), CFSTR("OffsetExpression"));
        v36 = objc_claimAutoreleasedReturnValue();
      }
      v58 = (void *)v36;
      v78[1] = v36;
      v77[2] = *MEMORY[0x1E0CB3388];
      v38 = (uint64_t)v14;
      if (!v14)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v38 = objc_claimAutoreleasedReturnValue();
      }
      v55 = (void *)v38;
      v78[2] = v38;
      v77[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v14, "gc_failingKeyPath");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v39;
      if (!v39)
        v39 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v39, "arrayByAddingObject:", CFSTR("OffsetExpression"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v78[3] = v41;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v78, v77, 4);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v42);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      if (!v14)
      if (!v37)

      if (!v64)
    }

    goto LABEL_69;
  }
  objc_msgSend(v6, "setOffsetExpression:", v13);

  v68 = 0;
  objc_msgSend(a3, "gc_requiredObjectForKey:ofClass:error:", CFSTR("SizeExpression"), objc_opt_class(), &v68);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v68;
  if (!v15)
  {
    if (a4)
    {
      v75[0] = *MEMORY[0x1E0CB2D50];
      +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v76[0] = v43;
      v75[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v16, "localizedFailureReason");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v76[1] = v44;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v45);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_69;
  }
  v67 = 0;
  +[GCGenericDeviceDataProcessorExpressionModel modelWithDictionaryRepresentation:error:](GCGenericDeviceDataProcessorExpressionModel, "modelWithDictionaryRepresentation:error:", v15, &v67);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v67;

  if (!v17)
  {
    if (a4)
    {
      v73[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v18, "localizedDescription");
      v46 = objc_claimAutoreleasedReturnValue();
      v65 = (void *)v46;
      if (!v46)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Invalid '%@' definition."), a1);
        v46 = objc_claimAutoreleasedReturnValue();
      }
      v62 = (void *)v46;
      v74[0] = v46;
      v73[1] = *MEMORY[0x1E0CB2D68];
      objc_msgSend(v18, "localizedFailureReason");
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = (void *)v47;
      if (!v47)
      {
        +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Error instantiating '%@' model for key '%@'."), objc_opt_class(), CFSTR("SizeExpression"));
        v47 = objc_claimAutoreleasedReturnValue();
      }
      v59 = (void *)v47;
      v74[1] = v47;
      v73[2] = *MEMORY[0x1E0CB3388];
      v49 = (uint64_t)v18;
      if (!v18)
      {
        +[NSNull null](&off_1F03A9C88, "null");
        v49 = objc_claimAutoreleasedReturnValue();
      }
      v56 = (void *)v49;
      v74[2] = v49;
      v73[3] = CFSTR("GCFailingKeyPathErrorKey");
      objc_msgSend(v18, "gc_failingKeyPath");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v50;
      if (!v50)
        v50 = (void *)MEMORY[0x1E0C9AA60];
      objc_msgSend(v50, "arrayByAddingObject:", CFSTR("SizeExpression"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v74[3] = v52;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v74, v73, 4);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_1F03A6B68, 1, (uint64_t)v53);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      if (!v18)
      if (!v48)

      if (!v65)
    }

LABEL_69:
    v19 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v6, "setSizeExpression:", v17);

  objc_msgSend(v6, "build");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v19;
}

@end
