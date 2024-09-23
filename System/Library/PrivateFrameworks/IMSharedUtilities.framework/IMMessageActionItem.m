@implementation IMMessageActionItem

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)IMMessageActionItem;
  -[IMItem description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ actionType:%d originalMessageGUID:%@"), v4, self->_actionType, self->_originalMessageGUID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IMMessageActionItem;
  v4 = -[IMItem copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[IMMessageActionItem otherUnformattedID](self, "otherUnformattedID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOtherUnformattedID:", v5);

  -[IMMessageActionItem otherHandle](self, "otherHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOtherHandle:", v6);

  -[IMMessageActionItem otherCountryCode](self, "otherCountryCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOtherCountryCode:", v7);

  -[IMMessageActionItem originalMessageGUID](self, "originalMessageGUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOriginalMessageGUID:", v8);

  objc_msgSend(v4, "setActionType:", -[IMMessageActionItem actionType](self, "actionType"));
  return v4;
}

- (IMMessageActionItem)initWithCoder:(id)a3
{
  id v4;
  IMMessageActionItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IMMessageActionItem;
  v5 = -[IMItem initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("otherCountryCode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageActionItem setOtherCountryCode:](v5, "setOtherCountryCode:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("otherHandle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageActionItem setOtherHandle:](v5, "setOtherHandle:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("otherUnformattedID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageActionItem setOtherUnformattedID:](v5, "setOtherUnformattedID:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalMessageGUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageActionItem setOriginalMessageGUID:](v5, "setOriginalMessageGUID:", v9);

    v5->_actionType = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("actionType"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IMMessageActionItem;
  v4 = a3;
  -[IMItem encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[IMMessageActionItem otherCountryCode](self, "otherCountryCode", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("otherCountryCode"));

  -[IMMessageActionItem otherHandle](self, "otherHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("otherHandle"));

  -[IMMessageActionItem otherUnformattedID](self, "otherUnformattedID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("otherUnformattedID"));

  -[IMMessageActionItem originalMessageGUID](self, "originalMessageGUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("originalMessageGUID"));

  objc_msgSend(v4, "encodeInt64:forKey:", self->_actionType, CFSTR("actionType"));
}

- (IMMessageActionItem)initWithDictionary:(id)a3
{
  id v4;
  IMMessageActionItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IMMessageActionItem;
  v5 = -[IMItem initWithDictionary:](&v12, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("actionType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageActionItem setActionType:](v5, "setActionType:", objc_msgSend(v6, "longLongValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("otherCountryCode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageActionItem setOtherCountryCode:](v5, "setOtherCountryCode:", v7);

    objc_msgSend(v4, "objectForKey:", CFSTR("otherHandle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageActionItem setOtherHandle:](v5, "setOtherHandle:", v8);

    objc_msgSend(v4, "objectForKey:", CFSTR("otherUnformattedID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageActionItem setOtherUnformattedID:](v5, "setOtherUnformattedID:", v9);

    objc_msgSend(v4, "objectForKey:", CFSTR("originalMessageGUID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMMessageActionItem setOriginalMessageGUID:](v5, "setOriginalMessageGUID:", v10);

  }
  return v5;
}

- (id)copyDictionaryRepresentation
{
  __CFDictionary *v3;
  void *v4;
  NSString *otherCountryCode;
  NSString *otherHandle;
  NSString *otherUnformattedID;
  void *v8;
  NSString *originalMessageGUID;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IMMessageActionItem;
  v3 = -[IMItem copyDictionaryRepresentation](&v11, sel_copyDictionaryRepresentation);
  v4 = (void *)MEMORY[0x1A1AE8394]();
  otherCountryCode = self->_otherCountryCode;
  if (otherCountryCode)
    CFDictionarySetValue(v3, CFSTR("otherCountryCode"), otherCountryCode);
  otherHandle = self->_otherHandle;
  if (otherHandle)
    CFDictionarySetValue(v3, CFSTR("otherHandle"), otherHandle);
  otherUnformattedID = self->_otherUnformattedID;
  if (otherUnformattedID)
    CFDictionarySetValue(v3, CFSTR("otherUnformattedID"), otherUnformattedID);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_actionType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    CFDictionarySetValue(v3, CFSTR("actionType"), v8);

  originalMessageGUID = self->_originalMessageGUID;
  if (originalMessageGUID)
    CFDictionarySetValue(v3, CFSTR("originalMessageGUID"), originalMessageGUID);
  objc_autoreleasePoolPop(v4);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  IMMessageActionItem *v4;
  IMMessageActionItem *v5;
  NSString *otherCountryCode;
  NSString *v7;
  NSString *v8;
  void *v9;
  unsigned __int8 v10;
  NSString *otherHandle;
  NSString *v12;
  NSString *v13;
  void *v14;
  NSString *otherUnformattedID;
  NSString *v16;
  NSString *v17;
  void *v18;
  NSString *originalMessageGUID;
  NSString *v20;
  NSString *v21;
  int64_t actionType;
  NSString *v23;
  void *v25;
  void *v26;
  NSString *v27;
  void *v28;
  NSString *v29;
  void *v30;
  objc_super v31;
  objc_super v32;

  v4 = (IMMessageActionItem *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v32.receiver = self;
      v32.super_class = (Class)IMMessageActionItem;
      if (!-[IMItem isEqual:](&v32, sel_isEqual_, v5))
      {
        v10 = 0;
LABEL_34:

        goto LABEL_35;
      }
      otherCountryCode = self->_otherCountryCode;
      -[IMMessageActionItem otherCountryCode](v5, "otherCountryCode");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (otherCountryCode != v7)
      {
        v8 = self->_otherCountryCode;
        -[IMMessageActionItem otherCountryCode](v5, "otherCountryCode");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v8, "isEqualToString:", v9))
        {
          v10 = 0;
          goto LABEL_32;
        }
        v30 = v9;
      }
      otherHandle = self->_otherHandle;
      -[IMMessageActionItem otherHandle](v5, "otherHandle");
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (otherHandle != v12)
      {
        v13 = self->_otherHandle;
        -[IMMessageActionItem otherHandle](v5, "otherHandle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v13, "isEqualToString:", v14))
        {
          v10 = 0;
          v9 = v30;
LABEL_30:

LABEL_31:
          if (otherCountryCode == v7)
          {
LABEL_33:

            goto LABEL_34;
          }
LABEL_32:

          goto LABEL_33;
        }
        v28 = v14;
      }
      otherUnformattedID = self->_otherUnformattedID;
      -[IMMessageActionItem otherUnformattedID](v5, "otherUnformattedID");
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      v29 = otherUnformattedID;
      if (otherUnformattedID == v16)
      {
        v27 = otherHandle;
      }
      else
      {
        v17 = self->_otherUnformattedID;
        -[IMMessageActionItem otherUnformattedID](v5, "otherUnformattedID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v17, "isEqualToString:", v18))
        {
          v10 = 0;
          v9 = v30;
LABEL_28:

LABEL_29:
          v14 = v28;
          if (otherHandle == v12)
            goto LABEL_31;
          goto LABEL_30;
        }
        v26 = v18;
        v27 = otherHandle;
      }
      originalMessageGUID = self->_originalMessageGUID;
      -[IMMessageActionItem originalMessageGUID](v5, "originalMessageGUID");
      v20 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (originalMessageGUID == v20
        || (v21 = self->_originalMessageGUID,
            -[IMMessageActionItem originalMessageGUID](v5, "originalMessageGUID"),
            v25 = (void *)objc_claimAutoreleasedReturnValue(),
            -[NSString isEqualToString:](v21, "isEqualToString:")))
      {
        otherHandle = v27;
        actionType = self->_actionType;
        v10 = actionType == -[IMMessageActionItem actionType](v5, "actionType");
        if (originalMessageGUID == v20)
        {

          v23 = v29;
          v9 = v30;
LABEL_27:
          v18 = v26;
          if (v23 == v16)
            goto LABEL_29;
          goto LABEL_28;
        }
        v9 = v30;
      }
      else
      {
        v10 = 0;
        v9 = v30;
        otherHandle = v27;
      }

      v23 = v29;
      goto LABEL_27;
    }
    v31.receiver = self;
    v31.super_class = (Class)IMMessageActionItem;
    v10 = -[IMItem isEqual:](&v31, sel_isEqual_, v4);
  }
LABEL_35:

  return v10;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (NSString)otherCountryCode
{
  return self->_otherCountryCode;
}

- (void)setOtherCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_otherCountryCode, a3);
}

- (NSString)otherHandle
{
  return self->_otherHandle;
}

- (void)setOtherHandle:(id)a3
{
  objc_storeStrong((id *)&self->_otherHandle, a3);
}

- (NSString)otherUnformattedID
{
  return self->_otherUnformattedID;
}

- (void)setOtherUnformattedID:(id)a3
{
  objc_storeStrong((id *)&self->_otherUnformattedID, a3);
}

- (NSString)originalMessageGUID
{
  return self->_originalMessageGUID;
}

- (void)setOriginalMessageGUID:(id)a3
{
  objc_storeStrong((id *)&self->_originalMessageGUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalMessageGUID, 0);
  objc_storeStrong((id *)&self->_otherUnformattedID, 0);
  objc_storeStrong((id *)&self->_otherHandle, 0);
  objc_storeStrong((id *)&self->_otherCountryCode, 0);
}

@end
