@implementation IMLocationShareStatusChangeItem

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMLocationShareStatusChangeItem;
  -[IMLocationShareStatusChangeItem dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMLocationShareStatusChangeItem;
  v4 = -[IMItem copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setOtherUnformattedID:", -[IMLocationShareStatusChangeItem otherUnformattedID](self, "otherUnformattedID"));
  objc_msgSend(v4, "setOtherHandle:", -[IMLocationShareStatusChangeItem otherHandle](self, "otherHandle"));
  objc_msgSend(v4, "setOtherCountryCode:", -[IMLocationShareStatusChangeItem otherCountryCode](self, "otherCountryCode"));
  objc_msgSend(v4, "setStatus:", -[IMLocationShareStatusChangeItem status](self, "status"));
  objc_msgSend(v4, "setDirection:", -[IMLocationShareStatusChangeItem direction](self, "direction"));
  objc_msgSend(v4, "setActionable:", -[IMLocationShareStatusChangeItem actionable](self, "actionable"));
  objc_msgSend(v4, "setExpired:", -[IMLocationShareStatusChangeItem expired](self, "expired"));
  objc_msgSend(v4, "_setMessageID:", -[IMItem messageID](self, "messageID"));
  return v4;
}

- (IMLocationShareStatusChangeItem)initWithCoder:(id)a3
{
  IMLocationShareStatusChangeItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMLocationShareStatusChangeItem;
  v4 = -[IMItem initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    -[IMLocationShareStatusChangeItem setOtherCountryCode:](v4, "setOtherCountryCode:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("otherCountryCode")));
    -[IMLocationShareStatusChangeItem setOtherHandle:](v4, "setOtherHandle:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("otherHandle")));
    -[IMLocationShareStatusChangeItem setOtherUnformattedID:](v4, "setOtherUnformattedID:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("otherUnformattedID")));
    v4->_status = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("status"));
    v4->_direction = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("direction"));
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
  v5.super_class = (Class)IMLocationShareStatusChangeItem;
  -[IMItem encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", -[IMLocationShareStatusChangeItem otherCountryCode](self, "otherCountryCode"), CFSTR("otherCountryCode"));
  objc_msgSend(a3, "encodeObject:forKey:", -[IMLocationShareStatusChangeItem otherHandle](self, "otherHandle"), CFSTR("otherHandle"));
  objc_msgSend(a3, "encodeObject:forKey:", -[IMLocationShareStatusChangeItem otherUnformattedID](self, "otherUnformattedID"), CFSTR("otherUnformattedID"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_direction, CFSTR("direction"));
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v7;
  int64_t status;
  int64_t direction;
  NSString *otherCountryCode;
  NSString *otherHandle;
  NSString *otherUnformattedID;
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
      v15.super_class = (Class)IMLocationShareStatusChangeItem;
      v7 = -[IMItem isEqual:](&v15, sel_isEqual_, a3);
      if (v7)
      {
        status = self->_status;
        if (status == objc_msgSend(a3, "status")
          && (direction = self->_direction, direction == objc_msgSend(a3, "direction")))
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
              LOBYTE(v7) = otherUnformattedID == (NSString *)objc_msgSend(a3, "otherUnformattedID")
                        || -[NSString isEqualToString:](self->_otherUnformattedID, "isEqualToString:", objc_msgSend(a3, "otherUnformattedID"));
            }
          }
        }
        else
        {
          LOBYTE(v7) = 0;
        }
      }
    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)IMLocationShareStatusChangeItem;
      LOBYTE(v7) = -[IMItem isEqual:](&v14, sel_isEqual_, a3);
    }
  }
  return v7;
}

- (IMLocationShareStatusChangeItem)initWithDictionary:(id)a3
{
  IMLocationShareStatusChangeItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMLocationShareStatusChangeItem;
  v4 = -[IMItem initWithDictionary:](&v6, sel_initWithDictionary_);
  if (v4)
  {
    -[IMLocationShareStatusChangeItem setStatus:](v4, "setStatus:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("status")), "longLongValue"));
    -[IMLocationShareStatusChangeItem setDirection:](v4, "setDirection:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("direction")), "longLongValue"));
    -[IMLocationShareStatusChangeItem setOtherCountryCode:](v4, "setOtherCountryCode:", objc_msgSend(a3, "objectForKey:", CFSTR("otherCountryCode")));
    -[IMLocationShareStatusChangeItem setOtherHandle:](v4, "setOtherHandle:", objc_msgSend(a3, "objectForKey:", CFSTR("otherHandle")));
    -[IMLocationShareStatusChangeItem setOtherUnformattedID:](v4, "setOtherUnformattedID:", objc_msgSend(a3, "objectForKey:", CFSTR("otherUnformattedID")));
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
  const void *v8;
  const void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IMLocationShareStatusChangeItem;
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
  v8 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_status);
  if (v8)
    CFDictionarySetValue(v3, CFSTR("status"), v8);
  v9 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_direction);
  if (v9)
    CFDictionarySetValue(v3, CFSTR("direction"), v9);
  objc_autoreleasePoolPop(v4);
  return v3;
}

- (BOOL)isLastMessageCandidate
{
  return 0;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (BOOL)actionable
{
  return self->_actionable;
}

- (void)setActionable:(BOOL)a3
{
  self->_actionable = a3;
}

- (BOOL)expired
{
  return self->_expired;
}

- (void)setExpired:(BOOL)a3
{
  self->_expired = a3;
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

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

@end
