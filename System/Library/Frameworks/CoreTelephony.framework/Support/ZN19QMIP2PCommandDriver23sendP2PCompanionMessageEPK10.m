@implementation ZN19QMIP2PCommandDriver23sendP2PCompanionMessageEPK10

const void **___ZN19QMIP2PCommandDriver23sendP2PCompanionMessageEPK10__CFNumberPK8__CFDatabRKNSt3__110shared_ptrI14P2PDeviceDescrEEU13block_pointerFvbbN3ctu2cf11CFSharedRefIK14__CFDictionaryEEE_block_invoke_39(uint64_t a1, qmi::MessageBase *a2)
{
  uint64_t v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t TlvValue;
  int v10;
  uint64_t v11;
  int v12;
  unint64_t v13;
  uint64_t v14;
  int v15;
  const void *v16;
  CFTypeID v17;
  const void *v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  const void **(*v25)(uint64_t);
  const void *v26;
  unint64_t v27;
  uint8_t buf[8];
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 40);
  v21 = 0;
  v22 = &v21;
  v23 = 0x3002000000;
  v24 = __Block_byref_object_copy__40;
  v25 = __Block_byref_object_dispose__41;
  v26 = 0;
  v5 = *((_DWORD *)a2 + 1);
  v6 = *(NSObject **)(v4 + 40);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v8 = qmi::asString();
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v5;
      LOWORD(v29) = 2080;
      *(_QWORD *)((char *)&v29 + 2) = v8;
      _os_log_impl(&dword_216897000, v6, OS_LOG_TYPE_DEFAULT, "#N P2PMessageDelivery failed: %d (%s)", buf, 0x12u);
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216897000, v6, OS_LOG_TYPE_DEFAULT, "#I P2PMessageDelivery succeeded", buf, 2u);
    }
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 0x40000000;
    v20[2] = ___ZN19QMIP2PCommandDriver23sendP2PCompanionMessageEPK10__CFNumberPK8__CFDatabRKNSt3__110shared_ptrI14P2PDeviceDescrEEU13block_pointerFvbbN3ctu2cf11CFSharedRefIK14__CFDictionaryEEE_block_invoke_42;
    v20[3] = &unk_24D5D1440;
    v20[4] = &v21;
    TlvValue = qmi::MessageBase::findTlvValue(a2);
    v11 = TlvValue;
    if (TlvValue)
    {
      v12 = v10;
      v27 = TlvValue;
      *(_QWORD *)buf = 0;
      v29 = 0uLL;
      tlv::parseV<p2p::tlv::Watch_BB_Info>(&v27, v10, buf);
      v13 = v27;
      if (v27)
        ___ZN19QMIP2PCommandDriver23sendP2PCompanionMessageEPK10__CFNumberPK8__CFDatabRKNSt3__110shared_ptrI14P2PDeviceDescrEEU13block_pointerFvbbN3ctu2cf11CFSharedRefIK14__CFDictionaryEEE_block_invoke_42((uint64_t)v20, (uint64_t)buf);
      if (*(_QWORD *)buf)
      {
        *(_QWORD *)&v29 = *(_QWORD *)buf;
        operator delete(*(void **)buf);
      }
      if (!v13)
        ((void (*)(_QWORD, uint64_t, uint64_t, _QWORD))*MEMORY[0x24BED8BD0])(*(unsigned __int16 *)a2, 16, v11, v12);
    }
  }
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *((_DWORD *)a2 + 1);
  v16 = (const void *)v22[5];
  if (v16 && (v17 = CFGetTypeID((CFTypeRef)v22[5]), v17 == CFDictionaryGetTypeID()))
  {
    v19 = v16;
    CFRetain(v16);
  }
  else
  {
    v19 = 0;
  }
  (*(void (**)(uint64_t, BOOL, _QWORD, const void **))(v14 + 16))(v14, v15 == 0, 0, &v19);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v19);
  _Block_release(*(const void **)(a1 + 32));
  _Block_object_dispose(&v21, 8);
  return ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(&v26);
}

@end
