@implementation CTStewieRoadsideTextMessage

- (CTStewieRoadsideTextMessage)initWithConversationIDInternal:(int64_t)a3 providerId:(int64_t)a4 sequenceNum:(int64_t)a5 text:(id)a6 maxTextLength:(unint64_t)a7 error:(id *)p_isa
{
  id v15;
  void *v16;
  CTStewieRoadsideTextMessage *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v15 = a6;
  v16 = v15;
  if ((unint64_t)a3 >= 0x100)
  {
    if (!p_isa)
      goto LABEL_19;
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v38 = *MEMORY[0x1E0CB2D50];
    v39[0] = CFSTR("Invalid conversationID");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v19);
    *p_isa = (id)objc_claimAutoreleasedReturnValue();

LABEL_18:
    p_isa = 0;
    goto LABEL_19;
  }
  if ((unint64_t)a5 >= 0x2000)
  {
    if (!p_isa)
      goto LABEL_19;
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v36 = *MEMORY[0x1E0CB2D50];
    v37 = CFSTR("Invalid sequenceNum");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v21);
    *p_isa = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
  if (!v15)
  {
    if (!p_isa)
      goto LABEL_19;
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0CB2D50];
    v35 = CFSTR("Text is missing");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v23);
    *p_isa = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
  if ((unint64_t)a4 >= 0x8000)
  {
    if (!p_isa)
      goto LABEL_19;
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0CB2D50];
    v33 = CFSTR("providerId is invalid");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v25);
    *p_isa = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
  if (objc_msgSend(v15, "lengthOfBytesUsingEncoding:", 4) - 1 >= a7)
  {
    if (!p_isa)
      goto LABEL_19;
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CB2D50];
    v31 = CFSTR("Invalid text length");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v27);
    *p_isa = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
  v29.receiver = self;
  v29.super_class = (Class)CTStewieRoadsideTextMessage;
  v17 = -[CTStewieRoadsideTextMessage init](&v29, sel_init);
  p_isa = (id *)&v17->super.isa;
  if (v17)
  {
    v17->_conversationID = a3;
    v17->_providerId = a4;
    v17->_sequenceNum = a5;
    objc_storeStrong((id *)&v17->_text, a6);
    self = p_isa;
    p_isa = (id *)&self->super.isa;
  }
  else
  {
    self = 0;
  }
LABEL_19:

  return (CTStewieRoadsideTextMessage *)p_isa;
}

- (CTStewieRoadsideTextMessage)initWithConversationID:(int64_t)a3 providerId:(int64_t)a4 sequenceNum:(int64_t)a5 text:(id)a6 error:(id *)a7
{
  return -[CTStewieRoadsideTextMessage initWithConversationIDInternal:providerId:sequenceNum:text:maxTextLength:error:](self, "initWithConversationIDInternal:providerId:sequenceNum:text:maxTextLength:error:", a3, a4, a5, a6, 160, a7);
}

- (id)initIncomingTextMessageWithConversationID:(int64_t)a3 providerId:(int64_t)a4 sequenceNum:(int64_t)a5 text:(id)a6 error:(id *)a7
{
  return -[CTStewieRoadsideTextMessage initWithConversationIDInternal:providerId:sequenceNum:text:maxTextLength:error:](self, "initWithConversationIDInternal:providerId:sequenceNum:text:maxTextLength:error:", a3, a4, a5, a6, 1024, a7);
}

- (double)estimatedSendTime
{
  void *v2;
  double v3;
  double v4;

  -[CTStewieRoadsideTextMessage text](self, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CTStewieRoadsideTextMessage estimatedSendTimeForRoadsideText:](CTStewieRoadsideTextMessage, "estimatedSendTimeForRoadsideText:", v2);
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

+ (double)estimatedSendTimeForRoadsideText:(id)a3
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

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", conversationID=%ld"), -[CTStewieRoadsideTextMessage conversationID](self, "conversationID"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", providerId=%ld"), -[CTStewieRoadsideTextMessage providerId](self, "providerId"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", sequenceNum=%ld"), -[CTStewieRoadsideTextMessage sequenceNum](self, "sequenceNum"));
  -[CTStewieRoadsideTextMessage text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", text=%{sensitive}@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (BOOL)isEqualToRoadsideTextMessage:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  v5 = -[CTStewieRoadsideTextMessage conversationID](self, "conversationID");
  if (v5 == objc_msgSend(v4, "conversationID")
    && (v6 = -[CTStewieRoadsideTextMessage providerId](self, "providerId"), v6 == objc_msgSend(v4, "providerId"))
    && (v7 = -[CTStewieRoadsideTextMessage sequenceNum](self, "sequenceNum"), v7 == objc_msgSend(v4, "sequenceNum")))
  {
    -[CTStewieRoadsideTextMessage text](self, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v9)
    {
      v12 = 1;
    }
    else
    {
      -[CTStewieRoadsideTextMessage text](self, "text");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "text");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  CTStewieRoadsideTextMessage *v4;
  BOOL v5;

  v4 = (CTStewieRoadsideTextMessage *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CTStewieRoadsideTextMessage isEqualToRoadsideTextMessage:](self, "isEqualToRoadsideTextMessage:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setConversationID:", -[CTStewieRoadsideTextMessage conversationID](self, "conversationID"));
  objc_msgSend(v5, "setProviderId:", -[CTStewieRoadsideTextMessage providerId](self, "providerId"));
  objc_msgSend(v5, "setSequenceNum:", -[CTStewieRoadsideTextMessage sequenceNum](self, "sequenceNum"));
  -[CTStewieRoadsideTextMessage text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setText:", v7);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[CTStewieRoadsideTextMessage conversationID](self, "conversationID"), CFSTR("conversationID"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[CTStewieRoadsideTextMessage providerId](self, "providerId"), CFSTR("providerId"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[CTStewieRoadsideTextMessage sequenceNum](self, "sequenceNum"), CFSTR("sequenceNum"));
  -[CTStewieRoadsideTextMessage text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("text"));

}

- (CTStewieRoadsideTextMessage)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  CTStewieRoadsideTextMessage *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("conversationID"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("providerId"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sequenceNum"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CTStewieRoadsideTextMessage initWithConversationIDInternal:providerId:sequenceNum:text:maxTextLength:error:](self, "initWithConversationIDInternal:providerId:sequenceNum:text:maxTextLength:error:", v5, v6, v7, v8, -1, 0);

  return v9;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
