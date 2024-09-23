@implementation AFSiriRequest

- (id)_af_analyticsContextDescription
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 7);
  -[AFSiriRequest _originatingAceID](self, "_originatingAceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("intentRequestId"));

  return v3;
}

- (id)_initWithOriginatingAceID:(id)a3 identifier:(id)a4 turnId:(id)a5
{
  id v9;
  id v10;
  id v11;
  AFSiriRequest *v12;
  uint64_t v13;
  NSString *originatingAceID;
  uint64_t v15;
  NSUUID *identifier;
  uint64_t v17;
  NSUUID *turnId;
  void *v20;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFSiriRequest.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v21.receiver = self;
  v21.super_class = (Class)AFSiriRequest;
  v12 = -[AFSiriRequest init](&v21, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    originatingAceID = v12->_originatingAceID;
    v12->_originatingAceID = (NSString *)v13;

    v15 = objc_msgSend(v10, "copy");
    identifier = v12->_identifier;
    v12->_identifier = (NSUUID *)v15;

    v17 = objc_msgSend(v11, "copy");
    turnId = v12->_turnId;
    v12->_turnId = (NSUUID *)v17;

  }
  return v12;
}

- (id)_initWithOriginatingAceID:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  v8 = -[AFSiriRequest _initWithOriginatingAceID:identifier:turnId:](self, "_initWithOriginatingAceID:identifier:turnId:", v5, v6, v7);

  return v8;
}

- (AFSiriRequest)init
{
  id v3;
  id v4;
  AFSiriRequest *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  v4 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  v5 = -[AFSiriRequest _initWithOriginatingAceID:identifier:turnId:](self, "_initWithOriginatingAceID:identifier:turnId:", 0, v3, v4);

  return v5;
}

- (id)description
{
  return -[AFSiriRequest _descriptionWithProperties:](self, "_descriptionWithProperties:", MEMORY[0x1E0C9AA70]);
}

- (id)_descriptionWithProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("<"));
  objc_msgSend((id)objc_opt_class(), "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v6);

  objc_msgSend(v5, "appendFormat:", CFSTR(": %p;"), self);
  objc_msgSend(v5, "appendString:", CFSTR(" \"));
  -[AFSiriRequest requestName](self, "requestName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v7);

  objc_msgSend(v5, "appendString:", CFSTR("\"));
  objc_msgSend(v5, "appendString:", CFSTR(" "));
  -[NSUUID UUIDString](self->_identifier, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v8);

  objc_msgSend(v5, "appendString:", CFSTR("\"));
  if (self->_turnId)
  {
    objc_msgSend(v5, "appendString:", CFSTR("turnId: \"));
    -[NSUUID UUIDString](self->_turnId, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v9);

    objc_msgSend(v5, "appendString:", CFSTR("\"));
  }
  if (-[NSString length](self->_originatingAceID, "length"))
  {
    objc_msgSend(v5, "appendString:", CFSTR("OriginatingAceID: "));
    objc_msgSend(v5, "appendString:", self->_originatingAceID);
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__AFSiriRequest__descriptionWithProperties___block_invoke;
  v12[3] = &unk_1E3A31E48;
  v10 = v5;
  v13 = v10;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v12);
  objc_msgSend(v10, "appendString:", CFSTR(">"));

  return v10;
}

- (id)requestName
{
  objc_class *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_af_stringByRemovingPrefixWithLength:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_af_stringByRemovingSuffix:", CFSTR("Request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_identifier
{
  return self->_identifier;
}

- (NSUUID)_turnId
{
  return self->_turnId;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("SiriRequestIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originatingAceID, CFSTR("SiriRequestOriginatingAceIDIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_turnId, CFSTR("SiriRequestOriginatingTurnIdentifier"));

}

- (AFSiriRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  AFSiriRequest *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SiriRequestIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SiriRequestOriginatingTurnIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SiriRequestOriginatingAceIDIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[AFSiriRequest _initWithOriginatingAceID:identifier:turnId:](self, "_initWithOriginatingAceID:identifier:turnId:", v7, v5, v6);
  return v8;
}

- (BOOL)_makeAppFrontmost
{
  return 1;
}

- (NSString)_originatingAceID
{
  return self->_originatingAceID;
}

- (void)_setOriginatingAceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)_setTurnId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)_refId
{
  return self->__refId;
}

- (void)_setRefId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__refId, 0);
  objc_storeStrong((id *)&self->_turnId, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_originatingAceID, 0);
}

void __44__AFSiriRequest__descriptionWithProperties___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "appendString:", CFSTR("; "));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v7);

  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("="));
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v6, "description");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "appendString:", v9);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
