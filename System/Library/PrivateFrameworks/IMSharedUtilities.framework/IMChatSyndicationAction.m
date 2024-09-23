@implementation IMChatSyndicationAction

- (IMChatSyndicationAction)initWithChatGUID:(id)a3 syndicationStartDate:(id)a4 autoDonateMessages:(BOOL)a5
{
  return -[IMChatSyndicationAction initWithChatGUID:syndicationStartDate:autoDonateMessages:version:](self, "initWithChatGUID:syndicationStartDate:autoDonateMessages:version:", a3, a4, a5, IMSyndicationActionCurrentVersion);
}

- (IMChatSyndicationAction)initWithChatGUID:(id)a3 syndicationStartDate:(id)a4 autoDonateMessages:(BOOL)a5 version:(unsigned __int8)a6
{
  IMChatSyndicationAction *v6;
  IMChatSyndicationAction *v8;
  IMChatSyndicationAction *v9;
  NSObject *v10;
  objc_super v12;

  v6 = self;
  if (IMSyndicationActionCurrentVersion == a6)
  {
    v12.receiver = self;
    v12.super_class = (Class)IMChatSyndicationAction;
    if (a5)
      v8 = -[IMSyndicationAction initWithChatGUID:syndicationStartDate:syndicationActionType:](&v12, sel_initWithChatGUID_syndicationStartDate_syndicationActionType_, a3, a4, 4);
    else
      v8 = -[IMSyndicationAction initWithChatGUID:syndicationStartDate:syndicationActionType:](&v12, sel_initWithChatGUID_syndicationStartDate_syndicationActionType_, a3, a4, 8);
    if (v8)
      v8->_autoDonateMessages = a5;
    v6 = v8;
    v9 = v6;
  }
  else
  {
    IMLogHandleForCategory("IMSyndicationAction");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_19E36C68C();

    v9 = 0;
  }

  return v9;
}

- (IMChatSyndicationAction)initWithChatGUID:(id)a3 syndicationStartDate:(id)a4 deserializedSyndicationActionType:(unsigned __int8)a5 version:(unsigned __int8)a6
{
  uint64_t v6;
  unsigned int v7;
  id v10;
  id v11;
  unsigned int v12;
  NSObject *v13;
  NSObject *v14;
  IMChatSyndicationAction *v15;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  if ((unsigned __int16)IMSyndicationActionCurrentVersion == (_DWORD)v6)
  {
    v12 = v7 & 0xFFFFFFFB;
    if ((v7 & 4) == 0)
      v12 = v7;
    if ((v7 & 8) != 0)
      v12 &= ~8u;
    if ((v7 & 0x10) != 0)
      v12 &= ~0x10u;
    if ((v7 & 0x20) != 0)
      v12 &= ~0x20u;
    if ((v7 & 0x40) != 0)
      v12 &= ~0x40u;
    if (!v12)
    {
      self = -[IMChatSyndicationAction initWithChatGUID:syndicationStartDate:autoDonateMessages:version:](self, "initWithChatGUID:syndicationStartDate:autoDonateMessages:version:", v10, v11, (v7 >> 2) & 1, v6);
      v15 = self;
      goto LABEL_20;
    }
    IMLogHandleForCategory("IMSyndicationAction");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_19E36C6EC(v7, v13);

  }
  else
  {
    IMLogHandleForCategory("IMSyndicationAction");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_19E36C68C();

  }
  v15 = 0;
LABEL_20:

  return v15;
}

- (IMChatSyndicationAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  IMChatSyndicationAction *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sacg"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sasd"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sat2"));
  v8 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("savs"));

  v9 = -[IMChatSyndicationAction initWithChatGUID:syndicationStartDate:deserializedSyndicationActionType:version:](self, "initWithChatGUID:syndicationStartDate:deserializedSyndicationActionType:version:", v5, v6, v7, v8);
  return v9;
}

- (IMChatSyndicationAction)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  IMChatSyndicationAction *v12;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sacg"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sasd"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFromNanoSeconds:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sat2"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedCharValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("savs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[IMChatSyndicationAction initWithChatGUID:syndicationStartDate:deserializedSyndicationActionType:version:](self, "initWithChatGUID:syndicationStartDate:deserializedSyndicationActionType:version:", v5, v8, v10, objc_msgSend(v11, "unsignedCharValue"));
  return v12;
}

- (BOOL)autoSyndicateMessages
{
  return -[IMSyndicationAction syndicationActionType](self, "syndicationActionType") == 4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unsigned)syndicatedItemType
{
  return 2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[IMSyndicationAction chatGUID](self, "chatGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSyndicationAction syndicationStartDate](self, "syndicationStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithChatGUID:syndicationStartDate:autoDonateMessages:version:", v5, v6, -[IMChatSyndicationAction autoSyndicateMessages](self, "autoSyndicateMessages"), -[IMSyndicationAction version](self, "version"));

  return v7;
}

- (BOOL)isAutoDonatingMessages
{
  return self->_autoDonateMessages;
}

@end
