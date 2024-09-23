@implementation CSSecureSiriAudioProvidingProxy

- (CSSecureSiriAudioProvidingProxy)init
{
  os_log_t v3;
  void *v4;
  int v5;
  NSObject *v6;
  CSSecureSiriAudioProvidingProxy *v7;
  tb_connection_s *v8;
  uint8_t v10[16];
  objc_super v11;

  if ((os_variant_is_darwinos() & 1) == 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)CSSecureSiriAudioProvidingProxy;
    self = -[CSSecureSiriAudioProvidingProxy init](&v11, sel_init);
    if (self)
    {
      v3 = os_log_create("com.apple.corespeech", "Framework");
      v4 = (void *)sLog;
      sLog = (uint64_t)v3;

      v5 = tb_conclave_endpoint_for_service();
      v6 = sLog;
      if (v5)
      {
        if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v10 = 0;
          _os_log_error_impl(&dword_23A0D7000, v6, OS_LOG_TYPE_ERROR, "IsolatedCoreAudioClient could not launch conclave!!!", v10, 2u);
        }
        goto LABEL_6;
      }
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_23A0D7000, v6, OS_LOG_TYPE_DEFAULT, "IsolatedCoreAudioClient conclave successfully launched!", v10, 2u);
      }
      v8 = (tb_connection_s *)tb_client_connection_create_with_endpoint();
      if (!tb_client_connection_activate())
        self->_service.connection = v8;
    }
    self = self;
    v7 = self;
    goto LABEL_12;
  }
LABEL_6:
  v7 = 0;
LABEL_12:

  return v7;
}

- (BOOL)prepare:(int)a3
{
  char v3;
  BOOL result;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  unsigned int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__CSSecureSiriAudioProvidingProxy_prepare___block_invoke;
  v5[3] = &unk_250B1D350;
  v5[4] = &v6;
  v17 = 0;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v12 = 0u;
  v25 = 0;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  if (tb_client_connection_message_construct())
    goto LABEL_4;
  tb_message_encode_u64();
  tb_message_encode_u32();
  tb_message_complete();
  v11 = 0;
  if ((tb_connection_send_query() & 0xFFFFFFF7) != 0 || !v11)
    goto LABEL_3;
  v10 = 0;
  tb_message_decode_u8();
  if (v10 != 1)
  {
    if (!(_BYTE)v10)
    {
      tb_message_decode_BOOL();
LABEL_11:
      __43__CSSecureSiriAudioProvidingProxy_prepare___block_invoke((uint64_t)v5, v10);
    }
LABEL_3:
    tb_client_connection_message_destruct();
LABEL_4:
    v3 = *((_BYTE *)v7 + 24);
    _Block_object_dispose(&v6, 8);
    return v3;
  }
  v18 = 0;
  tb_message_decode_u32();
  if (v18 <= 3)
  {
    HIDWORD(v10) = v18;
    goto LABEL_11;
  }
  result = _os_crash();
  __break(1u);
  return result;
}

- (unsigned)requestHistoricalAudioBufferWithStartSample:(unint64_t)a3 numSamples:(unint64_t)a4
{
  unsigned int v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  v8 = &v7;
  v9 = 0x2810000000;
  v10 = "";
  v11 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __90__CSSecureSiriAudioProvidingProxy_requestHistoricalAudioBufferWithStartSample_numSamples___block_invoke;
  v6[3] = &unk_250B1D378;
  v6[4] = &v7;
  v19 = 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  v26 = 0;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  if (!tb_client_connection_message_construct())
  {
    tb_message_encode_u64();
    tb_message_encode_u64();
    tb_message_encode_u64();
    tb_message_complete();
    v13 = 0;
    if ((tb_connection_send_query() & 0xFFFFFFF7) == 0 && v13)
    {
      v12 = 0;
      tb_message_decode_u32();
      tb_message_decode_u32();
      __90__CSSecureSiriAudioProvidingProxy_requestHistoricalAudioBufferWithStartSample_numSamples___block_invoke((uint64_t)v6, v12);
    }
    tb_client_connection_message_destruct();
  }
  v4 = *((_DWORD *)v8 + 8);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)fetchAndStoreAudioBuffer
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__CSSecureSiriAudioProvidingProxy_fetchAndStoreAudioBuffer__block_invoke;
  v4[3] = &unk_250B1D3A0;
  v4[4] = &v5;
  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v11 = 0u;
  v23 = 0;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  if (!tb_client_connection_message_construct())
  {
    tb_message_encode_u64();
    tb_message_complete();
    v10 = 0;
    if ((tb_connection_send_query() & 0xFFFFFFF7) == 0 && v10)
    {
      v9 = 0;
      tb_message_decode_BOOL();
      __59__CSSecureSiriAudioProvidingProxy_fetchAndStoreAudioBuffer__block_invoke((uint64_t)v4, v9);
    }
    tb_client_connection_message_destruct();
  }
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)configAOPVoiceTrigger
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__CSSecureSiriAudioProvidingProxy_configAOPVoiceTrigger__block_invoke;
  v4[3] = &unk_250B1D3A0;
  v4[4] = &v5;
  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v11 = 0u;
  v23 = 0;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  if (!tb_client_connection_message_construct())
  {
    tb_message_encode_u64();
    tb_message_complete();
    v10 = 0;
    if ((tb_connection_send_query() & 0xFFFFFFF7) == 0 && v10)
    {
      v9 = 0;
      tb_message_decode_BOOL();
      __56__CSSecureSiriAudioProvidingProxy_configAOPVoiceTrigger__block_invoke((uint64_t)v4, v9);
    }
    tb_client_connection_message_destruct();
  }
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)fetchAOPVoiceTriggerResult:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v6 = MEMORY[0x24BDAC760];
    v7 = 3221225472;
    v8 = __62__CSSecureSiriAudioProvidingProxy_fetchAOPVoiceTriggerResult___block_invoke;
    v9 = &unk_250B1D3C8;
    v5 = v3;
    v10 = v5;
    v17 = 0;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v12 = 0u;
    v24 = 0;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    if (!tb_client_connection_message_construct())
    {
      tb_message_encode_u64();
      tb_message_complete();
      v11 = 0;
      tb_connection_send_query();
      tb_client_connection_message_destruct();
    }

  }
}

- (void)startBargeInVoiceTrigger
{
  if (!tb_client_connection_message_construct())
  {
    tb_message_encode_u64();
    tb_message_complete();
    tb_connection_send_query();
    tb_client_connection_message_destruct();
  }
}

- (void)stopBargeInVoiceTrigger
{
  if (!tb_client_connection_message_construct())
  {
    tb_message_encode_u64();
    tb_message_complete();
    tb_connection_send_query();
    tb_client_connection_message_destruct();
  }
}

- (int)processBargeInVoiceTrigger
{
  int v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2810000000;
  v7 = "";
  v8 = 0;
  corespeechexclave_sirivoicetriggerservice_bargeinprocess();
  v2 = *((_DWORD *)v5 + 8);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (void)processBargeInVoiceTriggerWithResult:(id)a3
{
  void (**v3)(id, BOOL, _QWORD);
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;

  v3 = (void (**)(id, BOOL, _QWORD))a3;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2810000000;
  v9 = "";
  v10 = 0;
  corespeechexclave_sirivoicetriggerservice_bargeinprocess();
  v4 = *((_DWORD *)v7 + 8);
  if (v4)
  {
    if (v3)
    {
      v5 = 0;
LABEL_6:
      v3[2](v3, v4 == 0, v5);
    }
  }
  else if (v3)
  {
    v5 = *((unsigned int *)v7 + 9);
    goto LABEL_6;
  }
  _Block_object_dispose(&v6, 8);

}

- (void)resetFirstPassVoiceTrigger
{
  if (!tb_client_connection_message_construct())
  {
    tb_message_encode_u64();
    tb_message_complete();
    tb_connection_send_query();
    tb_client_connection_message_destruct();
  }
}

- (BOOL)initializeSecondPass
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__CSSecureSiriAudioProvidingProxy_initializeSecondPass__block_invoke;
  v4[3] = &unk_250B1D3A0;
  v4[4] = &v5;
  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v11 = 0u;
  v23 = 0;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  if (!tb_client_connection_message_construct())
  {
    tb_message_encode_u64();
    tb_message_complete();
    v10 = 0;
    if ((tb_connection_send_query() & 0xFFFFFFF7) == 0 && v10)
    {
      v9 = 0;
      tb_message_decode_BOOL();
      __55__CSSecureSiriAudioProvidingProxy_initializeSecondPass__block_invoke((uint64_t)v4, v9);
    }
    tb_client_connection_message_destruct();
  }
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)startSecondPassVoiceTriggerFromOrigin:(unint64_t)a3 enablePHS:(BOOL)a4 supportMultiPhrase:(BOOL)a5
{
  if (!tb_client_connection_message_construct())
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_encode_BOOL();
    tb_message_encode_BOOL();
    tb_message_complete();
    tb_connection_send_query();
    tb_client_connection_message_destruct();
  }
}

- (void)stopSecondPassVoiceTrigger
{
  if (!tb_client_connection_message_construct())
  {
    tb_message_encode_u64();
    tb_message_complete();
    tb_connection_send_query();
    tb_client_connection_message_destruct();
  }
}

- (void)processSecondPassVoiceTriggerWithShouldFlushAudio:(BOOL)a3 result:(id)a4
{
  id v4;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  const char *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[3];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x5010000000;
  v9 = "";
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __92__CSSecureSiriAudioProvidingProxy_processSecondPassVoiceTriggerWithShouldFlushAudio_result___block_invoke;
  v5[3] = &unk_250B1D418;
  v5[4] = &v6;
  v23 = 0;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v18 = 0u;
  v30 = 0;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  if (tb_client_connection_message_construct())
  {
    if (!v4)
      goto LABEL_9;
    goto LABEL_8;
  }
  tb_message_encode_u64();
  tb_message_encode_BOOL();
  tb_message_complete();
  v17 = 0;
  if ((tb_connection_send_query() & 0xFFFFFFF7) == 0 && v17)
  {
    v15 = 0u;
    v16 = 0u;
    v14 = 0u;
    tb_message_decode_u32();
    tb_message_decode_u32();
    tb_message_decode_f64();
    tb_message_decode_u32();
    tb_message_decode_f32();
    tb_message_decode_f32();
    tb_message_decode_f32();
    tb_message_decode_u64();
    tb_message_decode_u64();
    v13[0] = v14;
    v13[1] = v15;
    v13[2] = v16;
    __92__CSSecureSiriAudioProvidingProxy_processSecondPassVoiceTriggerWithShouldFlushAudio_result___block_invoke((uint64_t)v5, (uint64_t)v13);
  }
  tb_client_connection_message_destruct();
  if (v4)
LABEL_8:
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, double, float, float, float))v4 + 2))(v4, *((unsigned int *)v7 + 8), *((unsigned int *)v7 + 9), *((unsigned int *)v7 + 12), *((_QWORD *)v7 + 8), *((_QWORD *)v7 + 9), v7[5], *((float *)v7 + 13), *((float *)v7 + 14), *((float *)v7 + 15));
LABEL_9:
  _Block_object_dispose(&v6, 8);

}

- (BOOL)setSpeakerProfile:(id)a3 numEmbeddings:(unint64_t)a4 dimension:(unint64_t)a5 speakerRecognizerType:(unint64_t)a6
{
  id v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  BOOL v12;
  int v14;
  _QWORD v15[5];
  _QWORD v16[2];
  __int128 v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[4];
  __int128 buf;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v18 = 0;
  v16[0] = 3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v8 = objc_retainAutorelease(a3);
  v16[1] = objc_msgSend(v8, "bytes");
  v17 = a5 * a4;
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __99__CSSecureSiriAudioProvidingProxy_setSpeakerProfile_numEmbeddings_dimension_speakerRecognizerType___block_invoke;
  v15[3] = &unk_250B1D3A0;
  v15[4] = &v22;
  *(_QWORD *)&v26 = 0;
  *((_QWORD *)&v26 + 1) = &v26;
  v27 = 0x2000000000uLL;
  *(_QWORD *)&buf = MEMORY[0x24BDAC760];
  *((_QWORD *)&buf + 1) = 0x40000000;
  *(_QWORD *)&v36 = __f32__v_sizeof_block_invoke;
  *((_QWORD *)&v36 + 1) = &unk_250B1D490;
  *(_QWORD *)&v37 = &v26;
  f32__v_visit((unsigned __int8 *)v16, (uint64_t)&buf);
  _Block_object_dispose(&v26, 8);
  v31 = 0;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v26 = 0u;
  v41 = 0;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  buf = 0u;
  v36 = 0u;
  if (!tb_client_connection_message_construct())
  {
    tb_message_encode_u64();
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2000000000;
    v34[3] = 0;
    v33[0] = v9;
    v33[1] = 0x40000000;
    v33[2] = __f32__v_encode_block_invoke;
    v33[3] = &unk_250B1D4B8;
    v33[4] = v34;
    f32__v_visit((unsigned __int8 *)v16, (uint64_t)v33);
    tb_message_encode_u64();
    v32[0] = v9;
    v32[1] = 0x40000000;
    v32[2] = __f32__v_encode_block_invoke_2;
    v32[3] = &__block_descriptor_tmp_86;
    v32[4] = &v26;
    f32__v_visit((unsigned __int8 *)v16, (uint64_t)v32);
    _Block_object_dispose(v34, 8);
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_encode_u32();
    tb_message_complete();
    v33[0] = 0;
    v10 = tb_connection_send_query();
    if ((v10 & 0xFFFFFFF7) != 0 || (v14 = v10, !v33[0]))
    {
      tb_client_connection_message_destruct();
    }
    else
    {
      LOBYTE(v32[0]) = 0;
      tb_message_decode_BOOL();
      __99__CSSecureSiriAudioProvidingProxy_setSpeakerProfile_numEmbeddings_dimension_speakerRecognizerType___block_invoke((uint64_t)v15, v32[0]);
      tb_client_connection_message_destruct();
      if (!v14)
      {
        v12 = *((_BYTE *)v23 + 24) != 0;
        goto LABEL_7;
      }
    }
  }
  v11 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl(&dword_23A0D7000, v11, OS_LOG_TYPE_ERROR, "Failed to setSpeakerProfileEmbedding", (uint8_t *)&buf, 2u);
  }
  v12 = 0;
LABEL_7:
  _Block_object_dispose(&v22, 8);

  return v12;
}

- (void)setAssetForLocale:(id)a3 isOTA:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint8_t buf[32];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;

  v6 = a4;
  v36 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v9 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v6;
    _os_log_impl(&dword_23A0D7000, v9, OS_LOG_TYPE_DEFAULT, "Siri locale:%@, isOTA:%d", buf, 0x12u);
  }
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("ar-AE")))
  {
    if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("ar-SA")))
    {
      if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("da-DK")))
      {
        if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("de-AT")))
        {
          if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("de-DE")))
          {
            if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("de-CH")))
            {
              if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("en-IN")))
              {
                if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("en-US")))
                {
                  if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("en-CA")))
                  {
                    if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("en-AU")))
                    {
                      if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("en-GB")))
                      {
                        if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("en-SG")))
                        {
                          if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("en-IE")))
                          {
                            if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("en-ZA")))
                            {
                              if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("en-NZ")))
                              {
                                if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("es-ES")))
                                {
                                  if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("es-US")))
                                  {
                                    if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("es-CL")))
                                    {
                                      if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("es-MX")))
                                      {
                                        if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("fi-FI")))
                                        {
                                          if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("fr-BE")))
                                          {
                                            if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("fr-CA")))
                                            {
                                              if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("fr-CH")))
                                              {
                                                if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("fr-FR")))
                                                {
                                                  if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("he-IL")))
                                                  {
                                                    if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("it-IT")))
                                                    {
                                                      if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("it-CH")))
                                                      {
                                                        if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("ja-JP")))
                                                        {
                                                          if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("ko-KR")))
                                                          {
                                                            if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("ms-MY")))
                                                            {
                                                              if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("nb-NO")))
                                                              {
                                                                if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("nl-BE")))
                                                                {
                                                                  if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("nl-NL")))
                                                                  {
                                                                    if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("pt-BR")))
                                                                    {
                                                                      if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("ru-RU")))
                                                                      {
                                                                        if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("sv-SE")))
                                                                        {
                                                                          if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("th-TH")))
                                                                          {
                                                                            if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("tr-TR")))
                                                                            {
                                                                              if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("yue-CN")))
                                                                              {
                                                                                if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("zh-CN")))
                                                                                {
                                                                                  if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("zh-TW")))
                                                                                  {
                                                                                    if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("zh-HK")))
                                                                                    {
                                                                                      v11 = (void *)sLog;
                                                                                      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEFAULT))
                                                                                      {
                                                                                        v12 = objc_retainAutorelease(v7);
                                                                                        v13 = v11;
                                                                                        v14 = objc_msgSend(v12, "UTF8String");
                                                                                        *(_DWORD *)buf = 136315138;
                                                                                        *(_QWORD *)&buf[4] = v14;
                                                                                        _os_log_impl(&dword_23A0D7000, v13, OS_LOG_TYPE_DEFAULT, "Error: Invalid locale %s. Falling back to en-US", buf, 0xCu);

                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __70__CSSecureSiriAudioProvidingProxy_setAssetForLocale_isOTA_completion___block_invoke;
  v21 = &unk_250B1D440;
  v22 = v8;
  v15 = v8;
  v29 = 0;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v24 = 0u;
  v35 = 0;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  memset(buf, 0, sizeof(buf));
  v16 = tb_client_connection_message_construct();
  v17 = v15;
  if (!v16)
  {
    tb_message_encode_u64();
    tb_message_encode_u32();
    tb_message_encode_BOOL();
    tb_message_complete();
    v23 = 0;
    tb_connection_send_query();
    tb_client_connection_message_destruct();
    v17 = v22;
  }

}

- (void)startSecureMobileAssetLoaderService:(BOOL)a3 completion:(id)a4
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint8_t buf[16];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  v5 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23A0D7000, v5, OS_LOG_TYPE_DEFAULT, (const char *)&unk_23A0DE973, buf, 2u);
  }
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __82__CSSecureSiriAudioProvidingProxy_startSecureMobileAssetLoaderService_completion___block_invoke;
  v12 = &unk_250B1D440;
  v13 = v4;
  v6 = v4;
  v20 = 0;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v15 = 0u;
  v27 = 0;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  *(_OWORD *)buf = 0u;
  v22 = 0u;
  v7 = tb_client_connection_message_construct();
  v8 = v6;
  if (!v7)
  {
    tb_message_encode_u64();
    tb_message_encode_BOOL();
    tb_message_complete();
    v14 = 0;
    tb_connection_send_query();
    tb_client_connection_message_destruct();
    v8 = v13;
  }

}

- (void)stopSecureMobileAssetLoaderService:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint8_t buf[16];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23A0D7000, v4, OS_LOG_TYPE_DEFAULT, (const char *)&unk_23A0DE973, buf, 2u);
  }
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __70__CSSecureSiriAudioProvidingProxy_stopSecureMobileAssetLoaderService___block_invoke;
  v11 = &unk_250B1D440;
  v12 = v3;
  v5 = v3;
  v19 = 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  v26 = 0;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  *(_OWORD *)buf = 0u;
  v21 = 0u;
  v6 = tb_client_connection_message_construct();
  v7 = v5;
  if (!v6)
  {
    tb_message_encode_u64();
    tb_message_complete();
    v13 = 0;
    tb_connection_send_query();
    tb_client_connection_message_destruct();
    v7 = v12;
  }

}

uint64_t __70__CSSecureSiriAudioProvidingProxy_stopSecureMobileAssetLoaderService___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __82__CSSecureSiriAudioProvidingProxy_startSecureMobileAssetLoaderService_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __70__CSSecureSiriAudioProvidingProxy_setAssetForLocale_isOTA_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __99__CSSecureSiriAudioProvidingProxy_setSpeakerProfile_numEmbeddings_dimension_speakerRecognizerType___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

__n128 __92__CSSecureSiriAudioProvidingProxy_processSecondPassVoiceTriggerWithShouldFlushAudio_result___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  __n128 result;
  __int128 v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(__n128 *)a2;
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v2 + 64) = v4;
  *(__n128 *)(v2 + 32) = result;
  return result;
}

uint64_t __55__CSSecureSiriAudioProvidingProxy_initializeSecondPass__block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __72__CSSecureSiriAudioProvidingProxy_processBargeInVoiceTriggerWithResult___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 32) = a2;
  return result;
}

uint64_t __61__CSSecureSiriAudioProvidingProxy_processBargeInVoiceTrigger__block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 32) = a2;
  return result;
}

uint64_t __62__CSSecureSiriAudioProvidingProxy_fetchAOPVoiceTriggerResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__CSSecureSiriAudioProvidingProxy_configAOPVoiceTrigger__block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __59__CSSecureSiriAudioProvidingProxy_fetchAndStoreAudioBuffer__block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __90__CSSecureSiriAudioProvidingProxy_requestHistoricalAudioBufferWithStartSample_numSamples___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 32) = a2;
  return result;
}

uint64_t __43__CSSecureSiriAudioProvidingProxy_prepare___block_invoke(uint64_t result, unint64_t a2)
{
  unint64_t v2;

  v2 = HIDWORD(a2);
  if ((_BYTE)a2)
    LOBYTE(v2) = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = v2;
  return result;
}

@end
