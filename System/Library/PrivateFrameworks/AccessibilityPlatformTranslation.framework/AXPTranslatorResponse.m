@implementation AXPTranslatorResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)emptyResponse
{
  return (id)objc_opt_new();
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)objc_opt_new();
  -[AXPTranslatorResponse resultData](self, "resultData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResultData:", v6);

  objc_msgSend(v5, "setError:", -[AXPTranslatorResponse error](self, "error"));
  objc_msgSend(v5, "setAttribute:", -[AXPTranslatorResponse attribute](self, "attribute"));
  objc_msgSend(v5, "setNotification:", -[AXPTranslatorResponse notification](self, "notification"));
  objc_msgSend(v5, "setAssociatedRequestType:", -[AXPTranslatorResponse associatedRequestType](self, "associatedRequestType"));
  -[AXPTranslatorResponse associatedNotificationObject](self, "associatedNotificationObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copyWithZone:", a3);
  objc_msgSend(v5, "setAssociatedNotificationObject:", v8);

  -[AXPTranslatorResponse associatedTranslationObject](self, "associatedTranslationObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copyWithZone:", a3);
  objc_msgSend(v5, "setAssociatedTranslationObject:", v10);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[AXPTranslatorResponse resultData](self, "resultData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("resultData"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[AXPTranslatorResponse error](self, "error"), CFSTR("error"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXPTranslatorResponse attribute](self, "attribute"), CFSTR("attribute"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXPTranslatorResponse notification](self, "notification"), CFSTR("notification"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXPTranslatorResponse associatedRequestType](self, "associatedRequestType"), CFSTR("associatedRequestType"));
  -[AXPTranslatorResponse associatedNotificationObject](self, "associatedNotificationObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("associatedNotificationObject"));

  -[AXPTranslatorResponse associatedTranslationObject](self, "associatedTranslationObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("associatedTranslationObject"));

}

+ (id)allowedDecodableClasses
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__AXPTranslatorResponse_allowedDecodableClasses__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allowedDecodableClasses_onceToken_1 != -1)
    dispatch_once(&allowedDecodableClasses_onceToken_1, block);
  return (id)allowedDecodableClasses_Allowed_1;
}

void __48__AXPTranslatorResponse_allowedDecodableClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  +[AXPTranslationObject allowedDecodableClasses](AXPTranslationObject, "allowedDecodableClasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setByAddingObjectsFromSet:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)allowedDecodableClasses_Allowed_1;
  allowedDecodableClasses_Allowed_1 = v10;

}

- (AXPTranslatorResponse)initWithCoder:(id)a3
{
  id v4;
  AXPTranslatorResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (AXPTranslatorResponse *)objc_opt_new();
  objc_msgSend((id)objc_opt_class(), "allowedDecodableClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("resultData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPTranslatorResponse setResultData:](v5, "setResultData:", v7);

  -[AXPTranslatorResponse setError:](v5, "setError:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("error")));
  -[AXPTranslatorResponse setAttribute:](v5, "setAttribute:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("attribute")));
  -[AXPTranslatorResponse setNotification:](v5, "setNotification:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("notification")));
  -[AXPTranslatorResponse setAssociatedRequestType:](v5, "setAssociatedRequestType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("associatedRequestType")));
  objc_msgSend((id)objc_opt_class(), "allowedDecodableClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("associatedNotificationObject"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPTranslatorResponse setAssociatedNotificationObject:](v5, "setAssociatedNotificationObject:", v9);

  objc_msgSend((id)objc_opt_class(), "allowedDecodableClasses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("associatedTranslationObject"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXPTranslatorResponse setAssociatedTranslationObject:](v5, "setAssociatedTranslationObject:", v11);
  return v5;
}

- (AXPTranslationObject)translationResponse
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[AXPTranslatorResponse resultData](self, "resultData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[AXPTranslatorResponse resultData](self, "resultData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (AXPTranslationObject *)v5;
}

- (NSArray)translationsResponse
{
  void *v3;
  char isKindOfClass;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  -[AXPTranslatorResponse resultData](self, "resultData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_4;
  -[AXPTranslatorResponse resultData](self, "resultData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  -[AXPTranslatorResponse resultData](self, "resultData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexesOfObjectsPassingTest:", &__block_literal_global_2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v6 == v9)
  {
    -[AXPTranslatorResponse resultData](self, "resultData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_4:
    v10 = 0;
  }
  return (NSArray *)v10;
}

uint64_t __45__AXPTranslatorResponse_translationsResponse__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)BOOLResponse
{
  void *v3;
  char isKindOfClass;
  void *v5;
  char v6;

  -[AXPTranslatorResponse resultData](self, "resultData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0;
  -[AXPTranslatorResponse resultData](self, "resultData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (NSString)treeDumpType
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[AXPTranslatorResponse resultData](self, "resultData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_5;
  -[AXPTranslatorResponse resultData](self, "resultData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("treeDumpType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

LABEL_5:
    v6 = 0;
  }
  return (NSString *)v6;
}

- (NSArray)treeDumpResponse
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[AXPTranslatorResponse resultData](self, "resultData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_5;
  -[AXPTranslatorResponse resultData](self, "resultData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("treeDump"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

LABEL_5:
    v6 = 0;
  }
  return (NSArray *)v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v12.receiver = self;
  v12.super_class = (Class)AXPTranslatorResponse;
  -[AXPTranslatorResponse description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPTranslatorResponse resultData](self, "resultData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _AXPAttributeToString(-[AXPTranslatorResponse attribute](self, "attribute"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _AXPNotificationToString(-[AXPTranslatorResponse notification](self, "notification"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AXPTranslatorResponse associatedRequestType](self, "associatedRequestType");
  -[AXPTranslatorResponse associatedTranslationObject](self, "associatedTranslationObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ [maybe attribute: %@] [maybe notification: %@] [maybe associatedRequestType: %d] [maybe associatedTranslationObj: %@]"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSObject)resultData
{
  return self->_resultData;
}

- (void)setResultData:(id)a3
{
  objc_storeStrong((id *)&self->_resultData, a3);
}

- (unint64_t)attribute
{
  return self->_attribute;
}

- (void)setAttribute:(unint64_t)a3
{
  self->_attribute = a3;
}

- (unint64_t)notification
{
  return self->_notification;
}

- (void)setNotification:(unint64_t)a3
{
  self->_notification = a3;
}

- (unint64_t)associatedRequestType
{
  return self->_associatedRequestType;
}

- (void)setAssociatedRequestType:(unint64_t)a3
{
  self->_associatedRequestType = a3;
}

- (AXPTranslationObject)associatedNotificationObject
{
  return self->_associatedNotificationObject;
}

- (void)setAssociatedNotificationObject:(id)a3
{
  objc_storeStrong((id *)&self->_associatedNotificationObject, a3);
}

- (AXPTranslationObject)associatedTranslationObject
{
  return self->_associatedTranslationObject;
}

- (void)setAssociatedTranslationObject:(id)a3
{
  objc_storeStrong((id *)&self->_associatedTranslationObject, a3);
}

- (unint64_t)error
{
  return self->_error;
}

- (void)setError:(unint64_t)a3
{
  self->_error = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedTranslationObject, 0);
  objc_storeStrong((id *)&self->_associatedNotificationObject, 0);
  objc_storeStrong((id *)&self->_resultData, 0);
}

@end
