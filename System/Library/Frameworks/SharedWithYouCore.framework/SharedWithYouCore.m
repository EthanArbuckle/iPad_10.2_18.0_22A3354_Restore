id SWFrameworkBundle()
{
  if (SWFrameworkBundle_onceToken != -1)
    dispatch_once(&SWFrameworkBundle_onceToken, &__block_literal_global);
  return (id)SWFrameworkBundle_sBundle;
}

id SWCoreFrameworkBundle()
{
  if (SWCoreFrameworkBundle_onceToken != -1)
    dispatch_once(&SWCoreFrameworkBundle_onceToken, &__block_literal_global_10);
  return (id)SWCoreFrameworkBundle_sBundle;
}

void sub_18B620EA0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B621004(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

id SWFileProviderCollaborationProvidingInterface()
{
  if (SWFileProviderCollaborationProvidingInterface_once != -1)
    dispatch_once(&SWFileProviderCollaborationProvidingInterface_once, &__block_literal_global_0);
  return (id)SWFileProviderCollaborationProvidingInterface_interface;
}

id SWFileProviderCollaborationProvidingInterfaceEntitled()
{
  if (SWFileProviderCollaborationProvidingInterfaceEntitled_once != -1)
    dispatch_once(&SWFileProviderCollaborationProvidingInterfaceEntitled_once, &__block_literal_global_120);
  return (id)SWFileProviderCollaborationProvidingInterfaceEntitled_interface;
}

void SWCollaborationMetadataForDocumentURL(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a1;
  v4 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __SWCollaborationMetadataForDocumentURL_block_invoke;
  v7[3] = &unk_1E217B1F0;
  v8 = v3;
  v9 = v4;
  v5 = v3;
  v6 = v4;
  withServiceProxy(v5, CFSTR("com.apple.SocialServices.MessagesCollaborationService"), v7);

}

void withServiceProxy(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = a1;
  v8 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __withServiceProxy_block_invoke;
  v11[3] = &unk_1E217B288;
  v12 = v5;
  v13 = v6;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v8, "synchronouslyGetFileProviderServiceWithName:forItemAtURL:completionHandler:", v9, v7, v11);

}

void SWPerformActionForDocumentURL(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __SWPerformActionForDocumentURL_block_invoke;
  v11[3] = &unk_1E217B218;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v8 = v6;
  v9 = v5;
  v10 = v7;
  withServiceProxy(v9, CFSTR("com.apple.SocialServices.MessagesCollaborationService.Entitled"), v11);

}

void __withServiceProxy_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if (v5)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __withServiceProxy_block_invoke_2;
    v9[3] = &unk_1E217B260;
    v10 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v5, "getFileProviderConnectionWithCompletionHandler:", v9);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    FPNotSupportedError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

  }
}

void __withServiceProxy_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.SocialServices.MessagesCollaborationService.Entitled")))SWFileProviderCollaborationProvidingInterfaceEntitled();
  else
    SWFileProviderCollaborationProvidingInterface();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRemoteObjectInterface:", v7);

  objc_msgSend(v10, "resume");
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v10, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v6);

}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id getSLCollaborationSigningControllerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getSLCollaborationSigningControllerClass_softClass;
  v7 = getSLCollaborationSigningControllerClass_softClass;
  if (!getSLCollaborationSigningControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSLCollaborationSigningControllerClass_block_invoke;
    v3[3] = &unk_1E217B2E0;
    v3[4] = &v4;
    __getSLCollaborationSigningControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18B621E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSLCollaborationSigningControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!SocialLayerLibraryCore_frameworkLibrary)
  {
    SocialLayerLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SocialLayerLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getSLCollaborationSigningControllerClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("SLCollaborationSigningController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getSLCollaborationSigningControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SWCollaborationClearNoticeTransmissionMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  uint64_t v16;
  int v17;
  BOOL v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t result;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (2)
    {
      if (!*(_BYTE *)(a2 + *v5))
      {
        v8 = 0;
        v9 = 0;
        v10 = 0;
        while (1)
        {
          v11 = *v3;
          v12 = *(_QWORD *)(a2 + v11);
          v13 = v12 + 1;
          if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
            break;
          v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
          *(_QWORD *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0)
            goto LABEL_12;
          v8 += 7;
          v15 = v9++ >= 9;
          if (v15)
          {
            v10 = 0;
            v16 = *v5;
            v17 = *(unsigned __int8 *)(a2 + v16);
            goto LABEL_14;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
        v16 = *v5;
        v17 = *(unsigned __int8 *)(a2 + v16);
        if (*(_BYTE *)(a2 + v16))
          v10 = 0;
LABEL_14:
        if (v17)
          v18 = 1;
        else
          v18 = (v10 & 7) == 4;
        if (!v18)
        {
          switch((v10 >> 3))
          {
            case 1u:
              v19 = 0;
              v20 = 0;
              v21 = 0;
              break;
            case 2u:
              PBReaderReadString();
              v27 = objc_claimAutoreleasedReturnValue();
              v28 = 24;
              goto LABEL_30;
            case 3u:
              PBReaderReadString();
              v27 = objc_claimAutoreleasedReturnValue();
              v28 = 16;
LABEL_30:
              v29 = *(void **)(a1 + v28);
              *(_QWORD *)(a1 + v28) = v27;

              goto LABEL_40;
            case 4u:
              v30 = *v3;
              v31 = *(_QWORD *)(a2 + v30);
              if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(_QWORD *)(a2 + *v4))
              {
                v32 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v31);
                *(_QWORD *)(a2 + v30) = v31 + 8;
              }
              else
              {
                *(_BYTE *)(a2 + v16) = 1;
                v32 = 0;
              }
              *(_QWORD *)(a1 + 8) = v32;
              goto LABEL_40;
            default:
              result = PBReaderSkipValueWithTag();
              if (!(_DWORD)result)
                return result;
LABEL_40:
              if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
                return *(_BYTE *)(a2 + *v5) == 0;
              continue;
          }
          while (1)
          {
            v22 = *v3;
            v23 = *(_QWORD *)(a2 + v22);
            v24 = v23 + 1;
            if (v23 == -1 || v24 > *(_QWORD *)(a2 + *v4))
              break;
            v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
            *(_QWORD *)(a2 + v22) = v24;
            v21 |= (unint64_t)(v25 & 0x7F) << v19;
            if ((v25 & 0x80) == 0)
              goto LABEL_35;
            v19 += 7;
            v15 = v20++ >= 9;
            if (v15)
            {
              LODWORD(v21) = 0;
              goto LABEL_37;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_35:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v21) = 0;
LABEL_37:
          *(_DWORD *)(a1 + 32) = v21;
          goto LABEL_40;
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t SWCollaborationNoticeTransmissionMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  uint64_t v16;
  int v17;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t result;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *v5;
          v17 = *(unsigned __int8 *)(a2 + v16);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *v5;
      v17 = *(unsigned __int8 *)(a2 + v16);
      if (*(_BYTE *)(a2 + v16))
        v10 = 0;
LABEL_14:
      if (v17 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v19 = 0;
          v20 = 0;
          v21 = 0;
          while (1)
          {
            v22 = *v3;
            v23 = *(_QWORD *)(a2 + v22);
            v24 = v23 + 1;
            if (v23 == -1 || v24 > *(_QWORD *)(a2 + *v4))
              break;
            v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
            *(_QWORD *)(a2 + v22) = v24;
            v21 |= (unint64_t)(v25 & 0x7F) << v19;
            if ((v25 & 0x80) == 0)
              goto LABEL_42;
            v19 += 7;
            v15 = v20++ >= 9;
            if (v15)
            {
              LODWORD(v21) = 0;
              goto LABEL_44;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_42:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v21) = 0;
LABEL_44:
          *(_DWORD *)(a1 + 40) = v21;
          continue;
        case 2u:
          PBReaderReadString();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 24;
          goto LABEL_30;
        case 3u:
          PBReaderReadData();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = 32;
LABEL_30:
          v29 = *(void **)(a1 + v28);
          *(_QWORD *)(a1 + v28) = v27;

          continue;
        case 4u:
          v30 = 0;
          v31 = 0;
          v32 = 0;
          break;
        case 5u:
          v37 = *v3;
          v38 = *(_QWORD *)(a2 + v37);
          if (v38 <= 0xFFFFFFFFFFFFFFF7 && v38 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v39 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v38);
            *(_QWORD *)(a2 + v37) = v38 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + v16) = 1;
            v39 = 0;
          }
          *(_QWORD *)(a1 + 8) = v39;
          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v33 = *v3;
        v34 = *(_QWORD *)(a2 + v33);
        v35 = v34 + 1;
        if (v34 == -1 || v35 > *(_QWORD *)(a2 + *v4))
          break;
        v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
        *(_QWORD *)(a2 + v33) = v35;
        v32 |= (unint64_t)(v36 & 0x7F) << v30;
        if ((v36 & 0x80) == 0)
          goto LABEL_46;
        v30 += 7;
        v15 = v31++ >= 9;
        if (v15)
        {
          v32 = 0;
          goto LABEL_48;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_46:
      if (*(_BYTE *)(a2 + *v5))
        v32 = 0;
LABEL_48:
      *(_QWORD *)(a1 + 16) = v32;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id getSLPersonClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getSLPersonClass_softClass;
  v7 = getSLPersonClass_softClass;
  if (!getSLPersonClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSLPersonClass_block_invoke;
    v3[3] = &unk_1E217B2E0;
    v3[4] = &v4;
    __getSLPersonClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18B627AB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSLPersonClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SocialLayerLibraryCore_frameworkLibrary_0)
  {
    SocialLayerLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!SocialLayerLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SLPerson");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSLPersonClass_block_invoke_cold_1();
    free(v3);
  }
  getSLPersonClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id SWGeneralTelemetryLogHandle()
{
  if (SWGeneralTelemetryLogHandle_onceToken != -1)
    dispatch_once(&SWGeneralTelemetryLogHandle_onceToken, &__block_literal_global_2);
  return (id)SWGeneralTelemetryLogHandle_osLog;
}

id SWFrameworkLogHandle()
{
  if (SWFrameworkLogHandle_onceToken != -1)
    dispatch_once(&SWFrameworkLogHandle_onceToken, &__block_literal_global_3);
  return (id)SWFrameworkLogHandle_osLog;
}

id SWShareableContentLogHandle()
{
  if (SWShareableContentLogHandle_onceToken != -1)
    dispatch_once(&SWShareableContentLogHandle_onceToken, &__block_literal_global_5);
  return (id)SWShareableContentLogHandle_osLog;
}

uint64_t sub_18B62A0F8(void *a1)
{
  void *v1;
  id v3;
  NSString *v4;
  void *v5;
  uint64_t v7;

  sub_18B62A2CC();
  v3 = v1;
  v4 = NSStringFromSelector(sel_collaborationIdentifier);
  sub_18B62A7BC();

  v5 = (void *)sub_18B62A7D4();
  swift_bridgeObjectRelease();
  if (v5)
  {
    v7 = 0;
    sub_18B62A7B0();

  }
  type metadata accessor for SWClearMessagesAction();
  swift_deallocPartialClassInstance();
  return 0;
}

id sub_18B62A268()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SWClearMessagesAction();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SWClearMessagesAction()
{
  return objc_opt_self();
}

unint64_t sub_18B62A2CC()
{
  unint64_t result;

  result = qword_1EDFD0D00;
  if (!qword_1EDFD0D00)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EDFD0D00);
  }
  return result;
}

void __swiftcall SWCollaborationOption.init(title:identifier:subtitle:selected:requiredOptionsIdentifiers:)(SWCollaborationOption *__return_ptr retstr, Swift::String title, Swift::String identifier, Swift::String subtitle, Swift::Bool selected, Swift::OpaquePointer requiredOptionsIdentifiers)
{
  void *ObjCClassFromMetadata;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v8 = (void *)sub_18B62A7A4();
  swift_bridgeObjectRelease();
  v9 = (void *)sub_18B62A7A4();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(ObjCClassFromMetadata, sel_optionWithTitle_identifier_, v8, v9);

  v11 = v10;
  v12 = (void *)sub_18B62A7A4();
  swift_bridgeObjectRelease();
  objc_msgSend(v11, sel_setSubtitle_, v12);

  objc_msgSend(v11, sel_setSelected_, selected);
  v13 = (void *)sub_18B62A7C8();
  swift_bridgeObjectRelease();
  objc_msgSend(v11, sel_setRequiredOptionsIdentifiers_, v13);

}

void __getSLCollaborationSigningControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  -[SWCollaborationClearNoticeTransmissionMessage writeTo:].cold.1(v0);
}

uint64_t __getSLPersonClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SWCollaborationCoordinator _sendStartCollaborationAction:].cold.1(v0);
}

uint64_t sub_18B62A7A4()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_18B62A7B0()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_18B62A7BC()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_18B62A7C8()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_18B62A7D4()
{
  return MEMORY[0x1E0CB2020]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x1E0D01590]();
}

uint64_t BSSettingFlagIsYes()
{
  return MEMORY[0x1E0D015A8]();
}

uint64_t FPNotSupportedError()
{
  return MEMORY[0x1E0CAAA30]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t NSUnimplemented_()
{
  return MEMORY[0x1E0CB33D8]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1E0D82C38]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1E0D82C68]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1E0D82CB8]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

uint64_t fp_current_or_default_log()
{
  return MEMORY[0x1E0CAAD68]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

