@implementation SGConversationTurn

- (SGConversationTurn)initWithText:(id)a3 senderID:(id)a4 timestamp:(id)a5
{
  id v10;
  id v11;
  id v12;
  SGConversationTurn *v13;
  SGConversationTurn *v14;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGConversationTurn.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("text"));

  }
  v17.receiver = self;
  v17.super_class = (Class)SGConversationTurn;
  v13 = -[SGConversationTurn init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_text, a3);
    objc_storeStrong((id *)&v14->_senderID, a4);
    objc_storeStrong((id *)&v14->_timestamp, a5);
  }

  return v14;
}

- (SGConversationTurn)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  SGConversationTurn *v17;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = (void *)MEMORY[0x1E0D81610];
  sgLogHandle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v5, CFSTR("txt"), v4, 0, CFSTR("SGErrorDomain"), 11, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D81610];
  sgLogHandle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v5, CFSTR("sid"), v4, 0, CFSTR("SGErrorDomain"), 11, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D81610];
  v13 = objc_opt_class();
  sgLogHandle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v13, CFSTR("tsp"), v4, 0, CFSTR("SGErrorDomain"), 11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_msgSend(v4, "error"), v16 = (void *)objc_claimAutoreleasedReturnValue(), v16, !v16))
  {
    self = -[SGConversationTurn initWithText:senderID:timestamp:](self, "initWithText:senderID:timestamp:", v8, v11, v15);
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *text;
  id v5;

  text = self->_text;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", text, CFSTR("txt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_senderID, CFSTR("sid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timestamp, CFSTR("tsp"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  objc_opt_class();
  v5 = (_QWORD *)objc_opt_new();
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_text, "copyWithZone:", a3);
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = -[NSString copyWithZone:](self->_senderID, "copyWithZone:", a3);
    v9 = (void *)v5[2];
    v5[2] = v8;

    v10 = -[NSDate copyWithZone:](self->_timestamp, "copyWithZone:", a3);
    v11 = (void *)v5[3];
    v5[3] = v10;

  }
  return v5;
}

- (BOOL)isEqualToConversationTurn:(id)a3
{
  id v5;
  void *v6;
  id *v7;
  NSString *text;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  char v12;
  char v13;
  NSString *senderID;
  NSString *v15;
  NSString *v16;
  NSString *v17;
  char v18;
  NSDate *v19;
  NSDate *v20;
  void *v22;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (id *)v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGConversationTurn.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[otherTurn isKindOfClass:[SGConversationTurn class]]"));

    }
    text = self->_text;
    v9 = (NSString *)v7[1];
    if (text == v9)
    {

    }
    else
    {
      v10 = v9;
      v11 = text;
      v12 = -[NSString isEqual:](v11, "isEqual:", v10);

      if ((v12 & 1) == 0)
        goto LABEL_11;
    }
    senderID = self->_senderID;
    v15 = (NSString *)v7[2];
    if (senderID == v15)
    {

    }
    else
    {
      v16 = v15;
      v17 = senderID;
      v18 = -[NSString isEqual:](v17, "isEqual:", v16);

      if ((v18 & 1) == 0)
      {
LABEL_11:
        v13 = 0;
LABEL_17:

        goto LABEL_18;
      }
    }
    v19 = self->_timestamp;
    v20 = v19;
    if (v19 == v7[3])
      v13 = 1;
    else
      v13 = -[NSDate isEqual:](v19, "isEqual:");

    goto LABEL_17;
  }
  v13 = 0;
LABEL_18:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  SGConversationTurn *v4;
  SGConversationTurn *v5;
  BOOL v6;

  v4 = (SGConversationTurn *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGConversationTurn isEqualToConversationTurn:](self, "isEqualToConversationTurn:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_text, "hash");
  v4 = -[NSString hash](self->_senderID, "hash") - v3 + 32 * v3;
  return -[NSDate hash](self->_timestamp, "hash") - v4 + 32 * v4;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<SGConversationTurn txt_sz:%tu sid_sz:%tu tsp:%@>"), -[NSString length](self->_text, "length"), -[NSString length](self->_senderID, "length"), self->_timestamp);
}

- (NSString)text
{
  return self->_text;
}

- (NSString)senderID
{
  return self->_senderID;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_senderID, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
