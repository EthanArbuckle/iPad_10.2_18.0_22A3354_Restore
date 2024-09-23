@implementation DTPosixSpawnProcessControlService

+ (void)registerCapabilities:(id)a3
{
  id v4;

  v4 = a3;
  if (+[DTInstrumentServer isAppleInternal](DTInstrumentServer, "isAppleInternal"))
  {
    objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.processcontrol.posixspawn"), 2, a1);
    objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.dt.services.capabilities.posix_spawn"), 2, a1);
    objc_msgSend(v4, "publishCapability:withVersion:forClass:", DTDefaultProcessControlServiceIdentifier, 2, a1);
  }

}

+ (int)posixSpawnWithPath:(id)a3 environment:(id)a4 arguments:(id)a5 options:(id)a6 fileDescriptorHandler:(id)a7
{
  __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  const __CFURL *v20;
  __CFBundle *v21;
  __CFBundle *v22;
  const __CFURL *v23;
  const __CFURL *v24;
  const __CFURL *v25;
  const __CFURL *v26;
  char v27;
  char v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  cpu_type_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  BOOL v43;
  uint64_t v44;
  void *v45;
  unint64_t v46;
  uint64_t v47;
  char *const *v48;
  size_t v49;
  __CFString *v50;
  char *v51;
  uint64_t v52;
  char *v53;
  __CFString *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i;
  id v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  char *const *v68;
  size_t v69;
  uint64_t v70;
  void *v71;
  int v72;
  __int128 v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  char *v78;
  __CFString *v79;
  int v80;
  char *v81;
  char **v82;
  char *v83;
  char *v84;
  char **v85;
  char *v86;
  void *v87;
  void *v88;
  _QWORD v90[2];
  __int128 v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  __CFString *v97;
  id v98;
  id v99;
  id v100;
  unsigned int v101;
  _QWORD v102[6];
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  posix_spawn_file_actions_t v107;
  __int16 v108;
  posix_spawnattr_t v109;
  char v110;
  int v111;
  int v112;
  __int16 v113;
  char *v114;
  _BYTE v115[128];
  __int128 buf;
  uint64_t v117;
  int v118;
  int v119[2];
  int v120[2];
  cpu_type_t v121[2];
  uint64_t v122;

  v122 = *MEMORY[0x24BDAC8D0];
  v11 = (__CFString *)a3;
  v100 = a4;
  v99 = a5;
  v12 = a6;
  v98 = a7;
  if (-[__CFString length](v11, "length"))
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", DTProcessControlServiceOption_InheritLauncherEnvironmentVariables[0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v13;
    if (!v13 || objc_msgSend(v13, "BOOLValue"))
    {
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "environment");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "mutableCopy");

      objc_msgSend(v16, "addEntriesFromDictionary:", v100);
      v100 = v16;
    }
    v110 = 0;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "fileExistsAtPath:isDirectory:", v11, &v110);
    if (v110)
      v19 = v18;
    else
      v19 = 0;

    if (!v19)
    {
      v97 = v11;
      goto LABEL_31;
    }
    v20 = CFURLCreateWithFileSystemPath(0, v11, kCFURLPOSIXPathStyle, 1u);
    v21 = CFBundleCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v20);
    v22 = v21;
    if (v21)
    {
      v23 = CFBundleCopyExecutableURL(v21);
      v24 = v23;
      if (v23)
      {
        v25 = CFURLCopyAbsoluteURL(v23);
        v26 = v25;
        if (v25)
        {
          v97 = (__CFString *)CFURLCopyFileSystemPath(v25, kCFURLPOSIXPathStyle);
          v27 = 0;
          v28 = 0;
          if (!v20)
            goto LABEL_23;
          goto LABEL_22;
        }
        v97 = 0;
        v27 = 0;
LABEL_21:
        v28 = 1;
        if (!v20)
        {
LABEL_23:
          if (v22)
            CFRelease(v22);
          if ((v27 & 1) == 0)
            CFRelease(v24);
          if ((v28 & 1) == 0)
            CFRelease(v26);
          if (!-[__CFString length](v97, "length"))
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              v36 = -[__CFString UTF8String](objc_retainAutorelease(v11), "UTF8String");
              LODWORD(buf) = 136315138;
              *(_QWORD *)((char *)&buf + 4) = v36;
              _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to find actual binary to posix_spawn for path: %s", (uint8_t *)&buf, 0xCu);
            }
            objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("DTPosixSpawnFailureException"), CFSTR("Unable to find actual binary to posix_spawn for path: %@\n"), v11);

            v29 = 0;
            goto LABEL_123;
          }

LABEL_31:
          v109 = 0;
          posix_spawnattr_init(&v109);
          v108 = 0;
          posix_spawnattr_getflags(&v109, &v108);
          posix_spawnattr_setpgroup(&v109, 0);
          v108 |= 0x4002u;
          objc_msgSend(v12, "objectForKeyedSubscript:", DTProcessControlServiceOption_LeaveSuspendedKey[0]);
          v95 = (id)objc_claimAutoreleasedReturnValue();
          if (v95 && !objc_msgSend(v95, "BOOLValue"))
            v30 = v108 & 0xFF7F;
          else
            v30 = v108 | 0x80;
          v108 = v30;
          v31 = posix_spawnattr_setflags(&v109, v30);
          if ((_DWORD)v31)
          {
            posix_spawnattr_destroy(&v109);
            objc_msgSend(CFSTR(" ("), "stringByAppendingFormat:", CFSTR("Unable to set flags via posix_spawnattr_setflags(): flags=0x%016x, error=%d"), v108, v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "stringByAppendingString:", CFSTR(")"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 67109120;
              DWORD1(buf) = v31;
              _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to set up posix_spawnattr_t: %d", (uint8_t *)&buf, 8u);
            }
            objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("DTPosixSpawnFailureException"), CFSTR("posix_spawn failure while launching: %@%@"), v97, v33);

            v29 = 0;
            goto LABEL_122;
          }
          objc_msgSend(v12, "objectForKeyedSubscript:", DTProcessControlServiceOption_Allow64Bit[0]);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = v34;
          if (v34)
          {
            if ((objc_msgSend(v34, "BOOLValue") & 1) != 0)
              v35 = 16777228;
            else
              v35 = 12;
            v121[0] = v35;
            v37 = 1;
          }
          else
          {
            v37 = 0;
          }
          v121[v37] = -1;
          v38 = posix_spawnattr_setbinpref_np(&v109, v37 + 1, v121, 0);
          if ((_DWORD)v38)
          {
            posix_spawnattr_destroy(&v109);
            objc_msgSend(CFSTR(" ("), "stringByAppendingFormat:", CFSTR("Unable to choose architecture %d: %d"), v121[0], v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "stringByAppendingString:", CFSTR(")"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 67109120;
              DWORD1(buf) = v38;
              _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to set up posix_spawnattr_t: %d", (uint8_t *)&buf, 8u);
            }
            objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("DTPosixSpawnFailureException"), CFSTR("posix_spawn failure while launching: %@%@"), v97, v40);

            v29 = 0;
            goto LABEL_121;
          }
          v107 = 0;
          posix_spawn_file_actions_init(&v107);
          *(_QWORD *)v119 = -1;
          *(_QWORD *)v120 = -1;
          v41 = !DTProcessShouldCaptureOutputWithOptions(v12);
          if (!v98)
            LOBYTE(v41) = 1;
          if (!v41)
          {
            if (pipe(v120) == -1 || pipe(v119) == -1)
            {
              v44 = *__error();
              posix_spawn_file_actions_destroy(&v107);
              posix_spawnattr_destroy(&v109);
              objc_msgSend(CFSTR(" ("), "stringByAppendingFormat:", CFSTR("Unable to allocate process I/O pipes %d"), v44);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "stringByAppendingString:", CFSTR(")"));
              v93 = (id)objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              {
                *(_QWORD *)&buf = 67109120;
                _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to set up posix_spawnattr_t: %d", (uint8_t *)&buf, 8u);
              }
              objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("DTPosixSpawnFailureException"), CFSTR("posix_spawn failure while launching: %@%@"), v97, v93);
              v29 = 0;
              goto LABEL_120;
            }
            posix_spawn_file_actions_addclose(&v107, v120[0]);
            posix_spawn_file_actions_adddup2(&v107, v120[1], 1);
            posix_spawn_file_actions_adddup2(&v107, v120[1], 2);
            posix_spawn_file_actions_addclose(&v107, v120[1]);
            posix_spawn_file_actions_addclose(&v107, v119[1]);
            posix_spawn_file_actions_adddup2(&v107, v119[0], 0);
            posix_spawn_file_actions_addclose(&v107, v119[0]);
          }
          objc_msgSend(v12, "objectForKeyedSubscript:", DTProcessControlServiceOption_WorkingDirectory[0]);
          v93 = (id)objc_claimAutoreleasedReturnValue();
          if (v93 && objc_msgSend(v93, "length"))
          {
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v42, "fileExistsAtPath:isDirectory:", v93, &v110) & 1) != 0)
            {
              v43 = v110 == 0;

              if (!v43)
                posix_spawn_file_actions_addchdir_np(&v107, (const char *)objc_msgSend(objc_retainAutorelease(v93), "fileSystemRepresentation"));
            }
            else
            {

            }
          }
          objc_msgSend(v99, "count");
          v90[1] = v90;
          MEMORY[0x24BDAC7A8]();
          v48 = (char *const *)((char *)v90 - ((v47 + 47) & 0xFFFFFFFFFFFFFFF0));
          if (v46 >= 0x200)
            v49 = 512;
          else
            v49 = v46;
          bzero((char *)v90 - ((v47 + 47) & 0xFFFFFFFFFFFFFFF0), v49);
          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v117 = 0x2020000000;
          v118 = 0;
          v50 = objc_retainAutorelease(v97);
          v51 = strdup((const char *)-[__CFString UTF8String](v50, "UTF8String"));
          v52 = *(int *)(*((_QWORD *)&buf + 1) + 24);
          *(_DWORD *)(*((_QWORD *)&buf + 1) + 24) = v52 + 1;
          v48[v52] = v51;
          objc_msgSend(v12, "objectForKeyedSubscript:", DTProcessControlServiceOption_DisableTALAutomaticTerminationKey[0]);
          v92 = (id)objc_claimAutoreleasedReturnValue();
          if (v92 && (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v92, "longValue"))
          {
            v53 = strdup("-NSDisableAutomaticTermination");
            v54 = v50;
            v55 = *((_QWORD *)&buf + 1);
            v56 = *(int *)(*((_QWORD *)&buf + 1) + 24);
            *(_DWORD *)(*((_QWORD *)&buf + 1) + 24) = v56 + 1;
            v48[v56] = v53;
            v57 = strdup("YES");
            *(_DWORD *)(v55 + 24) = v56 + 2;
            v50 = v54;
            v48[(int)v56 + 1] = v57;
          }
          v105 = 0u;
          v106 = 0u;
          v103 = 0u;
          v104 = 0u;
          v58 = v99;
          v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v103, v115, 16);
          if (v59)
          {
            v60 = *(_QWORD *)v104;
            do
            {
              for (i = 0; i != v59; ++i)
              {
                if (*(_QWORD *)v104 != v60)
                  objc_enumerationMutation(v58);
                objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * i), "description");
                v62 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v63 = strdup((const char *)objc_msgSend(v62, "UTF8String"));
                v64 = *(int *)(*((_QWORD *)&buf + 1) + 24);
                *(_DWORD *)(*((_QWORD *)&buf + 1) + 24) = v64 + 1;
                v48[v64] = v63;

              }
              v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v103, v115, 16);
            }
            while (v59);
          }

          v65 = *(int *)(*((_QWORD *)&buf + 1) + 24);
          *(_DWORD *)(*((_QWORD *)&buf + 1) + 24) = v65 + 1;
          v48[v65] = 0;
          objc_msgSend(v100, "count");
          MEMORY[0x24BDAC7A8]();
          v68 = (char *const *)((char *)v90 - ((v67 + 23) & 0xFFFFFFFFFFFFFFF0));
          if (v66 >= 0x200)
            v69 = 512;
          else
            v69 = v66;
          bzero((char *)v90 - ((v67 + 23) & 0xFFFFFFFFFFFFFFF0), v69);
          *(_DWORD *)(*((_QWORD *)&buf + 1) + 24) = 0;
          v102[0] = MEMORY[0x24BDAC760];
          v102[1] = 3221225472;
          v102[2] = sub_222B6BB40;
          v102[3] = &unk_24EB2A120;
          v102[4] = &buf;
          v102[5] = v68;
          objc_msgSend(v100, "enumerateKeysAndObjectsUsingBlock:", v102);
          v70 = *(int *)(*((_QWORD *)&buf + 1) + 24);
          *(_DWORD *)(*((_QWORD *)&buf + 1) + 24) = v70 + 1;
          v68[v70] = 0;
          objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = objc_msgSend(v71, "BOOLForKey:", CFSTR("DTPosixSpawnProcessControlServiceLog"));

          if (v72)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
            {
              v74 = *(_DWORD *)(*((_QWORD *)&buf + 1) + 24) - 1;
              v111 = 67109120;
              v112 = v74;
              _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "passing %d environment variables:", (uint8_t *)&v111, 8u);
            }
            v75 = *((_QWORD *)&buf + 1);
            if (*(int *)(*((_QWORD *)&buf + 1) + 24) >= 2)
            {
              v76 = 0;
              v77 = MEMORY[0x24BDACB70];
              *(_QWORD *)&v73 = 67109378;
              v91 = v73;
              do
              {
                if (v68[v76])
                {
                  if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
                  {
                    v78 = v68[v76];
                    v111 = v91;
                    v112 = v76;
                    v113 = 2080;
                    v114 = v78;
                    _os_log_impl(&dword_222B17000, v77, OS_LOG_TYPE_INFO, "- %d: %s", (uint8_t *)&v111, 0x12u);
                  }
                  v75 = *((_QWORD *)&buf + 1);
                }
                ++v76;
              }
              while (v76 < *(int *)(v75 + 24) - 1);
            }
          }
          v101 = 0;
          v79 = objc_retainAutorelease(v50);
          v80 = posix_spawn((pid_t *)&v101, (const char *)-[__CFString UTF8String](v79, "UTF8String"), &v107, &v109, v48, v68);
          if (v101 && DTProcessShouldCaptureOutputWithOptions(v12))
            (*((void (**)(id, _QWORD, _QWORD, _QWORD))v98 + 2))(v98, v101, v119[1], v120[0]);
          v81 = *v48;
          if (*v48)
          {
            v82 = (char **)(v48 + 1);
            do
            {
              free(v81);
              v83 = *v82++;
              v81 = v83;
            }
            while (v83);
          }
          v84 = *v68;
          if (*v68)
          {
            v85 = (char **)(v68 + 1);
            do
            {
              free(v84);
              v86 = *v85++;
              v84 = v86;
            }
            while (v86);
          }
          if (v119[0] != -1)
            close(v119[0]);
          if (v119[1] != -1)
            close(v119[1]);
          if (v120[0] != -1)
            close(v120[0]);
          if (v120[1] != -1)
            close(v120[1]);
          posix_spawn_file_actions_destroy(&v107);
          posix_spawnattr_destroy(&v109);
          if (v80)
          {
            objc_msgSend(CFSTR(" ("), "stringByAppendingFormat:", CFSTR("%s"), strerror(v80));
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "stringByAppendingString:", CFSTR(")"));
            v88 = (void *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              v111 = 67109120;
              v112 = v80;
              _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to set up posix_spawnattr_t: %d", (uint8_t *)&v111, 8u);
            }
            objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("DTPosixSpawnFailureException"), CFSTR("posix_spawn failure while launching: %@%@"), v79, v88);

          }
          if (v80)
            v29 = 0;
          else
            v29 = v101;

          _Block_object_dispose(&buf, 8);
LABEL_120:

LABEL_121:
LABEL_122:

          v11 = v97;
LABEL_123:

          goto LABEL_124;
        }
LABEL_22:
        CFRelease(v20);
        goto LABEL_23;
      }
      v97 = 0;
    }
    else
    {
      v97 = 0;
      v24 = 0;
    }
    v26 = 0;
    v27 = 1;
    goto LABEL_21;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to call posix_spawn with empty path", (uint8_t *)&buf, 2u);
  }
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("DTPosixSpawnFailureException"), CFSTR("Unable to call posix_spawn with empty path"));
  v29 = 0;
LABEL_124:

  return v29;
}

- (id)launchSuspendedProcessWithDevicePath:(id)a3 bundleIdentifier:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7
{
  uint64_t v7;
  _QWORD v9[5];

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_222B6BC8C;
  v9[3] = &unk_24EB2A148;
  v9[4] = self;
  v7 = +[DTPosixSpawnProcessControlService posixSpawnWithPath:environment:arguments:options:fileDescriptorHandler:](DTPosixSpawnProcessControlService, "posixSpawnWithPath:environment:arguments:options:fileDescriptorHandler:", a3, a5, a6, a7, v9);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)cleanupPid:(int)a3
{
  int v4;

  v4 = 0;
  if (waitpid(a3, &v4, 1) == a3)
    return v4;
  else
    return 0x80000000;
}

@end
