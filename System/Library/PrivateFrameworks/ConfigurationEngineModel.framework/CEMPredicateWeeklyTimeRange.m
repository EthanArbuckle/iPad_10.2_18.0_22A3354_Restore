@implementation CEMPredicateWeeklyTimeRange

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Predicates");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.predicate.weeklytimerange");
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
  v6[2] = CFSTR("StartDay");
  v6[3] = CFSTR("StartTime");
  v6[4] = CFSTR("EndDay");
  v6[5] = CFSTR("EndTime");
  v6[6] = CFSTR("NotificationTimes");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithCalendarIdentifier:(id)a3 withStartDay:(id)a4 withStartTime:(id)a5 withEndDay:(id)a6 withEndTime:(id)a7 withNotificationTimes:(id)a8
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
  objc_msgSend(v19, "setPayloadType:", CFSTR("com.apple.predicate.weeklytimerange"));
  if (v18)
    v20 = v18;
  else
    v20 = CFSTR("gregorian");
  objc_msgSend(v19, "setPayloadCalendarIdentifier:", v20);

  objc_msgSend(v19, "setPayloadStartDay:", v17);
  objc_msgSend(v19, "setPayloadStartTime:", v16);

  objc_msgSend(v19, "setPayloadEndDay:", v15);
  objc_msgSend(v19, "setPayloadEndTime:", v14);

  objc_msgSend(v19, "setPayloadNotificationTimes:", v13);
  return v19;
}

+ (id)buildRequiredOnlyWithStartDay:(id)a3 withStartTime:(id)a4 withEndDay:(id)a5 withEndTime:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setPayloadType:", CFSTR("com.apple.predicate.weeklytimerange"));
  objc_msgSend(v13, "setPayloadStartDay:", v12);

  objc_msgSend(v13, "setPayloadStartTime:", v11);
  objc_msgSend(v13, "setPayloadEndDay:", v10);

  objc_msgSend(v13, "setPayloadEndTime:", v9);
  return v13;
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
  NSNumber *v18;
  NSNumber *payloadStartDay;
  NSString *v20;
  NSString *payloadStartTime;
  NSNumber *v22;
  NSNumber *payloadEndDay;
  NSString *v24;
  NSString *payloadEndTime;
  NSArray *v26;
  NSArray *payloadNotificationTimes;
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

  +[CEMPredicateWeeklyTimeRange allowedPayloadKeys](CEMPredicateWeeklyTimeRange, "allowedPayloadKeys");
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
      -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("StartDay"), 1, 0, &v33);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v33;
      payloadStartDay = self->_payloadStartDay;
      self->_payloadStartDay = v18;

      if (!v14)
      {
        v32 = 0;
        -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("StartTime"), 1, 0, &v32);
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        v14 = v32;
        payloadStartTime = self->_payloadStartTime;
        self->_payloadStartTime = v20;

        if (!v14)
        {
          v31 = 0;
          -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EndDay"), 1, 0, &v31);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v31;
          payloadEndDay = self->_payloadEndDay;
          self->_payloadEndDay = v22;

          if (!v14)
          {
            v30 = 0;
            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("EndTime"), 1, 0, &v30);
            v24 = (NSString *)objc_claimAutoreleasedReturnValue();
            v14 = v30;
            payloadEndTime = self->_payloadEndTime;
            self->_payloadEndTime = v24;

            if (!v14)
            {
              v29 = 0;
              -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("NotificationTimes"), &__block_literal_global_33, 0, 0, &v29);
              v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
              v14 = v29;
              payloadNotificationTimes = self->_payloadNotificationTimes;
              self->_payloadNotificationTimes = v26;

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

uint64_t __49__CEMPredicateWeeklyTimeRange_loadPayload_error___block_invoke(uint64_t a1, void *a2)
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
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("Type"), self->super._payloadType, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("CalendarIdentifier"), self->_payloadCalendarIdentifier, 0, CFSTR("gregorian"));
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("StartDay"), self->_payloadStartDay, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("StartTime"), self->_payloadStartTime, 1, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("EndDay"), self->_payloadEndDay, 1, 0);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("EndTime"), self->_payloadEndTime, 1, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("NotificationTimes"), self->_payloadNotificationTimes, &__block_literal_global_56, 0, 0);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

id __66__CEMPredicateWeeklyTimeRange_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return a2;
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
  v20.super_class = (Class)CEMPredicateWeeklyTimeRange;
  v4 = -[CEMPredicateBase copyWithZone:](&v20, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->super._payloadType, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadCalendarIdentifier, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSNumber copy](self->_payloadStartDay, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_payloadStartTime, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSNumber copy](self->_payloadEndDay, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSString copy](self->_payloadEndTime, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = -[NSArray copy](self->_payloadNotificationTimes, "copy");
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

- (NSNumber)payloadStartDay
{
  return self->_payloadStartDay;
}

- (void)setPayloadStartDay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)payloadStartTime
{
  return self->_payloadStartTime;
}

- (void)setPayloadStartTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)payloadEndDay
{
  return self->_payloadEndDay;
}

- (void)setPayloadEndDay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)payloadEndTime
{
  return self->_payloadEndTime;
}

- (void)setPayloadEndTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)payloadNotificationTimes
{
  return self->_payloadNotificationTimes;
}

- (void)setPayloadNotificationTimes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadNotificationTimes, 0);
  objc_storeStrong((id *)&self->_payloadEndTime, 0);
  objc_storeStrong((id *)&self->_payloadEndDay, 0);
  objc_storeStrong((id *)&self->_payloadStartTime, 0);
  objc_storeStrong((id *)&self->_payloadStartDay, 0);
  objc_storeStrong((id *)&self->_payloadCalendarIdentifier, 0);
}

@end
