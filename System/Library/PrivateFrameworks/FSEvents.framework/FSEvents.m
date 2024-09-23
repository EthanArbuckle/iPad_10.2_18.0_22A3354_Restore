void __create_d2f_port_source_block_invoke(uint64_t a1)
{
  receive_and_dispatch_rcv_msg(*(_DWORD *)(a1 + 32));
}

CFArrayRef FSEventStreamCopyPathsBeingWatched(ConstFSEventStreamRef streamRef)
{
  const void **v2;
  const void **v3;
  CFIndex v4;
  const __CFAllocator *v5;
  uint64_t v6;
  CFStringRef v7;
  CFArrayRef v8;
  const __CFArray *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const void *v30;

  if (!streamRef)
  {
    v11 = fsevent_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      FSEventStreamCopyPathsBeingWatched_cold_1();
    return 0;
  }
  v2 = (const void **)malloc_type_calloc(*((_QWORD *)streamRef + 9), 8uLL, 0x6004044C4A2DFuLL);
  if (!v2)
  {
    v12 = fsevent_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      FSEventStreamCopyPathsBeingWatched_cold_2(v12, v13, v14, v15, v16, v17, v18, v19);
    return 0;
  }
  v3 = v2;
  v4 = *((_QWORD *)streamRef + 9);
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (v4 >= 1)
  {
    v6 = 0;
    while (1)
    {
      v7 = CFStringCreateWithFileSystemRepresentation(v5, *(const char **)(*((_QWORD *)streamRef + 10) + 8 * v6));
      if (!v7)
        break;
      v3[v6++] = v7;
      v4 = *((_QWORD *)streamRef + 9);
      if (v4 <= v6)
        goto LABEL_7;
    }
    v20 = fsevent_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      FSEventStreamCopyPathsBeingWatched_cold_3((_QWORD *)streamRef + 10, v6, v20);
    goto LABEL_20;
  }
LABEL_7:
  v8 = CFArrayCreate(v5, v3, v4, MEMORY[0x24BDBD690]);
  if (!v8)
  {
    v21 = fsevent_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      FSEventStreamCopyPathsBeingWatched_cold_4(v21, v22, v23, v24, v25, v26, v27, v28);
LABEL_20:
    if (*((uint64_t *)streamRef + 9) >= 1)
    {
      v29 = 0;
      do
      {
        v30 = v3[v29];
        if (!v30)
          break;
        CFRelease(v30);
        ++v29;
      }
      while (*((_QWORD *)streamRef + 9) > v29);
    }
    free(v3);
    return 0;
  }
  v9 = v8;
  if (*((uint64_t *)streamRef + 9) >= 1)
  {
    v10 = 0;
    do
      CFRelease(v3[v10++]);
    while (*((_QWORD *)streamRef + 9) > v10);
  }
  free(v3);
  return v9;
}

void receive_and_dispatch_rcv_msg(mach_port_name_t a1)
{
  uint64_t v2;
  uint64_t v3;
  mach_msg_header_t *v4;
  uint64_t v5;
  _DWORD *v6;
  mach_msg_return_t v7;
  mach_msg_size_t v8;
  mach_msg_header_t *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDB03C8];
  v3 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v4 = (mach_msg_header_t *)((char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v3);
  v6 = (_DWORD *)((char *)v12 - v5);
  v7 = mach_msg(v4, 50331910, 0, v2, a1, 0, 0);
  if (!v7)
  {
LABEL_8:
    v9 = (mach_msg_header_t *)((char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
    goto LABEL_9;
  }
  if (v7 != 268451844)
  {
    v11 = fsevent_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      receive_and_dispatch_rcv_msg_cold_1();
    goto LABEL_8;
  }
  v8 = v4->msgh_size + 68;
  v9 = (mach_msg_header_t *)malloc_type_malloc(v8, 0x34984651uLL);
  if (mach_msg(v9, 262, 0, v8, a1, 0, 0))
  {
    v10 = fsevent_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      receive_and_dispatch_rcv_msg_cold_2();
  }
LABEL_9:
  *v6 = 0;
  v6[1] = v2;
  FSEventsD2F_server(v9, (uint64_t)v6);
  if (v9 != v4)
    free(v9);
}

uint64_t FSEventsD2F_server(_DWORD *a1, uint64_t a2)
{
  unsigned int v2;
  int v3;
  uint64_t result;

  v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = a1[5] + 100;
  *(_QWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  if (a1[5] == 67000)
  {
    _Xcallback_rpc((uint64_t)a1, a2);
    return 1;
  }
  else
  {
    result = 0;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void _Xcallback_rpc(uint64_t a1, uint64_t a2)
{
  int v3;
  int v4;
  int v5;
  int v6;

  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 4 && *(_DWORD *)(a1 + 4) == 120)
  {
    if (*(_BYTE *)(a1 + 39) == 1 && *(_BYTE *)(a1 + 55) == 1 && *(_BYTE *)(a1 + 71) == 1 && *(_BYTE *)(a1 + 87) == 1)
    {
      v3 = *(_DWORD *)(a1 + 40) >> 2;
      if (v3 == *(_DWORD *)(a1 + 104))
      {
        v4 = *(_DWORD *)(a1 + 56) >> 2;
        if (v4 == *(_DWORD *)(a1 + 108))
        {
          v5 = *(_DWORD *)(a1 + 72) >> 3;
          if (v5 == *(_DWORD *)(a1 + 112) && *(_DWORD *)(a1 + 88) == *(_DWORD *)(a1 + 116))
          {
            *(_DWORD *)(a2 + 32) = implementation_callback_rpc(*(_DWORD *)(a1 + 12), *(unsigned int *)(a1 + 100), *(_QWORD *)(a1 + 28), v3, *(_BYTE **)(a1 + 44), v4, *(__CFArray **)(a1 + 60), v5, *(char **)(a1 + 76), *(_DWORD *)(a1 + 88));
            mig_deallocate(*(_QWORD *)(a1 + 76), *(unsigned int *)(a1 + 88));
            *(_QWORD *)(a1 + 76) = 0;
            *(_DWORD *)(a1 + 88) = 0;
            mig_deallocate(*(_QWORD *)(a1 + 60), *(unsigned int *)(a1 + 72));
            *(_QWORD *)(a1 + 60) = 0;
            *(_DWORD *)(a1 + 72) = 0;
            mig_deallocate(*(_QWORD *)(a1 + 44), *(unsigned int *)(a1 + 56));
            *(_QWORD *)(a1 + 44) = 0;
            *(_DWORD *)(a1 + 56) = 0;
            mig_deallocate(*(_QWORD *)(a1 + 28), *(unsigned int *)(a1 + 40));
            *(_QWORD *)(a1 + 28) = 0;
            *(_DWORD *)(a1 + 40) = 0;
            return;
          }
        }
      }
    }
    v6 = -300;
  }
  else
  {
    v6 = -304;
  }
  *(_DWORD *)(a2 + 32) = v6;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
}

void process_dir_events(int a1, _QWORD *a2)
{
  kevent *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t i;
  int64_t udata;
  uint64_t v10;
  int v11;
  int *v12;
  const char *v13;
  char **v14;
  uint32_t fflags;
  NSObject *v16;
  int v17;
  uint8_t *p_buf;
  NSObject *v19;
  const char *v20;
  uint32_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  char *v25;
  uint64_t v26;
  dev_t v27;
  __darwin_time_t v28;
  NSObject *v29;
  NSObject *v30;
  char *v31;
  NSObject *v32;
  char *v33;
  NSObject *v34;
  char *v35;
  char *v36;
  char *v37;
  int v38;
  NSObject *v39;
  dev_t v40;
  timespec timeout;
  uint8_t v42[4];
  const char *v43;
  __int16 v44;
  char *v45;
  stat buf;
  char __s1[1024];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v5 = a2[49];
  v4 = (kevent *)a2[50];
  v6 = a2[9];
  timeout.tv_sec = 0;
  timeout.tv_nsec = 0;
  v40 = v6;
  v7 = kevent(a1, 0, 0, v4, v6, &timeout);
  if ((v7 & 0x80000000) != 0)
  {
    v38 = *__error();
    v39 = fsevent_default_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      process_dir_events_cold_1(v38);
  }
  else if (v7)
  {
    for (i = v7; i; --i)
    {
      if ((int)v4->udata < 0)
        udata = (uint64_t)v4->udata & 0x7FFFFFFF;
      else
        udata = (int64_t)v4->udata;
      if (udata < 0
        || udata >= v40
        || (v10 = v5 + 32 * udata, v12 = (int *)(v10 + 4), v11 = *(_DWORD *)(v10 + 4), v11 < 0)
        || (v14 = (char **)(v10 + 24), (v13 = *(const char **)(v10 + 24)) == 0))
      {
        v22 = fsevent_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          if (udata >= v40)
          {
            v28 = 0;
            v27 = -1;
          }
          else
          {
            v26 = v5 + 32 * udata;
            v27 = *(_DWORD *)(v26 + 4);
            v28 = *(_QWORD *)(v26 + 24);
          }
          buf.st_dev = 136316162;
          *(_QWORD *)&buf.st_mode = "process_dir_events";
          WORD2(buf.st_ino) = 2048;
          *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = udata;
          HIWORD(buf.st_gid) = 1024;
          buf.st_rdev = v40;
          *((_WORD *)&buf.st_rdev + 2) = 1024;
          *(dev_t *)((char *)&buf.st_rdev + 6) = v27;
          WORD1(buf.st_atimespec.tv_sec) = 2048;
          *(__darwin_time_t *)((char *)&buf.st_atimespec.tv_sec + 4) = v28;
          p_buf = (uint8_t *)&buf;
          v19 = v22;
          v20 = "%s: index in event (%ld) not valid (%d max; fdtbl %d name %p)";
          v21 = 44;
          goto LABEL_39;
        }
      }
      else
      {
        if ((*(_BYTE *)v10 & 1) != 0)
        {
          if (watch_path("process_dir_events", a1, v13, (uint64_t)v4, v5 + 32 * udata, udata))
          {
            v23 = fsevent_default_log();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              v36 = *v14;
              buf.st_dev = 136315394;
              *(_QWORD *)&buf.st_mode = "process_dir_events";
              WORD2(buf.st_ino) = 2080;
              *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v36;
              _os_log_error_impl(&dword_206833000, v23, OS_LOG_TYPE_ERROR, "%s: creation: watch_path() failed for '%s'", (uint8_t *)&buf, 0x16u);
            }
          }
          if ((*(_BYTE *)v10 & 1) != 0)
            goto LABEL_17;
          root_dir_event_callback((uint64_t)a2, udata, 32);
          if ((*(_BYTE *)v10 & 8) == 0)
            goto LABEL_17;
          if (!watch_all_parents((uint64_t)"process_dir_events", a1, *v14, v5 + 32 * udata, udata))
            goto LABEL_17;
          v24 = fsevent_default_log();
          if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            goto LABEL_17;
          v25 = *v14;
          buf.st_dev = 136315394;
          *(_QWORD *)&buf.st_mode = "process_dir_events";
          WORD2(buf.st_ino) = 2080;
          *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v25;
          p_buf = (uint8_t *)&buf;
          v19 = v24;
          v20 = "%s: creation: watch_all_parents() failed for '%s'";
LABEL_51:
          v21 = 22;
          goto LABEL_39;
        }
        fflags = v4->fflags;
        if ((fflags & 0x22) == 0)
        {
          if ((fflags & 1) == 0)
            goto LABEL_17;
          root_dir_event_callback((uint64_t)a2, udata, 32);
          if (watch_path("process_dir_events", a1, *v14, (uint64_t)v4, v5 + 32 * udata, udata))
          {
            v29 = fsevent_default_log();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              v37 = *v14;
              buf.st_dev = 136315394;
              *(_QWORD *)&buf.st_mode = "process_dir_events";
              WORD2(buf.st_ino) = 2080;
              *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v37;
              _os_log_error_impl(&dword_206833000, v29, OS_LOG_TYPE_ERROR, "%s: delete: watch_path() failed for '%s'", (uint8_t *)&buf, 0x16u);
            }
          }
          if ((*(_BYTE *)v10 & 8) == 0)
            goto LABEL_17;
          if (!watch_all_parents((uint64_t)"process_dir_events", a1, *v14, v5 + 32 * udata, udata))
            goto LABEL_17;
          v30 = fsevent_default_log();
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            goto LABEL_17;
          v31 = *v14;
          buf.st_dev = 136315394;
          *(_QWORD *)&buf.st_mode = "process_dir_events";
          WORD2(buf.st_ino) = 2080;
          *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v31;
          p_buf = (uint8_t *)&buf;
          v19 = v30;
          v20 = "%s: delete: watch_all_parents() failed for '%s'";
          goto LABEL_51;
        }
        memset(&buf, 0, sizeof(buf));
        if (!fcntl(v11, 50, __s1))
        {
          if (!strcmp(__s1, *v14) && !lstat(__s1, &buf))
            goto LABEL_17;
          root_dir_event_callback((uint64_t)a2, udata, 32);
          if ((*(_BYTE *)v10 & 4) != 0)
          {
            free(*v14);
            *v14 = strdup(__s1);
          }
          else if (watch_path("process_dir_events", a1, *v14, (uint64_t)v4, v5 + 32 * udata, udata))
          {
            v32 = fsevent_default_log();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              v33 = *v14;
              *(_DWORD *)v42 = 136315394;
              v43 = "process_dir_events";
              v44 = 2080;
              v45 = v33;
              _os_log_error_impl(&dword_206833000, v32, OS_LOG_TYPE_ERROR, "%s: rename: watch_path() failed for '%s'", v42, 0x16u);
            }
          }
          if ((*(_BYTE *)v10 & 8) == 0)
            goto LABEL_17;
          if (!watch_all_parents((uint64_t)"process_dir_events", a1, *v14, v5 + 32 * udata, udata))
            goto LABEL_17;
          v34 = fsevent_default_log();
          if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            goto LABEL_17;
          v35 = *v14;
          *(_DWORD *)v42 = 136315394;
          v43 = "process_dir_events";
          v44 = 2080;
          v45 = v35;
          p_buf = v42;
          v19 = v34;
          v20 = "%s: rename: watch_all_parents() failed for '%s'";
          goto LABEL_51;
        }
        v16 = fsevent_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = *v12;
          *(_DWORD *)v42 = 136315394;
          v43 = "process_dir_events";
          v44 = 1024;
          LODWORD(v45) = v17;
          p_buf = v42;
          v19 = v16;
          v20 = "%s: failed to get the new path for fd %d";
          v21 = 18;
LABEL_39:
          _os_log_error_impl(&dword_206833000, v19, OS_LOG_TYPE_ERROR, v20, p_buf, v21);
        }
      }
LABEL_17:
      ++v4;
    }
  }
}

uint64_t implementation_callback_rpc(int a1, uint64_t a2, uint64_t a3, int a4, _BYTE *a5, int a6, __CFArray *a7, int a8, char *a9, int a10)
{
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  const __CFAllocator *v19;
  CFNumberRef v20;
  CFNumberRef v21;
  char *Value;
  uint64_t v23;
  size_t v24;
  int v25;
  unsigned int v26;
  int v27;
  int v28;
  int8x16_t v29;
  int8x8_t v30;
  unsigned __int32 v31;
  int v32;
  int v33;
  int v34;
  _QWORD *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _DWORD *v53;
  __int128 v54;
  _DWORD *v55;
  _DWORD *v56;
  _DWORD *v57;
  _QWORD *v58;
  __int128 v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  unsigned int v63;
  uint64_t v64;
  unsigned int v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  const char **v69;
  unsigned int v70;
  NSObject *v71;
  _BOOL4 v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  int v76;
  int v77;
  int v78;
  uint64_t v79;
  int v80;
  int v81;
  int v82;
  int v83;
  NSObject *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  NSObject *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  __CFArray *v101;
  CFArrayRef v102;
  const void **v103;
  NSObject *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  _QWORD *v112;
  int *v113;
  const char **v114;
  _DWORD *v115;
  size_t v116;
  unsigned int v117;
  NSObject *v118;
  _BOOL4 v119;
  uint64_t v120;
  const char *v121;
  int v122;
  int v123;
  int v124;
  uint64_t v125;
  int v126;
  int v127;
  int v128;
  int v129;
  NSObject *v130;
  NSObject *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  NSObject *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  unint64_t v147;
  unint64_t v148;
  unsigned int v149;
  uint64_t v150;
  int v151;
  CFMutableArrayRef Mutable;
  __int128 v153;
  CFIndex v154;
  const char *v155;
  int v156;
  const char *v157;
  CFStringRef v158;
  CFStringRef v159;
  CFNumberRef v160;
  CFNumberRef v161;
  NSObject *v162;
  CFNumberRef v163;
  CFNumberRef v164;
  NSObject *v165;
  const void **v166;
  uint64_t v167;
  const char *v168;
  CFStringRef v169;
  CFArrayRef v170;
  int v171;
  uint64_t v172;
  size_t v173;
  size_t v174;
  __CFDictionary *v175;
  _DWORD *v176;
  const char **v177;
  const char *v178;
  const char *v179;
  NSObject *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  NSObject *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  NSObject *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  NSObject *v204;
  NSObject *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  CFTypeRef *v213;
  __int128 v215;
  size_t v216;
  uint64_t v217;
  int *v218;
  int64_t v219;
  __int128 v220;
  CFAllocatorRef v221;
  os_log_t v222;
  _DWORD *v223;
  CFMutableArrayRef v224;
  __int128 v225;
  _QWORD *v226;
  const char **v227;
  _DWORD *v228;
  char *v229;
  __CFDictionary *v230;
  int valuePtr;
  uint8_t v232[4];
  int v233;
  uint8_t v234[4];
  int v235;
  uint8_t buf[4];
  const char *v237;
  __int16 v238;
  const char *v239;
  uint64_t v240;

  v15 = a2;
  v240 = *MEMORY[0x24BDAC8D0];
  valuePtr = a1;
  if ((_DWORD)a2 != a4)
  {
    v16 = fsevent_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      implementation_callback_rpc_cold_18();
  }
  if ((_DWORD)v15 != a6)
  {
    v17 = fsevent_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      implementation_callback_rpc_cold_17();
  }
  if ((_DWORD)v15 == a8 || (v18 = fsevent_default_log(), !os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)))
  {
    if ((_DWORD)v15)
      goto LABEL_10;
LABEL_89:
    v104 = fsevent_default_log();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
      implementation_callback_rpc_cold_1(v104, v105, v106, v107, v108, v109, v110, v111);
    return 4294967278;
  }
  implementation_callback_rpc_cold_16();
  if (!(_DWORD)v15)
    goto LABEL_89;
LABEL_10:
  v19 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v20 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &valuePtr);
  if (!v20)
  {
    v36 = fsevent_default_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      implementation_callback_rpc_cold_2(v36, v37, v38, v39, v40, v41, v42, v43);
    return 4294967279;
  }
  v21 = v20;
  pthread_mutex_lock(&FSEvents_streamDict_mutex);
  Value = (char *)CFDictionaryGetValue((CFDictionaryRef)FSEvents_streamDict, v21);
  pthread_mutex_unlock(&FSEvents_streamDict_mutex);
  CFRelease(v21);
  if (!Value)
  {
    v45 = fsevent_default_log();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      implementation_callback_rpc_cold_3(v45, v46, v47, v48, v49, v50, v51, v52);
    return 4294967286;
  }
  *(_QWORD *)&v225 = a3;
  v23 = 0;
  LODWORD(v24) = 0;
  v25 = 0;
  LODWORD(v230) = a10;
  v229 = a9;
  do
  {
    v26 = *(_DWORD *)&a5[v23];
    v27 = (v26 >> 29) | 4;
    if ((v26 & 0x80000000) == 0)
      v27 = (v26 >> 29) & 3;
    v28 = (v26 << 8) & 0x1000;
    if ((v26 & 0x20) != 0)
      v28 = 4096;
    v29 = vandq_s8((int8x16_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v26), (uint32x4_t)xmmword_20683E2D0), (int8x16_t)xmmword_20683E2E0);
    v30 = vorr_s8(*(int8x8_t *)v29.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v29, v29, 8uLL));
    v31 = v30.i32[0] | v26 & 0x100000 | v30.i32[1] | (v26 >> 4) & 0x40000 | (((v26 >> 19) & 1) << 21) | (v26 << 8) & 0x400F00 | v28 | v27;
    if ((v26 & 0x40) != 0)
      v31 |= 0xA000u;
    v32 = (v26 << 6) & 0x8000;
    if ((v26 & 0x400) != 0)
      v32 = 0x8000;
    *(_DWORD *)&a5[v23] = (v26 >> 2) & 0x80000 | (((v26 >> 8) & 1) << 14) | (((v26 >> 7) & 1) << 8) | v32 | v31;
    if ((v31 & 6) != 0)
    {
      v33 = *((_DWORD *)Value + 18);
      v25 = 1;
    }
    else
    {
      v33 = 1;
    }
    v24 = (v33 + v24);
    v23 += 4;
  }
  while (4 * v15 != v23);
  v34 = *((_DWORD *)Value + 46);
  if ((v34 & 0x40) != 0)
  {
    v35 = malloc_type_calloc(v24, 8uLL, 0x100004000313F17uLL);
    if ((*((_DWORD *)Value + 46) & 0x100) != 0)
      goto LABEL_27;
LABEL_35:
    v228 = 0;
    goto LABEL_36;
  }
  v35 = 0;
  if ((v34 & 0x100) == 0)
    goto LABEL_35;
LABEL_27:
  v228 = malloc_type_calloc(v24, 4uLL, 0x100004052888210uLL);
LABEL_36:
  if ((_DWORD)v15 == 1 && (*a5 & 0x10) != 0)
  {
    if (!Value[190])
      return 0;
    Value[190] = 0;
  }
  if (!Value[188])
    return 4294966297;
  v227 = (const char **)malloc_type_malloc(8 * v24, 0x10040436913F5uLL);
  if (!v227)
  {
    v84 = fsevent_default_log();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      implementation_callback_rpc_cold_4(v84, v85, v86, v87, v88, v89, v90, v91);
    v92 = 0;
    v44 = 4294967285;
    goto LABEL_227;
  }
  v219 = v15;
  v53 = malloc_type_calloc(v24, 4uLL, 0x100004052888210uLL);
  v223 = v53;
  if (!v53)
  {
    v93 = fsevent_default_log();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      implementation_callback_rpc_cold_5(v93, v94, v95, v96, v97, v98, v99, v100);
    v60 = 0;
    v57 = 0;
    v101 = 0;
    v102 = 0;
    v103 = 0;
    v44 = 4294967285;
    goto LABEL_210;
  }
  v55 = v53;
  v224 = a7;
  if (!v25)
  {
    v216 = 8 * v24;
    if (!(_DWORD)v24)
    {
      v57 = a5;
      v60 = v224;
      goto LABEL_133;
    }
    v217 = v15;
    v221 = v19;
    LODWORD(v218) = 0;
    v112 = v35;
    v113 = (int *)(v225 + 4);
    *(_QWORD *)&v54 = 136315394;
    v225 = v54;
    v114 = v227;
    v115 = v228;
    v116 = v24;
    v226 = v112;
    v117 = v230;
    while (1)
    {
      if (*(v113 - 1) >= v117)
      {
        v118 = fsevent_default_log();
        v119 = os_log_type_enabled(v118, OS_LOG_TYPE_ERROR);
        v117 = v230;
        if (v119)
        {
          *(_DWORD *)buf = v225;
          v237 = "implementation_callback_rpc";
          v238 = 2080;
          v239 = "path_offsets[i] < paths_blobCnt";
          _os_log_error_impl(&dword_206833000, v118, OS_LOG_TYPE_ERROR, "%s(): failed assertion '%s'\n", buf, 0x16u);
          v117 = v230;
        }
      }
      v120 = *(v113 - 1);
      if (v120 >= v117)
        v121 = "ERROR: failed assertion: path_offsets[i] < paths_blobCnt";
      else
        v121 = &v229[v120];
      *v114 = v121;
      if (v226)
      {
        v122 = strlen(v121);
        v117 = v230;
        v123 = (int)v230;
        if ((_DWORD)v24 != 1)
        {
          v123 = (int)v230;
          if ((_DWORD)v116 != 1)
            v123 = *v113;
        }
        v124 = v120 + v122 + 1;
        if (v124 == v123)
        {
          v125 = 0;
        }
        else
        {
          if (v124 + 8 > (unint64_t)v123)
            goto LABEL_110;
          v125 = *(_QWORD *)&v229[v124];
        }
        *v112 = v125;
      }
LABEL_110:
      if (v228)
      {
        v126 = strlen(v121);
        v117 = v230;
        v127 = (int)v230;
        if ((_DWORD)v24 != 1)
        {
          v127 = (int)v230;
          if ((_DWORD)v116 != 1)
            v127 = *v113;
        }
        v128 = v120 + v126 + 9;
        if (v128 == v127)
        {
          v129 = 0;
LABEL_118:
          *v115 = v129;
          goto LABEL_119;
        }
        if (v128 + 4 <= (unint64_t)v127)
        {
          v129 = *(_DWORD *)&v229[v128];
          goto LABEL_118;
        }
      }
LABEL_119:
      ++v115;
      ++v112;
      ++v113;
      ++v114;
      if (!--v116)
      {
        v57 = a5;
        v55 = v223;
        v60 = v224;
LABEL_128:
        v25 = (int)v218;
        v35 = v226;
        v19 = v221;
        LODWORD(v15) = v217;
        goto LABEL_133;
      }
    }
  }
  v56 = malloc_type_malloc(4 * v24, 0x100004052888210uLL);
  if (!v56)
  {
    v131 = fsevent_default_log();
    if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
      implementation_callback_rpc_cold_13(v131, v132, v133, v134, v135, v136, v137, v138);
    v60 = 0;
    v57 = 0;
    v101 = 0;
    v102 = 0;
    v103 = 0;
    v44 = 4294967281;
    goto LABEL_210;
  }
  v57 = v56;
  v216 = 8 * v24;
  v58 = malloc_type_malloc(v216, 0x100004000313F17uLL);
  if (!v58)
  {
    v139 = fsevent_default_log();
    if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
      implementation_callback_rpc_cold_14(v139, v140, v141, v142, v143, v144, v145, v146);
    v60 = 0;
    v101 = 0;
    v102 = 0;
    v103 = 0;
    v44 = 4294967280;
    goto LABEL_210;
  }
  v60 = v58;
  v221 = v19;
  v226 = v35;
  LODWORD(v218) = v25;
  v61 = v15;
  v62 = 0;
  v63 = 0;
  v217 = v61;
  if (v61 <= 1)
    v64 = 1;
  else
    v64 = v61;
  *(_QWORD *)&v59 = 136315394;
  v215 = v59;
  v65 = v230;
  *(_QWORD *)&v220 = v64;
  do
  {
    v66 = *(_DWORD *)&a5[4 * v62];
    v67 = *((_QWORD *)v224 + v62);
    if ((v66 & 6) == 0)
    {
      v70 = *(_DWORD *)(v225 + 4 * v62);
      LODWORD(v222) = v63;
      if (v70 >= v65)
      {
        v71 = fsevent_default_log();
        v72 = os_log_type_enabled(v71, OS_LOG_TYPE_ERROR);
        v63 = v222;
        v65 = v230;
        if (v72)
        {
          *(_DWORD *)buf = v215;
          v237 = "implementation_callback_rpc";
          v238 = 2080;
          v239 = "path_offsets[i] < paths_blobCnt";
          _os_log_error_impl(&dword_206833000, v71, OS_LOG_TYPE_ERROR, "%s(): failed assertion '%s'\n", buf, 0x16u);
          v63 = v222;
          v65 = v230;
        }
      }
      v73 = *(unsigned int *)(v225 + 4 * v62);
      v74 = &v229[v73];
      if (v73 >= v65)
        v74 = "ERROR: failed assertion: path_offsets[i] < paths_blobCnt";
      v75 = v63;
      v227[v63] = v74;
      if (v226)
      {
        v76 = strlen(v227[v62]);
        v65 = v230;
        v77 = (int)v230;
        if ((_DWORD)v24 != 1)
        {
          v77 = (int)v230;
          if (v62 != v24)
            v77 = *(_DWORD *)(v225 + 4 * v62 + 4);
        }
        v78 = v73 + v76 + 1;
        v63 = v222;
        if (v78 == v77)
        {
          v79 = 0;
        }
        else
        {
          if (v78 + 8 > (unint64_t)v77)
            goto LABEL_69;
          v79 = *(_QWORD *)&v229[v78];
        }
        v226[v75] = v79;
      }
LABEL_69:
      if (v228)
      {
        v80 = strlen(v227[v62]);
        v65 = v230;
        v81 = (int)v230;
        if ((_DWORD)v24 != 1)
        {
          v81 = (int)v230;
          if (v62 != v24)
            v81 = *(_DWORD *)(v225 + 4 * v62 + 4);
        }
        v82 = v73 + v80 + 9;
        v63 = v222;
        if (v82 == v81)
        {
          v83 = 0;
LABEL_77:
          v228[v75] = v83;
          goto LABEL_78;
        }
        if (v82 + 4 <= (unint64_t)v81)
        {
          v83 = *(_DWORD *)&v229[v82];
          goto LABEL_77;
        }
      }
LABEL_78:
      v57[v75] = v66;
      v60[v75] = v67;
      ++v63;
      v55 = v223;
      v64 = v220;
      goto LABEL_79;
    }
    if (*((uint64_t *)Value + 9) >= 1)
    {
      v68 = 0;
      v69 = v227;
      do
      {
        (&v69[v63])[v68] = *(const char **)(*((_QWORD *)Value + 10) + 8 * v68);
        v55[v63 + v68] = *(_DWORD *)(*((_QWORD *)Value + 11) + 4 * v68);
        v57[v63 + v68] = v66 | 1;
        v60[v63 + v68++] = v67;
      }
      while (*((_QWORD *)Value + 9) > v68);
      v63 += v68;
    }
LABEL_79:
    ++v62;
  }
  while (v62 != v64);
  if (v63 == (_DWORD)v24)
    goto LABEL_128;
  v130 = fsevent_default_log();
  v25 = (int)v218;
  v35 = v226;
  LODWORD(v15) = v217;
  if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
    implementation_callback_rpc_cold_15();
  v55 = v223;
  v19 = v221;
LABEL_133:
  v147 = 0;
  v148 = *((_QWORD *)Value + 21);
  if (v148 == -1)
    v148 = 0;
  if (v15 <= 1)
    v149 = 1;
  else
    v149 = v15;
  v150 = 8 * v149;
  do
  {
    if (v60[v147 / 8] > v148)
      v148 = v60[v147 / 8];
    v147 += 8;
  }
  while (v150 != v147);
  *((_QWORD *)Value + 21) = v148;
  v151 = *((_DWORD *)Value + 46);
  if ((v151 & 0x40) != 0)
  {
    Mutable = CFArrayCreateMutable(v19, v219, MEMORY[0x24BDBD690]);
    if (Mutable)
    {
      v101 = Mutable;
      if (!(_DWORD)v24)
      {
LABEL_175:
        v103 = 0;
        v102 = 0;
        goto LABEL_176;
      }
      v221 = v19;
      v154 = 0;
      v219 = (int64_t)&v235;
      v218 = &v233;
      *(_QWORD *)&v153 = 136315394;
      v220 = v153;
      v229 = (char *)v35;
      v224 = Mutable;
      *(_QWORD *)&v225 = v228;
      v226 = v35;
      while (1)
      {
        v155 = v227[v154];
        v156 = v223[v154];
        v230 = CFDictionaryCreateMutable(v221, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        if (!v230)
          break;
        v157 = caller_path(v155, v156);
        v158 = CFStringCreateWithFileSystemRepresentation(v221, v157);
        if (v158)
        {
          v159 = v158;
          CFDictionaryAddValue(v230, CFSTR("path"), v158);
          CFRelease(v159);
          v35 = v226;
          v101 = v224;
        }
        else
        {
          v222 = (os_log_t)fsevent_default_log();
          v35 = v226;
          v101 = v224;
          if (os_log_type_enabled(v222, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v220;
            v237 = "implementation_callback_rpc";
            v238 = 2080;
            v239 = v157;
            _os_log_error_impl(&dword_206833000, v222, OS_LOG_TYPE_ERROR, "%s: ERROR: CFStringCreateWithFileSystemRepresentation('%s') failed", buf, 0x16u);
          }
        }
        if ((*(_DWORD *)&a5[4 * v154] & 0x77FF00) != 0)
        {
          if (v35 && *(_QWORD *)v229)
          {
            v160 = CFNumberCreate(v221, kCFNumberSInt64Type, v229);
            if (v160)
            {
              v161 = v160;
              CFDictionaryAddValue(v230, CFSTR("fileID"), v160);
              CFRelease(v161);
            }
            else
            {
              v162 = fsevent_default_log();
              if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
                implementation_callback_rpc_cold_11(v234, (_QWORD *)v219, v162);
            }
          }
          if (v228 && *(_DWORD *)v225)
          {
            v163 = CFNumberCreate(v221, kCFNumberSInt32Type, (const void *)v225);
            if (v163)
            {
              v164 = v163;
              CFDictionaryAddValue(v230, CFSTR("docID"), v163);
              CFRelease(v164);
            }
            else
            {
              v165 = fsevent_default_log();
              if (os_log_type_enabled(v165, OS_LOG_TYPE_ERROR))
                implementation_callback_rpc_cold_11(v232, v218, v165);
            }
          }
        }
        CFArraySetValueAtIndex(v101, v154, v230);
        CFRelease(v230);
        ++v154;
        *(_QWORD *)&v225 = v225 + 4;
        v229 += 8;
        if (v24 == v154)
          goto LABEL_175;
      }
      v188 = fsevent_default_log();
      if (os_log_type_enabled(v188, OS_LOG_TYPE_ERROR))
        implementation_callback_rpc_cold_10(v188, v189, v190, v191, v192, v193, v194, v195);
      v102 = 0;
      v103 = 0;
      v44 = 4294967281;
      v35 = v226;
      v101 = v224;
      goto LABEL_210;
    }
    v180 = fsevent_default_log();
    if (os_log_type_enabled(v180, OS_LOG_TYPE_ERROR))
      implementation_callback_rpc_cold_9(v180, v181, v182, v183, v184, v185, v186, v187);
    v101 = 0;
    v102 = 0;
    v103 = 0;
LABEL_191:
    v44 = 4294967282;
    goto LABEL_210;
  }
  if ((v151 & 1) != 0)
  {
    v166 = (const void **)malloc_type_calloc(v24, 8uLL, 0x6004044C4A2DFuLL);
    if (!v166)
    {
      v196 = fsevent_default_log();
      if (os_log_type_enabled(v196, OS_LOG_TYPE_ERROR))
        implementation_callback_rpc_cold_6(v196, v197, v198, v199, v200, v201, v202, v203);
      v101 = 0;
      v102 = 0;
      v103 = 0;
      v44 = 4294967284;
      goto LABEL_210;
    }
    v103 = v166;
    v226 = v35;
    if ((_DWORD)v24)
    {
      v167 = 0;
      while (1)
      {
        v168 = caller_path(v227[v167], v55[v167]);
        v169 = CFStringCreateWithFileSystemRepresentation(v19, v168);
        if (!v169)
          break;
        v103[v167++] = v169;
        if (v24 == v167)
          goto LABEL_173;
      }
      v204 = fsevent_default_log();
      if (os_log_type_enabled(v204, OS_LOG_TYPE_ERROR))
        implementation_callback_rpc_cold_8();
      v101 = 0;
      v102 = 0;
      v44 = 4294967283;
      v35 = v226;
      goto LABEL_210;
    }
LABEL_173:
    v170 = CFArrayCreate(v19, v103, v24, MEMORY[0x24BDBD690]);
    if (v170)
    {
      v102 = v170;
      v101 = 0;
      v35 = v226;
      goto LABEL_176;
    }
    v205 = fsevent_default_log();
    v35 = v226;
    if (os_log_type_enabled(v205, OS_LOG_TYPE_ERROR))
      implementation_callback_rpc_cold_7(v205, v206, v207, v208, v209, v210, v211, v212);
    v101 = 0;
    v102 = 0;
    goto LABEL_191;
  }
  v103 = 0;
  v102 = 0;
  v101 = 0;
LABEL_176:
  if (*((_QWORD *)Value + 2) && Value[188] && !Value[189])
  {
    FSEventStreamRetain((FSEventStreamRef)Value);
    v171 = *((_DWORD *)Value + 46);
    if ((v171 & 0x40) != 0)
    {
      (*((void (**)(char *, _QWORD, size_t, __CFArray *, _DWORD *, _QWORD *))Value + 2))(Value, *((_QWORD *)Value + 4), v24, v101, v57, v60);
    }
    else if ((v171 & 1) != 0)
    {
      (*((void (**)(char *, _QWORD, size_t, CFArrayRef, _DWORD *, _QWORD *))Value + 2))(Value, *((_QWORD *)Value + 4), v24, v102, v57, v60);
    }
    else
    {
      v224 = v101;
      v226 = v35;
      LODWORD(v218) = v25;
      v229 = (char *)&v215;
      MEMORY[0x24BDAC7A8]();
      if (v216 >= 0x200)
        v173 = 512;
      else
        v173 = v216;
      v230 = (__CFDictionary *)((char *)&v215 - ((v172 + 15) & 0xFFFFFFFF0));
      bzero(v230, v173);
      if ((_DWORD)v24)
      {
        v174 = v24;
        v175 = v230;
        v176 = v223;
        v177 = v227;
        do
        {
          v179 = *v177++;
          v178 = v179;
          LODWORD(v179) = *v176++;
          *(_QWORD *)v175 = caller_path(v178, (char)v179);
          v175 = (__CFDictionary *)((char *)v175 + 8);
          --v174;
        }
        while (v174);
      }
      (*((void (**)(char *, _QWORD, size_t, __CFDictionary *, _DWORD *, _QWORD *))Value + 2))(Value, *((_QWORD *)Value + 4), v24, v230, v57, v60);
      v25 = (int)v218;
      v35 = v226;
      v101 = v224;
    }
    if (*((_QWORD *)Value + 45))
    {
      pthread_mutex_lock((pthread_mutex_t *)(Value + 240));
      pthread_cond_signal((pthread_cond_t *)(Value + 304));
      pthread_mutex_unlock((pthread_mutex_t *)(Value + 240));
    }
    FSEventStreamRelease((FSEventStreamRef)Value);
  }
  v44 = 0;
LABEL_210:
  free(v227);
  if (v57 && v25)
    free(v57);
  if (v60 && v25)
    free(v60);
  if (v103)
  {
    if ((_DWORD)v24)
    {
      v213 = v103;
      do
      {
        if (!*v213)
          break;
        CFRelease(*v213++);
        --v24;
      }
      while (v24);
    }
    free(v103);
  }
  if (v102)
    CFRelease(v102);
  if (v101)
    CFRelease(v101);
  v92 = v223;
LABEL_227:
  if (v35)
    free(v35);
  free(v92);
  return v44;
}

uint64_t watch_path(const char *a1, int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v10;
  int v11;
  int v12;
  BOOL v13;
  uint64_t v14;
  unsigned int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  unsigned int v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  NSObject *v25;
  int *v26;
  char *v27;
  int *v28;
  char *v29;
  NSObject *v30;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  char *v36;
  uint64_t v37;
  int v38;
  stat v41;
  stat v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  char *p_s;
  __int16 v47;
  int v48;
  __int16 v49;
  _BYTE v50[10];
  _QWORD v51[124];
  char __s;
  char v53;
  char v54[1024];
  uint64_t v55;

  v10 = 0;
  v55 = *MEMORY[0x24BDAC8D0];
  memset(&v42, 0, sizeof(v42));
  v11 = -1;
  memset(&v41, 0, sizeof(v41));
  v12 = 1;
  v13 = 1;
  v14 = 0xFFFFFFFFLL;
  while (1)
  {
    v15 = v10;
    v10 = v12;
    realpath_DARWIN_EXTSN(a3, &__s);
    if (v53)
    {
      v16 = 0;
      while (1)
      {
        v17 = open(&__s, 0x8000);
        if ((v17 & 0x80000000) == 0)
          break;
        __error();
        my_dirname(&__s, v54);
        realpath_DARWIN_EXTSN(v54, &__s);
        ++v16;
        if (!v53)
          goto LABEL_8;
      }
      v11 = v17;
LABEL_11:
      v14 = 0;
      goto LABEL_12;
    }
    v16 = 0;
    if (v11 < 0)
    {
LABEL_8:
      v11 = open(&__s, 0x8000);
      if (v11 < 0)
      {
        v30 = fsevent_default_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          watch_path_cold_2();
        __error();
        v32 = fsevent_default_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          watch_path_cold_1();
        v14 = *__error();
        goto LABEL_45;
      }
      goto LABEL_11;
    }
LABEL_12:
    fcntl(v11, 2, 1);
    if (v13 || (v18 = open(&__s, 0), v18 < 0))
    {
      v20 = v15;
    }
    else
    {
      v19 = v18;
      fstat(v11, &v42);
      fstat(v19, &v41);
      close(v19);
      close(v11);
      if (v42.st_ino == v41.st_ino)
      {
        v33 = fsevent_default_log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          watch_path_cold_3();
        v11 = -1;
        goto LABEL_45;
      }
      v20 = v15;
      v11 = -1;
    }
    *(_QWORD *)a4 = v11;
    *(_QWORD *)(a4 + 8) = 0x270021FFFCLL;
    *(_QWORD *)(a4 + 16) = 0;
    *(_QWORD *)(a4 + 24) = a6;
    v14 = kevent(a2, (const kevent *)a4, 1, 0, 0, 0);
    if ((v14 & 0x80000000) != 0)
    {
      v21 = fsevent_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v37 = *(_QWORD *)(a5 + 24);
        v26 = __error();
        v27 = strerror(*v26);
        *(_DWORD *)buf = 136316162;
        v44 = a1;
        v45 = 2080;
        p_s = "watch_path";
        v47 = 1024;
        v48 = v11;
        v49 = 2080;
        *(_QWORD *)v50 = v37;
        *(_WORD *)&v50[8] = 2080;
        v51[0] = v27;
        _os_log_error_impl(&dword_206833000, v21, OS_LOG_TYPE_ERROR, "%s: %s: error trying to add kqueue for fd %d (%s; %s)",
          buf,
          0x30u);
      }
    }
    v22 = *(unsigned int *)(a5 + 4);
    if ((v22 & 0x80000000) == 0)
    {
      *(_QWORD *)a4 = v22;
      *(_QWORD *)(a4 + 8) = 0x270002FFFCLL;
      *(_QWORD *)(a4 + 16) = 0;
      *(_QWORD *)(a4 + 24) = a6;
      v14 = kevent(a2, (const kevent *)a4, 1, 0, 0, 0);
      if ((v14 & 0x80000000) != 0)
      {
        v23 = fsevent_default_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v38 = *(_DWORD *)(a5 + 4);
          v28 = __error();
          v29 = strerror(*v28);
          *(_DWORD *)buf = 136315906;
          v44 = a1;
          v45 = 2080;
          p_s = "watch_path";
          v47 = 1024;
          v48 = v38;
          v49 = 2080;
          *(_QWORD *)v50 = v29;
          _os_log_error_impl(&dword_206833000, v23, OS_LOG_TYPE_ERROR, "%s: %s: error removing fd %d from kqueue (%s)", buf, 0x26u);
        }
      }
      close(*(_DWORD *)(a5 + 4));
    }
    *(_DWORD *)a5 = *(_DWORD *)a5 & 0xFFFFFFFE | (v16 != 0);
    *(_DWORD *)(a5 + 4) = v11;
    v24 = open(&__s, 0);
    if (v24 < 0)
      break;
    fstat(v11, &v42);
    fstat(v24, &v41);
    close(v24);
    if (v42.st_ino == v41.st_ino)
      goto LABEL_39;
    v25 = fsevent_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "watch_path";
      v45 = 2080;
      p_s = &__s;
      _os_log_error_impl(&dword_206833000, v25, OS_LOG_TYPE_ERROR, "%s: watching path(%s) renamed while registering watchroot", buf, 0x16u);
    }
LABEL_30:
    v13 = v24 >= 0;
    v12 = v10 + 1;
    if (v10 == 1000)
    {
      v10 = 1001;
      goto LABEL_45;
    }
  }
  if ((*(_DWORD *)a5 & 5) != 4)
    goto LABEL_30;
  if (!fcntl(*(_DWORD *)(a5 + 4), 50, buf))
  {
    free(*(void **)(a5 + 24));
    *(_QWORD *)(a5 + 24) = strdup((const char *)buf);
  }
LABEL_39:
  if (v20 <= 0x3E6 && (v11 & 0x80000000) == 0)
    return 0;
LABEL_45:
  v34 = fsevent_default_log();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    v36 = strerror(v14);
    *(_DWORD *)buf = 136316418;
    v44 = "watch_path";
    v45 = 2080;
    p_s = (char *)a3;
    v47 = 1024;
    v48 = v11;
    v49 = 1024;
    *(_DWORD *)v50 = v10;
    *(_WORD *)&v50[4] = 1024;
    *(_DWORD *)&v50[6] = v14;
    LOWORD(v51[0]) = 2080;
    *(_QWORD *)((char *)v51 + 2) = v36;
    _os_log_error_impl(&dword_206833000, v34, OS_LOG_TYPE_ERROR, "%s: watching path (%s) fd(%d) retry (%d) failed (%d):(%s)", buf, 0x32u);
  }
  return v14;
}

char *my_dirname(char *__s, char *a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;

  if (__s && *__s && (v4 = strrchr(__s, 47)) != 0)
  {
    if (v4 > __s)
    {
      while (*v4 == 47)
      {
        if (--v4 <= __s)
        {
          v4 = __s;
          break;
        }
      }
    }
    v5 = v4 - __s;
    if (v4 - __s > 1023)
    {
      strncpy(a2, __s, 0x3FFuLL);
      a2[1023] = 0;
    }
    else
    {
      v6 = v5 + 1;
      strncpy(a2, __s, v5 + 1);
      a2[v6] = 0;
    }
  }
  else
  {
    strcpy(a2, "./");
  }
  return a2;
}

const char *caller_path(const char *a1, char a2)
{
  const char *v2;

  v2 = a1;
  if (!(a2 & 3 | strncmp(a1, "/System/Volumes/Data/", 0x15uLL)))
  {
    if (!strncmp(v2 + 20, "/Device/", 8uLL))
      v2 += 27;
    else
      v2 += 20;
  }
  return v2;
}

void FSEventStreamRelease(FSEventStreamRef streamRef)
{
  unsigned int v1;
  BOOL v2;
  signed int v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (streamRef)
  {
    do
    {
      v1 = __ldaxr((unsigned int *)streamRef);
      v2 = __OFSUB__(v1, 1);
      v3 = v1 - 1;
    }
    while (__stlxr(v3, (unsigned int *)streamRef));
    if ((v3 < 0) ^ v2 | (v3 == 0))
    {
      if ((*(_DWORD *)streamRef & 0x80000000) != 0)
      {
        v5 = fsevent_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          FSEventStreamRelease_cold_2(v5, v6, v7, v8, v9, v10, v11, v12);
      }
      else
      {
        _FSEventStreamDeallocate((char *)streamRef);
      }
    }
  }
  else
  {
    v4 = fsevent_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      FSEventStreamRelease_cold_1();
  }
}

void FSEventStreamRetain(FSEventStreamRef streamRef)
{
  unsigned int v1;
  NSObject *v2;

  if (streamRef)
  {
    do
      v1 = __ldaxr((unsigned int *)streamRef);
    while (__stlxr(v1 + 1, (unsigned int *)streamRef));
  }
  else
  {
    v2 = fsevent_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      FSEventStreamRetain_cold_1();
  }
}

uint64_t fsevent_default_log()
{
  if (fsevent_default_log_once != -1)
    dispatch_once(&fsevent_default_log_once, &__block_literal_global);
  return fsevent_default_log_logger;
}

os_log_t __fsevent_default_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.fsevents", "client");
  fsevent_default_log_logger = (uint64_t)result;
  return result;
}

Boolean FSEventStreamStart(FSEventStreamRef streamRef)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  int v5;
  __CFFileDescriptor *v6;
  NSObject *v7;
  NSObject *v8;
  __CFMachPort *v9;
  NSObject *v10;
  CFMachPortContext context;

  if (!streamRef)
  {
    v4 = fsevent_default_log();
    v3 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if (!v3)
      return v3;
    FSEventStreamStart_cold_1();
    goto LABEL_20;
  }
  if (*((_BYTE *)streamRef + 188))
  {
    v2 = fsevent_default_log();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);
    if (!v3)
      return v3;
    FSEventStreamStart_cold_3();
    goto LABEL_20;
  }
  if (!*((_QWORD *)streamRef + 27) && !*((_QWORD *)streamRef + 45))
  {
    v8 = fsevent_default_log();
    v3 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (!v3)
      return v3;
    FSEventStreamStart_cold_2();
    goto LABEL_20;
  }
  v5 = *((_DWORD *)streamRef + 46);
  if ((v5 & 4) != 0 && !*((_QWORD *)streamRef + 54) && !*((_QWORD *)streamRef + 52) && !*((_QWORD *)streamRef + 53))
  {
LABEL_20:
    LOBYTE(v3) = 0;
    return v3;
  }
  if (!*((_DWORD *)streamRef + 49))
  {
    if (!register_with_server((uint64_t)streamRef, (uint64_t)"FSEventStreamStart", *((_DWORD *)streamRef + 48), *((_DWORD *)streamRef + 16), *((_DWORD *)streamRef + 18), *((const void ***)streamRef + 10), *((_QWORD *)streamRef + 21), *((_QWORD *)streamRef + 22), v5, (_DWORD *)streamRef + 49))
    {
      *((_BYTE *)streamRef + 188) = 1;
      if (*((_QWORD *)streamRef + 27))
      {
        context.version = 0;
        context.info = streamRef;
        context.retain = (const void *(__cdecl *)(const void *))_FSEventStreamRetainAndReturnSelf;
        context.release = (void (__cdecl *)(const void *))FSEventStreamRelease;
        context.copyDescription = (CFStringRef (__cdecl *)(const void *))FSEventStreamCopyDescription;
        v9 = CFMachPortCreateWithPort(0, *((_DWORD *)streamRef + 49), (CFMachPortCallBack)FSEventsClientPortCallback, &context, 0);
        *((_QWORD *)streamRef + 26) = v9;
        CFMachPortSetInvalidationCallBack(v9, (CFMachPortInvalidationCallBack)server_gone_callback);
      }
      else
      {
        v10 = *((_QWORD *)streamRef + 45);
        if (v10)
        {
          resume_source(v10, (int *)streamRef + 92);
          if (create_f2d_private_port_source((uint64_t)streamRef))
            resume_source(*((NSObject **)streamRef + 47), (int *)streamRef + 96);
        }
      }
      goto LABEL_14;
    }
    goto LABEL_20;
  }
LABEL_14:
  v6 = (__CFFileDescriptor *)*((_QWORD *)streamRef + 52);
  if (v6)
    CFFileDescriptorEnableCallBacks(v6, 1uLL);
  v7 = *((_QWORD *)streamRef + 54);
  if (v7)
    resume_source(v7, (int *)streamRef + 110);
  LOBYTE(v3) = 1;
  return v3;
}

uint64_t register_with_server(uint64_t a1, uint64_t a2, int a3, int a4, int a5, const void **a6, uint64_t a7, uint64_t a8, int a9, _DWORD *a10)
{
  uint64_t v17;
  _DWORD *v19;
  _DWORD *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  const char **v24;
  _DWORD *v25;
  const char *v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  int v30;
  char *v31;
  int v32;
  _DWORD *v33;
  int *v34;
  int v35;
  int v36;
  const void *v37;
  int v38;
  NSObject *v39;
  uint64_t v40;
  int v41;
  size_t v42;
  const char **v43;
  uint64_t v44;
  const char *v45;
  NSObject *v46;
  _DWORD *v47;
  uint64_t v48;
  _DWORD *v49;
  char *v50;
  uint64_t v51;
  int v52;
  char *v53;
  uint64_t v54;
  size_t v55;
  int v56;
  NSObject *v57;
  NSObject *v58;
  NSObject *v59;
  char *v60;
  _DWORD *v61;
  uint64_t v62;
  int v63;
  int v64;
  int v65;
  uint64_t v66;
  _DWORD *v67;

  v17 = FSEvents_connect();
  if ((_DWORD)v17)
    return v17;
  v66 = a7;
  v19 = malloc_type_malloc(4 * a5, 0x100004052888210uLL);
  if (v19)
  {
    v20 = v19;
    v67 = malloc_type_malloc(4 * a5, 0x100004052888210uLL);
    if (v67)
    {
      v62 = a8;
      v65 = a3;
      v63 = a4;
      v21 = a5;
      if (a5 < 1)
      {
        v22 = 0;
      }
      else
      {
        v22 = 0;
        v23 = a5;
        v24 = (const char **)a6;
        v25 = v20;
        do
        {
          v26 = *v24++;
          v27 = strlen(v26);
          *v25++ = v27;
          v22 += v27;
          --v23;
        }
        while (v23);
      }
      v30 = v22 + a5;
      v31 = (char *)malloc_type_malloc(v22 + a5, 0x6D242494uLL);
      if (!v31)
      {
        v46 = fsevent_default_log();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          register_with_server_cold_3();
        v40 = 0;
        v47 = 0;
        v17 = 4294967293;
        goto LABEL_49;
      }
      v64 = v30;
      v61 = v20;
      v32 = 0;
      if (a5 >= 1)
      {
        v33 = v67;
        v34 = v20;
        do
        {
          *v33++ = v32;
          v35 = *v34++;
          v36 = v35 + 1;
          v37 = *a6++;
          memcpy(&v31[v32], v37, v36);
          v32 += v36;
          --v21;
        }
        while (v21);
      }
      v38 = v64;
      if (v32 != v64)
      {
        v39 = fsevent_default_log();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          register_with_server_cold_7();
      }
      v40 = *(_QWORD *)(a1 + 96);
      v41 = v65;
      if (v40)
      {
        if (v40 < 1)
        {
          v42 = 0;
          v20 = v61;
        }
        else
        {
          v42 = 0;
          v43 = (const char **)(a1 + 104);
          v44 = *(_QWORD *)(a1 + 96);
          v20 = v61;
          do
          {
            v45 = *v43++;
            v42 += strlen(v45) + 1;
            --v44;
          }
          while (v44);
        }
        v49 = malloc_type_malloc(4 * v40, 0x100004052888210uLL);
        if (!v49)
        {
          v57 = fsevent_default_log();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            register_with_server_cold_5();
          v40 = 0;
          v47 = 0;
          v17 = 4294967292;
          goto LABEL_49;
        }
        v47 = v49;
        v50 = (char *)malloc_type_malloc(v42, 0x1CED7B04uLL);
        if (!v50)
        {
          v58 = fsevent_default_log();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            register_with_server_cold_6();
          v40 = 0;
          v17 = 4294967291;
          goto LABEL_49;
        }
        v40 = (uint64_t)v50;
        v48 = *(_QWORD *)(a1 + 96);
        if (v48 < 1)
        {
          v38 = v64;
        }
        else
        {
          v60 = v31;
          v51 = 0;
          v52 = 0;
          v53 = v50;
          v54 = a1 + 104;
          do
          {
            v47[v51] = v52;
            v55 = strlen(*(const char **)(v54 + 8 * v51));
            v56 = v55 + 1;
            memcpy(&v53[v52], *(const void **)(v54 + 8 * v51), v55 + 1);
            v52 += v56;
            ++v51;
            v48 = *(_QWORD *)(a1 + 96);
          }
          while (v48 > v51);
          v20 = v61;
          v41 = v65;
          v38 = v64;
          v40 = (uint64_t)v53;
          v31 = v60;
        }
      }
      else
      {
        LODWORD(v48) = 0;
        LODWORD(v42) = 0;
        v47 = 0;
        v20 = v61;
      }
      v17 = f2d_register_rpc(FSEvents_f2d_public_port, v41, v63, a5, (uint64_t)v67, a5, (uint64_t)v31, v38, v48, (uint64_t)v47, v48, v40, v42, v62, a9, v66, a10);
      if ((_DWORD)v17)
      {
        v59 = fsevent_default_log();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          register_with_server_cold_4();
      }
LABEL_49:
      free(v20);
      free(v67);
      if (v31)
        free(v31);
      if (v47)
        free(v47);
      if (v40)
        free((void *)v40);
      return v17;
    }
    v29 = fsevent_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      register_with_server_cold_2();
    free(v20);
    return 4294967294;
  }
  else
  {
    v28 = fsevent_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      register_with_server_cold_1();
    return 0xFFFFFFFFLL;
  }
}

unsigned int *_FSEventStreamRetainAndReturnSelf(unsigned int *a1)
{
  unsigned int v2;
  NSObject *v3;

  if (a1)
  {
    do
      v2 = __ldaxr(a1);
    while (__stlxr(v2 + 1, a1));
  }
  else
  {
    v3 = fsevent_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      _FSEventStreamRetainAndReturnSelf_cold_1();
  }
  return a1;
}

CFStringRef FSEventStreamCopyDescription(ConstFSEventStreamRef streamRef)
{
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  int v14;
  const __CFString *v15;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (!streamRef)
  {
    v17 = fsevent_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      FSEventStreamCopyDescription_cold_1();
    return 0;
  }
  v2 = (char *)malloc_type_malloc((*((_DWORD *)streamRef + 18) << 10) + 1024, 0x9B632473uLL);
  if (!v2)
  {
    v18 = fsevent_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      FSEventStreamCopyDescription_cold_2(v18, v19, v20, v21, v22, v23, v24, v25);
    return 0;
  }
  v3 = v2;
  v4 = &v2[sprintf(v2, "FSEventStreamRef @ %p:\n", streamRef)];
  v5 = &v4[sprintf(v4, "   allocator = %p\n", *((const void **)streamRef + 1))];
  v6 = &v5[sprintf(v5, "   callback = %p\n", *((const void **)streamRef + 2))];
  v7 = &v6[sprintf(v6, "   context = {%lu, %p, %p, %p, %p}\n", *((_QWORD *)streamRef + 3), *((const void **)streamRef + 4), *((const void **)streamRef + 5), *((const void **)streamRef + 6), *((const void **)streamRef + 7))];
  v8 = &v7[sprintf(v7, "   numPathsToWatch = %lu\n", *((_QWORD *)streamRef + 9))];
  v9 = &v8[sprintf(v8, "   pathsToWatch = %p\n", *((const void **)streamRef + 10))];
  if (*((uint64_t *)streamRef + 9) >= 1)
  {
    v10 = 0;
    do
    {
      v9 += sprintf(v9, "        pathsToWatch[%d] = '%s'\n", v10, *(const char **)(*((_QWORD *)streamRef + 10) + 8 * v10));
      ++v10;
    }
    while (*((_QWORD *)streamRef + 9) > v10);
  }
  v11 = &v9[sprintf(v9, "   latestEventId = %lld\n", *((_QWORD *)streamRef + 21))];
  v12 = &v11[sprintf(v11, "   latency = %llu (microseconds)\n", *((_QWORD *)streamRef + 22))];
  v13 = &v12[sprintf(v12, "   flags = 0x%08x\n", *((_DWORD *)streamRef + 46))];
  v14 = sprintf(v13, "\trunLoop = %p\n", *((const void **)streamRef + 28));
  sprintf(&v13[v14], "\trunLoopMode = %p\n", *((const void **)streamRef + 29));
  v15 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], v3, 0x8000100u);
  free(v3);
  return v15;
}

void FSEventsClientPortCallback()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = fsevent_default_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    FSEventsClientPortCallback_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

void server_gone_callback(uint64_t a1, uint64_t a2)
{
  server_gone_StreamRef_callback(a2);
}

BOOL create_f2d_private_port_source(uint64_t a1)
{
  uintptr_t v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD v6[6];
  int v7;
  _QWORD handler[5];

  v2 = *(unsigned int *)(a1 + 196);
  v3 = dispatch_source_create(MEMORY[0x24BDAC9E8], v2, 1uLL, *(dispatch_queue_t *)(a1 + 352));
  if (v3)
  {
    FSEventStreamRetain((FSEventStreamRef)a1);
    dispatch_set_qos_class_fallback();
    v4 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 0x40000000;
    handler[2] = __create_f2d_private_port_source_block_invoke;
    handler[3] = &__block_descriptor_tmp_52;
    handler[4] = a1;
    dispatch_source_set_event_handler(v3, handler);
    v6[0] = v4;
    v6[1] = 0x40000000;
    v6[2] = __create_f2d_private_port_source_block_invoke_2;
    v6[3] = &__block_descriptor_tmp_53;
    v7 = v2;
    v6[4] = v3;
    v6[5] = a1;
    dispatch_source_set_cancel_handler(v3, v6);
    *(_QWORD *)(a1 + 376) = v3;
    *(_DWORD *)(a1 + 384) = 1;
  }
  return v3 != 0;
}

void FSEventStreamStop(FSEventStreamRef streamRef)
{
  NSObject *v2;
  uint64_t v3;
  __CFMachPort *v4;
  __CFFileDescriptor *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;

  if (streamRef)
  {
    if (*((_BYTE *)streamRef + 188))
    {
      if (*((_DWORD *)streamRef + 49))
      {
        v2 = *((_QWORD *)streamRef + 45);
        if (v2 && *((_DWORD *)streamRef + 92) == 3)
        {
          dispatch_suspend(v2);
          *((_DWORD *)streamRef + 92) = 2;
        }
        v3 = *((_QWORD *)streamRef + 47);
        if (v3)
        {
          cancel_source((NSObject **)streamRef + 47, (int *)streamRef + 96);
          *((_DWORD *)streamRef + 49) = 0;
        }
        v4 = (__CFMachPort *)*((_QWORD *)streamRef + 26);
        if (v4)
        {
          CFMachPortSetInvalidationCallBack(v4, 0);
          CFMachPortInvalidate(*((CFMachPortRef *)streamRef + 26));
          CFRelease(*((CFTypeRef *)streamRef + 26));
          *((_QWORD *)streamRef + 26) = 0;
        }
        if (!v3)
        {
          dispose_f2d_private_port(*((_DWORD *)streamRef + 49));
          *((_DWORD *)streamRef + 49) = 0;
        }
        v5 = (__CFFileDescriptor *)*((_QWORD *)streamRef + 52);
        if (v5)
          CFFileDescriptorDisableCallBacks(v5, 1uLL);
        v6 = *((_QWORD *)streamRef + 54);
        if (v6)
        {
          if (*((_DWORD *)streamRef + 110) == 3)
          {
            dispatch_suspend(v6);
            *((_DWORD *)streamRef + 110) = 2;
          }
        }
        *((_BYTE *)streamRef + 188) = 0;
      }
      else
      {
        v8 = fsevent_default_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          FSEventStreamStop_cold_2();
      }
    }
  }
  else
  {
    v7 = fsevent_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      FSEventStreamStop_cold_1();
  }
}

void dispose_f2d_private_port(mach_port_name_t a1)
{
  NSObject *v2;
  kern_return_t v3;
  mach_error_t v4;
  NSObject *v5;

  if (a1)
  {
    if (f2d_unregister_rpc(a1))
    {
      v2 = fsevent_default_log();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        dispose_f2d_private_port_cold_2();
    }
    else
    {
      v3 = mach_port_deallocate(*MEMORY[0x24BDAEC58], a1);
      if (v3)
      {
        v4 = v3;
        v5 = fsevent_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          dispose_f2d_private_port_cold_1(v4);
      }
    }
  }
}

FSEventStreamEventId FSEventStreamGetLatestEventId(ConstFSEventStreamRef streamRef)
{
  NSObject *v2;

  if (streamRef)
    return *((_QWORD *)streamRef + 21);
  v2 = fsevent_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    FSEventStreamGetLatestEventId_cold_1();
  return 0;
}

dev_t FSEventStreamGetDeviceBeingWatched(ConstFSEventStreamRef streamRef)
{
  dev_t result;
  NSObject *v2;

  if (streamRef)
    return *((_DWORD *)streamRef + 16);
  v2 = fsevent_default_log();
  result = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);
  if (result)
  {
    FSEventStreamGetDeviceBeingWatched_cold_1();
    return 0;
  }
  return result;
}

FSEventStreamRef FSEventStreamCreate(CFAllocatorRef allocator, FSEventStreamCallback callback, FSEventStreamContext *context, CFArrayRef pathsToWatch, FSEventStreamEventId sinceWhen, CFTimeInterval latency, FSEventStreamCreateFlags flags)
{
  return (FSEventStreamRef)_FSEventStreamCreate("FSEventStreamCreate", allocator, (uint64_t)callback, (__int128 *)&context->version, 0, pathsToWatch, sinceWhen, (unint64_t)(latency * 1000000.0), flags);
}

char *_FSEventStreamCreate(const char *a1, const __CFAllocator *Default, uint64_t a3, __int128 *a4, int a5, CFArrayRef theArray, uint64_t a7, uint64_t a8, int a9)
{
  NSObject *v9;
  CFIndex Count;
  char *v16;
  char *v17;
  __int128 v18;
  __int128 v19;
  void (*v20)(_QWORD);
  void *v21;
  CFIndex i;
  const __CFString *ValueAtIndex;
  CFTypeID TypeID;
  int v25;
  int v26;
  int v27;
  statfs *v28;
  statfs *v29;
  unsigned int v30;
  char *v31;
  uint64_t v32;
  statfs *v33;
  size_t v34;
  char *v35;
  uint64_t v38;
  CFIndex v39;
  int v40;
  _DWORD *v41;
  int v42;
  int v43;
  NSObject *v44;
  int v45;
  const char *f_mntonname;
  size_t v47;
  char *v48;
  NSObject *v49;
  NSObject *v50;
  int v51;
  void *v52;
  void *v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  NSObject *v59;
  int v60;
  NSObject *v61;
  char *v63;
  char __s[4];
  const char *v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  char *v72;
  __int16 v73;
  _BYTE v74[14];
  __int16 v75;
  int v76;
  __int16 v77;
  char *v78;
  char __s1[782];
  char buffer[8];
  _QWORD v81[129];

  v81[127] = *MEMORY[0x24BDAC8D0];
  if ((a9 & 0x41) == 0x40)
  {
    v9 = fsevent_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      _FSEventStreamCreate_cold_1();
    return 0;
  }
  Count = CFArrayGetCount(theArray);
  if ((const __CFAllocator *)*MEMORY[0x24BDBD240] == Default)
    Default = CFAllocatorGetDefault();
  v16 = (char *)CFAllocatorAllocate(Default, 456, 0);
  if (!v16)
  {
    v49 = fsevent_default_log();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      _FSEventStreamCreate_cold_2((uint64_t)a1, v49);
    return 0;
  }
  v17 = v16;
  *((_QWORD *)v16 + 56) = 0;
  *((_OWORD *)v16 + 26) = 0u;
  *((_OWORD *)v16 + 27) = 0u;
  *((_OWORD *)v16 + 24) = 0u;
  *((_OWORD *)v16 + 25) = 0u;
  *((_OWORD *)v16 + 22) = 0u;
  *((_OWORD *)v16 + 23) = 0u;
  *((_OWORD *)v16 + 20) = 0u;
  *((_OWORD *)v16 + 21) = 0u;
  *((_OWORD *)v16 + 18) = 0u;
  *((_OWORD *)v16 + 19) = 0u;
  *((_OWORD *)v16 + 16) = 0u;
  *((_OWORD *)v16 + 17) = 0u;
  *((_OWORD *)v16 + 14) = 0u;
  *((_OWORD *)v16 + 15) = 0u;
  *((_OWORD *)v16 + 12) = 0u;
  *((_OWORD *)v16 + 13) = 0u;
  *((_OWORD *)v16 + 10) = 0u;
  *((_OWORD *)v16 + 11) = 0u;
  *((_OWORD *)v16 + 8) = 0u;
  *((_OWORD *)v16 + 9) = 0u;
  *((_OWORD *)v16 + 6) = 0u;
  *((_OWORD *)v16 + 7) = 0u;
  *((_OWORD *)v16 + 4) = 0u;
  *((_OWORD *)v16 + 5) = 0u;
  *((_OWORD *)v16 + 2) = 0u;
  *((_OWORD *)v16 + 3) = 0u;
  *(_OWORD *)v16 = 0u;
  *((_OWORD *)v16 + 1) = 0u;
  *((_QWORD *)v16 + 1) = Default;
  CFRetain(Default);
  *((_QWORD *)v17 + 2) = a3;
  if (a4)
  {
    v18 = *a4;
    v19 = a4[1];
    *((_QWORD *)v17 + 7) = *((_QWORD *)a4 + 4);
    *(_OWORD *)(v17 + 40) = v19;
    *(_OWORD *)(v17 + 24) = v18;
  }
  v20 = (void (*)(_QWORD))*((_QWORD *)v17 + 5);
  if (v20)
    v20(*((_QWORD *)v17 + 4));
  *((_DWORD *)v17 + 16) = a5;
  *((_QWORD *)v17 + 9) = Count;
  *((_QWORD *)v17 + 10) = CFAllocatorAllocate(Default, 8 * Count, 0);
  *((_QWORD *)v17 + 11) = CFAllocatorAllocate(Default, 4 * Count, 0);
  v21 = (void *)*((_QWORD *)v17 + 10);
  if (!v21)
  {
    v50 = fsevent_default_log();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      _FSEventStreamCreate_cold_3((uint64_t)a1);
    goto LABEL_89;
  }
  bzero(v21, 8 * Count);
  bzero(*((void **)v17 + 11), 4 * Count);
  if ((a9 & 4) == 0)
  {
    *((_DWORD *)v17 + 102) = -1;
    goto LABEL_14;
  }
  v51 = kqueue();
  *((_DWORD *)v17 + 102) = v51;
  if (v51 < 0)
  {
    v54 = fsevent_default_log();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      _FSEventStreamCreate_cold_7();
    goto LABEL_89;
  }
  v52 = CFAllocatorAllocate(Default, 32 * Count, 0);
  *((_QWORD *)v17 + 49) = v52;
  if (!v52)
  {
    v55 = fsevent_default_log();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      _FSEventStreamCreate_cold_8((uint64_t)a1);
    goto LABEL_89;
  }
  bzero(v52, 32 * Count);
  v53 = CFAllocatorAllocate(Default, 32 * Count, 0);
  *((_QWORD *)v17 + 50) = v53;
  if (!v53)
  {
    v59 = fsevent_default_log();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      _FSEventStreamCreate_cold_9((uint64_t)a1);
LABEL_89:
    _FSEventStreamDeallocate(v17);
    return 0;
  }
  bzero(v53, 32 * Count);
LABEL_14:
  if (Count >= 1)
  {
    for (i = 0; i != Count; ++i)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, i);
      TypeID = CFStringGetTypeID();
      if (TypeID != CFGetTypeID(ValueAtIndex))
      {
        v56 = fsevent_default_log();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          _FSEventStreamCreate_cold_6(i, (uint64_t)a1);
        goto LABEL_89;
      }
      if (!CFStringGetFileSystemRepresentation(ValueAtIndex, buffer, 1024))
      {
        v57 = fsevent_default_log();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          _FSEventStreamCreate_cold_4();
        goto LABEL_89;
      }
      if (a5)
      {
        v25 = 1000;
        while (1)
        {
          v26 = getfsstat(0, 0, 2);
          if (v26 < 0)
            goto LABEL_33;
          v27 = 2168 * (v26 + 1);
          v28 = (statfs *)malloc_type_malloc(2168 * (v26 + 1), 0xD7006919uLL);
          if (!v28)
            goto LABEL_33;
          v29 = v28;
          v30 = getfsstat(v28, v27, 2);
          if ((v30 & 0x80000000) == 0)
            break;
          free(v29);
          if (!--v25)
            goto LABEL_33;
        }
        if (!v30)
        {
LABEL_33:
          v31 = buffer;
          __strlcpy_chk();
LABEL_34:
          *(_DWORD *)(*((_QWORD *)v17 + 11) + 4 * i) |= 2u;
          goto LABEL_35;
        }
        v32 = 0;
        while (1)
        {
          v33 = &v29[v32];
          if (v29[v32].f_fsid.val[0] == a5)
            break;
          if (v30 == ++v32)
          {
            v31 = buffer;
            __strlcpy_chk();
LABEL_64:
            free(v29);
            goto LABEL_34;
          }
        }
        f_mntonname = v33->f_mntonname;
        snprintf(__s, 0x400uLL, "%s/%s", v33->f_mntonname, buffer);
        if (realpath_DARWIN_EXTSN(__s, __s1))
        {
          v47 = strlen(f_mntonname);
          if (__s1[v47] == 47)
            v31 = &__s1[v47 + 1];
          else
            v31 = &__s1[v47];
          goto LABEL_64;
        }
        free(v29);
      }
      else
      {
        v31 = __s1;
        if (fsevent_realpath(buffer, __s1))
          goto LABEL_35;
      }
      if (buffer[0] == 47)
      {
        v31 = buffer;
        __strlcpy_chk();
      }
      else
      {
        v31 = __s1;
        getcwd(__s1, 0x400uLL);
        __strlcat_chk();
        __strlcat_chk();
      }
LABEL_35:
      v34 = (int)(strlen(v31) + 1);
      *(_QWORD *)(*((_QWORD *)v17 + 10) + 8 * i) = CFAllocatorAllocate(Default, v34, 0);
      v35 = *(char **)(*((_QWORD *)v17 + 10) + 8 * i);
      if (!v35)
      {
        v58 = fsevent_default_log();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          _FSEventStreamCreate_cold_5((uint64_t)a1);
        goto LABEL_89;
      }
      strlcpy(v35, v31, v34);
      if (*(_QWORD *)buffer == 0x2F6D65747379532FLL
        && v81[0] == 0x2F73656D756C6F56
        && *(_QWORD *)((char *)v81 + 5) == 0x2F617461442F7365)
      {
        *(_DWORD *)(*((_QWORD *)v17 + 11) + 4 * i) |= 1u;
        if ((a9 & 4) == 0)
          continue;
      }
      else if ((a9 & 4) == 0)
      {
        continue;
      }
      v38 = *((_QWORD *)v17 + 49);
      v39 = v38 + 32 * i;
      *(_DWORD *)(v39 + 4) = -1;
      if (!*((_DWORD *)v17 + 16) || __s1[0] == 47)
      {
        *(_QWORD *)(v39 + 24) = strdup(__s1);
      }
      else
      {
        if (!realpath_DARWIN_EXTSN(*(const char **)(*((_QWORD *)v17 + 10) + 8 * i), __s))
        {
          getcwd(__s, 0x400uLL);
          v40 = strlen(__s);
          __s[v40] = 47;
          strlcpy(&__s[v40 + 1], *(const char **)(*((_QWORD *)v17 + 10) + 8 * i), 1024 - (v40 + 1));
        }
        *(_QWORD *)(*((_QWORD *)v17 + 49) + 32 * i + 24) = strdup(__s);
        v38 = *((_QWORD *)v17 + 49);
      }
      v41 = (_DWORD *)(v38 + 32 * i);
      *v41 = 8;
      v42 = watch_path(a1, *((_DWORD *)v17 + 102), __s1, *((_QWORD *)v17 + 50) + 32 * i, (uint64_t)v41, i);
      if (v42)
      {
        v43 = v42;
        v44 = fsevent_default_log();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          v48 = strerror(v43);
          *(_DWORD *)__s = 136316674;
          v68 = a1;
          v69 = 2080;
          v70 = "_FSEventStreamCreate";
          v71 = 2080;
          v72 = v31;
          v73 = 2080;
          *(_QWORD *)v74 = __s1;
          *(_WORD *)&v74[8] = 1024;
          *(_DWORD *)&v74[10] = i;
          v75 = 1024;
          v76 = v43;
          v77 = 2080;
          v78 = v48;
          _os_log_error_impl(&dword_206833000, v44, OS_LOG_TYPE_ERROR, "%s: %s: ERROR: watch_path() failed for srcPath='%s' resolvedPath='%s' index=%d (%d):(%s)", (uint8_t *)__s, 0x40u);
        }
        if ((v43 - 23) < 2)
          goto LABEL_89;
      }
      v45 = watch_all_parents((uint64_t)a1, *((_DWORD *)v17 + 102), __s1, *((_QWORD *)v17 + 49) + 32 * i, i);
      if (v45)
      {
        v60 = v45;
        v61 = fsevent_default_log();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          v63 = strerror(v60);
          *(_DWORD *)__s = 136316162;
          v68 = a1;
          v69 = 2080;
          v70 = "_FSEventStreamCreate";
          v71 = 2080;
          v72 = v31;
          v73 = 1024;
          *(_DWORD *)v74 = v60;
          *(_WORD *)&v74[4] = 2080;
          *(_QWORD *)&v74[6] = v63;
          _os_log_error_impl(&dword_206833000, v61, OS_LOG_TYPE_ERROR, "%s: %s: ERROR: watch_all_parents() failed for '%s' (%d):(%s)", (uint8_t *)__s, 0x30u);
        }
        goto LABEL_89;
      }
    }
  }
  *((_QWORD *)v17 + 21) = a7;
  *((_QWORD *)v17 + 22) = a8;
  *((_DWORD *)v17 + 46) = a9;
  v17[188] = 0;
  v17[190] = a7 != -1;
  *((_QWORD *)v17 + 27) = 0;
  *((_QWORD *)v17 + 45) = 0;
  *((_QWORD *)v17 + 54) = 0;
  *((_QWORD *)v17 + 24) = 0;
  *((_QWORD *)v17 + 25) = 0;
  *(_DWORD *)v17 = 1;
  return v17;
}

FSEventStreamRef FSEventStreamCreateRelativeToDevice(CFAllocatorRef allocator, FSEventStreamCallback callback, FSEventStreamContext *context, dev_t deviceToWatch, CFArrayRef pathsToWatchRelativeToDevice, FSEventStreamEventId sinceWhen, CFTimeInterval latency, FSEventStreamCreateFlags flags)
{
  NSObject *v9;

  if (deviceToWatch > 0)
    return (FSEventStreamRef)_FSEventStreamCreate("FSEventStreamCreateRelativeToDevice", allocator, (uint64_t)callback, (__int128 *)&context->version, deviceToWatch, pathsToWatchRelativeToDevice, sinceWhen, (unint64_t)(latency * 1000000.0), flags);
  v9 = fsevent_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    FSEventStreamCreateRelativeToDevice_cold_1();
  return 0;
}

void _FSEventStreamDeallocate(char *ptr)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  const __CFAllocator *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t i;
  void *v21;
  NSObject *v22;
  void (*v23)(_QWORD);

  if (ptr)
  {
    if (*(_DWORD *)ptr)
    {
      v2 = fsevent_default_log();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        _FSEventStreamDeallocate_cold_4();
    }
    else
    {
      if (ptr[188])
      {
        v4 = fsevent_default_log();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
          _FSEventStreamDeallocate_cold_3();
      }
      if (*((_QWORD *)ptr + 27) || *((_QWORD *)ptr + 45))
      {
        v5 = fsevent_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          _FSEventStreamDeallocate_cold_2();
      }
      v6 = (const __CFAllocator *)*((_QWORD *)ptr + 1);
      if (v6)
      {
        v7 = (void *)*((_QWORD *)ptr + 10);
        if (v7)
        {
          v8 = *((_QWORD *)ptr + 9);
          *((_QWORD *)ptr + 9) = 0;
          if ((int)v8 >= 1)
          {
            v9 = 0;
            v10 = v8;
            do
            {
              v11 = *(void **)(*((_QWORD *)ptr + 10) + 8 * v9);
              if (v11)
                CFAllocatorDeallocate(v6, v11);
              v12 = *((_QWORD *)ptr + 49);
              if (v12)
              {
                v13 = *(void **)(v12 + 32 * v9 + 24);
                if (v13)
                {
                  free(v13);
                  v12 = *((_QWORD *)ptr + 49);
                }
                v14 = v12 + 32 * v9;
                v15 = *(void **)(v14 + 16);
                if (v15)
                {
                  if (*(int *)(v14 + 8) >= 1)
                  {
                    v16 = 0;
                    do
                    {
                      close(*(_DWORD *)(*(_QWORD *)(v12 + 32 * v9 + 16) + 4 * v16++));
                      v12 = *((_QWORD *)ptr + 49);
                      v17 = v12 + 32 * v9;
                    }
                    while (v16 < *(int *)(v17 + 8));
                    v15 = *(void **)(v17 + 16);
                  }
                  free(v15);
                  v12 = *((_QWORD *)ptr + 49);
                }
                close(*(_DWORD *)(v12 + 32 * v9 + 4));
              }
              ++v9;
            }
            while (v9 != v10);
            v7 = (void *)*((_QWORD *)ptr + 10);
          }
          CFAllocatorDeallocate(v6, v7);
          CFAllocatorDeallocate(v6, *((void **)ptr + 11));
          v18 = (void *)*((_QWORD *)ptr + 49);
          if (v18)
            CFAllocatorDeallocate(v6, v18);
          v19 = (void *)*((_QWORD *)ptr + 50);
          if (v19)
            CFAllocatorDeallocate(v6, v19);
        }
        for (i = 104; i != 168; i += 8)
        {
          v21 = *(void **)&ptr[i];
          if (v21)
          {
            free(v21);
            *(_QWORD *)&ptr[i] = 0;
          }
        }
        *((_QWORD *)ptr + 12) = 0;
        v22 = *((_QWORD *)ptr + 44);
        if (v22)
          dispatch_release(v22);
        v23 = (void (*)(_QWORD))*((_QWORD *)ptr + 6);
        if (v23)
          v23(*((_QWORD *)ptr + 4));
        *((_QWORD *)ptr + 56) = 0;
        *((_OWORD *)ptr + 26) = 0u;
        *((_OWORD *)ptr + 27) = 0u;
        *((_OWORD *)ptr + 24) = 0u;
        *((_OWORD *)ptr + 25) = 0u;
        *((_OWORD *)ptr + 22) = 0u;
        *((_OWORD *)ptr + 23) = 0u;
        *((_OWORD *)ptr + 20) = 0u;
        *((_OWORD *)ptr + 21) = 0u;
        *((_OWORD *)ptr + 18) = 0u;
        *((_OWORD *)ptr + 19) = 0u;
        *((_OWORD *)ptr + 16) = 0u;
        *((_OWORD *)ptr + 17) = 0u;
        *((_OWORD *)ptr + 14) = 0u;
        *((_OWORD *)ptr + 15) = 0u;
        *((_OWORD *)ptr + 12) = 0u;
        *((_OWORD *)ptr + 13) = 0u;
        *((_OWORD *)ptr + 10) = 0u;
        *((_OWORD *)ptr + 11) = 0u;
        *((_OWORD *)ptr + 8) = 0u;
        *((_OWORD *)ptr + 9) = 0u;
        *((_OWORD *)ptr + 6) = 0u;
        *((_OWORD *)ptr + 7) = 0u;
        *((_OWORD *)ptr + 4) = 0u;
        *((_OWORD *)ptr + 5) = 0u;
        *((_OWORD *)ptr + 2) = 0u;
        *((_OWORD *)ptr + 3) = 0u;
        *(_OWORD *)ptr = 0u;
        *((_OWORD *)ptr + 1) = 0u;
        CFAllocatorDeallocate(v6, ptr);
        CFRelease(v6);
      }
    }
  }
  else
  {
    v3 = fsevent_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      _FSEventStreamDeallocate_cold_1();
  }
}

void FSEventStreamScheduleWithRunLoop(FSEventStreamRef streamRef, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  mach_port_name_t *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  __CFFileDescriptor *v11;
  __CFRunLoopSource *RunLoopSource;
  const __CFAllocator *v13;
  CFNumberRef v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CFFileDescriptorContext context;

  if (streamRef)
  {
    if (runLoop)
    {
      v6 = (mach_port_name_t *)((char *)streamRef + 192);
      if (*((_DWORD *)streamRef + 48))
      {
LABEL_4:
        if (_createAndAddRunLoopSource((int)"FSEventStreamScheduleWithRunLoop", (uint64_t)streamRef, runLoop, runLoopMode))
        {
          v7 = fsevent_default_log();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            FSEventStreamScheduleWithRunLoop_cold_5();
          mach_port_deallocate(*MEMORY[0x24BDAEC58], *v6);
          *v6 = 0;
        }
        else
        {
          *((_QWORD *)streamRef + 28) = CFRetain(runLoop);
          *((_QWORD *)streamRef + 29) = CFStringCreateCopy(0, runLoopMode);
          if ((*((_BYTE *)streamRef + 184) & 4) != 0)
          {
            context.version = 0;
            context.info = streamRef;
            context.retain = (void *(__cdecl *)(void *))_FSEventStreamRetainAndReturnSelf;
            context.release = (void (__cdecl *)(void *))FSEventStreamRelease;
            context.copyDescription = (CFStringRef (__cdecl *)(void *))FSEventStreamCopyDescription;
            v11 = CFFileDescriptorCreate(0, *((_DWORD *)streamRef + 102), 1u, (CFFileDescriptorCallBack)cffd_callback, &context);
            *((_QWORD *)streamRef + 52) = v11;
            if (v11)
            {
              RunLoopSource = CFFileDescriptorCreateRunLoopSource(0, v11, 0);
              *((_QWORD *)streamRef + 53) = RunLoopSource;
              if (RunLoopSource)
              {
                CFRunLoopAddSource(runLoop, RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
              }
              else
              {
                v23 = fsevent_default_log();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                  FSEventStreamScheduleWithRunLoop_cold_4(v23, v24, v25, v26, v27, v28, v29, v30);
                CFFileDescriptorInvalidate(*((CFFileDescriptorRef *)streamRef + 52));
                CFRelease(*((CFTypeRef *)streamRef + 52));
                *((_QWORD *)streamRef + 52) = 0;
              }
            }
            else
            {
              v15 = fsevent_default_log();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
                FSEventStreamScheduleWithRunLoop_cold_3(v15, v16, v17, v18, v19, v20, v21, v22);
            }
          }
        }
        return;
      }
      if (!allocate_d2f_port((uint64_t)"FSEventStreamScheduleWithRunLoop", (uint64_t)streamRef))
      {
        pthread_mutex_lock(&FSEvents_streamDict_mutex);
        v13 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        if (!FSEvents_streamDict)
          FSEvents_streamDict = (uint64_t)CFDictionaryCreateMutable(v13, 0, MEMORY[0x24BDBD6A0], 0);
        v14 = CFNumberCreate(v13, kCFNumberIntType, v6);
        CFDictionaryAddValue((CFMutableDictionaryRef)FSEvents_streamDict, v14, streamRef);
        pthread_mutex_unlock(&FSEvents_streamDict_mutex);
        CFRelease(v14);
        goto LABEL_4;
      }
      v10 = fsevent_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        FSEventStreamScheduleWithRunLoop_cold_6();
    }
    else
    {
      v9 = fsevent_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        FSEventStreamScheduleWithRunLoop_cold_2();
    }
  }
  else
  {
    v8 = fsevent_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      FSEventStreamScheduleWithRunLoop_cold_1();
  }
}

uint64_t allocate_d2f_port(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;

  v2 = mach_port_allocate(*MEMORY[0x24BDAEC58], 1u, (mach_port_name_t *)(a2 + 192));
  if ((_DWORD)v2)
  {
    v3 = fsevent_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      allocate_d2f_port_cold_1();
  }
  return v2;
}

uint64_t _createAndAddRunLoopSource(int a1, uint64_t a2, CFRunLoopRef rl, CFRunLoopMode mode)
{
  mach_port_t v5;
  __CFRunLoopSource *v8;
  NSObject *v9;
  NSObject *v10;
  __CFMachPort *v11;
  CFRunLoopSourceRef RunLoopSource;
  NSObject *v14;
  NSObject *v15;
  CFMachPortContext v16;

  v5 = *(_DWORD *)(a2 + 192);
  if (!v5)
  {
    v10 = fsevent_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      _createAndAddRunLoopSource_cold_1();
    return 5;
  }
  if (*(_QWORD *)(a2 + 200))
  {
    v8 = *(__CFRunLoopSource **)(a2 + 216);
    if (!v8)
    {
      v9 = fsevent_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        _createAndAddRunLoopSource_cold_4();
      return 5;
    }
LABEL_11:
    CFRunLoopAddSource(rl, v8, mode);
    return 0;
  }
  memset(&v16, 0, sizeof(v16));
  v11 = CFMachPortCreateWithPort(0, v5, (CFMachPortCallBack)FSEventsClientProcessMessageCallback, &v16, 0);
  *(_QWORD *)(a2 + 200) = v11;
  if (v11)
  {
    RunLoopSource = CFMachPortCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x24BDBD240], v11, 0);
    *(_QWORD *)(a2 + 216) = RunLoopSource;
    if (RunLoopSource)
    {
      v8 = RunLoopSource;
      goto LABEL_11;
    }
    v15 = fsevent_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      _createAndAddRunLoopSource_cold_3();
    CFMachPortInvalidate(*(CFMachPortRef *)(a2 + 200));
    CFRelease(*(CFTypeRef *)(a2 + 200));
    *(_QWORD *)(a2 + 200) = 0;
  }
  else
  {
    v14 = fsevent_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      _createAndAddRunLoopSource_cold_2();
  }
  mach_port_deallocate(*MEMORY[0x24BDAEC58], *(_DWORD *)(a2 + 196));
  *(_DWORD *)(a2 + 196) = 0;
  return 5;
}

void cffd_callback(__CFFileDescriptor *a1, int a2, FSEventStreamRef streamRef)
{
  CFFileDescriptorNativeDescriptor NativeDescriptor;

  FSEventStreamRetain(streamRef);
  NativeDescriptor = CFFileDescriptorGetNativeDescriptor(a1);
  process_dir_events(NativeDescriptor, streamRef);
  if (*(int *)streamRef >= 2 && *((_BYTE *)streamRef + 188))
    CFFileDescriptorEnableCallBacks(a1, 1uLL);
  FSEventStreamRelease(streamRef);
}

void FSEventStreamUnscheduleFromRunLoop(FSEventStreamRef streamRef, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  __CFRunLoopSource *v5;
  __CFRunLoopSource *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;

  if (streamRef)
  {
    if (runLoop)
    {
      v5 = (__CFRunLoopSource *)*((_QWORD *)streamRef + 27);
      if (v5)
      {
        CFRunLoopRemoveSource(runLoop, v5, runLoopMode);
        v7 = (__CFRunLoopSource *)*((_QWORD *)streamRef + 53);
        if (v7)
          CFRunLoopRemoveSource(runLoop, v7, runLoopMode);
        _FSEventStreamUnscheduleFromRunLoops((uint64_t)streamRef);
      }
      else
      {
        v10 = fsevent_default_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          FSEventStreamUnscheduleFromRunLoop_cold_3();
      }
    }
    else
    {
      v9 = fsevent_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        FSEventStreamUnscheduleFromRunLoop_cold_2();
    }
  }
  else
  {
    v8 = fsevent_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      FSEventStreamUnscheduleFromRunLoop_cold_1();
  }
}

void _FSEventStreamUnscheduleFromRunLoops(uint64_t a1)
{
  const void *v2;
  const void *v3;

  v2 = *(const void **)(a1 + 224);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(a1 + 224) = 0;
  }
  v3 = *(const void **)(a1 + 232);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(a1 + 232) = 0;
  }
}

void FSEventStreamSetDispatchQueue(FSEventStreamRef streamRef, dispatch_queue_t q)
{
  int v4;
  dispatch_source_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  const __CFAllocator *v19;
  CFNumberRef v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[6];
  int v30;
  _QWORD handler[5];
  int v32;

  if (streamRef)
  {
    if (q)
    {
      if (!*((_DWORD *)streamRef + 48))
      {
        if (allocate_d2f_port((uint64_t)"FSEventStreamSetDispatchQueue", (uint64_t)streamRef))
        {
          v18 = fsevent_default_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            FSEventStreamSetDispatchQueue_cold_4();
          return;
        }
        pthread_mutex_lock(&FSEvents_streamDict_mutex);
        v19 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        if (!FSEvents_streamDict)
          FSEvents_streamDict = (uint64_t)CFDictionaryCreateMutable(v19, 0, MEMORY[0x24BDBD6A0], 0);
        v20 = CFNumberCreate(v19, kCFNumberIntType, (char *)streamRef + 192);
        CFDictionaryAddValue((CFMutableDictionaryRef)FSEvents_streamDict, v20, streamRef);
        pthread_mutex_unlock(&FSEvents_streamDict_mutex);
        CFRelease(v20);
      }
      pthread_mutex_init((pthread_mutex_t *)((char *)streamRef + 240), 0);
      pthread_cond_init((pthread_cond_t *)((char *)streamRef + 304), 0);
      dispatch_retain(q);
      *((_QWORD *)streamRef + 44) = q;
      if (create_d2f_port_source((uint64_t)streamRef))
      {
        if ((*((_BYTE *)streamRef + 184) & 4) == 0)
          return;
        v4 = *((_DWORD *)streamRef + 102);
        v5 = dispatch_source_create(MEMORY[0x24BDACA00], v4, 0, *((dispatch_queue_t *)streamRef + 44));
        if (v5)
        {
          v6 = v5;
          dispatch_set_qos_class_fallback();
          FSEventStreamRetain(streamRef);
          v7 = MEMORY[0x24BDAC760];
          handler[0] = MEMORY[0x24BDAC760];
          handler[1] = 0x40000000;
          handler[2] = __FSEventStreamSetDispatchQueue_block_invoke;
          handler[3] = &__block_descriptor_tmp_0;
          handler[4] = streamRef;
          v32 = v4;
          dispatch_source_set_event_handler(v6, handler);
          v29[0] = v7;
          v29[1] = 0x40000000;
          v29[2] = __FSEventStreamSetDispatchQueue_block_invoke_2;
          v29[3] = &__block_descriptor_tmp_22;
          v30 = v4;
          v29[4] = v6;
          v29[5] = streamRef;
          dispatch_source_set_cancel_handler(v6, v29);
          *((_QWORD *)streamRef + 54) = v6;
          *((_DWORD *)streamRef + 110) = 1;
          return;
        }
        v21 = fsevent_default_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          FSEventStreamSetDispatchQueue_cold_2(v21, v22, v23, v24, v25, v26, v27, v28);
      }
      else
      {
        v10 = fsevent_default_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          FSEventStreamSetDispatchQueue_cold_3(v10, v11, v12, v13, v14, v15, v16, v17);
      }
      if (*((_QWORD *)streamRef + 54))
      {
        cancel_source((NSObject **)streamRef + 54, (int *)streamRef + 110);
        *((_DWORD *)streamRef + 102) = -1;
      }
      if (*((_QWORD *)streamRef + 45))
      {
        cancel_source((NSObject **)streamRef + 45, (int *)streamRef + 92);
        *((_DWORD *)streamRef + 48) = 0;
      }
    }
    else
    {
      if (*((_QWORD *)streamRef + 45))
      {
        cancel_source((NSObject **)streamRef + 45, (int *)streamRef + 92);
        *((_DWORD *)streamRef + 48) = 0;
      }
      if (*((_QWORD *)streamRef + 47))
      {
        cancel_source((NSObject **)streamRef + 47, (int *)streamRef + 96);
        *((_DWORD *)streamRef + 49) = 0;
      }
      if ((*((_BYTE *)streamRef + 184) & 4) != 0 && *((_QWORD *)streamRef + 54))
      {
        cancel_source((NSObject **)streamRef + 54, (int *)streamRef + 110);
        *((_DWORD *)streamRef + 102) = -1;
      }
      v9 = *((_QWORD *)streamRef + 44);
      if (v9)
      {
        dispatch_release(v9);
        *((_QWORD *)streamRef + 44) = 0;
      }
    }
  }
  else
  {
    v8 = fsevent_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      FSEventStreamSetDispatchQueue_cold_1();
  }
}

BOOL create_d2f_port_source(uint64_t a1)
{
  uintptr_t v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD v6[6];
  int v7;
  _QWORD handler[4];
  int v9;

  v2 = *(unsigned int *)(a1 + 192);
  v3 = dispatch_source_create(MEMORY[0x24BDAC9E0], v2, 0, *(dispatch_queue_t *)(a1 + 352));
  if (v3)
  {
    FSEventStreamRetain((FSEventStreamRef)a1);
    dispatch_set_qos_class_fallback();
    v4 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 0x40000000;
    handler[2] = __create_d2f_port_source_block_invoke;
    handler[3] = &__block_descriptor_tmp_64;
    v9 = v2;
    dispatch_source_set_event_handler(v3, handler);
    v6[0] = v4;
    v6[1] = 0x40000000;
    v6[2] = __create_d2f_port_source_block_invoke_2;
    v6[3] = &__block_descriptor_tmp_65;
    v7 = v2;
    v6[4] = v3;
    v6[5] = a1;
    dispatch_source_set_cancel_handler(v3, v6);
    *(_QWORD *)(a1 + 360) = v3;
    *(_DWORD *)(a1 + 368) = 1;
  }
  return v3 != 0;
}

FSEventStreamEventId FSEventStreamFlushAsync(FSEventStreamRef streamRef)
{
  NSObject *v1;
  NSObject *v2;
  NSObject *v3;
  FSEventStreamEventId v5;

  v5 = 0;
  if (streamRef)
  {
    if (*((_BYTE *)streamRef + 188))
    {
      if (*((_QWORD *)streamRef + 25))
      {
        if (f2d_flush_rpc(*((_DWORD *)streamRef + 49), &v5))
        {
          v1 = fsevent_default_log();
          if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
            FSEventStreamFlushAsync_cold_3();
        }
      }
    }
    else
    {
      v3 = fsevent_default_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        FSEventStreamFlushAsync_cold_2();
    }
  }
  else
  {
    v2 = fsevent_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      FSEventStreamFlushAsync_cold_1();
  }
  return v5;
}

void FSEventStreamFlushSync(FSEventStreamRef streamRef)
{
  __CFRunLoop *v2;
  __CFRunLoopSource *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  __CFRunLoop *v12;
  uint64_t v13;
  uint64_t v14;

  v14 = 0;
  if (streamRef)
  {
    if (*((_BYTE *)streamRef + 188))
    {
      if (*((_QWORD *)streamRef + 25) || *((_QWORD *)streamRef + 45))
      {
        v2 = (__CFRunLoop *)*((_QWORD *)streamRef + 28);
        if (v2 || *((_QWORD *)streamRef + 45))
        {
          v3 = (__CFRunLoopSource *)*((_QWORD *)streamRef + 27);
          if (v3 || *((_QWORD *)streamRef + 45))
          {
            if (v2)
            {
              CFRunLoopAddSource(v2, v3, CFSTR("com.apple.FSEvents"));
              v13 = 0;
              while (*((_BYTE *)streamRef + 190)
                   && !_runRunLoopOnceForFlushSync((uint64_t)"FSEventStreamFlushSync:1", (uint64_t)streamRef, (int *)&v13 + 1, &v13));
            }
            else
            {
              pthread_mutex_lock((pthread_mutex_t *)((char *)streamRef + 240));
              while (*((_BYTE *)streamRef + 190))
              {
                if (pthread_cond_wait((pthread_cond_t *)((char *)streamRef + 304), (pthread_mutex_t *)((char *)streamRef + 240)))
                {
                  v6 = fsevent_default_log();
                  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
                    FSEventStreamFlushSync_cold_8();
                  break;
                }
              }
              pthread_mutex_unlock((pthread_mutex_t *)((char *)streamRef + 240));
            }
            if (f2d_flush_rpc(*((_DWORD *)streamRef + 49), &v14))
            {
              v7 = fsevent_default_log();
              if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
                FSEventStreamFlushSync_cold_7();
            }
            if (!v14)
              goto LABEL_46;
            if (v14 > 0)
            {
              *((_QWORD *)streamRef + 56) = v14;
              v13 = 0;
              if (*((_QWORD *)streamRef + 28))
              {
                while (*((_QWORD *)streamRef + 21) < *((_QWORD *)streamRef + 56)
                     && !_runRunLoopOnceForFlushSync((uint64_t)"FSEventStreamFlushSync:2", (uint64_t)streamRef, (int *)&v13 + 1, &v13));
              }
              else
              {
                pthread_mutex_lock((pthread_mutex_t *)((char *)streamRef + 240));
                while (*((_QWORD *)streamRef + 21) < *((_QWORD *)streamRef + 56))
                {
                  if (pthread_cond_wait((pthread_cond_t *)((char *)streamRef + 304), (pthread_mutex_t *)((char *)streamRef + 240)))
                  {
                    v11 = fsevent_default_log();
                    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
                      FSEventStreamFlushSync_cold_5();
                    break;
                  }
                }
                pthread_mutex_unlock((pthread_mutex_t *)((char *)streamRef + 240));
              }
              *((_QWORD *)streamRef + 56) = 0;
LABEL_46:
              v12 = (__CFRunLoop *)*((_QWORD *)streamRef + 28);
              if (v12)
                CFRunLoopRemoveSource(v12, *((CFRunLoopSourceRef *)streamRef + 27), CFSTR("com.apple.FSEvents"));
              return;
            }
            v8 = fsevent_default_log();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
              FSEventStreamFlushSync_cold_6();
          }
          else
          {
            v10 = fsevent_default_log();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
              FSEventStreamFlushSync_cold_4();
          }
        }
        else
        {
          v9 = fsevent_default_log();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            FSEventStreamFlushSync_cold_3();
        }
      }
    }
    else
    {
      v5 = fsevent_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        FSEventStreamFlushAsync_cold_2();
    }
  }
  else
  {
    v4 = fsevent_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      FSEventStreamFlushSync_cold_1();
  }
}

uint64_t _runRunLoopOnceForFlushSync(uint64_t a1, uint64_t a2, int *a3, _DWORD *a4)
{
  __int32 v8;
  uint64_t result;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  double v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = CFRunLoopRunInMode(CFSTR("com.apple.FSEvents"), 5.0, 1u) - 1;
  result = 0;
  switch(v8)
  {
    case 0:
      v10 = fsevent_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        _runRunLoopOnceForFlushSync_cold_1();
      return 1;
    case 1:
      v12 = fsevent_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        _runRunLoopOnceForFlushSync_cold_2();
      return 1;
    case 2:
      v13 = *a3;
      if ((*a3 & ~(-1 << *a4)) == 0)
      {
        v14 = fsevent_default_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = (double)(*a3 + 1) * 5.0;
          v16 = 136316162;
          v17 = a1;
          v18 = 2048;
          v19 = a2;
          v20 = 2080;
          v21 = "The run loop timed out.";
          v22 = 1024;
          v23 = 3;
          v24 = 2048;
          v25 = v15;
          _os_log_error_impl(&dword_206833000, v14, OS_LOG_TYPE_ERROR, "%s(streamRef = %p): WARNING: CFRunLoopRunInMode() => %s (%d) (%.2f seconds)", (uint8_t *)&v16, 0x30u);
        }
        ++*a4;
        v13 = *a3;
      }
      result = 0;
      *a3 = v13 + 1;
      return result;
    case 3:
      return result;
    default:
      v11 = fsevent_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v16 = 136315906;
        v17 = a1;
        v18 = 2048;
        v19 = a2;
        v20 = 2080;
        v21 = "UNKNOWN";
        v22 = 1024;
        v23 = 0;
        _os_log_error_impl(&dword_206833000, v11, OS_LOG_TYPE_ERROR, "%s(streamRef = %p): ERROR: CFRunLoopRunInMode() => %s (%d)", (uint8_t *)&v16, 0x26u);
      }
      return 1;
  }
}

void FSEventStreamInvalidate(FSEventStreamRef streamRef)
{
  NSObject *v2;
  CFNumberRef v3;
  __CFMachPort *v4;
  __CFMachPort *v5;
  const void *v6;
  NSObject *v7;
  __CFFileDescriptor *v8;
  const void *v9;
  NSObject *v10;

  if (streamRef)
  {
    if (*((_QWORD *)streamRef + 27) || *((_QWORD *)streamRef + 45))
    {
      if (*((_BYTE *)streamRef + 188))
      {
        v2 = fsevent_default_log();
        if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
          FSEventStreamInvalidate_cold_3();
      }
      *((_BYTE *)streamRef + 189) = 1;
      _FSEventStreamUnscheduleFromRunLoops((uint64_t)streamRef);
      v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, (char *)streamRef + 192);
      pthread_mutex_lock(&FSEvents_streamDict_mutex);
      CFDictionaryRemoveValue((CFMutableDictionaryRef)FSEvents_streamDict, v3);
      pthread_mutex_unlock(&FSEvents_streamDict_mutex);
      CFRelease(v3);
      v4 = (__CFMachPort *)*((_QWORD *)streamRef + 25);
      if (v4)
      {
        CFMachPortInvalidate(v4);
        CFRelease(*((CFTypeRef *)streamRef + 25));
        *((_QWORD *)streamRef + 25) = 0;
        v5 = (__CFMachPort *)*((_QWORD *)streamRef + 26);
        if (v5)
        {
          CFMachPortSetInvalidationCallBack(v5, 0);
          CFRelease(*((CFTypeRef *)streamRef + 26));
          *((_QWORD *)streamRef + 26) = 0;
        }
        v6 = (const void *)*((_QWORD *)streamRef + 27);
        if (v6)
        {
          CFRelease(v6);
          *((_QWORD *)streamRef + 27) = 0;
        }
      }
      if (*((_QWORD *)streamRef + 45))
        cancel_source((NSObject **)streamRef + 45, (int *)streamRef + 92);
      else
        dispose_d2f_port(*((_DWORD *)streamRef + 48));
      *((_DWORD *)streamRef + 48) = 0;
      if (*((_QWORD *)streamRef + 47))
      {
        cancel_source((NSObject **)streamRef + 47, (int *)streamRef + 96);
        *((_DWORD *)streamRef + 49) = 0;
      }
      if ((*((_BYTE *)streamRef + 184) & 4) != 0)
      {
        v8 = (__CFFileDescriptor *)*((_QWORD *)streamRef + 52);
        if (v8)
        {
          CFFileDescriptorInvalidate(v8);
          CFRelease(*((CFTypeRef *)streamRef + 52));
          *((_QWORD *)streamRef + 52) = 0;
          v9 = (const void *)*((_QWORD *)streamRef + 53);
          if (v9)
          {
            CFRelease(v9);
            *((_QWORD *)streamRef + 53) = 0;
          }
        }
        if (*((_QWORD *)streamRef + 54))
        {
          cancel_source((NSObject **)streamRef + 54, (int *)streamRef + 110);
          *((_DWORD *)streamRef + 102) = -1;
        }
      }
    }
    else
    {
      v10 = fsevent_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        FSEventStreamInvalidate_cold_2();
    }
  }
  else
  {
    v7 = fsevent_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      FSEventStreamInvalidate_cold_1();
  }
}

void dispose_d2f_port(mach_port_name_t name)
{
  kern_return_t v1;
  mach_error_t v2;
  NSObject *v3;

  if (name)
  {
    v1 = mach_port_mod_refs(*MEMORY[0x24BDAEC58], name, 1u, -1);
    if (v1)
    {
      v2 = v1;
      v3 = fsevent_default_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        dispose_d2f_port_cold_1(v2);
    }
  }
}

FSEventStreamEventId FSEventsGetCurrentEventId(void)
{
  int v0;
  FSEventStreamEventId result;
  FSEventStreamEventId v2;

  v2 = 0;
  v0 = FSEvents_connect();
  result = 0;
  if (!v0)
  {
    f2d_get_current_event_id_rpc(FSEvents_f2d_public_port, &v2);
    return v2;
  }
  return result;
}

uint64_t FSEvents_connect()
{
  uint64_t v0;
  NSObject *v1;

  pthread_mutex_lock(&FSEvents_f2d_public_port_mutex);
  if (FSEvents_f2d_public_port)
  {
    pthread_mutex_unlock(&FSEvents_f2d_public_port_mutex);
    return 0;
  }
  else
  {
    v0 = bootstrap_look_up2();
    pthread_mutex_unlock(&FSEvents_f2d_public_port_mutex);
    if ((_DWORD)v0)
    {
      v1 = fsevent_default_log();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
        FSEvents_connect_cold_1();
    }
  }
  return v0;
}

CFUUIDRef FSEventsCopyUUIDForDevice(dev_t dev)
{
  NSObject *v2;
  const __CFUUID *v3;
  const __CFString *v6;
  const __CFString *v7;
  _OWORD v8[2];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (dev <= 0)
  {
    v2 = fsevent_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      FSEventsCopyUUIDForDevice_cold_1();
  }
  if (FSEvents_connect())
    return 0;
  v9 = 0;
  memset(v8, 0, sizeof(v8));
  f2d_get_server_uuid_rpc(FSEvents_f2d_public_port, dev, (uint64_t)v8);
  if (LODWORD(v8[0]) == 1429032782 && *(_DWORD *)((char *)v8 + 3) == 1145656661)
    return 0;
  v6 = CFStringCreateWithBytes(0, (const UInt8 *)v8, 36, 0x600u, 0);
  if (!v6)
    return 0;
  v7 = v6;
  v3 = CFUUIDCreateFromString(0, v6);
  CFRelease(v7);
  return v3;
}

FSEventStreamEventId FSEventsGetLastEventIdForDeviceBeforeTime(dev_t dev, CFAbsoluteTime time)
{
  int v4;
  FSEventStreamEventId result;
  FSEventStreamEventId v6;

  v6 = 0;
  v4 = FSEvents_connect();
  result = 0;
  if (!v4)
  {
    f2d_get_last_event_for_device_before_time_rpc(FSEvents_f2d_public_port, dev, (unint64_t)time, &v6);
    return v6;
  }
  return result;
}

Boolean FSEventStreamSetExclusionPaths(FSEventStreamRef streamRef, CFArrayRef pathsToExclude)
{
  Boolean result;
  CFIndex Count;
  CFIndex v6;
  const __CFString *ValueAtIndex;
  CFTypeID TypeID;
  char __s1[1024];
  char buffer[1024];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (*((_BYTE *)streamRef + 188))
    return 0;
  Count = CFArrayGetCount(pathsToExclude);
  *((_QWORD *)streamRef + 12) = Count;
  if (Count && Count <= 8)
  {
    if (Count >= 1)
    {
      v6 = 0;
      while (1)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(pathsToExclude, v6);
        TypeID = CFStringGetTypeID();
        if (TypeID != CFGetTypeID(ValueAtIndex) || !CFStringGetFileSystemRepresentation(ValueAtIndex, buffer, 1024))
          break;
        if (*((_DWORD *)streamRef + 16) || !fsevent_realpath(buffer, __s1))
          __strlcpy_chk();
        *((_QWORD *)streamRef + v6++ + 13) = strdup(__s1);
        if (*((_QWORD *)streamRef + 12) <= v6)
          return 1;
      }
      return 0;
    }
    return 1;
  }
  else
  {
    result = 0;
    *((_QWORD *)streamRef + 12) = 0;
  }
  return result;
}

char *fsevent_realpath(const char *a1, char *a2)
{
  __int128 v4;
  int v5;
  int v6;
  _OWORD v7[66];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = xmmword_20683E2F4;
  memset(v7, 0, 512);
  v5 = 0;
  v6 = 32;
  DWORD1(v4) = 0x80000000;
  if (getattrlist(a1, &v4, v7, 0x420uLL, 0x20u) == -1)
    return 0;
  if (!a2)
    return (char *)&v7[1] + SDWORD2(v7[1]) + 8;
  strlcpy(a2, (const char *)&v7[1] + SDWORD2(v7[1]) + 8, 0x400uLL);
  return a2;
}

Boolean FSEventsPurgeEventsForDeviceUpToEventId(dev_t dev, FSEventStreamEventId eventId)
{
  int v4;
  _BOOL4 v5;
  int v6;
  unsigned int v7;
  int v8;
  statfs *v9;
  statfs *v10;
  unsigned int v11;
  uint64_t v12;
  char *f_mntonname;
  NSObject *v14;
  int v16;
  char v17[1024];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16 = 0;
  v4 = FSEvents_connect();
  LOBYTE(v5) = 0;
  if (!v4)
  {
    v17[0] = 0;
    v6 = getfsstat(0, 0, 2);
    if ((v6 & 0x80000000) == 0)
    {
      v7 = v6;
      v8 = 2168 * v6;
      v9 = (statfs *)malloc_type_malloc(2168 * v6, 0x1156268uLL);
      if (v9)
      {
        v10 = v9;
        v11 = getfsstat(v9, v8, 2);
        if ((v11 & 0x80000000) == 0)
        {
          v12 = v11 >= v7 ? v7 : v11;
          if ((_DWORD)v12)
          {
            f_mntonname = v10->f_mntonname;
            while (*((_DWORD *)f_mntonname - 10) != dev)
            {
              f_mntonname += 2168;
              if (!--v12)
                goto LABEL_14;
            }
            __strlcpy_chk();
          }
        }
LABEL_14:
        free(v10);
      }
    }
    syslog(2, "dev %d (%s) : purging events up to event id %lld", dev, v17, eventId);
    if (f2d_purge_events_for_device_up_to_event_id_rpc(FSEvents_f2d_public_port, dev, eventId, &v16))
    {
      v14 = fsevent_default_log();
      v5 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
      if (v5)
      {
        FSEventsPurgeEventsForDeviceUpToEventId_cold_1();
        LOBYTE(v5) = 0;
      }
    }
    else
    {
      LOBYTE(v5) = v16 == 0;
    }
  }
  return v5;
}

void FSEventStreamShow(ConstFSEventStreamRef streamRef)
{
  FILE **v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (FILE **)MEMORY[0x24BDAC8D8];
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "FSEventStreamRef @ %p:\n", streamRef);
  if (streamRef)
  {
    fprintf(*v2, "   allocator = %p\n", *((const void **)streamRef + 1));
    fprintf(*v2, "   callback = %p\n", *((const void **)streamRef + 2));
    fprintf(*v2, "   f2d_private_port = 0x%x\n", *((_DWORD *)streamRef + 49));
    fprintf(*v2, "   context = {%lu, %p, %p, %p, %p}\n", *((_QWORD *)streamRef + 3), *((const void **)streamRef + 4), *((const void **)streamRef + 5), *((const void **)streamRef + 6), *((const void **)streamRef + 7));
    fprintf(*v2, "   numPathsToWatch = %lu\n", *((_QWORD *)streamRef + 9));
    fprintf(*v2, "   pathsToWatch = %p\n", *((const void **)streamRef + 10));
    if (*((uint64_t *)streamRef + 9) >= 1)
    {
      v3 = 0;
      do
      {
        fprintf(*v2, "        pathsToWatch[%d] = '%s'\n", v3, *(const char **)(*((_QWORD *)streamRef + 10) + 8 * v3));
        ++v3;
      }
      while (*((_QWORD *)streamRef + 9) > v3);
    }
    fprintf(*v2, "   numPathsToExclude = %lu\n", *((_QWORD *)streamRef + 12));
    if (*((uint64_t *)streamRef + 12) >= 1)
    {
      v4 = 0;
      do
      {
        fprintf(*v2, "        pathsToExclude[%d] = '%s'\n", v4, *((const char **)streamRef + v4 + 13));
        ++v4;
      }
      while (*((_QWORD *)streamRef + 12) > v4);
    }
    fprintf(*v2, "   latestEventId = %lld\n", *((_QWORD *)streamRef + 21));
    fprintf(*v2, "   latency = %llu (microseconds)\n", *((_QWORD *)streamRef + 22));
    fprintf(*v2, "   flags = 0x%08x\n", *((_DWORD *)streamRef + 46));
    fprintf(*v2, "   runLoop = %p\n", *((const void **)streamRef + 28));
    fprintf(*v2, "   runLoopMode = %p\n", *((const void **)streamRef + 29));
  }
}

void server_gone_StreamRef_callback(uint64_t a1)
{
  const __CFAllocator *v2;
  mach_port_name_t *v3;
  CFNumberRef v4;
  ipc_space_t *v5;
  uint64_t v6;
  uint64_t v7;
  __CFRunLoopSource *v8;
  __CFMachPort *v9;
  __CFMachPort *v10;
  NSObject *v11;
  NSObject *v12;
  int *v13;
  int v14;
  int v15;
  NSObject *v16;
  CFNumberRef v17;
  __CFMachPort *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CFMachPortContext context;

  if (a1 && !*(_BYTE *)(a1 + 189) && (*(_QWORD *)(a1 + 360) || *(_QWORD *)(a1 + 224)))
  {
    v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v3 = (mach_port_name_t *)(a1 + 192);
    v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, (const void *)(a1 + 192));
    pthread_mutex_lock(&FSEvents_streamDict_mutex);
    CFDictionaryRemoveValue((CFMutableDictionaryRef)FSEvents_streamDict, v4);
    pthread_mutex_unlock(&FSEvents_streamDict_mutex);
    CFRelease(v4);
    pthread_mutex_lock(&FSEvents_f2d_public_port_mutex);
    v5 = (ipc_space_t *)MEMORY[0x24BDAEC58];
    mach_port_deallocate(*MEMORY[0x24BDAEC58], FSEvents_f2d_public_port);
    FSEvents_f2d_public_port = 0;
    pthread_mutex_unlock(&FSEvents_f2d_public_port_mutex);
    v6 = *(_QWORD *)(a1 + 360);
    if (v6)
    {
      cancel_source((NSObject **)(a1 + 360), (int *)(a1 + 368));
      *(_DWORD *)(a1 + 192) = 0;
    }
    v7 = *(_QWORD *)(a1 + 376);
    if (v7)
    {
      cancel_source((NSObject **)(a1 + 376), (int *)(a1 + 384));
      *(_DWORD *)(a1 + 196) = 0;
    }
    v8 = *(__CFRunLoopSource **)(a1 + 216);
    if (v8)
    {
      CFRunLoopRemoveSource(*(CFRunLoopRef *)(a1 + 224), v8, *(CFRunLoopMode *)(a1 + 232));
      CFRelease(*(CFTypeRef *)(a1 + 216));
      *(_QWORD *)(a1 + 216) = 0;
    }
    v9 = *(__CFMachPort **)(a1 + 208);
    if (v9)
    {
      CFMachPortSetInvalidationCallBack(v9, 0);
      CFMachPortInvalidate(*(CFMachPortRef *)(a1 + 208));
      CFRelease(*(CFTypeRef *)(a1 + 208));
      *(_QWORD *)(a1 + 208) = 0;
    }
    if (!v7)
    {
      mach_port_deallocate(*v5, *(_DWORD *)(a1 + 196));
      *(_DWORD *)(a1 + 196) = 0;
    }
    v10 = *(__CFMachPort **)(a1 + 200);
    if (v10)
    {
      CFMachPortInvalidate(v10);
      CFRelease(*(CFTypeRef *)(a1 + 200));
      *(_QWORD *)(a1 + 200) = 0;
    }
    if (!v6)
    {
      dispose_d2f_port(*v3);
      *v3 = 0;
    }
    if (FSEvents_connect())
    {
      v11 = fsevent_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        server_gone_StreamRef_callback_cold_4();
    }
    else if (allocate_d2f_port((uint64_t)"server_gone_StreamRef_callback", a1))
    {
      v12 = fsevent_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        server_gone_StreamRef_callback_cold_3();
    }
    else
    {
      v13 = (int *)(a1 + 196);
      v14 = register_with_server(a1, (uint64_t)"server_gone_StreamRef_callback", *(_DWORD *)(a1 + 192), *(_DWORD *)(a1 + 64), *(_DWORD *)(a1 + 72), *(const void ***)(a1 + 80), -1, *(_QWORD *)(a1 + 176), *(_DWORD *)(a1 + 184), (_DWORD *)(a1 + 196));
      if (v14)
      {
        v15 = v14;
        v16 = fsevent_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          server_gone_StreamRef_callback_cold_2(v13, v15, v16);
      }
      else
      {
        v17 = CFNumberCreate(v2, kCFNumberIntType, (const void *)(a1 + 192));
        pthread_mutex_lock(&FSEvents_streamDict_mutex);
        CFDictionaryAddValue((CFMutableDictionaryRef)FSEvents_streamDict, v17, (const void *)a1);
        pthread_mutex_unlock(&FSEvents_streamDict_mutex);
        CFRelease(v17);
        if (v6)
        {
          if (create_d2f_port_source(a1))
            resume_source(*(NSObject **)(a1 + 360), (int *)(a1 + 368));
          if (create_f2d_private_port_source(a1))
            resume_source(*(NSObject **)(a1 + 376), (int *)(a1 + 384));
        }
        else if (*(_QWORD *)(a1 + 224))
        {
          context.version = 0;
          context.info = (void *)a1;
          context.retain = (const void *(__cdecl *)(const void *))_FSEventStreamRetainAndReturnSelf;
          context.release = (void (__cdecl *)(const void *))FSEventStreamRelease;
          context.copyDescription = (CFStringRef (__cdecl *)(const void *))FSEventStreamCopyDescription;
          v18 = CFMachPortCreateWithPort(0, *(_DWORD *)(a1 + 196), (CFMachPortCallBack)FSEventsClientPortCallback, &context, 0);
          *(_QWORD *)(a1 + 208) = v18;
          if (v18)
          {
            CFMachPortSetInvalidationCallBack(v18, (CFMachPortInvalidationCallBack)server_gone_callback);
            _createAndAddRunLoopSource((int)"server_gone_StreamRef_callback", a1, *(CFRunLoopRef *)(a1 + 224), *(CFRunLoopMode *)(a1 + 232));
          }
          else
          {
            v19 = fsevent_default_log();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              server_gone_StreamRef_callback_cold_1(v19, v20, v21, v22, v23, v24, v25, v26);
          }
        }
        FSEventStreamRetain((FSEventStreamRef)a1);
        if (*(uint64_t *)(a1 + 72) >= 1)
        {
          v27 = 0;
          do
            root_dir_event_callback(a1, v27++, 5);
          while (*(_QWORD *)(a1 + 72) > v27);
        }
        FSEventStreamRelease((FSEventStreamRef)a1);
      }
    }
  }
}

void root_dir_event_callback(uint64_t a1, int a2, int a3)
{
  void (*v3)(uint64_t, _QWORD, uint64_t, const char **, int *, _QWORD *);
  const char *v6;
  int v7;
  const __CFAllocator *v8;
  __CFString *v9;
  __CFString *v10;
  CFArrayRef v11;
  CFArrayRef v12;
  const __CFAllocator *v13;
  CFArrayRef v14;
  CFArrayRef v15;
  CFTypeRef v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  CFTypeRef cf;
  int v37;
  const char *v38;
  void *values;
  void *keys;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(void (**)(uint64_t, _QWORD, uint64_t, const char **, int *, _QWORD *))(a1 + 16);
  if (!v3)
    return;
  v6 = caller_path(*(const char **)(*(_QWORD *)(a1 + 80) + 8 * a2), *(_DWORD *)(*(_QWORD *)(a1 + 88) + 4 * a2));
  v38 = v6;
  v37 = a3;
  v41[0] = 0;
  v7 = *(_DWORD *)(a1 + 184);
  if ((v7 & 0x40) != 0)
  {
    v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v9 = (__CFString *)CFStringCreateWithFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x24BDBD240], v6);
    if (v9)
    {
      v10 = v9;
      values = v9;
      keys = CFSTR("path");
      cf = CFDictionaryCreate(v8, (const void **)&keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (cf)
      {
        v11 = CFArrayCreate(v8, &cf, 1, MEMORY[0x24BDBD690]);
        if (v11)
        {
          v12 = v11;
          (*(void (**)(uint64_t, _QWORD, uint64_t, CFArrayRef, int *, _QWORD *))(a1 + 16))(a1, *(_QWORD *)(a1 + 32), 1, v11, &v37, v41);
          CFRelease(v12);
        }
        else
        {
          v20 = fsevent_default_log();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            root_dir_event_callback_cold_2(v20, v21, v22, v23, v24, v25, v26, v27);
        }
        CFRelease(cf);
      }
      else
      {
        v18 = fsevent_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          root_dir_event_callback_cold_4();
      }
      v16 = v10;
      goto LABEL_22;
    }
    v17 = fsevent_default_log();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      return;
LABEL_13:
    root_dir_event_callback_cold_1();
    return;
  }
  if ((v7 & 1) == 0)
  {
    v3(a1, *(_QWORD *)(a1 + 32), 1, &v38, &v37, v41);
    return;
  }
  v13 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  cf = CFStringCreateWithFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x24BDBD240], v6);
  if (!cf)
  {
    v19 = fsevent_default_log();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      return;
    goto LABEL_13;
  }
  v14 = CFArrayCreate(v13, &cf, 1, MEMORY[0x24BDBD690]);
  if (v14)
  {
    v15 = v14;
    (*(void (**)(uint64_t, _QWORD, uint64_t, CFArrayRef, int *, _QWORD *))(a1 + 16))(a1, *(_QWORD *)(a1 + 32), 1, v14, &v37, v41);
    CFRelease(v15);
    v16 = cf;
LABEL_22:
    CFRelease(v16);
    return;
  }
  v28 = fsevent_default_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    root_dir_event_callback_cold_2(v28, v29, v30, v31, v32, v33, v34, v35);
}

void resume_source(NSObject *a1, int *a2)
{
  int v3;

  if (a1)
  {
    v3 = *a2;
    if (*a2)
    {
      if (v3 == 2)
      {
        dispatch_resume(a1);
      }
      else if (v3 == 1)
      {
        dispatch_activate(a1);
      }
      *a2 = 3;
    }
  }
}

uint64_t __create_f2d_private_port_source_block_invoke(uint64_t a1)
{
  return server_gone_StreamRef_callback(*(_QWORD *)(a1 + 32));
}

void __create_f2d_private_port_source_block_invoke_2(uint64_t a1)
{
  dispose_f2d_private_port(*(_DWORD *)(a1 + 48));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  FSEventStreamRelease(*(FSEventStreamRef *)(a1 + 40));
}

void cancel_source(NSObject **a1, int *a2)
{
  NSObject *v4;

  v4 = *a1;
  if (v4)
  {
    dispatch_source_cancel(v4);
    resume_source(*a1, a2);
    *a1 = 0;
  }
  *a2 = 0;
}

uint64_t watch_all_parents(uint64_t a1, int kq, char *__s, uint64_t a4, uint64_t a5)
{
  void *v10;
  int v11;
  uint64_t i;
  char *v13;
  int v14;
  int v15;
  int v16;
  NSObject *v17;
  uint64_t result;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  NSObject *v23;
  int v24;
  int *v25;
  char *v26;
  kevent changelist;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  char *v35;
  __int16 v36;
  char *v37;
  char __sa[1024];
  char v39[1024];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  memset(&changelist, 0, sizeof(changelist));
  v10 = *(void **)(a4 + 16);
  if (v10)
  {
    v11 = *(_DWORD *)(a4 + 8);
    if (v11 >= 1)
    {
      for (i = 0; i < v11; ++i)
      {
        if ((*(_DWORD *)(*(_QWORD *)(a4 + 16) + 4 * i) & 0x80000000) == 0)
        {
          changelist.ident = *(unsigned int *)(*(_QWORD *)(a4 + 16) + 4 * i);
          *(_QWORD *)&changelist.filter = 0x200002FFFCLL;
          changelist.data = 0;
          changelist.udata = (void *)(a5 | 0x80000000);
          kevent(kq, &changelist, 1, 0, 0, 0);
          close(*(_DWORD *)(*(_QWORD *)(a4 + 16) + 4 * i));
          v11 = *(_DWORD *)(a4 + 8);
        }
      }
      v10 = *(void **)(a4 + 16);
    }
    free(v10);
    *(_QWORD *)(a4 + 16) = 0;
    *(_DWORD *)(a4 + 8) = 0;
  }
  if (__s && *__s)
  {
    my_dirname(__s, __sa);
    v13 = v39;
    realpath_DARWIN_EXTSN(__sa, v39);
    v14 = 0;
    do
    {
      while (1)
      {
        v16 = *v13++;
        v15 = v16;
        if (v16 != 47)
          break;
        ++v14;
      }
    }
    while (v15);
    v19 = malloc_type_malloc(4 * v14, 0x100004052888210uLL);
    *(_QWORD *)(a4 + 16) = v19;
    if (v19)
    {
      v20 = 0;
      v21 = v14;
      *(_DWORD *)(a4 + 8) = v14;
      do
      {
        v22 = open(v39, 0x8000);
        *(_DWORD *)(*(_QWORD *)(a4 + 16) + 4 * v20) = v22;
        if ((v22 & 0x80000000) == 0)
        {
          fcntl(v22, 2, 1);
          changelist.ident = *(int *)(*(_QWORD *)(a4 + 16) + 4 * v20);
          *(_QWORD *)&changelist.filter = 0x200021FFFCLL;
          changelist.data = 0;
          changelist.udata = (void *)(a5 | 0x80000000);
          if (kevent(kq, &changelist, 1, 0, 0, 0) < 0)
          {
            v23 = fsevent_default_log();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              v24 = *(_DWORD *)(*(_QWORD *)(a4 + 16) + 4 * v20);
              v25 = __error();
              v26 = strerror(*v25);
              *(_DWORD *)buf = 136316162;
              v29 = a1;
              v30 = 2080;
              v31 = "watch_all_parents";
              v32 = 1024;
              v33 = v24;
              v34 = 2080;
              v35 = v39;
              v36 = 2080;
              v37 = v26;
              _os_log_error_impl(&dword_206833000, v23, OS_LOG_TYPE_ERROR, "%s: %s: error trying to add kqueue for fd %d (%s; %s)",
                buf,
                0x30u);
            }
          }
        }
        __strcpy_chk();
        my_dirname(__sa, v39);
        result = 0;
        ++v20;
      }
      while (v20 < v21 && v39[1]);
    }
    else
    {
      return 12;
    }
  }
  else
  {
    v17 = fsevent_default_log();
    result = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      watch_all_parents_cold_1();
      return 0;
    }
  }
  return result;
}

uint64_t FSEventsClientProcessMessageCallback()
{
  _DWORD *v0;
  _BYTE v2[16384];
  uint64_t v3;

  MEMORY[0x24BDAC7A8]();
  v3 = *MEMORY[0x24BDAC8D0];
  return FSEventsD2F_server(v0, (uint64_t)v2);
}

void __create_d2f_port_source_block_invoke_2(uint64_t a1)
{
  dispose_d2f_port(*(_DWORD *)(a1 + 48));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  FSEventStreamRelease(*(FSEventStreamRef *)(a1 + 40));
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x1Cu);
}

void OUTLINED_FUNCTION_14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x26u);
}

void OUTLINED_FUNCTION_15(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_20(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

char *OUTLINED_FUNCTION_24(int a1, mach_error_t error_value, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  return mach_error_string(error_value);
}

char *OUTLINED_FUNCTION_25@<X0>(mach_error_t error_value@<W0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 24) = a2;
  return mach_error_string(error_value);
}

void OUTLINED_FUNCTION_26(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x18u);
}

void OUTLINED_FUNCTION_27(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x30u);
}

void OUTLINED_FUNCTION_28(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x22u);
}

uint64_t f2d_register_rpc(int a1, int a2, int a3, int a4, uint64_t a5, int a6, uint64_t a7, int a8, int a9, uint64_t a10, int a11, uint64_t a12, int a13, uint64_t a14, int a15, uint64_t a16, _DWORD *a17)
{
  mach_port_name_t special_reply_port;
  uint64_t v19;
  uint64_t v20;
  _BYTE msg[36];
  int v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  int v31;
  int v32;
  uint64_t v33;
  int v34;
  int v35;
  uint64_t v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)&msg[20] = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(_DWORD *)&msg[24] = 5;
  *(_DWORD *)&msg[28] = a2;
  v23 = 1310720;
  v24 = a5;
  v25 = 16777472;
  v26 = 4 * a6;
  v27 = a7;
  v28 = 16777472;
  v29 = a8;
  v30 = a10;
  v31 = 16777472;
  v32 = 4 * a11;
  v33 = a12;
  v34 = 16777472;
  v35 = a13;
  v36 = *MEMORY[0x24BDAC470];
  v37 = a3;
  v38 = a4;
  v39 = a6;
  v40 = a8;
  v41 = a9;
  v42 = a11;
  v43 = a13;
  v44 = a14;
  v45 = a15;
  v46 = a16;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = -2147478253;
  *(_QWORD *)&msg[16] = 0x101D000000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v19 = mach_msg((mach_msg_header_t *)msg, 3162115, 0xA0u, 0x30u, special_reply_port, 0, 0);
  v20 = v19;
  if ((v19 - 268435458) > 0xE || ((1 << (v19 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v19)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v20 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 66100)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            v20 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8])
                v20 = 4294966996;
              else
                v20 = *(unsigned int *)&msg[32];
            }
          }
          else
          {
            v20 = 4294966996;
          }
          goto LABEL_23;
        }
        v20 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 40 && !*(_DWORD *)&msg[8] && HIWORD(v23) << 16 == 1114112)
        {
          v20 = 0;
          *a17 = *(_DWORD *)&msg[28];
          return v20;
        }
      }
      else
      {
        v20 = 4294966995;
      }
LABEL_23:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v20;
    }
    mig_dealloc_special_reply_port();
  }
  return v20;
}

uint64_t f2d_flush_rpc(int a1, _QWORD *a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  _BYTE msg[36];
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x101D100000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v5 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x34u, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v6 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 66101)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              v6 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                *a2 = v10;
                return v6;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8])
              v7 = 1;
            else
              v7 = *(_DWORD *)&msg[32] == 0;
            if (v7)
              v6 = 4294966996;
            else
              v6 = *(unsigned int *)&msg[32];
            goto LABEL_22;
          }
        }
        v6 = 4294966996;
      }
      else
      {
        v6 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  return v6;
}

uint64_t f2d_get_server_uuid_rpc(int a1, int a2, uint64_t a3)
{
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  __int128 v10;
  _BYTE msg[36];
  __int128 v12;
  _BYTE v13[28];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)&msg[20] = 0u;
  memset(v13, 0, sizeof(v13));
  v12 = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x24BDAC470];
  *(_DWORD *)&msg[32] = a2;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x101D200000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v6 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x24u, 0x50u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 66102)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 72)
          {
            if (!*(_DWORD *)&msg[8])
            {
              v7 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                v10 = *(_OWORD *)v13;
                *(_OWORD *)a3 = v12;
                *(_OWORD *)(a3 + 16) = v10;
                *(_DWORD *)(a3 + 32) = *(_DWORD *)&v13[16];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8])
              v8 = 1;
            else
              v8 = *(_DWORD *)&msg[32] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&msg[32];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t f2d_get_current_event_id_rpc(int a1, _QWORD *a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  _BYTE msg[36];
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x101D300000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v5 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x34u, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v6 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 66103)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              v6 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                *a2 = v10;
                return v6;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8])
              v7 = 1;
            else
              v7 = *(_DWORD *)&msg[32] == 0;
            if (v7)
              v6 = 4294966996;
            else
              v6 = *(unsigned int *)&msg[32];
            goto LABEL_22;
          }
        }
        v6 = 4294966996;
      }
      else
      {
        v6 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  return v6;
}

uint64_t f2d_get_last_event_for_device_before_time_rpc(int a1, int a2, uint64_t a3, _QWORD *a4)
{
  mach_port_name_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  _BYTE msg[36];
  __int128 v12;

  *(_OWORD *)&msg[20] = 0u;
  v12 = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x24BDAC470];
  *(_DWORD *)&msg[32] = a2;
  *(_QWORD *)&v12 = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x101D400000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v7 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x2Cu, 0x34u, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 66104)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              v8 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                *a4 = v12;
                return v8;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8])
              v9 = 1;
            else
              v9 = *(_DWORD *)&msg[32] == 0;
            if (v9)
              v8 = 4294966996;
            else
              v8 = *(unsigned int *)&msg[32];
            goto LABEL_22;
          }
        }
        v8 = 4294966996;
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint64_t f2d_purge_events_for_device_up_to_event_id_rpc(int a1, int a2, uint64_t a3, _DWORD *a4)
{
  mach_port_name_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  int v11;
  _BYTE rcv_name[44];

  memset(&rcv_name[16], 0, 28);
  *(_OWORD *)rcv_name = 0u;
  *(_QWORD *)&rcv_name[20] = *MEMORY[0x24BDAC470];
  *(_DWORD *)&rcv_name[28] = a2;
  *(_QWORD *)&rcv_name[32] = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  v11 = 5395;
  *(_QWORD *)&rcv_name[12] = 0x101D500000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v11);
    special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  v7 = mach_msg((mach_msg_header_t *)&v11, 3162115, 0x2Cu, 0x30u, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v8 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 66105)
      {
        if ((v11 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 40)
          {
            if (!*(_DWORD *)&rcv_name[4])
            {
              v8 = *(unsigned int *)&rcv_name[28];
              if (!*(_DWORD *)&rcv_name[28])
              {
                *a4 = *(_DWORD *)&rcv_name[32];
                return v8;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)rcv_name == 36)
          {
            if (*(_DWORD *)&rcv_name[4])
              v9 = 1;
            else
              v9 = *(_DWORD *)&rcv_name[28] == 0;
            if (v9)
              v8 = 4294966996;
            else
              v8 = *(unsigned int *)&rcv_name[28];
            goto LABEL_22;
          }
        }
        v8 = 4294966996;
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v11);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint64_t f2d_unregister_rpc(int a1)
{
  mach_port_name_t special_reply_port;
  uint64_t v3;
  uint64_t v4;
  _BYTE msg[36];
  uint64_t v7;

  v7 = 0;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x101D600000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v3 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x2Cu, special_reply_port, 0, 0);
  v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v3)
    {
      mig_dealloc_special_reply_port();
      return v4;
    }
    if (*(_DWORD *)&msg[20] == 71)
    {
      v4 = 4294966988;
    }
    else if (*(_DWORD *)&msg[20] == 66106)
    {
      v4 = 4294966996;
      if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
      {
        v4 = *(unsigned int *)&msg[32];
        if (!*(_DWORD *)&msg[32])
          return v4;
      }
    }
    else
    {
      v4 = 4294966995;
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v4;
}

void FSEventStreamStart_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamStart_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion: %s\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamStart_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion: %s\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void register_with_server_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s: %s: ERROR: array_of_path_lengths = malloc() failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void register_with_server_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s: %s: ERROR: array_of_path_offsets = malloc() failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void register_with_server_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s: %s: ERROR: paths_blob = malloc() failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void register_with_server_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  mach_error_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  _BYTE v11[24];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_24(v2, v3, v4, v5, v6, v7, v8, v9, *(uint64_t *)v11, *(uint64_t *)&v11[8], *(uint64_t *)&v11[16], v12, v13, v14);
  *(_DWORD *)v11 = 136315906;
  *(_QWORD *)&v11[4] = v1;
  OUTLINED_FUNCTION_4();
  *(_QWORD *)&v11[14] = "register_with_server";
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_14(&dword_206833000, v0, v10, "%s: %s: ERROR: f2d_register_rpc() => %s (%d)", v11);
  OUTLINED_FUNCTION_10();
}

void register_with_server_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_8(&dword_206833000, v0, v1, "%s:%d Insufficient Memory", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void register_with_server_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_8(&dword_206833000, v0, v1, "%s:%d Insufficient Memory", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void register_with_server_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void _FSEventStreamRetainAndReturnSelf_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamRelease_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamRelease_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_206833000, a1, a3, "%s: ERROR: over-released FSEventStreamRef", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamCopyDescription_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamCopyDescription_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_206833000, a1, a3, "%s: ERROR: cStr = malloc() failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventsClientPortCallback_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_20(&dword_206833000, a1, a3, "FSEventsClientPortCallback should NOT be called!\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_33();
}

void FSEventStreamStop_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamStop_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void dispose_f2d_private_port_cold_1(mach_error_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  mach_error_string(a1);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_28(&dword_206833000, v1, v2, "%s: ERROR: mach_port_deallocate(port = 0x%x) => %s (%d)", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_10();
}

void dispose_f2d_private_port_cold_2()
{
  mach_error_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_25(v0, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_206833000, v1, v2, "%s: ERROR: f2d_unregister_rpc() => %s (%d)", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_13();
}

void implementation_callback_rpc_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_206833000, a1, a3, "FSEvents: %s: WARNING: num_paths == 0", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void implementation_callback_rpc_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_206833000, a1, a3, "%s: ERROR: CFNumberCreate() => NULL", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void implementation_callback_rpc_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_206833000, a1, a3, "%s: ERROR: CFDictionaryGetValue(FSEvents_streamDict, cfPortNumber) => NULL", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void implementation_callback_rpc_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_206833000, a1, a3, "%s: ERROR: eventPaths = malloc() failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void implementation_callback_rpc_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_206833000, a1, a3, "%s: ERROR: pathFlags = malloc() failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void implementation_callback_rpc_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_206833000, a1, a3, "%s: ERROR: cfStringRef_eventPaths = calloc() failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void implementation_callback_rpc_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_206833000, a1, a3, "%s: ERROR: CFArrayCreate() failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void implementation_callback_rpc_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s: ERROR: CFStringCreateWithFileSystemRepresentation('%s') failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void implementation_callback_rpc_cold_9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_206833000, a1, a3, "%s: ERROR: CFArrayCreateMutable() => NULL\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void implementation_callback_rpc_cold_10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_206833000, a1, a3, "%s: ERROR: CFDictionaryCreateMutable() => NULL\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void implementation_callback_rpc_cold_11(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "implementation_callback_rpc";
  OUTLINED_FUNCTION_5(&dword_206833000, a3, (uint64_t)a3, "%s: ERROR: CFNumberCreate() => NULL\n", a1);
}

void implementation_callback_rpc_cold_13(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_206833000, a1, a3, "%s: ERROR: eventFlags = malloc() failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void implementation_callback_rpc_cold_14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_206833000, a1, a3, "%s: ERROR: eventIds = malloc() failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void implementation_callback_rpc_cold_15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void implementation_callback_rpc_cold_16()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void implementation_callback_rpc_cold_17()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void implementation_callback_rpc_cold_18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamRetain_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamGetLatestEventId_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamGetDeviceBeingWatched_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamCopyPathsBeingWatched_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamCopyPathsBeingWatched_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_206833000, a1, a3, "%s: ERROR: calloc() failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamCopyPathsBeingWatched_cold_3(_QWORD *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*a1 + 8 * a2);
  v4 = 136315394;
  v5 = "FSEventStreamCopyPathsBeingWatched";
  v6 = 2080;
  v7 = v3;
  _os_log_error_impl(&dword_206833000, log, OS_LOG_TYPE_ERROR, "%s: ERROR: CFStringCreateWithFileSystemRepresentation('%s') failed", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamCopyPathsBeingWatched_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_206833000, a1, a3, "%s: ERROR: CFArrayCreate() failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _FSEventStreamCreate_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s: %s: ERROR: parameter error kFSEventStreamCreateFlagUseCFTypes requires  kFSEventStreamCreateFlagUseExtendedData", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void _FSEventStreamCreate_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "_FSEventStreamCreate";
  v6 = 2048;
  v7 = 456;
  _os_log_error_impl(&dword_206833000, a2, OS_LOG_TYPE_ERROR, "%s: %s: ERROR: could not allocate %lu bytes for FSEventStream", (uint8_t *)&v2, 0x20u);
  OUTLINED_FUNCTION_16();
}

void _FSEventStreamCreate_cold_3(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;
  uint64_t v4;

  LODWORD(v3) = 136315650;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_15(&dword_206833000, v1, v2, "%s: %s: ERROR: could not allocate %lu bytes for array of path strings", (const char *)v3, DWORD2(v3), v4);
  OUTLINED_FUNCTION_16();
}

void _FSEventStreamCreate_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s: %s: ERROR: CFStringGetCString() failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void _FSEventStreamCreate_cold_5(uint64_t a1)
{
  int v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = a1;
  OUTLINED_FUNCTION_4();
  v5 = "_FSEventStreamCreate";
  v6 = 1024;
  v7 = v1;
  OUTLINED_FUNCTION_9(&dword_206833000, v2, (uint64_t)v2, "%s: %s: ERROR: could not allocate %d bytes for path string (2)", (uint8_t *)&v3);
  OUTLINED_FUNCTION_16();
}

void _FSEventStreamCreate_cold_6(uint64_t a1, uint64_t a2)
{
  int v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = 136315650;
  v5 = a2;
  OUTLINED_FUNCTION_4();
  v6 = "_FSEventStreamCreate";
  v7 = 1024;
  v8 = v2;
  OUTLINED_FUNCTION_9(&dword_206833000, v3, (uint64_t)v3, "%s: %s: ERROR: (CFStringGetTypeID() != CFGetTypeID(cfStringRef)) (i = %d)\n", (uint8_t *)&v4);
  OUTLINED_FUNCTION_16();
}

void _FSEventStreamCreate_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s: %s: ERROR: could not open kqueue ", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void _FSEventStreamCreate_cold_8(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;
  uint64_t v4;

  LODWORD(v3) = 136315650;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_15(&dword_206833000, v1, v2, "%s: %s: ERROR: could not allocate %lu bytes for array of dir_info structs", (const char *)v3, DWORD2(v3), v4);
  OUTLINED_FUNCTION_16();
}

void _FSEventStreamCreate_cold_9(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;
  uint64_t v4;

  LODWORD(v3) = 136315650;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_15(&dword_206833000, v1, v2, "%s: %s: ERROR: could not allocate %lu bytes for array of kevents", (const char *)v3, DWORD2(v3), v4);
  OUTLINED_FUNCTION_16();
}

void FSEventStreamCreateRelativeToDevice_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void _FSEventStreamDeallocate_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void _FSEventStreamDeallocate_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion: %s\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void _FSEventStreamDeallocate_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion: %s\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void _FSEventStreamDeallocate_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamScheduleWithRunLoop_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamScheduleWithRunLoop_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamScheduleWithRunLoop_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_206833000, a1, a3, "%s: failed to create the cffd", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamScheduleWithRunLoop_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_206833000, a1, a3, "%s: failed to create the cffd run loop source!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamScheduleWithRunLoop_cold_5()
{
  mach_error_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_25(v0, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_206833000, v1, v2, "%s: ERROR: _createAndAddRunLoopSource(...) => %s (%d)", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_13();
}

void FSEventStreamScheduleWithRunLoop_cold_6()
{
  mach_error_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_25(v0, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_206833000, v1, v2, "%s: ERROR: allocate_d2f_port(...) => %s (%d)", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_13();
}

void allocate_d2f_port_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  mach_error_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  _BYTE v11[24];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_24(v2, v3, v4, v5, v6, v7, v8, v9, *(uint64_t *)v11, *(uint64_t *)&v11[8], *(uint64_t *)&v11[16], v12, v13, v14);
  *(_DWORD *)v11 = 136315906;
  *(_QWORD *)&v11[4] = v1;
  OUTLINED_FUNCTION_4();
  *(_QWORD *)&v11[14] = "allocate_d2f_port";
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_14(&dword_206833000, v0, v10, "%s: %s: ERROR: mach_port_allocate() => %s (%d)", v11);
  OUTLINED_FUNCTION_10();
}

void _createAndAddRunLoopSource_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void _createAndAddRunLoopSource_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s: %s: ERROR: CFMachPortCreateWithPort() => NULL", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void _createAndAddRunLoopSource_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s: %s: ERROR: CFMachPortCreateRunLoopSource() => NULL", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void _createAndAddRunLoopSource_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamUnscheduleFromRunLoop_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamUnscheduleFromRunLoop_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamUnscheduleFromRunLoop_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion: %s\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamSetDispatchQueue_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamSetDispatchQueue_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_20(&dword_206833000, a1, a3, "Failed to create a kq event source for the WatchRoot flag.\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_33();
}

void FSEventStreamSetDispatchQueue_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_206833000, a1, a3, "%s: ERROR: create_d2f_port_source() failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamSetDispatchQueue_cold_4()
{
  mach_error_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_25(v0, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_206833000, v1, v2, "%s: ERROR: allocate_d2f_port(...) => %s (%d)", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_13();
}

void process_dir_events_cold_1(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  strerror(a1);
  OUTLINED_FUNCTION_6(&dword_206833000, v1, v2, "%s: kevent returned %d (%s)", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_13();
}

void FSEventStreamFlushAsync_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamFlushAsync_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion: %s\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamFlushAsync_cold_3()
{
  mach_error_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_25(v0, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_206833000, v1, v2, "%s: ERROR: f2d_flush_rpc() => %s (%d)", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_13();
}

void FSEventStreamFlushSync_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamFlushSync_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamFlushSync_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamFlushSync_cold_5()
{
  __int16 v0;
  int v1;
  NSObject *v2;
  uint64_t v3;
  _WORD v4[10];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v4 = 136315650;
  OUTLINED_FUNCTION_23();
  *(_DWORD *)&v4[7] = 3370;
  v4[9] = v0;
  v5 = v1;
  OUTLINED_FUNCTION_26(&dword_206833000, v2, v3, "%s:%d: error waiting on the dispatch_cond (%d)\n", (uint8_t *)v4);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamFlushSync_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamFlushSync_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  mach_error_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  _BYTE v11[24];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_24(v2, v3, v4, v5, v6, v7, v8, v9, *(uint64_t *)v11, *(uint64_t *)&v11[8], *(uint64_t *)&v11[16], v12, v13, v14);
  *(_DWORD *)v11 = 136315906;
  *(_QWORD *)&v11[4] = "FSEventStreamFlushSync";
  *(_WORD *)&v11[12] = 2048;
  *(_QWORD *)&v11[14] = v1;
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_14(&dword_206833000, v0, v10, "%s(streamRef = %p): ERROR: f2d_flush_rpc() => %s (%d)", v11);
  OUTLINED_FUNCTION_10();
}

void FSEventStreamFlushSync_cold_8()
{
  __int16 v0;
  int v1;
  NSObject *v2;
  uint64_t v3;
  _WORD v4[10];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v4 = 136315650;
  OUTLINED_FUNCTION_23();
  *(_DWORD *)&v4[7] = 3329;
  v4[9] = v0;
  v5 = v1;
  OUTLINED_FUNCTION_26(&dword_206833000, v2, v3, "%s:%d: error waiting on the dispatch_cond (%d)\n", (uint8_t *)v4);
  OUTLINED_FUNCTION_1();
}

void _runRunLoopOnceForFlushSync_cold_1()
{
  NSObject *v0;
  uint8_t v1[34];
  int v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_32();
  v2 = 1;
  OUTLINED_FUNCTION_14(&dword_206833000, v0, (uint64_t)v0, "%s(streamRef = %p): ERROR: CFRunLoopRunInMode() => %s (%d)", v1);
  OUTLINED_FUNCTION_16();
}

void _runRunLoopOnceForFlushSync_cold_2()
{
  NSObject *v0;
  uint8_t v1[34];
  int v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_32();
  v2 = 2;
  OUTLINED_FUNCTION_14(&dword_206833000, v0, (uint64_t)v0, "%s(streamRef = %p): ERROR: CFRunLoopRunInMode() => %s (%d)", v1);
  OUTLINED_FUNCTION_16();
}

void FSEventStreamInvalidate_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamInvalidate_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion: %s\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventStreamInvalidate_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion: %s\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void dispose_d2f_port_cold_1(mach_error_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  mach_error_string(a1);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_28(&dword_206833000, v1, v2, "%s: ERROR: mach_port_mod_refs(port = 0x%x, MACH_PORT_RIGHT_RECEIVE, -1) => %s (%d)", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_10();
}

void FSEvents_connect_cold_1()
{
  kern_return_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_21();
  bootstrap_strerror(v0);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_206833000, v1, v2, "%s: ERROR: FSEvents_connect() => %s (%d)", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_10();
}

void FSEventsCopyUUIDForDevice_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s(): failed assertion '%s'\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void FSEventsPurgeEventsForDeviceUpToEventId_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8(&dword_206833000, v0, v1, "%s: f2d_purge_events_for_device_up_to_event_id_rpc() failed: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void server_gone_StreamRef_callback_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_20(&dword_206833000, a1, a3, "server_gone_callback: failed to create the clientmachportref!\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_33();
}

void server_gone_StreamRef_callback_cold_2(int *a1, int a2, NSObject *a3)
{
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 136315650;
  v5 = "server_gone_StreamRef_callback";
  v6 = 1024;
  v7 = a2;
  v8 = 1024;
  v9 = v3;
  OUTLINED_FUNCTION_26(&dword_206833000, a3, (uint64_t)a3, "%s: re-registering with server failed and returned %d (f2d port %u)", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void server_gone_StreamRef_callback_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8(&dword_206833000, v0, v1, "%s: re-allocating d2f port failed and returned %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void server_gone_StreamRef_callback_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8(&dword_206833000, v0, v1, "%s: failed to reconnect to server! (kr 0x%x)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void root_dir_event_callback_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s: ERROR: CFStringCreateWithFileSystemRepresentation('%s') failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void root_dir_event_callback_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_206833000, a1, a3, "%s: ERROR: CFArrayCreate() failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void root_dir_event_callback_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s: ERROR: CFDictionaryCreate('%s') failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void watch_path_cold_1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_27(&dword_206833000, v1, v2, "%s: %s:2: open('%s', O_RDONLY) failed <3>, errno = %d (%s)", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_30();
}

void watch_path_cold_2()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_27(&dword_206833000, v1, v2, "%s: %s:2: open('%s', O_RDONLY) failed <2>, errno = %d (%s)", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_30();
}

void watch_path_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s: watching path(%s) renamed and revalidated after watchroot registration", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void watch_all_parents_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_206833000, v0, v1, "%s: %s: empty watchpath", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void receive_and_dispatch_rcv_msg_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8(&dword_206833000, v0, v1, "%s: mach_msg <2> - err (%d)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void receive_and_dispatch_rcv_msg_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_8(&dword_206833000, v0, v1, "%s: mach_msg <1> - err (%d)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x24BDBB790](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x24BDBB7A0](allocator, ptr);
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x24BDBB7A8]();
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

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x24BDBB898](theArray, idx, value);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

CFFileDescriptorRef CFFileDescriptorCreate(CFAllocatorRef allocator, CFFileDescriptorNativeDescriptor fd, Boolean closeOnInvalidate, CFFileDescriptorCallBack callout, const CFFileDescriptorContext *context)
{
  return (CFFileDescriptorRef)MEMORY[0x24BDBBEB0](allocator, *(_QWORD *)&fd, closeOnInvalidate, callout, context);
}

CFRunLoopSourceRef CFFileDescriptorCreateRunLoopSource(CFAllocatorRef allocator, CFFileDescriptorRef f, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBBEB8](allocator, f, order);
}

void CFFileDescriptorDisableCallBacks(CFFileDescriptorRef f, CFOptionFlags callBackTypes)
{
  MEMORY[0x24BDBBEC0](f, callBackTypes);
}

void CFFileDescriptorEnableCallBacks(CFFileDescriptorRef f, CFOptionFlags callBackTypes)
{
  MEMORY[0x24BDBBEC8](f, callBackTypes);
}

CFFileDescriptorNativeDescriptor CFFileDescriptorGetNativeDescriptor(CFFileDescriptorRef f)
{
  return MEMORY[0x24BDBBED0](f);
}

void CFFileDescriptorInvalidate(CFFileDescriptorRef f)
{
  MEMORY[0x24BDBBED8](f);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBBFB0](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x24BDBBFB8](allocator, *(_QWORD *)&portNum, callout, context, shouldFreeInfo);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
  MEMORY[0x24BDBBFD0](port);
}

void CFMachPortSetInvalidationCallBack(CFMachPortRef port, CFMachPortInvalidationCallBack callout)
{
  MEMORY[0x24BDBBFE0](port, callout);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
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

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC348](rl, source, mode);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x24BDBC360](mode, returnAfterSourceHandled, seconds);
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

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x24BDBC640](string, buffer, maxBufLen);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8D8](alloc, uuidStr);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x24BDAC900]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x24BDAC908]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x24BDAD2E8]();
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return (const char *)MEMORY[0x24BDAD308](*(_QWORD *)&r);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x24BDADF50]();
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

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
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

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x24BDAE5A8](a1, a2, a3, a4, *(_QWORD *)&a5);
}

char *__cdecl getcwd(char *a1, size_t a2)
{
  return (char *)MEMORY[0x24BDAE5D8](a1, a2);
}

int getfsstat(statfs *a1, int a2, int a3)
{
  return MEMORY[0x24BDAE608](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int kevent(int kq, const kevent *changelist, int nchanges, kevent *eventlist, int nevents, const timespec *timeout)
{
  return MEMORY[0x24BDAE968](*(_QWORD *)&kq, changelist, *(_QWORD *)&nchanges, eventlist, *(_QWORD *)&nevents, timeout);
}

int kqueue(void)
{
  return MEMORY[0x24BDAE998]();
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAEB28](a1, a2);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x24BDAEB58](*(_QWORD *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x24BDAEB80](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x24BDAEB90](a1);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x24BDAEBA0](*(_QWORD *)&task, *(_QWORD *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x24BDAEBF8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

uint64_t mig_dealloc_special_reply_port()
{
  return MEMORY[0x24BDAEEE8]();
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
  MEMORY[0x24BDAEEF0](a1, a2);
}

uint64_t mig_get_special_reply_port()
{
  return MEMORY[0x24BDAEF00]();
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

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x24BDAF7D8](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7E0](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x24BDAF800](a1, a2);
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

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x24BDAFAC0](a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFE60](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFFA8](__s, *(_QWORD *)&__c);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

