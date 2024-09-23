@implementation MRServiceHandleClientMessage

void ___MRServiceHandleClientMessage_block_invoke()
{
  uint64_t v0;
  uint64_t uint64;
  uint64_t v2;
  id v3;
  NSObject *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  id v8;
  MRPlaybackQueueRequest *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void (*v15)(_QWORD, _QWORD);
  uint64_t v16;
  id v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  void *Error;
  void (*v20)(void *, _BYTE *, uint64_t, void (**)(_QWORD, _QWORD, _QWORD));
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  UInt8 *v28;
  _MRLyricsEventProtobuf *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void (*v33)(uint64_t, void *, _QWORD);
  NSObject *v34;
  MRProtocolMessage *v35;
  void *v36;
  MRProtocolMessage *v37;
  NSObject *v38;
  id v39;
  _BYTE __dst[2064];
  _QWORD v41[4];
  NSObject *v42;
  uint8_t buf[2072];
  uint64_t v44;

  v0 = MEMORY[0x1E0C80A78]();
  v44 = *MEMORY[0x1E0C80C00];
  uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(v0 + 32), "MRXPC_MESSAGE_ID_KEY");
  switch(uint64)
  {
    case 0x700000000000001uLL:
      v2 = *(_QWORD *)(v0 + 40);
      v3 = *(id *)(v0 + 32);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = ___MRServiceHandlePostNotification_block_invoke;
      *(_QWORD *)&buf[24] = &unk_1E30C5CA8;
      v4 = v3;
      *(_QWORD *)&buf[32] = v4;
      v5 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x194036C44](buf);
      if (!v2 || !*(_QWORD *)(v2 + 8))
        goto LABEL_31;
      MRCreateStringFromXPCMessage(v4, "MRXPC_NOTIFICATION_NAME_KEY");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MRCreatePropertyListFromXPCMessage(v4, "MRXPC_NOTIFICATION_USERINFO_DATA_KEY");
      if (v6)
      {
        (*(void (**)(void *, void *, _QWORD, void (**)(_QWORD, _QWORD, _QWORD)))(v2 + 8))(v6, v7, *(_QWORD *)(v2 + 64), v5);
      }
      else
      {
        _MRLogForCategory(0);
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          ___MRServiceHandleClientMessage_block_invoke_cold_1();

      }
      goto LABEL_29;
    case 0x700000000000002uLL:
      v8 = *(id *)(v0 + 32);
      v9 = MRCreatePlaybackQueueRequestFromXPCMessage(v8);
      MRCreatePlayerPathFromXPCMessage(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = ___MRServiceHandleNowPlayingPlaybackQueueRequest_block_invoke;
      *(_QWORD *)&buf[24] = &unk_1E30C7C78;
      *(_QWORD *)&buf[32] = v8;
      v11 = v8;
      v12 = (void *)MEMORY[0x194036C44](buf);
      MRServiceClientPlaybackQueueRequestCallback(v10, v9, v12);

      return;
    case 0x700000000000004uLL:
      v16 = *(_QWORD *)(v0 + 40);
      v17 = *(id *)(v0 + 32);
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = ___MRServiceHandleVideoThumbnailsRequest_block_invoke;
      v41[3] = &unk_1E30C7F78;
      v4 = v17;
      v42 = v4;
      v18 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x194036C44](v41);
      if (v16 && *(_QWORD *)(v16 + 24))
      {
        MRCreatePlayerPathFromXPCMessage(v4);
        Error = (void *)objc_claimAutoreleasedReturnValue();
        memset(buf, 0, 512);
        MRVideoThumbnailRequestFromXPCMessage(v4, (uint64_t)buf);
        v20 = *(void (**)(void *, _BYTE *, uint64_t, void (**)(_QWORD, _QWORD, _QWORD)))(v16 + 24);
        v21 = *(_QWORD *)(v16 + 64);
        memcpy(__dst, buf, sizeof(__dst));
        v20(Error, __dst, v21, v18);
      }
      else
      {
        Error = (void *)MRMediaRemoteCreateError(14);
        ((void (**)(_QWORD, _QWORD, void *))v18)[2](v18, 0, Error);
      }

      v34 = v42;
      goto LABEL_32;
    case 0x700000000000005uLL:
      v22 = *(_QWORD *)(v0 + 40);
      v23 = *(id *)(v0 + 32);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = ___MRServiceHandleAudioAmplitudeSamplesRequest_block_invoke;
      *(_QWORD *)&buf[24] = &unk_1E30C7F78;
      v4 = v23;
      *(_QWORD *)&buf[32] = v4;
      v5 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x194036C44](buf);
      if (!v22 || !*(_QWORD *)(v22 + 32))
        goto LABEL_18;
      MRCreatePlayerPathFromXPCMessage(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = xpc_dictionary_get_uint64(v4, "MRXPC_AUDIO_AMPLITUDE_SAMPLES_COUNT_KEY");
      (*(void (**)(void *, uint64_t, _QWORD, void (**)(_QWORD, _QWORD, _QWORD)))(v22 + 32))(v6, v24, *(_QWORD *)(v22 + 64), v5);
      goto LABEL_30;
    case 0x700000000000006uLL:
      v25 = *(_QWORD *)(v0 + 40);
      v26 = *(id *)(v0 + 32);
      if (v25 && *(_QWORD *)(v25 + 40))
      {
        v39 = v26;
        MRCreatePlayerPathFromXPCMessage(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (UInt8 *)MRCreateDataFromXPCMessage(v39, "MRXPC_LYRICS_EVENT_DATA");
        v29 = MRLyricsEventCreateFromExternalRepresentation((uint64_t)v28);
        (*(void (**)(void *, _MRLyricsEventProtobuf *))(v25 + 40))(v27, v29);

        v26 = v39;
      }

      return;
    case 0x700000000000008uLL:
      v13 = *(_QWORD *)(v0 + 40);
      v14 = *(id *)(v0 + 32);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = ___MRServiceHandleClientDiagnosticsRequest_block_invoke;
      *(_QWORD *)&buf[24] = &unk_1E30C7FA0;
      v4 = v14;
      *(_QWORD *)&buf[32] = v4;
      v5 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x194036C44](buf);
      if (v13 && (v15 = *(void (**)(_QWORD, _QWORD))(v13 + 48)) != 0)
      {
        v15(*(_QWORD *)(v13 + 64), v5);
      }
      else
      {
LABEL_18:
        v6 = (void *)MRMediaRemoteCreateError(14);
        ((void (**)(_QWORD, _QWORD, void *))v5)[2](v5, 0, v6);
LABEL_30:

      }
LABEL_31:

      v34 = *(NSObject **)&buf[32];
LABEL_32:

LABEL_33:
      return;
    case 0x70000000000000AuLL:
      v30 = *(_QWORD *)(v0 + 40);
      v31 = *(id *)(v0 + 32);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = ___MRServiceHandleGeneralClientMessage_block_invoke;
      *(_QWORD *)&buf[24] = &unk_1E30C7FC8;
      v4 = v31;
      *(_QWORD *)&buf[32] = v4;
      v5 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x194036C44](buf);
      MRCreateProtobufFromXPCMessage(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      MRCreatePlayerPathFromXPCMessage(v4);
      v32 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v32;
      if (v30 && (v33 = *(void (**)(uint64_t, void *, _QWORD))(v30 + 56)) != 0)
      {
        v33(v32, v6, v5);
      }
      else
      {
        v35 = [MRProtocolMessage alloc];
        v36 = (void *)MRMediaRemoteCreateError(14);
        v37 = -[MRProtocolMessage initWithUnderlyingCodableMessage:error:](v35, "initWithUnderlyingCodableMessage:error:", 0, v36);
        ((void (*)(void (**)(_QWORD, _QWORD, _QWORD), MRProtocolMessage *))v5[2])(v5, v37);

      }
LABEL_29:

      goto LABEL_30;
    default:
      _MRLogForCategory(0);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = uint64;
        _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "Client XPC message with ID %lu not handled.", buf, 0xCu);
      }
      goto LABEL_33;
  }
}

void ___MRServiceHandleClientMessage_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_0(&dword_193827000, v0, v1, "Could not parse notification from xpc message", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
