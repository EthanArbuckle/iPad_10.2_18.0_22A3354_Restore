@implementation MSPSharedTripReceiverCapabilities

- (MSPSharedTripReceiverCapabilities)initWithRegistrationPropertiesSupported:(id)a3 propertiesUnsupported:(id)a4
{
  id v7;
  id v8;
  MSPSharedTripReceiverCapabilities *v9;
  MSPSharedTripReceiverCapabilities *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[MSPSharedTripReceiverCapabilities init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_supportedProperties, a3);
    objc_storeStrong((id *)&v10->_unsupportedProperties, a4);
  }

  return v10;
}

- (MSPSharedTripReceiverCapabilities)initWithIDSEndpointCapabilities:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  MSPSharedTripReceiverCapabilities *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[2];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = *MEMORY[0x1E0D340F8];
  v23[0] = *MEMORY[0x1E0D340F0];
  v23[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v4, "valueForCapability:", v13) == 1)
          v14 = v5;
        else
          v14 = v6;
        objc_msgSend(v14, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v10);
  }

  v15 = (void *)objc_msgSend(v5, "copy");
  v16 = (void *)objc_msgSend(v6, "copy");
  v17 = -[MSPSharedTripReceiverCapabilities initWithRegistrationPropertiesSupported:propertiesUnsupported:](self, "initWithRegistrationPropertiesSupported:propertiesUnsupported:", v15, v16);

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSPSharedTripReceiverCapabilities;
  v3 = -[MSPSharedTripReceiverCapabilities hash](&v6, sel_hash);
  v4 = -[NSSet hash](self->_supportedProperties, "hash");
  return v4 ^ -[NSSet hash](self->_unsupportedProperties, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;
  NSSet *unsupportedProperties;
  uint64_t v12;
  id v13;
  void *v14;
  unsigned __int8 v15;
  objc_super v17;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = (void *)v5[1];
    v7 = self->_supportedProperties;
    v8 = v6;
    if (v7 | v8
      && (v9 = (void *)v8, v10 = objc_msgSend((id)v7, "isEqual:", v8), v9, (id)v7, !v10))
    {
      v15 = 0;
    }
    else
    {
      unsupportedProperties = self->_unsupportedProperties;
      v12 = v5[2];
      v13 = unsupportedProperties;
      v14 = v13;
      if ((unint64_t)v13 | v12)
        v15 = objc_msgSend(v13, "isEqual:", v12);
      else
        v15 = 1;

    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)MSPSharedTripReceiverCapabilities;
    v15 = -[MSPSharedTripReceiverCapabilities isEqual:](&v17, sel_isEqual_, v4);
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 1, self->_supportedProperties);
  objc_storeStrong(v4 + 2, self->_unsupportedProperties);
  return v4;
}

+ (id)allKnownReceiverCapabilities
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E40]);
  objc_msgSend(a1, "sydromeReceiverCapabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "starskyReceiverCapabilities", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(a1, "legacyReceiverCapabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithArray:", v7);

  return v8;
}

+ (id)sydromeReceiverCapabilities
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0D340F0], *MEMORY[0x1E0D340F8], 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRegistrationPropertiesSupported:propertiesUnsupported:", v3, 0);

  return v4;
}

+ (id)starskyReceiverCapabilities
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D340F0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D340F8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRegistrationPropertiesSupported:propertiesUnsupported:", v3, v4);

  return v5;
}

+ (id)legacyReceiverCapabilities
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0D340F0], *MEMORY[0x1E0D340F8], 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRegistrationPropertiesSupported:propertiesUnsupported:", 0, v3);

  return v4;
}

+ (id)unrestrictedReceiverCapabilities
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRegistrationPropertiesSupported:propertiesUnsupported:", 0, 0);
}

+ (void)enumerateKnownReceiverCapabilityConfigurationsForState:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "allKnownReceiverCapabilities");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "enumerateReceiverCapabilityConfigurations:forState:withBlock:", v8, v7, v6);

}

+ (void)enumerateReceiverCapabilityConfigurations:(id)a3 forState:(id)a4 withBlock:(id)a5
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v7 = a4;
  v8 = a5;
  v9 = (objc_class *)MEMORY[0x1E0C99E08];
  v10 = a3;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithCapacity:", 3);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __98__MSPSharedTripReceiverCapabilities_enumerateReceiverCapabilityConfigurations_forState_withBlock___block_invoke;
  v15[3] = &unk_1E66545D0;
  v16 = v11;
  v17 = v7;
  v18 = v8;
  v12 = v8;
  v13 = v7;
  v14 = v11;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v15);

}

void __98__MSPSharedTripReceiverCapabilities_enumerateReceiverCapabilityConfigurations_forState_withBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "instanceCompatibleWithReceiverCapabilities:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v3, v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (void)fetchReceiverCapabilitiesForDestinations:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__7;
    v37 = __Block_byref_object_dispose__7;
    v38 = 0;
    v8 = objc_alloc_init(MEMORY[0x1E0D34310]);
    v9 = (void *)v34[5];
    v34[5] = (uint64_t)v8;

    v10 = (void *)v34[5];
    NSStringFromClass((Class)a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addListenerID:forService:", v11);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = v6;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(v13);
          v17 = (void *)MEMORY[0x1B5E2B350]();
          v18 = (void *)IDSCopyAddressDestinationForDestination();
          objc_msgSend(v12, "addObject:", v18);

          objc_autoreleasePoolPop(v17);
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
      }
      while (v14);
    }

    dispatch_get_global_queue(25, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)v34[5];
    objc_msgSend(v12, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D34308], "refreshIDInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass((Class)a1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __89__MSPSharedTripReceiverCapabilities_fetchReceiverCapabilitiesForDestinations_completion___block_invoke;
    v24[3] = &unk_1E6654620;
    v25 = v13;
    v27 = &v33;
    v28 = a1;
    v26 = v7;
    objc_msgSend(v20, "idInfoForDestinations:service:infoTypes:options:listenerID:queue:completionBlock:", v21, CFSTR("com.apple.private.alloy.maps.eta"), 1, v22, v23, v19, v24);

    _Block_object_dispose(&v33, 8);
  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA70]);
  }

}

void __89__MSPSharedTripReceiverCapabilities_fetchReceiverCapabilitiesForDestinations_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __89__MSPSharedTripReceiverCapabilities_fetchReceiverCapabilitiesForDestinations_completion___block_invoke_2;
  v17[3] = &unk_1E66545F8;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 56);
  v18 = v7;
  v20 = v8;
  v9 = v5;
  v19 = v9;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v17);

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __89__MSPSharedTripReceiverCapabilities_fetchReceiverCapabilitiesForDestinations_completion___block_invoke_3;
  block[3] = &unk_1E6653330;
  v12 = *(id *)(a1 + 40);
  v15 = v9;
  v16 = v12;
  v13 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __89__MSPSharedTripReceiverCapabilities_fetchReceiverCapabilitiesForDestinations_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  void *v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v22 = v5;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5))
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", 3);
  else
    v7 = 0;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v6, "endpoints", v6);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v26)
  {
    v24 = *(_QWORD *)v32;
    v25 = v7;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v10 = objc_alloc(*(Class *)(a1 + 48));
        objc_msgSend(v9, "capabilities");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v10, "initWithIDSEndpointCapabilities:", v11);

        objc_msgSend(v7, "addObject:", v12);
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v9, "destinationURIs");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v28;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v28 != v16)
                objc_enumerationMutation(v13);
              v18 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
              if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v18))
              {
                v35 = v12;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v19, v18);

              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
          }
          while (v15);
        }

        v7 = v25;
      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v26);
  }

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v7, "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v20, v22);

  }
}

void __89__MSPSharedTripReceiverCapabilities_fetchReceiverCapabilitiesForDestinations_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (id)idsSendMessageOptions
{
  NSSet *supportedProperties;
  void *v4;
  NSSet *unsupportedProperties;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = *MEMORY[0x1E0D341B0];
  supportedProperties = self->_supportedProperties;
  v4 = supportedProperties;
  if (!supportedProperties)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[0] = v4;
  v9[1] = *MEMORY[0x1E0D341B8];
  unsupportedProperties = self->_unsupportedProperties;
  v6 = unsupportedProperties;
  if (!unsupportedProperties)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!unsupportedProperties)
  {

    if (supportedProperties)
      return v7;
LABEL_9:

    return v7;
  }
  if (!supportedProperties)
    goto LABEL_9;
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)MSPSharedTripReceiverCapabilities;
  -[MSPSharedTripReceiverCapabilities description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (supports: %@, lacks: %@)"), v4, self->_supportedProperties, self->_unsupportedProperties);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)supportsRoutingPathLeg
{
  return -[NSSet containsObject:](self->_supportedProperties, "containsObject:", *MEMORY[0x1E0D340F0]);
}

- (BOOL)supportsWaypointRouteSharing
{
  return -[NSSet containsObject:](self->_supportedProperties, "containsObject:", *MEMORY[0x1E0D340F8]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unsupportedProperties, 0);
  objc_storeStrong((id *)&self->_supportedProperties, 0);
}

@end
