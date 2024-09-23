@implementation DIAttribute

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_attributeType, CFSTR("attributeType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayFormat, CFSTR("displayFormat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedDisplayName, CFSTR("localizedDisplayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedPlaceholder, CFSTR("localizedPlaceholder"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_submissionKey, CFSTR("submissionKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_optional, CFSTR("optional"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_incorrect, CFSTR("incorrect"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reason, CFSTR("reason"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentValue, CFSTR("currentValue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_defaultValue, CFSTR("defaultValue"));

  os_unfair_lock_unlock(p_lock);
}

- (DIAttribute)initWithCoder:(id)a3
{
  id v4;
  DIAttribute *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *displayFormat;
  uint64_t v10;
  NSString *localizedDisplayName;
  uint64_t v12;
  NSString *localizedPlaceholder;
  uint64_t v14;
  NSString *submissionKey;
  uint64_t v16;
  NSString *reason;
  uint64_t v18;
  NSObject *currentValue;
  uint64_t v20;
  NSObject *defaultValue;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;

  v4 = a3;
  v5 = -[DIAttribute init](self, "init");
  if (v5)
  {
    v5->_attributeType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("attributeType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayFormat"));
    v8 = objc_claimAutoreleasedReturnValue();
    displayFormat = v5->_displayFormat;
    v5->_displayFormat = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedDisplayName"));
    v10 = objc_claimAutoreleasedReturnValue();
    localizedDisplayName = v5->_localizedDisplayName;
    v5->_localizedDisplayName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedPlaceholder"));
    v12 = objc_claimAutoreleasedReturnValue();
    localizedPlaceholder = v5->_localizedPlaceholder;
    v5->_localizedPlaceholder = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("submissionKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    submissionKey = v5->_submissionKey;
    v5->_submissionKey = (NSString *)v14;

    v5->_optional = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("optional"));
    v5->_incorrect = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("incorrect"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reason"));
    v16 = objc_claimAutoreleasedReturnValue();
    reason = v5->_reason;
    v5->_reason = (NSString *)v16;

    switch(v5->_attributeType)
    {
      case 1uLL:
      case 2uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
      case 8uLL:
      case 0xAuLL:
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentValue"));
        v18 = objc_claimAutoreleasedReturnValue();
        currentValue = v5->_currentValue;
        v5->_currentValue = v18;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultValue"));
        v20 = objc_claimAutoreleasedReturnValue();
        defaultValue = v5->_defaultValue;
        v5->_defaultValue = v20;
        goto LABEL_7;
      case 3uLL:
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentValue"));
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = v5->_currentValue;
        v5->_currentValue = v27;

        goto LABEL_6;
      case 4uLL:
      case 9uLL:
        v22 = (void *)MEMORY[0x24BDBCF20];
        v23 = objc_opt_class();
        objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("currentValue"));
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = v5->_currentValue;
        v5->_currentValue = v25;

LABEL_6:
        defaultValue = v5->_defaultValue;
        v5->_defaultValue = 0;
LABEL_7:

        break;
      default:
        break;
    }
  }

  return v5;
}

- (DIAttribute)init
{
  DIAttribute *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttribute;
  result = -[DIAttribute init](&v3, sel_init);
  if (result)
  {
    result->_lock._os_unfair_lock_opaque = 0;
    result->_attributeType = 0;
  }
  return result;
}

- (BOOL)isAttributeTypeText
{
  return -[DIAttribute attributeType](self, "attributeType") == 1;
}

- (BOOL)isAttributeTypeDate
{
  return -[DIAttribute attributeType](self, "attributeType") == 2;
}

- (BOOL)isAttributeTypePicker
{
  return -[DIAttribute attributeType](self, "attributeType") == 5;
}

- (BOOL)isAttributeTypeDocument
{
  return -[DIAttribute attributeType](self, "attributeType") == 4;
}

- (BOOL)isAttributeTypeSMSOTP
{
  return -[DIAttribute attributeType](self, "attributeType") == 8;
}

- (BOOL)isAttributeTypeCamera
{
  return -[DIAttribute attributeType](self, "attributeType") == 9;
}

- (BOOL)isAttributeTypeLabel
{
  return -[DIAttribute attributeType](self, "attributeType") == 6;
}

- (BOOL)isAttributeTypeFooter
{
  return -[DIAttribute attributeType](self, "attributeType") == 7;
}

- (BOOL)isAttributeTypeCustom
{
  return -[DIAttribute attributeType](self, "attributeType") == 10;
}

- (void)setCurrentValue:(id)a3
{
  NSObject *v4;
  NSObject *currentValue;
  NSObject *v6;

  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_currentValue != v6)
  {
    v4 = -[NSObject copyWithZone:](v6, "copyWithZone:", 0);
    currentValue = self->_currentValue;
    self->_currentValue = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setDefaultValue:(id)a3
{
  NSObject *v4;
  NSObject *defaultValue;
  NSObject *v6;

  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_defaultValue != v6)
  {
    v4 = -[NSObject copyWithZone:](v6, "copyWithZone:", 0);
    defaultValue = self->_defaultValue;
    self->_defaultValue = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_identifier != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    identifier = self->_identifier;
    self->_identifier = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setAttributeType:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_attributeType = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setDisplayFormat:(id)a3
{
  NSString *v4;
  NSString *displayFormat;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_displayFormat != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    displayFormat = self->_displayFormat;
    self->_displayFormat = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setLocalizedDisplayName:(id)a3
{
  NSString *v4;
  NSString *localizedDisplayName;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_localizedDisplayName != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    localizedDisplayName = self->_localizedDisplayName;
    self->_localizedDisplayName = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setLocalizedPlaceholder:(id)a3
{
  NSString *v4;
  NSString *localizedPlaceholder;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_localizedPlaceholder != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    localizedPlaceholder = self->_localizedPlaceholder;
    self->_localizedPlaceholder = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setSubmissionKey:(id)a3
{
  NSString *v4;
  NSString *submissionKey;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_submissionKey != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    submissionKey = self->_submissionKey;
    self->_submissionKey = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setSubmissionFormat:(id)a3
{
  NSString *v4;
  NSString *submissionFormat;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_submissionFormat != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    submissionFormat = self->_submissionFormat;
    self->_submissionFormat = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (BOOL)optional
{
  DIAttribute *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_optional;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setOptional:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_optional = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setIncorrect:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_incorrect = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setIsSensitive:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isSensitive = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setHoldLocally:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_holdLocally = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setNotForVerification:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_notForVerification = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setDataNodeProof:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_dataNodeProof = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setGroup:(id)a3
{
  NSString *v4;
  NSString *group;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_group != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    group = self->_group;
    self->_group = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setDataNodeProofGroup:(id)a3
{
  NSString *v4;
  NSString *dataNodeProofGroup;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_dataNodeProofGroup != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    dataNodeProofGroup = self->_dataNodeProofGroup;
    self->_dataNodeProofGroup = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setSubmissionValue:(id)a3
{
  NSData *v4;
  NSData *submissionValue;
  NSData *v6;

  v6 = (NSData *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_submissionValue != v6)
  {
    v4 = (NSData *)-[NSData copyWithZone:](v6, "copyWithZone:", 0);
    submissionValue = self->_submissionValue;
    self->_submissionValue = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setClientValidationRegex:(id)a3
{
  NSString *v4;
  NSString *clientValidationRegex;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_clientValidationRegex != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    clientValidationRegex = self->_clientValidationRegex;
    self->_clientValidationRegex = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setCodeOnError:(id)a3
{
  NSString *v4;
  NSString *codeOnError;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_codeOnError != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    codeOnError = self->_codeOnError;
    self->_codeOnError = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setServerValidationURL:(id)a3
{
  NSString *v4;
  NSString *serverValidationURL;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_serverValidationURL != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    serverValidationURL = self->_serverValidationURL;
    self->_serverValidationURL = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setHasLabel:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_hasLabel = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setSupportingData:(id)a3
{
  NSString *v4;
  NSString *supportingData;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_supportingData != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    supportingData = self->_supportingData;
    self->_supportingData = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setReason:(id)a3
{
  NSString *v4;
  NSString *reason;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_reason != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    reason = self->_reason;
    self->_reason = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSObject)getCurrentValue
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_currentValue;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSObject)defaultValue
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_defaultValue;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)identifier
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_identifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)attributeType
{
  os_unfair_lock_s *p_lock;
  unint64_t attributeType;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  attributeType = self->_attributeType;
  os_unfair_lock_unlock(p_lock);
  return attributeType;
}

- (NSString)displayFormat
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_displayFormat;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)localizedDisplayName
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_localizedDisplayName;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)localizedPlaceholder
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_localizedPlaceholder;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)submissionKey
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_submissionKey;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)submissionFormat
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_submissionFormat;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)incorrect
{
  DIAttribute *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_incorrect;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isSensitive
{
  DIAttribute *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isSensitive;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)holdLocally
{
  DIAttribute *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_holdLocally;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)notForVerification
{
  DIAttribute *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_notForVerification;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)dataNodeProof
{
  DIAttribute *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_dataNodeProof;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSString)group
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_group;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)dataNodeProofGroup
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_dataNodeProofGroup;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSData)submissionValue
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_submissionValue;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)clientValidationRegex
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_clientValidationRegex;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)codeOnError
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_codeOnError;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)serverValidationURL
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_serverValidationURL;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)hasLabel
{
  DIAttribute *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_hasLabel;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSString)supportingData
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_supportingData;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)reason
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_reason;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)submissionString
{
  return 0;
}

- (id)description
{
  void *v3;
  const __CFString *v4;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("attributeType: '%lu'; "), self->_attributeType);
  objc_msgSend(v3, "appendFormat:", CFSTR("displayFormat: '%@'; "), self->_displayFormat);
  objc_msgSend(v3, "appendFormat:", CFSTR("localizedDisplayName: '%@'; "), self->_localizedDisplayName);
  objc_msgSend(v3, "appendFormat:", CFSTR("localizedPlaceholder: '%@'; "), self->_localizedPlaceholder);
  objc_msgSend(v3, "appendFormat:", CFSTR("submissionKey: '%@'; "), self->_submissionKey);
  if (self->_optional)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("optional: '%@'; "), v4);
  os_unfair_lock_unlock(&self->_lock);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_supportingData, 0);
  objc_storeStrong((id *)&self->_serverValidationURL, 0);
  objc_storeStrong((id *)&self->_codeOnError, 0);
  objc_storeStrong((id *)&self->_clientValidationRegex, 0);
  objc_storeStrong((id *)&self->_submissionValue, 0);
  objc_storeStrong((id *)&self->_dataNodeProofGroup, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_submissionFormat, 0);
  objc_storeStrong((id *)&self->_submissionKey, 0);
  objc_storeStrong((id *)&self->_localizedPlaceholder, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_displayFormat, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_currentValue, 0);
}

@end
