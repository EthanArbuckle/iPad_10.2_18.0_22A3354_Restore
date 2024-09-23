@implementation IMMessageSyndicationAction

- (IMMessageSyndicationAction)initWithChatGUID:(id)a3 syndicationStartDate:(id)a4 syndicationActionType:(unsigned __int8)a5 messagePartGUID:(id)a6 messagePartRange:(_NSRange)a7
{
  uint64_t v8;

  LOBYTE(v8) = IMSyndicationActionCurrentVersion;
  return -[IMMessageSyndicationAction initWithChatGUID:syndicationStartDate:syndicationActionType:messagePartGUID:messagePartRange:version:](self, "initWithChatGUID:syndicationStartDate:syndicationActionType:messagePartGUID:messagePartRange:version:", a3, a4, a5, a6, a7.location, a7.length, v8);
}

- (IMMessageSyndicationAction)initWithChatGUID:(id)a3 syndicationStartDate:(id)a4 syndicationActionType:(unsigned __int8)a5 messagePartGUID:(id)a6 messagePartRange:(_NSRange)a7 version:(unsigned __int8)a8
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  IMMessageSyndicationAction *v28;
  NSObject *v30;
  IMMessageSyndicationAction *v31;
  IMMessageSyndicationAction *v32;
  objc_super v33;
  NSRange v34;

  length = a7.length;
  location = a7.location;
  v11 = a5;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = v16;
  if (IMSyndicationActionCurrentVersion != a8)
  {
    IMLogHandleForCategory("IMSyndicationAction");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_19E36DB5C(IMSyndicationActionCurrentVersion, a8, v19);
    goto LABEL_21;
  }
  if (!v16)
  {
    IMLogHandleForCategory("IMSyndicationAction");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_19E36DA2C(v19, v21, v22, v23, v24, v25, v26, v27);
    goto LABEL_21;
  }
  if (!length)
  {
    IMLogHandleForCategory("IMSyndicationAction");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v34.location = location;
      v34.length = 0;
      sub_19E36DA60(v34, v30);
    }

    goto LABEL_22;
  }
  v18 = v11 & 0xFFFFFFFB;
  if ((v11 & 4) == 0)
    v18 = v11;
  if ((v11 & 8) != 0)
    v18 &= ~8u;
  if ((v11 & 0x10) != 0)
    v18 &= ~0x10u;
  if ((v11 & 0x20) != 0)
    v18 &= ~0x20u;
  if ((v11 & 0x40) != 0)
    v18 &= ~0x40u;
  if (v18)
  {
    IMLogHandleForCategory("IMSyndicationAction");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_19E36DAEC(v11, v19, v20);
LABEL_21:

LABEL_22:
    v28 = 0;
    goto LABEL_23;
  }
  v33.receiver = self;
  v33.super_class = (Class)IMMessageSyndicationAction;
  v31 = -[IMSyndicationAction initWithChatGUID:syndicationStartDate:syndicationActionType:](&v33, sel_initWithChatGUID_syndicationStartDate_syndicationActionType_, v14, v15, v11);
  v32 = v31;
  if (v31)
  {
    objc_storeStrong((id *)&v31->_messagePartGUID, a6);
    v32->_messagePartRange.location = location;
    v32->_messagePartRange.length = length;
  }
  self = v32;
  v28 = self;
LABEL_23:

  return v28;
}

- (IMMessageSyndicationAction)initWithChatGUID:(id)a3 syndicationStartDate:(id)a4 syndicationActionType:(unsigned __int8)a5 encodedMessagePartGUID:(id)a6 messagePartRange:(_NSRange)a7
{
  uint64_t v8;

  LOBYTE(v8) = IMSyndicationActionCurrentVersion;
  return -[IMMessageSyndicationAction initWithChatGUID:syndicationStartDate:syndicationActionType:encodedMessagePartGUID:messagePartRange:version:](self, "initWithChatGUID:syndicationStartDate:syndicationActionType:encodedMessagePartGUID:messagePartRange:version:", a3, a4, a5, a6, a7.location, a7.length, v8);
}

- (IMMessageSyndicationAction)initWithChatGUID:(id)a3 syndicationStartDate:(id)a4 syndicationActionType:(unsigned __int8)a5 encodedMessagePartGUID:(id)a6 messagePartRange:(_NSRange)a7 version:(unsigned __int8)a8
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  void *v17;
  IMMessagePartGUID *v18;
  IMMessageSyndicationAction *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;

  length = a7.length;
  location = a7.location;
  v11 = a5;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = v16;
  if (v16 && objc_msgSend(v16, "length"))
  {
    v18 = -[IMMessagePartGUID initWithEncodedMessagePartGUID:]([IMMessagePartGUID alloc], "initWithEncodedMessagePartGUID:", v17);
    LOBYTE(v29) = a8;
    self = -[IMMessageSyndicationAction initWithChatGUID:syndicationStartDate:syndicationActionType:messagePartGUID:messagePartRange:version:](self, "initWithChatGUID:syndicationStartDate:syndicationActionType:messagePartGUID:messagePartRange:version:", v14, v15, v11, v18, location, length, v29);

    v19 = self;
  }
  else
  {
    IMLogHandleForCategory("IMSyndicationAction");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_19E36DA2C(v20, v21, v22, v23, v24, v25, v26, v27);

    v19 = 0;
  }

  return v19;
}

- (IMMessageSyndicationAction)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  IMMessageSyndicationAction *v16;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("salc"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("saln"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sacg"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sasd"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateFromNanoSeconds:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sat2"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedCharValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("samp"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("savs"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v18) = objc_msgSend(v15, "unsignedCharValue");
  v16 = -[IMMessageSyndicationAction initWithChatGUID:syndicationStartDate:syndicationActionType:encodedMessagePartGUID:messagePartRange:version:](self, "initWithChatGUID:syndicationStartDate:syndicationActionType:encodedMessagePartGUID:messagePartRange:version:", v8, v11, v13, v14, v19, v7, v18);

  return v16;
}

- (id)copyDictionaryRepresentation
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)IMMessageSyndicationAction;
  v3 = -[IMSyndicationAction copyDictionaryRepresentation](&v15, sel_copyDictionaryRepresentation);
  v4 = -[IMMessageSyndicationAction messagePartRange](self, "messagePartRange");
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("salc"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("saln"));

  -[IMMessageSyndicationAction messagePartGUID](self, "messagePartGUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodedMessagePartGUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("samp"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[IMSyndicationAction syndicationActionType](self, "syndicationActionType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("sat2"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[IMSyndicationAction version](self, "version"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("savs"));

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IMMessageSyndicationAction;
  if (-[IMSyndicationAction isEqual:](&v17, sel_isEqual_, v4)
    && (v5 = -[IMSyndicationAction syndicationActionType](self, "syndicationActionType"),
        v5 == objc_msgSend(v4, "syndicationActionType")))
  {
    v6 = -[IMMessageSyndicationAction messagePartRange](self, "messagePartRange");
    v8 = v7;
    v10 = 0;
    if (v6 == objc_msgSend(v4, "messagePartRange") && v8 == v9)
    {
      -[IMMessageSyndicationAction messagePartGUID](self, "messagePartGUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePartGUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v11;
      v14 = v12;
      v15 = v14;
      if (v13 == v14)
      {
        v10 = 1;
      }
      else
      {
        v10 = 0;
        if (v13 && v14)
          v10 = objc_msgSend(v13, "isEqual:", v14);
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (IMMessageSyndicationAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  IMMessageSyndicationAction *v14;
  uint64_t v16;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sacg"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sasd"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sat2"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("samp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IMSyndicatedMessagePartRangeKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "rangeValue");
  v12 = v11;
  v13 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("savs"));

  LOBYTE(v16) = v13;
  v14 = -[IMMessageSyndicationAction initWithChatGUID:syndicationStartDate:syndicationActionType:messagePartGUID:messagePartRange:version:](self, "initWithChatGUID:syndicationStartDate:syndicationActionType:messagePartGUID:messagePartRange:version:", v5, v6, v7, v8, v10, v12, v16);

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IMMessageSyndicationAction;
  v4 = a3;
  -[IMSyndicationAction encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  v5 = (void *)MEMORY[0x1E0CB3B18];
  v6 = -[IMMessageSyndicationAction messagePartRange](self, "messagePartRange", v10.receiver, v10.super_class);
  objc_msgSend(v5, "valueWithRange:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("IMSyndicatedMessagePartRangeKey"));

  -[IMMessageSyndicationAction messagePartGUID](self, "messagePartGUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("samp"));

  objc_msgSend(v4, "encodeInt64:forKey:", -[IMSyndicationAction syndicationActionType](self, "syndicationActionType"), CFSTR("sat2"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[IMSyndicationAction version](self, "version"), CFSTR("savs"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;

  v4 = objc_alloc((Class)objc_opt_class());
  -[IMSyndicationAction chatGUID](self, "chatGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSyndicationAction syndicationStartDate](self, "syndicationStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IMSyndicationAction syndicationActionType](self, "syndicationActionType");
  -[IMMessageSyndicationAction messagePartGUID](self, "messagePartGUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[IMMessageSyndicationAction messagePartRange](self, "messagePartRange");
  v11 = v10;
  LOBYTE(v14) = -[IMSyndicationAction version](self, "version");
  v12 = (void *)objc_msgSend(v4, "initWithChatGUID:syndicationStartDate:syndicationActionType:messagePartGUID:messagePartRange:version:", v5, v6, v7, v8, v9, v11, v14);

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  NSRange v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)IMMessageSyndicationAction;
  -[IMSyndicationAction description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10.location = -[IMMessageSyndicationAction messagePartRange](self, "messagePartRange");
  NSStringFromRange(v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessageSyndicationAction messagePartGUID](self, "messagePartGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ range: %@, messagePartGUID: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isHighlighted
{
  return (-[IMSyndicationAction syndicationActionType](self, "syndicationActionType") >> 2) & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unsigned)syndicatedItemType
{
  return 1;
}

- (_NSRange)messagePartRange
{
  _NSRange *p_messagePartRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_messagePartRange = &self->_messagePartRange;
  location = self->_messagePartRange.location;
  length = p_messagePartRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (IMMessagePartGUID)messagePartGUID
{
  return self->_messagePartGUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagePartGUID, 0);
}

- (int64_t)messagePartSyndicationType
{
  if (!-[IMSyndicationAction syndicationActionType](self, "syndicationActionType")
    || (-[IMSyndicationAction syndicationActionType](self, "syndicationActionType") & 8) != 0)
  {
    return 0;
  }
  if ((-[IMSyndicationAction syndicationActionType](self, "syndicationActionType") & 0x10) != 0)
    return 4;
  if ((-[IMSyndicationAction syndicationActionType](self, "syndicationActionType") & 4) == 0)
  {
    if ((-[IMSyndicationAction syndicationActionType](self, "syndicationActionType") & 0x20) == 0)
      return (-[IMSyndicationAction syndicationActionType](self, "syndicationActionType") >> 3) & 8;
    return 0;
  }
  return 1;
}

- (int64_t)messagePartSyndicationStatus
{
  return (-[IMSyndicationAction syndicationActionType](self, "syndicationActionType") >> 5) & 1;
}

@end
