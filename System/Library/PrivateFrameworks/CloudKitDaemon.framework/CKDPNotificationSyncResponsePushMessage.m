@implementation CKDPNotificationSyncResponsePushMessage

- (void)setIsRead:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isRead = a3;
}

- (void)setHasIsRead:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsRead
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (int)source
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_source;
  else
    return 1;
}

- (void)setSource:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSource
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)sourceAsString:(int)a3
{
  __CFString *v3;

  if (a3 > 2)
  {
    if (a3 == 3)
      return CFSTR("CKRPC");
    if (a3 == 999)
      return CFSTR("UNKNOWN");
    goto LABEL_10;
  }
  if (a3 == 1)
    return CFSTR("DATABASE");
  if (a3 != 2)
  {
LABEL_10:
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  v3 = CFSTR("SHARING");
  return v3;
}

- (int)StringAsSource:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;
  const char *v8;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("DATABASE")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("SHARING")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("CKRPC")) & 1) != 0)
  {
    v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("UNKNOWN")))
  {
    v6 = 999;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)hasDialog
{
  return self->_dialog != 0;
}

- (BOOL)hasSound
{
  return self->_sound != 0;
}

- (void)setBadgeCount:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_badgeCount = a3;
}

- (void)setHasBadgeCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBadgeCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasPayload
{
  return self->_payload != 0;
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
  v11.super_class = (Class)CKDPNotificationSyncResponsePushMessage;
  -[CKDPNotificationSyncResponsePushMessage description](&v11, sel_description);
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
  const char *v4;
  void *v5;
  void *v6;
  const char *v7;
  NSString *uuid;
  int source;
  __CFString *v10;
  const char *v11;
  NSString *dialog;
  NSString *sound;
  void *v14;
  const char *v15;
  NSData *payload;
  NSString *category;
  NSString *title;
  NSString *titleLocalizedKey;
  NSMutableArray *titleLocalizedArguments;
  NSString *subtitle;
  NSString *subtitleLocalizedKey;
  NSMutableArray *subtitleLocalizedArguments;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_isRead);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v7, (uint64_t)v6, CFSTR("isRead"));

  }
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)uuid, CFSTR("uuid"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    source = self->_source;
    if (source > 2)
    {
      if (source == 3)
      {
        v10 = CFSTR("CKRPC");
        objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)CFSTR("CKRPC"), CFSTR("source"));
        goto LABEL_16;
      }
      if (source == 999)
      {
        v10 = CFSTR("UNKNOWN");
        objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)CFSTR("UNKNOWN"), CFSTR("source"));
        goto LABEL_16;
      }
    }
    else
    {
      if (source == 1)
      {
        v10 = CFSTR("DATABASE");
        objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)CFSTR("DATABASE"), CFSTR("source"));
        goto LABEL_16;
      }
      if (source == 2)
      {
        v10 = CFSTR("SHARING");
        objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)CFSTR("SHARING"), CFSTR("source"));
LABEL_16:

        goto LABEL_17;
      }
    }
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_source);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v11, (uint64_t)v10, CFSTR("source"));
    goto LABEL_16;
  }
LABEL_17:
  dialog = self->_dialog;
  if (dialog)
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)dialog, CFSTR("dialog"));
  sound = self->_sound;
  if (sound)
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)sound, CFSTR("sound"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v4, self->_badgeCount);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v15, (uint64_t)v14, CFSTR("badgeCount"));

  }
  payload = self->_payload;
  if (payload)
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)payload, CFSTR("payload"));
  category = self->_category;
  if (category)
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)category, CFSTR("category"));
  title = self->_title;
  if (title)
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)title, CFSTR("title"));
  titleLocalizedKey = self->_titleLocalizedKey;
  if (titleLocalizedKey)
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)titleLocalizedKey, CFSTR("titleLocalizedKey"));
  titleLocalizedArguments = self->_titleLocalizedArguments;
  if (titleLocalizedArguments)
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)titleLocalizedArguments, CFSTR("titleLocalizedArguments"));
  subtitle = self->_subtitle;
  if (subtitle)
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)subtitle, CFSTR("subtitle"));
  subtitleLocalizedKey = self->_subtitleLocalizedKey;
  if (subtitleLocalizedKey)
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)subtitleLocalizedKey, CFSTR("subtitleLocalizedKey"));
  subtitleLocalizedArguments = self->_subtitleLocalizedArguments;
  if (subtitleLocalizedArguments)
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)subtitleLocalizedArguments, CFSTR("subtitleLocalizedArguments"));
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPNotificationSyncResponsePushMessageReadFrom(self, (uint64_t)a3);
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
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_uuid)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_dialog)
    PBDataWriterWriteStringField();
  if (self->_sound)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_payload)
    PBDataWriterWriteDataField();
  if (self->_category)
    PBDataWriterWriteStringField();
  if (self->_title)
    PBDataWriterWriteStringField();
  if (self->_titleLocalizedKey)
    PBDataWriterWriteStringField();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_titleLocalizedArguments;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v23, v28, 16);
    }
    while (v8);
  }

  if (self->_subtitle)
    PBDataWriterWriteStringField();
  if (self->_subtitleLocalizedKey)
    PBDataWriterWriteStringField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_subtitleLocalizedArguments;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v19, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v12);
        PBDataWriterWriteStringField();
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v19, v27, 16);
    }
    while (v15);
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  const char *v5;
  NSString *uuid;
  NSString *dialog;
  NSString *sound;
  NSData *payload;
  NSString *category;
  NSString *title;
  NSString *titleLocalizedKey;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  const char *v21;
  NSString *subtitle;
  NSString *subtitleLocalizedKey;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  const char *v33;
  _BYTE *v34;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[112] = self->_isRead;
    v4[116] |= 4u;
  }
  uuid = self->_uuid;
  v34 = v4;
  if (uuid)
  {
    objc_msgSend_setUuid_(v4, v5, (uint64_t)uuid);
    v4 = v34;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_source;
    v4[116] |= 2u;
  }
  dialog = self->_dialog;
  if (dialog)
  {
    objc_msgSend_setDialog_(v34, v5, (uint64_t)dialog);
    v4 = v34;
  }
  sound = self->_sound;
  if (sound)
  {
    objc_msgSend_setSound_(v34, v5, (uint64_t)sound);
    v4 = v34;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_badgeCount;
    v4[116] |= 1u;
  }
  payload = self->_payload;
  if (payload)
    objc_msgSend_setPayload_(v34, v5, (uint64_t)payload);
  category = self->_category;
  if (category)
    objc_msgSend_setCategory_(v34, v5, (uint64_t)category);
  title = self->_title;
  if (title)
    objc_msgSend_setTitle_(v34, v5, (uint64_t)title);
  titleLocalizedKey = self->_titleLocalizedKey;
  if (titleLocalizedKey)
    objc_msgSend_setTitleLocalizedKey_(v34, v5, (uint64_t)titleLocalizedKey);
  if (objc_msgSend_titleLocalizedArgumentsCount(self, v5, (uint64_t)titleLocalizedKey))
  {
    objc_msgSend_clearTitleLocalizedArguments(v34, v13, v14);
    v17 = objc_msgSend_titleLocalizedArgumentsCount(self, v15, v16);
    if (v17)
    {
      v18 = v17;
      for (i = 0; i != v18; ++i)
      {
        objc_msgSend_titleLocalizedArgumentsAtIndex_(self, v13, i);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addTitleLocalizedArguments_(v34, v21, (uint64_t)v20);

      }
    }
  }
  subtitle = self->_subtitle;
  if (subtitle)
    objc_msgSend_setSubtitle_(v34, v13, (uint64_t)subtitle);
  subtitleLocalizedKey = self->_subtitleLocalizedKey;
  if (subtitleLocalizedKey)
    objc_msgSend_setSubtitleLocalizedKey_(v34, v13, (uint64_t)subtitleLocalizedKey);
  if (objc_msgSend_subtitleLocalizedArgumentsCount(self, v13, (uint64_t)subtitleLocalizedKey))
  {
    objc_msgSend_clearSubtitleLocalizedArguments(v34, v24, v25);
    v28 = objc_msgSend_subtitleLocalizedArgumentsCount(self, v26, v27);
    if (v28)
    {
      v30 = v28;
      for (j = 0; j != v30; ++j)
      {
        objc_msgSend_subtitleLocalizedArgumentsAtIndex_(self, v29, j);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addSubtitleLocalizedArguments_(v34, v33, (uint64_t)v32);

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
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  NSMutableArray *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  NSMutableArray *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = v10;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_BYTE *)(v10 + 112) = self->_isRead;
    *(_BYTE *)(v10 + 116) |= 4u;
  }
  v13 = objc_msgSend_copyWithZone_(self->_uuid, v11, (uint64_t)a3);
  v14 = *(void **)(v12 + 104);
  *(_QWORD *)(v12 + 104) = v13;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v12 + 48) = self->_source;
    *(_BYTE *)(v12 + 116) |= 2u;
  }
  v16 = objc_msgSend_copyWithZone_(self->_dialog, v15, (uint64_t)a3);
  v17 = *(void **)(v12 + 24);
  *(_QWORD *)(v12 + 24) = v16;

  v19 = objc_msgSend_copyWithZone_(self->_sound, v18, (uint64_t)a3);
  v20 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v19;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v12 + 8) = self->_badgeCount;
    *(_BYTE *)(v12 + 116) |= 1u;
  }
  v22 = objc_msgSend_copyWithZone_(self->_payload, v21, (uint64_t)a3);
  v23 = *(void **)(v12 + 32);
  *(_QWORD *)(v12 + 32) = v22;

  v25 = objc_msgSend_copyWithZone_(self->_category, v24, (uint64_t)a3);
  v26 = *(void **)(v12 + 16);
  *(_QWORD *)(v12 + 16) = v25;

  v28 = objc_msgSend_copyWithZone_(self->_title, v27, (uint64_t)a3);
  v29 = *(void **)(v12 + 80);
  *(_QWORD *)(v12 + 80) = v28;

  v31 = objc_msgSend_copyWithZone_(self->_titleLocalizedKey, v30, (uint64_t)a3);
  v32 = *(void **)(v12 + 96);
  *(_QWORD *)(v12 + 96) = v31;

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v33 = self->_titleLocalizedArguments;
  v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v62, v67, 16);
  if (v35)
  {
    v37 = v35;
    v38 = *(_QWORD *)v63;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v63 != v38)
          objc_enumerationMutation(v33);
        v40 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v62 + 1) + 8 * v39), v36, (uint64_t)a3);
        objc_msgSend_addTitleLocalizedArguments_((void *)v12, v41, (uint64_t)v40);

        ++v39;
      }
      while (v37 != v39);
      v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v62, v67, 16);
    }
    while (v37);
  }

  v43 = objc_msgSend_copyWithZone_(self->_subtitle, v42, (uint64_t)a3);
  v44 = *(void **)(v12 + 56);
  *(_QWORD *)(v12 + 56) = v43;

  v46 = objc_msgSend_copyWithZone_(self->_subtitleLocalizedKey, v45, (uint64_t)a3);
  v47 = *(void **)(v12 + 72);
  *(_QWORD *)(v12 + 72) = v46;

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v48 = self->_subtitleLocalizedArguments;
  v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v58, v66, 16);
  if (v50)
  {
    v52 = v50;
    v53 = *(_QWORD *)v59;
    do
    {
      v54 = 0;
      do
      {
        if (*(_QWORD *)v59 != v53)
          objc_enumerationMutation(v48);
        v55 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v58 + 1) + 8 * v54), v51, (uint64_t)a3, (_QWORD)v58);
        objc_msgSend_addSubtitleLocalizedArguments_((void *)v12, v56, (uint64_t)v55);

        ++v54;
      }
      while (v52 != v54);
      v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v51, (uint64_t)&v58, v66, 16);
    }
    while (v52);
  }

  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  char has;
  char v9;
  NSString *uuid;
  uint64_t v11;
  NSString *dialog;
  uint64_t v13;
  NSString *sound;
  uint64_t v15;
  NSData *payload;
  uint64_t v17;
  NSString *category;
  uint64_t v19;
  NSString *title;
  uint64_t v21;
  NSString *titleLocalizedKey;
  uint64_t v23;
  NSMutableArray *titleLocalizedArguments;
  uint64_t v25;
  NSString *subtitle;
  uint64_t v27;
  NSString *subtitleLocalizedKey;
  uint64_t v29;
  NSMutableArray *subtitleLocalizedArguments;
  uint64_t v31;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_43;
  has = (char)self->_has;
  v9 = *((_BYTE *)v4 + 116);
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 4) == 0)
      goto LABEL_43;
    if (self->_isRead)
    {
      if (!*((_BYTE *)v4 + 112))
        goto LABEL_43;
    }
    else if (*((_BYTE *)v4 + 112))
    {
      goto LABEL_43;
    }
  }
  else if ((*((_BYTE *)v4 + 116) & 4) != 0)
  {
    goto LABEL_43;
  }
  uuid = self->_uuid;
  v11 = v4[13];
  if (!((unint64_t)uuid | v11))
    goto LABEL_13;
  if (!objc_msgSend_isEqual_(uuid, v7, v11))
  {
LABEL_43:
    isEqual = 0;
    goto LABEL_44;
  }
  has = (char)self->_has;
  v9 = *((_BYTE *)v4 + 116);
LABEL_13:
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_source != *((_DWORD *)v4 + 12))
      goto LABEL_43;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_43;
  }
  dialog = self->_dialog;
  v13 = v4[3];
  if ((unint64_t)dialog | v13 && !objc_msgSend_isEqual_(dialog, v7, v13))
    goto LABEL_43;
  sound = self->_sound;
  v15 = v4[5];
  if ((unint64_t)sound | v15)
  {
    if (!objc_msgSend_isEqual_(sound, v7, v15))
      goto LABEL_43;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 116) & 1) == 0 || self->_badgeCount != *((_DWORD *)v4 + 2))
      goto LABEL_43;
  }
  else if ((*((_BYTE *)v4 + 116) & 1) != 0)
  {
    goto LABEL_43;
  }
  payload = self->_payload;
  v17 = v4[4];
  if ((unint64_t)payload | v17 && !objc_msgSend_isEqual_(payload, v7, v17))
    goto LABEL_43;
  category = self->_category;
  v19 = v4[2];
  if ((unint64_t)category | v19)
  {
    if (!objc_msgSend_isEqual_(category, v7, v19))
      goto LABEL_43;
  }
  title = self->_title;
  v21 = v4[10];
  if ((unint64_t)title | v21)
  {
    if (!objc_msgSend_isEqual_(title, v7, v21))
      goto LABEL_43;
  }
  titleLocalizedKey = self->_titleLocalizedKey;
  v23 = v4[12];
  if ((unint64_t)titleLocalizedKey | v23)
  {
    if (!objc_msgSend_isEqual_(titleLocalizedKey, v7, v23))
      goto LABEL_43;
  }
  titleLocalizedArguments = self->_titleLocalizedArguments;
  v25 = v4[11];
  if ((unint64_t)titleLocalizedArguments | v25)
  {
    if (!objc_msgSend_isEqual_(titleLocalizedArguments, v7, v25))
      goto LABEL_43;
  }
  subtitle = self->_subtitle;
  v27 = v4[7];
  if ((unint64_t)subtitle | v27)
  {
    if (!objc_msgSend_isEqual_(subtitle, v7, v27))
      goto LABEL_43;
  }
  subtitleLocalizedKey = self->_subtitleLocalizedKey;
  v29 = v4[9];
  if ((unint64_t)subtitleLocalizedKey | v29)
  {
    if (!objc_msgSend_isEqual_(subtitleLocalizedKey, v7, v29))
      goto LABEL_43;
  }
  subtitleLocalizedArguments = self->_subtitleLocalizedArguments;
  v31 = v4[8];
  if ((unint64_t)subtitleLocalizedArguments | v31)
    isEqual = objc_msgSend_isEqual_(subtitleLocalizedArguments, v7, v31);
  else
    isEqual = 1;
LABEL_44:

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
  uint64_t v12;
  const char *v13;
  uint64_t v14;
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

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v4 = 2654435761 * self->_isRead;
  else
    v4 = 0;
  v7 = objc_msgSend_hash(self->_uuid, a2, v2);
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v8 = 2654435761 * self->_source;
  else
    v8 = 0;
  v9 = objc_msgSend_hash(self->_dialog, v5, v6);
  v12 = objc_msgSend_hash(self->_sound, v10, v11);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v15 = 2654435761 * self->_badgeCount;
  else
    v15 = 0;
  v16 = v7 ^ v4 ^ v8 ^ v9 ^ v12 ^ v15 ^ objc_msgSend_hash(self->_payload, v13, v14);
  v19 = objc_msgSend_hash(self->_category, v17, v18);
  v22 = v19 ^ objc_msgSend_hash(self->_title, v20, v21);
  v25 = v22 ^ objc_msgSend_hash(self->_titleLocalizedKey, v23, v24);
  v28 = v16 ^ v25 ^ objc_msgSend_hash(self->_titleLocalizedArguments, v26, v27);
  v31 = objc_msgSend_hash(self->_subtitle, v29, v30);
  v34 = v31 ^ objc_msgSend_hash(self->_subtitleLocalizedKey, v32, v33);
  return v28 ^ v34 ^ objc_msgSend_hash(self->_subtitleLocalizedArguments, v35, v36);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
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
  v4 = a3;
  v6 = v4;
  if ((*((_BYTE *)v4 + 116) & 4) != 0)
  {
    self->_isRead = *((_BYTE *)v4 + 112);
    *(_BYTE *)&self->_has |= 4u;
  }
  v7 = *((_QWORD *)v4 + 13);
  if (v7)
    objc_msgSend_setUuid_(self, v5, v7);
  if ((*((_BYTE *)v6 + 116) & 2) != 0)
  {
    self->_source = *((_DWORD *)v6 + 12);
    *(_BYTE *)&self->_has |= 2u;
  }
  v8 = *((_QWORD *)v6 + 3);
  if (v8)
    objc_msgSend_setDialog_(self, v5, v8);
  v9 = *((_QWORD *)v6 + 5);
  if (v9)
    objc_msgSend_setSound_(self, v5, v9);
  if ((*((_BYTE *)v6 + 116) & 1) != 0)
  {
    self->_badgeCount = *((_DWORD *)v6 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  v10 = *((_QWORD *)v6 + 4);
  if (v10)
    objc_msgSend_setPayload_(self, v5, v10);
  v11 = *((_QWORD *)v6 + 2);
  if (v11)
    objc_msgSend_setCategory_(self, v5, v11);
  v12 = *((_QWORD *)v6 + 10);
  if (v12)
    objc_msgSend_setTitle_(self, v5, v12);
  v13 = *((_QWORD *)v6 + 12);
  if (v13)
    objc_msgSend_setTitleLocalizedKey_(self, v5, v13);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v14 = *((id *)v6 + 11);
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v35, v40, 16);
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(v14);
        objc_msgSend_addTitleLocalizedArguments_(self, v17, *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
      }
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v35, v40, 16);
    }
    while (v18);
  }

  v22 = *((_QWORD *)v6 + 7);
  if (v22)
    objc_msgSend_setSubtitle_(self, v21, v22);
  v23 = *((_QWORD *)v6 + 9);
  if (v23)
    objc_msgSend_setSubtitleLocalizedKey_(self, v21, v23);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v24 = *((id *)v6 + 8);
  v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v31, v39, 16);
  if (v26)
  {
    v28 = v26;
    v29 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v32 != v29)
          objc_enumerationMutation(v24);
        objc_msgSend_addSubtitleLocalizedArguments_(self, v27, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j), (_QWORD)v31);
      }
      v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v31, v39, 16);
    }
    while (v28);
  }

}

- (BOOL)isRead
{
  return self->_isRead;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)dialog
{
  return self->_dialog;
}

- (void)setDialog:(id)a3
{
  objc_storeStrong((id *)&self->_dialog, a3);
}

- (NSString)sound
{
  return self->_sound;
}

- (void)setSound:(id)a3
{
  objc_storeStrong((id *)&self->_sound, a3);
}

- (int)badgeCount
{
  return self->_badgeCount;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
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
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_titleLocalizedKey, 0);
  objc_storeStrong((id *)&self->_titleLocalizedArguments, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitleLocalizedKey, 0);
  objc_storeStrong((id *)&self->_subtitleLocalizedArguments, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

@end
