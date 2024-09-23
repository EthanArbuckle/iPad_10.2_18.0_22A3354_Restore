@implementation MOSettingsStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webContent, 0);
  objc_storeStrong((id *)&self->_userSafety, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_siri, 0);
  objc_storeStrong((id *)&self->_shield, 0);
  objc_storeStrong((id *)&self->_screenTime, 0);
  objc_storeStrong((id *)&self->_safari, 0);
  objc_storeStrong((id *)&self->_privacy, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_news, 0);
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_media, 0);
  objc_storeStrong((id *)&self->_managedSettings, 0);
  objc_storeStrong((id *)&self->_keyboard, 0);
  objc_storeStrong((id *)&self->_gameCenter, 0);
  objc_storeStrong((id *)&self->_findMy, 0);
  objc_storeStrong((id *)&self->_faceTime, 0);
  objc_storeStrong((id *)&self->_deviceActivity, 0);
  objc_storeStrong((id *)&self->_dateAndTime, 0);
  objc_storeStrong((id *)&self->_cellular, 0);
  objc_storeStrong((id *)&self->_carPlay, 0);
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_calculator, 0);
  objc_storeStrong((id *)&self->_appStore, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_allowedClient, 0);
  objc_storeStrong((id *)&self->_airDrop, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (id)initStore
{
  MOSettingsStore *v2;
  MOAccountSettingsGroup *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  MOAccountSettingsGroup *account;
  MOAirDropSettingsGroup *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  MOAirDropSettingsGroup *airDrop;
  MOAllowedClientSettingsGroup *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  MOAllowedClientSettingsGroup *allowedClient;
  MOApplicationSettingsGroup *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  MOApplicationSettingsGroup *application;
  MOAppStoreSettingsGroup *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  MOAppStoreSettingsGroup *appStore;
  MOCalculatorSettingsGroup *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  MOCalculatorSettingsGroup *calculator;
  MOCameraSettingsGroup *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  MOCameraSettingsGroup *camera;
  MOCarPlaySettingsGroup *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  MOCarPlaySettingsGroup *carPlay;
  MOCellularSettingsGroup *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  MOCellularSettingsGroup *cellular;
  MODateAndTimeSettingsGroup *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  MODateAndTimeSettingsGroup *dateAndTime;
  MODeviceActivitySettingsGroup *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  MODeviceActivitySettingsGroup *deviceActivity;
  MOFaceTimeSettingsGroup *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  MOFaceTimeSettingsGroup *faceTime;
  MOFindMySettingsGroup *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  MOFindMySettingsGroup *findMy;
  MOGameCenterSettingsGroup *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  MOGameCenterSettingsGroup *gameCenter;
  MOKeyboardSettingsGroup *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  MOKeyboardSettingsGroup *keyboard;
  MOManagedSettingsSettingsGroup *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  MOManagedSettingsSettingsGroup *managedSettings;
  MOMediaSettingsGroup *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  MOMediaSettingsGroup *media;
  MOMessagesSettingsGroup *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  MOMessagesSettingsGroup *messages;
  MONewsSettingsGroup *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  MONewsSettingsGroup *news;
  MONotificationSettingsGroup *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  MONotificationSettingsGroup *notification;
  MOPasscodeSettingsGroup *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  MOPasscodeSettingsGroup *passcode;
  MOPrivacySettingsGroup *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  MOPrivacySettingsGroup *privacy;
  MOSafariSettingsGroup *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  MOSafariSettingsGroup *safari;
  MOScreenTimeSettingsGroup *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  MOScreenTimeSettingsGroup *screenTime;
  MOShieldSettingsGroup *v123;
  void *v124;
  void *v125;
  uint64_t v126;
  MOShieldSettingsGroup *shield;
  MOSiriSettingsGroup *v128;
  void *v129;
  void *v130;
  uint64_t v131;
  MOSiriSettingsGroup *siri;
  MOUserSettingsGroup *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  MOUserSettingsGroup *user;
  MOUserSafetySettingsGroup *v138;
  void *v139;
  void *v140;
  uint64_t v141;
  MOUserSafetySettingsGroup *userSafety;
  MOWebContentSettingsGroup *v143;
  void *v144;
  void *v145;
  uint64_t v146;
  MOWebContentSettingsGroup *webContent;
  objc_super v149;

  v149.receiver = self;
  v149.super_class = (Class)MOSettingsStore;
  v2 = -[MOSettingsStore init](&v149, sel_init);
  v3 = [MOAccountSettingsGroup alloc];
  -[MOSettingsStore reader](v2, "reader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSettingsStore writer](v2, "writer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MOSettingsGroup initWithReader:writer:](v3, "initWithReader:writer:", v4, v5);
  account = v2->_account;
  v2->_account = (MOAccountSettingsGroup *)v6;

  v8 = [MOAirDropSettingsGroup alloc];
  -[MOSettingsStore reader](v2, "reader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSettingsStore writer](v2, "writer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MOSettingsGroup initWithReader:writer:](v8, "initWithReader:writer:", v9, v10);
  airDrop = v2->_airDrop;
  v2->_airDrop = (MOAirDropSettingsGroup *)v11;

  v13 = [MOAllowedClientSettingsGroup alloc];
  -[MOSettingsStore reader](v2, "reader");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSettingsStore writer](v2, "writer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MOSettingsGroup initWithReader:writer:](v13, "initWithReader:writer:", v14, v15);
  allowedClient = v2->_allowedClient;
  v2->_allowedClient = (MOAllowedClientSettingsGroup *)v16;

  v18 = [MOApplicationSettingsGroup alloc];
  -[MOSettingsStore reader](v2, "reader");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSettingsStore writer](v2, "writer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[MOSettingsGroup initWithReader:writer:](v18, "initWithReader:writer:", v19, v20);
  application = v2->_application;
  v2->_application = (MOApplicationSettingsGroup *)v21;

  v23 = [MOAppStoreSettingsGroup alloc];
  -[MOSettingsStore reader](v2, "reader");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSettingsStore writer](v2, "writer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[MOSettingsGroup initWithReader:writer:](v23, "initWithReader:writer:", v24, v25);
  appStore = v2->_appStore;
  v2->_appStore = (MOAppStoreSettingsGroup *)v26;

  v28 = [MOCalculatorSettingsGroup alloc];
  -[MOSettingsStore reader](v2, "reader");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSettingsStore writer](v2, "writer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[MOSettingsGroup initWithReader:writer:](v28, "initWithReader:writer:", v29, v30);
  calculator = v2->_calculator;
  v2->_calculator = (MOCalculatorSettingsGroup *)v31;

  v33 = [MOCameraSettingsGroup alloc];
  -[MOSettingsStore reader](v2, "reader");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSettingsStore writer](v2, "writer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[MOSettingsGroup initWithReader:writer:](v33, "initWithReader:writer:", v34, v35);
  camera = v2->_camera;
  v2->_camera = (MOCameraSettingsGroup *)v36;

  v38 = [MOCarPlaySettingsGroup alloc];
  -[MOSettingsStore reader](v2, "reader");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSettingsStore writer](v2, "writer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[MOSettingsGroup initWithReader:writer:](v38, "initWithReader:writer:", v39, v40);
  carPlay = v2->_carPlay;
  v2->_carPlay = (MOCarPlaySettingsGroup *)v41;

  v43 = [MOCellularSettingsGroup alloc];
  -[MOSettingsStore reader](v2, "reader");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSettingsStore writer](v2, "writer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = -[MOSettingsGroup initWithReader:writer:](v43, "initWithReader:writer:", v44, v45);
  cellular = v2->_cellular;
  v2->_cellular = (MOCellularSettingsGroup *)v46;

  v48 = [MODateAndTimeSettingsGroup alloc];
  -[MOSettingsStore reader](v2, "reader");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSettingsStore writer](v2, "writer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = -[MOSettingsGroup initWithReader:writer:](v48, "initWithReader:writer:", v49, v50);
  dateAndTime = v2->_dateAndTime;
  v2->_dateAndTime = (MODateAndTimeSettingsGroup *)v51;

  v53 = [MODeviceActivitySettingsGroup alloc];
  -[MOSettingsStore reader](v2, "reader");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSettingsStore writer](v2, "writer");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = -[MOSettingsGroup initWithReader:writer:](v53, "initWithReader:writer:", v54, v55);
  deviceActivity = v2->_deviceActivity;
  v2->_deviceActivity = (MODeviceActivitySettingsGroup *)v56;

  v58 = [MOFaceTimeSettingsGroup alloc];
  -[MOSettingsStore reader](v2, "reader");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSettingsStore writer](v2, "writer");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = -[MOSettingsGroup initWithReader:writer:](v58, "initWithReader:writer:", v59, v60);
  faceTime = v2->_faceTime;
  v2->_faceTime = (MOFaceTimeSettingsGroup *)v61;

  v63 = [MOFindMySettingsGroup alloc];
  -[MOSettingsStore reader](v2, "reader");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSettingsStore writer](v2, "writer");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = -[MOSettingsGroup initWithReader:writer:](v63, "initWithReader:writer:", v64, v65);
  findMy = v2->_findMy;
  v2->_findMy = (MOFindMySettingsGroup *)v66;

  v68 = [MOGameCenterSettingsGroup alloc];
  -[MOSettingsStore reader](v2, "reader");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSettingsStore writer](v2, "writer");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = -[MOSettingsGroup initWithReader:writer:](v68, "initWithReader:writer:", v69, v70);
  gameCenter = v2->_gameCenter;
  v2->_gameCenter = (MOGameCenterSettingsGroup *)v71;

  v73 = [MOKeyboardSettingsGroup alloc];
  -[MOSettingsStore reader](v2, "reader");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSettingsStore writer](v2, "writer");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = -[MOSettingsGroup initWithReader:writer:](v73, "initWithReader:writer:", v74, v75);
  keyboard = v2->_keyboard;
  v2->_keyboard = (MOKeyboardSettingsGroup *)v76;

  v78 = [MOManagedSettingsSettingsGroup alloc];
  -[MOSettingsStore reader](v2, "reader");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSettingsStore writer](v2, "writer");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = -[MOSettingsGroup initWithReader:writer:](v78, "initWithReader:writer:", v79, v80);
  managedSettings = v2->_managedSettings;
  v2->_managedSettings = (MOManagedSettingsSettingsGroup *)v81;

  v83 = [MOMediaSettingsGroup alloc];
  -[MOSettingsStore reader](v2, "reader");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSettingsStore writer](v2, "writer");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = -[MOSettingsGroup initWithReader:writer:](v83, "initWithReader:writer:", v84, v85);
  media = v2->_media;
  v2->_media = (MOMediaSettingsGroup *)v86;

  v88 = [MOMessagesSettingsGroup alloc];
  -[MOSettingsStore reader](v2, "reader");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSettingsStore writer](v2, "writer");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = -[MOSettingsGroup initWithReader:writer:](v88, "initWithReader:writer:", v89, v90);
  messages = v2->_messages;
  v2->_messages = (MOMessagesSettingsGroup *)v91;

  v93 = [MONewsSettingsGroup alloc];
  -[MOSettingsStore reader](v2, "reader");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSettingsStore writer](v2, "writer");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = -[MOSettingsGroup initWithReader:writer:](v93, "initWithReader:writer:", v94, v95);
  news = v2->_news;
  v2->_news = (MONewsSettingsGroup *)v96;

  v98 = [MONotificationSettingsGroup alloc];
  -[MOSettingsStore reader](v2, "reader");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSettingsStore writer](v2, "writer");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = -[MOSettingsGroup initWithReader:writer:](v98, "initWithReader:writer:", v99, v100);
  notification = v2->_notification;
  v2->_notification = (MONotificationSettingsGroup *)v101;

  v103 = [MOPasscodeSettingsGroup alloc];
  -[MOSettingsStore reader](v2, "reader");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSettingsStore writer](v2, "writer");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = -[MOSettingsGroup initWithReader:writer:](v103, "initWithReader:writer:", v104, v105);
  passcode = v2->_passcode;
  v2->_passcode = (MOPasscodeSettingsGroup *)v106;

  v108 = [MOPrivacySettingsGroup alloc];
  -[MOSettingsStore reader](v2, "reader");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSettingsStore writer](v2, "writer");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = -[MOSettingsGroup initWithReader:writer:](v108, "initWithReader:writer:", v109, v110);
  privacy = v2->_privacy;
  v2->_privacy = (MOPrivacySettingsGroup *)v111;

  v113 = [MOSafariSettingsGroup alloc];
  -[MOSettingsStore reader](v2, "reader");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSettingsStore writer](v2, "writer");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = -[MOSettingsGroup initWithReader:writer:](v113, "initWithReader:writer:", v114, v115);
  safari = v2->_safari;
  v2->_safari = (MOSafariSettingsGroup *)v116;

  v118 = [MOScreenTimeSettingsGroup alloc];
  -[MOSettingsStore reader](v2, "reader");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSettingsStore writer](v2, "writer");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = -[MOSettingsGroup initWithReader:writer:](v118, "initWithReader:writer:", v119, v120);
  screenTime = v2->_screenTime;
  v2->_screenTime = (MOScreenTimeSettingsGroup *)v121;

  v123 = [MOShieldSettingsGroup alloc];
  -[MOSettingsStore reader](v2, "reader");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSettingsStore writer](v2, "writer");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = -[MOSettingsGroup initWithReader:writer:](v123, "initWithReader:writer:", v124, v125);
  shield = v2->_shield;
  v2->_shield = (MOShieldSettingsGroup *)v126;

  v128 = [MOSiriSettingsGroup alloc];
  -[MOSettingsStore reader](v2, "reader");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSettingsStore writer](v2, "writer");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = -[MOSettingsGroup initWithReader:writer:](v128, "initWithReader:writer:", v129, v130);
  siri = v2->_siri;
  v2->_siri = (MOSiriSettingsGroup *)v131;

  v133 = [MOUserSettingsGroup alloc];
  -[MOSettingsStore reader](v2, "reader");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSettingsStore writer](v2, "writer");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = -[MOSettingsGroup initWithReader:writer:](v133, "initWithReader:writer:", v134, v135);
  user = v2->_user;
  v2->_user = (MOUserSettingsGroup *)v136;

  v138 = [MOUserSafetySettingsGroup alloc];
  -[MOSettingsStore reader](v2, "reader");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSettingsStore writer](v2, "writer");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = -[MOSettingsGroup initWithReader:writer:](v138, "initWithReader:writer:", v139, v140);
  userSafety = v2->_userSafety;
  v2->_userSafety = (MOUserSafetySettingsGroup *)v141;

  v143 = [MOWebContentSettingsGroup alloc];
  -[MOSettingsStore reader](v2, "reader");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSettingsStore writer](v2, "writer");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = -[MOSettingsGroup initWithReader:writer:](v143, "initWithReader:writer:", v144, v145);
  webContent = v2->_webContent;
  v2->_webContent = (MOWebContentSettingsGroup *)v146;

  return v2;
}

- (MOSettingsWriter)writer
{
  return 0;
}

- (MOShieldSettingsGroup)shield
{
  return self->_shield;
}

+ (id)loadSettingsAtURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t v16[16];
  id v17;
  id v18;

  v4 = a3;
  v18 = 0;
  objc_msgSend(a1, "loadDataAtURL:outError:", v4, &v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v18;
  v7 = v6;
  if (!v5)
  {
    objc_msgSend(v6, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      v13 = objc_msgSend(v7, "code");

      if (v13 == 260)
      {
        +[MOLogger store](MOLogger, "store");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v16 = 0;
          _os_log_impl(&dword_1B4020000, v10, OS_LOG_TYPE_DEFAULT, "No settings have been applied", v16, 2u);
        }
LABEL_14:
        v11 = 0;
        v9 = v7;
        goto LABEL_15;
      }
    }
    else
    {

    }
    +[MOLogger store](MOLogger, "store");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[MOSettingsStore loadSettingsAtURL:].cold.1();
    goto LABEL_14;
  }
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;

  v10 = objc_msgSend(v8, "mutableCopy");
  if (v10)
  {
    objc_msgSend(a1, "migrateSettingsIfNecessary:", v10);
    v10 = v10;
    v11 = v10;
  }
  else
  {
    +[MOLogger store](MOLogger, "store");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[MOSettingsStore loadSettingsAtURL:].cold.2();

    v11 = 0;
  }
LABEL_15:

  return v11;
}

+ (id)loadDataAtURL:(id)a3 outError:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a3, 2, a4);
}

- (MOUserSafetySettingsGroup)userSafety
{
  return self->_userSafety;
}

- (MOSettingsReader)reader
{
  return 0;
}

- (id)settingKeyFromSetting:(id)a3 group:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), a4, a3);
}

+ (NSDictionary)directoryAttributes
{
  if (directoryAttributes_onceToken != -1)
    dispatch_once(&directoryAttributes_onceToken, &__block_literal_global_2);
  return (NSDictionary *)(id)directoryAttributes_directoryAttributes;
}

void __38__MOSettingsStore_directoryAttributes__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB2A58];
  v4[0] = *MEMORY[0x1E0CB2A98];
  v4[1] = v0;
  v5[0] = CFSTR("mobile");
  v5[1] = CFSTR("mobile");
  v4[2] = *MEMORY[0x1E0CB2AA8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", 493);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)directoryAttributes_directoryAttributes;
  directoryAttributes_directoryAttributes = v2;

}

+ (NSDictionary)fileAttributes
{
  if (fileAttributes_onceToken != -1)
    dispatch_once(&fileAttributes_onceToken, &__block_literal_global_38);
  return (NSDictionary *)(id)fileAttributes_directoryAttributes;
}

void __33__MOSettingsStore_fileAttributes__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB2A58];
  v4[0] = *MEMORY[0x1E0CB2A98];
  v4[1] = v0;
  v5[0] = CFSTR("mobile");
  v5[1] = CFSTR("mobile");
  v4[2] = *MEMORY[0x1E0CB2AA8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", 420);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)fileAttributes_directoryAttributes;
  fileAttributes_directoryAttributes = v2;

}

+ (void)createSettingsDirectoryAtURL:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v4 = (void *)MEMORY[0x1E0CB3620];
  v5 = a3;
  objc_msgSend(v4, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "directoryAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v8 = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, v7, &v17);

  v9 = v17;
  if ((v8 & 1) == 0)
  {
    +[MOLogger store](MOLogger, "store");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[MOSettingsStore createSettingsDirectoryAtURL:].cold.1((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);

  }
}

+ (BOOL)saveSettings:(id)a3 toURL:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  NSObject *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E6768C20, CFSTR("version"));
  v26 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v7, 200, 0, &v26);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v26;
  if (v8)
  {
    objc_msgSend(v6, "path");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v10;
      _os_log_impl(&dword_1B4020000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Writing plist data to path: %{public}@", buf, 0xCu);
    }
    v25 = v9;
    v11 = objc_msgSend(v8, "writeToFile:options:error:", v10, 1, &v25);
    v12 = v25;

    if ((v11 & 1) == 0)
    {
      +[MOLogger store](MOLogger, "store");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        +[MOSettingsStore saveSettings:toURL:].cold.3();
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "fileAttributes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v12;
    v15 = objc_msgSend(v13, "setAttributes:ofItemAtPath:error:", v14, v10, &v24);
    v9 = v24;

    if ((v15 & 1) == 0)
    {
      +[MOLogger store](MOLogger, "store");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        +[MOSettingsStore saveSettings:toURL:].cold.2();
      v12 = v9;
LABEL_14:

      v9 = v12;
    }
  }
  else
  {
    +[MOLogger store](MOLogger, "store");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[MOSettingsStore saveSettings:toURL:].cold.1((uint64_t)v9, v10, v17, v18, v19, v20, v21, v22);
    v11 = 0;
  }

  return v11;
}

+ (void)migrateSettingsIfNecessary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("version"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "integerValue") == 1)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("allowedClient.allowedClient"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("deviceActivity.allowedClients"));

      v10 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("managedSettings.allowedClients"));

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("allowedClient.tokenKeys"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("managedSettings.tokenDecodingKeys"));
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("managedSettings.tokenEncodingKey"));

      objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("allowedClient.tokenKeys"));
    }

  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("version"));

}

- (id)metadataForSettingKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 2)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOSettingsStore valueForKey:](self, "valueForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v8 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "metadataForSetting:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)hasSensitiveDataInSettings:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD v7[5];

  objc_msgSend(a3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__MOSettingsStore_hasSensitiveDataInSettings___block_invoke;
  v7[3] = &unk_1E675E6B8;
  v7[4] = self;
  v5 = objc_msgSend(v4, "indexOfObjectPassingTest:", v7);

  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __46__MOSettingsStore_hasSensitiveDataInSettings___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "metadataForSettingKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPrivacySensitive");

  return v3;
}

- (MOAccountSettingsGroup)account
{
  return self->_account;
}

- (MOAirDropSettingsGroup)airDrop
{
  return self->_airDrop;
}

- (MOAllowedClientSettingsGroup)allowedClient
{
  return self->_allowedClient;
}

- (MOApplicationSettingsGroup)application
{
  return self->_application;
}

- (MOAppStoreSettingsGroup)appStore
{
  return self->_appStore;
}

- (MOCalculatorSettingsGroup)calculator
{
  return self->_calculator;
}

- (MOCameraSettingsGroup)camera
{
  return self->_camera;
}

- (MOCarPlaySettingsGroup)carPlay
{
  return self->_carPlay;
}

- (MOCellularSettingsGroup)cellular
{
  return self->_cellular;
}

- (MODateAndTimeSettingsGroup)dateAndTime
{
  return self->_dateAndTime;
}

- (MODeviceActivitySettingsGroup)deviceActivity
{
  return self->_deviceActivity;
}

- (MOFaceTimeSettingsGroup)faceTime
{
  return self->_faceTime;
}

- (MOFindMySettingsGroup)findMy
{
  return self->_findMy;
}

- (MOGameCenterSettingsGroup)gameCenter
{
  return self->_gameCenter;
}

- (MOKeyboardSettingsGroup)keyboard
{
  return self->_keyboard;
}

- (MOManagedSettingsSettingsGroup)managedSettings
{
  return self->_managedSettings;
}

- (MOMediaSettingsGroup)media
{
  return self->_media;
}

- (MOMessagesSettingsGroup)messages
{
  return self->_messages;
}

- (MONewsSettingsGroup)news
{
  return self->_news;
}

- (MONotificationSettingsGroup)notification
{
  return self->_notification;
}

- (MOPasscodeSettingsGroup)passcode
{
  return self->_passcode;
}

- (MOPrivacySettingsGroup)privacy
{
  return self->_privacy;
}

- (MOSafariSettingsGroup)safari
{
  return self->_safari;
}

- (MOScreenTimeSettingsGroup)screenTime
{
  return self->_screenTime;
}

- (MOSiriSettingsGroup)siri
{
  return self->_siri;
}

- (MOUserSettingsGroup)user
{
  return self->_user;
}

- (MOWebContentSettingsGroup)webContent
{
  return self->_webContent;
}

+ (void)createSettingsDirectoryAtURL:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1B4020000, a2, a3, "Unable to create settings directory: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

+ (void)loadSettingsAtURL:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B4020000, v0, v1, "Failed to read data from url: %{public}@ with error: %{public}@");
  OUTLINED_FUNCTION_8();
}

+ (void)loadSettingsAtURL:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B4020000, v0, v1, "Failed to deserialize data from url: %{public}@ with error: %{public}@");
  OUTLINED_FUNCTION_8();
}

+ (void)saveSettings:(uint64_t)a3 toURL:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1B4020000, a2, a3, "Failed to create plist data. error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

+ (void)saveSettings:toURL:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B4020000, v0, v1, "Failed to set attributes of file at path: %{public}@ error: %{public}@");
  OUTLINED_FUNCTION_8();
}

+ (void)saveSettings:toURL:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B4020000, v0, v1, "Failed to write plist data to path: %{public}@ error: %{public}@");
  OUTLINED_FUNCTION_8();
}

@end
