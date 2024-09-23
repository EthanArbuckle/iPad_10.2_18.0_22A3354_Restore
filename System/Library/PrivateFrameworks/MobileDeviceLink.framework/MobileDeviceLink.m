void genericIncomingConnectionCallback(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  CFTypeRef cf;

  cf = 0;
  if (DLShouldLog(5))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericIncomingConnectionCallback", 5, CFSTR("genericIncomingConnectionCallback called"), v4, v5, v6, v7, v12);
  if (DLDeviceReady(a1, &cf, v2, v3, v4, v5, v6, v7))
  {
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericIncomingConnectionCallback", 3, CFSTR("DLDeviceReady failed: %@"), v8, v9, v10, v11, (char)cf);
    if (cf)
      CFRelease(cf);
  }
}

void genericConnectionMadeCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (DLShouldLog(5))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericConnectionMadeCallback", 5, CFSTR("genericConnectionMadeCallback called"), v9, v10, v11, v12, a9);
}

uint64_t genericConnectionFailedCallback(uint64_t a1, const __CFString *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;

  if (DLShouldLog(5))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericConnectionFailedCallback", 5, CFSTR("genericConnectionFailedCallback called with reason %@"), v4, v5, v6, v7, (char)a2);
  if (a2)
    v8 = a2;
  else
    v8 = CFSTR("Lost connection");
  return (*(uint64_t (**)(uint64_t, const __CFString *))(*(_QWORD *)(a1 + 40) + 32))(a1, v8);
}

uint64_t genericAcceptFailedCallback(uint64_t a1, const __CFString *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;

  if (DLShouldLog(5))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericAcceptFailedCallback", 5, CFSTR("genericAcceptFailedCallback called with reason %@"), v4, v5, v6, v7, (char)a2);
  if (a2)
    v8 = a2;
  else
    v8 = CFSTR("Accept failed");
  return (*(uint64_t (**)(uint64_t, const __CFString *))(*(_QWORD *)(a1 + 40) + 32))(a1, v8);
}

void genericDisconnectCallback(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (DLShouldLog(5))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericDisconnectCallback", 5, CFSTR("genericDisconnectCallback called with reason: %@"), v3, v4, v5, v6, a2);
}

uint64_t genericConnectionLostCallback(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;

  if (DLShouldLog(5))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericConnectionLostCallback", 5, CFSTR("genericConnectionLostCallback called"), v2, v3, v4, v5, v7);
  return (*(uint64_t (**)(uint64_t, const __CFString *))(*(_QWORD *)(a1 + 40) + 32))(a1, CFSTR("Lost connection"));
}

void genericProcessMessageCallback(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (DLShouldLog(7))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericProcessMessageCallback", 7, CFSTR("genericProcessMessageCallback called with message: %@"), v10, v11, v12, v13, a2);
  if (DLShouldLog(4))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericProcessMessageCallback", 4, CFSTR("genericProcessMessageCallback was never overridden. This method does nothing. Your app will probably hang here."), v14, v15, v16, v17, a9);
}

void genericPingCallback(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (DLShouldLog(6))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericPingCallback", 6, CFSTR("genericPingCallback called with reason: %@"), v3, v4, v5, v6, a2);
}

void printFileTransferStatus(const __CFDictionary *a1)
{
  char Value;
  const __CFDictionary *v3;
  const __CFNumber *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFNumber *v9;
  const __CFNumber *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int valuePtr;

  Value = CFDictionaryGetValue(a1, CFSTR("DLFileDest"));
  v3 = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("DLFileAttributesKey"));
  valuePtr = 0;
  v4 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("DLFileStatusKey"));
  if (v4)
  {
    CFNumberGetValue(v4, kCFNumberIntType, &valuePtr);
    if (valuePtr == 1)
    {
      if (v3)
      {
        v23 = 0;
        v24 = 0;
        v9 = (const __CFNumber *)CFDictionaryGetValue(v3, CFSTR("FileSize"));
        v10 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("DLFileOffsetKey"));
        CFNumberGetValue(v9, kCFNumberSInt64Type, &v24);
        CFNumberGetValue(v10, kCFNumberSInt64Type, &v23);
        if (DLShouldLog(5))
          _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "printFileTransferStatus", 5, CFSTR("Transfer status for \"%@\": %3.2f%% complete."), v11, v12, v13, v14, Value);
      }
      else if (DLShouldLog(5))
      {
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "printFileTransferStatus", 5, CFSTR("Transfer status for \"%@\": UNKNOWN"), v19, v20, v21, v22, Value);
      }
    }
    else if (valuePtr == 3)
    {
      if (DLShouldLog(5))
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "printFileTransferStatus", 5, CFSTR("Transfer of file \"%@\" failed."), v15, v16, v17, v18, Value);
    }
    else if (valuePtr == 2 && DLShouldLog(5))
    {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "printFileTransferStatus", 5, CFSTR("Transfer of file \"%@\" completed successfully."), v5, v6, v7, v8, Value);
    }
  }
}

void genericSendFileCallback(uint64_t a1, const __CFData *a2, const __CFDictionary *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFStringRef v16;

  v16 = 0;
  if (a3)
  {
    printFileTransferStatus(a3);
    if (a2)
      DLHandleSentFilePiece(a1, a2, a3, &v16);
  }
  else if (DLShouldLog(3))
  {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericSendFileCallback", 3, CFSTR("No info dictionary passed to genericSendFileCallback"), v12, v13, v14, v15, a9);
  }
}

void genericRequestFileCallback(uint64_t a1, const __CFString *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (DLShouldLog(5))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericRequestFileCallback", 5, CFSTR("genericRequestFileCallback called for file \"%@\" and info %@"), v6, v7, v8, v9, (char)a2);
  v18 = 0;
  if (DLSendFile(a1, a2, a3, (uint64_t)&v18, v6, v7, v8, v9) && DLShouldLog(3))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericRequestFileCallback", 3, CFSTR("Could not send the file at %@: %@"), v10, v11, v12, v13, (char)a2);
  if (DLWaitForMessage(a1))
  {
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericRequestFileCallback", 3, CFSTR("Could not send the file at %@: %@"), v14, v15, v16, v17, (char)a2);
  }
}

void genericProgressCallback(__n128 a1)
{
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = a1.n128_u8[0];
  if (DLShouldLog(6))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericProgressCallback", 6, CFSTR("genericProgressCallback called with percentage: %f"), v2, v3, v4, v5, v1);
}

CFDataRef _RunLoopReadSourceCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _DLHandlerThreadMessagePortCallback(a1, 5, 0, a1, a5, a6, a7, a8);
}

CFDataRef _DLHandlerThreadMessagePortCallback(int a1, int a2, CFDataRef xmlData, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  int v17;
  __CFString *v18;
  uint64_t v19;
  void *Value;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFData *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __CFMessagePort *v31;
  __CFMessagePort *v32;
  __CFRunLoop *Current;
  __CFMessagePort *v34;
  uint64_t v35;
  const __CFArray *v36;
  const __CFDictionary *ValueAtIndex;
  const __CFString *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const __CFData *v45;
  int v46;
  const __CFData *v47;
  int v48;
  const void *v49;
  const __CFData *Message;
  __CFMessagePort *v51;
  uint64_t v52;
  uint64_t v53;
  const __CFArray *v54;
  const __CFString *v55;
  const __CFString *v56;
  const __CFString *v57;
  __CFDictionary *MutableCopy;
  const __CFArray *v59;
  const __CFString *v60;
  const __CFString *v61;
  __CFDictionary *Mutable;
  const __CFDictionary *v64;
  const void *v65;
  const __CFString *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const __CFData *v73;
  int v74;
  int v75;
  const __CFData *v76;
  const __CFData *v77;
  CFStringRef v78;
  const __CFString *v79;
  int v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const __CFString *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  __CFDictionary *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const __CFData *v108;
  const __CFArray *v109;
  __CFDictionary *v110;
  const char *v111;
  char *v112;
  __CFDictionary *v113;
  const __CFNumber *v114;
  const __CFData *v115;
  const __CFData *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  __CFData *v121;
  const UInt8 *BytePtr;
  const UInt8 *v123;
  CCCryptorStatus v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  CFStringRef v133;
  const __CFString *v134;
  const __CFString *v135;
  const __CFString *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  CFTypeRef v141;
  const __CFData *v142;
  int v143;
  CFTypeRef v144;
  CFNumberRef v145;
  const __CFDictionary *v146;
  const __CFNumber *v147;
  int AppIntegerValue;
  size_t v150;
  size_t v151;
  char *v152;
  char *v153;
  CFIndex Length;
  size_t v156;
  CFNumberRef v157;
  int v159;
  CFNumberRef v160;
  CCCryptorStatus v161;
  char v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  const UInt8 *v167;
  CFIndex v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  CCCryptorStatus v177;
  char v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  const __CFString *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  const __CFData *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  int v201;
  uint64_t v202;
  const __CFData *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  CFStringRef v225;
  char v226;
  int *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  int *v233;
  CFNumberRef v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  const __CFData *v241;
  const __CFData *v242;
  char v243;
  uint64_t v244;
  char *v245;
  const __CFData *v246;
  const __CFAllocator *bytesDeallocator;
  FILE *__stream;
  CFTypeRef v249;
  CFTypeRef cf;
  uint64_t valuePtr;
  size_t v252;
  size_t dataOutMoved;
  int v254;
  uint64_t v255;
  Boolean keyExistsAndHasValidFormat;
  char v257;
  CFDataRef v258;
  CFDataRef theData;
  __int128 context;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  CFTypeRef v265[4];
  CFRange v266;

  v10 = a2;
  v249 = 0;
  cf = 0;
  if (a2 >= 16 && DLShouldLog(4))
  {
    v244 = a4;
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLHandlerThreadMessagePortCallback", 4, CFSTR("Handler thread invoked with unknown msgid %d for connection %p"), a5, a6, a7, a8, v10);
  }
  if (a4)
  {
    if (sSaveCallHistory == 1)
    {
      v11 = v10 <= 0xF ? sDLMessageStrings[v10] : "(Invalid Message Code)";
      v18 = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("-> Handling %s"), v11, v244);
      _DLCallHistoryAddEntry(v18);
      if (v18)
        CFRelease(v18);
    }
    switch(v10)
    {
      case 1u:
      case 3u:
        v19 = *(_QWORD *)(a4 + 64);
        sHandlerThreadConnectionSessionNumber = *(_DWORD *)(a4 + 4);
        if (!v19)
        {
          Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a4 + 120), CFSTR("DLInfoStreamTypeKey"));
          StreamHandlerForType(Value, a4 + 64, &cf);
        }
        if (v10 == 1)
        {
          if (StreamHandlerAccept(*(uint64_t (***)(void))(a4 + 64), *(_QWORD *)(a4 + 120), &cf))
          {
            if (DLShouldLog(3))
              _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLHandlerThreadMessagePortCallback", 3, CFSTR("Error calling accept: %@"), v21, v22, v23, v24, (char)cf);
            v25 = 0;
            v10 = 2;
            goto LABEL_137;
          }
          if ((_DLCheckVersionForAccept(a4, &v249) & 1) != 0)
          {
            v25 = 0;
            v10 = 1;
          }
          else
          {
            v134 = (const __CFString *)v249;
            if (!v249)
            {
              v134 = (const __CFString *)CFRetain(CFSTR("Unknown error"));
              v249 = v134;
            }
            v25 = (const __CFData *)_DLCreateMessageDataV(CFSTR("DLAcceptMessage"), 1, v89, v90, v91, v92, v93, v94, v134);
            v10 = 2;
          }
          goto LABEL_135;
        }
        if (cf)
        {
          CFRelease(cf);
          cf = 0;
        }
        v80 = StreamHandlerConnect(*(_QWORD *)(a4 + 64), *(_QWORD *)(a4 + 120), &cf);
        if (!v80)
        {
          if ((_DLCheckVersionForConnect(a4, &v249) & 1) != 0)
          {
            v25 = 0;
          }
          else
          {
            v135 = (const __CFString *)v249;
            if (!v249)
            {
              v135 = (const __CFString *)CFRetain(CFSTR("Unknown error"));
              v249 = v135;
            }
            v25 = (const __CFData *)_DLCreateMessageDataV(CFSTR("DLConnectMessage"), 1, v95, v96, v97, v98, v99, v100, v135);
            v10 = 4;
          }
LABEL_135:
          if (v249)
          {
            CFRelease(v249);
            v249 = 0;
          }
          goto LABEL_137;
        }
        v81 = v80;
        if (DLShouldLog(3))
          _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLHandlerThreadMessagePortCallback", 3, CFSTR("Error calling connect: %@"), v84, v85, v86, v87, (char)cf);
        v88 = (const __CFString *)cf;
        if (v81 == -5)
          v88 = CFSTR("DLErrorConnectingLocked");
        v249 = v88;
        v25 = (const __CFData *)_DLCreateMessageDataV(CFSTR("DLConnectMessage"), 1, v82, v83, v84, v85, v86, v87, v88);
        v10 = 4;
LABEL_137:
        if (cf)
        {
          CFRelease(cf);
          cf = 0;
        }
        v51 = *(__CFMessagePort **)(a4 + 96);
        v52 = sHandlerThreadConnectionSessionNumber | v10;
        v53 = a4;
        Message = v25;
LABEL_140:
        _SendMessage(v53, v51, (void (*)(_QWORD, uint64_t, const __CFData *, uint64_t))_DLMainThreadMessagePortCallback, v52, Message);
        return 0;
      case 5u:
        Message = _DLHandlerThreadReadMessage(a4);
        v51 = *(__CFMessagePort **)(a4 + 96);
        v52 = sHandlerThreadConnectionSessionNumber | 5u;
        v53 = a4;
        goto LABEL_140;
      case 6u:
        _DLHandlerThreadWriteMessage(a4, xmlData, (uint64_t)xmlData, a4, a5, a6, a7, a8, v243);
        return 0;
      case 7u:
      case 8u:
        v26 = *(_QWORD *)(a4 + 64);
        if (v26)
        {
          if (_DLSendData(v26, xmlData, &cf) && DLShouldLog(3))
            _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLHandlerThreadMessagePortCallback", 3, CFSTR("Could not send disconnect message: '%@'"), v27, v28, v29, v30, (char)cf);
          if (cf)
          {
            CFRelease(cf);
            cf = 0;
          }
          _DLCleanupStreamHandler(a4);
        }
        if (v10 == 8)
        {
          v31 = *(__CFMessagePort **)(a4 + 88);
          if (v31)
            DLThreadDeleteReceivePort(v31);
          v32 = *(__CFMessagePort **)(a4 + 104);
          if (v32)
            DLThreadDeleteSendPort(v32);
          Current = CFRunLoopGetCurrent();
          CFRunLoopStop(Current);
        }
        v34 = *(__CFMessagePort **)(a4 + 96);
        v35 = sHandlerThreadConnectionSessionNumber | v10;
        if (v34)
          DLThreadSendMessage(v34, v35, 0);
        else
          _DLMainThreadMessagePortCallback(0, v35, 0, (void (***)(_QWORD, _QWORD))a4, a5, a6, a7, a8);
        return 0;
      case 9u:
        _DLCleanupStreamHandler(a4);
        return 0;
      case 0xAu:
        if (!*(_QWORD *)(a4 + 64))
        {
          if (!DLShouldLog(4))
            return 0;
          v16 = CFSTR("RequestFileMessage called in HandlerThread, but StreamHandler is NULL");
          goto LABEL_103;
        }
        v54 = (const __CFArray *)CFPropertyListCreateFromXMLData(0, xmlData, 0, (CFStringRef *)&cf);
        v55 = _DLGetParameterAtIndexWithDefaultValue(v54, 1, 0);
        v56 = _DLGetParameterAtIndexWithDefaultValue(v54, 2, 0);
        v57 = _DLGetParameterAtIndexWithDefaultValue(v54, 3, 0);
        if (v57)
          MutableCopy = CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)v57);
        else
          MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        v101 = MutableCopy;
        CFDictionarySetValue(MutableCopy, CFSTR("DLFileSource"), v55);
        CFDictionarySetValue(v101, CFSTR("DLFileDest"), v56);
        v108 = (const __CFData *)_DLCreateMessageDataV(CFSTR("DLRequestFile"), 3, v102, v103, v104, v105, v106, v107, v55);
        _DLSendDataAndDisconnectOnError(a4, v108);
        CFRelease(v108);
        CFRelease(v101);
        if (v54)
        {
          v109 = v54;
          goto LABEL_276;
        }
        return 0;
      case 0xBu:
        if (*(_QWORD *)(a4 + 64))
        {
          v59 = (const __CFArray *)CFPropertyListCreateFromXMLData(0, xmlData, 0, (CFStringRef *)&cf);
          v60 = _DLGetParameterAtIndexWithDefaultValue(v59, 1, 0);
          v61 = _DLGetParameterAtIndexWithDefaultValue(v59, 2, 0);
          if (v61)
            Mutable = CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)v61);
          else
            Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
          v110 = Mutable;
          if (v60)
            CFDictionarySetValue(Mutable, CFSTR("DLFileSource"), v60);
          v111 = (const char *)DLCreateCStringFromCFString(v60);
          if (v111)
          {
            v112 = (char *)v111;
            __stream = fopen(v111, "r");
            if (__stream)
            {
              free(v112);
              v113 = DLCopyFileAttributes(v60);
              CFDictionarySetValue(v110, CFSTR("DLFileAttributesKey"), v113);
              v114 = (const __CFNumber *)CFDictionaryGetValue(v113, CFSTR("FileSize"));
              if (v113)
                CFRelease(v113);
              if (!v114)
                goto LABEL_263;
              valuePtr = 0;
              CFNumberGetValue(v114, kCFNumberIntType, &valuePtr);
              *__error() = 0;
              theData = 0;
              *(_QWORD *)&context = 0;
              v257 = 0;
              v115 = (const __CFData *)CFDictionaryGetValue(v110, CFSTR("DLFileEncryptionKey"));
              if (v115)
              {
                v116 = v115;
                if (DLShouldLog(6))
                  _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFileBytes", 6, CFSTR("The caller has requested that this file be encrypted before sending it. Starting up the encryption engine"), v117, v118, v119, v120, v243);
                v257 = 1;
                v258 = 0;
                v121 = createFileAuthBlob(v116, &theData, &v258);
                if (!v121)
                {
                  if (DLShouldLog(3))
                    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFileBytes", 3, CFSTR("Could not create encrypted auth data"), v205, v206, v207, v208, v243);
                  if (v258)
                    CFRelease(v258);
                  goto LABEL_239;
                }
                BytePtr = CFDataGetBytePtr(theData);
                v123 = CFDataGetBytePtr(v258);
                v124 = CCCryptorCreate(0, 0, 1u, BytePtr, 0x20uLL, v123, (CCCryptorRef *)&context);
                if (v258)
                {
                  CFRelease(v258);
                  v258 = 0;
                }
                if (v124)
                {
                  if (DLShouldLog(3))
                    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFileBytes", 3, CFSTR("Could not create an encryptor! Refusing to send the file"), v125, v126, v127, v128, v243);
LABEL_239:
                  LOBYTE(v114) = 1;
LABEL_257:
                  if ((_QWORD)context)
                    CCCryptorRelease((CCCryptorRef)context);
                  if (v121)
                    CFRelease(v121);
                  if (theData)
                    CFRelease(theData);
LABEL_263:
                  fclose(__stream);
                  v141 = cf;
LABEL_264:
                  if (v141)
                  {
                    CFDictionarySetValue(v110, CFSTR("DLFileErrorString"), v141);
                    CFRelease(cf);
                  }
                  if ((v114 & 1) == 0)
                  {
                    LODWORD(context) = 3;
                    v234 = CFNumberCreate(0, kCFNumberIntType, &context);
                    CFDictionarySetValue(v110, CFSTR("DLFileStatusKey"), v234);
                    if (v234)
                      CFRelease(v234);
                    v241 = (const __CFData *)_DLCreateMessageDataV(CFSTR("DLSendFile"), 2, v235, v236, v237, v238, v239, v240, 0);
                    v242 = v241;
                    if (v241)
                      CFRetain(v241);
                    _SendMessage(a4, *(__CFMessagePort **)(a4 + 96), (void (*)(_QWORD, uint64_t, const __CFData *, uint64_t))_DLMainThreadMessagePortCallback, sHandlerThreadConnectionSessionNumber | 0xBu, v242);
                    _DLSendDataAndDisconnectOnError(a4, v242);
                  }
                  if (v59)
                    CFRelease(v59);
                  if (v110)
                  {
                    v109 = v110;
LABEL_276:
                    CFRelease(v109);
                  }
                  return 0;
                }
                if (DLShouldLog(6))
                  _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFileBytes", 6, CFSTR("Successfully created an encryptor. Hang on to your initialization vectors, it's going to be a wild ride!"), v213, v214, v215, v216, v243);
              }
              else
              {
                v121 = 0;
              }
              v145 = CFNumberCreate(0, kCFNumberCharType, &v257);
              CFDictionarySetValue(v110, CFSTR("DLFileIsEncrypted"), v145);
              if (v145)
                CFRelease(v145);
              CFDictionaryRemoveValue(v110, CFSTR("DLFileEncryptionKey"));
              v258 = (CFDataRef)-1;
              v146 = (const __CFDictionary *)CFDictionaryGetValue(v110, CFSTR("DLFileAttributesKey"));
              if (v146)
              {
                v147 = (const __CFNumber *)CFDictionaryGetValue(v146, CFSTR("FileSize"));
                if (v147)
                  CFNumberGetValue(v147, kCFNumberLongLongType, &v258);
              }
              if (v258 == (CFDataRef)-1)
              {
                if (DLShouldLog(3))
                  _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFileBytes", 3, CFSTR("Could not get the file size from the file info dictionary. Refusing to send this file"), v209, v210, v211, v212, v243);
                LOBYTE(v114) = 0;
              }
              else
              {
                keyExistsAndHasValidFormat = 0;
                AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("ChunkSize"), CFSTR("com.apple.DeviceLink"), &keyExistsAndHasValidFormat);
                if (AppIntegerValue <= 0 || keyExistsAndHasValidFormat == 0)
                  v150 = 0x2000;
                else
                  v150 = AppIntegerValue;
                v151 = v150 + 16;
                v246 = v121;
                if (v121)
                  v151 += CFDataGetLength(v121);
                v152 = (char *)malloc_type_calloc(1uLL, v151, 0x11E6ED33uLL);
                if (v152)
                {
                  v153 = v152;
                  v255 = 0;
                  bytesDeallocator = (const __CFAllocator *)*MEMORY[0x24BDBD258];
                  while (1)
                  {
                    bzero(v153, v151);
                    if (v257 && v255 == 0)
                    {
                      Length = CFDataGetLength(v246);
                      v266.location = 0;
                      v266.length = Length;
                      CFDataGetBytes(v246, v266, (UInt8 *)v153);
                    }
                    else
                    {
                      Length = 0;
                    }
                    v156 = fread(&v153[Length], 1uLL, v150, __stream);
                    if (!v156 && !feof(__stream))
                      break;
                    v157 = CFNumberCreate(0, kCFNumberLongLongType, &v255);
                    CFDictionarySetValue(v110, CFSTR("DLFileOffsetKey"), v157);
                    CFRelease(v157);
                    if (v255 + v156 < (unint64_t)v258 && v156 >= v150)
                      v159 = 1;
                    else
                      v159 = 2;
                    v254 = v159;
                    v160 = CFNumberCreate(0, kCFNumberIntType, &v254);
                    CFDictionarySetValue(v110, CFSTR("DLFileStatusKey"), v160);
                    if (v160)
                      CFRelease(v160);
                    if (v257)
                    {
                      v252 = 0;
                      dataOutMoved = 0;
                      v161 = CCCryptorUpdate((CCCryptorRef)context, &v153[Length], v156, &v153[Length], v151 - Length, &dataOutMoved);
                      if (v161)
                      {
                        v162 = v161;
                        if (DLShouldLog(3))
                          _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFileBytes", 3, CFSTR("There was an error while encrypting the file data: %d"), v163, v164, v165, v166, v162);
                      }
                      else if (DLShouldLog(6))
                      {
                        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFileBytes", 6, CFSTR("%d bytes of data successfully encrypted"), v169, v170, v171, v172, dataOutMoved);
                      }
                      if (v254 == 2)
                      {
                        if (DLShouldLog(6))
                          _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFileBytes", 6, CFSTR("Finalizing bytes"), v173, v174, v175, v176, v243);
                        v177 = CCCryptorFinal((CCCryptorRef)context, &v153[Length + dataOutMoved], v151 - Length - dataOutMoved, &v252);
                        if (v177)
                        {
                          v178 = v177;
                          if (v177 == -4301)
                            _DLHandlerThreadMessagePortCallback_cold_1();
                          if (DLShouldLog(3))
                            _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFileBytes", 3, CFSTR("There was an error finalizing the encrypted bytes: %d"), v179, v180, v181, v182, v178);
                        }
                        else if (DLShouldLog(6))
                        {
                          _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFileBytes", 6, CFSTR("Finalized %d bytes of data"), v183, v184, v185, v186, v252);
                        }
                      }
                      v168 = dataOutMoved + Length + v252;
                      v167 = (const UInt8 *)v153;
                    }
                    else
                    {
                      v167 = (const UInt8 *)v153;
                      v168 = v156;
                    }
                    v187 = (const __CFString *)CFDataCreateWithBytesNoCopy(0, v167, v168, bytesDeallocator);
                    v194 = (const __CFData *)_DLCreateMessageDataV(CFSTR("DLSendFile"), 2, v188, v189, v190, v191, v192, v193, v187);
                    v201 = _DLSendData(*(_QWORD *)(a4 + 64), v194, &cf);
                    if (v194)
                      CFRelease(v194);
                    if (v187)
                      CFRelease(v187);
                    if (v201)
                    {
                      if (DLShouldLog(3))
                        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFileBytes", 3, CFSTR("Could not send data: '%@'"), v221, v222, v223, v224, (char)cf);
                      v225 = CFStringCreateWithFormat(0, 0, CFSTR("Could not send data: %@"), cf, v110);
                      goto LABEL_254;
                    }
                    v202 = v255;
                    if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * v255 + 0x1999999999999998, 1) < 0x1999999999999999uLL
                      || v254 == 2)
                    {
                      v203 = (const __CFData *)_DLCreateMessageDataV(CFSTR("DLSendFile"), 2, v195, v196, v197, v198, v199, v200, 0);
                      _SendMessage(a4, *(__CFMessagePort **)(a4 + 96), (void (*)(_QWORD, uint64_t, const __CFData *, uint64_t))_DLMainThreadMessagePortCallback, sHandlerThreadConnectionSessionNumber | 0xBu, v203);
                      v202 = v255;
                    }
                    v204 = v202 + v150;
                    v255 = v204;
                    if (v204 && v204 >= (uint64_t)v258)
                    {
                      LOBYTE(v114) = 1;
                      goto LABEL_255;
                    }
                  }
                  if (DLShouldLog(3))
                  {
                    v226 = ferror(__stream);
                    v227 = __error();
                    strerror(*v227);
                    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFileBytes", 3, CFSTR("Error while reading from file: (%d) %s"), v228, v229, v230, v231, v226);
                  }
                  v232 = v255;
                  v233 = __error();
                  v245 = strerror(*v233);
                  v225 = CFStringCreateWithFormat(0, 0, CFSTR("Could not read file bytes at offset %lld: %s"), v232, v245);
LABEL_254:
                  LOBYTE(v114) = 0;
                  cf = v225;
LABEL_255:
                  free(v153);
                }
                else
                {
                  if (DLShouldLog(3))
                    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFileBytes", 3, CFSTR("Could not malloc- out of memory!"), v217, v218, v219, v220, v243);
                  cf = CFStringCreateWithFormat(0, 0, CFSTR("Could not malloc- out of memory!"));
                  LOBYTE(v114) = 1;
                }
                v121 = v246;
              }
              goto LABEL_257;
            }
            if (DLShouldLog(3))
              _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFile", 3, CFSTR("Could not open file stream from file at \"%@\""), v137, v138, v139, v140, (char)v60);
            v133 = CFStringCreateWithFormat(0, 0, CFSTR("Could not open the file stream at %@"), v60);
          }
          else
          {
            if (DLShouldLog(3))
              _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFile", 3, CFSTR("Could not get file system file name from CFString \"%@\""), v129, v130, v131, v132, (char)v60);
            v133 = CFStringCreateWithFormat(0, 0, CFSTR("Could not get a file system name for %@"), v60);
          }
          v141 = v133;
          LOBYTE(v114) = 0;
          cf = v133;
          goto LABEL_264;
        }
        if (!DLShouldLog(4))
          return 0;
        v16 = CFSTR("SendFileMessage called in HandlerThread, but StreamHandler is NULL");
LABEL_103:
        v17 = 4;
        goto LABEL_11;
      case 0xDu:
        _DLHandlerThreadWriteMessage(a4, xmlData, (uint64_t)xmlData, a4, a5, a6, a7, a8, v243);
        return _DLHandlerThreadReadMessage(a4);
      case 0xEu:
        v36 = (const __CFArray *)CFPropertyListCreateFromXMLData(0, xmlData, 0, 0);
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v36, 1);
        v38 = (const __CFString *)CFArrayGetValueAtIndex(v36, 2);
        v264 = 0u;
        *(_OWORD *)v265 = 0u;
        v262 = 0u;
        v263 = 0u;
        context = 0u;
        v261 = 0u;
        _DLBulkOperationContextInit((uint64_t)&context, a4, (uint64_t)v38, 0, 0, 0);
        v45 = (const __CFData *)_DLCreateMessageDataV(CFSTR("DLMessageUploadFiles"), 3, v39, v40, v41, v42, v43, v44, v38);
        v46 = _DLSendDataAndDisconnectOnError(a4, v45);
        if (v46 && (!DWORD2(v264) || DWORD2(v264) == -13))
        {
          DWORD2(v264) = v46;
          if (v265[0])
            CFRelease(v265[0]);
          v265[0] = CFSTR("Error sending header");
        }
        if (v45)
          CFRelease(v45);
        if (DWORD2(v264) && DWORD2(v264) != -13)
          goto LABEL_171;
        CFDictionaryApplyFunction(ValueAtIndex, (CFDictionaryApplierFunction)_DLUploadFilesFromDeviceCallback, &context);
        v47 = CFDataCreate(0, 0, 0);
        v48 = _DLSendDataAndDisconnectOnError(a4, v47);
        if (v48 && (!DWORD2(v264) || DWORD2(v264) == -13))
        {
          DWORD2(v264) = v48;
          if (v265[0])
            CFRelease(v265[0]);
          v265[0] = CFSTR("Error sending footer");
        }
        if (!v47)
          goto LABEL_164;
        v49 = v47;
        goto LABEL_163;
      case 0xFu:
        v36 = (const __CFArray *)CFPropertyListCreateFromXMLData(0, xmlData, 0, 0);
        v64 = (const __CFDictionary *)CFArrayGetValueAtIndex(v36, 1);
        v65 = CFArrayGetValueAtIndex(v36, 2);
        v66 = (const __CFString *)copyKeysFromDictionary(v64);
        v264 = 0u;
        *(_OWORD *)v265 = 0u;
        v262 = 0u;
        v263 = 0u;
        context = 0u;
        v261 = 0u;
        _DLBulkOperationContextInit((uint64_t)&context, a4, (uint64_t)v65, 0, 0, 0);
        v73 = (const __CFData *)_DLCreateMessageDataV(CFSTR("DLMessageDownloadFiles"), 4, v67, v68, v69, v70, v71, v72, v66);
        v74 = _DLSendDataAndDisconnectOnError(a4, v73);
        if (v74 && (!DWORD2(v264) || DWORD2(v264) == -13))
        {
          DWORD2(v264) = v74;
          if (v265[0])
            CFRelease(v265[0]);
          v265[0] = CFSTR("Error sending header");
        }
        if (v73)
          CFRelease(v73);
        if (v66)
          CFRelease(v66);
        v75 = DWORD2(v264);
        if (DWORD2(v264) && DWORD2(v264) != -13)
          goto LABEL_171;
        if (DWORD2(v264))
          goto LABEL_79;
        while (2)
        {
          v76 = _DLHandlerThreadReadMessage(a4);
          if (v76)
          {
            v77 = v76;
            if (!CFDataGetLength(v76))
            {
              v49 = v77;
LABEL_163:
              CFRelease(v49);
LABEL_164:
              v142 = _DLHandlerThreadReadMessage(a4);
              if (v142)
              {
                v258 = 0;
                theData = 0;
                v143 = _DLGetStatusResponseFromData(v142, &v258, (CFStringRef *)&theData);
                _DLBulkOperationContextMergeResults((uint64_t)&context, v143, (uint64_t)theData, v258);
              }
              else if (!DWORD2(v264) || DWORD2(v264) == -13)
              {
                DWORD2(v264) = -1;
                if (v265[0])
                  CFRelease(v265[0]);
                v265[0] = CFSTR("Error reading status response");
              }
LABEL_171:
              if (v36)
                CFRelease(v36);
              v144 = _DLCreateStatusResponseData(SDWORD2(v264));
              _DLBulkOperationContextDealloc((uint64_t)&context);
              return (CFDataRef)v144;
            }
            v78 = DLCreateStringFromData(v77);
            CFRelease(v77);
            if (v78)
            {
              v79 = (const __CFString *)CFDictionaryGetValue(v64, v78);
              if (v79)
              {
                _DLDownloadFileToDevice((uint64_t)&context, v78, v79);
                CFRelease(v78);
                v75 = DWORD2(v264);
                if (DWORD2(v264))
                {
LABEL_79:
                  if (v75 != -13)
                    goto LABEL_164;
                }
                continue;
              }
              if (!DWORD2(v264) || DWORD2(v264) == -13)
              {
                DWORD2(v264) = -1;
                if (v265[0])
                  CFRelease(v265[0]);
                v265[0] = CFSTR("Received unexpected from path");
              }
              v49 = v78;
              goto LABEL_163;
            }
            if (DWORD2(v264) && DWORD2(v264) != -13)
              goto LABEL_164;
            DWORD2(v264) = -1;
            if (v265[0])
              CFRelease(v265[0]);
            v136 = CFSTR("Error creating from path");
          }
          else
          {
            if (DWORD2(v264) && DWORD2(v264) != -13)
              goto LABEL_164;
            DWORD2(v264) = -1;
            if (v265[0])
              CFRelease(v265[0]);
            v136 = CFSTR("Error reading request");
          }
          break;
        }
        v265[0] = v136;
        goto LABEL_164;
      default:
        if (!DLShouldLog(3))
          return 0;
        v243 = v10;
        v16 = CFSTR("DLHandlerThreadMessagePortCallback called with an unknown message: %d");
        goto LABEL_10;
    }
  }
  if (DLShouldLog(3))
  {
    v16 = CFSTR("Handler thread can't get connection from info parameter, just returning");
LABEL_10:
    v17 = 3;
LABEL_11:
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLHandlerThreadMessagePortCallback", v17, v16, v12, v13, v14, v15, v243);
  }
  return 0;
}

void _DLRequestRead(uint64_t a1)
{
  __CFMessagePort *v2;
  __CFRunLoop *Current;

  if (sSaveCallHistory == 1)
    _DLCallHistoryAddEntry(CFSTR("RequestRead"));
  *(_BYTE *)(a1 + 145) = 1;
  v2 = *(__CFMessagePort **)(a1 + 104);
  if (v2)
  {
    DLThreadSendMessage(v2, 5, 0);
  }
  else
  {
    CFRunLoopSourceSignal(*(CFRunLoopSourceRef *)(a1 + 112));
    Current = CFRunLoopGetCurrent();
    CFRunLoopWakeUp(Current);
  }
}

void _DLCallHistoryMain(__CFString *a1, uint64_t a2)
{
  __CFString *v3;

  if (a2)
  {
    v3 = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("%@ : %@"), a1, a2);
    _DLCallHistoryAddEntry(v3);
    if (v3 != a1)
      CFRelease(v3);
  }
  else
  {
    _DLCallHistoryAddEntry(a1);
  }
}

void _DLRequestWriteV(uint64_t a1, const void *a2, int a3, const __CFString **a4)
{
  const __CFData *v8;

  if (sSaveCallHistory == 1)
    _DLCallHistoryMain(CFSTR("RequestWrite"), (uint64_t)a2);
  v8 = (const __CFData *)_DLCreateMessageDataWithArgs(a2, a3, a4);
  if (v8)
    _SendMessage(a1, *(__CFMessagePort **)(a1 + 104), (void (*)(_QWORD, uint64_t, const __CFData *, uint64_t))_DLHandlerThreadMessagePortCallback, 6, v8);
}

CFTypeRef _DLCreateMessageDataWithArgs(const void *a1, int a2, const __CFString **a3)
{
  int v3;
  __CFArray *Mutable;
  const __CFString **v6;
  const __CFString *v7;
  const __CFString *v8;
  __CFWriteStream *v9;
  __CFWriteStream *v10;
  CFIndex v11;
  CFTypeRef v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CFTypeRef result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  CFStringRef errorString;
  const __CFString **v28;

  v3 = a2;
  errorString = 0;
  v28 = a3;
  Mutable = CFArrayCreateMutable(0, a2 + 1, MEMORY[0x24BDBD690]);
  CFArrayAppendValue(Mutable, a1);
  if (v3 >= 1)
  {
    do
    {
      v6 = v28++;
      v7 = *v6;
      if (v7)
        v8 = v7;
      else
        v8 = CFSTR("___EmptyParameterString___");
      CFArrayAppendValue(Mutable, v8);
      --v3;
    }
    while (v3);
  }
  v9 = CFWriteStreamCreateWithAllocatedBuffers(0, 0);
  v10 = v9;
  if (v9 && CFWriteStreamOpen(v9))
  {
    if (CFPropertyListIsValid(Mutable, kCFPropertyListBinaryFormat_v1_0))
    {
      v11 = CFPropertyListWriteToStream(Mutable, v10, kCFPropertyListBinaryFormat_v1_0, &errorString);
      CFRelease(Mutable);
      if (v11)
      {
        v12 = CFWriteStreamCopyProperty(v10, (CFStreamPropertyKey)*MEMORY[0x24BDBD5B8]);
      }
      else
      {
        if (DLShouldLog(3))
          _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCreateMessageDataWithArgs", 3, CFSTR("Could not write property list to message data stream: '%@'"), v22, v23, v24, v25, (char)errorString);
        if (errorString)
        {
          CFRelease(errorString);
          v12 = 0;
          errorString = 0;
        }
        else
        {
          v12 = 0;
        }
      }
      CFWriteStreamClose(v10);
      Mutable = v10;
      goto LABEL_25;
    }
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCreateMessageDataWithArgs", 3, CFSTR("Plist is not valid: %@"), v18, v19, v20, v21, (char)Mutable);
  }
  else
  {
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCreateMessageDataWithArgs", 3, CFSTR("Could not open stream for writing message data"), v13, v14, v15, v16, v26);
    if (v10)
      CFRelease(v10);
  }
  v12 = 0;
  result = 0;
  if (Mutable)
  {
LABEL_25:
    CFRelease(Mutable);
    return v12;
  }
  return result;
}

void _SendMessage(uint64_t a1, __CFMessagePort *a2, void (*a3)(_QWORD, uint64_t, const __CFData *, uint64_t), uint64_t a4, const __CFData *a5)
{
  if (a2)
  {
    DLThreadSendMessage(a2, a4, a5);
  }
  else
  {
    a3(0, a4, a5, a1);
    if (a5)
      CFRelease(a5);
  }
}

void _DLRequestWrite(uint64_t a1, const void *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const __CFString *a9)
{
  _DLRequestWriteV(a1, a2, a3, &a9);
}

const __CFString *_DLGetParameterAtIndexWithDefaultValue(const __CFArray *a1, CFIndex a2, uint64_t a3)
{
  const __CFString *ValueAtIndex;
  CFTypeID v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (CFArrayGetCount(a1) <= a2)
  {
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLGetParameterAtIndexWithDefaultValue", 3, CFSTR("Error in DeviceLinkConnection, requested parameter at index %d is beyond the end of the parameter array: %@"), v8, v9, v10, v11, a2);
  }
  else
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, a2);
    v7 = CFGetTypeID(ValueAtIndex);
    if (v7 == CFStringGetTypeID())
    {
      if (CFStringCompare(ValueAtIndex, CFSTR("___EmptyParameterString___"), 0))
        return ValueAtIndex;
    }
    else
    {
      return ValueAtIndex;
    }
  }
  return (const __CFString *)a3;
}

const __CFString *_DLGetParameterAtIndex(const __CFArray *a1, CFIndex a2)
{
  return _DLGetParameterAtIndexWithDefaultValue(a1, a2, 0);
}

void _DLHandlerThreadWriteMessage(uint64_t a1, const __CFData *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (*(_QWORD *)(a1 + 64))
  {
    _DLSendDataAndDisconnectOnError(a1, a2);
  }
  else if (DLShouldLog(4))
  {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLHandlerThreadWriteMessage", 4, CFSTR("WriteMessage called in HandlerThread, but StreamHandler is NULL"), v9, v10, v11, v12, a9);
  }
}

uint64_t _DLSendDataAndDisconnectOnError(uint64_t a1, CFDataRef theData)
{
  const UInt8 *BytePtr;
  unsigned int Length;

  if (!theData)
    return DLSetStatus(4294967293, 0, CFSTR("_DLSendDataAndDisconnectOnError: data parameter is NULL"));
  BytePtr = CFDataGetBytePtr(theData);
  Length = CFDataGetLength(theData);
  return _DLSendBytesAndDisconnectOnError(a1, (uint64_t)BytePtr, Length);
}

CFDataRef _DLHandlerThreadReadMessage(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  CFTypeRef cf;
  CFDataRef v13;

  v13 = 0;
  cf = 0;
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    if (StreamHandlerReceive(v1, &v13, &cf))
    {
      if (DLShouldLog(3))
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLHandlerThreadReadMessage", 3, CFSTR("Could not receive message: '%@'"), v2, v3, v4, v5, (char)cf);
      if (v13)
        CFRelease(v13);
      v13 = 0;
    }
    if (cf)
      CFRelease(cf);
  }
  else if (DLShouldLog(4))
  {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLHandlerThreadReadMessage", 4, CFSTR("ReadMessage called in HandlerThread, but StreamHandler is NULL"), v6, v7, v8, v9, v11);
  }
  return v13;
}

uint64_t _DLCreateDeviceLinkConnectionForDevice(int a1, void (**a2)(uint64_t a1), uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, int a7, CFTypeRef *a8)
{
  uint64_t v13;
  const __CFString *v15;
  uint64_t v16;

  if (!a2)
  {
    v15 = CFSTR("_DLCreateDeviceLinkConnectionForDevice: Callbacks parameter is NULL");
LABEL_7:
    v16 = 4294967293;
    return DLSetStatus(v16, a8, v15);
  }
  if (!a5)
  {
    v15 = CFSTR("_DLCreateDeviceLinkConnectionForDevice: Connection [out] parameter is NULL");
    goto LABEL_7;
  }
  v13 = _DLCreateDeviceLinkConnection(CFSTR("Device"), a1, a2, a3, a4);
  if (v13)
  {
    *(_QWORD *)(v13 + 48) = a2;
    *(_QWORD *)(v13 + 24) = a6;
    *(_DWORD *)(v13 + 32) = -1;
    *(_DWORD *)(v13 + 36) = a7;
    *a5 = v13;
    return 0;
  }
  v15 = CFSTR("_DLCreateDeviceLinkConnectionForDevice: Could not create a connection");
  v16 = 0xFFFFFFFFLL;
  return DLSetStatus(v16, a8, v15);
}

uint64_t _DLCreateDeviceLinkConnection(const void *a1, int a2, void (**a3)(uint64_t a1), uint64_t a4, uint64_t a5)
{
  int AppBooleanValue;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  CFTypeRef v18;
  CFStringRef v19;
  __CFMessagePort *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __CFRunLoop *Current;
  CFIndex AppIntegerValue;
  size_t v27;
  char v29;
  char v30;
  int valuePtr;
  CFRunLoopSourceContext context;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("SaveCallHistory"), CFSTR("com.apple.DeviceLink"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat == 1 && AppBooleanValue == 1)
  {
    if (DLShouldLog(4))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCreateDeviceLinkConnection", 4, CFSTR("Turning on call history for DeviceLink"), v12, v13, v14, v15, v29);
    sSaveCallHistory = 1;
    sCallHistoryMutex = (uint64_t)DLCreateMutex();
  }
  if (!*a3)
    *a3 = genericIncomingConnectionCallback;
  if (!a3[1])
    a3[1] = (void (*)(uint64_t))genericConnectionMadeCallback;
  if (!a3[2])
    a3[2] = (void (*)(uint64_t))genericConnectionFailedCallback;
  if (!a3[3])
    a3[3] = (void (*)(uint64_t))genericAcceptFailedCallback;
  if (!a3[4])
    a3[4] = (void (*)(uint64_t))genericDisconnectCallback;
  if (!a3[5])
    a3[5] = (void (*)(uint64_t))genericConnectionLostCallback;
  if (!a3[6])
    a3[6] = (void (*)(uint64_t))genericProcessMessageCallback;
  if (!a3[7])
    a3[7] = (void (*)(uint64_t))genericPingCallback;
  if (!a3[8])
    a3[8] = (void (*)(uint64_t))genericRequestFileCallback;
  if (!a3[9])
    a3[9] = (void (*)(uint64_t))genericSendFileCallback;
  v16 = malloc_type_calloc(0xD8uLL, 1uLL, 0xA20F246DuLL);
  v17 = (uint64_t)v16;
  v16[5] = a3;
  v16[1] = a4;
  v16[2] = a5;
  *((_BYTE *)v16 + 146) = 1;
  *v16 = 0;
  if (a2)
  {
    v16[14] = 0;
    v18 = CFRetain(a1);
    *(_QWORD *)(v17 + 72) = v18;
    v30 = (char)v18;
    v19 = CFStringCreateWithFormat(0, 0, CFSTR("%@.%@"));
    *(_QWORD *)(v17 + 80) = DLThreadCreateReceivePort((uint64_t)v19, v17, (uint64_t)_DLMainThreadMessagePortCallback);
    *(_QWORD *)(v17 + 96) = DLThreadCreateSendPort((uint64_t)v19);
    if (v19)
      CFRelease(v19);
    v20 = *(__CFMessagePort **)(v17 + 80);
    if (!v20 || !*(_QWORD *)(v17 + 96))
      goto LABEL_37;
    DLThreadAddMessagePortToRunloop(v20);
    *(_QWORD *)(v17 + 128) = DLCreateCondition();
    *(_QWORD *)(v17 + 136) = DLCreateMutex();
    *(_BYTE *)(v17 + 144) = 0;
    if (DLThreadCreateThread((void *(__cdecl *)(void *))_DLHandlerThreadEntryPoint, (void *)v17))
    {
      if (DLShouldLog(3))
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLSetupHandlerThreadAndMessagePorts", 3, CFSTR("Could not create a message handler thread"), v21, v22, v23, v24, v30);
LABEL_37:
      free((void *)v17);
      return 0;
    }
    DLWait(*(pthread_cond_t **)(v17 + 128), *(pthread_mutex_t **)(v17 + 136), (_BYTE *)(v17 + 144));
  }
  else
  {
    context.version = 0;
    memset(&context.retain, 0, 56);
    context.info = v16;
    context.perform = (void (__cdecl *)(void *))_RunLoopReadSourceCallback;
    v16[12] = 0;
    v16[13] = 0;
    v16[14] = CFRunLoopSourceCreate(0, 0, &context);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, *(CFRunLoopSourceRef *)(v17 + 112), (CFRunLoopMode)*MEMORY[0x24BDBD598]);
  }
  context.version = 0;
  *(_QWORD *)(v17 + 160) = CFNumberCreate(0, kCFNumberDoubleType, &context);
  valuePtr = 0;
  *(_QWORD *)(v17 + 168) = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("BufferSize"), CFSTR("com.apple.DeviceLink"), 0);
  if (AppIntegerValue)
    v27 = AppIntegerValue + 1;
  else
    v27 = 262145;
  *(_QWORD *)(v17 + 184) = v27;
  *(_QWORD *)(v17 + 176) = malloc_type_malloc(v27, 0x44C1A3D8uLL);
  return v17;
}

uint64_t _DLCreateDeviceLinkConnectionForComputer(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, int a7, CFTypeRef *a8)
{
  uint64_t v13;
  const __CFString *v15;
  uint64_t v16;

  if (!a2)
  {
    v15 = CFSTR("_DLCreateDeviceLinkConnectionForComputer: Callbacks parameter is NULL");
LABEL_9:
    v16 = 4294967293;
    return DLSetStatus(v16, a8, v15);
  }
  if (!*(_QWORD *)(a2 + 88))
  {
    v15 = CFSTR("_DLCreateDeviceLinkConnectionForComputer: DeviceReady callback is NULL");
    goto LABEL_9;
  }
  if (!a5)
  {
    v15 = CFSTR("_DLCreateDeviceLinkConnectionForComputer: Connection [out] parameter is NULL");
    goto LABEL_9;
  }
  v13 = _DLCreateDeviceLinkConnection(CFSTR("Computer"), a1, (void (**)(uint64_t))a2, a3, a4);
  if (v13)
  {
    *(_QWORD *)(v13 + 56) = a2;
    *(_QWORD *)(v13 + 24) = a6;
    *(_DWORD *)(v13 + 32) = -1;
    *(_DWORD *)(v13 + 36) = a7;
    *a5 = v13;
    return 0;
  }
  v15 = CFSTR("_DLCreateDeviceLinkConnectionForComputer: Could not create a connection");
  v16 = 0xFFFFFFFFLL;
  return DLSetStatus(v16, a8, v15);
}

uint64_t DLCreateDeviceLinkConnectionForDevice(int a1, void (**a2)(uint64_t a1), uint64_t a3, _QWORD *a4, CFTypeRef *a5)
{
  _QWORD *v8;
  const __CFString *v10;
  uint64_t v11;

  if (!a2)
  {
    v10 = CFSTR("DLCreateDeviceLinkConnectionForDevice: Callbacks parameter is NULL");
LABEL_7:
    v11 = 4294967293;
    return DLSetStatus(v11, a5, v10);
  }
  if (!a4)
  {
    v10 = CFSTR("DLCreateDeviceLinkConnectionForDevice: Connection [out] parameter is NULL");
    goto LABEL_7;
  }
  v8 = (_QWORD *)_DLCreateDeviceLinkConnection(CFSTR("Device"), a1, a2, a3, 0);
  if (v8)
  {
    v8[6] = a2;
    v8[3] = 0;
    v8[4] = 0xFFFFFFFFLL;
    *a4 = v8;
    return 0;
  }
  v10 = CFSTR("DLCreateDeviceLinkConnectionForDevice: Could not create a connection");
  v11 = 0xFFFFFFFFLL;
  return DLSetStatus(v11, a5, v10);
}

uint64_t DLCreateDeviceLinkConnectionForComputer(int a1, uint64_t a2, uint64_t a3, _QWORD *a4, CFTypeRef *a5)
{
  _QWORD *v8;
  const __CFString *v10;
  uint64_t v11;

  if (!a2)
  {
    v10 = CFSTR("DLCreateDeviceLinkConnectionForComputer: Callbacks parameter is NULL");
LABEL_9:
    v11 = 4294967293;
    return DLSetStatus(v11, a5, v10);
  }
  if (!*(_QWORD *)(a2 + 88))
  {
    v10 = CFSTR("DLCreateDeviceLinkConnectionForComputer: DeviceReady callback is NULL");
    goto LABEL_9;
  }
  if (!a4)
  {
    v10 = CFSTR("DLCreateDeviceLinkConnectionForComputer: Connection [out] parameter is NULL");
    goto LABEL_9;
  }
  v8 = (_QWORD *)_DLCreateDeviceLinkConnection(CFSTR("Computer"), a1, (void (**)(uint64_t))a2, a3, 0);
  if (v8)
  {
    v8[7] = a2;
    v8[3] = 0;
    v8[4] = 0xFFFFFFFFLL;
    *a4 = v8;
    return 0;
  }
  v10 = CFSTR("DLCreateDeviceLinkConnectionForDevice: Could not create a connection");
  v11 = 0xFFFFFFFFLL;
  return DLSetStatus(v11, a5, v10);
}

uint64_t DLDeleteDeviceLinkConnection(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  FILE *v12;
  const __CFData *v13;

  *(_DWORD *)a1 = 5;
  v2 = *(const void **)(a1 + 72);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(a1 + 72) = 0;
  }
  DLDeleteCondition(*(pthread_cond_t **)(a1 + 128));
  DLDeleteMutex(*(pthread_mutex_t **)(a1 + 136));
  v3 = *(const void **)(a1 + 152);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(a1 + 152) = 0;
  }
  v4 = *(const void **)(a1 + 160);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 160) = 0;
  }
  v5 = *(const void **)(a1 + 168);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(a1 + 168) = 0;
  }
  free(*(void **)(a1 + 176));
  *(_QWORD *)(a1 + 176) = 0;
  v12 = *(FILE **)(a1 + 192);
  if (v12)
  {
    fclose(v12);
    *(_QWORD *)(a1 + 192) = 0;
  }
  v13 = (const __CFData *)_DLCreateMessageDataV(CFSTR("DLMessageDisconnect"), 1, v6, v7, v8, v9, v10, v11, CFSTR("Connection is being deleted"));
  if (sSaveCallHistory == 1)
    _DLCallHistoryAddEntry(CFSTR("Exit (Delete Connection)"));
  _SendMessage(a1, *(__CFMessagePort **)(a1 + 104), (void (*)(_QWORD, uint64_t, const __CFData *, uint64_t))_DLHandlerThreadMessagePortCallback, 8, v13);
  DLRegenerateUniqueProcessName();
  return 0;
}

CFTypeRef _DLCreateMessageDataV(const void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const __CFString *a9)
{
  return _DLCreateMessageDataWithArgs(a1, a2, &a9);
}

uint64_t DLGetDeviceLinkConnectionContext(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t _DLCheckForDisconnect(_DWORD *a1, _DWORD *a2, _QWORD *a3)
{
  CFRunLoopRunInMode((CFRunLoopMode)*MEMORY[0x24BDBD5A0], 0.0, 1u);
  if (*a1 != 4)
    return 0;
  if (a2)
    *a2 = -14;
  if (a3)
    *a3 = CFSTR("Disconnected");
  return 1;
}

uint64_t DLGetDeviceLinkConnectionInfo(uint64_t a1)
{
  return *(_QWORD *)(a1 + 120);
}

uint64_t DLLockdownCheckin(__CFDictionary *a1)
{
  int v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFNumberRef v14;
  CFNumberRef v15;
  int valuePtr;
  uint64_t v17;

  v17 = 0;
  v2 = secure_lockdown_checkin();
  if (v2)
  {
    v3 = v2;
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLLockdownCheckin", 3, CFSTR("Could not check in with lockdown: %d"), v4, v5, v6, v7, v3);
    return 0xFFFFFFFFLL;
  }
  else
  {
    lockdown_get_securecontext();
    valuePtr = lockdown_get_socket();
    if (DLShouldLog(6))
    {
      v9 = DLGetProcessName();
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLLockdownCheckin", 6, CFSTR("%@ launched from lockdown on socket %d with%s SSL"), v10, v11, v12, v13, v9);
    }
    CFDictionarySetValue(a1, CFSTR("DLInfoStreamTypeKey"), CFSTR("DLInfoStreamTypeTCP"));
    CFDictionarySetValue(a1, CFSTR("DLInfoLockdownAccept"), (const void *)*MEMORY[0x24BDBD270]);
    v14 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    CFDictionarySetValue(a1, CFSTR("DLInfoSocketKey"), v14);
    if (v14)
      CFRelease(v14);
    v15 = CFNumberCreate(0, kCFNumberNSIntegerType, &v17);
    CFDictionarySetValue(a1, CFSTR("DLInfoLockdownConnection"), v15);
    if (v15)
      CFRelease(v15);
    return 0;
  }
}

uint64_t DLLockdownXPCCheckin(const void *a1, const void *a2)
{
  NSObject *v4;
  int v5;
  int v6;
  dispatch_time_t v7;
  intptr_t v8;
  uint64_t result;
  uint8_t buf[4];
  const void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    DLLockdownXPCCheckin_cold_1();
  if (!a2)
    DLLockdownXPCCheckin_cold_2();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v11 = a1;
    _os_log_impl(&dword_229EB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "lockdown_checkin_xpc, serviceName:%{public}s", buf, 0xCu);
  }
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  dispatch_retain(v4);
  CFRetain(a2);
  v5 = lockdown_checkin_xpc();
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      DLLockdownXPCCheckin_cold_4(v6);
    dispatch_release(v4);
    dispatch_release(v4);
    CFRelease(a2);
    return 0xFFFFFFFFLL;
  }
  v7 = dispatch_time(0, 600000000000);
  v8 = dispatch_group_wait(v4, v7);
  dispatch_release(v4);
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      DLLockdownXPCCheckin_cold_3();
    return 0xFFFFFFFFLL;
  }
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
  if ((_DWORD)result)
  {
    *(_DWORD *)buf = 138412290;
    v11 = a2;
    _os_log_impl(&dword_229EB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "lockdown_checkin_xpc succeeded: %@", buf, 0xCu);
    return 0;
  }
  return result;
}

uint64_t DLWaitForConnection(uint64_t a1, CFTypeRef cf, CFTypeRef *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CFTypeRef v9;
  const __CFNumber *Value;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __CFMessagePort *v22;
  char v23;

  if (*(_DWORD *)a1 == 1)
  {
    if (DLShouldLog(4))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLWaitForConnection", 4, CFSTR("DLWaitForConnection called, but already waiting for a connection"), v3, v4, v5, v6, v23);
  }
  else
  {
    *(_DWORD *)a1 = 1;
    v9 = *(CFTypeRef *)(a1 + 120);
    if (cf)
    {
      if (v9 == cf)
      {
        v9 = cf;
      }
      else
      {
        if (v9)
        {
          CFRelease(v9);
          *(_QWORD *)(a1 + 120) = 0;
        }
        v9 = CFRetain(cf);
        *(_QWORD *)(a1 + 120) = v9;
      }
    }
    else if (!v9)
    {
      return DLSetStatus(4294967293, a3, CFSTR("DLWaitForConnection: info parameter is NULL and no info previously set"));
    }
    if (CFDictionaryContainsKey((CFDictionaryRef)v9, CFSTR("DLInfoSessionNumberKey")))
    {
      Value = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 120), CFSTR("DLInfoSessionNumberKey"));
      CFNumberGetValue(Value, kCFNumberSInt32Type, (void *)(a1 + 4));
    }
    else
    {
      sConnectionSerial = (sConnectionSerial & 0xFFFFFF00) + 256;
      *(_DWORD *)(a1 + 4) = sConnectionSerial;
    }
    if (DLShouldLog(7))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLWaitForConnection", 7, CFSTR("Next expected session number: %d, connection %p"), v12, v13, v14, v15, BYTE1(*(_DWORD *)(a1 + 4)));
    v16 = CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 120), CFSTR("DLInfoAllowSleepKey"));
    v17 = DLShouldLog(6);
    if (v16)
    {
      if (v17)
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLWaitForConnection", 6, CFSTR("Allowing sleep during connections"), v18, v19, v20, v21, v23);
      *(_BYTE *)(a1 + 146) = 0;
    }
    else if (v17)
    {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLWaitForConnection", 6, CFSTR("Preventing sleep during connections"), v18, v19, v20, v21, v23);
    }
    *(_BYTE *)(a1 + 145) = 1;
    if (sSaveCallHistory == 1)
      _DLCallHistoryAddEntry(CFSTR("Accept"));
    v22 = *(__CFMessagePort **)(a1 + 104);
    if (v22)
      DLThreadSendMessage(v22, 1, 0);
    else
      _DLHandlerThreadMessagePortCallback(0, 1, 0, a1, v18, v19, v20, v21);
  }
  return 0;
}

uint64_t DLConnect(uint64_t a1, CFTypeRef cf, CFTypeRef *a3)
{
  CFTypeRef v4;
  const __CFNumber *Value;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __CFMessagePort *v22;
  char v23;

  *(_DWORD *)a1 = 2;
  v4 = *(CFTypeRef *)(a1 + 120);
  if (cf)
  {
    if (v4 == cf)
    {
      v4 = cf;
    }
    else
    {
      if (v4)
        CFRelease(v4);
      *(_QWORD *)(a1 + 120) = cf;
      CFRetain(cf);
      v4 = *(CFTypeRef *)(a1 + 120);
    }
  }
  else if (!v4)
  {
    return DLSetStatus(4294967293, a3, CFSTR("DLConnect: info parameter is NULL and no info previously set"));
  }
  if (CFDictionaryContainsKey((CFDictionaryRef)v4, CFSTR("DLInfoSessionNumberKey")))
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 120), CFSTR("DLInfoSessionNumberKey"));
    CFNumberGetValue(Value, kCFNumberSInt32Type, (void *)(a1 + 4));
  }
  else
  {
    sConnectionSerial = (sConnectionSerial & 0xFFFFFF00) + 256;
    *(_DWORD *)(a1 + 4) = sConnectionSerial;
  }
  if (DLShouldLog(7))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLConnect", 7, CFSTR("Next expected session number: %d, connection: %p"), v8, v9, v10, v11, BYTE1(*(_DWORD *)(a1 + 4)));
  v12 = CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 120), CFSTR("DLInfoAllowSleepKey"));
  v13 = DLShouldLog(5);
  if (v12)
  {
    if (v13)
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLConnect", 5, CFSTR("Allowing sleep during connections"), v14, v15, v16, v17, v23);
    *(_BYTE *)(a1 + 146) = 0;
  }
  else if (v13)
  {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLConnect", 5, CFSTR("Preventing sleep during connections"), v14, v15, v16, v17, v23);
  }
  *(_BYTE *)(a1 + 145) = 1;
  if (sSaveCallHistory == 1)
    _DLCallHistoryAddEntry(CFSTR("Connect"));
  if (DLShouldLog(6))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLConnect", 6, CFSTR("Sending connect message to handler thread"), v18, v19, v20, v21, v23);
  v22 = *(__CFMessagePort **)(a1 + 104);
  if (v22)
    DLThreadSendMessage(v22, 3, 0);
  else
    _DLHandlerThreadMessagePortCallback(0, 3, 0, a1, v18, v19, v20, v21);
  return 0;
}

uint64_t DLWaitForMessage(uint64_t a1)
{
  if (sSaveCallHistory == 1)
    _DLCallHistoryAddEntry(CFSTR("WaitForMessage"));
  _DLRequestRead(a1);
  return 0;
}

uint64_t DLDeviceReady(uint64_t a1, CFTypeRef *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFString *v10;

  if (!*(_QWORD *)(a1 + 48))
    return DLSetStatus(4294967292, a2, CFSTR("DLDeviceReady: Computer cannot call this method"));
  _DLRequestWrite(a1, CFSTR("DLMessageDeviceReady"), 0, a4, a5, a6, a7, a8, v10);
  _DLRequestRead(a1);
  *(_DWORD *)a1 = 3;
  return 0;
}

uint64_t DLDisconnect(uint64_t a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFData *v9;

  v9 = (const __CFData *)_DLCreateMessageDataV(CFSTR("DLMessageDisconnect"), 1, a3, a4, a5, a6, a7, a8, a2);
  if (sSaveCallHistory == 1)
    _DLCallHistoryAddEntry(CFSTR("Disconnect"));
  _SendMessage(a1, *(__CFMessagePort **)(a1 + 104), (void (*)(_QWORD, uint64_t, const __CFData *, uint64_t))_DLHandlerThreadMessagePortCallback, 7, v9);
  *(_DWORD *)a1 = 4;
  return 0;
}

uint64_t DLProcessMessage(uint64_t a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _DLRequestWrite(a1, CFSTR("DLMessageProcessMessage"), 1, a4, a5, a6, a7, a8, a2);
  _DLRequestRead(a1);
  return 0;
}

uint64_t DLPing(uint64_t a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _DLRequestWrite(a1, CFSTR("DLMessagePing"), 1, a4, a5, a6, a7, a8, a2);
  return 0;
}

uint64_t DLRequestFile(uint64_t a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFData *v9;

  if (!a2)
    return 4294967293;
  v9 = (const __CFData *)_DLCreateMessageDataV(CFSTR("DLRequestFile"), 3, a3, a4, a5, a6, a7, a8, a2);
  if (sSaveCallHistory == 1)
    _DLCallHistoryAddEntry(CFSTR("Request File"));
  _SendMessage(a1, *(__CFMessagePort **)(a1 + 104), (void (*)(_QWORD, uint64_t, const __CFData *, uint64_t))_DLHandlerThreadMessagePortCallback, 10, v9);
  _DLRequestRead(a1);
  return 0;
}

uint64_t DLSendFile(uint64_t a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFData *v9;

  if (!a2)
    return 4294967293;
  v9 = (const __CFData *)_DLCreateMessageDataV(CFSTR("DLSendFile"), 2, a3, a4, a5, a6, a7, a8, a2);
  if (sSaveCallHistory == 1)
    _DLCallHistoryAddEntry(CFSTR("Send File"));
  _SendMessage(a1, *(__CFMessagePort **)(a1 + 104), (void (*)(_QWORD, uint64_t, const __CFData *, uint64_t))_DLHandlerThreadMessagePortCallback, 11, v9);
  return 0;
}

uint64_t DLHandleSentFilePieceEncrypted(uint64_t a1, const __CFData *a2, CFDictionaryRef theDict, const __CFData *a4, CFStringRef *a5)
{
  const __CFNumber *Value;
  const __CFString *v11;
  const __CFNumber *v12;
  const char *v13;
  char *v14;
  FILE *v15;
  CFIndex Length;
  size_t v17;
  CFIndex v18;
  UInt8 *v19;
  UInt8 *v20;
  _CCCryptor *v21;
  const UInt8 *v22;
  CCCryptorStatus v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  CFIndex v35;
  CFStringRef v36;
  __CFData *v37;
  __CFData *v38;
  const UInt8 *BytePtr;
  const UInt8 *v40;
  CCCryptorStatus v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  CCCryptorStatus v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  size_t dataOutMoved;
  uint64_t v67;
  int valuePtr;
  uint64_t v69;

  if (!a2)
    return 0;
  v69 = 0;
  valuePtr = 0;
  Value = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("DLFileStatusKey"));
  if (Value)
    CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
  v11 = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("DLFileDest"));
  v12 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("DLFileOffsetKey"));
  v67 = 0;
  if (v12)
    CFNumberGetValue(v12, kCFNumberLongLongType, &v67);
  if (!a4 || *(_QWORD *)(a1 + 200))
    goto LABEL_8;
  if (v67)
  {
    if (!DLShouldLog(3))
      goto LABEL_33;
    v34 = CFSTR("Encrypted bytes were received but we don't have a key to decrypt them with. Refusing to save the bytes");
    goto LABEL_32;
  }
  dataOutMoved = 0;
  v37 = createFileKeyFromAuthBlob(a2, a4, (const __CFData **)&dataOutMoved, &v69);
  if (!v37)
  {
    if (!DLShouldLog(3))
    {
LABEL_33:
      if (a5)
        *a5 = CFSTR("CouldNotDecrypt");
      return 0xFFFFFFFFLL;
    }
    v34 = CFSTR("Could not decrypt the file encryption key. Refusing to decode this file");
LABEL_32:
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLHandleSentFilePieceEncrypted", 3, v34, v30, v31, v32, v33, v65);
    goto LABEL_33;
  }
  v38 = v37;
  BytePtr = CFDataGetBytePtr(v37);
  v40 = CFDataGetBytePtr((CFDataRef)dataOutMoved);
  v41 = CCCryptorCreate(1u, 0, 1u, BytePtr, 0x20uLL, v40, (CCCryptorRef *)(a1 + 200));
  if (v41)
  {
    v42 = v41;
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLHandleSentFilePieceEncrypted", 3, CFSTR("Could not set up a decryptor: %d"), v43, v44, v45, v46, v42);
    if (a5)
      *a5 = CFSTR("CouldNotDecrypt");
    if (dataOutMoved)
      CFRelease((CFTypeRef)dataOutMoved);
    return 0xFFFFFFFFLL;
  }
  CFRelease(v38);
LABEL_8:
  if (!*(_QWORD *)(a1 + 192))
  {
    if (v11)
    {
      v13 = (const char *)DLCreateCStringFromCFString(v11);
      if (v13)
      {
        v14 = (char *)v13;
        v15 = fopen(v13, "w");
        *(_QWORD *)(a1 + 192) = v15;
        if (!v15)
        {
          if (a5)
            *a5 = CFStringCreateWithFormat(0, 0, CFSTR("Could not open the file at \"%s\" for writing"), v14);
          free(v14);
          return 0xFFFFFFFFLL;
        }
        free(v14);
      }
    }
  }
  Length = CFDataGetLength(a2);
  v17 = Length;
  if (!a4)
  {
    v20 = (UInt8 *)CFDataGetBytePtr(a2);
    goto LABEL_22;
  }
  if (!*(_QWORD *)(a1 + 200))
  {
    if (!DLShouldLog(3))
      goto LABEL_33;
    v34 = CFSTR("We don't have a decryption key to decrypt these bytes. Refusing to save to disk");
    goto LABEL_32;
  }
  v18 = Length + 16;
  v19 = (UInt8 *)malloc_type_calloc(Length + 16, 1uLL, 0x44BFAC4EuLL);
  if (!v19)
  {
    if (a5)
    {
      v35 = CFDataGetLength(a2);
      v36 = CFStringCreateWithFormat(0, 0, CFSTR("Could not allocate a buffer for %ld bytes of data: out of memory."), v35);
      result = 0;
      *a5 = v36;
      return result;
    }
    return 0;
  }
  v20 = v19;
  dataOutMoved = 0;
  v21 = *(_CCCryptor **)(a1 + 200);
  v22 = CFDataGetBytePtr(a2);
  v23 = CCCryptorUpdate(v21, &v22[v69], v17 - v69, v20, v17 + 16, &dataOutMoved);
  if (v23)
  {
    v24 = v23;
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLHandleSentFilePieceEncrypted", 3, CFSTR("Could not decrypt file bytes: %d"), v25, v26, v27, v28, v24);
LABEL_19:
    free(v20);
    goto LABEL_33;
  }
  if (DLShouldLog(6))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLHandleSentFilePieceEncrypted", 6, CFSTR("Decrypted %d bytes"), v47, v48, v49, v50, dataOutMoved);
  v17 = dataOutMoved;
  if (valuePtr == 2)
  {
    if (DLShouldLog(6))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLHandleSentFilePieceEncrypted", 6, CFSTR("Finalizing bytes and shutting down the decryptor"), v51, v52, v53, v54, v65);
    v55 = CCCryptorFinal(*(CCCryptorRef *)(a1 + 200), &v20[dataOutMoved], v18 - dataOutMoved, &dataOutMoved);
    if (v55)
    {
      v56 = v55;
      if (DLShouldLog(3))
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLHandleSentFilePieceEncrypted", 3, CFSTR("Could not finalize file bytes: %d"), v57, v58, v59, v60, v56);
      goto LABEL_19;
    }
    if (DLShouldLog(6))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLHandleSentFilePieceEncrypted", 6, CFSTR("Finalized %d bytes"), v61, v62, v63, v64, dataOutMoved);
    v17 += dataOutMoved;
    CCCryptorRelease(*(CCCryptorRef *)(a1 + 200));
    *(_QWORD *)(a1 + 200) = 0;
  }
LABEL_22:
  fwrite(v20, v17, 1uLL, *(FILE **)(a1 + 192));
  if (v20 != CFDataGetBytePtr(a2))
    free(v20);
  if ((valuePtr & 0xFFFFFFFE) != 2)
    return 0;
  fclose(*(FILE **)(a1 + 192));
  *(_QWORD *)(a1 + 192) = 0;
  result = *(_QWORD *)(a1 + 200);
  if (result)
  {
    CCCryptorRelease((CCCryptorRef)result);
    result = 0;
    *(_QWORD *)(a1 + 200) = 0;
  }
  return result;
}

uint64_t DLHandleSentFilePiece(uint64_t a1, const __CFData *a2, const __CFDictionary *a3, CFStringRef *a4)
{
  return DLHandleSentFilePieceEncrypted(a1, a2, a3, 0, a4);
}

uint64_t DLKillConnection(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;
  int v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFMessagePort *v13;
  int v15;
  CFTypeRef cf;

  cf = 0;
  if (*(_DWORD *)a1 == 1)
  {
    if (DLShouldLog(5))
    {
      v5 = CFSTR("Not killing waiting connection, because that would be rude");
      v6 = 5;
LABEL_19:
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLKillConnection", v6, v5, v1, v2, v3, v4, v15);
    }
  }
  else
  {
    *(_DWORD *)(a1 + 4) = 0;
    if (DLShouldLog(7))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLKillConnection", 7, CFSTR("Killing Connection. Next expected session number: %d, Connection: %p"), v8, v9, v10, v11, BYTE1(*(_DWORD *)(a1 + 4)));
    v12 = *(_QWORD *)(a1 + 64);
    if (v12)
    {
      if (StreamHandlerClose(v12, &cf) && DLShouldLog(3))
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLKillConnection", 3, CFSTR("Closing the stream handler directly in DLKillConnection: '%@'"), v8, v9, v10, v11, (char)cf);
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
    }
    if (sSaveCallHistory == 1)
      _DLCallHistoryAddEntry(CFSTR("Kill"));
    v13 = *(__CFMessagePort **)(a1 + 104);
    if (v13)
      DLThreadSendMessage(v13, 9, 0);
    else
      _DLHandlerThreadMessagePortCallback(0, 9, 0, a1, v8, v9, v10, v11);
    if (DLShouldLog(7))
    {
      v15 = *(int *)(a1 + 4) >> 8;
      v5 = CFSTR("After _SendMessage: %d, Connection: %p");
      v6 = 7;
      goto LABEL_19;
    }
  }
  return 0;
}

uint64_t _DLGetStatusResponseFromData(CFDataRef xmlData, _QWORD *a2, CFStringRef *a3)
{
  const __CFArray *v5;
  const __CFArray *v6;
  const __CFString *ValueAtIndex;
  CFStringRef v8;
  const __CFNumber *v10;
  const __CFString *v11;
  const void *v12;
  CFIndex Count;
  unsigned int valuePtr;

  valuePtr = 0;
  v5 = (const __CFArray *)CFPropertyListCreateFromXMLData(0, xmlData, 0, 0);
  if (v5)
  {
    v6 = v5;
    if (CFArrayGetCount(v5) == 4)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v6, 0);
      if (CFStringCompare(ValueAtIndex, CFSTR("DLMessageStatusResponse"), 0) == kCFCompareEqualTo)
      {
        v10 = (const __CFNumber *)CFArrayGetValueAtIndex(v6, 1);
        CFNumberGetValue(v10, kCFNumberIntType, &valuePtr);
        if (a3)
        {
          v11 = (const __CFString *)CFArrayGetValueAtIndex(v6, 2);
          *a3 = v11;
          CFRetain(v11);
        }
        if (a2)
        {
          v12 = CFArrayGetValueAtIndex(v6, 3);
          *a2 = v12;
          CFRetain(v12);
        }
        goto LABEL_16;
      }
      valuePtr = -1;
      if (a3)
      {
        v8 = CFStringCreateWithFormat(0, 0, CFSTR("Unexpected response message: %@"), ValueAtIndex);
LABEL_11:
        *a3 = v8;
      }
    }
    else
    {
      valuePtr = -1;
      if (a3)
      {
        Count = CFArrayGetCount(v6);
        v8 = CFStringCreateWithFormat(0, 0, CFSTR("Too few components in status response: %ld"), Count);
        goto LABEL_11;
      }
    }
LABEL_16:
    CFRelease(v6);
    return valuePtr;
  }
  if (a3)
    *a3 = CFSTR("Error deserializing status response data");
  return 0xFFFFFFFFLL;
}

uint64_t _DLProcessSyncMessageWithStatusResponseV(uint64_t a1, _QWORD *a2, CFStringRef *a3, SInt32 a4, const void *a5, int a6, const __CFString **a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFData *v15;
  __CFMessagePort *v16;
  const __CFData *v17;
  uint64_t v18;

  v15 = (const __CFData *)_DLCreateMessageDataWithArgs(a5, a6, a7);
  v16 = *(__CFMessagePort **)(a1 + 104);
  if (v16)
  {
    v17 = DLThreadSendSyncMessage(v16, a4, v15);
  }
  else
  {
    v17 = _DLHandlerThreadMessagePortCallback(0, a4, v15, a1, v11, v12, v13, v14);
    if (v15)
      CFRelease(v15);
  }
  if (v17)
  {
    v18 = _DLGetStatusResponseFromData(v17, a2, a3);
    CFRelease(v17);
    return v18;
  }
  else
  {
    if (a3)
      *a3 = CFSTR("Error receiving status response");
    return 0xFFFFFFFFLL;
  }
}

uint64_t _DLProcessSyncMessageWithStatusResponse(uint64_t a1, _QWORD *a2, CFStringRef *a3, SInt32 a4, const void *a5, int a6, uint64_t a7, uint64_t a8, const __CFString *a9)
{
  return _DLProcessSyncMessageWithStatusResponseV(a1, a2, a3, a4, a5, a6, &a9);
}

CFTypeRef _DLCreateStatusResponseData(int a1)
{
  const __CFString *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CFTypeRef v8;
  int valuePtr;

  valuePtr = a1;
  v1 = (const __CFString *)CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  v8 = _DLCreateMessageDataV(CFSTR("DLMessageStatusResponse"), 3, v2, v3, v4, v5, v6, v7, v1);
  if (v1)
    CFRelease(v1);
  return v8;
}

uint64_t _DLOperationProgressContextInit(uint64_t result, uint64_t a2, CFNumberRef number, const __CFNumber *a4, const __CFNumber *a5)
{
  _BYTE *v7;

  *(_QWORD *)(result + 48) = 0;
  *(_OWORD *)(result + 16) = 0u;
  *(_OWORD *)(result + 32) = 0u;
  *(_OWORD *)result = 0u;
  *(_QWORD *)result = a2;
  if (a5 && a4 && number)
  {
    if (*(_QWORD *)(*(_QWORD *)(a2 + 40) + 80))
    {
      v7 = (_BYTE *)result;
      CFNumberGetValue(number, kCFNumberDoubleType, (void *)(result + 16));
      CFNumberGetValue(a4, kCFNumberDoubleType, v7 + 24);
      result = CFNumberGetValue(a5, kCFNumberLongLongType, v7 + 40);
      v7[48] = 1;
    }
  }
  return result;
}

uint64_t _DLOperationProgressContextUpdate(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  const void *v5;
  CFNumberRef v6;
  uint64_t v7;
  double valuePtr;

  if (a2)
  {
    v2 = result;
    if (*(_BYTE *)(result + 48))
    {
      v3 = *(_QWORD *)(result + 40);
      v4 = *(_QWORD *)(result + 32) + a2;
      if (v4 >= v3)
        v4 = *(_QWORD *)(result + 40);
      *(_QWORD *)(result + 32) = v4;
      valuePtr = *(double *)(result + 16)
               + (double)v4 / (double)v3 * (*(double *)(result + 24) - *(double *)(result + 16));
      v5 = *(const void **)(*(_QWORD *)result + 160);
      if (v5)
      {
        CFRelease(v5);
        *(_QWORD *)(*(_QWORD *)v2 + 160) = 0;
      }
      v6 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
      v7 = *(_QWORD *)v2;
      *(_QWORD *)(v7 + 160) = v6;
      return (*(uint64_t (**)(void))(*(_QWORD *)(v7 + 40) + 80))();
    }
  }
  return result;
}

CFMutableDictionaryRef _DLBulkOperationContextInit(uint64_t a1, uint64_t a2, uint64_t a3, CFNumberRef number, const __CFNumber *a5, const __CFNumber *a6)
{
  CFMutableDictionaryRef result;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = a3;
  _DLOperationProgressContextInit(a1 + 16, a2, number, a5, a6);
  result = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  *(_QWORD *)(a1 + 88) = result;
  return result;
}

void _DLBulkOperationContextDealloc(uint64_t a1)
{
  const void *v2;
  const void *v3;

  v2 = *(const void **)(a1 + 80);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(a1 + 80) = 0;
  }
  v3 = *(const void **)(a1 + 88);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(a1 + 88) = 0;
  }
}

BOOL _DLBulkOperationContextShouldContinue(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 72);
  return !v1 || v1 == -13;
}

void _DLBulkOperationContextSetStatus(uint64_t a1, int a2, uint64_t a3)
{
  int v4;
  const void *v7;

  if (a2)
  {
    v4 = *(_DWORD *)(a1 + 72);
    if (!v4 || v4 == -13)
    {
      *(_DWORD *)(a1 + 72) = a2;
      v7 = *(const void **)(a1 + 80);
      if (v7)
        CFRelease(v7);
      *(_QWORD *)(a1 + 80) = a3;
    }
  }
}

__CFDictionary *_DLBulkOperationContextCreateResult(int a1, const void *a2)
{
  __CFDictionary *Mutable;
  CFNumberRef v4;
  int valuePtr;

  valuePtr = a1;
  if (!a1)
    return 0;
  Mutable = CFDictionaryCreateMutable(0, 4, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v4 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(Mutable, CFSTR("DLFileErrorCode"), v4);
  if (v4)
    CFRelease(v4);
  if (a2)
    CFDictionarySetValue(Mutable, CFSTR("DLFileErrorString"), a2);
  return Mutable;
}

void _DLBulkOperationContextAddResult(uint64_t a1, const void *a2, const void *a3)
{
  int v4;
  BOOL v5;
  const void *v6;

  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 88), a2, a3);
  v4 = *(_DWORD *)(a1 + 72);
  if (v4)
    v5 = v4 == -13;
  else
    v5 = 1;
  if (v5)
  {
    *(_DWORD *)(a1 + 72) = -13;
    v6 = *(const void **)(a1 + 80);
    if (v6)
      CFRelease(v6);
    *(_QWORD *)(a1 + 80) = CFSTR("Multi status");
  }
}

void _DLBulkOperationContextMergeResultsCallback(void *key, void *value, uint64_t a3)
{
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a3 + 88), key, value);
}

void _DLBulkOperationContextMergeResults(uint64_t a1, int a2, uint64_t a3, CFDictionaryRef theDict)
{
  int v8;
  const void *v9;

  if (theDict)
  {
    if (CFDictionaryGetCount(theDict))
    {
      CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_DLBulkOperationContextMergeResultsCallback, (void *)a1);
      v8 = *(_DWORD *)(a1 + 72);
      if (!v8 || v8 == -13)
      {
        *(_DWORD *)(a1 + 72) = -13;
        v9 = *(const void **)(a1 + 80);
        if (v9)
          CFRelease(v9);
        *(_QWORD *)(a1 + 80) = CFSTR("Multi status");
      }
    }
  }
  _DLBulkOperationContextSetStatus(a1, a2, a3);
}

uint64_t _DLBulkOperationContextUpdate(uint64_t result, const void *a2, const void *a3, uint64_t a4)
{
  int v4;
  BOOL v5;
  uint64_t v7;
  _DWORD *v8;
  int v9;

  v4 = *(_DWORD *)(result + 72);
  if (v4)
    v5 = v4 == -13;
  else
    v5 = 1;
  if (v5)
  {
    v7 = result;
    if (a3)
      _DLBulkOperationContextAddResult(result, a2, a3);
    v8 = *(_DWORD **)v7;
    result = CFRunLoopRunInMode((CFRunLoopMode)*MEMORY[0x24BDBD5A0], 0.0, 1u);
    if (*v8 == 4)
    {
      *(_DWORD *)(v7 + 72) = -14;
      *(_QWORD *)(v7 + 80) = CFSTR("Disconnected");
    }
    else
    {
      v9 = *(_DWORD *)(v7 + 72);
      if (!v9 || v9 == -13)
        return _DLOperationProgressContextUpdate(v7 + 16, a4);
    }
  }
  return result;
}

CFTypeRef _DLCreateBulkOperationContextStatusResponseData(uint64_t a1)
{
  return _DLCreateStatusResponseData(*(_DWORD *)(a1 + 72));
}

void _DLBulkOperationContextSendStatusResponse(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int valuePtr;

  v1 = *(_QWORD *)a1;
  valuePtr = *(_DWORD *)(a1 + 72);
  v2 = (const __CFString *)CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  _DLRequestWrite(v1, CFSTR("DLMessageStatusResponse"), 3, v3, v4, v5, v6, v7, v2);
  _DLRequestRead(v1);
  if (v2)
    CFRelease(v2);
}

uint64_t _DLSingleFromMultiError(uint64_t result, const __CFString *a2, CFDictionaryRef theDict, const __CFString **a4)
{
  const __CFString *v7;
  const __CFDictionary *v8;
  const __CFNumber *Value;
  const __CFString *v10;
  unsigned int valuePtr;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x24BDAC8D0];
  valuePtr = result;
  if ((_DWORD)result == -13)
  {
    if (!theDict || CFDictionaryGetCount(theDict) != 1)
    {
      if (a4)
      {
        v7 = CFSTR("Unexpected bulk operation result count");
        goto LABEL_9;
      }
      return 0xFFFFFFFFLL;
    }
    values = 0;
    keys[0] = 0;
    CFDictionaryGetKeysAndValues(theDict, (const void **)keys, (const void **)&values);
    if (CFStringCompare((CFStringRef)keys[0], a2, 0))
    {
      if (a4)
      {
        v7 = CFSTR("Unexpected bulk operation result key");
LABEL_9:
        *a4 = v7;
        return 0xFFFFFFFFLL;
      }
      return 0xFFFFFFFFLL;
    }
    v8 = (const __CFDictionary *)values;
    Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)values, CFSTR("DLFileErrorCode"));
    CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
    if (a4)
    {
      v10 = (const __CFString *)CFDictionaryGetValue(v8, CFSTR("DLFileErrorString"));
      *a4 = v10;
      if (v10)
        CFRetain(v10);
    }
    return valuePtr;
  }
  return result;
}

void DLSetRootDirectory()
{
  abort();
}

void _DLResolveAndValidatePath()
{
  abort();
}

CFTypeRef DLSetProgress(uint64_t a1, CFTypeRef cf, const void *a3)
{
  const void *v6;
  const void *v7;
  CFTypeRef result;

  v6 = *(const void **)(a1 + 160);
  if (v6)
  {
    CFRelease(v6);
    *(_QWORD *)(a1 + 160) = 0;
  }
  *(_QWORD *)(a1 + 160) = CFRetain(cf);
  v7 = *(const void **)(a1 + 168);
  if (v7)
  {
    CFRelease(v7);
    *(_QWORD *)(a1 + 168) = 0;
  }
  if (a3)
    result = CFRetain(a3);
  else
    result = 0;
  *(_QWORD *)(a1 + 168) = result;
  return result;
}

uint64_t DLGetProgressPercentage(uint64_t a1)
{
  return *(_QWORD *)(a1 + 160);
}

uint64_t DLGetProgressSize(uint64_t a1)
{
  return *(_QWORD *)(a1 + 168);
}

uint64_t DLCreateDirectory(uint64_t a1, const __CFString *a2, uint64_t a3, CFStringRef *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v8 = (char)a2;
  v9 = _DLProcessSyncMessageWithStatusResponse(a1, 0, a4, 13, CFSTR("DLMessageCreateDirectory"), 3, a7, a8, a2);
  if (DLShouldLog(6))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLCreateDirectory", 6, CFSTR("CreateDirectory(\"%@\"): %d %@"), v10, v11, v12, v13, v8);
  return v9;
}

uint64_t DLContentsOfDirectory(uint64_t a1, const __CFString *a2, uint64_t a3, _QWORD *a4, CFStringRef *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v8 = (char)a2;
  v9 = _DLProcessSyncMessageWithStatusResponse(a1, a4, a5, 13, CFSTR("DLContentsOfDirectory"), 3, a7, a8, a2);
  if (DLShouldLog(6))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLContentsOfDirectory", 6, CFSTR("ContentsOfDirectory(\"%@\"): %d %@"), v10, v11, v12, v13, v8);
  return v9;
}

uint64_t DLCopyItem(uint64_t a1, const __CFString *a2, uint64_t a3, uint64_t a4, CFStringRef *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v8 = (char)a2;
  v9 = _DLProcessSyncMessageWithStatusResponse(a1, 0, a5, 13, CFSTR("DLMessageCopyItem"), 5, a7, a8, a2);
  if (DLShouldLog(6))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLCopyItem", 6, CFSTR("CopyItem(\"%@\", \"%@\"): %d %@"), v10, v11, v12, v13, v8);
  return v9;
}

uint64_t DLMoveItem(uint64_t a1, const __CFString *a2, void *a3, uint64_t a4, CFStringRef *a5)
{
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CFTypeRef cf;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x24BDAC8D0];
  values = a3;
  keys[0] = (void *)a2;
  v9 = (const __CFString *)CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  cf = 0;
  v13 = DLMoveItems(a1, v9, a4, &cf, a5, v10, v11, v12);
  v14 = _DLSingleFromMultiError(v13, a2, (CFDictionaryRef)cf, a5);
  if (v9)
    CFRelease(v9);
  if (cf)
    CFRelease(cf);
  return v14;
}

uint64_t DLMoveItems(uint64_t a1, const __CFString *a2, uint64_t a3, _QWORD *a4, CFStringRef *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFString *v10;
  uint64_t v11;
  char Count;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (*(int *)(a1 + 32) >= 200)
    v10 = CFSTR("DLMessageMoveItems");
  else
    v10 = CFSTR("DLMessageMoveFiles");
  v11 = _DLProcessSyncMessageWithStatusResponse(a1, a4, a5, 13, v10, 3, a7, a8, a2);
  if (DLShouldLog(6))
  {
    Count = CFDictionaryGetCount((CFDictionaryRef)a2);
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLMoveItems", 6, CFSTR("MoveItems(%d): %d %@"), v13, v14, v15, v16, Count);
  }
  return v11;
}

uint64_t _DLRemoveDirectory(uint64_t a1, const __CFString *a2, uint64_t a3, CFStringRef *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v8 = (char)a2;
  v9 = _DLProcessSyncMessageWithStatusResponse(a1, 0, a4, 13, CFSTR("DLMessageRemoveDirectory"), 3, a7, a8, a2);
  if (DLShouldLog(6))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLRemoveDirectory", 6, CFSTR("RemoveDirectory(\"%@\"): %d %@"), v10, v11, v12, v13, v8);
  return v9;
}

void _DLRemoveItemUsingOldProtocolCallback(const __CFString *a1, uint64_t a2, uint64_t a3)
{
  const __CFString *v4;

  v4 = DLStringByAppendingPathComponent(*(const __CFString **)(a3 + 8), a1);
  DLRemoveItem(*(_QWORD *)a3, v4, 0, 0);
  if (v4)
    CFRelease(v4);
}

uint64_t DLRemoveItem(uint64_t a1, const __CFString *a2, uint64_t a3, CFStringRef *a4)
{
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFTypeRef cf;
  void *values[2];

  values[1] = *(void **)MEMORY[0x24BDAC8D0];
  values[0] = (void *)a2;
  v8 = (const __CFString *)CFArrayCreate(0, (const void **)values, 1, MEMORY[0x24BDBD690]);
  cf = 0;
  v12 = DLRemoveItems(a1, v8, a3, (CFDictionaryRef *)&cf, a4, v9, v10, v11);
  v13 = _DLSingleFromMultiError(v12, a2, (CFDictionaryRef)cf, a4);
  if (v8)
    CFRelease(v8);
  if (cf)
    CFRelease(cf);
  return v13;
}

void _DLRemoveItemsUsingOldProtocolCallback(const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD context[2];
  CFDictionaryRef theDict;

  theDict = 0;
  if (!DLContentsOfDirectory(*(_QWORD *)a3, a1, 0, &theDict, 0, a6, a7, a8))
  {
    context[0] = *(_QWORD *)a3;
    context[1] = a1;
    CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_DLRemoveItemUsingOldProtocolCallback, context);
    if (!_DLRemoveDirectory(*(_QWORD *)a3, a1, 0, 0, v10, v11, v12, v13))
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a3 + 8), a1);
  }
  if (theDict)
    CFRelease(theDict);
}

uint64_t _DLRemoveItemsUsingOldProtocol(uint64_t a1, const __CFString *a2, uint64_t a3, CFDictionaryRef *a4, CFStringRef *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  char Count;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t context;
  CFDictionaryRef MutableCopy;
  CFDictionaryRef theDict;

  MutableCopy = 0;
  theDict = 0;
  context = a1;
  v11 = _DLProcessSyncMessageWithStatusResponse(a1, &theDict, a5, 13, CFSTR("DLMessageRemoveFiles"), 3, a7, a8, a2);
  if (DLShouldLog(6))
  {
    Count = CFArrayGetCount((CFArrayRef)a2);
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLRemoveItemsUsingOldProtocol", 6, CFSTR("RemoveFiles(%d): %d %@"), v13, v14, v15, v16, Count);
  }
  if ((_DWORD)v11 == -13)
  {
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, theDict);
    CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_DLRemoveItemsUsingOldProtocolCallback, &context);
    if (CFDictionaryGetCount(MutableCopy))
    {
      if (a4)
      {
        *a4 = MutableCopy;
        v11 = 4294967283;
        goto LABEL_14;
      }
      v11 = 4294967283;
    }
    else if (a5 && *a5)
    {
      CFRelease(*a5);
      v11 = 0;
      *a5 = 0;
    }
    else
    {
      v11 = 0;
    }
  }
  if (MutableCopy)
  {
    CFRelease(MutableCopy);
    MutableCopy = 0;
  }
LABEL_14:
  if (theDict)
    CFRelease(theDict);
  return v11;
}

uint64_t DLRemoveItems(uint64_t a1, const __CFString *a2, uint64_t a3, CFDictionaryRef *a4, CFStringRef *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  char Count;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (*(int *)(a1 + 32) < 200)
    v9 = _DLRemoveItemsUsingOldProtocol(a1, a2, a3, a4, a5, a6, a7, a8);
  else
    v9 = _DLProcessSyncMessageWithStatusResponse(a1, a4, a5, 13, CFSTR("DLMessageRemoveItems"), 3, a7, a8, a2);
  v10 = v9;
  if (DLShouldLog(6))
  {
    Count = CFArrayGetCount((CFArrayRef)a2);
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLRemoveItems", 6, CFSTR("RemoveItems(%d): %d %@"), v12, v13, v14, v15, Count);
  }
  return v10;
}

void _DLRemoveItemOnComputerCallback(const __CFString *a1, const __CFString *a2)
{
  DLStringByAppendingPathComponent(a1, a2);
  abort();
}

BOOL _DLBulkOperationSendChunk(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v4;
  int v5;

  v4 = _DLSendBytesAndDisconnectOnError(*(_QWORD *)a1, a2, a3);
  _DLBulkOperationContextSetStatus(a1, v4, (uint64_t)CFSTR("Error sending chunk"));
  v5 = *(_DWORD *)(a1 + 72);
  return !v5 || v5 == -13;
}

uint64_t _DLSendBytesAndDisconnectOnError(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFMessagePort *v14;
  uint64_t v15;
  CFTypeRef cf;
  unsigned int v18;

  cf = 0;
  v4 = *(_QWORD *)(a1 + 64);
  v18 = 0;
  v5 = StreamHandlerSend(v4, a2, a3, &v18, &cf);
  if (v5)
  {
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLSendBytesAndDisconnectOnError", 3, CFSTR("Could not send data: '%@'"), v6, v7, v8, v9, (char)cf);
    CFRelease(cf);
    _DLCleanupStreamHandler(a1);
    v14 = *(__CFMessagePort **)(a1 + 96);
    v15 = sHandlerThreadConnectionSessionNumber | 0xCu;
    if (v14)
      DLThreadSendMessage(v14, v15, 0);
    else
      _DLMainThreadMessagePortCallback(0, v15, 0, (void (***)(_QWORD, _QWORD))a1, v10, v11, v12, v13);
  }
  if (v5)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

BOOL _DLBulkOperationSendFinalChunk(uint64_t a1, char a2, __CFString *a3)
{
  const __CFData *v5;
  const __CFData *v6;
  CFIndex Length;
  UInt8 *v8;
  _BOOL8 v9;
  CFRange v11;

  if (a3)
    v5 = (const __CFData *)DLCreateDataFromString(a3);
  else
    v5 = CFDataCreate(0, 0, 0);
  v6 = v5;
  Length = CFDataGetLength(v5);
  v8 = (UInt8 *)malloc_type_malloc(Length + 1, 0x9C0404C9uLL);
  *v8 = -a2;
  v11.location = 0;
  v11.length = Length;
  CFDataGetBytes(v6, v11, v8 + 1);
  v9 = _DLBulkOperationSendChunk(a1, (uint64_t)v8, Length + 1);
  if (v6)
    CFRelease(v6);
  free(v8);
  return v9;
}

uint64_t _DLSendFileForBulkOperation(uint64_t a1, uint64_t a2, CFStringRef *a3)
{
  _DWORD *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t (**v8)(int, char *, int);
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  __CFString **v14;
  unsigned int v15;
  __CFString *v16;

  v5 = *(_DWORD **)a1;
  v6 = *(_BYTE **)(*(_QWORD *)a1 + 176);
  v7 = *(_QWORD *)(*(_QWORD *)a1 + 184);
  v8 = _DLGetDeviceIOCallbacks(*(const __CFDictionary **)(a1 + 8));
  fcntl(a2, 48, 1);
  v9 = v7 - 1;
  v10 = (const __CFString *)*MEMORY[0x24BDBD5A0];
  while (1)
  {
    while (1)
    {
      v11 = ((uint64_t (*)(uint64_t (*)(int, char *, int), uint64_t, _BYTE *, uint64_t))v8[3])(v8[5], a2, v6 + 1, v9);
      if ((v11 & 0x8000000000000000) == 0)
        break;
      if (*__error() != 4)
      {
        v14 = (__CFString **)a3;
        v15 = DLStatusFromOSStatus(-1, a3);
        if (a3)
        {
LABEL_12:
          v16 = *v14;
          goto LABEL_13;
        }
LABEL_10:
        v16 = 0;
LABEL_13:
        _DLBulkOperationSendFinalChunk(a1, v15, v16);
        v13 = *(_DWORD *)(a1 + 72);
        goto LABEL_16;
      }
    }
    v12 = v11;
    if (!v11)
    {
      v15 = 0;
      v14 = (__CFString **)a3;
      if (a3)
        goto LABEL_12;
      goto LABEL_10;
    }
    CFRunLoopRunInMode(v10, 0.0, 1u);
    if (*v5 == 4)
    {
      v15 = 0;
      v13 = -14;
      *(_DWORD *)(a1 + 72) = -14;
      *(_QWORD *)(a1 + 80) = CFSTR("Disconnected");
      goto LABEL_16;
    }
    *v6 = 12;
    _DLBulkOperationSendChunk(a1, (uint64_t)v6, v12 + 1);
    v13 = *(_DWORD *)(a1 + 72);
    if (v13)
    {
      if (v13 != -13)
        break;
    }
    _DLOperationProgressContextUpdate(a1 + 16, v12);
  }
  v15 = 0;
LABEL_16:
  if (v13 == -13 || v13 == 0)
    return v15;
  else
    return v13;
}

uint64_t (**_DLGetDeviceIOCallbacks(const __CFDictionary *a1))(int, char *, int)
{
  const __CFNumber *Value;
  uint64_t valuePtr;

  if (!a1)
    return &_DLDefaultDeviceIOCallbacks;
  Value = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("DLDeviceIOCallbacks"));
  if (!Value)
    return &_DLDefaultDeviceIOCallbacks;
  valuePtr = 0;
  CFNumberGetValue(Value, kCFNumberLongType, &valuePtr);
  return (uint64_t (**)(int, char *, int))valuePtr;
}

uint64_t _DLReceiveFileForBulkOperation(uint64_t a1, uint64_t a2, CFStringRef *a3)
{
  _DWORD *v6;
  uint64_t (**v7)(int, char *, int);
  CFDataRef Message;
  const __CFData *v9;
  unsigned int v10;
  uint64_t v11;
  const UInt8 *BytePtr;
  CFIndex Length;
  CFIndex v14;
  int v15;
  CFIndex v16;
  uint64_t v17;
  int v18;
  unsigned int v19;
  uint64_t v20;
  int v21;
  const void *v22;
  int v23;
  BOOL v24;
  const void *v25;
  const __CFData *v26;
  const __CFData *v27;
  unsigned int v28;
  uint64_t v31;
  _DWORD *v32;
  uint64_t v33;
  const __CFString *mode;

  v6 = *(_DWORD **)a1;
  v7 = _DLGetDeviceIOCallbacks(*(const __CFDictionary **)(a1 + 8));
  fcntl(a2, 48, 1);
  Message = _DLHandlerThreadReadMessage((uint64_t)v6);
  v33 = a1;
  if (Message)
  {
    v9 = Message;
    v10 = 0;
    v11 = a1 + 16;
    mode = (const __CFString *)*MEMORY[0x24BDBD5A0];
    v31 = a1 + 16;
    v32 = v6;
    while (1)
    {
      BytePtr = CFDataGetBytePtr(v9);
      Length = CFDataGetLength(v9);
      v14 = Length - 1;
      if (Length < 1)
        break;
      v15 = *BytePtr;
      if (v15 != 12)
      {
        if (!v10)
        {
          v10 = -v15;
          v26 = CFDataCreate(0, BytePtr + 1, v14);
          v27 = v26;
          if (a3)
            *a3 = DLCreateStringFromData(v26);
          if (v27)
            CFRelease(v27);
        }
        goto LABEL_36;
      }
      if ((_DWORD)a2 != -1)
      {
        v16 = Length;
        if ((unint64_t)Length >= 2)
        {
          v17 = 1;
          while (1)
          {
            v18 = ((uint64_t (*)(uint64_t (*)(int, char *, int), uint64_t, const UInt8 *, CFIndex))v7[4])(v7[5], a2, &BytePtr[v17], v16 - v17);
            v19 = DLStatusFromOSStatus(v18, a3);
            if (v19)
              break;
            v17 += v18;
            if (v17 >= v16)
            {
              v10 = 0;
              goto LABEL_12;
            }
          }
          v10 = v19;
          a2 = 0xFFFFFFFFLL;
LABEL_12:
          v11 = v31;
          v6 = v32;
        }
      }
      _DLOperationProgressContextUpdate(v11, v14);
      CFRunLoopRunInMode(mode, 0.0, 1u);
      if (*v6 == 4)
      {
        *(_DWORD *)(v33 + 72) = -14;
        *(_QWORD *)(v33 + 80) = CFSTR("Disconnected");
        goto LABEL_36;
      }
      CFRelease(v9);
      v9 = _DLHandlerThreadReadMessage((uint64_t)v6);
      if (!v9)
        goto LABEL_17;
    }
    v23 = *(_DWORD *)(v33 + 72);
    if (v23)
      v24 = v23 == -13;
    else
      v24 = 1;
    if (v24)
    {
      *(_DWORD *)(v33 + 72) = -1;
      v25 = *(const void **)(v33 + 80);
      if (v25)
        CFRelease(v25);
      *(_QWORD *)(v33 + 80) = CFSTR("Empty response");
    }
LABEL_36:
    CFRelease(v9);
    v20 = v33;
  }
  else
  {
    v10 = 0;
LABEL_17:
    v20 = v33;
    v21 = *(_DWORD *)(v33 + 72);
    if (!v21 || v21 == -13)
    {
      *(_DWORD *)(v33 + 72) = -1;
      v22 = *(const void **)(v33 + 80);
      if (v22)
        CFRelease(v22);
      *(_QWORD *)(v33 + 80) = CFSTR("Error reading response");
    }
  }
  v28 = *(_DWORD *)(v20 + 72);
  if (v28 == -13 || v28 == 0)
    return v10;
  else
    return v28;
}

uint64_t DLUploadFile(uint64_t a1, const __CFString *a2, void *a3, uint64_t a4, CFStringRef *a5)
{
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CFTypeRef cf;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x24BDAC8D0];
  values = a3;
  keys[0] = (void *)a2;
  v9 = (const __CFString *)CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  cf = 0;
  v13 = DLUploadFiles(a1, v9, a4, &cf, a5, v10, v11, v12);
  v14 = _DLSingleFromMultiError(v13, a2, (CFDictionaryRef)cf, a5);
  if (v9)
    CFRelease(v9);
  if (cf)
    CFRelease(cf);
  return v14;
}

uint64_t DLUploadFiles(uint64_t a1, const __CFString *a2, uint64_t a3, _QWORD *a4, CFStringRef *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  char Count;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9 = _DLProcessSyncMessageWithStatusResponse(a1, a4, a5, 14, CFSTR("DLMessageUploadFiles"), 2, a7, a8, a2);
  if (DLShouldLog(6))
  {
    Count = CFDictionaryGetCount((CFDictionaryRef)a2);
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLUploadFiles", 6, CFSTR("DownloadFiles(%d): %d %@"), v11, v12, v13, v14, Count);
  }
  return v9;
}

void _DLUploadFilesFromDeviceCallback(__CFString *a1, __CFString *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t (**v7)(int, char *, int);
  int v8;
  BOOL v9;
  uint64_t (**v10)(int, char *, int);
  int v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  const __CFString *v15;
  __CFString *v16;
  int v17;
  __CFDictionary *Result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  CFTypeRef cf;

  v23 = 0;
  cf = 0;
  v6 = *(_QWORD *)a3;
  v7 = _DLGetDeviceIOCallbacks(*(const __CFDictionary **)(a3 + 8));
  v8 = *(_DWORD *)(a3 + 72);
  if (v8)
    v9 = v8 == -13;
  else
    v9 = 1;
  if (!v9)
    goto LABEL_25;
  v10 = v7;
  v11 = DLGetFileSystemRepresentation(a1, &v23, &cf);
  if (!v11)
  {
    v12 = ((uint64_t (*)(uint64_t (*)(int, char *, int), void *, uint64_t, _QWORD))*v10)(v10[5], v23, 256, 0);
    if ((v12 & 0x80000000) == 0)
    {
      v13 = v12;
      v14 = DLCreateDataFromString(a1);
      v11 = _DLSendDataAndDisconnectOnError(v6, (CFDataRef)v14);
      if (v14)
        CFRelease(v14);
      if (v11)
      {
        v15 = CFSTR("Error sending from path data");
      }
      else
      {
        v16 = DLCreateDataFromString(a2);
        v11 = _DLSendDataAndDisconnectOnError(v6, (CFDataRef)v16);
        if (v16)
          CFRelease(v16);
        if (!v11)
        {
          v11 = _DLSendFileForBulkOperation(a3, v13, (CFStringRef *)&cf);
          goto LABEL_18;
        }
        v15 = CFSTR("Error sending to path data");
      }
      _DLBulkOperationContextSetStatus(a3, v11, (uint64_t)v15);
LABEL_18:
      ((void (*)(uint64_t (*)(int, char *, int), uint64_t))v10[1])(v10[5], v13);
      goto LABEL_19;
    }
    v11 = DLStatusFromOSStatus(-1, (CFStringRef *)&cf);
  }
LABEL_19:
  v17 = *(_DWORD *)(a3 + 72);
  if (!v17 || v17 == -13)
  {
    Result = _DLBulkOperationContextCreateResult(v11, cf);
    _DLBulkOperationContextUpdate(a3, a1, Result, 0);
    if (Result)
      CFRelease(Result);
    if (DLShouldLog(6))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLUploadFilesFromDeviceCallback", 6, CFSTR("UploadFile(\"%@\", \"%@\"): %d %@"), v19, v20, v21, v22, (char)a1);
  }
LABEL_25:
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  free(v23);
}

uint64_t DLDownloadFile(uint64_t a1, const __CFString *a2, void *a3, uint64_t a4, CFStringRef *a5)
{
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CFTypeRef cf;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x24BDAC8D0];
  values = a3;
  keys[0] = (void *)a2;
  v9 = (const __CFString *)CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  cf = 0;
  v13 = DLDownloadFiles(a1, v9, a4, &cf, a5, v10, v11, v12);
  v14 = _DLSingleFromMultiError(v13, a2, (CFDictionaryRef)cf, a5);
  if (v9)
    CFRelease(v9);
  if (cf)
    CFRelease(cf);
  return v14;
}

uint64_t DLDownloadFiles(uint64_t a1, const __CFString *a2, uint64_t a3, _QWORD *a4, CFStringRef *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  char Count;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9 = _DLProcessSyncMessageWithStatusResponse(a1, a4, a5, 15, CFSTR("DLMessageDownloadFiles"), 2, a7, a8, a2);
  if (DLShouldLog(6))
  {
    Count = CFDictionaryGetCount((CFDictionaryRef)a2);
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLDownloadFiles", 6, CFSTR("DownloadFiles(%d): %d %@"), v11, v12, v13, v14, Count);
  }
  return v9;
}

void _DLDownloadFileToDevice(uint64_t a1, const void *a2, const __CFString *a3)
{
  uint64_t (**v6)(int, char *, int);
  int v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;
  std::error_code *v11;
  int v12;
  int v13;
  __CFDictionary *Result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  std::__fs::filesystem::path *__from;
  std::__fs::filesystem::path *__to;
  CFTypeRef cf;

  cf = 0;
  v6 = _DLGetDeviceIOCallbacks(*(const __CFDictionary **)(a1 + 8));
  __from = 0;
  __to = 0;
  v7 = DLGetFileSystemRepresentation(a3, (void **)&__to, &cf);
  if (v7)
  {
    v8 = v7;
LABEL_6:
    v10 = 0xFFFFFFFFLL;
LABEL_7:
    _DLReceiveFileForBulkOperation(a1, v10, 0);
    goto LABEL_8;
  }
  v9 = CFStringCreateWithFormat(0, 0, CFSTR("%@.%@"), a3, CFSTR("download"));
  v8 = DLGetFileSystemRepresentation(v9, (void **)&__from, &cf);
  if (v9)
    CFRelease(v9);
  if (v8)
    goto LABEL_6;
  v10 = ((uint64_t (*)(uint64_t (*)(int, char *, int), std::__fs::filesystem::path *, uint64_t, uint64_t))*v6)(v6[5], __from, 1793, 420);
  if ((v10 & 0x80000000) != 0)
  {
    v19 = DLStatusFromOSStatus(-1, (CFStringRef *)&cf);
    if (v19)
    {
      v8 = v19;
      goto LABEL_7;
    }
  }
  v8 = _DLReceiveFileForBulkOperation(a1, v10, (CFStringRef *)&cf);
LABEL_8:
  ((void (*)(uint64_t (*)(int, char *, int), uint64_t))v6[1])(v6[5], v10);
  if (v8)
  {
    unlink((const char *)__from);
  }
  else
  {
    rename(__from, __to, v11);
    v8 = DLStatusFromOSStatus(v12, (CFStringRef *)&cf);
  }
  v13 = *(_DWORD *)(a1 + 72);
  if (!v13 || v13 == -13)
  {
    Result = _DLBulkOperationContextCreateResult(v8, cf);
    _DLBulkOperationContextUpdate(a1, a2, Result, 0);
    if (Result)
      CFRelease(Result);
    if (DLShouldLog(6))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLDownloadFileToDevice", 6, CFSTR("DownloadFile(\"%@\", \"%@\"): %d %@"), v15, v16, v17, v18, (char)a2);
  }
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  free(__to);
  free(__from);
}

uint64_t DLGetFreeDiskSpace(uint64_t a1, _QWORD *a2, CFStringRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v16;
  uint64_t valuePtr;
  CFNumberRef number;

  number = 0;
  if (*(int *)(a1 + 32) > 299)
  {
    v10 = _DLProcessSyncMessageWithStatusResponse(a1, &number, a3, 13, CFSTR("DLMessageGetFreeDiskSpace"), 0, a7, a8, v16);
    v8 = v10;
    if (a2 && !(_DWORD)v10)
    {
      valuePtr = 0;
      CFNumberGetValue(number, kCFNumberLongLongType, &valuePtr);
      *a2 = valuePtr;
    }
  }
  else
  {
    if (!a3)
    {
      v8 = 4294967294;
      if (!DLShouldLog(6))
        goto LABEL_11;
      goto LABEL_10;
    }
    *a3 = CFSTR("DLGetFreeDiskSpace unimplemented by computer version");
    v8 = 4294967294;
  }
  if (!DLShouldLog(6))
    goto LABEL_11;
LABEL_10:
  _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLGetFreeDiskSpace", 6, CFSTR("GetFreeDiskSpace(): %d %@ %@"), v11, v12, v13, v14, v8);
LABEL_11:
  if (number)
    CFRelease(number);
  return v8;
}

uint64_t DLPurgeDiskSpace(uint64_t a1, _QWORD *a2, uint64_t a3, int a4, CFStringRef *a5)
{
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  CFNumberRef v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  CFNumberRef number;
  int v21;
  uint64_t valuePtr;

  valuePtr = a3;
  v21 = a4;
  number = 0;
  v8 = (const __CFString *)CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
  v11 = CFNumberCreate(0, kCFNumberIntType, &v21);
  if (*(int *)(a1 + 32) > 399)
  {
    v13 = _DLProcessSyncMessageWithStatusResponse(a1, &number, a5, 13, CFSTR("DLMessagePurgeDiskSpace"), 2, v9, v10, v8);
    v12 = v13;
    if (a2 && !(_DWORD)v13)
    {
      v19 = 0;
      CFNumberGetValue(number, kCFNumberLongLongType, &v19);
      *a2 = v19;
    }
  }
  else
  {
    if (!a5)
    {
      v12 = 4294967294;
      if (!DLShouldLog(6))
        goto LABEL_11;
      goto LABEL_10;
    }
    *a5 = CFSTR("DLPurgeDiskSpace unimplemented by computer version");
    v12 = 4294967294;
  }
  if (!DLShouldLog(6))
    goto LABEL_11;
LABEL_10:
  _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLPurgeDiskSpace", 6, CFSTR("PurgeDiskSpace(): %d %@ %@"), v14, v15, v16, v17, v12);
LABEL_11:
  if (number)
  {
    CFRelease(number);
    number = 0;
  }
  if (v8)
    CFRelease(v8);
  if (v11)
    CFRelease(v11);
  return v12;
}

uint64_t _DLCallHistoryAddEntry(void *value)
{
  __CFArray *Mutable;
  uint64_t result;

  if (sCallHistoryMutex)
    DLLock((pthread_mutex_t *)sCallHistoryMutex);
  Mutable = (__CFArray *)sCallHistory;
  if (!sCallHistory)
  {
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
    sCallHistory = (uint64_t)Mutable;
  }
  CFArrayAppendValue(Mutable, value);
  result = sCallHistoryMutex;
  if (sCallHistoryMutex)
    return DLUnlock((pthread_mutex_t *)sCallHistoryMutex);
  return result;
}

uint64_t _DLCheckVersionForAccept(uint64_t a1, CFTypeRef *a2)
{
  const __CFString *v4;
  const void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFData *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CFTypeRef v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const __CFString *v29;
  const __CFString *v30;
  CFTypeID v31;
  const __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  CFTypeRef v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const __CFString *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  CFTypeRef v60;
  int valuePtr;
  CFTypeRef cf;

  cf = 0;
  v4 = (const __CFString *)CFNumberCreate(0, kCFNumberIntType, &kDLProtocolVersion);
  v5 = CFNumberCreate(0, kCFNumberIntType, (const void *)(a1 + 36));
  v12 = (const __CFData *)_DLCreateMessageDataV(CFSTR("DLMessageVersionExchange"), 2, v6, v7, v8, v9, v10, v11, v4);
  v13 = _DLSendData(*(_QWORD *)(a1 + 64), v12, a2);
  if (v12)
    CFRelease(v12);
  if (v13)
  {
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForAccept", 3, CFSTR("Could not send data: '%@'"), v14, v15, v16, v17, (char)*a2);
    if (v4)
      CFRelease(v4);
    if (!v5)
      return 0;
    goto LABEL_9;
  }
  CFRelease(v4);
  CFRelease(v5);
  if (DLShouldLog(6))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForAccept", 6, CFSTR("Accepting side sent version numbers. DeviceLink %d, protocol %d"), v19, v20, v21, v22, kDLProtocolVersion);
  if (StreamHandlerReceive(*(_QWORD *)(a1 + 64), (CFDataRef *)&cf, a2))
  {
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForAccept", 3, CFSTR("Could not receive message: '%@'"), v23, v24, v25, v26, (char)*a2);
    v18 = cf;
    if (!cf)
      return 0;
    goto LABEL_16;
  }
  if (!cf)
  {
    if (!DLShouldLog(3))
      return 0;
    v46 = CFSTR("Did not receive version number data from connecting side");
LABEL_40:
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForAccept", 3, v46, v42, v43, v44, v45, (char)v60);
    return 0;
  }
  v5 = CFPropertyListCreateFromXMLData(0, (CFDataRef)cf, 0, (CFStringRef *)a2);
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (!v5)
  {
    if (!DLShouldLog(3))
      return 0;
    v60 = *a2;
    v46 = CFSTR("Did not receive version number array from connecting side: %@");
    goto LABEL_40;
  }
  v29 = _DLGetParameterAtIndexWithDefaultValue((const __CFArray *)v5, 1, 0);
  if (!v29 || (v30 = v29, v31 = CFGetTypeID(v29), v31 != CFStringGetTypeID()))
  {
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForAccept", 3, CFSTR("Invalid version received from the connect side"), v47, v48, v49, v50, (char)v60);
LABEL_9:
    v18 = v5;
LABEL_16:
    CFRelease(v18);
    return 0;
  }
  v32 = _DLGetParameterAtIndexWithDefaultValue((const __CFArray *)v5, 2, 0);
  valuePtr = 0;
  if (v32)
    CFNumberGetValue((CFNumberRef)v32, kCFNumberIntType, &valuePtr);
  if (DLShouldLog(6))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForAccept", 6, CFSTR("Accepting side received ok/nogo from connect side: %@"), v33, v34, v35, v36, (char)v30);
  if (CFStringCompare(v30, CFSTR("DLVersionsOk"), 0))
  {
    if (CFStringCompare(v30, CFSTR("DLErrorAcceptingDeviceLinkGreater"), 0))
    {
      if (DLShouldLog(3))
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForAccept", 3, CFSTR("Connecting side told the accepting side that the version numbers mismatch: %@"), v37, v38, v39, v40, (char)v30);
      v41 = CFRetain(v30);
      v27 = 0;
      *a2 = v41;
      goto LABEL_44;
    }
    if (DLShouldLog(4))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForAccept", 4, CFSTR("Our DeviceLink version (%d) is greater than the connecting side's version (%d), but that's ok"), v51, v52, v53, v54, kDLProtocolVersion);
  }
  v27 = 1;
LABEL_44:
  v55 = kDLProtocolVersion;
  if (kDLProtocolVersion >= valuePtr)
    v55 = valuePtr;
  *(_DWORD *)(a1 + 32) = v55;
  if (DLShouldLog(6))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForAccept", 6, CFSTR("Using DeviceLink protocol version %d"), v56, v57, v58, v59, *(_DWORD *)(a1 + 32));
  CFRelease(v5);
  return v27;
}

uint64_t _DLCheckVersionForConnect(uint64_t a1, CFTypeRef *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFArray *v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  const __CFString *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const __CFString *v39;
  const __CFData *v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  CFNumberRef v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const __CFData *v64;
  int v65;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  CFTypeRef v80;
  CFTypeRef v81;
  uint64_t valuePtr;
  CFTypeRef cf;

  cf = 0;
  if (StreamHandlerReceive(*(_QWORD *)(a1 + 64), (CFDataRef *)&cf, a2))
  {
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForConnect", 3, CFSTR("Could not receive message: '%@'"), v4, v5, v6, v7, (char)*a2);
    if (cf)
      CFRelease(cf);
    return 0;
  }
  if (!cf)
  {
    if (DLShouldLog(3))
    {
      v18 = CFSTR("Did not receive version number data from accepting side");
LABEL_54:
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForConnect", 3, v18, v14, v15, v16, v17, (char)v80);
    }
    return 0;
  }
  v8 = (const __CFArray *)CFPropertyListCreateFromXMLData(0, (CFDataRef)cf, 0, (CFStringRef *)a2);
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (!v8)
  {
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForConnect", 3, CFSTR("Did not receive version number array from accepting side: %@"), v19, v20, v21, v22, (char)*a2);
    return 0;
  }
  valuePtr = 0;
  v9 = _DLGetParameterAtIndexWithDefaultValue(v8, 0, 0);
  if (v9 && CFStringCompare(v9, CFSTR("DLMessageVersionExchange"), 0) == kCFCompareEqualTo)
  {
    v23 = _DLGetParameterAtIndexWithDefaultValue(v8, 1, 0);
    v24 = _DLGetParameterAtIndexWithDefaultValue(v8, 2, 0);
    if (v23)
      CFNumberGetValue((CFNumberRef)v23, kCFNumberIntType, (char *)&valuePtr + 4);
    if (v24)
      CFNumberGetValue((CFNumberRef)v24, kCFNumberIntType, &valuePtr);
    if (DLShouldLog(6))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForConnect", 6, CFSTR("Connecting side received version numbers from the accepting side. DeviceLink %d, app %d"), v25, v26, v27, v28, SBYTE4(valuePtr));
  }
  else if (DLShouldLog(6))
  {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForConnect", 6, CFSTR("Connecting side received message from accepting side, but either message was NULL or a mismatch on the expected %@: %@"), v10, v11, v12, v13, (char)CFSTR("DLMessageVersionExchange"));
  }
  CFRelease(v8);
  if (!HIDWORD(valuePtr))
  {
    v81 = 0;
    v40 = (const __CFData *)_DLCreateMessageDataV(CFSTR("DLMessageDisconnect"), 1, v29, v30, v31, v32, v33, v34, CFSTR("Protocol version mismatch"));
    v41 = _DLSendData(*(_QWORD *)(a1 + 64), v40, &v81);
    if (v40)
      CFRelease(v40);
    if (v41)
    {
      if (DLShouldLog(3))
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForConnect", 3, CFSTR("Could not send disconnect message: '%@'"), v42, v43, v44, v45, (char)v81);
      if (v81)
      {
        CFRelease(v81);
        v81 = 0;
      }
    }
    _DLCleanupStreamHandler(a1);
    return 0;
  }
  if (kDLProtocolVersion > SHIDWORD(valuePtr))
  {
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForConnect", 3, CFSTR("Connecting side determined that its DeviceLink protocol version is greater (connect: %d, accept: %d)"), v35, v36, v37, v38, kDLProtocolVersion);
    goto LABEL_28;
  }
  if (kDLProtocolVersion < SHIDWORD(valuePtr))
  {
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForConnect", 3, CFSTR("Connecting side determined that its DeviceLink protocol version is lesser (connect: %d, accept: %d)"), v46, v47, v48, v49, kDLProtocolVersion);
    v50 = CFSTR("DLErrorAcceptingDeviceLinkGreater");
    goto LABEL_41;
  }
  v71 = *(_DWORD *)(a1 + 36);
  if (v71 <= (int)valuePtr)
  {
    if (v71 >= (int)valuePtr)
    {
LABEL_28:
      v39 = CFSTR("DLVersionsOk");
LABEL_42:
      v51 = 1;
      goto LABEL_43;
    }
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForConnect", 3, CFSTR("Connecting side determined that its app protocol version is lesser (connect: %d, accept: %d)"), v76, v77, v78, v79, *(_DWORD *)(a1 + 36));
    v50 = CFSTR("DLErrorAcceptingProtocolGreater");
LABEL_41:
    v39 = (const __CFString *)CFRetain(v50);
    *a2 = v39;
    goto LABEL_42;
  }
  if (DLShouldLog(3))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForConnect", 3, CFSTR("Connecting side determined that its app protocol version is greater (connect: %d, accept: %d)"), v72, v73, v74, v75, *(_DWORD *)(a1 + 36));
  v39 = (const __CFString *)CFRetain(CFSTR("DLErrorConnectingProtocolGreater"));
  v51 = 0;
  *a2 = v39;
LABEL_43:
  v52 = kDLProtocolVersion;
  if (kDLProtocolVersion >= SHIDWORD(valuePtr))
    v52 = HIDWORD(valuePtr);
  *(_DWORD *)(a1 + 32) = v52;
  if (DLShouldLog(6))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForConnect", 6, CFSTR("Using DeviceLink protocol version %d"), v53, v54, v55, v56, *(_DWORD *)(a1 + 32));
  v57 = CFNumberCreate(0, kCFNumberIntType, &kDLProtocolVersion);
  v64 = (const __CFData *)_DLCreateMessageDataV(CFSTR("DLMessageVersionExchange"), 2, v58, v59, v60, v61, v62, v63, v39);
  if (v57)
    CFRelease(v57);
  v65 = _DLSendData(*(_QWORD *)(a1 + 64), v64, a2);
  if (v64)
    CFRelease(v64);
  if (v65)
  {
    if (DLShouldLog(3))
    {
      v80 = *a2;
      v18 = CFSTR("Could not send version response: '%@'");
      goto LABEL_54;
    }
    return 0;
  }
  if (DLShouldLog(6))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForConnect", 6, CFSTR("Connecting side sent %@"), v67, v68, v69, v70, (char)v39);
  return v51;
}

uint64_t _DLMainThreadMessagePortCallback(int a1, uint64_t a2, uint64_t xmlData, void (***a4)(_QWORD, _QWORD), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFData *v9;
  int v10;
  int v11;
  unsigned int v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  int v19;
  __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFArray *v25;
  const __CFArray *v26;
  CFIndex Count;
  unint64_t v28;
  const __CFString *ValueAtIndex;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int (*v34)(_QWORD, const __CFArray *);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const __CFArray *v41;
  const __CFString *v42;
  const __CFArray *v43;
  const __CFString *v44;
  __CFMessagePort *v45;
  __CFMessagePort *v46;
  const void *v47;
  CFIndex v48;
  CFIndex v49;
  const __CFString *v50;
  const __CFString *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  const __CFString *v57;
  const __CFString *v58;
  const __CFString *v59;
  const __CFString *v60;
  const __CFString *v61;
  const __CFString *v62;
  const __CFString *v63;
  __CFDictionary *MutableCopy;
  const __CFString *v65;
  const __CFString *v66;
  __CFDictionary *v67;
  const __CFString *v68;
  const __CFString *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const __CFString *v74;
  const __CFNumber *Value;
  const __CFString *v76;
  const __CFString *v77;
  const __CFString *v78;
  const __CFString *v79;
  const __CFString *v80;
  const __CFString *v81;
  const __CFString *v82;
  const __CFString *v83;
  const __CFString *v85;
  const __CFString *v86;
  const __CFString *v87;
  const __CFString *v88;
  const __CFString *v89;
  const __CFString *v90;
  const __CFString *v91;
  const __CFString *v92;
  const __CFString *v93;
  int v94;
  void (***v95)(_QWORD, _QWORD);
  CFStringRef errorString;
  const __CFString *valuePtr;

  v9 = (const __CFData *)xmlData;
  v10 = a2;
  errorString = 0;
  v11 = a2 & 0xFFFFFF00;
  v12 = a2;
  if (a2 >= 0x10u && DLShouldLog(4))
  {
    v95 = a4;
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLMainThreadMessagePortCallback", 4, CFSTR("Main thread invoked with unknown msgid %d for connection %p"), a5, a6, a7, a8, v12);
  }
  if (v11 == *((_DWORD *)a4 + 1))
  {
    if (sSaveCallHistory == 1)
    {
      v13 = v12 <= 0xF ? sDLMessageStrings[v12] : "(Invalid Message Code)";
      v20 = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("<- Main %s"), v13, v95);
      _DLCallHistoryAddEntry(v20);
      if (v20)
        CFRelease(v20);
    }
    switch((char)v10)
    {
      case 1:
        _DLCreateIOPMAssertion((uint64_t)a4, a2, xmlData, (uint64_t)a4, a5, a6, a7, a8, v94);
        if (v9)
        {
          v9 = (const __CFData *)CFPropertyListCreateFromXMLData(0, v9, 0, &errorString);
          if (!v9)
          {
            if (DLShouldLog(3))
              _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLMainThreadMessagePortCallback", 3, CFSTR("Could not create a property list from the message XML data: '%@'"), v21, v22, v23, v24, (char)errorString);
            v9 = 0;
          }
        }
        if (errorString)
        {
          CFRelease(errorString);
          errorString = 0;
        }
        (*a4[5])(a4, v9);
        goto LABEL_87;
      case 2:
        if (v9
          && (v43 = (const __CFArray *)CFPropertyListCreateFromXMLData(0, v9, 0, &errorString), (v9 = v43) != 0))
        {
          v44 = _DLGetParameterAtIndexWithDefaultValue(v43, 1, 0);
        }
        else
        {
          v44 = 0;
        }
        *(_DWORD *)a4 = 0;
        ((void (**)(_QWORD, const __CFString *))a4[5])[3](a4, v44);
        goto LABEL_87;
      case 3:
        _DLCreateIOPMAssertion((uint64_t)a4, a2, xmlData, (uint64_t)a4, a5, a6, a7, a8, v94);
        ((void (*)(void (***)(_QWORD, _QWORD)))a4[5][1])(a4);
        _DLRequestRead((uint64_t)a4);
        return 0;
      case 4:
        if (v9
          && (v41 = (const __CFArray *)CFPropertyListCreateFromXMLData(0, v9, 0, &errorString), (v9 = v41) != 0))
        {
          v42 = _DLGetParameterAtIndexWithDefaultValue(v41, 1, 0);
        }
        else
        {
          v42 = 0;
        }
        *(_DWORD *)a4 = 0;
        ((void (**)(_QWORD, const __CFString *))a4[5])[2](a4, v42);
LABEL_87:
        if (!v9)
          return 0;
        goto LABEL_92;
      case 5:
        if (v9)
        {
          v25 = (const __CFArray *)CFPropertyListCreateFromXMLData(0, v9, 0, &errorString);
          if (v25)
          {
            v26 = v25;
            Count = CFArrayGetCount(v25);
            if (Count < 1)
              goto LABEL_153;
            v28 = Count;
            ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v26, 0);
            if (sSaveCallHistory == 1)
              _DLCallHistoryMain(CFSTR("HandleIncomingMessage"), (uint64_t)ValueAtIndex);
            if (!ValueAtIndex && DLShouldLog(4))
              _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLHandleIncomingMessage", 4, CFSTR("HandleIncomingMessage called with NULL message!"), v30, v31, v32, v33, v94);
            if (CFStringCompare(ValueAtIndex, CFSTR("DLMessageDeviceReady"), 0) == kCFCompareEqualTo)
            {
              ((void (*)(void (***)(_QWORD, _QWORD)))a4[7][11])(a4);
              goto LABEL_153;
            }
            if (CFStringCompare(ValueAtIndex, CFSTR("DLMessageDisconnect"), 0) == kCFCompareEqualTo)
            {
              _DLCleanupStreamHandler((uint64_t)a4);
              if (v28 < 2)
                v57 = 0;
              else
                v57 = _DLGetParameterAtIndexWithDefaultValue(v26, 1, 0);
              ((void (**)(_QWORD, const __CFString *))a4[5])[4](a4, v57);
              goto LABEL_153;
            }
            if (CFStringCompare(ValueAtIndex, CFSTR("DLMessageProcessMessage"), 0) == kCFCompareEqualTo)
            {
              if (v28 < 2)
                v58 = 0;
              else
                v58 = _DLGetParameterAtIndexWithDefaultValue(v26, 1, 0);
              ((void (**)(_QWORD, const __CFString *))a4[5])[6](a4, v58);
              goto LABEL_153;
            }
            if (CFStringCompare(ValueAtIndex, CFSTR("DLMessagePing"), 0) == kCFCompareEqualTo)
            {
              if (v28 < 2)
                v59 = 0;
              else
                v59 = _DLGetParameterAtIndexWithDefaultValue(v26, 1, 0);
              ((void (**)(_QWORD, const __CFString *))a4[5])[7](a4, v59);
LABEL_116:
              _DLRequestRead((uint64_t)a4);
              goto LABEL_153;
            }
            if (CFStringCompare(ValueAtIndex, CFSTR("DLRequestFile"), 0))
            {
              if (CFStringCompare(ValueAtIndex, CFSTR("DLSendFile"), 0))
              {
                if (CFStringCompare(ValueAtIndex, CFSTR("DLMessageCreateDirectory"), 0))
                {
                  if (CFStringCompare(ValueAtIndex, CFSTR("DLMessageRemoveDirectory"), 0) == kCFCompareEqualTo)
                  {
                    v76 = _DLGetParameterAtIndexWithDefaultValue(v26, 1, 0);
                    valuePtr = v76;
                    _DLGetParameterAtIndexWithDefaultValue(v26, 2, 0);
                    v77 = _DLGetParameterAtIndexWithDefaultValue(v26, 3, 0);
                    if (v76 && v77)
                      _DLMainThreadMessagePortCallback_cold_1((const void **)&valuePtr);
                    if (!DLShouldLog(4))
                      goto LABEL_153;
                    v74 = CFSTR("RemoveDirectory message received with too few components");
                    goto LABEL_152;
                  }
                  if (CFStringCompare(ValueAtIndex, CFSTR("DLContentsOfDirectory"), 0))
                  {
                    if (CFStringCompare(ValueAtIndex, CFSTR("DLMessageMoveFiles"), 0)
                      && CFStringCompare(ValueAtIndex, CFSTR("DLMessageMoveItems"), 0))
                    {
                      if (CFStringCompare(ValueAtIndex, CFSTR("DLMessageRemoveFiles"), 0)
                        && CFStringCompare(ValueAtIndex, CFSTR("DLMessageRemoveItems"), 0))
                      {
                        if (CFStringCompare(ValueAtIndex, CFSTR("DLMessageCopyItem"), 0))
                        {
                          if (CFStringCompare(ValueAtIndex, CFSTR("DLMessageUploadFiles"), 0))
                          {
                            if (CFStringCompare(ValueAtIndex, CFSTR("DLMessageDownloadFiles"), 0))
                            {
                              if (CFStringCompare(ValueAtIndex, CFSTR("DLMessageGetFreeDiskSpace"), 0))
                              {
                                if (CFStringCompare(ValueAtIndex, CFSTR("DLMessagePurgeDiskSpace"), 0) == kCFCompareEqualTo)
                                  _DLMainThreadMessagePortCallback_cold_2(v26);
                                v34 = (unsigned int (*)(_QWORD, const __CFArray *))a4[3];
                                if (!v34 || v34(a4, v26))
                                {
                                  if (DLShouldLog(4))
                                    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLHandleIncomingMessage", 4, CFSTR("HandleIncomingMessage called with unknown message: %@"), v37, v38, v39, v40, (char)v26);
                                  DLDisconnect((uint64_t)a4, CFSTR("Unknown Message Received"), v35, v36, v37, v38, v39, v40);
                                }
                                goto LABEL_153;
                              }
LABEL_175:
                              abort();
                            }
                            v91 = _DLGetParameterAtIndexWithDefaultValue(v26, 1, 0);
                            _DLGetParameterAtIndexWithDefaultValue(v26, 2, 0);
                            v92 = _DLGetParameterAtIndexWithDefaultValue(v26, 3, 0);
                            v93 = _DLGetParameterAtIndexWithDefaultValue(v26, 4, 0);
                            if (v91 && v92 && v93)
                              goto LABEL_175;
                            if (DLShouldLog(4))
                            {
                              v74 = CFSTR("DownloadFiles message received with too few components");
                              goto LABEL_152;
                            }
LABEL_153:
                            v56 = 0;
LABEL_154:
                            if (errorString)
                            {
                              CFRelease(errorString);
                              errorString = 0;
                            }
                            if ((v56 & 1) == 0)
                              CFRelease(v26);
                            *((_BYTE *)a4 + 145) = 0;
                            return 0;
                          }
                          _DLGetParameterAtIndexWithDefaultValue(v26, 1, 0);
                          v89 = _DLGetParameterAtIndexWithDefaultValue(v26, 2, 0);
                          v90 = _DLGetParameterAtIndexWithDefaultValue(v26, 3, 0);
                          if (v89 && v90)
                            goto LABEL_175;
                          if (!DLShouldLog(4))
                            goto LABEL_153;
                          v74 = CFSTR("UploadFiles message received with too few components");
                        }
                        else
                        {
                          v85 = _DLGetParameterAtIndexWithDefaultValue(v26, 1, 0);
                          v86 = _DLGetParameterAtIndexWithDefaultValue(v26, 2, 0);
                          _DLGetParameterAtIndexWithDefaultValue(v26, 3, 0);
                          v87 = _DLGetParameterAtIndexWithDefaultValue(v26, 4, 0);
                          v88 = _DLGetParameterAtIndexWithDefaultValue(v26, 5, 0);
                          if (v85 && v86 && v87 && v88)
                            goto LABEL_175;
                          if (!DLShouldLog(4))
                            goto LABEL_153;
                          v74 = CFSTR("CopyItem message received with too few components");
                        }
                      }
                      else
                      {
                        v82 = _DLGetParameterAtIndexWithDefaultValue(v26, 1, 0);
                        _DLGetParameterAtIndexWithDefaultValue(v26, 2, 0);
                        v83 = _DLGetParameterAtIndexWithDefaultValue(v26, 3, 0);
                        if (v82 && v83)
                          goto LABEL_175;
                        if (!DLShouldLog(4))
                          goto LABEL_153;
                        v74 = CFSTR("RemoveItems message received with too few components");
                      }
                    }
                    else
                    {
                      v78 = _DLGetParameterAtIndexWithDefaultValue(v26, 1, 0);
                      _DLGetParameterAtIndexWithDefaultValue(v26, 2, 0);
                      v79 = _DLGetParameterAtIndexWithDefaultValue(v26, 3, 0);
                      if (v78 && v79)
                        goto LABEL_175;
                      if (!DLShouldLog(4))
                        goto LABEL_153;
                      v74 = CFSTR("MoveItems message received with too few components");
                    }
                  }
                  else
                  {
                    v80 = _DLGetParameterAtIndexWithDefaultValue(v26, 1, 0);
                    _DLGetParameterAtIndexWithDefaultValue(v26, 2, 0);
                    v81 = _DLGetParameterAtIndexWithDefaultValue(v26, 3, 0);
                    if (v80 && v81)
                      goto LABEL_175;
                    if (!DLShouldLog(4))
                      goto LABEL_153;
                    v74 = CFSTR("ContentsOfDirectory message received with too few components");
                  }
                }
                else
                {
                  v68 = _DLGetParameterAtIndexWithDefaultValue(v26, 1, 0);
                  _DLGetParameterAtIndexWithDefaultValue(v26, 2, 0);
                  v69 = _DLGetParameterAtIndexWithDefaultValue(v26, 3, 0);
                  if (v68 && v69)
                    goto LABEL_175;
                  if (!DLShouldLog(4))
                    goto LABEL_153;
                  v74 = CFSTR("CreateDirectory message received with too few components");
                }
LABEL_152:
                _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLHandleIncomingMessage", 4, v74, v70, v71, v72, v73, v94);
                goto LABEL_153;
              }
              if (v28 < 2)
              {
                v65 = 0;
              }
              else
              {
                v65 = _DLGetParameterAtIndexWithDefaultValue(v26, 1, 0);
                if (v28 != 2)
                {
                  v66 = _DLGetParameterAtIndexWithDefaultValue(v26, 2, 0);
LABEL_130:
                  ((void (*)(void (***)(_QWORD, _QWORD), const __CFString *, const __CFString *))a4[5][9])(a4, v65, v66);
                  LODWORD(valuePtr) = 0;
                  Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v66, CFSTR("DLFileStatusKey"));
                  CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
                  if ((_DWORD)valuePtr != 1)
                    goto LABEL_153;
                  if (sSaveCallHistory == 1)
                    _DLCallHistoryAddEntry(CFSTR("WaitForMessage"));
                  goto LABEL_116;
                }
              }
              v66 = 0;
              goto LABEL_130;
            }
            if (v28 < 2)
            {
              v60 = 0;
            }
            else
            {
              v60 = _DLGetParameterAtIndexWithDefaultValue(v26, 1, 0);
              if (v28 != 2)
              {
                v61 = _DLGetParameterAtIndexWithDefaultValue(v26, 2, 0);
                v62 = v61;
                if (v28 < 4)
                {
                  if (v61)
                    goto LABEL_146;
                }
                else
                {
                  v63 = _DLGetParameterAtIndexWithDefaultValue(v26, 3, 0);
                  if (v62)
                  {
                    if (v63)
                    {
                      MutableCopy = CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)v63);
LABEL_147:
                      v67 = MutableCopy;
                      CFDictionarySetValue(MutableCopy, CFSTR("DLFileDest"), v62);
LABEL_122:
                      ((void (*)(void (***)(_QWORD, _QWORD), const __CFString *, __CFDictionary *))a4[5][8])(a4, v60, v67);
                      if (v67)
                        CFRelease(v67);
                      goto LABEL_153;
                    }
LABEL_146:
                    MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                    goto LABEL_147;
                  }
                }
              }
            }
            v67 = 0;
            goto LABEL_122;
          }
        }
        else
        {
          errorString = (CFStringRef)CFRetain(CFSTR("NULL data returned from read"));
        }
        if (DLShouldLog(3))
          _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLMainThreadMessagePortCallback", 3, CFSTR("Error creating components from read data: '%@'"), v52, v53, v54, v55, (char)errorString);
        ((void (*)(void (***)(_QWORD, _QWORD)))a4[5][5])(a4);
        v26 = 0;
        v56 = 1;
        goto LABEL_154;
      case 6:
        if (!DLShouldLog(3))
          return 0;
        v18 = CFSTR("DLMainThreadMessagePortCallback called with DLWriteMessage");
        goto LABEL_81;
      case 7:
        _DLReleaseIOPMAssertion((uint64_t)a4);
        a4[5][4](a4, 0);
        return 0;
      case 8:
        v45 = (__CFMessagePort *)a4[10];
        if (v45)
          DLThreadDeleteReceivePort(v45);
        v46 = (__CFMessagePort *)a4[12];
        if (v46)
          DLThreadDeleteSendPort(v46);
        v47 = a4[15];
        if (v47)
          CFRelease(v47);
        free(a4);
        return 0;
      case 11:
        if (v9)
          v9 = (const __CFData *)CFPropertyListCreateFromXMLData(0, v9, 0, &errorString);
        v48 = CFArrayGetCount(v9);
        if (v48 < 2)
        {
          v50 = 0;
        }
        else
        {
          v49 = v48;
          v50 = _DLGetParameterAtIndexWithDefaultValue(v9, 1, 0);
          if (v49 != 2)
          {
            v51 = _DLGetParameterAtIndexWithDefaultValue(v9, 2, 0);
            goto LABEL_91;
          }
        }
        v51 = 0;
LABEL_91:
        ((void (*)(void (***)(_QWORD, _QWORD), const __CFString *, const __CFString *))a4[5][9])(a4, v50, v51);
        if (v9)
LABEL_92:
          CFRelease(v9);
        return 0;
      case 12:
        _DLReleaseIOPMAssertion((uint64_t)a4);
        ((void (*)(void (***)(_QWORD, _QWORD)))a4[5][5])(a4);
        return 0;
      case 13:
        if (!DLShouldLog(3))
          return 0;
        v18 = CFSTR("DLMainThreadMessagePortCallback called with DLWriteThenReadMessage");
        goto LABEL_81;
      default:
        if (!DLShouldLog(3))
          return 0;
        LOBYTE(v94) = v12;
        v18 = CFSTR("DLMainThreadMessagePortCallback called with unknown message type: %d");
LABEL_81:
        v19 = 3;
        goto LABEL_10;
    }
  }
  if (DLShouldLog(4))
  {
    v94 = v10 >> 8;
    v18 = CFSTR("Connection session number %d from incoming message doesn't match current connection %d (connection %p)");
    v19 = 4;
LABEL_10:
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLMainThreadMessagePortCallback", v19, v18, v14, v15, v16, v17, v94);
  }
  return 0;
}

void _DLCleanupStreamHandler(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFTypeRef cf;

  cf = 0;
  _DLReleaseIOPMAssertion(a1);
  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
  {
    if (StreamHandlerClose(v2, &cf) && DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCleanupStreamHandler", 3, CFSTR("Closing the stream handler in handler thread: '%@'"), v3, v4, v5, v6, (char)cf);
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
    if (StreamHandlerDeleteStreamHandler(*(_QWORD *)(a1 + 64), &cf) && DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCleanupStreamHandler", 3, CFSTR("Deleting the stream handler: '%@'"), v7, v8, v9, v10, (char)cf);
    if (cf)
      CFRelease(cf);
    *(_QWORD *)(a1 + 64) = 0;
  }
}

uint64_t _DLSendData(uint64_t a1, CFDataRef theData, CFTypeRef *a3)
{
  const UInt8 *BytePtr;
  unsigned int Length;
  unsigned int v9;

  if (!theData)
    return DLSetStatus(4294967293, a3, CFSTR("_DLSendAndReleaseData: data parameter is NULL"));
  BytePtr = CFDataGetBytePtr(theData);
  Length = CFDataGetLength(theData);
  v9 = 0;
  return StreamHandlerSend(a1, (uint64_t)BytePtr, Length, &v9, a3);
}

void _DLCreateIOPMAssertion(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;

  if (*(_BYTE *)(a1 + 146))
  {
    if (DLShouldLog(6))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCreateIOPMAssertion", 6, CFSTR("Grabbing PreventIdleSleep assertion..."), v10, v11, v12, v13, v19);
    v14 = (const __CFString *)DLGetProcessName();
    if (IOPMAssertionCreateWithName(CFSTR("NoIdleSleepAssertion"), 0xFFu, v14, (IOPMAssertionID *)(a1 + 208)))
    {
      if (DLShouldLog(3))
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCreateIOPMAssertion", 3, CFSTR("Could not grab idle sleep prevention assertion!"), v15, v16, v17, v18, a9);
    }
  }
}

void _DLReleaseIOPMAssertion(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  IOPMAssertionID v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  if (*(_BYTE *)(a1 + 146))
  {
    if (DLShouldLog(6))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLReleaseIOPMAssertion", 6, CFSTR("Releasing PreventIdleSleep assertion..."), v2, v3, v4, v5, v11);
    v6 = *(_DWORD *)(a1 + 208);
    if (v6)
    {
      if (IOPMAssertionRelease(v6))
      {
        if (DLShouldLog(3))
          _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLReleaseIOPMAssertion", 3, CFSTR("Could not release idle sleep prevention assertion"), v7, v8, v9, v10, v11);
      }
      *(_DWORD *)(a1 + 208) = 0;
    }
  }
}

uint64_t _DLHandlerThreadEntryPoint(uint64_t a1)
{
  CFStringRef v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v8 = *(_QWORD *)(a1 + 72);
  v2 = CFStringCreateWithFormat(0, 0, CFSTR("%@.%@"));
  *(_QWORD *)(a1 + 88) = DLThreadCreateReceivePort((uint64_t)v2, a1, (uint64_t)_DLHandlerThreadMessagePortCallback);
  *(_QWORD *)(a1 + 104) = DLThreadCreateSendPort((uint64_t)v2);
  if (v2)
    CFRelease(v2);
  DLThreadAddMessagePortToRunloop(*(__CFMessagePort **)(a1 + 88));
  DLSignal(*(pthread_cond_t **)(a1 + 128), *(pthread_mutex_t **)(a1 + 136), (_BYTE *)(a1 + 144));
  DLThreadRun();
  if (DLShouldLog(5))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLHandlerThreadEntryPoint", 5, CFSTR("Handler thread exited run loop"), v3, v4, v5, v6, v8);
  return 0;
}

uint64_t _DLDefaultOpenCallback(int a1, char *a2, int a3, unsigned int a4)
{
  return open(a2, a3, a4);
}

uint64_t _DLDefaultCloseCallback(int a1, int a2)
{
  return close(a2);
}

uint64_t _DLDefaultFstatCallback(int a1, int a2, stat *a3)
{
  return fstat(a2, a3);
}

ssize_t _DLDefaultReadCallback(int a1, int a2, void *a3, size_t a4)
{
  return read(a2, a3, a4);
}

ssize_t _DLDefaultWriteCallback(int a1, int __fd, void *__buf, size_t __nbyte)
{
  return write(__fd, __buf, __nbyte);
}

uint64_t DLThreadCreateThread(void *(__cdecl *a1)(void *), void *a2)
{
  pthread_t v3;

  v3 = 0;
  return pthread_create(&v3, 0, a1, a2);
}

pthread_cond_t *DLCreateCondition()
{
  pthread_cond_t *v0;
  int v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = (pthread_cond_t *)malloc_type_calloc(0x30uLL, 1uLL, 0x2BF0165FuLL);
  v1 = pthread_cond_init(v0, 0);
  if (v1)
  {
    v2 = v1;
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLCreateCondition", 3, CFSTR("Error initializing condition: %d"), v3, v4, v5, v6, v2);
    free(v0);
    return 0;
  }
  return v0;
}

void DLDeleteCondition(pthread_cond_t *a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = pthread_cond_destroy(a1);
  free(a1);
  if (v2)
  {
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLDeleteCondition", 3, CFSTR("Error destroying condition: %d"), v3, v4, v5, v6, v2);
  }
}

pthread_mutex_t *DLCreateMutex()
{
  pthread_mutex_t *v0;

  v0 = (pthread_mutex_t *)malloc_type_calloc(0x40uLL, 1uLL, 0xD1EDBC5CuLL);
  if (pthread_mutex_init(v0, 0))
  {
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLCreateMutex", 3, CFSTR("Error initializing mutex: %d"));
    free(v0);
    return 0;
  }
  return v0;
}

void DLDeleteMutex(pthread_mutex_t *a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = pthread_mutex_destroy(a1);
  free(a1);
  if (v2)
  {
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLDeleteMutex", 3, CFSTR("Error destroying mutex: %d"), v3, v4, v5, v6, v2);
  }
}

BOOL DLLock(pthread_mutex_t *a1)
{
  int v1;

  v1 = pthread_mutex_lock(a1);
  if (v1 && DLShouldLog(3))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLLock", 3, CFSTR("Error locking mutex: %d"));
  return v1 == 0;
}

BOOL DLUnlock(pthread_mutex_t *a1)
{
  int v1;

  v1 = pthread_mutex_unlock(a1);
  if (v1 && DLShouldLog(3))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLUnlock", 3, CFSTR("Error unlocking mutex: %d"));
  return v1 == 0;
}

void DLWait(pthread_cond_t *a1, pthread_mutex_t *a2, _BYTE *a3)
{
  int v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;

  v6 = pthread_mutex_lock(a2);
  if (v6)
  {
    v7 = v6;
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLWait", 3, CFSTR("Error locking mutex to wait on condition: %d"), v8, v9, v10, v11, v7);
  }
  else
  {
    while (!*a3)
    {
      if (DLShouldLog(5))
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLWait", 5, CFSTR("Waiting for flag to be set..."), v12, v13, v14, v15, v32);
      v16 = pthread_cond_wait(a1, a2);
      if (v16)
      {
        v17 = v16;
        if (DLShouldLog(3))
          _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLWait", 3, CFSTR("Error waiting on condition: %d"), v18, v19, v20, v21, v17);
        break;
      }
    }
    if (DLShouldLog(5))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLWait", 5, CFSTR("Done waiting for flag to be set, ready to rock and roll"), v22, v23, v24, v25, v32);
    v26 = pthread_mutex_unlock(a2);
    if (v26)
    {
      v27 = v26;
      if (DLShouldLog(3))
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLWait", 3, CFSTR("Error unlocking mutex after waiting on condition: %d"), v28, v29, v30, v31, v27);
    }
  }
}

void DLSignal(pthread_cond_t *a1, pthread_mutex_t *a2, _BYTE *a3)
{
  int v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = pthread_mutex_lock(a2);
  if (v6)
  {
    v7 = v6;
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLSignal", 3, CFSTR("Error locking mutex to broadcast condition: %d"), v8, v9, v10, v11, v7);
  }
  else
  {
    *a3 = 1;
    v12 = pthread_cond_broadcast(a1);
    if (v12)
    {
      v13 = v12;
      if (DLShouldLog(3))
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLSignal", 3, CFSTR("Error broadcasting for condition: %d"), v14, v15, v16, v17, v13);
    }
    v18 = pthread_mutex_unlock(a2);
    if (v18)
    {
      v19 = v18;
      if (DLShouldLog(3))
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLSignal", 3, CFSTR("Error unlocking mutex after broadcasting condition: %d"), v20, v21, v22, v23, v19);
    }
  }
}

__CFMessagePort *DLThreadCreateReceivePort(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  __CFMessagePort *v10;
  __CFMessagePort *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFMessagePortContext context;
  Boolean shouldFreeInfo;

  shouldFreeInfo = 0;
  v6 = malloc_type_calloc(0x10uLL, 1uLL, 0xF48238A9uLL);
  *v6 = a2;
  v6[1] = a3;
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.info = v6;
  v7 = DLGetUniqueProcessName();
  v8 = CFSTR("default");
  if (v7)
    v8 = (const __CFString *)v7;
  v9 = CFStringCreateWithFormat(0, 0, CFSTR("com.apple.DeviceLink.%@.%@"), v8, a1, context.version, context.info, context.retain, context.release, context.copyDescription);
  v10 = CFMessagePortCreateLocal(0, v9, (CFMessagePortCallBack)_DeviceLinkThreadMessageCallback, &context, &shouldFreeInfo);
  if (!v10 || shouldFreeInfo == 1)
  {
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLThreadCreateReceivePort", 3, CFSTR("Can't create message port for %@ (%@)"), v12, v13, v14, v15, a1);
    v11 = 0;
  }
  else
  {
    v11 = v10;
    CFMessagePortSetInvalidationCallBack(v10, (CFMessagePortInvalidationCallBack)_DeviceLinkThreadPortInvalidationCallback);
  }
  CFRelease(v9);
  return v11;
}

uint64_t _DeviceLinkThreadMessageCallback(__CFMessagePort *a1, uint64_t a2, const __CFData *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;
  UInt8 buffer[8];
  CFRange v21;

  if (DLShouldLog(7))
  {
    v12 = decodeMsgId(a2);
    if (a3)
      CFDataGetLength(a3);
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "_DeviceLinkThreadMessageCallback", 7, CFSTR("Callback with message %@-%d and %d bytes of data (0x%08x)"), v8, v9, v10, v11, v12);
  }
  *(_QWORD *)buffer = 0;
  if (a3 && CFDataGetLength(a3) == 8)
  {
    v21.location = 0;
    v21.length = 8;
    CFDataGetBytes(a3, v21, buffer);
  }
  if (a1 && CFMessagePortIsValid(a1))
  {
    v13 = (*(uint64_t (**)(__CFMessagePort *, uint64_t, _QWORD, _QWORD))(a4 + 8))(a1, a2, *(_QWORD *)buffer, *(_QWORD *)a4);
  }
  else
  {
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "_DeviceLinkThreadMessageCallback", 3, CFSTR("Can't send message to nil or invalid port"), v14, v15, v16, v17, v19);
    v13 = 0;
  }
  if (*(_QWORD *)buffer)
    CFRelease(*(CFTypeRef *)buffer);
  return v13;
}

void _DeviceLinkThreadPortInvalidationCallback(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (DLShouldLog(7))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "_DeviceLinkThreadPortInvalidationCallback", 7, CFSTR("Message port at 0x%08x is invalidated"), v2, v3, v4, v5, a1);
}

__CFMessagePort *DLThreadCreateSendPort(uint64_t a1)
{
  uint64_t v2;
  const __CFString *v3;
  const __CFString *v4;
  __CFMessagePort *Remote;
  __CFMessagePort *v6;

  v2 = DLGetUniqueProcessName();
  v3 = CFSTR("default");
  if (v2)
    v3 = (const __CFString *)v2;
  v4 = CFStringCreateWithFormat(0, 0, CFSTR("com.apple.DeviceLink.%@.%@"), v3, a1);
  Remote = CFMessagePortCreateRemote(0, v4);
  v6 = Remote;
  if (Remote)
    CFMessagePortSetInvalidationCallBack(Remote, (CFMessagePortInvalidationCallBack)_DeviceLinkThreadPortInvalidationCallback);
  CFRelease(v4);
  return v6;
}

__CFMessagePort *DLThreadAddMessagePortToRunloop(__CFMessagePort *local)
{
  __CFRunLoopSource *v1;
  __CFRunLoop *Current;

  if (local)
  {
    local = CFMessagePortCreateRunLoopSource(0, local, 0);
    if (local)
    {
      v1 = local;
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, v1, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
      CFRelease(v1);
      return (__CFMessagePort *)1;
    }
  }
  return local;
}

void DLThreadDeleteSendPort(__CFMessagePort *a1)
{
  if (a1)
  {
    CFMessagePortInvalidate(a1);
    CFRelease(a1);
  }
}

void DLThreadDeleteReceivePort(__CFMessagePort *a1)
{
  void *info;
  CFMessagePortContext v3;

  if (a1)
  {
    memset(&v3, 0, sizeof(v3));
    CFMessagePortGetContext(a1, &v3);
    info = v3.info;
    v3.info = 0;
    free(info);
    CFMessagePortInvalidate(a1);
    CFRelease(a1);
  }
}

CFDataRef _DLThreadSendMessage(__CFMessagePort *a1, SInt32 a2, const __CFData *a3, int a4)
{
  const __CFData *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  double v13;
  const __CFString *v14;
  SInt32 v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v26;
  CFDataRef returnData;
  UInt8 bytes[8];

  v5 = a3;
  returnData = 0;
  *(_QWORD *)bytes = a3;
  if (DLShouldLog(7))
  {
    v12 = decodeMsgId(a2);
    if (v5)
      CFDataGetLength(v5);
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "_DLThreadSendMessage", 7, CFSTR("Invoked with message %@-%d and %d bytes of data (0x%08x)"), v8, v9, v10, v11, v12);
  }
  if (v5)
    v5 = CFDataCreate(0, bytes, 8);
  if (a1 && CFMessagePortIsValid(a1) == 1)
  {
    v13 = 0.0;
    if (a4)
    {
      v13 = 86400.0;
      v14 = (const __CFString *)*MEMORY[0x24BDBD5A0];
    }
    else
    {
      v14 = 0;
    }
    v15 = CFMessagePortSendRequest(a1, a2, v5, 5.0, v13, v14, &returnData);
    if (v15)
    {
      v16 = v15;
      if (DLShouldLog(3))
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "_DLThreadSendMessage", 3, CFSTR("Error %d returned from call to CFMessagePortSendRequest"), v17, v18, v19, v20, v16);
    }
  }
  else if (DLShouldLog(3))
  {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "_DLThreadSendMessage", 3, CFSTR("Can't send message to nil or invalid port"), v21, v22, v23, v24, v26);
  }
  if (v5)
    CFRelease(v5);
  return returnData;
}

const __CFString *decodeMsgId(unsigned int a1)
{
  if (a1 > 0x11)
    return CFSTR("Unknown");
  else
    return (const __CFString *)*((_QWORD *)&off_24F330F50 + (int)a1);
}

void DLThreadSendMessage(__CFMessagePort *a1, SInt32 a2, const __CFData *a3)
{
  CFDataRef v3;

  v3 = _DLThreadSendMessage(a1, a2, a3, 0);
  if (v3)
    CFRelease(v3);
}

CFDataRef DLThreadSendSyncMessage(__CFMessagePort *a1, SInt32 a2, const __CFData *a3)
{
  return _DLThreadSendMessage(a1, a2, a3, 1);
}

uint64_t DLSetStatus(uint64_t a1, CFTypeRef *a2, CFTypeRef cf)
{
  char v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (char)cf;
  if (a2)
  {
    *a2 = CFRetain(cf);
  }
  else if (DLLoggingEnabled(3) || DLOutputEnabled(3))
  {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLSetStatus", 3, CFSTR("An error occured, but no error string pointer was passed to the function. The error was:\n%@"), v5, v6, v7, v8, v3);
  }
  return a1;
}

BOOL DLShouldLog(int a1)
{
  return DLLoggingEnabled(a1) || DLOutputEnabled(a1);
}

void _DLLog(const char *a1, const char *a2, int a3, const __CFString *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unint64_t v13;
  pthread_mutex_t *v14;
  _BOOL4 v15;
  const char *v16;
  size_t v17;
  size_t v18;
  const char *v19;
  unint64_t v20;
  const char *v21;
  unint64_t v22;
  const char *v23;
  const __CFAllocator *v24;
  CFStringRef v25;
  __CFDateFormatter *v26;
  CFAbsoluteTime Current;
  CFStringRef StringWithAbsoluteTime;
  const __CFString *v29;
  uint64_t v30;
  uint64_t v31;
  pthread_t v32;
  unint64_t v33;
  unint64_t v34;
  CFStringEncoding v35;
  CFIndex v36;
  const __CFURL *v37;
  const __CFURL *v38;
  const __CFURL *v39;
  const __CFString *v40;
  const __CFURL *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  const __CFString *v45;
  uint64_t Length;
  CFRange v47;
  const __CFString *v48;
  void *v49;
  uint64_t FastestEncoding;
  CFStringEncoding v51;
  CFStringRef NameOfEncoding;
  uint64_t SmallestEncoding;
  CFStringEncoding v54;
  CFStringRef v55;
  uint64_t v56;
  pthread_t v57;
  const __CFString *v58;
  const char *v59;
  char *v60;
  const __CFURL *v61;
  const __CFString *StringForLogFile;
  const __CFString *v63;
  _BOOL4 v64;
  char *v65;
  int v66;
  uint64_t v67;
  const __CFString *v68;
  char *v69;
  int v70;
  const __CFString *v71;
  const __CFString *v72;
  std::__fs::filesystem::path *v73;
  std::__fs::filesystem::path *v74;
  std::error_code *v75;
  int v76;
  int *v77;
  char *v78;
  int v79;
  const void *v80;
  CFIndex *usedBufLen;
  const char *v82;
  unint64_t v83;
  _BOOL4 v84;
  const char *v85;
  stat v86;
  CFRange v87;

  v13 = 0x255A9B000uLL;
  v14 = (pthread_mutex_t *)sLogMutex;
  v15 = (sLogMutex || (v14 = DLCreateMutex(), (sLogMutex = (uint64_t)v14) != 0)) && DLLock(v14);
  if (!a1)
    a1 = "UNKNOWN";
  if (a2)
    v16 = a2;
  else
    v16 = "UNKNOWN";
  v17 = strlen(a1);
  do
  {
    v18 = v17;
    v19 = &a1[v17];
    v20 = (unint64_t)&a1[v17 - 1];
    if (v20 <= (unint64_t)a1)
      break;
    --v17;
  }
  while (*(v19 - 2) != 47);
  v21 = v19 - 2;
  if (v18 == 2)
    v22 = (unint64_t)v21;
  else
    v22 = v20;
  if ((a3 - 3) > 4)
    v23 = "UNKNOWN";
  else
    v23 = (&off_24F330FE8)[a3 - 3];
  v24 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v25 = CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, a4, &a9);
  if (!DLLoggingEnabled(a3))
  {
    v29 = CFSTR("Log error");
    goto LABEL_50;
  }
  v26 = (__CFDateFormatter *)dateFormat;
  if (dateFormat)
  {
    Current = CFAbsoluteTimeGetCurrent();
    StringWithAbsoluteTime = CFDateFormatterCreateStringWithAbsoluteTime(v24, v26, Current);
  }
  else
  {
    StringWithAbsoluteTime = &stru_24F333598;
  }
  v30 = DLGetProcessName();
  v31 = getpid();
  v32 = pthread_self();
  v29 = CFStringCreateWithFormat(0, 0, CFSTR("%@|%@|%ld:%lu|%s:%s| %s: %@\n"), StringWithAbsoluteTime, v30, v31, v32, v22, v16, v23, v25);
  if (StringWithAbsoluteTime)
    CFRelease(StringWithAbsoluteTime);
  v33 = 0x255A9B000uLL;
  if ((logStream & 0x80000000) == 0)
    goto LABEL_26;
  v37 = (const __CFURL *)CFCopyHomeDirectoryURLForUser();
  if (!v37)
  {
    CFPrintf(CFSTR("Could not get a home directory path"), usedBufLen);
    goto LABEL_50;
  }
  v38 = v37;
  v39 = CFURLCreateCopyAppendingPathComponent(0, v37, CFSTR("Library/Logs"), 1u);
  CFRelease(v38);
  if (!v39)
  {
    CFPrintf(CFSTR("Could not get a log directory path from %@"), 0);
    goto LABEL_50;
  }
  v85 = v16;
  if (sLogDirectoryName)
    v40 = (const __CFString *)sLogDirectoryName;
  else
    v40 = CFSTR("DeviceLink");
  v41 = CFURLCreateCopyAppendingPathComponent(0, v39, v40, 1u);
  CFRelease(v39);
  if (!v41)
  {
    CFPrintf(CFSTR("Could not get the current process' log directory path at %@"), 0);
    goto LABEL_47;
  }
  v42 = CFURLCopyFileSystemPath(v41, kCFURLPOSIXPathStyle);
  if (!v42)
  {
    CFPrintf(CFSTR("Could not get a string for the current process' log directory path at %@"), v41);
    v80 = v41;
LABEL_85:
    CFRelease(v80);
    goto LABEL_47;
  }
  v43 = v42;
  DLEnsureDirectoryExists(v42);
  CFRelease(v43);
  v44 = (const __CFString *)DLGetProcessName();
  if (v44
    && (v45 = v44,
        Length = CFStringGetLength(v44),
        v47.location = (unint64_t)CFStringFind(v45, CFSTR("/"), 4uLL).location + 1,
        Length - v47.location >= 1))
  {
    v47.length = Length - v47.location;
    v48 = CFStringCreateWithSubstring(0, v45, v47);
  }
  else
  {
    v48 = CFSTR("DeviceLink");
  }
  v61 = CFURLCreateCopyAppendingPathComponent(0, v41, v48, 0);
  CFRelease(v41);
  if (!v61)
  {
    CFPrintf(CFSTR("Could not create a log base filename from %@"), 0);
    if (v48)
    {
      v80 = v48;
      goto LABEL_85;
    }
LABEL_47:
    v16 = v85;
    goto LABEL_50;
  }
  v83 = v22;
  StringForLogFile = _createStringForLogFile(v61, 0);
  if (StringForLogFile)
  {
    v63 = StringForLogFile;
    v64 = v15;
    memset(&v86, 0, sizeof(v86));
    v65 = (char *)DLCreateCStringFromCFString(StringForLogFile);
    v66 = stat(v65, &v86);
    CFRelease(v63);
    if (v66)
    {
      v15 = v64;
      v13 = 0x255A9B000;
    }
    else
    {
      v15 = v64;
      v13 = 0x255A9B000;
      if (v86.st_size >= 16777217)
      {
        v82 = v23;
        v84 = v15;
        v67 = 1;
        do
        {
          v68 = _createStringForLogFile(v61, v67);
          v69 = (char *)DLCreateCStringFromCFString(v68);
          v70 = stat(v69, &v86);
          free(v69);
          if (v68)
            CFRelease(v68);
          if (v70)
            v67 = v67;
          else
            v67 = (v67 + 1);
        }
        while (!v70 && v67 < 0xB);
        if ((int)v67 >= 10)
          v67 = 10;
        else
          v67 = v67;
        do
        {
          v71 = _createStringForLogFile(v61, v67);
          v67 = (v67 - 1);
          v72 = _createStringForLogFile(v61, v67);
          v73 = (std::__fs::filesystem::path *)DLCreateCStringFromCFString(v71);
          v74 = (std::__fs::filesystem::path *)DLCreateCStringFromCFString(v72);
          rename(v74, v73, v75);
          if (v76 < 0)
          {
            v77 = __error();
            v78 = strerror(*v77);
            CFPrintf(CFSTR("Could not move log file from %s to %s: %s"), v74, v73, v78);
          }
          free(v73);
          free(v74);
        }
        while ((v67 + 1) > 1);
        v13 = 0x255A9B000;
        v15 = v84;
        v23 = v82;
        v79 = open(v65, 1538, 384);
        goto LABEL_91;
      }
    }
    v79 = open(v65, 522, 384);
LABEL_91:
    logStream = v79;
    CFRelease(v61);
    if ((logStream & 0x80000000) == 0)
    {
      atexit((void (*)(void))_closeLogStream);
      if (v48)
        CFRelease(v48);
      free(v65);
      v16 = v85;
      v22 = v83;
      v33 = 0x255A9B000;
LABEL_26:
      v34 = v33;
      v35 = 134217984;
      *(_QWORD *)&v86.st_dev = 0;
      v87.length = CFStringGetLength(v29);
      v87.location = 0;
      v85 = v16;
      if (CFStringGetBytes(v29, v87, 0x8000100u, 0, 0, 0, v87.length, (CFIndex *)&v86.st_dev) <= 0)
      {
        CFPrintf(CFSTR("Can't determine byte count for log line, falling back to ASCII.\nLine is %@\n"), v29);
        v36 = CFStringGetLength(v29);
        v35 = 1536;
      }
      else
      {
        v36 = *(_QWORD *)&v86.st_dev;
      }
      v49 = malloc_type_malloc(((v36 << 32) + 0x100000000) >> 32, 0xACC7CA42uLL);
      if (CFStringGetCString(v29, (char *)v49, ((v36 << 32) + 0x100000000) >> 32, v35))
      {
        if (write(*(_DWORD *)(v34 + 1756), v49, (int)v36) < 0 && DLOutputEnabled(3))
          CFPrintf(CFSTR("Error writing to the log file stream: %s\n"), v49);
        free(v49);
      }
      else
      {
        FastestEncoding = CFStringGetFastestEncoding(v29);
        v51 = CFStringGetFastestEncoding(v29);
        NameOfEncoding = CFStringGetNameOfEncoding(v51);
        SmallestEncoding = CFStringGetSmallestEncoding(v29);
        v54 = CFStringGetSmallestEncoding(v29);
        v55 = CFStringGetNameOfEncoding(v54);
        CFPrintf(CFSTR("Could not get C string to log to the log file, fastest string encoding is %d: %@, smallest string encoding is %d: %@, line is %@\n"), FastestEncoding, NameOfEncoding, SmallestEncoding, v55, v29);
      }
      v13 = 0x255A9B000;
      goto LABEL_47;
    }
    CFPrintf(CFSTR("Could not open log file at %s\n"), v65);
    if (v48)
      CFRelease(v48);
    free(v65);
    v16 = v85;
    goto LABEL_98;
  }
  CFPrintf(CFSTR("Could not get a string for the log file name %@"), v61);
  v16 = v85;
  if (v48)
    CFRelease(v48);
  CFRelease(v61);
LABEL_98:
  v22 = v83;
LABEL_50:
  if (DLOutputEnabled(a3))
  {
    v56 = getpid();
    v57 = pthread_self();
    v58 = CFStringCreateWithFormat(0, 0, CFSTR("%ld:%lu|%s:%s| %s: %@"), v56, v57, v22, v16, v23, v25);
    v59 = (const char *)DLCreateCStringFromCFString(v58);
    if (v59)
    {
      v60 = (char *)v59;
      syslog(a3, "%s", v59);
      free(v60);
    }
    CFRelease(v58);
  }
  if (v29)
    CFRelease(v29);
  if (v25)
    CFRelease(v25);
  if (v15)
    DLUnlock(*(pthread_mutex_t **)(v13 + 1792));
}

CFStringRef DLCopyHomeDirPath()
{
  const __CFURL *v0;
  const __CFURL *v1;
  CFStringRef v2;

  v0 = (const __CFURL *)CFCopyHomeDirectoryURLForUser();
  if (v0)
  {
    v1 = v0;
    v2 = CFURLCopyFileSystemPath(v0, kCFURLPOSIXPathStyle);
    CFRelease(v1);
    return v2;
  }
  else
  {
    fwrite("Could not get a home URL for the default user\n", 0x2EuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    return 0;
  }
}

CFStringRef _DLWarnAboutUsingCopyHomeDirPathAndCallDLCopyHomeDirPath()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char vars0;

  if ((_DLWarnAboutUsingCopyHomeDirPathAndCallDLCopyHomeDirPath_pScreamedAndShouted & 1) == 0)
  {
    _DLWarnAboutUsingCopyHomeDirPathAndCallDLCopyHomeDirPath_pScreamedAndShouted = 1;
    if (DLLoggingEnabled(3) || DLOutputEnabled(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "_DLWarnAboutUsingCopyHomeDirPathAndCallDLCopyHomeDirPath", 3, CFSTR("*** The function copyHomeDirPath has been deprecated and will be removed in a future release. Change your code to use DLCopyHomeDirPath."), v0, v1, v2, v3, vars0);
  }
  return DLCopyHomeDirPath();
}

CFStringRef DLCopyTempDir()
{
  char buffer[1024];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  strcpy(buffer, "/tmp");
  return CFStringCreateWithFileSystemRepresentation(0, buffer);
}

CFStringRef DLStringByAppendingPathComponent(const __CFString *a1, const __CFString *a2)
{
  char *v4;
  Boolean v5;
  const __CFURL *v6;
  const __CFURL *v7;
  CFStringRef v8;
  stat v10;
  CFRange v11;

  if (CFStringGetLength(a1))
  {
    v4 = (char *)DLCreateCStringFromCFString(a1);
    memset(&v10, 0, sizeof(v10));
    v5 = stat(v4, &v10) >= 0 && (v10.st_mode & 0x4000) != 0;
    v6 = CFURLCreateWithFileSystemPath(0, a1, kCFURLPOSIXPathStyle, v5);
    v7 = CFURLCreateCopyAppendingPathComponent(0, v6, a2, v5);
    v8 = CFURLCopyFileSystemPath(v7, kCFURLPOSIXPathStyle);
    CFRelease(v6);
    CFRelease(v7);
    free(v4);
    return v8;
  }
  else
  {
    v11.length = CFStringGetLength(a2);
    v11.location = 0;
    return CFStringCreateWithSubstring(0, a2, v11);
  }
}

void *DLCreateCStringFromCFString(const __CFString *a1)
{
  CFIndex Length;
  CFIndex v3;
  void *v4;
  void *v5;

  if (!a1)
    return 0;
  Length = CFStringGetLength(a1);
  v3 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v4 = malloc_type_malloc(v3, 0x3875796FuLL);
  v5 = v4;
  if (v4)
  {
    bzero(v4, v3);
    if (!CFStringGetCString(a1, (char *)v5, v3, 0x8000100u))
    {
      free(v5);
      return 0;
    }
  }
  return v5;
}

CFStringRef DLStringByRemovingLastPathComponent(const __CFString *a1)
{
  char *v2;
  Boolean v3;
  const __CFURL *v4;
  const __CFURL *PathComponent;
  CFStringRef v6;
  stat v8;

  v2 = (char *)DLCreateCStringFromCFString(a1);
  memset(&v8, 0, sizeof(v8));
  v3 = stat(v2, &v8) >= 0 && (v8.st_mode & 0x4000) != 0;
  v4 = CFURLCreateWithFileSystemPath(0, a1, kCFURLPOSIXPathStyle, v3);
  PathComponent = CFURLCreateCopyDeletingLastPathComponent(0, v4);
  v6 = CFURLCopyFileSystemPath(PathComponent, kCFURLPOSIXPathStyle);
  CFRelease(v4);
  CFRelease(PathComponent);
  free(v2);
  return v6;
}

void DLEnsureDirectoryExists(const __CFString *a1)
{
  CFIndex MaximumSizeOfFileSystemRepresentation;
  char *v3;
  char *v4;
  const __CFArray *ArrayBySeparatingStrings;
  const __CFArray *v6;
  int Count;
  uint64_t v8;
  CFIndex v9;
  const __CFString *ValueAtIndex;
  CFIndex v11;
  void *v12;
  FILE *v13;
  int *v14;
  char *v15;
  stat v16;

  if (a1)
  {
    MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(a1);
    v3 = (char *)malloc_type_calloc(1uLL, MaximumSizeOfFileSystemRepresentation, 0x1D38B2CDuLL);
    if (v3)
    {
      v4 = v3;
      if (CFStringGetFileSystemRepresentation(a1, v3, MaximumSizeOfFileSystemRepresentation) == 1)
      {
        memset(&v16, 0, sizeof(v16));
        if (stat(v4, &v16))
        {
          bzero(v4, MaximumSizeOfFileSystemRepresentation);
          ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, a1, CFSTR("/"));
          if (ArrayBySeparatingStrings)
          {
            v6 = ArrayBySeparatingStrings;
            Count = CFArrayGetCount(ArrayBySeparatingStrings);
            if (Count >= 2)
            {
              v8 = Count;
              v9 = 1;
              while (1)
              {
                ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v6, v9);
                v11 = CFStringGetMaximumSizeOfFileSystemRepresentation(ValueAtIndex);
                v12 = malloc_type_calloc(1uLL, v11, 0x5ABF349uLL);
                if (CFStringGetFileSystemRepresentation(ValueAtIndex, (char *)v12, v11) != 1)
                {
                  fwrite("DLEnsureDirectoryExists: Can't get File System encoded char* for path component string\n", 0x57uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
                  free(v12);
                  goto LABEL_19;
                }
                *(_WORD *)&v4[strlen(v4)] = 47;
                strcat(v4, (const char *)v12);
                free(v12);
                if (stat(v4, &v16))
                {
                  if (mkdir(v4, 0x1FFu) && *__error() != 17)
                    break;
                }
                if (v8 == ++v9)
                  goto LABEL_19;
              }
              v13 = (FILE *)*MEMORY[0x24BDAC8D8];
              v14 = __error();
              v15 = strerror(*v14);
              fprintf(v13, "DLEnsureDirectoryExists: Can't make directory for %s: %s\n", v4, v15);
            }
LABEL_19:
            CFRelease(v6);
          }
        }
        free(v4);
      }
      else
      {
        fwrite("DLEnsureDirectoryExists: Can't get File System encoded char* for path component string\n", 0x57uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
        free(v4);
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "DLEnsureDirectoryExists: can't malloc %ld bytes", MaximumSizeOfFileSystemRepresentation);
    }
  }
  else
  {
    fwrite("DLEnsureDirectoryExists called on a NULL path\n", 0x2EuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
  }
}

__CFDictionary *DLCopyFileAttributes(const __CFString *a1)
{
  const char *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFDictionary *Mutable;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  char v78;
  char v79;
  char v80;
  char v81;
  char v82;
  char v83;
  char v84;
  char v85;
  char v86;
  char v87;
  char v88;
  char v89;
  char v90;
  char v91;
  stat valuePtr;

  if (a1)
  {
    v2 = (const char *)DLCreateCStringFromCFString(a1);
    if (v2)
    {
      v3 = (char *)v2;
      memset(&valuePtr, 0, sizeof(valuePtr));
      if (!stat(v2, &valuePtr))
      {
        free(v3);
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        CFDictionaryAddValue(Mutable, CFSTR("Filename"), a1);
        _DLAddNumberToDict(&valuePtr, kCFNumberSInt32Type, CFSTR("DeviceIdentifier"), Mutable, v14, v15, v16, v17, v77);
        _DLAddNumberToDict(&valuePtr.st_ino, kCFNumberSInt32Type, CFSTR("FileSystemFileNumber"), Mutable, v18, v19, v20, v21, v78);
        _DLAddNumberToDict(&valuePtr.st_mode, kCFNumberSInt16Type, CFSTR("FileMode"), Mutable, v22, v23, v24, v25, v79);
        _DLAddNumberToDict(&valuePtr.st_nlink, kCFNumberSInt16Type, CFSTR("LinkCount"), Mutable, v26, v27, v28, v29, v80);
        _DLAddNumberToDict(&valuePtr.st_uid, kCFNumberSInt32Type, CFSTR("OwnerAccountID"), Mutable, v30, v31, v32, v33, v81);
        _DLAddNumberToDict(&valuePtr.st_gid, kCFNumberSInt32Type, CFSTR("GroupOwnerAccountID"), Mutable, v34, v35, v36, v37, v82);
        _DLAddNumberToDict(&valuePtr.st_rdev, kCFNumberSInt32Type, CFSTR("DeviceType"), Mutable, v38, v39, v40, v41, v83);
        _DLAddDateToDict(&valuePtr.st_atimespec.tv_sec, CFSTR("AccessTime"), Mutable, v42, v43, v44, v45, v46, v84);
        _DLAddDateToDict(&valuePtr.st_mtimespec.tv_sec, CFSTR("ModificationTime"), Mutable, v47, v48, v49, v50, v51, v85);
        _DLAddDateToDict(&valuePtr.st_ctimespec.tv_sec, CFSTR("ChangeTime"), Mutable, v52, v53, v54, v55, v56, v86);
        _DLAddNumberToDict(&valuePtr.st_size, kCFNumberSInt64Type, CFSTR("FileSize"), Mutable, v57, v58, v59, v60, v87);
        _DLAddNumberToDict(&valuePtr.st_blocks, kCFNumberSInt64Type, CFSTR("BlockCount"), Mutable, v61, v62, v63, v64, v88);
        _DLAddNumberToDict(&valuePtr.st_blksize, kCFNumberSInt32Type, CFSTR("BlockSize"), Mutable, v65, v66, v67, v68, v89);
        _DLAddNumberToDict(&valuePtr.st_flags, kCFNumberSInt32Type, CFSTR("FileFlags"), Mutable, v69, v70, v71, v72, v90);
        _DLAddNumberToDict(&valuePtr.st_gen, kCFNumberSInt32Type, CFSTR("GenerationNumber"), Mutable, v73, v74, v75, v76, v91);
        return Mutable;
      }
      if (DLLoggingEnabled(3) || DLOutputEnabled(3))
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLCopyFileAttributes", 3, CFSTR("Could not stat the file at \"%s\""), v4, v5, v6, v7, (char)v3);
    }
    else if (DLLoggingEnabled(3) || DLOutputEnabled(3))
    {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLCopyFileAttributes", 3, CFSTR("Could not create a C string from the CFString \"%@\""), v8, v9, v10, v11, (char)a1);
    }
  }
  return 0;
}

const __CFDictionary *DLIsChar(const __CFDictionary *a1)
{
  return _DLIsType(a1, 0x2000);
}

const __CFDictionary *_DLIsType(const __CFDictionary *result, int a2)
{
  const __CFDictionary *v3;
  const __CFNumber *Value;
  unsigned __int16 valuePtr;

  valuePtr = 0;
  if (result)
  {
    v3 = result;
    result = (const __CFDictionary *)CFDictionaryGetCount(result);
    if (result)
    {
      Value = (const __CFNumber *)CFDictionaryGetValue(v3, CFSTR("FileMode"));
      CFNumberGetValue(Value, kCFNumberSInt16Type, &valuePtr);
      return (const __CFDictionary *)(((unsigned __int16)a2 & valuePtr & 0xF000) == a2);
    }
  }
  return result;
}

const __CFDictionary *DLIsDir(const __CFDictionary *a1)
{
  return _DLIsType(a1, 0x4000);
}

const __CFDictionary *DLIsRegular(const __CFDictionary *a1)
{
  return _DLIsType(a1, 0x8000);
}

const __CFDictionary *DLIsFIFO(const __CFDictionary *a1)
{
  return _DLIsType(a1, 4096);
}

const __CFDictionary *DLIsBlock(const __CFDictionary *a1)
{
  return _DLIsType(a1, 24576);
}

const __CFDictionary *DLIsSymlink(const __CFDictionary *a1)
{
  return _DLIsType(a1, 40960);
}

const __CFDictionary *DLIsSocket(const __CFDictionary *a1)
{
  return _DLIsType(a1, 49152);
}

CFMutableArrayRef DLMemoryPoolCreate()
{
  return CFArrayCreateMutable(0, 0, &_MemoryPoolArrayCallbacks);
}

void *DLMemoryPoolAddObject(__CFArray *a1, void *value)
{
  if (a1 && value)
    CFArrayAppendValue(a1, value);
  return value;
}

uint64_t DLStatusFromOSStatus(int a1, CFStringRef *a2)
{
  int *v4;
  char *v5;
  int *v6;
  int v7;

  if (a1 != -1)
    return 0;
  if (a2)
  {
    v4 = __error();
    v5 = strerror(*v4);
    v6 = __error();
    *a2 = CFStringCreateWithFormat(0, 0, CFSTR("%s (%d)"), v5, *v6);
  }
  v7 = *__error();
  if (v7 > 19)
  {
    if (v7 > 27)
    {
      if (v7 == 28)
        return 4294967281;
      if (v7 == 62)
        return 4294967286;
    }
    else
    {
      if (v7 == 20)
        return 4294967288;
      if (v7 == 21)
        return 4294967287;
    }
    return 0xFFFFFFFFLL;
  }
  if (v7 == 2)
    return 4294967290;
  if (v7 != 5)
  {
    if (v7 == 17)
      return 4294967289;
    return 0xFFFFFFFFLL;
  }
  return 4294967285;
}

uint64_t DLGetProcessName()
{
  uint64_t result;
  const char *v1;
  const __CFString *v2;

  result = _DLProcessName;
  if (!_DLProcessName)
  {
    v1 = *(const char **)_CFGetProgname();
    if (!v1)
      v1 = "Unknown";
    v2 = CFStringCreateWithFormat(0, 0, CFSTR("%s"), v1);
    DLSetProcessName(v2);
    CFRelease(v2);
    return _DLProcessName;
  }
  return result;
}

void DLSetProcessName(CFStringRef theString)
{
  if (theString)
  {
    if (_DLProcessName)
    {
      CFRelease((CFTypeRef)_DLProcessName);
      _DLProcessName = 0;
    }
    _DLProcessName = (uint64_t)CFStringCreateCopy(0, theString);
    DLRegenerateUniqueProcessName();
  }
}

uint64_t DLGetUniqueProcessName()
{
  uint64_t result;

  result = _DLUniqueProcessName;
  if (!_DLUniqueProcessName)
  {
    DLGetProcessName();
    return _DLUniqueProcessName;
  }
  return result;
}

void DLRegenerateUniqueProcessName()
{
  CFStringRef v0;
  const void *ValueAtIndex;
  const __CFArray *ArrayBySeparatingStrings;
  const __CFArray *v3;
  int Count;

  if (!_DLProcessName)
    DLGetProcessName();
  v0 = DLCreateUUID();
  if (_DLUniqueProcessName)
  {
    CFRelease((CFTypeRef)_DLUniqueProcessName);
    _DLUniqueProcessName = 0;
  }
  ValueAtIndex = (const void *)_DLProcessName;
  ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, (CFStringRef)_DLProcessName, CFSTR("/"));
  if (ArrayBySeparatingStrings)
  {
    v3 = ArrayBySeparatingStrings;
    Count = CFArrayGetCount(ArrayBySeparatingStrings);
    if (Count >= 2)
      ValueAtIndex = CFArrayGetValueAtIndex(v3, (Count - 1));
    _DLUniqueProcessName = (uint64_t)CFStringCreateWithFormat(0, 0, CFSTR("%@.%@"), ValueAtIndex, v0);
    CFRelease(v3);
  }
  else
  {
    _DLUniqueProcessName = (uint64_t)CFStringCreateWithFormat(0, 0, CFSTR("%@.%@"), ValueAtIndex, v0);
  }
  CFRelease(v0);
}

CFStringRef DLCreateUUID()
{
  const __CFAllocator *v0;
  const __CFUUID *v1;
  CFStringRef v2;

  v0 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v1 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x24BDBD240]);
  v2 = CFUUIDCreateString(v0, v1);
  CFRelease(v1);
  return v2;
}

void CFPrintf(CFStringRef format, ...)
{
  const __CFString *v1;
  const char *v2;
  char *v3;
  va_list va;

  va_start(va, format);
  v1 = CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, format, va);
  v2 = (const char *)DLCreateCStringFromCFString(v1);
  if (v2)
  {
    v3 = (char *)v2;
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s\n", v2);
    free(v3);
  }
  else
  {
    fwrite("Error: Could not get C string. CFShow output follows:\n", 0x36uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    CFShow(v1);
  }
  CFRelease(v1);
}

BOOL DLLoggingEnabled(int a1)
{
  int AppIntegerValue;
  Boolean keyExistsAndHasValidFormat;

  if ((loggingInitalized & 1) == 0)
    initializeLogging();
  if ((loggingDefaultRead & 1) == 0)
  {
    loggingDefaultRead = 1;
    keyExistsAndHasValidFormat = 0;
    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("LogLevel"), CFSTR("com.apple.DeviceLink"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat == 1)
      curLogLevel = AppIntegerValue;
  }
  return curLogLevel >= a1;
}

BOOL DLOutputEnabled(int a1)
{
  int AppIntegerValue;
  Boolean keyExistsAndHasValidFormat;

  if ((loggingInitalized & 1) == 0)
    initializeLogging();
  if ((outputDefaultRead & 1) == 0)
  {
    outputDefaultRead = 1;
    keyExistsAndHasValidFormat = 0;
    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("OutputLevel"), CFSTR("com.apple.DeviceLink"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat == 1)
      curOutputLevel = AppIntegerValue;
  }
  return curOutputLevel >= a1;
}

const char *DLSetLogDirectoryName(const char *cStr)
{
  const char *v1;

  if (cStr)
  {
    v1 = cStr;
    if (sLogDirectoryName)
    {
      CFRelease((CFTypeRef)sLogDirectoryName);
      sLogDirectoryName = 0;
    }
    sLogDirectoryName = (uint64_t)CFStringCreateWithCString(0, v1, 0x8000100u);
    return (const char *)DLGetProcessName();
  }
  return cStr;
}

__CFData *createDecryptedData(const __CFData *a1, CFDataRef theData, const __CFData *a3)
{
  const UInt8 *BytePtr;
  const UInt8 *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const UInt8 *v12;
  size_t Length;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFData *Mutable;
  const UInt8 *v19;
  const UInt8 *v20;
  size_t v21;
  UInt8 *MutableBytePtr;
  CCCryptorStatus v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char dataOut;
  char dataOuta;
  size_t dataOutMoved;

  if (!a1 || !theData)
  {
    if (DLLoggingEnabled(3) || DLOutputEnabled(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "createDecryptedData", 3, CFSTR("Cannot decrypt without a key or data!"), v8, v9, v10, v11, dataOut);
    return 0;
  }
  dataOutMoved = 0;
  BytePtr = CFDataGetBytePtr(theData);
  if (a3)
    v7 = CFDataGetBytePtr(a3);
  else
    v7 = 0;
  v12 = CFDataGetBytePtr(a1);
  Length = CFDataGetLength(a1);
  if (CCCrypt(1u, 0, 1u, BytePtr, 0x20uLL, v7, v12, Length, 0, 0, &dataOutMoved) != -4301
    && CFDataGetLength(a1)
    && (DLLoggingEnabled(3) || DLOutputEnabled(3)))
  {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "createDecryptedData", 3, CFSTR("Woah- CCCrypt was ok with a 0 length buffer for the decrypted data. Something is going wrong."), v14, v15, v16, v17, dataOuta);
  }
  Mutable = CFDataCreateMutable(0, dataOutMoved);
  CFDataSetLength(Mutable, dataOutMoved);
  v19 = CFDataGetBytePtr(theData);
  if (a3)
    a3 = (const __CFData *)CFDataGetBytePtr(a3);
  v20 = CFDataGetBytePtr(a1);
  v21 = CFDataGetLength(a1);
  MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
  v23 = CCCrypt(1u, 0, 1u, v19, 0x20uLL, a3, v20, v21, MutableBytePtr, dataOutMoved, &dataOutMoved);
  CFDataSetLength(Mutable, dataOutMoved);
  if (v23)
  {
    if (DLLoggingEnabled(4) || DLOutputEnabled(4))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "createDecryptedData", 4, CFSTR("Could not decrypt data: %d"), v24, v25, v26, v27, v23);
    if (Mutable)
    {
      CFRelease(Mutable);
      return 0;
    }
  }
  return Mutable;
}

__CFData *createEncryptedData(const __CFData *a1, CFDataRef theData, const __CFData *a3)
{
  const UInt8 *BytePtr;
  const UInt8 *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const UInt8 *v12;
  size_t Length;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFData *Mutable;
  const UInt8 *v19;
  const UInt8 *v20;
  size_t v21;
  UInt8 *MutableBytePtr;
  CCCryptorStatus v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char dataOut;
  char dataOuta;
  size_t dataOutMoved;

  if (!a1 || !theData)
  {
    if (DLLoggingEnabled(3) || DLOutputEnabled(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "createEncryptedData", 3, CFSTR("Cannot encrypt without a key or data!"), v8, v9, v10, v11, dataOut);
    return 0;
  }
  dataOutMoved = 0;
  BytePtr = CFDataGetBytePtr(theData);
  if (a3)
    v7 = CFDataGetBytePtr(a3);
  else
    v7 = 0;
  v12 = CFDataGetBytePtr(a1);
  Length = CFDataGetLength(a1);
  if (CCCrypt(0, 0, 1u, BytePtr, 0x20uLL, v7, v12, Length, 0, 0, &dataOutMoved) != -4301
    && CFDataGetLength(a1)
    && (DLLoggingEnabled(3) || DLOutputEnabled(3)))
  {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "createEncryptedData", 3, CFSTR("Woah- CCCrypt was ok with a 0 length buffer for the encrypted data. Something is going wrong."), v14, v15, v16, v17, dataOuta);
  }
  Mutable = CFDataCreateMutable(0, dataOutMoved);
  CFDataSetLength(Mutable, dataOutMoved);
  v19 = CFDataGetBytePtr(theData);
  if (a3)
    a3 = (const __CFData *)CFDataGetBytePtr(a3);
  v20 = CFDataGetBytePtr(a1);
  v21 = CFDataGetLength(a1);
  MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
  v23 = CCCrypt(0, 0, 1u, v19, 0x20uLL, a3, v20, v21, MutableBytePtr, dataOutMoved, &dataOutMoved);
  CFDataSetLength(Mutable, dataOutMoved);
  if (v23)
  {
    if (DLLoggingEnabled(3) || DLOutputEnabled(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "createEncryptedData", 3, CFSTR("Could not encrypt data: %d"), v24, v25, v26, v27, v23);
    if (Mutable)
    {
      CFRelease(Mutable);
      return 0;
    }
  }
  return Mutable;
}

CFDataRef createRandomBytes(int a1)
{
  uint64_t v2;
  char *v3;
  int v4;
  int v5;
  ssize_t v6;
  char v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)v14 - ((v2 + 15) & 0x1FFFFFFF0);
  v4 = open("/dev/random", 0);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = read(v4, v3, a1);
  if (v6 < a1)
  {
    v7 = v6;
    if (DLLoggingEnabled(3) || DLOutputEnabled(3))
    {
      v8 = __error();
      strerror(*v8);
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "createRandomBytes", 3, CFSTR("Could not read bytes in from /dev/random. %ld bytes read, %d bytes desired: %s"), v9, v10, v11, v12, v7);
    }
    close(v5);
    return 0;
  }
  close(v5);
  return CFDataCreate(0, (const UInt8 *)v3, a1);
}

__CFData *createFileAuthBlob(const __CFData *a1, const __CFData **a2, const __CFData **a3)
{
  const __CFData *RandomBytes;
  const __CFData *v7;
  __CFData *EncryptedData;
  const __CFData *v9;
  int Length;
  int v11;
  unsigned int v12;
  __CFData *Mutable;
  const UInt8 *BytePtr;
  CFIndex v15;
  const UInt8 *v16;
  CFIndex v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v23;
  UInt8 v24;
  UInt8 v25;
  UInt8 bytes[2];

  RandomBytes = createRandomBytes(16);
  v7 = createRandomBytes(32);
  EncryptedData = createEncryptedData(v7, a1, RandomBytes);
  if (EncryptedData)
  {
    v9 = EncryptedData;
    Length = CFDataGetLength(RandomBytes);
    v11 = CFDataGetLength(v9);
    v12 = Length + v11 + 2;
    Mutable = CFDataCreateMutable(0, (unsigned __int16)(Length + v11 + 2) + 2);
    *(_WORD *)bytes = bswap32(v12) >> 16;
    v25 = 1;
    v24 = 0;
    CFDataAppendBytes(Mutable, bytes, 2);
    CFDataAppendBytes(Mutable, &v25, 1);
    CFDataAppendBytes(Mutable, &v24, 1);
    BytePtr = CFDataGetBytePtr(RandomBytes);
    v15 = CFDataGetLength(RandomBytes);
    CFDataAppendBytes(Mutable, BytePtr, v15);
    v16 = CFDataGetBytePtr(v9);
    v17 = CFDataGetLength(v9);
    CFDataAppendBytes(Mutable, v16, v17);
    CFRelease(v9);
    if (!a2)
    {
      if (v7)
        CFRelease(v7);
      if (!a3)
        goto LABEL_18;
LABEL_17:
      *a3 = RandomBytes;
      return Mutable;
    }
  }
  else
  {
    if (DLLoggingEnabled(3) || DLOutputEnabled(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "createFileAuthBlob", 3, CFSTR("Could not create encrypted auth data"), v18, v19, v20, v21, v23);
    if (RandomBytes)
      CFRelease(RandomBytes);
    if (v7)
      CFRelease(v7);
    if (!a2)
    {
      Mutable = 0;
      RandomBytes = 0;
      if (!a3)
        return Mutable;
      goto LABEL_17;
    }
    RandomBytes = 0;
    v7 = 0;
    Mutable = 0;
  }
  *a2 = v7;
  if (a3)
    goto LABEL_17;
LABEL_18:
  if (RandomBytes)
    CFRelease(RandomBytes);
  return Mutable;
}

__CFData *createFileKeyFromAuthBlob(const __CFData *a1, const __CFData *a2, const __CFData **a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const UInt8 *BytePtr;
  const __CFData *v19;
  const UInt8 *v20;
  const __CFData *v21;
  const __CFData *v22;
  __CFData *DecryptedData;
  __CFData *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v34;

  if (!a1)
    return 0;
  v8 = bswap32(*(unsigned __int16 *)CFDataGetBytePtr(a1)) >> 16;
  if (DLLoggingEnabled(6) || DLOutputEnabled(6))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "createFileKeyFromAuthBlob", 6, CFSTR("Unpacking %d bytes of auth data"), v9, v10, v11, v12, v8);
  v13 = CFDataGetBytePtr(a1)[2];
  CFDataGetBytePtr(a1);
  if (DLLoggingEnabled(6) || DLOutputEnabled(6))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "createFileKeyFromAuthBlob", 6, CFSTR("Unpacking auth data v%d.%d"), v14, v15, v16, v17, v13);
  BytePtr = CFDataGetBytePtr(a1);
  v19 = CFDataCreate(0, BytePtr + 4, 16);
  v20 = CFDataGetBytePtr(a1);
  v21 = CFDataCreate(0, v20 + 20, v8 - 18);
  v22 = v21;
  if (v19 && v21)
  {
    DecryptedData = createDecryptedData(v21, a2, v19);
    if (!DecryptedData)
    {
      if (DLLoggingEnabled(4) || DLOutputEnabled(4))
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "createFileKeyFromAuthBlob", 4, CFSTR("Could not decrypt the encryption key"), v29, v30, v31, v32, v34);
      v24 = 0;
      goto LABEL_28;
    }
    v24 = DecryptedData;
    if (a3)
    {
      *a3 = v19;
      if (!a4)
        goto LABEL_28;
    }
    else
    {
      CFRelease(v19);
      if (!a4)
      {
LABEL_28:
        CFRelease(v22);
        return v24;
      }
    }
    *a4 = v8 + 2;
    goto LABEL_28;
  }
  if (DLLoggingEnabled(3) || DLOutputEnabled(3))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "createFileKeyFromAuthBlob", 3, CFSTR("Could not extract an iv and/or encryption key from the auth data"), v25, v26, v27, v28, v34);
  if (v19)
    CFRelease(v19);
  v24 = 0;
  if (v22)
    goto LABEL_28;
  return v24;
}

uint64_t DLReleaseArgsAndReturn(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v10;
  CFTypeRef *v11;
  CFTypeRef *v13;

  v13 = (CFTypeRef *)&a9;
  if (a2 >= 1)
  {
    v10 = a2;
    do
    {
      v11 = v13++;
      if (*v11)
        CFRelease(*v11);
      --v10;
    }
    while (v10);
  }
  return a1;
}

__CFString *DLCreateDataFromString(__CFString *result)
{
  const __CFString *v1;
  CFIndex v2;
  CFIndex MaximumSizeForEncoding;
  UInt8 *v4;
  CFIndex length;
  CFRange v6;

  if (result)
  {
    v1 = result;
    v2 = CFStringGetLength(result);
    MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(v2, 0x8000100u);
    result = (__CFString *)malloc_type_malloc(MaximumSizeForEncoding, 0xBFDF19F1uLL);
    if (result)
    {
      v4 = (UInt8 *)result;
      length = 0;
      v6.location = 0;
      v6.length = v2;
      if (CFStringGetBytes(v1, v6, 0x8000100u, 0, 1u, (UInt8 *)result, MaximumSizeForEncoding, &length) == v2)
      {
        return (__CFString *)CFDataCreateWithBytesNoCopy(0, v4, length, (CFAllocatorRef)*MEMORY[0x24BDBD248]);
      }
      else
      {
        free(v4);
        return 0;
      }
    }
  }
  return result;
}

CFDataRef DLDataCreateWithMallocedBytesNoCopy(UInt8 *bytes, CFIndex length)
{
  return CFDataCreateWithBytesNoCopy(0, bytes, length, (CFAllocatorRef)*MEMORY[0x24BDBD248]);
}

CFStringRef DLCreateStringFromData(const __CFData *a1)
{
  const UInt8 *BytePtr;
  CFIndex Length;

  BytePtr = CFDataGetBytePtr(a1);
  Length = CFDataGetLength(a1);
  return CFStringCreateWithBytes(0, BytePtr, Length, 0x8000100u, 1u);
}

uint64_t DLGetFileSystemRepresentation(const __CFString *a1, void **a2, _QWORD *a3)
{
  CFIndex MaximumSizeOfFileSystemRepresentation;
  char *v7;

  if (a2)
  {
    MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(a1);
    v7 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0x4ABC7A4uLL);
    *a2 = v7;
    if (CFStringGetFileSystemRepresentation(a1, v7, MaximumSizeOfFileSystemRepresentation))
      return 0;
    if (a3)
      *a3 = CFSTR("Error getting file system representation of path");
    free(*a2);
  }
  else if (a3)
  {
    *a3 = CFSTR("Path is null");
  }
  return 0xFFFFFFFFLL;
}

CFPropertyListRef DLCreatePropertyListFromFile(CFURLRef fileURL, CFStringRef *a2)
{
  __CFReadStream *v4;
  __CFReadStream *v5;
  CFPropertyListRef v6;
  CFStringRef v7;
  CFStreamError Error;
  CFStringRef v9;
  uint64_t v11;
  char *v12;
  CFPropertyListFormat format;

  v4 = CFReadStreamCreateWithFile(0, fileURL);
  if (v4)
  {
    v5 = v4;
    format = 0;
    if (CFReadStreamOpen(v4) == 1)
    {
      v6 = CFPropertyListCreateFromStream(0, v5, 0, 2uLL, &format, a2);
      CFReadStreamClose(v5);
LABEL_17:
      CFRelease(v5);
      return v6;
    }
    Error = CFReadStreamGetError(v5);
    if (Error.domain == 2)
    {
      if (a2)
      {
        v9 = CFStringCreateWithFormat(0, 0, CFSTR("MacOStatus error number %d while reading from the file at '%@'"), *(_QWORD *)&Error.error, fileURL, v11, format);
        goto LABEL_15;
      }
    }
    else if (Error.domain == 1)
    {
      if (a2)
      {
        v12 = strerror(Error.error);
        v9 = CFStringCreateWithFormat(0, 0, CFSTR("Error number %d while reading from the file at '%@': %s"), *(_QWORD *)&Error.error, fileURL, v12, format);
LABEL_15:
        v6 = 0;
        *a2 = v9;
        goto LABEL_17;
      }
    }
    else if (a2)
    {
      v9 = CFStringCreateWithFormat(0, 0, CFSTR("Unknown error number %d while reading from the file at '%@'"), *(_QWORD *)&Error.error, fileURL, v11, format);
      goto LABEL_15;
    }
    v6 = 0;
    goto LABEL_17;
  }
  if (!a2)
    return 0;
  v7 = CFStringCreateWithFormat(0, 0, CFSTR("Could not create a read stream for the file at '%@'"), fileURL);
  v6 = 0;
  *a2 = v7;
  return v6;
}

uint64_t DLWritePropertyListToFileWithFormat(const void *a1, const __CFURL *a2, CFPropertyListFormat a3, CFStringRef *a4)
{
  __CFWriteStream *v8;
  __CFWriteStream *v9;
  uint64_t v10;
  CFStreamError Error;
  CFStringRef v12;
  char *v14;

  v8 = CFWriteStreamCreateWithFile(0, a2);
  if (v8)
  {
    v9 = v8;
    v10 = CFWriteStreamOpen(v8);
    if ((_DWORD)v10 == 1)
    {
      CFPropertyListWriteToStream(a1, v9, a3, a4);
      CFWriteStreamClose(v9);
    }
    else
    {
      Error = CFWriteStreamGetError(v9);
      if (Error.domain == 2)
      {
        v12 = CFStringCreateWithFormat(0, 0, CFSTR("MacOStatus error number %d while writing to the file at '%@'"), *(_QWORD *)&Error.error, a2);
      }
      else if (Error.domain == 1)
      {
        v14 = strerror(Error.error);
        v12 = CFStringCreateWithFormat(0, 0, CFSTR("Error number %d while writing to the file at '%@': %s"), *(_QWORD *)&Error.error, a2, v14);
      }
      else
      {
        v12 = CFStringCreateWithFormat(0, 0, CFSTR("Unknown error number %d while writing to the file at '%@'"), *(_QWORD *)&Error.error, a2);
      }
      *a4 = v12;
    }
    CFRelease(v9);
  }
  else
  {
    v10 = 0;
    *a4 = CFStringCreateWithFormat(0, 0, CFSTR("Could not create a write stream for the file at '%@'"), a2);
  }
  return v10;
}

uint64_t DLWritePropertyListToFile(const void *a1, const __CFURL *a2, CFStringRef *a3)
{
  return DLWritePropertyListToFileWithFormat(a1, a2, kCFPropertyListBinaryFormat_v1_0, a3);
}

CFMutableArrayRef copyKeysFromDictionary(const __CFDictionary *a1)
{
  CFIndex Count;
  CFMutableArrayRef Mutable;

  if (!a1)
    return 0;
  Count = CFDictionaryGetCount(a1);
  Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x24BDBD690]);
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)_gatherDictionaryKeys, Mutable);
  return Mutable;
}

void _gatherDictionaryKeys(void *value, int a2, CFMutableArrayRef theArray)
{
  CFArrayAppendValue(theArray, value);
}

CFMutableArrayRef copyKeysFromDictionaryNoRetain(const __CFDictionary *a1)
{
  CFIndex Count;
  CFMutableArrayRef Mutable;

  if (!a1)
    return 0;
  Count = CFDictionaryGetCount(a1);
  Mutable = CFArrayCreateMutable(0, Count, 0);
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)_gatherDictionaryKeys, Mutable);
  return Mutable;
}

CFMutableArrayRef copyValuesFromDictionary(const __CFDictionary *a1)
{
  CFIndex Count;
  CFMutableArrayRef Mutable;

  if (!a1)
    return 0;
  Count = CFDictionaryGetCount(a1);
  Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x24BDBD690]);
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)_gatherDictionaryValues, Mutable);
  return Mutable;
}

void _gatherDictionaryValues(int a1, const void *a2, CFMutableArrayRef theArray)
{
  CFArrayAppendValue(theArray, a2);
}

CFMutableArrayRef copyValuesFromDictionaryNoRetain(const __CFDictionary *a1)
{
  CFIndex Count;
  CFMutableArrayRef Mutable;

  if (!a1)
    return 0;
  Count = CFDictionaryGetCount(a1);
  Mutable = CFArrayCreateMutable(0, Count, 0);
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)_gatherDictionaryValues, Mutable);
  return Mutable;
}

__CFArray *copyKeysAndValuesFromDictionaryNoRetain(__CFArray *result)
{
  const __CFDictionary *v1;
  CFIndex Count;
  CFMutableArrayRef Mutable;
  CFIndex v4;
  CFMutableArrayRef v5;

  if (result)
  {
    v1 = result;
    Count = CFDictionaryGetCount(result);
    Mutable = CFArrayCreateMutable(0, Count, 0);
    v4 = CFDictionaryGetCount(v1);
    v5 = CFArrayCreateMutable(0, v4, 0);
    return _copyKeysAndValuesFromDictionary(v1, Mutable, v5);
  }
  return result;
}

__CFArray *_copyKeysAndValuesFromDictionary(const __CFDictionary *a1, const void *a2, void *a3)
{
  __CFArray *Mutable;

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  CFArrayAppendValue(Mutable, a2);
  CFArrayAppendValue(Mutable, a3);
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)_gatherDictionaryKeysAndValues, a3);
  return Mutable;
}

__CFArray *copyKeysAndValuesFromDictionary(__CFArray *result)
{
  const __CFDictionary *v1;
  CFIndex Count;
  const CFArrayCallBacks *v3;
  CFMutableArrayRef Mutable;
  CFIndex v5;
  CFMutableArrayRef v6;

  if (result)
  {
    v1 = result;
    Count = CFDictionaryGetCount(result);
    v3 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
    Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x24BDBD690]);
    v5 = CFDictionaryGetCount(v1);
    v6 = CFArrayCreateMutable(0, v5, v3);
    return _copyKeysAndValuesFromDictionary(v1, Mutable, v6);
  }
  return result;
}

BOOL DLGetFlockForFileWithCancel(const __CFString *a1, unsigned int (*a2)(uint64_t), uint64_t a3, float a4)
{
  const char *v8;
  char *v9;
  int v10;
  int v11;
  CFAbsoluteTime Current;
  __CFRunLoopTimer *v13;
  __CFRunLoop *v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CFNumberRef v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v45;
  char v46;
  __CFRunLoopTimer *timer;
  int valuePtr;

  if (!_lockFds)
    _lockFds = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v8 = (const char *)DLCreateCStringFromCFString(a1);
  if (!v8)
  {
    if (DLLoggingEnabled(3) || DLOutputEnabled(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLGetFlockForFileWithCancel", 3, CFSTR("Could not get a valid C string for the lock filename"), v22, v23, v24, v25, v45);
    return 0;
  }
  v9 = (char *)v8;
  v46 = -74;
  v10 = open(v8, 512);
  valuePtr = v10;
  if (v10 == -1)
  {
    if (DLLoggingEnabled(5) || DLOutputEnabled(5))
    {
      __error();
      v26 = __error();
      strerror(*v26);
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLGetFlockForFileWithCancel", 5, CFSTR("Error: Can't get file descriptor for %s: (%d) %s"), v27, v28, v29, v30, (char)v9);
    }
    free(v9);
    return 0;
  }
  v11 = v10;
  Current = CFAbsoluteTimeGetCurrent();
  v13 = CFRunLoopTimerCreate(0, Current + (float)(a4 + a4), 0.0, 0, 0, (CFRunLoopTimerCallBack)_DLGetFlockTimeoutCallback, 0);
  v14 = CFRunLoopGetCurrent();
  v15 = (const __CFString *)*MEMORY[0x24BDBD5A0];
  timer = v13;
  CFRunLoopAddTimer(v14, v13, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
  while (1)
  {
    if (DLLoggingEnabled(5) || DLOutputEnabled(5))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLGetFlockForFileWithCancel", 5, CFSTR("Attempting to lock descriptor for %s"), v16, v17, v18, v19, (char)v9);
    *__error() = 0;
    v20 = flock(v11, 6);
    v21 = v20 == 0;
    if (!v20)
      break;
    CFRunLoopRunInMode(v15, 1.0, 0);
    if (a2 && a2(a3))
    {
      if (DLLoggingEnabled(5) || DLOutputEnabled(5))
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLGetFlockForFileWithCancel", 5, CFSTR("flock wait canceled by cancel function"), v36, v37, v38, v39, v46);
LABEL_31:
      if (DLLoggingEnabled(4) || DLOutputEnabled(4))
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLGetFlockForFileWithCancel", 4, CFSTR("Could not lock %s"), v40, v41, v42, v43, (char)v9);
      close(valuePtr);
      goto LABEL_35;
    }
    a4 = a4 + -1.0;
    if (a4 < 0.0)
      goto LABEL_31;
  }
  v31 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue((CFMutableDictionaryRef)_lockFds, a1, v31);
  if (v31)
    CFRelease(v31);
  if (a4 < 0.0)
    goto LABEL_31;
  if (DLLoggingEnabled(5) || DLOutputEnabled(5))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLGetFlockForFileWithCancel", 5, CFSTR("Lock obtained for %s"), v32, v33, v34, v35, (char)v9);
LABEL_35:
  CFRunLoopTimerInvalidate(timer);
  CFRelease(timer);
  free(v9);
  return v21;
}

BOOL DLGetFlockForFile(const __CFString *a1, float a2)
{
  return DLGetFlockForFileWithCancel(a1, 0, 0, a2);
}

void DLReleaseFlockForFile(void *key, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  const __CFNumber *Value;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int valuePtr;

  if (key && _lockFds)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)_lockFds, key);
    if (Value)
    {
      valuePtr = -1;
      CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      if (flock(valuePtr, 8) == -1 && (DLLoggingEnabled(4) || DLOutputEnabled(4)))
      {
        __error();
        v11 = __error();
        strerror(*v11);
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLReleaseFlockForFile", 4, CFSTR("Error: Can't unlock fd for filename %@: (%d) %s"), v12, v13, v14, v15, (char)key);
      }
      close(valuePtr);
      CFDictionaryRemoveValue((CFMutableDictionaryRef)_lockFds, key);
    }
    else if (DLLoggingEnabled(4) || DLOutputEnabled(4))
    {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLReleaseFlockForFile", 4, CFSTR("Attempting to unlock a lock that doesn't exist"), v16, v17, v18, v19, a9);
    }
  }
}

uint64_t DLSetLogLevel(int a1)
{
  loggingDefaultRead = 1;
  curLogLevel = a1;
  return 1;
}

uint64_t DLSetOutputLevel(int a1)
{
  outputDefaultRead = 1;
  curOutputLevel = a1;
  return 1;
}

void initializeLogging()
{
  __CFDateFormatter *v0;

  if ((loggingInitalized & 1) == 0)
  {
    loggingInitalized = 1;
    v0 = CFDateFormatterCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
    dateFormat = (uint64_t)v0;
    if (v0)
      CFDateFormatterSetFormat(v0, CFSTR("yyyy-MM-dd HH:mm:ss.SSS"));
  }
}

uint64_t DLGetListenerSocketFromLaunchd(int a1)
{
  int v2;
  int v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  const timespec *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  char v28;
  _QWORD v29[2];
  kevent changelist;
  size_t cnt;
  int *fds;

  fds = 0;
  cnt = 0;
  v2 = launch_activate_socket("Listeners", &fds, &cnt);
  if (!v2)
  {
    if (fds)
    {
      if (cnt >= 2 && (DLLoggingEnabled(5) || DLOutputEnabled(5)))
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLGetListenerSocketFromLaunchd", 5, CFSTR("More than one set of sockets for listening, ignoring all but \"Listeners\""), v9, v10, v11, v12, v28);
      memset(&changelist, 0, sizeof(changelist));
      v13 = kqueue();
      if (v13 == -1)
      {
        if (!DLLoggingEnabled(5) && !DLOutputEnabled(5))
          goto LABEL_36;
        v27 = CFSTR("Can't set up kqueue");
LABEL_35:
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLGetListenerSocketFromLaunchd", 5, v27, v23, v24, v25, v26, v28);
LABEL_36:
        free(fds);
        return 0;
      }
      v14 = v13;
      if (cnt)
      {
        v15 = 0;
        while (1)
        {
          changelist.ident = fds[v15];
          *(_DWORD *)&changelist.filter = 0x1FFFF;
          *(_QWORD *)((unint64_t)&changelist | 0xC) = 0;
          *(_QWORD *)(((unint64_t)&changelist | 0xC) + 8) = 0;
          *(_DWORD *)(((unint64_t)&changelist | 0xC) + 0x10) = 0;
          if (kevent(v14, &changelist, 1, 0, 0, 0) == -1)
            break;
          if (++v15 >= cnt)
            goto LABEL_15;
        }
        if (!DLLoggingEnabled(5) && !DLOutputEnabled(5))
          goto LABEL_36;
        v27 = CFSTR("Failure on kevent call for read");
        goto LABEL_35;
      }
LABEL_15:
      free(fds);
      fds = 0;
      v29[0] = a1;
      v29[1] = 0;
      if (a1)
        v16 = (const timespec *)v29;
      else
        v16 = 0;
      v17 = kevent(v14, 0, 0, &changelist, 1, v16);
      if (v17)
      {
        if (v17 != -1)
          return LODWORD(changelist.ident);
        if (!DLLoggingEnabled(5))
        {
          result = DLOutputEnabled(5);
          if (!(_DWORD)result)
            return result;
        }
        v22 = CFSTR("Failure on kevent call for socket");
      }
      else
      {
        if (!DLLoggingEnabled(5))
        {
          result = DLOutputEnabled(5);
          if (!(_DWORD)result)
            return result;
        }
        v22 = CFSTR("Timeout waiting for kevent");
      }
    }
    else
    {
      if (!DLLoggingEnabled(5))
      {
        result = DLOutputEnabled(5);
        if (!(_DWORD)result)
          return result;
      }
      v22 = CFSTR("No listeners found");
    }
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLGetListenerSocketFromLaunchd", 5, v22, v18, v19, v20, v21, v28);
    return 0;
  }
  v3 = v2;
  if (DLLoggingEnabled(3) || (result = DLOutputEnabled(3), (_DWORD)result))
  {
    strerror(v3);
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLGetListenerSocketFromLaunchd", 3, (const __CFString *)"Failed to launch_activate_socket: %d, %s", v5, v6, v7, v8, v3);
    return 0;
  }
  return result;
}

void _DLAddNumberToDict(void *valuePtr, CFNumberType a2, const void *a3, __CFDictionary *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  CFNumberRef v11;
  CFNumberRef v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (valuePtr && a4)
  {
    v11 = CFNumberCreate(0, a2, valuePtr);
    if (v11)
    {
      v12 = v11;
      CFDictionaryAddValue(a4, a3, v11);
      CFRelease(v12);
    }
    else if (DLLoggingEnabled(3) || DLOutputEnabled(3))
    {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "_DLAddNumberToDict", 3, CFSTR("Could not create a CFNumber from the passed in value"), v13, v14, v15, v16, a9);
    }
  }
}

void _DLAddDateToDict(uint64_t *a1, const void *a2, __CFDictionary *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  CFDateRef v11;
  CFDateRef v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (a1 && a3)
  {
    v11 = CFDateCreate(0, (double)*a1);
    if (v11)
    {
      v12 = v11;
      CFDictionaryAddValue(a3, a2, v11);
      CFRelease(v12);
    }
    else if (DLLoggingEnabled(3) || DLOutputEnabled(3))
    {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "_DLAddDateToDict", 3, CFSTR("Could not create a CFDate from the passed in value"), v13, v14, v15, v16, a9);
    }
  }
}

void _MemoryPoolReleaseCallback(int a1, CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

CFStringRef _createStringForLogFile(const __CFURL *a1, uint64_t a2)
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFURL *v5;
  CFStringRef v6;

  v3 = CFStringCreateWithFormat(0, 0, CFSTR("%02d.log"), a2);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = CFURLCreateCopyAppendingPathExtension(0, a1, v3);
  CFRelease(v4);
  if (!v5)
    return 0;
  v6 = CFURLCopyFileSystemPath(v5, kCFURLPOSIXPathStyle);
  CFRelease(v5);
  return v6;
}

uint64_t _closeLogStream()
{
  return close(logStream);
}

void _gatherDictionaryKeysAndValues(const void *a1, const void *a2, CFArrayRef theArray)
{
  __CFArray *ValueAtIndex;
  __CFArray *v7;

  ValueAtIndex = (__CFArray *)CFArrayGetValueAtIndex(theArray, 0);
  v7 = (__CFArray *)CFArrayGetValueAtIndex(theArray, 1);
  CFArrayAppendValue(ValueAtIndex, a1);
  CFArrayAppendValue(v7, a2);
}

void *SetSocketLogCallback(void *result, uint64_t a2)
{
  sSocketLogCallback = result;
  sSocketLogData = a2;
  return result;
}

_DWORD *SocketCreateServerWithSocket(int a1)
{
  _DWORD *v2;
  int v3;
  int v5;

  v5 = 1;
  v2 = malloc_type_calloc(0x30uLL, 1uLL, 0x13B1D44AuLL);
  if (v2)
  {
    if (!sSocketOldSignalHandler)
      sSocketOldSignalHandler = (uint64_t)signal(13, (void (__cdecl *)(int))1);
    v2[2] = 0;
    *v2 = a1;
    if (setsockopt(a1, 0xFFFF, 4, &v5, 4u))
      v3 = 7;
    else
      v3 = 0;
    v2[1] = v3;
  }
  return v2;
}

void *SocketCreateServer(unsigned int a1, int a2)
{
  void *v4;
  int v5;
  int v6;
  int v8;

  v8 = 1;
  v4 = malloc_type_calloc(0x30uLL, 1uLL, 0x9B80D88BuLL);
  if (v4)
  {
    if (!sSocketOldSignalHandler)
      sSocketOldSignalHandler = (uint64_t)signal(13, (void (__cdecl *)(int))1);
    *((_DWORD *)v4 + 2) = 0;
    *((_BYTE *)v4 + 33) = 2;
    *((_WORD *)v4 + 17) = bswap32(a1) >> 16;
    *((_DWORD *)v4 + 9) = 0;
    v5 = socket(2, 1, 0);
    *(_DWORD *)v4 = v5;
    if (v5 < 0)
    {
      *((_DWORD *)v4 + 1) = 1;
    }
    else
    {
      if (setsockopt(v5, 0xFFFF, 4, &v8, 4u))
      {
        v6 = 7;
      }
      else if (bind(*(_DWORD *)v4, (const sockaddr *)v4 + 2, 0x10u) < 0)
      {
        v6 = 2;
      }
      else
      {
        if ((listen(*(_DWORD *)v4, a2) & 0x80000000) == 0)
        {
          *((_DWORD *)v4 + 1) = 0;
          return v4;
        }
        v6 = 3;
      }
      *((_DWORD *)v4 + 1) = v6;
    }
  }
  return v4;
}

unsigned __int8 *SocketCreateLocalServer(const char *a1, int a2)
{
  unsigned __int8 *v4;
  uid_t v5;
  int v6;
  int v7;

  v4 = (unsigned __int8 *)malloc_type_calloc(0x90uLL, 1uLL, 0xF1E0D23DuLL);
  if (v4)
  {
    if (!sSocketOldSignalHandler)
      sSocketOldSignalHandler = (uint64_t)signal(13, (void (__cdecl *)(int))1);
    *((_DWORD *)v4 + 2) = 1;
    v4[33] = 1;
    v5 = getuid();
    __sprintf_chk((char *)v4 + 34, 0, 0x6EuLL, "/tmp/%s_%d", a1, v5);
    v4[32] = strlen((const char *)v4 + 34) + 2;
    v6 = socket(1, 1, 0);
    *(_DWORD *)v4 = v6;
    if (v6 < 0)
    {
      *((_DWORD *)v4 + 1) = 1;
      return v4;
    }
    unlink((const char *)v4 + 34);
    if (bind(*(_DWORD *)v4, (const sockaddr *)v4 + 2, v4[32]) < 0)
    {
      v7 = 2;
    }
    else
    {
      if ((listen(*(_DWORD *)v4, a2) & 0x80000000) == 0)
      {
        *((_DWORD *)v4 + 1) = 0;
        return v4;
      }
      v7 = 3;
    }
    *((_DWORD *)v4 + 1) = v7;
  }
  return v4;
}

sockaddr *SocketAccept(int *a1)
{
  int v2;
  size_t v3;
  malloc_type_id_t v4;
  sockaddr *v5;
  unsigned int v6;
  socklen_t v8;

  if (!a1)
    return 0;
  v2 = a1[2];
  if (v2 != 1)
  {
    if (!v2)
    {
      v8 = 16;
      v3 = 48;
      v4 = 1297448720;
      goto LABEL_7;
    }
    return 0;
  }
  v8 = 106;
  v3 = 144;
  v4 = 2150599149;
LABEL_7:
  v5 = (sockaddr *)malloc_type_calloc(v3, 1uLL, v4);
  if (v5)
  {
    v6 = accept(*a1, v5 + 2, &v8);
    *(_DWORD *)&v5->sa_data[6] = 2;
    *(_DWORD *)&v5->sa_len = v6;
    *(_DWORD *)&v5->sa_data[2] = (v6 >> 29) & 4;
  }
  return v5;
}

void *SocketConnect(const char *a1, unsigned int a2)
{
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  const char *v11;
  int v12;
  uint64_t v13;
  timeval v15;
  fd_set v16;

  v4 = malloc_type_calloc(0x30uLL, 1uLL, 0x3CB5FF4AuLL);
  if (!v4)
    return v4;
  if (!sSocketOldSignalHandler)
    sSocketOldSignalHandler = (uint64_t)signal(13, (void (__cdecl *)(int))1);
  *((_DWORD *)v4 + 1) = 0;
  if (gethostbyname(a1))
  {
    __memcpy_chk();
  }
  else
  {
    v16.fds_bits[0] = 0;
    if (inet_pton(2, a1, &v16) != 1)
    {
      *((_DWORD *)v4 + 1) = 5;
      return v4;
    }
    *((_DWORD *)v4 + 9) = v16.fds_bits[0];
  }
  *((_BYTE *)v4 + 33) = 2;
  *((_WORD *)v4 + 17) = bswap32(a2) >> 16;
  v5 = socket(2, 1, 0);
  *(_DWORD *)v4 = v5;
  if (v5 < 0)
  {
    *((_DWORD *)v4 + 1) = 1;
    return v4;
  }
  v6 = fcntl(v5, 4, 4);
  if ((_DWORD)v6)
    _SocketErrorCheckAndLogIfError("SocketConnect (fcntl to set non blocking for connect)", v6);
  v7 = connect(*(_DWORD *)v4, (const sockaddr *)v4 + 2, 0x10u);
  if ((v7 & 0x80000000) == 0)
    return v4;
  v8 = v7;
  if (*__error() != 36)
  {
    _SocketErrorCheckAndLogIfError("SocketConnect (connect)", v8);
    *(_QWORD *)v4 = 0x6FFFFFFFFLL;
    return v4;
  }
  v15 = (timeval)xmmword_229EC6C10;
  memset(&v16, 0, sizeof(v16));
  v9 = *(_DWORD *)v4;
  if (__darwin_check_fd_set_overflow(*(_DWORD *)v4, &v16, 0))
    *(__int32_t *)((char *)v16.fds_bits + (((unint64_t)v9 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v9;
  v10 = select(*(_DWORD *)v4 + 1, &v16, 0, 0, &v15);
  if (!v10)
  {
    v11 = "SocketConnect timeout on select";
LABEL_28:
    SocketLog(v11);
    goto LABEL_29;
  }
  if (v10 == -1)
  {
    _SocketErrorCheckAndLogIfError("SocketConnect (select)", 0xFFFFFFFFLL);
LABEL_29:
    *((_DWORD *)v4 + 1) = 6;
LABEL_30:
    if (*(int *)v4 >= 1)
    {
      shutdown(*(_DWORD *)v4, 2);
      close(*(_DWORD *)v4);
      *(_DWORD *)v4 = 0;
    }
    return v4;
  }
  v12 = *(_DWORD *)v4;
  if (!__darwin_check_fd_set_overflow(*(_DWORD *)v4, &v16, 0)
    || ((*(unsigned int *)((char *)v16.fds_bits + (((unint64_t)v12 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v12) & 1) == 0)
  {
    v11 = "SocketConnect: error connecting: read_fd not set";
    goto LABEL_28;
  }
  if (*((_DWORD *)v4 + 1) == 6)
    goto LABEL_30;
  v13 = fcntl(*(_DWORD *)v4, 4, 0);
  if ((_DWORD)v13)
    _SocketErrorCheckAndLogIfError("SocketConnect (fcntl to set blocking for reads/writes)", v13);
  return v4;
}

uint64_t _SocketErrorCheckAndLogIfError(const char *a1, uint64_t a2)
{
  int v4;
  int *v5;
  char *v6;
  char v8[1024];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if ((int)a2 <= 0)
  {
    if ((_DWORD)a2)
    {
      v4 = *__error();
      v5 = __error();
      v6 = strerror(*v5);
      __sprintf_chk(v8, 0, 0x400uLL, "%s: error %d: %s", a1, v4, v6);
    }
    else
    {
      __strcpy_chk();
      __strcat_chk();
    }
    SocketLog(v8);
  }
  return a2;
}

uint64_t SocketLog(const char *a1)
{
  if (sSocketLogCallback)
    return sSocketLogCallback(a1, sSocketLogData);
  else
    return fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", a1);
}

unsigned __int8 *SocketConnectLocal(const char *a1)
{
  unsigned __int8 *v2;
  int v3;
  uid_t v4;
  int v5;

  v2 = (unsigned __int8 *)malloc_type_calloc(0x90uLL, 1uLL, 0x579EAB39uLL);
  if (v2)
  {
    if (!sSocketOldSignalHandler)
      sSocketOldSignalHandler = (uint64_t)signal(13, (void (__cdecl *)(int))1);
    *((_DWORD *)v2 + 1) = 0;
    v3 = 1;
    v2[33] = 1;
    v4 = getuid();
    __sprintf_chk((char *)v2 + 34, 0, 0x6EuLL, "/tmp/%s_%d", a1, v4);
    v2[32] = strlen((const char *)v2 + 34) + 2;
    v5 = socket(1, 1, 0);
    *(_DWORD *)v2 = v5;
    if (v5 < 0)
      goto LABEL_7;
    if (connect(v5, (const sockaddr *)v2 + 2, v2[32]) < 0)
    {
      v3 = 6;
LABEL_7:
      *((_DWORD *)v2 + 1) = v3;
    }
  }
  return v2;
}

void SocketDelete(_QWORD *a1)
{
  if (a1)
  {
    if (a1[3])
      lockdown_disconnect();
    free(a1);
  }
}

uint64_t SocketSend(uint64_t a1, const void *a2, size_t a3)
{
  SSLContext *v3;
  unsigned int v4;
  ssize_t v5;
  const char *v6;
  size_t processed[129];

  processed[128] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v6 = "SocketSend called with NULL socketInfo";
LABEL_9:
    SocketLog(v6);
    return 0;
  }
  if (!a3)
  {
    __sprintf_chk((char *)processed, 0, 0x400uLL, "Skipping SocketSend of bytes, length %d <= 0", 0);
    v6 = (const char *)processed;
    goto LABEL_9;
  }
  v3 = *(SSLContext **)(a1 + 16);
  if (v3)
  {
    processed[0] = -1;
    v4 = SSLWrite(v3, a2, a3, processed);
    if (v4)
      v5 = v4;
    else
      v5 = LODWORD(processed[0]);
  }
  else
  {
    v5 = send(*(_DWORD *)a1, a2, (int)a3, 0);
  }
  _SocketErrorCheckAndLogIfError("SocketSend (data)", v5);
  return (int)v5;
}

uint64_t SocketRecv(uint64_t a1, void *a2, size_t a3)
{
  SSLContext *v6;
  unsigned int v7;
  ssize_t v8;
  char *v9;
  size_t processed;
  char v12[1024];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  bzero(v12, 0x400uLL);
  if (!a1)
  {
    v9 = "SocketSend called with NULL socketInfo";
LABEL_9:
    SocketLog(v9);
    return 0;
  }
  if (!a3)
  {
    __sprintf_chk(v12, 0, 0x400uLL, "Skipping SocketRecv of bytes, length %d <= 0", 0);
    v9 = v12;
    goto LABEL_9;
  }
  v6 = *(SSLContext **)(a1 + 16);
  if (v6)
  {
    processed = -1;
    v7 = SSLRead(v6, a2, a3, &processed);
    if (v7)
      v8 = v7;
    else
      v8 = processed;
  }
  else
  {
    v8 = recv(*(_DWORD *)a1, a2, (int)a3, 64);
  }
  _SocketErrorCheckAndLogIfError("SocketRecv (data)", v8);
  return v8 & ~((int)v8 >> 31);
}

uint64_t SocketStreamHandlerRegisterCreator(CFTypeRef *a1)
{
  return StreamHandlerRegisterCreatorForType(CFSTR("DLInfoStreamTypeTCP"), SocketStreamHandlerCreator, a1);
}

uint64_t SocketStreamHandlerCreator(_QWORD *a1, CFTypeRef *a2)
{
  _QWORD *v3;

  if (!a1)
    return DLSetStatus(4294967293, a2, CFSTR("SocketStreamHandlerCreator: No Stream Handler argument specified"));
  v3 = malloc_type_calloc(0x38uLL, 1uLL, 0x448FA0D3uLL);
  *v3 = SocketStreamHandlerAccept;
  v3[1] = SocketStreamHandlerConnect;
  v3[2] = SocketStreamHandlerClose;
  v3[3] = SocketStreamHandlerSend;
  v3[4] = SocketStreamHandlerReceive;
  v3[5] = SocketStreamHandlerDeleteStreamHandler;
  v3[6] = 0;
  *a1 = v3;
  SetSocketLogCallback(_SocketLogCallback, 0);
  return 0;
}

uint64_t SocketStreamHandlerAccept(uint64_t a1, CFDictionaryRef theDict, CFTypeRef *a3)
{
  _QWORD *v6;
  const __CFNumber *Value;
  const __CFNumber *v8;
  const void *v9;
  int *Server;
  const __CFNumber *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFStringRef v16;
  const __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  int v25;
  unsigned int valuePtr;

  v6 = *(_QWORD **)(a1 + 48);
  if (v6)
  {
    SocketDelete(v6);
    *(_QWORD *)(a1 + 48) = 0;
  }
  Value = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("DLInfoPortKey"));
  v8 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("DLInfoSocketKey"));
  v9 = CFDictionaryGetValue(theDict, CFSTR("DLInfoLockdownAccept"));
  if (Value)
  {
    valuePtr = 0;
    if (CFNumberGetValue(Value, kCFNumberIntType, &valuePtr))
    {
      Server = (int *)SocketCreateServer(valuePtr, 1);
      if (v9 && v9 != (const void *)*MEMORY[0x24BDBD268])
        goto LABEL_7;
      goto LABEL_23;
    }
    v16 = CFStringCreateWithFormat(0, 0, CFSTR("SocketStreamHandlerAccept: Port in info dictionary is invalid: %@"), Value);
LABEL_20:
    v18 = v16;
    v19 = 4294967293;
    return DLSetStatus(v19, a3, v18);
  }
  if (!v8)
    return DLSetStatus(4294967293, a3, CFSTR("SocketStreamHandlerAccept: No port or socket in info dictionary"));
  v25 = 0;
  if (!CFNumberGetValue(v8, kCFNumberIntType, &v25))
  {
    v16 = CFStringCreateWithFormat(0, 0, CFSTR("SocketStreamHandlerAccept: Socket in info dictionary is invalid: %@"), v8);
    goto LABEL_20;
  }
  Server = SocketCreateServerWithSocket(v25);
  if (v9 && v9 != (const void *)*MEMORY[0x24BDBD268])
  {
    v11 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("DLInfoLockdownConnection"));
    if (v11)
    {
      CFNumberGetValue(v11, kCFNumberNSIntegerType, Server + 6);
      if (*((_QWORD *)Server + 3))
      {
        *((_QWORD *)Server + 2) = lockdown_get_securecontext();
        if (DLShouldLog(6))
          _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/SocketStreamHandler.c", "SocketStreamHandlerAccept", 6, CFSTR("Using SSL. SSL pointer is %p (lockConn: %@)"), v12, v13, v14, v15, *((_QWORD *)Server + 2));
      }
    }
LABEL_7:
    *(_QWORD *)(a1 + 48) = Server;
    if (!Server)
      goto LABEL_26;
    goto LABEL_24;
  }
  if (DLShouldLog(4))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/SocketStreamHandler.c", "SocketStreamHandlerAccept", 4, CFSTR("Not using lockdown"), v20, v21, v22, v23, v24);
LABEL_23:
  *(_QWORD *)(a1 + 48) = SocketAccept(Server);
  SocketDelete(Server);
  Server = *(int **)(a1 + 48);
  if (!Server)
  {
LABEL_26:
    v18 = CFSTR("SocketStreamHandlerAccept: error calling accept on socket");
    v19 = 0xFFFFFFFFLL;
    return DLSetStatus(v19, a3, v18);
  }
LABEL_24:
  if (Server[1])
  {
    SocketDelete(Server);
    *(_QWORD *)(a1 + 48) = 0;
    goto LABEL_26;
  }
  return 0;
}

uint64_t SocketStreamHandlerConnect(uint64_t a1, CFDictionaryRef theDict, CFTypeRef *a3)
{
  _QWORD *v6;
  const __CFString *Value;
  const __CFNumber *v8;
  const void *v9;
  CFStringRef v10;
  const __CFString *v11;
  const char *v13;
  const char *v14;
  unsigned int v15;
  unsigned int *v16;
  uint64_t v17;
  char *v18;
  CFStringRef v19;
  uint64_t v20;
  CFStringRef v21;
  unsigned int valuePtr;

  valuePtr = 0;
  v6 = *(_QWORD **)(a1 + 48);
  if (v6)
  {
    SocketDelete(v6);
    *(_QWORD *)(a1 + 48) = 0;
  }
  Value = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("DLInfoHostnameKey"));
  v8 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("DLInfoPortKey"));
  v9 = CFDictionaryGetValue(theDict, CFSTR("DLInfoServiceNameKey"));
  if (CFDictionaryGetValue(theDict, CFSTR("DLInfoMuxDeviceIdKey")))
  {
    v10 = CFStringCreateWithFormat(0, 0, CFSTR("SocketStreamHandlerConnect: Connection via direct usbmux is deprecated."));
LABEL_5:
    v11 = v10;
    return DLSetStatus(4294967293, a3, v11);
  }
  if (!Value)
  {
    v11 = CFSTR("SocketStreamHandlerConnect: No mux device id, AMDeviceRef, or hostname in info dictionary");
    return DLSetStatus(4294967293, a3, v11);
  }
  v13 = (const char *)DLCreateCStringFromCFString(Value);
  if (!v13)
  {
    v10 = CFStringCreateWithFormat(0, 0, CFSTR("SocketStreamHandlerConnect: Hostname in info dictionary is invalid: %@"), Value);
    goto LABEL_5;
  }
  v14 = v13;
  if (v8)
  {
    if (!CFNumberGetValue(v8, kCFNumberIntType, &valuePtr))
    {
      v19 = CFStringCreateWithFormat(0, 0, CFSTR("SocketStreamHandlerConnect: Port in info dictionary is invalid: %@"), v8);
      v20 = 4294967293;
      return DLSetStatus(v20, a3, v19);
    }
    v15 = valuePtr;
  }
  else
  {
    if (!v9)
    {
      v11 = CFSTR("SocketStreamHandlerConnect: No port/service in info dictionary");
      return DLSetStatus(4294967293, a3, v11);
    }
    v15 = 0;
  }
  v16 = (unsigned int *)SocketConnect(v14, v15);
  *(_QWORD *)(a1 + 48) = v16;
  if (!v16)
  {
    v21 = CFStringCreateWithFormat(0, 0, CFSTR("SocketStreamHandlerConnect: Can't create socket"));
LABEL_27:
    v19 = v21;
    v20 = 0xFFFFFFFFLL;
    return DLSetStatus(v20, a3, v19);
  }
  v17 = v16[1];
  if (!(_DWORD)v17)
    return 0;
  v18 = (&SocketErrorStrings)[v17];
  SocketDelete(v16);
  *(_QWORD *)(a1 + 48) = 0;
  if ((_DWORD)v17 == 9)
  {
    v19 = CFSTR("SocketStreamHandlerConnect: Cannot connect - the device is locked");
    v20 = 4294967291;
    return DLSetStatus(v20, a3, v19);
  }
  if ((_DWORD)v17 != 8)
  {
    v21 = CFStringCreateWithFormat(0, 0, CFSTR("SocketStreamHandlerConnect: Can't connect to host: Socket error %d (%s)"), v17, v18);
    goto LABEL_27;
  }
  v19 = CFSTR("SocketStreamHandlerConnect: Cannot connect - we are not paired with this device");
  v20 = 4294967292;
  return DLSetStatus(v20, a3, v19);
}

uint64_t SocketStreamHandlerClose(uint64_t a1)
{
  _QWORD *v2;

  v2 = *(_QWORD **)(a1 + 48);
  if (v2)
  {
    SocketDelete(v2);
    *(_QWORD *)(a1 + 48) = 0;
  }
  return 0;
}

uint64_t SocketStreamHandlerSend(uint64_t a1, const void *a2, size_t *a3, CFStringRef *a4)
{
  uint64_t v6;
  uint64_t result;

  v6 = SocketSend(*(_QWORD *)(a1 + 48), a2, *a3);
  if (v6 <= 0)
  {
    if (a4)
      *a4 = CFStringCreateWithFormat(0, 0, CFSTR("Can't send data"));
    result = 0xFFFFFFFFLL;
  }
  else
  {
    result = 0;
  }
  *a3 = v6;
  return result;
}

uint64_t SocketStreamHandlerReceive(uint64_t a1, void *a2, size_t *a3, CFStringRef *a4)
{
  uint64_t v6;
  size_t v7;
  uint64_t result;

  v6 = SocketRecv(*(_QWORD *)(a1 + 48), a2, *a3);
  if (v6 < 1)
  {
    *a3 = 0;
    if (a4)
      *a4 = CFStringCreateWithFormat(0, 0, CFSTR("Can't read data"));
    return 0xFFFFFFFFLL;
  }
  else
  {
    v7 = v6;
    result = 0;
    *a3 = v7;
  }
  return result;
}

uint64_t SocketStreamHandlerDeleteStreamHandler(_QWORD *a1)
{
  _QWORD *v2;

  v2 = (_QWORD *)a1[6];
  if (v2)
    SocketDelete(v2);
  free(a1);
  return 0;
}

void _SocketLogCallback(char *cStr)
{
  const __CFString *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v1 = CFStringCreateWithCString(0, cStr, 0);
  if (DLShouldLog(3))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/SocketStreamHandler.c", "_SocketLogCallback", 3, v1, v2, v3, v4, v5, v6);
  CFRelease(v1);
}

uint64_t StreamHandlerRegisterCreatorForType(void *key, void *value, CFTypeRef *a3)
{
  __CFDictionary *Mutable;

  if (!value)
    return DLSetStatus(4294967293, a3, CFSTR("Creator function is NULL"));
  Mutable = (__CFDictionary *)sStreamHandlers;
  if (!sStreamHandlers)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD2A8], 0);
    sStreamHandlers = (uint64_t)Mutable;
  }
  CFDictionarySetValue(Mutable, key, value);
  return 0;
}

uint64_t StreamHandlerForType(void *key, uint64_t a2, CFTypeRef *a3)
{
  uint64_t result;
  uint64_t (*Value)(uint64_t, CFTypeRef *);
  const __CFString *v8;
  CFStringRef v9;

  if ((sInitializedStreamHandlers & 1) == 0)
  {
    result = SocketStreamHandlerRegisterCreator(a3);
    if ((_DWORD)result)
      return result;
    sInitializedStreamHandlers = 1;
  }
  if (!key)
  {
    v8 = CFSTR("Parameter for type is NULL");
    return DLSetStatus(4294967293, a3, v8);
  }
  if (!a2)
  {
    v8 = CFSTR("Out parameter for streamHandler is NULL");
    return DLSetStatus(4294967293, a3, v8);
  }
  if (sStreamHandlers)
  {
    Value = (uint64_t (*)(uint64_t, CFTypeRef *))CFDictionaryGetValue((CFDictionaryRef)sStreamHandlers, key);
    if (Value)
      return Value(a2, a3);
  }
  v9 = CFStringCreateWithFormat(0, 0, CFSTR("StreamHandler is not registered for %@"), key);
  if (a3)
  {
    *a3 = v9;
  }
  else if (v9)
  {
    CFRelease(v9);
  }
  return 0xFFFFFFFFLL;
}

uint64_t StreamHandlerAccept(uint64_t (**a1)(void), int a2, CFTypeRef *a3)
{
  if (a1)
    return (*a1)();
  else
    return DLSetStatus(4294967293, a3, CFSTR("StreamHandler is NULL"));
}

uint64_t StreamHandlerConnect(uint64_t a1, int a2, CFTypeRef *a3)
{
  if (a1)
    return (*(uint64_t (**)(void))(a1 + 8))();
  else
    return DLSetStatus(4294967293, a3, CFSTR("StreamHandler is NULL"));
}

uint64_t StreamHandlerClose(uint64_t a1, CFTypeRef *a2)
{
  if (a1)
    return (*(uint64_t (**)(void))(a1 + 16))();
  else
    return DLSetStatus(4294967293, a2, CFSTR("StreamHandler is NULL"));
}

uint64_t StreamHandlerSend(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int *a4, CFTypeRef *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  const __CFString *v13;
  uint64_t v14;
  unsigned int v15;

  if (a4)
    *a4 = 0;
  if (!a1)
    return DLSetStatus(4294967293, a5, CFSTR("StreamHandler is NULL"));
  v15 = bswap32(a3);
  v14 = 0;
  v10 = 4;
  do
  {
    if (_Write(a1, (uint64_t)&v15 - v10 + 4, v10, &v14))
    {
      v13 = CFSTR("Error writing length of data");
      return DLSetStatus(0xFFFFFFFFLL, a5, v13);
    }
    v10 -= v14;
  }
  while (v10);
  if (a3)
  {
    v11 = a3;
    while (!_Write(a1, a2 + a3 - v11, v11, &v14))
    {
      v11 -= v14;
      if (!v11)
        goto LABEL_11;
    }
    v13 = CFSTR("Error writing data");
    return DLSetStatus(0xFFFFFFFFLL, a5, v13);
  }
LABEL_11:
  result = 0;
  if (a4)
    *a4 = a3;
  return result;
}

uint64_t _Write(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFTypeRef cf;

  v10 = a3;
  cf = 0;
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *, CFTypeRef *))(a1 + 24))(a1, a2, &v10, &cf);
  if ((_DWORD)result)
  {
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/StreamHandler.c", "_WriteFunc", 3, CFSTR("Error sending data: %@"), v6, v7, v8, v9, (char)cf);
    if (cf)
      CFRelease(cf);
    result = 0xFFFFFFFFLL;
  }
  if (a4)
    *a4 = v10;
  return result;
}

uint64_t StreamHandlerReceive(uint64_t a1, CFDataRef *a2, CFTypeRef *a3)
{
  uint64_t v5;
  unsigned int v6;
  size_t v7;
  UInt8 *v8;
  uint64_t v9;
  CFDataRef v10;
  uint64_t result;
  const __CFString *v12;
  uint64_t v13;
  unsigned int v14;

  if (!a1)
  {
    v12 = CFSTR("StreamHandler is NULL");
    return DLSetStatus(4294967293, a3, v12);
  }
  if (!a2)
  {
    v12 = CFSTR("Data is NULL");
    return DLSetStatus(4294967293, a3, v12);
  }
  v14 = 0;
  v13 = 0;
  v5 = 4;
  *a2 = 0;
  while (!_Read(a1, (uint64_t)&v14 - v5 + 4, v5, &v13))
  {
    v5 -= v13;
    if (!v5)
    {
      v6 = v14;
      v7 = bswap32(v14);
      v8 = (UInt8 *)malloc_type_malloc(v7, 0x77418D27uLL);
      if (!v6)
      {
LABEL_10:
        v10 = DLDataCreateWithMallocedBytesNoCopy(v8, v7);
        result = 0;
        *a2 = v10;
        return result;
      }
      v9 = v7;
      while (!_Read(a1, (uint64_t)&v8[v7 - v9], v9, &v13))
      {
        v9 -= v13;
        if (!v9)
          goto LABEL_10;
      }
      free(v8);
      return 0xFFFFFFFFLL;
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t _Read(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFTypeRef cf;

  v10 = a3;
  cf = 0;
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *, CFTypeRef *))(a1 + 32))(a1, a2, &v10, &cf);
  if ((_DWORD)result)
  {
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/StreamHandler.c", "_ReadFunc", 3, CFSTR("Error reading data: %@"), v6, v7, v8, v9, (char)cf);
    if (cf)
      CFRelease(cf);
    result = 0xFFFFFFFFLL;
  }
  if (a4)
    *a4 = v10;
  return result;
}

uint64_t StreamHandlerDeleteStreamHandler(uint64_t a1, CFTypeRef *a2)
{
  if (a1)
    return (*(uint64_t (**)(void))(a1 + 40))();
  else
    return DLSetStatus(4294967293, a2, CFSTR("StreamHandler is NULL"));
}

void _DLHandlerThreadMessagePortCallback_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char vars0;

  if (DLShouldLog(3))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFileBytes", 3, CFSTR("Could not finalize encryption. Our buffer is too small"), v0, v1, v2, v3, vars0);
  __assert_rtn("_DLWriteFileBytes", "DeviceLinkConnection.c", 920, "false");
}

void DLLockdownXPCCheckin_cold_1()
{
  __assert_rtn("DLLockdownXPCCheckin", "DeviceLinkConnection.c", 1697, "serviceName != NULL");
}

void DLLockdownXPCCheckin_cold_2()
{
  __assert_rtn("DLLockdownXPCCheckin", "DeviceLinkConnection.c", 1698, "info != NULL");
}

void DLLockdownXPCCheckin_cold_3()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v0 = 134217984;
  v1 = 600;
  _os_log_error_impl(&dword_229EB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "lockdown_checkin_xpc timed out after %llds", (uint8_t *)&v0, 0xCu);
}

void DLLockdownXPCCheckin_cold_4(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_229EB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "lockdown_checkin_xpc failed: %d", (uint8_t *)v1, 8u);
}

void _DLMainThreadMessagePortCallback_cold_1(const void **values)
{
  CFArrayCreate(0, values, 1, MEMORY[0x24BDBD690]);
  abort();
}

void _DLMainThreadMessagePortCallback_cold_2(const __CFArray *a1)
{
  _DLGetParameterAtIndexWithDefaultValue(a1, 1, 0);
  _DLGetParameterAtIndexWithDefaultValue(a1, 2, 0);
  abort();
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x24BDAC0E8](*(_QWORD *)&op, *(_QWORD *)&alg, *(_QWORD *)&options, key, keyLength, iv, dataIn, dataInLength);
}

CCCryptorStatus CCCryptorCreate(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x24BDAC110](*(_QWORD *)&op, *(_QWORD *)&alg, *(_QWORD *)&options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorFinal(CCCryptorRef cryptorRef, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x24BDAC130](cryptorRef, dataOut, dataOutAvailable, dataOutMoved);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x24BDAC188](cryptorRef);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x24BDAC198](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return MEMORY[0x24BDBBC68]();
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x24BDBBC88](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x24BDBBD00](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x24BDBBD20](theData, length);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x24BDBBD30](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x24BDBBD40](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x24BDBBD60](allocator, formatter, at);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
  MEMORY[0x24BDBBD88](formatter, formatString);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x24BDBBE10](theDict, keys, values);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFMessagePortRef CFMessagePortCreateLocal(CFAllocatorRef allocator, CFStringRef name, CFMessagePortCallBack callout, CFMessagePortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMessagePortRef)MEMORY[0x24BDBBFF0](allocator, name, callout, context, shouldFreeInfo);
}

CFMessagePortRef CFMessagePortCreateRemote(CFAllocatorRef allocator, CFStringRef name)
{
  return (CFMessagePortRef)MEMORY[0x24BDBBFF8](allocator, name);
}

CFRunLoopSourceRef CFMessagePortCreateRunLoopSource(CFAllocatorRef allocator, CFMessagePortRef local, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC000](allocator, local, order);
}

void CFMessagePortGetContext(CFMessagePortRef ms, CFMessagePortContext *context)
{
  MEMORY[0x24BDBC008](ms, context);
}

void CFMessagePortInvalidate(CFMessagePortRef ms)
{
  MEMORY[0x24BDBC010](ms);
}

Boolean CFMessagePortIsValid(CFMessagePortRef ms)
{
  return MEMORY[0x24BDBC018](ms);
}

SInt32 CFMessagePortSendRequest(CFMessagePortRef remote, SInt32 msgid, CFDataRef data, CFTimeInterval sendTimeout, CFTimeInterval rcvTimeout, CFStringRef replyMode, CFDataRef *returnData)
{
  return MEMORY[0x24BDBC020](remote, *(_QWORD *)&msgid, data, replyMode, returnData, sendTimeout, rcvTimeout);
}

void CFMessagePortSetInvalidationCallBack(CFMessagePortRef ms, CFMessagePortInvalidationCallBack callout)
{
  MEMORY[0x24BDBC030](ms, callout);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC190](key, applicationID, keyExistsAndHasValidFormat);
}

CFPropertyListRef CFPropertyListCreateFromStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags mutabilityOption, CFPropertyListFormat *format, CFStringRef *errorString)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1D0](allocator, stream, streamLength, mutabilityOption, format, errorString);
}

CFPropertyListRef CFPropertyListCreateFromXMLData(CFAllocatorRef allocator, CFDataRef xmlData, CFOptionFlags mutabilityOption, CFStringRef *errorString)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1D8](allocator, xmlData, mutabilityOption, errorString);
}

Boolean CFPropertyListIsValid(CFPropertyListRef plist, CFPropertyListFormat format)
{
  return MEMORY[0x24BDBC200](plist, format);
}

CFIndex CFPropertyListWriteToStream(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFStringRef *errorString)
{
  return MEMORY[0x24BDBC210](propertyList, stream, format, errorString);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x24BDBC218](stream);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x24BDBC230](alloc, fileURL);
}

CFStreamError CFReadStreamGetError(CFReadStreamRef stream)
{
  CFIndex v1;
  uint64_t v2;
  CFStreamError result;

  v1 = MEMORY[0x24BDBC238](stream);
  result.error = v2;
  result.domain = v1;
  return result;
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x24BDBC258](stream);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2D0](rl, timer, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

void CFRunLoopRun(void)
{
  MEMORY[0x24BDBC358]();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x24BDBC360](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC370](allocator, order, context);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
  MEMORY[0x24BDBC380](source);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC388](rl);
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return (CFRunLoopTimerRef)MEMORY[0x24BDBC390](allocator, flags, order, callout, context, fireDate, interval);
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
  MEMORY[0x24BDBC3A8](timer);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC3B8](rl);
}

void CFShow(CFTypeRef obj)
{
  MEMORY[0x24BDBC438](obj);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x24BDBC510](alloc, theString, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x24BDBC520](alloc, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x24BDBC590](alloc, buffer);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x24BDBC5A0](alloc, formatOptions, format, arguments);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x24BDBC5B0](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x24BDBC5D0](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFStringEncoding CFStringGetFastestEncoding(CFStringRef theString)
{
  return MEMORY[0x24BDBC638](theString);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x24BDBC640](string, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x24BDBC668](string);
}

CFStringRef CFStringGetNameOfEncoding(CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC670](*(_QWORD *)&encoding);
}

CFStringEncoding CFStringGetSmallestEncoding(CFStringRef theString)
{
  return MEMORY[0x24BDBC688](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x24BDBC798](anURL, pathStyle);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC7F8](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateCopyAppendingPathExtension(CFAllocatorRef allocator, CFURLRef url, CFStringRef extension)
{
  return (CFURLRef)MEMORY[0x24BDBC800](allocator, url, extension);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x24BDBC808](allocator, url);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8D0](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x24BDBC8E8](alloc, uuid);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
  MEMORY[0x24BDBC968](stream);
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x24BDBC978](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x24BDBC980](alloc, bufferAllocator);
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x24BDBC988](alloc, fileURL);
}

CFStreamError CFWriteStreamGetError(CFWriteStreamRef stream)
{
  CFIndex v1;
  uint64_t v2;
  CFStreamError result;

  v1 = MEMORY[0x24BDBC990](stream);
  result.error = v2;
  result.domain = v1;
  return result;
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x24BDBC9A8](stream);
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x24BDD8718](AssertionType, *(_QWORD *)&AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x24BDD8740](*(_QWORD *)&AssertionID);
}

OSStatus SSLRead(SSLContextRef context, void *data, size_t dataLength, size_t *processed)
{
  return MEMORY[0x24BDE86E0](context, data, dataLength, processed);
}

OSStatus SSLWrite(SSLContextRef context, const void *data, size_t dataLength, size_t *processed)
{
  return MEMORY[0x24BDE8750](context, data, dataLength, processed);
}

uint64_t _CFGetProgname()
{
  return MEMORY[0x24BDBCFF0]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return MEMORY[0x24BDAC7B8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x24BDAC8B8](a1, *(_QWORD *)&a2, a3, a4);
}

uint64_t __strcat_chk()
{
  return MEMORY[0x24BDAC8F8]();
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x24BDAC900]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAD030](*(_QWORD *)&a1, a2, a3);
}

int atexit(void (*a1)(void))
{
  return MEMORY[0x24BDAD248](a1);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDAD2C8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDADA10](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x24BDAE328](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x24BDAE330](a1);
}

int flock(int a1, int a2)
{
  return MEMORY[0x24BDAE3B0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

hostent *__cdecl gethostbyname(const char *a1)
{
  return (hostent *)MEMORY[0x24BDAE640](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uid_t getuid(void)
{
  return MEMORY[0x24BDAE788]();
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x24BDAE8B8](*(_QWORD *)&a1, a2, a3);
}

int kevent(int kq, const kevent *changelist, int nchanges, kevent *eventlist, int nevents, const timespec *timeout)
{
  return MEMORY[0x24BDAE968](*(_QWORD *)&kq, changelist, *(_QWORD *)&nchanges, eventlist, *(_QWORD *)&nevents, timeout);
}

int kqueue(void)
{
  return MEMORY[0x24BDAE998]();
}

int launch_activate_socket(const char *name, int **fds, size_t *cnt)
{
  return MEMORY[0x24BDAE9A0](name, fds, cnt);
}

int listen(int a1, int a2)
{
  return MEMORY[0x24BDAEA78](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

uint64_t lockdown_checkin_xpc()
{
  return MEMORY[0x24BEDC4D8]();
}

uint64_t lockdown_disconnect()
{
  return MEMORY[0x24BEDC510]();
}

uint64_t lockdown_get_securecontext()
{
  return MEMORY[0x24BEDC518]();
}

uint64_t lockdown_get_socket()
{
  return MEMORY[0x24BEDC520]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7C8](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7D0](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x24BDAF7D8](a1, a2);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x24BDAF800](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x24BDAF978]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x24BDAFAE0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x24BDAFB80](__from, __to, __ec);
}

uint64_t secure_lockdown_checkin()
{
  return MEMORY[0x24BEDC550]();
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x24BDAFC70](*(_QWORD *)&a1, a2, a3, a4, a5);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x24BDAFCE8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x24BDAFD78](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int shutdown(int a1, int a2)
{
  return MEMORY[0x24BDAFDB0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x24BDAFE00](*(_QWORD *)&a1, a2);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x24BDAFE50](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFEE0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

