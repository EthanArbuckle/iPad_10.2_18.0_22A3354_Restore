@implementation LNValue

- (LNDisplayRepresentation)displayRepresentation
{
  return self->_displayRepresentation;
}

- (BOOL)isEqual:(id)a3
{
  LNValue *v4;
  LNValue *v5;
  LNValue *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (LNValue *)a3;
  v5 = v4;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[LNValue valueType](self, "valueType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNValue valueType](v6, "valueType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        -[LNValue value](self, "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNValue value](v6, "value");
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

  }
  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[LNValue valueType](self, "valueType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNValue value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)value
{
  return self->_value;
}

- (LNValueType)valueType
{
  return self->_valueType;
}

- (void)setDisplayRepresentation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportedContent, 0);
  objc_storeStrong((id *)&self->_displayRepresentation, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_valueType, 0);
}

- (LNValue)initWithValue:(id)a3 valueType:(id)a4 displayRepresentation:(id)a5
{
  id v9;
  id v10;
  id v11;
  LNValue *v12;
  id v13;
  id value;
  uint64_t v15;
  LNValueType *valueType;
  uint64_t v17;
  LNDisplayRepresentation *displayRepresentation;
  LNValue *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNValue.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value"));

    if (v10)
      goto LABEL_3;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNValue.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valueType"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_13;
LABEL_3:
  if ((objc_msgSend(v10, "objectIsMemberOfType:", v9) & 1) == 0
    && (objc_msgSend(v10, "objectIsMemberOfType:", v9) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNValue.m"), 39, CFSTR("Value %@ is not member of type %@"), v9, v24);

  }
  v25.receiver = self;
  v25.super_class = (Class)LNValue;
  v12 = -[LNValue init](&v25, sel_init);
  if (v12)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (id)objc_msgSend(v9, "copy");
    else
      v13 = v9;
    value = v12->_value;
    v12->_value = v13;

    v15 = objc_msgSend(v10, "copy");
    valueType = v12->_valueType;
    v12->_valueType = (LNValueType *)v15;

    v17 = objc_msgSend(v11, "copy");
    displayRepresentation = v12->_displayRepresentation;
    v12->_displayRepresentation = (LNDisplayRepresentation *)v17;

    v19 = v12;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[LNValue value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("value"));

  -[LNValue valueType](self, "valueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("valueType"));

  -[LNValue displayRepresentation](self, "displayRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("displayRepresentation"));

  -[LNValue exportedContent](self, "exportedContent");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("exportedContent"));

}

- (LNValue)initWithValues:(id)a3 memberValueType:(id)a4
{
  id v6;
  id v7;
  LNArrayValueType *v8;
  LNValue *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[LNArrayValueType initWithMemberValueType:]([LNArrayValueType alloc], "initWithMemberValueType:", v6);

  v9 = -[LNValue initWithValue:valueType:displayRepresentation:](self, "initWithValue:valueType:displayRepresentation:", v7, v8, 0);
  return v9;
}

- (LNValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  LNValue *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("valueType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    LNValueTypeObjectClassesForCoding();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("value"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayRepresentation"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      v16 = &v15;
      v17 = 0x2050000000;
      v9 = (void *)getLNExportedContentClass_softClass;
      v18 = getLNExportedContentClass_softClass;
      if (!getLNExportedContentClass_softClass)
      {
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __getLNExportedContentClass_block_invoke;
        v14[3] = &unk_1E39A15B8;
        v14[4] = &v15;
        __getLNExportedContentClass_block_invoke((uint64_t)v14);
        v9 = (void *)v16[3];
      }
      v10 = objc_retainAutorelease(v9);
      _Block_object_dispose(&v15, 8);
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, CFSTR("exportedContent"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[LNValue initWithValue:valueType:exportedContent:displayRepresentation:](self, "initWithValue:valueType:exportedContent:displayRepresentation:", v7, v5, v11, v8);

      v12 = self;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (LNValue)initWithValue:(id)a3 valueType:(id)a4
{
  return -[LNValue initWithValue:valueType:displayRepresentation:](self, "initWithValue:valueType:displayRepresentation:", a3, a4, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNValue)initWithValue:(id)a3 valueType:(id)a4 exportedContent:(id)a5 displayRepresentation:(id)a6
{
  id v11;
  LNValue *v12;
  LNValue *v13;
  LNValue *v14;

  v11 = a5;
  v12 = -[LNValue initWithValue:valueType:displayRepresentation:](self, "initWithValue:valueType:displayRepresentation:", a3, a4, a6);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_exportedContent, a5);
    v14 = v13;
  }

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[LNValue valueType](self, "valueType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNValue value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(%@) %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int64_t v9;

  v4 = a3;
  -[LNValue value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0)
    {
      v9 = 0;
      goto LABEL_7;
    }
    -[LNValue value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "compare:", v8);

  }
  else
  {
    v9 = 0;
  }

LABEL_7:
  return v9;
}

- (LNExportedContent)exportedContent
{
  return self->_exportedContent;
}

- (void)setExportedContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
