@implementation ZN14QMIQOSClientIP23createQoSClientOnDemandEv

_QWORD *___ZN14QMIQOSClientIP23createQoSClientOnDemandEv_block_invoke_3(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (**v8)();
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _OWORD v14[2];
  _QWORD aBlock[5];
  _QWORD v16[3];
  _QWORD *v17;
  uint8_t buf[24];
  void *v19;
  uint64_t v20;
  _BYTE v21[24];
  _BYTE *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v1 = result[4];
  if (*(_BYTE *)(v1 + 108))
    return result;
  result = (_QWORD *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(v1 + 64) + 72))(*(_QWORD *)(v1 + 64));
  if (!result)
    return result;
  v16[0] = &off_24D5EBDD8;
  v16[1] = v1;
  v17 = v16;
  if (!*(_QWORD *)(v1 + 88) || !*(_BYTE *)(v1 + 109))
  {
    v5 = *(NSObject **)(v1 + 40);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = asStringBool();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "queryCurrentQosFlows_sync";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_216897000, v5, OS_LOG_TYPE_DEFAULT, "#I %s: QOS Client not ready yet: ready=%s", buf, 0x16u);
      v7 = v17;
      memset(buf, 0, sizeof(buf));
      LOBYTE(aBlock[0]) = 0;
      if (!v17)
        std::__throw_bad_function_call[abi:ne180100]();
      v8 = (uint64_t (**)())*v17;
    }
    else
    {
      memset(buf, 0, sizeof(buf));
      v7 = v16;
      v8 = &off_24D5EBDD8;
      LOBYTE(aBlock[0]) = 0;
    }
    ((void (*)(_QWORD *, uint8_t *, _QWORD *))v8[6])(v7, buf, aBlock);
    if (*(_QWORD *)buf)
    {
      *(_QWORD *)&buf[8] = *(_QWORD *)buf;
      operator delete(*(void **)buf);
    }
    goto LABEL_26;
  }
  memset(v14, 0, sizeof(v14));
  qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v14);
  v12 = QMIServiceMsg::create();
  v2 = MEMORY[0x24BDAC760];
  *(_QWORD *)buf = MEMORY[0x24BDAC760];
  *(_QWORD *)&buf[8] = 1174405120;
  *(_QWORD *)&buf[16] = ___ZN14QMIQOSClientIP25queryCurrentQosFlows_syncENSt3__18functionIFvRKNS0_6vectorIjNS0_9allocatorIjEEEEbEEE_block_invoke;
  v19 = &__block_descriptor_tmp_131_2;
  v20 = v1;
  v3 = v21;
  v4 = (uint64_t)v17;
  if (!v17)
    goto LABEL_8;
  if (v17 != v16)
  {
    v4 = (*(uint64_t (**)(void))(*v17 + 16))();
LABEL_8:
    v22 = (_BYTE *)v4;
    goto LABEL_16;
  }
  v22 = v21;
  (*(void (**)(_QWORD *, _BYTE *))(v16[0] + 24))(v16, v21);
LABEL_16:
  aBlock[0] = v2;
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZNO3qmi6Client9SendProxy8callbackIRKN3qos9GetQosIds8ResponseEEEOS1_U13block_pointerFvT_E_block_invoke;
  aBlock[3] = &unk_24D5EBDA8;
  aBlock[4] = buf;
  v9 = _Block_copy(aBlock);
  v13 = v9;
  if (v12)
  {
    qmi::Client::send();
    v9 = v13;
  }
  if (v9)
    _Block_release(v9);
  if (v22 == v21)
  {
    v10 = 4;
    goto LABEL_24;
  }
  if (v22)
  {
    v10 = 5;
    v3 = v22;
LABEL_24:
    (*(void (**)(_QWORD *))(*v3 + 8 * v10))(v3);
  }
  qmi::MutableMessageBase::~MutableMessageBase((qmi::MutableMessageBase *)v14);
LABEL_26:
  result = v17;
  if (v17 == v16)
  {
    v11 = 4;
    result = v16;
  }
  else
  {
    if (!v17)
      return result;
    v11 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v11))();
}

@end
