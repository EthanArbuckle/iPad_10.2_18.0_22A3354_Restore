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
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  size_t v13[2];
  uint8_t buf[4];
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  DiagnosticLogHandleForCategory(6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a1 == 2)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&dword_21F54F000, v9, OS_LOG_TYPE_DEFAULT, "SMC::callIOFunction kSMCHandleYPCEvent command", (uint8_t *)v13, 2u);
    }

    v13[0] = 168;
    v10 = IOConnectCallStructMethod(a2, 2u, a3, 0xA8uLL, a4, v13);
    DiagnosticLogHandleForCategory(6);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v15 = v10;
      _os_log_impl(&dword_21F54F000, v11, OS_LOG_TYPE_DEFAULT, "SMC::callIOFunction IOConnectCallStructMethod result = %d", buf, 8u);
    }

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      callIOFunction_cold_1(a1, v9);

    return 3758097084;
  }
  return v10;
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
  NSObject *v4;
  _DWORD v6[2];
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
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
  DiagnosticLogHandleForCategory(6);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109632;
    v6[1] = a1;
    v7 = 1024;
    v8 = v2;
    v9 = 1024;
    v10 = 38;
    _os_log_impl(&dword_21F54F000, v4, OS_LOG_TYPE_DEFAULT, "SMC::convertValue value %u result %d %d", (uint8_t *)v6, 0x14u);
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
  NSObject *v14;
  NSObject *v15;
  int v16;
  int v17;
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
  uint64_t v30;
  double v31;
  double v32;
  int v34;
  int v35;
  __int16 v36;
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
  _QWORD __dst[3];

  __dst[2] = *MEMORY[0x24BDAC8D0];
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
        DiagnosticLogHandleForCategory(6);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v34 = 67110912;
          v35 = LOBYTE(__dst[0]);
          v36 = 1024;
          v37 = BYTE1(__dst[0]);
          v38 = 1024;
          v39 = BYTE2(__dst[0]);
          v40 = 1024;
          v41 = BYTE3(__dst[0]);
          v42 = 1024;
          v43 = BYTE4(__dst[0]);
          v44 = 1024;
          v45 = BYTE5(__dst[0]);
          v46 = 1024;
          v47 = BYTE6(__dst[0]);
          v48 = 1024;
          v49 = HIBYTE(__dst[0]);
          _os_log_impl(&dword_21F54F000, v14, OS_LOG_TYPE_DEFAULT, "Value = %c%c%c%c%c%c%c%c\n", (uint8_t *)&v34, 0x32u);
        }

        DiagnosticLogHandleForCategory(6);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v34 = 67109120;
          v35 = LOBYTE(__dst[0]);
          _os_log_impl(&dword_21F54F000, v15, OS_LOG_TYPE_DEFAULT, "Value2 = %c\n", (uint8_t *)&v34, 8u);
        }

        return v4;
      case 37:
        v16 = SLOWORD(__dst[0]);
        goto LABEL_70;
      case 38:
        v17 = SLOWORD(__dst[0]);
        goto LABEL_73;
      case 39:
        v18 = SLOWORD(__dst[0]);
        goto LABEL_76;
      case 40:
        v19 = SLOWORD(__dst[0]);
        goto LABEL_79;
      case 41:
        v20 = SLOWORD(__dst[0]);
        goto LABEL_82;
      case 42:
        v21 = SLOWORD(__dst[0]);
        goto LABEL_85;
      case 43:
        v22 = SLOWORD(__dst[0]);
        goto LABEL_88;
      case 45:
        v23 = SLOWORD(__dst[0]);
        goto LABEL_94;
      case 46:
        v24 = SLOWORD(__dst[0]);
        goto LABEL_96;
      case 47:
        v25 = SLOWORD(__dst[0]);
        goto LABEL_99;
      case 48:
        v26 = SLOWORD(__dst[0]);
        goto LABEL_101;
      case 49:
        v27 = SLOWORD(__dst[0]);
        goto LABEL_103;
      case 50:
        v28 = SLOWORD(__dst[0]);
        goto LABEL_105;
      case 51:
        v29 = SLOWORD(__dst[0]);
        goto LABEL_108;
      case 53:
        v8 = (double)SLODWORD(__dst[0]);
        v30 = 0x3E00000000000000;
        goto LABEL_119;
      case 54:
        v8 = (double)SLODWORD(__dst[0]);
        v30 = 0x3E10000000000000;
        goto LABEL_119;
      case 55:
        v8 = (double)SLODWORD(__dst[0]);
        v30 = 0x3E20000000000000;
        goto LABEL_119;
      case 56:
        v8 = (double)SLODWORD(__dst[0]);
        v30 = 0x3E30000000000000;
        goto LABEL_119;
      case 57:
        v8 = (double)SLODWORD(__dst[0]);
        v30 = 0x3E40000000000000;
        goto LABEL_119;
      case 58:
        v8 = (double)SLODWORD(__dst[0]);
        v30 = 0x3E50000000000000;
        goto LABEL_119;
      case 59:
        v8 = (double)SLODWORD(__dst[0]);
        v30 = 0x3E60000000000000;
        goto LABEL_119;
      case 60:
        v8 = (double)SLODWORD(__dst[0]);
        v30 = 0x3E70000000000000;
        goto LABEL_119;
      case 61:
        v8 = (double)SLODWORD(__dst[0]);
        v30 = 0x3E80000000000000;
        goto LABEL_119;
      case 62:
        v8 = (double)SLODWORD(__dst[0]);
        v30 = 0x3E90000000000000;
        goto LABEL_119;
      case 63:
        v31 = (double)SLODWORD(__dst[0]) / 2097408.0;
        goto LABEL_121;
      case 64:
        v8 = (double)SLODWORD(__dst[0]);
        v30 = 0x3EB0000000000000;
        goto LABEL_119;
      case 65:
        v8 = (double)SLODWORD(__dst[0]);
        v30 = 0x3EC0000000000000;
        goto LABEL_119;
      case 66:
        v8 = (double)SLODWORD(__dst[0]);
        v30 = 0x3ED0000000000000;
        goto LABEL_119;
      case 67:
        v8 = (double)SLODWORD(__dst[0]);
        v30 = 0x3EE0000000000000;
        goto LABEL_119;
      case 68:
        v8 = (double)SLODWORD(__dst[0]);
        goto LABEL_118;
      case 69:
        v16 = __dst[0];
LABEL_70:
        v8 = (double)v16;
LABEL_71:
        v30 = 0x3F00000000000000;
        goto LABEL_119;
      case 70:
        v17 = __dst[0];
LABEL_73:
        v8 = (double)v17;
LABEL_74:
        v30 = 0x3F10000000000000;
        goto LABEL_119;
      case 71:
        v18 = __dst[0];
LABEL_76:
        v8 = (double)v18;
LABEL_77:
        v30 = 0x3F20000000000000;
        goto LABEL_119;
      case 72:
        v19 = __dst[0];
LABEL_79:
        v8 = (double)v19;
LABEL_80:
        v30 = 0x3F30000000000000;
        goto LABEL_119;
      case 73:
        v20 = __dst[0];
LABEL_82:
        v8 = (double)v20;
LABEL_83:
        v30 = 0x3F40000000000000;
        goto LABEL_119;
      case 74:
        v21 = __dst[0];
LABEL_85:
        v8 = (double)v21;
LABEL_86:
        v30 = 0x3F50000000000000;
        goto LABEL_119;
      case 75:
        v22 = __dst[0];
LABEL_88:
        v8 = (double)v22;
LABEL_89:
        v30 = 0x3F60000000000000;
        goto LABEL_119;
      case 76:
        v7 = __dst[0];
LABEL_91:
        v8 = (double)v7;
LABEL_92:
        v30 = 0x3F70000000000000;
        goto LABEL_119;
      case 78:
        v23 = __dst[0];
LABEL_94:
        v8 = (double)v23;
        v30 = 0x3F80000000000000;
        goto LABEL_119;
      case 79:
        v24 = __dst[0];
LABEL_96:
        v8 = (double)v24;
LABEL_97:
        v30 = 0x3F90000000000000;
        goto LABEL_119;
      case 80:
        v25 = __dst[0];
LABEL_99:
        v8 = (double)v25;
        v30 = 0x3FA0000000000000;
        goto LABEL_119;
      case 81:
        v26 = __dst[0];
LABEL_101:
        v8 = (double)v26;
        goto LABEL_114;
      case 82:
        v27 = __dst[0];
LABEL_103:
        v8 = (double)v27;
        v32 = 0.125;
        goto LABEL_120;
      case 83:
        v28 = __dst[0];
LABEL_105:
        v8 = (double)v28;
LABEL_106:
        v32 = 0.25;
        goto LABEL_120;
      case 84:
        v29 = __dst[0];
LABEL_108:
        v8 = (double)v29;
        v32 = 0.5;
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
        v30 = 0x3FB0000000000000;
        goto LABEL_119;
      case 91:
        v13 = *(float *)__dst;
        goto LABEL_122;
      case 101:
        return (double)__dst[0];
      case 103:
        v8 = (double)__dst[0];
LABEL_118:
        v30 = 0x3EF0000000000000;
LABEL_119:
        v32 = *(double *)&v30;
LABEL_120:
        v31 = v8 * v32;
LABEL_121:
        v13 = v31;
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
  _QWORD __src[3];

  __src[2] = *MEMORY[0x24BDAC8D0];
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
        v6 = dbl_21F55F450[(int)result - 53];
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
    v2 = (void *)MEMORY[0x24BDACB78];
  return v2;
}

void sub_21F552860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F5540F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
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

void sub_21F55439C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
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

void sub_21F55487C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

uint64_t buttonHIDEventFilterCallback(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  NSObject *v6;
  id v7;
  void *v8;
  int IntegerValue;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char Phase;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v36;
  int v37;
  int v38;
  void *v39;
  void *v40;
  int v41;

  DiagnosticLogHandleForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    buttonHIDEventFilterCallback_cold_1(a4, v6);

  v7 = a2;
  v8 = v7;
  if (!v7 || !objc_msgSend(v7, "allowEvents"))
    goto LABEL_38;
  if (IOHIDEventGetType() != 3)
  {
    if (IOHIDEventGetType() == 29)
    {
      objc_msgSend(v8, "_handlersForEvent:", 0x400000);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "count"))
      {
        v25 = v8;
        v26 = v24;
        v27 = 0x400000;
LABEL_37:
        v34 = objc_msgSend(v25, "_triggerHandlers:event:", v26, v27);
        goto LABEL_40;
      }
      goto LABEL_39;
    }
    if (IOHIDEventGetType() == 32)
    {
      objc_msgSend(v8, "_handlersForEvent:", 0x800000);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "count"))
      {
        v25 = v8;
        v26 = v24;
        v27 = 0x800000;
        goto LABEL_37;
      }
LABEL_39:
      v34 = 0;
      goto LABEL_40;
    }
LABEL_38:
    v24 = 0;
    goto LABEL_39;
  }
  IntegerValue = IOHIDEventGetIntegerValue();
  v10 = IOHIDEventGetIntegerValue();
  v11 = IOHIDEventGetIntegerValue();
  v12 = IOHIDEventGetIntegerValue();
  Phase = IOHIDEventGetPhase();
  v14 = v10 | (IntegerValue << 16);
  v15 = 1;
  if (v14 > 786527)
  {
    if (v14 <= 786665)
    {
      v28 = 0x10000;
      if (!v11)
        v28 = 0x20000;
      v29 = 4096;
      if (!v11)
        v29 = 0x2000;
      v30 = 64;
      if (!v11)
        v30 = 128;
      if (v14 == 786665)
      {
        v15 = v30;
        v31 = 1;
      }
      else
      {
        v31 = 0;
      }
      if (v14 == 786581)
      {
        v15 = v29;
        v31 = 1;
      }
      if (v14 == 786528)
        v32 = v28;
      else
        v32 = v15;
      if (v14 == 786528)
        v33 = 1;
      else
        v33 = v31;
      goto LABEL_68;
    }
    v16 = 786666;
    v17 = 256;
    if (!v11)
      v17 = 512;
    v18 = 786979;
    v19 = 0x100000;
    if (!v11)
      v19 = 0x200000;
    v20 = 9437217;
    v21 = v11 == 0;
    v22 = 0x1000000;
    v23 = 0x2000000;
  }
  else
  {
    if (v14 > 786435)
    {
      v16 = 786436;
      v17 = 0x40000;
      if (!v11)
        v17 = 0x80000;
      v18 = 786480;
      v19 = 16;
      if (v11)
      {
        v36 = 1;
      }
      else
      {
        v19 = 32;
        v36 = 2;
      }
      if (v14 == 786496)
      {
        v15 = v36;
        v37 = 1;
      }
      else
      {
        v37 = 0;
      }
      goto LABEL_59;
    }
    v16 = 65670;
    v17 = 0x4000;
    if (!v11)
      v17 = 0x8000;
    v18 = 720941;
    v19 = 0x10000000;
    if (!v11)
      v19 = 0x20000000;
    v20 = 720942;
    v21 = v11 == 0;
    v22 = 4;
    v23 = 8;
  }
  if (v21)
    v22 = v23;
  if (v14 == v20)
  {
    v15 = v22;
    v37 = 1;
  }
  else
  {
    v37 = 0;
  }
LABEL_59:
  if (v14 == v18)
  {
    v15 = v19;
    v38 = 1;
  }
  else
  {
    v38 = v37;
  }
  if (v14 == v16)
    v32 = v17;
  else
    v32 = v15;
  if (v14 == v16)
    v33 = 1;
  else
    v33 = v38;
LABEL_68:
  objc_msgSend(v8, "_handlersForEvent:", v32);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v39;
  if (v33)
  {
    v34 = 0;
    if (objc_msgSend(v39, "count") && !v12 && (Phase & 4) == 0)
      v34 = objc_msgSend(v8, "_triggerHandlers:event:", v24, v32);
  }
  else
  {
    v34 = 0;
  }
  objc_msgSend(v8, "testAutomation");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v33 & objc_msgSend(v40, "testAutomationEnabled");

  if (v41 == 1 && (_DWORD)v34 && !v11)
  {
    UIAccessibilityPostNotification(0xFA2u, &unk_24E44DCF0);
    v34 = 1;
  }
LABEL_40:

  return v34;
}

void sub_21F554EFC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_21F5576A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_21F557C5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F558980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
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

  objc_msgSend(a2, "dataBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
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

uint64_t OUTLINED_FUNCTION_6()
{
  return archive_error_string();
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
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21F54F000, a2, OS_LOG_TYPE_ERROR, "SMC::callIOFunction unrecognized index: %d", (uint8_t *)v2, 8u);
}

void buttonHIDEventFilterCallback_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_21F54F000, a2, OS_LOG_TYPE_DEBUG, "[HID Event] %@", (uint8_t *)&v2, 0xCu);
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7F08](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

IOReturn IOHIDDeviceClose(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x24BDD8018](device, *(_QWORD *)&options);
}

CFTypeRef IOHIDDeviceGetProperty(IOHIDDeviceRef device, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x24BDD8040](device, key);
}

IOReturn IOHIDDeviceGetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, uint8_t *report, CFIndex *pReportLength)
{
  return MEMORY[0x24BDD8048](device, *(_QWORD *)&reportType, reportID, report, pReportLength);
}

IOReturn IOHIDDeviceOpen(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x24BDD8060](device, *(_QWORD *)&options);
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x24BDD8298]();
}

uint64_t IOHIDEventGetPhase()
{
  return MEMORY[0x24BDD82A8]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x24BDD82D0]();
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return MEMORY[0x24BDD8370]();
}

uint64_t IOHIDEventSystemClientRegisterEventFilterCallbackWithPriority()
{
  return MEMORY[0x24BDD83B0]();
}

uint64_t IOHIDEventSystemClientScheduleWithDispatchQueue()
{
  return MEMORY[0x24BDD83B8]();
}

uint64_t IOHIDEventSystemClientSetMatchingMultiple()
{
  return MEMORY[0x24BDD83E0]();
}

uint64_t IOHIDEventSystemClientUnregisterEventFilterCallback()
{
  return MEMORY[0x24BDD8408]();
}

uint64_t IOHIDEventSystemClientUnscheduleFromDispatchQueue()
{
  return MEMORY[0x24BDD8410]();
}

IOReturn IOHIDManagerClose(IOHIDManagerRef manager, IOOptionBits options)
{
  return MEMORY[0x24BDD8470](manager, *(_QWORD *)&options);
}

CFSetRef IOHIDManagerCopyDevices(IOHIDManagerRef manager)
{
  return (CFSetRef)MEMORY[0x24BDD8478](manager);
}

IOHIDManagerRef IOHIDManagerCreate(CFAllocatorRef allocator, IOOptionBits options)
{
  return (IOHIDManagerRef)MEMORY[0x24BDD8488](allocator, *(_QWORD *)&options);
}

IOReturn IOHIDManagerOpen(IOHIDManagerRef manager, IOOptionBits options)
{
  return MEMORY[0x24BDD8498](manager, *(_QWORD *)&options);
}

void IOHIDManagerSetDeviceMatchingMultiple(IOHIDManagerRef manager, CFArrayRef multiple)
{
  MEMORY[0x24BDD84F0](manager, multiple);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x24BDD8680](*(_QWORD *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

uint64_t IOPSCopyPowerSourcesByTypePrecise()
{
  return MEMORY[0x24BDD87E0]();
}

CFArrayRef IOPSCopyPowerSourcesList(CFTypeRef blob)
{
  return (CFArrayRef)MEMORY[0x24BDD87F0](blob);
}

CFDictionaryRef IOPSGetPowerSourceDescription(CFTypeRef blob, CFTypeRef ps)
{
  return (CFDictionaryRef)MEMORY[0x24BDD8828](blob, ps);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BDF72F8](*(_QWORD *)&notification, argument);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x24BDAC900]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t archive_entry_copy_stat()
{
  return MEMORY[0x24BEDA2F0]();
}

uint64_t archive_entry_free()
{
  return MEMORY[0x24BEDA320]();
}

uint64_t archive_entry_new()
{
  return MEMORY[0x24BEDA350]();
}

uint64_t archive_entry_pathname()
{
  return MEMORY[0x24BEDA360]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x24BEDA3C8]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x24BEDA430]();
}

uint64_t archive_read_close()
{
  return MEMORY[0x24BEDA450]();
}

uint64_t archive_read_data_block()
{
  return MEMORY[0x24BEDA460]();
}

uint64_t archive_read_free()
{
  return MEMORY[0x24BEDA4B8]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x24BEDA4C8]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x24BEDA4D0]();
}

uint64_t archive_read_open_filename()
{
  return MEMORY[0x24BEDA4F8]();
}

uint64_t archive_read_support_filter_all()
{
  return MEMORY[0x24BEDA528]();
}

uint64_t archive_read_support_format_all()
{
  return MEMORY[0x24BEDA540]();
}

uint64_t archive_write_add_filter_compress()
{
  return MEMORY[0x24BEDA570]();
}

uint64_t archive_write_add_filter_gzip()
{
  return MEMORY[0x24BEDA578]();
}

uint64_t archive_write_close()
{
  return MEMORY[0x24BEDA580]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x24BEDA588]();
}

uint64_t archive_write_data_block()
{
  return MEMORY[0x24BEDA590]();
}

uint64_t archive_write_disk_new()
{
  return MEMORY[0x24BEDA598]();
}

uint64_t archive_write_disk_set_options()
{
  return MEMORY[0x24BEDA5A0]();
}

uint64_t archive_write_disk_set_standard_lookup()
{
  return MEMORY[0x24BEDA5A8]();
}

uint64_t archive_write_finish_entry()
{
  return MEMORY[0x24BEDA5B8]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x24BEDA5C0]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x24BEDA5C8]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x24BEDA5D0]();
}

uint64_t archive_write_open()
{
  return MEMORY[0x24BEDA5D8]();
}

uint64_t archive_write_open_fd()
{
  return MEMORY[0x24BEDA5E8]();
}

uint64_t archive_write_open_filename()
{
  return MEMORY[0x24BEDA5F0]();
}

uint64_t archive_write_set_format_cpio()
{
  return MEMORY[0x24BEDA638]();
}

uint64_t archive_write_set_format_ustar()
{
  return MEMORY[0x24BEDA650]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x24BDAE278](__x);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x24BDAEF80](a1, *(_QWORD *)&a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x24BDAFF00](__dst, __src);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x24BDAFF80](__s1, __n);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x24BDB06E0](xBOOL);
}

uint64_t xpc_copy_entitlement_for_self()
{
  return MEMORY[0x24BDB0828]();
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x24BDB0830]();
}

