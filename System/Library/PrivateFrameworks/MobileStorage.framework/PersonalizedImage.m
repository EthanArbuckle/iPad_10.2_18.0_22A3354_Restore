@implementation PersonalizedImage

- (PersonalizedImage)initWithBundleURL:(id)a3 imageVariant:(id)a4 remoteDevice:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSURL *v14;
  NSURL *bundlePathURL;
  NSString *v16;
  NSString *imageVariant;
  NSURL *v18;
  NSURL *signingServerURL;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSURL *v26;
  NSURL *v27;
  void *v28;
  void *v29;
  void *v30;
  NSURL *v31;
  NSURL *userProvidedBundleMountPathURL;
  void *v33;
  void *v34;
  void *v35;
  NSURL *v36;
  NSURL *userProvidedImagePathURL;
  void *v38;
  void *v39;
  void *v40;
  PersonalizedImage *v41;
  void *v43;
  uint8_t buf[16];
  objc_super v45;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
LABEL_26:
    v41 = 0;
    goto LABEL_27;
  }
  v45.receiver = self;
  v45.super_class = (Class)PersonalizedImage;
  self = -[PersonalizedImage init](&v45, sel_init);
  if (self)
  {
    v14 = (NSURL *)objc_msgSend(v10, "copy");
    bundlePathURL = self->_bundlePathURL;
    self->_bundlePathURL = v14;

    v16 = (NSString *)objc_msgSend(v11, "copy");
    imageVariant = self->_imageVariant;
    self->_imageVariant = v16;

    objc_storeStrong((id *)&self->_remoteDevice, a5);
    self->_digestLength = 48;
    self->_useCredentials = 1;
    v18 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", CFSTR("https://gs.apple.com:443"));
    signingServerURL = self->_signingServerURL;
    self->_signingServerURL = v18;

    objc_storeStrong((id *)&self->_imageType, CFSTR("Personalized"));
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("UseCredentials"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        isNSNumber(v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
          self->_useCredentials = objc_msgSend(v21, "BOOLValue");
      }
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("SigningServerURL"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
      {
        isNSURL(v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          v26 = (NSURL *)objc_msgSend(v24, "copy");
          v27 = self->_signingServerURL;
          self->_signingServerURL = v26;

        }
      }
      v43 = v21;
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MountedBundlePath"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v28)
      {
        isNSURL(v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          v31 = (NSURL *)objc_msgSend(v29, "copy");
          userProvidedBundleMountPathURL = self->_userProvidedBundleMountPathURL;
          self->_userProvidedBundleMountPathURL = v31;

        }
      }
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ImagePath"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v33)
      {
        isNSURL(v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          v36 = (NSURL *)objc_msgSend(v34, "copy");
          userProvidedImagePathURL = self->_userProvidedImagePathURL;
          self->_userProvidedImagePathURL = v36;

        }
      }
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("UseCryptexFlow"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v38)
      {
        isNSNumber(v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
          objc_storeStrong((id *)&self->_imageType, CFSTR("Cryptex"));
      }

    }
    if (!v10 && !self->_userProvidedBundleMountPathURL && !self->_userProvidedImagePathURL)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
      }
      goto LABEL_26;
    }
  }
  self = self;
  v41 = self;
LABEL_27:

  return v41;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PersonalizedImage;
  -[PersonalizedImage dealloc](&v2, sel_dealloc);
}

- (id)digestFileSha1:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v26;
  CC_SHA1_CTX c;

  v5 = a3;
  v9 = v5;
  memset(&c, 0, sizeof(c));
  if (!v5)
  {
    createMobileStorageError((uint64_t)"-[PersonalizedImage digestFileSha1:error:]", 377, -2, 0, CFSTR("Invalid inputs."), v6, v7, v8, v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
LABEL_9:
    v19 = 0;
    goto LABEL_11;
  }
  v10 = (void *)MEMORY[0x24BDD1578];
  objc_msgSend(v5, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fileHandleForReadingAtPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    createMobileStorageError((uint64_t)"-[PersonalizedImage digestFileSha1:error:]", 383, -2, 0, CFSTR("Failed to create file handle for %@."), v13, v14, v15, (uint64_t)v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  CC_SHA1_Init(&c);
  v19 = (unsigned __int8 *)malloc_type_malloc(0x14uLL, 0xE4C08B99uLL);
  if (!v19)
  {
    createMobileStorageError((uint64_t)"-[PersonalizedImage digestFileSha1:error:]", 391, -2, 0, CFSTR("Failed to allocate digest memory."), v16, v17, v18, v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v23 = 0;
    if (!a4)
      goto LABEL_14;
    goto LABEL_12;
  }
  do
  {
    v20 = (void *)MEMORY[0x212BEFCD0]();
    objc_msgSend(v12, "readDataOfLength:", 1024);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CC_SHA1_Update(&c, (const void *)objc_msgSend(v21, "bytes"), objc_msgSend(v21, "length"));
    v22 = objc_msgSend(v21, "length");

    objc_autoreleasePoolPop(v20);
  }
  while (v22);
  CC_SHA1_Final(v19, &c);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v19, 20);
  v24 = 0;
  if (!a4)
    goto LABEL_14;
LABEL_12:
  if (!v23)
    *a4 = objc_retainAutorelease(v24);
LABEL_14:
  if (v19)
    free(v19);

  return v23;
}

- (id)digestFileSha384:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v27;
  CC_SHA512_CTX c;

  v5 = a3;
  v9 = v5;
  memset(&c, 0, sizeof(c));
  if (!v5)
  {
    createMobileStorageError((uint64_t)"-[PersonalizedImage digestFileSha384:error:]", 428, -2, 0, CFSTR("Invalid inputs."), v6, v7, v8, v27);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
LABEL_9:
    v19 = 0;
    goto LABEL_11;
  }
  v10 = (void *)MEMORY[0x24BDD1578];
  objc_msgSend(v5, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fileHandleForReadingAtPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    createMobileStorageError((uint64_t)"-[PersonalizedImage digestFileSha384:error:]", 434, -2, 0, CFSTR("Failed to create file handle for %@."), v13, v14, v15, (uint64_t)v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  CC_SHA384_Init(&c);
  v19 = (unsigned __int8 *)malloc_type_malloc(0x30uLL, 0xDA45BE47uLL);
  if (!v19)
  {
    createMobileStorageError((uint64_t)"-[PersonalizedImage digestFileSha384:error:]", 442, -2, 0, CFSTR("Failed to allocate digest memory."), v16, v17, v18, v27);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v23 = 0;
    if (!a4)
      goto LABEL_14;
    goto LABEL_12;
  }
  do
  {
    v20 = (void *)MEMORY[0x212BEFCD0]();
    objc_msgSend(v12, "readDataOfLength:", 1024);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CC_SHA384_Update(&c, (const void *)objc_msgSend(v21, "bytes"), objc_msgSend(v21, "length"));
    v22 = objc_msgSend(v21, "length");

    objc_autoreleasePoolPop(v20);
  }
  while (v22);
  CC_SHA384_Final(v19, &c);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v19, 48);
  v24 = 0;
  if (!a4)
    goto LABEL_14;
LABEL_12:
  if (!v23)
    *a4 = objc_retainAutorelease(v24);
LABEL_14:
  if (v19)
    free(v19);
  v25 = v23;

  return v25;
}

- (id)digestFile:(id)a3 digestLength:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;

  v6 = *(_QWORD *)&a4;
  v11 = a3;
  if ((_DWORD)v6 == 48)
  {
    -[PersonalizedImage digestFileSha384:error:](self, "digestFileSha384:error:", v11, a5);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if ((_DWORD)v6 == 20)
  {
    -[PersonalizedImage digestFileSha1:error:](self, "digestFileSha1:error:", v11, a5);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v13 = (void *)v12;
    goto LABEL_9;
  }
  if (a5)
  {
    createMobileStorageError((uint64_t)"-[PersonalizedImage digestFile:digestLength:error:]", 481, -3, 0, CFSTR("Unsupported digest length: %d"), v8, v9, v10, v6);
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
LABEL_9:

  return v13;
}

- (BOOL)initializeImageProperties:(id *)a3
{
  PersonalizedImage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  void *v118;
  int v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  void *v124;
  int v125;
  void *v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  void *v133;
  void *v134;
  int v135;
  void *v136;
  void *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  uint64_t v142;
  __CFString *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  uint64_t v155;
  void *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v173;
  void *v174;
  id *v175;
  id *v176;
  void *v177;
  void *v178;
  PersonalizedImage *v179;
  PersonalizedImage *v180;
  void *v181;
  void *v182;
  id v183;
  id v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  void *v188;
  void *v189;
  char v190;
  void *v191;
  id v192;
  id v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  uint8_t v198[128];
  uint8_t buf[24];
  uint64_t v200;

  v4 = self;
  v200 = *MEMORY[0x24BDAC8D0];
  -[PersonalizedImage userProvidedImagePathURL](self, "userProvidedImagePathURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PersonalizedImage userProvidedImagePathURL](v4, "userProvidedImagePathURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PersonalizedImage setImagePathURL:](v4, "setImagePathURL:", v8);

      v177 = 0;
      v178 = 0;
      v181 = 0;
      v182 = 0;
      v187 = 0;
      v9 = 0;
      goto LABEL_4;
    }
  }
  else
  {
    -[PersonalizedImage userProvidedBundleMountPathURL](v4, "userProvidedBundleMountPathURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[PersonalizedImage userProvidedBundleMountPathURL](v4, "userProvidedBundleMountPathURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "copy");

      v20 = (void *)v19;
      goto LABEL_19;
    }
    -[PersonalizedImage mountedVolumeEntry](v4, "mountedVolumeEntry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 532, -2, 0, CFSTR("Bundle mounting not support on this platform."), v50, v51, v52, v173);
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      v181 = 0;
      v177 = 0;
      v178 = 0;
LABEL_96:
      v13 = 0;
      v12 = 0;
      v11 = 0;
      v9 = 0;
      v182 = 0;
      if (!a3)
        goto LABEL_114;
      goto LABEL_109;
    }
  }
  v20 = 0;
LABEL_19:
  v53 = (void *)MEMORY[0x24BDBCE70];
  v178 = v20;
  objc_msgSend(v20, "stringByAppendingPathComponent:", CFSTR("Restore/BuildManifest.plist"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "dictionaryWithContentsOfFile:", v54);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 544, -2, 0, CFSTR("Failed to load build manifest."), v55, v56, v57, v173);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v181 = 0;
    v177 = 0;
    goto LABEL_96;
  }
  v182 = v7;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ManifestVersion"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v58;
    _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Manifest Version: %@", buf, 0xCu);

    v7 = v182;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ProductVersion"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v59;
    _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Product Version: %@", buf, 0xCu);

    v7 = v182;
  }
  v180 = v4;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ProductBuildVersion"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v60;
    _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Product Build Version: %@", buf, 0xCu);

    v7 = v182;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BuildIdentities"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  isNSArray(v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 556, -2, 0, CFSTR("Missing key 'BuildIdentities'."), v61, v62, v63, v173);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v181 = 0;
    v177 = 0;
    v13 = 0;
    v12 = 0;
    v11 = 0;
    if (!a3)
      goto LABEL_114;
    goto LABEL_109;
  }
  v196 = 0u;
  v197 = 0u;
  v194 = 0u;
  v195 = 0u;
  v9 = v9;
  v186 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v194, v198, 16);
  if (!v186)
  {

    v154 = 0;
    v177 = 0;
    v181 = 0;
LABEL_99:
    -[PersonalizedImage imageVariant](v180, "imageVariant");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 678, -2, v154, CFSTR("Failed to find image for variant %@."), v157, v158, v159, (uint64_t)v156);
    v155 = objc_claimAutoreleasedReturnValue();

    v13 = 0;
    v12 = 0;
    v11 = 0;
    v7 = 0;
    goto LABEL_100;
  }
  v176 = a3;
  v177 = 0;
  v181 = 0;
  v187 = 0;
  v174 = 0;
  v184 = v9;
  v185 = *(_QWORD *)v195;
  do
  {
    v64 = 0;
    do
    {
      if (*(_QWORD *)v195 != v185)
        objc_enumerationMutation(v9);
      v65 = *(void **)(*((_QWORD *)&v194 + 1) + 8 * v64);
      *(_QWORD *)buf = 0;
      objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("ApBoardID"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      isNSString(v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v67)
      {
        createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 577, -3, 0, CFSTR("Missing expected key 'ApBoardID'"), v68, v69, v70, v173);
        v117 = objc_claimAutoreleasedReturnValue();
        v188 = 0;
        v189 = 0;
        v72 = 0;
        v191 = 0;
        goto LABEL_50;
      }
      objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("ApChipID"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      isNSString(v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      v191 = v71;
      if (!v72)
      {
        createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 583, -3, 0, CFSTR("Missing expected key 'ApChipID'"), v73, v74, v75, v173);
        v117 = objc_claimAutoreleasedReturnValue();
        v188 = 0;
        v189 = 0;
        v67 = 0;
        goto LABEL_50;
      }
      objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("ApSecurityDomain"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      isNSString(v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v77)
      {
        v67 = v76;
        createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 589, -3, 0, CFSTR("Missing expected key 'ApSecurityDomain'"), v78, v79, v80, v173);
        v117 = objc_claimAutoreleasedReturnValue();
        v188 = 0;
        v189 = 0;
        v72 = 0;
        v99 = 0;
        goto LABEL_52;
      }
      objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v66);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v81, "scanHexLongLong:", buf)
        && (v82 = *(_QWORD *)buf,
            -[PersonalizedImage boardID](v180, "boardID"),
            v83 = (void *)objc_claimAutoreleasedReturnValue(),
            v84 = objc_msgSend(v83, "unsignedLongLongValue"),
            v83,
            v82 == v84))
      {
        objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v71);
        v85 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v85, "scanHexLongLong:", buf)
          || (v86 = *(_QWORD *)buf,
              -[PersonalizedImage chipID](v180, "chipID"),
              v87 = (void *)objc_claimAutoreleasedReturnValue(),
              v88 = objc_msgSend(v87, "unsignedLongLongValue"),
              v87,
              v86 != v88))
        {
          v67 = v76;
          v188 = v85;
          v189 = 0;
          goto LABEL_62;
        }
        objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v76);
        v89 = (void *)objc_claimAutoreleasedReturnValue();

        v188 = v89;
        if (!objc_msgSend(v89, "scanHexLongLong:", buf))
        {
          v67 = v76;
          v189 = 0;
LABEL_62:
          v72 = 0;
          v99 = 0;
          v77 = 0;
          v118 = 0;
          v107 = 0;
          v119 = 4;
LABEL_54:
          v9 = v184;
          goto LABEL_55;
        }
        v90 = *(_QWORD *)buf;
        -[PersonalizedImage securityDomain](v180, "securityDomain");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = objc_msgSend(v91, "unsignedLongLongValue");

        v9 = v184;
        if (v90 == v92)
        {
          objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("Info"));
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          isNSDictionary(v93);
          v94 = (void *)objc_claimAutoreleasedReturnValue();

          v189 = v93;
          if (v94)
          {
            objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("Manifest"));
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            isNSDictionary(v98);
            v99 = (void *)objc_claimAutoreleasedReturnValue();

            if (v99)
            {
              objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("LoadableTrustCache"));
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              v77 = v103;
              if (v103)
              {
                v72 = v98;
                isNSDictionary(v103);
                v99 = (void *)objc_claimAutoreleasedReturnValue();

                if (v99)
                {
                  objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("Info"));
                  v107 = (void *)objc_claimAutoreleasedReturnValue();
                  isNSDictionary(v107);
                  v99 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v99)
                  {
                    objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("Path"));
                    v111 = (void *)objc_claimAutoreleasedReturnValue();

                    v112 = v111;
                    isNSString(v111);
                    v99 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v99)
                    {
                      v67 = v76;
                      v116 = v112;
                      v98 = v72;
                      goto LABEL_67;
                    }
                    v67 = v76;
                    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 638, -3, 0, CFSTR("Missing expected key 'Path'"), v113, v114, v115, v173);
                    v117 = objc_claimAutoreleasedReturnValue();
                    v118 = 0;
                    v181 = v112;
                  }
                  else
                  {
                    v67 = v76;
                    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 632, -3, 0, CFSTR("Missing expected key 'Info'"), v108, v109, v110, v173);
                    v117 = objc_claimAutoreleasedReturnValue();
                    v118 = 0;
                  }
                }
                else
                {
                  v67 = v76;
                  createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 625, -3, 0, CFSTR("Invalid value for key 'LoadableTrustCache'"), v104, v105, v106, v173);
                  v117 = objc_claimAutoreleasedReturnValue();
LABEL_52:
                  v118 = 0;
                  v107 = 0;
                }
LABEL_53:

                v119 = 3;
                v187 = (void *)v117;
                goto LABEL_54;
              }
              v67 = v76;
              v107 = 0;
              v116 = v181;
LABEL_67:
              v181 = v116;
              objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("PersonalizedDMG"));
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              isNSDictionary(v99);
              v118 = (void *)objc_claimAutoreleasedReturnValue();

              if (v118)
              {
                objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("Name"));
                v118 = (void *)objc_claimAutoreleasedReturnValue();
                isNSString(v118);
                v123 = (void *)objc_claimAutoreleasedReturnValue();

                if (v123)
                {
                  -[PersonalizedImage imageVariant](v180, "imageVariant");
                  v124 = (void *)objc_claimAutoreleasedReturnValue();
                  v125 = objc_msgSend(v118, "isEqualToString:", v124);

                  if (!v125)
                  {
                    v72 = v98;
                    v119 = 0;
                    goto LABEL_54;
                  }
                  objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("Info"));
                  v126 = (void *)objc_claimAutoreleasedReturnValue();

                  isNSDictionary(v126);
                  v127 = (void *)objc_claimAutoreleasedReturnValue();

                  v72 = v98;
                  if (v127)
                  {
                    objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("HashMethod"));
                    v131 = (void *)objc_claimAutoreleasedReturnValue();

                    v177 = v131;
                    isNSString(v131);
                    v132 = objc_claimAutoreleasedReturnValue();
                    v133 = v126;
                    if (v132)
                    {
                      v134 = (void *)v132;
                      v135 = objc_msgSend(v177, "isEqualToString:", CFSTR("sha1"));

                      if (v135)
                        -[PersonalizedImage setDigestLength:](v180, "setDigestLength:", 20);
                    }
                    objc_msgSend(v133, "objectForKeyedSubscript:", CFSTR("Path"));
                    v136 = (void *)objc_claimAutoreleasedReturnValue();

                    isNSString(v136);
                    v137 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v137)
                    {
                      v141 = v133;
                      v119 = 3;
                      v174 = v136;
                      v107 = v141;
                      goto LABEL_54;
                    }
                    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 669, -3, 0, CFSTR("Missing expected key 'Path'"), v138, v139, v140, v173);
                    v117 = objc_claimAutoreleasedReturnValue();
                    v174 = v136;
                    v107 = v133;
                    goto LABEL_53;
                  }
                  createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 658, -3, 0, CFSTR("Missing expected key 'Info'"), v128, v129, v130, v173);
                  v144 = objc_claimAutoreleasedReturnValue();
                  v107 = v126;
                  goto LABEL_81;
                }
                v72 = v98;
                v142 = 651;
                v143 = CFSTR("Missing expected key 'Name'");
              }
              else
              {
                v72 = v98;
                v142 = 645;
                v143 = CFSTR("Missing expected key 'PersonalizedDMG'");
              }
              createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", v142, -3, 0, v143, v120, v121, v122, v173);
              v144 = objc_claimAutoreleasedReturnValue();
LABEL_81:
              v117 = v144;
              goto LABEL_53;
            }
            v72 = v98;
            v67 = v76;
            createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 619, -3, 0, CFSTR("Missing expected key 'Manifest'"), v100, v101, v102, v173);
            v117 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v67 = v76;
            createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 613, -3, 0, CFSTR("Missing expected key 'Info'"), v95, v96, v97, v173);
            v117 = objc_claimAutoreleasedReturnValue();
            v72 = 0;
LABEL_50:
            v99 = 0;
          }
          v77 = 0;
          goto LABEL_52;
        }
      }
      else
      {
        v188 = v81;
      }
      v67 = v76;
      v189 = 0;
      v72 = 0;
      v99 = 0;
      v77 = 0;
      v118 = 0;
      v107 = 0;
      v119 = 4;
LABEL_55:

      if ((v119 | 4) != 4)
        goto LABEL_87;
      ++v64;
    }
    while (v186 != v64);
    v145 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v194, v198, 16);
    v186 = v145;
  }
  while (v145);
LABEL_87:

  if (!v174)
  {
    a3 = v176;
    v154 = v187;
    goto LABEL_99;
  }
  objc_msgSend(CFSTR("Restore"), "stringByAppendingPathComponent:", v174);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v146 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v178, "stringByAppendingPathComponent:", v7);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "fileURLWithPath:", v147);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v180;
  -[PersonalizedImage setImagePathURL:](v180, "setImagePathURL:", v148);

  a3 = v176;
  if (v181)
  {
    objc_msgSend(CFSTR("Restore"), "stringByAppendingPathComponent:", v181);
    v149 = objc_claimAutoreleasedReturnValue();

    v150 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v178, "stringByAppendingPathComponent:", v149);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "fileURLWithPath:", v151);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    -[PersonalizedImage setTrustCacheURL:](v180, "setTrustCacheURL:", v152);

    v181 = (void *)v149;
  }
  else
  {
    v181 = 0;
  }
LABEL_4:
  -[PersonalizedImage remoteDevice](v4, "remoteDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v179 = v4;
    copyWorkingDirectory();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v183 = v9;
      v175 = a3;
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "UUIDString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingPathComponent:", v25);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[PersonalizedImage imagePathURL](v179, "imagePathURL");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v193 = v187;
          v34 = objc_msgSend(v32, "copyItemAtURL:toURL:error:", v33, v11, &v193);
          v35 = v193;

          if ((v34 & 1) != 0)
          {
            -[PersonalizedImage setImagePathURL:](v179, "setImagePathURL:", v11);
            -[PersonalizedImage trustCacheURL](v179, "trustCacheURL");
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v36)
            {
              v14 = 1;
              v15 = v35;
              goto LABEL_115;
            }
            objc_msgSend(MEMORY[0x24BDD1880], "UUID");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "UUIDString");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "stringByAppendingPathComponent:", v38);
            v39 = objc_claimAutoreleasedReturnValue();

            v43 = v35;
            if (v39)
            {
              objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v39);
              v44 = objc_claimAutoreleasedReturnValue();

              a3 = v175;
              if (v44)
              {
                objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                -[PersonalizedImage trustCacheURL](v179, "trustCacheURL");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v192 = v43;
                v190 = objc_msgSend(v48, "copyItemAtURL:toURL:error:", v49, v44, &v192);
                v15 = v192;

                v9 = v183;
                if ((v190 & 1) != 0)
                {
                  -[PersonalizedImage setTrustCacheURL:](v179, "setTrustCacheURL:", v44);
                  v14 = 1;
                  v11 = (void *)v44;
                  v13 = (void *)v39;
                  goto LABEL_115;
                }
                -[PersonalizedImage trustCacheURL](v179, "trustCacheURL");
                v167 = (void *)objc_claimAutoreleasedReturnValue();
                createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 756, -2, v15, CFSTR("Failed to copy %@ to %@."), v168, v169, v170, (uint64_t)v167);
                v171 = objc_claimAutoreleasedReturnValue();

                v153 = (void *)v171;
                v13 = (void *)v39;
                v11 = (void *)v44;
                if (!v175)
                {
LABEL_114:
                  v14 = 0;
                  v15 = v153;
                  goto LABEL_115;
                }
LABEL_109:
                v15 = objc_retainAutorelease(v153);
                v14 = 0;
                *a3 = v15;
                goto LABEL_115;
              }
              createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 751, -2, 0, CFSTR("Failed to create URL."), v45, v46, v47, v173);
              v166 = objc_claimAutoreleasedReturnValue();

              v153 = (void *)v166;
              v11 = 0;
              v13 = (void *)v39;
LABEL_108:
              v9 = v183;
              if (!a3)
                goto LABEL_114;
              goto LABEL_109;
            }
            createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 745, -2, 0, CFSTR("Failed to create path."), v40, v41, v42, v173);
            v165 = objc_claimAutoreleasedReturnValue();

            v153 = (void *)v165;
            v13 = 0;
LABEL_107:
            a3 = v175;
            goto LABEL_108;
          }
          -[PersonalizedImage imagePathURL](v179, "imagePathURL");
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 736, -2, v35, CFSTR("Failed to copy %@ to %@."), v162, v163, v164, (uint64_t)v161);
          v160 = objc_claimAutoreleasedReturnValue();

        }
        else
        {
          createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 731, -2, 0, CFSTR("Failed to create URL."), v29, v30, v31, v173);
          v160 = objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 725, -2, 0, CFSTR("Failed to create path."), v26, v27, v28, v173);
        v160 = objc_claimAutoreleasedReturnValue();

        v11 = 0;
      }
      v153 = (void *)v160;
      goto LABEL_107;
    }
    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeImageProperties:]", 719, -2, 0, CFSTR("Failed to query working directory path."), v21, v22, v23, v173);
    v155 = objc_claimAutoreleasedReturnValue();

    v13 = 0;
    v11 = 0;
LABEL_100:
    v153 = (void *)v155;
    if (!a3)
      goto LABEL_114;
    goto LABEL_109;
  }
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 1;
  v15 = v187;
LABEL_115:

  return v14;
}

- (BOOL)initializeDeviceAttributes:(id *)a3
{
  void *v5;
  const __CFDictionary *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  const __CFDictionary *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id *v53;
  void *v55;
  id *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  id *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  id v95;
  const __CFDictionary *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  void *v108;
  id *v109;
  void *v110;
  uint64_t v111;
  id *v112;
  uint64_t v113;
  id *v114;
  void *v115;
  void *v116;
  __CFString *v117;
  void *v118;
  void *v119;
  void *v120;
  CFTypeRef cf;
  const __CFString *v122;
  void *v123;
  _OWORD v124[10];
  uint64_t v125;

  v125 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  memset(v124, 0, sizeof(v124));
  v122 = CFSTR("PersonalizedImageType");
  -[PersonalizedImage imageVariant](self, "imageVariant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v123, &v122, 1);
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  -[PersonalizedImage remoteDevice](self, "remoteDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MobileStorageRemoteCopyPersonalizationIdentifiersWithError(v8, v6, &cf);

  }
  else
  {
    v9 = MobileStorageCopyPersonalizationIdentifiersWithError(v6, &cf);
  }
  v115 = v9;
  if (!v9
    && (mobileStorageErrorHasDomainAndErrorCode((void *)cf, CFSTR("com.apple.MobileStorage.ErrorDomain"), -5) & 1) == 0)
  {
    v22 = v6;
    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]", 816, -2, (void *)cf, CFSTR("Failed to query personalization identifiers."), v10, v11, v12, v111);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v118 = 0;
    v119 = 0;
    v24 = 0;
    v116 = 0;
    v120 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v16 = 0;
LABEL_19:
    v34 = 0;
    v35 = 0;
    v117 = 0;
    if (!a3)
      goto LABEL_40;
LABEL_39:
    v23 = objc_retainAutorelease(v23);
    v53 = a3;
    LOBYTE(a3) = 0;
    *v53 = v23;
    goto LABEL_40;
  }
  -[PersonalizedImage remoteDevice](self, "remoteDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)copy_remote_device_property();

  }
  else
  {
    v15 = (void *)MGCopyAnswer();
  }
  isNSString(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v119 = v15;
  if (!v16)
  {
    v22 = v6;
    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]", 828, -2, 0, CFSTR("Failed to copy value: %@"), v17, v18, v19, (uint64_t)CFSTR("HWModelStr"));
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v118 = 0;
    v24 = 0;
    v116 = 0;
    v120 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    goto LABEL_19;
  }
  -[PersonalizedImage remoteDevice](self, "remoteDevice");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    v21 = CFSTR("Bridge");
  else
    v21 = (__CFString *)MGCopyAnswer();
  v117 = v21;
  isNSString(v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v22 = v6;
    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]", 838, -2, 0, CFSTR("Failed to copy value: %@"), v28, v29, v30, (uint64_t)CFSTR("DeviceClass"));
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v118 = 0;
    v24 = 0;
    v116 = 0;
    v120 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    goto LABEL_38;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("UniqueChipID"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  isNSNumber(v31);
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
  }
  else
  {
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
      goto LABEL_24;
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = a3;
    v38 = copy_remote_device_property();

    v31 = (void *)v38;
    a3 = v37;
  }

LABEL_24:
  isNSNumber(v31);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v118 = v31;
  if (!v26)
  {
    v22 = v6;
    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]", 849, -2, 0, CFSTR("Failed to copy value: %@"), v39, v40, v41, (uint64_t)CFSTR("UniqueChipID"));
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v24 = 0;
LABEL_35:
    v116 = 0;
LABEL_36:
    v120 = 0;
LABEL_37:
    v25 = 0;
    v27 = 0;
    v16 = 0;
LABEL_38:
    v34 = 0;
    v35 = 0;
    if (!a3)
      goto LABEL_40;
    goto LABEL_39;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ChipID"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  isNSNumber(v24);
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
  }
  else
  {
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v44)
      goto LABEL_31;
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = a3;
    v46 = copy_remote_device_property();

    v24 = (void *)v46;
    a3 = v45;
  }

LABEL_31:
  isNSNumber(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    v22 = v6;
    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]", 858, -2, 0, CFSTR("Failed to copy value: %@"), v47, v48, v49, (uint64_t)CFSTR("ChipID"));
    v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("BoardId"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  isNSNumber(v50);
  v51 = objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    v52 = (void *)v51;
  }
  else
  {
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v55)
      goto LABEL_46;
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = a3;
    v57 = copy_remote_device_property();

    v50 = (void *)v57;
    a3 = v56;
  }

LABEL_46:
  isNSNumber(v50);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v116 = v50;
  if (!v26)
  {
    v22 = v6;
    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]", 867, -2, 0, CFSTR("Failed to copy value: %@"), v58, v59, v60, (uint64_t)CFSTR("BoardId"));
    v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SecurityDomain"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  isNSNumber(v120);
  v61 = objc_claimAutoreleasedReturnValue();
  if (v61)
  {
    v62 = (void *)v61;
  }
  else
  {
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v63)
      goto LABEL_53;
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = a3;
    v65 = copy_remote_device_property();

    v120 = (void *)v65;
    a3 = v64;
  }

LABEL_53:
  isNSNumber(v120);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    v22 = v6;
    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]", 876, -2, 0, CFSTR("Failed to copy value: %@"), v66, v67, v68, (uint64_t)CFSTR("SecurityDomain"));
    v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("EffectiveSecurityModeAp"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  isNSNumber(v27);
  v69 = objc_claimAutoreleasedReturnValue();
  v112 = a3;
  if (v69)
  {
    v70 = (void *)v69;
  }
  else
  {
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v71)
      goto LABEL_60;
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = copy_remote_device_property();

    v27 = (void *)v72;
  }

LABEL_60:
  isNSNumber(v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    v22 = v6;
    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]", 885, -2, 0, CFSTR("Failed to copy value: %@"), v73, v74, v75, (uint64_t)CFSTR("EffectiveSecurityModeAp"));
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v16 = 0;
LABEL_79:
    v34 = 0;
    v35 = 0;
    goto LABEL_80;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("EffectiveProductionStatusAp"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  isNSNumber(v16);
  v76 = objc_claimAutoreleasedReturnValue();
  if (v76)
  {
    v77 = (void *)v76;
  }
  else
  {
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v78)
      goto LABEL_67;
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = copy_remote_device_property();

    v16 = (void *)v79;
  }

LABEL_67:
  isNSNumber(v16);
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v80)
  {
    v22 = v6;
    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]", 894, -2, 0, CFSTR("Failed to copy value: %@"), v81, v82, v83, (uint64_t)CFSTR("EffectiveProductionStatusAp"));
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v25 = 0;
LABEL_78:
    v26 = 0;
    goto LABEL_79;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CertificateSecurityMode"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  isNSNumber(v25);
  v84 = objc_claimAutoreleasedReturnValue();
  if (v84)
  {
    v85 = (void *)v84;
  }
  else
  {
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v86)
      goto LABEL_74;
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = copy_remote_device_property();

    v25 = (void *)v87;
  }

LABEL_74:
  isNSNumber(v25);
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v88)
  {
    v22 = v6;
    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]", 903, -2, 0, CFSTR("Failed to copy value: %@"), v89, v90, v91, (uint64_t)CFSTR("CertificateSecurityMode"));
    v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_78;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CertificateProductionStatus"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  isNSNumber(v26);
  v92 = objc_claimAutoreleasedReturnValue();
  if (v92)
  {
    v93 = (void *)v92;
  }
  else
  {
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    v94 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v94)
      goto LABEL_85;
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = v9;
    v96 = v6;
    v97 = copy_remote_device_property();

    v26 = (void *)v97;
    v6 = v96;
    v9 = v95;
  }

LABEL_85:
  isNSNumber(v26);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Ap,SikaFuse"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    v101 = (void *)objc_claimAutoreleasedReturnValue();

    if (v101)
    {
      -[PersonalizedImage remoteDevice](self, "remoteDevice");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v6;
      v34 = MobileStorageRemoteCopyPersonalizationNonceWithError(v102, v6, &cf);

    }
    else
    {
      v22 = v6;
      v34 = (void *)MobileStorageCopyPersonalizationNonceWithError(v6, &cf);
    }
    isNSData(v34);
    v103 = (void *)objc_claimAutoreleasedReturnValue();

    if (v103)
    {
      -[PersonalizedImage remoteDevice](self, "remoteDevice");
      v107 = (void *)objc_claimAutoreleasedReturnValue();

      if (v107)
      {
        -[PersonalizedImage remoteDevice](self, "remoteDevice");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = copy_remote_device_property();

        v109 = (id *)v113;
      }
      else
      {
        v109 = (id *)MGCopyAnswer();
      }
      v114 = v109;
      isNSData(v109);
      v110 = (void *)objc_claimAutoreleasedReturnValue();

      if (v110)
      {
        a3 = v114;
      }
      else
      {
        a3 = (id *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v124, 160);

      }
      -[PersonalizedImage setDeviceClass:](self, "setDeviceClass:", v117);
      -[PersonalizedImage setHardwareModel:](self, "setHardwareModel:", v119);
      -[PersonalizedImage setEcid:](self, "setEcid:", v118);
      -[PersonalizedImage setChipID:](self, "setChipID:", v24);
      -[PersonalizedImage setBoardID:](self, "setBoardID:", v116);
      -[PersonalizedImage setSecurityDomain:](self, "setSecurityDomain:", v120);
      -[PersonalizedImage setEffectiveSecurityMode:](self, "setEffectiveSecurityMode:", v27);
      -[PersonalizedImage setEffectiveProductionStatus:](self, "setEffectiveProductionStatus:", v16);
      -[PersonalizedImage setCertificateSecurityMode:](self, "setCertificateSecurityMode:", v25);
      -[PersonalizedImage setCertificateProductionStatus:](self, "setCertificateProductionStatus:", v26);
      -[PersonalizedImage setImage4Supported:](self, "setImage4Supported:", MEMORY[0x24BDBD1C8]);
      -[PersonalizedImage setApNonce:](self, "setApNonce:", v34);
      -[PersonalizedImage setSepNonce:](self, "setSepNonce:", a3);
      -[PersonalizedImage setSikaFuse:](self, "setSikaFuse:", v35);

      v23 = 0;
      LOBYTE(a3) = 1;
      goto LABEL_40;
    }
    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]", 924, -2, (void *)cf, CFSTR("Failed to copy personalization nonce."), v104, v105, v106, v111);
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = v6;
    createMobileStorageError((uint64_t)"-[PersonalizedImage initializeDeviceAttributes:]", 912, -2, 0, CFSTR("Failed to copy value: %@"), v98, v99, v100, (uint64_t)CFSTR("CertificateProductionStatus"));
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v34 = 0;
  }
LABEL_80:
  a3 = v112;
  if (v112)
    goto LABEL_39;
LABEL_40:
  if (cf)
    CFRelease(cf);

  return (char)a3;
}

- (BOOL)mountImage:(id)a3 serverTicket:(id)a4 imageDigest:(id)a5 trustCacheURL:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  PersonalizedImage *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  int v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  BOOL v72;
  void *v73;
  void *v75;
  uint64_t v77;
  PersonalizedImage *v78;
  void *v79;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  CFTypeRef cf;
  uint8_t buf[4];
  _BYTE v88[10];
  _BYTE v89[10];
  void *v90;
  __int16 v91;
  void *v92;
  _QWORD v93[3];
  _QWORD v94[5];

  v94[3] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v85 = v13;
  cf = 0;
  v81 = v12;
  v83 = v14;
  if (!v11 || !v12 || !v13)
  {
    createMobileStorageError((uint64_t)"-[PersonalizedImage mountImage:serverTicket:imageDigest:trustCacheURL:error:]", 981, -2, 0, CFSTR("Invalid input(s)."), v15, v16, v17, v77);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v30 = 0;
    v82 = 0;
    v84 = 0;
    goto LABEL_42;
  }
  v18 = (uint64_t)v14;
  v19 = objc_alloc(MEMORY[0x24BDBCED8]);
  v93[0] = CFSTR("DeviceType");
  v93[1] = CFSTR("DiskImageType");
  v94[0] = CFSTR("DiskImage");
  v94[1] = CFSTR("Personalized");
  v93[2] = CFSTR("ImageSignature");
  v94[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v94, v93, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (void *)objc_msgSend(v19, "initWithDictionary:", v20);

  if (v18)
  {
    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfURL:", v18);
    if (!v21)
    {
      createMobileStorageError((uint64_t)"-[PersonalizedImage mountImage:serverTicket:imageDigest:trustCacheURL:error:]", 993, -2, 0, CFSTR("Failed to load %@."), v22, v23, v24, v18);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      v28 = 0;
      v29 = 0;
      v30 = 0;
      v82 = 0;
      goto LABEL_42;
    }
    v25 = (void *)v21;
    objc_msgSend(v84, "setObject:forKeyedSubscript:", v21, CFSTR("ImageTrustCache"));
  }
  else
  {
    v25 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    -[PersonalizedImage hardwareModel](self, "hardwareModel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PersonalizedImage deviceClass](self, "deviceClass");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PersonalizedImage ecid](self, "ecid");
    v33 = self;
    v34 = v25;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)v88 = v11;
    *(_WORD *)&v88[8] = 2112;
    *(_QWORD *)v89 = v31;
    *(_WORD *)&v89[8] = 2112;
    v90 = v32;
    v91 = 2112;
    v92 = v35;
    _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Preparing to mount %@ on %@ (deviceClass: %@ ecid: %@)", buf, 0x2Au);

    v25 = v34;
    self = v33;

  }
  -[PersonalizedImage remoteDevice](self, "remoteDevice");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[PersonalizedImage remoteDevice](self, "remoteDevice");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MobileStorageRemoteCopyDevicesWithError(v37, 0, &cf);

  }
  else
  {
    v27 = MobileStorageCopyDevicesWithError(0, &cf);
  }
  isNSArray(v27);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v82 = v25;
  if (!v38)
  {
    createMobileStorageError((uint64_t)"-[PersonalizedImage mountImage:serverTicket:imageDigest:trustCacheURL:error:]", 1010, -2, (void *)cf, CFSTR("Failed to copy device list."), v39, v40, v41, v77);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v29 = 0;
    v30 = 0;
    goto LABEL_42;
  }
  v78 = self;
  v79 = v11;
  if (!objc_msgSend(v27, "count"))
  {
    v28 = 0;
    v29 = 0;
    v30 = 0;
LABEL_36:
    -[PersonalizedImage remoteDevice](v78, "remoteDevice");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
    {
      -[PersonalizedImage remoteDevice](v78, "remoteDevice");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v79;
      objc_msgSend(v79, "path");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = MobileStorageRemoteMountWithError(v54, v55, v84, &cf);

      if (v56)
      {
        v57 = (void *)cf;
        objc_msgSend(v79, "path");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        createMobileStorageError((uint64_t)"-[PersonalizedImage mountImage:serverTicket:imageDigest:trustCacheURL:error:]", 1049, -2, v57, CFSTR("Failed to mount %@."), v59, v60, v61, (uint64_t)v58);
LABEL_41:
        v26 = (id)objc_claimAutoreleasedReturnValue();

LABEL_42:
        if (a7)
        {
          v26 = objc_retainAutorelease(v26);
          v72 = 0;
          v75 = 0;
          *a7 = v26;
        }
        else
        {
          v72 = 0;
          v75 = 0;
        }
LABEL_49:
        v48 = v30;
        v46 = v29;
        goto LABEL_50;
      }
      v75 = 0;
    }
    else
    {
      v11 = v79;
      objc_msgSend(v79, "path");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = (void *)MobileStorageMountWithError(v62, (const __CFDictionary *)v84, &cf, v63, v64, v65, v66, v67);

      if (!v75)
      {
        v68 = (void *)cf;
        objc_msgSend(v79, "path");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        createMobileStorageError((uint64_t)"-[PersonalizedImage mountImage:serverTicket:imageDigest:trustCacheURL:error:]", 1055, -2, v68, CFSTR("Failed to mount %@."), v69, v70, v71, (uint64_t)v58);
        goto LABEL_41;
      }
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "path");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v88 = v73;
      _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@ successfully mounted on device.", buf, 0xCu);

    }
    v26 = 0;
    v72 = 1;
    goto LABEL_49;
  }
  v42 = 0;
  v30 = 0;
  v29 = 0;
  v28 = 0;
  v43 = MEMORY[0x24BDACB70];
  while (1)
  {
    v44 = v28;
    objc_msgSend(v27, "objectAtIndexedSubscript:", v42);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    isNSDictionary(v28);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v45)
    {
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        v50 = objc_msgSend(v27, "count");
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v88 = v42;
        *(_WORD *)&v88[4] = 1024;
        *(_DWORD *)&v88[6] = v50;
        _os_log_debug_impl(&dword_2126BE000, v43, OS_LOG_TYPE_DEBUG, "Failed to retrieve entry %d of %d.", buf, 0xEu);
      }
      goto LABEL_31;
    }
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("DeviceType"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    isNSString(v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v47)
    {
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        v51 = objc_msgSend(v27, "count");
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v88 = CFSTR("DeviceType");
        *(_WORD *)&v88[8] = 1024;
        *(_DWORD *)v89 = v42 + 1;
        *(_WORD *)&v89[4] = 1024;
        *(_DWORD *)&v89[6] = v51;
        _os_log_debug_impl(&dword_2126BE000, v43, OS_LOG_TYPE_DEBUG, "Invalid value %@ for entry %d of %d.", buf, 0x18u);
      }
      goto LABEL_27;
    }
    if (objc_msgSend(v46, "isEqualToString:", CFSTR("DiskImage")))
      break;
LABEL_27:
    v29 = v46;
LABEL_31:
    if (++v42 >= (unint64_t)objc_msgSend(v27, "count"))
      goto LABEL_36;
  }
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("ImageSignature"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  isNSData(v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v49)
  {
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      v52 = objc_msgSend(v27, "count");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v88 = CFSTR("ImageSignature");
      *(_WORD *)&v88[8] = 1024;
      *(_DWORD *)v89 = v42 + 1;
      *(_WORD *)&v89[4] = 1024;
      *(_DWORD *)&v89[6] = v52;
      _os_log_debug_impl(&dword_2126BE000, v43, OS_LOG_TYPE_DEBUG, "Invalid value %@ for entry %d of %d.", buf, 0x18u);
    }
    goto LABEL_30;
  }
  if (!objc_msgSend(v85, "isEqualToData:", v48))
  {
LABEL_30:
    v29 = v46;
    v30 = v48;
    goto LABEL_31;
  }
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("MountPath"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v11 = v79;
    -[PersonalizedImage mountImage:serverTicket:imageDigest:trustCacheURL:error:].cold.1(v79, (uint64_t)v75);
    v26 = 0;
    v72 = 1;
  }
  else
  {
    v26 = 0;
    v72 = 1;
    v11 = v79;
  }
LABEL_50:
  if (cf)
    CFRelease(cf);

  return v72;
}

- (BOOL)mountImage:(id *)a3
{
  _BOOL4 v4;
  id v5;
  void *v6;
  _BOOL4 v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  char v25;
  BOOL v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  PersonalizedImage *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  BOOL v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v90;
  id v91;
  id v92;
  id v93;
  id v94;
  CFTypeRef cf;
  _QWORD v96[10];
  _QWORD v97[10];
  _QWORD v98[4];
  _QWORD v99[4];
  _QWORD v100[5];
  _QWORD v101[7];

  v101[5] = *MEMORY[0x24BDAC8D0];
  v94 = 0;
  cf = 0;
  v4 = -[PersonalizedImage initializeDeviceAttributes:](self, "initializeDeviceAttributes:", &v94);
  v5 = v94;
  v6 = v5;
  if (!v4)
  {
    v12 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v90 = 0;
    v23 = 0;
    v8 = v5;
    goto LABEL_14;
  }
  v93 = v5;
  v7 = -[PersonalizedImage initializeImageProperties:](self, "initializeImageProperties:", &v93);
  v8 = v93;

  if (!v7)
  {
    v12 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v90 = 0;
    v23 = 0;
    goto LABEL_14;
  }
  if (mountImage__onceToken != -1)
    dispatch_once(&mountImage__onceToken, &__block_literal_global_0);
  v12 = (const void *)AMAuthInstallCreate();
  if (!v12)
  {
    createMobileStorageError((uint64_t)"-[PersonalizedImage mountImage:]", 1115, -2, 0, CFSTR("AMAuthInstallCreate failed."), v9, v10, v11, v79);
    goto LABEL_11;
  }
  -[PersonalizedImage signingServerURL](self, "signingServerURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = AMAuthInstallSetSigningServerURL();

  if ((_DWORD)v14)
  {
    convertLibAuthInstallError(v14);
    createMobileStorageError((uint64_t)"-[PersonalizedImage mountImage:]", 1123, -2, 0, CFSTR("AMAuthInstallSetSigningServerURL failed: %d (%s)"), v15, v16, v17, v14);
LABEL_11:
    v24 = objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
LABEL_12:
    v22 = 0;
    v90 = 0;
    v23 = 0;
    goto LABEL_13;
  }
  if (-[PersonalizedImage useCredentials](self, "useCredentials"))
  {
    v28 = AMAuthInstallSsoEnable();
    if ((_DWORD)v28)
    {
      v29 = v28;
      convertLibAuthInstallError(v28);
      createMobileStorageError((uint64_t)"-[PersonalizedImage mountImage:]", 1132, -2, 0, CFSTR("AMAuthInstallSsoEnable failed: %d (%s)"), v30, v31, v32, v29);
      goto LABEL_11;
    }
  }
  -[PersonalizedImage imagePathURL](self, "imagePathURL");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v8;
  -[PersonalizedImage digestFile:digestLength:error:](self, "digestFile:digestLength:error:", v33, -[PersonalizedImage digestLength](self, "digestLength"), &v92);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v92;

  if (!v21)
  {
    -[PersonalizedImage imagePathURL](self, "imagePathURL");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    createMobileStorageError((uint64_t)"-[PersonalizedImage mountImage:]", 1141, -2, v34, CFSTR("Failed to digest %@."), v38, v39, v40, (uint64_t)v8);
    v24 = objc_claimAutoreleasedReturnValue();

    v18 = 0;
    v19 = 0;
    v20 = 0;
    goto LABEL_12;
  }
  -[PersonalizedImage trustCacheURL](self, "trustCacheURL");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v90 = v21;
  if (v35)
  {
    -[PersonalizedImage trustCacheURL](self, "trustCacheURL");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v34;
    -[PersonalizedImage digestFile:digestLength:error:](self, "digestFile:digestLength:error:", v36, -[PersonalizedImage digestLength](self, "digestLength"), &v91);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v91;

    if (!v23)
    {
      -[PersonalizedImage trustCacheURL](self, "trustCacheURL");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      createMobileStorageError((uint64_t)"-[PersonalizedImage mountImage:]", 1150, -2, v37, CFSTR("Failed to digest %@"), v76, v77, v78, (uint64_t)v8);
      v24 = objc_claimAutoreleasedReturnValue();

      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      goto LABEL_13;
    }
    v80 = v37;
  }
  else
  {
    v80 = v34;
    v23 = 0;
  }
  v41 = *MEMORY[0x24BEDA890];
  v42 = *MEMORY[0x24BEDA8B8];
  v100[0] = *MEMORY[0x24BEDA890];
  v100[1] = v42;
  v86 = v42;
  v101[0] = v21;
  v101[1] = MEMORY[0x24BDBD1C8];
  v43 = *MEMORY[0x24BEDA898];
  v100[2] = *MEMORY[0x24BEDA898];
  -[PersonalizedImage effectiveProductionStatus](self, "effectiveProductionStatus");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v101[2] = v44;
  v45 = *MEMORY[0x24BEDA8A0];
  v100[3] = *MEMORY[0x24BEDA8A0];
  -[PersonalizedImage effectiveSecurityMode](self, "effectiveSecurityMode");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v101[3] = v46;
  v100[4] = *MEMORY[0x24BEDA8A8];
  -[PersonalizedImage imageVariant](self, "imageVariant");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v101[4] = v47;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v101, v100, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v98[0] = v41;
    v98[1] = v86;
    v99[0] = v23;
    v99[1] = MEMORY[0x24BDBD1C8];
    v98[2] = v43;
    -[PersonalizedImage effectiveProductionStatus](self, "effectiveProductionStatus");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v99[2] = v48;
    v98[3] = v45;
    -[PersonalizedImage effectiveSecurityMode](self, "effectiveSecurityMode");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v99[3] = v49;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v99, v98, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0;
  }
  v50 = (void *)MEMORY[0x24BDBCED8];
  v96[0] = *MEMORY[0x24BEDA810];
  -[PersonalizedImage certificateSecurityMode](self, "certificateSecurityMode");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v97[0] = v87;
  v96[1] = *MEMORY[0x24BEDA7F8];
  -[PersonalizedImage certificateProductionStatus](self, "certificateProductionStatus");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v97[1] = v84;
  v96[2] = *MEMORY[0x24BEDA808];
  -[PersonalizedImage securityDomain](self, "securityDomain");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v97[2] = v83;
  v96[3] = *MEMORY[0x24BEDA7C8];
  -[PersonalizedImage boardID](self, "boardID");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v97[3] = v82;
  v96[4] = *MEMORY[0x24BEDA7D0];
  -[PersonalizedImage chipID](self, "chipID");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v97[4] = v81;
  v96[5] = *MEMORY[0x24BEDA7D8];
  -[PersonalizedImage ecid](self, "ecid");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v97[5] = v51;
  v96[6] = *MEMORY[0x24BEDA800];
  -[PersonalizedImage image4Supported](self, "image4Supported");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v97[6] = v52;
  v96[7] = *MEMORY[0x24BEDA7E8];
  -[PersonalizedImage apNonce](self, "apNonce");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = *MEMORY[0x24BEDA8C0];
  v97[7] = v53;
  v97[8] = MEMORY[0x24BDBD1C0];
  v55 = *MEMORY[0x24BEDA7A8];
  v96[8] = v54;
  v96[9] = v55;
  v97[9] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v97, v96, 10);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "dictionaryWithDictionary:", v56);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[PersonalizedImage sepNonce](self, "sepNonce");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    -[PersonalizedImage sepNonce](self, "sepNonce");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v58, *MEMORY[0x24BEDA818]);

  }
  -[PersonalizedImage sikaFuse](self, "sikaFuse");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    -[PersonalizedImage sikaFuse](self, "sikaFuse");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v60, *MEMORY[0x24BEDA820]);

  }
  if (v21)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("LoadableTrustCache"));
  v61 = AMAuthInstallRequestSendSync();
  if ((_DWORD)v61)
  {
    v62 = v61;
    convertLibAuthInstallError(v61);
    createMobileStorageError((uint64_t)"-[PersonalizedImage mountImage:]", 1204, -2, 0, CFSTR("AMAuthInstallRequestSendSync failed: %d (%s)"), v63, v64, v65, v62);
    v24 = objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v22 = 0;
  }
  else
  {
    v19 = (id)cf;
    objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x24BEDA7E0]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    isNSData(v22);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    if (v66)
    {
      -[PersonalizedImage imagePathURL](self, "imagePathURL");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      -[PersonalizedImage trustCacheURL](self, "trustCacheURL");
      v70 = objc_claimAutoreleasedReturnValue();
      v71 = self;
      v72 = (void *)v70;
      v85 = -[PersonalizedImage mountImage:serverTicket:imageDigest:trustCacheURL:error:](v71, "mountImage:serverTicket:imageDigest:trustCacheURL:error:", v88, v22, v90);
      v8 = v80;

      if (v85)
      {
        v25 = 1;
LABEL_17:
        CFRelease(v12);
        v26 = v25;
        goto LABEL_18;
      }
      createMobileStorageError((uint64_t)"-[PersonalizedImage mountImage:]", 1221, -2, v8, CFSTR("Failed to mount image."), v73, v74, v75, v79);
      v24 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    createMobileStorageError((uint64_t)"-[PersonalizedImage mountImage:]", 1214, -2, 0, CFSTR("Invalid server ticket in response: %@"), v67, v68, v69, (uint64_t)v19);
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v8 = v80;
LABEL_13:

  v8 = (id)v24;
LABEL_14:
  if (a3)
    *a3 = objc_retainAutorelease(v8);
  v25 = 0;
  v26 = 0;
  if (v12)
    goto LABEL_17;
LABEL_18:
  if (cf)
    CFRelease(cf);
  cf = 0;

  return v26;
}

uint64_t __32__PersonalizedImage_mountImage___block_invoke()
{
  AMAuthInstallLogSetHandler();
  return AMAuthInstallSsoInitialize();
}

- (OS_remote_device)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDevice, a3);
}

- (NSURL)bundlePathURL
{
  return self->_bundlePathURL;
}

- (void)setBundlePathURL:(id)a3
{
  objc_storeStrong((id *)&self->_bundlePathURL, a3);
}

- (NSDictionary)mountedVolumeEntry
{
  return self->_mountedVolumeEntry;
}

- (void)setMountedVolumeEntry:(id)a3
{
  objc_storeStrong((id *)&self->_mountedVolumeEntry, a3);
}

- (NSURL)imagePathURL
{
  return self->_imagePathURL;
}

- (void)setImagePathURL:(id)a3
{
  objc_storeStrong((id *)&self->_imagePathURL, a3);
}

- (NSString)imageVariant
{
  return self->_imageVariant;
}

- (void)setImageVariant:(id)a3
{
  objc_storeStrong((id *)&self->_imageVariant, a3);
}

- (NSURL)trustCacheURL
{
  return self->_trustCacheURL;
}

- (void)setTrustCacheURL:(id)a3
{
  objc_storeStrong((id *)&self->_trustCacheURL, a3);
}

- (NSNumber)ecid
{
  return self->_ecid;
}

- (void)setEcid:(id)a3
{
  objc_storeStrong((id *)&self->_ecid, a3);
}

- (NSNumber)chipID
{
  return self->_chipID;
}

- (void)setChipID:(id)a3
{
  objc_storeStrong((id *)&self->_chipID, a3);
}

- (NSNumber)boardID
{
  return self->_boardID;
}

- (void)setBoardID:(id)a3
{
  objc_storeStrong((id *)&self->_boardID, a3);
}

- (NSNumber)securityDomain
{
  return self->_securityDomain;
}

- (void)setSecurityDomain:(id)a3
{
  objc_storeStrong((id *)&self->_securityDomain, a3);
}

- (NSNumber)certificateSecurityMode
{
  return self->_certificateSecurityMode;
}

- (void)setCertificateSecurityMode:(id)a3
{
  objc_storeStrong((id *)&self->_certificateSecurityMode, a3);
}

- (NSNumber)certificateProductionStatus
{
  return self->_certificateProductionStatus;
}

- (void)setCertificateProductionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_certificateProductionStatus, a3);
}

- (NSNumber)effectiveSecurityMode
{
  return self->_effectiveSecurityMode;
}

- (void)setEffectiveSecurityMode:(id)a3
{
  objc_storeStrong((id *)&self->_effectiveSecurityMode, a3);
}

- (NSNumber)effectiveProductionStatus
{
  return self->_effectiveProductionStatus;
}

- (void)setEffectiveProductionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_effectiveProductionStatus, a3);
}

- (NSNumber)image4Supported
{
  return self->_image4Supported;
}

- (void)setImage4Supported:(id)a3
{
  objc_storeStrong((id *)&self->_image4Supported, a3);
}

- (NSData)apNonce
{
  return self->_apNonce;
}

- (void)setApNonce:(id)a3
{
  objc_storeStrong((id *)&self->_apNonce, a3);
}

- (NSData)sepNonce
{
  return self->_sepNonce;
}

- (void)setSepNonce:(id)a3
{
  objc_storeStrong((id *)&self->_sepNonce, a3);
}

- (NSNumber)sikaFuse
{
  return self->_sikaFuse;
}

- (void)setSikaFuse:(id)a3
{
  objc_storeStrong((id *)&self->_sikaFuse, a3);
}

- (NSString)hardwareModel
{
  return self->_hardwareModel;
}

- (void)setHardwareModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (unsigned)digestLength
{
  return self->_digestLength;
}

- (void)setDigestLength:(unsigned int)a3
{
  self->_digestLength = a3;
}

- (BOOL)useCredentials
{
  return self->_useCredentials;
}

- (void)setUseCredentials:(BOOL)a3
{
  self->_useCredentials = a3;
}

- (NSURL)signingServerURL
{
  return self->_signingServerURL;
}

- (void)setSigningServerURL:(id)a3
{
  objc_storeStrong((id *)&self->_signingServerURL, a3);
}

- (NSURL)userProvidedBundleMountPathURL
{
  return self->_userProvidedBundleMountPathURL;
}

- (void)setUserProvidedBundleMountPathURL:(id)a3
{
  objc_storeStrong((id *)&self->_userProvidedBundleMountPathURL, a3);
}

- (NSURL)userProvidedImagePathURL
{
  return self->_userProvidedImagePathURL;
}

- (void)setUserProvidedImagePathURL:(id)a3
{
  objc_storeStrong((id *)&self->_userProvidedImagePathURL, a3);
}

- (BOOL)skipLoadingLaunchDaemons
{
  return self->_skipLoadingLaunchDaemons;
}

- (void)setSkipLoadingLaunchDaemons:(BOOL)a3
{
  self->_skipLoadingLaunchDaemons = a3;
}

- (NSString)imageType
{
  return self->_imageType;
}

- (void)setImageType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageType, 0);
  objc_storeStrong((id *)&self->_userProvidedImagePathURL, 0);
  objc_storeStrong((id *)&self->_userProvidedBundleMountPathURL, 0);
  objc_storeStrong((id *)&self->_signingServerURL, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_hardwareModel, 0);
  objc_storeStrong((id *)&self->_sikaFuse, 0);
  objc_storeStrong((id *)&self->_sepNonce, 0);
  objc_storeStrong((id *)&self->_apNonce, 0);
  objc_storeStrong((id *)&self->_image4Supported, 0);
  objc_storeStrong((id *)&self->_effectiveProductionStatus, 0);
  objc_storeStrong((id *)&self->_effectiveSecurityMode, 0);
  objc_storeStrong((id *)&self->_certificateProductionStatus, 0);
  objc_storeStrong((id *)&self->_certificateSecurityMode, 0);
  objc_storeStrong((id *)&self->_securityDomain, 0);
  objc_storeStrong((id *)&self->_boardID, 0);
  objc_storeStrong((id *)&self->_chipID, 0);
  objc_storeStrong((id *)&self->_ecid, 0);
  objc_storeStrong((id *)&self->_trustCacheURL, 0);
  objc_storeStrong((id *)&self->_imageVariant, 0);
  objc_storeStrong((id *)&self->_imagePathURL, 0);
  objc_storeStrong((id *)&self->_mountedVolumeEntry, 0);
  objc_storeStrong((id *)&self->_bundlePathURL, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
}

- (void)mountImage:(void *)a1 serverTicket:(uint64_t)a2 imageDigest:trustCacheURL:error:.cold.1(void *a1, uint64_t a2)
{
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%@ already mounted at %@.", (uint8_t *)&v4, 0x16u);

}

@end
