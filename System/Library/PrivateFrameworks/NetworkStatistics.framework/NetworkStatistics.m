void sub_21142B084(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21142B360(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21142D194(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21142D25C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NStatGetLog()
{
  if (NStatGetLog_pred != -1)
    dispatch_once(&NStatGetLog_pred, &__block_literal_global_306);
  return (id)sNstatLogHandle;
}

BOOL attributionReasonImpliesProcessName(int a1)
{
  return (a1 & 0xFFFFFFFD) == 4;
}

uint64_t attributionReasonImpliesBundleName(unsigned int a1)
{
  return (a1 < 6) & (0x2Eu >> a1);
}

void sub_211430DA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id pid_to_uuid(int a1)
{
  int v1;
  void *v2;
  _OWORD v4[3];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5 = 0;
  memset(v4, 0, sizeof(v4));
  v1 = proc_pidinfo(a1, 17, 1uLL, v4, 56);
  v2 = 0;
  if (v1 == 56)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v4);
  return v2;
}

void sub_21143252C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id pid_to_process_name(int a1)
{
  void *v1;
  __int128 v3;
  char v4;
  __int128 buffer;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  buffer = 0u;
  v6 = 0u;
  if (proc_pidinfo(a1, 13, 1uLL, &buffer, 64) == 64)
  {
    v3 = v6;
    v4 = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", &v3);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

void sub_211432A80(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21143316C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_211433914(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t NStatManagerQueryAllSourcesUpdate(void *a1, const char *a2)
{
  return objc_msgSend(a1, "queryAll:", a2);
}

uint64_t printf_domain()
{
  if (printf_domain_once != -1)
    dispatch_once(&printf_domain_once, &__block_literal_global);
  return printf_domain_printfdomain;
}

_printf_domain *__printf_domain_block_invoke()
{
  _printf_domain *result;

  result = new_printf_domain();
  printf_domain_printfdomain = (uint64_t)result;
  if (result)
  {
    register_printf_domain_render_std(result, "M");
    register_printf_domain_function((printf_domain_t)printf_domain_printfdomain, 78, (printf_function *)xprint_sockaddr, (printf_arginfo_function *)xprint_sockaddr_arginfo, 0);
    register_printf_domain_function((printf_domain_t)printf_domain_printfdomain, 64, (printf_function *)xprint_cfobject, (printf_arginfo_function *)xprint_cfobject_arginfo, 0);
    return (_printf_domain *)register_printf_domain_function((printf_domain_t)printf_domain_printfdomain, 73, (printf_function *)xprint_ifindex, (printf_arginfo_function *)xprint_ifindex_arginfo, 0);
  }
  return result;
}

uint64_t xprint_sockaddr(FILE *a1, uint64_t a2, unsigned __int8 ***a3)
{
  unsigned __int8 *v4;
  unint64_t v5;
  uint64_t v6;
  unsigned int v8;
  const char *v9;
  uint64_t v11;
  unint64_t v12;
  int v13;
  int v14;
  char v15[6];
  char v16[57];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = **a3;
  if (!v4)
    return fprintf(a1, "<NULL>");
  v5 = *v4;
  if (v5 < 2)
    return 0;
  v8 = v4[1];
  if (v8 > 0x11)
  {
    if (v8 == 18)
    {
      if (v5 >= 8)
      {
        v11 = v4[5];
        if (v11 + v4[6] + (unint64_t)v4[7] + 8 <= v5)
        {
          if (v4[6])
          {
            v12 = 0;
            LODWORD(v6) = 0;
            do
            {
              if (v12)
                v13 = fprintf(a1, ":%x");
              else
                v13 = fprintf(a1, "%x");
              v6 = (v13 + v6);
              ++v12;
            }
            while (v12 < v4[6]);
            LODWORD(v11) = v4[5];
          }
          else
          {
            v6 = 0;
          }
          if ((_DWORD)v11)
          {
            v14 = fprintf(a1, "%s%*s");
          }
          else
          {
            if (!*((_WORD *)v4 + 1))
              return v6;
            if ((_DWORD)v6)
              v14 = fprintf(a1, "%%%d");
            else
              v14 = fprintf(a1, "%d");
          }
          return (v14 + v6);
        }
      }
      return 0;
    }
    if (v8 != 30)
      return fprintf(a1, "<unsupported af: %u>");
    goto LABEL_12;
  }
  if (v8 != 1)
  {
    if (v8 != 2)
      return fprintf(a1, "<unsupported af: %u>");
LABEL_12:
    if (!getnameinfo((const sockaddr *)v4, v5, v16, 0x39u, v15, 6u, 10))
    {
      if (!*((_WORD *)v4 + 1))
        return fprintf(a1, "%s");
      if (v4[1] == 2)
        v9 = "%s:%s";
      else
        v9 = "%s.%s";
      return fprintf(a1, v9, v16, v15);
    }
    return 0;
  }
  if (v5 < 3)
    return 0;
  return fprintf(a1, "%.*s");
}

uint64_t xprint_sockaddr_arginfo(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (a2)
    *a3 = 32;
  return 1;
}

uint64_t xprint_cfobject(FILE *a1, uint64_t a2, CFTypeRef **a3)
{
  const __CFString *v4;
  CFTypeID v5;
  CFTypeID v6;
  int v7;

  v4 = (const __CFString *)**a3;
  if (!v4)
    return fprintf(a1, "<NULL>");
  v5 = CFGetTypeID(**a3);
  if (v5 == CFDictionaryGetTypeID() || (v6 = CFGetTypeID(v4), v6 == CFArrayGetTypeID()))
  {
    v7 = fprintf(a1, "\n");
    return xprint_cfobject_container(a1, 2, v4) + v7;
  }
  else
  {
    xprint_cfobject_leaf(a1, v4);
    return 0;
  }
}

uint64_t xprint_cfobject_arginfo(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (a2)
    *a3 = 32;
  return 1;
}

uint64_t xprint_ifindex(FILE *a1, uint64_t a2, unsigned int **a3)
{
  unsigned int v4;
  char v6[17];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = **a3;
  v6[0] = 0;
  if_indextoname(v4, v6);
  if (!v6[0])
    return fprintf(a1, "%d");
  v6[16] = 0;
  return fprintf(a1, "%s");
}

uint64_t xprint_ifindex_arginfo(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (a2)
    *a3 = 1;
  return 1;
}

const char *msgTypeToString(int a1)
{
  const char *result;

  if (a1 > 10000)
  {
    switch(a1)
    {
      case 10001:
        result = "src-added";
        break;
      case 10002:
        result = "src-removed";
        break;
      case 10003:
LABEL_9:
        result = "src-desc";
        break;
      case 10004:
        result = "src-counts";
        break;
      case 10005:
        result = "sysinfo-counts";
        break;
      case 10006:
        result = "src-update";
        break;
      default:
LABEL_21:
        result = "???";
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case 1001:
        return "add-src";
      case 1002:
        return "add-all";
      case 1003:
        return "rem-src";
      case 1004:
        return "query-src";
      case 1005:
        goto LABEL_9;
      case 1006:
        return "set-filter";
      case 1007:
        return "get-update";
      case 1008:
        return "subscribe-sysinfo";
      default:
        if (a1)
        {
          if (a1 != 1)
            goto LABEL_21;
          result = "error";
        }
        else
        {
          result = "success";
        }
        break;
    }
  }
  return result;
}

void NStatMgrTraceF(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  NStatMgrVTraceF(a1, a2, &a9);
}

void NStatMgrVTraceF(void *a1, const char *a2, va_list a3)
{
  id v5;
  void *v6;
  void *v7;
  char *__ret;

  v5 = a1;
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "mgrflags") & 0x80) != 0)
  {
    v7 = (void *)MEMORY[0x212BD9F2C]();
    __ret = 0;
    if (printf_domain_once != -1)
      dispatch_once(&printf_domain_once, &__block_literal_global);
    vasxprintf(&__ret, (printf_domain_t)printf_domain_printfdomain, 0, a2, a3);
    if (__ret)
    {
      objc_msgSend(v6, "trace:");
      free(__ret);
    }
    objc_autoreleasePoolPop(v7);
  }

}

void *NStatSourceCopyProperty(void *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "currentSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traditionalDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "UUIDString");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }

  return v5;
}

uint64_t NStatSourceCopyProperties(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "currentSnapshot");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "traditionalDictionary");
  v2 = objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t NStatSourceCopyCounts(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "currentSnapshot");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "traditionalDictionary");
  v2 = objc_claimAutoreleasedReturnValue();

  return v2;
}

void NStatSourceSetRemovedBlock(void *a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  NWStatisticsDelegateBlockWrapper *v6;
  void *v7;
  id v8;

  v8 = a1;
  v3 = a2;
  objc_msgSend(v8, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v6 = objc_alloc_init(NWStatisticsDelegateBlockWrapper);
    objc_msgSend(v8, "setDelegate:", v6);

  }
  objc_msgSend(v8, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemovedBlock:", v3);

}

void NStatSourceSetDescriptionBlock(void *a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  NWStatisticsDelegateBlockWrapper *v6;
  void *v7;
  id v8;

  v8 = a1;
  v3 = a2;
  objc_msgSend(v8, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v6 = objc_alloc_init(NWStatisticsDelegateBlockWrapper);
    objc_msgSend(v8, "setDelegate:", v6);

  }
  objc_msgSend(v8, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDescriptionBlock:", v3);

}

void NStatSourceSetCountsBlock(void *a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  NWStatisticsDelegateBlockWrapper *v6;
  void *v7;
  id v8;

  v8 = a1;
  v3 = a2;
  objc_msgSend(v8, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v6 = objc_alloc_init(NWStatisticsDelegateBlockWrapper);
    objc_msgSend(v8, "setDelegate:", v6);

  }
  objc_msgSend(v8, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCountsBlock:", v3);

}

void NStatSourceSetEventsBlock(void *a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  NWStatisticsDelegateBlockWrapper *v6;
  void *v7;
  id v8;

  v8 = a1;
  v3 = a2;
  objc_msgSend(v8, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v6 = objc_alloc_init(NWStatisticsDelegateBlockWrapper);
    objc_msgSend(v8, "setDelegate:", v6);

  }
  objc_msgSend(v8, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEventsBlock:", v3);

}

void NStatSourceRemove(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  objc_msgSend(v1, "manager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeSource:", v1);

}

uint64_t NStatManagerQueryAllSources(void *a1, const char *a2)
{
  return objc_msgSend(a1, "queryAllCounts:", a2);
}

uint64_t NStatManagerQueryAllSourcesDescriptions(void *a1, const char *a2)
{
  return objc_msgSend(a1, "queryAllDescriptions:", a2);
}

NWStatisticsRouteSource *NStatManagerCreateRouteSource(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return -[NWStatisticsRouteSource initWithManager:destination:mask:interface:]([NWStatisticsRouteSource alloc], "initWithManager:destination:mask:interface:", a1, a2, a3, a4);
}

uint64_t NStatManagerCreateTCPSource()
{
  return 0;
}

uint64_t NStatManagerCreateUDPSource()
{
  return 0;
}

uint64_t NStatManagerCreateSysinfoSource()
{
  return 0;
}

NWStatisticsInterfaceSource *NStatManagerCreateInterfaceSource(uint64_t a1, unsigned int a2, unsigned int a3)
{
  return -[NWStatisticsInterfaceSource initWithManager:interface:threshold:]([NWStatisticsInterfaceSource alloc], "initWithManager:interface:threshold:", a1, a2, a3);
}

uint64_t NStatManagerAddAllTCP(void *a1, const char *a2)
{
  return objc_msgSend(a1, "addAllTCP:events:pid:uuid:", 0, 0, 0, 0);
}

uint64_t NStatManagerAddAllTCPWithFilter(void *a1, const char *a2)
{
  return objc_msgSend(a1, "addAllTCP:events:pid:uuid:", a2, 0, 0, 0);
}

uint64_t NStatManagerAddAllTCPWithOptions(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a1, "addAllTCP:events:pid:uuid:", a2, a3, a4, a5);
}

uint64_t NStatManagerAddAllUDP(void *a1, const char *a2)
{
  return objc_msgSend(a1, "addAllUDP:events:pid:uuid:", 0, 0, 0, 0);
}

uint64_t NStatManagerAddAllUDPWithFilter(void *a1, const char *a2)
{
  return objc_msgSend(a1, "addAllUDP:events:pid:uuid:", a2, 0, 0, 0);
}

uint64_t NStatManagerAddAllUDPWithOptions(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(a1, "addAllUDP:events:pid:uuid:", a2, a3, a4, a5);
}

uint64_t NStatManagerAddAllRoutes(void *a1, const char *a2)
{
  return objc_msgSend(a1, "addAllRoute:", 0);
}

uint64_t NStatManagerAddAllRoutesWithFilter(void *a1, const char *a2)
{
  return objc_msgSend(a1, "addAllRoute:", a2);
}

uint64_t NStatManagerDestroy(void *a1)
{
  objc_msgSend(a1, "invalidate");
  objc_msgSend(a1, "setDelegate:", 0);
  return objc_msgSend(a1, "setStrongDelegate:", 0);
}

NWStatisticsManager *NStatManagerCreate(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NWStatisticsDelegateBlockWrapper *v6;
  NWStatisticsDelegateBlockWrapper *v7;
  NWStatisticsManager *v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_alloc_init(NWStatisticsDelegateBlockWrapper);
  v7 = v6;
  if (v6)
  {
    -[NWStatisticsDelegateBlockWrapper setAddedBlock:](v6, "setAddedBlock:", v5);
    v8 = -[NWStatisticsManager initWithQueue:]([NWStatisticsManager alloc], "initWithQueue:", v4);
    -[NWStatisticsManager setStrongDelegate:](v8, "setStrongDelegate:", v7);
    -[NWStatisticsManager setDelegate:](v8, "setDelegate:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void NStatSourceSetFilter(void *a1, uint64_t a2)
{
  id v3;

  objc_msgSend(a1, "manager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFilter:", a2);

}

void NStatManagerSetQueuePriority()
{
  NSObject *v0;

  NStatGetLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    NStatManagerSetQueuePriority_cold_1(v0);

}

uint64_t NStatManagerSetFlags(void *a1, const char *a2)
{
  return objc_msgSend(a1, "setMgrflags:", a2);
}

uint64_t NStatManagerSetInterfaceTraceFD(void *a1, const char *a2)
{
  return objc_msgSend(a1, "setInterfaceTraceFd:", a2);
}

uint64_t NStatManagerSetInterfaceSourceFD(void *a1, const char *a2)
{
  return objc_msgSend(a1, "setInterfaceSourceFd:", a2);
}

BOOL NStatRouteValuesForIPv4Host(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = (void *)MEMORY[0x212BD9F2C]();
  v7 = 1;
  if (a1 && a3)
  {
    +[NWSSnapshotSource routeSnapshotForIPv4Host:viaInterfaceIndex:](NWSSnapshotSource, "routeSnapshotForIPv4Host:viaInterfaceIndex:", a1, a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "rttMinimum");
      *(_QWORD *)a3 = v10;
      objc_msgSend(v9, "rttAverage");
      *(_QWORD *)(a3 + 8) = v11;
      objc_msgSend(v9, "rttVariation");
      *(_QWORD *)(a3 + 16) = v12;
      *(_DWORD *)(a3 + 24) = objc_msgSend(v9, "connectAttempts");
      v7 = 0;
      *(_DWORD *)(a3 + 28) = objc_msgSend(v9, "connectSuccesses");
    }

  }
  objc_autoreleasePoolPop(v6);
  return v7 == 0;
}

BOOL NStatRouteValuesForIPv6Host(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = (void *)MEMORY[0x212BD9F2C]();
  v7 = 1;
  if (a1 && a3)
  {
    +[NWSSnapshotSource routeSnapshotForIPv6Host:viaInterfaceIndex:](NWSSnapshotSource, "routeSnapshotForIPv6Host:viaInterfaceIndex:", a1, a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "rttMinimum");
      *(_QWORD *)a3 = v10;
      objc_msgSend(v9, "rttAverage");
      *(_QWORD *)(a3 + 8) = v11;
      objc_msgSend(v9, "rttVariation");
      *(_QWORD *)(a3 + 16) = v12;
      *(_DWORD *)(a3 + 24) = objc_msgSend(v9, "connectAttempts");
      v7 = 0;
      *(_DWORD *)(a3 + 28) = objc_msgSend(v9, "connectSuccesses");
    }

  }
  objc_autoreleasePoolPop(v6);
  return v7 == 0;
}

uint64_t xprint_cfobject_container(FILE *a1, int a2, CFTypeRef cf)
{
  CFTypeID v6;
  CFTypeID v7;
  CFIndex Count;
  int v9;
  int v10;
  _DWORD context[2];
  FILE *v13;
  uint64_t v14;
  CFRange v15;

  context[0] = 0;
  v13 = a1;
  context[1] = a2;
  v14 = 0;
  v6 = CFGetTypeID(cf);
  if (v6 == CFDictionaryGetTypeID())
  {
    if (CFDictionaryGetCount((CFDictionaryRef)cf))
    {
      CFDictionaryApplyFunction((CFDictionaryRef)cf, (CFDictionaryApplierFunction)xprint_cfobject_dictionary, context);
      return v14;
    }
  }
  else
  {
    v7 = CFGetTypeID(cf);
    if (v7 != CFArrayGetTypeID())
      return v14;
    Count = CFArrayGetCount((CFArrayRef)cf);
    if (Count)
    {
      v15.length = Count;
      v15.location = 0;
      CFArrayApplyFunction((CFArrayRef)cf, v15, (CFArrayApplierFunction)xprint_cfobject_array, context);
      return v14;
    }
  }
  if (a2 >= 80)
    v9 = 80;
  else
    v9 = a2;
  v10 = fprintf(a1, "%.*s", v9, "                                                                                ");
  return (fprintf(a1, "<empty>") + v10);
}

uint64_t xprint_cfobject_leaf(FILE *a1, const __CFString *a2)
{
  CFTypeID v4;
  const char *CStringPtr;
  CFTypeID v7;
  CFStringRef v8;
  CFTypeID v9;
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  char *v12;
  char *v13;
  uint64_t v14;
  CFTypeID v15;
  uint64_t v16;
  CFStringRef v17;
  uint64_t valuePtr;

  if (!a2)
    return fprintf(a1, "<NULL>");
  v4 = CFGetTypeID(a2);
  if (v4 == CFStringGetTypeID())
  {
    CStringPtr = CFStringGetCStringPtr(a2, 0x8000100u);
    if (CStringPtr)
      return fprintf(a1, "%s", CStringPtr);
    Length = CFStringGetLength(a2);
    MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
    v12 = (char *)malloc_type_malloc(MaximumSizeForEncoding, 0x983C18ABuLL);
    if (v12)
    {
      v13 = v12;
      if (CFStringGetCString(a2, v12, MaximumSizeForEncoding, 0x8000100u))
        v14 = fprintf(a1, "%s", v13);
      else
        v14 = 0;
      free(v13);
      return v14;
    }
    return 0;
  }
  v7 = CFGetTypeID(a2);
  if (v7 == CFDataGetTypeID())
  {
    v8 = CFStringCreateFromExternalRepresentation((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFDataRef)a2, 0x8000100u);
    if (!v8)
      return 0;
LABEL_20:
    v17 = v8;
    v14 = xprint_cfobject_leaf(a1, v8);
    CFRelease(v17);
    return v14;
  }
  v9 = CFGetTypeID(a2);
  if (v9 != CFBooleanGetTypeID())
  {
    v15 = CFGetTypeID(a2);
    if (v15 == CFNumberGetTypeID())
    {
      switch(CFNumberGetType((CFNumberRef)a2))
      {
        case kCFNumberSInt8Type:
          LOBYTE(valuePtr) = 0;
          CFNumberGetValue((CFNumberRef)a2, kCFNumberSInt8Type, &valuePtr);
          v16 = fprintf(a1, "(SInt8) %hhd");
          break;
        case kCFNumberSInt16Type:
          LOWORD(valuePtr) = 0;
          CFNumberGetValue((CFNumberRef)a2, kCFNumberSInt16Type, &valuePtr);
          v16 = fprintf(a1, "(SInt16) %hd");
          break;
        case kCFNumberSInt32Type:
          LODWORD(valuePtr) = 0;
          CFNumberGetValue((CFNumberRef)a2, kCFNumberSInt32Type, &valuePtr);
          v16 = fprintf(a1, "(SInt32) %d");
          break;
        case kCFNumberSInt64Type:
          valuePtr = 0;
          CFNumberGetValue((CFNumberRef)a2, kCFNumberSInt64Type, &valuePtr);
          v16 = fprintf(a1, "(SInt64) %lld");
          break;
        case kCFNumberFloat32Type:
          LODWORD(valuePtr) = 0;
          CFNumberGetValue((CFNumberRef)a2, kCFNumberFloat32Type, &valuePtr);
          v16 = fprintf(a1, "(Float32) %f");
          break;
        case kCFNumberFloat64Type:
          valuePtr = 0;
          CFNumberGetValue((CFNumberRef)a2, kCFNumberFloat64Type, &valuePtr);
          v16 = fprintf(a1, "(Float64) %lf");
          break;
        case kCFNumberCharType:
          LOBYTE(valuePtr) = 0;
          CFNumberGetValue((CFNumberRef)a2, kCFNumberCharType, &valuePtr);
          v16 = fprintf(a1, "(Char) %hhd");
          break;
        case kCFNumberShortType:
          LOWORD(valuePtr) = 0;
          CFNumberGetValue((CFNumberRef)a2, kCFNumberShortType, &valuePtr);
          v16 = fprintf(a1, "(Short) %hd");
          break;
        case kCFNumberIntType:
          LODWORD(valuePtr) = 0;
          CFNumberGetValue((CFNumberRef)a2, kCFNumberIntType, &valuePtr);
          v16 = fprintf(a1, "(Int) %d");
          break;
        case kCFNumberLongType:
          valuePtr = 0;
          CFNumberGetValue((CFNumberRef)a2, kCFNumberLongType, &valuePtr);
          v16 = fprintf(a1, "(Long) %ld");
          break;
        case kCFNumberLongLongType:
          valuePtr = 0;
          CFNumberGetValue((CFNumberRef)a2, kCFNumberLongLongType, &valuePtr);
          v16 = fprintf(a1, "(LongLong) %lld");
          break;
        case kCFNumberFloatType:
          LODWORD(valuePtr) = 0;
          CFNumberGetValue((CFNumberRef)a2, kCFNumberFloatType, &valuePtr);
          v16 = fprintf(a1, "(Float) %f");
          break;
        case kCFNumberDoubleType:
          valuePtr = 0;
          CFNumberGetValue((CFNumberRef)a2, kCFNumberDoubleType, &valuePtr);
          v16 = fprintf(a1, "(Double) %lf");
          break;
        case kCFNumberCFIndexType:
          valuePtr = 0;
          CFNumberGetValue((CFNumberRef)a2, kCFNumberCFIndexType, &valuePtr);
          v16 = fprintf(a1, "(CFIndex) %ld");
          break;
        default:
          goto LABEL_19;
      }
      return v16;
    }
LABEL_19:
    v8 = CFCopyDescription(a2);
    if (!v8)
      return 0;
    goto LABEL_20;
  }
  if (CFBooleanGetValue((CFBooleanRef)a2))
    return fprintf(a1, "True");
  else
    return fprintf(a1, "False");
}

uint64_t xprint_cfobject_dictionary(const __CFString *cf, const __CFString *a2, uint64_t a3)
{
  CFTypeID v6;
  int v7;
  CFTypeID v8;
  CFTypeID v9;
  int v10;
  FILE *v11;
  int v12;
  uint64_t v13;
  uint64_t result;
  int v15;
  FILE *v16;
  int v17;
  FILE *v18;
  int v19;
  FILE *v20;
  CFRange v21;

  if (cf)
  {
    v6 = CFGetTypeID(cf);
    if (v6 == CFStringGetTypeID())
    {
      v21.length = CFStringGetLength(cf);
      v21.location = 0;
      if (CFStringFindWithOptions(cf, CFSTR("password"), v21, 1uLL, 0))
        a2 = CFSTR("<hidden>");
    }
  }
  v7 = *(_DWORD *)(a3 + 4);
  if (v7 >= 80)
    v7 = 80;
  *(_QWORD *)(a3 + 16) += 4
                        * fprintf(*(FILE **)(a3 + 8), "%.*s", v7, "                                                                                ");
  if (a2 && ((v8 = CFGetTypeID(a2), v8 == CFDictionaryGetTypeID()) || (v9 = CFGetTypeID(a2), v9 == CFArrayGetTypeID())))
  {
    v10 = xprint_cfobject_leaf(*(FILE **)(a3 + 8), cf);
    v11 = *(FILE **)(a3 + 8);
    *(_QWORD *)(a3 + 16) += 4 * v10;
    v12 = fprintf(v11, "\n");
    v13 = *(_QWORD *)(a3 + 8);
    *(_QWORD *)(a3 + 16) += 4 * v12;
    result = xprint_cfobject_container(v13, *(_DWORD *)(a3 + 4) + 2, a2);
  }
  else
  {
    v15 = xprint_cfobject_leaf(*(FILE **)(a3 + 8), cf);
    v16 = *(FILE **)(a3 + 8);
    *(_QWORD *)(a3 + 16) += 4 * v15;
    v17 = fprintf(v16, " : ");
    v18 = *(FILE **)(a3 + 8);
    *(_QWORD *)(a3 + 16) += 4 * v17;
    v19 = xprint_cfobject_leaf(v18, a2);
    v20 = *(FILE **)(a3 + 8);
    *(_QWORD *)(a3 + 16) += 4 * v19;
    result = fprintf(v20, "\n");
  }
  *(_QWORD *)(a3 + 16) += 4 * (int)result;
  return result;
}

uint64_t xprint_cfobject_array(const __CFString *a1, int *a2)
{
  int v4;
  int v5;
  CFTypeID v6;
  CFTypeID v7;
  int v8;
  uint64_t v9;
  uint64_t result;
  int v11;
  FILE *v12;
  int v13;
  FILE *v14;

  v5 = *a2;
  v4 = a2[1];
  ++*a2;
  if (v4 >= 80)
    v4 = 80;
  *((_QWORD *)a2 + 2) += 4
                       * fprintf(*((FILE **)a2 + 1), "%.*s", v4, "                                                                                ");
  if (a1 && ((v6 = CFGetTypeID(a1), v6 == CFDictionaryGetTypeID()) || (v7 = CFGetTypeID(a1), v7 == CFArrayGetTypeID())))
  {
    v8 = fprintf(*((FILE **)a2 + 1), "%d\n", v5);
    v9 = *((_QWORD *)a2 + 1);
    *((_QWORD *)a2 + 2) += 4 * v8;
    result = xprint_cfobject_container(v9, a2[1] + 2, a1);
  }
  else
  {
    v11 = fprintf(*((FILE **)a2 + 1), "%d : ", v5);
    v12 = (FILE *)*((_QWORD *)a2 + 1);
    *((_QWORD *)a2 + 2) += 4 * v11;
    v13 = xprint_cfobject_leaf(v12, a1);
    v14 = (FILE *)*((_QWORD *)a2 + 1);
    *((_QWORD *)a2 + 2) += 4 * v13;
    result = fprintf(v14, "\n");
  }
  *((_QWORD *)a2 + 2) += 4 * (int)result;
  return result;
}

void sub_211437D1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
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

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xEu);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_21143B2F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21143C27C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21143C6D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21143CF30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_21143D0F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t maskLeadingBitsCount(unsigned __int8 *a1)
{
  int v1;
  unsigned __int8 *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  int v6;
  int v7;

  v1 = a1[1];
  if (v1 == 30)
  {
    v2 = a1 + 8;
    v3 = 16;
  }
  else
  {
    if (v1 != 2)
      return 0;
    v2 = a1 + 4;
    v3 = 4;
  }
  result = 0;
  v5 = 8 * v3;
  while (1)
  {
    v7 = *v2++;
    v6 = v7;
    if (v7 != 255)
      break;
    result += 8;
    if (v5 == result)
      return result;
  }
  if (v6 <= 239)
  {
    switch(v6)
    {
      case 128:
        ++result;
        break;
      case 192:
        result += 2;
        break;
      case 224:
        result += 3;
        break;
    }
  }
  else if (v6 > 251)
  {
    if (v6 == 254)
    {
      result += 7;
    }
    else if (v6 == 252)
    {
      result += 6;
    }
  }
  else if (v6 == 240)
  {
    result += 4;
  }
  else if (v6 == 248)
  {
    result += 5;
  }
  return result;
}

void sub_211441A94(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_211441FB0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_211442068(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_211442808(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2114428A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const __CFString *attributionReasonString(unsigned int a1)
{
  if (a1 > 6)
    return CFSTR("reason-unknown-type");
  else
    return *(&off_24CBD2D30 + (int)a1);
}

__CFString *sockaddrForLogging(const sockaddr *a1)
{
  char v2[6];
  char v3[57];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  if (!a1 || getnameinfo(a1, a1->sa_len, v3, 0x39u, v2, 6u, 10))
    return CFSTR("?");
  v3[56] = 0;
  v2[5] = 0;
  return (__CFString *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s:%s"), v3, v2);
}

BOOL sockaddrsHavePortDiffOnly(uint64_t a1, uint64_t a2)
{
  int v2;

  v2 = *(unsigned __int8 *)(a1 + 1);
  if (v2 != *(unsigned __int8 *)(a2 + 1))
    return 0;
  if (v2 == 30)
  {
    if (*(_QWORD *)(a1 + 8) != *(_QWORD *)(a2 + 8) || *(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
      return 0;
  }
  else if (v2 != 2 || *(_DWORD *)(a1 + 4) != *(_DWORD *)(a2 + 4))
  {
    return 0;
  }
  return *(unsigned __int16 *)(a1 + 2) != *(unsigned __int16 *)(a2 + 2);
}

id pid_to_uuid_string(int a1)
{
  int v1;
  void *v2;
  _OWORD v4[3];
  _OWORD buffer[3];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v6 = 0;
  memset(buffer, 0, sizeof(buffer));
  v1 = proc_pidinfo(a1, 17, 1uLL, buffer, 56);
  v2 = 0;
  if (v1 == 56)
  {
    memset(v4, 0, 37);
    uuid_unparse_upper((const unsigned __int8 *)buffer, (char *)v4);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

BOOL pid_is_valid(int a1)
{
  _OWORD v2[4];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  memset(v2, 0, sizeof(v2));
  return proc_pidinfo(a1, 13, 1uLL, v2, 64) == 64;
}

uint64_t uuid_to_pid(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  size_t v9;
  _BYTE count[68];
  unsigned __int8 uu2[8];
  uint64_t v12;
  int v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  *(_QWORD *)v13 = 0x600000001;
  *(_DWORD *)count = 0;
  v9 = 4;
  if (sysctl(v13, 2u, count, &v9, 0, 0) < 0)
  {
    v7 = 0xFFFFFFFFLL;
  }
  else
  {
    if (!*(_DWORD *)count
      || (*(_DWORD *)count & 0x80000000) != 0
      || (v2 = malloc_type_calloc(*(int *)count, 4uLL, 0xF1748037uLL)) == 0)
    {
      __break(1u);
    }
    v3 = v2;
    *(_QWORD *)uu2 = 0;
    v12 = 0;
    objc_msgSend(v1, "getUUIDBytes:", uu2);
    v4 = proc_listallpids(v3, 4 * *(_DWORD *)count);
    if (v4 < 1)
    {
LABEL_10:
      v7 = 0xFFFFFFFFLL;
    }
    else
    {
      v5 = v4;
      v6 = (int *)v3;
      while (1)
      {
        memset(&count[4], 0, 56);
        if (proc_pidinfo(*v6, 17, 1uLL, &count[4], 56) == 56 && !uuid_compare(&count[4], uu2))
          break;
        ++v6;
        if (!--v5)
          goto LABEL_10;
      }
      v7 = *v6;
    }
    free(v3);
  }

  return v7;
}

uint64_t pid_to_coalitionid(int a1)
{
  _OWORD v2[2];
  uint64_t v3;

  v3 = 0;
  memset(v2, 0, sizeof(v2));
  if (proc_pidinfo(a1, 20, 1uLL, v2, 40) == 40)
    return *(_QWORD *)&v2[0];
  else
    return 1;
}

id pid_to_coalition_bundleid(int a1)
{
  void *v1;
  unint64_t v2;
  uint64_t v3;
  void *v4;
  const char *string;
  const char *v7;
  void *v8;
  _OWORD v9[2];
  uint64_t v10;

  v10 = 0;
  memset(v9, 0, sizeof(v9));
  v1 = 0;
  if (proc_pidinfo(a1, 20, 1uLL, v9, 40) == 40)
    v2 = *(_QWORD *)&v9[0];
  else
    v2 = 1;
  if (v2 >= 2)
  {
    v3 = xpc_coalition_copy_info();
    v4 = (void *)v3;
    if (v3 && MEMORY[0x212BDA310](v3) == MEMORY[0x24BDACFA0])
    {
      string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x24BDAC710]);
      if (string)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string);
        v1 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      v7 = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x24BDAC718]);
      if (v7)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        stringByRemovingTrailingUUIDsAndLaunchServicesStuff(v8);
        v1 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
    }
    v1 = 0;
LABEL_8:

  }
  return v1;
}

id stringByRemovingTrailingUUIDsAndLaunchServicesStuff(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  unint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;

  v1 = a1;
  v2 = v1;
  if (v1 && (v3 = objc_msgSend(v1, "length")) != 0)
  {
    v4 = v3;
    v5 = objc_msgSend(v2, "characterAtIndex:", v3 - 1);
    v6 = objc_msgSend(CFSTR("com.apple.xpc.launchd.oneshot"), "length");
    if (((v5 << 24) - 788529153) < 0xAFFFFFF || ((v5 << 24) - 1073741825) <= 0x6FFFFFE)
    {
      if (stringByRemovingTrailingUUIDsAndLaunchServicesStuff_pred != -1)
        dispatch_once(&stringByRemovingTrailingUUIDsAndLaunchServicesStuff_pred, &__block_literal_global_3);
      objc_msgSend((id)stringByRemovingTrailingUUIDsAndLaunchServicesStuff_regex, "stringByReplacingMatchesInString:options:range:withTemplate:", v2, 0, 0, objc_msgSend(v2, "length"), &stru_24CBD3FC0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    if (v4 <= v6
      || objc_msgSend(v2, "characterAtIndex:", v6 - 1) != 116
      || !objc_msgSend(v2, "hasPrefix:", CFSTR("com.apple.xpc.launchd.oneshot")))
    {
      v8 = v2;
LABEL_18:
      v9 = v8;
      goto LABEL_19;
    }
    objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count") == 7
      && (objc_msgSend(v10, "objectAtIndexedSubscript:", 5),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "hasPrefix:", CFSTR("0x")),
          v11,
          v12))
    {
      v13 = (void *)objc_msgSend(v10, "mutableCopy");
      objc_msgSend(v13, "removeObjectAtIndex:", 5);
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR("."));
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = v2;
    }

  }
  else
  {
    v9 = 0;
  }
LABEL_19:

  return v9;
}

void __stringByRemovingTrailingUUIDsAndLaunchServicesStuff_block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;

  v3 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(\\.[A-F0-9]{8}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{12}\\Z|\\.[0-9]+\\Z|\\A\\[0x[a-fA-F0-9]+-0x[a-fA-F0-9]+\\]\\.)"), 0, &v3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = v3;
  v2 = (void *)stringByRemovingTrailingUUIDsAndLaunchServicesStuff_regex;
  stringByRemovingTrailingUUIDsAndLaunchServicesStuff_regex = v0;

}

id pid_to_coalitionID(int a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (pid_to_coalitionID_onceToken != -1)
    dispatch_once(&pid_to_coalitionID_onceToken, &__block_literal_global_12);
  pid_to_coalition_bundleid(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_6;
  objc_msgSend((id)sLSPlugInKitProxyClass, "pluginKitProxyForIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = v3,
        objc_msgSend(v3, "containingBundle"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "bundleIdentifier"),
        v6 = (id)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v6))
  {
LABEL_6:
    v6 = v2;
  }

  return v6;
}

void __pid_to_coalitionID_block_invoke()
{
  Class Class;
  BOOL v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  sCoreServicesDylibHandle = (uint64_t)dlopen((const char *)gCoreServicesFrameworkPath, 4);
  if (!sCoreServicesDylibHandle
    || ((Class = objc_getClass("LSPlugInKitProxy"), sLSPlugInKitProxyClass = (uint64_t)Class, sCoreServicesDylibHandle)
      ? (v1 = Class == 0)
      : (v1 = 1),
        v1))
  {
    NStatGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      v3 = 134218240;
      v4 = sCoreServicesDylibHandle;
      v5 = 2048;
      v6 = sLSPlugInKitProxyClass;
      _os_log_impl(&dword_211429000, v2, OS_LOG_TYPE_FAULT, "procinfo utils plugin mMapping dylib lookup failure handle %p plugin proxy class %p", (uint8_t *)&v3, 0x16u);
    }

  }
}

id dateStringMillisecondsFromTimeInterval(long double a1)
{
  double v1;
  tm *v2;
  void *v3;
  char *v4;
  char *v5;
  char __str[4];
  __int16 v8;
  double __y;
  time_t v10;
  char __dst[8];
  uint64_t v12;
  _WORD v13[7];
  char __src[8];
  uint64_t v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)__src = 0;
  v15 = 0;
  v17 = 0;
  v16 = 0;
  v10 = (uint64_t)a1;
  if ((uint64_t)a1 <= 0)
  {
    time(&v10);
    a1 = 0.0;
  }
  __y = 0.0;
  v1 = modf(a1, &__y);
  v2 = localtime(&v10);
  v3 = (void *)strftime(__src, 0x1AuLL, "%Y-%m-%d %H:%M:%S %z", v2);
  if (v3)
  {
    v8 = 0;
    *(_DWORD *)__str = 0;
    if (snprintf(__str, 6uLL, "%.3f", v1))
    {
      *(_QWORD *)__dst = 0;
      v12 = 0;
      memset(v13, 0, sizeof(v13));
      v4 = stpncpy(__dst, __src, 0x13uLL);
      v5 = stpncpy(v4, &__str[1], 4uLL);
      stpncpy(v5, (const char *)&v16 + 3, 6uLL);
      HIBYTE(v13[6]) = 0;
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", __dst, 1);
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

id dateStringMillisecondsFromReferenceInterval(double a1)
{
  return dateStringMillisecondsFromTimeInterval(a1 + 978307200.0);
}

id timeStringMillisecondsFromTimeInterval(long double a1)
{
  double v1;
  tm *v2;
  void *v3;
  char *v4;
  char *v5;
  char __str[4];
  __int16 v8;
  double __y;
  time_t v10;
  char __dst[8];
  _QWORD v12[2];
  char __src[16];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  memset(__src, 0, 15);
  __y = 0.0;
  v10 = (uint64_t)a1;
  v1 = modf(a1, &__y);
  v2 = localtime(&v10);
  v3 = (void *)strftime(__src, 0xFuLL, "%H:%M:%S %z", v2);
  if (v3)
  {
    v8 = 0;
    *(_DWORD *)__str = 0;
    if (snprintf(__str, 6uLL, "%.3f", v1))
    {
      *(_QWORD *)__dst = 0;
      memset(v12, 0, 11);
      v4 = stpncpy(__dst, __src, 8uLL);
      v5 = stpncpy(v4, &__str[1], 4uLL);
      stpncpy(v5, &__src[8], 6uLL);
      BYTE2(v12[1]) = 0;
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", __dst, 1);
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

id timeStringMillisecondsFromReferenceInterval(double a1)
{
  return timeStringMillisecondsFromTimeInterval(a1 + 978307200.0);
}

void NStatManagerSetQueuePriority_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_211429000, log, OS_LOG_TYPE_ERROR, "Attempt to use obsolete NStatManagerSetQueuePriority() function", v1, 2u);
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x24BDBB7A8]();
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x24BDBB7D8](theArray, range.location, range.length, applier, context);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x24BDBBC58](cf);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x24BDBC110](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC530](alloc, data, *(_QWORD *)&encoding);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x24BDBC5E8](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

uint64_t NEHelperCacheCopySigningIdentifierMapping()
{
  return MEMORY[0x24BDAC488]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

int __snprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, ...)
{
  return MEMORY[0x24BDAC8B0](a1, a2, *(_QWORD *)&a3, a4, a5);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

int asxprintf(char **__ret, printf_domain_t __domain, locale_t __loc, const char *__format, ...)
{
  return MEMORY[0x24BDAD210](__ret, __domain, __loc, __format);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDADA10](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
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

dispatch_qos_class_t dispatch_queue_get_qos_class(dispatch_queue_t queue, int *relative_priority_ptr)
{
  return MEMORY[0x24BDADEE8](queue, relative_priority_ptr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x24BDAE060](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void freeifaddrs(ifaddrs *a1)
{
  MEMORY[0x24BDAE468](a1);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x24BDAE660](a1);
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return MEMORY[0x24BDAE6A0](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x24BDAE850](*(_QWORD *)&a1, a2);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x24BDAE8C8](*(_QWORD *)&a1, a2);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x24BDAEA98](a1);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

long double modf(long double __x, long double *__y)
{
  long double result;

  MEMORY[0x24BDAEFB0](__y, __x);
  return result;
}

uint64_t ne_session_map_interface_to_provider_uuid()
{
  return MEMORY[0x24BDAF048]();
}

printf_domain_t new_printf_domain(void)
{
  return (printf_domain_t)MEMORY[0x24BDAF100]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int proc_listallpids(void *buffer, int buffersize)
{
  return MEMORY[0x24BDAF6C8](buffer, *(_QWORD *)&buffersize);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF6E0](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x24BDAF6F8](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x24BDAFAE0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int register_printf_domain_function(printf_domain_t __domain, int __spec, printf_function *__render, printf_arginfo_function *__arginfo, void *__context)
{
  return MEMORY[0x24BDAFB18](__domain, *(_QWORD *)&__spec, __render, __arginfo, __context);
}

int register_printf_domain_render_std(printf_domain_t __domain, const char *__specs)
{
  return MEMORY[0x24BDAFB20](__domain, __specs);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x24BDAFCE8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x24BDAFD78](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x24BDAFE50](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

char *__cdecl stpncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFEC8](__dst, __src, __n);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x24BDAFF28](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x24BDB0308](uu1, uu2);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x24BDB0328](uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x24BDB0338](uu, out);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x24BDB0348](uu, out);
}

int vasxprintf(char **__ret, printf_domain_t __domain, locale_t __loc, const char *__format, va_list __ap)
{
  return MEMORY[0x24BDB0360](__ret, __domain, __loc, __format, __ap);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

uint64_t xpc_coalition_copy_info()
{
  return MEMORY[0x24BDB0708]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x24BDB0BA8](xstring);
}

