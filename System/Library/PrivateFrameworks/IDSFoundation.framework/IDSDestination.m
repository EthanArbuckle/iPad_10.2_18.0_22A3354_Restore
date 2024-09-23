@implementation IDSDestination

- (id)normalizedURIs
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  double v6;
  void *v7;

  objc_msgSend_destinationURIs(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___imSetByApplyingBlock_(v4, v5, (uint64_t)&unk_1E3C1B5D0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)normalizedURIStrings
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  double v6;
  void *v7;

  objc_msgSend_normalizedURIs(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___imSetByApplyingBlock_(v4, v5, (uint64_t)&unk_1E3C1C350, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (NSArray)classesForStrictUnarchiving
{
  const char *v2;
  double v3;
  _QWORD v5[10];

  v5[9] = *MEMORY[0x1E0C80C00];
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  v5[2] = objc_opt_class();
  v5[3] = objc_opt_class();
  v5[4] = objc_opt_class();
  v5[5] = objc_opt_class();
  v5[6] = objc_opt_class();
  v5[7] = objc_opt_class();
  v5[8] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2, (uint64_t)v5, v3, 9);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)destinationWithAlias:(id)a3 pushToken:(id)a4
{
  id v5;
  id v6;
  IDSDestinationPushToken *v7;
  const char *v8;
  double v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v7 = [IDSDestinationPushToken alloc];
  v10 = (void *)objc_msgSend_initWithAlias_pushToken_(v7, v8, (uint64_t)v6, v9, v5);

  return v10;
}

+ (id)destinationWithDestinations:(id)a3
{
  id v4;
  id v5;
  id v6;
  const char *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  double v16;
  id v17;
  const char *v18;
  double v19;
  const char *v20;
  double v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  const char *v26;
  double v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  double v31;
  const char *v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  IDSDestinationComposite *v36;
  const char *v37;
  double v38;
  void *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v6 = v4;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v41, v8, v45, 16);
  if (!v9)
    goto LABEL_21;
  v10 = v9;
  v11 = *(_QWORD *)v42;
  v12 = 0x1E3C19000uLL;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v42 != v11)
        objc_enumerationMutation(v6);
      v14 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v13);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_destinationWithString_(a1, v15, (uint64_t)v14, v16);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_destinationWithGroup_(a1, v20, (uint64_t)v14, v21);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v17 = v14;
LABEL_13:
        v22 = v17;
        if (!v17)
          goto LABEL_15;
LABEL_14:
        objc_msgSend_addObject_(v5, v18, (uint64_t)v22, v19);

        goto LABEL_15;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend_destinationURIs(v14, v18, v23, v19);
        v24 = v12;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_destinationWithStrings_(a1, v26, (uint64_t)v25, v27);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = v24;
        if (v22)
          goto LABEL_14;
      }
LABEL_15:
      ++v13;
    }
    while (v10 != v13);
    v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v18, (uint64_t)&v41, v19, v45, 16);
    v10 = v28;
  }
  while (v28);
LABEL_21:

  if (objc_msgSend_count(v5, v29, v30, v31) == 1)
  {
    objc_msgSend_firstObject(v5, v32, v33, v34);
    v35 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = [IDSDestinationComposite alloc];
    v35 = objc_msgSend_initWithDestinations_(v36, v37, (uint64_t)v5, v38);
  }
  v39 = (void *)v35;

  return v39;
}

+ (id)destinationWithString:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  IDSDestinationDevice *v9;
  const char *v10;
  double v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  IDSDestinationURI *v19;
  const char *v20;
  double v21;
  void *v22;

  v4 = a3;
  if (objc_msgSend_isDeviceURI_(IDSDestinationDevice, v5, (uint64_t)v4, v6))
  {
    v9 = [IDSDestinationDevice alloc];
    v12 = objc_msgSend_initWithDeviceURI_(v9, v10, (uint64_t)v4, v11);
  }
  else if (objc_msgSend_isEqualToString_(v4, v7, (uint64_t)CFSTR("__IDS_DEFAULT_PAIRED_DEVICE__"), v8))
  {
    objc_msgSend_defaultPairedDeviceDestination(a1, v13, v14, v15);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend_isEqualToString_(v4, v13, (uint64_t)CFSTR("____--SENTINEL--SELF--ALIAS--V0--____"), v15))
  {
    objc_msgSend_sentinelSelfAliasDestination(a1, v16, v17, v18);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = [IDSDestinationURI alloc];
    v12 = objc_msgSend_initWithURIString_(v19, v20, (uint64_t)v4, v21);
  }
  v22 = (void *)v12;

  return v22;
}

+ (id)destinationWithURI:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  uint64_t v9;
  IDSDestinationURI *v10;
  const char *v11;
  double v12;
  void *v13;

  v4 = a3;
  if (objc_msgSend_hasPrefix_(v4, v5, (uint64_t)CFSTR("guest-device:"), v6))
  {
    objc_msgSend_destinationWithRapportPublicIdentifierURI_(a1, v7, (uint64_t)v4, v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = [IDSDestinationURI alloc];
    v9 = objc_msgSend_initWithURIString_(v10, v11, (uint64_t)v4, v12);
  }
  v13 = (void *)v9;

  return v13;
}

+ (id)destinationWithStrings:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  const char *v10;
  double v11;
  void *v12;
  id v13;
  const char *v14;
  double v15;
  uint64_t v16;
  const char *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  double v24;
  const char *v25;
  double v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99E20]);
  v9 = objc_msgSend_count(v4, v6, v7, v8);
  v12 = (void *)objc_msgSend_initWithCapacity_(v5, v10, v9, v11);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = v4;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v29, v15, v33, 16);
  if (v16)
  {
    v19 = v16;
    v20 = *(_QWORD *)v30;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(v13);
        objc_msgSend_destinationWithString_(a1, v17, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v21), v18, (_QWORD)v29);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v12, v23, (uint64_t)v22, v24);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v17, (uint64_t)&v29, v18, v33, 16);
    }
    while (v19);
  }

  objc_msgSend_destinationWithDestinations_(a1, v25, (uint64_t)v12, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)destinationWithGroup:(id)a3
{
  id v3;
  IDSDestinationEngram *v4;
  const char *v5;
  double v6;
  void *v7;

  v3 = a3;
  v4 = [IDSDestinationEngram alloc];
  v7 = (void *)objc_msgSend_initWithENGroup_(v4, v5, (uint64_t)v3, v6);

  return v7;
}

+ (id)destinationWithStringURI:(id)a3 isLightWeight:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  IDSDestinationGroupSessionMember *v6;
  const char *v7;
  double v8;
  void *isLightWeight;

  v4 = a4;
  v5 = a3;
  v6 = [IDSDestinationGroupSessionMember alloc];
  isLightWeight = (void *)objc_msgSend_initWithURI_isLightWeight_(v6, v7, (uint64_t)v5, v8, v4);

  return isLightWeight;
}

+ (id)defaultPairedDeviceDestination
{
  return objc_alloc_init(IDSDestinationDefaultPairedDevice);
}

+ (id)sentinelSelfAliasDestination
{
  return objc_alloc_init(IDSDestinationSentinelSelfAlias);
}

+ (id)destinationWithRapportPublicIdentifierURI:(id)a3
{
  id v3;
  IDSDestinationDevice *v4;
  const char *v5;
  double v6;
  void *v7;

  v3 = a3;
  v4 = [IDSDestinationDevice alloc];
  v7 = (void *)objc_msgSend_initWithRapportPublicIdentifierURI_(v4, v5, (uint64_t)v3, v6);

  return v7;
}

+ (id)destinationWithDeviceURI:(id)a3
{
  id v3;
  IDSDestinationDevice *v4;
  const char *v5;
  double v6;
  void *v7;

  v3 = a3;
  v4 = [IDSDestinationDevice alloc];
  v7 = (void *)objc_msgSend_initWithIDSDeviceURI_(v4, v5, (uint64_t)v3, v6);

  return v7;
}

- (id)destinationURIs
{
  uint64_t v2;
  double v3;

  return (id)objc_msgSend_set(MEMORY[0x1E0C99E60], a2, v2, v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v3;
  void *v6;
  const char *v7;
  double v8;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, v8, self, CFSTR("IDSDestination.m"), 125, CFSTR("Abstract Method"));

  return 0;
}

- (BOOL)isGuest
{
  return 0;
}

- (BOOL)isDevice
{
  return 0;
}

- (BOOL)isEmpty
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  BOOL v8;

  objc_msgSend_destinationURIs(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_count(v4, v5, v6, v7) == 0;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (IDSDestination)initWithCoder:(id)a3
{
  double v3;
  void *v6;
  const char *v7;
  double v8;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, v8, self, CFSTR("IDSDestination.m"), 148, CFSTR("Abstract method"));

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  double v3;
  const char *v6;
  double v7;
  id v8;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v6, (uint64_t)a2, v7, self, CFSTR("IDSDestination.m"), 153, CFSTR("Abstract method"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  char isEqualToDestination;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    isEqualToDestination = objc_msgSend_isEqualToDestination_(self, v5, (uint64_t)v4, v6);
  else
    isEqualToDestination = 0;

  return isEqualToDestination;
}

- (BOOL)isEqualToDestination:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;

  if (self == a3)
    return 1;
  v4 = a3;
  objc_msgSend_destinationURIs(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_destinationURIs(v4, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend_isEqual_(v8, v13, (uint64_t)v12, v14);
  return (char)v4;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  unint64_t v8;

  objc_msgSend_destinationURIs(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

@end
