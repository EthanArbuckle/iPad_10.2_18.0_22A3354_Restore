@implementation CTStewieEmergencyStartMessage

- (CTStewieEmergencyStartMessage)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  CTStewieEmergencyStartMessage *v13;
  CTStewieEmergencyStartMessage *v14;
  uint64_t v15;
  NSData *serializedQuestionnaireAnswers;
  CTStewieEmergencyStartMessage *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "valueForKey:", CFSTR("conversationID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = objc_msgSend(v8, "integerValue");
      if (v10 < 0x100)
      {
        objc_msgSend(v7, "valueForKey:", CFSTR("notifyOption"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          if (!a4)
          {
            v17 = 0;
            goto LABEL_24;
          }
          v22 = (void *)MEMORY[0x1E0CB35C8];
          v29 = *MEMORY[0x1E0CB2D50];
          v30 = CFSTR("notifyOption is missing");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v12);
          v17 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        }
        objc_msgSend(v7, "valueForKey:", CFSTR("shareEED"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v26.receiver = self;
          v26.super_class = (Class)CTStewieEmergencyStartMessage;
          v13 = -[CTStewieEmergencyStartMessage init](&v26, sel_init);
          v14 = v13;
          if (v13)
          {
            v13->_conversationID = v10;
            objc_msgSend(v7, "valueForKey:", CFSTR("serializedQuestionnaireAnswers"));
            v15 = objc_claimAutoreleasedReturnValue();
            serializedQuestionnaireAnswers = v14->_serializedQuestionnaireAnswers;
            v14->_serializedQuestionnaireAnswers = (NSData *)v15;

            v14->_notifyOption = objc_msgSend(v11, "integerValue");
            v14->_shareEED = objc_msgSend(v12, "BOOLValue");
            self = v14;
            v17 = self;
LABEL_23:

            goto LABEL_24;
          }
          self = 0;
        }
        else if (a4)
        {
          v23 = (void *)MEMORY[0x1E0CB35C8];
          v27 = *MEMORY[0x1E0CB2D50];
          v28 = CFSTR("shareEED is missing");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v24);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
        v17 = 0;
        goto LABEL_23;
      }
      if (a4)
      {
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v31 = *MEMORY[0x1E0CB2D50];
        v32 = CFSTR("conversationID is invalid");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v11);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
    }
    else if (a4)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v33 = *MEMORY[0x1E0CB2D50];
      v34 = CFSTR("conversationID is missing");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v11);
      v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
      v17 = 0;
      *a4 = v20;
LABEL_24:

      goto LABEL_25;
    }
    v17 = 0;
LABEL_25:

    goto LABEL_26;
  }
  if (a4)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2D50];
    v36[0] = CFSTR("Empty dictionary");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v9);
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  v17 = 0;
LABEL_26:

  return v17;
}

- (NSString)description
{
  void *v2;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  const char *v8;
  _BOOL4 v9;
  const char *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(", conversationID=%ld"), -[CTStewieEmergencyStartMessage conversationID](self, "conversationID"));
  -[CTStewieEmergencyStartMessage serializedQuestionnaireAnswers](self, "serializedQuestionnaireAnswers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CTStewieEmergencyStartMessage serializedQuestionnaireAnswers](self, "serializedQuestionnaireAnswers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v2, "length");
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v4, "appendFormat:", CFSTR(", serializedQuestionnaireAnswers length=%lu"), v6);
  if (v5)

  v7 = -[CTStewieEmergencyStartMessage notifyOption](self, "notifyOption");
  if (v7 > 3)
    v8 = "???";
  else
    v8 = off_1E1530DC0[v7];
  objc_msgSend(v4, "appendFormat:", CFSTR(", notifyOption=%s"), v8);
  v9 = -[CTStewieEmergencyStartMessage shareEED](self, "shareEED");
  v10 = "no";
  if (v9)
    v10 = "yes";
  objc_msgSend(v4, "appendFormat:", CFSTR(", shareEED=%s"), v10);
  objc_msgSend(v4, "appendString:", CFSTR(">"));
  return (NSString *)v4;
}

- (BOOL)isEqualToEmergencyStartMessage:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  int64_t v7;
  void *v8;
  void *v9;
  int v10;
  int64_t v11;
  _BOOL4 v12;

  v6 = a3;
  v7 = -[CTStewieEmergencyStartMessage conversationID](self, "conversationID");
  if (v7 == objc_msgSend(v6, "conversationID"))
  {
    -[CTStewieEmergencyStartMessage serializedQuestionnaireAnswers](self, "serializedQuestionnaireAnswers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serializedQuestionnaireAnswers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v9
      || (-[CTStewieEmergencyStartMessage serializedQuestionnaireAnswers](self, "serializedQuestionnaireAnswers"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "serializedQuestionnaireAnswers"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqual:", v4)))
    {
      v11 = -[CTStewieEmergencyStartMessage notifyOption](self, "notifyOption");
      if (v11 == objc_msgSend(v6, "notifyOption"))
      {
        v12 = -[CTStewieEmergencyStartMessage shareEED](self, "shareEED");
        v10 = v12 ^ objc_msgSend(v6, "shareEED") ^ 1;
      }
      else
      {
        LOBYTE(v10) = 0;
      }
      if (v8 == v9)
        goto LABEL_11;
    }
    else
    {
      LOBYTE(v10) = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  LOBYTE(v10) = 0;
LABEL_12:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CTStewieEmergencyStartMessage *v4;
  BOOL v5;

  v4 = (CTStewieEmergencyStartMessage *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CTStewieEmergencyStartMessage isEqualToEmergencyStartMessage:](self, "isEqualToEmergencyStartMessage:", v4);
  }

  return v5;
}

- (double)estimatedSendTime
{
  void *v2;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  uint64_t v7;
  unint64_t v8;

  -[CTStewieEmergencyStartMessage serializedQuestionnaireAnswers](self, "serializedQuestionnaireAnswers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CTStewieEmergencyStartMessage serializedQuestionnaireAnswers](self, "serializedQuestionnaireAnswers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v2, "length");
  }
  else
  {
    v5 = 0;
  }
  v6 = -[CTStewieEmergencyStartMessage shareEED](self, "shareEED");
  if (v4)

  v7 = 16;
  if (!v6)
    v7 = 0;
  v8 = v5 + v7 + 12;

  return getEstimatedSendTimeOverStewieInSeconds(v8);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setConversationID:", -[CTStewieEmergencyStartMessage conversationID](self, "conversationID"));
  -[CTStewieEmergencyStartMessage serializedQuestionnaireAnswers](self, "serializedQuestionnaireAnswers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setSerializedQuestionnaireAnswers:", v7);

  objc_msgSend(v5, "setNotifyOption:", -[CTStewieEmergencyStartMessage notifyOption](self, "notifyOption"));
  objc_msgSend(v5, "setShareEED:", -[CTStewieEmergencyStartMessage shareEED](self, "shareEED"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[CTStewieEmergencyStartMessage conversationID](self, "conversationID"), CFSTR("conversationID"));
  -[CTStewieEmergencyStartMessage serializedQuestionnaireAnswers](self, "serializedQuestionnaireAnswers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("serializedQuestionnaireAnswers"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[CTStewieEmergencyStartMessage notifyOption](self, "notifyOption"), CFSTR("notifyOption"));
  objc_msgSend(v5, "encodeBool:forKey:", -[CTStewieEmergencyStartMessage shareEED](self, "shareEED"), CFSTR("shareEED"));

}

- (CTStewieEmergencyStartMessage)initWithCoder:(id)a3
{
  id v4;
  CTStewieEmergencyStartMessage *v5;
  void *v6;
  CTStewieEmergencyStartMessage *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTStewieEmergencyStartMessage;
  v5 = -[CTStewieEmergencyStartMessage init](&v9, sel_init);
  if (v5)
  {
    -[CTStewieEmergencyStartMessage setConversationID:](v5, "setConversationID:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("conversationID")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serializedQuestionnaireAnswers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTStewieEmergencyStartMessage setSerializedQuestionnaireAnswers:](v5, "setSerializedQuestionnaireAnswers:", v6);

    -[CTStewieEmergencyStartMessage setNotifyOption:](v5, "setNotifyOption:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("notifyOption")));
    -[CTStewieEmergencyStartMessage setShareEED:](v5, "setShareEED:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shareEED")));
    v7 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(int64_t)a3
{
  self->_conversationID = a3;
}

- (NSData)serializedQuestionnaireAnswers
{
  return self->_serializedQuestionnaireAnswers;
}

- (void)setSerializedQuestionnaireAnswers:(id)a3
{
  objc_storeStrong((id *)&self->_serializedQuestionnaireAnswers, a3);
}

- (int64_t)notifyOption
{
  return self->_notifyOption;
}

- (void)setNotifyOption:(int64_t)a3
{
  self->_notifyOption = a3;
}

- (BOOL)shareEED
{
  return self->_shareEED;
}

- (void)setShareEED:(BOOL)a3
{
  self->_shareEED = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedQuestionnaireAnswers, 0);
}

@end
