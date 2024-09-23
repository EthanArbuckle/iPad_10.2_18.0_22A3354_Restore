@implementation INWellnessObjectResultValue

- (INWellnessObjectResultValue)initWithRecordDate:(id)a3 unit:(id)a4 values:(id)a5 resultType:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  INWellnessObjectResultValue *v14;
  INWellnessObjectResultValue *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)INWellnessObjectResultValue;
  v14 = -[INWellnessObjectResultValue init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_recordDate, a3);
    objc_storeStrong((id *)&v15->_unit, a4);
    objc_storeStrong((id *)&v15->_values, a5);
    v15->_resultType = a6;
  }

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = -[INDateComponentsRange hash](self->_recordDate, "hash");
  v4 = -[NSString hash](self->_unit, "hash") ^ v3;
  return v4 ^ -[NSArray hash](self->_values, "hash") ^ self->_resultType;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  INDateComponentsRange *recordDate;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSString *unit;
  NSArray *values;
  BOOL v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (id *)v4;
    recordDate = self->_recordDate;
    if (recordDate)
    {
      if (v5[1])
      {
        -[INDateComponentsRange startDateComponents](recordDate, "startDateComponents");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "date");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5[1], "startDateComponents");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "date");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v8, "isEqual:", v10);

        if (!v11)
          goto LABEL_11;
      }
    }
    if ((unit = self->_unit) != 0 && !-[NSString isEqualToString:](unit, "isEqualToString:", v5[2])
      || (values = self->_values) != 0 && !-[NSArray isEqual:](values, "isEqual:", v5[3]))
    {
LABEL_11:
      v14 = 0;
    }
    else
    {
      v14 = self->_resultType == (_QWORD)v5[4];
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (INWellnessObjectResultValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  INWellnessObjectResultValue *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recordDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("values"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("resultType"));
  v12 = (INWellnessObjectResultValue *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRecordDate:unit:values:resultType:", v5, v6, v10, v11);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  INDateComponentsRange *recordDate;
  id v5;

  recordDate = self->_recordDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", recordDate, CFSTR("recordDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_unit, CFSTR("unit"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_values, CFSTR("values"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_resultType, CFSTR("resultType"));

}

- (id)description
{
  return -[INWellnessObjectResultValue descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INWellnessObjectResultValue;
  -[INWellnessObjectResultValue description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INWellnessObjectResultValue _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  INDateComponentsRange *recordDate;
  void *v4;
  NSString *unit;
  void *v6;
  NSArray *values;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("recordDate");
  recordDate = self->_recordDate;
  v4 = recordDate;
  if (!recordDate)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v4;
  v11[1] = CFSTR("unit");
  unit = self->_unit;
  v6 = unit;
  if (!unit)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  v11[2] = CFSTR("values");
  values = self->_values;
  v8 = values;
  if (!values)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (values)
  {
    if (unit)
      goto LABEL_9;
LABEL_12:

    if (recordDate)
      return v9;
LABEL_13:

    return v9;
  }

  if (!unit)
    goto LABEL_12;
LABEL_9:
  if (!recordDate)
    goto LABEL_13;
  return v9;
}

- (INDateComponentsRange)recordDate
{
  return self->_recordDate;
}

- (NSString)unit
{
  return self->_unit;
}

- (NSArray)values
{
  return self->_values;
}

- (int64_t)resultType
{
  return self->_resultType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_recordDate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
