@implementation HandleExternalStorageDeviceManagerRequestAuthorization

uint64_t __HandleExternalStorageDeviceManagerRequestAuthorization_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int IsRunningInXCTest;
  int IsRunningInCameraOrDerivative;
  int IsInternalCommandLineTool;
  CFStringRef v6;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  int v12;
  void *ICAccessManagerClass;
  __CFString *v14;
  uint64_t v15;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[6];
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  xpc_connection_get_audit_token();
  v2 = *(_QWORD *)(a1 + 40);
  if (!*(_DWORD *)(v2 + 28))
  {
    v21 = 0u;
    v22 = 0u;
    IsRunningInXCTest = FigCaptureClientIsRunningInXCTest(&v21);
    v21 = 0u;
    v22 = 0u;
    IsRunningInCameraOrDerivative = FigCaptureClientIsRunningInCameraOrDerivative(&v21);
    v21 = 0u;
    v22 = 0u;
    IsInternalCommandLineTool = FigCaptureClientIsInternalCommandLineTool(&v21);
    v2 = *(_QWORD *)(a1 + 40);
    if (IsRunningInCameraOrDerivative || IsRunningInXCTest || IsInternalCommandLineTool)
    {
      *(_DWORD *)(v2 + 28) = 2;
    }
    else
    {
      v18 = 0u;
      v19 = 0u;
      pthread_mutex_lock(*(pthread_mutex_t **)v2);
      v21 = 0u;
      v22 = 0u;
      v6 = FigCaptureCopyClientCodeSigningIdentifier(&v21);
      if (v6)
      {
        v7 = (__CFString *)v6;
        v17 = 0;
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v6, 0, &v17);
        v9 = v8;
        if (!v8 || v17)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          FigSignalErrorAt();
        }
        else
        {
          v10 = objc_msgSend(v8, "localizedName");
          v20[0] = *MEMORY[0x1E0C9B800];
          *(_QWORD *)&v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CMCapture")), "localizedStringForKey:value:table:", CFSTR("SSD_APP_ACCESS_REQUEST_HEADER"), &stru_1E4928818, CFSTR("FigExternalStorageDeviceManagerServer")), v10);
          v20[1] = *MEMORY[0x1E0C9B810];
          *((_QWORD *)&v21 + 1) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CMCapture")), "localizedStringForKey:value:table:", CFSTR("SSD_APP_ACCESS_REQUEST_MESSAGE"), &stru_1E4928818, CFSTR("FigExternalStorageDeviceManagerServer"));
          v20[2] = *MEMORY[0x1E0C9B838];
          *(_QWORD *)&v22 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CMCapture")), "localizedStringForKey:value:table:", CFSTR("SSD_ALLOW_BUTTON"), &stru_1E4928818, CFSTR("FigExternalStorageDeviceManagerServer"));
          v20[3] = *MEMORY[0x1E0C9B830];
          *((_QWORD *)&v22 + 1) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CMCapture")), "localizedStringForKey:value:table:", CFSTR("SSD_DONT_ALLOW_BUTTON"), &stru_1E4928818, CFSTR("FigExternalStorageDeviceManagerServer"));
          v20[4] = *MEMORY[0x1E0C9B820];
          v11 = 1;
          v23 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
          v20[5] = *MEMORY[0x1E0DABBB0];
          v24 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
          v12 = objc_msgSend((id)getICAccessManagerClass(), "captureUserIntentForBundleIdentifier:withNotification:", v7, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, v20, 6));
          objc_msgSend((id)getICAccessManagerClass(), "addBundleIdentifier:", v7);
          ICAccessManagerClass = (void *)getICAccessManagerClass();
          if (v12)
          {
            v11 = 2;
            v14 = v7;
            v15 = 2;
          }
          else
          {
            v14 = v7;
            v15 = 1;
          }
          objc_msgSend(ICAccessManagerClass, "updateBundleIdentifier:accessType:withState:", v14, 1, v15);
          *(_DWORD *)(v2 + 28) = v11;
        }
        pthread_mutex_unlock(*(pthread_mutex_t **)v2);

        if (v9)
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        FigSignalErrorAt();
        pthread_mutex_unlock(*(pthread_mutex_t **)v2);
      }
      v2 = *(_QWORD *)(a1 + 40);
    }
  }
  *(_QWORD *)&v21 = 0;
  pthread_mutex_lock(*(pthread_mutex_t **)v2);
  if (!*(_BYTE *)(v2 + 24))
  {
    if (FigXPCCreateBasicMessage()
      || (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v2 + 28)),
          FigXPCMessageSetCFNumber()))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      xpc_connection_send_message(*(xpc_connection_t *)(v2 + 8), (xpc_object_t)v21);
    }
  }
  pthread_mutex_unlock(*(pthread_mutex_t **)v2);
  return FigXPCRelease();
}

@end
