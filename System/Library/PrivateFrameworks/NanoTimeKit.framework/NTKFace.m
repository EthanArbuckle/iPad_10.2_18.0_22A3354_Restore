@implementation NTKFace

+ (void)initialize
{
  id v2;

  v2 = (id)objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
}

+ (BOOL)isRestrictedForDevice:(id)a3
{
  return 0;
}

+ (BOOL)_isInternalOnlyForDevice:(id)a3
{
  return 0;
}

void __53__NTKFace_availableInternalFaceDescriptorsForDevice___block_invoke_2(uint64_t a1, void *a2)
{
  NTKFaceDescriptor *v3;
  void *v4;
  NTKFaceDescriptor *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend((id)objc_msgSend(v6, "faceClass"), "_isInternalOnlyForDevice:", *(_QWORD *)(a1 + 32)))
  {
    v3 = [NTKFaceDescriptor alloc];
    objc_msgSend((id)objc_opt_class(), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[NTKFaceDescriptor initWithBundleIdentifier:](v3, "initWithBundleIdentifier:", v4);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }

}

void __56__NTKFace_allowedComplicationTypesFromDescriptors_slot___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;

  if (objc_msgSend(*(id *)(a1 + 32), "allowsType:inFace:", a2, *(_QWORD *)(a1 + 40)))
  {
    +[NTKFace _complicationTypeMigrations](NTKFace, "_complicationTypeMigrations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      objc_msgSend(*(id *)(a1 + 48), "addIndex:", a2);
  }
}

- (CLKDevice)device
{
  return self->_device;
}

+ (id)_complicationTypeMigrations
{
  if (_complicationTypeMigrations_onceToken != -1)
    dispatch_once(&_complicationTypeMigrations_onceToken, &__block_literal_global_88);
  return (id)_complicationTypeMigrations___complicationTypeMigrations;
}

+ (id)faceWithInstanceDescriptor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v27;

  v3 = a3;
  v4 = (void *)MEMORY[0x1BCCA7FA8]();
  objc_msgSend(v3, "faceJSONRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v27 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, &v27);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v27;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v6;
      objc_msgSend(v3, "nrDeviceUUID");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C944B0], "deviceForNRDeviceUUID:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
    }
    else
    {
      _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[NTKFace(NTKFaceInstanceDescriptorAdditions) faceWithInstanceDescriptor:].cold.2((uint64_t)v7, v9, v18, v19, v20, v21, v22, v23);
      v10 = 0;
      v8 = 0;
      v11 = 1;
    }

  }
  else
  {
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[NTKFace(NTKFaceInstanceDescriptorAdditions) faceWithInstanceDescriptor:].cold.1((uint64_t)v3, v7, v12, v13, v14, v15, v16, v17);
    v10 = 0;
    v8 = 0;
    v11 = 1;
  }

  objc_autoreleasePoolPop(v4);
  if (v11)
  {
    v24 = 0;
  }
  else
  {
    +[NTKFace faceWithJSONObjectRepresentation:forDevice:](NTKFace, "faceWithJSONObjectRepresentation:forDevice:", v8, v10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resourceDirectory");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setResourceDirectory:", v25);

  }
  return v24;
}

void __62__NTKFace__migrationExistsForComplicationType_rankedFamilies___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  id v8;

  v6 = objc_msgSend(a2, "integerValue");
  +[NTKBundleComplicationMigrationProvider cachedInstance](NTKBundleComplicationMigrationProvider, "cachedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "migratedComplicationFromType:family:device:", a1[6], v6, *(_QWORD *)(a1[4] + 104));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    *a4 = 1;
  }

}

void __53__NTKFace_availableInternalFaceDescriptorsForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t i;
  NTKFaceDescriptor *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 100; i != 102; ++i)
  {
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_faceClassForStyle:onDevice:", i, v3), "_isInternalOnlyForDevice:", v3))
    {
      v6 = -[NTKFaceDescriptor initWithFaceStyle:]([NTKFaceDescriptor alloc], "initWithFaceStyle:", i);
      if (v6)
        objc_msgSend(v4, "addObject:", v6);

    }
  }
  +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __53__NTKFace_availableInternalFaceDescriptorsForDevice___block_invoke_2;
  v15 = &unk_1E6BCE960;
  v16 = v3;
  v17 = v4;
  v8 = v4;
  v9 = v3;
  objc_msgSend(v7, "enumerateFaceBundlesOnDevice:withBlock:", v9, &v12);

  v10 = objc_msgSend(v8, "copy", v12, v13, v14, v15);
  v11 = (void *)availableInternalFaceDescriptorsForDevice____availableInternalFaceDescriptors;
  availableInternalFaceDescriptorsForDevice____availableInternalFaceDescriptors = v10;

}

uint64_t __50__NTKFace_isFaceStyleAvailableInternal_forDevice___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "faceStyle");
  if (*(_QWORD *)(a1 + 40) == result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __48__NTKFace_applyDefaultComplicationConfiguration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[7];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__30;
  v31 = __Block_byref_object_dispose__30;
  v7 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_initialDefaultComplicationForSlot:forDevice:", v5, v8);
  v32 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v28[5];
  if (!v9)
  {
    objc_msgSend(v6, "typesRankedList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v6, "typesRankedList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v24;
LABEL_4:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v12);
        v16 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v15), "unsignedIntegerValue");
        if (!v16)
          break;
        if (v11 < 2
          || (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "containsIndex:", v16) & 1) == 0)
        {
          if (objc_msgSend(v6, "allowsType:inFace:", v16, *(_QWORD *)(a1 + 32)))
          {
            objc_msgSend(*(id *)(a1 + 32), "_defaultComplicationOfType:forSlot:", v16, v5);
            v17 = objc_claimAutoreleasedReturnValue();
            v18 = (void *)v28[5];
            v28[5] = v17;

            objc_msgSend(*(id *)(a1 + 32), "rankedComplicationFamiliesForSlot:", v5);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v22[0] = MEMORY[0x1E0C809B0];
            v22[1] = 3221225472;
            v22[2] = __48__NTKFace_applyDefaultComplicationConfiguration__block_invoke_2;
            v22[3] = &unk_1E6BD0D98;
            v22[4] = *(_QWORD *)(a1 + 32);
            v22[5] = &v27;
            v22[6] = v16;
            objc_msgSend(v19, "enumerateObjectsUsingBlock:", v22);

            if (v28[5])
            {
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addIndex:", v16);
              break;
            }
          }
        }
        if (v13 == ++v15)
        {
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
          if (v13)
            goto LABEL_4;
          break;
        }
      }
    }

    v9 = v28[5];
    if (!v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "_defaultComplicationOfType:forSlot:", 0, v5);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v28[5];
      v28[5] = v20;

      v9 = v28[5];
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setComplication:forSlot:", v9, v5);
  _Block_object_dispose(&v27, 8);

}

uint64_t __40__NTKFace__updateComplicationTombstones__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKComplicationProvider providerForDevice:](NTKComplicationProvider, "providerForDevice:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "rankedComplicationFamiliesForSlot:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isComplicationAvailable:forFamilies:", v4, v7);

  return v8;
}

void __40__NTKFace__updateComplicationTombstones__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  char v6;
  id v7;
  void *v8;
  unsigned int (**v9)(_QWORD, _QWORD);
  NSObject *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  NSObject *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "complicationForSlot:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v6 = objc_opt_isKindOfClass();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __40__NTKFace__updateComplicationTombstones__block_invoke_4;
  v18 = &unk_1E6BD4E48;
  v19 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v20 = v7;
  v8 = _Block_copy(&v15);
  v9 = (unsigned int (**)(_QWORD, _QWORD))v8;
  if ((v6 & 1) != 0)
  {
    v10 = v4;
    -[NSObject complication](v10, "complication", v15, v16, v17, v18, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (((unsigned int (**)(_QWORD, void *))v9)[2](v9, v11))
    {
      _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v22 = v11;
        v23 = 2112;
        v24 = v10;
        v13 = "Tombstone: %@ is no longer a greenfield placeholder (%@)";
LABEL_9:
        _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0x16u);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if ((isKindOfClass & 1) != 0)
  {
    v10 = v4;
    -[NSObject complication](v10, "complication", v15, v16, v17, v18, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (((unsigned int (**)(_QWORD, void *))v9)[2](v9, v11))
    {
      _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v22 = v11;
        v23 = 2112;
        v24 = v10;
        v13 = "Tombstone: %@ is no longer a tombstone (%@)";
        goto LABEL_9;
      }
LABEL_10:

      v14 = v11;
LABEL_12:

      goto LABEL_13;
    }
LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  if (((*((uint64_t (**)(void *, void *))v8 + 2))(v8, v4) & 1) != 0)
  {
    v14 = 0;
    goto LABEL_15;
  }
  +[NTKComplicationTombstone tombstoneWithComplication:](NTKComplicationTombstone, "tombstoneWithComplication:", v4, v15, v16, v17, v18, v19);
  v14 = objc_claimAutoreleasedReturnValue();
  _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v4;
    v23 = 2112;
    v24 = v14;
    _os_log_impl(&dword_1B72A3000, v10, OS_LOG_TYPE_DEFAULT, "Tombstone: %@ is now a tombstone (%@)", buf, 0x16u);
  }
LABEL_13:

  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "setComplication:forSlot:", v14, v7);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
LABEL_15:

}

void __38__NTKFace__complicationTypeMigrations__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_complicationTypeMigrations___complicationTypeMigrations;
  _complicationTypeMigrations___complicationTypeMigrations = v0;

}

void __30__NTKFace__selectDefaultSlots__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_slotsForCustomEditMode:forDevice:", a2, v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    v6 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_defaultSelectedSlotForCustomEditMode:forDevice:", a2, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v8, v10);

    }
  }

}

- (void)toggleComplicationChangeObservation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("NTKRemoteComplicationProviderComplicationsDidChange"), 0);
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("NTKComplicationDidChangeNotification"), 0);
  if (v3)
  {
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__handleComplicationChangeNotification, CFSTR("NTKRemoteComplicationProviderComplicationsDidChange"), 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__handleComplicationChangeNotification, CFSTR("NTKWidgetComplicationProviderComplicationsDidChange"), 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__handleSingleComplicationDidChangeNotification_, CFSTR("NTKComplicationDidChangeNotification"), 0);
    +[NTKComplicationProvider providerForDevice:](NTKComplicationProvider, "providerForDevice:", self->_device);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerObserver:", self);
  }
  else
  {
    +[NTKComplicationProvider providerForDevice:](NTKComplicationProvider, "providerForDevice:", self->_device);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unregisterObserver:", self);
  }

}

- (BOOL)supportsPigmentEditOption
{
  void *v2;
  BOOL v3;

  objc_msgSend((id)objc_opt_class(), "pigmentFaceDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (void)enumerateCustomEditModesWithBlock:(id)a3
{
  void (**v4)(id, uint64_t, _BYTE *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  unsigned __int8 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _BYTE *))a3;
  v16 = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NTKFace _customEditModes](self, "_customEditModes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
      v11 = (void *)MEMORY[0x1BCCA7FA8]();
      v4[2](v4, objc_msgSend(v10, "integerValue"), &v16);
      LODWORD(v10) = v16;
      objc_autoreleasePoolPop(v11);
      if ((_DWORD)v10)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)enumerateComplicationSlotsWithBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[NTKFace _allComplications](self, "_allComplications");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateComplicationSlots:withBlock:", v6, v4);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[NTKFace _deleteResourceDirectoryIfOwned](self, "_deleteResourceDirectoryIfOwned");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("NTKRemoteComplicationProviderComplicationsDidChange"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("NTKComplicationDidChangeNotification"), 0);

  v5.receiver = self;
  v5.super_class = (Class)NTKFace;
  -[NTKFace dealloc](&v5, sel_dealloc);
}

- (id)complicationForSlot:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[NTKFaceConfiguration complicationForSlot:](self->_configuration, "complicationForSlot:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[NTKComplication nullComplication](NTKComplication, "nullComplication");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)applyDefaultConfiguration
{
  _QWORD v3[5];

  -[NTKFace applyDefaultComplicationConfiguration](self, "applyDefaultComplicationConfiguration");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__NTKFace_applyDefaultConfiguration__block_invoke;
  v3[3] = &unk_1E6BD4F08;
  v3[4] = self;
  -[NTKFace enumerateCustomEditModesWithBlock:](self, "enumerateCustomEditModesWithBlock:", v3);
}

- (void)applyDefaultComplicationConfiguration
{
  void *v3;
  char v4;
  NSObject *v5;
  NSDictionary *complicationSlotDescriptors;
  _QWORD v7[6];
  _QWORD v8[5];
  id v9;

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__30;
  v8[4] = __Block_byref_object_dispose__30;
  v9 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  +[NTKBundleComplicationMigrationProvider cachedInstance](NTKBundleComplicationMigrationProvider, "cachedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasTypeLookupForDevice:", self->_device);

  if ((v4 & 1) == 0)
  {
    _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[NTKFace applyDefaultComplicationConfiguration].cold.1(v5);

  }
  complicationSlotDescriptors = self->_complicationSlotDescriptors;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__NTKFace_applyDefaultComplicationConfiguration__block_invoke;
  v7[3] = &unk_1E6BD4F30;
  v7[4] = self;
  v7[5] = v8;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](complicationSlotDescriptors, "enumerateKeysAndObjectsUsingBlock:", v7);
  _Block_object_dispose(v8, 8);

}

- (id)allowedComplicationTypesFromDescriptors:(id)a3 slot:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  NTKFace *v18;
  id v19;

  v6 = (void *)MEMORY[0x1E0CB3788];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "indexSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "possibleTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__NTKFace_allowedComplicationTypesFromDescriptors_slot___block_invoke;
  v16[3] = &unk_1E6BD4E00;
  v17 = v10;
  v18 = self;
  v19 = v9;
  v12 = v9;
  v13 = v10;
  objc_msgSend(v11, "enumerateIndexesUsingBlock:", v16);
  v14 = (void *)objc_msgSend(v12, "copy");

  return v14;
}

- (id)allowedComplicationTypesForSlot:(id)a3
{
  return -[NTKFace allowedComplicationTypesFromDescriptors:slot:](self, "allowedComplicationTypesFromDescriptors:slot:", self->_complicationSlotDescriptors, a3);
}

- (void)_updateComplicationTombstones
{
  id WeakRetained;
  void *v4;
  CLKDevice *device;
  CLKDevice *v6;
  uint64_t v7;
  uint64_t v8;
  CLKDevice *v9;
  id v10;
  void *v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  if ((NTKIsDaemonOrFaceSnapshotService() & 1) != 0)
    return;
  os_unfair_lock_lock((os_unfair_lock_t)&_updateComplicationTombstones___lock);
  WeakRetained = objc_loadWeakRetained(&_updateComplicationTombstones___cachedDevice);
  if (!WeakRetained)
    goto LABEL_6;
  v4 = WeakRetained;
  device = self->_device;
  v6 = (CLKDevice *)objc_loadWeakRetained(&_updateComplicationTombstones___cachedDevice);
  if (device != v6)
  {

LABEL_6:
    v9 = self->_device;
    v10 = objc_storeWeak(&_updateComplicationTombstones___cachedDevice, v9);
    _updateComplicationTombstones___previousCLKDeviceVersion = -[CLKDevice version](v9, "version");

    +[NTKCompanionAppLibrary sharedAppLibrary](NTKCompanionAppLibrary, "sharedAppLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "prewarmCompanionDaemonWithCompletion:", &__block_literal_global_84_0);

    goto LABEL_7;
  }
  v7 = -[CLKDevice version](self->_device, "version");
  v8 = _updateComplicationTombstones___previousCLKDeviceVersion;

  if (v7 != v8)
    goto LABEL_6;
LABEL_7:
  os_unfair_lock_unlock((os_unfair_lock_t)&_updateComplicationTombstones___lock);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__NTKFace__updateComplicationTombstones__block_invoke_3;
  v12[3] = &unk_1E6BCFCE8;
  v12[4] = self;
  v12[5] = &v13;
  -[NTKFace enumerateComplicationSlotsWithBlock:](self, "enumerateComplicationSlotsWithBlock:", v12);
  if (*((_BYTE *)v14 + 24))
    -[NTKFace _notifyObserversFaceConfigurationDidChange](self, "_notifyObserversFaceConfigurationDidChange");
  _Block_object_dispose(&v13, 8);
}

- (void)_selectDefaultSlots
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__NTKFace__selectDefaultSlots__block_invoke;
  v6[3] = &unk_1E6BD4F08;
  v6[4] = self;
  -[NTKFace enumerateCustomEditModesWithBlock:](self, "enumerateCustomEditModesWithBlock:", v6);
  v3 = (void *)objc_opt_class();
  -[NTKFace device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_defaultSelectedComplicationSlotForDevice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[NSMutableDictionary setObject:forKey:](self->_selectedSlotsByEditMode, "setObject:forKey:", v5, &unk_1E6C9EF80);

}

- (id)_orderedComplicationSlots
{
  return (id)objc_msgSend((id)objc_opt_class(), "_orderedComplicationSlots");
}

- (BOOL)_migrationExistsForComplicationType:(unint64_t)a3 rankedFamilies:(id)a4
{
  id v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v6 = a4;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__NTKFace__migrationExistsForComplicationType_rankedFamilies___block_invoke;
  v8[3] = &unk_1E6BD0D98;
  v8[5] = &v9;
  v8[6] = a3;
  v8[4] = self;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);
  LOBYTE(a3) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return a3;
}

- (id)_initWithFaceStyle:(int64_t)a3 forDevice:(id)a4
{
  id v7;
  NTKFace *v8;
  NTKFace *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NTKFace;
  v8 = -[NTKFace init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_faceStyle = a3;
    objc_storeStrong((id *)&v8->_device, a4);
    -[NTKFace _commonInit](v9, "_commonInit");
    -[NTKFace toggleComplicationChangeObservation:](v9, "toggleComplicationChangeObservation:", 1);
  }

  return v9;
}

- (id)_disabledComplicationTypesIndexSet
{
  void *v2;
  void *v3;

  +[NTKComplicationProvider providerForDevice:](NTKComplicationProvider, "providerForDevice:", self->_device);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disabledComplicationTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_deleteResourceDirectoryIfOwned
{
  void *v3;
  NSString *resourceDirectory;

  if (self->_resourceDirectoryIsOwned)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeItemAtPath:error:", self->_resourceDirectory, 0);

    resourceDirectory = self->_resourceDirectory;
    self->_resourceDirectory = 0;

    self->_resourceDirectoryIsOwned = 0;
  }
}

- (id)_defaultComplicationOfType:(unint64_t)a3 forSlot:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[NTKFace _complicationProviderOptionsForSlot:](self, "_complicationProviderOptionsForSlot:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowedComplicationTypes:", v7);

  -[NTKFace device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKComplicationProvider providerForDevice:](NTKComplicationProvider, "providerForDevice:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "complicationsWithOptions:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_complicationSlotDescriptors
{
  return (id)objc_msgSend((id)objc_opt_class(), "_complicationSlotDescriptors");
}

- (id)_complicationProviderOptionsForSlot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  -[NTKFace allowedComplicationTypesForSlot:](self, "allowedComplicationTypesForSlot:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "addIndex:", 0);
  NTKLunarCalendarLocaleID();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    objc_msgSend(v6, "removeIndex:", 16);
  v8 = (void *)objc_opt_class();
  -[NTKFace device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_dateComplicationSlotForDevice:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "isEqualToString:", v10);

  v12 = (void *)objc_opt_new();
  if (objc_msgSend(v6, "containsIndex:", 1) && v11)
  {
    v13 = (void *)objc_opt_class();
    -[NTKFace device](self, "device");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "_dateComplicationSlotSupportedStylesForDevice:", v14);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __47__NTKFace__complicationProviderOptionsForSlot___block_invoke;
    v20[3] = &unk_1E6BD1F60;
    v21 = v12;
    NTKEnumerateDateStyles(v15, v20);

  }
  -[NSDictionary objectForKey:](self->_complicationSlotDescriptors, "objectForKey:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setAllowedComplicationTypes:", v6);
  objc_msgSend(v16, "familiesRankedList");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setRankedFamilies:", v18);
  objc_msgSend(v17, "setSupportedDateStyles:", v12);
  objc_msgSend(v17, "setAllowGenericDateComplication:", (v11 | -[NTKFace _migrationExistsForComplicationType:rankedFamilies:](self, "_migrationExistsForComplicationType:rankedFamilies:", 1, v18)) ^ 1);

  return v17;
}

- (void)_commonInit
{
  NTKPigmentEditOptionProvider *v3;
  NTKPigmentEditOptionProvider *pigmentOptionProvider;
  NTKFaceComplicationConfiguration *v5;
  NTKFaceComplicationConfiguration *complicationConfiguration;
  NSHashTable *v7;
  NSHashTable *fvcObservers;
  NSHashTable *v9;
  NSHashTable *observers;
  NSDictionary *v11;
  NSDictionary *complicationSlotDescriptors;
  NSMutableDictionary *v13;
  NSMutableDictionary *selectedSlotsByEditMode;
  NTKFaceConfiguration *v15;
  NTKFaceConfiguration *configuration;

  if (-[NTKFace supportsPigmentEditOption](self, "supportsPigmentEditOption"))
  {
    v3 = -[NTKPigmentEditOptionProvider initWithFace:]([NTKPigmentEditOptionProvider alloc], "initWithFace:", self);
    pigmentOptionProvider = self->_pigmentOptionProvider;
    self->_pigmentOptionProvider = v3;

  }
  objc_msgSend((id)objc_opt_class(), "complicationConfiguration");
  v5 = (NTKFaceComplicationConfiguration *)objc_claimAutoreleasedReturnValue();
  complicationConfiguration = self->_complicationConfiguration;
  self->_complicationConfiguration = v5;

  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  fvcObservers = self->_fvcObservers;
  self->_fvcObservers = v7;

  objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
  v9 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  observers = self->_observers;
  self->_observers = v9;

  -[NTKFace _complicationSlotDescriptors](self, "_complicationSlotDescriptors");
  v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  complicationSlotDescriptors = self->_complicationSlotDescriptors;
  self->_complicationSlotDescriptors = v11;

  self->_mostRecentEditMode = 0;
  v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  selectedSlotsByEditMode = self->_selectedSlotsByEditMode;
  self->_selectedSlotsByEditMode = v13;

  v15 = objc_alloc_init(NTKFaceConfiguration);
  configuration = self->_configuration;
  self->_configuration = v15;

  -[NTKFace _selectDefaultSlots](self, "_selectDefaultSlots");
}

- (id)_allComplications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[NTKFace _orderedComplicationSlots](self, "_orderedComplicationSlots");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = (void *)objc_msgSend(v3, "mutableCopy");

  -[NSDictionary allKeys](self->_complicationSlotDescriptors, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "minusSet:", v8);
    objc_msgSend(v7, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v9);

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pigmentOptionProvider, 0);
  objc_storeStrong((id *)&self->_complicationConfiguration, 0);
  objc_storeStrong((id *)&self->_companionGalleryName, 0);
  objc_storeStrong((id *)&self->_galleryName, 0);
  objc_storeStrong((id *)&self->_resourceDirectory, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_analyticsIdentifier, 0);
  objc_storeStrong((id *)&self->_externalAssets, 0);
  objc_storeStrong((id *)&self->_cachedDefaultName, 0);
  objc_storeStrong((id *)&self->_selectedSlotsByEditMode, 0);
  objc_storeStrong((id *)&self->_complicationSlotDescriptors, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_fvcObservers, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

+ (BOOL)isFaceStyleAvailableInternal:(int64_t)a3 forDevice:(id)a4
{
  id v6;
  BOOL v7;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v6 = a4;
  if (a3 == 44)
  {
    v7 = 0;
  }
  else
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    objc_msgSend(a1, "availableInternalFaceDescriptorsForDevice:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__NTKFace_isFaceStyleAvailableInternal_forDevice___block_invoke;
    v10[3] = &unk_1E6BD50C0;
    v10[4] = &v11;
    v10[5] = a3;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);
    v7 = *((_BYTE *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }

  return v7;
}

+ (void)enumerateComplicationSlots:(id)a3 withBlock:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD, char *);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, _QWORD, char *))a4;
  v16 = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v10)
        objc_enumerationMutation(v7);
      v6[2](v6, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11), &v16);
      if (v16)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

}

+ (id)defaultFaceOfStyle:(int64_t)a3 forDevice:(id)a4 initCustomization:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;

  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  if (a3 == 44)
  {
    if ((id)objc_opt_class() == a1)
    {
      v11 = 0;
      goto LABEL_9;
    }
    a3 = 44;
  }
  else
  {
    a1 = (id)objc_msgSend(a1, "_faceClassForStyle:onDevice:", a3, v8);
  }
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithFaceStyle:forDevice:", a3, v8);
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "applyDefaultConfiguration");
    if (v9)
      v9[2](v9, v11);
  }
LABEL_9:

  return v11;
}

+ (id)defaultAnalyticsIdentifierForBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "length");
    v6 = CFSTR("com.apple.NTK");
    if ((objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple.NTK")) & 1) != 0
      || (v6 = CFSTR("com.apple.NanoTimeKit.NTK"),
          objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple.NanoTimeKit.NTK"))))
    {
      v7 = -[__CFString length](v6, "length");
    }
    else
    {
      v7 = 0;
    }
    if (objc_msgSend(v4, "hasSuffix:", CFSTR("FaceBundle")))
      v5 -= objc_msgSend(CFSTR("FaceBundle"), "length");
    objc_msgSend(v4, "substringWithRange:", v7, v5 - v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)bundledFaceWithIdentifier:(id)a3 forDevice:(id)a4 initCustomization:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_class();
  +[NTKFace defaultAnalyticsIdentifierForBundleIdentifier:](NTKFace, "defaultAnalyticsIdentifierForBundleIdentifier:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundledFaceWithIdentifier:analyticsIdentifier:forDevice:initCustomization:", v9, v11, v8, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)bundledFaceWithIdentifier:(id)a3 analyticsIdentifier:(id)a4 forDevice:(id)a5 initCustomization:(id)a6
{
  id v10;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v10 = a3;
  v11 = a4;
  objc_msgSend(a1, "defaultFaceOfStyle:forDevice:initCustomization:", 44, a5, a6);
  v12 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    v14 = (void *)v12[12];
    v12[12] = v13;

    v15 = objc_msgSend(v11, "copy");
    v16 = (void *)v12[9];
    v12[9] = v15;

  }
  return v12;
}

+ (id)availableInternalFaceDescriptorsForDevice:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v13[5];

  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&availableInternalFaceDescriptorsForDevice____lock);
  WeakRetained = objc_loadWeakRetained(&availableInternalFaceDescriptorsForDevice____cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v6 = WeakRetained;
  v7 = objc_loadWeakRetained(&availableInternalFaceDescriptorsForDevice____cachedDevice);
  if (v7 != v4)
  {

LABEL_5:
    v10 = objc_storeWeak(&availableInternalFaceDescriptorsForDevice____cachedDevice, v4);
    availableInternalFaceDescriptorsForDevice____previousCLKDeviceVersion = objc_msgSend(v4, "version");

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __53__NTKFace_availableInternalFaceDescriptorsForDevice___block_invoke;
    v13[3] = &__block_descriptor_40_e19_v16__0__CLKDevice_8l;
    v13[4] = a1;
    __53__NTKFace_availableInternalFaceDescriptorsForDevice___block_invoke((uint64_t)v13, v4);
    goto LABEL_6;
  }
  v8 = objc_msgSend(v4, "version");
  v9 = availableInternalFaceDescriptorsForDevice____previousCLKDeviceVersion;

  if (v8 != v9)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&availableInternalFaceDescriptorsForDevice____lock);
  v11 = (id)availableInternalFaceDescriptorsForDevice____availableInternalFaceDescriptors;

  return v11;
}

+ (id)_slotsForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  return 0;
}

+ (id)_orderedComplicationSlots
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "complicationConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "complicationConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "orderedComplicationSlots");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (Class)_faceClassForStyle:(int64_t)a3 onDevice:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = 0;
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 6:
    case 7:
    case 8:
    case 10:
    case 12:
    case 14:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 41:
    case 42:
      goto LABEL_4;
    case 5:
    case 9:
    case 13:
    case 21:
    case 22:
    case 23:
    case 34:
    case 40:
    case 43:
      goto LABEL_8;
    case 11:
    case 15:
      goto LABEL_5;
    default:
      if ((unint64_t)(a3 - 200) > 0x21)
        goto LABEL_5;
      if (((1 << (a3 + 56)) & 0x3991F140FLL) != 0)
      {
LABEL_4:
        +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "faceBundleForFaceStyle:onDevice:", a3, v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "faceClass");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else if (a3 == 221 || a3 == 223)
      {
LABEL_8:
        objc_opt_class();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
LABEL_5:

      return (Class)v6;
  }
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "complicationConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "complicationConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "defaultSelectedComplicationSlotForDevice:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_dateComplicationSlotForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "complicationConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "complicationConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateComplicationSlotForDevice:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_complicationSlotDescriptors
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "complicationConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "complicationConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "complicationSlotDescriptors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA70];
  }
  return v5;
}

- (id)instanceDescriptor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NTKFaceInstanceDescriptor *v10;
  NSObject *v11;
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  NTKFace *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[NTKFace resourceDirectory](self, "resourceDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1BCCA7FA8]();
  -[NTKFace JSONObjectRepresentation](self, "JSONObjectRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 2, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;
  if (v6)
  {
    -[NTKFace device](self, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nrDeviceUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v4);
    v10 = -[NTKFaceInstanceDescriptor initWithJSONRepresentation:nrDeviceUUID:resourceDirectory:]([NTKFaceInstanceDescriptor alloc], "initWithJSONRepresentation:nrDeviceUUID:resourceDirectory:", v6, v9, v3);

  }
  else
  {
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138413058;
      v17 = v13;
      v18 = 2112;
      v19 = v7;
      v20 = 2112;
      v21 = v5;
      v22 = 2112;
      v23 = self;
      v14 = v13;
      _os_log_error_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_ERROR, "Face %@ failed to generate JSON %@ - %@ / %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v4);
    v10 = 0;
  }

  return v10;
}

- (id)bundleIdentifierForUpgrade
{
  return 0;
}

- (id)upgradeContext
{
  return 0;
}

+ (id)upgradeManagerWithFace:(id)a3 forDevice:(id)a4
{
  return 0;
}

- (void)_setFaceGalleryComplicationTypesForSlots:(id)a3
{
  -[NTKFace _setFaceGalleryComplicationTypesForSlots:canRepeat:](self, "_setFaceGalleryComplicationTypesForSlots:canRepeat:", a3, 0);
}

- (void)_setFaceGalleryComplicationTypesForSlots:(id)a3 canRepeat:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  NTKFace *v22;
  id v23;
  _QWORD *v24;
  BOOL v25;
  _QWORD v26[4];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v4 = a4;
  v6 = a3;
  -[NTKFace device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKComplicationProvider providerForDevice:](NTKComplicationProvider, "providerForDevice:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "disabledComplicationTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_opt_new();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  objc_msgSend(v6, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __84__NTKFace_FaceGalleryAdditions___setFaceGalleryComplicationTypesForSlots_canRepeat___block_invoke;
  v27[3] = &unk_1E6BD0D70;
  v27[4] = &v28;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v27);

  if (v4 && *((_BYTE *)v29 + 24))
  {
    +[NTKComplication allComplicationsOfType:](NTKComplication, "allComplicationsOfType:", 5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __84__NTKFace_FaceGalleryAdditions___setFaceGalleryComplicationTypesForSlots_canRepeat___block_invoke_3;
  v18[3] = &unk_1E6BD0DE8;
  v14 = v6;
  v19 = v14;
  v25 = v4;
  v15 = v10;
  v20 = v15;
  v24 = v26;
  v16 = v13;
  v21 = v16;
  v22 = self;
  v17 = v9;
  v23 = v17;
  -[NTKFace enumerateComplicationSlotsWithBlock:](self, "enumerateComplicationSlotsWithBlock:", v18);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);

}

uint64_t __84__NTKFace_FaceGalleryAdditions___setFaceGalleryComplicationTypesForSlots_canRepeat___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__NTKFace_FaceGalleryAdditions___setFaceGalleryComplicationTypesForSlots_canRepeat___block_invoke_2;
  v7[3] = &unk_1E6BD0D48;
  v7[4] = *(_QWORD *)(a1 + 32);
  result = objc_msgSend(a2, "enumerateObjectsUsingBlock:", v7);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    *a4 = 1;
  return result;
}

uint64_t __84__NTKFace_FaceGalleryAdditions___setFaceGalleryComplicationTypesForSlots_canRepeat___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "unsignedIntegerValue");
  if (result == 5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __84__NTKFace_FaceGalleryAdditions___setFaceGalleryComplicationTypesForSlots_canRepeat___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t *v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__11;
  v31 = __Block_byref_object_dispose__11;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84__NTKFace_FaceGalleryAdditions___setFaceGalleryComplicationTypesForSlots_canRepeat___block_invoke_5;
  v13[3] = &unk_1E6BD0DC0;
  v22 = *(_BYTE *)(a1 + 80);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 72);
  v14 = v5;
  v19 = v6;
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v15 = v7;
  v16 = v8;
  v9 = v3;
  v17 = v9;
  v18 = *(id *)(a1 + 64);
  v20 = &v27;
  v21 = &v23;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v13);
  if (!*((_BYTE *)v24 + 24))
  {
    v10 = v28[5];
    v11 = *(void **)(a1 + 56);
    if (v10)
    {
      objc_msgSend(v11, "setComplication:forSlot:", v10, v9);
    }
    else
    {
      +[NTKComplication anyComplicationOfType:](NTKComplication, "anyComplicationOfType:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setComplication:forSlot:", v12, v9);

    }
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

}

void __84__NTKFace_FaceGalleryAdditions___setFaceGalleryComplicationTypesForSlots_canRepeat___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a2;
  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  if (*(_BYTE *)(a1 + 96) || (objc_msgSend(*(id *)(a1 + 32), "containsIndex:", v7) & 1) == 0)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__11;
    v24 = __Block_byref_object_dispose__11;
    v25 = 0;
    if (v7 == 5
      && (v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), v8 < objc_msgSend(*(id *)(a1 + 40), "count")))
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v21[5];
      v21[5] = v9;

      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    }
    else
    {
      +[NTKComplication anyComplicationOfType:](NTKComplication, "anyComplicationOfType:", v7);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v21[5];
      v21[5] = v11;

    }
    objc_msgSend(*(id *)(a1 + 48), "rankedComplicationFamiliesForSlot:", *(_QWORD *)(a1 + 56));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __84__NTKFace_FaceGalleryAdditions___setFaceGalleryComplicationTypesForSlots_canRepeat___block_invoke_2_6;
    v19[3] = &unk_1E6BD0D98;
    v19[4] = *(_QWORD *)(a1 + 48);
    v19[5] = &v20;
    v19[6] = v7;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v19);
    if (v21[5])
    {
      v14 = objc_msgSend(*(id *)(a1 + 64), "containsIndex:", v7);
      v15 = v21[5];
      if (v14)
      {
        +[NTKComplicationTombstone tombstoneWithComplication:](NTKComplicationTombstone, "tombstoneWithComplication:", v15);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
        v18 = *(void **)(v17 + 40);
        *(_QWORD *)(v17 + 40) = v16;

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "setComplication:forSlot:", v15, *(_QWORD *)(a1 + 56));
        objc_msgSend(*(id *)(a1 + 32), "addIndex:", v7);
        *a4 = 1;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
      }
    }

    _Block_object_dispose(&v20, 8);
  }

}

void __84__NTKFace_FaceGalleryAdditions___setFaceGalleryComplicationTypesForSlots_canRepeat___block_invoke_2_6(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;

  v6 = objc_msgSend(a2, "integerValue");
  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[NTKWidgetComplicationMigrationDefines hasMigratedComplicationType:forDevice:](NTKWidgetComplicationMigrationDefines, "hasMigratedComplicationType:forDevice:", v7, v8);

  if (v9
    && (+[NTKWidgetComplicationMigrationDefines migrateComplication:forFamily:](NTKWidgetComplicationMigrationDefines, "migrateComplication:forFamily:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v6), (v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *a4 = 1;
  }
  else
  {
    +[NTKBundleComplicationMigrationProvider cachedInstance](NTKBundleComplicationMigrationProvider, "cachedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "migratedComplicationFromType:family:device:", v14, v6, v15);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    v16 = v20;
    if (v20)
    {
      +[NTKWidgetComplication complicationWithDescriptor:](NTKWidgetComplication, "complicationWithDescriptor:", v20);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

      v16 = v20;
      *a4 = 1;
    }

  }
}

- (BOOL)_faceGalleryDidUpdateFaceColorForColorEditOptionClass:(Class)a3 availableHardwareSpecificColorOptions:(id)a4 availableColorOptions:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a4;
  v8 = a5;
  if (objc_msgSend(v7, "count"))
    v9 = v7;
  else
    v9 = v8;
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[NTKFace selectOption:forCustomEditMode:slot:](self, "selectOption:forCustomEditMode:slot:", v10, 10, 0);
    objc_msgSend(v7, "removeObject:", v10);
    objc_msgSend(v8, "removeObject:", v10);
  }

  return v10 != 0;
}

- (id)_faceGalleryCalloutName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  -[NTKFace device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFace name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NTKFace faceStyle](self, "faceStyle") == 3 && objc_msgSend(v3, "deviceCategory") != 1)
  {
    -[NTKFace selectedOptionForCustomEditMode:slot:](self, "selectedOptionForCustomEditMode:slot:", 15, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(" (%@)"), v7);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = v4;
  }

  return v5;
}

- (BOOL)_faceGalleryIsRestricted
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;

  +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFace device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "faceBundleForFaceStyle:onDevice:", 26, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFace device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "faceBundleForFaceStyle:onDevice:", 33, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "faceClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_msgSend(v8, "faceClass");
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)_faceDescription
{
  void *v2;
  void *v3;

  -[NTKFace _faceDescriptionKey](self, "_faceDescriptionKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NTKClockFaceLocalizedString(v2, CFSTR("description"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_faceDescriptionKey
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = NTKEffectiveFaceStyleForFaceStyle(-[NTKFace faceStyle](self, "faceStyle"));
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("FACE_STYLE_%@_DESCRIPTION"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_faceDescriptionForLibrary
{
  void *v2;
  void *v3;
  void *v4;

  -[NTKFace _faceDescriptionKeyForLibrary](self, "_faceDescriptionKeyForLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    goto LABEL_4;
  NTKClockFaceLocalizedString(v2, CFSTR("library description"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v3))
  {

LABEL_4:
    v4 = 0;
  }

  return v4;
}

- (id)_faceDescriptionKeyForLibrary
{
  void *v2;
  void *v3;

  -[NTKFace _faceDescriptionKey](self, "_faceDescriptionKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("_LIBRARY"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_faceDescriptionForExternal
{
  void *v3;
  void *v4;

  -[NTKFace _faceDescriptionKeyForExternal](self, "_faceDescriptionKeyForExternal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_4;
  -[NTKFace _localizedStringForExternal:comment:](self, "_localizedStringForExternal:comment:", v3, CFSTR("external description"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v3))
  {

LABEL_4:
    v4 = 0;
  }

  return v4;
}

- (id)_faceDescriptionKeyForExternal
{
  void *v2;
  void *v3;

  -[NTKFace _faceDescriptionKey](self, "_faceDescriptionKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("_EXTERNAL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_localizedStringForExternal:(id)a3 comment:(id)a4
{
  return NTKClockFaceLocalizedString(a3, a4);
}

+ (id)pigmentFaceDomain
{
  return 0;
}

+ (id)additionalPigmentFaceDomains
{
  return 0;
}

+ (id)allPigmentFaceDomains
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pigmentFaceDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "pigmentFaceDomain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  objc_msgSend(a1, "additionalPigmentFaceDomains");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1, "additionalPigmentFaceDomains");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v7);

  }
  return v3;
}

- (void)handleColorEditOptionsChanged
{
  void (**v2)(_QWORD);
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__NTKFace_handleColorEditOptionsChanged__block_invoke;
  aBlock[3] = &unk_1E6BCD5F0;
  aBlock[4] = self;
  v2 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v2[2](v2);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v2);

}

void __40__NTKFace_handleColorEditOptionsChanged__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOptionsDidChangeForEditMode:", 10);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("NTKColorEditOptionsChangedNotificationName"), *(_QWORD *)(a1 + 32));

}

- (BOOL)deviceSupportsPigmentEditOption
{
  CLKDevice *device;
  void *v4;

  if (self->_forceUsingLegacyColorOptions)
    return 0;
  device = self->_device;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("A87D220D-4D8E-42CE-AB39-6E071D6B2B2C"));
  LODWORD(device) = -[CLKDevice supportsCapability:](device, "supportsCapability:", v4);

  return (_DWORD)device && -[NTKFace supportsPigmentEditOption](self, "supportsPigmentEditOption");
}

- (id)editOptionThatHidesAllComplications
{
  return 0;
}

- (id)editOptionsThatHideEditModes
{
  return 0;
}

- (id)localizedExplanationMessageForDisabledEditMode:(int64_t)a3
{
  return 0;
}

- (id)albumFaceContent
{
  return 0;
}

- (id)trackedPhotosContent
{
  return 0;
}

- (id)complicationSlotsHiddenByEditOption:(id)a3
{
  return 0;
}

+ (id)complicationConfiguration
{
  return 0;
}

- (BOOL)isValidConfigurationToAddToLibrary
{
  return 1;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [%@] [resources=%@]"), v5, self->_configuration, self->_resourceDirectory);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKFace;
  return -[NTKFace isEqual:](&v4, sel_isEqual_, a3);
}

- (void)addObserver:(id)a3
{
  char isKindOfClass;
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = 24;
  if ((isKindOfClass & 1) != 0)
    v5 = 16;
  objc_msgSend(*(id *)((char *)&self->super.isa + v5), "addObject:", v6);

}

- (void)removeObserver:(id)a3
{
  char isKindOfClass;
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = 24;
  if ((isKindOfClass & 1) != 0)
    v5 = 16;
  objc_msgSend(*(id *)((char *)&self->super.isa + v5), "removeObject:", v6);

}

- (void)setResourceDirectory:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_resourceDirectoryIsOwned || (NTKEqualStrings(v4, self->_resourceDirectory) & 1) == 0)
  {
    -[NTKFace _deleteResourceDirectoryIfOwned](self, "_deleteResourceDirectoryIfOwned");
    -[NTKFace _setResourceDirectory:](self, "_setResourceDirectory:", v4);
  }

}

- (void)setResourceDirectoryByTransferringOwnership:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_resourceDirectoryIsOwned || (NTKEqualStrings(v4, self->_resourceDirectory) & 1) == 0)
  {
    -[NTKFace _deleteResourceDirectoryIfOwned](self, "_deleteResourceDirectoryIfOwned");
    if (v5)
    {
      objc_msgSend((id)objc_opt_class(), "_linkedResourceRootDirectory");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByAppendingPathComponent:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      LODWORD(v8) = objc_msgSend(v10, "copyItemAtPath:toPath:error:", v5, v9, &v14);
      v11 = v14;

      if ((_DWORD)v8)
      {
        self->_resourceDirectoryIsOwned = 1;
      }
      else
      {
        _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          -[NTKFace description](self, "description");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v16 = v5;
          v17 = 2112;
          v18 = v13;
          v19 = 2112;
          v20 = v11;
          _os_log_error_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_ERROR, "Failed to copy face directory “%@” for face “%@”: %@", buf, 0x20u);

        }
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
    -[NTKFace _setResourceDirectory:](self, "_setResourceDirectory:", v9);

  }
}

- (void)setComplicationSlotDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_complicationSlotDescriptors, a3);
  -[NTKFace _selectDefaultSlots](self, "_selectDefaultSlots");
}

- (void)_setResourceDirectory:(id)a3
{
  NSString *resourceDirectory;
  id v5;
  NSString *v6;
  NSString *v7;
  id v8;

  resourceDirectory = self->_resourceDirectory;
  v5 = a3;
  v8 = (id)-[NSString copy](resourceDirectory, "copy");
  v6 = (NSString *)objc_msgSend(v5, "copy");

  v7 = self->_resourceDirectory;
  self->_resourceDirectory = v6;

  -[NTKFaceConfiguration setResourceDirectoryExists:](self->_configuration, "setResourceDirectoryExists:", self->_resourceDirectory != 0);
  -[NTKFace _updateForResourceDirectoryChange:](self, "_updateForResourceDirectoryChange:", v8);
  -[NTKFace _notifyObserversFaceResourceDirectoryDidChange](self, "_notifyObserversFaceResourceDirectoryDidChange");

}

- (void)_notifyObserversThatRespondToSelector:(SEL)a3 callSelector:(id)a4
{
  id v6;
  id v7;
  void (**v8)(void *, _QWORD);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD aBlock[4];
  id v28;
  SEL v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__NTKFace__notifyObserversThatRespondToSelector_callSelector___block_invoke;
  aBlock[3] = &unk_1E6BD4CE8;
  v29 = a3;
  v7 = v6;
  v28 = v7;
  v8 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = (void *)-[NSHashTable copy](self->_fvcObservers, "copy");
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v8[2](v8, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v11);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        v8[2](v8, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v18++));
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
    }
    while (v16);
  }

}

void __62__NTKFace__notifyObserversThatRespondToSelector_callSelector___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_notifyObserversFaceConfigurationDidChange
{
  _QWORD v2[5];

  if (self->_suppressingConfigurationChangeNotifications)
  {
    self->_configurationChangedWhileSuppressingNotifications = 1;
  }
  else
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __53__NTKFace__notifyObserversFaceConfigurationDidChange__block_invoke;
    v2[3] = &unk_1E6BD4D10;
    v2[4] = self;
    -[NTKFace _notifyObserversThatRespondToSelector:callSelector:](self, "_notifyObserversThatRespondToSelector:callSelector:", sel_faceConfigurationDidChange_, v2);
  }
}

uint64_t __53__NTKFace__notifyObserversFaceConfigurationDidChange__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "faceConfigurationDidChange:", *(_QWORD *)(a1 + 32));
}

- (void)_notifyObserversOptionsDidChangeForEditMode:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__NTKFace__notifyObserversOptionsDidChangeForEditMode___block_invoke;
  v3[3] = &unk_1E6BD4D38;
  v3[4] = self;
  v3[5] = a3;
  -[NTKFace _notifyObserversThatRespondToSelector:callSelector:](self, "_notifyObserversThatRespondToSelector:callSelector:", sel_face_didChangeOptionsForEditMode_, v3);
}

uint64_t __55__NTKFace__notifyObserversOptionsDidChangeForEditMode___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "face:didChangeOptionsForEditMode:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_notifyObserversComplicationDidChangeForSlot:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__NTKFace__notifyObserversComplicationDidChangeForSlot___block_invoke;
  v6[3] = &unk_1E6BD4D60;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NTKFace _notifyObserversThatRespondToSelector:callSelector:](self, "_notifyObserversThatRespondToSelector:callSelector:", sel_face_didChangeComplicationForSlot_, v6);

}

uint64_t __56__NTKFace__notifyObserversComplicationDidChangeForSlot___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "face:didChangeComplicationForSlot:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_notifyObserversFaceResourceDirectoryDidChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __57__NTKFace__notifyObserversFaceResourceDirectoryDidChange__block_invoke;
  v2[3] = &unk_1E6BD4D10;
  v2[4] = self;
  -[NTKFace _notifyObserversThatRespondToSelector:callSelector:](self, "_notifyObserversThatRespondToSelector:callSelector:", sel_faceResourceDirectoryDidChange_, v2);
}

uint64_t __57__NTKFace__notifyObserversFaceResourceDirectoryDidChange__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "faceResourceDirectoryDidChange:", *(_QWORD *)(a1 + 32));
}

- (void)_notifyObserversFaceTimeStyleChanged
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __47__NTKFace__notifyObserversFaceTimeStyleChanged__block_invoke;
  v2[3] = &unk_1E6BD4D10;
  v2[4] = self;
  -[NTKFace _notifyObserversThatRespondToSelector:callSelector:](self, "_notifyObserversThatRespondToSelector:callSelector:", sel_faceDidChangeTimeStyle_, v2);
}

uint64_t __47__NTKFace__notifyObserversFaceTimeStyleChanged__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "faceDidChangeTimeStyle:", *(_QWORD *)(a1 + 32));
}

- (void)_notifyObserversFaceUpgradeOccurred
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46__NTKFace__notifyObserversFaceUpgradeOccurred__block_invoke;
  v2[3] = &unk_1E6BD4D10;
  v2[4] = self;
  -[NTKFace _notifyObserversThatRespondToSelector:callSelector:](self, "_notifyObserversThatRespondToSelector:callSelector:", sel_faceUpgradeOccurred_, v2);
}

uint64_t __46__NTKFace__notifyObserversFaceUpgradeOccurred__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "faceUpgradeOccurred:", *(_QWORD *)(a1 + 32));
}

- (BOOL)_shouldHideUI
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(ViewClassForFace(self), "uiSensitivity");
  objc_msgSend(MEMORY[0x1E0C94518], "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "shouldHideForSensitivity:", v2);

  return v2;
}

- (NSString)dailySnapshotKey
{
  void *v2;
  void *v3;

  -[NTKFace unsafeDailySnapshotKey](self, "unsafeDailySnapshotKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NTKSanitizedFileNameFromStableIdentifier(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)unadornedSnapshotKey
{
  void *v2;
  void *v3;
  void *v4;

  -[NTKFace unsafeDailySnapshotKey](self, "unsafeDailySnapshotKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("unadorned"), "stringByAppendingString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  NTKSanitizedFileNameFromStableIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)unsafeDailySnapshotKey
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  int64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (-[NTKFace _shouldHideUI](self, "_shouldHideUI"))
    return (NSString *)CFSTR("sensitive");
  v4 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_faceStyle);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("face%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKFaceConfiguration appendEditModesToDailySnapshotKey:](self->_configuration, "appendEditModesToDailySnapshotKey:", v6);
  if (-[NSDictionary count](self->_complicationSlotDescriptors, "count"))
  {
    objc_msgSend(v6, "appendString:", CFSTR("-"));
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[NTKFace _sortedComplicationSlots](self, "_sortedComplicationSlots");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v36 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          -[NTKFace complicationForSlot:](self, "complicationForSlot:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendString:", CFSTR("("));
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", NTKPrintableComplicationType(objc_msgSend(v12, "complicationType")));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendFormat:", CFSTR("%@"), v13);

          v14 = -[NTKFace preferredComplicationFamilyForComplication:withSlot:](self, "preferredComplicationFamilyForComplication:withSlot:", v12, v11);
          -[NTKFace device](self, "device");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "customDailySnapshotKeyForFamily:device:", v14, v15);
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v16;
          if (v16)
            objc_msgSend(v6, "appendFormat:", CFSTR("-%@"), v16);

          objc_msgSend(v6, "appendString:", CFSTR(")"));
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v8);
    }

  }
  if (-[NTKFace complicationExistenceInvalidatesSnapshot](self, "complicationExistenceInvalidatesSnapshot"))
  {
    objc_msgSend(v6, "appendString:", CFSTR("-("));
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[NTKFace _sortedComplicationSlots](self, "_sortedComplicationSlots");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v32 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
          -[NTKFace complicationForSlot:](self, "complicationForSlot:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "complicationType"))
            objc_msgSend(v6, "appendString:", v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v20);
    }

    objc_msgSend(v6, "appendString:", CFSTR(")"));
  }
  objc_msgSend(v6, "appendFormat:", CFSTR("-(%lu)"), -[CLKDevice sizeClass](self->_device, "sizeClass"));
  -[NTKFace _resourceDirectorySnapshotKey](self, "_resourceDirectorySnapshotKey");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (v25)
    objc_msgSend(v6, "appendFormat:", CFSTR("-%@"), v25);
  -[NTKFace device](self, "device");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = NTKMonochromeComplicationsEnabledForDevice();

  if (v28)
    objc_msgSend(v6, "appendString:", CFSTR("-mc"));
  -[NTKFaceConfiguration appendCustomDataToDailySnapshotKey:](self->_configuration, "appendCustomDataToDailySnapshotKey:", v6);
  v29 = (void *)objc_msgSend(v6, "copy");

  return (NSString *)v29;
}

- (BOOL)complicationExistenceInvalidatesSnapshot
{
  void *v3;
  void *v4;
  char v5;

  -[NTKFace complicationConfiguration](self, "complicationConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[NTKFace complicationConfiguration](self, "complicationConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "complicationExistenceInvalidatesSnapshot");

  return v5;
}

- (BOOL)_complication:(id)a3 appearsInDailySnapshotForSlot:(id)a4
{
  id v6;

  v6 = a3;
  LOBYTE(a4) = objc_msgSend(v6, "appearsInDailySnapshotForFamily:", -[NTKFace preferredComplicationFamilyForComplication:withSlot:](self, "preferredComplicationFamilyForComplication:withSlot:", v6, a4));

  return (char)a4;
}

- (BOOL)wantsUnadornedSnapshot
{
  return 0;
}

- (BOOL)_wantsUnadornedSnapshot
{
  return 0;
}

- (NSString)name
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[NTKFaceConfiguration name](self->_configuration, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[NTKFace _defaultName](self, "_defaultName");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (void)setName:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NTKFaceConfiguration name](self->_configuration, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    -[NTKFaceConfiguration setName:](self->_configuration, "setName:", v6);
    -[NTKFace _notifyObserversFaceConfigurationDidChange](self, "_notifyObserversFaceConfigurationDidChange");
  }

}

- (NSString)companionGalleryName
{
  return 0;
}

- (id)selectedOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v6 = a4;
  -[NTKFaceConfiguration optionForCustomEditMode:slot:](self->_configuration, "optionForCustomEditMode:slot:", a3, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[NTKFace _validOptionForOption:mode:slot:configuration:](self, "_validOptionForOption:mode:slot:configuration:", v7, a3, v6, self->_configuration);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)selectOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a5;
  -[NTKFace replacedOptionWithFulfilledOption:forEditMode:slot:](self, "replacedOptionWithFulfilledOption:forEditMode:slot:", a3, a4, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKFaceConfiguration optionForCustomEditMode:slot:](self->_configuration, "optionForCustomEditMode:slot:", a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceConfiguration setOption:forCustomEditMode:slot:](self->_configuration, "setOption:forCustomEditMode:slot:", v10, a4, v8);
  if ((NTKEqualObjects(v10, v9) & 1) == 0)
  {
    -[NTKFace _noteOptionChangedFrom:to:forCustomEditMode:slot:](self, "_noteOptionChangedFrom:to:forCustomEditMode:slot:", v9, v10, a4, v8);
    -[NTKFace _notifyObserversFaceConfigurationDidChange](self, "_notifyObserversFaceConfigurationDidChange");
  }

}

- (void)selectOptions:(id)a3 forCustomEditMode:(int64_t)a4
{
  id v6;
  NTKFaceConfiguration *v7;
  NTKFaceConfiguration *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  NTKFaceConfiguration *v13;
  NTKFace *v14;
  uint64_t *v15;
  int64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = self->_configuration;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __43__NTKFace_selectOptions_forCustomEditMode___block_invoke;
  v12 = &unk_1E6BD4D88;
  v8 = v7;
  v13 = v8;
  v14 = self;
  v15 = &v17;
  v16 = a4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v9);
  if (*((_BYTE *)v18 + 24))
    -[NTKFace _notifyObserversFaceConfigurationDidChange](self, "_notifyObserversFaceConfigurationDidChange", v9, v10, v11, v12);

  _Block_object_dispose(&v17, 8);
}

void __43__NTKFace_selectOptions_forCustomEditMode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "optionForCustomEditMode:slot:", *(_QWORD *)(a1 + 56), v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setOption:forCustomEditMode:slot:", v5, *(_QWORD *)(a1 + 56), v7);
  if ((NTKEqualObjects(v5, v6) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_noteOptionChangedFrom:to:forCustomEditMode:slot:", v6, v5, *(_QWORD *)(a1 + 56), v7);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (id)defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  if (a3 == 10 && -[NTKFace deviceSupportsPigmentEditOption](self, "deviceSupportsPigmentEditOption"))
  {
    -[NTKFace pigmentOptionProvider](self, "pigmentOptionProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "defaultColorOptionForSlot:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NTKFace _defaultOptionForCustomEditMode:slot:](self, "_defaultOptionForCustomEditMode:slot:", a3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)localizedNameForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(a1, "_localizedNameOverrideForCustomEditMode:forDevice:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    NTKLocalizedNameForCustomEditMode(a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)selectedSlotOptionsForCustomEditMode:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  int64_t v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__NTKFace_selectedSlotOptionsForCustomEditMode___block_invoke;
  v10[3] = &unk_1E6BD4DB0;
  v10[4] = self;
  v12 = a3;
  v6 = v5;
  v11 = v6;
  -[NTKFace enumerateSlotsForCustomEditMode:withBlock:](self, "enumerateSlotsForCustomEditMode:withBlock:", a3, v10);
  v7 = v11;
  v8 = v6;

  return v8;
}

void __48__NTKFace_selectedSlotOptionsForCustomEditMode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "selectedOptionForCustomEditMode:slot:", *(_QWORD *)(a1 + 48), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_5;
  objc_msgSend(*(id *)(a1 + 32), "defaultOptionForCustomEditMode:slot:", *(_QWORD *)(a1 + 48), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __48__NTKFace_selectedSlotOptionsForCustomEditMode___block_invoke_cold_1();

  if (v4)
  {
LABEL_5:
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v4, v3);

  }
}

- (id)selectedOptionsForCustomEditModes
{
  void *v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  uint64_t v20;
  __int128 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  -[NTKFace editModes](self, "editModes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (id)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v48, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v31;
    *(_QWORD *)&v6 = 138413826;
    v22 = v6;
    v28 = v4;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v9);
        v11 = objc_msgSend(v10, "integerValue", v22);
        if (v11 != 1)
        {
          v12 = v11;
          -[NTKFace slotsForCustomEditMode:](self, "slotsForCustomEditMode:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "firstObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKFace selectedOptionForCustomEditMode:slot:](self, "selectedOptionForCustomEditMode:slot:", v12, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            goto LABEL_11;
          -[NTKFace defaultOptionForCustomEditMode:slot:](self, "defaultOptionForCustomEditMode:slot:", v12, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v19 = (objc_class *)objc_opt_class();
            NSStringFromClass(v19);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v35 = v26;
            v36 = 2048;
            v37 = v12;
            _os_log_error_impl(&dword_1B72A3000, v16, OS_LOG_TYPE_ERROR, "MISSING SELECTION FOR AN EDIT OPTION (face: %@, editMode: %ld). falling back to default edit option.", buf, 0x16u);

          }
          v4 = v28;
          if (v15)
          {
LABEL_11:
            objc_msgSend(v29, "setObject:forKey:", v15, v10);
          }
          else
          {
            -[NTKFace device](self, "device");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[NTKFace faceDescriptor](self, "faceDescriptor");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
            {
              NTKFaceBundleStringFromCustomEditMode(v12);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v15, "isRunningGraceOrLater"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "nrDevice");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v15, "nrDeviceVersion"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v22;
              v35 = v27;
              v36 = 2048;
              v37 = v12;
              v38 = 2112;
              v39 = v17;
              v40 = 2112;
              v41 = v15;
              v42 = 2112;
              v43 = v24;
              v44 = 2112;
              v45 = v25;
              v46 = 2112;
              v47 = v23;
              _os_log_fault_impl(&dword_1B72A3000, v18, OS_LOG_TYPE_FAULT, "Rare Clock Bug: Edit Mode %@ (%ld) has a bad default option for face %@:\n<<<Face>>> CLKDevice <%@>, isRunningGraceOrLater <%@>, NRDevice <%@>, NRDeviceVersion <%@>", buf, 0x48u);

            }
            v4 = v28;
          }

        }
        ++v9;
      }
      while (v7 != v9);
      v20 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v48, 16);
      v7 = v20;
    }
    while (v20);
  }

  return v29;
}

- (id)nameOfSelectedOptionForCustomEditMode:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[NTKFace slotsForCustomEditMode:](self, "slotsForCustomEditMode:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFace selectedOptionForCustomEditMode:slot:](self, "selectedOptionForCustomEditMode:slot:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)namesOfSelectedOptionsForCustomEditModes
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NTKFace editModes](self, "editModes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "integerValue", (_QWORD)v13);
        if (v10 != 1)
        {
          -[NTKFace nameOfSelectedOptionForCustomEditMode:](self, "nameOfSelectedOptionForCustomEditMode:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v4, "addObject:", v11);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)setCustomData:(id)a3 forKey:(id)a4
{
  NTKFaceConfiguration *configuration;
  id v7;
  id v8;
  id v9;

  configuration = self->_configuration;
  v7 = a4;
  v8 = a3;
  -[NTKFaceConfiguration customDataForKey:](configuration, "customDataForKey:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKFaceConfiguration setCustomData:forKey:](self->_configuration, "setCustomData:forKey:", v8, v7);

  LOBYTE(configuration) = NTKEqualObjects(v9, v8);
  if ((configuration & 1) == 0)
    -[NTKFace _notifyObserversFaceConfigurationDidChange](self, "_notifyObserversFaceConfigurationDidChange");

}

- (id)customDataForKey:(id)a3
{
  return -[NTKFaceConfiguration customDataForKey:](self->_configuration, "customDataForKey:", a3);
}

- (id)editOptionsForCustomEditModes
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  id v17;
  uint64_t v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[NTKFace editModes](self, "editModes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "removeObject:", &unk_1E6C9EF80);
  v19 = objc_msgSend(v4, "count");
  if (v19)
    -[NTKFace prepareEditOptions](self, "prepareEditOptions");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v4;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  v5 = 0;
  if (v22)
  {
    v21 = *(_QWORD *)v24;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(obj);
        v7 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v6), "integerValue", v19);
        -[NTKFace _editOptionsForEditMode:slot:](self, "_editOptionsForEditMode:slot:", v7, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "count"))
        {
          if (!v5)
            v5 = (void *)objc_opt_new();
          v9 = -[NTKFace _collectionTypeForEditMode:](self, "_collectionTypeForEditMode:", v7);
          v10 = (void *)objc_opt_class();
          -[NTKFace device](self, "device");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "localizedNameForCustomEditMode:forDevice:", v7, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[NTKEditOptionCollection editOptionCollectionWithEditMode:localizedName:options:collectionType:](NTKEditOptionCollection, "editOptionCollectionWithEditMode:localizedName:options:collectionType:", v7, v12, v8, v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          -[NTKFace device](self, "device");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "filteredCollectionForDevice:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (-[NTKFace dynamicEditMode](self, "dynamicEditMode") != v7)
            objc_msgSend(v5, "addObject:", v15);
          if (v9 == 5 && -[NTKFace numberOfDynamicSections](self, "numberOfDynamicSections"))
          {
            v16 = 0;
            do
            {
              v17 = -[NTKFace newDynamicEditOptionCollectionForSection:](self, "newDynamicEditOptionCollectionForSection:", v16);
              objc_msgSend(v5, "addObject:", v17);

              ++v16;
            }
            while (v16 < -[NTKFace numberOfDynamicSections](self, "numberOfDynamicSections"));
          }

        }
        ++v6;
      }
      while (v6 != v22);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v22);
  }

  if (v19)
    -[NTKFace cleanupEditOptions](self, "cleanupEditOptions");

  return v5;
}

- (id)_editOptionsForEditMode:(int64_t)a3 slot:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t i;
  void *v16;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[NTKFace slotsForCustomEditMode:](self, "slotsForCustomEditMode:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  v10 = -[NTKFace numberOfOptionsForCustomEditMode:slot:](self, "numberOfOptionsForCustomEditMode:slot:", a3, v7);
  if (v10)
  {
    v11 = v10;
    if (a3 == 10 && -[NTKFace deviceSupportsPigmentEditOption](self, "deviceSupportsPigmentEditOption"))
    {
      -[NTKFace pigmentOptionProvider](self, "pigmentOptionProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "availableColorsForSlot:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = 0; i != v11; ++i)
      {
        -[NTKFace optionAtIndex:forCustomEditMode:slot:](self, "optionAtIndex:forCustomEditMode:slot:", i, a3, v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v16);

      }
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)_collectionTypeForEditMode:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;

  v5 = objc_opt_class();
  -[NTKFace device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend((id)v5, "customEditModeIsColor:forDevice:", a3, v6);

  if ((v5 & 1) != 0)
    return 1;
  v8 = objc_opt_class();
  -[NTKFace device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend((id)v8, "customEditModeIsRows:forDevice:", a3, v9);

  if ((v8 & 1) != 0)
    return 2;
  v10 = objc_opt_class();
  -[NTKFace device](self, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_msgSend((id)v10, "customEditModeIsShowSeconds:forDevice:", a3, v11);

  if ((v10 & 1) != 0)
    return 3;
  v12 = (void *)objc_opt_class();
  -[NTKFace device](self, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "customEditModeDeterminesDynamicSections:forDevice:", a3, v13);

  if (v14)
    return 5;
  else
    return 0;
}

- (id)newDynamicEditOptionCollectionForSection:(unint64_t)a3
{
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NTKEditOptionCollection *v9;
  void *v10;
  NTKEditOptionCollection *v11;

  v5 = -[NTKFace dynamicEditMode](self, "dynamicEditMode");
  -[NTKFace slotsForCustomEditMode:](self, "slotsForCustomEditMode:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") <= a3)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[NTKFace localizedNameForDynamicSectionCustomEditMode:slot:](self, "localizedNameForDynamicSectionCustomEditMode:slot:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [NTKEditOptionCollection alloc];
  -[NTKFace _editOptionsForEditMode:slot:](self, "_editOptionsForEditMode:slot:", v5, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NTKEditOptionCollection initWithEditMode:localizedName:options:collectionType:slot:](v9, "initWithEditMode:localizedName:options:collectionType:slot:", v5, v8, v10, -[NTKFace _collectionTypeForEditMode:](self, "_collectionTypeForEditMode:", v5), v7);

  return v11;
}

- (id)_localizedNameForDynamicSectionCustomEditMode:(int64_t)a3 slot:(id)a4
{
  void *v6;
  void *v7;
  void *v8;

  v6 = (void *)objc_opt_class();
  -[NTKFace device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedNameForCustomEditMode:forDevice:", a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setComplication:(id)a3 forSlot:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v9 = a3;
  v6 = a4;
  v7 = (uint64_t)v9;
  if (!v9)
  {
    +[NTKComplication nullComplication](NTKComplication, "nullComplication");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (id)v7;
  -[NTKFace complicationForSlot:](self, "complicationForSlot:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceConfiguration setComplication:forSlot:](self->_configuration, "setComplication:forSlot:", v10, v6);
  if ((NTKEqualObjects(v10, v8) & 1) == 0)
  {
    -[NTKFace _notifyObserversFaceConfigurationDidChange](self, "_notifyObserversFaceConfigurationDidChange");
    -[NTKFace _notifyObserversComplicationDidChangeForSlot:](self, "_notifyObserversComplicationDidChangeForSlot:", v6);
  }

}

+ (void)enumerateComplicationSlotsWithBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend(a1, "_orderedComplicationSlots");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateComplicationSlots:withBlock:", v6, v4);

}

- (void)enumerateVisibleComplicationSlotsForCurrentConfigurationWithBlock:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, char *))a3;
  v14 = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NTKFace allVisibleComplicationsForCurrentConfiguration](self, "allVisibleComplicationsForCurrentConfiguration", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v8)
        objc_enumerationMutation(v5);
      v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9), &v14);
      if (v14)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)allVisibleComplicationsForCurrentConfiguration
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  -[NTKFace _allComplications](self, "_allComplications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__30;
  v23 = __Block_byref_object_dispose__30;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[NTKFace editOptionThatHidesAllComplications](self, "editOptionThatHidesAllComplications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__NTKFace_allVisibleComplicationsForCurrentConfiguration__block_invoke;
  v10[3] = &unk_1E6BD4DD8;
  v10[4] = self;
  v13 = &v15;
  v5 = v4;
  v11 = v5;
  v14 = &v19;
  v6 = v3;
  v12 = v6;
  -[NTKFace enumerateCustomEditModesWithBlock:](self, "enumerateCustomEditModesWithBlock:", v10);
  if (*((_BYTE *)v16 + 24))
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    if (objc_msgSend((id)v20[5], "count"))
    {
      objc_msgSend(v6, "arrayByExcludingObjectsInArray:", v20[5]);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v6;
    }
    v7 = v8;
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

void __57__NTKFace_allVisibleComplicationsForCurrentConfiguration__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "selectedOptionForCustomEditMode:slot:", a2, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v12, "isEqual:", *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    *a3 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "selectedOptionForCustomEditMode:slot:", a2, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "complicationSlotsHiddenByEditOption:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      if (!v8)
      {
        v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v11 = *(void **)(v10 + 40);
        *(_QWORD *)(v10 + 40) = v9;

        v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      }
      objc_msgSend(v8, "addObjectsFromArray:", v7);
    }

  }
}

- (BOOL)isFullscreenConfiguration
{
  void *v2;
  BOOL v3;

  -[NTKFace allVisibleComplicationsForCurrentConfiguration](self, "allVisibleComplicationsForCurrentConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (id)nightModeConfiguration
{
  return CFSTR("unsupported");
}

- (int64_t)preferredComplicationFamilyForComplication:(id)a3 withSlot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSDictionary objectForKey:](self->_complicationSlotDescriptors, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "familiesRankedList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "complicationType"))
  {
    v20 = v9;
    v21 = v7;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      while (2)
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v15 = objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v14), "integerValue", v20);
          if (objc_msgSend(v8, "allowsFamily:inFace:", v15, self))
          {
            -[NTKFace device](self, "device");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v6, "supportsComplicationFamily:forDevice:", v15, v16);

            if ((v17 & 1) != 0)
            {
              v9 = v20;
              v7 = v21;
              goto LABEL_16;
            }
          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v12)
          continue;
        break;
      }
    }

    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v18 = objc_claimAutoreleasedReturnValue();
    v7 = v21;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[NTKFace preferredComplicationFamilyForComplication:withSlot:].cold.1();

    v9 = v20;
  }
  objc_msgSend(v9, "firstObject", v20);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v10, "integerValue");
LABEL_16:

  return v15;
}

- (id)complicationVariantForComplication:(id)a3 withSlot:(id)a4
{
  return +[NTKComplicationVariant defaultVariantForFamily:device:](NTKComplicationVariant, "defaultVariantForFamily:device:", -[NTKFace preferredComplicationFamilyForComplication:withSlot:](self, "preferredComplicationFamilyForComplication:withSlot:", a3, a4), self->_device);
}

- (id)rankedComplicationFamiliesForSlot:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_complicationSlotDescriptors, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "familiesRankedList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)slot:(id)a3 supportsFamiliesOfComplications:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a4;
  -[NSDictionary objectForKey:](self->_complicationSlotDescriptors, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "supportsFamiliesOfComplications:inFace:", v6, self);
  else
    v9 = 0;

  return v9;
}

+ (id)possibleComplicationTypesForSlot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_complicationSlotDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "possibleTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)possibleComplicationTypesForSlot:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_complicationSlotDescriptors, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "possibleTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __47__NTKFace__complicationProviderOptionsForSlot___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)allowedComplicationsForSlot:(id)a3
{
  return -[NTKFace allowedComplicationsForSlot:includingComplication:](self, "allowedComplicationsForSlot:includingComplication:", a3, 0);
}

- (id)allowedComplicationsForSlot:(id)a3 includingComplication:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v22;
  char v23;

  v6 = a3;
  v7 = a4;
  -[NTKFace _complicationProviderOptionsForSlot:](self, "_complicationProviderOptionsForSlot:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFace device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKComplicationProvider providerForDevice:](NTKComplicationProvider, "providerForDevice:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "complicationsWithOptions:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  -[NTKFace complicationForSlot:](self, "complicationForSlot:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "containsObject:", v13) & 1) == 0)
    objc_msgSend(v12, "addObject:", v13);
  if (v7 && (objc_msgSend(v12, "containsObject:", v7) & 1) == 0)
  {
    v14 = (void *)objc_opt_class();
    -[NTKFace device](self, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_dateComplicationSlotForDevice:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v16))
    {

    }
    else
    {
      v17 = (void *)objc_opt_class();
      -[NTKFace device](self, "device");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_monogramComplicationSlotForDevice:", v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v6, "isEqualToString:", v18);

      if ((v23 & 1) == 0)
      {
        -[NTKFace possibleComplicationTypesForSlot:](self, "possibleComplicationTypesForSlot:", v6);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "containsIndex:", objc_msgSend(v7, "complicationType"));

        if (v20)
          objc_msgSend(v12, "addObject:", v7);
      }
    }
  }

  return v12;
}

- (void)_handleComplicationChangeNotification
{
  void *v3;
  NSObject *v4;
  int v5;
  NTKFace *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1BCCA7FA8](self, a2);
  _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "%@ is handling complication change", (uint8_t *)&v5, 0xCu);
  }

  -[NTKFace _complicationsDidChange](self, "_complicationsDidChange");
  objc_autoreleasePoolPop(v3);
}

- (void)_handleSingleComplicationDidChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  NTKFace *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = self;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling single complication change", buf, 0xCu);
  }

  if ((NTKIsDaemonOrFaceSnapshotService() & 1) == 0)
  {
    objc_msgSend(v4, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "object");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __58__NTKFace__handleSingleComplicationDidChangeNotification___block_invoke;
      v10[3] = &unk_1E6BCF4C8;
      v10[4] = self;
      v11 = v8;
      v9 = v8;
      -[NTKFace enumerateComplicationSlotsWithBlock:](self, "enumerateComplicationSlotsWithBlock:", v10);

    }
  }

}

void __58__NTKFace__handleSingleComplicationDidChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "complicationForSlot:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 == *(void **)(a1 + 40))
  {
    v5 = objc_msgSend(v3, "complicationType");
    v6 = *(void **)(a1 + 32);
    if (v5)
      objc_msgSend(v6, "_notifyObserversFaceConfigurationDidChange");
    else
      objc_msgSend(v6, "setComplication:forSlot:", 0, v7);
  }

}

+ (id)defaultFaceOfStyle:(int64_t)a3 forDevice:(id)a4
{
  return (id)objc_msgSend(a1, "defaultFaceOfStyle:forDevice:initCustomization:", a3, a4, 0);
}

- (int64_t)timeStyle
{
  return 0;
}

- (NSString)analyticsIdentifier
{
  NSString *analyticsIdentifier;

  analyticsIdentifier = self->_analyticsIdentifier;
  if (analyticsIdentifier)
    return analyticsIdentifier;
  +[NTKFace defaultAnalyticsIdentifierForBundleIdentifier:](NTKFace, "defaultAnalyticsIdentifierForBundleIdentifier:", self->_bundleIdentifier);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

+ (unint64_t)maximumRemoteComplicationsOnAnyFace
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "maximumRemoteComplicationsOnAnyFaceForDevice:", v3);

  return v4;
}

+ (unint64_t)maximumRemoteComplicationsOnAnyFaceForDevice:(id)a3
{
  return 8;
}

- (NSArray)editModes
{
  void *v3;
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void *v11;
  NTKFace *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __20__NTKFace_editModes__block_invoke;
  v11 = &unk_1E6BD4E90;
  v12 = self;
  v4 = v3;
  v13 = v4;
  -[NTKFace enumerateCustomEditModesWithBlock:](self, "enumerateCustomEditModesWithBlock:", &v8);
  if (-[NSDictionary count](self->_complicationSlotDescriptors, "count", v8, v9, v10, v11, v12))
    objc_msgSend(v4, "addObject:", &unk_1E6C9EF80);
  v5 = v13;
  v6 = (NSArray *)v4;

  return v6;
}

void __20__NTKFace_editModes__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "_hasOptionsForCustomEditMode:", a2))
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (int64_t)editModeForCustomEditViewController
{
  return 0;
}

- (BOOL)isEditable
{
  int v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  if (!-[NTKFace _allowsEditing](self, "_allowsEditing"))
    return 0;
  if (-[NTKFace _shouldHideUI](self, "_shouldHideUI"))
    return 0;
  if (-[NSDictionary count](self->_complicationSlotDescriptors, "count"))
    return 1;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __21__NTKFace_isEditable__block_invoke;
  v5[3] = &unk_1E6BD4EB8;
  v5[4] = self;
  v5[5] = &v6;
  -[NTKFace enumerateCustomEditModesWithBlock:](self, "enumerateCustomEditModesWithBlock:", v5);
  v4 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v4 != 0;
}

uint64_t __21__NTKFace_isEditable__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_hasOptionsForCustomEditMode:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)isSingular
{
  return 0;
}

- (BOOL)isUsingConfigurationModifiedForThisDevice
{
  return self->_configurationWasModifiedForThisDevice;
}

- (id)selectedSlotForEditMode:(int64_t)a3
{
  NSMutableDictionary *selectedSlotsByEditMode;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  selectedSlotsByEditMode = self->_selectedSlotsByEditMode;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](selectedSlotsByEditMode, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (a3 == 1)
    {
      -[NTKFace _sortedComplicationSlots](self, "_sortedComplicationSlots");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = (void *)objc_opt_class();
      -[NTKFace device](self, "device");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_slotsForCustomEditMode:forDevice:", a3, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v7;
}

- (void)setSelectedSlot:(id)a3 forEditMode:(int64_t)a4
{
  NSMutableDictionary *selectedSlotsByEditMode;
  void *v7;
  id v8;

  v8 = a3;
  selectedSlotsByEditMode = self->_selectedSlotsByEditMode;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    -[NSMutableDictionary setObject:forKey:](selectedSlotsByEditMode, "setObject:forKey:", v8, v7);
  else
    -[NSMutableDictionary removeObjectForKey:](selectedSlotsByEditMode, "removeObjectForKey:", v7);

}

- (BOOL)applyConfiguration:(id)a3
{
  return -[NTKFace _applyConfiguration:allowFailure:](self, "_applyConfiguration:allowFailure:", a3, 1);
}

uint64_t __36__NTKFace_applyDefaultConfiguration__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[6];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__NTKFace_applyDefaultConfiguration__block_invoke_2;
  v4[3] = &unk_1E6BD4EE0;
  v4[4] = v2;
  v4[5] = a2;
  return objc_msgSend(v2, "enumerateSlotsForCustomEditMode:withBlock:", a2, v4);
}

void __36__NTKFace_applyDefaultConfiguration__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "defaultOptionForCustomEditMode:slot:", v4, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "selectOption:forCustomEditMode:slot:", v6, *(_QWORD *)(a1 + 40), v5);

}

void __48__NTKFace_applyDefaultComplicationConfiguration__block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v6 = objc_msgSend(a2, "integerValue");
  +[NTKBundleComplicationMigrationProvider cachedInstance](NTKBundleComplicationMigrationProvider, "cachedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "migratedComplicationFromType:family:device:", a1[6], v6, *(_QWORD *)(a1[4] + 104));
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v12;
  if (v12)
  {
    +[NTKWidgetComplication complicationWithDescriptor:](NTKWidgetComplication, "complicationWithDescriptor:", v12);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1[5] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v8 = v12;
    *a4 = 1;
  }

}

+ (id)_initialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4
{
  return 0;
}

- (id)_uniqueOptionForCustomEditMode:(int64_t)a3 slot:(id)a4 withExistingOptions:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;

  v8 = a4;
  v9 = a5;
  -[NTKFace defaultOptionForCustomEditMode:slot:](self, "defaultOptionForCustomEditMode:slot:", a3, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NTKFace indexOfOption:forCustomEditMode:slot:](self, "indexOfOption:forCustomEditMode:slot:", v10, a3, v8);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    v12 = 0;
  else
    v12 = v11;
  v13 = -[NTKFace numberOfOptionsForCustomEditMode:slot:](self, "numberOfOptionsForCustomEditMode:slot:", a3, v8);
  if (v13)
  {
    v14 = v13;
    v15 = v13;
    while (1)
    {
      -[NTKFace optionAtIndex:forCustomEditMode:slot:](self, "optionAtIndex:forCustomEditMode:slot:", v12 % v14, a3, v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "containsObject:", v16))
        break;

      ++v12;
      if (!--v15)
        goto LABEL_8;
    }
  }
  else
  {
LABEL_8:
    v16 = 0;
  }

  return v16;
}

- (void)applyUniqueConfigurationWithExistingFaces:(id)a3
{
  id v4;
  int64_t v5;
  _QWORD v6[4];
  id v7;
  NTKFace *v8;
  int64_t v9;

  v4 = a3;
  -[NTKFace prepareEditOptions](self, "prepareEditOptions");
  v5 = -[NTKFace _customEditModeForUniqueConfiguration](self, "_customEditModeForUniqueConfiguration");
  if (v5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __53__NTKFace_applyUniqueConfigurationWithExistingFaces___block_invoke;
    v6[3] = &unk_1E6BD4DB0;
    v8 = self;
    v9 = v5;
    v7 = v4;
    -[NTKFace enumerateSlotsForCustomEditMode:withBlock:](self, "enumerateSlotsForCustomEditMode:withBlock:", v9, v6);

  }
  -[NTKFace cleanupEditOptions](self, "cleanupEditOptions");

}

void __53__NTKFace_applyUniqueConfigurationWithExistingFaces___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "selectedOptionForCustomEditMode:slot:", *(_QWORD *)(a1 + 48), v3, (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 40), "_uniqueOptionForCustomEditMode:slot:withExistingOptions:", *(_QWORD *)(a1 + 48), v3, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "defaultOptionForCustomEditMode:slot:", *(_QWORD *)(a1 + 48), v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = *(_QWORD *)(a1 + 48);
  if (v12 == 19 || v12 == 13)
  {
    objc_msgSend(*(id *)(a1 + 40), "defaultOptionForCustomEditMode:slot:", *(_QWORD *)(a1 + 48), v3, (_QWORD)v14);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = *(_QWORD *)(a1 + 48);
    v11 = (void *)v13;
  }
  objc_msgSend(*(id *)(a1 + 40), "selectOption:forCustomEditMode:slot:", v11, v12, v3, (_QWORD)v14);

}

- (void)prepareEditOptions
{
  self->_editOptionsPrepared = 1;
  -[NTKFace _prepareEditOptions](self, "_prepareEditOptions");
}

- (void)cleanupEditOptions
{
  -[NTKFace _cleanupEditOptions](self, "_cleanupEditOptions");
  self->_editOptionsPrepared = 0;
}

- (BOOL)hasPrideEditOptions
{
  return 0;
}

- (unint64_t)numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;

  v6 = a4;
  if (a3 == 10 && -[NTKFace deviceSupportsPigmentEditOption](self, "deviceSupportsPigmentEditOption"))
  {
    -[NTKFace pigmentOptionProvider](self, "pigmentOptionProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "numberOfOptionsForSlot:", v6);

  }
  else
  {
    v8 = -[NTKFace _numberOfOptionsForCustomEditMode:slot:](self, "_numberOfOptionsForCustomEditMode:slot:", a3, v6);
  }

  return v8;
}

- (id)optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a5;
  if (a4 == 10 && -[NTKFace deviceSupportsPigmentEditOption](self, "deviceSupportsPigmentEditOption"))
  {
    -[NTKFace pigmentOptionProvider](self, "pigmentOptionProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "optionAtIndex:slot:", a3, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NTKFace _optionAtIndex:forCustomEditMode:slot:](self, "_optionAtIndex:forCustomEditMode:slot:", a3, a4, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (unint64_t)indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;

  v8 = a3;
  v9 = a5;
  if (a4 == 10 && -[NTKFace deviceSupportsPigmentEditOption](self, "deviceSupportsPigmentEditOption"))
  {
    -[NTKFace pigmentOptionProvider](self, "pigmentOptionProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "indexOfOption:slot:", v8, v9);

  }
  else
  {
    v11 = -[NTKFace _indexOfOption:forCustomEditMode:slot:](self, "_indexOfOption:forCustomEditMode:slot:", v8, a4, v9);
  }

  return v11;
}

- (BOOL)containsEditOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  return -[NTKFace indexOfOption:forCustomEditMode:slot:](self, "indexOfOption:forCustomEditMode:slot:", a3, a4, a5) != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)enumerateSlotsForCustomEditMode:(int64_t)a3 withBlock:(id)a4
{
  void (**v6)(id, _QWORD, char *);
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, char *))a4;
  -[NTKFace slotsForCustomEditMode:](self, "slotsForCustomEditMode:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  if (objc_msgSend(v7, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        v6[2](v6, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12), &v17);
        if (v17)
          break;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
          if (v10)
            goto LABEL_4;
          break;
        }
      }
    }

  }
  else
  {
    v6[2](v6, 0, &v17);
  }

}

- (id)slotsForCustomEditMode:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_opt_class();
  -[NTKFace device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_slotsForCustomEditMode:forDevice:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)slotForAddColorsViewFrame
{
  return (id)objc_msgSend((id)objc_opt_class(), "_slotForAddColorsViewFrame");
}

- (BOOL)snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4
{
  id v6;
  id v7;
  int v8;
  BOOL v9;
  uint64_t *v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  if (objc_msgSend(v6, "localeMatchesContext:", v7))
  {
    v8 = objc_msgSend(v6, "buildVersionMatchesContext:", v7);
    *((_BYTE *)v17 + 24) = v8 ^ 1;
    if ((v8 & 1) != 0)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __52__NTKFace_snapshotContext_isStaleRelativeToContext___block_invoke;
      v12[3] = &unk_1E6BD4F58;
      v12[4] = self;
      v13 = v6;
      v14 = v7;
      v15 = &v16;
      -[NTKFace enumerateComplicationSlotsWithBlock:](self, "enumerateComplicationSlotsWithBlock:", v12);

      v8 = *((_BYTE *)v17 + 24) == 0;
    }
    if (!v8)
    {
      v9 = 1;
      goto LABEL_9;
    }
    v9 = -[NTKFace _snapshotContext:isStaleRelativeToContext:](self, "_snapshotContext:isStaleRelativeToContext:", v6, v7);
    v10 = v17;
  }
  else
  {
    v10 = v17;
    v9 = 1;
  }
  *((_BYTE *)v10 + 24) = v9;
LABEL_9:
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __52__NTKFace_snapshotContext_isStaleRelativeToContext___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "complicationForSlot:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "snapshotContext:isStaleRelativeToContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *a3 = 1;
  }

}

- (BOOL)isEquivalentToFace:(id)a3
{
  NTKFace *v4;
  NTKFace *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  NTKFace *v11;
  BOOL v12;
  _QWORD v14[5];
  NTKFace *v15;
  uint64_t *v16;
  _QWORD v17[5];
  NTKFace *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v4 = (NTKFace *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    v6 = -[NTKFace faceStyle](v4, "faceStyle");
    if (v6 == -[NTKFace faceStyle](self, "faceStyle")
      && (-[NTKFace device](v5, "device"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          -[NTKFace device](self, "device"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v7, "isEqual:", v8),
          v8,
          v7,
          v9))
    {
      v20 = 0;
      v21 = &v20;
      v22 = 0x2020000000;
      v10 = MEMORY[0x1E0C809B0];
      v23 = 1;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __30__NTKFace_isEquivalentToFace___block_invoke;
      v17[3] = &unk_1E6BD4FA8;
      v17[4] = self;
      v11 = v5;
      v18 = v11;
      v19 = &v20;
      -[NTKFace enumerateCustomEditModesWithBlock:](self, "enumerateCustomEditModesWithBlock:", v17);
      if (*((_BYTE *)v21 + 24))
      {
        v14[0] = v10;
        v14[1] = 3221225472;
        v14[2] = __30__NTKFace_isEquivalentToFace___block_invoke_3;
        v14[3] = &unk_1E6BD1360;
        v14[4] = self;
        v15 = v11;
        v16 = &v20;
        -[NTKFace enumerateComplicationSlotsWithBlock:](self, "enumerateComplicationSlotsWithBlock:", v14);
        v12 = *((_BYTE *)v21 + 24) != 0;

      }
      else
      {
        v12 = 0;
      }

      _Block_object_dispose(&v20, 8);
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

void __30__NTKFace_isEquivalentToFace___block_invoke(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __30__NTKFace_isEquivalentToFace___block_invoke_2;
  v9[3] = &unk_1E6BD4F80;
  v6 = (void *)a1[5];
  v10 = (id)a1[4];
  v13 = a2;
  v7 = v6;
  v8 = a1[6];
  v11 = v7;
  v12 = v8;
  objc_msgSend(v10, "enumerateSlotsForCustomEditMode:withBlock:", a2, v9);
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    *a3 = 1;

}

void __30__NTKFace_isEquivalentToFace___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = a2;
  objc_msgSend(v5, "selectedOptionForCustomEditMode:slot:", v6, v7);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "selectedOptionForCustomEditMode:slot:", *(_QWORD *)(a1 + 56), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v8, "isEqual:", v12);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    && objc_msgSend(v8, "conformsToProtocol:", &unk_1F8E91518))
  {
    objc_msgSend(v8, "pigmentEditOption");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "JSONObjectRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "JSONObjectRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v10, "isEqualToString:", v11);

  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *a3 = 1;

}

void __30__NTKFace_isEquivalentToFace___block_invoke_3(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "complicationForSlot:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "complicationForSlot:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v7, "isEqual:", v8);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *a3 = 1;

}

- (int64_t)origin
{
  void *v2;
  int64_t v3;

  -[NTKFaceConfiguration metricForKey:](self->_configuration, "metricForKey:", CFSTR("origin"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setOrigin:(int64_t)a3
{
  NTKFaceConfiguration *configuration;
  void *v6;

  if (!-[NTKFace origin](self, "origin"))
  {
    configuration = self->_configuration;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceConfiguration setMetric:forKey:](configuration, "setMetric:forKey:", v6, CFSTR("origin"));

    -[NTKFace _notifyObserversFaceConfigurationDidChange](self, "_notifyObserversFaceConfigurationDidChange");
  }
}

- (NSDate)creationDate
{
  return (NSDate *)-[NTKFaceConfiguration metricForKey:](self->_configuration, "metricForKey:", CFSTR("dateCreated"));
}

- (void)setCreationDate:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  -[NTKFace creationDate](self, "creationDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKFaceConfiguration setMetric:forKey:](self->_configuration, "setMetric:forKey:", v4, CFSTR("dateCreated"));
  v5 = NTKEqualObjects(v4, v6);

  if ((v5 & 1) == 0)
    -[NTKFace _notifyObserversFaceConfigurationDidChange](self, "_notifyObserversFaceConfigurationDidChange");

}

- (NSDate)lastEditedDate
{
  return (NSDate *)-[NTKFaceConfiguration metricForKey:](self->_configuration, "metricForKey:", CFSTR("dateLastEdited"));
}

- (void)setLastEditedDate:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  -[NTKFace lastEditedDate](self, "lastEditedDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKFaceConfiguration setMetric:forKey:](self->_configuration, "setMetric:forKey:", v4, CFSTR("dateLastEdited"));
  v5 = NTKEqualObjects(v4, v6);

  if ((v5 & 1) == 0)
    -[NTKFace _notifyObserversFaceConfigurationDidChange](self, "_notifyObserversFaceConfigurationDidChange");

}

- (int64_t)editedState
{
  void *v2;
  int64_t v3;

  -[NTKFaceConfiguration metricForKey:](self->_configuration, "metricForKey:", CFSTR("editedState"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setEditedState:(int64_t)a3
{
  NTKFaceConfiguration *configuration;
  void *v6;

  if (!-[NTKFace editedState](self, "editedState") || -[NTKFace editedState](self, "editedState") == 1)
  {
    configuration = self->_configuration;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceConfiguration setMetric:forKey:](configuration, "setMetric:forKey:", v6, CFSTR("editedState"));

    -[NTKFace _notifyObserversFaceConfigurationDidChange](self, "_notifyObserversFaceConfigurationDidChange");
  }
}

- (NSNumber)numberOfGizmoEdits
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[NTKFaceConfiguration metricForKey:](self->_configuration, "metricForKey:", CFSTR("numberOfGizmoEdits"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &unk_1E6C9EF98;
  v4 = v2;

  return v4;
}

- (BOOL)hasGizmoEdits
{
  void *v2;
  BOOL v3;

  -[NTKFaceConfiguration metricForKey:](self->_configuration, "metricForKey:", CFSTR("numberOfGizmoEdits"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)incrementNumberOfGizmoEdits
{
  -[NTKFaceConfiguration incrementMetricForKey:](self->_configuration, "incrementMetricForKey:", CFSTR("numberOfGizmoEdits"));
  -[NTKFace _notifyObserversFaceConfigurationDidChange](self, "_notifyObserversFaceConfigurationDidChange");
}

- (NSNumber)numberOfCompanionEdits
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[NTKFaceConfiguration metricForKey:](self->_configuration, "metricForKey:", CFSTR("numberOfCompanionEdits"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &unk_1E6C9EF98;
  v4 = v2;

  return v4;
}

- (BOOL)hasCompanionEdits
{
  void *v2;
  BOOL v3;

  -[NTKFaceConfiguration metricForKey:](self->_configuration, "metricForKey:", CFSTR("numberOfCompanionEdits"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)incrementNumberOfCompanionEdits
{
  -[NTKFaceConfiguration incrementMetricForKey:](self->_configuration, "incrementMetricForKey:", CFSTR("numberOfCompanionEdits"));
  -[NTKFace _notifyObserversFaceConfigurationDidChange](self, "_notifyObserversFaceConfigurationDidChange");
}

- (void)clearMetrics
{
  -[NTKFaceConfiguration clearMetrics](self->_configuration, "clearMetrics");
}

- (id)_customEditModes
{
  return 0;
}

+ (id)_slotForAddColorsViewFrame
{
  return 0;
}

+ (id)_defaultSelectedSlotForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  return 0;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  return 0;
}

- (int64_t)_customEditModeForUniqueConfiguration
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NTKFace _customEditModes](self, "_customEditModes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0;

  return v4;
}

+ (id)fixedComplicationSlotsForDevice:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set", a3);
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  return 0;
}

+ (BOOL)_customEditModeIsColor:(int64_t)a3 forDevice:(id)a4
{
  return a3 == 10;
}

+ (BOOL)_customEditModeIsRows:(int64_t)a3 forDevice:(id)a4
{
  return 0;
}

+ (BOOL)_customEditModeIsShowSeconds:(int64_t)a3 forDevice:(id)a4
{
  return 0;
}

+ (BOOL)_customEditMode:(int64_t)a3 hasActionForOption:(id)a4 forDevice:(id)a5
{
  return 0;
}

+ (BOOL)_customEditModeDeterminesDynamicSections:(int64_t)a3 forDevice:(id)a4
{
  return 0;
}

- (BOOL)_shouldColorEditModeBeAtTop
{
  return 1;
}

- (int64_t)_dynamicEditMode
{
  return 0;
}

- (unint64_t)_numberOfDynamicSections
{
  return 0;
}

- (BOOL)_hasOptionsForCustomEditMode:(int64_t)a3
{
  return 1;
}

- (BOOL)_option:(id)a3 isValidForCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  char v13;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (a4 == 10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NTKFace pigmentOptionProvider](self, "pigmentOptionProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "indexOfOption:slot:", v8, v9);

      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v13 = 1;
        goto LABEL_11;
      }
      _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "pigmentFaceDomain");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKFace pigmentOptionProvider](self, "pigmentOptionProvider");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "availableColorsForSlot:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543874;
        v19 = v8;
        v20 = 2114;
        v21 = v15;
        v22 = 2114;
        v23 = v17;
        _os_log_error_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_ERROR, "Invalid pigment option - %{public}@ - Face: %{public}@ - Available Options: %{public}@", (uint8_t *)&v18, 0x20u);

      }
      goto LABEL_9;
    }
  }
  -[NTKFace editOptionClassFromEditMode:resourceDirectoryExists:](self, "editOptionClassFromEditMode:resourceDirectoryExists:", a4, -[NTKFaceConfiguration resourceDirectoryExists](self->_configuration, "resourceDirectoryExists"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_9:
    v13 = 0;
    goto LABEL_11;
  }
  v13 = objc_msgSend(v8, "isValidOption");
LABEL_11:

  return v13;
}

- (BOOL)option:(id)a3 migratesToValidOption:(id *)a4 forCustomEditMode:(int64_t)a5 slot:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v15;
  id v16;
  void *v17;
  id v18;

  v10 = a3;
  v11 = a6;
  if (a5 != 10)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = v10;
      objc_msgSend((id)objc_opt_class(), "optionByValidatingValueOfInvalidOption:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v17;
      *a4 = v18;
      v15 = v18 != 0;
      goto LABEL_7;
    }
LABEL_6:
    v15 = -[NTKFace _option:migratesToValidOption:forCustomEditMode:slot:](self, "_option:migratesToValidOption:forCustomEditMode:slot:", v10, a4, a5, v11);
    goto LABEL_7;
  }
  -[NTKFace pigmentOptionProvider](self, "pigmentOptionProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "migratedOptionForInvalidOption:slot:", v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_retainAutorelease(v13);
  *a4 = v14;
  v15 = v14 != 0;

LABEL_7:
  return v15;
}

- (BOOL)_option:(id)a3 migratesToValidOption:(id *)a4 forCustomEditMode:(int64_t)a5 slot:(id)a6
{
  return 0;
}

- (BOOL)_allowsEditing
{
  return 1;
}

- (BOOL)_hasCustomSwitcherSelectionAction
{
  return 0;
}

- (BOOL)_snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4
{
  return 0;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  return 0;
}

+ (BOOL)_complication:(id)a3 isValidForSlot:(id)a4 forDevice:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  BOOL v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(a1, "_dateComplicationSlotForDevice:", v10),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v9, "isEqual:", v11),
        v11,
        v12))
  {
    v13 = objc_msgSend(v8, "dateStyle");
    v14 = (objc_msgSend(a1, "_dateComplicationSlotSupportedStylesForDevice:", v10) & v13) != 0;
  }
  else
  {
    v14 = 1;
  }

  return v14;
}

+ (id)_monogramComplicationSlotForDevice:(id)a3
{
  return 0;
}

+ (unint64_t)_dateComplicationSlotSupportedStylesForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "complicationConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "complicationConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "dateComplicationSlotSupportedStylesForDevice:", v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_localizedNameForComplicationSlot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[NTKFace complicationConfiguration](self, "complicationConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NTKFace complicationConfiguration](self, "complicationConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedNameForComplicationSlot:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[NTKFaceComplicationConfiguration defaultLocalizedNameForComplicationSlot:](NTKFaceComplicationConfiguration, "defaultLocalizedNameForComplicationSlot:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_defaultName
{
  NSString *cachedDefaultName;
  NSString *v4;
  NSString *v5;

  cachedDefaultName = self->_cachedDefaultName;
  if (!cachedDefaultName)
  {
    -[NTKFace faceSharingName](self, "faceSharingName");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      NTKLocalizedNameForFaceStyle(self->_faceStyle);
      v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v5 = self->_cachedDefaultName;
    self->_cachedDefaultName = v4;

    cachedDefaultName = self->_cachedDefaultName;
  }
  return cachedDefaultName;
}

- (id)_resourceDirectorySnapshotKey
{
  return 0;
}

+ (id)_richComplicationSlotsForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "complicationConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "complicationConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "richComplicationSlotsForDevice:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (int64_t)_complicationFontStyleForSlot:(id)a3
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSString *resourceDirectory;

  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithFaceStyle:forDevice:", self->_faceStyle, self->_device);
  v5 = -[NTKFaceConfiguration copy](self->_configuration, "copy");
  v6 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v5;

  objc_msgSend((id)v4, "_complicationSlotDescriptors");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v7;

  v9 = -[NSString copy](self->_bundleIdentifier, "copy");
  v10 = *(void **)(v4 + 96);
  *(_QWORD *)(v4 + 96) = v9;

  v11 = -[NSString copy](self->_analyticsIdentifier, "copy");
  v12 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = v11;

  *(_BYTE *)(v4 + 80) = self->_forMigration;
  resourceDirectory = self->_resourceDirectory;
  if (self->_resourceDirectoryIsOwned)
    objc_msgSend((id)v4, "setResourceDirectoryByTransferringOwnership:", resourceDirectory);
  else
    objc_msgSend((id)v4, "setResourceDirectory:", resourceDirectory);
  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t faceStyle;
  void *v5;
  id v6;

  faceStyle = self->_faceStyle;
  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", faceStyle, CFSTR("FaceStyle"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("FaceBundleIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_analyticsIdentifier, CFSTR("FaceBundleAnalyticsIdentifier"));
  -[CLKDevice nrDeviceUUID](self->_device, "nrDeviceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("DeviceUUID"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_resourceDirectory, CFSTR("ResourceDirectory"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_configuration, CFSTR("Configuration"));

}

- (NTKFace)initWithCoder:(id)a3
{
  id v4;
  NTKFace *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  uint64_t v8;
  NSString *analyticsIdentifier;
  void *v10;
  uint64_t v11;
  CLKDevice *device;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *resourceDirectory;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NTKFace;
  v5 = -[NTKFace init](&v19, sel_init);
  if (v5)
  {
    v5->_faceStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FaceStyle"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FaceBundleIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FaceBundleAnalyticsIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    analyticsIdentifier = v5->_analyticsIdentifier;
    v5->_analyticsIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DeviceUUID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C944B0], "deviceForNRDeviceUUID:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    device = v5->_device;
    v5->_device = (CLKDevice *)v11;

    -[NTKFace _commonInit](v5, "_commonInit");
    if (NTKUglyBooleanToSignalThisIsFaceMigration)
    {
      NTKMigratableFaceStyles();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5->_faceStyle);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "containsObject:", v14);

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ResourceDirectory"));
    v15 = objc_claimAutoreleasedReturnValue();
    resourceDirectory = v5->_resourceDirectory;
    v5->_resourceDirectory = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Configuration"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      -[NTKFace _configurationFromOldEncodingWithCoder:](v5, "_configurationFromOldEncodingWithCoder:", v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[NTKFace _applyConfiguration:allowFailure:](v5, "_applyConfiguration:allowFailure:", v17, 0);

    -[NTKFace toggleComplicationChangeObservation:](v5, "toggleComplicationChangeObservation:", 1);
  }

  return v5;
}

- (id)_configurationFromOldEncodingWithCoder:(id)a3
{
  id v4;
  NTKFaceConfiguration *v5;
  void *v6;
  NSDictionary *complicationSlotDescriptors;
  id v8;
  NTKFaceConfiguration *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NTKFaceConfiguration *v28;
  NTKFaceConfiguration *v29;
  NTKFaceConfiguration *v30;
  id v32;
  _QWORD v33[5];
  NTKFaceConfiguration *v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  NTKFaceConfiguration *v40;

  v4 = a3;
  v5 = objc_alloc_init(NTKFaceConfiguration);
  -[NTKFace _complicationMigrationPaths](self, "_complicationMigrationPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  complicationSlotDescriptors = self->_complicationSlotDescriptors;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __50__NTKFace__configurationFromOldEncodingWithCoder___block_invoke;
  v37[3] = &unk_1E6BD4FD0;
  v32 = v6;
  v38 = v32;
  v8 = v4;
  v39 = v8;
  v9 = v5;
  v40 = v9;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](complicationSlotDescriptors, "enumerateKeysAndObjectsUsingBlock:", v37);
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "decodeObjectOfClasses:forKey:", v13, CFSTR("EditConfigurations"));
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (id)v14;
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    NTKValidateDictionary(v15, v16, v17);
    v18 = MEMORY[0x1E0C809B0];
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "decodeObjectOfClasses:forKey:", v22, CFSTR("EditOptions"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    NTKValidateDictionary(v23, v24, v25);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __50__NTKFace__configurationFromOldEncodingWithCoder___block_invoke_2;
    v35[3] = &unk_1E6BD4FF8;
    v15 = v26;
    v36 = v15;
    objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v35);

    v18 = v27;
  }
  v33[0] = v18;
  v33[1] = 3221225472;
  v33[2] = __50__NTKFace__configurationFromOldEncodingWithCoder___block_invoke_3;
  v33[3] = &unk_1E6BD5020;
  v33[4] = self;
  v28 = v9;
  v34 = v28;
  objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v33);
  v29 = v34;
  v30 = v28;

  return v30;
}

void __50__NTKFace__configurationFromOldEncodingWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  v6 = v3;
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v10, (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v3);

        if (v12)
        {
          v6 = v10;

          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
    v6 = v3;
  }
LABEL_11:

  v13 = *(void **)(a1 + 40);
  v14 = objc_opt_class();
  objc_msgSend(CFSTR("ComplicationSlot-"), "stringByAppendingString:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "decodeObjectOfClass:forKey:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "setComplication:forSlot:", v16, v3);
}

void __50__NTKFace__configurationFromOldEncodingWithCoder___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NTKEditModeConfiguration *v7;

  v5 = a3;
  v6 = a2;
  v7 = objc_alloc_init(NTKEditModeConfiguration);
  -[NTKEditModeConfiguration setEditOption:forSlot:](v7, "setEditOption:forSlot:", v5, 0);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v6);
}

void __50__NTKFace__configurationFromOldEncodingWithCoder___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  v5 = a3;
  v6 = objc_msgSend(a2, "integerValue");
  v7 = objc_msgSend(*(id *)(a1 + 32), "_editModeForOldEncodingIndex:", v6);
  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0CB2C88];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", v9, CFSTR("invalid old edit mode index: %@"), v10);

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__NTKFace__configurationFromOldEncodingWithCoder___block_invoke_4;
  v12[3] = &unk_1E6BD4DB0;
  v13 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = v7;
  v11 = v5;
  objc_msgSend(v11, "enumerateSlotsWithBlock:", v12);

}

void __50__NTKFace__configurationFromOldEncodingWithCoder___block_invoke_4(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)a1[4];
  v4 = (void *)a1[5];
  v5 = a2;
  objc_msgSend(v4, "editOptionForSlot:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOption:forCustomEditMode:slot:", v6, a1[6], v5);

}

- (id)faceSharingName
{
  return NTKTitleCaseLocalizedNameForFaceStyle(self->_faceStyle);
}

- (id)_createSharingMetadata
{
  return 0;
}

- (BOOL)_shouldPresentAlertForSharingUnreleasedFace
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C94518], "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "considersUISensitivitySensitive:", objc_msgSend(ViewClassForFace(self), "uiSensitivity"));

  return (char)self;
}

- (void)handleSharingMetadata:(id)a3
{
  id v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v4 = a3;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__NTKFace_handleSharingMetadata___block_invoke;
  v5[3] = &unk_1E6BCFCE8;
  v5[4] = self;
  v5[5] = &v6;
  -[NTKFace enumerateComplicationSlotsWithBlock:](self, "enumerateComplicationSlotsWithBlock:", v5);
  if (*((_BYTE *)v7 + 24))
    -[NTKFace _notifyObserversFaceConfigurationDidChange](self, "_notifyObserversFaceConfigurationDidChange");
  if (v4)
    -[NTKFace _handleSharingMetadata:](self, "_handleSharingMetadata:", v4);
  _Block_object_dispose(&v6, 8);

}

void __33__NTKFace_handleSharingMetadata___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "complicationForSlot:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "complication");
    v3 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "complicationDescriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsAppNotify:", 1);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (BOOL)_shouldIncludeResourceDirectoryForSharing
{
  return 1;
}

- (BOOL)_createResourceDirectorySuitableForSharingAtPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  -[NTKFace resourceDirectory](self, "resourceDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFace resourceDirectory](self, "resourceDirectory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "copyItemAtPath:toPath:error:", v9, v6, a4);

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (BOOL)_shouldSanitizeFaceConfigurationWhenAddingSharedFace
{
  return 0;
}

- (BOOL)_sanitizeFaceConfiguration:(id *)a3
{
  return 0;
}

- (id)deepCopy
{
  void *v3;
  void *v4;
  void *v5;
  NSString *resourceDirectory;

  -[NTKFace device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFace JSONObjectRepresentation](self, "JSONObjectRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKFace faceWithJSONObjectRepresentation:forDevice:](NTKFace, "faceWithJSONObjectRepresentation:forDevice:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  resourceDirectory = self->_resourceDirectory;
  if (self->_resourceDirectoryIsOwned)
    objc_msgSend(v5, "setResourceDirectoryByTransferringOwnership:", resourceDirectory);
  else
    objc_msgSend(v5, "setResourceDirectory:", resourceDirectory);

  return v5;
}

- (id)JSONObjectRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E6CA4D98, CFSTR("version"));
  NTKFaceBundleStringFromFaceStyle(-[NTKFace faceStyle](self, "faceStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("face type"));

  -[NTKFace bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("bundle id"));

  NTKAnalyticsValueForFace(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("analytics id"));

  -[NTKFace keyDescriptor](self, "keyDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "argon_JSONRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("argon"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NTKFace forMigration](self, "forMigration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("forMigration"));

  -[NTKFaceConfiguration addConfigurationKeysToJSONDictionary:face:](self->_configuration, "addConfigurationKeysToJSONDictionary:face:", v3, self);
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

- (id)greenfieldJSONObjectRepresentation
{
  uint64_t v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = NTKEffectiveFaceStyleForFaceStyle(-[NTKFace faceStyle](self, "faceStyle"));
  v4 = -[NTKFace faceStyle](self, "faceStyle");
  -[NTKFace JSONObjectRepresentation](self, "JSONObjectRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3 != v4)
  {
    v7 = (void *)objc_msgSend(v5, "mutableCopy");

    NTKFaceBundleStringFromFaceStyle(v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("face type"));

    v6 = (void *)objc_msgSend(v7, "copy");
  }
  return v6;
}

- (id)configurationJSONRepresentation
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceConfiguration addConfigurationKeysToJSONDictionary:face:](self->_configuration, "addConfigurationKeysToJSONDictionary:face:", v3, self);
  return v3;
}

+ (void)greenfieldFaceWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void (**v13)(void *, _QWORD, uint64_t);
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  _QWORD aBlock[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  v11 = dispatch_group_create();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__30;
  v26 = __Block_byref_object_dispose__30;
  +[NTKFace faceWithJSONObjectRepresentation:forDevice:forMigration:allowFallbackFromInvalidFaceStyle:](NTKFace, "faceWithJSONObjectRepresentation:forDevice:forMigration:allowFallbackFromInvalidFaceStyle:", v7, v8, 1, 0);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  if (v23[5])
  {
    v12 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__NTKFace_greenfieldFaceWithJSONObjectRepresentation_forDevice_withCompletion___block_invoke;
    aBlock[3] = &unk_1E6BD5048;
    aBlock[4] = &v22;
    v13 = (void (**)(void *, _QWORD, uint64_t))_Block_copy(aBlock);
    v13[2](v13, v23[5], 1);
    if (NTKShowBlueRidgeUI(v8))
    {
      objc_msgSend((id)v23[5], "_faceWithRichComplicationSlots");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(void *, void *, uint64_t))v13)[2](v13, v14, 0);

    }
    objc_msgSend((id)v23[5], "_migratedBundleFace");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void *, void *, uint64_t))v13)[2](v13, v15, 0);
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __79__NTKFace_greenfieldFaceWithJSONObjectRepresentation_forDevice_withCompletion___block_invoke_2;
    v17[3] = &unk_1E6BCF328;
    v18 = v10;
    v20 = &v22;
    v19 = v9;
    dispatch_group_notify(v11, MEMORY[0x1E0C80D38], v17);

  }
  else
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v7;
      _os_log_impl(&dword_1B72A3000, v16, OS_LOG_TYPE_DEFAULT, "Could not create new greenfield face because the base face from description:%@ is nil", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }
  _Block_object_dispose(&v22, 8);

}

void __79__NTKFace_greenfieldFaceWithJSONObjectRepresentation_forDevice_withCompletion___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v6;
  uint64_t v7;
  id *v8;
  id v9;
  id v11;

  v6 = a2;
  if (v6)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(id *)(v7 + 40);
    v8 = (id *)(v7 + 40);
    if (v9 != v6 || a3 != 0)
    {
      v11 = v6;
      objc_storeStrong(v8, a2);
      v6 = v11;
    }
  }

}

uint64_t __79__NTKFace_greenfieldFaceWithJSONObjectRepresentation_forDevice_withCompletion___block_invoke_2(_QWORD *a1)
{
  void *v2;
  _QWORD v4[5];

  v2 = (void *)a1[4];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__NTKFace_greenfieldFaceWithJSONObjectRepresentation_forDevice_withCompletion___block_invoke_3;
  v4[3] = &unk_1E6BD5070;
  v4[4] = a1[6];
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

void __79__NTKFace_greenfieldFaceWithJSONObjectRepresentation_forDevice_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  char v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "complicationForSlot:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v5);

  if ((v7 & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setComplication:forSlot:", v5, v8);

}

+ (id)faceWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4
{
  return (id)objc_msgSend(a1, "faceWithJSONObjectRepresentation:forDevice:forMigration:allowFallbackFromInvalidFaceStyle:", a3, a4, 0, 1);
}

+ (id)faceWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4 forMigration:(BOOL)a5 allowFallbackFromInvalidFaceStyle:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  int isKindOfClass;
  void *v21;
  void *v22;
  void *v23;
  NTKArgonKeyDescriptor *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  NTKFaceConfiguration *v37;
  id v39;
  _BOOL4 v40;
  id obj;
  uint8_t buf[8];
  uint64_t v43;

  v6 = a5;
  v43 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    v36 = 0;
    goto LABEL_41;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKFaceBundleException"), CFSTR("top level object must be a dictionary. Invalid value: %@"), v9);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("version"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKFaceBundleException"), CFSTR("'%@' must be a string. Invalid value: %@"), CFSTR("version"), v11);
  v39 = a1;
  v40 = v6;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("face type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKFaceBundleException"), CFSTR("'%@' must be a string. Invalid value: %@"), CFSTR("face type"), v12);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("bundle id"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("analytics id"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  if (!NTKFaceBundleGetFaceStyleFromString(v12, buf))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKFaceBundleException"), CFSTR("invalid value for '%@': %@"), CFSTR("face type"), v12);
  if (*(_QWORD *)buf == 12 && NTKShowBlueRidgeUI(v10))
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("customization"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NTKFaceBundleStringFromCustomEditMode(17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "valueForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16 == 0;

    if (!v17)
      *(_QWORD *)buf = 212;

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("forMigration"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  if (*(_QWORD *)buf == 44)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("argon"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_opt_class();
    if ((isKindOfClass & objc_opt_isKindOfClass() & 1) != 0)
    {
      +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "faceBundleForBundleIdentifier:onDevice:", v13, v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        v24 = [NTKArgonKeyDescriptor alloc];
        -[NTKArgonKeyDescriptor argon_initWithJSONRepresentation:](v24, "argon_initWithJSONRepresentation:", v21);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25
          && (+[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager"),
              v26 = (void *)objc_claimAutoreleasedReturnValue(),
              v27 = objc_msgSend(v26, "loadKeyDescriptor:", v25),
              v26,
              (v27 & 1) != 0))
        {
          +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "faceBundleForBundleIdentifier:onDevice:", v13, v10);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v23 = 0;
        }

      }
    }
  }
  if (*(_QWORD *)buf != 44)
    goto LABEL_33;
  if (!objc_msgSend(v13, "length"))
  {
    if (*(_QWORD *)buf == 44)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKFaceBundleException"), CFSTR("invalid pair for '%@': %@"), v13, v12);
LABEL_36:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKFaceBundleException"), CFSTR("Unable to determine NTKFace subclass for style %@"), v12);
      v31 = 0;
      goto LABEL_37;
    }
LABEL_33:
    if (v40)
    {
      NTKMigratableFaceStyles();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)buf);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "containsObject:", v33);

    }
    v31 = (objc_class *)objc_msgSend(v39, "_faceClassForStyle:onDevice:");
    if (v31)
      goto LABEL_37;
    goto LABEL_36;
  }
  +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "faceBundleForBundleIdentifier:onDevice:forMigration:", v13, v10, v19);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (objc_class *)objc_msgSend(v30, "faceClass");
  if (!v31)
    goto LABEL_36;
LABEL_37:
  v34 = [v31 alloc];
  v35 = objc_msgSend(v34, "_initWithFaceStyle:forDevice:", *(_QWORD *)buf, v10);
  v36 = v35;
  if (v35)
  {
    objc_storeStrong((id *)(v35 + 96), v13);
    objc_storeStrong((id *)(v36 + 72), obj);
    *(_BYTE *)(v36 + 80) = v19;
    v37 = -[NTKFaceConfiguration initWithJSONDictionary:editModeMapping:forDevice:]([NTKFaceConfiguration alloc], "initWithJSONDictionary:editModeMapping:forDevice:", v9, v36, v10);
    objc_msgSend((id)v36, "_customizeWithJSONDescription:", v9);
    objc_msgSend((id)v36, "_applyConfiguration:allowFailure:forMigration:", v37, 0, v40);

  }
LABEL_41:

  return (id)v36;
}

- (NTKArgonKeyDescriptor)keyDescriptor
{
  return (NTKArgonKeyDescriptor *)objc_msgSend((id)objc_opt_class(), "keyDescriptor");
}

+ (NTKArgonKeyDescriptor)keyDescriptor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKArgonKeyDescriptor keyDescriptorFromBundle:](NTKArgonKeyDescriptor, "keyDescriptorFromBundle:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NTKArgonKeyDescriptor *)v3;
}

- (Class)editOptionClassFromEditMode:(int64_t)a3 resourceDirectoryExists:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;

  v4 = a4;
  if (a3 == 10 && -[NTKFace deviceSupportsPigmentEditOption](self, "deviceSupportsPigmentEditOption"))
  {
    objc_opt_class();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NTKFace _optionClassForCustomEditMode:resourceDirectoryExists:](self, "_optionClassForCustomEditMode:resourceDirectoryExists:", a3, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v7;
}

- (Class)legacyEditOptionClassFromCustomEditMode:(int64_t)a3 resourceDirectoryExists:(BOOL)a4
{
  objc_class *v5;
  uint64_t v6;
  objc_class *v7;

  v5 = -[NTKFace _optionClassForCustomEditMode:resourceDirectoryExists:](self, "_optionClassForCustomEditMode:resourceDirectoryExists:", a3, a4);
  if (v5)
  {
    v6 = objc_opt_class();
    if (a3 == 10 && v5 == (objc_class *)v6)
      goto LABEL_4;
LABEL_6:
    v7 = v5;
    return v7;
  }
  if (a3 != 10)
    goto LABEL_6;
LABEL_4:
  objc_opt_class();
  v7 = (objc_class *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (BOOL)_applyConfiguration:(id)a3 allowFailure:(BOOL)a4
{
  return -[NTKFace _applyConfiguration:allowFailure:forMigration:](self, "_applyConfiguration:allowFailure:forMigration:", a3, a4, 0);
}

- (BOOL)_applyConfiguration:(id)a3 allowFailure:(BOOL)a4 forMigration:(BOOL)a5
{
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSDictionary *complicationSlotDescriptors;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void *v22;
  NTKFace *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  NTKFace *v28;
  BOOL v29;

  v6 = a4;
  v8 = a3;
  if (v6 && !-[NTKFace _verifyCompatibilityOfConfiguration:](self, "_verifyCompatibilityOfConfiguration:", v8))
  {
    v17 = 0;
  }
  else
  {
    *(_WORD *)&self->_suppressingConfigurationChangeNotifications = 1;
    v9 = objc_msgSend(v8, "resourceDirectoryExists");
    -[NTKFace configuration](self, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setResourceDirectoryExists:", v9);

    -[NTKFace _complicationMigrationPaths](self, "_complicationMigrationPaths");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    complicationSlotDescriptors = self->_complicationSlotDescriptors;
    v13 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __57__NTKFace__applyConfiguration_allowFailure_forMigration___block_invoke;
    v25[3] = &unk_1E6BD5098;
    v14 = v11;
    v26 = v14;
    v15 = v8;
    v29 = a5;
    v27 = v15;
    v28 = self;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](complicationSlotDescriptors, "enumerateKeysAndObjectsUsingBlock:", v25);
    v19 = v13;
    v20 = 3221225472;
    v21 = __57__NTKFace__applyConfiguration_allowFailure_forMigration___block_invoke_198;
    v22 = &unk_1E6BD4E90;
    v23 = self;
    v16 = v15;
    v24 = v16;
    -[NTKFace enumerateCustomEditModesWithBlock:](self, "enumerateCustomEditModesWithBlock:", &v19);
    -[NTKFace _complicationsDidChange](self, "_complicationsDidChange", v19, v20, v21, v22, v23);
    -[NTKFaceConfiguration setMetricsFromConfiguration:](self->_configuration, "setMetricsFromConfiguration:", v16);
    -[NTKFaceConfiguration setCustomDataFromConfiguration:](self->_configuration, "setCustomDataFromConfiguration:", v16);
    self->_suppressingConfigurationChangeNotifications = 0;
    if (self->_configurationChangedWhileSuppressingNotifications)
      -[NTKFace _notifyObserversFaceConfigurationDidChange](self, "_notifyObserversFaceConfigurationDidChange");

    v17 = 1;
  }

  return v17;
}

void __57__NTKFace__applyConfiguration_allowFailure_forMigration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  NSObject *v16;
  _BOOL4 v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  _BYTE v23[24];
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = v7;
  v11 = v10;

  objc_msgSend(*(id *)(a1 + 40), "complicationForSlot:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && !*(_BYTE *)(a1 + 56))
  {
    v13 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 48), "device");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = objc_msgSend((id)v13, "_complication:isValidForSlot:forDevice:", v12, v11, v14);

    if ((v13 & 1) == 0)
    {
      _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v23 = 138412802;
        *(_QWORD *)&v23[4] = objc_opt_class();
        *(_WORD *)&v23[12] = 2112;
        *(_QWORD *)&v23[14] = v11;
        *(_WORD *)&v23[22] = 2112;
        v24 = v12;
        v20 = *(id *)&v23[4];
        _os_log_impl(&dword_1B72A3000, v16, OS_LOG_TYPE_DEFAULT, "%@ has invalid complication for slot %@: %@ → nil", v23, 0x20u);

      }
      goto LABEL_14;
    }
    if ((objc_msgSend(v5, "allowsType:inFace:", objc_msgSend(v12, "complicationType"), *(_QWORD *)(a1 + 48)) & 1) == 0)
    {
      v15 = objc_msgSend(v5, "supportsType:", objc_msgSend(v12, "complicationType"));
      _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if (v15)
      {
        if (v17)
        {
          *(_DWORD *)v23 = 138412802;
          *(_QWORD *)&v23[4] = objc_opt_class();
          *(_WORD *)&v23[12] = 2112;
          *(_QWORD *)&v23[14] = v11;
          *(_WORD *)&v23[22] = 2112;
          v24 = v12;
          v18 = *(id *)&v23[4];
          _os_log_impl(&dword_1B72A3000, v16, OS_LOG_TYPE_DEFAULT, "%@ has disallowed complication for slot %@: %@ → Tombstone", v23, 0x20u);

        }
        +[NTKComplicationTombstone tombstoneWithComplication:](NTKComplicationTombstone, "tombstoneWithComplication:", v12);
        v19 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      if (v17)
      {
        v21 = (void *)objc_opt_class();
        v22 = v21;
        *(_DWORD *)v23 = 138413058;
        *(_QWORD *)&v23[4] = v21;
        *(_WORD *)&v23[12] = 2112;
        *(_QWORD *)&v23[14] = v11;
        *(_WORD *)&v23[22] = 2112;
        v24 = v12;
        v25 = 2048;
        v26 = objc_msgSend(v12, "complicationType");
        _os_log_impl(&dword_1B72A3000, v16, OS_LOG_TYPE_DEFAULT, "%@ has impossible complication for slot %@: %@ (%lu) → nil", v23, 0x2Au);

      }
LABEL_14:

      v19 = 0;
LABEL_15:

      v12 = (void *)v19;
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "setComplication:forSlot:", v12, v11, *(_OWORD *)v23, *(_QWORD *)&v23[16], v24);

}

void __57__NTKFace__applyConfiguration_allowFailure_forMigration___block_invoke_198(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint64_t v10;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__NTKFace__applyConfiguration_allowFailure_forMigration___block_invoke_2;
  v7[3] = &unk_1E6BD4DB0;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  v10 = a2;
  objc_msgSend(v4, "enumerateSlotsForCustomEditMode:withBlock:", a2, v7);

}

void __57__NTKFace__applyConfiguration_allowFailure_forMigration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "optionForCustomEditMode:slot:", *(_QWORD *)(a1 + 48), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "replacedOptionWithFulfilledOption:forEditMode:slot:", v4, *(_QWORD *)(a1 + 48), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_validOptionForOption:mode:slot:configuration:", v5, *(_QWORD *)(a1 + 48), v3, *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 != v5)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "deviceSupportsPigmentEditOption")
      && *(_QWORD *)(a1 + 48) == 10
      && objc_msgSend(v6, "conformsToProtocol:", &unk_1F8E91518))
    {
      _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "pigmentFaceDomain");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "pigmentOptionProvider");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "availableColorsForSlot:", v3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138544130;
        v13 = v5;
        v14 = 2114;
        v15 = v6;
        v16 = 2114;
        v17 = v8;
        v18 = 2114;
        v19 = v10;
        _os_log_error_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_ERROR, "Invalid option %{public}@ - substitute: %{public}@ - Face: %{public}@ - Available Options: %{public}@", (uint8_t *)&v12, 0x2Au);

      }
    }
    else
    {
      _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v11 = *(void **)(a1 + 40);
        v12 = 138543874;
        v13 = v5;
        v14 = 2114;
        v15 = v6;
        v16 = 2114;
        v17 = v11;
        _os_log_error_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_ERROR, "Invalid option %{public}@ - substitute: %{public}@ - Face: %{public}@", (uint8_t *)&v12, 0x20u);
      }
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 50) = 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "selectOption:forCustomEditMode:slot:", v6, *(_QWORD *)(a1 + 48), v3);

}

- (id)_validOptionForOption:(id)a3 mode:(int64_t)a4 slot:(id)a5 configuration:(id)a6
{
  id v10;
  id v11;
  id v12;
  BOOL v13;
  id v14;
  id v16;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v10)
  {
    if (!-[NTKFace _option:isValidForCustomEditMode:slot:configuration:](self, "_option:isValidForCustomEditMode:slot:configuration:", v10, a4, v11, v12))
    {
      v16 = v10;
      v13 = -[NTKFace option:migratesToValidOption:forCustomEditMode:slot:](self, "option:migratesToValidOption:forCustomEditMode:slot:", v10, &v16, a4, v11);
      v14 = v16;

      if (v13)
      {
        v10 = v14;
      }
      else
      {
        -[NTKFace defaultOptionForCustomEditMode:slot:](self, "defaultOptionForCustomEditMode:slot:", a4, v11);
        v10 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  else
  {
    -[NTKFace _defaultOptionForMissingCustomEditMode:slot:](self, "_defaultOptionForMissingCustomEditMode:slot:", a4, v11);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)replacedOptionWithFulfilledOption:(id)a3 forEditMode:(int64_t)a4 slot:(id)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a3;
  v9 = a5;
  v10 = -[NTKFace deviceSupportsPigmentEditOption](self, "deviceSupportsPigmentEditOption");
  if (a4 != 10)
    goto LABEL_5;
  if (!v10)
    goto LABEL_5;
  if (!objc_msgSend(v8, "conformsToProtocol:", &unk_1F8E91518))
    goto LABEL_5;
  objc_msgSend(v8, "pigmentEditOption");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFace pigmentOptionProvider](self, "pigmentOptionProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fulfilledOptionForOption:slot:", v11, v9);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (!v13)
LABEL_5:
    v13 = v8;

  return v13;
}

- (BOOL)_verifyCompatibilityOfConfiguration:(id)a3
{
  return 1;
}

- (id)_sortedComplicationSlots
{
  void *v2;
  void *v3;

  -[NSDictionary allKeys](self->_complicationSlotDescriptors, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_compare_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasValidConfigurationForDevice:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BOOL v11;
  NSObject *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NTKFace selectedOptionsForCustomEditModes](self, "selectedOptionsForCustomEditModes");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v5, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "optionExistsInDevice:", v4) & 1) == 0)
        {
          _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            -[NTKFace hasValidConfigurationForDevice:].cold.1(v10);

          v11 = 0;
          goto LABEL_13;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_13:

  return v11;
}

+ (id)PPTBlankFace
{
  return 0;
}

- (int64_t)faceStyle
{
  return self->_faceStyle;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)forMigration
{
  return self->_forMigration;
}

- (void)setForMigration:(BOOL)a3
{
  self->_forMigration = a3;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (NTKFaceConfiguration)configuration
{
  return self->_configuration;
}

- (NSString)resourceDirectory
{
  return self->_resourceDirectory;
}

- (BOOL)editOptionsPrepared
{
  return self->_editOptionsPrepared;
}

- (BOOL)isLibraryFace
{
  return self->_isLibraryFace;
}

- (void)setIsLibraryFace:(BOOL)a3
{
  self->_isLibraryFace = a3;
}

- (void)setGalleryName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setCompanionGalleryName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NTKFaceComplicationConfiguration)complicationConfiguration
{
  return self->_complicationConfiguration;
}

- (void)setComplicationConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_complicationConfiguration, a3);
}

- (BOOL)forceUsingLegacyColorOptions
{
  return self->_forceUsingLegacyColorOptions;
}

- (void)setForceUsingLegacyColorOptions:(BOOL)a3
{
  self->_forceUsingLegacyColorOptions = a3;
}

- (NTKPigmentEditOptionProvider)pigmentOptionProvider
{
  return self->_pigmentOptionProvider;
}

- (int64_t)mostRecentEditMode
{
  return self->_mostRecentEditMode;
}

- (void)setMostRecentEditMode:(int64_t)a3
{
  self->_mostRecentEditMode = a3;
}

- (BOOL)beingEdited
{
  return self->_beingEdited;
}

- (void)setBeingEdited:(BOOL)a3
{
  self->_beingEdited = a3;
}

- (id)libraryDetailViewController
{
  return -[NTKCFaceDetailViewController initWithLibraryFace:]([NTKCFaceDetailViewController alloc], "initWithLibraryFace:", self);
}

- (id)addFaceDetailViewController
{
  return -[NTKCFaceDetailViewController initWithCandidateFace:externalAssets:]([NTKCFaceDetailViewController alloc], "initWithCandidateFace:externalAssets:", self, 0);
}

+ (BOOL)needsAppleNeuralEngine
{
  return 0;
}

+ (BOOL)supportsExternalAssets
{
  return 0;
}

+ (id)sortableFaceWithAssets:(id)a3 forDevice:(id)a4
{
  return 0;
}

- (NSArray)externalAssets
{
  NTKFace *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSArray copy](v2->_externalAssets, "copy");
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)setExternalAssets:(id)a3
{
  id v4;
  NTKFace *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_msgSend(v4, "copy");

  objc_storeStrong((id *)&v5->_externalAssets, v6);
  objc_sync_exit(v5);

  objc_initWeak(&location, v5);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__NTKFace_ExternalAssets__setExternalAssets___block_invoke;
  v8[3] = &unk_1E6BD5110;
  objc_copyWeak(&v10, &location);
  v7 = v6;
  v9 = v7;
  -[NTKFace companionEditorWithAssets:completion:](v5, "companionEditorWithAssets:completion:", v7, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __45__NTKFace_ExternalAssets__setExternalAssets___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint64_t *v7;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__30;
  v13 = __Block_byref_object_dispose__30;
  v3 = a2;
  v14 = v3;
  v4 = (void *)v10[5];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__NTKFace_ExternalAssets__setExternalAssets___block_invoke_2;
  v5[3] = &unk_1E6BD50E8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = *(id *)(a1 + 32);
  v7 = &v9;
  objc_msgSend(v4, "generateGalleryPreviewResourceDirectoryWithCompletion:", v5);

  objc_destroyWeak(&v8);
  _Block_object_dispose(&v9, 8);

}

void __45__NTKFace_ExternalAssets__setExternalAssets___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  BOOL v5;
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id to;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 48));
  v4 = objc_loadWeakRetained(&to);
  v5 = v4 == 0;

  if (!v5)
  {
    v6 = objc_loadWeakRetained(&to);
    objc_sync_enter(v6);
    v7 = objc_loadWeakRetained(&to);
    objc_msgSend(v7, "externalAssets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == *(void **)(a1 + 32);

    objc_sync_exit(v6);
    if (v9)
    {
      v12 = objc_loadWeakRetained(&to);
      objc_msgSend(v12, "setResourceDirectory:", v3);

      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(NSObject **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = 0;
    }
    else
    {
      _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v16 = v11;
        _os_log_impl(&dword_1B72A3000, v10, OS_LOG_TYPE_DEFAULT, "Skipping assets %@ - changed", buf, 0xCu);
      }
    }

  }
  objc_destroyWeak(&to);

}

- (void)companionEditorWithAssets:(id)a3 completion:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

+ (id)argon_overlayAssetArchiveURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "keyDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BSCurrentUserDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("/Library/NanoTimeKit/FaceSupport/Assets/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "Reading from %@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSURL)argon_embeddedOverlayAssetURL
{
  return 0;
}

- (int64_t)argon_overlayAssetType
{
  return 0;
}

- (void)argon_notificationContentWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65__NTKFace_ArgonSupport__argon_notificationContentWithCompletion___block_invoke;
    v6[3] = &unk_1E6BD55C8;
    v6[4] = self;
    v7 = v4;
    -[NTKFace argon_compositedSnapshotWithCompletion:](self, "argon_compositedSnapshotWithCompletion:", v6);

  }
}

void __65__NTKFace_ArgonSupport__argon_notificationContentWithCompletion___block_invoke(uint64_t a1, UIImage *image, uint64_t a3, uint64_t a4)
{
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (image)
  {
    UIImageJPEGRepresentation(image, 0.7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("jpeg"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    NTKFaceArgonSupportCreateAttachmentWithImageData(v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
    if (v10)
    {
      v20[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAttachments:", v12);

    }
    if ((_DWORD)a3)
      v13 = 2;
    else
      v13 = 1;
    objc_msgSend(v11, "argon_setArtworkUsed:", v13);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3, CFSTR("defaultImage"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUserInfo:", v15);

    v16 = *(_QWORD *)(a1 + 40);
    v17 = (void *)objc_msgSend(v11, "copy");
    (*(void (**)(uint64_t, void *, _QWORD))(v16 + 16))(v16, v17, 0);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, a4);
  }
}

- (void)argon_compositedSnapshotWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD v19[4];
  NSObject *v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  NSObject *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD v29[3];
  char v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  id v34;

  v4 = a3;
  if (v4)
  {
    v5 = dispatch_group_create();
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = __Block_byref_object_copy__32;
    v33[4] = __Block_byref_object_dispose__32;
    v34 = 0;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x3032000000;
    v31[3] = __Block_byref_object_copy__32;
    v31[4] = __Block_byref_object_dispose__32;
    v32 = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v30 = 0;
    dispatch_group_enter(v5);
    v6 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __64__NTKFace_ArgonSupport__argon_compositedSnapshotWithCompletion___block_invoke;
    v24[3] = &unk_1E6BD55F0;
    v26 = v33;
    v27 = v31;
    v28 = v29;
    v7 = v5;
    v25 = v7;
    -[NTKFace argon_notificationOverlayImageWithCompletion:](self, "argon_notificationOverlayImageWithCompletion:", v24);
    +[NTKFaceSnapshotClient sharedInstance](NTKFaceSnapshotClient, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKFaceSnapshotter defaultModernSnapshotOptions](NTKFaceSnapshotter, "defaultModernSnapshotOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v10, "removeObjectForKey:", CFSTR("NTKSnapshotPersistableKey"));
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy__32;
    v22[4] = __Block_byref_object_dispose__32;
    v23 = 0;
    dispatch_group_enter(v7);
    v11 = (void *)objc_msgSend(v10, "copy");
    v19[0] = v6;
    v19[1] = 3221225472;
    v19[2] = __64__NTKFace_ArgonSupport__argon_compositedSnapshotWithCompletion___block_invoke_2;
    v19[3] = &unk_1E6BD5618;
    v21 = v22;
    v12 = v7;
    v20 = v12;
    objc_msgSend(v8, "snapshotFace:options:completion:", self, v11, v19);

    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __64__NTKFace_ArgonSupport__argon_compositedSnapshotWithCompletion___block_invoke_3;
    block[3] = &unk_1E6BD5668;
    v15 = v33;
    v16 = v31;
    v17 = v22;
    block[4] = self;
    v14 = v4;
    v18 = v29;
    dispatch_group_notify(v12, MEMORY[0x1E0C80D38], block);

    _Block_object_dispose(v22, 8);
    _Block_object_dispose(v29, 8);
    _Block_object_dispose(v31, 8);

    _Block_object_dispose(v33, 8);
  }

}

void __64__NTKFace_ArgonSupport__argon_compositedSnapshotWithCompletion___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  v7 = a2;
  v8 = a4;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v14 = v7;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v8;
  v13 = v8;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __64__NTKFace_ArgonSupport__argon_compositedSnapshotWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __64__NTKFace_ArgonSupport__argon_compositedSnapshotWithCompletion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  unint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[11];

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    return;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __64__NTKFace_ArgonSupport__argon_compositedSnapshotWithCompletion___block_invoke_3_cold_1(a1 + 56, v2, v3, v4, v5, v6, v7, v8);

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v20 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKFaceSupportDomain"), 202, &unk_1E6CA88E8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, uint64_t, void *))(v20 + 16))(v20, 0, 1, v21);

    return;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "size");
  v10 = v9;
  v12 = v11;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "scale");
  v14 = v13;
  objc_msgSend(MEMORY[0x1E0DC3830], "preferredFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setScale:", v14);
  objc_msgSend(*(id *)(a1 + 32), "device");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "sizeClass");

  if (v17 > 5)
  {
    v22 = *(_QWORD *)(a1 + 40);
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = &unk_1E6CA8938;
  }
  else
  {
    if (((1 << v17) & 3) == 0)
    {
      if (((1 << v17) & 0xC) != 0)
      {
        v18 = 69.0;
        v19 = 64.0;
      }
      else
      {
        v18 = 65.0;
        v19 = 60.0;
      }
      v25 = floor(v19 * 1.33333333);
      v26 = floor(v18 * 1.33333333);
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v15, v10, v12);
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __64__NTKFace_ArgonSupport__argon_compositedSnapshotWithCompletion___block_invoke_33;
      v30[3] = &unk_1E6BD5640;
      *(double *)&v30[6] = v10;
      *(double *)&v30[7] = v12;
      *(double *)&v30[8] = v14;
      *(double *)&v30[9] = v25;
      *(double *)&v30[10] = v26;
      v28 = *(_QWORD *)(a1 + 48);
      v30[4] = *(_QWORD *)(a1 + 64);
      v30[5] = v28;
      objc_msgSend(v27, "imageWithActions:", v30);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

      goto LABEL_18;
    }
    v22 = *(_QWORD *)(a1 + 40);
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = &unk_1E6CA8910;
  }
  objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("NTKFaceSupportDomain"), 503, v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, uint64_t, void *))(v22 + 16))(v22, 0, 1, v27);
LABEL_18:

}

uint64_t __64__NTKFace_ArgonSupport__argon_compositedSnapshotWithCompletion___block_invoke_33(uint64_t a1, void *a2)
{
  CGFloat v3;
  CGFloat v4;
  void *v5;
  id v6;
  void *v7;
  CGContext *v8;
  double x;
  double y;
  double width;
  double height;
  void *v13;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  v3 = *(double *)(a1 + 48);
  v4 = *(double *)(a1 + 56);
  v5 = (void *)MEMORY[0x1E0DC3658];
  v6 = a2;
  objc_msgSend(v5, "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFill");

  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.width = v3;
  v15.size.height = v4;
  UIRectFill(v15);
  v8 = (CGContext *)objc_msgSend(v6, "CGContext");

  CGContextTranslateCTM(v8, -3.0 / *(double *)(a1 + 64), 0.0);
  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = v3;
  v16.size.height = v4;
  v17 = CGRectInset(v16, *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80));
  x = v17.origin.x;
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFill");

  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  UIRectFill(v18);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "drawInRect:", x, y, width, height);
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (void)argon_notificationOverlayImageWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void (**v10)(void *, void *, _QWORD);
  void *v11;
  int64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD aBlock[4];
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  _QWORD v39[2];
  _QWORD v40[4];

  v40[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __70__NTKFace_ArgonSupport__argon_notificationOverlayImageWithCompletion___block_invoke;
    aBlock[3] = &unk_1E6BD3F30;
    v7 = v4;
    v34 = v7;
    v30[0] = v6;
    v30[1] = 3221225472;
    v30[2] = __70__NTKFace_ArgonSupport__argon_notificationOverlayImageWithCompletion___block_invoke_2;
    v30[3] = &unk_1E6BD56B0;
    v8 = _Block_copy(aBlock);
    v31 = v8;
    v9 = v7;
    v32 = v9;
    v10 = (void (**)(void *, void *, _QWORD))_Block_copy(v30);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NTKFace argon_overlayAssetType](self, "argon_overlayAssetType");
    if (v12 == 1)
    {
      -[NTKFace argon_embeddedOverlayAssetURL](self, "argon_embeddedOverlayAssetURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v36 = v11;
          v37 = 2114;
          v38 = v14;
          _os_log_impl(&dword_1B72A3000, v16, OS_LOG_TYPE_DEFAULT, "Notification: Displaying in-bundle overlay asset for bundle %{public}@ at %{public}@", buf, 0x16u);
        }

        v29 = 0;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v14, 0, &v29);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v29;
        if (v17)
          v10[2](v10, v17, 0);
        else
          (*((void (**)(id, _QWORD, uint64_t, id))v9 + 2))(v9, 0, 1, v18);

      }
      else
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[NTKFace(ArgonSupport) argon_notificationOverlayImageWithCompletion:].cold.1(v16, v19, v20, v21, v22, v23, v24, v25);

        v26 = (void *)MEMORY[0x1E0CB35C8];
        v40[0] = CFSTR("overlay asset missing");
        v39[0] = CFSTR("description");
        v39[1] = CFSTR("bundleID");
        -[NTKFace bundleIdentifier](self, "bundleIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v40[1] = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("NTKFaceSupportDomain"), 800, v28);
        v18 = (id)objc_claimAutoreleasedReturnValue();

        (*((void (**)(id, _QWORD, uint64_t, id))v9 + 2))(v9, 0, 1, v18);
      }

    }
    else
    {
      if (!v12)
      {
        _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v36 = v11;
          _os_log_impl(&dword_1B72A3000, v13, OS_LOG_TYPE_DEFAULT, "Notification: Displaying default overlay asset for bundle %{public}@.", buf, 0xCu);
        }

      }
      (*((void (**)(void *, _QWORD))v8 + 2))(v8, 0);
    }

  }
}

void __70__NTKFace_ArgonSupport__argon_notificationOverlayImageWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKFaceSupportDomain"), 606, &unk_1E6CA8960);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, uint64_t, id))(v1 + 16))(v1, 0, 1, v2);

}

void __70__NTKFace_ArgonSupport__argon_notificationOverlayImageWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  CGDataProvider *v6;
  CGDataProvider *v7;
  CGPDFDocument *v8;
  CGPDFDocument *v9;
  CGPDFPage *Page;
  CGPDFPage *v11;
  double width;
  double height;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFData *data;
  _QWORD v22[9];
  CGRect BoxRect;

  data = a2;
  v5 = a3;
  if (data)
  {
    v6 = CGDataProviderCreateWithCFData(data);
    if (v6)
    {
      v7 = v6;
      v8 = CGPDFDocumentCreateWithProvider(v6);
      if (v8)
      {
        v9 = v8;
        Page = CGPDFDocumentGetPage(v8, 1uLL);
        if (Page)
        {
          v11 = Page;
          BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFMediaBox);
          width = BoxRect.size.width;
          height = BoxRect.size.height;
          objc_msgSend(MEMORY[0x1E0DC3830], "preferredFormat", BoxRect.origin.x, BoxRect.origin.y);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setOpaque:", 0);
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v14, width, height);
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __70__NTKFace_ArgonSupport__argon_notificationOverlayImageWithCompletion___block_invoke_3;
          v22[3] = &__block_descriptor_72_e40_v16__0__UIGraphicsImageRendererContext_8l;
          v22[4] = 0;
          v22[5] = 0;
          *(double *)&v22[6] = width;
          *(double *)&v22[7] = height;
          v22[8] = v11;
          objc_msgSend(v15, "imageWithActions:", v22);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          CFRelease(v7);
          CFRelease(v9);
          if (v16)
          {
            (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKFaceSupportDomain"), 707, &unk_1E6CA8A00);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

          }
          goto LABEL_14;
        }
        CFRelease(v7);
        CFRelease(v9);
        v17 = (void *)MEMORY[0x1E0CB35C8];
        v18 = &unk_1E6CA89D8;
        v19 = 704;
      }
      else
      {
        CFRelease(v7);
        v17 = (void *)MEMORY[0x1E0CB35C8];
        v18 = &unk_1E6CA89B0;
        v19 = 702;
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = &unk_1E6CA8988;
      v19 = 701;
    }
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("NTKFaceSupportDomain"), v19, v18, data);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_14:

    goto LABEL_15;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_15:

}

void __70__NTKFace_ArgonSupport__argon_notificationOverlayImageWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  CGContext *v3;
  CGFloat Height;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  Height = CGRectGetHeight(*(CGRect *)(a1 + 32));
  CGContextTranslateCTM(v3, 0.0, Height);
  CGContextScaleCTM(v3, 1.0, -1.0);
  CGContextDrawPDFPage(v3, *(CGPDFPageRef *)(a1 + 64));
}

+ (id)defaultFaceFromFaceDescriptor:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[NTKFace(NTKFaceDescriptorAdditions) defaultFaceFromFaceDescriptor:forDevice:].cold.1(v11);
    v14 = 0;
    goto LABEL_26;
  }
  if (!v7)
  {
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[NTKFace(NTKFaceDescriptorAdditions) defaultFaceFromFaceDescriptor:forDevice:].cold.6();

    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = objc_msgSend(v6, "faceStyle");
  if (v10 == 44)
  {
    objc_msgSend(v6, "bundleIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[NTKFaceDescriptor faceClass].cold.1();
      v14 = 0;
      goto LABEL_25;
    }
    +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "faceBundleForBundleIdentifier:onDevice:", v11, v8);
    v13 = objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[NSObject defaultFaceForDevice:](v13, "defaultFaceForDevice:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
LABEL_25:

LABEL_26:
        goto LABEL_27;
      }
      _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[NTKFace(NTKFaceDescriptorAdditions) defaultFaceFromFaceDescriptor:forDevice:].cold.4();
    }
    else
    {
      _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[NTKFace(NTKFaceDescriptorAdditions) defaultFaceFromFaceDescriptor:forDevice:].cold.3();
      v14 = 0;
    }

    goto LABEL_25;
  }
  v16 = v10;
  objc_msgSend(a1, "defaultFaceOfStyle:forDevice:", v10, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[NTKFace(NTKFaceDescriptorAdditions) defaultFaceFromFaceDescriptor:forDevice:].cold.5(v16, (uint64_t)v6, v11);
    goto LABEL_26;
  }
LABEL_27:

  return v14;
}

- (id)faceDescriptor
{
  int64_t v3;
  NTKFaceDescriptor *v4;
  void *v5;
  NTKFaceDescriptor *v6;

  v3 = -[NTKFace faceStyle](self, "faceStyle");
  v4 = [NTKFaceDescriptor alloc];
  if (v3 == 44)
  {
    -[NTKFace bundleIdentifier](self, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NTKFaceDescriptor initWithBundleIdentifier:](v4, "initWithBundleIdentifier:", v5);

  }
  else
  {
    v6 = -[NTKFaceDescriptor initWithFaceStyle:](v4, "initWithFaceStyle:", -[NTKFace faceStyle](self, "faceStyle"));
  }
  return v6;
}

- (int64_t)_editModeForOldEncodingIndex:(int64_t)a3
{
  return 0;
}

- (id)_complicationMigrationPaths
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3
{
  return 0;
}

- (id)_faceWithRichComplicationSlots
{
  void *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v11[5];
  uint8_t buf[4];
  NTKFace *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[NTKFace device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (NTKShowBlueRidgeUI(v3)
    && (v4 = -[NTKFace faceStyle](self, "faceStyle"),
        v5 = __52__NTKFace_Migration___faceWithRichComplicationSlots__block_invoke(v4, v4),
        v5 != -1)
    && (v6 = v5,
        (v7 = (void *)objc_msgSend((id)objc_opt_class(), "_faceClassOfFaceWithRichComplicationSlotsForDevice:", v3)) != 0))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __52__NTKFace_Migration___faceWithRichComplicationSlots__block_invoke_2;
    v11[3] = &unk_1E6BD9AA8;
    v11[4] = self;
    objc_msgSend(v7, "defaultFaceOfStyle:forDevice:initCustomization:", v6, v3, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _NTKLoggingObjectForDomain(17, (uint64_t)"NTKLoggingDomainMigration");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v13 = self;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "***** blue_ridge migration from face %@ to face %@", buf, 0x16u);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __52__NTKFace_Migration___faceWithRichComplicationSlots__block_invoke(uint64_t a1, unint64_t a2)
{
  if (a2 > 0x21)
    return -1;
  else
    return qword_1B755FDA8[a2];
}

void __52__NTKFace_Migration___faceWithRichComplicationSlots__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "editModes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "editModes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v4, "containsObject:", v10))
        {
          v11 = objc_msgSend(v10, "integerValue");
          if (v11 != 1)
          {
            v12 = v11;
            objc_msgSend(*(id *)(a1 + 32), "selectedOptionForCustomEditMode:slot:", v11, 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "selectOption:forCustomEditMode:slot:", v13, v12, 0);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v7);
  }
  v14 = *(void **)(a1 + 32);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __52__NTKFace_Migration___faceWithRichComplicationSlots__block_invoke_3;
  v23[3] = &unk_1E6BCF4C8;
  v23[4] = v14;
  v15 = v3;
  v24 = v15;
  objc_msgSend(v14, "enumerateComplicationSlotsWithBlock:", v23);
  objc_msgSend(*(id *)(a1 + 32), "resourceDirectory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    NTKNewUniqueTeporaryResourceDirectory();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "resourceDirectory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v18, "copyItemAtPath:toPath:error:", v19, v17, &v22);
    v20 = v22;

    if (v20)
    {
      _NTKLoggingObjectForDomain(17, (uint64_t)"NTKLoggingDomainMigration");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        __52__NTKFace_Migration___faceWithRichComplicationSlots__block_invoke_2_cold_1(v15, v21);

      v17 = 0;
    }
    objc_msgSend(v15, "setResourceDirectory:", v17);

  }
}

void __52__NTKFace_Migration___faceWithRichComplicationSlots__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(a1 + 32), "complicationForSlot:", v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "rankedComplicationFamiliesForSlot:", v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v5, "integerValue");
    objc_msgSend(*(id *)(a1 + 40), "allowedComplicationsForSlot:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_migrateToFamily:withAllowedComplications:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (void *)v8;
    else
      v10 = v3;
    v11 = v10;

    v3 = v11;
  }
  objc_msgSend(*(id *)(a1 + 40), "setComplication:forSlot:", v3, v12);

}

- (id)_migratedFaceBundleIdentifier
{
  return 0;
}

- (id)_migratedBundleFace
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  void *v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[NTKFace device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NTKFace faceStyle](self, "faceStyle");
  if (v4 > 201)
  {
    if (v4 <= 220)
    {
      if (v4 == 202)
        goto LABEL_26;
      if (v4 == 218)
      {
LABEL_9:
        +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("com.apple.NTKBigNumeralsAnalogFaceBundle");
        goto LABEL_29;
      }
LABEL_12:
      -[NTKFace _migratedFaceBundleIdentifier](self, "_migratedFaceBundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        v22 = 0;
        goto LABEL_31;
      }
      +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "faceBundleForBundleIdentifier:onDevice:", v8, v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v30 = v10;
        v31 = v8;
        objc_msgSend(v10, "defaultFaceForDevice:", v3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setForMigration:", 1);
        -[NTKFace selectedOptionsForCustomEditModes](self, "selectedOptionsForCustomEditModes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v35 != v15)
                objc_enumerationMutation(v12);
              v17 = objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "unsignedIntValue");
              -[NTKFace selectedOptionForCustomEditMode:slot:](self, "selectedOptionForCustomEditMode:slot:", v17, 0);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "optionAtIndex:forCustomEditMode:slot:", -[NTKFace indexOfOption:forCustomEditMode:slot:](self, "indexOfOption:forCustomEditMode:slot:", v18, v17, 0), v17, 0);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "selectOption:forCustomEditMode:slot:", v19, v17, 0);

            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          }
          while (v14);
        }
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __41__NTKFace_Migration___migratedBundleFace__block_invoke;
        v32[3] = &unk_1E6BCF4C8;
        v32[4] = self;
        v20 = v11;
        v33 = v20;
        -[NTKFace enumerateComplicationSlotsWithBlock:](self, "enumerateComplicationSlotsWithBlock:", v32);
        v21 = v33;
        v22 = v20;

        v10 = v30;
        v8 = v31;
      }
      else
      {
        v22 = 0;
      }
      goto LABEL_25;
    }
    if (v4 != 221)
    {
      if (v4 != 224)
        goto LABEL_12;
      goto LABEL_24;
    }
LABEL_27:
    v27 = objc_msgSend(v3, "deviceCategory");
    +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v27 < 3)
    {
      objc_msgSend(v5, "faceBundleForFaceStyle:onDevice:", 29, v3);
      v28 = objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
    v7 = CFSTR("com.apple.NTKCloudrakerFaceBundle");
LABEL_29:
    objc_msgSend(v5, "faceBundleForBundleIdentifier:onDevice:", v7, v3);
    v28 = objc_claimAutoreleasedReturnValue();
LABEL_30:
    v8 = (void *)v28;

    objc_msgSend(v8, "defaultFaceForDevice:", v3);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (v4 <= 20)
  {
    if (v4 != 2)
    {
      if (v4 != 18)
        goto LABEL_12;
      goto LABEL_9;
    }
LABEL_26:
    +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("com.apple.NTKAlaskanFaceBundle.NTKSharkFaceBundle");
    goto LABEL_29;
  }
  if (v4 == 21)
    goto LABEL_27;
  if (v4 != 24)
    goto LABEL_12;
LABEL_24:
  +[NTKFaceBundleManager sharedManager](NTKFaceBundleManager, "sharedManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "faceBundleForFaceStyle:onDevice:", 30, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "defaultFaceForDevice:", v3);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D10860], "complicationWithBundleIdentifier:appBundleIdentifier:complicationDescriptor:", CFSTR("com.apple.NanoTimeKit.NTKCellularConnectivityComplicationDataSource"), 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKBundleComplication bundledComplicationWithComplication:](NTKBundleComplication, "bundledComplicationWithComplication:", v10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setComplication:forSlot:", v24, CFSTR("bezel"));

  objc_msgSend(MEMORY[0x1E0D10860], "complicationWithBundleIdentifier:appBundleIdentifier:complicationDescriptor:", CFSTR("com.apple.NanoTimeKit.AnalogSeconds"), 0, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKBundleComplication bundledComplicationWithComplication:](NTKBundleComplication, "bundledComplicationWithComplication:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setComplication:forSlot:", v26, CFSTR("slot3"));

LABEL_25:
LABEL_31:

  return v22;
}

void __41__NTKFace_Migration___migratedBundleFace__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "complicationForSlot:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setComplication:forSlot:", v5, v4);

}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  unint64_t result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  return result;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  return result;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  unint64_t result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  return result;
}

void __48__NTKFace_selectedSlotOptionsForCustomEditMode___block_invoke_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1B72A3000, v2, v3, "MISSING SELECTION FOR AN EDIT OPTION (face: %@, editMode: %ld). falling back to default edit option.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_8();
}

- (void)preferredComplicationFamilyForComplication:withSlot:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = v0;
  _os_log_error_impl(&dword_1B72A3000, v1, OS_LOG_TYPE_ERROR, "No supported families were found for complication:%@ slot:%@ in descriptor", v2, 0x16u);
}

+ (void)faceWithJSONObjectRepresentation:(os_log_t)log forDevice:forMigration:allowFallbackFromInvalidFaceStyle:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "Face bundle fatal error: %@", buf, 0xCu);

}

- (void)hasValidConfigurationForDevice:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1B72A3000, v2, v3, "Edit option %@ does not exist in device %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

void __64__NTKFace_ArgonSupport__argon_compositedSnapshotWithCompletion___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a2, a3, "Error getting overlay %@ - using fallback…", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __52__NTKFace_Migration___faceWithRichComplicationSlots__block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "resourceDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v4;
  v7 = 2112;
  v8 = a1;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "***** blue_ridge cannot copy resource directory %@ of face %@", (uint8_t *)&v5, 0x16u);

}

@end
