const char *IOReturnName(int a1)
{
  const char *result;

  switch(a1)
  {
    case -536870212:
      result = "kIOReturnError";
      break;
    case -536870211:
    case -536870210:
    case -536870209:
    case -536870208:
    case -536870205:
    case -536870204:
    case -536870202:
    case -536870200:
      goto LABEL_6;
    case -536870207:
      result = "kIOReturnNotPrivileged";
      break;
    case -536870206:
      result = "kIOReturnBadArgument";
      break;
    case -536870203:
      result = "kIOReturnExclusiveAccess";
      break;
    case -536870201:
      result = "kIOReturnUnsupported";
      break;
    case -536870199:
      result = "kIOReturnInternalError";
      break;
    case -536870198:
      result = "kIOReturnIOError";
      break;
    default:
      if (a1 == -536870174)
      {
        result = "kIOReturnNotPermitted";
      }
      else if (a1)
      {
LABEL_6:
        result = "unknown error";
      }
      else
      {
        result = "kIOReturnSuccess";
      }
      break;
  }
  return result;
}

uint64_t callIOFunction(int a1, mach_port_t a2, const void *a3, void *a4)
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  size_t v15[2];
  uint8_t buf[4];
  int v17;

  v8 = DiagnosticLogHandleForCategory(6);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (a1 == 2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15[0]) = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "SMC::callIOFunction kSMCHandleYPCEvent command", (uint8_t *)v15, 2u);
    }

    v15[0] = 168;
    v11 = IOConnectCallStructMethod(a2, 2u, a3, 0xA8uLL, a4, v15);
    v12 = DiagnosticLogHandleForCategory(6);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v17 = v11;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "SMC::callIOFunction IOConnectCallStructMethod result = %d", buf, 8u);
    }

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      callIOFunction_cold_1(a1, v10);

    return 3758097084;
  }
  return v11;
}

uint64_t smckSMCMakeUInt32Key(const char *a1)
{
  size_t v2;
  size_t v3;
  uint64_t result;
  int v5;
  int v6;

  v2 = strlen(a1);
  v3 = 0;
  LODWORD(result) = 0;
  v5 = 24;
  do
  {
    if (v2 <= v3)
      v6 = 32;
    else
      v6 = a1[v3];
    result = (v6 << v5) | result;
    ++v3;
    v5 -= 8;
  }
  while (v3 != 4);
  return result;
}

uint64_t returnEnumForDataTypeStr(int a1)
{
  uint64_t v2;
  int v3;
  id v4;
  NSObject *v5;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;

  v2 = 5;
  if (a1 > 1936734262)
  {
    if (a1 <= 1936747106)
    {
      if (a1 <= 1936745321)
      {
        if (a1 <= 1936744756)
        {
          if (a1 > 1936734517)
          {
            if (a1 != 1936734518)
            {
              if (a1 == 1936734573)
              {
                v2 = 62;
                goto LABEL_182;
              }
              goto LABEL_141;
            }
            v2 = 46;
          }
          else
          {
            if (a1 != 1936734263)
            {
              if (a1 == 1936734318)
              {
                v2 = 61;
                goto LABEL_182;
              }
              goto LABEL_141;
            }
            v2 = 45;
          }
        }
        else if (a1 <= 1936745011)
        {
          if (a1 != 1936744757)
          {
            if (a1 == 1936744812)
            {
              v2 = 63;
              goto LABEL_182;
            }
            goto LABEL_141;
          }
          v2 = 47;
        }
        else
        {
          switch(a1)
          {
            case 1936745012:
              v2 = 48;
              break;
            case 1936745067:
              v2 = 64;
              break;
            case 1936745267:
              v2 = 49;
              goto LABEL_182;
            default:
              goto LABEL_141;
          }
        }
      }
      else if (a1 > 1936746031)
      {
        if (a1 <= 1936746341)
        {
          if (a1 != 1936746032)
          {
            if (a1 == 1936746087)
            {
              v2 = 68;
              goto LABEL_182;
            }
            goto LABEL_141;
          }
          v2 = 52;
        }
        else
        {
          switch(a1)
          {
            case 1936746342:
              v2 = 69;
              break;
            case 1936746597:
              v2 = 70;
              break;
            case 1936746852:
              v2 = 71;
              goto LABEL_182;
            default:
              goto LABEL_141;
          }
        }
      }
      else if (a1 <= 1936745576)
      {
        if (a1 != 1936745322)
        {
          if (a1 == 1936745522)
          {
            v2 = 50;
            goto LABEL_182;
          }
          goto LABEL_141;
        }
        v2 = 65;
      }
      else
      {
        switch(a1)
        {
          case 1936745577:
            v2 = 66;
            break;
          case 1936745777:
            v2 = 51;
            break;
          case 1936745832:
            v2 = 67;
            goto LABEL_182;
          default:
            goto LABEL_141;
        }
      }
      goto LABEL_182;
    }
    if (a1 <= 1936749362)
    {
      if (a1 <= 1936748087)
      {
        if (a1 > 1936747616)
        {
          if (a1 != 1936747617)
          {
            if (a1 == 1936747833)
            {
              v2 = 75;
              goto LABEL_182;
            }
            goto LABEL_141;
          }
          v2 = 74;
        }
        else
        {
          if (a1 != 1936747107)
          {
            if (a1 == 1936747362)
            {
              v2 = 73;
              goto LABEL_182;
            }
            goto LABEL_141;
          }
          v2 = 72;
        }
      }
      else if (a1 <= 1936748597)
      {
        if (a1 != 1936748088)
        {
          if (a1 == 1936748343)
          {
            v2 = 78;
            goto LABEL_182;
          }
          goto LABEL_141;
        }
        v2 = 76;
      }
      else
      {
        switch(a1)
        {
          case 1936748598:
            v2 = 79;
            break;
          case 1936748853:
            v2 = 80;
            break;
          case 1936749108:
            v2 = 81;
            goto LABEL_182;
          default:
            goto LABEL_141;
        }
      }
      goto LABEL_182;
    }
    if (a1 <= 1969828657)
    {
      if (a1 <= 1936749872)
      {
        if (a1 != 1936749363)
        {
          if (a1 == 1936749618)
          {
            v2 = 83;
            goto LABEL_182;
          }
          goto LABEL_141;
        }
        v2 = 82;
      }
      else
      {
        switch(a1)
        {
          case 1936749873:
            v2 = 84;
            break;
          case 1936750128:
            v2 = 85;
            break;
          case 1969828150:
            v2 = 3;
            goto LABEL_182;
          default:
            goto LABEL_141;
        }
      }
      goto LABEL_182;
    }
    if (a1 <= 1969829887)
    {
      if (a1 != 1969828658)
      {
        if (a1 == 1969829428)
        {
          v2 = 102;
          goto LABEL_182;
        }
        goto LABEL_141;
      }
      v2 = 31;
      goto LABEL_182;
    }
    if (a1 == 1969829888 || a1 == 1969829920)
      goto LABEL_182;
    v3 = 2071094646;
    goto LABEL_78;
  }
  if (a1 > 1936274225)
  {
    if (a1 <= 1936733026)
    {
      if (a1 <= 1936732277)
      {
        if (a1 > 1936275487)
        {
          if (a1 != 1936275488)
          {
            if (a1 == 1936732262)
            {
              v2 = 37;
              goto LABEL_182;
            }
            goto LABEL_141;
          }
          v2 = 6;
        }
        else
        {
          if (a1 != 1936274226)
          {
            if (a1 == 1936274996)
            {
              v2 = 101;
              goto LABEL_182;
            }
            goto LABEL_141;
          }
          v2 = 100;
        }
      }
      else if (a1 <= 1936732532)
      {
        if (a1 != 1936732278)
        {
          if (a1 == 1936732517)
          {
            v2 = 38;
            goto LABEL_182;
          }
          goto LABEL_141;
        }
        v2 = 53;
      }
      else
      {
        switch(a1)
        {
          case 1936732533:
            v2 = 54;
            break;
          case 1936732772:
            v2 = 39;
            break;
          case 1936732788:
            v2 = 55;
            goto LABEL_182;
          default:
            goto LABEL_141;
        }
      }
    }
    else if (a1 > 1936733552)
    {
      if (a1 <= 1936733807)
      {
        if (a1 != 1936733553)
        {
          if (a1 == 1936733753)
          {
            v2 = 43;
            goto LABEL_182;
          }
          goto LABEL_141;
        }
        v2 = 58;
      }
      else
      {
        switch(a1)
        {
          case 1936733808:
            v2 = 59;
            break;
          case 1936734008:
            v2 = 9;
            break;
          case 1936734063:
            v2 = 60;
            goto LABEL_182;
          default:
            goto LABEL_141;
        }
      }
    }
    else if (a1 <= 1936733281)
    {
      if (a1 != 1936733027)
      {
        if (a1 == 1936733043)
        {
          v2 = 56;
          goto LABEL_182;
        }
        goto LABEL_141;
      }
      v2 = 40;
    }
    else
    {
      switch(a1)
      {
        case 1936733282:
          v2 = 41;
          break;
        case 1936733298:
          v2 = 57;
          break;
        case 1936733537:
          v2 = 42;
          goto LABEL_182;
        default:
          goto LABEL_141;
      }
    }
    goto LABEL_182;
  }
  if (a1 <= 1718629729)
  {
    if (a1 > 1718383647)
    {
      if (a1 <= 1718628964)
      {
        if (a1 != 1718383648)
        {
          if (a1 == 1718628710)
          {
            v2 = 13;
            goto LABEL_182;
          }
          goto LABEL_141;
        }
        v2 = 91;
      }
      else
      {
        switch(a1)
        {
          case 1718628965:
            v2 = 14;
            break;
          case 1718629220:
            v2 = 15;
            break;
          case 1718629475:
            v2 = 18;
            goto LABEL_182;
          default:
            goto LABEL_141;
        }
      }
      goto LABEL_182;
    }
    if (a1 > 1667785073)
    {
      if (a1 != 1667785074)
      {
        if (a1 == 1718378855)
          goto LABEL_182;
        goto LABEL_141;
      }
      goto LABEL_131;
    }
    if (a1 == 1651076703)
    {
      v2 = 89;
      goto LABEL_182;
    }
    v3 = 1667774506;
LABEL_78:
    if (a1 != v3)
      goto LABEL_141;
LABEL_131:
    v2 = 88;
    goto LABEL_182;
  }
  if (a1 > 1718641459)
  {
    if (a1 <= 1751480414)
    {
      if (a1 != 1718641460)
      {
        if (a1 == 1718641970)
        {
          v2 = 19;
          goto LABEL_182;
        }
        goto LABEL_141;
      }
      v2 = 90;
      goto LABEL_182;
    }
    if (a1 != 1751480415)
    {
      if (a1 != 1768908404)
      {
        if (a1 == 1936273718)
        {
          v2 = 29;
          goto LABEL_182;
        }
        goto LABEL_141;
      }
      v2 = 103;
      goto LABEL_182;
    }
LABEL_141:
    v2 = 87;
    goto LABEL_182;
  }
  if (a1 <= 1718630200)
  {
    if (a1 != 1718629730)
    {
      if (a1 == 1718629985)
      {
        v2 = 12;
        goto LABEL_182;
      }
      goto LABEL_141;
    }
    v2 = 16;
  }
  else
  {
    switch(a1)
    {
      case 1718630201:
        v2 = 17;
        break;
      case 1718630456:
        v2 = 7;
        break;
      case 1718640950:
        v2 = 33;
        break;
      default:
        goto LABEL_141;
    }
  }
LABEL_182:
  v4 = DiagnosticLogHandleForCategory(6);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109632;
    v7[1] = a1;
    v8 = 1024;
    v9 = v2;
    v10 = 1024;
    v11 = 38;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "SMC::convertValue value %u result %d %d", (uint8_t *)v7, 0x14u);
  }

  return v2;
}

double convertKeyToValueMiniT(int a1, size_t __n, void *__src, double a4)
{
  double v4;
  int v5;
  int v7;
  double v8;
  double v10;
  float v11;
  int v12;
  float v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  uint64_t v32;
  double v33;
  double v34;
  int v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;
  __int16 v50;
  int v51;
  _QWORD __dst[2];

  __dst[1] = 0;
  v4 = -1.0;
  if (__n <= 8)
  {
    v5 = __n;
    __dst[0] = 0;
    if ((_DWORD)__n)
      memcpy(__dst, __src, __n);
    switch(a1)
    {
      case 2:
        return 0.0;
      case 3:
      case 23:
LABEL_5:
        LOWORD(a4) = __dst[0];
        return (double)*(unint64_t *)&a4;
      case 5:
LABEL_111:
        LOBYTE(a4) = __dst[0];
        return (double)*(unint64_t *)&a4;
      case 6:
        return (double)SLOBYTE(__dst[0]);
      case 7:
        LOWORD(a4) = __dst[0];
        v8 = (double)*(unint64_t *)&a4;
        goto LABEL_92;
      case 9:
      case 44:
        v7 = SLOWORD(__dst[0]);
        goto LABEL_91;
      case 11:
        *(float *)&a4 = (float)SLOWORD(__dst[0]);
        goto LABEL_28;
      case 12:
        LOWORD(a4) = __dst[0];
        v8 = (double)*(unint64_t *)&a4;
        goto LABEL_86;
      case 13:
        LOWORD(a4) = __dst[0];
        v8 = (double)*(unint64_t *)&a4;
        goto LABEL_71;
      case 14:
      case 22:
        LOWORD(a4) = __dst[0];
        v8 = (double)*(unint64_t *)&a4;
        goto LABEL_74;
      case 15:
        LOWORD(a4) = __dst[0];
        v8 = (double)*(unint64_t *)&a4;
        goto LABEL_77;
      case 16:
        LOWORD(a4) = __dst[0];
        v8 = (double)*(unint64_t *)&a4;
        goto LABEL_83;
      case 17:
        LOWORD(a4) = __dst[0];
        v8 = (double)*(unint64_t *)&a4;
        goto LABEL_89;
      case 18:
        LOWORD(a4) = __dst[0];
        v8 = (double)*(unint64_t *)&a4;
        goto LABEL_80;
      case 19:
        LOWORD(a4) = __dst[0];
        v8 = (double)*(unint64_t *)&a4;
        goto LABEL_106;
      case 20:
        LOWORD(a4) = __dst[0];
        a4 = (double)*(unint64_t *)&a4;
        v10 = 0.25;
        goto LABEL_25;
      case 21:
        LOWORD(a4) = __dst[0];
        *(float *)&a4 = (double)*(unint64_t *)&a4 * 0.25;
        goto LABEL_28;
      case 24:
        LOWORD(a4) = __dst[0];
        a4 = (double)*(unint64_t *)&a4;
        v10 = 0.00390625;
LABEL_25:
        *(float *)&a4 = a4 * v10;
        goto LABEL_30;
      case 25:
        LOWORD(a4) = __dst[0];
        *(float *)&a4 = (float)LODWORD(a4);
        v11 = 10000.0;
        goto LABEL_32;
      case 26:
        LOWORD(a4) = __dst[0];
        *(float *)&a4 = (float)LODWORD(a4);
LABEL_28:
        v12 = 1148846080;
        goto LABEL_31;
      case 27:
        LOWORD(a4) = __dst[0];
        *(float *)&a4 = (float)LODWORD(a4);
LABEL_30:
        v12 = 1120403456;
LABEL_31:
        v11 = *(float *)&v12;
LABEL_32:
        v13 = *(float *)&a4 / v11;
        goto LABEL_122;
      case 29:
      case 52:
        return (double)SLOWORD(__dst[0]);
      case 31:
      case 102:
LABEL_110:
        a4 = *(double *)__dst;
        return (double)*(unint64_t *)&a4;
      case 33:
        LOWORD(a4) = __dst[0];
        v8 = (double)*(unint64_t *)&a4;
        goto LABEL_97;
      case 36:
        v14 = DiagnosticLogHandleForCategory(6);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v36 = 67110912;
          v37 = LOBYTE(__dst[0]);
          v38 = 1024;
          v39 = BYTE1(__dst[0]);
          v40 = 1024;
          v41 = BYTE2(__dst[0]);
          v42 = 1024;
          v43 = BYTE3(__dst[0]);
          v44 = 1024;
          v45 = BYTE4(__dst[0]);
          v46 = 1024;
          v47 = BYTE5(__dst[0]);
          v48 = 1024;
          v49 = BYTE6(__dst[0]);
          v50 = 1024;
          v51 = HIBYTE(__dst[0]);
          _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Value = %c%c%c%c%c%c%c%c\n", (uint8_t *)&v36, 0x32u);
        }

        v16 = DiagnosticLogHandleForCategory(6);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v36 = 67109120;
          v37 = LOBYTE(__dst[0]);
          _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Value2 = %c\n", (uint8_t *)&v36, 8u);
        }

        return v4;
      case 37:
        v18 = SLOWORD(__dst[0]);
        goto LABEL_70;
      case 38:
        v19 = SLOWORD(__dst[0]);
        goto LABEL_73;
      case 39:
        v20 = SLOWORD(__dst[0]);
        goto LABEL_76;
      case 40:
        v21 = SLOWORD(__dst[0]);
        goto LABEL_79;
      case 41:
        v22 = SLOWORD(__dst[0]);
        goto LABEL_82;
      case 42:
        v23 = SLOWORD(__dst[0]);
        goto LABEL_85;
      case 43:
        v24 = SLOWORD(__dst[0]);
        goto LABEL_88;
      case 45:
        v25 = SLOWORD(__dst[0]);
        goto LABEL_94;
      case 46:
        v26 = SLOWORD(__dst[0]);
        goto LABEL_96;
      case 47:
        v27 = SLOWORD(__dst[0]);
        goto LABEL_99;
      case 48:
        v28 = SLOWORD(__dst[0]);
        goto LABEL_101;
      case 49:
        v29 = SLOWORD(__dst[0]);
        goto LABEL_103;
      case 50:
        v30 = SLOWORD(__dst[0]);
        goto LABEL_105;
      case 51:
        v31 = SLOWORD(__dst[0]);
        goto LABEL_108;
      case 53:
        v8 = (double)SLODWORD(__dst[0]);
        v32 = 0x3E00000000000000;
        goto LABEL_119;
      case 54:
        v8 = (double)SLODWORD(__dst[0]);
        v32 = 0x3E10000000000000;
        goto LABEL_119;
      case 55:
        v8 = (double)SLODWORD(__dst[0]);
        v32 = 0x3E20000000000000;
        goto LABEL_119;
      case 56:
        v8 = (double)SLODWORD(__dst[0]);
        v32 = 0x3E30000000000000;
        goto LABEL_119;
      case 57:
        v8 = (double)SLODWORD(__dst[0]);
        v32 = 0x3E40000000000000;
        goto LABEL_119;
      case 58:
        v8 = (double)SLODWORD(__dst[0]);
        v32 = 0x3E50000000000000;
        goto LABEL_119;
      case 59:
        v8 = (double)SLODWORD(__dst[0]);
        v32 = 0x3E60000000000000;
        goto LABEL_119;
      case 60:
        v8 = (double)SLODWORD(__dst[0]);
        v32 = 0x3E70000000000000;
        goto LABEL_119;
      case 61:
        v8 = (double)SLODWORD(__dst[0]);
        v32 = 0x3E80000000000000;
        goto LABEL_119;
      case 62:
        v8 = (double)SLODWORD(__dst[0]);
        v32 = 0x3E90000000000000;
        goto LABEL_119;
      case 63:
        v33 = (double)SLODWORD(__dst[0]) / 2097408.0;
        goto LABEL_121;
      case 64:
        v8 = (double)SLODWORD(__dst[0]);
        v32 = 0x3EB0000000000000;
        goto LABEL_119;
      case 65:
        v8 = (double)SLODWORD(__dst[0]);
        v32 = 0x3EC0000000000000;
        goto LABEL_119;
      case 66:
        v8 = (double)SLODWORD(__dst[0]);
        v32 = 0x3ED0000000000000;
        goto LABEL_119;
      case 67:
        v8 = (double)SLODWORD(__dst[0]);
        v32 = 0x3EE0000000000000;
        goto LABEL_119;
      case 68:
        v8 = (double)SLODWORD(__dst[0]);
        goto LABEL_118;
      case 69:
        v18 = __dst[0];
LABEL_70:
        v8 = (double)v18;
LABEL_71:
        v32 = 0x3F00000000000000;
        goto LABEL_119;
      case 70:
        v19 = __dst[0];
LABEL_73:
        v8 = (double)v19;
LABEL_74:
        v32 = 0x3F10000000000000;
        goto LABEL_119;
      case 71:
        v20 = __dst[0];
LABEL_76:
        v8 = (double)v20;
LABEL_77:
        v32 = 0x3F20000000000000;
        goto LABEL_119;
      case 72:
        v21 = __dst[0];
LABEL_79:
        v8 = (double)v21;
LABEL_80:
        v32 = 0x3F30000000000000;
        goto LABEL_119;
      case 73:
        v22 = __dst[0];
LABEL_82:
        v8 = (double)v22;
LABEL_83:
        v32 = 0x3F40000000000000;
        goto LABEL_119;
      case 74:
        v23 = __dst[0];
LABEL_85:
        v8 = (double)v23;
LABEL_86:
        v32 = 0x3F50000000000000;
        goto LABEL_119;
      case 75:
        v24 = __dst[0];
LABEL_88:
        v8 = (double)v24;
LABEL_89:
        v32 = 0x3F60000000000000;
        goto LABEL_119;
      case 76:
        v7 = __dst[0];
LABEL_91:
        v8 = (double)v7;
LABEL_92:
        v32 = 0x3F70000000000000;
        goto LABEL_119;
      case 78:
        v25 = __dst[0];
LABEL_94:
        v8 = (double)v25;
        v32 = 0x3F80000000000000;
        goto LABEL_119;
      case 79:
        v26 = __dst[0];
LABEL_96:
        v8 = (double)v26;
LABEL_97:
        v32 = 0x3F90000000000000;
        goto LABEL_119;
      case 80:
        v27 = __dst[0];
LABEL_99:
        v8 = (double)v27;
        v32 = 0x3FA0000000000000;
        goto LABEL_119;
      case 81:
        v28 = __dst[0];
LABEL_101:
        v8 = (double)v28;
        goto LABEL_114;
      case 82:
        v29 = __dst[0];
LABEL_103:
        v8 = (double)v29;
        v34 = 0.125;
        goto LABEL_120;
      case 83:
        v30 = __dst[0];
LABEL_105:
        v8 = (double)v30;
LABEL_106:
        v34 = 0.25;
        goto LABEL_120;
      case 84:
        v31 = __dst[0];
LABEL_108:
        v8 = (double)v31;
        v34 = 0.5;
        goto LABEL_120;
      case 85:
      case 100:
        return (double)SLODWORD(__dst[0]);
      case 87:
        switch(v5)
        {
          case 1:
            goto LABEL_111;
          case 2:
            goto LABEL_5;
          case 4:
          case 8:
            goto LABEL_110;
          default:
            return v4;
        }
        return v4;
      case 90:
        LOWORD(a4) = __dst[0];
        v8 = (double)*(unint64_t *)&a4;
LABEL_114:
        v32 = 0x3FB0000000000000;
        goto LABEL_119;
      case 91:
        v13 = *(float *)__dst;
        goto LABEL_122;
      case 101:
        return (double)__dst[0];
      case 103:
        v8 = (double)__dst[0];
LABEL_118:
        v32 = 0x3EF0000000000000;
LABEL_119:
        v34 = *(double *)&v32;
LABEL_120:
        v33 = v8 * v34;
LABEL_121:
        v13 = v33;
LABEL_122:
        v4 = v13;
        break;
      default:
        return v4;
    }
  }
  return v4;
}

uint64_t translateFloatToFixed(uint64_t result, char *__dst, size_t a3, float a4)
{
  long double v5;
  long double v6;
  int v7;
  int v8;
  float v9;
  _QWORD __src[2];

  __src[0] = 0;
  __src[1] = 0;
  switch((int)result)
  {
    case 1:
      return result;
    case 3:
    case 29:
      v7 = (int)a4;
      v8 = (int)a4 + 255;
      if ((int)a4 >= 0)
        BYTE1(v8) = (unsigned __int16)(int)a4 >> 8;
      __dst[1] = BYTE1(v8);
      goto LABEL_23;
    case 5:
    case 6:
      __dst[3] = 0;
      *(_WORD *)(__dst + 1) = 0;
      v7 = (int)a4;
LABEL_23:
      *__dst = v7;
      goto LABEL_29;
    case 7:
    case 9:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 33:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 90:
    case 94:
    case 95:
    case 97:
    case 99:
      v5 = 0.0;
      switch((int)result)
      {
        case 7:
        case 9:
        case 44:
          v5 = 8.0;
          break;
        case 8:
        case 10:
        case 11:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:
        case 26:
        case 27:
        case 28:
        case 29:
        case 30:
        case 31:
        case 32:
        case 34:
        case 35:
        case 36:
          break;
        case 12:
        case 42:
          v5 = 10.0;
          break;
        case 13:
        case 37:
          v5 = 15.0;
          break;
        case 14:
        case 38:
          v5 = 14.0;
          break;
        case 15:
        case 39:
          v5 = 13.0;
          break;
        case 16:
        case 41:
          v5 = 11.0;
          break;
        case 17:
        case 43:
          v5 = 9.0;
          break;
        case 18:
        case 40:
          v5 = 12.0;
          break;
        case 19:
        case 50:
          v5 = 2.0;
          break;
        case 33:
        case 46:
          v5 = 6.0;
          break;
        case 45:
LABEL_27:
          v5 = 7.0;
          break;
        case 47:
LABEL_26:
          v5 = 5.0;
          break;
        case 48:
LABEL_9:
          v5 = 4.0;
          break;
        case 49:
LABEL_25:
          v5 = 3.0;
          break;
        case 51:
LABEL_24:
          v5 = 1.0;
          break;
        default:
          switch((int)result)
          {
            case 'Z':
              goto LABEL_9;
            case '^':
              goto LABEL_24;
            case '_':
              goto LABEL_25;
            case 'a':
              goto LABEL_26;
            case 'c':
              goto LABEL_27;
            default:
              goto LABEL_28;
          }
      }
LABEL_28:
      v9 = exp2(v5) * a4;
      __src[0] = (int)v9;
      *(_WORD *)__dst = (int)v9;
      goto LABEL_29;
    case 31:
    case 100:
      goto LABEL_7;
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 78:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
      v6 = 0.0;
      if ((result - 53) <= 0x1F)
        v6 = dbl_10450[(int)result - 53];
      a4 = exp2(v6) * a4;
LABEL_7:
      __src[0] = (int)a4;
      *(_DWORD *)__dst = (int)a4;
      goto LABEL_29;
    case 87:
      __src[0] = (int)a4;
      if ((int)a3 >= 1)
      {
        if ((int)a3 >= 8)
          a3 = 8;
        else
          a3 = a3;
        memcpy(__dst, __src, a3);
      }
      goto LABEL_29;
    case 91:
      *(float *)__dst = a4;
LABEL_29:
      result = 1;
      break;
    default:
      result = 0xFFFFFFFFLL;
      break;
  }
  return result;
}

id DiagnosticLogHandleForCategory(uint64_t a1)
{
  void *v2;

  if (DiagnosticLogHandleForCategory_onceToken != -1)
    dispatch_once(&DiagnosticLogHandleForCategory_onceToken, &__block_literal_global);
  if (DiagnosticLogHandleForCategory_logHandles[a1])
    v2 = (void *)DiagnosticLogHandleForCategory_logHandles[a1];
  else
    v2 = &_os_log_disabled;
  return v2;
}

void sub_3860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_50F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_539C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  id *v20;
  uint64_t v21;

  objc_destroyWeak(v20);
  _Block_object_dispose(&a20, 8);
  objc_destroyWeak((id *)(v21 - 72));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_587C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

id buttonHIDEventFilterCallback(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  int IntegerValue;
  int v11;
  uint64_t v12;
  uint64_t v13;
  char Phase;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  int v34;
  id v35;
  uint64_t v37;
  int v38;
  int v39;
  void *v40;
  void *v41;
  unsigned int v42;

  v6 = DiagnosticLogHandleForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    buttonHIDEventFilterCallback_cold_1(a4, v7);

  v8 = a2;
  v9 = v8;
  if (!v8 || !objc_msgSend(v8, "allowEvents"))
    goto LABEL_38;
  if (IOHIDEventGetType(a4) != 3)
  {
    if (IOHIDEventGetType(a4) == 29)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_handlersForEvent:", 0x400000));
      if (objc_msgSend(v25, "count"))
      {
        v26 = v9;
        v27 = v25;
        v28 = 0x400000;
LABEL_37:
        v35 = objc_msgSend(v26, "_triggerHandlers:event:", v27, v28);
        goto LABEL_40;
      }
      goto LABEL_39;
    }
    if (IOHIDEventGetType(a4) == 32)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_handlersForEvent:", 0x800000));
      if (objc_msgSend(v25, "count"))
      {
        v26 = v9;
        v27 = v25;
        v28 = 0x800000;
        goto LABEL_37;
      }
LABEL_39:
      v35 = 0;
      goto LABEL_40;
    }
LABEL_38:
    v25 = 0;
    goto LABEL_39;
  }
  IntegerValue = IOHIDEventGetIntegerValue(a4, 196608);
  v11 = IOHIDEventGetIntegerValue(a4, 196609);
  v12 = IOHIDEventGetIntegerValue(a4, 196610);
  v13 = IOHIDEventGetIntegerValue(a4, 196613);
  Phase = IOHIDEventGetPhase(a4);
  v15 = v11 | (IntegerValue << 16);
  v16 = 1;
  if (v15 > 786527)
  {
    if (v15 <= 786665)
    {
      v29 = 0x10000;
      if (!v12)
        v29 = 0x20000;
      v30 = 4096;
      if (!v12)
        v30 = 0x2000;
      v31 = 64;
      if (!v12)
        v31 = 128;
      if (v15 == 786665)
      {
        v16 = v31;
        v32 = 1;
      }
      else
      {
        v32 = 0;
      }
      if (v15 == 786581)
      {
        v16 = v30;
        v32 = 1;
      }
      if (v15 == 786528)
        v33 = v29;
      else
        v33 = v16;
      if (v15 == 786528)
        v34 = 1;
      else
        v34 = v32;
      goto LABEL_68;
    }
    v17 = 786666;
    v18 = 256;
    if (!v12)
      v18 = 512;
    v19 = 786979;
    v20 = 0x100000;
    if (!v12)
      v20 = 0x200000;
    v21 = 9437217;
    v22 = v12 == 0;
    v23 = 0x1000000;
    v24 = 0x2000000;
  }
  else
  {
    if (v15 > 786435)
    {
      v17 = 786436;
      v18 = 0x40000;
      if (!v12)
        v18 = 0x80000;
      v19 = 786480;
      v20 = 16;
      if (v12)
      {
        v37 = 1;
      }
      else
      {
        v20 = 32;
        v37 = 2;
      }
      if (v15 == 786496)
      {
        v16 = v37;
        v38 = 1;
      }
      else
      {
        v38 = 0;
      }
      goto LABEL_59;
    }
    v17 = 65670;
    v18 = 0x4000;
    if (!v12)
      v18 = 0x8000;
    v19 = 720941;
    v20 = 0x10000000;
    if (!v12)
      v20 = 0x20000000;
    v21 = 720942;
    v22 = v12 == 0;
    v23 = 4;
    v24 = 8;
  }
  if (v22)
    v23 = v24;
  if (v15 == v21)
  {
    v16 = v23;
    v38 = 1;
  }
  else
  {
    v38 = 0;
  }
LABEL_59:
  if (v15 == v19)
  {
    v16 = v20;
    v39 = 1;
  }
  else
  {
    v39 = v38;
  }
  if (v15 == v17)
    v33 = v18;
  else
    v33 = v16;
  if (v15 == v17)
    v34 = 1;
  else
    v34 = v39;
LABEL_68:
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_handlersForEvent:", v33));
  v25 = v40;
  if (v34)
  {
    v35 = 0;
    if (objc_msgSend(v40, "count") && !v13 && (Phase & 4) == 0)
      v35 = objc_msgSend(v9, "_triggerHandlers:event:", v25, v33);
  }
  else
  {
    v35 = 0;
  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "testAutomation"));
  v42 = v34 & objc_msgSend(v41, "testAutomationEnabled");

  if (v42 == 1 && (_DWORD)v35 && !v12)
  {
    UIAccessibilityPostNotification(0xFA2u, &off_1C110);
    v35 = &dword_0 + 1;
  }
LABEL_40:

  return v35;
}

void sub_5EFC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_86A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_8C5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_9980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

uint64_t DSArchiveOpen()
{
  return 0;
}

uint64_t DSArchiveClose()
{
  return 0;
}

uint64_t DSArchiveWrite(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "dataBuffer"));
  objc_msgSend(v6, "appendBytes:length:", a3, a4);

  return a4;
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return archive_error_string(a1, a2, a3, a4);
}

int *OUTLINED_FUNCTION_9()
{
  return __error();
}

char *OUTLINED_FUNCTION_10(int *a1)
{
  return strerror(*a1);
}

void callIOFunction_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "SMC::callIOFunction unrecognized index: %d", (uint8_t *)v2, 8u);
}

void buttonHIDEventFilterCallback_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "[HID Event] %@", (uint8_t *)&v2, 0xCu);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGColor");
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByDeletingLastPathComponent");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__addDirectoryToContents_searchQueue_flatten_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addDirectoryToContents:searchQueue:flatten:error:");
}

id objc_msgSend__addFile_archive_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addFile:archive:error:");
}

id objc_msgSend__addPathToContents_searchQueue_flatten_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addPathToContents:searchQueue:flatten:error:");
}

id objc_msgSend__fillCallLogWithMissingDays_fromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fillCallLogWithMissingDays:fromDate:");
}

id objc_msgSend__flushAccumulatedLogDataWithDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_flushAccumulatedLogDataWithDate:");
}

id objc_msgSend__getAndValidateDateFromLogLine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getAndValidateDateFromLogLine:");
}

id objc_msgSend__getDaysBetween_and_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getDaysBetween:and:");
}

id objc_msgSend__handlersForEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handlersForEvent:");
}

id objc_msgSend__handlersForTarget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handlersForTarget:");
}

id objc_msgSend__isDateInRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isDateInRange:");
}

id objc_msgSend__resetAccumulator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resetAccumulator");
}

id objc_msgSend__setFormatOnArchive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setFormatOnArchive:");
}

id objc_msgSend__sharedSerialQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sharedSerialQueue");
}

id objc_msgSend__triggerHandlers_event_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_triggerHandlers:event:");
}

id objc_msgSend__writeArchive_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_writeArchive:error:");
}

id objc_msgSend_accessoryCapabilities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryCapabilities");
}

id objc_msgSend_accessoryModel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryModel");
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "action");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addURL_prefix_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addURL:prefix:error:");
}

id objc_msgSend_addURL_prefix_flatten_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addURL:prefix:flatten:error:");
}

id objc_msgSend_advanceToNextLine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "advanceToNextLine:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allowEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowEvents");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anyObject");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendData:");
}

id objc_msgSend_archiveAsFileUsingDescriptor_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archiveAsFileUsingDescriptor:error:");
}

id objc_msgSend_archiveAsTempFileWithTemplate_directory_suffix_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archiveAsTempFileWithTemplate:directory:suffix:error:");
}

id objc_msgSend_archiveAsTempFileWithTemplate_suffix_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archiveAsTempFileWithTemplate:suffix:error:");
}

id objc_msgSend_archivePathWithSource_prefix_root_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivePathWithSource:prefix:root:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_autoupdatingCurrentLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "autoupdatingCurrentLocale");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bufferSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bufferSize");
}

id objc_msgSend_buttonEventHandlers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonEventHandlers");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_callLog(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callLog");
}

id objc_msgSend_closeAppleSMC(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeAppleSMC");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorWithRed:green:blue:alpha:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_connectedAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedAccessories");
}

id objc_msgSend_connectionID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionID");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyItemAtURL:toURL:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_currentLineIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentLineIndex");
}

id objc_msgSend_currentOffset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentOffset");
}

id objc_msgSend_currentProcessHasEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentProcessHasEntitlement:");
}

id objc_msgSend_dataBuffer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataBuffer");
}

id objc_msgSend_dataPort(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataPort");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithCapacity:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateFormatters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateFormatters");
}

id objc_msgSend_dateFromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateFromString:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "device");
}

id objc_msgSend_deviceMatchingAccessories_identifierMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceMatchingAccessories:identifierMask:");
}

id objc_msgSend_deviceWithAccessory_identifierMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceWithAccessory:identifierMask:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "end");
}

id objc_msgSend_enumerateLogLinesWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateLogLinesWithBlock:");
}

id objc_msgSend_enumerateLogLinesWithIDs_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateLogLinesWithIDs:usingBlock:");
}

id objc_msgSend_enumerateUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateUsingBlock:");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_eventHandlerChangeLock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventHandlerChangeLock");
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventType");
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "events");
}

id objc_msgSend_exception(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exception");
}

id objc_msgSend_extractEntry_toArchive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extractEntry:toArchive:");
}

id objc_msgSend_extractLine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extractLine:");
}

id objc_msgSend_fields(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fields");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandle");
}

id objc_msgSend_fileHandleForReadingAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleForReadingAtPath:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_firmwareRevision(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firmwareRevision");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "format");
}

id objc_msgSend_formatterWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formatterWithType:");
}

id objc_msgSend_futureDateDetected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "futureDateDetected");
}

id objc_msgSend_generationComplete(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generationComplete");
}

id objc_msgSend_generationLock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generationLock");
}

id objc_msgSend_getFileSystemRepresentation_maxLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getFileSystemRepresentation:maxLength:");
}

id objc_msgSend_getLogFiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLogFiles");
}

id objc_msgSend_getOffsetAtLineIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getOffsetAtLineIndex:");
}

id objc_msgSend_hardwareRevision(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hardwareRevision");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_identifierForAccessoryModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifierForAccessoryModel:");
}

id objc_msgSend_identifierForIOHIDDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifierForIOHIDDevice:");
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "info");
}

id objc_msgSend_initWithAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAccessory:");
}

id objc_msgSend_initWithAccessoryModel_usagePage_usage_vendorID_productID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAccessoryModel:usagePage:usage:vendorID:productID:");
}

id objc_msgSend_initWithBytes_length_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:encoding:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDeviceIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDeviceIdentifiers:");
}

id objc_msgSend_initWithDeviceIdentifiers_identifierMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDeviceIdentifiers:identifierMask:");
}

id objc_msgSend_initWithFilePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFilePath:");
}

id objc_msgSend_initWithFilePath_withBufferSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFilePath:withBufferSize:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithLine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLine:");
}

id objc_msgSend_initWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLocaleIdentifier:");
}

id objc_msgSend_initWithLogIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLogIDs:");
}

id objc_msgSend_initWithModelNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithModelNumber:");
}

id objc_msgSend_initWithSerialNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSerialNumber:");
}

id objc_msgSend_initWithSource_prefix_root_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSource:prefix:root:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerFromFieldAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerFromFieldAtIndex:");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_isConnectionOpen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isConnectionOpen");
}

id objc_msgSend_isEnumerating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEnumerating");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToHandler:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isTrapEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTrapEvent");
}

id objc_msgSend_isUsable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUsable");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_lineBreak(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lineBreak");
}

id objc_msgSend_linePositions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "linePositions");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lock");
}

id objc_msgSend_logFiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logFiles");
}

id objc_msgSend_logFilesFromEnumerator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logFilesFromEnumerator:");
}

id objc_msgSend_logIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logIDs");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_macAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "macAddress");
}

id objc_msgSend_methodForSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "methodForSelector:");
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_missingDaysRemaining(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "missingDaysRemaining");
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelNumber");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_offsetInFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "offsetInFile");
}

id objc_msgSend_outOfOrderDateDetected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outOfOrderDateDetected");
}

id objc_msgSend_parseDetailsWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseDetailsWithURL:");
}

id objc_msgSend_parseHeadersWithLine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseHeadersWithLine:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_prefix(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prefix");
}

id objc_msgSend_preventPropagation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preventPropagation");
}

id objc_msgSend_productID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productID");
}

id objc_msgSend_rangeOfData_options_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfData:options:range:");
}

id objc_msgSend_readDataOfLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDataOfLength:");
}

id objc_msgSend_referenceDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "referenceDate");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_resetEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetEnumerator");
}

id objc_msgSend_root(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "root");
}

id objc_msgSend_scanHexInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanHexInt:");
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scannerWithString:");
}

id objc_msgSend_searchForNextLineFromCurrentPosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchForNextLineFromCurrentPosition:");
}

id objc_msgSend_seekToFileOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seekToFileOffset:");
}

id objc_msgSend_seekToOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seekToOffset:");
}

id objc_msgSend_sendAnalyticsWithEvent_payloadDict_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendAnalyticsWithEvent:payloadDict:");
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialNumber");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAction:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderColor:");
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderWidth:");
}

id objc_msgSend_setCancelled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCancelled:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCurrentLineIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentLineIndex:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateStyle:");
}

id objc_msgSend_setDoesRelativeDateFormatting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDoesRelativeDateFormatting:");
}

id objc_msgSend_setEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEvents:");
}

id objc_msgSend_setFormatterBehavior_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFormatterBehavior:");
}

id objc_msgSend_setFutureDateDetected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFutureDateDetected:");
}

id objc_msgSend_setGenerationComplete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGenerationComplete:");
}

id objc_msgSend_setIsEnumerating_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsEnumerating:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setMissingDaysRemaining_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMissingDaysRemaining:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOutOfOrderDateDetected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutOfOrderDateDetected:");
}

id objc_msgSend_setPreventPropagation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreventPropagation:");
}

id objc_msgSend_setSkipCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSkipCount:");
}

id objc_msgSend_setTarget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTarget:");
}

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeStyle:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setType:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_sharedAccessoryManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedAccessoryManager");
}

id objc_msgSend_sharedFormatter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedFormatter");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_signal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signal");
}

id objc_msgSend_skipCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skipCount");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sortedArrayUsingDescriptors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingDescriptors:");
}

id objc_msgSend_sourceUrl(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourceUrl");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringFromFieldAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromFieldAtIndex:");
}

id objc_msgSend_stringWithFileSystemRepresentation_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFileSystemRepresentation:length:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subdataWithRange:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_systemClientCreationQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemClientCreationQueue");
}

id objc_msgSend_systemLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemLocale");
}

id objc_msgSend_tableOfContents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableOfContents");
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "target");
}

id objc_msgSend_targetQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetQueue");
}

id objc_msgSend_testAutomation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testAutomation");
}

id objc_msgSend_testAutomationEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testAutomationEnabled");
}

id objc_msgSend_textFileWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textFileWithPath:");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeZoneForSecondsFromGMT_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeZoneForSecondsFromGMT:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlock");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "url");
}

id objc_msgSend_usage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usage");
}

id objc_msgSend_usagePage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usagePage");
}

id objc_msgSend_vendorID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vendorID");
}

id objc_msgSend_wait(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wait");
}
