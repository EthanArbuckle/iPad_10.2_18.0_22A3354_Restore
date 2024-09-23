@implementation CarbonComponentScannerXPCClient

- (CarbonComponentScannerXPCClient)init
{
  CarbonComponentScannerXPCClient *v2;
  CarbonComponentScannerXPCClient *v3;
  NSXPCConnection *connection;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarbonComponentScannerXPCClient;
  v2 = -[CarbonComponentScannerXPCClient init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    connection = v2->_connection;
    v2->_connection = 0;

  }
  return v3;
}

- (id)xpcConnection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.audio.CarbonComponentScanner.x86-64"));
    v5 = self->_connection;
    self->_connection = v4;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE171630);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v6);

    objc_initWeak(&location, self);
    v7 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __48__CarbonComponentScannerXPCClient_xpcConnection__block_invoke;
    v11[3] = &unk_1E29225C8;
    objc_copyWeak(&v12, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v11);
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __48__CarbonComponentScannerXPCClient_xpcConnection__block_invoke_2;
    v9[3] = &unk_1E29225C8;
    objc_copyWeak(&v10, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v9);
    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

- (void)handleConnectionError:(BOOL)a3
{
  _BOOL4 v3;
  os_log_t v5;
  _QWORD *v6;
  NSObject *v7;
  const char *v8;
  NSXPCConnection **p_connection;
  NSXPCConnection *connection;
  NSXPCConnection *v11;
  _BYTE v12[18];
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  if (gAudioComponentLogCategory)
  {
    v5 = *(os_log_t *)gAudioComponentLogCategory;
  }
  else
  {
    v6 = (_QWORD *)operator new();
    v6[1] = 0;
    v5 = os_log_create("com.apple.coreaudio", "audiocomp");
    *v6 = v5;
    gAudioComponentLogCategory = (uint64_t)v6;
  }
  v7 = objc_retainAutorelease(v5);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = "interrupted";
    *(_QWORD *)&v12[4] = "CarbonComponentScannerXPCClient.mm";
    *(_DWORD *)v12 = 136315650;
    if (v3)
      v8 = "invalidated";
    *(_WORD *)&v12[12] = 1024;
    *(_DWORD *)&v12[14] = 63;
    v13 = 2080;
    v14 = v8;
    _os_log_impl(&dword_18EE07000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d CarbonComponentScannerXPCClient connection was %s!", v12, 0x1Cu);
  }
  connection = self->_connection;
  p_connection = &self->_connection;
  -[NSXPCConnection invalidate](connection, "invalidate", *(_OWORD *)v12);
  v11 = *p_connection;
  *p_connection = 0;

}

- (AudioComponentVector)initialScan:(SEL)a3
{
  id v6;
  id v7;
  void ***v8;
  uint64_t v9;
  AudioComponentVector *p_aBlock;
  uint64_t v11;
  void ***v12;
  void *v13;
  id v14;
  void ***v15;
  void *v16;
  uint64_t v17;
  void ***v18;
  uint64_t v19;
  void ***v20;
  void ***v21;
  void *v22;
  uint64_t v23;
  void ***v24;
  uint64_t v25;
  id v26;
  os_log_t v27;
  NSData *v28;
  _QWORD *v29;
  NSObject *v30;
  uint64_t v31;
  AudioComponentVector *result;
  id v33;
  _QWORD v34[3];
  void ***v35;
  id v36;
  id v37;
  AudioComponentVector aBlock;
  _BYTE v39[24];
  void ***v40;
  void **v41[3];
  void ***v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[CarbonComponentScannerXPCClient xpcConnection](self, "xpcConnection");
  aBlock.__begin_ = &off_1E29165C0;
  aBlock.__end_ = &v33;
  *(_QWORD *)&aBlock.mSorted = &aBlock;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v33 = v7;
  v8 = (void ***)v34;
  v9 = *(_QWORD *)&aBlock.mSorted;
  if (!*(_QWORD *)&aBlock.mSorted)
    goto LABEL_4;
  if (*(AudioComponentVector **)&aBlock.mSorted != &aBlock)
  {
    v9 = (*(uint64_t (**)(void))(**(_QWORD **)&aBlock.mSorted + 16))();
LABEL_4:
    v35 = (void ***)v9;
    goto LABEL_6;
  }
  v35 = (void ***)v34;
  (*((void (**)(AudioComponentVector *, _QWORD *))aBlock.__begin_ + 3))(&aBlock, v34);
LABEL_6:

  p_aBlock = *(AudioComponentVector **)&aBlock.mSorted;
  if (*(AudioComponentVector **)&aBlock.mSorted == &aBlock)
  {
    v11 = 4;
    p_aBlock = &aBlock;
  }
  else
  {
    if (!*(_QWORD *)&aBlock.mSorted)
      goto LABEL_11;
    v11 = 5;
  }
  (*((void (**)(void))p_aBlock->__begin_ + v11))();
LABEL_11:
  v36 = 0;
  v37 = 0;

  v12 = v35;
  v13 = (void *)MEMORY[0x1E0C809B0];
  if (!v35)
  {
    v42 = 0;
    v14 = v33;
    aBlock.__begin_ = (void *)MEMORY[0x1E0C809B0];
    aBlock.__end_ = (void *)3321888768;
    aBlock.__end_cap_.__value_ = ___ZN5caulk3xpc7messageIU8__strongPU44objcproto33CarbonComponentScannerXPCProtocol11objc_objectJU8__strongP6NSDataEE10sync_proxyEv_block_invoke;
    *(_QWORD *)&aBlock.mSorted = &__block_descriptor_64_ea8_32c68_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP6NSDataEEEEEE_e17_v16__0__NSError_8l;
    v15 = (void ***)v39;
LABEL_19:
    v40 = v12;
    goto LABEL_20;
  }
  if (v35 == v34)
  {
    v42 = v41;
    (*(void (**)(_QWORD *, void ***))(v34[0] + 24))(v34, v41);
    v12 = v42;
  }
  else
  {
    v12 = (void ***)((uint64_t (*)(void))(*v35)[2])();
    v42 = v12;
  }
  v14 = v33;
  aBlock.__begin_ = v13;
  aBlock.__end_ = (void *)3321888768;
  aBlock.__end_cap_.__value_ = ___ZN5caulk3xpc7messageIU8__strongPU44objcproto33CarbonComponentScannerXPCProtocol11objc_objectJU8__strongP6NSDataEE10sync_proxyEv_block_invoke;
  *(_QWORD *)&aBlock.mSorted = &__block_descriptor_64_ea8_32c68_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP6NSDataEEEEEE_e17_v16__0__NSError_8l;
  v15 = (void ***)v39;
  if (!v12)
    goto LABEL_19;
  if (v12 != v41)
  {
    v12 = (void ***)((uint64_t (*)(void ***))(*v12)[2])(v12);
    goto LABEL_19;
  }
  v40 = (void ***)v39;
  (*((void (**)(void ***, _BYTE *))v41[0] + 3))(v41, v39);
LABEL_20:
  objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", &aBlock);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40 == (void ***)v39)
  {
    v17 = 4;
  }
  else
  {
    if (!v40)
      goto LABEL_25;
    v17 = 5;
    v15 = v40;
  }
  ((void (*)(void ***))(*v15)[v17])(v15);
LABEL_25:
  v18 = v42;
  if (v42 == v41)
  {
    v19 = 4;
    v18 = v41;
  }
  else
  {
    if (!v42)
      goto LABEL_30;
    v19 = 5;
  }
  ((void (*)(void))(*v18)[v19])();
LABEL_30:
  v20 = v35;
  if (!v35)
  {
    v42 = 0;
    aBlock.__begin_ = v13;
    aBlock.__end_ = (void *)3321888768;
    aBlock.__end_cap_.__value_ = ___ZN5caulk3xpc7messageIU8__strongPU44objcproto33CarbonComponentScannerXPCProtocol11objc_objectJU8__strongP6NSDataEE5replyEv_block_invoke;
    *(_QWORD *)&aBlock.mSorted = &__block_descriptor_64_ea8_32c68_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP6NSDataEEEEEE_e28_v24__0__NSError_8__NSData_16l;
    v21 = (void ***)v39;
LABEL_38:
    v40 = v20;
    goto LABEL_39;
  }
  if (v35 == v34)
  {
    v42 = v41;
    (*(void (**)(_QWORD *, void ***))(v34[0] + 24))(v34, v41);
    v20 = v42;
  }
  else
  {
    v20 = (void ***)((uint64_t (*)(void))(*v35)[2])();
    v42 = v20;
  }
  aBlock.__begin_ = v13;
  aBlock.__end_ = (void *)3321888768;
  aBlock.__end_cap_.__value_ = ___ZN5caulk3xpc7messageIU8__strongPU44objcproto33CarbonComponentScannerXPCProtocol11objc_objectJU8__strongP6NSDataEE5replyEv_block_invoke;
  *(_QWORD *)&aBlock.mSorted = &__block_descriptor_64_ea8_32c68_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP6NSDataEEEEEE_e28_v24__0__NSError_8__NSData_16l;
  v21 = (void ***)v39;
  if (!v20)
    goto LABEL_38;
  if (v20 != v41)
  {
    v20 = (void ***)((uint64_t (*)(void ***))(*v20)[2])(v20);
    goto LABEL_38;
  }
  v40 = (void ***)v39;
  (*((void (**)(void ***, _BYTE *))v41[0] + 3))(v41, v39);
LABEL_39:
  v22 = _Block_copy(&aBlock);
  if (v40 == (void ***)v39)
  {
    v23 = 4;
  }
  else
  {
    if (!v40)
      goto LABEL_44;
    v23 = 5;
    v21 = v40;
  }
  ((void (*)(void ***))(*v21)[v23])(v21);
LABEL_44:
  v24 = v42;
  if (v42 == v41)
  {
    v25 = 4;
    v24 = v41;
  }
  else
  {
    if (!v42)
      goto LABEL_49;
    v25 = 5;
  }
  ((void (*)(void))(*v24)[v25])();
LABEL_49:
  objc_msgSend(v16, "initialScan:reply:", v6, v22);

  v26 = v36;
  if (v26)
  {
    if (gAudioComponentLogCategory)
    {
      v27 = *(os_log_t *)gAudioComponentLogCategory;
    }
    else
    {
      v29 = (_QWORD *)operator new();
      v29[1] = 0;
      v27 = os_log_create("com.apple.coreaudio", "audiocomp");
      *v29 = v27;
      gAudioComponentLogCategory = (uint64_t)v29;
    }
    v30 = objc_retainAutorelease(v27);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      LODWORD(aBlock.__begin_) = 136315650;
      *(void **)((char *)&aBlock.__begin_ + 4) = "CarbonComponentScannerXPCClient.mm";
      WORD2(aBlock.__end_) = 1024;
      *(_DWORD *)((char *)&aBlock.__end_ + 6) = 81;
      WORD1(aBlock.__end_cap_.__value_) = 2112;
      *(void **)((char *)&aBlock.__end_cap_.__value_ + 4) = v26;
      _os_log_impl(&dword_18EE07000, v30, OS_LOG_TYPE_ERROR, "%25s:%-5d CarbonComponentScannerXPCClient error encountered on initialScan: %@", (uint8_t *)&aBlock, 0x1Cu);
    }
    *(_OWORD *)&retstr->__begin_ = 0u;
    *(_OWORD *)&retstr->__end_cap_.__value_ = 0u;
    retstr->mSorted = 1;
  }
  else
  {
    v28 = (NSData *)v37;
    AudioComponentVector::createWithSerializedData(&aBlock, v28);
    retstr->__begin_ = 0;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
    std::vector<std::shared_ptr<APComponent>>::__init_with_size[abi:ne180100]<std::shared_ptr<APComponent>*,std::shared_ptr<APComponent>*>((char *)retstr, aBlock.__begin_, (_QWORD *)aBlock.__end_, ((char *)aBlock.__end_ - (char *)aBlock.__begin_) >> 4);
    retstr->mSorted = aBlock.mSorted;
    v41[0] = (void **)&aBlock;
    std::vector<std::shared_ptr<AudioMetadataTimeline::Node<AudioMetadataStreamFormat,AudioMetadataTimeline::Node<AudioMetadataTrackFormat,AudioMetadataTimeline::Node<AudioMetadataTrackUID,AudioMetadataTimeline::Node<AudioMetadataObject,AudioMetadataTimeline::Node<AudioMetadataContent,AudioMetadataTimeline::Node<AudioMetadataProgramme,AudioMetadataTimeline::Node<AudioMetadataFormatExtended,decltype(nullptr)>>>>>>>>>::__destroy_vector::operator()[abi:ne180100](v41);

  }
  if (v35 == v34)
  {
    v31 = 4;
    goto LABEL_61;
  }
  if (v35)
  {
    v31 = 5;
    v8 = v35;
LABEL_61:
    ((void (*)(void ***))(*v8)[v31])(v8);
  }

  return result;
}

- (void)rescan:(id)a3 added:(void *)a4 removed:(void *)a5
{
  id v8;
  id v9;
  void ***v10;
  uint64_t v11;
  AudioComponentVector *p_aBlock;
  uint64_t v13;
  void ***v14;
  void *v15;
  id v16;
  void ***v17;
  void *v18;
  uint64_t v19;
  void ***v20;
  uint64_t v21;
  void ***v22;
  void ***v23;
  void *v24;
  uint64_t v25;
  void ***v26;
  uint64_t v27;
  id v28;
  os_log_t v29;
  _QWORD *v30;
  NSObject *v31;
  uint64_t v32;
  NSData *v33;
  NSData *v34;
  id v35;
  _QWORD v36[3];
  void ***v37;
  id v38;
  id v39;
  id obj;
  AudioComponentVector aBlock;
  _BYTE v42[24];
  void ***v43;
  void **v44[3];
  void ***v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[CarbonComponentScannerXPCClient xpcConnection](self, "xpcConnection");
  aBlock.__begin_ = &off_1E2916608;
  aBlock.__end_ = &v35;
  *(_QWORD *)&aBlock.mSorted = &aBlock;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v35 = v9;
  v10 = (void ***)v36;
  v11 = *(_QWORD *)&aBlock.mSorted;
  if (!*(_QWORD *)&aBlock.mSorted)
    goto LABEL_4;
  if (*(AudioComponentVector **)&aBlock.mSorted != &aBlock)
  {
    v11 = (*(uint64_t (**)(void))(**(_QWORD **)&aBlock.mSorted + 16))();
LABEL_4:
    v37 = (void ***)v11;
    goto LABEL_6;
  }
  v37 = (void ***)v36;
  (*((void (**)(AudioComponentVector *, _QWORD *))aBlock.__begin_ + 3))(&aBlock, v36);
LABEL_6:

  p_aBlock = *(AudioComponentVector **)&aBlock.mSorted;
  if (*(AudioComponentVector **)&aBlock.mSorted == &aBlock)
  {
    v13 = 4;
    p_aBlock = &aBlock;
  }
  else
  {
    if (!*(_QWORD *)&aBlock.mSorted)
      goto LABEL_11;
    v13 = 5;
  }
  (*((void (**)(void))p_aBlock->__begin_ + v13))();
LABEL_11:
  v38 = 0;
  v39 = 0;
  obj = 0;

  v14 = v37;
  v15 = (void *)MEMORY[0x1E0C809B0];
  if (!v37)
  {
    v45 = 0;
    v16 = v35;
    aBlock.__begin_ = (void *)MEMORY[0x1E0C809B0];
    aBlock.__end_ = (void *)3321888768;
    aBlock.__end_cap_.__value_ = ___ZN5caulk3xpc7messageIU8__strongPU44objcproto33CarbonComponentScannerXPCProtocol11objc_objectJU8__strongP6NSDataS7_EE10sync_proxyEv_block_invoke;
    *(_QWORD *)&aBlock.mSorted = &__block_descriptor_64_ea8_32c71_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP6NSDataS6_EEEEEE_e17_v16__0__NSError_8l;
    v17 = (void ***)v42;
LABEL_19:
    v43 = v14;
    goto LABEL_20;
  }
  if (v37 == v36)
  {
    v45 = v44;
    (*(void (**)(_QWORD *, void ***))(v36[0] + 24))(v36, v44);
    v14 = v45;
  }
  else
  {
    v14 = (void ***)((uint64_t (*)(void))(*v37)[2])();
    v45 = v14;
  }
  v16 = v35;
  aBlock.__begin_ = v15;
  aBlock.__end_ = (void *)3321888768;
  aBlock.__end_cap_.__value_ = ___ZN5caulk3xpc7messageIU8__strongPU44objcproto33CarbonComponentScannerXPCProtocol11objc_objectJU8__strongP6NSDataS7_EE10sync_proxyEv_block_invoke;
  *(_QWORD *)&aBlock.mSorted = &__block_descriptor_64_ea8_32c71_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP6NSDataS6_EEEEEE_e17_v16__0__NSError_8l;
  v17 = (void ***)v42;
  if (!v14)
    goto LABEL_19;
  if (v14 != v44)
  {
    v14 = (void ***)((uint64_t (*)(void ***))(*v14)[2])(v14);
    goto LABEL_19;
  }
  v43 = (void ***)v42;
  (*((void (**)(void ***, _BYTE *))v44[0] + 3))(v44, v42);
LABEL_20:
  objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", &aBlock);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43 == (void ***)v42)
  {
    v19 = 4;
  }
  else
  {
    if (!v43)
      goto LABEL_25;
    v19 = 5;
    v17 = v43;
  }
  ((void (*)(void ***))(*v17)[v19])(v17);
LABEL_25:
  v20 = v45;
  if (v45 == v44)
  {
    v21 = 4;
    v20 = v44;
  }
  else
  {
    if (!v45)
      goto LABEL_30;
    v21 = 5;
  }
  ((void (*)(void))(*v20)[v21])();
LABEL_30:
  v22 = v37;
  if (!v37)
  {
    v45 = 0;
    aBlock.__begin_ = v15;
    aBlock.__end_ = (void *)3321888768;
    aBlock.__end_cap_.__value_ = ___ZN5caulk3xpc7messageIU8__strongPU44objcproto33CarbonComponentScannerXPCProtocol11objc_objectJU8__strongP6NSDataS7_EE5replyEv_block_invoke;
    *(_QWORD *)&aBlock.mSorted = &__block_descriptor_64_ea8_32c71_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP6NSDataS6_EEEEEE_e39_v32__0__NSError_8__NSData_16__NSData_24l;
    v23 = (void ***)v42;
LABEL_38:
    v43 = v22;
    goto LABEL_39;
  }
  if (v37 == v36)
  {
    v45 = v44;
    (*(void (**)(_QWORD *, void ***))(v36[0] + 24))(v36, v44);
    v22 = v45;
  }
  else
  {
    v22 = (void ***)((uint64_t (*)(void))(*v37)[2])();
    v45 = v22;
  }
  aBlock.__begin_ = v15;
  aBlock.__end_ = (void *)3321888768;
  aBlock.__end_cap_.__value_ = ___ZN5caulk3xpc7messageIU8__strongPU44objcproto33CarbonComponentScannerXPCProtocol11objc_objectJU8__strongP6NSDataS7_EE5replyEv_block_invoke;
  *(_QWORD *)&aBlock.mSorted = &__block_descriptor_64_ea8_32c71_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP6NSDataS6_EEEEEE_e39_v32__0__NSError_8__NSData_16__NSData_24l;
  v23 = (void ***)v42;
  if (!v22)
    goto LABEL_38;
  if (v22 != v44)
  {
    v22 = (void ***)((uint64_t (*)(void ***))(*v22)[2])(v22);
    goto LABEL_38;
  }
  v43 = (void ***)v42;
  (*((void (**)(void ***, _BYTE *))v44[0] + 3))(v44, v42);
LABEL_39:
  v24 = _Block_copy(&aBlock);
  if (v43 == (void ***)v42)
  {
    v25 = 4;
  }
  else
  {
    if (!v43)
      goto LABEL_44;
    v25 = 5;
    v23 = v43;
  }
  ((void (*)(void ***))(*v23)[v25])(v23);
LABEL_44:
  v26 = v45;
  if (v45 == v44)
  {
    v27 = 4;
    v26 = v44;
  }
  else
  {
    if (!v45)
      goto LABEL_49;
    v27 = 5;
  }
  ((void (*)(void))(*v26)[v27])();
LABEL_49:
  objc_msgSend(v18, "rescan:reply:", v8, v24);

  v28 = v38;
  if (v28)
  {
    if (gAudioComponentLogCategory)
    {
      v29 = *(os_log_t *)gAudioComponentLogCategory;
    }
    else
    {
      v30 = (_QWORD *)operator new();
      v30[1] = 0;
      v29 = os_log_create("com.apple.coreaudio", "audiocomp");
      *v30 = v29;
      gAudioComponentLogCategory = (uint64_t)v30;
    }
    v31 = objc_retainAutorelease(v29);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      LODWORD(aBlock.__begin_) = 136315650;
      *(void **)((char *)&aBlock.__begin_ + 4) = "CarbonComponentScannerXPCClient.mm";
      WORD2(aBlock.__end_) = 1024;
      *(_DWORD *)((char *)&aBlock.__end_ + 6) = 105;
      WORD1(aBlock.__end_cap_.__value_) = 2112;
      *(void **)((char *)&aBlock.__end_cap_.__value_ + 4) = v28;
      _os_log_impl(&dword_18EE07000, v31, OS_LOG_TYPE_ERROR, "%25s:%-5d CarbonComponentScannerXPCClient error encountered on rescan: %@", (uint8_t *)&aBlock, 0x1Cu);
    }
  }
  else
  {
    v33 = 0;
    v34 = (NSData *)v39;
    objc_storeStrong((id *)&v33, obj);
    AudioComponentVector::createWithSerializedData(&aBlock, v34);
    std::vector<std::shared_ptr<APComponent>>::__vdeallocate((void **)a4);
    *(_OWORD *)a4 = *(_OWORD *)&aBlock.__begin_;
    *((_QWORD *)a4 + 2) = aBlock.__end_cap_.__value_;
    memset(&aBlock, 0, 24);
    *((_BYTE *)a4 + 24) = aBlock.mSorted;
    v44[0] = (void **)&aBlock;
    std::vector<std::shared_ptr<AudioMetadataTimeline::Node<AudioMetadataStreamFormat,AudioMetadataTimeline::Node<AudioMetadataTrackFormat,AudioMetadataTimeline::Node<AudioMetadataTrackUID,AudioMetadataTimeline::Node<AudioMetadataObject,AudioMetadataTimeline::Node<AudioMetadataContent,AudioMetadataTimeline::Node<AudioMetadataProgramme,AudioMetadataTimeline::Node<AudioMetadataFormatExtended,decltype(nullptr)>>>>>>>>>::__destroy_vector::operator()[abi:ne180100](v44);
    AudioComponentVector::createWithSerializedData(&aBlock, v33);
    std::vector<std::shared_ptr<APComponent>>::__vdeallocate((void **)a5);
    *(_OWORD *)a5 = *(_OWORD *)&aBlock.__begin_;
    *((_QWORD *)a5 + 2) = aBlock.__end_cap_.__value_;
    memset(&aBlock, 0, 24);
    *((_BYTE *)a5 + 24) = aBlock.mSorted;
    v44[0] = (void **)&aBlock;
    std::vector<std::shared_ptr<AudioMetadataTimeline::Node<AudioMetadataStreamFormat,AudioMetadataTimeline::Node<AudioMetadataTrackFormat,AudioMetadataTimeline::Node<AudioMetadataTrackUID,AudioMetadataTimeline::Node<AudioMetadataObject,AudioMetadataTimeline::Node<AudioMetadataContent,AudioMetadataTimeline::Node<AudioMetadataProgramme,AudioMetadataTimeline::Node<AudioMetadataFormatExtended,decltype(nullptr)>>>>>>>>>::__destroy_vector::operator()[abi:ne180100](v44);

  }
  if (v37 == v36)
  {
    v32 = 4;
    goto LABEL_60;
  }
  if (v37)
  {
    v32 = 5;
    v10 = v37;
LABEL_60:
    ((void (*)(void ***))(*v10)[v32])(v10);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

void __48__CarbonComponentScannerXPCClient_xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleConnectionError:", 0);

}

void __48__CarbonComponentScannerXPCClient_xpcConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleConnectionError:", 1);

}

@end
