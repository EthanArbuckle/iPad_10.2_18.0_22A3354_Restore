@implementation AURIOCallbackReceiver

void __AURIOCallbackReceiver_IOFormatsChanged_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  int ServerPort;
  int v7;
  void **v8;
  int *v9;
  mach_port_t reply_port;
  mach_msg_return_t v11;
  mach_msg_return_t v12;
  int v13;
  int v14;
  NSObject *v15;
  uint64_t Element;
  uint64_t v17;
  void *v18;
  unsigned int **v19;
  const AudioChannelLayout *v20;
  CAAudioChannelLayout *v21;
  CAAudioChannelLayout *v22;
  NSObject **v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  void *v28;
  int v29;
  AudioStreamBasicDescription *v30;
  uint64_t v31;
  AudioStreamBasicDescription *v32;
  uint64_t v33;
  int v34;
  int v35;
  unsigned int *v36;
  unsigned int v37;
  int v38;
  uint64_t v39;
  _BYTE v40[32];
  unsigned int *v41;
  char v42;
  uint64_t v43;
  void *v44;
  void *v45;
  CAAudioChannelLayout *v46;
  void (*v47)(CAAudioChannelLayout *);
  CAAudioChannelLayout *v48;
  void (*v49)(CAAudioChannelLayout *);
  _QWORD v50[2];
  int v51;
  char v52;
  _QWORD v53[2];
  int v54;
  char v55;
  AudioStreamBasicDescription v56;
  AudioStreamBasicDescription v57;
  _QWORD v58[2];
  char v59;
  uint64_t *v60;
  int *v61;
  void **v62;
  int *v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  int v67;
  _BYTE msg[116];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v2 = gRIOMutex;
  if (gRIOMutex)
    (*(void (**)(uint64_t))(*(_QWORD *)gRIOMutex + 16))(gRIOMutex);
  ResolvedOpaqueRef<TOpaqueRef<AURemoteIO>>::ResolvedOpaqueRef((uint64_t)v40, *(_DWORD *)(a1 + 32));
  if (v43)
  {
    v3 = *(_QWORD *)(v43 + 16);
    v4 = *(_DWORD *)(a1 + 36);
    v5 = *(_QWORD *)(v3 + 472);
    if (v5)
      (*(void (**)(_QWORD))(*(_QWORD *)v5 + 16))(*(_QWORD *)(v3 + 472));
    v59 = 1;
    v58[0] = &off_24CA91638;
    v58[1] = 1024;
    v60 = &v64;
    v61 = &v65;
    v62 = (void **)&v66;
    v63 = &v67;
    v65 = 0;
    v66 = 0;
    v67 = 0;
    v53[1] = 0;
    v53[0] = &off_24CA949A0;
    v54 = 0;
    v55 = 1;
    v50[1] = 0;
    v50[0] = &off_24CA949A0;
    v51 = 0;
    v52 = 1;
    RIOServer::GetServerPort((const char **)gRIOServer);
    ServerPort = RIOServer::GetServerPort((const char **)gRIOServer);
    v7 = *(_DWORD *)(v3 + 712);
    v8 = v62;
    v9 = v63;
    v72 = 0;
    v71 = 0u;
    v70 = 0u;
    v69 = 0u;
    memset(&msg[4], 0, 112);
    *(_QWORD *)&msg[24] = *MEMORY[0x24BDAC470];
    *(_DWORD *)&msg[32] = v7;
    reply_port = mig_get_reply_port();
    *(_DWORD *)&msg[12] = reply_port;
    *(_DWORD *)msg = 5395;
    *(_DWORD *)&msg[8] = ServerPort;
    *(_QWORD *)&msg[16] = 0x157C600000000;
    if (MEMORY[0x24BDB0418])
    {
      voucher_mach_msg_set((mach_msg_header_t *)msg);
      reply_port = *(_DWORD *)&msg[12];
    }
    v11 = mach_msg((mach_msg_header_t *)msg, 275, 0x24u, 0xACu, reply_port, *MEMORY[0x24BDB6D08], 0);
    v12 = v11;
    if ((v11 - 268435458) <= 0xE && ((1 << (v11 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(*(mach_port_t *)&msg[12]);
    }
    else
    {
      if (!v11)
      {
        if (*(_DWORD *)&msg[20] == 88106
          && (*(_DWORD *)msg & 0x80000000) != 0
          && *(_DWORD *)&msg[24] == 3
          && *(_DWORD *)&msg[4] == 164
          && !*(_DWORD *)&msg[8]
          && msg[39] == 1
          && *(unsigned __int16 *)&msg[54] << 16 == 1114112
          && *(unsigned __int16 *)&msg[66] << 16 == 1114112)
        {
          v13 = *(_DWORD *)&msg[40];
          if (*(_DWORD *)&msg[40] == DWORD2(v71))
          {
            v57 = *(AudioStreamBasicDescription *)&msg[76];
            *(_QWORD *)&v56.mBitsPerChannel = v71;
            *(_OWORD *)&v56.mSampleRate = v69;
            *(_OWORD *)&v56.mBytesPerPacket = v70;
            *v8 = *(void **)&msg[28];
            *v9 = v13;
            v54 = *(_DWORD *)&msg[44];
            v51 = *(_DWORD *)&msg[56];
            goto LABEL_30;
          }
        }
LABEL_29:
        mach_msg_destroy((mach_msg_header_t *)msg);
LABEL_30:
        v14 = _CheckRPCError("IOFormatsChanged");
        if (v14)
        {
          if (kRIOClientSubsystem)
          {
            v15 = *(NSObject **)kRIOClientSubsystem;
            if (!*(_QWORD *)kRIOClientSubsystem)
            {
LABEL_97:
              SharableMemoryBlock::MachClientToken::~MachClientToken((SharableMemoryBlock::MachClientToken *)v50);
              SharableMemoryBlock::MachClientToken::~MachClientToken((SharableMemoryBlock::MachClientToken *)v53);
              MIGVariableLengthRefs::~MIGVariableLengthRefs((MIGVariableLengthRefs *)v58);
              if (v5)
                (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
              goto LABEL_99;
            }
          }
          else
          {
            v15 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)msg = 136315650;
            *(_QWORD *)&msg[4] = "AURemoteIO.cpp";
            *(_WORD *)&msg[12] = 1024;
            *(_DWORD *)&msg[14] = 1709;
            *(_WORD *)&msg[18] = 1024;
            *(_DWORD *)&msg[20] = v14;
            _os_log_impl(&dword_210A23000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d error %d from GetCurrentFormats", msg, 0x18u);
          }
          goto LABEL_97;
        }
        AUConverterRTMutex::lock((AUConverterRTMutex *)(v3 + 528));
        Element = ausdk::AUScope::SafeGetElement((ausdk::AUScope *)(v3 + 128), 0);
        v17 = ausdk::AUScope::SafeGetElement((ausdk::AUScope *)(v3 + 80), 1u);
        v48 = 0;
        v49 = (void (*)(CAAudioChannelLayout *))MEMORY[0x24BDAE450];
        v46 = 0;
        v47 = (void (*)(CAAudioChannelLayout *))MEMORY[0x24BDAE450];
        if (*v62)
          v18 = *v62;
        else
          v18 = v60;
        v19 = (unsigned int **)&v63;
        if (!*v62)
          v19 = (unsigned int **)&v61;
        AURIOClientMessageReader::ParseLayouts(v18, **v19, (uint64_t *)&v48, (uint64_t *)&v46);
        v21 = v48;
        if (v48)
          HIDWORD(v39) = !CAAudioChannelLayout::AreLayoutsEquivalent((const AudioChannelLayout *)v48, *(const AudioChannelLayout **)(Element + 120), v20);
        else
          HIDWORD(v39) = 0;
        v22 = v46;
        v38 = v4;
        if (v46)
          LODWORD(v39) = !CAAudioChannelLayout::AreLayoutsEquivalent((const AudioChannelLayout *)v46, *(const AudioChannelLayout **)(v17 + 120), v20);
        else
          LODWORD(v39) = 0;
        v23 = (NSObject **)kRIOClientSubsystem;
        if (kRIOClientSubsystem)
        {
          v24 = *(NSObject **)kRIOClientSubsystem;
          if (!*(_QWORD *)kRIOClientSubsystem)
          {
LABEL_70:
            v29 = *(_DWORD *)(v3 + 612) & ~*(_DWORD *)(v3 + 1012);
            if ((v29 & 2) != 0)
              v30 = &v57;
            else
              v30 = 0;
            if ((v29 & 2) != 0)
              v31 = (uint64_t)v21;
            else
              v31 = 0;
            if ((v29 & 1) != 0)
              v32 = &v56;
            else
              v32 = 0;
            if ((v29 & 1) != 0)
              v33 = (uint64_t)v22;
            else
              v33 = 0;
            AURemoteIO::ChangeHardwareFormats((_BYTE *)v3, v30, v32, v31, v33, (int *)(v3 + 616), (uint64_t)v53, (uint64_t)v50);
            AUConverterBase::SetupAllConverters((AUConverterBase *)v3, 0);
            AUIOHelper::Initialize((AUIOHelper *)(v3 + 800));
            RIOServer::GetServerPort((const char **)gRIOServer);
            v34 = RIOServer::GetServerPort((const char **)gRIOServer);
            v35 = *(_DWORD *)(v3 + 712);
            *(_QWORD *)&msg[24] = *MEMORY[0x24BDAC470];
            *(_DWORD *)&msg[32] = v35;
            *(_DWORD *)&msg[36] = v38;
            *(_QWORD *)msg = 19;
            *(_DWORD *)&msg[20] = 88011;
            *(_DWORD *)&msg[16] = 0;
            *(_DWORD *)&msg[8] = v34;
            *(_DWORD *)&msg[12] = 0;
            if (MEMORY[0x24BDB0418])
              voucher_mach_msg_set((mach_msg_header_t *)msg);
            if (mach_msg((mach_msg_header_t *)msg, 17, 0x28u, 0, 0, *MEMORY[0x24BDB6D08], 0) == 268435460)
            {
              if ((*(_WORD *)msg & 0x1F00) == 0x1100)
                mach_port_deallocate(*MEMORY[0x24BDAEC58], *(mach_port_name_t *)&msg[12]);
              mach_msg_destroy((mach_msg_header_t *)msg);
            }
            _CheckRPCError("IOFormatsChanged");
            if (HIDWORD(v39))
              (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)v3 + 432))(v3, 19, 2, 0);
            if ((_DWORD)v39)
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v3 + 432))(v3, 19, 1, 1);
            v46 = 0;
            if (v22)
              v47(v22);
            v48 = 0;
            if (v21)
              v49(v21);
            AUConverterRTMutex::unlock((AUConverterRTMutex *)(v3 + 528));
            goto LABEL_97;
          }
        }
        else
        {
          v24 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          CAFormatter::CAFormatter((CAFormatter *)&v45, &v57);
          v25 = v45;
          CAFormatter::CAFormatter((CAFormatter *)&v44, &v56);
          *(_DWORD *)msg = 136316162;
          *(_QWORD *)&msg[4] = "AURemoteIO.cpp";
          *(_WORD *)&msg[12] = 1024;
          *(_DWORD *)&msg[14] = 1732;
          *(_WORD *)&msg[18] = 2048;
          *(_QWORD *)&msg[20] = v3;
          *(_WORD *)&msg[28] = 2080;
          *(_QWORD *)&msg[30] = v25;
          *(_WORD *)&msg[38] = 2080;
          *(_QWORD *)&msg[40] = v44;
          _os_log_impl(&dword_210A23000, v24, OS_LOG_TYPE_DEBUG, "%25s:%-5d AURemoteIO(%p)::IOFormatsChanged:\n  output: %s\n  input:  %s", msg, 0x30u);
          if (v44)
            free(v44);
          if (v45)
            free(v45);
          v23 = (NSObject **)kRIOClientSubsystem;
        }
        if (v23)
        {
          v26 = *v23;
          if (!*v23)
            goto LABEL_70;
        }
        else
        {
          v26 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          if (v39)
            v27 = "changed";
          else
            v27 = "unchanged";
          MEMORY[0x212BCD4E8](&v45, v21);
          v28 = v45;
          MEMORY[0x212BCD4E8](&v44, v22);
          *(_DWORD *)msg = 136316418;
          *(_QWORD *)&msg[4] = "AURemoteIO.cpp";
          *(_WORD *)&msg[12] = 1024;
          *(_DWORD *)&msg[14] = 1736;
          *(_WORD *)&msg[18] = 2048;
          *(_QWORD *)&msg[20] = v3;
          *(_WORD *)&msg[28] = 2080;
          *(_QWORD *)&msg[30] = v27;
          *(_WORD *)&msg[38] = 2080;
          *(_QWORD *)&msg[40] = v28;
          *(_WORD *)&msg[48] = 2080;
          *(_QWORD *)&msg[50] = v44;
          _os_log_impl(&dword_210A23000, v26, OS_LOG_TYPE_DEBUG, "%25s:%-5d AURemoteIO(%p)::IOFormatsChanged: layout (%s)\n  output: %s\n  input:  %s", msg, 0x3Au);
          if (v44)
            free(v44);
          if (v45)
            free(v45);
        }
        goto LABEL_70;
      }
      mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
    }
    if (v12 != 268435460)
      goto LABEL_30;
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x24BDAEC58], *(mach_port_name_t *)&msg[12]);
    goto LABEL_29;
  }
LABEL_99:
  if (v42)
  {
    v36 = v41;
    if (v41)
    {
      do
        v37 = __ldaxr(v36);
      while (__stlxr(v37 - 1, v36));
    }
  }
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
}

void __AURIOCallbackReceiver_SessionDeactivated_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  NSObject *v9;
  unsigned int *v10;
  unsigned int v11;
  _BYTE v12[32];
  unsigned int *v13;
  char v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  ResolvedOpaqueRef<TOpaqueRef<AURemoteIO>>::ResolvedOpaqueRef((uint64_t)v12, *(_DWORD *)(a1 + 32));
  if (!v15)
    goto LABEL_29;
  v1 = *(_QWORD *)(v15 + 16);
  v2 = *(_QWORD *)(v1 + 472);
  if (v2)
    (*(void (**)(_QWORD))(*(_QWORD *)v2 + 16))(*(_QWORD *)(v1 + 472));
  v3 = *(unsigned __int8 *)(v1 + 1300);
  *(_BYTE *)(v1 + 1300) = 0;
  if (!v3)
  {
    if (kRIOClientSubsystem)
    {
      v5 = *(NSObject **)kRIOClientSubsystem;
      if (!*(_QWORD *)kRIOClientSubsystem)
        goto LABEL_27;
    }
    else
    {
      v5 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    *(_DWORD *)buf = 136315650;
    v17 = "AURemoteIO.cpp";
    v18 = 1024;
    v19 = 2379;
    v20 = 2048;
    v21 = v1;
    v6 = "%25s:%-5d AURemoteIO@%p: Pending stop was cancelled";
    v7 = v5;
    v8 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_17;
  }
  if ((int)*MEMORY[0x24BDB6D10] <= 0 && (*(_DWORD *)(v1 + 560) - 6) <= 0xFFFFFFFB)
  {
    if (*(_BYTE *)(v1 + 558))
    {
      if (kRIOClientSubsystem)
      {
        v4 = *(NSObject **)kRIOClientSubsystem;
        if (!*(_QWORD *)kRIOClientSubsystem)
        {
LABEL_26:
          (*(void (**)(uint64_t))(*(_QWORD *)v1 + 448))(v1);
          goto LABEL_27;
        }
      }
      else
      {
        v4 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v17 = "AURemoteIO.cpp";
        v18 = 1024;
        v19 = 2384;
        v20 = 2048;
        v21 = v1;
        _os_log_impl(&dword_210A23000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AURemoteIO@%p: Session interrupted, will stop iounit", buf, 0x1Cu);
      }
      goto LABEL_26;
    }
    if (kRIOClientSubsystem)
    {
      if ((*(_BYTE *)(kRIOClientSubsystem + 8) & 1) != 0)
      {
        v9 = *(NSObject **)kRIOClientSubsystem;
        if (*(_QWORD *)kRIOClientSubsystem)
        {
          if (os_log_type_enabled(*(os_log_t *)kRIOClientSubsystem, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v17 = "AURemoteIO.cpp";
            v18 = 1024;
            v19 = 2387;
            v20 = 2048;
            v21 = v1;
            v6 = "%25s:%-5d AURemoteIO@%p: Session interrupted, iounit not running, nothing to do";
            v7 = v9;
            v8 = OS_LOG_TYPE_DEBUG;
LABEL_17:
            _os_log_impl(&dword_210A23000, v7, v8, v6, buf, 0x1Cu);
          }
        }
      }
    }
  }
LABEL_27:
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
LABEL_29:
  if (v14)
  {
    v10 = v13;
    if (v13)
    {
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
    }
  }
}

@end
