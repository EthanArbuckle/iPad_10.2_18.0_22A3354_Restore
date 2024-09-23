@implementation MRServiceHandleVoiceInputMessage

void ___MRServiceHandleVoiceInputMessage_block_invoke(uint64_t a1)
{
  uint64_t uint64;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  UInt8 *v10;
  MRMutableAudioDataBlock *v11;
  MRMutableAudioDataBlock *v12;
  void *v13;
  double Timestamp;
  double v15;
  double v16;
  float Gain;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  xpc_object_t xdict;
  xpc_object_t xdicta;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "MRXPC_MESSAGE_ID_KEY");
  if (uint64 == 0x900000000000005)
  {
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(id *)(a1 + 32);
    if (v7 && *(_QWORD *)(v7 + 24))
    {
      xdicta = v8;
      v9 = xpc_dictionary_get_uint64(v8, "MRXPC_VOICE_INPUT_DEVICE_ID_KEY");
      v10 = (UInt8 *)MRCreateDataFromXPCMessage(xdicta, "MRXPC_VOICE_DATA_PROTOBUF_DATA_KEY");
      if (v10)
      {
        v11 = MRAudioDataBlockCreateFromExternalRepresentation(*MEMORY[0x1E0C9AE00], (uint64_t)v10);
        v12 = v11;
        if (v11)
        {
          MRAudioDataBlockGetBuffer(v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          Timestamp = MRAudioDataBlockGetTimestamp(v12);
          v16 = v15;
          Gain = MRAudioDataBlockGetGain(v12);
        }
        else
        {
          v13 = 0;
          v16 = 0.0;
          Gain = 0.0;
          Timestamp = 0.0;
        }

      }
      else
      {
        v13 = 0;
        v16 = 0.0;
        Gain = 0.0;
        Timestamp = 0.0;
      }
      (*(void (**)(uint64_t, void *, _QWORD, double, double, float))(v7 + 24))(v9, v13, *(_QWORD *)v7, Timestamp, v16, Gain);

      v8 = xdicta;
    }
    goto LABEL_25;
  }
  v3 = uint64;
  if (uint64 == 0x900000000000003)
  {
    v18 = *(_QWORD *)(a1 + 40);
    v5 = *(id *)(a1 + 32);
    xdict = v5;
    if (v18 && *(_QWORD *)(v18 + 16))
    {
      v19 = xpc_dictionary_get_uint64(v5, "MRXPC_VOICE_INPUT_DEVICE_ID_KEY");
      (*(void (**)(uint64_t, _QWORD))(v18 + 16))(v19, *(_QWORD *)v18);
      goto LABEL_15;
    }
LABEL_16:
    v20 = 6;
    goto LABEL_17;
  }
  if (uint64 == 0x900000000000002)
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(id *)(a1 + 32);
    xdict = v5;
    if (v4 && *(_QWORD *)(v4 + 8))
    {
      v6 = xpc_dictionary_get_uint64(v5, "MRXPC_VOICE_INPUT_DEVICE_ID_KEY");
      (*(void (**)(uint64_t, _QWORD))(v4 + 8))(v6, *(_QWORD *)v4);
LABEL_15:
      v5 = xdict;
      v20 = 0;
LABEL_17:
      _MRServiceSendReply(v5, v20);
      v8 = xdict;
LABEL_25:

      return;
    }
    goto LABEL_16;
  }
  _MRLogForCategory(0);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v25 = v3;
    _os_log_impl(&dword_193827000, v21, OS_LOG_TYPE_DEFAULT, "Voice recording client message %lu not handled", buf, 0xCu);
  }

}

@end
