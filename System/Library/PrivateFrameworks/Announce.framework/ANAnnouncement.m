@implementation ANAnnouncement

- (ANAnnouncement)init
{
  ANAnnouncement *v2;
  ANAnnouncement *v3;
  void *v4;
  uint64_t v5;
  NSString *identifier;
  uint64_t v7;
  ANParticipant *announcer;
  NSString *messageVersion;
  uint64_t v10;
  NSDate *creationTimestamp;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ANAnnouncement;
  v2 = -[ANAnnouncement init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_statusFlags = 0;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = objc_claimAutoreleasedReturnValue();
    identifier = v3->_identifier;
    v3->_identifier = (NSString *)v5;

    v7 = objc_opt_new();
    announcer = v3->_announcer;
    v3->_announcer = (ANParticipant *)v7;

    messageVersion = v3->_messageVersion;
    v3->_messageVersion = (NSString *)CFSTR("1.0");

    v3->_action = 0;
    *(_QWORD *)&v3->_productType = 0;
    v3->_productTypeOverride = 0;
    v3->_deviceClass = +[ANDevice deviceClass](ANDevice, "deviceClass");
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = objc_claimAutoreleasedReturnValue();
    creationTimestamp = v3->_creationTimestamp;
    v3->_creationTimestamp = (NSDate *)v10;

    v3->_source = 0;
  }
  return v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEB8];
  -[ANAnnouncement listeners](self, "listeners");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[ANAnnouncement listeners](self, "listeners");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v38;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v10), "info");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v8);
  }

  v12 = (void *)MEMORY[0x24BDBCEB8];
  -[ANAnnouncement dataItems](self, "dataItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayWithCapacity:", objc_msgSend(v13, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[ANAnnouncement dataItems](self, "dataItems", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v34;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v19), "info");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v17);
  }

  v21 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v21, "setObject:forKeyedSubscript:", self->_messageVersion, CFSTR("MessageVersion"));
  objc_msgSend(v21, "setObject:forKeyedSubscript:", self->_filePath, CFSTR("File"));
  -[ANParticipant info](self->_announcer, "info");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("Announcer"));

  objc_msgSend(v21, "setObject:forKeyedSubscript:", v5, CFSTR("Listeners"));
  objc_msgSend(v21, "setObject:forKeyedSubscript:", self->_playbackDeadline, CFSTR("PlaybackDeadline"));
  -[ANAnnouncement _stringForAction:](self, "_stringForAction:", self->_action);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, CFSTR("Action"));

  objc_msgSend(v21, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("AnnouncementID"));
  objc_msgSend(v21, "setObject:forKeyedSubscript:", self->_groupID, CFSTR("GroupID"));
  objc_msgSend(v21, "setObject:forKeyedSubscript:", self->_sender, CFSTR("Sender"));
  -[ANLocation message](self->_location, "message");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v24, CFSTR("Location"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", *(_QWORD *)&self->_productType);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v25, CFSTR("ProductType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_productTypeOverride);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v26, CFSTR("ProductTypeOverride"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_deviceClass);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v27, CFSTR("DeviceClass"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSString length](self->_transcriptionText, "length"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v28, CFSTR("AudioTranscription"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_statusFlags);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v29, CFSTR("StatusFlags"));

  objc_msgSend(v21, "setObject:forKeyedSubscript:", v14, CFSTR("DataItems"));
  objc_msgSend(v21, "setObject:forKeyedSubscript:", self->_creationTimestamp, CFSTR("CreationTimestamp"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_source);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v30, CFSTR("Source"));

  objc_msgSend(v21, "description");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v31;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  objc_msgSend(v4, "identifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_5;
  v7 = (void *)v6;
  -[ANAnnouncement identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if ((v10 & 1) != 0)
    v11 = 1;
  else
LABEL_5:
    v11 = 0;

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ANAnnouncement identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)copy
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;

  v3 = (_QWORD *)objc_opt_new();
  -[ANAnnouncement identifier](self, "identifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v3[2];
  v3[2] = v4;

  -[ANAnnouncement messageVersion](self, "messageVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMessageVersion:", v6);

  -[ANAnnouncement announcer](self, "announcer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v3, "setAnnouncer:", v8);

  -[ANAnnouncement listeners](self, "listeners");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v3, "setListeners:", v10);

  -[ANAnnouncement playbackDeadline](self, "playbackDeadline");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPlaybackDeadline:", v11);

  objc_msgSend(v3, "setAction:", -[ANAnnouncement action](self, "action"));
  -[ANAnnouncement groupID](self, "groupID");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v3[3];
  v3[3] = v12;

  objc_msgSend(v3, "setProductType:", -[ANAnnouncement productType](self, "productType"));
  objc_msgSend(v3, "setProductTypeOverride:", -[ANAnnouncement productTypeOverride](self, "productTypeOverride"));
  objc_msgSend(v3, "setDeviceClass:", -[ANAnnouncement deviceClass](self, "deviceClass"));
  -[ANAnnouncement location](self, "location");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(v3, "setLocation:", v15);

  -[ANAnnouncement transcriptionText](self, "transcriptionText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranscriptionText:", v16);

  -[ANAnnouncement dataItems](self, "dataItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v3, "setDataItems:", v18);

  -[ANAnnouncement creationTimestamp](self, "creationTimestamp");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v3, "setCreationTimestamp:", v20);

  objc_msgSend(v3, "setSource:", -[ANAnnouncement source](self, "source"));
  -[ANAnnouncement receiptTimestamp](self, "receiptTimestamp");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v3[18];
  v3[18] = v21;

  -[ANAnnouncement cmStartTime](self, "cmStartTime");
  v24 = v26;
  v25 = v27;
  objc_msgSend(v3, "setCmStartTime:", &v24);
  objc_msgSend(v3, "setMachStartTime:", -[ANAnnouncement machStartTime](self, "machStartTime"));
  return v3;
}

- (NSData)fileData
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[ANAnnouncement dataItems](self, "dataItems", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "type") == 1)
        {
          objc_msgSend(v6, "data");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (NSData *)v3;
}

- (BOOL)isRelayType
{
  return -[ANAnnouncement action](self, "action") - 2 < 4;
}

- (BOOL)isRelayed
{
  return (-[ANAnnouncement action](self, "action") & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)isRelayRequest
{
  return (-[ANAnnouncement action](self, "action") & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (BOOL)hasPlayed
{
  return (-[ANAnnouncement statusFlags](self, "statusFlags") & 3) != 0;
}

- (BOOL)updateWithContentsOfAnnouncement:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v7 = a3;
  -[ANAnnouncement announcer](self, "announcer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "homeKitID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    && (-[ANAnnouncement announcer](self, "announcer"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "homeKitID"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "length")))
  {

    v10 = 0;
  }
  else
  {
    objc_msgSend(v7, "announcer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "homeKitID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {

    }
    if (!v5)
    {
      v10 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v7, "announcer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "homeKitID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANAnnouncement announcer](self, "announcer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHomeKitID:", v9);
    v10 = 1;
  }

LABEL_10:
  -[ANAnnouncement announcer](self, "announcer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "userID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[ANAnnouncement announcer](self, "announcer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {

LABEL_17:
      goto LABEL_18;
    }
  }
  objc_msgSend(v7, "announcer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "userID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {

  }
  if (v15)
  {
    objc_msgSend(v7, "announcer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "userID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANAnnouncement announcer](self, "announcer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUserID:", v13);
    v10 = 1;
    goto LABEL_17;
  }
LABEL_18:
  -[ANAnnouncement transcriptionText](self, "transcriptionText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[ANAnnouncement transcriptionText](self, "transcriptionText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length"))
    {

LABEL_25:
      goto LABEL_26;
    }
  }
  objc_msgSend(v7, "transcriptionText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {

  }
  if (v4)
  {
    objc_msgSend(v7, "transcriptionText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANAnnouncement setTranscriptionText:](self, "setTranscriptionText:", v16);
    v10 = 1;
    goto LABEL_25;
  }
LABEL_26:
  -[ANAnnouncement announcer](self, "announcer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[ANAnnouncement announcer](self, "announcer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {

LABEL_33:
      goto LABEL_34;
    }
  }
  objc_msgSend(v7, "announcer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {

  }
  if (v20)
  {
    objc_msgSend(v7, "announcer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANAnnouncement announcer](self, "announcer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setName:", v18);
    v10 = 1;
    goto LABEL_33;
  }
LABEL_34:

  return v10;
}

- (void)removeAudioFileDataItems
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[ANAnnouncement dataItems](self, "dataItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ANAnnouncement dataItems](self, "dataItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "type") == 1)
          objc_msgSend(v4, "removeObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  -[ANAnnouncement setDataItems:](self, "setDataItems:", v11);

}

+ (unint64_t)sourceFromString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.SiriAnnounceExtensions.AnnounceIntentExtension")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Home")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.NanoHome")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.assistant.assistantd")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.SoundBoard")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.SiriHeadlessService")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Home.HomeUtilNotification")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Home.HomeControlService")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.homehubd")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (ANAnnouncement)initWithMessage:(id)a3
{
  id v4;
  ANAnnouncement *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSDate *playbackDeadline;
  uint64_t v18;
  NSString *identifier;
  uint64_t v20;
  NSString *groupID;
  ANParticipant *v22;
  ANParticipant *announcer;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  ANParticipant *v31;
  void *v32;
  ANLocation *v33;
  ANLocation *location;
  void *v35;
  uint64_t v36;
  NSArray *dataItems;
  uint64_t v38;
  NSString *filePath;
  uint64_t v40;
  NSDate *creationTimestamp;
  void *v42;
  void *v43;
  NSDate *v44;
  ANAnnouncement *v45;
  NSDate *receiptTimestamp;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  objc_super v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)ANAnnouncement;
  v5 = -[ANAnnouncement init](&v59, sel_init);
  if (!v5)
  {
LABEL_28:
    v45 = v5;
    goto LABEL_29;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MessageVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "isEqualToString:", CFSTR("1.0")))
  {
    objc_storeStrong((id *)&v5->_messageVersion, v7);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Action"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v5->_action = objc_msgSend(v8, "unsignedIntegerValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ProductType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      *(_QWORD *)&v5->_productType = objc_msgSend(v10, "unsignedIntValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ProductTypeOverride"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      v5->_productTypeOverride = objc_msgSend(v12, "unsignedIntegerValue");
    v52 = v13;
    v53 = v11;
    v54 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DeviceClass"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
      v5->_deviceClass = objc_msgSend(v14, "integerValue");
    v51 = v15;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PlaybackDeadline"));
    v16 = objc_claimAutoreleasedReturnValue();
    playbackDeadline = v5->_playbackDeadline;
    v5->_playbackDeadline = (NSDate *)v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AnnouncementID"));
    v18 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v18;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("GroupID"));
    v20 = objc_claimAutoreleasedReturnValue();
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v20;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Announcer"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[ANParticipant initWithMessage:]([ANParticipant alloc], "initWithMessage:", v50);
    announcer = v5->_announcer;
    v5->_announcer = v22;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Listeners"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v24, "count"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v26 = v24;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v56 != v29)
            objc_enumerationMutation(v26);
          v31 = -[ANParticipant initWithMessage:]([ANParticipant alloc], "initWithMessage:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i));
          objc_msgSend(v25, "addObject:", v31);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      }
      while (v28);
    }

    if (objc_msgSend(v25, "count"))
      objc_storeStrong((id *)&v5->_listeners, v25);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Location"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[ANLocation initWithMessage:]([ANLocation alloc], "initWithMessage:", v32);
    location = v5->_location;
    v5->_location = v33;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DataItems"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[ANAnnouncementDataItem strictSecureDecodeFromData:](ANAnnouncementDataItem, "strictSecureDecodeFromData:", v35);
    v36 = objc_claimAutoreleasedReturnValue();
    dataItems = v5->_dataItems;
    v5->_dataItems = (NSArray *)v36;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("File"));
    v38 = objc_claimAutoreleasedReturnValue();
    filePath = v5->_filePath;
    v5->_filePath = (NSString *)v38;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CreationTimestamp"));
    v40 = objc_claimAutoreleasedReturnValue();
    creationTimestamp = v5->_creationTimestamp;
    v5->_creationTimestamp = (NSDate *)v40;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ReceiptTimestamp"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (v42)
    {
      v44 = v42;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v44 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    receiptTimestamp = v5->_receiptTimestamp;
    v5->_receiptTimestamp = v44;

    v5->_statusFlags = 0;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Source"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (v47)
      v5->_source = objc_msgSend(v47, "unsignedIntegerValue");

    goto LABEL_28;
  }

  v45 = 0;
LABEL_29:

  return v45;
}

- (id)message
{
  NSString *v3;
  NSString *groupID;
  NSArray *dataItems;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[ANAnnouncement _generateGroupID](self, "_generateGroupID");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  groupID = self->_groupID;
  self->_groupID = v3;

  dataItems = self->_dataItems;
  v21 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", dataItems, 0, &v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v21;
  if (v7)
  {
    ANLogHandleAnnouncement();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[ANAnnouncement identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = &stru_24D370F00;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_2156FF000, v8, OS_LOG_TYPE_ERROR, "%@Failed to archive data for Announcement %@", buf, 0x16u);

    }
  }
  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", self->_messageVersion, CFSTR("MessageVersion"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, CFSTR("DataItems"));
  -[ANParticipant message](self->_announcer, "message");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("Announcer"));

  objc_msgSend(v10, "setObject:forKeyedSubscript:", self->_playbackDeadline, CFSTR("PlaybackDeadline"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_action);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("Action"));

  objc_msgSend(v10, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("AnnouncementID"));
  -[ANAnnouncement groupID](self, "groupID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("GroupID"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", *(_QWORD *)&self->_productType);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("ProductType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_productTypeOverride);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("ProductTypeOverride"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_deviceClass);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("DeviceClass"));

  -[ANLocation message](self->_location, "message");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("Location"));

  objc_msgSend(v10, "setObject:forKeyedSubscript:", self->_transcriptionText, CFSTR("AudioTranscription"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", self->_creationTimestamp, CFSTR("CreationTimestamp"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_source);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, CFSTR("Source"));

  v19 = (void *)objc_msgSend(v10, "copy");
  return v19;
}

- (id)messageForCompanion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDBCED8];
  -[ANAnnouncement message](self, "message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ANParticipant messageForCompanion](self->_announcer, "messageForCompanion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("Announcer"));

  v7 = (void *)objc_msgSend(v5, "copy");
  return v7;
}

- (NSDictionary)metadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCED8];
  -[ANAnnouncement message](self, "message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_filePath, CFSTR("File"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_receiptTimestamp, CFSTR("ReceiptTimestamp"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("DataItems"));
  v6 = (void *)objc_msgSend(v5, "copy");

  return (NSDictionary *)v6;
}

+ (id)messageWithoutDataFromMessage:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("DataItems"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

+ (id)messageFromData:(id)a3 data:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("DataItems"));

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

+ (id)messageDataFromMessage:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("DataItems"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *messageVersion;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  messageVersion = self->_messageVersion;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", messageVersion, CFSTR("MessageVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_filePath, CFSTR("File"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_announcer, CFSTR("Announcer"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_listeners, CFSTR("Listeners"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_playbackDeadline, CFSTR("PlaybackDeadline"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_action);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("Action"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("AnnouncementID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupID, CFSTR("GroupID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sender, CFSTR("Sender"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_location, CFSTR("Location"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", *(_QWORD *)&self->_productType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("ProductType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_productTypeOverride);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("ProductTypeOverride"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_deviceClass);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("DeviceClass"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_transcriptionText, CFSTR("AudioTranscription"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_statusFlags);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("StatusFlags"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_dataItems, CFSTR("DataItems"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_source);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("Source"));

}

- (ANAnnouncement)initWithCoder:(id)a3
{
  id v4;
  ANAnnouncement *v5;
  uint64_t v6;
  NSString *messageVersion;
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
  uint64_t v18;
  NSDate *playbackDeadline;
  uint64_t v20;
  NSString *filePath;
  uint64_t v22;
  NSString *identifier;
  uint64_t v24;
  NSString *groupID;
  uint64_t v26;
  ANParticipant *announcer;
  uint64_t v28;
  ANLocation *location;
  uint64_t v30;
  ANSender *sender;
  uint64_t v32;
  NSString *transcriptionText;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSArray *listeners;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  NSArray *dataItems;
  void *v47;
  objc_super v48;

  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)ANAnnouncement;
  v5 = -[ANAnnouncement init](&v48, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MessageVersion"));
    v6 = objc_claimAutoreleasedReturnValue();
    messageVersion = v5->_messageVersion;
    v5->_messageVersion = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Action"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v5->_action = objc_msgSend(v8, "unsignedIntegerValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProductType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      *(_QWORD *)&v5->_productType = objc_msgSend(v10, "integerValue");
    v47 = v11;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProductTypeOverride"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      v5->_productTypeOverride = objc_msgSend(v12, "unsignedIntegerValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DeviceClass"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
      v5->_deviceClass = objc_msgSend(v14, "integerValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StatusFlags"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      v5->_statusFlags = objc_msgSend(v16, "integerValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PlaybackDeadline"));
    v18 = objc_claimAutoreleasedReturnValue();
    playbackDeadline = v5->_playbackDeadline;
    v5->_playbackDeadline = (NSDate *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("File"));
    v20 = objc_claimAutoreleasedReturnValue();
    filePath = v5->_filePath;
    v5->_filePath = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AnnouncementID"));
    v22 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GroupID"));
    v24 = objc_claimAutoreleasedReturnValue();
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Announcer"));
    v26 = objc_claimAutoreleasedReturnValue();
    announcer = v5->_announcer;
    v5->_announcer = (ANParticipant *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Location"));
    v28 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (ANLocation *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Sender"));
    v30 = objc_claimAutoreleasedReturnValue();
    sender = v5->_sender;
    v5->_sender = (ANSender *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AudioTranscription"));
    v32 = objc_claimAutoreleasedReturnValue();
    transcriptionText = v5->_transcriptionText;
    v5->_transcriptionText = (NSString *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Source"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v34)
      v5->_source = objc_msgSend(v34, "unsignedIntegerValue");
    v36 = (void *)MEMORY[0x24BDBCF20];
    v37 = objc_opt_class();
    objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v38, CFSTR("Listeners"));
    v39 = objc_claimAutoreleasedReturnValue();
    listeners = v5->_listeners;
    v5->_listeners = (NSArray *)v39;

    v41 = (void *)MEMORY[0x24BDBCF20];
    v42 = objc_opt_class();
    objc_msgSend(v41, "setWithObjects:", v42, objc_opt_class(), 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v43, CFSTR("DataItems"));
    v44 = objc_claimAutoreleasedReturnValue();
    dataItems = v5->_dataItems;
    v5->_dataItems = (NSArray *)v44;

  }
  return v5;
}

- (id)_stringForAction:(unint64_t)a3
{
  if (a3 > 5)
    return CFSTR("Unknown");
  else
    return off_24D36FF50[a3];
}

- (id)_stringForDataType:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("Unknown");
  else
    return off_24D36FF80[a3];
}

- (id)_generateGroupID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_opt_new();
  -[ANAnnouncement location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "addObject:", v5);
  -[ANAnnouncement location](self, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v3, "addObjectsFromArray:", v7);
  -[ANAnnouncement location](self, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "roomUUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v3, "addObjectsFromArray:", v9);
  -[ANAnnouncement _uuidFromUUIDs:](self, "_uuidFromUUIDs:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_uuidFromUUIDs:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  int8x16_t v15;
  _BYTE v16[128];
  int8x16_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v17 = 0uLL;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        v15 = 0uLL;
        objc_msgSend(v8, "getUUIDBytes:", &v15);
        v17 = veorq_s8(v17, v15);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v5);
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", &v17);

  return v9;
}

- (void)processAudioTranscription:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (processAudioTranscription__onceToken != -1)
    dispatch_once(&processAudioTranscription__onceToken, &__block_literal_global);
  if ((objc_msgSend((id)processAudioTranscription__recognizer, "supportsOnDeviceRecognition") & 1) != 0)
  {
    v5 = objc_alloc(MEMORY[0x24BDE9E48]);
    v6 = (void *)MEMORY[0x24BDBCF48];
    -[ANAnnouncement filePath](self, "filePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileURLWithPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v5, "initWithURL:", v8);

    objc_msgSend(v9, "setRequiresOnDeviceRecognition:", 1);
    objc_msgSend(v9, "setShouldReportPartialResults:", 0);
    v10 = (void *)processAudioTranscription__recognizer;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __44__ANAnnouncement_processAudioTranscription___block_invoke_83;
    v13[3] = &unk_24D36FF10;
    v13[4] = self;
    v14 = v4;
    v11 = (id)objc_msgSend(v10, "recognitionTaskWithRequest:resultHandler:", v9, v13);

  }
  else
  {
    ANLogHandleAnnouncement();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = &stru_24D370F00;
      _os_log_impl(&dword_2156FF000, v12, OS_LOG_TYPE_DEFAULT, "%@On device recognition not available, not processing", buf, 0xCu);
    }

    if (v4)
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __44__ANAnnouncement_processAudioTranscription___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDE9E40]);
  v1 = (void *)processAudioTranscription__recognizer;
  processAudioTranscription__recognizer = (uint64_t)v0;

}

void __44__ANAnnouncement_processAudioTranscription___block_invoke_83(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  ANAnnouncementDataItem *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  const __CFString *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  ANLogHandleAnnouncement();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "transcriptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412802;
    v24 = &stru_24D370F00;
    v25 = 2048;
    v26 = objc_msgSend(v8, "count");
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_2156FF000, v7, OS_LOG_TYPE_DEFAULT, "%@Received transcription result: (%lu transcriptions) %@", (uint8_t *)&v23, 0x20u);

  }
  if (v5)
    v9 = v6 == 0;
  else
    v9 = 0;
  v10 = v9;
  if (v5)
  {
    v11 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v5, "bestTranscription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "formattedString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithString:", v13);
    objc_msgSend(*(id *)(a1 + 32), "setTranscriptionText:", v14);

    objc_msgSend(*(id *)(a1 + 32), "transcriptionText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dataUsingEncoding:", 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = -[ANAnnouncementDataItem initWithData:type:]([ANAnnouncementDataItem alloc], "initWithData:type:", v16, 2);
    v18 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(*(id *)(a1 + 32), "dataItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "arrayWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "addObject:", v17);
    v21 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(*(id *)(a1 + 32), "setDataItems:", v21);

  }
  v22 = *(_QWORD *)(a1 + 40);
  if (v22)
    (*(void (**)(uint64_t, uint64_t))(v22 + 16))(v22, v10);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (ANLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (unint64_t)action
{
  return self->_action;
}

- (void)setAction:(unint64_t)a3
{
  self->_action = a3;
}

- (NSDate)playbackDeadline
{
  return self->_playbackDeadline;
}

- (void)setPlaybackDeadline:(id)a3
{
  objc_storeStrong((id *)&self->_playbackDeadline, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cmStartTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[7];
  return self;
}

- (void)setCmStartTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_cmStartTime.epoch = a3->var3;
  *(_OWORD *)&self->_cmStartTime.value = v3;
}

- (unint64_t)machStartTime
{
  return self->_machStartTime;
}

- (void)setMachStartTime:(unint64_t)a3
{
  self->_machStartTime = a3;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_filePath, a3);
}

- (ANSender)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  objc_storeStrong((id *)&self->_sender, a3);
}

- (int)productType
{
  return *(_QWORD *)&self->_productType;
}

- (void)setProductType:(int)a3
{
  *(_QWORD *)&self->_productType = *(_QWORD *)&a3;
}

- (unint64_t)productTypeOverride
{
  return self->_productTypeOverride;
}

- (void)setProductTypeOverride:(unint64_t)a3
{
  self->_productTypeOverride = a3;
}

- (int)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(int)a3
{
  self->_deviceClass = a3;
}

- (unint64_t)statusFlags
{
  return self->_statusFlags;
}

- (void)setStatusFlags:(unint64_t)a3
{
  self->_statusFlags = a3;
}

- (NSString)transcriptionText
{
  return self->_transcriptionText;
}

- (void)setTranscriptionText:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptionText, a3);
}

- (ANParticipant)announcer
{
  return self->_announcer;
}

- (void)setAnnouncer:(id)a3
{
  objc_storeStrong((id *)&self->_announcer, a3);
}

- (NSArray)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
  objc_storeStrong((id *)&self->_listeners, a3);
}

- (NSString)messageVersion
{
  return self->_messageVersion;
}

- (void)setMessageVersion:(id)a3
{
  objc_storeStrong((id *)&self->_messageVersion, a3);
}

- (NSArray)dataItems
{
  return self->_dataItems;
}

- (void)setDataItems:(id)a3
{
  objc_storeStrong((id *)&self->_dataItems, a3);
}

- (NSDate)receiptTimestamp
{
  return self->_receiptTimestamp;
}

- (NSDate)creationTimestamp
{
  return self->_creationTimestamp;
}

- (void)setCreationTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_creationTimestamp, a3);
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationTimestamp, 0);
  objc_storeStrong((id *)&self->_receiptTimestamp, 0);
  objc_storeStrong((id *)&self->_dataItems, 0);
  objc_storeStrong((id *)&self->_messageVersion, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_announcer, 0);
  objc_storeStrong((id *)&self->_transcriptionText, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_playbackDeadline, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
