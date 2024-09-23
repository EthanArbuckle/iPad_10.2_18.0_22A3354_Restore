@implementation ZN3ice6detail12wrapCallbackIZN20IBICallCommandDriver4dialE8CallInfoE3

const void **___ZN3ice6detail12wrapCallbackIZN20IBICallCommandDriver4dialE8CallInfoE3__1vEEN8dispatch5blockIU13block_pointerFiPhjEEENSt3__117integral_constantIiLi2EEEOT__block_invoke(const void **result, const unsigned __int8 *a2)
{
  const void **v2;
  uint64_t v4;
  int v5;
  BOOL v6;
  int CsiError;
  int v8;
  NSObject *v9;
  int PreferredWirelessTechnologyForSim;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  _OWORD v14[2];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _OWORD v19[2];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  _BYTE v38[64];
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v2 = (const void **)result[4];
  if (v2)
  {
    v4 = (uint64_t)*v2;
    ctu::SharedRef<__CFUUID const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFUUID const>::SharedRef(&v13, v2 + 1);
    v5 = *((unsigned __int8 *)v2 + 92);
    v41 = 0;
    v39 = 0u;
    v40 = 0u;
    memset(v38, 0, sizeof(v38));
    AriSdk::ARI_IBICallCsSetupCallRspCb_SDK::ARI_IBICallCsSetupCallRspCb_SDK((AriSdk::ARI_IBICallCsSetupCallRspCb_SDK *)v38, a2);
    v37 = 0;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v20 = 0u;
    memset(v19, 0, sizeof(v19));
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    memset(v14, 0, sizeof(v14));
    std::string::basic_string[abi:ne180100]<0>(&v15, (char *)*MEMORY[0x24BDC3E80]);
    DWORD2(v16) = 9;
    BYTE12(v16) = 0;
    LODWORD(v17) = 1;
    BYTE4(v17) = 1;
    *((_QWORD *)&v17 + 1) = 0x400000001;
    *(_QWORD *)&v18 = 2;
    BYTE8(v18) = 0;
    HIDWORD(v18) = *MEMORY[0x24BDC39A8];
    BYTE8(v19[1]) = 0;
    BYTE12(v19[1]) = 0;
    memset(v19, 0, 22);
    std::string::basic_string[abi:ne180100]<0>(&v20, (char *)&unk_21DE40B46);
    DWORD2(v21) = 0;
    std::string::basic_string[abi:ne180100]<0>(&v22, (char *)&unk_21DE40B46);
    DWORD2(v23) = 0;
    WORD6(v23) = 0;
    LODWORD(v24) = 0;
    WORD2(v24) = 0;
    DWORD2(v24) = 0;
    BYTE12(v24) = 0;
    LOBYTE(v25) = 0;
    BYTE8(v25) = 0;
    LOBYTE(v27) = 0;
    WORD4(v27) = 0;
    HIDWORD(v27) = 1;
    LOBYTE(v28) = 0;
    DWORD1(v28) = 0;
    BYTE8(v28) = 0;
    LOBYTE(v36) = 0;
    BYTE8(v36) = 0;
    BYTE4(v37) = 0;
    LOBYTE(v33) = 0;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    ctu::SharedRef<__CFUUID const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFUUID const>::operator=((const void **)v14, &v13);
    v6 = ice::processMessage<AriSdk::ARI_IBICallCsSetupCallRspCb_SDK,void>((AriSdk::ARI_IBICallCsSetupCallRspCb_SDK *)v38, (ice *)0x9008000, (NSObject **)(v4 + 40));
    CsiError = 1;
    if (v6)
    {
      if ((_QWORD)v39)
        HIDWORD(v27) = subscriber::instanceAsSimSlot((subscriber *)*(unsigned int *)v39);
      if (!*(_DWORD *)v40 && *((_QWORD *)&v39 + 1))
      {
        HIDWORD(v18) = **((_BYTE **)&v39 + 1);
        (*(void (**)(_QWORD, _OWORD *))(**(_QWORD **)(v4 + 152) + 40))(*(_QWORD *)(v4 + 152), v14);
        PreferredWirelessTechnologyForSim = IBICallCommandDriver::getPreferredWirelessTechnologyForSim(v4, SHIDWORD(v27));
        if (!v5 && PreferredWirelessTechnologyForSim == 8)
        {
          IBICallCommandDriver::setCallCapability((uint64_t *)v4, *MEMORY[0x24BDC3EF8], 0, SHIDWORD(v27));
          v11 = *MEMORY[0x24BDC3ED8];
          IBICallCommandDriver::setCallCapability((uint64_t *)v4, *MEMORY[0x24BDC3ED8], 0, SHIDWORD(v27));
          IBICallCommandDriver::setCallCapability((uint64_t *)v4, *MEMORY[0x24BDC3DB8], 1, SHIDWORD(v27));
          (*(void (**)(_QWORD, _QWORD))(**(_QWORD **)(v4 + 152) + 16))(*(_QWORD *)(v4 + 152), HIDWORD(v27));
          (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD))(**(_QWORD **)(v4 + 152) + 344))(*(_QWORD *)(v4 + 152), v11, 1, 1, HIDWORD(v27));
        }
        goto LABEL_12;
      }
      DWORD2(v19[1]) = 1;
      BYTE12(v19[1]) = 1;
      if (!*((_QWORD *)&v40 + 1))
      {
LABEL_11:
        (*(void (**)(_QWORD, _OWORD *))(**(_QWORD **)(v4 + 152) + 40))(*(_QWORD *)(v4 + 152), v14);
LABEL_12:
        CallInfo::~CallInfo((void **)v14);
        MEMORY[0x2207A1F00](v38);
        return ctu::SharedRef<__CFUUID const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFUUID const>::~SharedRef(&v13);
      }
      v8 = **((_DWORD **)&v40 + 1);
      v9 = *(NSObject **)(*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v4 + 112) + 16))(*(_QWORD *)(v4 + 112), HIDWORD(v27));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v12 = asString();
        *(_DWORD *)buf = 136315394;
        v43 = v12;
        v44 = 1024;
        v45 = v8;
        _os_log_error_impl(&dword_21DCD7000, v9, OS_LOG_TYPE_ERROR, "Error in call setup response: %s (%u)", buf, 0x12u);
      }
      WORD2(v19[1]) = v8;
      CsiError = ice::makeCsiError(v8);
    }
    DWORD2(v19[1]) = CsiError;
    BYTE12(v19[1]) = 1;
    goto LABEL_11;
  }
  return result;
}

@end
