@implementation CKDPUserPrivacySettingsBatchLookupResponseContainerPrivacySettings

- (BOOL)hasApplicationContainer
{
  return self->_applicationContainer != 0;
}

- (int)applicationContainerEnvironment
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_applicationContainerEnvironment;
  else
    return 2;
}

- (void)setApplicationContainerEnvironment:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_applicationContainerEnvironment = a3;
}

- (void)setHasApplicationContainerEnvironment:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasApplicationContainerEnvironment
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)applicationContainerEnvironmentAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("production");
  if (a3 == 2)
  {
    v3 = CFSTR("sandbox");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsApplicationContainerEnvironment:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;

  v3 = a3;
  v6 = 1;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("production")) & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("sandbox")))
      v6 = 2;
    else
      v6 = 1;
  }

  return v6;
}

- (void)clearApplicationBundles
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_applicationBundles, a2, v2);
}

- (void)addApplicationBundle:(id)a3
{
  const char *v4;
  NSMutableArray *applicationBundles;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  applicationBundles = self->_applicationBundles;
  v8 = (char *)v4;
  if (!applicationBundles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_applicationBundles;
    self->_applicationBundles = v6;

    v4 = v8;
    applicationBundles = self->_applicationBundles;
  }
  objc_msgSend_addObject_(applicationBundles, v4, (uint64_t)v4);

}

- (unint64_t)applicationBundlesCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_applicationBundles, a2, v2);
}

- (id)applicationBundleAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_applicationBundles, a2, a3);
}

+ (Class)applicationBundleType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasUserPrivacySettings
{
  return self->_userPrivacySettings != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)CKDPUserPrivacySettingsBatchLookupResponseContainerPrivacySettings;
  -[CKDPUserPrivacySettingsBatchLookupResponseContainerPrivacySettings description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@ %@"), v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  NSString *applicationContainer;
  int applicationContainerEnvironment;
  __CFString *v9;
  const char *v10;
  NSMutableArray *applicationBundles;
  CKDPUserPrivacySettings *userPrivacySettings;
  void *v13;
  const char *v14;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  applicationContainer = self->_applicationContainer;
  if (applicationContainer)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)applicationContainer, CFSTR("applicationContainer"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    applicationContainerEnvironment = self->_applicationContainerEnvironment;
    if (applicationContainerEnvironment == 1)
    {
      v9 = CFSTR("production");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("production"), CFSTR("applicationContainerEnvironment"));
    }
    else if (applicationContainerEnvironment == 2)
    {
      v9 = CFSTR("sandbox");
      objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)CFSTR("sandbox"), CFSTR("applicationContainerEnvironment"));
    }
    else
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("(unknown: %i)"), self->_applicationContainerEnvironment);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, CFSTR("applicationContainerEnvironment"));
    }

  }
  applicationBundles = self->_applicationBundles;
  if (applicationBundles)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)applicationBundles, CFSTR("applicationBundle"));
  userPrivacySettings = self->_userPrivacySettings;
  if (userPrivacySettings)
  {
    objc_msgSend_dictionaryRepresentation(userPrivacySettings, v5, (uint64_t)applicationBundles);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, CFSTR("userPrivacySettings"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEA3E344((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_applicationContainer)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_applicationBundles;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v12, v16, 16);
    }
    while (v8);
  }

  if (self->_userPrivacySettings)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  NSString *applicationContainer;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  const char *v15;
  CKDPUserPrivacySettings *userPrivacySettings;
  id v17;

  v4 = a3;
  applicationContainer = self->_applicationContainer;
  v17 = v4;
  if (applicationContainer)
  {
    objc_msgSend_setApplicationContainer_(v4, v5, (uint64_t)applicationContainer);
    v4 = v17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_applicationContainerEnvironment;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  if (objc_msgSend_applicationBundlesCount(self, v5, (uint64_t)applicationContainer))
  {
    objc_msgSend_clearApplicationBundles(v17, v7, v8);
    v11 = objc_msgSend_applicationBundlesCount(self, v9, v10);
    if (v11)
    {
      v12 = v11;
      for (i = 0; i != v12; ++i)
      {
        objc_msgSend_applicationBundleAtIndex_(self, v7, i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addApplicationBundle_(v17, v15, (uint64_t)v14);

      }
    }
  }
  userPrivacySettings = self->_userPrivacySettings;
  if (userPrivacySettings)
    objc_msgSend_setUserPrivacySettings_(v17, v7, (uint64_t)userPrivacySettings);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_applicationContainer, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 24) = self->_applicationContainerEnvironment;
    *(_BYTE *)(v10 + 40) |= 1u;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = self->_applicationBundles;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v27, v31, 16);
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v14);
        v21 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v27 + 1) + 8 * i), v17, (uint64_t)a3, (_QWORD)v27);
        objc_msgSend_addApplicationBundle_((void *)v10, v22, (uint64_t)v21);

      }
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v27, v31, 16);
    }
    while (v18);
  }

  v24 = objc_msgSend_copyWithZone_(self->_userPrivacySettings, v23, (uint64_t)a3);
  v25 = *(void **)(v10 + 32);
  *(_QWORD *)(v10 + 32) = v24;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *applicationContainer;
  uint64_t v9;
  NSMutableArray *applicationBundles;
  uint64_t v11;
  CKDPUserPrivacySettings *userPrivacySettings;
  uint64_t v13;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_13;
  applicationContainer = self->_applicationContainer;
  v9 = v4[2];
  if ((unint64_t)applicationContainer | v9)
  {
    if (!objc_msgSend_isEqual_(applicationContainer, v7, v9))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[5] & 1) == 0 || self->_applicationContainerEnvironment != *((_DWORD *)v4 + 6))
      goto LABEL_13;
  }
  else if ((v4[5] & 1) != 0)
  {
LABEL_13:
    isEqual = 0;
    goto LABEL_14;
  }
  applicationBundles = self->_applicationBundles;
  v11 = v4[1];
  if ((unint64_t)applicationBundles | v11 && !objc_msgSend_isEqual_(applicationBundles, v7, v11))
    goto LABEL_13;
  userPrivacySettings = self->_userPrivacySettings;
  v13 = v4[4];
  if ((unint64_t)userPrivacySettings | v13)
    isEqual = objc_msgSend_isEqual_(userPrivacySettings, v7, v13);
  else
    isEqual = 1;
LABEL_14:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;

  v4 = objc_msgSend_hash(self->_applicationContainer, a2, v2);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_applicationContainerEnvironment;
  else
    v7 = 0;
  v8 = v7 ^ v4;
  v9 = objc_msgSend_hash(self->_applicationBundles, v5, v6);
  return v8 ^ v9 ^ objc_msgSend_hash(self->_userPrivacySettings, v10, v11);
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  id v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  const char *v14;
  CKDPUserPrivacySettings *userPrivacySettings;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *((_QWORD *)v5 + 2);
  if (v6)
    objc_msgSend_setApplicationContainer_(self, v4, v6);
  if ((*((_BYTE *)v5 + 40) & 1) != 0)
  {
    self->_applicationContainerEnvironment = *((_DWORD *)v5 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = *((id *)v5 + 1);
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v17, v21, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v7);
        objc_msgSend_addApplicationBundle_(self, v10, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v17, v21, 16);
    }
    while (v11);
  }

  userPrivacySettings = self->_userPrivacySettings;
  v16 = *((_QWORD *)v5 + 4);
  if (userPrivacySettings)
  {
    if (v16)
      objc_msgSend_mergeFrom_(userPrivacySettings, v14, v16);
  }
  else if (v16)
  {
    objc_msgSend_setUserPrivacySettings_(self, v14, v16);
  }

}

- (NSString)applicationContainer
{
  return self->_applicationContainer;
}

- (void)setApplicationContainer:(id)a3
{
  objc_storeStrong((id *)&self->_applicationContainer, a3);
}

- (NSMutableArray)applicationBundles
{
  return self->_applicationBundles;
}

- (void)setApplicationBundles:(id)a3
{
  objc_storeStrong((id *)&self->_applicationBundles, a3);
}

- (CKDPUserPrivacySettings)userPrivacySettings
{
  return self->_userPrivacySettings;
}

- (void)setUserPrivacySettings:(id)a3
{
  objc_storeStrong((id *)&self->_userPrivacySettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPrivacySettings, 0);
  objc_storeStrong((id *)&self->_applicationContainer, 0);
  objc_storeStrong((id *)&self->_applicationBundles, 0);
}

@end
