@implementation HFPinCode

- (HFPinCode)initWithHomeAccessCode:(id)a3
{
  id v4;
  HFPinCode *v5;
  uint64_t v6;
  HMAccessCodeUserInformation *userLabel;
  void *v8;
  uint64_t v9;
  NSString *pinCodeValue;
  uint64_t v11;
  NSMutableSet *accessoryAccessCodes;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HFPinCode;
  v5 = -[HFPinCode init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "userInformation");
    v6 = objc_claimAutoreleasedReturnValue();
    userLabel = v5->_userLabel;
    v5->_userLabel = (HMAccessCodeUserInformation *)v6;

    objc_msgSend(v4, "accessCodeValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = objc_claimAutoreleasedReturnValue();
    pinCodeValue = v5->_pinCodeValue;
    v5->_pinCodeValue = (NSString *)v9;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    accessoryAccessCodes = v5->_accessoryAccessCodes;
    v5->_accessoryAccessCodes = (NSMutableSet *)v11;

  }
  return v5;
}

- (HFPinCode)initWithAccessoryAccessCode:(id)a3
{
  id v4;
  HFPinCode *v5;
  void *v6;
  uint64_t v7;
  NSString *pinCodeValue;
  uint64_t v9;
  NSMutableSet *accessoryAccessCodes;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *unknownMatterGuestUniqueID;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HFPinCode;
  v5 = -[HFPinCode init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "accessCodeValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v7 = objc_claimAutoreleasedReturnValue();
    pinCodeValue = v5->_pinCodeValue;
    v5->_pinCodeValue = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    accessoryAccessCodes = v5->_accessoryAccessCodes;
    v5->_accessoryAccessCodes = (NSMutableSet *)v9;

    if (!-[NSString length](v5->_pinCodeValue, "length"))
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "accessory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uniqueIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uniqueIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@-%@"), v13, v14);
      v15 = objc_claimAutoreleasedReturnValue();
      unknownMatterGuestUniqueID = v5->_unknownMatterGuestUniqueID;
      v5->_unknownMatterGuestUniqueID = (NSString *)v15;

    }
  }

  return v5;
}

- (HFPinCode)initWithLabel:(id)a3 accessCodeValue:(id)a4 accessoryAccessCodes:(id)a5
{
  id v9;
  id v10;
  id v11;
  HFPinCode *v12;
  HFPinCode *v13;
  uint64_t v14;
  NSMutableSet *accessoryAccessCodes;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HFPinCode;
  v12 = -[HFPinCode init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userLabel, a3);
    objc_storeStrong((id *)&v13->_pinCodeValue, a4);
    if (v11)
    {
      v14 = objc_msgSend(v11, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    accessoryAccessCodes = v13->_accessoryAccessCodes;
    v13->_accessoryAccessCodes = (NSMutableSet *)v14;

  }
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[HFPinCode userLabel](self, "userLabel");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[3];
  v4[3] = v5;

  -[HFPinCode pinCodeValue](self, "pinCodeValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "copy");
  v9 = (void *)v4[4];
  v4[4] = v8;

  -[HFPinCode accessoryAccessCodes](self, "accessoryAccessCodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "mutableCopy");
  v12 = (void *)v4[1];
  v4[1] = v11;

  -[HFPinCode unknownMatterGuestUniqueID](self, "unknownMatterGuestUniqueID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "copy");
  v15 = (void *)v4[5];
  v4[5] = v14;

  return v4;
}

- (id)copyWithNewPinCodeValue:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  v5 = objc_alloc_init((Class)objc_opt_class());
  -[HFPinCode userLabel](self, "userLabel");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = objc_msgSend(v4, "copy");
  v9 = (void *)v5[4];
  v5[4] = v8;

  -[HFPinCode accessoryAccessCodes](self, "accessoryAccessCodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "mutableCopy");
  v12 = (void *)v5[1];
  v5[1] = v11;

  return v5;
}

+ (id)na_identity
{
  if (_MergedGlobals_312 != -1)
    dispatch_once(&_MergedGlobals_312, &__block_literal_global_4_9);
  return (id)qword_1ED379CE0;
}

void __24__HFPinCode_na_identity__block_invoke_2()
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
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_9_15);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_10_13);
  v3 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_11_13);
  v4 = (id)objc_msgSend(v0, "appendCharacteristic:withRole:comparatorBlock:hashBlock:", &__block_literal_global_12_11, 3, 0, &__block_literal_global_14_13);
  objc_msgSend(v0, "build");
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = (void *)qword_1ED379CE0;
  qword_1ED379CE0 = v5;

}

id __24__HFPinCode_na_identity__block_invoke_4(uint64_t a1, void *a2)
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

uint64_t __24__HFPinCode_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pinCodeValue");
}

uint64_t __24__HFPinCode_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "unknownMatterGuestUniqueID");
}

uint64_t __24__HFPinCode_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessories");
}

uint64_t __24__HFPinCode_na_identity__block_invoke_8(uint64_t a1, void *a2)
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
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPinCode accessories](self, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("accessories"));

  -[HFPinCode userLabel](self, "userLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "user");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("user"));

  -[HFPinCode userLabel](self, "userLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "simpleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendBool:withName:", v10 != 0, CFSTR("hasSimpleLabel"));

  -[HFPinCode userLabel](self, "userLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removedUserInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "userUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v3, "appendObject:withName:", v14, CFSTR("removedUserUUID"));

  v16 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFPinCode hasRestrictions](self, "hasRestrictions"), CFSTR("hasRestrictions"));
  -[HFPinCode unknownMatterGuestUniqueID](self, "unknownMatterGuestUniqueID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v3, "appendObject:withName:", v17, CFSTR("unknownMatterGuestUniqueID"));

  objc_msgSend(v3, "build");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (NSSet)accessoryAccessCodes
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_accessoryAccessCodes, "copy");
}

- (void)addAccessoryAccessCode:(id)a3
{
  NSMutableSet *accessoryAccessCodes;
  id v5;
  NSMutableSet *accessories;
  id v7;

  accessoryAccessCodes = self->_accessoryAccessCodes;
  v5 = a3;
  -[NSMutableSet addObject:](accessoryAccessCodes, "addObject:", v5);
  accessories = self->_accessories;
  objc_msgSend(v5, "accessory");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableSet removeObject:](accessories, "removeObject:", v7);
}

- (void)removeAccessoryAccessCode:(id)a3
{
  -[NSMutableSet removeObject:](self->_accessoryAccessCodes, "removeObject:", a3);
}

- (BOOL)hasRestrictions
{
  NSMutableSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_accessoryAccessCodes;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "hasRestrictions", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)addAccessories:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *accessories;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableSet *accessoryAccessCodes;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_accessories)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    accessories = self->_accessories;
    self->_accessories = v5;

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
        accessoryAccessCodes = self->_accessoryAccessCodes;
        v15[0] = v11;
        v15[1] = 3221225472;
        v15[2] = __28__HFPinCode_addAccessories___block_invoke;
        v15[3] = &unk_1EA736B50;
        v15[4] = v13;
        if ((-[NSMutableSet na_any:](accessoryAccessCodes, "na_any:", v15) & 1) == 0)
          -[NSMutableSet addObject:](self->_accessories, "addObject:", v13);
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

uint64_t __28__HFPinCode_addAccessories___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)removeAccessories:(id)a3
{
  id v3;
  void *v4;
  uint64_t i;
  uint64_t v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  int v14;
  id obj;
  uint64_t v16;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v3;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v18)
  {
    v16 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[NSMutableSet removeObject:](self->_accessories, "removeObject:", v6);
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v7 = self->_accessoryAccessCodes;
        v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v20;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v20 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
              objc_msgSend(v12, "accessory");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "isEqual:", v6);

              if (v14)
                objc_msgSend(v4, "addObject:", v12);
            }
            v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v9);
        }

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v18);
  }

  -[NSMutableSet minusSet:](self->_accessoryAccessCodes, "minusSet:", v4);
}

- (NSSet)accessories
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HFPinCode accessoryAccessCodes](self, "accessoryAccessCodes", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "accessory");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "unionSet:", self->_accessories);
  return (NSSet *)v3;
}

- (HMAccessCodeUserInformation)userLabel
{
  return self->_userLabel;
}

- (void)setUserLabel:(id)a3
{
  objc_storeStrong((id *)&self->_userLabel, a3);
}

- (NSString)pinCodeValue
{
  return self->_pinCodeValue;
}

- (NSString)unknownMatterGuestUniqueID
{
  return self->_unknownMatterGuestUniqueID;
}

- (void)setUnknownMatterGuestUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_unknownMatterGuestUniqueID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownMatterGuestUniqueID, 0);
  objc_storeStrong((id *)&self->_pinCodeValue, 0);
  objc_storeStrong((id *)&self->_userLabel, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_accessoryAccessCodes, 0);
}

@end
