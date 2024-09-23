@implementation ACCUserNotification

- (ACCUserNotification)init
{
  ACCUserNotification *v2;
  ACCUserNotification *v3;
  void *v4;
  uint64_t v5;
  NSString *uuid;
  NSString *title;
  NSString *message;
  NSString *defaultButtonName;
  NSString *otherButtonName;
  NSURL *iconURL;
  NSNumber *systemSoundID;
  NSString *identifier;
  NSString *groupIdentifier;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)ACCUserNotification;
  v2 = -[ACCUserNotification init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_userNotificationCF = 0;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = objc_claimAutoreleasedReturnValue();
    uuid = v3->_uuid;
    v3->_uuid = (NSString *)v5;

    v3->_type = 0;
    title = v3->_title;
    v3->_title = 0;

    message = v3->_message;
    v3->_message = 0;

    defaultButtonName = v3->_defaultButtonName;
    v3->_defaultButtonName = 0;

    otherButtonName = v3->_otherButtonName;
    v3->_otherButtonName = 0;

    iconURL = v3->_iconURL;
    v3->_iconURL = 0;

    *(_DWORD *)&v3->_isModal = 0;
    systemSoundID = v3->_systemSoundID;
    v3->_systemSoundID = 0;

    identifier = v3->_identifier;
    v3->_identifier = 0;

    groupIdentifier = v3->_groupIdentifier;
    v3->_groupIdentifier = 0;

  }
  return v3;
}

- (void)createBackingUserNotification
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[6];
  _QWORD v29[7];

  v29[6] = *MEMORY[0x24BDAC8D0];
  if (-[ACCUserNotification userNotificationCF](self, "userNotificationCF"))
    -[ACCUserNotification setUserNotificationCF:](self, "setUserNotificationCF:", 0);
  -[ACCUserNotification isModal](self, "isModal");
  v28[0] = *MEMORY[0x24BDBD6D8];
  -[ACCUserNotification title](self, "title");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = &stru_24D71B4F0;
  v29[0] = v5;
  v28[1] = *MEMORY[0x24BDBD6E0];
  -[ACCUserNotification message](self, "message");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = &stru_24D71B4F0;
  v29[1] = v8;
  v28[2] = *MEMORY[0x24BDBD6E8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v9;
  v28[3] = *MEMORY[0x24BEB0E40];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v10;
  v28[4] = *MEMORY[0x24BEB0E58];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ACCUserNotification dismissOnUnlock](self, "dismissOnUnlock") ^ 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v11;
  v28[5] = *MEMORY[0x24BEB0E88];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ACCUserNotification ignoreQuietMode](self, "ignoreQuietMode"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  -[ACCUserNotification defaultButtonName](self, "defaultButtonName");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[ACCUserNotification defaultButtonName](self, "defaultButtonName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    if (v18)
    {
      -[ACCUserNotification defaultButtonName](self, "defaultButtonName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v19, *MEMORY[0x24BDBD6F8]);

    }
  }
  -[ACCUserNotification otherButtonName](self, "otherButtonName");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    -[ACCUserNotification otherButtonName](self, "otherButtonName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "length");

    if (v23)
    {
      -[ACCUserNotification otherButtonName](self, "otherButtonName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v24, *MEMORY[0x24BDBD6F0]);

    }
  }
  -[ACCUserNotification systemSoundID](self, "systemSoundID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[ACCUserNotification systemSoundID](self, "systemSoundID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v26, *MEMORY[0x24BEB0EB0]);

  }
  if (-[ACCUserNotification presentViaSystemAperture](self, "presentViaSystemAperture"))
    objc_msgSend(v14, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BEB0EA8]);
  v27 = (void *)objc_msgSend(v14, "copy");
  -[ACCUserNotification setUserNotificationCFDict:](self, "setUserNotificationCFDict:", v27);

}

- (void)setUserNotificationCF:(__CFUserNotification *)a3
{
  __CFUserNotification *userNotificationCF;
  __CFUserNotification *v6;

  userNotificationCF = self->_userNotificationCF;
  if (userNotificationCF)
    CFRelease(userNotificationCF);
  if (a3)
    v6 = (__CFUserNotification *)CFRetain(a3);
  else
    v6 = 0;
  self->_userNotificationCF = v6;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)defaultButtonName
{
  return self->_defaultButtonName;
}

- (void)setDefaultButtonName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)otherButtonName
{
  return self->_otherButtonName;
}

- (void)setOtherButtonName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isModal
{
  return self->_isModal;
}

- (void)setIsModal:(BOOL)a3
{
  self->_isModal = a3;
}

- (BOOL)dismissOnUnlock
{
  return self->_dismissOnUnlock;
}

- (void)setDismissOnUnlock:(BOOL)a3
{
  self->_dismissOnUnlock = a3;
}

- (BOOL)ignoreQuietMode
{
  return self->_ignoreQuietMode;
}

- (void)setIgnoreQuietMode:(BOOL)a3
{
  self->_ignoreQuietMode = a3;
}

- (BOOL)presentViaSystemAperture
{
  return self->_presentViaSystemAperture;
}

- (void)setPresentViaSystemAperture:(BOOL)a3
{
  self->_presentViaSystemAperture = a3;
}

- (NSNumber)systemSoundID
{
  return self->_systemSoundID;
}

- (void)setSystemSoundID:(id)a3
{
  objc_storeStrong((id *)&self->_systemSoundID, a3);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDictionary)userNotificationCFDict
{
  return self->_userNotificationCFDict;
}

- (void)setUserNotificationCFDict:(id)a3
{
  objc_storeStrong((id *)&self->_userNotificationCFDict, a3);
}

- (__CFUserNotification)userNotificationCF
{
  return self->_userNotificationCF;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotificationCFDict, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_systemSoundID, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_otherButtonName, 0);
  objc_storeStrong((id *)&self->_defaultButtonName, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
