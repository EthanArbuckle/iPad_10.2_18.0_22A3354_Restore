@implementation MKPayload

- (MKPayload)init
{
  MKPayload *v2;
  MKPayload *v3;
  MKFeaturePayload *v4;
  MKFeaturePayload *v5;
  MKFeaturePayload *v6;
  MKFeaturePayload *v7;
  MKFeaturePayload *v8;
  MKFeaturePayload *v9;
  MKFeaturePayload *v10;
  MKFeaturePayload *v11;
  MKFeaturePayload *v12;
  MKFeaturePayload *v13;
  MKFeaturePayload *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MKPayload;
  v2 = -[MKPayload init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MKPayload setAndroidAPILevel:](v2, "setAndroidAPILevel:", CFSTR("?"));
    -[MKPayload setAndroidBrand:](v3, "setAndroidBrand:", CFSTR("?"));
    -[MKPayload setAndroidLocale:](v3, "setAndroidLocale:", CFSTR("?"));
    -[MKPayload setAndroidModel:](v3, "setAndroidModel:", CFSTR("?"));
    -[MKPayload setAndroidOSVersion:](v3, "setAndroidOSVersion:", CFSTR("?"));
    -[MKPayload setAndroidVersion:](v3, "setAndroidVersion:", CFSTR("?"));
    -[MKPayload setAndroidVersionCode:](v3, "setAndroidVersionCode:", CFSTR("?"));
    -[MKPayload setState:](v3, "setState:", CFSTR("?"));
    v4 = objc_alloc_init(MKFeaturePayload);
    -[MKPayload setMessages:](v3, "setMessages:", v4);

    v5 = objc_alloc_init(MKFeaturePayload);
    -[MKPayload setPhotos:](v3, "setPhotos:", v5);

    v6 = objc_alloc_init(MKFeaturePayload);
    -[MKPayload setVideos:](v3, "setVideos:", v6);

    v7 = objc_alloc_init(MKFeaturePayload);
    -[MKPayload setContacts:](v3, "setContacts:", v7);

    v8 = objc_alloc_init(MKFeaturePayload);
    -[MKPayload setCalendars:](v3, "setCalendars:", v8);

    v9 = objc_alloc_init(MKFeaturePayload);
    -[MKPayload setBookmarks:](v3, "setBookmarks:", v9);

    v10 = objc_alloc_init(MKFeaturePayload);
    -[MKPayload setAccounts:](v3, "setAccounts:", v10);

    v11 = objc_alloc_init(MKFeaturePayload);
    -[MKPayload setFiles:](v3, "setFiles:", v11);

    v12 = objc_alloc_init(MKFeaturePayload);
    -[MKPayload setWhatsapp:](v3, "setWhatsapp:", v12);

    v13 = objc_alloc_init(MKFeaturePayload);
    -[MKPayload setAccessibilitySettings:](v3, "setAccessibilitySettings:", v13);

    v14 = objc_alloc_init(MKFeaturePayload);
    -[MKPayload setDisplaySettings:](v3, "setDisplaySettings:", v14);

  }
  return v3;
}

- (id)dictionary
{
  id v3;
  __int128 v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  MKPayload *v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  __int128 v38;
  MKFeaturePayload *videos;
  __int128 v40;
  MKFeaturePayload *bookmarks;
  __int128 v42;
  __int128 v43;
  MKFeaturePayload *displaySettings;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "setObject:forKey:", self->_androidAPILevel, CFSTR("android_api_level"));
  objc_msgSend(v3, "setObject:forKey:", self->_androidBrand, CFSTR("android_brand"));
  objc_msgSend(v3, "setObject:forKey:", self->_androidLocale, CFSTR("android_locale"));
  objc_msgSend(v3, "setObject:forKey:", self->_androidModel, CFSTR("android_model"));
  objc_msgSend(v3, "setObject:forKey:", self->_androidOSVersion, CFSTR("android_os_version"));
  objc_msgSend(v3, "setObject:forKey:", self->_androidVersion, CFSTR("android_version"));
  objc_msgSend(v3, "setObject:forKey:", self->_androidVersionCode, CFSTR("android_version_code"));
  objc_msgSend(v3, "setObject:forKey:", self->_state, CFSTR("state"));
  v38 = *(_OWORD *)&self->_messages;
  videos = self->_videos;
  v40 = *(_OWORD *)&self->_contacts;
  bookmarks = self->_bookmarks;
  v4 = *(_OWORD *)&self->_whatsapp;
  v42 = *(_OWORD *)&self->_accounts;
  v43 = v4;
  displaySettings = self->_displaySettings;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v38, 11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0x24BDD1000uLL;
  if (objc_msgSend(v5, "count"))
  {
    v34 = self;
    v35 = v5;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    do
    {
      objc_msgSend(&unk_24E36C6C8, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");
      v13 = objc_msgSend(v11, "size");
      v36 = v13 >> 30;
      v37 = objc_msgSend(v11, "totalElapsedTime") / 0x3CuLL;
      objc_msgSend(v11, "importElapsedTime");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      v16 = v15 / 60.0;

      v8 += v13;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v11, "enabled"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_enabled"), v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v17, v18);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v19, v20);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v36);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_size"), v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v21, v22);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v37);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_elapsed_time"), v10);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v23, v24);

      v7 += v12;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_import_time"), v10);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v25, v26);

      objc_msgSend(v11, "state");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_state"), v10);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v27, v28);

      v5 = v35;
      ++v9;
    }
    while (v9 < objc_msgSend(v35, "count"));
    v29 = v8 >> 30;
    self = v34;
    v6 = 0x24BDD1000;
  }
  else
  {
    v29 = 0;
    v7 = 0;
  }
  objc_msgSend(*(id *)(v6 + 1760), "numberWithUnsignedLongLong:", v7);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("data"));

  objc_msgSend(*(id *)(v6 + 1760), "numberWithUnsignedLongLong:", v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("data_size"));

  objc_msgSend(*(id *)(v6 + 1760), "numberWithUnsignedLongLong:", self->_elapsedTime / 0x3C);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("elapsed_time"));

  return v3;
}

- (NSString)androidAPILevel
{
  return self->_androidAPILevel;
}

- (void)setAndroidAPILevel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)androidBrand
{
  return self->_androidBrand;
}

- (void)setAndroidBrand:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)androidLocale
{
  return self->_androidLocale;
}

- (void)setAndroidLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)androidModel
{
  return self->_androidModel;
}

- (void)setAndroidModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)androidOSVersion
{
  return self->_androidOSVersion;
}

- (void)setAndroidOSVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)androidVersion
{
  return self->_androidVersion;
}

- (void)setAndroidVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)androidVersionCode
{
  return self->_androidVersionCode;
}

- (void)setAndroidVersionCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)data
{
  return self->_data;
}

- (void)setData:(unint64_t)a3
{
  self->_data = a3;
}

- (unint64_t)dataSize
{
  return self->_dataSize;
}

- (void)setDataSize:(unint64_t)a3
{
  self->_dataSize = a3;
}

- (unint64_t)elapsedTime
{
  return self->_elapsedTime;
}

- (void)setElapsedTime:(unint64_t)a3
{
  self->_elapsedTime = a3;
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (MKFeaturePayload)messages
{
  return self->_messages;
}

- (void)setMessages:(id)a3
{
  objc_storeStrong((id *)&self->_messages, a3);
}

- (MKFeaturePayload)photos
{
  return self->_photos;
}

- (void)setPhotos:(id)a3
{
  objc_storeStrong((id *)&self->_photos, a3);
}

- (MKFeaturePayload)videos
{
  return self->_videos;
}

- (void)setVideos:(id)a3
{
  objc_storeStrong((id *)&self->_videos, a3);
}

- (MKFeaturePayload)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
  objc_storeStrong((id *)&self->_contacts, a3);
}

- (MKFeaturePayload)calendars
{
  return self->_calendars;
}

- (void)setCalendars:(id)a3
{
  objc_storeStrong((id *)&self->_calendars, a3);
}

- (MKFeaturePayload)bookmarks
{
  return self->_bookmarks;
}

- (void)setBookmarks:(id)a3
{
  objc_storeStrong((id *)&self->_bookmarks, a3);
}

- (MKFeaturePayload)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
  objc_storeStrong((id *)&self->_accounts, a3);
}

- (MKFeaturePayload)files
{
  return self->_files;
}

- (void)setFiles:(id)a3
{
  objc_storeStrong((id *)&self->_files, a3);
}

- (MKFeaturePayload)whatsapp
{
  return self->_whatsapp;
}

- (void)setWhatsapp:(id)a3
{
  objc_storeStrong((id *)&self->_whatsapp, a3);
}

- (MKFeaturePayload)accessibilitySettings
{
  return self->_accessibilitySettings;
}

- (void)setAccessibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilitySettings, a3);
}

- (MKFeaturePayload)displaySettings
{
  return self->_displaySettings;
}

- (void)setDisplaySettings:(id)a3
{
  objc_storeStrong((id *)&self->_displaySettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displaySettings, 0);
  objc_storeStrong((id *)&self->_accessibilitySettings, 0);
  objc_storeStrong((id *)&self->_whatsapp, 0);
  objc_storeStrong((id *)&self->_files, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_bookmarks, 0);
  objc_storeStrong((id *)&self->_calendars, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_videos, 0);
  objc_storeStrong((id *)&self->_photos, 0);
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_androidVersionCode, 0);
  objc_storeStrong((id *)&self->_androidVersion, 0);
  objc_storeStrong((id *)&self->_androidOSVersion, 0);
  objc_storeStrong((id *)&self->_androidModel, 0);
  objc_storeStrong((id *)&self->_androidLocale, 0);
  objc_storeStrong((id *)&self->_androidBrand, 0);
  objc_storeStrong((id *)&self->_androidAPILevel, 0);
}

@end
