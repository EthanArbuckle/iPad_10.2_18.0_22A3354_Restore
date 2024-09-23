@implementation LNTranscriptMatchingPredicate

- (LNTranscriptMatchingPredicate)initWithBundleIdentifier:(id)a3 type:(int64_t)a4 executionUUID:(id)a5 entityIdentifier:(id)a6 actionType:(id)a7 entityType:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  LNTranscriptMatchingPredicate *v19;
  uint64_t v20;
  NSString *bundleIdentifier;
  uint64_t v22;
  NSUUID *executionUUID;
  uint64_t v24;
  LNEntityIdentifier *entityIdentifier;
  uint64_t v26;
  NSString *actionType;
  uint64_t v28;
  NSString *entityType;
  LNTranscriptMatchingPredicate *v30;
  objc_super v32;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v32.receiver = self;
  v32.super_class = (Class)LNTranscriptMatchingPredicate;
  v19 = -[LNTranscriptMatchingPredicate init](&v32, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v14, "copy");
    bundleIdentifier = v19->_bundleIdentifier;
    v19->_bundleIdentifier = (NSString *)v20;

    v19->_type = a4;
    v22 = objc_msgSend(v15, "copy");
    executionUUID = v19->_executionUUID;
    v19->_executionUUID = (NSUUID *)v22;

    v24 = objc_msgSend(v16, "copy");
    entityIdentifier = v19->_entityIdentifier;
    v19->_entityIdentifier = (LNEntityIdentifier *)v24;

    v26 = objc_msgSend(v17, "copy");
    actionType = v19->_actionType;
    v19->_actionType = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    entityType = v19->_entityType;
    v19->_entityType = (NSString *)v28;

    v30 = v19;
  }

  return v19;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNTranscriptMatchingPredicate bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[LNTranscriptMatchingPredicate type](self, "type") - 1;
  if (v7 > 2)
    v8 = CFSTR("Donation Record");
  else
    v8 = off_1E45DE0D8[v7];
  -[LNTranscriptMatchingPredicate executionUUID](self, "executionUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNTranscriptMatchingPredicate entityIdentifier](self, "entityIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNTranscriptMatchingPredicate actionType](self, "actionType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNTranscriptMatchingPredicate entityType](self, "entityType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, bundleIdentifier: %@, type: %@, executionUUID: %@, entityIdentifier: %@, actionType: %@, entityType: %@>"), v5, self, v6, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (LNTranscriptMatchingPredicate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  LNTranscriptMatchingPredicate *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("executionUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[LNTranscriptMatchingPredicate initWithBundleIdentifier:type:executionUUID:entityIdentifier:actionType:entityType:](self, "initWithBundleIdentifier:type:executionUUID:entityIdentifier:actionType:entityType:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[LNTranscriptMatchingPredicate bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleIdentifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[LNTranscriptMatchingPredicate type](self, "type"), CFSTR("type"));
  -[LNTranscriptMatchingPredicate executionUUID](self, "executionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("executionUUID"));

  -[LNTranscriptMatchingPredicate entityIdentifier](self, "entityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("entityIdentifier"));

  -[LNTranscriptMatchingPredicate actionType](self, "actionType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("actionType"));

  -[LNTranscriptMatchingPredicate entityType](self, "entityType");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("entityType"));

}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)type
{
  return self->_type;
}

- (NSUUID)executionUUID
{
  return self->_executionUUID;
}

- (LNEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (NSString)entityType
{
  return self->_entityType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityType, 0);
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_executionUUID, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
