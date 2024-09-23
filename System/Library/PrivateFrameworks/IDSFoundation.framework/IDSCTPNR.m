@implementation IDSCTPNR

- (id)_initWithCoreTelephonyClient:(id)a3 SIM:(id)a4
{
  id v7;
  id v8;
  IDSCTPNR *v9;
  IDSCTPNR *v10;
  const char *v11;
  double v12;
  const char *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  NSString *labelID;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)IDSCTPNR;
  v9 = -[IDSCTPNR init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_contextLock._os_unfair_lock_opaque = 0;
    objc_storeStrong(&v9->_coreTelephonyClient, a3);
    objc_msgSend_setDelegate_(v7, v11, (uint64_t)v10, v12);
    objc_msgSend_SIMIdentifier(v8, v13, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    labelID = v10->_labelID;
    v10->_labelID = (NSString *)v16;

    v10->_carrierShortcodeSupported = -1;
  }

  return v10;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_labelID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("<%@: %p, labelID: %@>"), v10, v4, self, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (CTXPCServiceSubscriptionContext)context
{
  os_unfair_lock_s *p_contextLock;
  const char *v4;
  double v5;
  id context;
  id *p_context;
  id coreTelephonyClient;
  void *v9;
  const char *v10;
  uint64_t v11;
  id v12;
  double v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  double v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  const char *v27;
  double v28;
  int isEqualToString;
  const char *v30;
  uint64_t v31;
  double v32;
  NSObject *v33;
  id v34;
  id v35;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  p_contextLock = &self->_contextLock;
  os_unfair_lock_lock(&self->_contextLock);
  p_context = &self->_context;
  context = self->_context;
  if (!context)
  {
    coreTelephonyClient = self->_coreTelephonyClient;
    v43 = 0;
    objc_msgSend_getSubscriptionInfoWithError_(coreTelephonyClient, v4, (uint64_t)&v43, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v43;
    if (!v9)
    {
      objc_msgSend_sms(MEMORY[0x1E0D36AA8], v10, v11, v13);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_19BAF8DD4();

    }
    v38 = v9;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend_subscriptions(v9, v10, v11, 0.0, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v39, v17, v48, 16);
    if (v18)
    {
      v22 = v18;
      v23 = *(_QWORD *)v40;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v40 != v23)
            objc_enumerationMutation(v15);
          v25 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend_labelID(v25, v19, v20, v21);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v26, v27, (uint64_t)self->_labelID, v28);

          if (isEqualToString)
          {
            objc_storeStrong(&self->_context, v25);
            goto LABEL_16;
          }
        }
        v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v19, (uint64_t)&v39, v21, v48, 16);
        if (v22)
          continue;
        break;
      }
    }
LABEL_16:

    objc_msgSend_sms(MEMORY[0x1E0D36AA8], v30, v31, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = *p_context;
      *(_DWORD *)buf = 138412546;
      v45 = v34;
      v46 = 2112;
      v47 = v38;
      _os_log_impl(&dword_19B949000, v33, OS_LOG_TYPE_DEFAULT, "Finished loading context for PNR { context: %@, info: %@ }", buf, 0x16u);
    }

    context = *p_context;
  }
  v35 = context;
  os_unfair_lock_unlock(p_contextLock);
  return (CTXPCServiceSubscriptionContext *)v35;
}

- (void)setContext:(id)a3
{
  id v4;
  id context;

  v4 = a3;
  os_unfair_lock_lock(&self->_contextLock);
  context = self->_context;
  self->_context = v4;

  os_unfair_lock_unlock(&self->_contextLock);
}

- (id)_telephonyRequestForPushToken:(id)a3 phoneNumberValidationMechanism:(id)a4 attemptCount:(unsigned int)a5
{
  uint64_t v5;
  id v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  double v12;
  NSObject *v13;
  id v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  id v21;
  id v22;
  const char *v23;
  double v24;
  const char *v25;
  double v26;
  const char *v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  double v39;
  const char *v40;
  double v41;
  const char *v42;
  double v43;
  void *v44;
  const char *v45;
  double v46;
  int v48;
  id v49;
  uint64_t v50;

  v5 = *(_QWORD *)&a5;
  v50 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D36AA8];
  v9 = a3;
  objc_msgSend_sms(v8, v10, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v48 = 138412290;
    v49 = v7;
    _os_log_impl(&dword_19B949000, v13, OS_LOG_TYPE_DEFAULT, "Constructing phone number registration request { mechanism: %@ }", (uint8_t *)&v48, 0xCu);
  }

  v14 = objc_alloc_init(MEMORY[0x1E0CA6DC8]);
  objc_msgSend_setPushToken_(v14, v15, (uint64_t)v9, v16);

  objc_msgSend_setAttemptCount_(v14, v17, 0, v18);
  objc_msgSend_setPnrReqList_(v14, v19, 0, v20);
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = objc_alloc_init(MEMORY[0x1E0CA6DC0]);
  objc_msgSend_setSvcCenterAddr_(v22, v23, 0, v24);
  objc_msgSend_setDestAddr_(v22, v25, 0, v26);
  v30 = objc_msgSend_type(v7, v27, v28, v29);
  v34 = v30;
  if (v30 != 2)
  {
    if (v30 != 1)
      goto LABEL_8;
    objc_msgSend_context(v7, v31, v32, v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend_context(v7, v31, v36, v33);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDestAddr_(v22, v38, (uint64_t)v37, v39);

    }
  }
  objc_msgSend_setPnrMechanism_(v22, v31, v34, v33);
  objc_msgSend_addObject_(v21, v40, (uint64_t)v22, v41);
LABEL_8:
  if (objc_msgSend_count(v21, v31, v32, v33))
  {
    objc_msgSend_setPnrReqList_(v14, v42, (uint64_t)v21, v43);
  }
  else
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v42, v5, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAttemptCount_(v14, v45, (uint64_t)v44, v46);

  }
  return v14;
}

- (NSString)uniqueIdentifier
{
  return self->_labelID;
}

- (BOOL)isPNRSupported
{
  uint64_t v2;
  double v3;
  id coreTelephonyClient;
  void *v5;
  const char *v6;
  double v7;
  char isPNRSupported_outError;
  id v9;
  const char *v10;
  uint64_t v11;
  double v12;
  NSObject *v13;
  id v15;

  coreTelephonyClient = self->_coreTelephonyClient;
  objc_msgSend_context(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  isPNRSupported_outError = objc_msgSend_isPNRSupported_outError_(coreTelephonyClient, v6, (uint64_t)v5, v7, &v15);
  v9 = v15;

  if (v9)
  {
    objc_msgSend_sms(MEMORY[0x1E0D36AA8], v10, v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_19BAF8E34();

  }
  return isPNRSupported_outError;
}

- (BOOL)isSIMReady
{
  uint64_t v2;
  double v3;
  id coreTelephonyClient;
  void *v6;
  const char *v7;
  double v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  double v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  const char *v18;
  uint64_t v19;
  double v20;
  const __CFString *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  double v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  double v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  double v37;
  char isReady;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  coreTelephonyClient = self->_coreTelephonyClient;
  objc_msgSend_context(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  objc_msgSend_getPNRContext_outError_(coreTelephonyClient, v7, (uint64_t)v6, v8, &v40);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v40;

  if (v10)
  {
    objc_msgSend_sms(MEMORY[0x1E0D36AA8], v11, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_19BAF8E94();
  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v11, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend_isReady(v9, v15, v16, v17))
        v21 = CFSTR("YES");
      else
        v21 = CFSTR("NO");
      objc_msgSend_phoneNumber(v9, v18, v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imsi(v9, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_plmn(v9, v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_context(self, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v42 = v9;
      v43 = 2112;
      v44 = v21;
      v45 = 2112;
      v46 = v22;
      v47 = 2112;
      v48 = v26;
      v49 = 2112;
      v50 = v30;
      v51 = 2112;
      v52 = v34;
      _os_log_impl(&dword_19B949000, v14, OS_LOG_TYPE_DEFAULT, "Read telephony phone number registration context { PNRContext: %@, isReady: %@, phoneNumber: %@, IMSI: %@, PLMN: %@, subscriptionContext: %@ }", buf, 0x3Eu);

    }
  }

  isReady = objc_msgSend_isReady(v9, v35, v36, v37);
  return isReady;
}

- (unint64_t)slotID
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;

  objc_msgSend_context(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_slotID(v4, v5, v6, v7);

  if (v8)
    return v8 == 2;
  else
    return 2;
}

- (BOOL)userOptInRequired
{
  uint64_t v2;
  double v3;
  int64_t carrierShortcodeSupported;
  id coreTelephonyClient;
  void *v7;
  id v8;
  unsigned int v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  NSObject *v19;
  const __CFString *v20;
  int64_t v21;
  int v23;
  const __CFString *v24;
  __int16 v25;
  int64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  carrierShortcodeSupported = self->_carrierShortcodeSupported;
  if (carrierShortcodeSupported == -1)
  {
    coreTelephonyClient = self->_coreTelephonyClient;
    objc_msgSend_context(self, a2, v2, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0CA6D00]);
    v9 = 1;
    v12 = (void *)objc_msgSend_initWithBundleType_(v8, v10, 1, v11);
    v15 = (void *)objc_msgSend_copyCarrierBundleValue_key_bundleType_error_(coreTelephonyClient, v13, (uint64_t)v7, v14, CFSTR("RegistrationOptInRequired"), v12, 0);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = objc_msgSend_BOOLValue(v15, v16, v17, v18) ^ 1;
    self->_carrierShortcodeSupported = v9;
    objc_msgSend_sms(MEMORY[0x1E0D36AA8], v16, v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = CFSTR("YES");
      v21 = self->_carrierShortcodeSupported;
      if (v9)
        v20 = CFSTR("NO");
      v23 = 138412546;
      v24 = v20;
      v25 = 2048;
      v26 = v21;
      _os_log_impl(&dword_19B949000, v19, OS_LOG_TYPE_DEFAULT, "Determined if phone number registration opt-in is required by carrier bundle { optInRequired: %@, carrierShortcodeSupported: %ld }", (uint8_t *)&v23, 0x16u);
    }

    carrierShortcodeSupported = self->_carrierShortcodeSupported;
  }
  return carrierShortcodeSupported != 1;
}

- (IDSCTPNRInfo)PNRInfo
{
  uint64_t v2;
  double v3;
  id coreTelephonyClient;
  void *v6;
  const char *v7;
  double v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  double v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  const char *v18;
  uint64_t v19;
  double v20;
  const __CFString *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  double v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  double v33;
  void *v34;
  IDSCTPNRInfo *v35;
  const char *v36;
  uint64_t v37;
  double v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  double v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  double v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  double v50;
  void *v51;
  const char *v52;
  double v53;
  void *v54;
  id v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  const __CFString *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  coreTelephonyClient = self->_coreTelephonyClient;
  objc_msgSend_context(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  objc_msgSend_getPNRContext_outError_(coreTelephonyClient, v7, (uint64_t)v6, v8, &v56);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v56;

  if (v10)
  {
    objc_msgSend_sms(MEMORY[0x1E0D36AA8], v11, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_19BAF8EF4();
  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v11, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend_isReady(v9, v15, v16, v17))
        v21 = CFSTR("YES");
      else
        v21 = CFSTR("NO");
      objc_msgSend_phoneNumber(v9, v18, v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imsi(v9, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_plmn(v9, v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_context(self, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v58 = v9;
      v59 = 2112;
      v60 = v21;
      v61 = 2112;
      v62 = v22;
      v63 = 2112;
      v64 = v26;
      v65 = 2112;
      v66 = v30;
      v67 = 2112;
      v68 = v34;
      _os_log_impl(&dword_19B949000, v14, OS_LOG_TYPE_DEFAULT, "Read telephony phone number registration context { PNRContext: %@, isReady: %@, phoneNumber: %@, IMSI: %@, PLMN: %@, subscriptionContext: %@ }", buf, 0x3Eu);

    }
  }

  v35 = [IDSCTPNRInfo alloc];
  objc_msgSend_imsi(v9, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_plmn(v9, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_phoneNumber(v9, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_phoneNumberOnSIM(v9, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend_initWithIMSI_PLMN_PNRPhoneNumber_phoneBookNumber_(v35, v52, (uint64_t)v39, v53, v43, v47, v51);

  return (IDSCTPNRInfo *)v54;
}

- (BOOL)issuePNRForMechanism:(id)a3 pushToken:(id)a4 attemptCount:(unsigned int)a5 completion:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  id v14;
  double v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  double v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  double v39;
  void *v40;
  id coreTelephonyClient;
  NSObject *v42;
  const char *v43;
  double v44;
  BOOL v45;
  _QWORD v47[4];
  id v48;
  id v49;
  uint8_t buf[4];
  NSObject *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  NSObject *v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v7 = *(_QWORD *)&a5;
  v60 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v14 = a6;
  if (v14)
  {
    objc_msgSend_context(self, v12, v13, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_sms(MEMORY[0x1E0D36AA8], v17, v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v51 = v16;
      v52 = 2112;
      v53 = 0;
      _os_log_impl(&dword_19B949000, v20, OS_LOG_TYPE_DEFAULT, "Loaded subscription info for phone number registration request { context: %@, error: %@ }", buf, 0x16u);
    }

    if (v16 && self->_coreTelephonyClient)
    {
      objc_msgSend__telephonyRequestForPushToken_phoneNumberValidationMechanism_attemptCount_(self, v21, (uint64_t)v11, v23, v10, v7);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sms(MEMORY[0x1E0D36AA8], v25, v26, v27);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_pushToken(v24, v29, v30, v31);
        v32 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_attemptCount(v24, v33, v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pnrReqList(v24, v37, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v51 = v32;
        v52 = 2112;
        v53 = v36;
        v54 = 2112;
        v55 = v40;
        v56 = 2112;
        v57 = v16;
        v58 = 2112;
        v59 = v10;
        _os_log_impl(&dword_19B949000, v28, OS_LOG_TYPE_DEFAULT, "Issuing phone number registration request { pushToken: %@, attemptCount: %@, mechanisms: %@, context: %@, mechanism: %@ }", buf, 0x34u);

      }
      coreTelephonyClient = self->_coreTelephonyClient;
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = sub_19BA8F98C;
      v47[3] = &unk_1E3C218A8;
      v48 = v24;
      v49 = v14;
      v42 = v24;
      objc_msgSend_issuePNRRequest_pnrReqType_completion_(coreTelephonyClient, v43, (uint64_t)v16, v44, v42, v47);

      v45 = 1;
    }
    else
    {
      objc_msgSend_sms(MEMORY[0x1E0D36AA8], v21, v22, v23);
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
        sub_19BAF8FC0((uint64_t)self, (uint64_t)v16, v42);
      v45 = 0;
    }

  }
  else
  {
    objc_msgSend_sms(MEMORY[0x1E0D36AA8], v12, v13, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      sub_19BAF8F54();
    v45 = 0;
  }

  return v45;
}

- (BOOL)isRelevantContext:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  const char *v8;
  uint64_t v9;
  id v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  char isEqualToString;

  v4 = a3;
  objc_msgSend_context(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 == v4)
  {
    isEqualToString = 1;
  }
  else
  {
    objc_msgSend_labelID(v4, v8, v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v12, v13, (uint64_t)self->_labelID, v14);

  }
  return isEqualToString;
}

- (void)carrierBundleChange:(id)a3
{
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  double v11;

  if (objc_msgSend_isRelevantContext_(self, a2, (uint64_t)a3, v3))
  {
    objc_msgSend_sms(MEMORY[0x1E0D36AA8], v5, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_19BAF9050();

    objc_msgSend__resetCarrierShortcodeSupportedCachedValue(self, v9, v10, v11);
  }
}

- (void)operatorBundleChange:(id)a3
{
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  double v11;

  if (objc_msgSend_isRelevantContext_(self, a2, (uint64_t)a3, v3))
  {
    objc_msgSend_sms(MEMORY[0x1E0D36AA8], v5, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_19BAF90B0();

    objc_msgSend__resetCarrierShortcodeSupportedCachedValue(self, v9, v10, v11);
  }
}

- (void)_resetCarrierShortcodeSupportedCachedValue
{
  uint64_t v2;
  double v3;
  NSObject *v5;
  int64_t carrierShortcodeSupported;
  int v7;
  int64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend_sms(MEMORY[0x1E0D36AA8], a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    carrierShortcodeSupported = self->_carrierShortcodeSupported;
    v7 = 134217984;
    v8 = carrierShortcodeSupported;
    _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "Resetting cached carrier shortcode value { previousCarrierShortcodeSupportedValue: %ld }", (uint8_t *)&v7, 0xCu);
  }

  os_unfair_lock_lock(&self->_contextLock);
  self->_carrierShortcodeSupported = -1;
  os_unfair_lock_unlock(&self->_contextLock);
}

- (void)pnrReadyStateNotification:(id)a3 regState:(BOOL)a4
{
  double v4;
  _BOOL8 v5;
  const char *v7;
  double v8;
  id WeakRetained;

  v5 = a4;
  if (objc_msgSend_isRelevantContext_(self, a2, (uint64_t)a3, v4))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_PNRDelegate);
    objc_msgSend_PNRReadyStateChanged_(WeakRetained, v7, v5, v8);

  }
}

- (void)pnrRequestSent:(id)a3 pnrReqData:(id)a4
{
  const char *v6;
  double v7;
  id WeakRetained;
  const char *v9;
  double v10;
  id v11;

  v11 = a4;
  if (objc_msgSend_isRelevantContext_(self, v6, (uint64_t)a3, v7))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_PNRDelegate);
    objc_msgSend_PNRRequestSentWithRequestData_(WeakRetained, v9, (uint64_t)v11, v10);

  }
}

- (void)pnrResponseReceived:(id)a3 pnrRspData:(id)a4
{
  const char *v6;
  double v7;
  IDSCTPNRResponseData *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  void *v19;
  id WeakRetained;
  const char *v21;
  double v22;
  id v23;

  v23 = a4;
  if (objc_msgSend_isRelevantContext_(self, v6, (uint64_t)a3, v7))
  {
    v8 = [IDSCTPNRResponseData alloc];
    objc_msgSend_PNRInfo(self, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_phoneBookNumber(v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend_initWithCTResponse_phoneBookNumber_(v8, v17, (uint64_t)v23, v18, v16);

    WeakRetained = objc_loadWeakRetained((id *)&self->_PNRDelegate);
    objc_msgSend_PNRResponseReceivedWithResponseData_(WeakRetained, v21, (uint64_t)v19, v22);

  }
}

- (void)subscriptionInfoDidChange
{
  double v2;

  objc_msgSend_setContext_(self, a2, 0, v2);
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return (CoreTelephonyClient *)self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
  objc_storeStrong(&self->_coreTelephonyClient, a3);
}

- (NSString)labelID
{
  return self->_labelID;
}

- (void)setLabelID:(id)a3
{
  objc_storeStrong((id *)&self->_labelID, a3);
}

- (IDSCTPNRDelegate)PNRDelegate
{
  return (IDSCTPNRDelegate *)objc_loadWeakRetained((id *)&self->_PNRDelegate);
}

- (void)setPNRDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_PNRDelegate, a3);
}

- (int64_t)carrierShortcodeSupported
{
  return self->_carrierShortcodeSupported;
}

- (void)setCarrierShortcodeSupported:(int64_t)a3
{
  self->_carrierShortcodeSupported = a3;
}

- (os_unfair_lock_s)contextLock
{
  return self->_contextLock;
}

- (void)setContextLock:(os_unfair_lock_s)a3
{
  self->_contextLock = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_PNRDelegate);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_labelID, 0);
  objc_storeStrong(&self->_coreTelephonyClient, 0);
}

@end
