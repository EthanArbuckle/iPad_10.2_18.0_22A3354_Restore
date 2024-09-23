@implementation _MXExtensionManager

+ (id)_maps_ridesharingAllIntentClassesForNonUIHandling
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "_maps_ridesharingOptionalIntentClassesForNonUIHandling");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_maps_ridesharingRequiredIntentClassesForNonUIHandling");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_maps_ridesharingOptionalIntentClassesForNonUIHandling
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_maps_ridesharingRequiredIntentClassesForNonUIHandling
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_maps_ridesharingIntentClassesForUIInteraction
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_maps_lookupPolicyForEnabledRidesharingNonUIExtensions
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __90___MXExtensionManager_Ridesharing___maps_lookupPolicyForEnabledRidesharingNonUIExtensions__block_invoke;
  v3[3] = &__block_descriptor_40_e22_B16__0___MXExtension_8l;
  v3[4] = a1;
  objc_msgSend(a1, "_lookupPolicyWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_maps_lookupPolicyForRidesharingNonUIExtensions
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __83___MXExtensionManager_Ridesharing___maps_lookupPolicyForRidesharingNonUIExtensions__block_invoke;
  v3[3] = &__block_descriptor_40_e22_B16__0___MXExtension_8l;
  v3[4] = a1;
  objc_msgSend(a1, "_lookupPolicyWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)_maps_updateRideBookingExtensions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  int BOOL;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  GEOConfigGetArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_opt_new();
  v7 = v6;

  v20 = v7;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v3;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v15, "_containingAppIdentifer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(v9, "addObject:", v16);
          v17 = objc_msgSend(v8, "containsObject:", v16);
          BOOL = GEOConfigGetBOOL();
          if ((v17 & 1) == 0)
          {
            if (BOOL)
              objc_msgSend(v15, "_setEnabled:error:", 1, 0);
          }
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  objc_msgSend(v8, "unionSet:", v9);
  objc_msgSend(v8, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  GEOConfigSetArray();

}

+ (id)restaurantQueueingIntentClassNames
{
  return &unk_1E2159DC0;
}

+ (id)lookupPolicyForRestaurantQueueingExtensionWithContainingAppIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "restaurantQueueingIntentClassNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MXExtensionManager _lookupPolicyForExtensionWithContainingAppIdentifier:supportsIntentClassNames:](_MXExtensionManager, "_lookupPolicyForExtensionWithContainingAppIdentifier:supportsIntentClassNames:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)lookupPolicyForRestaurantQueueingExtensions
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "restaurantQueueingIntentClassNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MXExtensionManager _lookupPolicyForExtensionSupportsIntentClassNames:](_MXExtensionManager, "_lookupPolicyForExtensionSupportsIntentClassNames:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)restaurantReservationIntentClassNames
{
  return &unk_1E2159F70;
}

+ (id)lookupPolicyForRestaurantReservationExtensionWithContainingAppIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "restaurantReservationIntentClassNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MXExtensionManager _lookupPolicyForExtensionWithContainingAppIdentifier:supportsIntentClassNames:](_MXExtensionManager, "_lookupPolicyForExtensionWithContainingAppIdentifier:supportsIntentClassNames:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)lookupPolicyForRestaurantReservationExtensionWithContainingAppIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "restaurantReservationIntentClassNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MXExtensionManager _lookupPolicyForExtensionWithContainingAppIdentifiers:supportsIntentClassNames:](_MXExtensionManager, "_lookupPolicyForExtensionWithContainingAppIdentifiers:supportsIntentClassNames:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)lookupPolicyForRestaurantReservationExtensions
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "restaurantReservationIntentClassNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MXExtensionManager _lookupPolicyForExtensionSupportsIntentClassNames:](_MXExtensionManager, "_lookupPolicyForExtensionSupportsIntentClassNames:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)managerWithLookupPolicy:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  _MXExtensionManager *v8;
  NSObject *v9;
  _MXExtensionManager *v10;
  _QWORD block[4];
  _MXExtensionManager *v13;

  v6 = a4;
  v7 = a3;
  v8 = -[_MXExtensionManager initWithLookupPolicy:delegate:]([_MXExtensionManager alloc], "initWithLookupPolicy:delegate:", v7, v6);

  objc_msgSend(a1, "_queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56___MXExtensionManager_managerWithLookupPolicy_delegate___block_invoke;
  block[3] = &unk_1E20D7D98;
  v10 = v8;
  v13 = v10;
  dispatch_async(v9, block);

  return v10;
}

+ (id)managerWithExtensionLookupPolicy:(id)a3 updateHandler:(id)a4
{
  id v6;
  id v7;
  _MXExtensionManager *v8;
  NSObject *v9;
  _MXExtensionManager *v10;
  id v11;
  void *v12;
  _MXExtensionManager *v13;
  _QWORD v15[4];
  _MXExtensionManager *v16;
  id v17;

  v6 = a4;
  v7 = a3;
  v8 = -[_MXExtensionManager initWithLookupPolicy:delegate:]([_MXExtensionManager alloc], "initWithLookupPolicy:delegate:", v7, 0);

  objc_msgSend(a1, "_queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70___MXExtensionManager_managerWithExtensionLookupPolicy_updateHandler___block_invoke;
  v15[3] = &unk_1E20D8238;
  v10 = v8;
  v16 = v10;
  v17 = v6;
  v11 = v6;
  dispatch_async(v9, v15);

  v12 = v17;
  v13 = v10;

  return v13;
}

+ (id)_queue
{
  if (_MergedGlobals_163 != -1)
    dispatch_once(&_MergedGlobals_163, &__block_literal_global_83);
  return (id)qword_1ECE2DD30;
}

- (_MXExtensionManager)initWithLookupPolicy:(id)a3 delegate:(id)a4
{
  return -[_MXExtensionManager initWithLookupPolicy:delegate:extensionProvider:](self, "initWithLookupPolicy:delegate:extensionProvider:", a3, a4, 0);
}

- (_MXExtensionManager)initWithLookupPolicy:(id)a3 delegate:(id)a4 extensionProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  _MXExtensionManager *v12;
  _MXExtensionManager *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    +[_MXExtensionProvider sharedProvider](_MXExtensionProvider, "sharedProvider");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15.receiver = self;
  v15.super_class = (Class)_MXExtensionManager;
  v12 = -[_MXExtensionManager init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v10);
    objc_storeStrong((id *)&v13->_lookupPolicy, a3);
    objc_storeStrong((id *)&v13->_extensionProvider, v11);
  }

  return v13;
}

- (void)invalidate
{
  void *v3;
  id matchingContext;

  if (self->_matchingContext)
  {
    +[_MXExtensionProvider sharedProvider](_MXExtensionProvider, "sharedProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeExtensionUpdateHandler:", self->_matchingContext);

    matchingContext = self->_matchingContext;
    self->_matchingContext = 0;

  }
}

- (void)dealloc
{
  objc_super v3;

  -[_MXExtensionManager invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_MXExtensionManager;
  -[_MXExtensionManager dealloc](&v3, sel_dealloc);
}

- (id)_applyExtensionPredicateWithExtensionsIfNeeded:(id)a3
{
  _MXExtensionLookupPolicy *lookupPolicy;
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    lookupPolicy = self->_lookupPolicy;
    v4 = a3;
    -[_MXExtensionLookupPolicy extensionPredicate](lookupPolicy, "extensionPredicate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v6;
}

+ (id)_extensionsWithLookupPolicy:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  +[_MXExtensionProvider sharedProvider](_MXExtensionProvider, "sharedProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_currentExtensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "extensionPredicate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filteredArrayUsingPredicate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

+ (id)_lookupPolicyForUIExtension
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CBD4C0];
  v7[0] = CFSTR("com.apple.maps.ui-services");
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_lookupPolicyWithExtensionPointNames:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_lookupPolicyForNonUIExtension
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CBD4B8];
  v7[0] = CFSTR("com.apple.maps.services");
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_lookupPolicyWithExtensionPointNames:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_lookupPolicyForAllExtensions
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("com.apple.maps.services");
  v7[1] = CFSTR("com.apple.maps.ui-services");
  v3 = *MEMORY[0x1E0CBD4C0];
  v7[2] = *MEMORY[0x1E0CBD4B8];
  v7[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_lookupPolicyWithExtensionPointNames:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_lookupPolicyForIntentsExtensions
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CBD4C0];
  v7[0] = *MEMORY[0x1E0CBD4B8];
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_lookupPolicyWithExtensionPointNames:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_lookupPolicyWithExtensionPointNames:(id)a3
{
  void *v3;
  _MXExtensionLookupPolicy *v4;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("extensionPointIdentifier"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_MXExtensionLookupPolicy initWithPredicate:]([_MXExtensionLookupPolicy alloc], "initWithPredicate:", v3);

  return v4;
}

+ (id)lookupPolicyForExtensionWithCapability:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62___MXExtensionManager_lookupPolicyForExtensionWithCapability___block_invoke;
  v8[3] = &unk_1E20DCAB0;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "_lookupPolicyWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)lookupPolicyForExtensionWithCapabilities:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64___MXExtensionManager_lookupPolicyForExtensionWithCapabilities___block_invoke;
  v8[3] = &unk_1E20DCAB0;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "_lookupPolicyWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_lookupPolicyForExtensionWithIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63___MXExtensionManager__lookupPolicyForExtensionWithIdentifier___block_invoke;
  v8[3] = &unk_1E20DCAB0;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "_lookupPolicyWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_lookupPolicyForExtensionSupportsIntentClassNames:(id)a3
{
  return (id)objc_msgSend(a1, "_lookupPolicyForExtensionWithContainingAppIdentifier:supportsIntentClassNames:", 0, a3);
}

+ (id)_lookupPolicyForExtensionWithContainingAppIdentifiers:(id)a3 supportsIntentClassNames:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __102___MXExtensionManager__lookupPolicyForExtensionWithContainingAppIdentifiers_supportsIntentClassNames___block_invoke;
  v11[3] = &unk_1E20DCB00;
  v12 = v6;
  v13 = v5;
  v7 = v5;
  v8 = v6;
  +[_MXExtensionManager _lookupPolicyWithBlock:](_MXExtensionManager, "_lookupPolicyWithBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_lookupPolicyForExtensionWithContainingAppIdentifier:(id)a3 supportsIntentClassNames:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(a1, "_lookupPolicyForExtensionWithContainingAppIdentifiers:supportsIntentClassNames:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (void)imageForKey:(id)a3 extension:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[_MXExtensionProvider sharedProvider](_MXExtensionProvider, "sharedProvider");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageForKey:extension:completion:", v9, v8, v7);

}

+ (id)_lookupPolicyWithBlock:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _MXExtensionLookupPolicy *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3880];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46___MXExtensionManager__lookupPolicyWithBlock___block_invoke;
  v9[3] = &unk_1E20DCB28;
  v10 = v3;
  v5 = v3;
  objc_msgSend(v4, "predicateWithBlock:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_MXExtensionLookupPolicy initWithPredicate:]([_MXExtensionLookupPolicy alloc], "initWithPredicate:", v6);

  return v7;
}

- (_MXExtensionLookupPolicy)lookupPolicy
{
  return self->_lookupPolicy;
}

- (id)matchingContext
{
  return self->_matchingContext;
}

- (void)setMatchingContext:(id)a3
{
  objc_storeStrong(&self->_matchingContext, a3);
}

- (_MXExtensionManagerDelegate)delegate
{
  return (_MXExtensionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_MXExtensionProvider)extensionProvider
{
  return self->_extensionProvider;
}

- (void)setExtensionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_extensionProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_matchingContext, 0);
  objc_storeStrong((id *)&self->_lookupPolicy, 0);
}

@end
