@implementation ZN10subscriber19EURSimCommandDriver24sendSimSingleApduCommandERKNS

_QWORD *___ZN10subscriber19EURSimCommandDriver24sendSimSingleApduCommandERKNS_11SimCardInfoENSt3__110shared_ptrINS4_6vectorIhNS4_9allocatorIhEEEEEEhSA_NS4_8functionIFvbEEE_block_invoke(uint64_t a1, unsigned int a2, char a3)
{
  char v5;
  char *v6;
  char v7;
  uint64_t v8;
  unint64_t *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD *result;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  __int128 v20;
  char v21;
  char v22;
  _OWORD v23[2];
  _QWORD aBlock[5];
  _QWORD v25[3];
  _QWORD *v26;
  _QWORD v27[5];
  _BYTE v28[24];
  _BYTE *v29;
  unsigned int v30;
  char v31;
  char v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = *(_BYTE *)(a1 + 88);
  v16 = *(_OWORD *)(a1 + 32);
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v25, a1 + 56);
  memset(v23, 0, sizeof(v23));
  qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v23);
  v6 = qmi::MutableMessageBase::getTLV<uim::tlv::SlotId>(v23);
  if (a2 >= 4)
    v7 = 0;
  else
    v7 = a2;
  *v6 = v7;
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 0x40000000;
  v19[2] = ___ZN10subscriber19EURSimCommandDriver19sendSimApdu_commandENS_15HardwareSimSlotEhhRNSt3__16vectorIhNS2_9allocatorIhEEEENS2_8functionIFvbEEE_block_invoke_2;
  v19[3] = &__block_descriptor_tmp_62_5;
  v21 = a3;
  v22 = v5;
  v20 = v16;
  v9 = (unint64_t *)qmi::MutableMessageBase::getTLV<uim::tlv::APDU>(v23);
  ___ZN10subscriber19EURSimCommandDriver19sendSimApdu_commandENS_15HardwareSimSlotEhhRNSt3__16vectorIhNS2_9allocatorIhEEEENS2_8functionIFvbEEE_block_invoke_2((uint64_t)v19, v9);
  *qmi::MutableMessageBase::getTLV<uim::tlv::LChannelId>(v23) = a3;
  v17 = QMIServiceMsg::create();
  v27[0] = v8;
  v27[1] = 1174405120;
  v27[2] = ___ZN10subscriber19EURSimCommandDriver19sendSimApdu_commandENS_15HardwareSimSlotEhhRNSt3__16vectorIhNS2_9allocatorIhEEEENS2_8functionIFvbEEE_block_invoke_4;
  v27[3] = &__block_descriptor_tmp_67_7;
  v27[4] = v16;
  v30 = a2;
  v31 = a3;
  v32 = v5;
  v10 = v28;
  v11 = (uint64_t)v26;
  if (!v26)
    goto LABEL_7;
  if (v26 != v25)
  {
    v11 = (*(uint64_t (**)(void))(*v26 + 16))();
LABEL_7:
    v29 = (_BYTE *)v11;
    goto LABEL_9;
  }
  v29 = v28;
  (*(void (**)(_QWORD *, _BYTE *))(v25[0] + 24))(v25, v28);
LABEL_9:
  aBlock[0] = v8;
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZNO3qmi6Client9SendProxy8callbackIRKN3uim8SendAPDU8ResponseEEEOS1_U13block_pointerFvT_E_block_invoke;
  aBlock[3] = &unk_24D5DC2F0;
  aBlock[4] = v27;
  v12 = _Block_copy(aBlock);
  v18 = v12;
  if (v17)
  {
    qmi::Client::send();
    v12 = v18;
  }
  if (v12)
    _Block_release(v12);
  if (v29 == v28)
  {
    v13 = 4;
  }
  else
  {
    if (!v29)
      goto LABEL_18;
    v13 = 5;
    v10 = v29;
  }
  (*(void (**)(_QWORD *))(*v10 + 8 * v13))(v10);
LABEL_18:
  qmi::MutableMessageBase::~MutableMessageBase((qmi::MutableMessageBase *)v23);
  result = v26;
  if (v26 == v25)
  {
    v15 = 4;
    result = v25;
  }
  else
  {
    if (!v26)
      return result;
    v15 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v15))();
}

@end
