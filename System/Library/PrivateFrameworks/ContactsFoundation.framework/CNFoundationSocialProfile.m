@implementation CNFoundationSocialProfile

- (CNFoundationSocialProfile)initWithUrlString:(id)a3 username:(id)a4 userIdentifier:(id)a5 service:(id)a6 displayName:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CNFoundationSocialProfile *v17;
  uint64_t v18;
  NSString *urlString;
  uint64_t v20;
  NSString *username;
  uint64_t v22;
  NSString *userIdentifier;
  uint64_t v24;
  NSString *service;
  uint64_t v26;
  NSString *displayName;
  CNFoundationSocialProfile *v28;
  objc_super v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)CNFoundationSocialProfile;
  v17 = -[CNFoundationSocialProfile init](&v30, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    urlString = v17->_urlString;
    v17->_urlString = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    username = v17->_username;
    v17->_username = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    userIdentifier = v17->_userIdentifier;
    v17->_userIdentifier = (NSString *)v22;

    v24 = objc_msgSend(v15, "copy");
    service = v17->_service;
    v17->_service = (NSString *)v24;

    v26 = objc_msgSend(v16, "copy");
    displayName = v17->_displayName;
    v17->_displayName = (NSString *)v26;

    v28 = v17;
  }

  return v17;
}

+ (id)emptySocialProfile
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithUrlString:username:userIdentifier:service:displayName:", 0, 0, 0, 0, 0);
}

- (BOOL)isEmpty
{
  return !self->_urlString && !self->_username && !self->_userIdentifier && !self->_service && self->_displayName == 0;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendNamesAndObjects:", CFSTR("urlString"), self->_urlString, CFSTR("username"), self->_username, CFSTR("userIdentifier"), self->_userIdentifier, CFSTR("service"), self->_service, CFSTR("displayName"), self->_displayName, 0);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD aBlock[5];
  id v22;
  _QWORD v23[5];
  id v24;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __37__CNFoundationSocialProfile_isEqual___block_invoke;
  v23[3] = &unk_1E29B9D38;
  v23[4] = self;
  v24 = v4;
  aBlock[0] = v5;
  aBlock[1] = 3221225472;
  aBlock[2] = __37__CNFoundationSocialProfile_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E29B9D38;
  aBlock[4] = self;
  v6 = v24;
  v22 = v6;
  v7 = _Block_copy(aBlock);
  v19[0] = v5;
  v19[1] = 3221225472;
  v19[2] = __37__CNFoundationSocialProfile_isEqual___block_invoke_3;
  v19[3] = &unk_1E29B9D38;
  v19[4] = self;
  v8 = v6;
  v20 = v8;
  v9 = _Block_copy(v19);
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __37__CNFoundationSocialProfile_isEqual___block_invoke_4;
  v17[3] = &unk_1E29B9D38;
  v17[4] = self;
  v10 = v8;
  v18 = v10;
  v11 = _Block_copy(v17);
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __37__CNFoundationSocialProfile_isEqual___block_invoke_5;
  v15[3] = &unk_1E29B9D38;
  v15[4] = self;
  v16 = v10;
  v12 = v10;
  v13 = _Block_copy(v15);
  LOBYTE(self) = +[CNEqualsBuilder isObject:equalToOther:withBlocks:](CNEqualsBuilder, "isObject:equalToOther:withBlocks:", self, v12, v23, v7, v9, v11, v13, 0);

  return (char)self;
}

BOOL __37__CNFoundationSocialProfile_isEqual___block_invoke(uint64_t a1)
{
  return +[CNEqualsBuilder isObject:equalToOther:](CNEqualsBuilder, "isObject:equalToOther:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
}

BOOL __37__CNFoundationSocialProfile_isEqual___block_invoke_2(uint64_t a1)
{
  return +[CNEqualsBuilder isObject:equalToOther:](CNEqualsBuilder, "isObject:equalToOther:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
}

BOOL __37__CNFoundationSocialProfile_isEqual___block_invoke_3(uint64_t a1)
{
  return +[CNEqualsBuilder isObject:equalToOther:](CNEqualsBuilder, "isObject:equalToOther:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
}

BOOL __37__CNFoundationSocialProfile_isEqual___block_invoke_4(uint64_t a1)
{
  return +[CNEqualsBuilder isObject:equalToOther:](CNEqualsBuilder, "isObject:equalToOther:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
}

BOOL __37__CNFoundationSocialProfile_isEqual___block_invoke_5(uint64_t a1)
{
  return +[CNEqualsBuilder isObject:equalToOther:](CNEqualsBuilder, "isObject:equalToOther:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD aBlock[5];
  _QWORD v14[5];

  v3 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __33__CNFoundationSocialProfile_hash__block_invoke;
  v14[3] = &unk_1E29B9B10;
  v14[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __33__CNFoundationSocialProfile_hash__block_invoke_2;
  aBlock[3] = &unk_1E29B9B10;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = __33__CNFoundationSocialProfile_hash__block_invoke_3;
  v12[3] = &unk_1E29B9B10;
  v12[4] = self;
  v5 = _Block_copy(v12);
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __33__CNFoundationSocialProfile_hash__block_invoke_4;
  v11[3] = &unk_1E29B9B10;
  v11[4] = self;
  v6 = _Block_copy(v11);
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __33__CNFoundationSocialProfile_hash__block_invoke_5;
  v10[3] = &unk_1E29B9B10;
  v10[4] = self;
  v7 = _Block_copy(v10);
  v8 = +[CNHashBuilder hashWithBlocks:](CNHashBuilder, "hashWithBlocks:", v14, v4, v5, v6, v7, 0);

  return v8;
}

unint64_t __33__CNFoundationSocialProfile_hash__block_invoke(uint64_t a1)
{
  return +[CNHashBuilder objectHash:](CNHashBuilder, "objectHash:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

unint64_t __33__CNFoundationSocialProfile_hash__block_invoke_2(uint64_t a1)
{
  return +[CNHashBuilder objectHash:](CNHashBuilder, "objectHash:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

unint64_t __33__CNFoundationSocialProfile_hash__block_invoke_3(uint64_t a1)
{
  return +[CNHashBuilder objectHash:](CNHashBuilder, "objectHash:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

unint64_t __33__CNFoundationSocialProfile_hash__block_invoke_4(uint64_t a1)
{
  return +[CNHashBuilder objectHash:](CNHashBuilder, "objectHash:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
}

unint64_t __33__CNFoundationSocialProfile_hash__block_invoke_5(uint64_t a1)
{
  return +[CNHashBuilder objectHash:](CNHashBuilder, "objectHash:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
}

- (NSString)urlString
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)userIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)service
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end
