@implementation SGMailHeaders

- (SGMailHeaders)initWithMessageId:(id)a3
{
  id v6;
  SGMailHeaders *v7;
  SGMailHeaders *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMailHeaders.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("messageId"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SGMailHeaders;
  v7 = -[SGMailHeaders init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_messageId, a3);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *messageId;
  id v5;

  messageId = self->_messageId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", messageId, CFSTR("messageId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subject, CFSTR("subject"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_from, CFSTR("from"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_to, CFSTR("to"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cc, CFSTR("cc"));

}

- (SGMailHeaders)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  SGMailHeaders *v31;
  SGMailHeaders *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  uint64_t v37;
  void *v39;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = objc_opt_class();
  sgLogHandle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v5, CFSTR("messageId"), v3, 1, CFSTR("SGErrorDomain"), 11, v6);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D81610];
  v8 = objc_opt_class();
  sgLogHandle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v8, CFSTR("subject"), v3, 0, CFSTR("SGErrorDomain"), 11, v9);
  v37 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D81610];
  v11 = (void *)MEMORY[0x1A8583A40]();
  v12 = objc_alloc(MEMORY[0x1E0C99E60]);
  v13 = objc_opt_class();
  v14 = (void *)objc_msgSend(v12, "initWithObjects:", v13, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v11);
  sgLogHandle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v14, CFSTR("from"), v3, 0, CFSTR("SGErrorDomain"), 11, v15);
  v36 = objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D81610];
  v17 = (void *)MEMORY[0x1A8583A40]();
  v18 = objc_alloc(MEMORY[0x1E0C99E60]);
  v19 = objc_opt_class();
  v20 = (void *)objc_msgSend(v18, "initWithObjects:", v19, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v17);
  sgLogHandle();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v20, CFSTR("to"), v3, 0, CFSTR("SGErrorDomain"), 11, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0D81610];
  v24 = (void *)MEMORY[0x1A8583A40]();
  v25 = objc_alloc(MEMORY[0x1E0C99E60]);
  v26 = objc_opt_class();
  v27 = (void *)objc_msgSend(v25, "initWithObjects:", v26, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v24);
  sgLogHandle();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v27, CFSTR("cc"), v3, 0, CFSTR("SGErrorDomain"), 11, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39 && (objc_msgSend(v3, "error"), v30 = (void *)objc_claimAutoreleasedReturnValue(), v30, !v30))
  {
    v31 = -[SGMailHeaders initWithMessageId:]([SGMailHeaders alloc], "initWithMessageId:", v39);
    v33 = (void *)v37;
    -[SGMailHeaders setSubject:](v31, "setSubject:", v37);
    v34 = (void *)v36;
    -[SGMailHeaders setFrom:](v31, "setFrom:", v36);
    -[SGMailHeaders setTo:](v31, "setTo:", v22);
    -[SGMailHeaders setCc:](v31, "setCc:", v29);
    v32 = self;
  }
  else
  {
    v31 = 0;
    v33 = (void *)v37;
    v32 = self;
    v34 = (void *)v36;
  }

  return v31;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<SGMailHeaders %@: %@>"), self->_messageId, self->_subject);
}

- (NSString)messageId
{
  return self->_messageId;
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)from
{
  return self->_from;
}

- (void)setFrom:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)to
{
  return self->_to;
}

- (void)setTo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)cc
{
  return self->_cc;
}

- (void)setCc:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cc, 0);
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_from, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_messageId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
