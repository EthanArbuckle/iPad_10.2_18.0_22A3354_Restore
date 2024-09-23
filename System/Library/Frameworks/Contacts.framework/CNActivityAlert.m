@implementation CNActivityAlert

- (CNActivityAlert)initWithSound:(id)a3 vibration:(id)a4 ignoreMute:(BOOL)a5
{
  return -[CNActivityAlert initWithSound:vibration:ignoreMute:userInfo:](self, "initWithSound:vibration:ignoreMute:userInfo:", a3, a4, a5, 0);
}

- (CNActivityAlert)initWithSound:(id)a3 vibration:(id)a4 ignoreMute:(BOOL)a5 userInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  CNActivityAlert *v13;
  uint64_t v14;
  NSString *sound;
  uint64_t v16;
  NSString *vibration;
  uint64_t v18;
  NSDictionary *userInfo;
  CNActivityAlert *v20;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CNActivityAlert;
  v13 = -[CNActivityAlert init](&v22, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    sound = v13->_sound;
    v13->_sound = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    vibration = v13->_vibration;
    v13->_vibration = (NSString *)v16;

    v13->_ignoreMute = a5;
    v18 = objc_msgSend(v12, "copy");
    userInfo = v13->_userInfo;
    v13->_userInfo = (NSDictionary *)v18;

    v20 = v13;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CNActivityAlert initWithSound:vibration:ignoreMute:userInfo:]([CNActivityAlert alloc], "initWithSound:vibration:ignoreMute:userInfo:", self->_sound, self->_vibration, self->_ignoreMute, self->_userInfo);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CNMutableActivityAlert *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(CNMutableActivityAlert);
  -[CNActivityAlert sound](self, "sound");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNActivityAlert setSound:](v4, "setSound:", v5);

  -[CNActivityAlert vibration](self, "vibration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNActivityAlert setVibration:](v4, "setVibration:", v6);

  -[CNActivityAlert setIgnoreMute:](v4, "setIgnoreMute:", -[CNActivityAlert ignoreMute](self, "ignoreMute"));
  -[CNActivityAlert userInfo](self, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNActivityAlert setUserInfo:](v4, "setUserInfo:", v7);

  return v4;
}

- (NSString)description
{
  void *v3;
  NSString *sound;
  NSString *vibration;
  void *v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sound = self->_sound;
  vibration = self->_vibration;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_ignoreMute);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendNamesAndObjects:", CFSTR("sound"), sound, CFSTR("vibration"), vibration, CFSTR("ignoreMute"), v6, 0);

  if (self->_userInfo)
    v8 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("userInfo"));
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  CNActivityAlert *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD aBlock[5];
  id v24;
  _QWORD v25[5];
  id v26;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A40];
  v6 = objc_opt_class();
  v7 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __27__CNActivityAlert_isEqual___block_invoke;
  v25[3] = &unk_1E29F7D70;
  v25[4] = self;
  v26 = v4;
  aBlock[0] = v7;
  aBlock[1] = 3221225472;
  aBlock[2] = __27__CNActivityAlert_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E29F7D70;
  aBlock[4] = self;
  v8 = v26;
  v24 = v8;
  v9 = _Block_copy(aBlock);
  v21[0] = v7;
  v21[1] = 3221225472;
  v21[2] = __27__CNActivityAlert_isEqual___block_invoke_3;
  v21[3] = &unk_1E29F7D70;
  v21[4] = self;
  v10 = v8;
  v22 = v10;
  v11 = _Block_copy(v21);
  v15 = v7;
  v16 = 3221225472;
  v17 = __27__CNActivityAlert_isEqual___block_invoke_4;
  v18 = &unk_1E29F7D70;
  v19 = self;
  v20 = v10;
  v12 = v10;
  v13 = _Block_copy(&v15);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v12, v6, self, v25, v9, v11, v13, 0, v15, v16, v17, v18, v19);

  return (char)self;
}

uint64_t __27__CNActivityAlert_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "vibration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "vibration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __27__CNActivityAlert_isEqual___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "sound");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sound");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __27__CNActivityAlert_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A40], "isBool:equalToOther:", objc_msgSend(*(id *)(a1 + 32), "ignoreMute"), objc_msgSend(*(id *)(a1 + 40), "ignoreMute"));
}

uint64_t __27__CNActivityAlert_isEqual___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD aBlock[5];
  _QWORD v13[5];

  v3 = (void *)MEMORY[0x1E0D13A78];
  v4 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __23__CNActivityAlert_hash__block_invoke;
  v13[3] = &unk_1E29F7D98;
  v13[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __23__CNActivityAlert_hash__block_invoke_2;
  aBlock[3] = &unk_1E29F7D98;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __23__CNActivityAlert_hash__block_invoke_3;
  v11[3] = &unk_1E29F7D98;
  v11[4] = self;
  v6 = _Block_copy(v11);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __23__CNActivityAlert_hash__block_invoke_4;
  v10[3] = &unk_1E29F7D98;
  v10[4] = self;
  v7 = _Block_copy(v10);
  v8 = objc_msgSend(v3, "hashWithBlocks:", v13, v5, v6, v7, 0);

  return v8;
}

uint64_t __23__CNActivityAlert_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "sound");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __23__CNActivityAlert_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "vibration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __23__CNActivityAlert_hash__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A78], "BOOLHash:", objc_msgSend(*(id *)(a1 + 32), "ignoreMute"));
}

uint64_t __23__CNActivityAlert_hash__block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNActivityAlert)initWithCoder:(id)a3
{
  id v4;
  CNActivityAlert *v5;
  void *v6;
  uint64_t v7;
  NSString *sound;
  void *v9;
  uint64_t v10;
  NSString *vibration;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSDictionary *userInfo;
  CNActivityAlert *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CNActivityAlert;
  v5 = -[CNActivityAlert init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sound"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    sound = v5->_sound;
    v5->_sound = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_vibration"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    vibration = v5->_vibration;
    v5->_vibration = (NSString *)v10;

    v5->_ignoreMute = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_ignoreMute"));
    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("_userInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v16;

    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *sound;
  id v5;

  sound = self->_sound;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sound, CFSTR("_sound"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_vibration, CFSTR("_vibration"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_ignoreMute, CFSTR("_ignoreMute"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userInfo, CFSTR("_userInfo"));

}

- (BOOL)isValid:(id *)a3
{
  id v5;
  uint64_t v6;
  id v7;
  BOOL v8;

  if (isValid__cn_once_token_0 != -1)
    dispatch_once(&isValid__cn_once_token_0, &__block_literal_global_34);
  v5 = (id)isValid__cn_once_object_0;
  if (isValid__cn_once_token_1 != -1)
    dispatch_once(&isValid__cn_once_token_1, &__block_literal_global_27_0);
  v6 = isValid__cn_once_token_2;
  v7 = (id)isValid__cn_once_object_1;
  if (v6 != -1)
    dispatch_once(&isValid__cn_once_token_2, &__block_literal_global_29);
  v8 = +[CN areValidKeyPaths:forObject:expectedClasses:allowNil:error:](CN, "areValidKeyPaths:forObject:expectedClasses:allowNil:error:", v5, self, v7, isValid__cn_once_object_2, a3);

  return v8;
}

void __27__CNActivityAlert_isValid___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&unk_1E2A40620, "copy");
  v1 = (void *)isValid__cn_once_object_0;
  isValid__cn_once_object_0 = v0;

}

void __27__CNActivityAlert_isValid___block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)isValid__cn_once_object_1;
  isValid__cn_once_object_1 = v1;

}

void __27__CNActivityAlert_isValid___block_invoke_3()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&unk_1E2A40638, "copy");
  v1 = (void *)isValid__cn_once_object_2;
  isValid__cn_once_object_2 = v0;

}

- (NSString)sound
{
  return self->_sound;
}

- (void)setSound:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)vibration
{
  return self->_vibration;
}

- (void)setVibration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)ignoreMute
{
  return self->_ignoreMute;
}

- (void)setIgnoreMute:(BOOL)a3
{
  self->_ignoreMute = a3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_vibration, 0);
  objc_storeStrong((id *)&self->_sound, 0);
}

@end
