@implementation CEMPredicateCompositeBudget

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Predicates");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.predicate.compositebudget");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Type");
  v6[1] = CFSTR("CalendarIdentifier");
  v6[2] = CFSTR("Monitors");
  v6[3] = CFSTR("NotificationTimes");
  v6[4] = CFSTR("TimeBudget");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithCalendarIdentifier:(id)a3 withMonitors:(id)a4 withNotificationTimes:(id)a5 withTimeBudget:(id)a6
{
  id v9;
  id v10;
  id v11;
  __CFString *v12;
  void *v13;
  const __CFString *v14;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = (__CFString *)a3;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setPayloadType:", CFSTR("com.apple.predicate.compositebudget"));
  if (v12)
    v14 = v12;
  else
    v14 = CFSTR("gregorian");
  objc_msgSend(v13, "setPayloadCalendarIdentifier:", v14);

  objc_msgSend(v13, "setPayloadMonitors:", v11);
  objc_msgSend(v13, "setPayloadNotificationTimes:", v10);

  objc_msgSend(v13, "setPayloadTimeBudget:", v9);
  return v13;
}

+ (id)buildRequiredOnlyWithMonitors:(id)a3 withTimeBudget:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setPayloadType:", CFSTR("com.apple.predicate.compositebudget"));
  objc_msgSend(v7, "setPayloadMonitors:", v6);

  objc_msgSend(v7, "setPayloadTimeBudget:", v5);
  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSSet *v11;
  NSSet *unknownPayloadKeys;
  NSString *v13;
  id v14;
  NSString *payloadType;
  NSString *v16;
  NSString *payloadCalendarIdentifier;
  CEMPredicateCompositeBudget_Monitors *v18;
  CEMPredicateCompositeBudget_Monitors *payloadMonitors;
  NSArray *v20;
  NSArray *payloadNotificationTimes;
  NSArray *v22;
  NSArray *payloadTimeBudget;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMPredicateCompositeBudget allowedPayloadKeys](CEMPredicateCompositeBudget, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  v29 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Type"), 1, 0, &v29);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v29;
  payloadType = self->super._payloadType;
  self->super._payloadType = v13;

  if (!v14)
  {
    v28 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CalendarIdentifier"), 0, CFSTR("gregorian"), &v28);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v28;
    payloadCalendarIdentifier = self->_payloadCalendarIdentifier;
    self->_payloadCalendarIdentifier = v16;

    if (!v14)
    {
      v27 = 0;
      -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v6, CFSTR("Monitors"), objc_opt_class(), 1, 0, &v27);
      v18 = (CEMPredicateCompositeBudget_Monitors *)objc_claimAutoreleasedReturnValue();
      v14 = v27;
      payloadMonitors = self->_payloadMonitors;
      self->_payloadMonitors = v18;

      if (!v14)
      {
        v26 = 0;
        -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("NotificationTimes"), &__block_literal_global_32, 0, 0, &v26);
        v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v14 = v26;
        payloadNotificationTimes = self->_payloadNotificationTimes;
        self->_payloadNotificationTimes = v20;

        if (!v14)
        {
          v25 = 0;
          -[CEMPayloadBase loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:", v6, CFSTR("TimeBudget"), objc_opt_class(), 0, 1, 0, &v25);
          v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
          v14 = v25;
          payloadTimeBudget = self->_payloadTimeBudget;
          self->_payloadTimeBudget = v22;

        }
      }
    }
  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

uint64_t __49__CEMPredicateCompositeBudget_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4;
  void *v5;
  CEMPredicateCompositeBudget_Monitors *payloadMonitors;
  uint64_t v7;
  id v8;
  NSArray *payloadTimeBudget;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("Type"), self->super._payloadType, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("CalendarIdentifier"), self->_payloadCalendarIdentifier, 0, CFSTR("gregorian"));
  payloadMonitors = self->_payloadMonitors;
  v7 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __66__CEMPredicateCompositeBudget_serializePayloadWithAssetProviders___block_invoke;
  v18[3] = &unk_24C638560;
  v8 = v4;
  v19 = v8;
  -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v5, CFSTR("Monitors"), payloadMonitors, v18, 1, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("NotificationTimes"), self->_payloadNotificationTimes, &__block_literal_global_55_0, 0, 0);
  payloadTimeBudget = self->_payloadTimeBudget;
  v13 = v7;
  v14 = 3221225472;
  v15 = __66__CEMPredicateCompositeBudget_serializePayloadWithAssetProviders___block_invoke_3;
  v16 = &unk_24C639F10;
  v17 = v8;
  v10 = v8;
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("TimeBudget"), payloadTimeBudget, &v13, 1, 0);
  v11 = (void *)objc_msgSend(v5, "copy", v13, v14, v15, v16);

  return v11;
}

uint64_t __66__CEMPredicateCompositeBudget_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

id __66__CEMPredicateCompositeBudget_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __66__CEMPredicateCompositeBudget_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializePayloadWithAssetProviders:", *(_QWORD *)(a1 + 32));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CEMPredicateCompositeBudget;
  v4 = -[CEMPredicateBase copyWithZone:](&v16, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->super._payloadType, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadCalendarIdentifier, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[CEMPredicateCompositeBudget_Monitors copy](self->_payloadMonitors, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSArray copy](self->_payloadNotificationTimes, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSArray copy](self->_payloadTimeBudget, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  return v4;
}

- (NSString)payloadCalendarIdentifier
{
  return self->_payloadCalendarIdentifier;
}

- (void)setPayloadCalendarIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CEMPredicateCompositeBudget_Monitors)payloadMonitors
{
  return self->_payloadMonitors;
}

- (void)setPayloadMonitors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)payloadNotificationTimes
{
  return self->_payloadNotificationTimes;
}

- (void)setPayloadNotificationTimes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)payloadTimeBudget
{
  return self->_payloadTimeBudget;
}

- (void)setPayloadTimeBudget:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadTimeBudget, 0);
  objc_storeStrong((id *)&self->_payloadNotificationTimes, 0);
  objc_storeStrong((id *)&self->_payloadMonitors, 0);
  objc_storeStrong((id *)&self->_payloadCalendarIdentifier, 0);
}

uint64_t __58__CEMPredicateCompositeBudget_Monitors_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __58__CEMPredicateCompositeBudget_Monitors_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __58__CEMPredicateCompositeBudget_Monitors_loadPayload_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __58__CEMPredicateCompositeBudget_Monitors_loadPayload_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __75__CEMPredicateCompositeBudget_Monitors_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

id __75__CEMPredicateCompositeBudget_Monitors_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

id __75__CEMPredicateCompositeBudget_Monitors_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return a2;
}

id __75__CEMPredicateCompositeBudget_Monitors_serializePayloadWithAssetProviders___block_invoke_4(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __64__CEMPredicateCompositeBudget_TimeBudgetItem_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __81__CEMPredicateCompositeBudget_TimeBudgetItem_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

@end
