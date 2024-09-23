@implementation MOAction

+ (id)actionNameFromLifeEvent:(id)a3
{
  uint64_t v3;
  __CFString **v4;

  v3 = objc_msgSend(a3, "lifeEventCategory");
  switch(v3)
  {
    case 1:
      v4 = kActionNameShopping;
      return *v4;
    case 4:
      v4 = kActionNameFlight;
      return *v4;
    case 2:
      v4 = kActionNameDining;
      return *v4;
  }
  return 0;
}

+ (unint64_t)actionTypeFromLifeEvent:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "lifeEventCategory");
  if ((unint64_t)(v3 - 1) > 3)
    return 0;
  else
    return qword_1CAE9D1E8[v3 - 1];
}

- (MOAction)initWithLifeEvent:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  BOOL v7;
  unint64_t v8;
  void *v9;
  MOAction *v10;

  v4 = a3;
  if (objc_msgSend(v4, "category") == 22)
  {
    +[MOAction actionNameFromLifeEvent:](MOAction, "actionNameFromLifeEvent:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[MOAction actionTypeFromLifeEvent:](MOAction, "actionTypeFromLifeEvent:", v4);
    if (v5)
      v7 = v6 == 0;
    else
      v7 = 1;
    if (v7)
    {
      v10 = 0;
    }
    else
    {
      v8 = v6;
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "confidenceScore");
      self = -[MOAction initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:](self, "initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:", v9, v5, v8, 0, 0);

      v10 = self;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)bundleSourceType
{
  unint64_t v3;
  __CFString *v4;
  unint64_t v5;
  __CFString **v6;
  int64_t v8;

  v3 = -[MOAction actionType](self, "actionType");
  v4 = 0;
  v5 = v3 - 1;
  v6 = &MOEventBundleSourceTypeVisitLocation;
  switch(v5)
  {
    case 0uLL:
      v8 = -[MOAction actionSubtype](self, "actionSubtype");
      if ((unint64_t)(v8 - 4) >= 6)
        v6 = &MOEventBundleSourceTypeVisitLocation;
      else
        v6 = off_1E8541F00[v8 - 4];
      goto LABEL_2;
    case 1uLL:
    case 2uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
      goto LABEL_2;
    case 3uLL:
      v6 = &MOEventBundleSourceTypeActivity;
      goto LABEL_2;
    case 4uLL:
      v6 = &MOEventBundleSourceTypeContact;
      goto LABEL_2;
    case 5uLL:
      v6 = &MOEventBundleSourceTypeMedia;
      goto LABEL_2;
    case 6uLL:
      v6 = &MOEventBundleSourceTypePhoto;
      goto LABEL_2;
    case 0xBuLL:
      v6 = &MOEventBundleSourceTypeStateOfMind;
LABEL_2:
      v4 = *v6;
      break;
    default:
      return v4;
  }
  return v4;
}

- (MOAction)initWithIdentifier:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  MOAction *v8;

  v5 = a3;
  if (!v5)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MOAction initWithIdentifier:].cold.1(v6);

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOAction.m"), 30, CFSTR("Invalid parameter not satisfying: identifier (in %s:%d)"), "-[MOAction initWithIdentifier:]", 30);

  }
  v8 = -[MOAction initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:](self, "initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:", v5, CFSTR("action"), 0, 0, 0, -1.0);

  return v8;
}

- (MOAction)initWithActionName:(id)a3 actionType:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  MOAction *v9;

  v6 = (void *)MEMORY[0x1E0CB3A28];
  v7 = a3;
  objc_msgSend(v6, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MOAction initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:](self, "initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:", v8, v7, a4, 0, 0, -1.0);

  return v9;
}

- (MOAction)initWithActionName:(id)a3 actionType:(unint64_t)a4 actionSubtype:(int64_t)a5
{
  void *v8;
  id v9;
  void *v10;
  MOAction *v11;

  v8 = (void *)MEMORY[0x1E0CB3A28];
  v9 = a3;
  objc_msgSend(v8, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MOAction initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:](self, "initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:", v10, v9, a4, a5, 0, -1.0);

  return v11;
}

- (MOAction)initWithActionName:(id)a3 actionType:(unint64_t)a4 actionSubtype:(int64_t)a5 actionNameConfidence:(double)a6
{
  void *v10;
  id v11;
  void *v12;
  MOAction *v13;

  v10 = (void *)MEMORY[0x1E0CB3A28];
  v11 = a3;
  objc_msgSend(v10, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MOAction initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:](self, "initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:", v12, v11, a4, a5, 0, a6);

  return v13;
}

- (MOAction)initWithActionName:(id)a3 actionType:(unint64_t)a4 actionSubtype:(int64_t)a5 actionMetaData:(id)a6
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  MOAction *v14;

  v10 = (void *)MEMORY[0x1E0CB3A28];
  v11 = a6;
  v12 = a3;
  objc_msgSend(v10, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MOAction initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:](self, "initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:", v13, v12, a4, a5, v11, -1.0);

  return v14;
}

- (MOAction)initWithIdentifier:(id)a3 actionName:(id)a4 actionType:(unint64_t)a5 actionSubtype:(int64_t)a6 actionNameConfidence:(double)a7 actionMetaData:(id)a8
{
  id v14;
  id v15;
  MOAction *v16;
  uint64_t v17;
  NSUUID *identifier;
  objc_super v20;

  v14 = a4;
  v15 = a8;
  v20.receiver = self;
  v20.super_class = (Class)MOAction;
  v16 = -[MOAction init](&v20, sel_init);
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v17 = objc_claimAutoreleasedReturnValue();
    identifier = v16->_identifier;
    v16->_identifier = (NSUUID *)v17;

    objc_storeStrong((id *)&v16->_actionName, a4);
    v16->_actionType = a5;
    v16->_actionSubtype = a6;
    v16->_actionNameConfidence = a7;
    objc_storeStrong((id *)&v16->_actionMetaData, a8);
    v16->_sourceEventAccessType = -[MOAction accessTypeFromActionType:actionSubtype:](v16, "accessTypeFromActionType:actionSubtype:", a5, a6);
  }

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MOAction identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOAction actionName](self, "actionName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MOAction actionType](self, "actionType");
  v8 = -[MOAction actionSubtype](self, "actionSubtype");
  -[MOAction actionNameConfidence](self, "actionNameConfidence");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<MOAction identifier, %@, action, %@, type, %lu, subtype, %lu, confidence, %f>"), v4, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)accessTypeFromActionType:(unint64_t)a3 actionSubtype:(int64_t)a4
{
  unint64_t result;

  result = 5;
  switch(a3)
  {
    case 1uLL:
      if (a4 == 6)
        goto LABEL_3;
      if ((unint64_t)(a4 - 3) < 2)
        goto LABEL_6;
      if ((unint64_t)a4 > 9 || ((1 << a4) & 0x302) == 0)
        goto LABEL_10;
      result = 5;
      break;
    case 2uLL:
    case 3uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
      return result;
    case 4uLL:
      result = 1;
      break;
    case 5uLL:
LABEL_6:
      result = 3;
      break;
    case 6uLL:
LABEL_3:
      result = 2;
      break;
    default:
LABEL_10:
      result = 0;
      break;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  MOAction *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("actionType"));
  v8 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("actionSubtype"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("actionNameConfidence"));
  v10 = v9;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionMetaData"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MOAction initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:](self, "initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:", v5, v6, v7, v8, v12, v10);

  if (v13)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceEventIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOAction setSourceEventIdentifier:](v13, "setSourceEventIdentifier:", v14);

    -[MOAction setSourceEventAccessType:](v13, "setSourceEventAccessType:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sourceEventAccessType")));
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  void *v5;
  id v6;

  identifier = self->_identifier;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v6, "encodeInt64:forKey:", self->_actionType, CFSTR("actionType"));
  objc_msgSend(v6, "encodeInt64:forKey:", self->_actionSubtype, CFSTR("actionSubtype"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_actionName, CFSTR("actionName"));
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("actionNameConfidence"), self->_actionNameConfidence);
  +[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_actionMetaData);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("actionMetaData"));

  objc_msgSend(v6, "encodeInt64:forKey:", self->_sourceEventAccessType, CFSTR("sourceEventAccessType"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_sourceEventIdentifier, CFSTR("sourceEventIdentifier"));

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MOAction identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  MOAction *v5;
  MOAction *v6;
  MOAction *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = (MOAction *)a3;
  v6 = v5;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        -[MOAction identifier](self, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 || (-[MOAction identifier](v7, "identifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[MOAction identifier](self, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[MOAction identifier](v7, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqual:", v10);

          if (v8)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          v11 = 1;
        }

        goto LABEL_12;
      }
    }
    v11 = 0;
  }
LABEL_13:

  return v11;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)actionType
{
  return self->_actionType;
}

- (int64_t)actionSubtype
{
  return self->_actionSubtype;
}

- (NSString)actionName
{
  return self->_actionName;
}

- (double)actionNameConfidence
{
  return self->_actionNameConfidence;
}

- (NSDictionary)actionMetaData
{
  return self->_actionMetaData;
}

- (void)setActionMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_actionMetaData, a3);
}

- (int64_t)sourceEventAccessType
{
  return self->_sourceEventAccessType;
}

- (void)setSourceEventAccessType:(int64_t)a3
{
  self->_sourceEventAccessType = a3;
}

- (NSUUID)sourceEventIdentifier
{
  return self->_sourceEventIdentifier;
}

- (void)setSourceEventIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceEventIdentifier, 0);
  objc_storeStrong((id *)&self->_actionMetaData, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 136315394;
  v2 = "-[MOAction initWithIdentifier:]";
  v3 = 1024;
  v4 = 30;
  _os_log_error_impl(&dword_1CAE42000, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

@end
