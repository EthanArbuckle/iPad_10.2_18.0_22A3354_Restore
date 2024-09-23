@implementation NSObject(ASDTPowerState)

- (uint64_t)asdtPowerStateChange:()ASDTPowerState
{
  id v5;
  uint64_t v6;
  id v7;
  char v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  char v13;
  char v14;
  char v15;
  _QWORD v17[2];

  if (objc_msgSend(a1, "conformsToProtocol:", &unk_25644F7D0))
  {
    v5 = a1;
    v6 = objc_msgSend(v5, "powerState");
    objc_msgSend(v5, "name");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17[0] = 0;
    strlcpy((char *)v17, (const char *)objc_msgSend(v7, "UTF8String"), 9uLL);
    v17[1] = 0;

    v8 = 0;
    if ((int)a3 <= 1685090417)
    {
      if ((_DWORD)a3)
      {
        v9 = 1684628588;
LABEL_9:
        if ((_DWORD)a3 != v9)
          goto LABEL_11;
      }
    }
    else if ((_DWORD)a3 != 1685090418 && (_DWORD)a3 != 1685286000)
    {
      v9 = 1685092205;
      goto LABEL_9;
    }
    v8 = 1;
LABEL_11:
    if ((int)a3 <= 1937008995)
    {
      if ((int)a3 > 1685092204)
      {
        if ((_DWORD)a3 != 1685092205)
        {
          if ((_DWORD)a3 == 1685286000)
            v6 = 1936483696;
          goto LABEL_30;
        }
        goto LABEL_28;
      }
      if ((_DWORD)a3 == 1684628588)
        goto LABEL_24;
      v11 = 1685090418;
    }
    else
    {
      if ((int)a3 > 1970304876)
      {
        if ((_DWORD)a3 != 1970304877)
        {
          if ((_DWORD)a3 == 1970435438)
          {
            v6 = 1920298606;
            goto LABEL_30;
          }
          if ((_DWORD)a3 != 1970563428)
          {
LABEL_30:
            objc_msgSend(v5, "powerState");
            kdebug_trace();
            if ((_DWORD)v6 == objc_msgSend(v5, "powerState"))
            {
              v10 = 0;
LABEL_55:

              return v10;
            }
            v10 = 0;
            if ((int)v6 > 1886876268)
            {
              switch((_DWORD)v6)
              {
                case 0x7077726D:
                  v12 = objc_msgSend(v5, "performPowerStatePrewarm:", a3);
                  break;
                case 0x72756E6E:
                  v12 = objc_msgSend(v5, "performPowerStateOn");
                  break;
                case 0x736C6570:
                  v12 = objc_msgSend(v5, "performPowerStateSleep");
                  break;
                default:
                  goto LABEL_53;
              }
            }
            else
            {
              if (!(_DWORD)v6)
              {
                v10 = 2003329396;
                goto LABEL_55;
              }
              if ((_DWORD)v6 != 1768189029)
              {
                if ((_DWORD)v6 == 1886413170)
                {
                  v12 = objc_msgSend(v5, "performPowerStatePrepare:", a3);
                  goto LABEL_45;
                }
LABEL_53:
                objc_msgSend(v5, "setPowerState:", v6);
LABEL_54:
                objc_msgSend(v5, "powerState");
                kdebug_trace();
                goto LABEL_55;
              }
              v12 = objc_msgSend(v5, "performPowerStateIdle:", a3);
            }
LABEL_45:
            v10 = v12;
            if ((_DWORD)v12)
              v13 = v8;
            else
              v13 = 1;
            if ((v13 & 1) == 0)
            {
              v14 = objc_msgSend(v5, "pmNoStateChangeOnFailure");
              v15 = (_DWORD)a3 == 1970563428 ? 1 : v14;
              if ((v15 & 1) != 0)
                goto LABEL_54;
            }
            goto LABEL_53;
          }
LABEL_24:
          v6 = 1768189029;
          goto LABEL_30;
        }
LABEL_28:
        v6 = 1886876269;
        goto LABEL_30;
      }
      if ((_DWORD)a3 == 1937008996)
        goto LABEL_24;
      v11 = 1970303090;
    }
    if ((_DWORD)a3 == v11)
      v6 = 1886413170;
    goto LABEL_30;
  }
  return 560227702;
}

- (uint64_t)asdtHandlesPowerTransition:()ASDTPowerState
{
  return 1;
}

@end
