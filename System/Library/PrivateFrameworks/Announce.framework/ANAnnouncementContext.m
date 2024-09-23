@implementation ANAnnouncementContext

- (ANAnnouncementContext)initWithDictionary:(id)a3
{
  id v4;
  ANAnnouncementContext *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  uint64_t v29;
  void *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  __CFString *v50;
  __CFString *v51;
  uint64_t v52;
  NSURL *announcementAudioURL;
  double v54;
  uint64_t v55;
  NSNumber *audioFileDuration;
  uint64_t v57;
  void *v58;
  __CFString *v59;
  uint64_t v60;
  void *v61;
  __CFString *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  NSURL *v66;
  NSObject *v67;
  NSString *announcementAudioPath;
  objc_super v70;
  uint8_t buf[4];
  const __CFString *v72;
  __int16 v73;
  NSURL *v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)ANAnnouncementContext;
  v5 = -[ANAnnouncementContext init](&v70, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AnnouncementID"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = &stru_24D370F00;
    objc_storeStrong((id *)&v5->_announcementID, v8);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("GroupID"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (__CFString *)v9;
    else
      v11 = &stru_24D370F00;
    objc_storeStrong((id *)&v5->_groupID, v11);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AnnouncerID"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (__CFString *)v12;
    else
      v14 = &stru_24D370F00;
    objc_storeStrong((id *)&v5->_announcerID, v14);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AnnouncerName"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (__CFString *)v15;
    else
      v17 = &stru_24D370F00;
    objc_storeStrong((id *)&v5->_announcerName, v17);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AnnouncerUserID"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      v20 = (__CFString *)v18;
    else
      v20 = &stru_24D370F00;
    objc_storeStrong((id *)&v5->_announcerUserID, v20);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AnnouncerUserUniqueID"));
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
      v23 = (__CFString *)v21;
    else
      v23 = &stru_24D370F00;
    objc_storeStrong((id *)&v5->_announcerUserUniqueID, v23);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AnnouncerIsAccessory"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
      LOBYTE(v24) = objc_msgSend(v24, "BOOLValue");
    v5->_announcerIsAccessory = (char)v24;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HomeName"));
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v26)
      v28 = (__CFString *)v26;
    else
      v28 = &stru_24D370F00;
    objc_storeStrong((id *)&v5->_homeName, v28);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HomeID"));
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    if (v29)
      v31 = (__CFString *)v29;
    else
      v31 = &stru_24D370F00;
    objc_storeStrong((id *)&v5->_homeID, v31);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ProductType"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ProductType"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v5->_productType = objc_msgSend(v33, "integerValue");

    }
    else
    {
      *(_QWORD *)&v5->_productType = -1;
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ProductTypeOverride"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ProductTypeOverride"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_productTypeOverride = objc_msgSend(v35, "unsignedIntegerValue");

    }
    else
    {
      v5->_productTypeOverride = 0;
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ServiceType"));
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)v36;
    if (v36)
      v38 = (__CFString *)v36;
    else
      v38 = &stru_24D370F00;
    objc_storeStrong((id *)&v5->_serviceType, v38);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DeviceClass"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DeviceClass"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_deviceClass = objc_msgSend(v40, "integerValue");

    }
    else
    {
      v5->_deviceClass = -1;
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Rooms"));
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = (void *)v41;
    v43 = (void *)MEMORY[0x24BDBD1B8];
    if (v41)
      v44 = (void *)v41;
    else
      v44 = (void *)MEMORY[0x24BDBD1B8];
    objc_storeStrong((id *)&v5->_rooms, v44);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Zones"));
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = (void *)v45;
    if (v45)
      v47 = (void *)v45;
    else
      v47 = v43;
    objc_storeStrong((id *)&v5->_zones, v47);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AudioFilePath"));
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = (void *)v48;
    if (v48)
      v50 = (__CFString *)v48;
    else
      v50 = &stru_24D370F00;
    v51 = v50;

    v52 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", v51);
    announcementAudioURL = v5->_announcementAudioURL;
    v5->_announcementAudioURL = (NSURL *)v52;

    objc_storeStrong((id *)&v5->_announcementAudioPath, v50);
    -[NSURL audioDuration](v5->_announcementAudioURL, "audioDuration");
    if (v54 != -1.0)
    {
      *(float *)&v54 = v54;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v54);
      v55 = objc_claimAutoreleasedReturnValue();
      audioFileDuration = v5->_audioFileDuration;
      v5->_audioFileDuration = (NSNumber *)v55;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Subtitle"));
    v57 = objc_claimAutoreleasedReturnValue();
    v58 = (void *)v57;
    if (v57)
      v59 = (__CFString *)v57;
    else
      v59 = &stru_24D370F00;
    objc_storeStrong((id *)&v5->_subtitle, v59);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TranscriptionText"));
    v60 = objc_claimAutoreleasedReturnValue();
    v61 = (void *)v60;
    if (v60)
      v62 = (__CFString *)v60;
    else
      v62 = &stru_24D370F00;
    objc_storeStrong((id *)&v5->_transcriptionText, v62);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Played"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v63)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Played"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_played = objc_msgSend(v64, "BOOLValue");

    }
    else
    {
      v5->_played = 0;
    }

    ANLogHandleAnnouncementContext();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      v66 = v5->_announcementAudioURL;
      *(_DWORD *)buf = 138412546;
      v72 = &stru_24D370F00;
      v73 = 2112;
      v74 = v66;
      _os_log_impl(&dword_2156FF000, v65, OS_LOG_TYPE_DEFAULT, "%@Announcement Context URL: %@", buf, 0x16u);
    }

    ANLogHandleAnnouncementContext();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      announcementAudioPath = v5->_announcementAudioPath;
      *(_DWORD *)buf = 138412546;
      v72 = &stru_24D370F00;
      v73 = 2112;
      v74 = (NSURL *)announcementAudioPath;
      _os_log_impl(&dword_2156FF000, v67, OS_LOG_TYPE_DEFAULT, "%@Announcement Context File Path: %@", buf, 0x16u);
    }

  }
  return v5;
}

+ (id)contextFromDictionary:(id)a3
{
  id v3;
  ANAnnouncementContext *v4;

  v3 = a3;
  v4 = -[ANAnnouncementContext initWithDictionary:]([ANAnnouncementContext alloc], "initWithDictionary:", v3);

  return v4;
}

+ (id)contextFromUserInfo:(id)a3
{
  id v3;
  ANAnnouncementContext *v4;

  v3 = a3;
  v4 = -[ANAnnouncementContext initWithUserInfo:]([ANAnnouncementContext alloc], "initWithUserInfo:", v3);

  return v4;
}

- (id)description
{
  void *v2;
  void *v3;

  -[ANAnnouncementContext contextDictionary](self, "contextDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDictionary)contextDictionary
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v3 = (void *)objc_opt_new();
  -[ANAnnouncementContext announcementID](self, "announcementID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("AnnouncementID"));

  -[ANAnnouncementContext groupID](self, "groupID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("GroupID"));

  -[ANAnnouncementContext announcerID](self, "announcerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("AnnouncerID"));

  -[ANAnnouncementContext announcerUserUniqueID](self, "announcerUserUniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("AnnouncerUserUniqueID"));

  -[ANAnnouncementContext announcerName](self, "announcerName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("AnnouncerName"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ANAnnouncementContext announcerIsAccessory](self, "announcerIsAccessory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("AnnouncerIsAccessory"));

  -[ANAnnouncementContext homeName](self, "homeName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("HomeName"));

  -[ANAnnouncementContext homeID](self, "homeID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("HomeID"));

  -[ANAnnouncementContext rooms](self, "rooms");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("Rooms"));

  -[ANAnnouncementContext zones](self, "zones");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("Zones"));

  -[ANAnnouncementContext announcementAudioPath](self, "announcementAudioPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("AudioFilePath"));

  -[ANAnnouncementContext announcementAudioURL](self, "announcementAudioURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("AudioFileURL"));

  -[ANAnnouncementContext audioFileDuration](self, "audioFileDuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("AudioFileDuration"));

  -[ANAnnouncementContext announcerUserID](self, "announcerUserID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("AnnouncerUserID"));

  -[ANAnnouncementContext subtitle](self, "subtitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("Subtitle"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -[ANAnnouncementContext productType](self, "productType"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("ProductType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[ANAnnouncementContext productTypeOverride](self, "productTypeOverride"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("ProductTypeOverride"));

  -[ANAnnouncementContext serviceType](self, "serviceType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("ServiceType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[ANAnnouncementContext deviceClass](self, "deviceClass"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("DeviceClass"));

  -[ANAnnouncementContext transcriptionText](self, "transcriptionText");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("TranscriptionText"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ANAnnouncementContext played](self, "played"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("Played"));

  v25 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v25;
}

- (BOOL)isEqualToContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;

  v4 = a3;
  -[ANAnnouncementContext announcementID](self, "announcementID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "announcementID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[ANAnnouncementContext groupID](self, "groupID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      -[ANAnnouncementContext announcerID](self, "announcerID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "announcerID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", v10))
      {
        -[ANAnnouncementContext announcerName](self, "announcerName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "announcerName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", v12))
        {
          v59 = v12;
          -[ANAnnouncementContext announcerUserID](self, "announcerUserID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "announcerUserID");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = v13;
          if (objc_msgSend(v13, "isEqualToString:"))
          {
            -[ANAnnouncementContext announcerUserUniqueID](self, "announcerUserUniqueID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "announcerUserUniqueID");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = v14;
            v15 = objc_msgSend(v14, "isEqualToString:");
            v12 = v59;
            if (v15)
            {
              v54 = v11;
              v16 = -[ANAnnouncementContext announcerIsAccessory](self, "announcerIsAccessory");
              if (v16 == objc_msgSend(v4, "announcerIsAccessory"))
              {
                -[ANAnnouncementContext homeName](self, "homeName");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "homeName");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = v18;
                if (objc_msgSend(v18, "isEqualToString:"))
                {
                  -[ANAnnouncementContext homeID](self, "homeID");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "homeID");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  v51 = v19;
                  if (objc_msgSend(v19, "isEqualToString:")
                    && (v20 = -[ANAnnouncementContext productType](self, "productType"),
                        v20 == objc_msgSend(v4, "productType"))
                    && (v21 = -[ANAnnouncementContext productTypeOverride](self, "productTypeOverride"),
                        v21 == objc_msgSend(v4, "productTypeOverride")))
                  {
                    -[ANAnnouncementContext serviceType](self, "serviceType");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v4, "serviceType");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    v49 = v22;
                    if (objc_msgSend(v22, "isEqualToString:")
                      && (v23 = -[ANAnnouncementContext deviceClass](self, "deviceClass"),
                          v23 == objc_msgSend(v4, "deviceClass")))
                    {
                      -[ANAnnouncementContext rooms](self, "rooms");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v4, "rooms");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v24, "isEqualToDictionary:"))
                      {
                        -[ANAnnouncementContext zones](self, "zones");
                        v25 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v4, "zones");
                        v45 = (void *)objc_claimAutoreleasedReturnValue();
                        v46 = v25;
                        if (objc_msgSend(v25, "isEqualToDictionary:"))
                        {
                          -[ANAnnouncementContext announcementAudioURL](self, "announcementAudioURL");
                          v26 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v4, "announcementAudioURL");
                          v43 = (void *)objc_claimAutoreleasedReturnValue();
                          v44 = v26;
                          if (objc_msgSend(v26, "isEqual:"))
                          {
                            -[ANAnnouncementContext announcementAudioPath](self, "announcementAudioPath");
                            v27 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v4, "announcementAudioPath");
                            v41 = (void *)objc_claimAutoreleasedReturnValue();
                            v42 = v27;
                            if (objc_msgSend(v27, "isEqualToString:"))
                            {
                              -[ANAnnouncementContext audioFileDuration](self, "audioFileDuration");
                              v28 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v4, "audioFileDuration");
                              v39 = (void *)objc_claimAutoreleasedReturnValue();
                              v40 = v28;
                              if (objc_msgSend(v28, "isEqualToNumber:"))
                              {
                                -[ANAnnouncementContext subtitle](self, "subtitle");
                                v29 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v4, "subtitle");
                                v37 = (void *)objc_claimAutoreleasedReturnValue();
                                v38 = v29;
                                if (objc_msgSend(v29, "isEqualToString:"))
                                {
                                  -[ANAnnouncementContext transcriptionText](self, "transcriptionText");
                                  v30 = objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v4, "transcriptionText");
                                  v31 = objc_claimAutoreleasedReturnValue();
                                  v36 = (void *)v30;
                                  v32 = (void *)v30;
                                  v33 = (void *)v31;
                                  if (objc_msgSend(v32, "isEqualToString:"))
                                  {
                                    v34 = -[ANAnnouncementContext played](self, "played");
                                    v17 = v34 ^ objc_msgSend(v4, "played") ^ 1;
                                  }
                                  else
                                  {
                                    LOBYTE(v17) = 0;
                                  }

                                }
                                else
                                {
                                  LOBYTE(v17) = 0;
                                }

                              }
                              else
                              {
                                LOBYTE(v17) = 0;
                              }

                            }
                            else
                            {
                              LOBYTE(v17) = 0;
                            }

                          }
                          else
                          {
                            LOBYTE(v17) = 0;
                          }

                        }
                        else
                        {
                          LOBYTE(v17) = 0;
                        }

                      }
                      else
                      {
                        LOBYTE(v17) = 0;
                      }

                      v11 = v54;
                      v12 = v59;
                    }
                    else
                    {
                      LOBYTE(v17) = 0;
                      v11 = v54;
                    }

                  }
                  else
                  {
                    LOBYTE(v17) = 0;
                    v11 = v54;
                  }

                }
                else
                {
                  LOBYTE(v17) = 0;
                  v11 = v54;
                }

              }
              else
              {
                LOBYTE(v17) = 0;
                v11 = v54;
              }
            }
            else
            {
              LOBYTE(v17) = 0;
            }

          }
          else
          {
            LOBYTE(v17) = 0;
            v12 = v59;
          }

        }
        else
        {
          LOBYTE(v17) = 0;
        }

      }
      else
      {
        LOBYTE(v17) = 0;
      }

    }
    else
    {
      LOBYTE(v17) = 0;
    }

  }
  else
  {
    LOBYTE(v17) = 0;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v4 = a3;
  -[ANAnnouncementContext announcementID](self, "announcementID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("AnnouncementID"));

  -[ANAnnouncementContext groupID](self, "groupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("GroupID"));

  -[ANAnnouncementContext announcerID](self, "announcerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("AnnouncerID"));

  -[ANAnnouncementContext announcerUserID](self, "announcerUserID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("AnnouncerUserID"));

  -[ANAnnouncementContext announcerUserUniqueID](self, "announcerUserUniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("AnnouncerUserUniqueID"));

  -[ANAnnouncementContext announcerName](self, "announcerName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("AnnouncerName"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ANAnnouncementContext announcerIsAccessory](self, "announcerIsAccessory"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("AnnouncerIsAccessory"));

  -[ANAnnouncementContext homeName](self, "homeName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("HomeName"));

  -[ANAnnouncementContext homeID](self, "homeID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("HomeID"));

  -[ANAnnouncementContext rooms](self, "rooms");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("Rooms"));

  -[ANAnnouncementContext zones](self, "zones");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("Zones"));

  -[ANAnnouncementContext announcementAudioURL](self, "announcementAudioURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("AudioFileURL"));

  -[ANAnnouncementContext announcementAudioPath](self, "announcementAudioPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("AudioFilePath"));

  -[ANAnnouncementContext audioFileDuration](self, "audioFileDuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("AudioFileDuration"));

  -[ANAnnouncementContext subtitle](self, "subtitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("Subtitle"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -[ANAnnouncementContext productType](self, "productType"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("ProductType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[ANAnnouncementContext productTypeOverride](self, "productTypeOverride"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("ProductTypeOverride"));

  -[ANAnnouncementContext serviceType](self, "serviceType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("ServiceType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[ANAnnouncementContext deviceClass](self, "deviceClass"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("DeviceClass"));

  -[ANAnnouncementContext transcriptionText](self, "transcriptionText");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("TranscriptionText"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ANAnnouncementContext played](self, "played"));
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, CFSTR("Played"));

}

- (ANAnnouncementContext)initWithCoder:(id)a3
{
  id v4;
  ANAnnouncementContext *v5;
  uint64_t v6;
  NSString *announcementID;
  uint64_t v8;
  NSString *groupID;
  uint64_t v10;
  NSString *announcerID;
  uint64_t v12;
  NSString *announcerName;
  uint64_t v14;
  NSString *announcerUserID;
  uint64_t v16;
  NSString *announcerUserUniqueID;
  void *v18;
  uint64_t v19;
  NSString *homeName;
  uint64_t v21;
  NSString *homeID;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSDictionary *rooms;
  uint64_t v28;
  NSDictionary *zones;
  uint64_t v30;
  NSURL *announcementAudioURL;
  uint64_t v32;
  NSString *announcementAudioPath;
  uint64_t v34;
  NSNumber *audioFileDuration;
  uint64_t v36;
  NSString *subtitle;
  void *v38;
  void *v39;
  uint64_t v40;
  NSString *serviceType;
  void *v42;
  uint64_t v43;
  NSString *transcriptionText;
  void *v45;
  objc_super v47;

  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)ANAnnouncementContext;
  v5 = -[ANAnnouncementContext init](&v47, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AnnouncementID"));
    v6 = objc_claimAutoreleasedReturnValue();
    announcementID = v5->_announcementID;
    v5->_announcementID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GroupID"));
    v8 = objc_claimAutoreleasedReturnValue();
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AnnouncerID"));
    v10 = objc_claimAutoreleasedReturnValue();
    announcerID = v5->_announcerID;
    v5->_announcerID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AnnouncerName"));
    v12 = objc_claimAutoreleasedReturnValue();
    announcerName = v5->_announcerName;
    v5->_announcerName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AnnouncerUserID"));
    v14 = objc_claimAutoreleasedReturnValue();
    announcerUserID = v5->_announcerUserID;
    v5->_announcerUserID = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AnnouncerUserUniqueID"));
    v16 = objc_claimAutoreleasedReturnValue();
    announcerUserUniqueID = v5->_announcerUserUniqueID;
    v5->_announcerUserUniqueID = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AnnouncerIsAccessory"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_announcerIsAccessory = objc_msgSend(v18, "BOOLValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HomeName"));
    v19 = objc_claimAutoreleasedReturnValue();
    homeName = v5->_homeName;
    v5->_homeName = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HomeID"));
    v21 = objc_claimAutoreleasedReturnValue();
    homeID = v5->_homeID;
    v5->_homeID = (NSString *)v21;

    v23 = (void *)MEMORY[0x24BDBCF20];
    v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("Rooms"));
    v26 = objc_claimAutoreleasedReturnValue();
    rooms = v5->_rooms;
    v5->_rooms = (NSDictionary *)v26;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("Zones"));
    v28 = objc_claimAutoreleasedReturnValue();
    zones = v5->_zones;
    v5->_zones = (NSDictionary *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AudioFileURL"));
    v30 = objc_claimAutoreleasedReturnValue();
    announcementAudioURL = v5->_announcementAudioURL;
    v5->_announcementAudioURL = (NSURL *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AudioFilePath"));
    v32 = objc_claimAutoreleasedReturnValue();
    announcementAudioPath = v5->_announcementAudioPath;
    v5->_announcementAudioPath = (NSString *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AudioFileDuration"));
    v34 = objc_claimAutoreleasedReturnValue();
    audioFileDuration = v5->_audioFileDuration;
    v5->_audioFileDuration = (NSNumber *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Subtitle"));
    v36 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProductType"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v5->_productType = objc_msgSend(v38, "unsignedIntValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProductTypeOverride"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_productTypeOverride = objc_msgSend(v39, "unsignedIntegerValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ServiceType"));
    v40 = objc_claimAutoreleasedReturnValue();
    serviceType = v5->_serviceType;
    v5->_serviceType = (NSString *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DeviceClass"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_deviceClass = objc_msgSend(v42, "integerValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TranscriptionText"));
    v43 = objc_claimAutoreleasedReturnValue();
    transcriptionText = v5->_transcriptionText;
    v5->_transcriptionText = (NSString *)v43;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Played"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_played = objc_msgSend(v45, "BOOLValue");

  }
  return v5;
}

- (NSString)announcementID
{
  return self->_announcementID;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (NSString)announcerID
{
  return self->_announcerID;
}

- (NSString)announcerName
{
  return self->_announcerName;
}

- (NSString)announcerUserUniqueID
{
  return self->_announcerUserUniqueID;
}

- (NSString)announcerUserID
{
  return self->_announcerUserID;
}

- (BOOL)announcerIsAccessory
{
  return self->_announcerIsAccessory;
}

- (NSString)homeName
{
  return self->_homeName;
}

- (NSString)homeID
{
  return self->_homeID;
}

- (int)productType
{
  return *(_QWORD *)&self->_productType;
}

- (unint64_t)productTypeOverride
{
  return self->_productTypeOverride;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (int)deviceClass
{
  return self->_deviceClass;
}

- (NSDictionary)rooms
{
  return self->_rooms;
}

- (NSDictionary)zones
{
  return self->_zones;
}

- (NSURL)announcementAudioURL
{
  return self->_announcementAudioURL;
}

- (NSString)announcementAudioPath
{
  return self->_announcementAudioPath;
}

- (NSNumber)audioFileDuration
{
  return self->_audioFileDuration;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)transcriptionText
{
  return self->_transcriptionText;
}

- (BOOL)played
{
  return self->_played;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptionText, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_audioFileDuration, 0);
  objc_storeStrong((id *)&self->_announcementAudioPath, 0);
  objc_storeStrong((id *)&self->_announcementAudioURL, 0);
  objc_storeStrong((id *)&self->_zones, 0);
  objc_storeStrong((id *)&self->_rooms, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_homeID, 0);
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_announcerUserID, 0);
  objc_storeStrong((id *)&self->_announcerUserUniqueID, 0);
  objc_storeStrong((id *)&self->_announcerName, 0);
  objc_storeStrong((id *)&self->_announcerID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_announcementID, 0);
}

@end
