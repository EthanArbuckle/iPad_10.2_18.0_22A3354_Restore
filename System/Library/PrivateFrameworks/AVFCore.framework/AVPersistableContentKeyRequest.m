@implementation AVPersistableContentKeyRequest

- (NSData)persistableContentKeyFromKeyVendorResponse:(NSData *)keyVendorResponse options:(NSDictionary *)options error:(NSError *)outError
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSError *v12;
  NSData *result;
  OpaqueFigContentKeyBoss *v14;
  OpaqueFigContentKeyBoss *v15;
  unint64_t v16;
  uint64_t (*v17)(OpaqueFigContentKeyBoss *, unint64_t, NSData *, id *);
  signed int v18;
  OpaqueFigCPECryptor *v19;
  OpaqueFigCPECryptor *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t (*v24)(OpaqueFigCPECryptor *, NSData *, uint64_t);
  signed int v25;
  uint64_t (*v26)(OpaqueFigCPECryptor *, _QWORD, _QWORD, id *);
  NSError *v27;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[4];

  v38[1] = *MEMORY[0x1E0C80C00];
  v34 = 0;
  if (!keyVendorResponse)
  {
    v29 = (void *)MEMORY[0x1E0C99DA0];
    v30 = *MEMORY[0x1E0C99778];
    v31 = CFSTR("valid keyVendorResponse is required");
    goto LABEL_31;
  }
  if (-[AVContentKeyRequest status](self, "status", keyVendorResponse, options) >= AVContentKeyRequestStatusCancelled)
  {
    if (outError)
    {
      v37 = *MEMORY[0x1E0C9AFA8];
      v38[0] = CFSTR("content key request cancelled or already failed");
      v12 = (NSError *)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11862, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1));
      result = 0;
      *outError = v12;
      return result;
    }
    return 0;
  }
  if (!-[AVContentKeyRequest _requestID](self, "_requestID"))
  {
    v19 = -[AVContentKeyRequest figCryptor](self, "figCryptor");
    if (v19)
    {
      v20 = v19;
      v21 = *MEMORY[0x1E0C9AE50];
      v35 = *MEMORY[0x1E0CA4D78];
      v36 = v21;
      v22 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v23 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
      if (*v23 >= 4uLL)
      {
        v24 = (uint64_t (*)(OpaqueFigCPECryptor *, NSData *, uint64_t))v23[12];
        if (v24)
        {
          v25 = v24(v20, keyVendorResponse, v22);
          if (v25)
          {
LABEL_15:
            v18 = v25;
LABEL_19:
            v27 = 0;
            goto LABEL_20;
          }
          v26 = *(uint64_t (**)(OpaqueFigCPECryptor *, _QWORD, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                  + 8)
                                                                                      + 48);
          if (v26)
          {
            v25 = v26(v20, *MEMORY[0x1E0CA31F0], *MEMORY[0x1E0C9AE00], &v34);
            goto LABEL_15;
          }
        }
      }
      v27 = 0;
      v18 = -12782;
      goto LABEL_20;
    }
    v29 = (void *)MEMORY[0x1E0C99DA0];
    v30 = *MEMORY[0x1E0C99768];
    v31 = CFSTR("persistable content key cannot be created at this time");
LABEL_31:
    v32 = (void *)objc_msgSend(v29, "exceptionWithName:reason:userInfo:", v30, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v31, (uint64_t)options, (uint64_t)outError, v5, v6, v7, v33), 0);
    objc_exception_throw(v32);
  }
  v14 = -[AVContentKeyRequest _copyContentKeyBoss](self, "_copyContentKeyBoss");
  if (v14)
  {
    v15 = v14;
    v16 = -[AVContentKeyRequest _requestID](self, "_requestID");
    v17 = *(uint64_t (**)(OpaqueFigContentKeyBoss *, unint64_t, NSData *, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                + 24);
    if (v17)
      v18 = v17(v15, v16, keyVendorResponse, &v34);
    else
      v18 = -12782;
    CFRelease(v15);
    goto LABEL_19;
  }
  v27 = (NSError *)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11862, 0);
  v18 = 0;
LABEL_20:
  if (dword_1EE2B0250)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v18)
    v27 = (NSError *)AVLocalizedErrorWithUnderlyingOSStatus(v18, 0);
  if (v27)
  {
    if (outError)
    {
      result = 0;
      *outError = v27;
      return result;
    }
    return 0;
  }
  return (NSData *)v34;
}

@end
