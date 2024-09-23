@implementation Main

+ (BOOL)unzipFileAtPath:(id)a3 toDestination:(id)a4
{
  char v6;
  id v7;
  id location[2];
  id v9;

  v9 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v6 = objc_msgSend(v9, "unzipFileAtPath:toDestination:delegate:", location[0], v7, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

+ (BOOL)unzipFileAtPath:(id)a3 toDestination:(id)a4 overwrite:(BOOL)a5 password:(id)a6 error:(id *)a7
{
  char v12;
  id v13;
  BOOL v14;
  id v15;
  id location[2];
  id v17;

  v17 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = a5;
  v13 = 0;
  objc_storeStrong(&v13, a6);
  v12 = objc_msgSend(v17, "unzipFileAtPath:toDestination:overwrite:password:error:delegate:progressHandler:completionHandler:", location[0], v15, v14, v13, a7, 0, 0, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v12 & 1;
}

+ (BOOL)unzipFileAtPath:(id)a3 toDestination:(id)a4 delegate:(id)a5
{
  char v8;
  id v9;
  id v10;
  id location[2];
  id v12;

  v12 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v9 = 0;
  objc_storeStrong(&v9, a5);
  v8 = objc_msgSend(v12, "unzipFileAtPath:toDestination:overwrite:password:error:delegate:progressHandler:completionHandler:", location[0], v10, 1, 0, 0, v9, 0, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v8 & 1;
}

+ (BOOL)unzipFileAtPath:(id)a3 toDestination:(id)a4 overwrite:(BOOL)a5 password:(id)a6 error:(id *)a7 delegate:(id)a8
{
  char v14;
  id v15;
  id *v16;
  id v17;
  BOOL v18;
  id v19;
  id location[2];
  id v21;

  v21 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v18 = a5;
  v17 = 0;
  objc_storeStrong(&v17, a6);
  v16 = a7;
  v15 = 0;
  objc_storeStrong(&v15, a8);
  v14 = objc_msgSend(v21, "unzipFileAtPath:toDestination:overwrite:password:error:delegate:progressHandler:completionHandler:", location[0], v19, v18, v17, v16, v15, 0, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return v14 & 1;
}

+ (BOOL)unzipFileAtPath:(id)a3 toDestination:(id)a4 overwrite:(BOOL)a5 password:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8
{
  char v14;
  id v15;
  id v16;
  id v17;
  BOOL v18;
  id v19;
  id location[2];
  id v21;

  v21 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v18 = a5;
  v17 = 0;
  objc_storeStrong(&v17, a6);
  v16 = 0;
  objc_storeStrong(&v16, a7);
  v15 = 0;
  objc_storeStrong(&v15, a8);
  v14 = objc_msgSend(v21, "unzipFileAtPath:toDestination:overwrite:password:error:delegate:progressHandler:completionHandler:", location[0], v19, v18, v17, 0, v16, v15);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return v14 & 1;
}

+ (BOOL)unzipFileAtPath:(id)a3 toDestination:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  char v10;
  id v11;
  id v12;
  id v13;
  id location[2];
  id v15;

  v15 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v12 = 0;
  objc_storeStrong(&v12, a5);
  v11 = 0;
  objc_storeStrong(&v11, a6);
  v10 = objc_msgSend(v15, "unzipFileAtPath:toDestination:overwrite:password:error:delegate:progressHandler:completionHandler:", location[0], v13, 1, 0, 0, v12, v11);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v10 & 1;
}

+ (BOOL)unzipFileAtPath:(id)a3 toDestination:(id)a4 overwrite:(BOOL)a5 password:(id)a6 error:(id *)a7 delegate:(id)a8 progressHandler:(id)a9 completionHandler:(id)a10
{
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  int *v15;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  void (*v30)(id, id, _BYTE *, uint64_t, uint64_t);
  id v31;
  id v32;
  char *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  char v43;
  id v44;
  id v45;
  char v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  BOOL v54;
  void *context;
  id v56;
  id v57;
  uint64_t v58;
  id v64;
  _QWORD v65[8];
  id v66;
  id v67;
  _BYTE v68[136];
  _BYTE v69[136];
  int v70;
  int CurrentFile;
  id v72;
  id v73;
  id v74;
  uint64_t v75;
  id v76;
  id v77;
  _DWORD __size[3];
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  id v88;
  char v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  _BYTE v94[136];
  _BYTE __dst[136];
  _QWORD __b[17];
  uint64_t v97;
  int CurrentFileInfo;
  char v99;
  char v100;
  id v101;
  id v102;
  id v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  int v110;
  id v111;
  id v112;
  uint64_t *v113;
  id v114;
  id v115;
  id v116;
  id *v117;
  id v118;
  BOOL v119;
  id v120;
  id location[2];
  id v122;
  char v123;
  uint64_t v124;
  id v125;
  _BYTE v126[128];
  uint64_t v127;
  id v128;
  _QWORD v129[2];
  _QWORD v130[2];
  _QWORD v131[2];
  _QWORD v132[2];
  _BYTE __ptr[4096];
  uint64_t v134;
  const __CFString *v135;
  uint64_t v136;
  _QWORD v137[2];

  v137[1] = *MEMORY[0x24BDAC8D0];
  v122 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v120 = 0;
  objc_storeStrong(&v120, a4);
  v119 = a5;
  v118 = 0;
  objc_storeStrong(&v118, a6);
  v117 = a7;
  v116 = 0;
  objc_storeStrong(&v116, a8);
  v115 = 0;
  objc_storeStrong(&v115, a9);
  v114 = 0;
  objc_storeStrong(&v114, a10);
  v113 = (uint64_t *)unzOpen(objc_msgSend(objc_retainAutorelease(location[0]), "UTF8String"));
  if (v113)
  {
    v56 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v109 = (id)objc_msgSend(v56, "attributesOfItemAtPath:error:", location[0], 0);

    v108 = 0;
    v57 = (id)objc_msgSend(v109, "objectForKeyedSubscript:", *MEMORY[0x24BDD0D08]);
    v58 = objc_msgSend(v57, "unsignedLongLongValue");

    v108 = v58;
    v107 = 0;
    v105 = 0;
    v106 = 0;
    unzGetGlobalInfo((uint64_t)v113, &v105);
    if (unzGoToFirstFile(v113))
    {
      v134 = *MEMORY[0x24BDD0FC8];
      v135 = CFSTR("Failed to open the first file in Zip.");
      v104 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v135, &v134, 1);
      v103 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ZipArchiveErrorDomain"), -2, v104);
      if (v117)
      {
        v11 = objc_retainAutorelease(v103);
        *v117 = v11;
      }
      if (v114)
        (*((void (**)(id, _QWORD, _QWORD, id))v114 + 2))(v114, 0, 0, v103);
      v123 = 0;
      v110 = 1;
      objc_storeStrong(&v103, 0);
      objc_storeStrong(&v104, 0);
    }
    else
    {
      v102 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v101 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v100 = 1;
      v99 = 0;
      CurrentFileInfo = 0;
      bzero(__ptr, 0x1000uLL);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v116, "zipArchiveWillUnzipArchiveAtPath:zipInformation:", location[0], v105, v106);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v116, "zipArchiveProgressEvent:total:", v107, v108);
      v97 = 0;
      do
      {
        context = (void *)MEMORY[0x220786D4C]();
        if (objc_msgSend(v118, "length"))
          CurrentFileInfo = unzOpenCurrentFilePassword(v113, objc_msgSend(objc_retainAutorelease(v118), "cStringUsingEncoding:", 1));
        else
          CurrentFileInfo = unzOpenCurrentFile(v113);
        if (CurrentFileInfo)
        {
          v100 = 0;
          v110 = 2;
        }
        else
        {
          memset(__b, 0, sizeof(__b));
          CurrentFileInfo = unzGetCurrentFileInfo(v113, (uint64_t)__b, 0, 0, 0, 0, 0, 0);
          if (CurrentFileInfo)
          {
            v100 = 0;
            unzCloseCurrentFile((uint64_t)v113);
            v110 = 2;
          }
          else
          {
            v107 += __b[6];
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              memcpy(__dst, __b, sizeof(__dst));
              if ((objc_msgSend(v116, "zipArchiveShouldUnzipFileAtIndex:totalFiles:archivePath:fileInformation:", v97, v105, location[0], __dst) & 1) == 0)
              {
                v100 = 0;
                v99 = 1;
              }
            }
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              memcpy(v94, __b, sizeof(v94));
              objc_msgSend(v116, "zipArchiveWillUnzipFileAtIndex:totalFiles:archivePath:fileInformation:", v97, v105, location[0], v94);
            }
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v116, "zipArchiveProgressEvent:total:", v107, v108);
            v93 = 0;
            v93 = malloc_type_malloc(__b[8] + 1, 0xC1C6D33DuLL);
            unzGetCurrentFileInfo(v113, (uint64_t)__b, (uint64_t)v93, __b[8] + 1, 0, 0, 0, 0);
            *((_BYTE *)v93 + __b[8]) = 0;
            v92 = 3;
            v91 = 61440;
            v90 = 40960;
            v89 = 0;
            if (__b[0] >> 8 == 3 && ((__b[13] >> 16) & 0xF000) == 0xA000)
              v89 = 0;
            v88 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v93);
            v87 = 0;
            if (*((_BYTE *)v93 + __b[8] - 1) == 47 || *((_BYTE *)v93 + __b[8] - 1) == 92)
              v87 = 1;
            free(v93);
            v52 = v88;
            v53 = (id)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("/\\"));
            v85 = objc_msgSend(v52, "rangeOfCharacterFromSet:");
            v86 = v12;
            v54 = v85 == 0x7FFFFFFFFFFFFFFFLL;

            if (!v54)
            {
              v13 = (id)objc_msgSend(v88, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\"), CFSTR("/"));
              v14 = v88;
              v88 = v13;

            }
            v84 = (id)objc_msgSend(v120, "stringByAppendingPathComponent:", v88);
            v83 = 0;
            v82 = (id)objc_msgSend((id)objc_opt_class(), "dateWithMicrosoftDOSFormat:", __b[4]);
            v131[0] = *MEMORY[0x24BDD0C58];
            v132[0] = v82;
            v131[1] = *MEMORY[0x24BDD0C98];
            v132[1] = v82;
            v81 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v132, v131, 2);
            if ((v87 & 1) != 0)
            {
              v80 = v83;
              objc_msgSend(v102, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v84, 1, v81, &v80);
              objc_storeStrong(&v83, v80);
            }
            else
            {
              v50 = v102;
              v51 = (id)objc_msgSend(v84, "stringByDeletingLastPathComponent");
              v79 = v83;
              objc_msgSend(v50, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
              objc_storeStrong(&v83, v79);

            }
            if (v83)
            {
              v49 = (id)objc_msgSend(v83, "localizedDescription");
              NSLog(CFSTR("ZipArchive Error: %@"), v49);

            }
            if ((v89 & 1) == 0)
            {
              v47 = v101;
              v129[0] = CFSTR("path");
              v130[0] = v84;
              v129[1] = CFSTR("modDate");
              v130[1] = v82;
              v48 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v130, v129, 2);
              objc_msgSend(v47, "addObject:");

            }
            if ((objc_msgSend(v102, "fileExistsAtPath:", v84) & 1) == 0 || (v87 & 1) != 0 || v119)
            {
              if ((v89 & 1) != 0)
              {
                v72 = (id)objc_msgSend(MEMORY[0x24BDD16A8], "string");
                CurrentFile = 0;
                while (1)
                {
                  CurrentFile = unzReadCurrentFile((uint64_t)v113, (uint64_t)__ptr, 0x1000u);
                  if (CurrentFile <= 0)
                    break;
                  __ptr[CurrentFile] = 0;
                  v34 = v72;
                  v35 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
                  objc_msgSend(v34, "appendString:");

                }
                v70 = 0;
                v33 = (char *)objc_msgSend(objc_retainAutorelease(v72), "cStringUsingEncoding:");
                v70 = symlink(v33, (const char *)objc_msgSend(objc_retainAutorelease(v84), "cStringUsingEncoding:", 4));
                if (v70)
                {
                  v31 = v84;
                  v32 = v72;
                  v15 = __error();
                  NSLog(CFSTR("Failed to create symbolic link at \"%@\" to \"%@\". symlink() error code: %d"), v31, v32, *v15);
                }
                objc_storeStrong(&v72, 0);
              }
              else
              {
                *(_QWORD *)&__size[1] = 0;
                *(_QWORD *)&__size[1] = fopen((const char *)objc_msgSend(objc_retainAutorelease(v84), "UTF8String"), "wb");
                while (*(_QWORD *)&__size[1])
                {
                  __size[0] = 0;
                  __size[0] = unzReadCurrentFile((uint64_t)v113, (uint64_t)__ptr, 0x1000u);
                  if (__size[0] <= 0)
                    break;
                  fwrite(__ptr, __size[0], 1uLL, *(FILE **)&__size[1]);
                }
                if (*(_QWORD *)&__size[1])
                {
                  v45 = (id)objc_msgSend(v84, "pathExtension");
                  v44 = (id)objc_msgSend(v45, "lowercaseString");
                  v46 = objc_msgSend(v44, "isEqualToString:", CFSTR("zip"));

                  if ((v46 & 1) != 0)
                  {
                    v39 = (id)objc_msgSend(v84, "lastPathComponent");
                    NSLog(CFSTR("Unzipping nested .zip file:  %@"), v39);

                    v41 = v122;
                    v40 = v84;
                    v42 = (id)objc_msgSend(v84, "stringByDeletingLastPathComponent");
                    v43 = objc_msgSend(v41, "unzipFileAtPath:toDestination:overwrite:password:error:delegate:", v40);

                    if ((v43 & 1) != 0)
                    {
                      v38 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
                      objc_msgSend(v38, "removeItemAtPath:error:", v84, 0);

                    }
                  }
                  fclose(*(FILE **)&__size[1]);
                  if (__b[4])
                  {
                    v77 = (id)objc_msgSend((id)objc_opt_class(), "dateWithMicrosoftDOSFormat:", __b[4]);
                    v127 = *MEMORY[0x24BDD0C98];
                    v128 = v77;
                    v76 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1);
                    if (v76 && (objc_msgSend(v102, "setAttributes:ofItemAtPath:error:", v76, v84, 0) & 1) == 0)
                      NSLog(CFSTR("[ZipArchive] Failed to set attributes - whilst setting modification date"));
                    objc_storeStrong(&v76, 0);
                    objc_storeStrong(&v77, 0);
                  }
                  v75 = __b[13] >> 16;
                  if (__b[13] >> 16)
                  {
                    v74 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v75);
                    v36 = objc_alloc(MEMORY[0x24BDBCED8]);
                    v37 = (id)objc_msgSend(v102, "attributesOfItemAtPath:error:", v84);
                    v73 = (id)objc_msgSend(v36, "initWithDictionary:");

                    objc_msgSend(v73, "setObject:forKeyedSubscript:", v74, *MEMORY[0x24BDD0CC8]);
                    if ((objc_msgSend(v102, "setAttributes:ofItemAtPath:error:", v73, v84, 0) & 1) == 0)
                      NSLog(CFSTR("[ZipArchive] Failed to set attributes - whilst setting permissions"));
                    objc_storeStrong(&v73, 0);
                    objc_storeStrong(&v74, 0);
                  }
                }
              }
              unzCloseCurrentFile((uint64_t)v113);
              CurrentFileInfo = unzGoToNextFile(v113);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                memcpy(v69, __b, sizeof(v69));
                objc_msgSend(v116, "zipArchiveDidUnzipFileAtIndex:totalFiles:archivePath:fileInformation:", v97, v105, location[0], v69);
              }
              else if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v116, "zipArchiveDidUnzipFileAtIndex:totalFiles:archivePath:unzippedFilePath:", v97, v105, location[0], v84);
              }
              ++v97;
              if (v115)
              {
                v30 = (void (*)(id, id, _BYTE *, uint64_t, uint64_t))*((_QWORD *)v115 + 2);
                memcpy(v68, __b, sizeof(v68));
                v30(v115, v88, v68, v97, v105);
              }
              v110 = 0;
            }
            else
            {
              unzCloseCurrentFile((uint64_t)v113);
              CurrentFileInfo = unzGoToNextFile(v113);
              v110 = 3;
            }
            objc_storeStrong(&v81, 0);
            objc_storeStrong(&v82, 0);
            objc_storeStrong(&v83, 0);
            objc_storeStrong(&v84, 0);
            objc_storeStrong(&v88, 0);
          }
        }
        objc_autoreleasePoolPop(context);
      }
      while (v110 != 2 && !CurrentFileInfo);
      unzClose((uint64_t)v113);
      v67 = 0;
      memset(v65, 0, sizeof(v65));
      v28 = v101;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", v65, v126, 16);
      if (v29)
      {
        v25 = *(_QWORD *)v65[2];
        v26 = 0;
        v27 = v29;
        while (1)
        {
          v24 = v26;
          if (*(_QWORD *)v65[2] != v25)
            objc_enumerationMutation(v28);
          v66 = *(id *)(v65[1] + 8 * v26);
          v22 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v124 = *MEMORY[0x24BDD0C98];
          v21 = (id)objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("modDate"));
          v125 = v21;
          v20 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v125, &v124, 1);
          v19 = (id)objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("path"));
          v64 = v67;
          v23 = objc_msgSend(v22, "setAttributes:ofItemAtPath:error:", v20);
          objc_storeStrong(&v67, v64);

          if ((v23 & 1) == 0)
          {
            v18 = (id)objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("path"));
            NSLog(CFSTR("[ZipArchive] Set attributes failed for directory: %@."), v18);

          }
          if (v67)
          {
            v17 = (id)objc_msgSend(v67, "localizedDescription");
            NSLog(CFSTR("[ZipArchive] Error setting directory file modification date attribute: %@"), v17);

          }
          ++v26;
          if (v24 + 1 >= v27)
          {
            v26 = 0;
            v27 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", v65, v126, 16);
            if (!v27)
              break;
          }
        }
      }

      if ((v100 & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v116, "zipArchiveDidUnzipArchiveAtPath:zipInformation:unzippedPath:", location[0], v105, v106, v120);
      if ((v99 & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v116, "zipArchiveProgressEvent:total:", v108, v108);
      if (v114)
        (*((void (**)(id, id, uint64_t, _QWORD))v114 + 2))(v114, location[0], 1, 0);
      v123 = v100 & 1;
      v110 = 1;
      objc_storeStrong(&v67, 0);
      objc_storeStrong(&v101, 0);
      objc_storeStrong(&v102, 0);
    }
    objc_storeStrong(&v109, 0);
  }
  else
  {
    v136 = *MEMORY[0x24BDD0FC8];
    v137[0] = CFSTR("Failed to unzip file");
    v112 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v137, &v136, 1);
    v111 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ZipArchiveErrorDomain"), -1, v112);
    if (v117)
    {
      v10 = objc_retainAutorelease(v111);
      *v117 = v10;
    }
    if (v114)
      (*((void (**)(id, _QWORD, _QWORD, id))v114 + 2))(v114, 0, 0, v111);
    v123 = 0;
    v110 = 1;
    objc_storeStrong(&v111, 0);
    objc_storeStrong(&v112, 0);
  }
  objc_storeStrong(&v114, 0);
  objc_storeStrong(&v115, 0);
  objc_storeStrong(&v116, 0);
  objc_storeStrong(&v118, 0);
  objc_storeStrong(&v120, 0);
  objc_storeStrong(location, 0);
  return v123 & 1;
}

+ (BOOL)createZipFileAtPath:(id)a3 withFilesAtPaths:(id)a4
{
  Main *v4;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD __b[8];
  uint64_t v15;
  id v16;
  char v17;
  id v18;
  id location[3];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v17 = 0;
  v4 = [Main alloc];
  v16 = -[Main initWithPath:](v4, "initWithPath:", location[0]);
  if ((objc_msgSend(v16, "open") & 1) != 0)
  {
    memset(__b, 0, sizeof(__b));
    v11 = v18;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", __b, v20, 16);
    if (v12)
    {
      v8 = *(_QWORD *)__b[2];
      v9 = 0;
      v10 = v12;
      while (1)
      {
        v7 = v9;
        if (*(_QWORD *)__b[2] != v8)
          objc_enumerationMutation(v11);
        v15 = *(_QWORD *)(__b[1] + 8 * v9);
        objc_msgSend(v16, "writeFile:", v15);
        ++v9;
        if (v7 + 1 >= v10)
        {
          v9 = 0;
          v10 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", __b, v20, 16);
          if (!v10)
            break;
        }
      }
    }

    v17 = objc_msgSend(v16, "close") & 1;
  }
  v6 = v17;
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

+ (BOOL)createZipFileAtPath:(id)a3 withContentsOfDirectory:(id)a4
{
  char v6;
  id v7;
  id location[2];
  id v9;

  v9 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v6 = objc_msgSend(v9, "createZipFileAtPath:withContentsOfDirectory:keepParentDirectory:", location[0], v7, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

+ (BOOL)createZipFileAtPath:(id)a3 withContentsOfDirectory:(id)a4 keepParentDirectory:(BOOL)a5
{
  Main *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  char v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  BOOL v19;
  id v20;
  id v21;
  id v24;
  id v25;
  char v26;
  id v27;
  id v28;
  id v29;
  id v30;
  char v31;
  BOOL v32;
  id v33;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v33 = 0;
  objc_storeStrong(&v33, a4);
  v32 = a5;
  v31 = 0;
  v30 = 0;
  v5 = [Main alloc];
  v29 = -[Main initWithPath:](v5, "initWithPath:", location[0]);
  if ((objc_msgSend(v29, "open") & 1) != 0)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDD1580]);
    v7 = v30;
    v30 = v6;

    v28 = (id)objc_msgSend(v30, "enumeratorAtPath:", v33);
    v27 = 0;
    while (1)
    {
      v21 = (id)objc_msgSend(v28, "nextObject");
      v8 = v27;
      v27 = v21;

      if (!v21)
        break;
      v26 = 0;
      v25 = (id)objc_msgSend(v33, "stringByAppendingPathComponent:", v27);
      objc_msgSend(v30, "fileExistsAtPath:isDirectory:", v25, &v26);
      if ((v26 & 1) != 0)
      {
        v18 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v17 = (id)objc_msgSend(v18, "subpathsOfDirectoryAtPath:error:", v25, 0);
        v19 = objc_msgSend(v17, "count") != 0;

        if (!v19)
        {
          v24 = (id)objc_msgSend(v25, "stringByAppendingPathComponent:");
          objc_msgSend(&stru_24E09C510, "writeToFile:atomically:encoding:error:", v24, 1, 4);
          v14 = v29;
          v13 = v24;
          v15 = (id)objc_msgSend(v27, "stringByAppendingPathComponent:", CFSTR(".DS_Store"));
          objc_msgSend(v14, "writeFileAtPath:withFileName:", v13);

          v16 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          objc_msgSend(v16, "removeItemAtPath:error:", v24, 0);

          objc_storeStrong(&v24, 0);
        }
      }
      else
      {
        if (v32)
        {
          v20 = (id)objc_msgSend(v33, "lastPathComponent");
          v9 = (id)objc_msgSend(v20, "stringByAppendingPathComponent:", v27);
          v10 = v27;
          v27 = v9;

        }
        objc_msgSend(v29, "writeFileAtPath:withFileName:", v25, v27);
      }
      objc_storeStrong(&v25, 0);
    }
    v31 = objc_msgSend(v29, "close") & 1;
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
  }
  v12 = v31;
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
  return v12 & 1;
}

- (Main)initWithPath:(id)a3
{
  Main *v3;
  uint64_t v4;
  NSString *path;
  Main *v7;
  Main *v8;
  objc_super v9;
  id location[2];
  Main *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v11;
  v11 = 0;
  v9.receiver = v3;
  v9.super_class = (Class)Main;
  v8 = -[Main init](&v9, sel_init);
  v11 = v8;
  objc_storeStrong((id *)&v11, v8);
  if (v8)
  {
    v4 = objc_msgSend(location[0], "copy");
    path = v11->_path;
    v11->_path = (NSString *)v4;

  }
  v7 = v11;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v7;
}

- (BOOL)open
{
  -[NSString UTF8String](self->_path, "UTF8String");
  self->_zip = zipOpen();
  return self->_zip != 0;
}

- (void)zipInformation:(id *)a3 setDate:(id)a4
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  unsigned int v9;
  id v10;
  int v11;
  id v12;
  id location;
  $1A8A31FE3C8B9D1CFB9B07B83C8ED1B6 *v14;
  SEL v15;
  Main *v16;

  v16 = self;
  v15 = a2;
  v14 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v12 = (id)objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v11 = 252;
  v10 = (id)objc_msgSend(v12, "components:fromDate:", 252, location);
  v4 = objc_msgSend(v10, "second");
  v14->var0.var0 = v4;
  v5 = objc_msgSend(v10, "minute");
  v14->var0.var1 = v5;
  v6 = objc_msgSend(v10, "hour");
  v14->var0.var2 = v6;
  v7 = objc_msgSend(v10, "day");
  v14->var0.var3 = v7;
  v8 = objc_msgSend(v10, "month");
  v14->var0.var4 = v8 - 1;
  v9 = objc_msgSend(v10, "year");
  v14->var0.var5 = v9;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&location, 0);
}

- (BOOL)writeFolderAtPath:(id)a3 withFolderName:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  int v11;
  unint64_t v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  id v16;
  id v17;
  _QWORD __b[6];
  id v19;
  id location[2];
  uint64_t *v21;

  v21 = (uint64_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  memset(__b, 0, sizeof(__b));
  v9 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v17 = (id)objc_msgSend(v9, "attributesOfItemAtPath:error:", location[0], 0);

  if (v17)
  {
    v16 = (id)objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x24BDD0C98]);
    if (v16)
      objc_msgSend(v21, "zipInformation:setDate:", __b, v16);
    v15 = (id)objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x24BDD0CC8]);
    if (v15)
    {
      v14 = objc_msgSend(v15, "shortValue");
      v13 = v14 + 0x8000;
      v7 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v13);
      v8 = objc_msgSend(v7, "unsignedLongValue");

      v12 = v8;
      __b[5] = v8 < 0x10;
    }
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
  }
  v11 = 0;
  v5 = v21[3];
  v6 = (id)objc_msgSend(v19, "stringByAppendingString:", CFSTR("/"));
  zipOpenNewFileInZip(v5, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), (uint64_t)__b, 0, 0, 0, 0, 0, 8, 0);

  zipWriteInFileInZip(v21[3], (const Bytef *)&v11, 0);
  zipCloseFileInZip(v21[3]);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return 1;
}

- (BOOL)writeFile:(id)a3
{
  BOOL v4;
  id location[2];
  Main *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[Main writeFileAtPath:withFileName:](v6, "writeFileAtPath:withFileName:", location[0], 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)writeFileAtPath:(id)a3 withFileName:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  uInt v10;
  void *__ptr;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD __b[6];
  const char *v17;
  int v18;
  FILE *v19;
  id v20;
  id location[2];
  uint64_t *v22;
  char v23;

  v22 = (uint64_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  objc_storeStrong(&v20, a4);
  v19 = fopen((const char *)objc_msgSend(objc_retainAutorelease(location[0]), "UTF8String"), "r");
  if (v19)
  {
    v17 = 0;
    if (v20)
    {
      v17 = (const char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    }
    else
    {
      v8 = (id)objc_msgSend(location[0], "lastPathComponent");
      v17 = (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String");

    }
    memset(__b, 0, sizeof(__b));
    v7 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v15 = (id)objc_msgSend(v7, "attributesOfItemAtPath:error:", location[0], 0);

    if (v15)
    {
      v14 = (id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BDD0C98]);
      if (v14)
        objc_msgSend(v22, "zipInformation:setDate:", __b, v14);
      v13 = (id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BDD0CC8]);
      if (v13)
      {
        v12 = (__int16)objc_msgSend(v13, "shortValue") + 0x8000;
        v5 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12);
        v6 = objc_msgSend(v5, "unsignedLongValue");

        __b[5] = v6 << 16;
      }
      objc_storeStrong(&v13, 0);
      objc_storeStrong(&v14, 0);
    }
    zipOpenNewFileInZip(v22[3], v17, (uint64_t)__b, 0, 0, 0, 0, 0, 8, -1);
    __ptr = malloc_type_malloc(0x4000uLL, 0xF1B2600CuLL);
    while (!feof(v19))
    {
      v10 = fread(__ptr, 1uLL, 0x4000uLL, v19);
      zipWriteInFileInZip(v22[3], (const Bytef *)__ptr, v10);
    }
    zipCloseFileInZip(v22[3]);
    free(__ptr);
    v23 = 1;
    v18 = 1;
    objc_storeStrong(&v15, 0);
  }
  else
  {
    v23 = 0;
    v18 = 1;
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v23 & 1;
}

- (BOOL)writeData:(id)a3 fileName:(id)a4
{
  Main *v5;
  id v6;
  const Bytef *v7;
  uint64_t zip;
  _BYTE __b[52];
  int v11;
  id v12;
  id location[2];
  Main *v14;
  char v15;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  if (v14->_zip)
  {
    if (location[0])
    {
      memset(__b, 0, 0x30uLL);
      v5 = v14;
      v6 = (id)objc_msgSend(MEMORY[0x24BDBCE60], "date");
      -[Main zipInformation:setDate:](v5, "zipInformation:setDate:", __b);

      zipOpenNewFileInZip((uint64_t)v14->_zip, (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"), (uint64_t)__b, 0, 0, 0, 0, 0, 8, -1);
      zip = (uint64_t)v14->_zip;
      v7 = (const Bytef *)objc_msgSend(objc_retainAutorelease(location[0]), "bytes");
      zipWriteInFileInZip(zip, v7, objc_msgSend(location[0], "length"));
      zipCloseFileInZip((uint64_t)v14->_zip);
      v15 = 1;
    }
    else
    {
      v15 = 0;
    }
    v11 = 1;
  }
  else
  {
    v15 = 0;
    v11 = 1;
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v15 & 1;
}

- (BOOL)close
{
  zipClose((uint64_t)self->_zip, 0);
  return 1;
}

+ (id)dateWithMicrosoftDOSFormat:(unsigned int)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  unsigned int v9;
  SEL v10;
  id v11;
  id location;
  dispatch_once_t *v13;

  v11 = a1;
  v10 = a2;
  v9 = a3;
  v13 = (dispatch_once_t *)&dateWithMicrosoftDOSFormat__onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_3);
  if (*v13 != -1)
    dispatch_once(v13, location);
  objc_storeStrong(&location, 0);
  v8 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v8, "setYear:", ((v9 & 0xFE000000) >> 25) + 1980);
  objc_msgSend(v8, "setMonth:", (v9 & 0x1E00000) >> 21);
  objc_msgSend(v8, "setDay:", (v9 & 0x1F0000) >> 16);
  objc_msgSend(v8, "setHour:", (unsigned __int16)(v9 & 0xF800) >> 11);
  objc_msgSend(v8, "setMinute:", (unsigned __int16)(v9 & 0x7E0) >> 5);
  objc_msgSend(v8, "setSecond:", 2 * (v9 & 0x1F));
  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = (id)objc_msgSend((id)dateWithMicrosoftDOSFormat__gregorian, "dateFromComponents:", v8);
  v7 = (id)objc_msgSend(v4, "dateWithTimeInterval:sinceDate:", 0.0);

  v6 = v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  return v6;
}

void __35__Main_dateWithMicrosoftDOSFormat___block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x24BDBCE48]);
  v1 = objc_msgSend(v0, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  v2 = (void *)dateWithMicrosoftDOSFormat__gregorian;
  dateWithMicrosoftDOSFormat__gregorian = v1;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
