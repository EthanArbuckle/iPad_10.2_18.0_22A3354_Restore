@implementation KVDonator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProvider, 0);
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_originAppId, 0);
}

+ (id)donatorWithItemType:(int64_t)a3 originAppId:(id)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;

  v7 = a4;
  v10 = sub_1B70ED318(a3, (char *)a5, v8, v9);
  if ((_DWORD)v10 == (unsigned __int16)*MEMORY[0x1E0D0D3D8])
  {
    v11 = 0;
  }
  else
  {
    v12 = v10;
    sub_1B70E8B9C(v7, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)objc_opt_class();
      objc_msgSend_donatorWithServiceProvider_isExternalClient_cascadeItemType_originAppId_userId_error_(v14, v15, 0, 1, v12, v13, 0, a5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

+ (id)donatorWithServiceProvider:(id)a3 isExternalClient:(BOOL)a4 cascadeItemType:(unsigned __int16)a5 originAppId:(id)a6 userId:(id)a7 error:(id *)a8
{
  uint64_t v9;
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  void *isExternalClient;

  v9 = a5;
  v10 = a4;
  v12 = a7;
  v13 = a6;
  v14 = a3;
  v15 = objc_alloc((Class)objc_opt_class());
  isExternalClient = (void *)objc_msgSend_initWithCascadeItemType_originAppId_userId_serviceProvider_isExternalClient_(v15, v16, v9, (uint64_t)v13, v12, v14, v10);

  return isExternalClient;
}

- (KVDonator)initWithCascadeItemType:(unsigned __int16)a3 originAppId:(id)a4 userId:(id)a5 serviceProvider:(id)a6 isExternalClient:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  KVDonator *v16;
  KVDonator *v17;
  objc_super v19;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)KVDonator;
  v16 = -[KVDonator init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_cascadeItemType = a3;
    objc_storeStrong((id *)&v16->_originAppId, a4);
    objc_storeStrong((id *)&v17->_userId, a5);
    objc_storeStrong((id *)&v17->_serviceProvider, a6);
    v17->_isExternalClient = a7;
  }

  return v17;
}

- (void)_donateWithOptions:(unsigned __int16)a3 version:(unint64_t)a4 validity:(id)a5 usingStream:(id)a6
{
  char v8;
  id v10;
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  NSString *userId;
  void *v22;
  id v23;
  id v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  const char *v31;
  void *v32;
  CCDonateServiceProvider *serviceProvider;
  uint64_t cascadeItemType;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  NSObject *v45;
  const char *v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t, void *, void *);
  void *v51;
  id v52;
  id v53;
  id v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  id v58;
  uint64_t v59;
  _QWORD v60[2];

  v8 = a3;
  v60[1] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v13 = a6;
  if (v13)
  {
    v17 = objc_msgSend_itemTypeFromCascadeItemType_(KVItemConverter, v11, self->_cascadeItemType, v12);
    if (self->_isExternalClient
      && (v18 = (void *)objc_opt_class(), (objc_msgSend__isXPCDonationEnabledForItemType_(v18, v19, v17, v20) & 1) == 0))
    {
      v35 = (void *)MEMORY[0x1E0CB35C8];
      v59 = *MEMORY[0x1E0CB2D50];
      v36 = (void *)MEMORY[0x1E0CB3940];
      if ((unsigned __int16)v17 - 1 >= 0x19)
        v37 = 0;
      else
        v37 = (unsigned __int16)v17;
      objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v14, (uint64_t)off_1E6B7ADF0[v37], 4);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v36, v39, (uint64_t)CFSTR("KVItemType: %@ not enabled for this device platform"), v40, v38);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = v41;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v42, (uint64_t)v60, (uint64_t)&v59, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v35, v44, (uint64_t)CFSTR("com.apple.koa.donate"), 8, v43);
      v23 = (id)objc_claimAutoreleasedReturnValue();

      v45 = qword_1ED114588;
      if (!os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
        goto LABEL_28;
      *(_DWORD *)buf = 136315394;
      v56 = "-[KVDonator _donateWithOptions:version:validity:usingStream:]";
      v57 = 2112;
      v58 = v23;
      v46 = "%s Rejecting donation: %@";
    }
    else
    {
      if (!self->_userId
        || !objc_msgSend_isSiriMUXSupported(KVAssistantServicesBridge, v14, v15, v16))
      {
        v27 = 0;
        v23 = 0;
        goto LABEL_11;
      }
      userId = self->_userId;
      v54 = 0;
      objc_msgSend_iCloudAltDSIDFromSharedUserId_error_(KVAssistantServicesBridge, v14, (uint64_t)userId, (uint64_t)&v54);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v54;
      if (v22)
      {
        v24 = objc_alloc(MEMORY[0x1E0D01CD8]);
        v27 = (void *)objc_msgSend_initWithAccountIdentifier_(v24, v25, (uint64_t)v22, v26);

LABEL_11:
        v29 = v23;
        v53 = v23;
        objc_msgSend__descriptorsForItemType_error_(self, v14, v17, (uint64_t)&v53);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v53;

        if (v30)
        {
          v48 = MEMORY[0x1E0C809B0];
          v49 = 3221225472;
          v50 = sub_1B70E913C;
          v51 = &unk_1E6B7AC58;
          v52 = v13;
          v32 = (void *)MEMORY[0x1BCCA2CD0](&v48);
          serviceProvider = self->_serviceProvider;
          cascadeItemType = self->_cascadeItemType;
          if ((v8 & 1) != 0)
          {
            if (serviceProvider)
              objc_msgSend_incrementalSetDonationWithItemType_forAccount_descriptors_version_validity_serviceProvider_completion_(MEMORY[0x1E0D0D420], v31, cascadeItemType, (uint64_t)v27, v30, a4, v10, v32, v48, v49, v50, v51);
            else
              objc_msgSend_incrementalSetDonationWithItemType_forAccount_descriptors_version_validity_completion_(MEMORY[0x1E0D0D420], v31, cascadeItemType, (uint64_t)v27, v30, a4, v10, v32);
          }
          else if (serviceProvider)
          {
            objc_msgSend_fullSetDonationWithItemType_forAccount_descriptors_serviceProvider_completion_(MEMORY[0x1E0D0D420], v31, cascadeItemType, (uint64_t)v27, v30, self->_serviceProvider, v32);
          }
          else
          {
            objc_msgSend_fullSetDonationWithItemType_forAccount_descriptors_completion_(MEMORY[0x1E0D0D420], v31, cascadeItemType, (uint64_t)v27, v30, v32);
          }

        }
        else
        {
          v47 = qword_1ED114588;
          if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v56 = "-[KVDonator _donateWithOptions:version:validity:usingStream:]";
            v57 = 2112;
            v58 = v23;
            _os_log_error_impl(&dword_1B70E7000, v47, OS_LOG_TYPE_ERROR, "%s Failed to resolve descriptors: %@", buf, 0x16u);
          }
          (*((void (**)(id, _QWORD, id))v13 + 2))(v13, 0, v23);
        }

        goto LABEL_33;
      }
      v45 = qword_1ED114588;
      if (!os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
      {
LABEL_28:
        (*((void (**)(id, _QWORD, id))v13 + 2))(v13, 0, v23);
LABEL_33:

        goto LABEL_34;
      }
      *(_DWORD *)buf = 136315394;
      v56 = "-[KVDonator _donateWithOptions:version:validity:usingStream:]";
      v57 = 2112;
      v58 = v23;
      v46 = "%s Failed to resolve account identifier: %@";
    }
    _os_log_error_impl(&dword_1B70E7000, v45, OS_LOG_TYPE_ERROR, v46, buf, 0x16u);
    goto LABEL_28;
  }
  v28 = qword_1ED114588;
  if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v56 = "-[KVDonator _donateWithOptions:version:validity:usingStream:]";
    _os_log_error_impl(&dword_1B70E7000, v28, OS_LOG_TYPE_ERROR, "%s streamBlock parameter is nil.", buf, 0xCu);
  }
LABEL_34:

}

- (void)donateWithOptions:(unsigned __int16)a3 usingStream:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel__donateWithOptions_version_validity_usingStream_, a3, 0);
}

- (id)_descriptorsForItemType:(int64_t)a3 error:(id *)a4
{
  void *v4;
  NSString *originAppId;
  void *v7;
  id v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C9AA60];
  if ((unint64_t)a3 <= 0x12 && ((1 << a3) & 0x44102) != 0)
  {
    originAppId = self->_originAppId;
    v14 = 0;
    objc_msgSend_sourceIdentifierWithValue_error_(MEMORY[0x1E0D0D418], a2, (uint64_t)originAppId, (uint64_t)&v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v14;
    v10 = v8;
    if (v7)
    {
      v15[0] = v7;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v9, (uint64_t)v15, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      sub_1B70E8948(v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (a4 && v11)
        *a4 = objc_retainAutorelease(v11);

      v4 = 0;
    }

  }
  return v4;
}

+ (void)initialize
{
  if (qword_1ED114580 != -1)
    dispatch_once(&qword_1ED114580, &unk_1E6B7B4A0);
}

+ (BOOL)_isXPCDonationEnabledForItemType:(int64_t)a3
{
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  LOBYTE(v5) = 0;
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 6:
    case 7:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 20:
    case 21:
    case 24:
    case 25:
      return v5;
    case 5:
    case 16:
      if ((objc_msgSend_isSiriUODSupported(KVAssistantServicesBridge, a2, a3, v3) & 1) != 0)
        LOBYTE(v5) = 1;
      else
        LOBYTE(v5) = MEMORY[0x1E0DE7D20](KVAssistantServicesBridge, sel_isASRSupported, v6, v7);
      break;
    case 8:
    case 9:
    case 17:
    case 18:
    case 19:
    case 22:
    case 23:
      LOBYTE(v5) = objc_msgSend_isSiriUODSupported(KVAssistantServicesBridge, a2, a3, v3);
      break;
    default:
      v8 = (void *)qword_1ED114588;
      v5 = os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR);
      if (v5)
      {
        v9 = v8;
        KVItemTypeDescription(a3, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 136315394;
        v14 = "+[KVDonator _isXPCDonationEnabledForItemType:]";
        v15 = 2112;
        v16 = v11;
        _os_log_error_impl(&dword_1B70E7000, v9, OS_LOG_TYPE_ERROR, "%s Unexpected itemType: %@", (uint8_t *)&v13, 0x16u);

        LOBYTE(v5) = 0;
      }
      break;
  }
  return v5;
}

- (KVDonator)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("init unsupported"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)donateWithOptions:(unsigned __int16)a3 version:(unint64_t)a4 validity:(id)a5 usingStream:(id)a6
{
  MEMORY[0x1E0DE7D20](self, sel__donateWithOptions_version_validity_usingStream_, a3, a4);
}

+ (id)donatorWithItemType:(int64_t)a3 originAppId:(id)a4 userId:(id)a5 error:(id *)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;

  v9 = a4;
  sub_1B70F084C(a5, (char *)a6, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 && (v15 = sub_1B70ED318(a3, (char *)a6, v12, v13), (_DWORD)v15 != (unsigned __int16)*MEMORY[0x1E0D0D3D8]))
  {
    v17 = v15;
    sub_1B70E8B9C(v9, a6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)objc_opt_class();
      objc_msgSend_donatorWithServiceProvider_isExternalClient_cascadeItemType_originAppId_userId_error_(v19, v20, 0, 1, v17, v18, v14, a6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)donatorWithItemType:(int64_t)a3 originAppId:(id)a4 deviceId:(id)a5 userId:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a6;
  v16 = (void *)objc_msgSend_copy(a5, v13, v14, v15);
  if (!objc_msgSend_length(v16, v17, v18, v19))
  {
    v28 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v20, (uint64_t)CFSTR("Invalid deviceId: \"%@\"), v22, v16, *MEMORY[0x1E0CB2D50]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v29;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v30, (uint64_t)v41, (uint64_t)&v40, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v28, v32, (uint64_t)CFSTR("com.apple.koa.donate"), 4, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (a7 && v33)
      *a7 = objc_retainAutorelease(v33);

    goto LABEL_10;
  }
  if (!v16)
  {
LABEL_10:
    v27 = 0;
    goto LABEL_16;
  }
  sub_1B70F084C(v12, (char *)a7, v21, v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25 && (v26 = sub_1B70ED318(a3, (char *)a7, v23, v24), (_DWORD)v26 != (unsigned __int16)*MEMORY[0x1E0D0D3D8]))
  {
    v35 = v26;
    sub_1B70E8B9C(v11, a7);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      v37 = (void *)objc_opt_class();
      objc_msgSend_donatorWithServiceProvider_isExternalClient_cascadeItemType_originAppId_userId_error_(v37, v38, 0, 1, v35, v36, v25, a7);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = 0;
    }

  }
  else
  {
    v27 = 0;
  }

LABEL_16:
  return v27;
}

+ (id)donatorWithServiceProvider:(id)a3 cascadeItemType:(unsigned __int16)a4 originAppId:(id)a5 userId:(id)a6 error:(id *)a7
{
  return (id)objc_msgSend_donatorWithServiceProvider_isExternalClient_cascadeItemType_originAppId_userId_error_(a1, a2, (uint64_t)a3, 0, a4, a5, a6, a7);
}

@end
