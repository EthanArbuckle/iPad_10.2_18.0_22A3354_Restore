@implementation CTStewieRoadsideStartMessage

- (CTStewieRoadsideStartMessage)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  _anonymous_namespace_ *v15;
  _anonymous_namespace_ *v16;
  void *v17;
  void *v18;
  void *v19;
  CTStewieRoadsideStartMessage *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  CTStewieRoadsideStartMessage *v28;
  CTStewieRoadsideStartMessage *v29;
  uint64_t v30;
  NSData *serializedQuestionnaireAnswers;
  objc_super v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  const __CFString *v39;
  uint64_t v40;
  const __CFString *v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  const __CFString *v45;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
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
        objc_msgSend(v7, "valueForKey:", CFSTR("providerId"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          v13 = objc_msgSend(v11, "integerValue");
          if (v13 < 0x8000)
          {
            objc_msgSend(v7, "valueForKey:", CFSTR("isPayPerUse"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v14)
            {
              if (!a4)
              {
                v20 = 0;
                goto LABEL_35;
              }
              v27 = (void *)MEMORY[0x1E0CB35C8];
              v36 = *MEMORY[0x1E0CB2D50];
              v37 = CFSTR("isPayPerUseNum is missing");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
              v16 = (_anonymous_namespace_ *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v16);
              v20 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_34;
            }
            objc_msgSend(v7, "valueForKey:", CFSTR("phoneNumber"));
            v15 = (_anonymous_namespace_ *)objc_claimAutoreleasedReturnValue();
            v16 = v15;
            if (v15)
            {
              if (-[_anonymous_namespace_ length](v15, "length"))
              {
                {
                  if (a4)
                  {
                    v17 = (void *)MEMORY[0x1E0CB35C8];
                    v34 = *MEMORY[0x1E0CB2D50];
                    v35 = CFSTR("phoneNumber is invalid. Phone number can only contain digits and must be of length <= 15");
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v18);
                    *a4 = (id)objc_claimAutoreleasedReturnValue();

                  }
                  goto LABEL_33;
                }
              }
              else
              {

                v16 = 0;
              }
            }
            v33.receiver = self;
            v33.super_class = (Class)CTStewieRoadsideStartMessage;
            v28 = -[CTStewieRoadsideStartMessage init](&v33, sel_init);
            v29 = v28;
            if (v28)
            {
              v28->_conversationID = v10;
              v28->_providerId = v13;
              v28->_isPayPerUse = objc_msgSend(v14, "BOOLValue");
              objc_msgSend(v7, "valueForKey:", CFSTR("serializedQuestionnaireAnswers"));
              v30 = objc_claimAutoreleasedReturnValue();
              serializedQuestionnaireAnswers = v29->_serializedQuestionnaireAnswers;
              v29->_serializedQuestionnaireAnswers = (NSData *)v30;

              objc_storeStrong((id *)&v29->_phoneNumber, v16);
              self = v29;
              v20 = self;
LABEL_34:

              goto LABEL_35;
            }
            self = 0;
LABEL_33:
            v20 = 0;
            goto LABEL_34;
          }
          if (a4)
          {
            v26 = (void *)MEMORY[0x1E0CB35C8];
            v38 = *MEMORY[0x1E0CB2D50];
            v39 = CFSTR("providerId is invalid");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v14);
            v25 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_25;
          }
        }
        else if (a4)
        {
          v24 = (void *)MEMORY[0x1E0CB35C8];
          v40 = *MEMORY[0x1E0CB2D50];
          v41 = CFSTR("providerIdNum is missing");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v14);
          v25 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:
          v20 = 0;
          *a4 = v25;
LABEL_35:

          goto LABEL_36;
        }
        v20 = 0;
LABEL_36:

        goto LABEL_37;
      }
      if (a4)
      {
        v23 = (void *)MEMORY[0x1E0CB35C8];
        v42 = *MEMORY[0x1E0CB2D50];
        v43 = CFSTR("conversationID is invalid");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v12);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
    }
    else if (a4)
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v44 = *MEMORY[0x1E0CB2D50];
      v45 = CFSTR("conversationID is missing");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v12);
      v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
      v20 = 0;
      *a4 = v22;
      goto LABEL_36;
    }
    v20 = 0;
LABEL_37:

    goto LABEL_38;
  }
  if (a4)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v46 = *MEMORY[0x1E0CB2D50];
    v47[0] = CFSTR("Empty dictionary");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v9);
    v20 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  v20 = 0;
LABEL_38:

  return v20;
}

- (NSString)description
{
  void *v2;
  void *v4;
  _BOOL4 v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(", conversationID=%ld"), -[CTStewieRoadsideStartMessage conversationID](self, "conversationID"));
  objc_msgSend(v4, "appendFormat:", CFSTR(", providerId=%ld"), -[CTStewieRoadsideStartMessage providerId](self, "providerId"));
  v5 = -[CTStewieRoadsideStartMessage isPayPerUse](self, "isPayPerUse");
  v6 = "no";
  if (v5)
    v6 = "yes";
  objc_msgSend(v4, "appendFormat:", CFSTR(", isPayPerUse=%s"), v6);
  -[CTStewieRoadsideStartMessage serializedQuestionnaireAnswers](self, "serializedQuestionnaireAnswers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[CTStewieRoadsideStartMessage serializedQuestionnaireAnswers](self, "serializedQuestionnaireAnswers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v2, "length");
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v4, "appendFormat:", CFSTR(", serializedQuestionnaireAnswers length=%lu"), v8);
  if (v7)

  -[CTStewieRoadsideStartMessage phoneNumber](self, "phoneNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[CTStewieRoadsideStartMessage phoneNumber](self, "phoneNumber");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v2, "length");
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v4, "appendFormat:", CFSTR(", phoneNumber length=%lu"), v10);
  if (v9)

  objc_msgSend(v4, "appendString:", CFSTR(">"));
  return (NSString *)v4;
}

- (BOOL)isEqualToRoadsideStartMessage:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  int64_t v7;
  void *v8;
  void *v9;
  char v10;
  int v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = -[CTStewieRoadsideStartMessage conversationID](self, "conversationID");
  if (v7 == objc_msgSend(v6, "conversationID"))
  {
    -[CTStewieRoadsideStartMessage serializedQuestionnaireAnswers](self, "serializedQuestionnaireAnswers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serializedQuestionnaireAnswers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v9
      || (-[CTStewieRoadsideStartMessage serializedQuestionnaireAnswers](self, "serializedQuestionnaireAnswers"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "serializedQuestionnaireAnswers"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqual:", v4)))
    {
      v11 = -[CTStewieRoadsideStartMessage isPayPerUse](self, "isPayPerUse");
      if (v11 == objc_msgSend(v6, "isPayPerUse")
        && (v12 = -[CTStewieRoadsideStartMessage providerId](self, "providerId"), v12 == objc_msgSend(v6, "providerId")))
      {
        -[CTStewieRoadsideStartMessage phoneNumber](self, "phoneNumber");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "phoneNumber");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13 == v14)
        {

          v10 = 1;
        }
        else
        {
          -[CTStewieRoadsideStartMessage phoneNumber](self, "phoneNumber");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "phoneNumber");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v15, "isEqualToString:", v16);

        }
      }
      else
      {
        v10 = 0;
      }
      if (v8 == v9)
        goto LABEL_13;
    }
    else
    {
      v10 = 0;
    }

LABEL_13:
    goto LABEL_14;
  }
  v10 = 0;
LABEL_14:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CTStewieRoadsideStartMessage *v4;
  BOOL v5;

  v4 = (CTStewieRoadsideStartMessage *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CTStewieRoadsideStartMessage isEqualToRoadsideStartMessage:](self, "isEqualToRoadsideStartMessage:", v4);
  }

  return v5;
}

- (double)estimatedSendTime
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  -[CTStewieRoadsideStartMessage phoneNumber](self, "phoneNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTStewieRoadsideStartMessage serializedQuestionnaireAnswers](self, "serializedQuestionnaireAnswers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CTStewieRoadsideStartMessage serializedQuestionnaireAnswers](self, "serializedQuestionnaireAnswers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

  }
  else
  {
    v6 = 0;
  }
  v7 = 18;
  if (!v3)
    v7 = 12;
  v8 = v6 + v7;

  return getEstimatedSendTimeOverStewieInSeconds(v8);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setConversationID:", -[CTStewieRoadsideStartMessage conversationID](self, "conversationID"));
  objc_msgSend(v5, "setProviderId:", -[CTStewieRoadsideStartMessage providerId](self, "providerId"));
  objc_msgSend(v5, "setIsPayPerUse:", -[CTStewieRoadsideStartMessage isPayPerUse](self, "isPayPerUse"));
  -[CTStewieRoadsideStartMessage serializedQuestionnaireAnswers](self, "serializedQuestionnaireAnswers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setSerializedQuestionnaireAnswers:", v7);

  -[CTStewieRoadsideStartMessage phoneNumber](self, "phoneNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setPhoneNumber:", v9);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", -[CTStewieRoadsideStartMessage conversationID](self, "conversationID"), CFSTR("conversationID"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[CTStewieRoadsideStartMessage providerId](self, "providerId"), CFSTR("providerId"));
  objc_msgSend(v6, "encodeBool:forKey:", -[CTStewieRoadsideStartMessage isPayPerUse](self, "isPayPerUse"), CFSTR("isPayPerUse"));
  -[CTStewieRoadsideStartMessage serializedQuestionnaireAnswers](self, "serializedQuestionnaireAnswers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("serializedQuestionnaireAnswers"));

  -[CTStewieRoadsideStartMessage phoneNumber](self, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("phoneNumber"));

}

- (CTStewieRoadsideStartMessage)initWithCoder:(id)a3
{
  id v4;
  CTStewieRoadsideStartMessage *v5;
  void *v6;
  void *v7;
  CTStewieRoadsideStartMessage *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTStewieRoadsideStartMessage;
  v5 = -[CTStewieRoadsideStartMessage init](&v10, sel_init);
  if (v5)
  {
    -[CTStewieRoadsideStartMessage setConversationID:](v5, "setConversationID:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("conversationID")));
    -[CTStewieRoadsideStartMessage setProviderId:](v5, "setProviderId:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("providerId")));
    -[CTStewieRoadsideStartMessage setIsPayPerUse:](v5, "setIsPayPerUse:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPayPerUse")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serializedQuestionnaireAnswers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTStewieRoadsideStartMessage setSerializedQuestionnaireAnswers:](v5, "setSerializedQuestionnaireAnswers:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTStewieRoadsideStartMessage setPhoneNumber:](v5, "setPhoneNumber:", v7);

    v8 = v5;
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

- (int64_t)providerId
{
  return self->_providerId;
}

- (void)setProviderId:(int64_t)a3
{
  self->_providerId = a3;
}

- (BOOL)isPayPerUse
{
  return self->_isPayPerUse;
}

- (void)setIsPayPerUse:(BOOL)a3
{
  self->_isPayPerUse = a3;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (NSData)serializedQuestionnaireAnswers
{
  return self->_serializedQuestionnaireAnswers;
}

- (void)setSerializedQuestionnaireAnswers:(id)a3
{
  objc_storeStrong((id *)&self->_serializedQuestionnaireAnswers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedQuestionnaireAnswers, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end
