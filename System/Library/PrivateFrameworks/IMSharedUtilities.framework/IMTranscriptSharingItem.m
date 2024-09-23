@implementation IMTranscriptSharingItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IMTranscriptSharingItem;
  v4 = -[IMItem copyWithZone:](&v9, sel_copyWithZone_, a3);
  -[IMTranscriptSharingItem otherUnformattedID](self, "otherUnformattedID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOtherUnformattedID:", v5);

  -[IMTranscriptSharingItem otherHandle](self, "otherHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOtherHandle:", v6);

  -[IMTranscriptSharingItem otherCountryCode](self, "otherCountryCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOtherCountryCode:", v7);

  return v4;
}

- (IMTranscriptSharingItem)initWithCoder:(id)a3
{
  id v4;
  IMTranscriptSharingItem *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IMTranscriptSharingItem;
  v5 = -[IMItem initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("otherCountryCode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTranscriptSharingItem setOtherCountryCode:](v5, "setOtherCountryCode:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("otherHandle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTranscriptSharingItem setOtherHandle:](v5, "setOtherHandle:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("otherUnformattedID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTranscriptSharingItem setOtherUnformattedID:](v5, "setOtherUnformattedID:", v8);

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
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMTranscriptSharingItem;
  v4 = a3;
  -[IMItem encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[IMTranscriptSharingItem otherCountryCode](self, "otherCountryCode", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("otherCountryCode"));

  -[IMTranscriptSharingItem otherHandle](self, "otherHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("otherHandle"));

  -[IMTranscriptSharingItem otherUnformattedID](self, "otherUnformattedID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("otherUnformattedID"));

}

- (BOOL)isEqual:(id)a3
{
  IMTranscriptSharingItem *v4;
  IMTranscriptSharingItem *v5;
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
  uint64_t v16;
  void *v17;
  NSString *v18;
  void *v19;
  BOOL v20;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  objc_super v26;

  v4 = (IMTranscriptSharingItem *)a3;
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
      v26.receiver = self;
      v26.super_class = (Class)IMTranscriptSharingItem;
      if (!-[IMItem isEqual:](&v26, sel_isEqual_, v5))
      {
        v10 = 0;
LABEL_23:

        goto LABEL_24;
      }
      otherCountryCode = self->_otherCountryCode;
      -[IMTranscriptSharingItem otherCountryCode](v5, "otherCountryCode");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (otherCountryCode != v7)
      {
        v8 = self->_otherCountryCode;
        -[IMTranscriptSharingItem otherCountryCode](v5, "otherCountryCode");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v8, "isEqualToString:", v9))
        {
          v10 = 0;
          goto LABEL_21;
        }
        v24 = v9;
      }
      otherHandle = self->_otherHandle;
      -[IMTranscriptSharingItem otherHandle](v5, "otherHandle");
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (otherHandle != v12)
      {
        v13 = self->_otherHandle;
        -[IMTranscriptSharingItem otherHandle](v5, "otherHandle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v13, "isEqualToString:", v14))
        {
          v10 = 0;
          v9 = v24;
          goto LABEL_19;
        }
        v22 = v14;
      }
      otherUnformattedID = self->_otherUnformattedID;
      -[IMTranscriptSharingItem otherUnformattedID](v5, "otherUnformattedID", v22);
      v16 = objc_claimAutoreleasedReturnValue();
      if (otherUnformattedID == (NSString *)v16)
      {

        v10 = 1;
      }
      else
      {
        v17 = (void *)v16;
        v18 = self->_otherUnformattedID;
        -[IMTranscriptSharingItem otherUnformattedID](v5, "otherUnformattedID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[NSString isEqualToString:](v18, "isEqualToString:", v19);

      }
      v20 = otherHandle == v12;
      v14 = v23;
      v9 = v24;
      if (v20)
      {
LABEL_20:

        if (otherCountryCode == v7)
        {
LABEL_22:

          goto LABEL_23;
        }
LABEL_21:

        goto LABEL_22;
      }
LABEL_19:

      goto LABEL_20;
    }
    v25.receiver = self;
    v25.super_class = (Class)IMTranscriptSharingItem;
    v10 = -[IMItem isEqual:](&v25, sel_isEqual_, v4);
  }
LABEL_24:

  return v10;
}

- (IMTranscriptSharingItem)initWithDictionary:(id)a3
{
  id v4;
  IMTranscriptSharingItem *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IMTranscriptSharingItem;
  v5 = -[IMItem initWithDictionary:](&v10, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("otherCountryCode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTranscriptSharingItem setOtherCountryCode:](v5, "setOtherCountryCode:", v6);

    objc_msgSend(v4, "objectForKey:", CFSTR("otherHandle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTranscriptSharingItem setOtherHandle:](v5, "setOtherHandle:", v7);

    objc_msgSend(v4, "objectForKey:", CFSTR("otherUnformattedID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTranscriptSharingItem setOtherUnformattedID:](v5, "setOtherUnformattedID:", v8);

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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IMTranscriptSharingItem;
  v3 = -[IMItem copyDictionaryRepresentation](&v9, sel_copyDictionaryRepresentation);
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
  objc_autoreleasePoolPop(v4);
  return v3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherUnformattedID, 0);
  objc_storeStrong((id *)&self->_otherHandle, 0);
  objc_storeStrong((id *)&self->_otherCountryCode, 0);
}

@end
