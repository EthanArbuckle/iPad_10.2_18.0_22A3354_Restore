@implementation INStartCallIntent

- (id)_titleWithLocalizer:(id)a3 fromBundleURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  if (-[INStartCallIntent callCapability](self, "callCapability") == INCallCapabilityVideoCall
    && -[INStartCallIntent preferredCallProvider](self, "preferredCallProvider") == 2)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    INLocalizedStringWithLocalizer(CFSTR("FaceTime %@"), CFSTR("FaceTime %@"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[INStartCallIntent contacts](self, "contacts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_intents_readableTitleWithLocalizer:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)INStartCallIntent;
    -[INIntent _titleWithLocalizer:fromBundleURL:](&v14, sel__titleWithLocalizer_fromBundleURL_, v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)_subtitleWithLocalizer:(id)a3 fromBundleURL:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;
  objc_super v39;
  objc_super v40;
  objc_super v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[INStartCallIntent callCapability](self, "callCapability") != INCallCapabilityVideoCall)
  {
    v8 = -[INStartCallIntent preferredCallProvider](self, "preferredCallProvider");
    if ((unint64_t)(v8 - 2) < 2 || !v8)
    {
      -[INIntent _subtitleWithLocalizer:fromBundleURL:](&v39, sel__subtitleWithLocalizer_fromBundleURL_, v6, v7, v38.receiver, v38.super_class, self, INStartCallIntent, v40.receiver, v40.super_class, v41.receiver, v41.super_class);
      goto LABEL_20;
    }
    if (v8 == 1)
    {
      -[INStartCallIntent contacts](self, "contacts");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count") == 1)
      {
        -[INStartCallIntent contacts](self, "contacts");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "personHandle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "type");

        if (v13 == 2)
        {
          v44 = 0u;
          v45 = 0u;
          v42 = 0u;
          v43 = 0u;
          -[INStartCallIntent contacts](self, "contacts");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "firstObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "aliases");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
          if (v17)
          {
            v18 = v17;
            v19 = 0;
            v20 = *(_QWORD *)v43;
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v43 != v20)
                  objc_enumerationMutation(v16);
                v19 |= objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "type") == 2;
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
            }
            while (v18);

            if ((v19 & 1) != 0)
            {
              -[INStartCallIntent contacts](self, "contacts");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "firstObject");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "personHandle");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "label");
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              if (v25)
              {
                if (!objc_msgSend(v25, "hasPrefix:", CFSTR("com.apple.intents.PersonHandleLabel.")))
                {
                  v27 = v25;
LABEL_35:

                  goto LABEL_21;
                }
                objc_msgSend(v25, "substringFromIndex:", objc_msgSend(CFSTR("com.apple.intents.PersonHandleLabel."), "length"));
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                INLocalizedStringWithLocalizer(v25, v26, v6);
                v27 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_msgSend(v6, "locale");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "regionCode");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "lowercaseString");
                v26 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v26)
                {
                  v26 = (void *)CPPhoneNumberCopyNetworkCountryCode();
                  if (!v26)
                    v26 = (void *)CPPhoneNumberCopyHomeCountryCode();
                }
                -[INStartCallIntent contacts](self, "contacts");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "firstObject");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "personHandle");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "value");
                v34 = (void *)PNCreateFormattedStringWithCountry();

                if (objc_msgSend(v34, "length"))
                {
                  v27 = v34;
                }
                else
                {
                  -[INStartCallIntent contacts](self, "contacts");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "firstObject");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "personHandle");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "value");
                  v27 = (id)objc_claimAutoreleasedReturnValue();

                }
              }

              goto LABEL_35;
            }
          }
          else
          {

          }
          -[INIntent _subtitleWithLocalizer:fromBundleURL:](&v41, sel__subtitleWithLocalizer_fromBundleURL_, v6, v7, v38.receiver, v38.super_class, v39.receiver, v39.super_class, v40.receiver, v40.super_class, self, INStartCallIntent);
          goto LABEL_20;
        }
      }
      else
      {

      }
      -[INIntent _subtitleWithLocalizer:fromBundleURL:](&v40, sel__subtitleWithLocalizer_fromBundleURL_, v6, v7, v38.receiver, v38.super_class, v39.receiver, v39.super_class, self, INStartCallIntent, v41.receiver, v41.super_class);
      goto LABEL_20;
    }
  }
  -[INIntent _subtitleWithLocalizer:fromBundleURL:](&v38, sel__subtitleWithLocalizer_fromBundleURL_, v6, v7, self, INStartCallIntent, v39.receiver, v39.super_class, v40.receiver, v40.super_class, v41.receiver, v41.super_class);
LABEL_20:
  v27 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

  return v27;
}

+ (id)_ignoredParameters
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("audioRoute"), CFSTR("destinationType"), CFSTR("preferredCallProvider"), CFSTR("ttyType"), CFSTR("recordTypeForRedialing"), CFSTR("callCapability"), CFSTR("callGroups"), CFSTR("notificationThreadIdentifier"), 0);
}

- (INStartCallIntent)initWithDestinationType:(int64_t)a3 contacts:(id)a4 callCapability:(int64_t)a5
{
  return -[INStartCallIntent initWithAudioRoute:destinationType:contacts:recordTypeForRedialing:callCapability:](self, "initWithAudioRoute:destinationType:contacts:recordTypeForRedialing:callCapability:", 0, a3, a4, 0, a5);
}

- (INStartCallIntent)initWithAudioRoute:(int64_t)a3 destinationType:(int64_t)a4 contacts:(id)a5 callCapability:(int64_t)a6
{
  return -[INStartCallIntent initWithAudioRoute:destinationType:contacts:recordTypeForRedialing:callCapability:](self, "initWithAudioRoute:destinationType:contacts:recordTypeForRedialing:callCapability:", a3, a4, a5, 0, a6);
}

- (INStartCallIntent)initWithAudioRoute:(int64_t)a3 destinationType:(int64_t)a4 preferredCallProvider:(int64_t)a5 contacts:(id)a6 recordTypeForRedialing:(int64_t)a7 ttyType:(int64_t)a8 callCapability:(int64_t)a9
{
  INStartCallIntent *v10;
  INStartCallIntent *v11;

  v10 = -[INStartCallIntent initWithCallRecordFilter:callRecordToCallBack:audioRoute:destinationType:preferredCallProvider:contacts:ttyType:callCapability:](self, "initWithCallRecordFilter:callRecordToCallBack:audioRoute:destinationType:preferredCallProvider:contacts:ttyType:callCapability:", 0, 0, a3, a4, a5, a6, a8, a9);
  v11 = v10;
  if (v10)
    -[INStartCallIntent setRecordTypeForRedialing:](v10, "setRecordTypeForRedialing:", a7);
  return v11;
}

- (INCallRecordType)recordTypeForRedialing
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  INCallRecordType v7;

  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasRecordTypeForRedialing");
  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "recordTypeForRedialing");
  if (v4 && (v6 - 2) <= 8)
    v7 = qword_18C311768[v6 - 2];
  else
    v7 = INCallRecordTypeUnknown;

  return v7;
}

- (void)setRecordTypeForRedialing:(int64_t)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = 0x7FFFFFFFLL;
  if ((unint64_t)(a3 - 1) <= 7)
    v3 = dword_18C311748[a3 - 1];
  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((_DWORD)v3 == 0x7FFFFFFF)
    objc_msgSend(v4, "setHasRecordTypeForRedialing:", 0);
  else
    objc_msgSend(v4, "setRecordTypeForRedialing:", v3);

}

- (INStartCallIntent)initWithAudioRoute:(INCallAudioRoute)audioRoute destinationType:(INCallDestinationType)destinationType contacts:(NSArray *)contacts recordTypeForRedialing:(INCallRecordType)recordTypeForRedialing callCapability:(INCallCapability)callCapability
{
  return -[INStartCallIntent initWithAudioRoute:destinationType:preferredCallProvider:contacts:recordTypeForRedialing:ttyType:callCapability:](self, "initWithAudioRoute:destinationType:preferredCallProvider:contacts:recordTypeForRedialing:ttyType:callCapability:", audioRoute, destinationType, 0, contacts, recordTypeForRedialing, 0, callCapability);
}

- (id)_typedBackingStore
{
  void *v2;
  void *v3;
  id v4;

  -[INIntent backingStore](self, "backingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)_metadata
{
  void *v2;
  void *v3;

  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intentMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setMetadata:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (int64_t)_intentCategory
{
  return 17;
}

- (id)_categoryVerb
{
  return CFSTR("Call");
}

- (INStartCallIntent)initWithCallRecordFilter:(INCallRecordFilter *)callRecordFilter callRecordToCallBack:(INCallRecord *)callRecordToCallBack audioRoute:(INCallAudioRoute)audioRoute destinationType:(INCallDestinationType)destinationType contacts:(NSArray *)contacts callCapability:(INCallCapability)callCapability
{
  INCallRecordFilter *v14;
  INCallRecord *v15;
  NSArray *v16;
  INStartCallIntent *v17;
  INStartCallIntent *v18;
  objc_super v20;

  v14 = callRecordFilter;
  v15 = callRecordToCallBack;
  v16 = contacts;
  v20.receiver = self;
  v20.super_class = (Class)INStartCallIntent;
  v17 = -[INIntent init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    -[INStartCallIntent setCallRecordFilter:](v17, "setCallRecordFilter:", v14);
    -[INStartCallIntent setCallRecordToCallBack:](v18, "setCallRecordToCallBack:", v15);
    -[INStartCallIntent setAudioRoute:](v18, "setAudioRoute:", audioRoute);
    -[INStartCallIntent setDestinationType:](v18, "setDestinationType:", destinationType);
    -[INStartCallIntent setContacts:](v18, "setContacts:", v16);
    -[INStartCallIntent setCallCapability:](v18, "setCallCapability:", callCapability);
  }

  return v18;
}

- (INStartCallIntent)initWithCallRecordFilter:(id)a3 callRecordToCallBack:(id)a4 audioRoute:(int64_t)a5 destinationType:(int64_t)a6 preferredCallProvider:(int64_t)a7 contacts:(id)a8 ttyType:(int64_t)a9 callCapability:(int64_t)a10
{
  INStartCallIntent *v11;
  INStartCallIntent *v12;

  v11 = -[INStartCallIntent initWithCallRecordFilter:callRecordToCallBack:audioRoute:destinationType:contacts:callCapability:](self, "initWithCallRecordFilter:callRecordToCallBack:audioRoute:destinationType:contacts:callCapability:", a3, a4, a5, a6, a8, a10);
  v12 = v11;
  if (v11)
  {
    -[INStartCallIntent setPreferredCallProvider:](v11, "setPreferredCallProvider:", a7);
    -[INStartCallIntent setTTYType:](v12, "setTTYType:", a9);
  }
  return v12;
}

- (id)_emptyCopy
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INStartCallIntent;
  -[INIntent _emptyCopy](&v5, sel__emptyCopy);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreferredCallProvider:", -[INStartCallIntent preferredCallProvider](self, "preferredCallProvider"));
  return v3;
}

- (INCallRecordFilter)callRecordFilter
{
  void *v2;
  void *v3;
  void *v4;

  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callRecordFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromCallRecordFilter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INCallRecordFilter *)v4;
}

- (void)setCallRecordFilter:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToCallRecordFilter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setCallRecordFilter:", v5);
}

- (INCallRecord)callRecordToCallBack
{
  void *v2;
  void *v3;
  void *v4;

  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callRecordToCallBack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromCallRecordValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INCallRecord *)v4;
}

- (void)setCallRecordToCallBack:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToCallRecordValue(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setCallRecordToCallBack:", v5);
}

- (INCallAudioRoute)audioRoute
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  INCallAudioRoute v7;

  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasAudioRoute");
  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "audioRoute");
  if (v4 && (v6 - 2) <= 2)
    v7 = qword_18C311CB0[v6 - 2];
  else
    v7 = INCallAudioRouteUnknown;

  return v7;
}

- (void)setAudioRoute:(int64_t)a3
{
  uint64_t v3;
  id v4;

  switch(a3)
  {
    case 1:
      v3 = 2;
      break;
    case 1000:
      v3 = 4;
      break;
    case 2:
      v3 = 3;
      break;
    default:
      -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setHasAudioRoute:", 0);
      goto LABEL_9;
  }
  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAudioRoute:", v3);
LABEL_9:

}

- (INCallDestinationType)destinationType
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  INCallDestinationType v7;
  INCallDestinationType v8;

  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasDestinationType");
  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "destinationType") - 1;
  if (v6 <= 4)
    v7 = v6 + 1;
  else
    v7 = INCallDestinationTypeUnknown;
  if (v4)
    v8 = v7;
  else
    v8 = INCallDestinationTypeUnknown;

  return v8;
}

- (void)setDestinationType:(int64_t)a3
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = a3 - 1;
  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 > 4)
    objc_msgSend(v4, "setHasDestinationType:", 0);
  else
    objc_msgSend(v4, "setDestinationType:");

}

- (int64_t)preferredCallProvider
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;

  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPreferredCallProvider");
  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "preferredCallProvider") - 2;
  if (v6 <= 2)
    v7 = v6 + 1;
  else
    v7 = 0;
  if (v4)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (void)setPreferredCallProvider:(int64_t)a3
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = a3 - 1;
  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 > 2)
    objc_msgSend(v4, "setHasPreferredCallProvider:", 0);
  else
    objc_msgSend(v4, "setPreferredCallProvider:");

}

- (NSArray)contacts
{
  void *v2;
  void *v3;
  void *v4;

  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromContacts(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setContacts:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToContacts(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setContacts:", v5);
}

- (int64_t)ttyType
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  unsigned int v6;
  int64_t v7;

  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasTtyType");
  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ttyType");
  if (((v6 < 3) & v4) != 0)
    v7 = v6 + 1;
  else
    v7 = 0;

  return v7;
}

- (void)setTTYType:(int64_t)a3
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = a3 - 1;
  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 > 2)
    objc_msgSend(v4, "setHasTtyType:", 0);
  else
    objc_msgSend(v4, "setTtyType:", v3);

}

- (INCallCapability)callCapability
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  INCallCapability v8;

  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasCallCapability");
  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "callCapability");
  v7 = 2 * (v6 == 2);
  if (v6 == 1)
    v7 = 1;
  if (v4)
    v8 = v7;
  else
    v8 = INCallCapabilityUnknown;

  return v8;
}

- (void)setCallCapability:(int64_t)a3
{
  unsigned int v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (a3 == 1)
    v3 = 1;
  else
    v3 = 0x7FFFFFFF;
  if (a3 == 2)
    v4 = 2;
  else
    v4 = v3;
  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)v4 == 0x7FFFFFFF)
    objc_msgSend(v5, "setHasCallCapability:", 0);
  else
    objc_msgSend(v5, "setCallCapability:", v4);

}

- (NSNumber)isGroupCall
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasIsGroupCall"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "isGroupCall"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setIsGroupCall:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setIsGroupCall:", objc_msgSend(v5, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasIsGroupCall:", 0);

}

- (NSArray)callGroups
{
  void *v2;
  void *v3;
  void *v4;

  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromCallGroups(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setCallGroups:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToCallGroups(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setCallGroups:", v5);
}

- (NSString)notificationThreadIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationThreadIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (void)setNotificationThreadIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNotificationThreadIdentifier:", v4);

}

- (NSString)faceTimeLink
{
  void *v2;
  void *v3;
  void *v4;

  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "faceTimeLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (void)setFaceTimeLink:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFaceTimeLink:", v4);

}

- (INStartCallRequestMetadata)callRequestMetadata
{
  void *v2;
  INStartCallRequestMetadata *v3;
  void *v4;

  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callRequestMetadata");
  v3 = (INStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromStartCallRequestMetadata(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INStartCallRequestMetadata *)v4;
}

- (void)setCallRequestMetadata:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToStartCallRequestMetadata(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setCallRequestMetadata:", v5);
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  INCallAudioRoute v7;
  __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  __CFString *v11;
  INCallDestinationType v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  INCallCapability v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  _QWORD v22[6];
  _QWORD v23[7];

  v23[6] = *MEMORY[0x1E0C80C00];
  v22[0] = CFSTR("callRecordFilter");
  -[INStartCallIntent callRecordFilter](self, "callRecordFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[0] = v4;
  v22[1] = CFSTR("callRecordToCallBack");
  -[INStartCallIntent callRecordToCallBack](self, "callRecordToCallBack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[1] = v6;
  v22[2] = CFSTR("audioRoute");
  v7 = -[INStartCallIntent audioRoute](self, "audioRoute");
  v8 = CFSTR("speakerphoneAudioRoute");
  v9 = CFSTR("heySiriAudioRoute");
  v10 = CFSTR("unknown");
  if (v7 == INCallAudioRouteBluetoothAudioRoute)
    v10 = CFSTR("bluetoothAudioRoute");
  if (v7 != 1000)
    v9 = v10;
  if (v7 != INCallAudioRouteSpeakerphoneAudioRoute)
    v8 = (__CFString *)v9;
  v11 = v8;
  v23[2] = v11;
  v22[3] = CFSTR("destinationType");
  v12 = -[INStartCallIntent destinationType](self, "destinationType");
  if ((unint64_t)(v12 - 1) > 4)
    v13 = CFSTR("unknown");
  else
    v13 = off_1E228C100[v12 - 1];
  v14 = v13;
  v23[3] = v14;
  v22[4] = CFSTR("contacts");
  -[INStartCallIntent contacts](self, "contacts");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[4] = v16;
  v22[5] = CFSTR("callCapability");
  v17 = -[INStartCallIntent callCapability](self, "callCapability");
  v18 = CFSTR("unknown");
  if (v17 == INCallCapabilityVideoCall)
    v18 = CFSTR("videoCall");
  if (v17 == INCallCapabilityAudioCall)
    v18 = CFSTR("audioCall");
  v19 = v18;
  v23[5] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  if (!v5)

  if (!v3)
  return v20;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  -[INStartCallIntent _typedBackingStore](self, "_typedBackingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "contacts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedContactsFromContacts(v9, a3, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setContacts:", v10);
  -[INIntent setBackingStore:](self, "setBackingStore:", v8);

}

- (id)_validParameterCombinationsWithSchema:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)INStartCallIntent;
  -[INIntent _validParameterCombinationsWithSchema:](&v20, sel__validParameterCombinationsWithSchema_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[INStartCallIntent preferredCallProvider](self, "preferredCallProvider"))
    objc_msgSend(v5, "addObject:", CFSTR("preferredCallProvider"));
  if (-[INStartCallIntent destinationType](self, "destinationType"))
    objc_msgSend(v5, "addObject:", CFSTR("destinationType"));
  if (-[INStartCallIntent callCapability](self, "callCapability"))
    objc_msgSend(v5, "addObject:", CFSTR("callCapability"));
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v4, "allKeys", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setByAddingObjectsFromSet:", v5);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKey:", v13, v14);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = v4;
  }

  return v6;
}

- (id)_currentParameterCombination
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  -[INIntent _nonNilParameters](self, "_nonNilParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("audioRoute"), CFSTR("destinationType"), CFSTR("ttyType"), CFSTR("recordTypeForRedialing"), CFSTR("callCapability"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minusSet:", v5);

  -[INIntent _nonNilParameters](self, "_nonNilParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", CFSTR("preferredCallProvider"));

  if (!v7)
    goto LABEL_4;
  -[INIntent _parameterCombinations](self, "_parameterCombinations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(v4, "removeObject:", CFSTR("preferredCallProvider"));
    -[INIntent _parameterCombinations](self, "_parameterCombinations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
LABEL_4:
      v12.receiver = self;
      v12.super_class = (Class)INStartCallIntent;
      -[INIntent _currentParameterCombination](&v12, sel__currentParameterCombination);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v9;
}

- (id)domain
{
  return CFSTR("Calls");
}

- (id)verb
{
  return CFSTR("StartCall");
}

- (BOOL)configureAttributeSet:(id)a3 includingData:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[INStartCallIntent contacts](self, "contacts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        INPersonToCSPerson(*(void **)(*((_QWORD *)&v21 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  objc_msgSend(v6, "setPrimaryRecipients:", v8);
  NSStringFromSelector(sel_displayName);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRecipientNames:", v16);

  objc_msgSend(v8, "valueForKeyPath:", CFSTR("handles.@distinctUnionOfArrays.self"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRecipientAddresses:", v17);

  v20.receiver = self;
  v20.super_class = (Class)INStartCallIntent;
  v18 = -[INIntent configureAttributeSet:includingData:](&v20, sel_configureAttributeSet_includingData_, v6, v4);

  return v18;
}

- (id)_spotlightContentType
{
  __CFString *v2;

  v2 = CFSTR("com.apple.siri.interaction.phone");
  return CFSTR("com.apple.siri.interaction.phone");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
