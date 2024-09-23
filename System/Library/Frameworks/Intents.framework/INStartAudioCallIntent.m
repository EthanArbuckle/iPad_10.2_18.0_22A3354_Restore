@implementation INStartAudioCallIntent

- (id)_subtitleWithLocalizer:(id)a3 fromBundleURL:(id)a4
{
  id v4;
  id v7;
  id v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
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
  v7 = a3;
  v8 = a4;
  v9 = -[INStartAudioCallIntent preferredCallProvider](self, "preferredCallProvider");
  if ((unint64_t)(v9 - 2) < 2 || !v9)
  {
    -[INIntent _subtitleWithLocalizer:fromBundleURL:](&v39, sel__subtitleWithLocalizer_fromBundleURL_, v7, v8, self, INStartAudioCallIntent, v40.receiver, v40.super_class, v41.receiver, v41.super_class);
LABEL_20:
    v4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (v9 != 1)
    goto LABEL_21;
  -[INStartAudioCallIntent contacts](self, "contacts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count") != 1)
  {

    goto LABEL_19;
  }
  -[INStartAudioCallIntent contacts](self, "contacts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "personHandle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "type");

  if (v14 != 2)
  {
LABEL_19:
    -[INIntent _subtitleWithLocalizer:fromBundleURL:](&v40, sel__subtitleWithLocalizer_fromBundleURL_, v7, v8, v39.receiver, v39.super_class, self, INStartAudioCallIntent, v41.receiver, v41.super_class);
    goto LABEL_20;
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[INStartAudioCallIntent contacts](self, "contacts");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "aliases");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (!v18)
  {

LABEL_23:
    -[INIntent _subtitleWithLocalizer:fromBundleURL:](&v41, sel__subtitleWithLocalizer_fromBundleURL_, v7, v8, v39.receiver, v39.super_class, v40.receiver, v40.super_class, self, INStartAudioCallIntent);
    goto LABEL_20;
  }
  v19 = v18;
  v20 = 0;
  v21 = *(_QWORD *)v43;
  do
  {
    for (i = 0; i != v19; ++i)
    {
      if (*(_QWORD *)v43 != v21)
        objc_enumerationMutation(v17);
      v20 |= objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "type") == 2;
    }
    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  }
  while (v19);

  if ((v20 & 1) == 0)
    goto LABEL_23;
  -[INStartAudioCallIntent contacts](self, "contacts");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "personHandle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "label");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    if (objc_msgSend(v26, "hasPrefix:", CFSTR("com.apple.intents.PersonHandleLabel.")))
    {
      objc_msgSend(v26, "substringFromIndex:", objc_msgSend(CFSTR("com.apple.intents.PersonHandleLabel."), "length"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      INLocalizedStringWithLocalizer(v26, v27, v7);
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = v26;
    }
  }
  else
  {
    objc_msgSend(v7, "locale");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "regionCode");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "lowercaseString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v31)
    {
      v31 = (void *)CPPhoneNumberCopyNetworkCountryCode();
      if (!v31)
        v31 = (void *)CPPhoneNumberCopyHomeCountryCode();
    }
    -[INStartAudioCallIntent contacts](self, "contacts");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "firstObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "personHandle");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "value");
    v35 = (void *)PNCreateFormattedStringWithCountry();

    if (objc_msgSend(v35, "length"))
    {
      v4 = v35;
    }
    else
    {
      -[INStartAudioCallIntent contacts](self, "contacts");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "firstObject");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "personHandle");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "value");
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

LABEL_21:
  return v4;
}

+ (id)_ignoredParameters
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("audioRoute"), CFSTR("destinationType"), CFSTR("preferredCallProvider"), CFSTR("ttyType"), 0);
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

  -[INStartAudioCallIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INStartAudioCallIntent _typedBackingStore](self, "_typedBackingStore");
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

- (INStartAudioCallIntent)initWithDestinationType:(INCallDestinationType)destinationType contacts:(NSArray *)contacts
{
  NSArray *v6;
  INStartAudioCallIntent *v7;
  INStartAudioCallIntent *v8;
  objc_super v10;

  v6 = contacts;
  v10.receiver = self;
  v10.super_class = (Class)INStartAudioCallIntent;
  v7 = -[INIntent init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[INStartAudioCallIntent setDestinationType:](v7, "setDestinationType:", destinationType);
    -[INStartAudioCallIntent setContacts:](v8, "setContacts:", v6);
  }

  return v8;
}

- (int64_t)audioRoute
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  int64_t v7;

  -[INStartAudioCallIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasAudioRoute");
  -[INStartAudioCallIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "audioRoute");
  if (v4 && (v6 - 2) <= 2)
    v7 = qword_18C311CB0[v6 - 2];
  else
    v7 = 0;

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
      -[INStartAudioCallIntent _typedBackingStore](self, "_typedBackingStore");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setHasAudioRoute:", 0);
      goto LABEL_9;
  }
  -[INStartAudioCallIntent _typedBackingStore](self, "_typedBackingStore");
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

  -[INStartAudioCallIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasDestinationType");
  -[INStartAudioCallIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INStartAudioCallIntent _typedBackingStore](self, "_typedBackingStore");
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

  -[INStartAudioCallIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPreferredCallProvider");
  -[INStartAudioCallIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INStartAudioCallIntent _typedBackingStore](self, "_typedBackingStore");
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

  -[INStartAudioCallIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDialingContacts(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setContacts:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INStartAudioCallIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDialingContacts(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setContacts:", v5);
}

- (int64_t)recordTypeForRedialing
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  int64_t v7;

  -[INStartAudioCallIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasRecordTypeForRedialing");
  -[INStartAudioCallIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "recordTypeForRedialing");
  if (v4 && (v6 - 2) <= 8)
    v7 = qword_18C311768[v6 - 2];
  else
    v7 = 0;

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
  -[INStartAudioCallIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((_DWORD)v3 == 0x7FFFFFFF)
    objc_msgSend(v4, "setHasRecordTypeForRedialing:", 0);
  else
    objc_msgSend(v4, "setRecordTypeForRedialing:", v3);

}

- (int64_t)ttyType
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  unsigned int v6;
  int64_t v7;

  -[INStartAudioCallIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasTtyType");
  -[INStartAudioCallIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INStartAudioCallIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 > 2)
    objc_msgSend(v4, "setHasTtyType:", 0);
  else
    objc_msgSend(v4, "setTtyType:", v3);

}

- (INStartCallRequestMetadata)callRequestMetadata
{
  void *v2;
  INStartCallRequestMetadata *v3;
  void *v4;

  -[INStartAudioCallIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INStartAudioCallIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToStartCallRequestMetadata(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setCallRequestMetadata:", v5);
}

- (id)_dictionaryRepresentation
{
  INCallDestinationType v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("destinationType");
  v3 = -[INStartAudioCallIntent destinationType](self, "destinationType");
  if ((unint64_t)(v3 - 1) > 4)
    v4 = CFSTR("unknown");
  else
    v4 = off_1E228C100[v3 - 1];
  v5 = v4;
  v10[1] = CFSTR("contacts");
  v11[0] = v5;
  -[INStartAudioCallIntent contacts](self, "contacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)

  return v8;
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
  -[INStartAudioCallIntent _typedBackingStore](self, "_typedBackingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "contacts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedDialingContactsFromDialingContacts(v9, a3, v11);
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
  v20.super_class = (Class)INStartAudioCallIntent;
  -[INIntent _validParameterCombinationsWithSchema:](&v20, sel__validParameterCombinationsWithSchema_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[INStartAudioCallIntent preferredCallProvider](self, "preferredCallProvider"))
    objc_msgSend(v5, "addObject:", CFSTR("preferredCallProvider"));
  if (-[INStartAudioCallIntent destinationType](self, "destinationType"))
    objc_msgSend(v5, "addObject:", CFSTR("destinationType"));
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

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("audioRoute"), CFSTR("destinationType"), CFSTR("ttyType"), 0);
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
      v12.super_class = (Class)INStartAudioCallIntent;
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
  return CFSTR("StartAudioCall");
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
  -[INStartAudioCallIntent contacts](self, "contacts");
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
  v20.super_class = (Class)INStartAudioCallIntent;
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

- (INStartAudioCallIntent)initWithContacts:(NSArray *)contacts
{
  return -[INStartAudioCallIntent initWithDestinationType:contacts:](self, "initWithDestinationType:contacts:", 0, contacts);
}

- (BOOL)useSpeaker
{
  return -[INStartAudioCallIntent audioRoute](self, "audioRoute") == 1;
}

- (void)setUseSpeaker:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (-[INStartAudioCallIntent useSpeaker](self, "useSpeaker") != a3)
    -[INStartAudioCallIntent setAudioRoute:](self, "setAudioRoute:", v3);
}

@end
