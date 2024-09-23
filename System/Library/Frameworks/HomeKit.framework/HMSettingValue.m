@implementation HMSettingValue

- (HMSettingValue)initWithType:(int64_t)a3 stringValue:(id)a4 numberValue:(id)a5 dataValue:(id)a6 selectionIdentifier:(id)a7 selectionValue:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HMSettingValue *v18;
  HMSettingValue *v19;
  uint64_t v20;
  NSString *stringValue;
  id v23;
  objc_super v24;

  v14 = a4;
  v23 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HMSettingValue;
  v18 = -[HMSettingValue init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_type = a3;
    objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v14);
    v20 = objc_claimAutoreleasedReturnValue();
    stringValue = v19->_stringValue;
    v19->_stringValue = (NSString *)v20;

    objc_storeStrong((id *)&v19->_numberValue, a5);
    objc_storeStrong((id *)&v19->_dataValue, a6);
    objc_storeStrong((id *)&v19->_selectionIdentifier, a7);
    objc_storeStrong((id *)&v19->_selectionValue, a8);
  }

  return v19;
}

- (id)initStringSettingWithValue:(id)a3
{
  return -[HMSettingValue initWithType:stringValue:numberValue:dataValue:selectionIdentifier:selectionValue:](self, "initWithType:stringValue:numberValue:dataValue:selectionIdentifier:selectionValue:", 3, a3, 0, 0, 0, 0);
}

- (id)initNumberSettingWithValue:(id)a3
{
  return -[HMSettingValue initWithType:stringValue:numberValue:dataValue:selectionIdentifier:selectionValue:](self, "initWithType:stringValue:numberValue:dataValue:selectionIdentifier:selectionValue:", 2, 0, a3, 0, 0, 0);
}

- (id)initDataSettingWithValue:(id)a3
{
  return -[HMSettingValue initWithType:stringValue:numberValue:dataValue:selectionIdentifier:selectionValue:](self, "initWithType:stringValue:numberValue:dataValue:selectionIdentifier:selectionValue:", 1, 0, 0, a3, 0, 0);
}

- (id)description
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[HMSettingValue type](self, "type");
  -[HMSettingValue stringValue](self, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSettingValue numberValue](self, "numberValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSettingValue selectionIdentifier](self, "selectionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSettingValue selectionValue](self, "selectionValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[HMSettingValue(%ld): str:%@ num:%@ sel:[%@]%@]"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HMSettingValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMSettingValue *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMSV.type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMSV.strValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMSV.numValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMSV.dataValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMSV.selId"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMSV.selValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HMSettingValue initWithType:stringValue:numberValue:dataValue:selectionIdentifier:selectionValue:](self, "initWithType:stringValue:numberValue:dataValue:selectionIdentifier:selectionValue:", objc_msgSend(v5, "integerValue"), v6, v7, v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", -[HMSettingValue type](self, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("HMSV.type"));

  -[HMSettingValue stringValue](self, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("HMSV.strValue"));

  -[HMSettingValue numberValue](self, "numberValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("HMSV.numValue"));

  -[HMSettingValue dataValue](self, "dataValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("HMSV.dataValue"));

  -[HMSettingValue selectionIdentifier](self, "selectionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("HMSV.selId"));

  -[HMSettingValue selectionValue](self, "selectionValue");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("HMSV.selValue"));

}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HMSettingValue *v5;
  HMSettingValue *v6;
  HMSettingValue *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;

  v5 = (HMSettingValue *)a3;
  if (self != v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;
    if (!v7 || (v8 = -[HMSettingValue type](self, "type"), v8 != -[HMSettingValue type](v7, "type")))
    {
      v12 = 0;
LABEL_35:

      goto LABEL_36;
    }
    -[HMSettingValue numberValue](self, "numberValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSettingValue numberValue](v7, "numberValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 != v10)
    {
      -[HMSettingValue numberValue](self, "numberValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSettingValue numberValue](v7, "numberValue");
      v41 = v11;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "isEqual:"))
      {
        v12 = 0;
        goto LABEL_33;
      }
    }
    -[HMSettingValue stringValue](self, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSettingValue stringValue](v7, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 != v14)
    {
      -[HMSettingValue stringValue](self, "stringValue");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSettingValue stringValue](v7, "stringValue");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "isEqual:"))
      {
        v12 = 0;
LABEL_31:

LABEL_32:
        if (v9 == v10)
        {
LABEL_34:

          goto LABEL_35;
        }
LABEL_33:

        goto LABEL_34;
      }
    }
    -[HMSettingValue dataValue](self, "dataValue");
    v15 = objc_claimAutoreleasedReturnValue();
    -[HMSettingValue dataValue](v7, "dataValue");
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)v15;
    if (v15 != v38)
    {
      -[HMSettingValue dataValue](self, "dataValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSettingValue dataValue](v7, "dataValue");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v16;
      if (!objc_msgSend(v16, "isEqual:"))
      {
        v12 = 0;
        v18 = (void *)v38;
        v17 = v39;
LABEL_29:

LABEL_30:
        if (v13 == v14)
          goto LABEL_32;
        goto LABEL_31;
      }
    }
    -[HMSettingValue selectionIdentifier](self, "selectionIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSettingValue selectionIdentifier](v7, "selectionIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v3;
    if (v19 == v20)
    {
      v31 = v14;
    }
    else
    {
      -[HMSettingValue selectionIdentifier](self, "selectionIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSettingValue selectionIdentifier](v7, "selectionIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v21;
      if (!objc_msgSend(v21, "isEqual:"))
      {
        v12 = 0;
        v3 = v36;
        goto LABEL_27;
      }
      v31 = v14;
    }
    -[HMSettingValue selectionValue](self, "selectionValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSettingValue selectionValue](v7, "selectionValue");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v22 == (void *)v23)
    {

      v12 = 1;
    }
    else
    {
      v24 = (void *)v23;
      -[HMSettingValue selectionValue](self, "selectionValue");
      v29 = v19;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSettingValue selectionValue](v7, "selectionValue");
      v30 = v13;
      v26 = v20;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v25, "isEqual:", v27);

      v20 = v26;
      v13 = v30;

      v19 = v29;
    }
    v14 = v31;
    v3 = v36;
    if (v19 == v20)
    {
LABEL_28:

      v18 = (void *)v38;
      v17 = v39;
      if (v39 == (void *)v38)
        goto LABEL_30;
      goto LABEL_29;
    }
LABEL_27:

    goto LABEL_28;
  }
  v12 = 1;
LABEL_36:

  return v12;
}

- (int64_t)type
{
  return self->_type;
}

- (NSNumber)numberValue
{
  return self->_numberValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (NSUUID)selectionIdentifier
{
  return self->_selectionIdentifier;
}

- (NSString)selectionValue
{
  return self->_selectionValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionValue, 0);
  objc_storeStrong((id *)&self->_selectionIdentifier, 0);
  objc_storeStrong((id *)&self->_dataValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_numberValue, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
