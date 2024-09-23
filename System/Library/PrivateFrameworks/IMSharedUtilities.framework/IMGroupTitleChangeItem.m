@implementation IMGroupTitleChangeItem

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMGroupTitleChangeItem;
  -[IMGroupTitleChangeItem dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMGroupTitleChangeItem;
  v4 = -[IMItem copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setOtherUnformattedID:", -[IMGroupTitleChangeItem otherUnformattedID](self, "otherUnformattedID"));
  objc_msgSend(v4, "setOtherHandle:", -[IMGroupTitleChangeItem otherHandle](self, "otherHandle"));
  objc_msgSend(v4, "setOtherCountryCode:", -[IMGroupTitleChangeItem otherCountryCode](self, "otherCountryCode"));
  objc_msgSend(v4, "setTitle:", -[IMGroupTitleChangeItem title](self, "title"));
  objc_msgSend(v4, "setErrorCode:", -[IMGroupTitleChangeItem errorCode](self, "errorCode"));
  return v4;
}

- (IMGroupTitleChangeItem)initWithCoder:(id)a3
{
  IMGroupTitleChangeItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMGroupTitleChangeItem;
  v4 = -[IMItem initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    -[IMGroupTitleChangeItem setOtherCountryCode:](v4, "setOtherCountryCode:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("otherCountryCode")));
    -[IMGroupTitleChangeItem setOtherHandle:](v4, "setOtherHandle:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("otherHandle")));
    -[IMGroupTitleChangeItem setOtherUnformattedID:](v4, "setOtherUnformattedID:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("otherUnformattedID")));
    -[IMGroupTitleChangeItem setTitle:](v4, "setTitle:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title")));
    -[IMGroupTitleChangeItem setErrorCode:](v4, "setErrorCode:", objc_msgSend(a3, "decodeIntForKey:", CFSTR("errorCode")));
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMGroupTitleChangeItem;
  -[IMItem encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", -[IMGroupTitleChangeItem otherCountryCode](self, "otherCountryCode"), CFSTR("otherCountryCode"));
  objc_msgSend(a3, "encodeObject:forKey:", -[IMGroupTitleChangeItem otherHandle](self, "otherHandle"), CFSTR("otherHandle"));
  objc_msgSend(a3, "encodeObject:forKey:", -[IMGroupTitleChangeItem otherUnformattedID](self, "otherUnformattedID"), CFSTR("otherUnformattedID"));
  objc_msgSend(a3, "encodeObject:forKey:", -[IMGroupTitleChangeItem title](self, "title"), CFSTR("title"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[IMGroupTitleChangeItem errorCode](self, "errorCode")), CFSTR("errorCode"));
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v7;
  NSString *title;
  NSString *otherCountryCode;
  NSString *otherHandle;
  NSString *otherUnformattedID;
  unsigned int errorCode;
  objc_super v14;
  objc_super v15;
  uint64_t v16;
  uint64_t v17;

  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v16 = v3;
    v17 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15.receiver = self;
      v15.super_class = (Class)IMGroupTitleChangeItem;
      v7 = -[IMItem isEqual:](&v15, sel_isEqual_, a3);
      if (v7)
      {
        title = self->_title;
        if (title == (NSString *)objc_msgSend(a3, "title")
          || (v7 = -[NSString isEqualToString:](self->_title, "isEqualToString:", objc_msgSend(a3, "title"))))
        {
          otherCountryCode = self->_otherCountryCode;
          if (otherCountryCode == (NSString *)objc_msgSend(a3, "otherCountryCode")
            || (v7 = -[NSString isEqualToString:](self->_otherCountryCode, "isEqualToString:", objc_msgSend(a3, "otherCountryCode"))))
          {
            otherHandle = self->_otherHandle;
            if (otherHandle == (NSString *)objc_msgSend(a3, "otherHandle")
              || (v7 = -[NSString isEqualToString:](self->_otherHandle, "isEqualToString:", objc_msgSend(a3, "otherHandle"))))
            {
              otherUnformattedID = self->_otherUnformattedID;
              if (otherUnformattedID == (NSString *)objc_msgSend(a3, "otherUnformattedID")
                || (v7 = -[NSString isEqualToString:](self->_otherUnformattedID, "isEqualToString:", objc_msgSend(a3, "otherUnformattedID"))))
              {
                errorCode = self->_errorCode;
                LOBYTE(v7) = errorCode == objc_msgSend(a3, "errorCode");
              }
            }
          }
        }
      }
    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)IMGroupTitleChangeItem;
      LOBYTE(v7) = -[IMItem isEqual:](&v14, sel_isEqual_, a3);
    }
  }
  return v7;
}

- (IMGroupTitleChangeItem)initWithDictionary:(id)a3
{
  IMGroupTitleChangeItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMGroupTitleChangeItem;
  v4 = -[IMItem initWithDictionary:](&v6, sel_initWithDictionary_);
  if (v4)
  {
    -[IMGroupTitleChangeItem setOtherCountryCode:](v4, "setOtherCountryCode:", objc_msgSend(a3, "objectForKey:", CFSTR("otherCountryCode")));
    -[IMGroupTitleChangeItem setOtherHandle:](v4, "setOtherHandle:", objc_msgSend(a3, "objectForKey:", CFSTR("otherHandle")));
    -[IMGroupTitleChangeItem setOtherUnformattedID:](v4, "setOtherUnformattedID:", objc_msgSend(a3, "objectForKey:", CFSTR("otherUnformattedID")));
    -[IMGroupTitleChangeItem setTitle:](v4, "setTitle:", objc_msgSend(a3, "objectForKey:", CFSTR("title")));
    -[IMGroupTitleChangeItem setErrorCode:](v4, "setErrorCode:", objc_msgSend((id)objc_msgSend(a3, "_numberForKey:", CFSTR("errorCode")), "intValue"));
  }
  return v4;
}

- (id)copyDictionaryRepresentation
{
  __CFDictionary *v3;
  void *v4;
  NSString *otherCountryCode;
  NSString *otherHandle;
  NSString *otherUnformattedID;
  NSString *title;
  const void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IMGroupTitleChangeItem;
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
  title = self->_title;
  if (title)
    CFDictionarySetValue(v3, CFSTR("title"), title);
  v9 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_errorCode);
  if (v9)
    CFDictionarySetValue(v3, CFSTR("errorCode"), v9);
  objc_autoreleasePoolPop(v4);
  return v3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (NSString)otherCountryCode
{
  return self->_otherCountryCode;
}

- (void)setOtherCountryCode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

- (NSString)otherHandle
{
  return self->_otherHandle;
}

- (void)setOtherHandle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 232);
}

- (NSString)otherUnformattedID
{
  return self->_otherUnformattedID;
}

- (void)setOtherUnformattedID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 240);
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(unsigned int)a3
{
  self->_errorCode = a3;
}

@end
