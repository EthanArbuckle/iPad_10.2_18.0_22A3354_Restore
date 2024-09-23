@implementation MPModelObject

void __33__MPModelObject__indexProperties__block_invoke(uint64_t a1, objc_property_t property)
{
  NSString *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *Name;
  char *v10;
  char *v11;
  const char *Uid;
  void *v13;
  char *v14;
  char *v15;
  char *v16;
  const char *v17;
  void *v18;
  void *v19;
  char *v20;
  char *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", property_getName(property));
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("__%@_KEY"), v28);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  v5 = NSSelectorFromString(v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 56), v5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_18;
    v7 = (void *)v6;
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v28, v6);

  }
  v8 = *(void **)(a1 + 40);
  Name = property_getName(property);
  v10 = property_copyAttributeValue(property, "G");
  v11 = v10;
  if (!v10)
    v10 = (char *)Name;
  Uid = sel_getUid(v10);
  free(v11);
  NSStringFromSelector(Uid);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v28, v13);

  v14 = property_copyAttributeValue(property, "R");
  if (v14)
  {
    free(v14);
    goto LABEL_11;
  }
  v15 = property_copyAttributeValue(property, "S");
  if (v15)
  {
    v16 = v15;
    v17 = sel_getUid(v15);
    free(v16);
    if (!v17)
      goto LABEL_11;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithUTF8String:", property_getName(property));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "substringToIndex:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "uppercaseString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "replaceCharactersInRange:withString:", 0, 1, v26);

  objc_msgSend(v24, "insertString:atIndex:", CFSTR("set"), 0);
  objc_msgSend(v24, "appendString:", CFSTR(":"));
  v27 = objc_retainAutorelease(v24);
  v17 = sel_getUid((const char *)objc_msgSend(v27, "UTF8String"));

  if (v17)
  {
LABEL_10:
    v18 = *(void **)(a1 + 40);
    NSStringFromSelector(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v28, v19);

  }
LABEL_11:
  v20 = property_copyAttributeValue(property, "T");
  if (v20)
  {
    v21 = v20;
    if (*v20 == 64)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "hasPrefix:", CFSTR("@\"))
        && objc_msgSend(v22, "hasSuffix:", CFSTR("\")))
      {
        objc_msgSend(v22, "substringWithRange:", 2, objc_msgSend(v22, "length") - 3);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v23);

      }
    }
    free(v21);
  }
LABEL_18:

}

- (void)setValue:(id)a3 forModelKey:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  objc_property *Property;
  char *v12;
  char *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v18 = a3;
  v7 = a4;
  if (MSVDeviceOSIsInternalInstall())
  {
    if (_MPModelObjectEnforcementDisabledPThreadKey_sOnceToken != -1)
      dispatch_once(&_MPModelObjectEnforcementDisabledPThreadKey_sOnceToken, &__block_literal_global_250_29576);
    if (!pthread_getspecific(_MPModelObjectEnforcementDisabledPThreadKey_sThreadKey) && self->_isFinalized)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelObject.m"), 461, CFSTR("Attempt to set enforced property after initialization: %@"), v7);

    }
  }
  v8 = (void *)objc_opt_class();
  objc_getAssociatedObject(v8, (const void *)_MPModelObjectModelKeyPropertyIndexKey);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v7);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  Property = class_getProperty((Class)v8, (const char *)objc_msgSend(v10, "UTF8String"));

  v12 = property_copyAttributeValue(Property, "C");
  if (v12)
  {
    v13 = v12;
    v14 = objc_msgSend(v18, "copy");

    free(v13);
    v15 = (id)v14;
  }
  else
  {
    v15 = v18;
  }
  v19 = v15;
  if (v15)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v15, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v16, v7);

  }
}

- (id)valueForModelKey:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;

  v5 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 && MSVDeviceOSIsInternalInstall())
  {
    if (_MPModelObjectEnforcementDisabledPThreadKey_sOnceToken != -1)
      dispatch_once(&_MPModelObjectEnforcementDisabledPThreadKey_sOnceToken, &__block_literal_global_250_29576);
    if (!pthread_getspecific(_MPModelObjectEnforcementDisabledPThreadKey_sThreadKey))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelObject.m"), 451, CFSTR("Attempt to retrieve enforced uninitialized property: %@"), v5);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
    v8 = 0;
  else
    v8 = v6;
  v9 = v8;

  return v9;
}

+ (id)_modelKeyForPropertySelector:(SEL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_getAssociatedObject(a1, (const void *)_MPModelObjectPropertySelectorIndexKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(a1, (const void *)_MPModelObjectModelKeyPropertyIndexKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "keyForObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsKeepLocalStatusObservation
{
  return 0;
}

+ (BOOL)supportsLibraryAddStatusObservation
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

- (id)copyWithIdentifiers:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)objc_opt_class());
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__MPModelObject_copyWithIdentifiers_block___block_invoke;
  v12[3] = &unk_1E315BB58;
  v12[4] = self;
  v13 = v6;
  v9 = v6;
  v10 = (void *)objc_msgSend(v8, "initWithIdentifiers:block:", v7, v12);

  return v10;
}

- (MPModelObject)initWithIdentifiers:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, MPModelObject *);
  MPModelObject *v8;
  uint64_t v9;
  MPIdentifierSet *identifiers;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *storage;
  objc_super v16;

  v6 = a3;
  v7 = (void (**)(id, MPModelObject *))a4;
  v16.receiver = self;
  v16.super_class = (Class)MPModelObject;
  v8 = -[MPModelObject init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifiers = v8->_identifiers;
    v8->_identifiers = (MPIdentifierSet *)v9;

    v11 = (void *)objc_opt_class();
    objc_getAssociatedObject(v11, (const void *)_MPModelObjectSharedKeySetKey);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithSharedKeySet:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    storage = v8->_storage;
    v8->_storage = (NSMutableDictionary *)v13;

    v7[2](v7, v8);
    v8->_isFinalized = 1;

  }
  return v8;
}

void __43__MPModelObject_copyWithIdentifiers_block___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v6 = a2;
  v4 = objc_msgSend(v3, "mutableCopy");
  v5 = (void *)v6[1];
  v6[1] = v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (MPIdentifierSet)identifiers
{
  return self->_identifiers;
}

+ (void)performWithoutEnforcement:(id)a3
{
  pthread_key_t v3;
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  if (!MSVDeviceOSIsInternalInstall())
    goto LABEL_5;
  if (_MPModelObjectEnforcementDisabledPThreadKey_sOnceToken != -1)
    dispatch_once(&_MPModelObjectEnforcementDisabledPThreadKey_sOnceToken, &__block_literal_global_250_29576);
  if (!pthread_getspecific(_MPModelObjectEnforcementDisabledPThreadKey_sThreadKey))
  {
    if (_MPModelObjectEnforcementDisabledPThreadKey_sOnceToken != -1)
      dispatch_once(&_MPModelObjectEnforcementDisabledPThreadKey_sOnceToken, &__block_literal_global_250_29576);
    v3 = _MPModelObjectEnforcementDisabledPThreadKey_sThreadKey;
    pthread_setspecific(_MPModelObjectEnforcementDisabledPThreadKey_sThreadKey, (const void *)1);
    v4[2]();
    pthread_setspecific(v3, 0);
  }
  else
  {
LABEL_5:
    v4[2]();
  }

}

void __47__MPModelObject_hasLoadedValuesForPropertySet___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "hasLoadedValueForKey:", v10);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    goto LABEL_5;
  objc_msgSend(*(id *)(a1 + 32), "valueForModelKey:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v8, "hasLoadedValuesForPropertySet:", v7);

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
LABEL_5:
    *a4 = 1;

}

- (BOOL)hasLoadedValuesForPropertySet:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  BOOL v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "properties");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v5);
        if (!-[MPModelObject hasLoadedValueForKey:](self, "hasLoadedValueForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i)))
        {

          v10 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v6)
        continue;
      break;
    }
  }

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  objc_msgSend(v4, "relationships");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__MPModelObject_hasLoadedValuesForPropertySet___block_invoke;
  v12[3] = &unk_1E315F508;
  v12[4] = self;
  v12[5] = &v13;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v12);
  v10 = *((_BYTE *)v14 + 24) != 0;

  _Block_object_dispose(&v13, 8);
LABEL_11:

  return v10;
}

- (BOOL)hasLoadedValueForKey:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKey:](self->_storage, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  unsigned __int8 v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, objc_property_t, const char *, const char *);
  void *v11;
  uint64_t *v12;
  SEL v13;
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __39__MPModelObject_resolveInstanceMethod___block_invoke;
  v11 = &unk_1E315BAF0;
  v12 = &v15;
  v13 = a3;
  v14 = a1;
  objc_msgSend(a1, "_lookupPropertyForSelector:result:");
  if (*((_BYTE *)v16 + 24))
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___MPModelObject;
    v5 = objc_msgSendSuper2(&v7, sel_resolveInstanceMethod_, a3);
  }
  _Block_object_dispose(&v15, 8);
  return v5;
}

+ (BOOL)_lookupPropertyForSelector:(SEL)a3 result:(id)a4
{
  void (**v6)(id, objc_property *, SEL, SEL);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  objc_property *Property;
  objc_property *v12;
  const char *Name;
  char *v14;
  char *v15;
  SEL Uid;
  char *v17;
  SEL v18;
  char *v19;
  char *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v6 = (void (**)(id, objc_property *, SEL, SEL))a4;
  objc_getAssociatedObject(a1, (const void *)_MPModelObjectPropertySelectorIndexKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_retainAutorelease(v9);
  Property = class_getProperty((Class)a1, (const char *)objc_msgSend(v10, "UTF8String"));
  v12 = Property;
  if (Property)
  {
    Name = property_getName(Property);
    v14 = property_copyAttributeValue(v12, "G");
    v15 = v14;
    if (!v14)
      v14 = (char *)Name;
    Uid = sel_getUid(v14);
    free(v15);
    v17 = property_copyAttributeValue(v12, "R");
    if (v17)
    {
      free(v17);
      v18 = 0;
    }
    else
    {
      v19 = property_copyAttributeValue(v12, "S");
      if (v19)
      {
        v20 = v19;
        v18 = sel_getUid(v19);
        free(v20);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithUTF8String:", property_getName(v12));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "substringToIndex:", 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "uppercaseString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "replaceCharactersInRange:withString:", 0, 1, v23);

        objc_msgSend(v21, "insertString:atIndex:", CFSTR("set"), 0);
        objc_msgSend(v21, "appendString:", CFSTR(":"));
        v24 = objc_retainAutorelease(v21);
        v18 = sel_getUid((const char *)objc_msgSend(v24, "UTF8String"));

      }
    }
    v6[2](v6, v12, Uid, v18);
  }

  return v12 != 0;
}

void __39__MPModelObject_resolveInstanceMethod___block_invoke(uint64_t a1, objc_property_t property, const char *a3, const char *a4)
{
  char *v7;
  int v8;
  objc_class *v9;
  const char *v10;
  void (*v11)(void);
  const char *v12;
  int v13;
  objc_class *v14;
  const char *v15;
  void (*v16)(void);
  const char *v17;

  v7 = property_copyAttributeValue(property, "T");
  if (sel_isEqual(*(SEL *)(a1 + 40), a3))
  {
    v8 = *v7;
    if (v8 > 82)
    {
      switch(*v7)
      {
        case 'c':
          v10 = *(const char **)(a1 + 40);
          v9 = *(objc_class **)(a1 + 48);
          v11 = (void (*)(void))_MPModelObject_c_getterIMP;
          v12 = "c@:";
          break;
        case 'd':
          v10 = *(const char **)(a1 + 40);
          v9 = *(objc_class **)(a1 + 48);
          v11 = (void (*)(void))_MPModelObject_d_getterIMP;
          v12 = "d@:";
          break;
        case 'e':
        case 'g':
        case 'h':
        case 'j':
        case 'k':
        case 'm':
        case 'n':
        case 'o':
        case 'p':
        case 'r':
          goto LABEL_23;
        case 'f':
          v10 = *(const char **)(a1 + 40);
          v9 = *(objc_class **)(a1 + 48);
          v11 = (void (*)(void))_MPModelObject_f_getterIMP;
          v12 = "f@:";
          break;
        case 'i':
          v10 = *(const char **)(a1 + 40);
          v9 = *(objc_class **)(a1 + 48);
          v11 = (void (*)(void))_MPModelObject_i_getterIMP;
          v12 = "i@:";
          break;
        case 'l':
          v10 = *(const char **)(a1 + 40);
          v9 = *(objc_class **)(a1 + 48);
          v11 = (void (*)(void))_MPModelObject_l_getterIMP;
          v12 = "l@:";
          break;
        case 'q':
          v10 = *(const char **)(a1 + 40);
          v9 = *(objc_class **)(a1 + 48);
          v11 = (void (*)(void))_MPModelObject_q_getterIMP;
          v12 = "q@:";
          break;
        case 's':
          v10 = *(const char **)(a1 + 40);
          v9 = *(objc_class **)(a1 + 48);
          v11 = (void (*)(void))_MPModelObject_s_getterIMP;
          v12 = "s@:";
          break;
        default:
          if (v8 != 83)
            goto LABEL_23;
          v10 = *(const char **)(a1 + 40);
          v9 = *(objc_class **)(a1 + 48);
          v11 = (void (*)(void))_MPModelObject_S_getterIMP;
          v12 = "S@:";
          break;
      }
    }
    else
    {
      switch(*v7)
      {
        case '@':
          v10 = *(const char **)(a1 + 40);
          v9 = *(objc_class **)(a1 + 48);
          v11 = (void (*)(void))_MPModelObject__getterIMP;
          v12 = "@@:";
          break;
        case 'A':
        case 'D':
        case 'E':
        case 'F':
        case 'G':
        case 'H':
          goto LABEL_23;
        case 'B':
          v10 = *(const char **)(a1 + 40);
          v9 = *(objc_class **)(a1 + 48);
          v11 = (void (*)(void))_MPModelObject_B_getterIMP;
          v12 = "B@:";
          break;
        case 'C':
          v10 = *(const char **)(a1 + 40);
          v9 = *(objc_class **)(a1 + 48);
          v11 = (void (*)(void))_MPModelObject_C_getterIMP;
          v12 = "C@:";
          break;
        case 'I':
          v10 = *(const char **)(a1 + 40);
          v9 = *(objc_class **)(a1 + 48);
          v11 = (void (*)(void))_MPModelObject_I_getterIMP;
          v12 = "I@:";
          break;
        default:
          if (v8 == 76)
          {
            v10 = *(const char **)(a1 + 40);
            v9 = *(objc_class **)(a1 + 48);
            v11 = (void (*)(void))_MPModelObject_L_getterIMP;
            v12 = "L@:";
          }
          else
          {
            if (v8 != 81)
              goto LABEL_23;
            v10 = *(const char **)(a1 + 40);
            v9 = *(objc_class **)(a1 + 48);
            v11 = (void (*)(void))_MPModelObject_Q_getterIMP;
            v12 = "Q@:";
          }
          break;
      }
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = class_addMethod(v9, v10, v11, v12);
  }
LABEL_23:
  if (sel_isEqual(*(SEL *)(a1 + 40), a4))
  {
    v13 = *v7;
    if (v13 > 82)
    {
      switch(*v7)
      {
        case 'c':
          v15 = *(const char **)(a1 + 40);
          v14 = *(objc_class **)(a1 + 48);
          v16 = (void (*)(void))_MPModelObject_c_setterIMP;
          v17 = "v@:c";
          break;
        case 'd':
          v15 = *(const char **)(a1 + 40);
          v14 = *(objc_class **)(a1 + 48);
          v16 = (void (*)(void))_MPModelObject_d_setterIMP;
          v17 = "v@:d";
          break;
        case 'e':
        case 'g':
        case 'h':
        case 'j':
        case 'k':
        case 'm':
        case 'n':
        case 'o':
        case 'p':
        case 'r':
          goto LABEL_45;
        case 'f':
          v15 = *(const char **)(a1 + 40);
          v14 = *(objc_class **)(a1 + 48);
          v16 = (void (*)(void))_MPModelObject_f_setterIMP;
          v17 = "v@:f";
          break;
        case 'i':
          v15 = *(const char **)(a1 + 40);
          v14 = *(objc_class **)(a1 + 48);
          v16 = (void (*)(void))_MPModelObject_i_setterIMP;
          v17 = "v@:i";
          break;
        case 'l':
          v15 = *(const char **)(a1 + 40);
          v14 = *(objc_class **)(a1 + 48);
          v16 = (void (*)(void))_MPModelObject_l_setterIMP;
          v17 = "v@:l";
          break;
        case 'q':
          v15 = *(const char **)(a1 + 40);
          v14 = *(objc_class **)(a1 + 48);
          v16 = (void (*)(void))_MPModelObject_q_setterIMP;
          v17 = "v@:q";
          break;
        case 's':
          v15 = *(const char **)(a1 + 40);
          v14 = *(objc_class **)(a1 + 48);
          v16 = (void (*)(void))_MPModelObject_s_setterIMP;
          v17 = "v@:s";
          break;
        default:
          if (v13 != 83)
            goto LABEL_45;
          v15 = *(const char **)(a1 + 40);
          v14 = *(objc_class **)(a1 + 48);
          v16 = (void (*)(void))_MPModelObject_S_setterIMP;
          v17 = "v@:S";
          break;
      }
    }
    else
    {
      switch(*v7)
      {
        case '@':
          v15 = *(const char **)(a1 + 40);
          v14 = *(objc_class **)(a1 + 48);
          v16 = (void (*)(void))_MPModelObject__setterIMP;
          v17 = "v@:@";
          break;
        case 'A':
        case 'D':
        case 'E':
        case 'F':
        case 'G':
        case 'H':
          goto LABEL_45;
        case 'B':
          v15 = *(const char **)(a1 + 40);
          v14 = *(objc_class **)(a1 + 48);
          v16 = (void (*)(void))_MPModelObject_B_setterIMP;
          v17 = "v@:B";
          break;
        case 'C':
          v15 = *(const char **)(a1 + 40);
          v14 = *(objc_class **)(a1 + 48);
          v16 = (void (*)(void))_MPModelObject_C_setterIMP;
          v17 = "v@:C";
          break;
        case 'I':
          v15 = *(const char **)(a1 + 40);
          v14 = *(objc_class **)(a1 + 48);
          v16 = (void (*)(void))_MPModelObject_I_setterIMP;
          v17 = "v@:I";
          break;
        default:
          if (v13 == 76)
          {
            v15 = *(const char **)(a1 + 40);
            v14 = *(objc_class **)(a1 + 48);
            v16 = (void (*)(void))_MPModelObject_L_setterIMP;
            v17 = "v@:L";
          }
          else
          {
            if (v13 != 81)
              goto LABEL_45;
            v15 = *(const char **)(a1 + 40);
            v14 = *(objc_class **)(a1 + 48);
            v16 = (void (*)(void))_MPModelObject_Q_setterIMP;
            v17 = "v@:Q";
          }
          break;
      }
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = class_addMethod(v14, v15, v16, v17);
  }
LABEL_45:
  free(v7);
}

void __34__MPModelObject__sanitizedStorage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend((id)objc_opt_class(), "supportsSecureCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  void *v3;

  v3 = (void *)MEMORY[0x19403A624](a1, a2);
  objc_msgSend(a1, "_indexProperties");
  objc_autoreleasePoolPop(v3);
}

+ (void)_indexProperties
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  objc_property_t *v10;
  unint64_t v11;
  BOOL v12;
  void *v13;
  const void *v14;
  void *v15;
  id object;
  _QWORD v17[2];
  void (*v18)(uint64_t, objc_property_t);
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  char v24;
  unsigned int outCount;

  objc_msgSend(MEMORY[0x1E0D4D098], "bidirectionalDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  object = Superclass;
  do
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v18 = __33__MPModelObject__indexProperties__block_invoke;
    v19 = &unk_1E315BBF8;
    v23 = Superclass;
    v6 = v3;
    v20 = v6;
    v7 = v4;
    v21 = v7;
    v8 = v5;
    v22 = v8;
    v9 = v17;
    outCount = 0;
    v10 = class_copyPropertyList((Class)Superclass, &outCount);
    v24 = 0;
    if (outCount)
    {
      v11 = 0;
      do
      {
        ((void (*)(_QWORD *, objc_property_t, char *))v18)(v9, v10[v11++], &v24);
        if (v24)
          v12 = 1;
        else
          v12 = v11 >= outCount;
      }
      while (!v12);
    }
    free(v10);

    Superclass = class_getSuperclass((Class)Superclass);
  }
  while (Superclass != (id)objc_opt_class());
  objc_msgSend(v6, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(object, (const void *)_MPModelObjectPropertySelectorIndexKey, v7, (void *)3);
  objc_setAssociatedObject(object, (const void *)_MPModelObjectModelKeyPropertyIndexKey, v6, (void *)3);
  v14 = (const void *)_MPModelObjectSharedKeySetKey;
  objc_msgSend(MEMORY[0x1E0C99E08], "sharedKeySetForKeys:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(object, v14, v15, (void *)1);

  objc_setAssociatedObject(object, (const void *)_MPModelObjectPropertyClassesKey, v8, (void *)3);
}

+ (id)requiredLibraryRemovalProperties
{
  return 0;
}

+ (id)requiredKeepLocalStatusObservationProperties
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  MPIdentifierSet *identifiers;
  MPIdentifierSet *v7;
  _BOOL4 v8;
  char v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      identifiers = self->_identifiers;
      objc_msgSend(v5, "identifiers");
      v7 = (MPIdentifierSet *)(id)objc_claimAutoreleasedReturnValue();
      if (identifiers == v7)
      {

      }
      else
      {
        v8 = -[MPIdentifierSet isEqual:](identifiers, "isEqual:", v7);

        if (!v8)
        {
          v9 = 0;
LABEL_12:

          goto LABEL_13;
        }
      }
      -[MPModelObject _sanitizedStorage](self, "_sanitizedStorage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_sanitizedStorage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 == v11)
        v9 = 1;
      else
        v9 = objc_msgSend(v10, "isEqual:", v11);

      goto LABEL_12;
    }
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (id)_sanitizedStorage
{
  void *v3;
  NSMutableDictionary *storage;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)-[NSMutableDictionary mutableCopy](self->_storage, "mutableCopy");
  storage = self->_storage;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__MPModelObject__sanitizedStorage__block_invoke;
  v7[3] = &unk_1E315D4F0;
  v5 = v3;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](storage, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSMutableDictionary *storage;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MPModelObject identifiers](self, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableDictionary count](self->_storage, "count"))
    storage = self->_storage;
  else
    storage = (NSMutableDictionary *)CFSTR("{}");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p identifiers=%@ properties=%@>"), v4, self, v5, storage);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)contentItemCollectionInfo
{
  return 0;
}

- (id)mediaItemPropertyValues
{
  return 0;
}

- (MPLibraryAddStatusObserverConfiguration)libraryAddStatusObserverConfiguration
{
  return (MPLibraryAddStatusObserverConfiguration)0;
}

+ (id)requiredLibraryAddStatusObservationProperties
{
  return 0;
}

+ (NSArray)classesForSecureCoding
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (MPModelObject)initWithIdentifiers:(id)a3
{
  return -[MPModelObject initWithIdentifiers:block:](self, "initWithIdentifiers:block:", a3, &__block_literal_global_29714);
}

- (NSString)humanDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (-[MPModelObject _isModelKey:](self, "_isModelKey:", v4))
  {
    -[MPModelObject valueForModelKey:](self, "valueForModelKey:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MPModelObject;
    -[MPModelObject valueForUndefinedKey:](&v8, sel_valueForUndefinedKey_, v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (-[MPModelObject _isModelKey:](self, "_isModelKey:", v7))
    -[MPModelObject setValue:forModelKey:](self, "setValue:forModelKey:", v6, v7);
  v8.receiver = self;
  v8.super_class = (Class)MPModelObject;
  -[MPModelObject setValue:forUndefinedKey:](&v8, sel_setValue_forUndefinedKey_, v6, v7);

}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[MPIdentifierSet hash](self->_identifiers, "hash");
  return -[NSMutableDictionary hash](self->_storage, "hash") ^ v3;
}

- (MPModelObject)initWithCoder:(id)a3
{
  id v5;
  MPModelObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  Class v16;
  uint64_t v17;
  MPIdentifierSet *identifiers;
  uint64_t v19;
  NSMutableDictionary *storage;
  uint64_t v21;
  void *v22;
  NSMutableDictionary *v23;
  NSMutableDictionary *v24;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)MPModelObject;
  v6 = -[MPModelObject init](&v32, sel_init);
  if (v6)
  {
    v7 = (void *)objc_opt_class();
    objc_getAssociatedObject(v7, (const void *)_MPModelObjectPropertyClassesKey);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "classesForSecureCoding");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "containsObject:", objc_opt_class()))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("MPModelObject.m"), 290, CFSTR("classesForSecureCoding cannot contain NSObject"));

    }
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v8, "count") + objc_msgSend(v9, "count") + 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v9;
    objc_msgSend(v10, "addObjectsFromArray:", v9);
    objc_msgSend(v10, "addObject:", objc_opt_class());
    objc_msgSend(v10, "addObject:", objc_opt_class());
    objc_msgSend(v10, "addObject:", objc_opt_class());
    objc_msgSend(v10, "addObject:", objc_opt_class());
    objc_msgSend(v10, "addObject:", objc_opt_class());
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v11);
          v16 = NSClassFromString(*(NSString **)(*((_QWORD *)&v28 + 1) + 8 * v15));
          if ((objc_opt_respondsToSelector() & 1) != 0
            && -[objc_class supportsSecureCoding](v16, "supportsSecureCoding"))
          {
            objc_msgSend(v10, "addObject:", v16);
          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v13);
    }

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifiers"));
    v17 = objc_claimAutoreleasedReturnValue();
    identifiers = v6->_identifiers;
    v6->_identifiers = (MPIdentifierSet *)v17;

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v10, CFSTR("storage"));
    v19 = objc_claimAutoreleasedReturnValue();
    storage = v6->_storage;
    v6->_storage = (NSMutableDictionary *)v19;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("original"));
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
    {
      v23 = (NSMutableDictionary *)objc_msgSend(*(id *)(v21 + 8), "mutableCopy");
      -[NSMutableDictionary addEntriesFromDictionary:](v23, "addEntriesFromDictionary:", v6->_storage);
      v24 = v6->_storage;
      v6->_storage = v23;

    }
    v6->_isFinalized = 1;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  MPIdentifierSet *identifiers;
  id v5;
  id v6;

  identifiers = self->_identifiers;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifiers, CFSTR("identifiers"));
  -[MPModelObject _sanitizedStorage](self, "_sanitizedStorage");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("storage"));

}

- (id)copyWithIdentifiers:(id)a3
{
  return -[MPModelObject copyWithIdentifiers:block:](self, "copyWithIdentifiers:block:", a3, &__block_literal_global_65_29697);
}

- (id)copyWithPropertySet:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MPModelObject identifiers](self, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPModelObject copyWithIdentifiers:propertySet:](self, "copyWithIdentifiers:propertySet:", v5, v4);

  return v6;
}

- (id)copyWithIdentifiers:(id)a3 propertySet:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  MPModelObject *v12;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__MPModelObject_copyWithIdentifiers_propertySet___block_invoke;
  v10[3] = &unk_1E315BBA8;
  v11 = v6;
  v12 = self;
  v7 = v6;
  v8 = -[MPModelObject copyWithIdentifiers:block:](self, "copyWithIdentifiers:block:", a3, v10);

  return v8;
}

- (id)mergeWithObject:(id)a3
{
  id v5;
  MPModelObject *v6;
  id v7;
  char isKindOfClass;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;

  v5 = a3;
  v6 = self;
  v7 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_6;
    }
LABEL_13:

    v9 = v6;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_13;
  }
LABEL_6:
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("MPModelObject.m"), 425, CFSTR("MPModelObject mergeWithObject: cannot merge objects [] self.class=%@ object.class%@"), v10, objc_opt_class());
LABEL_14:

  }
  -[MPModelObject identifiers](v6, "identifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unionSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __33__MPModelObject_mergeWithObject___block_invoke;
  v17[3] = &unk_1E315BBD0;
  v18 = v7;
  v14 = v7;
  v15 = -[MPModelObject copyWithIdentifiers:block:](v6, "copyWithIdentifiers:block:", v13, v17);

  return v15;
}

- (id)_stateDumpObject
{
  NSMutableDictionary *storage;
  MPIdentifierSet *identifiers;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  storage = self->_storage;
  v7[0] = CFSTR("data");
  v7[1] = CFSTR("identifiers");
  identifiers = self->_identifiers;
  v8[0] = storage;
  v8[1] = identifiers;
  v7[2] = CFSTR("_obj");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_isModelKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_getAssociatedObject(v4, (const void *)_MPModelObjectModelKeyPropertyIndexKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

void __33__MPModelObject_mergeWithObject___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__MPModelObject_mergeWithObject___block_invoke_2;
  v6[3] = &unk_1E315D4F0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __33__MPModelObject_mergeWithObject___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v5 || v6 == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v6, "mergeWithObject:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v9, v10);

    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v5, v10);
    }
  }

}

void __49__MPModelObject_copyWithIdentifiers_propertySet___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  void *v8;
  id *v9;
  _QWORD v10[5];
  id *v11;
  _QWORD v12[4];
  id *v13;
  uint64_t v14;

  v3 = a2;
  objc_msgSend(v3[1], "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 32), "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__MPModelObject_copyWithIdentifiers_propertySet___block_invoke_2;
  v12[3] = &unk_1E315BB80;
  v6 = v3;
  v7 = *(_QWORD *)(a1 + 40);
  v13 = v6;
  v14 = v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v12);

  objc_msgSend(*(id *)(a1 + 32), "relationships");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __49__MPModelObject_copyWithIdentifiers_propertySet___block_invoke_3;
  v10[3] = &unk_1E315F530;
  v10[4] = *(_QWORD *)(a1 + 40);
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v10);

}

void __49__MPModelObject_copyWithIdentifiers_propertySet___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v3, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v4, v5);

  }
}

void __49__MPModelObject_copyWithIdentifiers_propertySet___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(v6, "copyWithPropertySet:", v5);

    v6 = (void *)v7;
  }
  if (v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setObject:forKeyedSubscript:", v6, v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setObject:forKeyedSubscript:", v8, v9);

  }
}

- (int64_t)libraryRemovalSupportedOptions
{
  return 0;
}

+ (BOOL)supportsLibraryRemoval
{
  return 0;
}

- (id)newKeepLocalStatusObserverConfiguration
{
  return 0;
}

+ (int64_t)genericObjectType
{
  return 0;
}

@end
