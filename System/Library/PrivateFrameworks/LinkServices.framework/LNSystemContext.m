@implementation LNSystemContext

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)objc_opt_new();
  -[LNSystemContext preciseTimestamp](self, "preciseTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreciseTimestamp:", v6);

  -[LNSystemContext staccatoInteractionType](self, "staccatoInteractionType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStaccatoInteractionType:", v7);

  -[LNSystemContext encodedCaptureAppContext](self, "encodedCaptureAppContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setEncodedCaptureAppContext:", v9);

  -[LNSystemContext assistantContext](self, "assistantContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setAssistantContext:", v11);

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3578];
  -[LNSystemContext preciseTimestamp](self, "preciseTimestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringFromDate:dateStyle:timeStyle:", v7, 1, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNSystemContext staccatoInteractionType](self, "staccatoInteractionType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNSystemContext assistantContext](self, "assistantContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, preciseTimestamp: %@, staccatoInteractionType: %@, assistantContext: %@>"), v5, self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[LNSystemContext preciseTimestamp](self, "preciseTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("preciseTimestamp"));

  -[LNSystemContext staccatoInteractionType](self, "staccatoInteractionType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("staccatoInteractionType"));

  -[LNSystemContext encodedCaptureAppContext](self, "encodedCaptureAppContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("encodedCaptureAppContext"));

  -[LNSystemContext assistantContext](self, "assistantContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("assistantContext"));

}

- (LNSystemContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  LNSystemContext *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preciseTimestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (LNSystemContext *)objc_opt_new();
  -[LNSystemContext setPreciseTimestamp:](v6, "setPreciseTimestamp:", v5);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("staccatoInteractionType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNSystemContext setStaccatoInteractionType:](v6, "setStaccatoInteractionType:", v7);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encodedCaptureAppContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNSystemContext setEncodedCaptureAppContext:](v6, "setEncodedCaptureAppContext:", v8);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assistantContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[LNSystemContext setAssistantContext:](v6, "setAssistantContext:", v9);
  return v6;
}

- (NSDate)preciseTimestamp
{
  return self->_preciseTimestamp;
}

- (void)setPreciseTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)staccatoInteractionType
{
  return self->_staccatoInteractionType;
}

- (void)setStaccatoInteractionType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (LNAssistantContext)assistantContext
{
  return self->_assistantContext;
}

- (void)setAssistantContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)encodedCaptureAppContext
{
  return self->_encodedCaptureAppContext;
}

- (void)setEncodedCaptureAppContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedCaptureAppContext, 0);
  objc_storeStrong((id *)&self->_assistantContext, 0);
  objc_storeStrong((id *)&self->_staccatoInteractionType, 0);
  objc_storeStrong((id *)&self->_preciseTimestamp, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
