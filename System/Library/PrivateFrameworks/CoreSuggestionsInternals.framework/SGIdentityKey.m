@implementation SGIdentityKey

- (SGIdentityKey)initWithSerialized:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  SGIdentityKey *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGIdentityKey.m"), 158, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serialized"));

  }
  SGDelimitedStringsDeserialize();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGIdentityKey.m"), 160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parts.count == 2"));

  }
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[SGIdentityKey identityTypeForKeyPart:](SGIdentityKey, "identityTypeForKeyPart:", v7);

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGIdentityKey.m"), 162, CFSTR("Unknown type: %@"), v15);

  }
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SGIdentityKey initWithType:content:](self, "initWithType:content:", v8, v9);

  return v10;
}

- (SGIdentityKey)initWithType:(unint64_t)a3 content:(id)a4
{
  id v8;
  SGIdentityKey *v9;
  SGIdentityKey *v10;
  void *v12;

  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGIdentityKey.m"), 169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("content"));

  }
  v9 = -[SGIdentityKey init](self, "init");
  v10 = v9;
  if (v9)
  {
    v9->_type = a3;
    objc_storeStrong((id *)&v9->_content, a4);
  }

  return v10;
}

- (id)serialize
{
  unint64_t type;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  unint64_t v13;

  type = self->_type;
  switch(type)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *keyForIdentityKeyType(SGIdentityKeyType)");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("No key for SGIdentityKeyTypeUninitialized. Initialize it.");
      v6 = v3;
      v7 = v4;
      v8 = 44;
      goto LABEL_4;
    case 1uLL:
      v9 = CFSTR("email");
      goto LABEL_10;
    case 2uLL:
      v9 = CFSTR("contact");
      goto LABEL_10;
    case 3uLL:
      v9 = CFSTR("unkphone");
      goto LABEL_10;
    case 4uLL:
      v9 = CFSTR("text-message");
      goto LABEL_10;
    case 5uLL:
      v9 = CFSTR("social-profile");
LABEL_10:
      v10 = v9;
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *keyForIdentityKeyType(SGIdentityKeyType)");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("No key for type value %d");
      v13 = type;
      v6 = v3;
      v7 = v4;
      v8 = 63;
LABEL_4:
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("SGIdentityKey.m"), v8, v5, v13);

      v9 = 0;
      break;
  }
  SGDelimitedStringsSerialize();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  SGIdentityKey *v4;
  SGIdentityKey *v5;
  BOOL v6;

  v4 = (SGIdentityKey *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGIdentityKey isEqualToIdentityKey:](self, "isEqualToIdentityKey:", v5);

  return v6;
}

- (BOOL)isEqualToIdentityKey:(id)a3
{
  SGIdentityKey *v4;
  SGIdentityKey *v5;
  NSString *v6;
  NSString *v7;
  char v8;

  v4 = (SGIdentityKey *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else if (self->_type == v4->_type)
  {
    v6 = self->_content;
    v7 = v6;
    if (v6 == v5->_content)
      v8 = 1;
    else
      v8 = -[NSString isEqual:](v6, "isEqual:");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t type;

  type = self->_type;
  return -[NSString hash](self->_content, "hash") - type + 32 * type;
}

- (id)description
{
  id v3;
  unint64_t type;
  const __CFString *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  type = self->_type;
  if (type > 5)
    v5 = CFSTR("UNKNOWN IDENTITY KEY TYPE!");
  else
    v5 = off_1E7DB4FA0[type];
  return (id)objc_msgSend(v3, "initWithFormat:", CFSTR("[SGIdentityKey type:%@ content:%@]"), v5, self->_content);
}

- (BOOL)hasEmailAddress
{
  return self->_type == 1;
}

- (id)emailAddress
{
  NSString *content;
  void *v6;
  void *v7;

  if (!-[SGIdentityKey hasEmailAddress](self, "hasEmailAddress"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGIdentityKey.m"), 210, CFSTR("Calling email selector on identity with no email address."));

  }
  content = self->_content;
  if (!content)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGIdentityKey.m"), 211, CFSTR("Identity key claims to be an email address but it does not have one"));

    content = self->_content;
  }
  return content;
}

- (BOOL)hasInstantMessageAddress
{
  return self->_type == 4;
}

- (id)instantMessageAddress
{
  NSString *content;
  void *v6;
  void *v7;

  if (!-[SGIdentityKey hasInstantMessageAddress](self, "hasInstantMessageAddress"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGIdentityKey.m"), 222, CFSTR("Calling instant message selector on identity with no instant message address."));

  }
  content = self->_content;
  if (!content)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGIdentityKey.m"), 223, CFSTR("Identity key claims to be an instant message address but it does not have one"));

    content = self->_content;
  }
  return content;
}

- (BOOL)hasSocialProfile
{
  return self->_type == 5;
}

- (id)socialProfile
{
  NSString *content;
  void *v6;
  void *v7;

  if (!-[SGIdentityKey hasSocialProfile](self, "hasSocialProfile"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGIdentityKey.m"), 234, CFSTR("Calling socialProfile selector on identity with no social profile."));

  }
  content = self->_content;
  if (!content)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGIdentityKey.m"), 235, CFSTR("Identity key claims to be a social profile but it does not have one"));

    content = self->_content;
  }
  return content;
}

- (id)uniqueIdentifier
{
  void *v4;
  void *v5;

  if (-[SGIdentityKey hasEmailAddress](self, "hasEmailAddress"))
  {
    -[SGIdentityKey emailAddress](self, "emailAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[SGIdentityKey hasInstantMessageAddress](self, "hasInstantMessageAddress"))
  {
    -[SGIdentityKey instantMessageAddress](self, "instantMessageAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[SGIdentityKey hasSocialProfile](self, "hasSocialProfile"))
  {
    -[SGIdentityKey socialProfile](self, "socialProfile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[SGIdentityKey hasPhone](self, "hasPhone"))
  {
    -[SGIdentityKey phone](self, "phone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGIdentityKey.m"), 246, CFSTR("Should not ask for a unique identifier when this is neither an email nor an instance message address"));

    v4 = 0;
  }
  return v4;
}

- (BOOL)hasPhone
{
  return self->_type == 3;
}

- (id)phone
{
  NSString *content;
  void *v6;
  void *v7;

  if (!-[SGIdentityKey hasPhone](self, "hasPhone"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGIdentityKey.m"), 257, CFSTR("Calling phone number selector on identity with no phone number."));

  }
  content = self->_content;
  if (!content)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGIdentityKey.m"), 258, CFSTR("Identity key claims to be a phone number but it does not have one"));

    content = self->_content;
  }
  return content;
}

- (NSString)externalId
{
  void *v5;

  if (self->_type != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGIdentityKey.m"), 308, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_type == SGIdentityKeyTypeContact"));

  }
  return self->_content;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
}

+ (id)keyForEmail:(id)a3
{
  void *v3;
  void *v4;

  SGNormalizeEmailAddress();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGIdentityKey keyForNormalizedEmail:](SGIdentityKey, "keyForNormalizedEmail:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)keyForNormalizedEmail:(id)a3
{
  id v3;
  SGIdentityKey *v4;

  v3 = a3;
  v4 = -[SGIdentityKey initWithType:content:]([SGIdentityKey alloc], "initWithType:content:", 1, v3);

  return v4;
}

+ (id)keyForNormalizedPhone:(id)a3
{
  id v3;
  SGIdentityKey *v4;

  v3 = a3;
  v4 = -[SGIdentityKey initWithType:content:]([SGIdentityKey alloc], "initWithType:content:", 3, v3);

  return v4;
}

+ (id)keyForInstantMessageAddress:(id)a3
{
  id v3;
  SGIdentityKey *v4;
  void *v5;
  SGIdentityKey *v6;

  v3 = a3;
  v4 = [SGIdentityKey alloc];
  SGNormalizeInstantMessageAddress(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SGIdentityKey initWithType:content:](v4, "initWithType:content:", 4, v5);
  return v6;
}

+ (id)keyForSocialProfile:(id)a3
{
  id v3;
  SGIdentityKey *v4;
  SGIdentityKey *v5;

  v3 = a3;
  v4 = [SGIdentityKey alloc];
  SGNormalizeSocialProfile(v3);
  objc_claimAutoreleasedReturnValue();

  v5 = -[SGIdentityKey initWithType:content:](v4, "initWithType:content:", 5, v3);
  return v5;
}

+ (id)keyForPersonHandle:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v15;
  NSObject *v16;
  _BOOL4 v17;
  const char *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "handles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGIdentityKey.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person.handles.count > 0"));

  }
  objc_msgSend(v5, "handleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C966A8]))
  {
    objc_msgSend(a1, "keyForEmail:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v13 = (void *)v11;
    goto LABEL_10;
  }
  if (!objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C967C0]))
  {
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C96740]))
    {
      objc_msgSend(a1, "keyForInstantMessageAddress:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v15 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C96868]);
    sgLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (v15)
    {
      if (v17)
      {
        *(_DWORD *)buf = 138412290;
        v21 = v8;
        v18 = "IdentityKey for social profile types currently unsupported: %@";
LABEL_17:
        _os_log_error_impl(&dword_1C3607000, v16, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);
      }
    }
    else if (v17)
    {
      *(_DWORD *)buf = 138412290;
      v21 = v8;
      v18 = "Unknown handle type %@";
      goto LABEL_17;
    }

    v13 = 0;
    goto LABEL_10;
  }
  SGNormalizePhoneNumber();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "keyForNormalizedPhone:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v13;
}

+ (id)keyForContactExternalId:(int)a3
{
  uint64_t v3;
  SGIdentityKey *v4;
  void *v5;
  SGIdentityKey *v6;

  v3 = *(_QWORD *)&a3;
  v4 = [SGIdentityKey alloc];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%d"), v3);
  v6 = -[SGIdentityKey initWithType:content:](v4, "initWithType:content:", 2, v5);

  return v6;
}

+ (id)keyForContactUniqueId:(id)a3
{
  id v3;
  SGIdentityKey *v4;

  v3 = a3;
  v4 = -[SGIdentityKey initWithType:content:]([SGIdentityKey alloc], "initWithType:content:", 2, v3);

  return v4;
}

+ (unint64_t)identityTypeForKeyPart:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("email")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("contact")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("unkphone")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("text-message")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("social-profile")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)isSupportedEntityType:(int64_t)a3
{
  void *v7;

  if ((unint64_t)a3 < 0x1C)
    return (a3 & 0xFFFFFFF) == 4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGIdentityKey.m"), 302, CFSTR("Unknown entity type: %lu"), a3);

  return 0;
}

@end
