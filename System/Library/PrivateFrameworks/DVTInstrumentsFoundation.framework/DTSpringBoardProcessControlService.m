@implementation DTSpringBoardProcessControlService

+ (void)registerCapabilities:(id)a3
{
  __CFString *v4;
  id v5;

  v4 = DTDefaultProcessControlServiceIdentifier;
  v5 = a3;
  objc_msgSend(v5, "publishCapability:withVersion:forClass:", v4, 107, a1);
  objc_msgSend(v5, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.processcontrol.feature.deviceio"), 103, a1);
  objc_msgSend(v5, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.processcontrolbydictionary"), 4, a1);

}

- (id)launchSuspendedProcessWithDevicePath:(id)a3 bundleIdentifier:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v21;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_opt_new();
  v21 = 0;
  -[DTSpringBoardProcessControlService _launchSuspendedProcessWithBundleIdentifier:orDevicePath:environment:arguments:options:error:](self, "_launchSuspendedProcessWithBundleIdentifier:orDevicePath:environment:arguments:options:error:", v15, v16, v14, v13, v12, &v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v21;
  objc_msgSend(v17, "invokeCompletionWithReturnValue:error:", v18, v19);

  return v17;
}

- (id)_launchSuspendedProcessWithBundleIdentifier:(id)a3 orDevicePath:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7 error:(id *)a8
{
  id v12;
  id v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  NSObject *v16;
  id v17;
  _BOOL4 v18;
  NSObject *v19;
  const char *v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  void *v28;
  void *v29;
  char v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  char *v47;
  id v48;
  NSObject *v49;
  id v50;
  uint64_t v51;
  int *v52;
  char *v53;
  void *v54;
  BOOL v55;
  const __CFURL *v56;
  __CFBundle *v57;
  __CFBundle *v58;
  const __CFURL *v59;
  const __CFURL *v60;
  BOOL v61;
  const __CFURL *v62;
  const __CFURL *v63;
  const __CFString *v64;
  char v65;
  __CFString *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  _BOOL4 v71;
  NSObject *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  int v88;
  uint64_t v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  __CFString *v98;
  int v99;
  void *v100;
  void *v101;
  uint64_t v102;
  mach_port_name_t v103;
  void *v104;
  void *v105;
  NSObject *v106;
  id v107;
  uint64_t v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  CFDictionaryRef InfoDictionary;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  NSObject *v120;
  id v121;
  uint64_t v122;
  NSObject *v123;
  id v124;
  int v125;
  id v126;
  void *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  id v131;
  NSObject *v132;
  id v133;
  int v134;
  void *v135;
  void *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  uint64_t v140;
  void *v141;
  id v143;
  int v144;
  id v145;
  uint64_t (*v147)(uint64_t, uint64_t);
  void *v148;
  __CFString *filePath;
  void *v150;
  void *v151;
  void *v152;
  id v153;
  void *v154;
  void *v155;
  uint64_t v156;
  char v157;
  id v158;
  id v159;
  _QWORD v160[4];
  id v161;
  _BYTE *v162;
  _QWORD v163[4];
  id v164;
  _BYTE *v165;
  uint64_t *v166;
  uint64_t v167;
  uint64_t *v168;
  uint64_t v169;
  int v170;
  id v171;
  char v172;
  _QWORD v173[3];
  _QWORD v174[3];
  uint8_t v175[4];
  _BYTE v176[24];
  _QWORD v177[2];
  _QWORD v178[2];
  _QWORD v179[2];
  _QWORD v180[2];
  _QWORD v181[3];
  _QWORD v182[3];
  _BYTE buf[24];
  uint64_t (*v184)(uint64_t, uint64_t);
  __int128 v185;
  _QWORD v186[3];
  _QWORD v187[3];
  _QWORD v188[3];
  _QWORD v189[3];
  _QWORD v190[2];
  _QWORD v191[2];
  _QWORD v192[2];
  _QWORD v193[5];

  v193[2] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  filePath = (__CFString *)a4;
  v13 = a5;
  v14 = (uint64_t (*)(uint64_t, uint64_t))a6;
  v153 = a7;
  v158 = v12;
  v15 = objc_msgSend(v12, "length");
  v16 = MEMORY[0x24BDACB70];
  v17 = MEMORY[0x24BDACB70];
  v18 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (v15)
  {
    if (!v18)
      goto LABEL_7;
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v158;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2114;
    v184 = v14;
    LOWORD(v185) = 2114;
    *(_QWORD *)((char *)&v185 + 2) = v153;
    v19 = MEMORY[0x24BDACB70];
    v20 = "Received request to launch process with bundle ID '%{public}@:'\n"
          "\tEnvironment variables: %{public}@\n"
          "\tArguments: %{public}@\n"
          "\tOptions: %{public}@";
  }
  else
  {
    if (!v18)
      goto LABEL_7;
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = filePath;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2114;
    v184 = v14;
    LOWORD(v185) = 2114;
    *(_QWORD *)((char *)&v185 + 2) = v153;
    v19 = MEMORY[0x24BDACB70];
    v20 = "Received request to launch process at path '%{public}@:'\n"
          "\tEnvironment variables: %{public}@\n"
          "\tArguments: %{public}@\n"
          "\tOptions: %{public}@";
  }
  _os_log_impl(&dword_222B17000, v19, OS_LOG_TYPE_INFO, v20, buf, 0x2Au);
LABEL_7:

  if (v14)
    v21 = v14;
  else
    v21 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDBD1A8];
  if (v13)
    v22 = v13;
  else
    v22 = (id)MEMORY[0x24BDBD1B8];
  v147 = v21;
  v148 = v22;
  objc_msgSend(v153, "objectForKeyedSubscript:", DTProcessControlServiceOption_LeaveSuspendedKey[0]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = objc_msgSend(v23, "isEqualToNumber:", MEMORY[0x24BDBD1C0]);

  objc_msgSend(v153, "objectForKeyedSubscript:", DTProcessControlServiceOption_KillExistingKey[0]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = objc_msgSend(v24, "isEqualToNumber:", MEMORY[0x24BDBD1C0]);

  objc_msgSend(v153, "objectForKeyedSubscript:", DTProcessControlServiceOption_ActivateSuspendedKey[0]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x24BDBD1C8];
  v27 = objc_msgSend(v25, "isEqualToNumber:", MEMORY[0x24BDBD1C8]);

  objc_msgSend(MEMORY[0x24BE38490], "serviceWithDefaultShellEndpoint");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "environment");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = (void *)objc_msgSend(v29, "mutableCopy");

  objc_msgSend(v152, "addEntriesFromDictionary:", v148);
  v172 = 0;
  if (v158)
    goto LABEL_14;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v54, "fileExistsAtPath:isDirectory:", filePath, &v172) & 1) == 0)
  {

    goto LABEL_35;
  }
  v55 = v172 == 0;

  if (v55)
    goto LABEL_35;
  v56 = CFURLCreateWithFileSystemPath(0, filePath, kCFURLPOSIXPathStyle, 1u);
  v57 = CFBundleCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v56);
  v58 = v57;
  if (!v57)
  {

    v63 = 0;
    v60 = 0;
    filePath = 0;
    InfoDictionary = 0;
    v65 = 1;
    v61 = 1;
    goto LABEL_114;
  }
  v59 = CFBundleCopyExecutableURL(v57);
  v60 = v59;
  v61 = v59 == 0;
  if (!v59)
  {
    v63 = 0;
    goto LABEL_112;
  }
  v62 = CFURLCopyAbsoluteURL(v59);
  v63 = v62;
  if (!v62)
  {
LABEL_112:
    v64 = 0;
    v65 = 1;
    v66 = filePath;
    goto LABEL_113;
  }
  v64 = (id)CFURLCopyFileSystemPath(v62, kCFURLPOSIXPathStyle);

  v65 = 0;
  v66 = (__CFString *)v64;
LABEL_113:

  InfoDictionary = CFBundleGetInfoDictionary(v58);
  filePath = (__CFString *)v64;
LABEL_114:
  -[__CFDictionary objectForKeyedSubscript:](InfoDictionary, "objectForKeyedSubscript:", CFSTR("CFBundleIdentifier"));
  v158 = (id)objc_claimAutoreleasedReturnValue();
  if (v56)
    CFRelease(v56);
  if (v58)
    CFRelease(v58);
  if (!v61)
    CFRelease(v60);
  if ((v65 & 1) == 0)
    CFRelease(v63);
  v120 = MEMORY[0x24BDACB70];
  v121 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
  {
    v122 = -[__CFString UTF8String](objc_retainAutorelease(filePath), "UTF8String");
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v122;
    _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "No bundle ID passed in path: %s", buf, 0xCu);
  }

  if (v158)
  {
LABEL_14:
    v156 = sub_222B90324((uint64_t)v158);
    v30 = v157;
    if ((int)v156 < 1)
      v30 = 1;
    if ((v30 & 1) != 0)
    {
LABEL_21:
      v41 = *MEMORY[0x24BE38228];
      v188[0] = *MEMORY[0x24BE38220];
      v188[1] = v41;
      v189[0] = v147;
      v189[1] = v152;
      v188[2] = *MEMORY[0x24BE38250];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v144 ^ 1u);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v189[2] = v42;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v189, v188, 3);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v150 = (void *)objc_msgSend(v43, "mutableCopy");

      if (!DTProcessShouldCaptureOutputWithOptions(v153))
      {
        v143 = 0;
        v145 = 0;
        goto LABEL_51;
      }
      NSTemporaryDirectory();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "stringByAppendingPathComponent:", CFSTR("instruments_XXXXXX"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = objc_retainAutorelease(v45);
      v47 = strdup((const char *)objc_msgSend(v46, "UTF8String"));
      if (mkdtemp(v47))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v47);
        v143 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v143, "stringByAppendingPathComponent:", CFSTR("stdio.pipe"));
        v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        if (!mkfifo((const char *)objc_msgSend(v48, "UTF8String"), 0x1FFu))
        {
          v145 = objc_retainAutorelease(v48);
          chmod((const char *)objc_msgSend(v145, "UTF8String"), 0x1B6u);
          v143 = objc_retainAutorelease(v143);
          chmod((const char *)objc_msgSend(v143, "UTF8String"), 0x1FFu);
          objc_msgSend(v150, "setObject:forKeyedSubscript:", v145, *MEMORY[0x24BE38240]);
          objc_msgSend(v150, "setObject:forKeyedSubscript:", v145, *MEMORY[0x24BE38248]);
          goto LABEL_50;
        }
        v49 = MEMORY[0x24BDACB70];
        v50 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          v51 = objc_msgSend(objc_retainAutorelease(v48), "UTF8String");
          v52 = __error();
          v53 = strerror(*v52);
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = v51;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = v53;
          _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "mkfifo failed for '%s': %s", buf, 0x16u);
        }

      }
      else
      {
        v143 = 0;
      }
      v145 = 0;
LABEL_50:
      free(v47);

LABEL_51:
      v80 = *MEMORY[0x24BE38310];
      v186[0] = *MEMORY[0x24BE382C0];
      v186[1] = v80;
      v187[0] = v150;
      v187[1] = v26;
      v186[2] = *MEMORY[0x24BE38318];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 10.0);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v187[2] = v81;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v187, v186, 3);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v154 = (void *)objc_msgSend(v82, "mutableCopy");

      if (v27)
        objc_msgSend(v154, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE382B8]);
      if (v153)
      {
        v83 = v153;
        v84 = (void *)objc_opt_new();
        DTProcessControlOptionsGetEvent(v83);
        v85 = (void *)objc_claimAutoreleasedReturnValue();

        if (v85)
        {
          v86 = (void *)objc_opt_new();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v85, "objectForKey:", CFSTR("PCEventType"));
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v87, "isEqualToString:", CFSTR("BackgroundFetchEvent")))
              objc_msgSend(v86, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE38218]);

          }
          if (objc_msgSend(v86, "count"))
            objc_msgSend(v84, "setObject:forKeyedSubscript:", v86, *MEMORY[0x24BE382A8]);

        }
        objc_msgSend(v154, "addEntriesFromDictionary:", v84);

      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v184 = sub_222B9038C;
      *(_QWORD *)&v185 = sub_222B9039C;
      *((_QWORD *)&v185 + 1) = 0;
      v167 = 0;
      v168 = &v167;
      v169 = 0x2020000000;
      v170 = -1;
      v88 = 7;
      v89 = MEMORY[0x24BDAC760];
      while (1)
      {
        v90 = (void *)MEMORY[0x24BDD1478];
        v163[0] = v89;
        v163[1] = 3221225472;
        v163[2] = sub_222B903A4;
        v163[3] = &unk_24EB2AC90;
        v165 = buf;
        v166 = &v167;
        v91 = v158;
        v164 = v91;
        objc_msgSend(v90, "blockOperationWithBlock:", v163);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE38478], "optionsWithDictionary:", v154);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v160[0] = v89;
        v160[1] = 3221225472;
        v160[2] = sub_222B903E4;
        v160[3] = &unk_24EB2ACB8;
        v162 = buf;
        v94 = v92;
        v161 = v94;
        objc_msgSend(v155, "openApplication:withOptions:completion:", v91, v93, v160);

        objc_msgSend(v94, "waitUntilFinished");
        v95 = *(void **)(*(_QWORD *)&buf[8] + 40);
        if (v95 && objc_msgSend(v95, "code") == 6 || (v157 & 1) == 0 && *((_DWORD *)v168 + 6) == (_DWORD)v156)
          usleep(0x7A120u);

        if (!v88)
          break;
        v96 = *(void **)(*(_QWORD *)&buf[8] + 40);
        if ((!v96 || objc_msgSend(v96, "code") != 6) && ((v157 & 1) != 0 || *((_DWORD *)v168 + 6) != (_DWORD)v156))
          break;
        --v88;
      }
      if (v145 && *((_DWORD *)v168 + 6) && !*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
        -[DTProcessControlService watchOutputFileName:directory:forPid:](self, "watchOutputFileName:directory:forPid:", v145, v143);
      if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Request to launch %@ failed."), v91);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "code") == 6)
        {
          v98 = CFSTR("Device busy or Instruments is trying to launch several targets, and one of them is a foreground app.");
        }
        else if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "code") == 5)
        {
          v98 = CFSTR("Background launch requested, but this app cannot run in the background (see UIApplicationExitsOnSuspend or 'Background Modes' in Xcode).");
        }
        else if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "code") == 7)
        {
          v98 = CFSTR("Device is currently locked. Please unlock the device and try again.");
        }
        else
        {
          v104 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "localizedDescription");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "stringWithFormat:", CFSTR("%@ : Failed to launch process with bundle identifier '%@'."), v105, v91);
          v98 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        v106 = MEMORY[0x24BDACB70];
        v107 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
        {
          v108 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "code");
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "localizedDescription");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v175 = 134218242;
          *(_QWORD *)v176 = v108;
          *(_WORD *)&v176[8] = 2112;
          *(_QWORD *)&v176[10] = v109;
          _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "DTSpringBoardProcessControlService -- Error: %ld. %@.", v175, 0x16u);

        }
        if (a8)
        {
          v110 = (void *)MEMORY[0x24BDD1540];
          v111 = *MEMORY[0x24BDD0FD8];
          v181[0] = *MEMORY[0x24BDD0FC8];
          v181[1] = v111;
          v182[0] = v97;
          v182[1] = v98;
          v181[2] = *MEMORY[0x24BDD1398];
          v182[2] = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v182, v181, 3);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.deviceprocesscontrolservice"), 2, v112);
          *a8 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        v99 = *((_DWORD *)v168 + 6);
        if (v99 > 0)
        {
          if ((_DWORD)v156 == v99)
          {
            if ((v157 & 1) == 0)
            {
              v115 = (void *)MEMORY[0x24BDD17C8];
              -[__CFString lastPathComponent](filePath, "lastPathComponent");
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v115, "stringWithFormat:", CFSTR("Executable '%@' is already running as process %d."), v116, v156);
              v97 = (void *)objc_claimAutoreleasedReturnValue();

              if (a8)
              {
                v117 = (void *)MEMORY[0x24BDD1540];
                v118 = *MEMORY[0x24BDD0FD8];
                v177[0] = *MEMORY[0x24BDD0FC8];
                v177[1] = v118;
                v178[0] = v97;
                v178[1] = CFSTR("killExisting requested, but found the existing PID.");
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v178, v177, 2);
                v119 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v117, "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.deviceprocesscontrolservice"), 2, v119);
                *a8 = (id)objc_claimAutoreleasedReturnValue();

              }
              goto LABEL_103;
            }
            if ((v144 & 1) == 0)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v156);
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              -[DTProcessControlService suspendPid:](self, "suspendPid:", v100);

            }
          }
          else if ((v144 & 1) == 0)
          {
            v103 = +[DTInstrumentServer taskForPid:](DTInstrumentServer, "taskForPid:");
            if (v103 - 1 > 0xFFFFFFFD)
            {
              v123 = MEMORY[0x24BDACB70];
              v124 = MEMORY[0x24BDACB70];
              if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
              {
                v125 = *((_DWORD *)v168 + 6);
                *(_DWORD *)v175 = 67109378;
                *(_DWORD *)v176 = v125;
                *(_WORD *)&v176[4] = 2112;
                *(_QWORD *)&v176[6] = v91;
                _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to acquire task port after launch of pid %d (%@)", v175, 0x12u);
              }

              v97 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE80D40]), "initWithExplanation:", CFSTR("Permission to debug process denied"));
              v126 = objc_alloc(MEMORY[0x24BE80D48]);
              v127 = (void *)MEMORY[0x24BE80CD8];
              objc_msgSend(MEMORY[0x24BE80C90], "identifierWithPid:", *((unsigned int *)v168 + 6));
              v128 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v127, "predicateMatchingIdentifier:", v128);
              v129 = (void *)objc_claimAutoreleasedReturnValue();
              v130 = (void *)objc_msgSend(v126, "initWithPredicate:context:", v129, v97);

              v159 = 0;
              LOBYTE(v128) = objc_msgSend(v130, "execute:", &v159);
              v131 = v159;
              if ((v128 & 1) == 0)
              {
                v132 = MEMORY[0x24BDACB70];
                v133 = MEMORY[0x24BDACB70];
                if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
                {
                  v134 = *((_DWORD *)v168 + 6);
                  *(_DWORD *)v175 = 67109634;
                  *(_DWORD *)v176 = v134;
                  *(_WORD *)&v176[4] = 2112;
                  *(_QWORD *)&v176[6] = v91;
                  *(_WORD *)&v176[14] = 2112;
                  *(_QWORD *)&v176[16] = v131;
                  _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to attempt termination of pid %d (%@): %@", v175, 0x1Cu);
                }

              }
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v168 + 6));
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              -[DTProcessControlService killPid:](self, "killPid:", v135);

              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Permission to debug %@ was denied."), v91);
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to acquire task port for PID: %d"), *((unsigned int *)v168 + 6));
              v137 = objc_claimAutoreleasedReturnValue();
              v138 = (void *)v137;
              if (a8)
              {
                v139 = (void *)MEMORY[0x24BDD1540];
                v140 = *MEMORY[0x24BDD0FD8];
                v173[0] = *MEMORY[0x24BDD0FC8];
                v173[1] = v140;
                v174[0] = v136;
                v174[1] = v137;
                v173[2] = *MEMORY[0x24BDD0FF0];
                v174[2] = CFSTR("The app must be debuggable and signed with 'get-task-allow'.");
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v174, v173, 3);
                v141 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v139, "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.deviceprocesscontrolservice"), 2, v141);
                *a8 = (id)objc_claimAutoreleasedReturnValue();

              }
              goto LABEL_103;
            }
            mach_port_deallocate(*MEMORY[0x24BDAEC58], v103);
          }
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v168 + 6));
          v69 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_105:
          _Block_object_dispose(&v167, 8);
          _Block_object_dispose(buf, 8);

          v158 = v91;
LABEL_106:

          goto LABEL_107;
        }
        if (!a8)
        {
LABEL_104:
          v69 = 0;
          goto LABEL_105;
        }
        v101 = (void *)MEMORY[0x24BDD1540];
        v102 = *MEMORY[0x24BDD0FD8];
        v179[0] = *MEMORY[0x24BDD0FC8];
        v179[1] = v102;
        v180[0] = CFSTR("Failed looking up pid of launched process.");
        v180[1] = CFSTR("Call to openApplication:withOptions:completion: succeeded, but a PID could not be found for the target Bundle Identifier.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v180, v179, 2);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.deviceprocesscontrolservice"), 4, v97);
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_103:

      goto LABEL_104;
    }
    v31 = MEMORY[0x24BDACB70];
    v32 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v33 = objc_msgSend(objc_retainAutorelease(v158), "UTF8String");
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = v33;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v156;
      _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Killing existing instance of bundle ID %{public}s with PID %i", buf, 0x12u);
    }

    v150 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE80D40]), "initWithExplanation:", CFSTR("Terminating any existing instance before DTServiceHub app launch"));
    v34 = objc_alloc(MEMORY[0x24BE80D48]);
    v35 = (void *)MEMORY[0x24BE80CD8];
    objc_msgSend(MEMORY[0x24BE80C90], "identifierWithPid:", v156);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "predicateMatchingIdentifier:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v34, "initWithPredicate:context:", v37, v150);

    v171 = 0;
    LOBYTE(v34) = objc_msgSend(v38, "execute:", &v171);
    v39 = v171;
    v40 = v39;
    if ((v34 & 1) != 0)
    {
LABEL_20:

      goto LABEL_21;
    }
    objc_msgSend(v39, "domain");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v70, "isEqualToString:", *MEMORY[0x24BE80E48]))
    {
      v71 = objc_msgSend(v40, "code") == 3;

      if (v71)
      {
        v72 = MEMORY[0x24BDACB70];
        v73 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
        {
          v74 = objc_msgSend(objc_retainAutorelease(v158), "UTF8String");
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = v74;
          _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Request to terminate existing instance of bundle ID %{public}s failed because the existing instance could no longer be found. Continuing with launch.", buf, 0xCu);
        }

        goto LABEL_20;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to terminate existing instance (%i) of bundle ID '%@'"), v156, v158);
    v75 = objc_claimAutoreleasedReturnValue();
    v76 = (void *)v75;
    if (a8)
    {
      v77 = (void *)MEMORY[0x24BDD1540];
      v78 = *MEMORY[0x24BDD1398];
      v190[0] = *MEMORY[0x24BDD0FC8];
      v190[1] = v78;
      v191[0] = v75;
      v191[1] = v40;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v191, v190, 2);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.deviceprocesscontrolservice"), 16, v79);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

    }
    v69 = 0;
    goto LABEL_106;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to locate CFBundleIdentifier for path: %@."), filePath);
  v158 = (id)objc_claimAutoreleasedReturnValue();
  if (a8)
  {
    v67 = (void *)MEMORY[0x24BDD1540];
    v68 = *MEMORY[0x24BDD0FD8];
    v192[0] = *MEMORY[0x24BDD0FC8];
    v192[1] = v68;
    v193[0] = v158;
    v193[1] = CFSTR("Either a Bundle Identifier or a path to a bundle must be provided.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v193, v192, 2);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.deviceprocesscontrolservice"), 1, v151);
    v69 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v69 = 0;
  }
LABEL_107:

  return v69;
}

- (id)processIdentifierForBundleIdentifier:(id)a3
{
  int v3;

  v3 = sub_222B90324((uint64_t)a3);
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3 & ~(v3 >> 31));
}

- (BOOL)sendProcessControlEvent:(id)a3 toPid:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t *v13;
  id v14;
  void *v15;
  void *v16;
  BOOL v17;
  id *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __CFString *v61;
  void *v62;
  const __CFString *v63;
  objc_class *v64;
  dispatch_semaphore_t v65;
  void *v66;
  int v67;
  int64_t v68;
  dispatch_time_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  dispatch_semaphore_t dsemaa;
  dispatch_semaphore_t dsema;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  objc_super v83;
  objc_super v84;
  _QWORD v85[4];
  id v86;
  id v87;
  dispatch_semaphore_t v88;
  uint64_t *v89;
  id v90;
  _QWORD v91[4];
  id v92;
  id v93;
  id v94;
  uint64_t *v95;
  id obj;
  id v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t (*v101)(uint64_t, uint64_t);
  void (*v102)(uint64_t);
  id v103;
  uint64_t v104;
  const __CFString *v105;
  uint8_t buf[4];
  void *v107;
  __int16 v108;
  void *v109;
  uint64_t v110;
  const __CFString *v111;
  uint64_t v112;
  void *v113;
  _QWORD v114[2];
  _QWORD v115[2];
  _QWORD v116[2];
  _QWORD v117[2];
  uint64_t v118;
  const __CFString *v119;
  uint64_t v120;
  const __CFString *v121;
  _QWORD v122[2];
  _QWORD v123[2];
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  _QWORD v127[4];

  v127[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v98 = 0;
  v99 = &v98;
  v100 = 0x3032000000;
  v101 = sub_222B9038C;
  v102 = sub_222B9039C;
  v103 = 0;
  DTProcessControlEventUnarchive(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "intValue");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v83.receiver = self;
    v83.super_class = (Class)DTSpringBoardProcessControlService;
    -[DTProcessControlService sendProcessControlEvent:toPid:](&v83, sel_sendProcessControlEvent_toPid_, v8, v9);
    goto LABEL_7;
  }
  v82 = v10;
  objc_msgSend(v82, "objectForKey:", CFSTR("PCEventType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("ShowSBWidgetCenter")))
  {
    v13 = v99;
    v97 = (id)v99[5];
    -[DTSpringBoardProcessControlService showSBWidget:withError:](self, "showSBWidget:withError:", v82, &v97);
    v14 = v97;
    v15 = (void *)v13[5];
    v13[5] = (uint64_t)v14;
    goto LABEL_4;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("ShowNotificationCenter")))
  {
    objc_msgSend(v82, "objectForKey:", CFSTR("WidgetIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = (id *)(v99 + 5);
        obj = (id)v99[5];
        -[DTSpringBoardProcessControlService showNotificiationCenterWidget:withError:](self, "showNotificiationCenterWidget:withError:", v15, &obj);
        objc_storeStrong(v19, obj);
      }
    }
    goto LABEL_4;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("BackgroundFetchEvent")))
  {
    objc_msgSend(MEMORY[0x24BE80C90], "identifierWithPid:", v11);
    v20 = objc_claimAutoreleasedReturnValue();
    v77 = (void *)v20;
    if (v20)
    {
      v21 = (void *)MEMORY[0x24BE80C78];
      objc_msgSend(MEMORY[0x24BE80CD8], "predicateMatchingIdentifier:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleForPredicate:error:", v22, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "bundle");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }
    v126 = *MEMORY[0x24BE382A8];
    v124 = *MEMORY[0x24BE38218];
    v125 = MEMORY[0x24BDBD1B8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v125, &v124, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v127[0] = v32;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v127, &v126, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE38478], "optionsWithDictionary:", v33);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(MEMORY[0x24BE38490], "serviceWithDefaultShellEndpoint");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v91[0] = MEMORY[0x24BDAC760];
      v91[1] = 3221225472;
      v91[2] = sub_222B91160;
      v91[3] = &unk_24EB2ACE0;
      v92 = v15;
      v93 = v33;
      v94 = v79;
      v95 = &v98;
      objc_msgSend(v34, "openApplication:withOptions:completion:", v92, v94, v91);

      v35 = v92;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to trigger Background Fetch for PID %d, no bundle identifier found."), v11);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not find CFBundleIdentifier for PID: %d."), v11);
      dsemaa = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue();
      v74 = (void *)MEMORY[0x24BDD1540];
      v36 = *MEMORY[0x24BDD0FD8];
      v122[0] = *MEMORY[0x24BDD0FC8];
      v122[1] = v36;
      v123[0] = v35;
      v123[1] = dsemaa;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v123, v122, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.deviceprocesscontrolservice"), 8, v37);
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = (void *)v99[5];
      v99[5] = v38;

    }
    goto LABEL_4;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("TriggerSiri")))
  {
    objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("SiriRequestPayload"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && objc_msgSend(v15, "length")
      && NSClassFromString(CFSTR("AFSettingsConnection")))
    {
      v25 = objc_alloc_init(MEMORY[0x24BE092C0]);
      objc_msgSend(v25, "startUIRequest:", v15);
      objc_msgSend(v25, "barrier");
    }
    else
    {
      if (-[DTSpringBoardProcessControlService _triggerSiri](self, "_triggerSiri"))
        goto LABEL_4;
      v29 = (void *)MEMORY[0x24BDD1540];
      v120 = *MEMORY[0x24BDD0FC8];
      v121 = CFSTR("Failed to trigger Siri");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v121, &v120, 1);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.deviceprocesscontrolservice"), 8, v25);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v99[5];
      v99[5] = v30;

    }
    goto LABEL_4;
  }
  if (!objc_msgSend(v12, "isEqualToString:", CFSTR("PressHomeButton")))
  {
    if (!objc_msgSend(v12, "isEqualToString:", CFSTR("SimulateNotification")))
    {
      if (objc_msgSend(v12, "isEqualToString:", CFSTR("ShowMessagesExtension")))
      {
        v48 = notify_post("com.apple.MobileSMS.CKAppExtension.launch");
        if (!(_DWORD)v48)
          goto LABEL_5;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error sending Messages notification for '%s' status: %d."), "com.apple.MobileSMS.CKAppExtension.launch", v48);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = (void *)MEMORY[0x24BDD1540];
        v112 = *MEMORY[0x24BDD0FC8];
        v113 = v15;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v113, &v112, 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.deviceprocesscontrolservice"), 8, v50);
        v51 = objc_claimAutoreleasedReturnValue();
        v52 = (void *)v99[5];
        v99[5] = v51;

      }
      else if (objc_msgSend(v12, "isEqualToString:", CFSTR("SnapshotUI")))
      {
        v53 = (void *)MEMORY[0x24BDD1540];
        v110 = *MEMORY[0x24BDD0FC8];
        v111 = CFSTR("Snapshot UI is not supported for this platform.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v111, &v110, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.deviceprocesscontrolservice"), 8, v15);
        v54 = objc_claimAutoreleasedReturnValue();
        v55 = (void *)v99[5];
        v99[5] = v54;

      }
      else
      {
        if (!objc_msgSend(v12, "isEqualToString:", CFSTR("TriggerAppClip")))
        {
          v84.receiver = self;
          v84.super_class = (Class)DTSpringBoardProcessControlService;
          -[DTProcessControlService sendProcessControlEvent:toPid:](&v84, sel_sendProcessControlEvent_toPid_, v8, v9);
          goto LABEL_5;
        }
        objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("BundleIdentifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("AppClipPayload"));
        v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v62 = (void *)MEMORY[0x24BDBCF48];
        if (-[__CFString length](v61, "length"))
          v63 = v61;
        else
          v63 = CFSTR("https://example.com");
        objc_msgSend(v62, "URLWithString:", v63);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        if (dlopen_preflight("/System/Library/PrivateFrameworks/ClipServices.framework/ClipServices"))
        {
          dlopen("/System/Library/PrivateFrameworks/ClipServices.framework/ClipServices", 10);
          v64 = NSClassFromString(CFSTR("CPSClipRequest"));
          if (v64)
          {
            v78 = (void *)objc_msgSend([v64 alloc], "initWithURL:", v81);
            v65 = dispatch_semaphore_create(0);
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v107 = v15;
              v108 = 2112;
              v109 = v81;
              _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Clip Request for bundleID:'%@' url:'%@'", buf, 0x16u);
            }
            v85[0] = MEMORY[0x24BDAC760];
            v85[1] = 3221225472;
            v85[2] = sub_222B91300;
            v85[3] = &unk_24EB2AD08;
            v86 = v15;
            v87 = v81;
            v89 = &v98;
            dsema = v65;
            v88 = dsema;
            objc_msgSend(v78, "installClipWithBundleID:completion:", v86, v85);
            objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("Timeout"));
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = objc_msgSend(v66, "intValue");

            if (v67 <= 0)
              v68 = 30000000000;
            else
              v68 = (uint64_t)((double)v67 * 1000000000.0);
            v69 = dispatch_time(0, v68);
            if (dispatch_semaphore_wait(dsema, v69))
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                sub_222BC7648();
              v70 = (void *)MEMORY[0x24BDD1540];
              v104 = *MEMORY[0x24BDD0FC8];
              v105 = CFSTR("Trigger AppClip timed out.");
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.deviceprocesscontrolservice"), 32, v71);
              v72 = objc_claimAutoreleasedReturnValue();
              v73 = (void *)v99[5];
              v99[5] = v72;

            }
          }
        }

      }
      goto LABEL_4;
    }
    objc_msgSend(v82, "objectForKey:", CFSTR("BundleIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "objectForKey:", CFSTR("NotificationPayload"));
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)v40;
    if (v40 && v15)
    {
      v90 = 0;
      -[DTSpringBoardProcessControlService simulateNotificationForBundleID:payload:withError:](self, "simulateNotificationForBundleID:payload:withError:", v15, v40, &v90);
      v42 = v90;
      if (!v42)
      {
LABEL_53:

        goto LABEL_4;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to simulate notification for bundleID: %@."), v15);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = (void *)MEMORY[0x24BDD1540];
      v44 = *MEMORY[0x24BDD1398];
      v116[0] = *MEMORY[0x24BDD0FC8];
      v116[1] = v44;
      v117[0] = v43;
      v117[1] = v42;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v117, v116, 2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.deviceprocesscontrolservice"), 8, v45);
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = (void *)v99[5];
      v99[5] = v46;

    }
    else
    {
      v56 = CFSTR("Unknown failure.");
      if (!v40)
        v56 = CFSTR("Notification payload is nil.");
      if (!v15)
        v56 = CFSTR("BundleIdentifer for notification is nil.");
      v57 = (void *)MEMORY[0x24BDD1540];
      v58 = *MEMORY[0x24BDD0FD8];
      v114[0] = *MEMORY[0x24BDD0FC8];
      v114[1] = v58;
      v115[0] = CFSTR("Failed to simulate notification.");
      v115[1] = v56;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v115, v114, 2);
      v42 = (id)objc_claimAutoreleasedReturnValue();
      if (v15)
        v59 = 8;
      else
        v59 = 1;
      objc_msgSend(v57, "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.deviceprocesscontrolservice"), v59, v42);
      v60 = objc_claimAutoreleasedReturnValue();
      v43 = (void *)v99[5];
      v99[5] = v60;
    }

    goto LABEL_53;
  }
  if (-[DTSpringBoardProcessControlService _dismissTodayView](self, "_dismissTodayView"))
    goto LABEL_5;
  v26 = (void *)MEMORY[0x24BDD1540];
  v118 = *MEMORY[0x24BDD0FC8];
  v119 = CFSTR("Failed to press Home button");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.deviceprocesscontrolservice"), 8, v15);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v99[5];
  v99[5] = v27;

LABEL_4:
LABEL_5:

LABEL_7:
  v16 = (void *)v99[5];
  if (a5 && v16)
  {
    *a5 = objc_retainAutorelease(v16);
    v16 = (void *)v99[5];
  }
  v17 = v16 == 0;

  _Block_object_dispose(&v98, 8);
  return v17;
}

- (void)sendProcessControlEvent:(id)a3 toPid:(id)a4
{
  id v4;
  id v5;

  v5 = 0;
  -[DTSpringBoardProcessControlService sendProcessControlEvent:toPid:error:](self, "sendProcessControlEvent:toPid:error:", a3, a4, &v5);
  v4 = v5;
  if (v4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("DTSHSendProcessControlEvent"), CFSTR("SendProcessControlEvent:toPid: encountered an error: %@"), v4);

}

- (BOOL)simulateNotificationForBundleID:(id)a3 payload:(id)a4 withError:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v7 = a3;
  v8 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_222B9038C;
  v19 = sub_222B9039C;
  v20 = 0;
  objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:pushPayload:bundleIdentifier:", &stru_24EB2CF78, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF88B8]), "initWithBundleIdentifier:", v7);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_222B915F8;
  v14[3] = &unk_24EB29490;
  v14[4] = &v15;
  objc_msgSend(v10, "addNotificationRequest:withCompletionHandler:", v9, v14);
  v11 = (void *)v16[5];
  if (a5 && v11)
  {
    *a5 = objc_retainAutorelease(v11);
    v11 = (void *)v16[5];
  }
  v12 = v11 == 0;

  _Block_object_dispose(&v15, 8);
  return v12;
}

- (BOOL)showNotificiationCenterWidget:(id)a3 withError:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  const __CFString *v31;
  uint8_t buf[4];
  uint64_t v33;
  _QWORD v34[2];
  _QWORD v35[2];
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_222B9038C;
  v28 = sub_222B9039C;
  v29 = 0;
  if (v5)
  {
    v36 = *MEMORY[0x24BE382C0];
    v7 = *MEMORY[0x24BE38238];
    v34[0] = *MEMORY[0x24BE38230];
    v34[1] = v7;
    v35[0] = v5;
    v35[1] = CFSTR("com.apple.widget-extension");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE38490], "serviceWithDefaultShellEndpoint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE38478], "optionsWithDictionary:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_222B9192C;
    v21[3] = &unk_24EB2AD30;
    v22 = v6;
    v23 = &v24;
    objc_msgSend(v10, "openApplication:withOptions:completion:", CFSTR("com.apple.springboard"), v11, v21);

    v12 = v22;
  }
  else
  {
    v13 = MEMORY[0x24BDACB70];
    v14 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend(CFSTR("No Notification Center Widget specified."), "UTF8String");
      *(_DWORD *)buf = 136315138;
      v33 = v15;
      _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }

    v16 = (void *)MEMORY[0x24BDD1540];
    v30 = *MEMORY[0x24BDD0FC8];
    v31 = CFSTR("No Notification Center Widget specified.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.deviceprocesscontrolservice"), 8, v9);
    v17 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v25[5];
    v25[5] = v17;
  }

  v18 = (void *)v25[5];
  if (a4 && v18)
  {
    *a4 = objc_retainAutorelease(v18);
    v18 = (void *)v25[5];
  }
  v19 = v18 == 0;
  _Block_object_dispose(&v24, 8);

  return v19;
}

- (BOOL)showSBWidget:(id)a3 withError:(id *)a4
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  dispatch_semaphore_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  int v25;
  int64_t v26;
  dispatch_time_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  BOOL v38;
  id *v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  NSObject *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  const __CFString *v54;
  uint8_t buf[4];
  uint64_t v56;
  uint64_t v57;
  const __CFString *v58;
  _QWORD v59[4];
  _QWORD v60[4];
  _QWORD v61[2];
  _QWORD v62[4];

  v40 = a4;
  v62[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = sub_222B9038C;
  v51 = sub_222B9039C;
  v52 = 0;
  objc_msgSend(v4, "objectForKey:", CFSTR("WidgetIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = v5;
  else
    v6 = 0;
  v41 = (id)*MEMORY[0x24BE16938];
  v42 = (id)*MEMORY[0x24BE16930];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_XCWidgetKind"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (__CFString *)v7;
  else
    v9 = &stru_24EB2CF78;
  v10 = v9;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_XCWidgetFamily"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (__CFString *)v11;
  else
    v13 = &stru_24EB2CF78;
  v14 = v13;

  if (v6)
  {
    v15 = *MEMORY[0x24BE38310];
    v62[0] = MEMORY[0x24BDBD1C8];
    v16 = *MEMORY[0x24BE382C0];
    v61[0] = v15;
    v61[1] = v16;
    v17 = *MEMORY[0x24BE38238];
    v59[0] = *MEMORY[0x24BE38230];
    v59[1] = v17;
    v60[0] = v6;
    v60[1] = CFSTR("com.apple.widgetkit-extension");
    v59[2] = v41;
    v59[3] = v42;
    v60[2] = v10;
    v60[3] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, v59, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, v61, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = dispatch_semaphore_create(0);
    objc_msgSend(MEMORY[0x24BE38490], "serviceWithDefaultShellEndpoint");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE38478], "optionsWithDictionary:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = sub_222B92010;
    v43[3] = &unk_24EB2AD58;
    v44 = v6;
    v46 = &v47;
    v23 = v20;
    v45 = v23;
    objc_msgSend(v21, "openApplication:withOptions:completion:", CFSTR("com.apple.springboard"), v22, v43);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Timeout"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "intValue");

    if (v25 <= 0)
      v26 = 10000000000;
    else
      v26 = (uint64_t)((double)v25 * 1000000000.0);
    v27 = dispatch_time(0, v26);
    if (dispatch_semaphore_wait(v23, v27))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Show Notification Center Widget timed out.", buf, 2u);
      }
      v28 = (void *)MEMORY[0x24BDD1540];
      v57 = *MEMORY[0x24BDD0FC8];
      v58 = CFSTR("Show Notification Center Widget timed out.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1, v40);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.deviceprocesscontrolservice"), 32, v29);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v48[5];
      v48[5] = v30;

    }
  }
  else
  {
    v32 = MEMORY[0x24BDACB70];
    v33 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v34 = objc_msgSend(CFSTR("No Widget specified."), "UTF8String");
      *(_DWORD *)buf = 136315138;
      v56 = v34;
      _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }

    v35 = (void *)MEMORY[0x24BDD1540];
    v53 = *MEMORY[0x24BDD0FC8];
    v54 = CFSTR("No Widget specified.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.deviceprocesscontrolservice"), 8, v19);
    v36 = objc_claimAutoreleasedReturnValue();
    v23 = v48[5];
    v48[5] = v36;
  }

  v37 = (void *)v48[5];
  if (v40 && v37)
  {
    *v40 = objc_retainAutorelease(v37);
    v37 = (void *)v48[5];
  }
  v38 = v37 == 0;

  _Block_object_dispose(&v47, 8);
  return v38;
}

- (BOOL)_triggerSiri
{
  objc_class *v2;
  objc_class *v3;

  LODWORD(v2) = dlopen_preflight("/System/Library/PrivateFrameworks/SiriActivation.framework/SiriActivation");
  if ((_DWORD)v2)
  {
    dlopen("/System/Library/PrivateFrameworks/SiriActivation.framework/SiriActivation", 10);
    v2 = NSClassFromString(CFSTR("SiriSimpleActivationSource"));
    if (v2)
    {
      v2 = (objc_class *)objc_alloc_init(v2);
      if (v2)
      {
        v3 = v2;
        -[objc_class activateFromSource:](v2, "activateFromSource:", 0);

        LOBYTE(v2) = 1;
      }
    }
  }
  return (char)v2;
}

- (BOOL)_dismissTodayView
{
  return MEMORY[0x24BEDD108](self, sel__HIDEvent_hold_);
}

- (BOOL)_HIDEvent:(unsigned int)a3 hold:(BOOL)a4
{
  float v4;
  const void *KeyboardEvent;
  uint64_t v6;
  const void *v7;
  timespec __rqtp;
  mach_timebase_info info;

  if (a4)
    v4 = 1.0;
  else
    v4 = 0.1;
  if (a3 != 1 && a3 != 2)
    return 0;
  info = 0;
  mach_timebase_info(&info);
  __rqtp.tv_sec = (uint64_t)v4;
  __rqtp.tv_nsec = (float)((float)(v4 - (float)(uint64_t)v4) * 1000000000.0);
  mach_absolute_time();
  KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent();
  v6 = IOHIDEventCreateKeyboardEvent();
  v7 = (const void *)v6;
  if (KeyboardEvent && v6)
  {
    sub_222B9233C();
    nanosleep(&__rqtp, 0);
    sub_222B9233C();
LABEL_11:
    CFRelease(KeyboardEvent);
    goto LABEL_12;
  }
  if (KeyboardEvent)
    goto LABEL_11;
LABEL_12:
  if (v7)
    CFRelease(v7);
  return 1;
}

@end
