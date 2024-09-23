@implementation ZN2re4ecs229IntrospectedNetworkTypeHelper12makeTypeInfoEyRKNS

re *___ZN2re4ecs229IntrospectedNetworkTypeHelper12makeTypeInfoEyRKNS_17IntrospectionBaseEPKNS0_17ComponentTypeBaseE_block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  re *v9;
  re *v10;
  NSObject *v11;
  uint64_t v13;
  _QWORD v14[4];
  int v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v14[0] = a2;
  v14[1] = a3;
  v15 = -1;
  v16 = 0;
  v17 = a5;
  v18 = a6;
  v19 = 0;
  v14[2] = a2;
  v14[3] = a2 + a3;
  v9 = (re *)(*(uint64_t (**)(_QWORD, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v14, a4, a4, a5, a6, a7, a8);
  v10 = v9;
  if ((v9 & 1) == 0)
  {
    v11 = *re::ecsNetworkLogObjects(v9);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136380675;
      v21 = v13;
      _os_log_error_impl(&dword_224FE9000, v11, OS_LOG_TYPE_ERROR, "Failed to read OPACK payload of type %{private}s", buf, 0xCu);
    }
  }
  return v10;
}

re *___ZN2re4ecs229IntrospectedNetworkTypeHelper12makeTypeInfoEyRKNS_17IntrospectionBaseEPKNS0_17ComponentTypeBaseE_block_invoke_15(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  re *v9;
  re *v10;
  NSObject *v11;
  uint64_t v13;
  _QWORD v14[4];
  int v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v14[0] = a2;
  v14[1] = a3;
  v15 = -1;
  v16 = 0;
  v17 = a5;
  v18 = a6;
  v19 = 0;
  v14[2] = a2;
  v14[3] = a2 + a3;
  v9 = (re *)(*(uint64_t (**)(_QWORD, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v14, a4, a4, a5, a6, a7, a8);
  v10 = v9;
  if ((v9 & 1) == 0)
  {
    v11 = *re::ecsNetworkLogObjects(v9);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136380675;
      v21 = v13;
      _os_log_error_impl(&dword_224FE9000, v11, OS_LOG_TYPE_ERROR, "Failed to read raw snapshot of type %{private}s", buf, 0xCu);
    }
  }
  return v10;
}

uint64_t *___ZN2re4ecs229IntrospectedNetworkTypeHelper12makeTypeInfoEyRKNS_17IntrospectionBaseEPKNS0_17ComponentTypeBaseE_block_invoke_65(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5;
  uint64_t v6;
  re::IntrospectionBase *v7;
  uint64_t v8;
  _QWORD *v9;
  re *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *(**v17)(__int128 *__return_ptr, re::IntrospectionBase *, uint64_t);
  re *v18;
  uint64_t *v19;
  uint64_t *v20;
  re *v21;
  re *v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t DebugName;
  char *v31;
  _QWORD v32[3];
  _QWORD v33[2];
  uint64_t v34;
  int v35;
  uint64_t v36;
  char v37[8];
  uint64_t v38;
  _BYTE v39[39];
  char v40;
  _QWORD v41[3];
  _QWORD v42[4];
  uint8_t v43[4];
  uint64_t v44;
  __int16 v45;
  _BYTE *v46;
  uint8_t v47[4];
  uint64_t v48;
  __int16 v49;
  char *v50;
  uint64_t v51;
  char v52;
  _BYTE v53[31];
  __int128 buf;
  _QWORD *v55;
  _QWORD v56[2];
  _QWORD v57[2];
  __int16 v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63[8];

  v63[5] = *MEMORY[0x24BDAC8D0];
  v5 = RESyncObjectWriteContextSupportsProtocolLevelWalnut();
  RESyncBitReaderBytesLeft();
  RESyncBitReaderDataPtr();
  v6 = RESyncObjectWriteContextIsLocalSession();
  if ((v6 & 1) != 0 || *(_BYTE *)(a1 + 112))
    JUMPOUT(0x227691F24);
  memset(&v42[1], 0, 24);
  v41[0] = &re::PassthroughAssetSerialization::instance(void)::instance;
  v41[1] = v42;
  v41[2] = 0;
  v8 = *(_QWORD *)(a1 + 48);
  v9 = operator new(0x20uLL);
  *v9 = &off_24ED674C0;
  v9[1] = v8;
  v9[2] = v41;
  v63[0] = (uint64_t)v7;
  v63[4] = (uint64_t)v9;
  v10 = (re *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((v10 & 1) != 0)
  {
    if ((RESyncObjectWriteContextSupportsProtocolLevelPistachio() & 1) != 0)
    {
      if ((v5 & 1) == 0)
      {
        if ((RESyncObjectWriteContextSupportsProtocolLevelAlmond() & 1) == 0)
          return std::unique_ptr<re::RigHierarchy,std::function<void ()(re::RigHierarchy*)>>::~unique_ptr[abi:nn180100](v63);
LABEL_19:
        re::IntrospectionSharedLock::IntrospectionSharedLock((re::IntrospectionSharedLock *)&v40);
        re::TypeInfo::TypeInfo((uint64_t)v39, (uint64_t)&buf + 8);
        v19 = re::TypeInfo::name((re::TypeInfo *)v39);
        if (v37[0])
        {
          v36 = 0;
          v33[1] = 0;
          v34 = 0;
          v35 = 0;
          re::DynamicArray<char>::setCapacity(v33, 0x400uLL);
          ++v35;
          WORD4(buf) = 0;
          *(_QWORD *)&buf = &off_24ED7C190;
          v55 = v33;
          v56[0] = &unk_24ED7C1E8;
          v56[1] = 0;
          v57[0] = &off_24ED1E8F0;
          v57[1] = v56;
          v58 = 0;
          v59 = 0;
          v60 = 0;
          v61 = 0x2000;
          v62 = 0;
          v32[0] = &off_24ED2D1F0;
          v32[1] = RESyncGetSyncObjectWriteContextEntry();
          v32[2] = 0;
          v21 = (re *)RESyncGetSyncObjectWriteContextEntry();
          *((_QWORD *)v21 + 55) = v32;
          v22 = (re *)re::serializeObject(v21, (re::NetworkCompatSerializer *)&buf, v7, v39, (const re::TypeInfo *)&v38, (uint64_t)v47);
          if (v47[0])
          {
            BYTE8(buf) = 0;
            google::protobuf::io::CopyingOutputStreamAdaptor::Flush((google::protobuf::io::CopyingOutputStreamAdaptor *)v57);
            RESyncBiasedVLQWrite();
            MEMORY[0x227691F24](a3, v36, v34);
          }
          else
          {
            v25 = *re::ecsNetworkLogObjects(v22);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              v28 = re::TypeInfo::name((re::TypeInfo *)v39)[1];
              if ((v52 & 1) != 0)
                v29 = *(_BYTE **)&v53[7];
              else
                v29 = v53;
              *(_DWORD *)v43 = 136380931;
              v44 = v28;
              v45 = 2081;
              v46 = v29;
              _os_log_error_impl(&dword_224FE9000, v25, OS_LOG_TYPE_ERROR, "Failed to write payload in backward compatible format. Type: \"%{private}s\". Details: %{private}s", v43, 0x16u);
            }
          }
          if (!v47[0] && v51 && (v52 & 1) != 0)
            (*(void (**)(void))(*(_QWORD *)v51 + 40))();
          re::DynamicArrayBufferedOutputStream::~DynamicArrayBufferedOutputStream((re::DynamicArrayBufferedOutputStream *)&buf);
          if (v33[0] && v36)
            (*(void (**)(void))(*(_QWORD *)v33[0] + 40))();
        }
        else
        {
          v23 = *re::ecsNetworkLogObjects((re *)v20);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v24 = re::TypeInfo::name((re::TypeInfo *)v39)[1];
            LODWORD(buf) = 136380675;
            *(_QWORD *)((char *)&buf + 4) = v24;
            _os_log_error_impl(&dword_224FE9000, v23, OS_LOG_TYPE_ERROR, "Failed to write payload in backward compatible format. Type \"%{private}s\" does not exist in previous RealityKit version.", (uint8_t *)&buf, 0xCu);
          }
        }
        re::IntrospectionSharedLock::~IntrospectionSharedLock((re::IntrospectionSharedLock *)&v40);
        return std::unique_ptr<re::RigHierarchy,std::function<void ()(re::RigHierarchy*)>>::~unique_ptr[abi:nn180100](v63);
      }
LABEL_12:
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      return std::unique_ptr<re::RigHierarchy,std::function<void ()(re::RigHierarchy*)>>::~unique_ptr[abi:nn180100](v63);
    }
    if ((v5 & 1) != 0)
      goto LABEL_12;
    v13 = *(_QWORD *)(a1 + 80);
    v14 = RESyncObjectWriteContextSupportsProtocolLevelAlmond();
    if (!v13 || (v15 = RESyncGetSyncObjectWriteContextEntry(), !*(_QWORD *)(a1 + 80)))
    {
LABEL_18:
      if (!v14)
        return std::unique_ptr<re::RigHierarchy,std::function<void ()(re::RigHierarchy*)>>::~unique_ptr[abi:nn180100](v63);
      goto LABEL_19;
    }
    v16 = v15;
    v17 = *(_QWORD *(***)(__int128 *__return_ptr, re::IntrospectionBase *, uint64_t))(a1 + 96);
    while (1)
    {
      v18 = (re *)(*v17)(&buf, v7, v16);
      if (!(_BYTE)buf)
        break;
      if (++v17 == (_QWORD *(**)(__int128 *__return_ptr, re::IntrospectionBase *, uint64_t))(*(_QWORD *)(a1 + 96) + 8 * *(_QWORD *)(a1 + 80)))
        goto LABEL_18;
    }
    v27 = *re::ecsNetworkLogObjects(v18);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      DebugName = RESyncSyncableTypeInfoGetDebugName();
      if ((v55 & 1) != 0)
        v31 = (char *)v56[0];
      else
        v31 = (char *)&v55 + 1;
      *(_DWORD *)v47 = 136380931;
      v48 = DebugName;
      v49 = 2080;
      v50 = v31;
      _os_log_error_impl(&dword_224FE9000, v27, OS_LOG_TYPE_ERROR, "Downgrade function failed for type \"%{private}s\": %s", v47, 0x16u);
    }
    if (!(_BYTE)buf && *((_QWORD *)&buf + 1) && (v55 & 1) != 0)
      (*(void (**)(void))(**((_QWORD **)&buf + 1) + 40))();
  }
  else
  {
    v11 = *re::ecsNetworkLogObjects(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = RESyncSyncableTypeInfoGetDebugName();
      LODWORD(buf) = 136380675;
      *(_QWORD *)((char *)&buf + 4) = v12;
      _os_log_error_impl(&dword_224FE9000, v11, OS_LOG_TYPE_ERROR, "Failed to deserialize payload of type \"%{private}s\".", (uint8_t *)&buf, 0xCu);
    }
  }
  return std::unique_ptr<re::RigHierarchy,std::function<void ()(re::RigHierarchy*)>>::~unique_ptr[abi:nn180100](v63);
}

@end
