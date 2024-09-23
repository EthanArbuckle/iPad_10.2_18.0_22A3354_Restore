@implementation IDSAutoBugCapture

+ (void)triggerCaptureWithEvent:(int64_t)a3 destinations:(id)a4 context:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  id v20;
  const char *v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  id v26;
  const __CFString *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  double v35;
  void *v36;
  const char *v37;
  double v38;
  const char *v39;
  _QWORD v40[4];
  id v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_opt_class();
  if ((objc_msgSend_isSupported(v12, v13, v14, v15) & 1) != 0)
  {
    if (qword_1EE40AD70 != -1)
      dispatch_once(&qword_1EE40AD70, &unk_1E3C1B850);
    if (qword_1EE40AD78)
    {
      v16 = CFSTR("Unknown");
      v17 = CFSTR("Push Token");
      switch(a3)
      {
        case 200:
        case 201:
        case 202:
        case 203:
        case 204:
        case 205:
        case 210:
          v16 = CFSTR("Registration");
          goto LABEL_11;
        case 206:
LABEL_16:
          v27 = CFSTR("PushTokenChangedUnexpectedly");
          goto LABEL_33;
        case 207:
        case 209:
          v16 = CFSTR("System");
          goto LABEL_11;
        case 208:
          goto LABEL_11;
        case 211:
          goto LABEL_10;
        default:
          if ((unint64_t)(a3 - 100) < 8)
LABEL_10:
            v16 = CFSTR("Delivery");
LABEL_11:
          v17 = v16;
          v27 = CFSTR("Unknown");
          switch(a3)
          {
            case 200:
              v27 = CFSTR("RegistrationFailed");
              break;
            case 201:
              v27 = CFSTR("AccountStateError");
              break;
            case 202:
              v27 = CFSTR("ECKeyLoadingFailed");
              break;
            case 203:
              v27 = CFSTR("SMSQuotaExhausted");
              break;
            case 204:
              v27 = CFSTR("SMSTimeoutFailure");
              break;
            case 205:
              v27 = CFSTR("AttemptRateExceeded");
              break;
            case 206:
              goto LABEL_16;
            case 207:
              v27 = CFSTR("TooManyFileDescriptors");
              break;
            case 208:
              break;
            case 209:
              v27 = CFSTR("TooManyPortsAllocated");
              break;
            case 210:
              v27 = CFSTR("MissingKTAccountKey");
              break;
            case 211:
              v27 = CFSTR("ExcessiveQueryCacheEntries");
              break;
            default:
              switch(a3)
              {
                case 'd':
                  v27 = CFSTR("ECCEncryptionFailed");
                  break;
                case 'e':
                  v27 = CFSTR("ECCDecryptionFailed");
                  break;
                case 'f':
                  v27 = CFSTR("NiceRateLimited");
                  break;
                case 'g':
                  v27 = CFSTR("QueryRateLimited");
                  break;
                case 'h':
                  v27 = CFSTR("SecondaryEncryptionFailed");
                  break;
                case 'i':
                  v27 = CFSTR("SecondaryDecryptionFailed");
                  break;
                case 'j':
                  v27 = CFSTR("DifferedQueryCacheResults");
                  break;
                case 'k':
                  v27 = CFSTR("SenderKeyNotFound");
                  break;
                default:
                  goto LABEL_33;
              }
              break;
          }
LABEL_33:
          v28 = (void *)MEMORY[0x1E0CB3898];
          v26 = (id)qword_1EE40AD78;
          objc_msgSend_processInfo(v28, v29, v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_processName(v32, v33, v34, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_signatureWithDomain_type_subType_subtypeContext_detectedProcess_triggerThresholdValues_(v26, v37, (uint64_t)CFSTR("IDS"), v38, v17, v27, v10, v36, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = sub_19BA3F474;
          v40[3] = &unk_1E3C20AD8;
          v41 = v11;
          objc_msgSend_snapshotWithSignature_withIDSDestinations_validFor_delay_events_payload_actions_reply_(v26, v39, (uint64_t)v23, 0.0, v9, 0, 0, 0, v40, 0.0);
          v20 = v41;
          break;
      }
    }
    else
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v42 = *MEMORY[0x1E0CB2938];
      v43[0] = CFSTR("Failed to weak link SymptomDiagnosticReporter reporter");
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = 0;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(v19, v21, (uint64_t)v43, v22, &v42, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v18, v24, (uint64_t)CFSTR("IDSAutoBugCaptureErrorDomain"), v25, -100, v23);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, id))v11 + 2))(v11, 0, v26);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);
  }

}

+ (void)triggerCaptureWithEvent:(int64_t)a3 context:(id)a4 completion:(id)a5
{
  ((void (*)(id, char *, int64_t))MEMORY[0x1E0DE7D20])(a1, sel_triggerCaptureWithEvent_destinations_context_completion_, a3);
}

@end
