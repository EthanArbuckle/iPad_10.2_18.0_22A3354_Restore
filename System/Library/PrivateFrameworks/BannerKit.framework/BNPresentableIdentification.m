@implementation BNPresentableIdentification

+ (id)identificationWithRequesterIdentifier:(id)a3 requestIdentifier:(id)a4 uniqueIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequesterIdentifier:requestIdentifier:uniqueIdentifier:", v10, v9, v8);

  return v11;
}

+ (id)identificationWithRequesterIdentifier:(id)a3 requestIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequesterIdentifier:requestIdentifier:uniqueIdentifier:", v7, v6, 0);

  return v8;
}

+ (id)identificationWithRequesterIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequesterIdentifier:requestIdentifier:uniqueIdentifier:", v4, 0, 0);

  return v5;
}

+ (id)uniqueIdentificationForPresentable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "requesterIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "requestIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "uniquePresentableIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_14;
  }
  else
  {
    v7 = 0;
    if (v5)
    {
LABEL_14:
      v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequesterIdentifier:requestIdentifier:uniqueIdentifier:", v5, v6, v7);
      goto LABEL_15;
    }
  }
  if (v6 || v7)
    goto LABEL_14;
  v8 = 0;
LABEL_15:

  return v8;
}

+ (id)genericIdentificationForPresentable:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "requesterIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "requestIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (v5 | v6)
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequesterIdentifier:requestIdentifier:uniqueIdentifier:", v5, v6, 0);
  else
    v7 = 0;

  return v7;
}

+ (id)requesterIdentificationForPresentable:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v4, "requesterIdentifier"), (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequesterIdentifier:requestIdentifier:uniqueIdentifier:", v5, 0, 0);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BNPresentableIdentification)initWithRequesterIdentifier:(id)a3 requestIdentifier:(id)a4 uniqueIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  BNPresentableIdentification *v12;
  uint64_t v13;
  NSString *requesterIdentifier;
  uint64_t v15;
  NSString *requestIdentifier;
  uint64_t v17;
  NSUUID *uniquePresentableIdentifier;
  void *v20;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNPresentableIdentification.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requesterID"));

  }
  v21.receiver = self;
  v21.super_class = (Class)BNPresentableIdentification;
  v12 = -[BNPresentableIdentification init](&v21, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    requesterIdentifier = v12->_requesterIdentifier;
    v12->_requesterIdentifier = (NSString *)v13;

    v15 = objc_msgSend(v10, "copy");
    requestIdentifier = v12->_requestIdentifier;
    v12->_requestIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    uniquePresentableIdentifier = v12->_uniquePresentableIdentifier;
    v12->_uniquePresentableIdentifier = (NSUUID *)v17;

  }
  return v12;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  NSString *requesterIdentifier;
  id v5;

  requesterIdentifier = self->_requesterIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", requesterIdentifier, CFSTR("requesterIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestIdentifier, CFSTR("requestIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uniquePresentableIdentifier, CFSTR("uniquePresentableIdentifier"));

}

- (BNPresentableIdentification)initWithBSXPCCoder:(id)a3
{
  id v4;
  BNPresentableIdentification *v5;
  uint64_t v6;
  NSString *requesterIdentifier;
  uint64_t v8;
  NSString *requestIdentifier;
  uint64_t v10;
  NSUUID *uniquePresentableIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BNPresentableIdentification;
  v5 = -[BNPresentableIdentification init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requesterIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    requesterIdentifier = v5->_requesterIdentifier;
    v5->_requesterIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniquePresentableIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    uniquePresentableIdentifier = v5->_uniquePresentableIdentifier;
    v5->_uniquePresentableIdentifier = (NSUUID *)v10;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRequesterIdentifier:requestIdentifier:uniqueIdentifier:", self->_requesterIdentifier, self->_requestIdentifier, self->_uniquePresentableIdentifier);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; requesterIdentifier: %@; requestIdentifier: %@; uniquePresentableIdentifier: %@>"),
                       objc_opt_class(),
                       self,
                       self->_requesterIdentifier,
                       self->_requestIdentifier,
                       self->_uniquePresentableIdentifier);
}

- (NSString)requesterIdentifier
{
  return self->_requesterIdentifier;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSUUID)uniquePresentableIdentifier
{
  return self->_uniquePresentableIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniquePresentableIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_requesterIdentifier, 0);
}

@end
