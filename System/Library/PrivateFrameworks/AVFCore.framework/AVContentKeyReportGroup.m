@implementation AVContentKeyReportGroup

- (OpaqueFigContentKeySession)_figContentKeySession
{
  return self->_figContentKeySession;
}

- (AVContentKeyReportGroup)initWithKeySystem:(id)a3 keySession:(id)a4 contentKeyBoss:(OpaqueFigContentKeyBoss *)a5 useContentKeyBoss:(BOOL)a6 groupID:(unint64_t)a7 storageDirectoryAtURL:(id)a8
{
  AVContentKeyReportGroup *v13;
  NSObject *v14;
  int Session;
  BOOL v16;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  objc_super v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)AVContentKeyReportGroup;
  v13 = -[AVContentKeyReportGroup init](&v19, sel_init);
  if (v13)
  {
    v13->_contentKeySessionWeakReference = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", a4);
    v13->_cryptorsList = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13->_serialQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.avcontentkeyreportgroup", v14);
    v13->_keySystem = (NSString *)a3;
    v13->_weakContentKeyBoss = (OpaqueFigCFWeakReferenceHolder *)FigCFWeakReferenceHolderCreateWithReferencedObject();
    v13->_useContentKeyBoss = a6;
    if (a8)
    {
      v20 = *MEMORY[0x1E0CA3020];
      v21[0] = a8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    }
    v13->_groupID = a7;
    Session = FigContentKeySessionRemoteCreateSession();
    if (Session)
      v16 = 1;
    else
      v16 = dword_1EE2B0250 == 0;
    if (v16)
    {
      if (Session)
      {

        return 0;
      }
    }
    else
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return v13;
}

- (void)dealloc
{
  OpaqueFigContentKeySession *figContentKeySession;
  OpaqueFigCFWeakReferenceHolder *weakContentKeyBoss;
  objc_super v5;

  figContentKeySession = self->_figContentKeySession;
  if (figContentKeySession)
    CFRelease(figContentKeySession);

  weakContentKeyBoss = self->_weakContentKeyBoss;
  if (weakContentKeyBoss)
    CFRelease(weakContentKeyBoss);
  v5.receiver = self;
  v5.super_class = (Class)AVContentKeyReportGroup;
  -[AVContentKeyReportGroup dealloc](&v5, sel_dealloc);
}

- (OpaqueFigContentKeyBoss)_contentKeyBoss
{
  OpaqueFigContentKeyBoss *result;

  result = (OpaqueFigContentKeyBoss *)self->_weakContentKeyBoss;
  if (result)
    return (OpaqueFigContentKeyBoss *)FigCFWeakReferenceHolderCopyReferencedObject();
  return result;
}

- (id)_contentKeySession
{
  return -[AVWeakReference referencedObject](self->_contentKeySessionWeakReference, "referencedObject");
}

- (id)cryptorOptionsForIdentifier:(id)a3 initializationData:(id)a4 formatDescription:(opaqueCMFormatDescription *)a5 hlsMethod:(id)a6
{
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  CFTypeRef *p_cf;
  char v17;
  CFTypeRef cf;
  id v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;

  v21 = 0;
  v22 = 0;
  v19 = 0;
  v20 = 0;
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  cf = 0;
  if (a4)
  {
    avcks_decodeInitializationDataAndCopyInformation((uint64_t)a4, &v22, (uint64_t *)&v21, &v20, (uint64_t *)&v19, 0);
    if (v22)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0CA3060]);
    if (objc_msgSend(v19, "isEqual:", CFSTR("mpts")))
    {
      v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CA3038]);
    }
  }
  if (a3)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", a3, *MEMORY[0x1E0CA3030]);
  if (-[NSString isEqualToString:](self->_keySystem, "isEqualToString:", CFSTR("FairPlayStreaming")))
  {
    v13 = (_QWORD *)MEMORY[0x1E0CC3EB8];
  }
  else
  {
    if (!-[NSString isEqualToString:](self->_keySystem, "isEqualToString:", CFSTR("ClearKeySystem")))
      goto LABEL_13;
    v13 = (_QWORD *)MEMORY[0x1E0CC3EA8];
  }
  objc_msgSend(v11, "setObject:forKeyedSubscript:", *v13, *MEMORY[0x1E0CA3058]);
LABEL_13:
  v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CA3028]);
  if ((objc_msgSend(a6, "isEqual:", CFSTR("ISO_23001_7")) & 1) != 0)
  {
    p_cf = (CFTypeRef *)MEMORY[0x1E0CC3EC0];
LABEL_15:
    objc_msgSend(v11, "setObject:forKeyedSubscript:", *p_cf, *MEMORY[0x1E0CA3048]);
    goto LABEL_16;
  }
  v17 = objc_msgSend(a6, "isEqual:", CFSTR("SAMPLE-AES"));
  p_cf = (CFTypeRef *)MEMORY[0x1E0CC3EC8];
  if (!((unint64_t)a4 | (unint64_t)a5) || (v17 & 1) != 0)
    goto LABEL_15;
  if (!v22 && (unint64_t)a5 | v21)
  {
    if (v21)
      objc_msgSend((id)v21, "integerValue");
    else
      CMFormatDescriptionGetMediaSubType(a5);
    p_cf = &cf;
    if (!PKDCopyDecryptFormatTypeFromCodecType())
      goto LABEL_15;
    v11 = 0;
  }
LABEL_16:
  if (cf)
    CFRelease(cf);
  return v11;
}

- (void)failProcessingContentKeyRequestWithIdentifier:(id)a3 initializationData:(id)a4 error:(id)a5
{
  uint64_t v5;

  LOBYTE(v5) = 0;
  -[AVContentKeyRequest _setError:](-[AVContentKeyRequest initWithContentKeySession:reportGroup:identifier:contentIdentifier:keyIDFromInitializationData:initializationData:preloadingRequestOptions:providesPersistableKey:]([AVContentKeyRequest alloc], "initWithContentKeySession:reportGroup:identifier:contentIdentifier:keyIDFromInitializationData:initializationData:preloadingRequestOptions:providesPersistableKey:", -[AVContentKeyReportGroup _contentKeySession](self, "_contentKeySession"), self, a3, 0, 0, a4, 0, v5), "_setError:", a5);
}

- (id)_processContentKeyRequestWithIdentifier:(id)a3 contentIdentifier:(id)a4 keyIDFromInitializationData:(id)a5 initializationData:(id)a6 options:(id)a7
{
  uint64_t v7;
  AVContentKeyRequest *v11;
  OpaqueFigCPECryptor *v15;
  unsigned int (*v16)(OpaqueFigCPECryptor *, _QWORD, _QWORD, id *);
  int v17;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v22 = 0;
  if (!((unint64_t)a3 | (unint64_t)a6))
  {
    v19 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("identifier or initializationData must be valid"), (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, v7, v20), 0);
    objc_exception_throw(v19);
  }
  if (self->_isExpired)
  {
    v23 = *MEMORY[0x1E0C9AFA8];
    v24[0] = CFSTR("An expired content key session cannot process content key request");
    -[AVContentKeyReportGroup failProcessingContentKeyRequestWithIdentifier:initializationData:error:](self, "failProcessingContentKeyRequestWithIdentifier:initializationData:error:", a3, a6, AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11862, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1)));
    return 0;
  }
  else
  {
    v15 = -[AVContentKeyReportGroup copyCryptorForIdentifier:initializationData:](self, "copyCryptorForIdentifier:initializationData:", a3, a6);
    if (v15
      && ((v16 = *(unsigned int (**)(OpaqueFigCPECryptor *, _QWORD, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                            + 48)) == 0
       || v16(v15, *MEMORY[0x1E0CA31E8], *MEMORY[0x1E0C9AE00], &v22)
       || (v17 = objc_msgSend(v22, "intValue"), v22, v17 != 1)))
    {
      v11 = 0;
    }
    else
    {
      LOBYTE(v21) = 0;
      v11 = -[AVContentKeyRequest initWithContentKeySession:reportGroup:identifier:contentIdentifier:keyIDFromInitializationData:initializationData:preloadingRequestOptions:providesPersistableKey:]([AVContentKeyRequest alloc], "initWithContentKeySession:reportGroup:identifier:contentIdentifier:keyIDFromInitializationData:initializationData:preloadingRequestOptions:providesPersistableKey:", -[AVContentKeyReportGroup _contentKeySession](self, "_contentKeySession"), self, a3, a4, a5, a6, a7, v21);
      if (!v15)
        return v11;
    }
    CFRelease(v15);
  }
  return v11;
}

- (id)_processContentKeyRequestWithKeyRequestFromPSSH:(id)a3 decryptFormatType:(id)a4 initializationData:(id)a5 options:(id)a6
{
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CC49C0]), CFSTR("ProtocolVersionsKey"));
  if (objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0CC3EC0]))
    v12 = CFSTR("ISO_23001_7");
  else
    v12 = CFSTR("SAMPLE-AES");
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("HLSMethodKey"));
  v13 = *MEMORY[0x1E0CC49B8];
  v14 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CC49B8]), "base64EncodedStringWithOptions:", 0);
  return -[AVContentKeyReportGroup _processContentKeyRequestWithIdentifier:contentIdentifier:keyIDFromInitializationData:initializationData:options:](self, "_processContentKeyRequestWithIdentifier:contentIdentifier:keyIDFromInitializationData:initializationData:options:", v14, objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CC49B0]), objc_msgSend(a3, "objectForKeyedSubscript:", v13), a5, +[AVContentKeyRequest _mergePreloadingRequestOptions:withCreateKeyRequestOptions:](AVContentKeyRequest, "_mergePreloadingRequestOptions:withCreateKeyRequestOptions:", a6, v11));
}

- (void)processContentKeyRequestWithIdentifier:(id)a3 initializationData:(id)a4 options:(id)a5
{
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v19;
  signed int v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const __CFString *v25;
  void *v26;
  uint64_t v27;
  signed int v28;
  uint64_t v29;
  id v30;
  _QWORD v31[45];

  v31[42] = *MEMORY[0x1E0C80C00];
  v30 = 0;
  v31[0] = 0;
  v29 = 0;
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = -[AVContentKeyReportGroup _contentKeySession](self, "_contentKeySession");
  if (!v11)
  {
    v23 = (void *)MEMORY[0x1E0C99DA0];
    v24 = *MEMORY[0x1E0C99778];
    v25 = CFSTR("AVContentKeySession is nil");
    goto LABEL_22;
  }
  if (!((unint64_t)a3 | (unint64_t)a4))
  {
    v23 = (void *)MEMORY[0x1E0C99DA0];
    v24 = *MEMORY[0x1E0C99778];
    v25 = CFSTR("identifier or initializationData must be valid");
LABEL_22:
    v26 = (void *)objc_msgSend(v23, "exceptionWithName:reason:userInfo:", v24, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v25, v12, v13, v14, v15, v16, v27), 0);
    objc_exception_throw(v26);
  }
  v17 = v11;
  if (dword_1EE2B0250)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (self->_useContentKeyBoss)
  {
    objc_msgSend(v17, "_processContentKeyRequestWithIdentifier:initializationData:options:groupID:", a3, a4, a5, self->_groupID);
    v19 = 0;
    goto LABEL_7;
  }
  if (!a4)
    goto LABEL_13;
  avcks_decodeInitializationDataAndCopyInformation((uint64_t)a4, &v29, 0, 0, 0, v31);
  if (v31[0])
  {
    v20 = FigPKDParsePSSHAndCopyContentKeyInfo();
    if (v20)
    {
      v19 = 0;
LABEL_17:
      v22 = AVLocalizedErrorWithUnderlyingOSStatusAndUnderlyingError(v20, 0, 0, 1);
      if (v22)
        -[AVContentKeyReportGroup failProcessingContentKeyRequestWithIdentifier:initializationData:error:](self, "failProcessingContentKeyRequestWithIdentifier:initializationData:error:", a3, a4, v22);
      goto LABEL_7;
    }
  }
  if (v29)
  {
    v28 = PKDCopyDefaultKeyIDFromSinfArray();
    v19 = (void *)objc_msgSend(v30, "copy");
  }
  else
  {
LABEL_13:
    v19 = 0;
    v28 = 0;
  }
  v21 = -[AVContentKeyReportGroup _processContentKeyRequestWithIdentifier:contentIdentifier:keyIDFromInitializationData:initializationData:options:](self, "_processContentKeyRequestWithIdentifier:contentIdentifier:keyIDFromInitializationData:initializationData:options:", a3, v19, v30, a4, a5);
  if (v21)
    objc_msgSend(v10, "addObject:", v21);
  objc_msgSend(v17, "issueContentKeyRequests:forInitializationData:", v10, a4, v27);
  v20 = v28;
  if (v28)
    goto LABEL_17;
LABEL_7:

}

- (BOOL)_associateRequestWithGroupWithRequestID:(unint64_t)a3 error:(id *)a4
{
  OpaqueFigContentKeyBoss *v7;
  OpaqueFigContentKeyBoss *v8;
  unint64_t groupID;
  uint64_t (*v10)(OpaqueFigContentKeyBoss *, unint64_t, unint64_t);
  signed int v11;

  v7 = -[AVContentKeyReportGroup _contentKeyBoss](self, "_contentKeyBoss");
  if (!v7)
  {
    v11 = FigSignalErrorAt();
    if (!a4)
      return v11 == 0;
    goto LABEL_6;
  }
  v8 = v7;
  groupID = self->_groupID;
  v10 = *(uint64_t (**)(OpaqueFigContentKeyBoss *, unint64_t, unint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                + 80);
  if (v10)
    v11 = v10(v8, a3, groupID);
  else
    v11 = -12782;
  CFRelease(v8);
  if (a4)
  {
LABEL_6:
    if (v11)
      *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v11, 0);
  }
  return v11 == 0;
}

- (BOOL)associateContentKeyRequest:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (dword_1EE2B0250)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (self->_useContentKeyBoss)
    return -[AVContentKeyReportGroup _associateRequestWithGroupWithRequestID:error:](self, "_associateRequestWithGroupWithRequestID:error:", objc_msgSend(a3, "_requestID"), 0);
  else
    return objc_msgSend(a3, "setReportGroup:", self);
}

- (BOOL)_destroyContentKeyGroupWithError:(id *)a3
{
  OpaqueFigContentKeyBoss *v5;
  OpaqueFigContentKeyBoss *v6;
  unint64_t groupID;
  uint64_t (*v8)(OpaqueFigContentKeyBoss *, unint64_t);
  signed int v9;

  v5 = -[AVContentKeyReportGroup _contentKeyBoss](self, "_contentKeyBoss");
  if (!v5)
  {
    v9 = FigSignalErrorAt();
    if (!a3)
      return v9 == 0;
    goto LABEL_6;
  }
  v6 = v5;
  groupID = self->_groupID;
  v8 = *(uint64_t (**)(OpaqueFigContentKeyBoss *, unint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 72);
  if (v8)
    v9 = v8(v6, groupID);
  else
    v9 = -12782;
  CFRelease(v6);
  if (a3)
  {
LABEL_6:
    if (v9)
      *a3 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v9, 0);
  }
  return v9 == 0;
}

- (void)expire
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *serialQueue;
  _QWORD block[5];
  os_log_type_t type;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (dword_1EE2B0250)
  {
    v7 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__AVContentKeyReportGroup_expire__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

uint64_t __33__AVContentKeyReportGroup_expire__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 64))
  {
    v2 = result;
    *(_BYTE *)(v1 + 64) = 1;
    v3 = *(_QWORD *)(result + 32);
    if (*(_BYTE *)(v3 + 80))
    {
      return objc_msgSend((id)v3, "_destroyContentKeyGroupWithError:", 0);
    }
    else
    {
      v4 = *(_QWORD *)(v3 + 16);
      if (v4)
      {
        v5 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
        if (v5)
          v5(v4);
      }
      return objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 32), "removeAllObjects");
    }
  }
  return result;
}

- (NSData)contentProtectionSessionIdentifier
{
  return (NSData *)(id)-[NSData copy](self->_protectorSessionIdentifier, "copy");
}

- (OpaqueFigCPECryptor)createCryptorIfNecessaryForIdentifier:(id)a3 initializationData:(id)a4 formatDescription:(opaqueCMFormatDescription *)a5 hlsMethod:(id)a6 error:(id *)a7
{
  NSObject *serialQueue;
  signed int v14;
  const void *v15;
  OpaqueFigCPECryptor *v16;
  _QWORD block[11];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if (!-[NSString isEqualToString:](self->_keySystem, "isEqualToString:", CFSTR("AuthorizationTokenSystem")))
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __152__AVContentKeyReportGroup_AVContentKeyReportGroup_Internal__createCryptorIfNecessaryForIdentifier_initializationData_formatDescription_hlsMethod_error___block_invoke;
    block[3] = &unk_1E3035C30;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    block[7] = a6;
    block[8] = &v23;
    block[9] = &v19;
    block[10] = a5;
    dispatch_sync(serialQueue, block);
    v14 = *((_DWORD *)v24 + 6);
    if (v14)
    {
      if (a7)
        *a7 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v14, 0);
      v15 = (const void *)v20[3];
      if (v15)
      {
        CFRelease(v15);
        v20[3] = 0;
      }
    }
  }
  v16 = (OpaqueFigCPECryptor *)v20[3];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  return v16;
}

uint64_t __152__AVContentKeyReportGroup_AVContentKeyReportGroup_Internal__createCryptorIfNecessaryForIdentifier_initializationData_formatDescription_hlsMethod_error___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t);

  result = objc_msgSend(*(id *)(a1 + 32), "cryptorOptionsForIdentifier:initializationData:formatDescription:hlsMethod:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56));
  if (result)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    if (v3)
    {
      v4 = result;
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v6 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                            + 16)
                                                                                + 16);
      if (v6)
        result = v6(v3, *MEMORY[0x1E0C9AE00], v4, 1, v5 + 24);
      else
        result = 4294954514;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = result;
      if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
    }
    else
    {
      result = FigSignalErrorAt();
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = result;
    }
  }
  return result;
}

- (OpaqueFigCPECryptor)copyCryptorForIdentifier:(id)a3 initializationData:(id)a4
{
  NSObject *serialQueue;
  uint64_t *v8;
  const void *v9;
  OpaqueFigCPECryptor *v10;
  _QWORD block[9];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  if (-[NSString isEqualToString:](self->_keySystem, "isEqualToString:", CFSTR("AuthorizationTokenSystem")))
  {
    v8 = v14;
  }
  else
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __105__AVContentKeyReportGroup_AVContentKeyReportGroup_Internal__copyCryptorForIdentifier_initializationData___block_invoke;
    block[3] = &unk_1E3035C58;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    block[7] = &v17;
    block[8] = &v13;
    dispatch_sync(serialQueue, block);
    v8 = v14;
    if (*((_DWORD *)v18 + 6))
    {
      v9 = (const void *)v14[3];
      if (v9)
      {
        CFRelease(v9);
        v8 = v14;
        v14[3] = 0;
      }
    }
  }
  v10 = (OpaqueFigCPECryptor *)v8[3];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v10;
}

uint64_t __105__AVContentKeyReportGroup_AVContentKeyReportGroup_Internal__copyCryptorForIdentifier_initializationData___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, _QWORD, uint64_t, _QWORD, uint64_t);

  result = objc_msgSend(*(id *)(a1 + 32), "cryptorOptionsForIdentifier:initializationData:formatDescription:hlsMethod:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 0);
  if (result)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    if (v3)
    {
      v4 = result;
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v6 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                               + 16);
      if (v6)
        result = v6(v3, *MEMORY[0x1E0C9AE00], v4, 0, v5 + 24);
      else
        result = 4294954514;
    }
    else
    {
      result = FigSignalErrorAt();
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  }
  return result;
}

- (void)createProtectorSessionIdentifierIfNecessary
{
  NSObject *serialQueue;
  _QWORD block[7];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;

  if (!self->_useContentKeyBoss)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    v5 = 0;
    v6 = &v5;
    v7 = 0x2020000000;
    v8 = 0;
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __111__AVContentKeyReportGroup_AVContentKeyReportGroupPrivateUtilities__createProtectorSessionIdentifierIfNecessary__block_invoke;
    block[3] = &unk_1E3031A40;
    block[4] = self;
    block[5] = &v9;
    block[6] = &v5;
    dispatch_sync(serialQueue, block);
    if (!*((_DWORD *)v10 + 6))
    {
      if (*((_BYTE *)v6 + 24))
        objc_msgSend(-[AVContentKeyReportGroup _contentKeySession](self, "_contentKeySession"), "_handleContentProtectionSessionIdentifierDidChange:", self);
    }
    _Block_object_dispose(&v5, 8);
    _Block_object_dispose(&v9, 8);
  }
}

uint64_t __111__AVContentKeyReportGroup_AVContentKeyReportGroupPrivateUtilities__createProtectorSessionIdentifierIfNecessary__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, _QWORD, _QWORD, uint64_t);

  v1 = *(_QWORD *)(result + 32);
  v3 = *(_QWORD *)(v1 + 24);
  v2 = v1 + 24;
  if (!v3)
  {
    v4 = result;
    v5 = *(_QWORD *)(*(_QWORD *)(result + 32) + 16);
    if (v5)
    {
      v6 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
      if (v6)
        result = v6(v5, *MEMORY[0x1E0CA3098], *MEMORY[0x1E0C9AE00], v2);
      else
        result = 4294954514;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 40) + 8) + 24) = result;
      if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 40) + 8) + 24))
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v4 + 48) + 8) + 24) = 1;
    }
    else
    {
      result = FigSignalErrorAt();
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 40) + 8) + 24) = result;
    }
  }
  return result;
}

- (int)configureAppIdentifier:(id)a3
{
  OpaqueFigContentKeySession *figContentKeySession;
  uint64_t (*v6)(OpaqueFigContentKeySession *, _QWORD, id);

  if (self->_useContentKeyBoss)
    return 0;
  figContentKeySession = self->_figContentKeySession;
  if (!figContentKeySession)
    return FigSignalErrorAt();
  v6 = *(uint64_t (**)(OpaqueFigContentKeySession *, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 56);
  if (v6)
    return v6(figContentKeySession, *MEMORY[0x1E0CA3080], a3);
  else
    return -12782;
}

- (BOOL)_setAuthorizationToken:(id)a3 forIdentifier:(id)a4 error:(id *)a5
{
  NSObject *serialQueue;
  signed int v7;
  BOOL v8;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  serialQueue = self->_serialQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __111__AVContentKeyReportGroup_AVContentKeyReportGroupPrivateUtilities___setAuthorizationToken_forIdentifier_error___block_invoke;
  v10[3] = &unk_1E3035C80;
  v10[4] = self;
  v10[5] = a4;
  v10[6] = a3;
  v10[7] = &v11;
  dispatch_sync(serialQueue, v10);
  v7 = *((_DWORD *)v12 + 6);
  if (a5 && v7)
  {
    *a5 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v7, 0);
    v7 = *((_DWORD *)v12 + 6);
  }
  v8 = v7 == 0;
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __111__AVContentKeyReportGroup_AVContentKeyReportGroupPrivateUtilities___setAuthorizationToken_forIdentifier_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t result;

  v2 = *(_QWORD *)(a1[4] + 16);
  if (v2)
  {
    v3 = a1[5];
    v4 = a1[6];
    v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 72);
    if (v5)
      result = v5(v2, v3, v4);
    else
      result = 4294954514;
  }
  else
  {
    result = FigSignalErrorAt();
  }
  *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = result;
  return result;
}

- (BOOL)hasProtector
{
  OpaqueFigContentKeySession *figContentKeySession;
  uint64_t (*v3)(OpaqueFigContentKeySession *, _QWORD, _QWORD, _QWORD);
  int v4;
  uint64_t (*v7)(OpaqueFigContentKeySession *, _QWORD, _QWORD, _QWORD);

  v7 = 0;
  figContentKeySession = self->_figContentKeySession;
  if (figContentKeySession)
  {
    v3 = *(uint64_t (**)(OpaqueFigContentKeySession *, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                        + 48);
    if (v3)
    {
      v4 = v3(figContentKeySession, *MEMORY[0x1E0CA3090], *MEMORY[0x1E0C9AE00], &v7);
      v3 = v7;
    }
    else
    {
      v4 = -12782;
    }
  }
  else
  {
    v4 = FigSignalErrorAt();
    v3 = 0;
  }
  return !v4 && v3 == (uint64_t (*)(OpaqueFigContentKeySession *, _QWORD, _QWORD, _QWORD))*MEMORY[0x1E0C9AE50];
}

- (OpaqueFigCPECryptor)copyCryptorForCryptKeyAttributes:(id)a3
{
  OpaqueFigContentKeySession *figContentKeySession;
  void (*v5)(OpaqueFigContentKeySession *, _QWORD, id, _QWORD, OpaqueFigCPECryptor **);
  OpaqueFigCPECryptor *v7;

  v7 = 0;
  figContentKeySession = self->_figContentKeySession;
  if (figContentKeySession)
  {
    v5 = *(void (**)(OpaqueFigContentKeySession *, _QWORD, id, _QWORD, OpaqueFigCPECryptor **))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
    if (v5)
    {
      v5(figContentKeySession, *MEMORY[0x1E0C9AE00], a3, 0, &v7);
      return v7;
    }
  }
  else
  {
    FigSignalErrorAt();
  }
  return 0;
}

- (int)externalProtectionStatusForCryptor:(OpaqueFigCPECryptor *)a3 withDisplays:(id)a4
{
  OpaqueFigContentKeySession *figContentKeySession;
  void (*v7)(OpaqueFigContentKeySession *, OpaqueFigCPECryptor *, id, int *);
  int v9;

  v9 = 1;
  figContentKeySession = self->_figContentKeySession;
  if (figContentKeySession)
  {
    v7 = *(void (**)(OpaqueFigContentKeySession *, OpaqueFigCPECryptor *, id, int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                               + 88);
    if (v7)
    {
      v7(figContentKeySession, a3, a4, &v9);
      return v9;
    }
  }
  else
  {
    FigSignalErrorAt();
  }
  return 1;
}

@end
