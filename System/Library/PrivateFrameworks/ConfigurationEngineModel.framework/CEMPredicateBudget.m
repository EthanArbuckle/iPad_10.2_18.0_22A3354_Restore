@implementation CEMPredicateBudget

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Predicates");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.predicate.budget");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[8];

  v6[7] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Type");
  v6[1] = CFSTR("CalendarIdentifier");
  v6[2] = CFSTR("Monitor");
  v6[3] = CFSTR("Identifiers");
  v6[4] = CFSTR("IdentifiersVersion2");
  v6[5] = CFSTR("NotificationTimes");
  v6[6] = CFSTR("TimeBudget");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithCalendarIdentifier:(id)a3 withMonitor:(id)a4 withIdentifiers:(id)a5 withIdentifiersVersion2:(id)a6 withNotificationTimes:(id)a7 withTimeBudget:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  __CFString *v18;
  void *v19;
  const __CFString *v20;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = (__CFString *)a3;
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setPayloadType:", CFSTR("com.apple.predicate.budget"));
  if (v18)
    v20 = v18;
  else
    v20 = CFSTR("gregorian");
  objc_msgSend(v19, "setPayloadCalendarIdentifier:", v20);

  objc_msgSend(v19, "setPayloadMonitor:", v17);
  objc_msgSend(v19, "setPayloadIdentifiers:", v16);

  objc_msgSend(v19, "setPayloadIdentifiersVersion2:", v15);
  objc_msgSend(v19, "setPayloadNotificationTimes:", v14);

  objc_msgSend(v19, "setPayloadTimeBudget:", v13);
  return v19;
}

+ (id)buildWithCalendarIdentifier:(id)a3 withMonitor:(id)a4 withIdentifiers:(id)a5 withNotificationTimes:(id)a6 withTimeBudget:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  __CFString *v15;
  void *v16;
  const __CFString *v17;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = (__CFString *)a3;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setPayloadType:", CFSTR("com.apple.predicate.budget"));
  if (v15)
    v17 = v15;
  else
    v17 = CFSTR("gregorian");
  objc_msgSend(v16, "setPayloadCalendarIdentifier:", v17);

  objc_msgSend(v16, "setPayloadMonitor:", v14);
  objc_msgSend(v16, "setPayloadIdentifiers:", v13);

  objc_msgSend(v16, "setPayloadNotificationTimes:", v12);
  objc_msgSend(v16, "setPayloadTimeBudget:", v11);

  return v16;
}

+ (id)buildRequiredOnlyWithMonitor:(id)a3 withTimeBudget:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setPayloadType:", CFSTR("com.apple.predicate.budget"));
  objc_msgSend(v7, "setPayloadMonitor:", v6);

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
  NSString *v18;
  NSString *payloadMonitor;
  NSArray *v20;
  NSArray *payloadIdentifiers;
  NSArray *v22;
  NSArray *payloadIdentifiersVersion2;
  NSArray *v24;
  NSArray *payloadNotificationTimes;
  NSArray *v26;
  NSArray *payloadTimeBudget;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMPredicateBudget allowedPayloadKeys](CEMPredicateBudget, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  v35 = 0;
  -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Type"), 1, 0, &v35);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = v35;
  payloadType = self->super._payloadType;
  self->super._payloadType = v13;

  if (!v14)
  {
    v34 = 0;
    -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("CalendarIdentifier"), 0, CFSTR("gregorian"), &v34);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = v34;
    payloadCalendarIdentifier = self->_payloadCalendarIdentifier;
    self->_payloadCalendarIdentifier = v16;

    if (!v14)
    {
      v33 = 0;
      -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("Monitor"), 1, 0, &v33);
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v33;
      payloadMonitor = self->_payloadMonitor;
      self->_payloadMonitor = v18;

      if (!v14)
      {
        v32 = 0;
        -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("Identifiers"), &__block_literal_global_31, 0, 0, &v32);
        v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v14 = v32;
        payloadIdentifiers = self->_payloadIdentifiers;
        self->_payloadIdentifiers = v20;

        if (!v14)
        {
          v31 = 0;
          -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("IdentifiersVersion2"), &__block_literal_global_60, 0, 0, &v31);
          v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
          v14 = v31;
          payloadIdentifiersVersion2 = self->_payloadIdentifiersVersion2;
          self->_payloadIdentifiersVersion2 = v22;

          if (!v14)
          {
            v30 = 0;
            -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("NotificationTimes"), &__block_literal_global_61, 0, 0, &v30);
            v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
            v14 = v30;
            payloadNotificationTimes = self->_payloadNotificationTimes;
            self->_payloadNotificationTimes = v24;

            if (!v14)
            {
              v29 = 0;
              -[CEMPayloadBase loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:classType:nested:isRequired:defaultValue:error:", v6, CFSTR("TimeBudget"), objc_opt_class(), 0, 1, 0, &v29);
              v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
              v14 = v29;
              payloadTimeBudget = self->_payloadTimeBudget;
              self->_payloadTimeBudget = v26;

            }
          }
        }
      }
    }
  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

uint64_t __40__CEMPredicateBudget_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __40__CEMPredicateBudget_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __40__CEMPredicateBudget_loadPayload_error___block_invoke_3(uint64_t a1, void *a2)
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
  NSArray *payloadTimeBudget;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("Type"), self->super._payloadType, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("CalendarIdentifier"), self->_payloadCalendarIdentifier, 0, CFSTR("gregorian"));
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v5, CFSTR("Monitor"), self->_payloadMonitor, 1, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("Identifiers"), self->_payloadIdentifiers, &__block_literal_global_66_0, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("IdentifiersVersion2"), self->_payloadIdentifiersVersion2, &__block_literal_global_67, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("NotificationTimes"), self->_payloadNotificationTimes, &__block_literal_global_68, 0, 0);
  payloadTimeBudget = self->_payloadTimeBudget;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__CEMPredicateBudget_serializePayloadWithAssetProviders___block_invoke_4;
  v10[3] = &unk_24C639E48;
  v11 = v4;
  v7 = v4;
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v5, CFSTR("TimeBudget"), payloadTimeBudget, v10, 1, 0);
  v8 = (void *)objc_msgSend(v5, "copy");

  return v8;
}

id __57__CEMPredicateBudget_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

id __57__CEMPredicateBudget_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

id __57__CEMPredicateBudget_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __57__CEMPredicateBudget_serializePayloadWithAssetProviders___block_invoke_4(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CEMPredicateBudget;
  v4 = -[CEMPredicateBase copyWithZone:](&v20, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->super._payloadType, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadCalendarIdentifier, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_payloadMonitor, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSArray copy](self->_payloadIdentifiers, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSArray copy](self->_payloadIdentifiersVersion2, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSArray copy](self->_payloadNotificationTimes, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = -[NSArray copy](self->_payloadTimeBudget, "copy");
  v18 = (void *)v4[8];
  v4[8] = v17;

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

- (NSString)payloadMonitor
{
  return self->_payloadMonitor;
}

- (void)setPayloadMonitor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)payloadIdentifiers
{
  return self->_payloadIdentifiers;
}

- (void)setPayloadIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)payloadIdentifiersVersion2
{
  return self->_payloadIdentifiersVersion2;
}

- (void)setPayloadIdentifiersVersion2:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)payloadNotificationTimes
{
  return self->_payloadNotificationTimes;
}

- (void)setPayloadNotificationTimes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)payloadTimeBudget
{
  return self->_payloadTimeBudget;
}

- (void)setPayloadTimeBudget:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadTimeBudget, 0);
  objc_storeStrong((id *)&self->_payloadNotificationTimes, 0);
  objc_storeStrong((id *)&self->_payloadIdentifiersVersion2, 0);
  objc_storeStrong((id *)&self->_payloadIdentifiers, 0);
  objc_storeStrong((id *)&self->_payloadMonitor, 0);
  objc_storeStrong((id *)&self->_payloadCalendarIdentifier, 0);
}

uint64_t __55__CEMPredicateBudget_TimeBudgetItem_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __72__CEMPredicateBudget_TimeBudgetItem_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

@end
