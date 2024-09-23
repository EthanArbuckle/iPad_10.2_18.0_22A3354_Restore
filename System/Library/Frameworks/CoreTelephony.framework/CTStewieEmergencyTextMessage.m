@implementation CTStewieEmergencyTextMessage

- (CTStewieEmergencyTextMessage)initWithConversationIDInternal:(int64_t)a3 sequenceNum:(int64_t)a4 emergencyText:(id)a5 maxTextLength:(unint64_t)a6 error:(id *)p_isa
{
  id v13;
  void *v14;
  CTStewieEmergencyTextMessage *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = v13;
  if ((unint64_t)a3 >= 0x100)
  {
    if (!p_isa)
      goto LABEL_16;
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0CB2D50];
    v33[0] = CFSTR("Invalid conversationID");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v17);
    *p_isa = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
    p_isa = 0;
    goto LABEL_16;
  }
  if ((unint64_t)a4 >= 0x2000)
  {
    if (!p_isa)
      goto LABEL_16;
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CB2D50];
    v31 = CFSTR("Invalid sequenceNum");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v19);
    *p_isa = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
  if (!v13)
  {
    if (!p_isa)
      goto LABEL_16;
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2D50];
    v29 = CFSTR("Text is missing");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v21);
    *p_isa = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
  if (objc_msgSend(v13, "lengthOfBytesUsingEncoding:", 4) - 1 >= a6)
  {
    if (!p_isa)
      goto LABEL_16;
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2D50];
    v27 = CFSTR("Invalid text length");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v23);
    *p_isa = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
  v25.receiver = self;
  v25.super_class = (Class)CTStewieEmergencyTextMessage;
  v15 = -[CTStewieEmergencyTextMessage init](&v25, sel_init);
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    v15->_conversationID = a3;
    v15->_sequenceNum = a4;
    objc_storeStrong((id *)&v15->_text, a5);
    p_isa[4] = 0;
    self = p_isa;
    p_isa = (id *)&self->super.isa;
  }
  else
  {
    self = 0;
  }
LABEL_16:

  return (CTStewieEmergencyTextMessage *)p_isa;
}

- (CTStewieEmergencyTextMessage)initWithConversationID:(int64_t)a3 sequenceNum:(int64_t)a4 emergencyText:(id)a5 error:(id *)a6
{
  return -[CTStewieEmergencyTextMessage initWithConversationIDInternal:sequenceNum:emergencyText:maxTextLength:error:](self, "initWithConversationIDInternal:sequenceNum:emergencyText:maxTextLength:error:", a3, a4, a5, 160, a6);
}

- (id)initIncomingTextMessageWithConversationID:(int64_t)a3 sequenceNum:(int64_t)a4 emergencyText:(id)a5 notifyOption:(int64_t)a6 error:(id *)a7
{
  CTStewieEmergencyTextMessage *v8;
  CTStewieEmergencyTextMessage *v9;
  CTStewieEmergencyTextMessage *v10;

  v8 = -[CTStewieEmergencyTextMessage initWithConversationIDInternal:sequenceNum:emergencyText:maxTextLength:error:](self, "initWithConversationIDInternal:sequenceNum:emergencyText:maxTextLength:error:", a3, a4, a5, 1024, a7);
  v9 = v8;
  if (v8)
  {
    v8->_incomingTextNotifyOption = a6;
    v10 = v8;
  }

  return v9;
}

- (double)estimatedSendTime
{
  void *v2;
  double v3;
  double v4;

  -[CTStewieEmergencyTextMessage text](self, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CTStewieEmergencyTextMessage estimatedSendTimeForEmergencyText:](CTStewieEmergencyTextMessage, "estimatedSendTimeForEmergencyText:", v2);
  v4 = v3;

  return v4;
}

+ (int64_t)maxLengthInBytesForOutgoingText
{
  return 160;
}

+ (int64_t)maxLengthInBytesForIncomingText
{
  return 1024;
}

+ (int64_t)maxSequenceNum
{
  return 0x1FFFLL;
}

+ (double)estimatedSendTimeForEmergencyText:(id)a3
{
  id v3;
  void *v4;
  double EstimatedSendTimeOverStewieInSeconds;
  uint64_t v6;

  v3 = a3;
  v4 = v3;
  EstimatedSendTimeOverStewieInSeconds = 0.0;
  if (v3)
  {
    v6 = objc_msgSend(v3, "lengthOfBytesUsingEncoding:", 4);
    if (v6)
      EstimatedSendTimeOverStewieInSeconds = getEstimatedSendTimeOverStewieInSeconds(v6 + 4);
  }

  return EstimatedSendTimeOverStewieInSeconds;
}

- (NSString)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  const char *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", conversationID=%ld"), -[CTStewieEmergencyTextMessage conversationID](self, "conversationID"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", sequenceNum=%ld"), -[CTStewieEmergencyTextMessage sequenceNum](self, "sequenceNum"));
  -[CTStewieEmergencyTextMessage text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", text=%{sensitive}@"), v4);

  v5 = -[CTStewieEmergencyTextMessage incomingTextNotifyOption](self, "incomingTextNotifyOption");
  if (v5 > 3)
    v6 = "???";
  else
    v6 = off_1E1530DC0[v5];
  objc_msgSend(v3, "appendFormat:", CFSTR(", incomingTextNotifyOption=%s"), v6);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (BOOL)isEqualToEmergencyTextMessage:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  int64_t v12;

  v6 = a3;
  v7 = -[CTStewieEmergencyTextMessage conversationID](self, "conversationID");
  if (v7 == objc_msgSend(v6, "conversationID"))
  {
    v8 = -[CTStewieEmergencyTextMessage sequenceNum](self, "sequenceNum");
    if (v8 == objc_msgSend(v6, "sequenceNum"))
    {
      -[CTStewieEmergencyTextMessage text](self, "text");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "text");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 == v10
        || (-[CTStewieEmergencyTextMessage text](self, "text"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v6, "text"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqual:", v4)))
      {
        v12 = -[CTStewieEmergencyTextMessage incomingTextNotifyOption](self, "incomingTextNotifyOption");
        v11 = v12 == objc_msgSend(v6, "incomingTextNotifyOption");
        if (v9 == v10)
        {
LABEL_9:

          goto LABEL_10;
        }
      }
      else
      {
        v11 = 0;
      }

      goto LABEL_9;
    }
  }
  v11 = 0;
LABEL_10:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  CTStewieEmergencyTextMessage *v4;
  BOOL v5;

  v4 = (CTStewieEmergencyTextMessage *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CTStewieEmergencyTextMessage isEqualToEmergencyTextMessage:](self, "isEqualToEmergencyTextMessage:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setConversationID:", -[CTStewieEmergencyTextMessage conversationID](self, "conversationID"));
  objc_msgSend(v5, "setSequenceNum:", -[CTStewieEmergencyTextMessage sequenceNum](self, "sequenceNum"));
  -[CTStewieEmergencyTextMessage text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setText:", v7);

  objc_msgSend(v5, "setIncomingTextNotifyOption:", -[CTStewieEmergencyTextMessage incomingTextNotifyOption](self, "incomingTextNotifyOption"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[CTStewieEmergencyTextMessage conversationID](self, "conversationID"), CFSTR("conversationID"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[CTStewieEmergencyTextMessage sequenceNum](self, "sequenceNum"), CFSTR("sequenceNum"));
  -[CTStewieEmergencyTextMessage text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("text"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[CTStewieEmergencyTextMessage incomingTextNotifyOption](self, "incomingTextNotifyOption"), CFSTR("notifyOption"));
}

- (CTStewieEmergencyTextMessage)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  CTStewieEmergencyTextMessage *v8;
  CTStewieEmergencyTextMessage *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("conversationID"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sequenceNum"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CTStewieEmergencyTextMessage initWithConversationIDInternal:sequenceNum:emergencyText:maxTextLength:error:](self, "initWithConversationIDInternal:sequenceNum:emergencyText:maxTextLength:error:", v5, v6, v7, -1, 0);

  if (v8)
  {
    v8->_incomingTextNotifyOption = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("notifyOption"));
    v9 = v8;
  }

  return v8;
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

- (int64_t)sequenceNum
{
  return self->_sequenceNum;
}

- (void)setSequenceNum:(int64_t)a3
{
  self->_sequenceNum = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (int64_t)incomingTextNotifyOption
{
  return self->_incomingTextNotifyOption;
}

- (void)setIncomingTextNotifyOption:(int64_t)a3
{
  self->_incomingTextNotifyOption = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
