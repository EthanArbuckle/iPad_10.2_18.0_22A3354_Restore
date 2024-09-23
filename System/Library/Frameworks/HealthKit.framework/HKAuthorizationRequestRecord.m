@implementation HKAuthorizationRequestRecord

- (HKAuthorizationRequestRecord)initWithSource:(id)a3 session:(id)a4 readTypes:(id)a5 writeTypes:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HKAuthorizationRequestRecord *v14;
  uint64_t v15;
  HKSource *source;
  uint64_t v17;
  NSUUID *sessionIdentifier;
  uint64_t v19;
  NSSet *typesRequiringReadAuthorization;
  uint64_t v21;
  NSSet *typesRequiringShareAuthorization;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HKAuthorizationRequestRecord;
  v14 = -[HKAuthorizationRequestRecord init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    source = v14->_source;
    v14->_source = (HKSource *)v15;

    v17 = objc_msgSend(v11, "copy");
    sessionIdentifier = v14->_sessionIdentifier;
    v14->_sessionIdentifier = (NSUUID *)v17;

    v19 = objc_msgSend(v12, "copy");
    typesRequiringReadAuthorization = v14->_typesRequiringReadAuthorization;
    v14->_typesRequiringReadAuthorization = (NSSet *)v19;

    v21 = objc_msgSend(v13, "copy");
    typesRequiringShareAuthorization = v14->_typesRequiringShareAuthorization;
    v14->_typesRequiringShareAuthorization = (NSSet *)v21;

  }
  return v14;
}

- (HKAuthorizationRequestRecord)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKSource *source;
  id v5;

  source = self->_source;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", source, CFSTR("source"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionIdentifier, CFSTR("session_identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_typesRequiringShareAuthorization, CFSTR("share_types"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_typesRequiringReadAuthorization, CFSTR("read_types"));

}

- (HKAuthorizationRequestRecord)initWithCoder:(id)a3
{
  id v4;
  HKAuthorizationRequestRecord *v5;
  uint64_t v6;
  HKSource *source;
  uint64_t v8;
  NSUUID *sessionIdentifier;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSSet *typesRequiringShareAuthorization;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSSet *typesRequiringReadAuthorization;
  objc_super v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HKAuthorizationRequestRecord;
  v5 = -[HKAuthorizationRequestRecord init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("source"));
    v6 = objc_claimAutoreleasedReturnValue();
    source = v5->_source;
    v5->_source = (HKSource *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("session_identifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSUUID *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("share_types"));
    v13 = objc_claimAutoreleasedReturnValue();
    typesRequiringShareAuthorization = v5->_typesRequiringShareAuthorization;
    v5->_typesRequiringShareAuthorization = (NSSet *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("read_types"));
    v18 = objc_claimAutoreleasedReturnValue();
    typesRequiringReadAuthorization = v5->_typesRequiringReadAuthorization;
    v5->_typesRequiringReadAuthorization = (NSSet *)v18;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)HKAuthorizationRequestRecord;
  -[HKAuthorizationRequestRecord description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@ %@ read:%@, write:%@>"), v4, self->_source, self->_sessionIdentifier, self->_typesRequiringReadAuthorization, self->_typesRequiringShareAuthorization);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HKSource)source
{
  return self->_source;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSSet)typesRequiringShareAuthorization
{
  return self->_typesRequiringShareAuthorization;
}

- (NSSet)typesRequiringReadAuthorization
{
  return self->_typesRequiringReadAuthorization;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typesRequiringReadAuthorization, 0);
  objc_storeStrong((id *)&self->_typesRequiringShareAuthorization, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end
