@implementation MOEventBundleLabelCondition

- (MOEventBundleLabelCondition)initWithKeyword:(id)a3
{
  id v6;
  MOEventBundleLabelCondition *v7;
  MOEventBundleLabelCondition *v8;
  NSString *value;
  NSArray *values;
  MOEventBundleLabelCondition *v11;
  NSObject *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  if (v6)
  {
    v15.receiver = self;
    v15.super_class = (Class)MOEventBundleLabelCondition;
    v7 = -[MOEventBundleLabelCondition init](&v15, sel_init);
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_keyword, a3);
      value = v8->_value;
      v8->_templateOperator = 0;
      v8->_value = 0;

      values = v8->_values;
      v8->_values = 0;

      v8->_valueType = 0;
      v8->_capitalized = 0;
    }
    self = v8;
    v11 = self;
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MOEventBundleLabelCondition initWithKeyword:].cold.1(v12);

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventBundleLabelCondition.m"), 23, CFSTR("Invalid parameter not satisfying: keyword"));

    v11 = 0;
  }

  return v11;
}

- (BOOL)isNumeric:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB37F0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "numberFromString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (BOOL)yieldPresenceCheckForValueData:(id)a3
{
  id v3;
  id v4;
  char v5;
  BOOL v6;

  v3 = a3;
  if (!v3)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    if (objc_msgSend(v4, "length"))
    {
      v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("NO"));

      if ((v5 & 1) == 0)
        goto LABEL_5;
    }
    else
    {

    }
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
LABEL_5:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v3, "BOOLValue"))
    goto LABEL_9;
  v6 = 1;
LABEL_10:

  return v6;
}

- (BOOL)yieldConditionForMetaData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  void *v12;
  int v13;
  void *v14;

  v4 = a3;
  -[MOEventBundleLabelCondition keyword](self, "keyword");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MOEventBundleLabelCondition templateOperator](self, "templateOperator") != 9)
  {
    v11 = -[MOEventBundleLabelCondition yieldConditionForValueData:](self, "yieldConditionForValueData:", v6);
    goto LABEL_10;
  }
  if (!v6)
  {
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  -[MOEventBundleLabelCondition value](self, "value");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7
    || (v8 = (void *)v7,
        -[MOEventBundleLabelCondition value](self, "value"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("_ANY_")),
        v9,
        v8,
        (v10 & 1) == 0))
  {
    -[MOEventBundleLabelCondition values](self, "values");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v6);

    if (v13)
    {
      objc_msgSend(v4, "objectForKey:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v14 != 0;

      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v11 = 1;
LABEL_10:

  return v11;
}

- (BOOL)yieldConditionForValueData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;

  v4 = a3;
  -[MOEventBundleLabelCondition value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v4;
        if (!objc_msgSend(v6, "length"))
        {
LABEL_9:
          LOBYTE(self) = 0;
LABEL_46:

          goto LABEL_47;
        }
        if (-[MOEventBundleLabelCondition templateOperator](self, "templateOperator") == 1
          && !-[MOEventBundleLabelCondition valueType](self, "valueType"))
        {
          -[MOEventBundleLabelCondition value](self, "value");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(self) = objc_msgSend(v9, "isEqualToString:", v6);
        }
        else
        {
          if (-[MOEventBundleLabelCondition templateOperator](self, "templateOperator") != 2
            || -[MOEventBundleLabelCondition valueType](self, "valueType"))
          {
            goto LABEL_9;
          }
          -[MOEventBundleLabelCondition value](self, "value");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(self) = objc_msgSend(v9, "isEqualToString:", v6) ^ 1;
        }
LABEL_45:

        goto LABEL_46;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = (id)objc_opt_new();
        -[MOEventBundleLabelCondition value](self, "value");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "numberFromString:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v4;
        if (-[MOEventBundleLabelCondition valueType](self, "valueType") == 1)
        {
          switch(-[MOEventBundleLabelCondition templateOperator](self, "templateOperator"))
          {
            case 1uLL:
              self = (MOEventBundleLabelCondition *)objc_msgSend(v10, "integerValue");
              LOBYTE(self) = self == (MOEventBundleLabelCondition *)objc_msgSend(v9, "integerValue");
              break;
            case 2uLL:
              self = (MOEventBundleLabelCondition *)objc_msgSend(v10, "integerValue");
              LOBYTE(self) = self != (MOEventBundleLabelCondition *)objc_msgSend(v9, "integerValue");
              break;
            case 3uLL:
              self = (MOEventBundleLabelCondition *)objc_msgSend(v10, "integerValue");
              LOBYTE(self) = (uint64_t)self < objc_msgSend(v9, "integerValue");
              break;
            case 4uLL:
              self = (MOEventBundleLabelCondition *)objc_msgSend(v10, "integerValue");
              LOBYTE(self) = (uint64_t)self <= objc_msgSend(v9, "integerValue");
              break;
            case 5uLL:
              v15 = objc_msgSend(v10, "integerValue");
              v16 = v15 <= objc_msgSend(v9, "integerValue");
              goto LABEL_37;
            case 6uLL:
              v17 = objc_msgSend(v10, "integerValue");
              v18 = v17 < objc_msgSend(v9, "integerValue");
              goto LABEL_41;
            default:
              goto LABEL_24;
          }
LABEL_44:

          goto LABEL_45;
        }
        if (-[MOEventBundleLabelCondition valueType](self, "valueType") == 2
          || !-[MOEventBundleLabelCondition valueType](self, "valueType"))
        {
          switch(-[MOEventBundleLabelCondition templateOperator](self, "templateOperator"))
          {
            case 1uLL:
              objc_msgSend(v10, "doubleValue");
              v12 = v11;
              objc_msgSend(v9, "doubleValue");
              v14 = vabdd_f64(v12, v13) < 0.0001;
              goto LABEL_32;
            case 2uLL:
              objc_msgSend(v10, "doubleValue");
              v20 = v19;
              objc_msgSend(v9, "doubleValue");
              v18 = vabdd_f64(v20, v21) < 0.0001;
              goto LABEL_41;
            case 3uLL:
              objc_msgSend(v10, "doubleValue");
              v23 = v22;
              objc_msgSend(v9, "doubleValue");
              v14 = v23 < v24;
LABEL_32:
              LOBYTE(self) = v14;
              goto LABEL_44;
            case 4uLL:
              objc_msgSend(v10, "doubleValue");
              v26 = v25;
              objc_msgSend(v9, "doubleValue");
              LOBYTE(self) = v26 <= v27;
              goto LABEL_44;
            case 5uLL:
              objc_msgSend(v10, "doubleValue");
              v29 = v28;
              objc_msgSend(v9, "doubleValue");
              v16 = v29 <= v30;
LABEL_37:
              LOBYTE(self) = !v16;
              goto LABEL_44;
            case 6uLL:
              objc_msgSend(v10, "doubleValue");
              v32 = v31;
              objc_msgSend(v9, "doubleValue");
              v18 = v32 < v33;
LABEL_41:
              LOBYTE(self) = !v18;
              break;
            default:
LABEL_24:
              LOBYTE(self) = 0;
              break;
          }
          goto LABEL_44;
        }

      }
      LOBYTE(self) = 0;
    }
    else
    {
      LOBYTE(self) = -[MOEventBundleLabelCondition templateOperator](self, "templateOperator") == 2;
    }
  }
  else
  {
    v7 = -[MOEventBundleLabelCondition yieldPresenceCheckForValueData:](self, "yieldPresenceCheckForValueData:", v4);
    LOBYTE(self) = v7 ^ (-[MOEventBundleLabelCondition templateOperator](self, "templateOperator") == 8);
  }
LABEL_47:

  return (char)self;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MOEventBundleLabelCondition keyword](self, "keyword");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MOEventBundleLabelCondition stringFromTemplateOperator:](MOEventBundleLabelCondition, "stringFromTemplateOperator:", -[MOEventBundleLabelCondition templateOperator](self, "templateOperator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEventBundleLabelCondition value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MOEventBundleLabelCondition stringFromValueType:](MOEventBundleLabelCondition, "stringFromValueType:", -[MOEventBundleLabelCondition valueType](self, "valueType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("keyword, %@,  operator, %@, value, %@, value type, %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (unint64_t)templateOperatorFromString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("=")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("==")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("!=")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("<")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("<=")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR(">")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR(">=")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("!")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR(":")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)stringFromTemplateOperator:(unint64_t)a3
{
  if (a3 > 9)
    return CFSTR("invalid");
  else
    return off_1E8543430[a3];
}

+ (unint64_t)valueTypeFromString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("s")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("d")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("f")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)stringFromValueType:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("invalid");
  else
    return off_1E8543480[a3];
}

- (NSString)keyword
{
  return self->_keyword;
}

- (void)setKeyword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)templateOperator
{
  return self->_templateOperator;
}

- (void)setTemplateOperator:(unint64_t)a3
{
  self->_templateOperator = a3;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)valueType
{
  return self->_valueType;
}

- (void)setValueType:(unint64_t)a3
{
  self->_valueType = a3;
}

- (BOOL)capitalized
{
  return self->_capitalized;
}

- (void)setCapitalized:(BOOL)a3
{
  self->_capitalized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_keyword, 0);
}

- (void)initWithKeyword:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CAE42000, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: keyword", v1, 2u);
}

@end
