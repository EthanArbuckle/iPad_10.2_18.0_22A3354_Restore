@implementation ACCMediaLibraryUpdatePlaylist

- (ACCMediaLibraryUpdatePlaylist)initWithMediaLibrary:(id)a3 persistentID:(unint64_t)a4 revision:(id)a5
{
  id v9;
  id v10;
  ACCMediaLibraryUpdatePlaylist *v11;
  ACCMediaLibraryUpdatePlaylist *v12;
  NSString *name;
  ACCMediaLibraryUpdatePlaylistContent *content;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ACCMediaLibraryUpdatePlaylist;
  v11 = -[ACCMediaLibraryUpdatePlaylist init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaLibraryUID, a3);
    objc_storeStrong((id *)&v12->_revision, a5);
    v12->_persistentID = a4;
    v12->_validMask = 1;
    name = v12->_name;
    v12->_name = 0;

    content = v12->_content;
    v12->_parentPersistentID = 0;
    v12->_content = 0;
    v12->_contentStyle = 0;
    *(_DWORD *)&v12->_folder = 0;
    v12->_radioStationOrdering = 0;

  }
  return v12;
}

- (ACCMediaLibraryUpdatePlaylist)initWithMediaLibrary:(id)a3 dict:(id)a4
{
  id v7;
  id v8;
  ACCMediaLibraryUpdatePlaylist *v9;
  ACCMediaLibraryUpdatePlaylist *v10;
  NSString *revision;
  NSString *name;
  ACCMediaLibraryUpdatePlaylistContent *content;
  void *v14;
  uint64_t v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  int contentStyle;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  BOOL v40;
  id v41;
  NSObject *v42;
  objc_super v44;
  uint8_t buf[4];
  ACCMediaLibraryUpdatePlaylist *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v44.receiver = self;
  v44.super_class = (Class)ACCMediaLibraryUpdatePlaylist;
  v9 = -[ACCMediaLibraryUpdatePlaylist init](&v44, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaLibraryUID, a3);
    revision = v10->_revision;
    v10->_revision = (NSString *)&stru_24DCCE030;

    v10->_persistentID = 0;
    name = v10->_name;
    v10->_name = 0;

    content = v10->_content;
    v10->_parentPersistentID = 0;
    v10->_content = 0;
    v10->_contentStyle = 0;
    *(_DWORD *)&v10->_folder = 0;
    v10->_radioStationOrdering = 0;

    v10->_validMask = 0;
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateRevisionKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdateRevisionKey"));
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v10->_revision;
      v10->_revision = (NSString *)v15;

    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdatePlaylistPersistentID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdatePlaylistPersistentID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_persistentID = objc_msgSend(v18, "unsignedLongLongValue");

      v10->_validMask |= 1uLL;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdatePlaylistName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdatePlaylistName"));
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v10->_name;
      v10->_name = (NSString *)v20;

      v10->_validMask |= 2uLL;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdatePlaylistParentPersistentID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdatePlaylistParentPersistentID"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_parentPersistentID = objc_msgSend(v23, "unsignedLongLongValue");

      v10->_validMask |= 4uLL;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdatePlaylistIsFolder"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdatePlaylistIsFolder"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_folder = objc_msgSend(v25, "unsignedCharValue") != 0;

      v10->_validMask |= 0x10uLL;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdatePlaylistIsGeniusMix"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdatePlaylistIsGeniusMix"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_geniusMix = objc_msgSend(v27, "unsignedCharValue") != 0;

      v10->_validMask |= 8uLL;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdatePlaylistContentStyle"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v29 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        v29 = MEMORY[0x24BDACB70];
        v30 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        contentStyle = v10->_contentStyle;
        objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdatePlaylistContentStyle"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v46 = v10;
        v47 = 1024;
        v48 = contentStyle;
        v49 = 2112;
        v50 = v32;
        _os_log_impl(&dword_21A4E8000, v29, OS_LOG_TYPE_INFO, "%@ contentStyle %d->%@", buf, 0x1Cu);

      }
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdatePlaylistContentStyle"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_contentStyle = objc_msgSend(v33, "unsignedCharValue");

      v10->_validMask |= 0x20uLL;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdatePlaylistIsRadioStation"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdatePlaylistIsRadioStation"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_radioStation = objc_msgSend(v35, "unsignedCharValue") != 0;

      v10->_validMask |= 0x40uLL;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdatePlaylistIsSmartPlaylist"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdatePlaylistIsSmartPlaylist"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_smartPlaylist = objc_msgSend(v37, "unsignedCharValue") != 0;

      v10->_validMask |= 0x100uLL;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdatePlaylistRadioStationOrdering"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("ACCMediaLibraryUpdatePlaylistRadioStationOrdering"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_radioStationOrdering = objc_msgSend(v39, "unsignedShortValue");

      v10->_validMask |= 0x200uLL;
    }
  }
  if (gLogObjects)
    v40 = gNumLogObjects < 1;
  else
    v40 = 1;
  if (v40)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v42 = MEMORY[0x24BDACB70];
    v41 = MEMORY[0x24BDACB70];
  }
  else
  {
    v42 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v10;
    _os_log_impl(&dword_21A4E8000, v42, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  return v10;
}

- (id)description
{
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;

  v2 = &stru_24DCCE030;
  if (self->_folder)
    v3 = CFSTR(" folder");
  else
    v3 = &stru_24DCCE030;
  if (self->_geniusMix)
    v4 = CFSTR(" geniusMix");
  else
    v4 = &stru_24DCCE030;
  if (self->_radioStation)
    v5 = CFSTR(" station");
  else
    v5 = &stru_24DCCE030;
  if (self->_smartPlaylist)
    v2 = CFSTR(" smart");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<ACCMediaLibraryUpdatePlaylist>[%@:%llu revision=%@ valid=%llxh '%@' %@ %@ %@ %@ parentPersistentID=%llu]"), self->_mediaLibraryUID, self->_persistentID, self->_revision, self->_validMask, self->_name, v3, v4, v5, v2, self->_parentPersistentID);
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ACCMediaLibraryUpdatePlaylist description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ACCMediaLibraryUpdatePlaylist copyDict](self, "copyDict");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n    %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyDict
{
  id v3;
  void *v4;
  NSString *revision;
  unint64_t validMask;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = v3;
  revision = self->_revision;
  if (revision)
    objc_msgSend(v3, "setObject:forKey:", revision, CFSTR("ACCMediaLibraryUpdateRevisionKey"));
  validMask = self->_validMask;
  if ((validMask & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_persistentID);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("ACCMediaLibraryUpdatePlaylistPersistentID"));

    validMask = self->_validMask;
    if ((validMask & 2) == 0)
    {
LABEL_5:
      if ((validMask & 4) == 0)
        goto LABEL_6;
      goto LABEL_16;
    }
  }
  else if ((validMask & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v4, "setObject:forKey:", self->_name, CFSTR("ACCMediaLibraryUpdatePlaylistName"));
  validMask = self->_validMask;
  if ((validMask & 4) == 0)
  {
LABEL_6:
    if ((validMask & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_parentPersistentID);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("ACCMediaLibraryUpdatePlaylistParentPersistentID"));

  validMask = self->_validMask;
  if ((validMask & 0x10) == 0)
  {
LABEL_7:
    if ((validMask & 8) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_folder);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("ACCMediaLibraryUpdatePlaylistIsFolder"));

  validMask = self->_validMask;
  if ((validMask & 8) == 0)
  {
LABEL_8:
    if ((validMask & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_geniusMix);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("ACCMediaLibraryUpdatePlaylistIsGeniusMix"));

  validMask = self->_validMask;
  if ((validMask & 0x20) == 0)
  {
LABEL_9:
    if ((validMask & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", LOBYTE(self->_contentStyle));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("ACCMediaLibraryUpdatePlaylistContentStyle"));

  validMask = self->_validMask;
  if ((validMask & 0x40) == 0)
  {
LABEL_10:
    if ((validMask & 0x100) == 0)
      goto LABEL_11;
LABEL_21:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_smartPlaylist);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("ACCMediaLibraryUpdatePlaylistIsSmartPlaylist"));

    if ((self->_validMask & 0x200) == 0)
      return v4;
    goto LABEL_12;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_radioStation);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("ACCMediaLibraryUpdatePlaylistIsRadioStation"));

  validMask = self->_validMask;
  if ((validMask & 0x100) != 0)
    goto LABEL_21;
LABEL_11:
  if ((validMask & 0x200) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", self->_radioStationOrdering);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("ACCMediaLibraryUpdatePlaylistRadioStationOrdering"));

  }
  return v4;
}

- (void)fillStruct:(id *)a3
{
  BOOL v5;
  id v6;
  NSObject *v7;
  unint64_t validMask;
  NSString *name;

  *(_QWORD *)&a3->var4 = 0;
  *(_OWORD *)&a3->var0 = 0u;
  *(_OWORD *)&a3->var2 = 0u;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ACCMediaLibraryUpdatePlaylist fillStruct:].cold.1((uint64_t)self, v7);

  validMask = self->_validMask;
  if ((validMask & 1) != 0)
  {
    a3->var1 = self->_persistentID;
    a3->var0 |= 1u;
    validMask = self->_validMask;
    if ((validMask & 2) == 0)
    {
LABEL_13:
      if ((validMask & 4) == 0)
        goto LABEL_14;
      goto LABEL_26;
    }
  }
  else if ((validMask & 2) == 0)
  {
    goto LABEL_13;
  }
  name = self->_name;
  if (name)
  {
    name = -[NSString UTF8String](name, "UTF8String");
    validMask = self->_validMask;
  }
  a3->var2 = (char *)name;
  a3->var0 |= 2u;
  if ((validMask & 4) == 0)
  {
LABEL_14:
    if ((validMask & 8) == 0)
      goto LABEL_15;
    goto LABEL_27;
  }
LABEL_26:
  a3->var3 = self->_parentPersistentID;
  a3->var0 |= 4u;
  validMask = self->_validMask;
  if ((validMask & 8) == 0)
  {
LABEL_15:
    if ((validMask & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_28;
  }
LABEL_27:
  a3->var4 = self->_geniusMix;
  a3->var0 |= 8u;
  if ((validMask & 0x10) == 0)
  {
LABEL_16:
    if ((validMask & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_29;
  }
LABEL_28:
  a3->var5 = self->_folder;
  a3->var0 |= 0x10u;
  if ((validMask & 0x20) == 0)
  {
LABEL_17:
    if ((validMask & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_30;
  }
LABEL_29:
  a3->var6 = self->_contentStyle;
  a3->var0 |= 0x20u;
  if ((validMask & 0x40) == 0)
  {
LABEL_18:
    if ((validMask & 0x100) == 0)
      goto LABEL_19;
    goto LABEL_31;
  }
LABEL_30:
  a3->var7 = self->_radioStation;
  a3->var0 |= 0x40u;
  if ((validMask & 0x100) == 0)
  {
LABEL_19:
    if ((validMask & 0x200) == 0)
      return;
    goto LABEL_20;
  }
LABEL_31:
  a3->var8 = self->_smartPlaylist;
  a3->var0 |= 0x100u;
  if ((validMask & 0x200) == 0)
    return;
LABEL_20:
  a3->var9 = self->_radioStationOrdering;
  a3->var0 |= 0x200u;
}

- (void)setMediaLibraryUID:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibraryUID, a3);
}

- (void)setRevision:(id)a3
{
  objc_storeStrong((id *)&self->_revision, a3);
}

- (void)setPersistentID:(unint64_t)a3
{
  unint64_t v3;

  v3 = self->_validMask | 1;
  self->_persistentID = a3;
  self->_validMask = v3;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
  self->_validMask |= 2uLL;
}

- (void)setParentPersistentID:(unint64_t)a3
{
  self->_parentPersistentID = a3;
  self->_validMask |= 4uLL;
}

- (void)setFolder:(BOOL)a3
{
  self->_folder = a3;
  self->_validMask |= 0x10uLL;
}

- (void)setGeniusMix:(BOOL)a3
{
  self->_geniusMix = a3;
  self->_validMask |= 8uLL;
}

- (void)setContentStyle:(int)a3
{
  BOOL v5;
  id v6;
  NSObject *v7;

  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ACCMediaLibraryUpdatePlaylist setContentStyle:].cold.1((uint64_t)self, a3, v7);

  self->_contentStyle = a3;
  self->_validMask |= 0x20uLL;
}

- (void)setRadioStation:(BOOL)a3
{
  self->_radioStation = a3;
  self->_validMask |= 0x40uLL;
}

- (void)setSmartPlaylist:(BOOL)a3
{
  self->_smartPlaylist = a3;
  self->_validMask |= 0x100uLL;
}

- (void)setRadioStationOrdering:(unsigned __int16)a3
{
  self->_radioStationOrdering = a3;
  self->_validMask |= 0x200uLL;
}

- (NSString)mediaLibraryUID
{
  return self->_mediaLibraryUID;
}

- (NSString)revision
{
  return self->_revision;
}

- (unint64_t)persistentID
{
  return self->_persistentID;
}

- (unint64_t)validMask
{
  return self->_validMask;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)parentPersistentID
{
  return self->_parentPersistentID;
}

- (BOOL)folder
{
  return self->_folder;
}

- (BOOL)geniusMix
{
  return self->_geniusMix;
}

- (BOOL)radioStation
{
  return self->_radioStation;
}

- (BOOL)smartPlaylist
{
  return self->_smartPlaylist;
}

- (unsigned)radioStationOrdering
{
  return self->_radioStationOrdering;
}

- (int)contentStyle
{
  return self->_contentStyle;
}

- (ACCMediaLibraryUpdatePlaylistContent)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_revision, 0);
  objc_storeStrong((id *)&self->_mediaLibraryUID, 0);
}

- (void)fillStruct:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_21A4E8000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)setContentStyle:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *(_DWORD *)(a1 + 16);
  v4 = 138412802;
  v5 = a1;
  v6 = 1024;
  v7 = v3;
  v8 = 1024;
  v9 = a2;
  _os_log_debug_impl(&dword_21A4E8000, log, OS_LOG_TYPE_DEBUG, "%@ setContentStyle %d->%d", (uint8_t *)&v4, 0x18u);
  OUTLINED_FUNCTION_2();
}

@end
