@implementation HFPinCodeItem

- (HFPinCodeItem)initWithPinCode:(id)a3 inHome:(id)a4 onAccessory:(id)a5
{
  id v8;
  id v9;
  id v10;
  HFPinCodeItem *v11;
  HFPinCodeItem *v12;
  void *v13;
  id isEnabledOnAccessory;
  _QWORD aBlock[4];
  id v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HFPinCodeItem;
  v11 = -[HFPinCodeItem init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_home, a4);
    -[HFPinCodeItem updateFromPinCode:](v12, "updateFromPinCode:", v8);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__HFPinCodeItem_initWithPinCode_inHome_onAccessory___block_invoke;
    aBlock[3] = &unk_1EA7314E0;
    v17 = v10;
    v13 = _Block_copy(aBlock);
    isEnabledOnAccessory = v12->_isEnabledOnAccessory;
    v12->_isEnabledOnAccessory = v13;

  }
  return v12;
}

uint64_t __52__HFPinCodeItem_initWithPinCode_inHome_onAccessory___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsObject:", *(_QWORD *)(a1 + 32));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[HFPinCodeItem home](self, "home");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[11];
  v4[11] = v5;

  -[HFPinCodeItem userLabel](self, "userLabel");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v4[12];
  v4[12] = v7;

  -[HFPinCodeItem pinCodeValue](self, "pinCodeValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  v11 = (void *)v4[8];
  v4[8] = v10;

  -[HFPinCodeItem accessories](self, "accessories");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "copy");
  v14 = (void *)v4[9];
  v4[9] = v13;

  *((_BYTE *)v4 + 56) = -[HFPinCodeItem hasRestrictions](self, "hasRestrictions");
  -[HFPinCodeItem isEnabledOnAccessory](self, "isEnabledOnAccessory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "copy");
  v17 = (void *)v4[13];
  v4[13] = v16;

  -[HFPinCodeItem unknownMatterGuestUniqueID](self, "unknownMatterGuestUniqueID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "copy");
  v20 = (void *)v4[10];
  v4[10] = v19;

  return v4;
}

+ (id)na_identity
{
  if (_MergedGlobals_5_1 != -1)
    dispatch_once(&_MergedGlobals_5_1, &__block_literal_global_3_4);
  return (id)qword_1ED378728;
}

void __28__HFPinCodeItem_na_identity__block_invoke_2()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_7_4);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_8_2);
  v3 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_9_6);
  v4 = (id)objc_msgSend(v0, "appendCharacteristic:withRole:comparatorBlock:hashBlock:", &__block_literal_global_10_4, 3, 0, &__block_literal_global_12_3);
  objc_msgSend(v0, "build");
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = (void *)qword_1ED378728;
  qword_1ED378728 = v5;

}

id __28__HFPinCodeItem_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = a2;
  objc_msgSend(v2, "userLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "simpleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(v2, "userLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "user");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(v2, "userLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removedUserInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "userUUID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v4;
}

uint64_t __28__HFPinCodeItem_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pinCodeValue");
}

uint64_t __28__HFPinCodeItem_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "unknownMatterGuestUniqueID");
}

uint64_t __28__HFPinCodeItem_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessories");
}

uint64_t __28__HFPinCodeItem_na_identity__block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v2 = a2;
  v3 = objc_opt_class();
  v4 = v2;
  if (!v4)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v3, objc_opt_class());

LABEL_7:
    v6 = 0;
  }

  v9 = objc_msgSend(v6, "computeHashFromContents");
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (void)updateFromPinCode:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  HFPinCodeItem *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x32uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Updating HFPinCodeItem with values from new HFPinCode. item: %@ PinCode: %@", (uint8_t *)&v11, 0x16u);
  }

  objc_msgSend(v4, "userLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPinCodeItem setUserLabel:](self, "setUserLabel:", v6);

  objc_msgSend(v4, "pinCodeValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPinCodeItem setPinCodeValue:](self, "setPinCodeValue:", v7);

  -[HFPinCodeItem setHasRestrictions:](self, "setHasRestrictions:", objc_msgSend(v4, "hasRestrictions"));
  objc_msgSend(v4, "accessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPinCodeItem setAccessories:](self, "setAccessories:", v9);

  objc_msgSend(v4, "unknownMatterGuestUniqueID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPinCodeItem setUnknownMatterGuestUniqueID:](self, "setUnknownMatterGuestUniqueID:", v10);

}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPinCodeItem accessories](self, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("accessories"));

  -[HFPinCodeItem userLabel](self, "userLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "user");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("user"));

  -[HFPinCodeItem userLabel](self, "userLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "simpleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendBool:withName:", v10 != 0, CFSTR("hasSimpleLabel"));

  v12 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFPinCodeItem hasRestrictions](self, "hasRestrictions"), CFSTR("hasRestrictions"));
  -[HFPinCodeItem userLabel](self, "userLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removedUserInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "userUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v3, "appendObject:withName:", v15, CFSTR("removedUserUUID"));

  -[HFPinCodeItem user](self, "user");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v3, "appendObject:withName:", v17, CFSTR("user"));

  -[HFPinCodeItem unknownMatterGuestUniqueID](self, "unknownMatterGuestUniqueID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v3, "appendObject:withName:", v19, CFSTR("unknownMatterGuestUniqueID"));

  objc_msgSend(v3, "build");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (HMUser)user
{
  void *v2;
  void *v3;

  -[HFPinCodeItem userLabel](self, "userLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMUser *)v3;
}

- (BOOL)isGuest
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HFPinCodeItem userLabel](self, "userLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (id)_userName
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v8;

  -[HFPinCodeItem userLabel](self, "userLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "simpleLabel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[HFPinCodeItem user](self, "user");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      return v5;
    -[HFPinCodeItem userLabel](self, "userLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removedUserInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "name");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (id)_userHandle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HFUserHandle *v8;
  void *v9;
  void *v10;

  -[HFPinCodeItem userLabel](self, "userLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HFPinCodeItem home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFPinCodeItem userLabel](self, "userLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "user");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_handleForUser:", v7);
    v8 = (HFUserHandle *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HFPinCodeItem userLabel](self, "userLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removedUserInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      v8 = -[HFUserHandle initWithType:userID:]([HFUserHandle alloc], "initWithType:userID:", 1, v5);
    else
      v8 = 0;
  }

  return v8;
}

- (BOOL)isUnknownGuest
{
  void *v3;
  BOOL v4;

  if (!-[HFPinCodeItem isGuest](self, "isGuest"))
    return 0;
  -[HFPinCodeItem _userName](self, "_userName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") == 0;

  return v4;
}

- (BOOL)isUnknownGuestFromMatter
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[HFPinCodeItem pinCodeValue](self, "pinCodeValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = 0;
  }
  else
  {
    -[HFPinCodeItem userLabel](self, "userLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 0;
    }
    else
    {
      -[HFPinCodeItem unknownMatterGuestUniqueID](self, "unknownMatterGuestUniqueID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6 != 0;

    }
  }

  return v4;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int (**v17)(_QWORD, _QWORD);
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPinCodeItem _userName](self, "_userName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFPinCodeUnknownGuestPlaceholderLabel"), CFSTR("HFPinCodeUnknownGuestPlaceholderLabel"), 1);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("title"));
  -[HFPinCodeItem _userHandle](self, "_userHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 26.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("number.circle.fill"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("iconImage"));

  }
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, CFSTR("userID"));
  -[HFPinCodeItem userLabel](self, "userLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "user");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0C99E60];
    -[HFPinCodeItem userLabel](self, "userLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "user");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithObject:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("dependentHomeKitObjects"));
  }
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[HFPinCodeItem isEnabledOnAccessory](self, "isEnabledOnAccessory");
  v17 = (unsigned int (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[HFPinCodeItem accessories](self, "accessories");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (((unsigned int (**)(_QWORD, void *))v17)[2](v17, v18))
    v19 = 2;
  else
    v19 = 1;
  objc_msgSend(v16, "numberWithInteger:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("state"));

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("dependentHomeKitClasses"));

  v22 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "futureWithResult:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (NSString)pinCodeValue
{
  return self->_pinCodeValue;
}

- (void)setPinCodeValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)accessories
{
  return self->_accessories;
}

- (void)setAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_accessories, a3);
}

- (BOOL)hasRestrictions
{
  return self->_hasRestrictions;
}

- (void)setHasRestrictions:(BOOL)a3
{
  self->_hasRestrictions = a3;
}

- (NSString)unknownMatterGuestUniqueID
{
  return self->_unknownMatterGuestUniqueID;
}

- (void)setUnknownMatterGuestUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_unknownMatterGuestUniqueID, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (HMAccessCodeUserInformation)userLabel
{
  return self->_userLabel;
}

- (void)setUserLabel:(id)a3
{
  objc_storeStrong((id *)&self->_userLabel, a3);
}

- (id)isEnabledOnAccessory
{
  return self->_isEnabledOnAccessory;
}

- (void)setIsEnabledOnAccessory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_isEnabledOnAccessory, 0);
  objc_storeStrong((id *)&self->_userLabel, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_unknownMatterGuestUniqueID, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_pinCodeValue, 0);
}

@end
