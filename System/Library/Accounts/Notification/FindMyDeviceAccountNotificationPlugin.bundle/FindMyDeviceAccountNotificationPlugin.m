void sub_230F1A0B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_230F1A0D4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    sub_230F1A670();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_230F1B314((uint64_t)v5, v6);

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5 != 0;
  objc_msgSend(*(id *)(a1 + 32), "signal");

}

void sub_230F1A30C(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  os_log_t log;
  uint8_t v19[16];
  uint8_t v20[16];
  uint8_t v21[16];
  uint8_t buf[16];
  uint8_t v23[16];

  objc_msgSend(MEMORY[0x24BE31CC0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_quickFetchFMIPEnabledstate");

  if (*(_DWORD *)(a1 + 48) == 2)
  {
    if ((v3 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "accountType");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqual:", *MEMORY[0x24BDB4028]);

      v7 = *(void **)(a1 + 32);
      if (!v6)
      {
        objc_msgSend(v7, "accountType");
        log = (os_log_t)objc_claimAutoreleasedReturnValue();
        -[NSObject identifier](log, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqual:", *MEMORY[0x24BDB3FD8]))
        {
          v12 = objc_msgSend(*(id *)(a1 + 32), "aa_isAccountClass:", *MEMORY[0x24BE047F0]);

          if (!v12)
            return;
          v13 = objc_msgSend(*(id *)(a1 + 40), "aa_isSuspended");
          if (v13 != objc_msgSend(*(id *)(a1 + 32), "aa_isSuspended"))
          {
            sub_230F1A670();
            log = (os_log_t)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v21 = 0;
              _os_log_impl(&dword_230F19000, log, OS_LOG_TYPE_DEFAULT, "iCloud account needs to verify terms changed", v21, 2u);
            }
            v8 = CFSTR("iCloud-terms-changed");
            goto LABEL_8;
          }
          if (objc_msgSend(*(id *)(a1 + 32), "isPropertyDirty:", CFSTR("credential")))
          {
            sub_230F1A670();
            log = (os_log_t)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v20 = 0;
              _os_log_impl(&dword_230F19000, log, OS_LOG_TYPE_DEFAULT, "iCloud token has changed", v20, 2u);
            }
            v8 = CFSTR("iCloud-auth-token");
            goto LABEL_8;
          }
          v14 = *(void **)(a1 + 40);
          if (v14)
            objc_msgSend(v14, "fmipAccountInfoForProactiveChanges");
          else
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
          log = (os_log_t)objc_claimAutoreleasedReturnValue();
          v15 = *(void **)(a1 + 32);
          if (v15)
            objc_msgSend(v15, "fmipAccountInfoForProactiveChanges");
          else
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((-[NSObject isEqual:](log, "isEqual:", v16) & 1) == 0)
          {
            sub_230F1A670();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v19 = 0;
              _os_log_impl(&dword_230F19000, v17, OS_LOG_TYPE_DEFAULT, "FMIP info changed", v19, 2u);
            }

            v8 = CFSTR("FMIP-info");
            goto LABEL_8;
          }

        }
        else
        {

        }
        return;
      }
      if (objc_msgSend(v7, "isPropertyDirty:", CFSTR("credential")))
      {
        sub_230F1A670();
        log = (os_log_t)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_230F19000, log, OS_LOG_TYPE_DEFAULT, "FMIP token has changed", buf, 2u);
        }
        v8 = CFSTR("FMIP-auth-token");
LABEL_8:

        objc_msgSend(MEMORY[0x24BE31CC0], "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "didChangeFMIPAccountInfo:", v8);

      }
    }
    else
    {
      sub_230F1A670();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_230F19000, v10, OS_LOG_TYPE_DEFAULT, "iCloud account info did change but FMIP is not enabled", v23, 2u);
      }

    }
  }
}

id sub_230F1A670()
{
  if (qword_25414BC68 != -1)
    dispatch_once(&qword_25414BC68, &unk_24FFAF2E8);
  return (id)qword_25414BC60;
}

void sub_230F1A6B0()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.findmydeviced", "_");
  v1 = (void *)qword_25414BC60;
  qword_25414BC60 = (uint64_t)v0;

}

id sub_230F1A6E0()
{
  if (qword_255EAC350 != -1)
    dispatch_once(&qword_255EAC350, &unk_24FFAF308);
  return (id)qword_255EAC358;
}

void sub_230F1A720()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.findmydeviced", "locations");
  v1 = (void *)qword_255EAC358;
  qword_255EAC358 = (uint64_t)v0;

}

id sub_230F1A750()
{
  if (qword_255EAC360 != -1)
    dispatch_once(&qword_255EAC360, &unk_24FFAF328);
  return (id)qword_255EAC368;
}

void sub_230F1A790()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.findmydeviced", "accessory");
  v1 = (void *)qword_255EAC368;
  qword_255EAC368 = (uint64_t)v0;

}

id sub_230F1A7C0()
{
  if (qword_255EAC370 != -1)
    dispatch_once(&qword_255EAC370, &unk_24FFAF348);
  return (id)qword_255EAC378;
}

void sub_230F1A800()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.findmydeviced", "traffic");
  v1 = (void *)qword_255EAC378;
  qword_255EAC378 = (uint64_t)v0;

}

id sub_230F1A830()
{
  if (qword_255EAC380 != -1)
    dispatch_once(&qword_255EAC380, &unk_24FFAF368);
  return (id)qword_255EAC388;
}

void sub_230F1A870()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.findmydeviced", "encoder");
  v1 = (void *)qword_255EAC388;
  qword_255EAC388 = (uint64_t)v0;

}

id sub_230F1A8A0()
{
  if (qword_255EAC390 != -1)
    dispatch_once(&qword_255EAC390, &unk_24FFAF388);
  return (id)qword_255EAC398;
}

void sub_230F1A8E0()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.findmydeviced", "bluetoothsession");
  v1 = (void *)qword_255EAC398;
  qword_255EAC398 = (uint64_t)v0;

}

id sub_230F1A910()
{
  if (qword_255EAC3A0 != -1)
    dispatch_once(&qword_255EAC3A0, &unk_24FFAF3A8);
  return (id)qword_255EAC3A8;
}

void sub_230F1A950()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.findmydeviced", "extensions");
  v1 = (void *)qword_255EAC3A8;
  qword_255EAC3A8 = (uint64_t)v0;

}

id sub_230F1A980()
{
  if (qword_255EAC3B0 != -1)
    dispatch_once(&qword_255EAC3B0, &unk_24FFAF3C8);
  return (id)qword_255EAC3B8;
}

void sub_230F1A9C0()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.findmydeviced", "extensions_playSound");
  v1 = (void *)qword_255EAC3B8;
  qword_255EAC3B8 = (uint64_t)v0;

}

id sub_230F1A9F0()
{
  if (qword_255EAC3C0 != -1)
    dispatch_once(&qword_255EAC3C0, &unk_24FFAF3E8);
  return (id)qword_255EAC3C8;
}

void sub_230F1AA30()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.findmydeviced", "secureLocations");
  v1 = (void *)qword_255EAC3C8;
  qword_255EAC3C8 = (uint64_t)v0;

}

id sub_230F1AA60()
{
  if (qword_255EAC3D0 != -1)
    dispatch_once(&qword_255EAC3D0, &unk_24FFAF408);
  return (id)qword_255EAC3D8;
}

void sub_230F1AAA0()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.findmydeviced", "repairDevice");
  v1 = (void *)qword_255EAC3D8;
  qword_255EAC3D8 = (uint64_t)v0;

}

id sub_230F1AAD0()
{
  if (qword_255EAC3E0 != -1)
    dispatch_once(&qword_255EAC3E0, &unk_24FFAF428);
  return (id)qword_255EAC3E8;
}

void sub_230F1AB10()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.findmydeviced", "ALFailureAnalytics");
  v1 = (void *)qword_255EAC3E8;
  qword_255EAC3E8 = (uint64_t)v0;

}

id sub_230F1AB40()
{
  if (qword_255EAC3F0 != -1)
    dispatch_once(&qword_255EAC3F0, &unk_24FFAF448);
  return (id)qword_255EAC3F8;
}

void sub_230F1AB80()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.findmydeviced", "disableLocationDisplay");
  v1 = (void *)qword_255EAC3F8;
  qword_255EAC3F8 = (uint64_t)v0;

}

id sub_230F1ABB0()
{
  if (qword_255EAC400 != -1)
    dispatch_once(&qword_255EAC400, &unk_24FFAF468);
  return (id)qword_255EAC408;
}

void sub_230F1ABF0()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.findmydeviced", "accountRatchet");
  v1 = (void *)qword_255EAC408;
  qword_255EAC408 = (uint64_t)v0;

}

id sub_230F1AC20()
{
  if (qword_255EAC410 != -1)
    dispatch_once(&qword_255EAC410, &unk_24FFAF488);
  return (id)qword_255EAC418;
}

void sub_230F1AC60()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.findmydeviced", "ownerAuthentication");
  v1 = (void *)qword_255EAC418;
  qword_255EAC418 = (uint64_t)v0;

}

id sub_230F1AC90()
{
  if (qword_255EAC420 != -1)
    dispatch_once(&qword_255EAC420, &unk_24FFAF4A8);
  return (id)qword_255EAC428;
}

void sub_230F1ACD0()
{
  os_log_t v0;
  void *v1;

  if (objc_msgSend(MEMORY[0x24BE2FE60], "BOOLForKey:inDomain:", CFSTR("ShowAutomationLogs"), CFSTR("com.apple.icloud.findmydeviced.notbackedup")))
  {
    v0 = os_log_create("com.apple.icloud.findmydeviced", "automation");
    v1 = (void *)qword_255EAC428;
    qword_255EAC428 = (uint64_t)v0;

  }
}

id sub_230F1AD28(void *a1, uint64_t a2, int a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD *v24;
  __CFString *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  __CFString *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = qword_255EAC2F8;
  objc_msgSend(a1, "username");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v6, v7);

  v8 = qword_255EAC300;
  objc_msgSend(a1, "aa_personID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v8, v9);

  v10 = qword_255EAC308;
  objc_msgSend(a1, "aa_altDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v10, v11);

  if (a3)
  {
    v12 = qword_255EAC310;
    objc_msgSend(a1, "aa_fmipToken");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fm_safelyMapKey:toObject:", v12, v13);

    v14 = qword_255EAC318;
    objc_msgSend(a1, "aa_authToken");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fm_safelyMapKey:toObject:", v14, v15);

  }
  v16 = qword_255EAC320;
  objc_msgSend(a1, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v16, v17);

  objc_msgSend(a1, "dataclassProperties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("com.apple.Dataclass.DeviceLocator"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = qword_255EAC328;
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("hostname"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v20, v21);

  objc_msgSend(v5, "fm_safelyMapKey:toObject:", qword_255EAC330, CFSTR("https"));
  v22 = qword_255EAC338;
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("apsEnv"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v22, v23);

  v24 = (_QWORD *)MEMORY[0x24BE31CD0];
  objc_msgSend(MEMORY[0x24BE2FE60], "stringForKey:inDomain:", CFSTR("configURL"), *MEMORY[0x24BE31CD0]);
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = qword_255EAC340;
    v27 = v5;
    v28 = v25;
LABEL_5:
    objc_msgSend(v27, "fm_safelyMapKey:toObject:", v26, v28);
    goto LABEL_8;
  }
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("configURL"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = qword_255EAC340;
  if (!v29)
  {
    v28 = CFSTR("https://gateway.icloud.com/fmadminws/findkit");
    v27 = v5;
    v26 = qword_255EAC340;
    goto LABEL_5;
  }
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("configURL"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v30, v31);

LABEL_8:
  objc_msgSend(MEMORY[0x24BE2FE60], "stringForKey:inDomain:", CFSTR("pairingURL"), *v24);
  v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = qword_255EAC348;
    v34 = v5;
    v35 = v32;
  }
  else
  {
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("pairingURL"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = qword_255EAC348;
    if (v36)
    {
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("pairingURL"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fm_safelyMapKey:toObject:", v37, v38);

      goto LABEL_13;
    }
    v35 = CFSTR("https://gateway.icloud.com/fmadminws");
    v34 = v5;
    v33 = qword_255EAC348;
  }
  objc_msgSend(v34, "fm_safelyMapKey:toObject:", v33, v35);
LABEL_13:
  v39 = (void *)objc_msgSend(v5, "copy");

  return v39;
}

id sub_230F1B0B0(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "fmipAccountInfoWithTokens:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "removeObjectForKey:", qword_255EAC320);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

id sub_230F1B108(void *a1, uint64_t a2, int a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = qword_255EAC2F8;
  objc_msgSend(a1, "username");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v6, v7);

  v8 = qword_255EAC300;
  objc_msgSend(a1, "aa_personID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v8, v9);

  v10 = qword_255EAC308;
  objc_msgSend(a1, "aa_altDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v10, v11);

  if (a3)
  {
    v12 = qword_255EAC310;
    objc_msgSend(a1, "aa_fmipToken");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fm_safelyMapKey:toObject:", v12, v13);

  }
  objc_msgSend(a1, "dataclassProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("com.apple.Dataclass.DeviceLocator"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = qword_255EAC328;
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("hostname"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v16, v17);

  objc_msgSend(v5, "fm_safelyMapKey:toObject:", qword_255EAC330, CFSTR("https"));
  v18 = qword_255EAC338;
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("apsEnv"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fm_safelyMapKey:toObject:", v18, v19);

  v20 = (void *)objc_msgSend(v5, "copy");
  return v20;
}

id sub_230F1B2CC(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "fmipAccountInfoWithTokens:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v3 = (void *)objc_msgSend(v2, "copy");
  return v3;
}

void sub_230F1B314(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_230F19000, a2, OS_LOG_TYPE_ERROR, "Error fetching the FMIP state to decide if iCloud account can be deleted : %@", (uint8_t *)&v2, 0xCu);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

