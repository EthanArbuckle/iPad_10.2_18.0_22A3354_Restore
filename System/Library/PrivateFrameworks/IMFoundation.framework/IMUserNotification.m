@implementation IMUserNotification

- (id)_initWithIdentifier:(id)a3 timeout:(double)a4 displayFlags:(unint64_t)a5 displayInformation:(id)a6
{
  id v10;
  id v11;
  IMUserNotification *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  id reserved;
  objc_super v38;

  v10 = a3;
  v11 = a6;
  v38.receiver = self;
  v38.super_class = (Class)IMUserNotification;
  v12 = -[IMUserNotification init](&v38, sel_init);
  if (v12)
  {
    v13 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v17 = (void *)objc_msgSend_initWithDouble_(v13, v14, v15, v16, a4);
    v18 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v21 = (void *)objc_msgSend_initWithUnsignedInteger_(v18, v19, a5, v20);
    v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v25 = v22;
    if (v10)
      objc_msgSend_setObject_forKey_(v22, v23, (uint64_t)v10, (uint64_t)CFSTR("Identifier"));
    if (v17)
      objc_msgSend_setObject_forKey_(v25, v23, (uint64_t)v17, (uint64_t)CFSTR("Timeout"));
    if (v21)
      objc_msgSend_setObject_forKey_(v25, v23, (uint64_t)v21, (uint64_t)CFSTR("DisplayFlags"));
    if (v11)
    {
      objc_msgSend_objectForKey_(v11, v23, (uint64_t)CFSTR("IconURL"), v24);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28
        && (v29 = *MEMORY[0x1E0C9B848],
            objc_msgSend_objectForKey_(v11, v26, *MEMORY[0x1E0C9B848], v27),
            v30 = (void *)objc_claimAutoreleasedReturnValue(),
            v30,
            !v30))
      {
        v33 = (void *)objc_msgSend_mutableCopy(v11, v26, v31, v32);
        objc_msgSend_setObject_forKey_(v33, v34, (uint64_t)v28, v29);
        objc_msgSend_setObject_forKey_(v25, v35, (uint64_t)v33, (uint64_t)CFSTR("DisplayInformation"));

      }
      else
      {
        objc_msgSend_setObject_forKey_(v25, v26, (uint64_t)v11, (uint64_t)CFSTR("DisplayInformation"));
      }

    }
    reserved = v12->_reserved;
    v12->_reserved = v25;

  }
  return v12;
}

+ (id)userNotificationWithIdentifier:(id)a3 timeout:(double)a4 alertLevel:(unint64_t)a5 displayFlags:(unint64_t)a6 displayInformation:(id)a7
{
  id v12;
  id v13;
  id v14;
  const char *v15;
  void *v16;

  v12 = a7;
  v13 = a3;
  v14 = objc_alloc((Class)a1);
  v16 = (void *)objc_msgSend__initWithIdentifier_timeout_displayFlags_displayInformation_(v14, v15, (uint64_t)v13, a6 | a5, v12, a4);

  return v16;
}

+ (id)userNotificationWithIdentifier:(id)a3 title:(id)a4 message:(id)a5 defaultButton:(id)a6 alternateButton:(id)a7 otherButton:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  const char *v20;
  void *v21;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_opt_class();
  objc_msgSend_userNotificationWithIdentifier_title_message_defaultButton_defaultButtonStyle_alternateButton_alternateButtonStyle_otherButton_otherButtonStyle_(v19, v20, (uint64_t)v18, (uint64_t)v17, v16, v15, 0, v14, 0, v13, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)userNotificationWithIdentifier:(id)a3 title:(id)a4 message:(id)a5 defaultButton:(id)a6 defaultButtonStyle:(unint64_t)a7 alternateButton:(id)a8 alternateButtonStyle:(unint64_t)a9 otherButton:(id)a10 otherButtonStyle:(unint64_t)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  void *v38;
  id v40;
  id v41;

  v40 = a1;
  v41 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = a10;
  v21 = objc_alloc(MEMORY[0x1E0C99E08]);
  v24 = (void *)objc_msgSend_initWithCapacity_(v21, v22, 5, v23);
  if (!objc_msgSend_length(v20, v25, v26, v27) || objc_msgSend_length(v18, v28, v29, v30))
  {
    v31 = v20;
    v20 = v18;
    if (!v16)
      goto LABEL_5;
    goto LABEL_4;
  }

  v31 = 0;
  if (v16)
LABEL_4:
    objc_msgSend_setObject_forKey_(v24, v28, (uint64_t)v16, (uint64_t)CFSTR("AlertHeader"), v40);
LABEL_5:
  if (v17)
    objc_msgSend_setObject_forKey_(v24, v28, (uint64_t)v17, (uint64_t)CFSTR("AlertMessage"));
  if (v20)
    objc_msgSend_setObject_forKey_(v24, v28, (uint64_t)v20, (uint64_t)CFSTR("DefaultButtonTitle"));
  if (v19)
    objc_msgSend_setObject_forKey_(v24, v28, (uint64_t)v19, (uint64_t)CFSTR("AlternateButtonTitle"));
  if (v31)
    objc_msgSend_setObject_forKey_(v24, v28, (uint64_t)v31, (uint64_t)CFSTR("OtherButtonTitle"));
  if (a7)
  {
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v28, a7, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v24, v33, (uint64_t)v32, (uint64_t)CFSTR("SBUserNotificationDefaultButtonPresentationStyle"));

  }
  if (a9)
  {
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v28, a9, v30);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v24, v35, (uint64_t)v34, (uint64_t)CFSTR("SBUserNotificationAlternateButtonPresentationStyle"));

  }
  if (a11)
  {
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v28, a11, v30);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v24, v37, (uint64_t)v36, (uint64_t)CFSTR("SBUserNotificationOtherButtonPresentationStyle"));

  }
  objc_msgSend_userNotificationWithIdentifier_timeout_alertLevel_displayFlags_displayInformation_(v40, v28, (uint64_t)v41, 3, 0, v24, 0.0, v40);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (id)identifier
{
  uint64_t v2;

  return (id)objc_msgSend_objectForKey_(self->_reserved, a2, (uint64_t)CFSTR("Identifier"), v2);
}

- (double)timeout
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;

  objc_msgSend_objectForKey_(self->_reserved, a2, (uint64_t)CFSTR("Timeout"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v3, v4, v5, v6);
  v8 = v7;

  return v8;
}

- (unint64_t)displayFlags
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  objc_msgSend_objectForKey_(self->_reserved, a2, (uint64_t)CFSTR("DisplayFlags"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_unsignedIntegerValue(v3, v4, v5, v6);

  return v7;
}

- (NSDictionary)displayInformation
{
  uint64_t v2;

  return (NSDictionary *)objc_msgSend_objectForKey_(self->_reserved, a2, (uint64_t)CFSTR("DisplayInformation"), v2);
}

- (unint64_t)response
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_responseFlags(self, a2, v2, v3) & 3;
}

- (NSString)representedApplicationBundle
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend_displayInformation(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("ApplicationIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)showInLockScreen
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;

  objc_msgSend_displayInformation(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v4, v5, *MEMORY[0x1E0C9B820], v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_intValue(v7, v8, v9, v10) != 0;

  return v11;
}

- (void)setShowInLockScreen:(BOOL)a3
{
  uint64_t v3;
  _BOOL4 v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  CFMutableDictionaryRef Mutable;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  id reserved;
  CFAllocatorRef allocatora;
  CFAllocatorRef allocator;

  v4 = a3;
  objc_msgSend_displayInformation(self, a2, a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  allocatora = (CFAllocatorRef)objc_msgSend_mutableCopy(v6, v7, v8, v9);

  Mutable = allocatora;
  if (!allocatora)
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v12 = *MEMORY[0x1E0C9B820];
  allocator = Mutable;
  if (v4)
  {
    v13 = MEMORY[0x1E0C9AAB0];
    objc_msgSend_setObject_forKey_(Mutable, v10, MEMORY[0x1E0C9AAB0], v12);
    objc_msgSend_setObject_forKey_(allocator, v14, v13, (uint64_t)CFSTR("SBUserNotificationAllowInStark"));
  }
  else
  {
    objc_msgSend_removeObjectForKey_(Mutable, v10, v12, v12);
    objc_msgSend_removeObjectForKey_(allocator, v18, (uint64_t)CFSTR("SBUserNotificationAllowInStark"), v19);
  }
  v22 = objc_msgSend_count(allocator, v15, v16, v17);
  reserved = self->_reserved;
  if (v22)
    objc_msgSend_setObject_forKey_(reserved, v20, (uint64_t)allocator, (uint64_t)CFSTR("DisplayInformation"));
  else
    objc_msgSend_removeObjectForKey_(reserved, v20, (uint64_t)CFSTR("DisplayInformation"), v21);

}

- (BOOL)usesNotificationCenter
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;

  objc_msgSend_objectForKey_(self->_reserved, a2, (uint64_t)CFSTR("UsesNotificationCenter"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_intValue(v3, v4, v5, v6) != 0;

  return v7;
}

- (BOOL)requireUserInteraction
{
  return 1;
}

- (NSDictionary)userInfo
{
  uint64_t v2;

  return (NSDictionary *)objc_msgSend_objectForKey_(self->_reserved, a2, (uint64_t)CFSTR("UserInfo"), v2);
}

- (void)setUserInfo:(id)a3
{
  uint64_t v3;
  id reserved;

  reserved = self->_reserved;
  if (a3)
    objc_msgSend_setObject_forKey_(reserved, a2, (uint64_t)a3, (uint64_t)CFSTR("UserInfo"));
  else
    objc_msgSend_removeObjectForKey_(reserved, a2, (uint64_t)CFSTR("UserInfo"), v3);
}

- (unint64_t)responseFlags
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  objc_msgSend_objectForKey_(self->_reserved, a2, (uint64_t)CFSTR("ResponseFlags"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_unsignedIntegerValue(v3, v4, v5, v6);

  return v7;
}

- (NSDictionary)responseInformation
{
  uint64_t v2;

  return (NSDictionary *)objc_msgSend_objectForKey_(self->_reserved, a2, (uint64_t)CFSTR("ResponseInformation"), v2);
}

- (void)_setResponseFlags:(unint64_t)a3 responseInformation:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  id v11;

  v11 = a4;
  v6 = objc_alloc(MEMORY[0x1E0CB37E8]);
  v10 = (void *)objc_msgSend_initWithUnsignedInteger_(v6, v7, a3, v8);
  if (v10)
    objc_msgSend_setObject_forKey_(self->_reserved, v9, (uint64_t)v10, (uint64_t)CFSTR("ResponseFlags"));
  if (v11)
    objc_msgSend_setObject_forKey_(self->_reserved, v9, (uint64_t)v11, (uint64_t)CFSTR("ResponseInformation"));

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reserved, 0);
}

@end
