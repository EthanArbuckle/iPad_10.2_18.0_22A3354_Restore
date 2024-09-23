@implementation ZN3IPC10Connection12platformOpenEv

WTF *___ZN3IPC10Connection12platformOpenEv_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  mach_port_name_t v2;
  mach_msg_return_t v3;
  void *v4;
  mach_msg_header_t *v5;
  mach_msg_id_t msgh_id;
  uint64_t v8;
  unint64_t msgh_size;
  uint64_t *v10;
  uint64_t msgh_bits;
  unint64_t v12;
  mach_msg_size_t *p_msgh_size;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  unsigned int v17;
  uint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  IPC::Decoder *v22;
  IPC::Decoder *v23;
  WTF *v24;
  void *v25;
  IPC::Decoder *v26;
  WTF *v27;
  void *v28;
  WTF *result;
  NSObject *v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  NSObject *v34;
  unsigned int v35;
  char *v36;
  int v37;
  NSObject *v38;
  NSObject *v39;
  IPC::Decoder *v40;
  mach_msg_header_t *msg;
  mach_msg_size_t rcv_size[2];
  mach_msg_header_t v43[173];
  _BYTE v44[4];
  void *v45;
  int v46;
  unsigned int v47;
  _BYTE buf[22];
  __int16 v49;
  int v50;
  uint64_t v51;

  v0 = MEMORY[0x1E0C80A78]();
  v51 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(v0 + 32);
  msg = v43;
  v2 = *(_DWORD *)(v1 + 328);
  *(int32x2_t *)rcv_size = vdup_n_s32(0x1044u);
  v3 = mach_msg(v43, 2310, 0, 0x1044u, v2, 0, 0);
  if (v3 == 268451843)
    goto LABEL_40;
  if (v3 == 268451844)
  {
    WTF::Vector<char,4164ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::resize((uint64_t)&msg, v43[0].msgh_size + 68);
    v5 = msg;
    v3 = mach_msg(msg, 2310, 0, rcv_size[1], v2, 0, 0);
  }
  else
  {
    v5 = v43;
  }
  if (!v5 || v3)
    goto LABEL_40;
  msgh_id = v5->msgh_id;
  if (msgh_id != 230297018 && msgh_id != 230301114)
  {
    if (msgh_id == 70)
      IPC::Connection::connectionDidClose((IPC::Connection *)v1);
    goto LABEL_40;
  }
  v8 = rcv_size[1];
  msgh_size = v5->msgh_size;
  if (msgh_size > rcv_size[1])
  {
    v30 = off_1ECE71C40;
    if (!os_log_type_enabled((os_log_t)off_1ECE71C40, OS_LOG_TYPE_FAULT))
      goto LABEL_40;
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = msgh_size;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v8;
    v31 = "createMessageDecoder: msgh_size is greater than bufferSize (header->msgh_size: %lu, bufferSize: %lu)";
LABEL_44:
    v32 = v30;
    v33 = 22;
LABEL_53:
    _os_log_fault_impl(&dword_196BCC000, v32, OS_LOG_TYPE_FAULT, v31, buf, v33);
    goto LABEL_40;
  }
  if ((v5->msgh_bits & 0x80000000) == 0)
  {
    if (msgh_size >= 0x18)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      IPC::Decoder::create((WTF *)(msgh_size - 24), &v5[1], (uint64_t *)buf, &v40);
      v10 = (uint64_t *)buf;
      goto LABEL_31;
    }
    v30 = off_1ECE71C40;
    if (!os_log_type_enabled((os_log_t)off_1ECE71C40, OS_LOG_TYPE_FAULT))
      goto LABEL_40;
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = msgh_size;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = 24;
    v31 = "createMessageDecoder: Overflow when computing bodySize (header->msgh_size: %lu, sizeof(mach_msg_header_t): %lu)";
    goto LABEL_44;
  }
  msgh_bits = v5[1].msgh_bits;
  if (!(_DWORD)msgh_bits)
    goto LABEL_40;
  v12 = 12 * msgh_bits + 28;
  if (v12 > rcv_size[1])
  {
    v38 = off_1ECE71C40;
    if (!os_log_type_enabled((os_log_t)off_1ECE71C40, OS_LOG_TYPE_FAULT))
      goto LABEL_40;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = msgh_bits;
    v31 = "createMessageDecoder: Overflow when computing sizeWithPortDescriptors (numberOfPortDescriptors: %lu)";
    v32 = v38;
    v33 = 12;
    goto LABEL_53;
  }
  p_msgh_size = &v5[1].msgh_size;
  v45 = 0;
  v46 = 0;
  v14 = msgh_bits - (msgh_id == 230301114);
  v47 = v14;
  if ((_DWORD)v14)
  {
    if (v14 >> 30)
    {
LABEL_70:
      __break(0xC471u);
      JUMPOUT(0x196BE7348);
    }
    v15 = (void *)WTF::fastMalloc((WTF *)(4 * v14));
    v46 = v14;
    v45 = v15;
    if (v47)
      bzero(v15, 4 * v47);
    while (!*((_BYTE *)p_msgh_size + 11))
    {
      WTF::MachSendRight::adopt((WTF::MachSendRight *)*p_msgh_size);
      WTF::MachSendRight::MachSendRight();
      if (v47 <= (int)v14 - 1)
        goto LABEL_70;
      WTF::MachSendRight::operator=();
      WTF::MachSendRight::~MachSendRight((WTF::MachSendRight *)v44);
      p_msgh_size += 3;
      WTF::MachSendRight::~MachSendRight((WTF::MachSendRight *)buf);
      if (!--v14)
        goto LABEL_24;
    }
    goto LABEL_67;
  }
LABEL_24:
  if (msgh_id == 230301114)
  {
    v17 = p_msgh_size[2];
    if (HIBYTE(v17) == 1)
    {
      v18 = *(_QWORD *)p_msgh_size;
      v19 = p_msgh_size[3];
      p_msgh_size[2] = v17 & 0xFFFFFF00;
      v20 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v20 = off_1E35089A0;
      *(_QWORD *)buf = v20;
      IPC::Decoder::create(v18, v19, (uint64_t *)buf, (uint64_t *)&v45, &v40);
      v21 = *(_QWORD *)buf;
      *(_QWORD *)buf = 0;
      if (v21)
        (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
      goto LABEL_30;
    }
    goto LABEL_67;
  }
  v16 = v5->msgh_size;
  if (v16 < v12)
  {
    v39 = off_1ECE71C40;
    if (os_log_type_enabled((os_log_t)off_1ECE71C40, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v12;
      _os_log_fault_impl(&dword_196BCC000, v39, OS_LOG_TYPE_FAULT, "createMessageDecoder: Overflow when computing bodySize (header->msgh_size: %lu, sizeWithPortDescriptors: %lu)", buf, 0x16u);
    }
LABEL_67:
    v40 = 0;
    goto LABEL_30;
  }
  IPC::Decoder::create((WTF *)(v16 - v12), p_msgh_size, (uint64_t *)&v45, &v40);
LABEL_30:
  v10 = (uint64_t *)&v45;
LABEL_31:
  WTF::Vector<WTF::MachSendRight,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v10, v4);
  if (!v40)
    goto LABEL_40;
  if (*((_WORD *)v40 + 25) != 2819)
  {
    if (qword_1ECE73480 != -1)
      dispatch_once(&qword_1ECE73480, &__block_literal_global_43);
    if (byte_1ECE7344A)
    {
      v34 = qword_1ECE71BC8;
      if (os_log_type_enabled((os_log_t)qword_1ECE71BC8, OS_LOG_TYPE_DEFAULT))
      {
        v35 = *((unsigned __int16 *)v40 + 25);
        if (v35 >= 0xE98)
          v35 = 3736;
        v36 = (&IPC::Detail::messageDescriptions)[3 * v35];
        v37 = *(_DWORD *)(v1 + 328);
        *(_DWORD *)buf = 134218498;
        *(_QWORD *)&buf[4] = v1;
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)&buf[14] = v36;
        v49 = 1024;
        v50 = v37;
        _os_log_impl(&dword_196BCC000, v34, OS_LOG_TYPE_DEFAULT, "Connection::processIncomingMessage(%p) received %{public}s from port 0x%08x", buf, 0x1Cu);
      }
    }
    v22 = v40;
    v40 = 0;
    *(_QWORD *)buf = v22;
    IPC::Connection::processIncomingMessage(v1, (IPC::Decoder **)buf);
    v23 = *(IPC::Decoder **)buf;
    *(_QWORD *)buf = 0;
    if (v23)
    {
      IPC::Decoder::~Decoder(v23);
      WTF::fastFree(v24, v25);
    }
    goto LABEL_38;
  }
  if (!*(_BYTE *)(v1 + 72))
  {
    IPC::Decoder::takeLastAttachment(v40, buf);
    if (buf[4])
    {
      *(_BYTE *)(v1 + 72) = 1;
      if ((*(_DWORD *)buf + 1) < 2)
      {
LABEL_59:
        WTF::MachSendRight::~MachSendRight((WTF::MachSendRight *)buf);
        goto LABEL_38;
      }
      *(_DWORD *)(v1 + 312) = WTF::MachSendRight::leakSendRight((WTF::MachSendRight *)buf);
      IPC::Connection::initializeSendSource((IPC::Connection *)v1);
    }
    else
    {
      IPC::Connection::connectionDidClose((IPC::Connection *)v1);
    }
    if (!buf[4])
      goto LABEL_38;
    goto LABEL_59;
  }
  IPC::Connection::connectionDidClose((IPC::Connection *)v1);
LABEL_38:
  v26 = v40;
  v40 = 0;
  if (v26)
  {
    IPC::Decoder::~Decoder(v26);
    WTF::fastFree(v27, v28);
  }
LABEL_40:
  result = (WTF *)msg;
  if (v43 != msg)
  {
    if (msg)
    {
      msg = 0;
      rcv_size[0] = 0;
      return (WTF *)WTF::fastFree(result, v4);
    }
  }
  return result;
}

@end
