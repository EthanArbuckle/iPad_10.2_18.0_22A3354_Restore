@implementation AXDetermineRequestingClient

void ___AXDetermineRequestingClient_block_invoke()
{
  pid_t v0;
  BOOL v1;
  BOOL v2;
  BOOL v3;
  BOOL v17;
  BOOL v18;
  BOOL v19;
  NSObject *v21;
  __CFString **v22;
  uint64_t v23;
  _OWORD v24[16];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v0 = getpid();
  memset(v24, 0, sizeof(v24));
  proc_name(v0, v24, 0x100u);
  if (LODWORD(v24[0]) == 7630710)
  {
    v22 = kAXAnnouncementTypeLockScreenTouchIDAuthenticationSuccessSound;
    v23 = 3;
    goto LABEL_82;
  }
  v1 = *(_QWORD *)&v24[0] == 0x7265747069726373 && WORD4(v24[0]) == 50;
  if (v1
    || (*(_QWORD *)&v24[0] == 0x616D6F7475616975
      ? (v2 = *(_QWORD *)((char *)v24 + 6) == 0x646E6F6974616DLL)
      : (v2 = 0),
        v2 || (*(_QWORD *)&v24[0] == 0x6F626E7532616975 ? (v3 = DWORD2(v24[0]) == 6579576) : (v3 = 0), v3)))
  {
    v22 = kAXAnnouncementTypeLockScreenTouchIDAuthenticationSuccessSound;
    v23 = 1;
    goto LABEL_82;
  }
  if (*(_QWORD *)&v24[0] == 0x7669747369737361 && *((_QWORD *)&v24[0] + 1) == 0x646863756F7465)
  {
    if (_AXSAssistiveTouchScannerEnabled())
    {
      v22 = kAXAnnouncementTypeLockScreenTouchIDAuthenticationSuccessSound;
      v23 = 4;
    }
    else
    {
      if (!_AXSDwellControlEnabled())
        return;
      v22 = kAXAnnouncementTypeLockScreenTouchIDAuthenticationSuccessSound;
      v23 = 17;
    }
LABEL_82:
    v22[240] = (__CFString *)v23;
    return;
  }
  if (*(_QWORD *)&v24[0] == 0x616E616D74736574 && *(_QWORD *)((char *)v24 + 5) == 0x64726567616E61)
  {
    v22 = kAXAnnouncementTypeLockScreenTouchIDAuthenticationSuccessSound;
    v23 = 2;
    goto LABEL_82;
  }
  if (!(*(_QWORD *)&v24[0] ^ 0x6474696475617861 | BYTE8(v24[0])))
  {
    v22 = kAXAnnouncementTypeLockScreenTouchIDAuthenticationSuccessSound;
    v23 = 12;
    goto LABEL_82;
  }
  if (*(_QWORD *)&v24[0] == 0x41646E616D6D6F43
    && *((_QWORD *)&v24[0] + 1) == 0x6F72746E6F43646ELL
    && LOWORD(v24[1]) == 108)
  {
    v22 = kAXAnnouncementTypeLockScreenTouchIDAuthenticationSuccessSound;
    v23 = 5;
    goto LABEL_82;
  }
  if (*(_QWORD *)&v24[0] == 0x6279654B6C6C7546
    && *((_QWORD *)&v24[0] + 1) == 0x656363416472616FLL
    && *(_QWORD *)((char *)v24 + 11) == 0x73736563634164)
  {
    v22 = kAXAnnouncementTypeLockScreenTouchIDAuthenticationSuccessSound;
    v23 = 10;
    goto LABEL_82;
  }
  if (*(_QWORD *)&v24[0] == 0x6F42686374656B53 && DWORD2(v24[0]) == 6582881)
  {
    v22 = kAXAnnouncementTypeLockScreenTouchIDAuthenticationSuccessSound;
    v23 = 6;
    goto LABEL_82;
  }
  if (LODWORD(v24[0]) == 1768978772 && *(_DWORD *)((char *)v24 + 3) == 7631721)
  {
    v22 = kAXAnnouncementTypeLockScreenTouchIDAuthenticationSuccessSound;
    v23 = 8;
    goto LABEL_82;
  }
  if (LODWORD(v24[0]) == 1952675937 && WORD2(v24[0]) == 108)
  {
    v22 = kAXAnnouncementTypeLockScreenTouchIDAuthenticationSuccessSound;
    v23 = 13;
    goto LABEL_82;
  }
  if (*(_QWORD *)&v24[0] == 0x6F436E6565726353
    && *((_QWORD *)&v24[0] + 1) == 0x797469756E69746ELL
    && *(_QWORD *)((char *)v24 + 14) == 0x6C6C6568537974)
  {
    v22 = kAXAnnouncementTypeLockScreenTouchIDAuthenticationSuccessSound;
    v23 = 16;
    goto LABEL_82;
  }
  v17 = *(_QWORD *)&v24[0] == 0x6C7070612E6D6F63
     && *((_QWORD *)&v24[0] + 1) == 0x7373656363612E65
     && *(_QWORD *)&v24[1] == 0x2E7974696C696269
     && *((_QWORD *)&v24[1] + 1) == 0x69737365636341;
  if (v17
    || (*(_QWORD *)&v24[0] == 0x6269737365636341
      ? (v18 = *((_QWORD *)&v24[0] + 1) == 0x5349557974696C69)
      : (v18 = 0),
        v18 ? (v19 = *(_QWORD *)((char *)v24 + 14) == 0x72657672655349) : (v19 = 0),
        v19))
  {
    v22 = kAXAnnouncementTypeLockScreenTouchIDAuthenticationSuccessSound;
    v23 = 9999;
    goto LABEL_82;
  }
  if (*(_QWORD *)&v24[0] == 0x6E6F436863746157 && *(_QWORD *)((char *)v24 + 5) == 0x6C6F72746E6F43)
  {
    v22 = kAXAnnouncementTypeLockScreenTouchIDAuthenticationSuccessSound;
    v23 = 14;
    goto LABEL_82;
  }
  AXRuntimeLogCommon();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    ___AXDetermineRequestingClient_block_invoke_cold_1((uint64_t)v24, v21);

}

void ___AXDetermineRequestingClient_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315138;
  v3 = a1;
  _os_log_error_impl(&dword_1B54A6000, a2, OS_LOG_TYPE_ERROR, "Unknown client: %s", (uint8_t *)&v2, 0xCu);
}

@end
