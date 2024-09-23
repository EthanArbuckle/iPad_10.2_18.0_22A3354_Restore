@implementation CKDPSubscriptionNotificationAlert

- (BOOL)hasText
{
  return self->_text != 0;
}

- (BOOL)hasLocalizedKey
{
  return self->_localizedKey != 0;
}

- (void)clearLocalizedArguments
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_localizedArguments, a2, v2);
}

- (void)addLocalizedArguments:(id)a3
{
  const char *v4;
  NSMutableArray *localizedArguments;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  localizedArguments = self->_localizedArguments;
  v8 = (char *)v4;
  if (!localizedArguments)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_localizedArguments;
    self->_localizedArguments = v6;

    v4 = v8;
    localizedArguments = self->_localizedArguments;
  }
  objc_msgSend_addObject_(localizedArguments, v4, (uint64_t)v4);

}

- (unint64_t)localizedArgumentsCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_localizedArguments, a2, v2);
}

- (id)localizedArgumentsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_localizedArguments, a2, a3);
}

+ (Class)localizedArgumentsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasActionLocKey
{
  return self->_actionLocKey != 0;
}

- (BOOL)hasLaunchImage
{
  return self->_launchImage != 0;
}

- (BOOL)hasSoundName
{
  return self->_soundName != 0;
}

- (BOOL)hasCategory
{
  return self->_category != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasTitleLocalizedKey
{
  return self->_titleLocalizedKey != 0;
}

- (void)clearTitleLocalizedArguments
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_titleLocalizedArguments, a2, v2);
}

- (void)addTitleLocalizedArguments:(id)a3
{
  const char *v4;
  NSMutableArray *titleLocalizedArguments;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  titleLocalizedArguments = self->_titleLocalizedArguments;
  v8 = (char *)v4;
  if (!titleLocalizedArguments)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_titleLocalizedArguments;
    self->_titleLocalizedArguments = v6;

    v4 = v8;
    titleLocalizedArguments = self->_titleLocalizedArguments;
  }
  objc_msgSend_addObject_(titleLocalizedArguments, v4, (uint64_t)v4);

}

- (unint64_t)titleLocalizedArgumentsCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_titleLocalizedArguments, a2, v2);
}

- (id)titleLocalizedArgumentsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_titleLocalizedArguments, a2, a3);
}

+ (Class)titleLocalizedArgumentsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (BOOL)hasSubtitleLocalizedKey
{
  return self->_subtitleLocalizedKey != 0;
}

- (void)clearSubtitleLocalizedArguments
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_subtitleLocalizedArguments, a2, v2);
}

- (void)addSubtitleLocalizedArguments:(id)a3
{
  const char *v4;
  NSMutableArray *subtitleLocalizedArguments;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  subtitleLocalizedArguments = self->_subtitleLocalizedArguments;
  v8 = (char *)v4;
  if (!subtitleLocalizedArguments)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_subtitleLocalizedArguments;
    self->_subtitleLocalizedArguments = v6;

    v4 = v8;
    subtitleLocalizedArguments = self->_subtitleLocalizedArguments;
  }
  objc_msgSend_addObject_(subtitleLocalizedArguments, v4, (uint64_t)v4);

}

- (unint64_t)subtitleLocalizedArgumentsCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_subtitleLocalizedArguments, a2, v2);
}

- (id)subtitleLocalizedArgumentsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_subtitleLocalizedArguments, a2, a3);
}

+ (Class)subtitleLocalizedArgumentsType
{
  return (Class)objc_opt_class();
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
  v11.super_class = (Class)CKDPSubscriptionNotificationAlert;
  -[CKDPSubscriptionNotificationAlert description](&v11, sel_description);
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
  NSString *text;
  NSString *localizedKey;
  NSMutableArray *localizedArguments;
  NSString *actionLocKey;
  NSString *launchImage;
  NSString *soundName;
  NSString *category;
  NSString *title;
  NSString *titleLocalizedKey;
  NSMutableArray *titleLocalizedArguments;
  NSString *subtitle;
  NSString *subtitleLocalizedKey;
  NSMutableArray *subtitleLocalizedArguments;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  text = self->_text;
  if (text)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)text, CFSTR("text"));
  localizedKey = self->_localizedKey;
  if (localizedKey)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)localizedKey, CFSTR("localizedKey"));
  localizedArguments = self->_localizedArguments;
  if (localizedArguments)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)localizedArguments, CFSTR("localizedArguments"));
  actionLocKey = self->_actionLocKey;
  if (actionLocKey)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)actionLocKey, CFSTR("actionLocKey"));
  launchImage = self->_launchImage;
  if (launchImage)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)launchImage, CFSTR("launchImage"));
  soundName = self->_soundName;
  if (soundName)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)soundName, CFSTR("soundName"));
  category = self->_category;
  if (category)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)category, CFSTR("category"));
  title = self->_title;
  if (title)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)title, CFSTR("title"));
  titleLocalizedKey = self->_titleLocalizedKey;
  if (titleLocalizedKey)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)titleLocalizedKey, CFSTR("titleLocalizedKey"));
  titleLocalizedArguments = self->_titleLocalizedArguments;
  if (titleLocalizedArguments)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)titleLocalizedArguments, CFSTR("titleLocalizedArguments"));
  subtitle = self->_subtitle;
  if (subtitle)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)subtitle, CFSTR("subtitle"));
  subtitleLocalizedKey = self->_subtitleLocalizedKey;
  if (subtitleLocalizedKey)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)subtitleLocalizedKey, CFSTR("subtitleLocalizedKey"));
  subtitleLocalizedArguments = self->_subtitleLocalizedArguments;
  if (subtitleLocalizedArguments)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)subtitleLocalizedArguments, CFSTR("subtitleLocalizedArguments"));
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEB33010((char *)self, (uint64_t)a3);
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
  NSMutableArray *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  NSMutableArray *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_text)
    PBDataWriterWriteStringField();
  if (self->_localizedKey)
    PBDataWriterWriteStringField();
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = self->_localizedArguments;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v34, v40, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v35;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v34, v40, 16);
    }
    while (v8);
  }

  if (self->_actionLocKey)
    PBDataWriterWriteStringField();
  if (self->_launchImage)
    PBDataWriterWriteStringField();
  if (self->_soundName)
    PBDataWriterWriteStringField();
  if (self->_category)
    PBDataWriterWriteStringField();
  if (self->_title)
    PBDataWriterWriteStringField();
  if (self->_titleLocalizedKey)
    PBDataWriterWriteStringField();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = self->_titleLocalizedArguments;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v30, v39, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v31;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v12);
        PBDataWriterWriteStringField();
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v30, v39, 16);
    }
    while (v15);
  }

  if (self->_subtitle)
    PBDataWriterWriteStringField();
  if (self->_subtitleLocalizedKey)
    PBDataWriterWriteStringField();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v19 = self->_subtitleLocalizedArguments;
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v26, v38, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v27;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v27 != v23)
          objc_enumerationMutation(v19);
        PBDataWriterWriteStringField();
        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v25, (uint64_t)&v26, v38, 16);
    }
    while (v22);
  }

}

- (void)copyTo:(id)a3
{
  const char *v4;
  NSString *text;
  NSString *localizedKey;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  const char *v15;
  NSString *actionLocKey;
  NSString *launchImage;
  NSString *soundName;
  NSString *category;
  NSString *title;
  NSString *titleLocalizedKey;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  const char *v30;
  NSString *subtitle;
  NSString *subtitleLocalizedKey;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  const char *v42;
  id v43;

  v43 = a3;
  text = self->_text;
  if (text)
    objc_msgSend_setText_(v43, v4, (uint64_t)text);
  localizedKey = self->_localizedKey;
  if (localizedKey)
    objc_msgSend_setLocalizedKey_(v43, v4, (uint64_t)localizedKey);
  if (objc_msgSend_localizedArgumentsCount(self, v4, (uint64_t)localizedKey))
  {
    objc_msgSend_clearLocalizedArguments(v43, v7, v8);
    v11 = objc_msgSend_localizedArgumentsCount(self, v9, v10);
    if (v11)
    {
      v12 = v11;
      for (i = 0; i != v12; ++i)
      {
        objc_msgSend_localizedArgumentsAtIndex_(self, v7, i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addLocalizedArguments_(v43, v15, (uint64_t)v14);

      }
    }
  }
  actionLocKey = self->_actionLocKey;
  if (actionLocKey)
    objc_msgSend_setActionLocKey_(v43, v7, (uint64_t)actionLocKey);
  launchImage = self->_launchImage;
  if (launchImage)
    objc_msgSend_setLaunchImage_(v43, v7, (uint64_t)launchImage);
  soundName = self->_soundName;
  if (soundName)
    objc_msgSend_setSoundName_(v43, v7, (uint64_t)soundName);
  category = self->_category;
  if (category)
    objc_msgSend_setCategory_(v43, v7, (uint64_t)category);
  title = self->_title;
  if (title)
    objc_msgSend_setTitle_(v43, v7, (uint64_t)title);
  titleLocalizedKey = self->_titleLocalizedKey;
  if (titleLocalizedKey)
    objc_msgSend_setTitleLocalizedKey_(v43, v7, (uint64_t)titleLocalizedKey);
  if (objc_msgSend_titleLocalizedArgumentsCount(self, v7, (uint64_t)titleLocalizedKey))
  {
    objc_msgSend_clearTitleLocalizedArguments(v43, v22, v23);
    v26 = objc_msgSend_titleLocalizedArgumentsCount(self, v24, v25);
    if (v26)
    {
      v27 = v26;
      for (j = 0; j != v27; ++j)
      {
        objc_msgSend_titleLocalizedArgumentsAtIndex_(self, v22, j);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addTitleLocalizedArguments_(v43, v30, (uint64_t)v29);

      }
    }
  }
  subtitle = self->_subtitle;
  if (subtitle)
    objc_msgSend_setSubtitle_(v43, v22, (uint64_t)subtitle);
  subtitleLocalizedKey = self->_subtitleLocalizedKey;
  if (subtitleLocalizedKey)
    objc_msgSend_setSubtitleLocalizedKey_(v43, v22, (uint64_t)subtitleLocalizedKey);
  if (objc_msgSend_subtitleLocalizedArgumentsCount(self, v22, (uint64_t)subtitleLocalizedKey))
  {
    objc_msgSend_clearSubtitleLocalizedArguments(v43, v33, v34);
    v37 = objc_msgSend_subtitleLocalizedArgumentsCount(self, v35, v36);
    if (v37)
    {
      v39 = v37;
      for (k = 0; k != v39; ++k)
      {
        objc_msgSend_subtitleLocalizedArgumentsAtIndex_(self, v38, k);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addSubtitleLocalizedArguments_(v43, v42, (uint64_t)v41);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  NSMutableArray *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  NSMutableArray *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  NSMutableArray *v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_text, v11, (uint64_t)a3);
  v13 = (void *)v10[10];
  v10[10] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_localizedKey, v14, (uint64_t)a3);
  v16 = (void *)v10[5];
  v10[5] = v15;

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v17 = self->_localizedArguments;
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v77, v83, 16);
  if (v19)
  {
    v21 = v19;
    v22 = *(_QWORD *)v78;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v78 != v22)
          objc_enumerationMutation(v17);
        v24 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v77 + 1) + 8 * v23), v20, (uint64_t)a3);
        objc_msgSend_addLocalizedArguments_(v10, v25, (uint64_t)v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v77, v83, 16);
    }
    while (v21);
  }

  v27 = objc_msgSend_copyWithZone_(self->_actionLocKey, v26, (uint64_t)a3);
  v28 = (void *)v10[1];
  v10[1] = v27;

  v30 = objc_msgSend_copyWithZone_(self->_launchImage, v29, (uint64_t)a3);
  v31 = (void *)v10[3];
  v10[3] = v30;

  v33 = objc_msgSend_copyWithZone_(self->_soundName, v32, (uint64_t)a3);
  v34 = (void *)v10[6];
  v10[6] = v33;

  v36 = objc_msgSend_copyWithZone_(self->_category, v35, (uint64_t)a3);
  v37 = (void *)v10[2];
  v10[2] = v36;

  v39 = objc_msgSend_copyWithZone_(self->_title, v38, (uint64_t)a3);
  v40 = (void *)v10[11];
  v10[11] = v39;

  v42 = objc_msgSend_copyWithZone_(self->_titleLocalizedKey, v41, (uint64_t)a3);
  v43 = (void *)v10[13];
  v10[13] = v42;

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v44 = self->_titleLocalizedArguments;
  v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v45, (uint64_t)&v73, v82, 16);
  if (v46)
  {
    v48 = v46;
    v49 = *(_QWORD *)v74;
    do
    {
      v50 = 0;
      do
      {
        if (*(_QWORD *)v74 != v49)
          objc_enumerationMutation(v44);
        v51 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v73 + 1) + 8 * v50), v47, (uint64_t)a3);
        objc_msgSend_addTitleLocalizedArguments_(v10, v52, (uint64_t)v51);

        ++v50;
      }
      while (v48 != v50);
      v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v47, (uint64_t)&v73, v82, 16);
    }
    while (v48);
  }

  v54 = objc_msgSend_copyWithZone_(self->_subtitle, v53, (uint64_t)a3);
  v55 = (void *)v10[7];
  v10[7] = v54;

  v57 = objc_msgSend_copyWithZone_(self->_subtitleLocalizedKey, v56, (uint64_t)a3);
  v58 = (void *)v10[9];
  v10[9] = v57;

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v59 = self->_subtitleLocalizedArguments;
  v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v60, (uint64_t)&v69, v81, 16);
  if (v61)
  {
    v63 = v61;
    v64 = *(_QWORD *)v70;
    do
    {
      v65 = 0;
      do
      {
        if (*(_QWORD *)v70 != v64)
          objc_enumerationMutation(v59);
        v66 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v69 + 1) + 8 * v65), v62, (uint64_t)a3, (_QWORD)v69);
        objc_msgSend_addSubtitleLocalizedArguments_(v10, v67, (uint64_t)v66);

        ++v65;
      }
      while (v63 != v65);
      v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v62, (uint64_t)&v69, v81, 16);
    }
    while (v63);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *text;
  uint64_t v9;
  NSString *localizedKey;
  uint64_t v11;
  NSMutableArray *localizedArguments;
  uint64_t v13;
  NSString *actionLocKey;
  uint64_t v15;
  NSString *launchImage;
  uint64_t v17;
  NSString *soundName;
  uint64_t v19;
  NSString *category;
  uint64_t v21;
  NSString *title;
  uint64_t v23;
  NSString *titleLocalizedKey;
  uint64_t v25;
  NSMutableArray *titleLocalizedArguments;
  uint64_t v27;
  NSString *subtitle;
  uint64_t v29;
  NSString *subtitleLocalizedKey;
  uint64_t v31;
  NSMutableArray *subtitleLocalizedArguments;
  uint64_t v33;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_28;
  text = self->_text;
  v9 = v4[10];
  if ((unint64_t)text | v9)
  {
    if (!objc_msgSend_isEqual_(text, v7, v9))
      goto LABEL_28;
  }
  localizedKey = self->_localizedKey;
  v11 = v4[5];
  if ((unint64_t)localizedKey | v11)
  {
    if (!objc_msgSend_isEqual_(localizedKey, v7, v11))
      goto LABEL_28;
  }
  localizedArguments = self->_localizedArguments;
  v13 = v4[4];
  if ((unint64_t)localizedArguments | v13)
  {
    if (!objc_msgSend_isEqual_(localizedArguments, v7, v13))
      goto LABEL_28;
  }
  actionLocKey = self->_actionLocKey;
  v15 = v4[1];
  if ((unint64_t)actionLocKey | v15)
  {
    if (!objc_msgSend_isEqual_(actionLocKey, v7, v15))
      goto LABEL_28;
  }
  launchImage = self->_launchImage;
  v17 = v4[3];
  if ((unint64_t)launchImage | v17)
  {
    if (!objc_msgSend_isEqual_(launchImage, v7, v17))
      goto LABEL_28;
  }
  soundName = self->_soundName;
  v19 = v4[6];
  if ((unint64_t)soundName | v19)
  {
    if (!objc_msgSend_isEqual_(soundName, v7, v19))
      goto LABEL_28;
  }
  category = self->_category;
  v21 = v4[2];
  if ((unint64_t)category | v21)
  {
    if (!objc_msgSend_isEqual_(category, v7, v21))
      goto LABEL_28;
  }
  title = self->_title;
  v23 = v4[11];
  if ((unint64_t)title | v23)
  {
    if (!objc_msgSend_isEqual_(title, v7, v23))
      goto LABEL_28;
  }
  titleLocalizedKey = self->_titleLocalizedKey;
  v25 = v4[13];
  if ((unint64_t)titleLocalizedKey | v25)
  {
    if (!objc_msgSend_isEqual_(titleLocalizedKey, v7, v25))
      goto LABEL_28;
  }
  if (((titleLocalizedArguments = self->_titleLocalizedArguments,
         v27 = v4[12],
         !((unint64_t)titleLocalizedArguments | v27))
     || objc_msgSend_isEqual_(titleLocalizedArguments, v7, v27))
    && ((subtitle = self->_subtitle, v29 = v4[7], !((unint64_t)subtitle | v29))
     || objc_msgSend_isEqual_(subtitle, v7, v29))
    && ((subtitleLocalizedKey = self->_subtitleLocalizedKey, v31 = v4[9],
                                                             !((unint64_t)subtitleLocalizedKey | v31))
     || objc_msgSend_isEqual_(subtitleLocalizedKey, v7, v31)))
  {
    subtitleLocalizedArguments = self->_subtitleLocalizedArguments;
    v33 = v4[8];
    if ((unint64_t)subtitleLocalizedArguments | v33)
      isEqual = objc_msgSend_isEqual_(subtitleLocalizedArguments, v7, v33);
    else
      isEqual = 1;
  }
  else
  {
LABEL_28:
    isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;

  v4 = objc_msgSend_hash(self->_text, a2, v2);
  v7 = objc_msgSend_hash(self->_localizedKey, v5, v6) ^ v4;
  v10 = objc_msgSend_hash(self->_localizedArguments, v8, v9);
  v13 = v7 ^ v10 ^ objc_msgSend_hash(self->_actionLocKey, v11, v12);
  v16 = objc_msgSend_hash(self->_launchImage, v14, v15);
  v19 = v16 ^ objc_msgSend_hash(self->_soundName, v17, v18);
  v22 = v13 ^ v19 ^ objc_msgSend_hash(self->_category, v20, v21);
  v25 = objc_msgSend_hash(self->_title, v23, v24);
  v28 = v25 ^ objc_msgSend_hash(self->_titleLocalizedKey, v26, v27);
  v31 = v28 ^ objc_msgSend_hash(self->_titleLocalizedArguments, v29, v30);
  v34 = v22 ^ v31 ^ objc_msgSend_hash(self->_subtitle, v32, v33);
  v37 = objc_msgSend_hash(self->_subtitleLocalizedKey, v35, v36);
  return v34 ^ v37 ^ objc_msgSend_hash(self->_subtitleLocalizedArguments, v38, v39);
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *((_QWORD *)v5 + 10);
  if (v6)
    objc_msgSend_setText_(self, v4, v6);
  v7 = *((_QWORD *)v5 + 5);
  if (v7)
    objc_msgSend_setLocalizedKey_(self, v4, v7);
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v8 = *((id *)v5 + 4);
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v47, v53, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v48 != v13)
          objc_enumerationMutation(v8);
        objc_msgSend_addLocalizedArguments_(self, v11, *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i));
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v47, v53, 16);
    }
    while (v12);
  }

  v16 = *((_QWORD *)v5 + 1);
  if (v16)
    objc_msgSend_setActionLocKey_(self, v15, v16);
  v17 = *((_QWORD *)v5 + 3);
  if (v17)
    objc_msgSend_setLaunchImage_(self, v15, v17);
  v18 = *((_QWORD *)v5 + 6);
  if (v18)
    objc_msgSend_setSoundName_(self, v15, v18);
  v19 = *((_QWORD *)v5 + 2);
  if (v19)
    objc_msgSend_setCategory_(self, v15, v19);
  v20 = *((_QWORD *)v5 + 11);
  if (v20)
    objc_msgSend_setTitle_(self, v15, v20);
  v21 = *((_QWORD *)v5 + 13);
  if (v21)
    objc_msgSend_setTitleLocalizedKey_(self, v15, v21);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v22 = *((id *)v5 + 12);
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v43, v52, 16);
  if (v24)
  {
    v26 = v24;
    v27 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v44 != v27)
          objc_enumerationMutation(v22);
        objc_msgSend_addTitleLocalizedArguments_(self, v25, *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j));
      }
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v43, v52, 16);
    }
    while (v26);
  }

  v30 = *((_QWORD *)v5 + 7);
  if (v30)
    objc_msgSend_setSubtitle_(self, v29, v30);
  v31 = *((_QWORD *)v5 + 9);
  if (v31)
    objc_msgSend_setSubtitleLocalizedKey_(self, v29, v31);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v32 = *((id *)v5 + 8);
  v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v39, v51, 16);
  if (v34)
  {
    v36 = v34;
    v37 = *(_QWORD *)v40;
    do
    {
      for (k = 0; k != v36; ++k)
      {
        if (*(_QWORD *)v40 != v37)
          objc_enumerationMutation(v32);
        objc_msgSend_addSubtitleLocalizedArguments_(self, v35, *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * k), (_QWORD)v39);
      }
      v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v39, v51, 16);
    }
    while (v36);
  }

}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (NSString)localizedKey
{
  return self->_localizedKey;
}

- (void)setLocalizedKey:(id)a3
{
  objc_storeStrong((id *)&self->_localizedKey, a3);
}

- (NSMutableArray)localizedArguments
{
  return self->_localizedArguments;
}

- (void)setLocalizedArguments:(id)a3
{
  objc_storeStrong((id *)&self->_localizedArguments, a3);
}

- (NSString)actionLocKey
{
  return self->_actionLocKey;
}

- (void)setActionLocKey:(id)a3
{
  objc_storeStrong((id *)&self->_actionLocKey, a3);
}

- (NSString)launchImage
{
  return self->_launchImage;
}

- (void)setLaunchImage:(id)a3
{
  objc_storeStrong((id *)&self->_launchImage, a3);
}

- (NSString)soundName
{
  return self->_soundName;
}

- (void)setSoundName:(id)a3
{
  objc_storeStrong((id *)&self->_soundName, a3);
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_storeStrong((id *)&self->_category, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)titleLocalizedKey
{
  return self->_titleLocalizedKey;
}

- (void)setTitleLocalizedKey:(id)a3
{
  objc_storeStrong((id *)&self->_titleLocalizedKey, a3);
}

- (NSMutableArray)titleLocalizedArguments
{
  return self->_titleLocalizedArguments;
}

- (void)setTitleLocalizedArguments:(id)a3
{
  objc_storeStrong((id *)&self->_titleLocalizedArguments, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (NSString)subtitleLocalizedKey
{
  return self->_subtitleLocalizedKey;
}

- (void)setSubtitleLocalizedKey:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLocalizedKey, a3);
}

- (NSMutableArray)subtitleLocalizedArguments
{
  return self->_subtitleLocalizedArguments;
}

- (void)setSubtitleLocalizedArguments:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLocalizedArguments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLocalizedKey, 0);
  objc_storeStrong((id *)&self->_titleLocalizedArguments, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_subtitleLocalizedKey, 0);
  objc_storeStrong((id *)&self->_subtitleLocalizedArguments, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_soundName, 0);
  objc_storeStrong((id *)&self->_localizedKey, 0);
  objc_storeStrong((id *)&self->_localizedArguments, 0);
  objc_storeStrong((id *)&self->_launchImage, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_actionLocKey, 0);
}

@end
