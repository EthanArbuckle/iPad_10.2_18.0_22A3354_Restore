@implementation IMSyndicationAction

- (id)_stringFromActionType:(unsigned __int8)a3
{
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;

  if ((a3 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", CFSTR("IMSyndicationActionTypeAddItem"));
  }
  else
  {
    v4 = 0;
  }
  v5 = CFSTR("IMSyndicationActionTypeRemoveItem");
  if ((a3 & 8) == 0)
    v5 = 0;
  v6 = v5;
  if ((a3 & 8) != 0)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "addObject:", CFSTR("IMSyndicationActionTypeRemoveItem"));
  }

  v7 = CFSTR("IMSyndicationActionTypeUndonateItem");
  if ((a3 & 0x10) == 0)
    v7 = 0;
  v8 = v7;
  if ((a3 & 0x10) != 0)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "addObject:", CFSTR("IMSyndicationActionTypeUndonateItem"));
  }

  v9 = CFSTR("IMSyndicationActionTypeDonateItem");
  if ((a3 & 0x20) == 0)
    v9 = 0;
  v10 = v9;
  if ((a3 & 0x20) != 0)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "addObject:", CFSTR("IMSyndicationActionTypeDonateItem"));
  }

  v11 = CFSTR("IMSyndicationActionTypeInteractedWithItem");
  if ((a3 & 0x40) == 0)
    v11 = 0;
  v12 = v11;
  if ((a3 & 0x40) != 0)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "addObject:", CFSTR("IMSyndicationActionTypeInteractedWithItem"));
  }

  if (v4)
  {
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" | "));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_stringFromItemType:(unsigned __int8)a3
{
  if (a3 > 2u)
    return 0;
  else
    return off_1E3FB6B48[(char)a3];
}

- (void)encodeWithIMRemoteObjectSerializedDictionary:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a3;
  v5 = -[IMSyndicationAction copyDictionaryRepresentation](self, "copyDictionaryRepresentation");
  if (v5)
  {
    objc_msgSend(v4, "addEntriesFromDictionary:", v5);
  }
  else
  {
    IMLogHandleForCategory("IMSyndicationAction");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_19E36C3E8();

  }
}

- (IMSyndicationAction)init
{
  NSObject *v3;

  IMLogHandleForCategory("IMSyndicationAction");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_19E36C414();

  return 0;
}

+ (id)dateFromNanoSeconds:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "longLongValue"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "longLongValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)nanoSecondsFromDate:(id)a3
{
  if (!a3)
    return &unk_1E3FFE4E0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a3, "__im_nanosecondTimeInterval"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyDictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[IMSyndicationAction syndicationActionType](self, "syndicationActionType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("sat2"));

  -[IMSyndicationAction chatGUID](self, "chatGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("sacg"));

  v6 = (void *)objc_opt_class();
  -[IMSyndicationAction syndicationStartDate](self, "syndicationStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nanoSecondsFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("sasd"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[IMSyndicationAction syndicatedItemType](self, "syndicatedItemType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("sait"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[IMSyndicationAction version](self, "version"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("savs"));

  return v3;
}

- (IMSyndicationAction)initWithDictionary:(id)a3
{
  NSObject *v4;

  IMLogHandleForCategory("IMSyndicationAction");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_19E36C440();

  return 0;
}

- (IMSyndicationAction)initWithChatGUID:(id)a3 syndicationStartDate:(id)a4 syndicationActionType:(unsigned __int8)a5
{
  unsigned int v5;
  id v8;
  id v9;
  IMSyndicationAction *v10;
  unsigned int v11;
  NSObject *v12;
  NSObject *v13;
  IMSyndicationAction *v14;
  uint64_t v15;
  NSString *chatGUID;
  objc_super v18;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)IMSyndicationAction;
  v10 = -[IMSyndicationAction init](&v18, sel_init);
  if (!v10)
    goto LABEL_24;
  if (v8 && objc_msgSend(v8, "length"))
  {
    v11 = v5 & 0xFFFFFFFB;
    if ((v5 & 4) == 0)
      v11 = v5;
    if ((v5 & 8) != 0)
      v11 &= ~8u;
    if ((v5 & 0x10) != 0)
      v11 &= ~0x10u;
    if ((v5 & 0x20) != 0)
      v11 &= ~0x20u;
    if ((v5 & 0x40) != 0)
      v11 &= ~0x40u;
    if (v11)
    {
      IMLogHandleForCategory("IMSyndicationAction");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_19E36C4C4(v5, v12);

      goto LABEL_21;
    }
    if (v9)
    {
      v15 = objc_msgSend(v8, "copy");
      chatGUID = v10->_chatGUID;
      v10->_chatGUID = (NSString *)v15;

      v10->_syndicationActionType = v5;
      objc_storeStrong((id *)&v10->_syndicationStartDate, a4);
      v10->_version = 2;
LABEL_24:
      v14 = v10;
      goto LABEL_25;
    }
    IMLogHandleForCategory("IMSyndicationAction");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_19E36C498();
  }
  else
  {
    IMLogHandleForCategory("IMSyndicationAction");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_19E36C46C();
  }

LABEL_21:
  v14 = 0;
LABEL_25:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IMSyndicationAction)initWithCoder:(id)a3
{
  NSObject *v4;

  IMLogHandleForCategory("IMSyndicationAction");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_19E36C53C();

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[IMSyndicationAction chatGUID](self, "chatGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("sacg"));

  -[IMSyndicationAction syndicationStartDate](self, "syndicationStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("sasd"));

  objc_msgSend(v6, "encodeInt64:forKey:", -[IMSyndicationAction syndicationActionType](self, "syndicationActionType"), CFSTR("sat2"));
  objc_msgSend(v6, "encodeInt64:forKey:", -[IMSyndicationAction version](self, "version"), CFSTR("savs"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NSObject *v3;

  IMLogHandleForCategory("IMSyndicationAction");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_19E36C568();

  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)IMSyndicationAction;
  -[IMSyndicationAction description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSyndicationAction chatGUID](self, "chatGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSyndicationAction _stringFromItemType:](self, "_stringFromItemType:", -[IMSyndicationAction syndicatedItemType](self, "syndicatedItemType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSyndicationAction _stringFromActionType:](self, "_stringFromActionType:", -[IMSyndicationAction syndicationActionType](self, "syndicationActionType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSyndicationAction syndicationStartDate](self, "syndicationStartDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ chatGUID: %@, syndicatedItemType: %@, syndicationActionType: %@, syndicationStartDate: %@, version: %d"), v4, v5, v6, v7, v8, -[IMSyndicationAction version](self, "version"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  IMSyndicationAction *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v4 = (IMSyndicationAction *)a3;
  if (v4 == self)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[IMSyndicationAction syndicationActionType](self, "syndicationActionType");
      if (v5 == -[IMSyndicationAction syndicationActionType](v4, "syndicationActionType"))
      {
        -[IMSyndicationAction syndicationStartDate](self, "syndicationStartDate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMSyndicationAction syndicationStartDate](v4, "syndicationStartDate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v6;
        v9 = v7;
        v10 = v9;
        if (v8 == v9)
        {

        }
        else
        {
          LOBYTE(v11) = 0;
          v12 = v9;
          v13 = v8;
          if (!v8 || !v9)
          {
LABEL_18:

LABEL_19:
            goto LABEL_20;
          }
          v11 = objc_msgSend(v8, "__im_isEqualToSeconds:", v9);

          if (!v11)
            goto LABEL_19;
        }
        -[IMSyndicationAction chatGUID](self, "chatGUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMSyndicationAction chatGUID](v4, "chatGUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v14;
        v16 = v15;
        v12 = v16;
        if (v13 == v16)
        {
          LOBYTE(v11) = 1;
        }
        else
        {
          LOBYTE(v11) = 0;
          if (v13 && v16)
            LOBYTE(v11) = objc_msgSend(v13, "isEqualToString:", v16);
        }

        goto LABEL_18;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_20:

  return v11;
}

+ (id)unarchiveClasses
{
  if (qword_1EE503E90 != -1)
    dispatch_once(&qword_1EE503E90, &unk_1E3FB3588);
  return (id)qword_1EE503E88;
}

- (unsigned)syndicatedItemType
{
  return 0;
}

- (unsigned)version
{
  return 2;
}

- (unsigned)syndicationActionType
{
  return self->_syndicationActionType;
}

- (NSDate)syndicationStartDate
{
  return self->_syndicationStartDate;
}

- (NSString)chatGUID
{
  return self->_chatGUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatGUID, 0);
  objc_storeStrong((id *)&self->_syndicationStartDate, 0);
}

@end
