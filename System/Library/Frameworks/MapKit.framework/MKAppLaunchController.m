@implementation MKAppLaunchController

+ (id)sharedController
{
  if (qword_1ECE2D9C8 != -1)
    dispatch_once(&qword_1ECE2D9C8, &__block_literal_global_40);
  return (id)_MergedGlobals_143;
}

void __41__MKAppLaunchController_sharedController__block_invoke()
{
  MKAppLaunchController *v0;
  void *v1;

  v0 = objc_alloc_init(MKAppLaunchController);
  v1 = (void *)_MergedGlobals_143;
  _MergedGlobals_143 = (uint64_t)v0;

}

- (void)lookUpAppStoreURLForBundle:(id)a3 usingTarget:(int)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  int v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "length"))
  {
    +[MKAppleMediaServices sharedInstance](MKAppleMediaServices, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __82__MKAppLaunchController_lookUpAppStoreURLForBundle_usingTarget_completionHandler___block_invoke;
    v12[3] = &unk_1E20DA770;
    v12[4] = self;
    v13 = v9;
    v14 = a4;
    objc_msgSend(v10, "appleMediaServicesResultsWithBundleIdentifiers:source:completion:", v11, 1, v12);

  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }

}

void __82__MKAppLaunchController_lookUpAppStoreURLForBundle_usingTarget_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  v18 = a2;
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(v18, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "webURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "webURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("MKAppleMediaServices returned with an error %@. Opening webURL instead: %@"), v5, v7);

    objc_msgSend(*(id *)(a1 + 32), "webURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(uint64_t, void *, _QWORD))(v10 + 16))(v10, v8, 0);
    +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "openURL:completionHandler:", v8, 0);

    objc_msgSend(v8, "host");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (v13)
    {
      +[MKMapService sharedService](MKMapService, "sharedService");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(unsigned int *)(a1 + 48);
      objc_msgSend(v8, "host");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "captureUserAction:onTarget:eventValue:", 6050, v15, v16);

    }
    goto LABEL_12;
  }
  NSLog(CFSTR("Error launching iTMS - %@"), v5);
  v17 = *(_QWORD *)(a1 + 40);
  if (v17)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v17 + 16))(v17, 0, 0);
  v8 = 0;
LABEL_12:

}

+ (void)launchAttributionURLs:(id)a3 withAttribution:(id)a4 completionHandler:(id)a5
{
  objc_msgSend(a1, "launchAttributionURLs:withAttribution:usingTarget:completionHandler:", a3, a4, 201, a5);
}

+ (void)launchAttributionURLs:(id)a3 withAttribution:(id)a4 usingTarget:(int)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD, void *, void *);
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  int v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  uint64_t v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  int v60;
  id v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  void *v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  id v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unsigned int v96;
  id v97;
  void (**v98)(_QWORD, void *, void *);
  void *v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  id v105;
  id obj;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  uint64_t v157;

  v157 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(_QWORD, void *, void *))a6;
  if (objc_msgSend(v10, "count"))
  {
    v96 = a5;
    v89 = a1;
    objc_msgSend(a1, "sharedController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWebURL:", 0);
    v145 = 0u;
    v146 = 0u;
    v143 = 0u;
    v144 = 0u;
    obj = v10;
    v99 = v13;
    v100 = v11;
    v101 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v143, v156, 16);
    v97 = v10;
    v98 = v12;
    if (v101)
    {
      v104 = 0;
      v14 = *(_QWORD *)v144;
      v15 = *MEMORY[0x1E0D26400];
      do
      {
        v16 = 0;
        v17 = v101;
        do
        {
          if (*(_QWORD *)v144 != v14)
            objc_enumerationMutation(obj);
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(*((_QWORD *)&v143 + 1) + 8 * v16));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "scheme");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v19, "isEqualToString:", CFSTR("http")) & 1) != 0
            || (objc_msgSend(v18, "scheme"),
                v20 = (void *)objc_claimAutoreleasedReturnValue(),
                v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("https")),
                v20,
                v21))
          {
            objc_msgSend(v13, "webURL");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v22)
              objc_msgSend(v13, "setWebURL:", v18);
          }
          else if (objc_msgSend(v19, "isEqualToString:", v15))
          {
            if (!v104)
            {
              objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "applicationsAvailableForOpeningURL:", v18);
              v104 = (void *)objc_claimAutoreleasedReturnValue();

            }
            v141 = 0u;
            v142 = 0u;
            v139 = 0u;
            v140 = 0u;
            objc_msgSend(v11, "attributionApps");
            v105 = (id)objc_claimAutoreleasedReturnValue();
            v90 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v139, v155, 16);
            if (v90)
            {
              v24 = *(_QWORD *)v140;
              v83 = v15;
              v86 = v14;
              v82 = *(_QWORD *)v140;
              do
              {
                v25 = 0;
                do
                {
                  if (*(_QWORD *)v140 != v24)
                    objc_enumerationMutation(v105);
                  v93 = v25;
                  objc_msgSend(*(id *)(*((_QWORD *)&v139 + 1) + 8 * v25), "appBundleIdentifier");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v135 = 0u;
                  v136 = 0u;
                  v137 = 0u;
                  v138 = 0u;
                  v27 = v104;
                  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v135, v154, 16);
                  if (v28)
                  {
                    v29 = v28;
                    v30 = *(_QWORD *)v136;
                    do
                    {
                      for (i = 0; i != v29; ++i)
                      {
                        if (*(_QWORD *)v136 != v30)
                          objc_enumerationMutation(v27);
                        objc_msgSend(*(id *)(*((_QWORD *)&v135 + 1) + 8 * i), "bundleIdentifier");
                        v32 = (void *)objc_claimAutoreleasedReturnValue();
                        v33 = objc_msgSend(v32, "isEqualToString:", v26);

                        if (v33)
                        {
                          v12 = v98;
                          if (v98)
                            v98[2](v98, v18, v26);
                          +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
                          v36 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v36, "openURL:bundleIdentifier:completionHandler:", v18, v26, 0);

                          +[MKMapService sharedService](MKMapService, "sharedService");
                          v37 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v18, "absoluteString");
                          v38 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v37, "captureUserAction:onTarget:eventValue:", 6050, v96, v38);

                          v104 = v27;
                          v13 = v99;
                          v11 = v100;
LABEL_38:

                          goto LABEL_108;
                        }
                      }
                      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v135, v154, 16);
                    }
                    while (v29);
                  }

                  v25 = v93 + 1;
                  v13 = v99;
                  v11 = v100;
                  v15 = v83;
                  v14 = v86;
                  v17 = v101;
                  v24 = v82;
                }
                while (v93 + 1 != v90);
                v90 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v139, v155, 16);
              }
              while (v90);
            }

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "canOpenURL:", v18);

            if (v35)
            {
              v12 = v98;
              if (v98)
                v98[2](v98, v18, 0);
              +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v80, "openURL:completionHandler:", v18, 0);

              +[MKMapService sharedService](MKMapService, "sharedService");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "absoluteString");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v105 = v81;
              objc_msgSend(v81, "captureUserAction:onTarget:eventValue:", 6050, v96, v26);
              goto LABEL_38;
            }
            v17 = v101;
          }

          ++v16;
        }
        while (v16 != v17);
        v101 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v143, v156, 16);
      }
      while (v101);
    }
    else
    {
      v104 = 0;
    }

    if (GEOConfigGetBOOL() && objc_msgSend(v11, "shouldOpenInAppStore"))
    {
      v133 = 0u;
      v134 = 0u;
      v131 = 0u;
      v132 = 0u;
      v39 = obj;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v131, v153, 16);
      if (v40)
      {
        v41 = *(_QWORD *)v132;
        v42 = 0x1E0C99000uLL;
        v84 = *(_QWORD *)v132;
        v87 = v39;
        do
        {
          v43 = 0;
          v91 = v40;
          do
          {
            if (*(_QWORD *)v132 != v41)
              objc_enumerationMutation(v39);
            objc_msgSend(*(id *)(v42 + 3736), "URLWithString:", *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * v43));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v127 = 0u;
            v128 = 0u;
            v129 = 0u;
            v130 = 0u;
            objc_msgSend(v11, "attributionApps");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v102 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v127, v152, 16);
            if (v102)
            {
              v44 = *(_QWORD *)v128;
              v94 = *(_QWORD *)v128;
              do
              {
                for (j = 0; j != v102; ++j)
                {
                  if (*(_QWORD *)v128 != v44)
                    objc_enumerationMutation(v19);
                  v46 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * j);
                  v123 = 0u;
                  v124 = 0u;
                  v125 = 0u;
                  v126 = 0u;
                  objc_msgSend(v46, "handledSchemes");
                  v105 = (id)objc_claimAutoreleasedReturnValue();
                  v47 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v123, v151, 16);
                  if (v47)
                  {
                    v48 = v47;
                    v49 = *(_QWORD *)v124;
                    do
                    {
                      for (k = 0; k != v48; ++k)
                      {
                        if (*(_QWORD *)v124 != v49)
                          objc_enumerationMutation(v105);
                        v51 = *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * k);
                        objc_msgSend(v18, "scheme");
                        v52 = (void *)objc_claimAutoreleasedReturnValue();
                        LODWORD(v51) = objc_msgSend(v52, "isEqualToString:", v51);

                        if ((_DWORD)v51)
                        {
LABEL_102:
                          objc_msgSend(v89, "sharedController");
                          v76 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v46, "appBundleIdentifier");
                          v77 = (void *)objc_claimAutoreleasedReturnValue();
                          v12 = v98;
                          objc_msgSend(v76, "lookUpAppStoreURLForBundle:usingTarget:completionHandler:", v77, v96, v98);

                          goto LABEL_107;
                        }
                      }
                      v48 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v123, v151, 16);
                    }
                    while (v48);
                  }

                  v11 = v100;
                  v44 = v94;
                }
                v102 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v127, v152, 16);
              }
              while (v102);
            }

            ++v43;
            v41 = v84;
            v39 = v87;
            v42 = 0x1E0C99000;
          }
          while (v43 != v91);
          v40 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v131, v153, 16);
        }
        while (v40);
      }

    }
    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    v53 = obj;
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v119, v150, 16);
    if (!v54)
      goto LABEL_74;
    v55 = v54;
    v56 = *(_QWORD *)v120;
LABEL_67:
    v57 = 0;
    while (1)
    {
      if (*(_QWORD *)v120 != v56)
        objc_enumerationMutation(v53);
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * v57));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "scheme");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v58, "isEqualToString:", CFSTR("http")))
        break;
      objc_msgSend(v18, "scheme");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v59, "isEqualToString:", CFSTR("https"));

      if (v60)
        goto LABEL_104;

      if (v55 == ++v57)
      {
        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v119, v150, 16);
        if (!v55)
        {
LABEL_74:

          v117 = 0u;
          v118 = 0u;
          v115 = 0u;
          v116 = 0u;
          v61 = v53;
          v103 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v115, v149, 16);
          if (!v103)
          {
            v13 = v99;
            v11 = v100;
            v12 = v98;
            goto LABEL_109;
          }
          v62 = *(_QWORD *)v116;
          v63 = 0x1E0C99000uLL;
          v12 = v98;
          v13 = v99;
          while (2)
          {
            v64 = 0;
LABEL_77:
            if (*(_QWORD *)v116 != v62)
              objc_enumerationMutation(v61);
            objc_msgSend(*(id *)(v63 + 3736), "URLWithString:", *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * v64));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "scheme");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v19, "isEqualToString:", CFSTR("http")) & 1) != 0)
            {
LABEL_80:

            }
            else
            {
              objc_msgSend(v18, "scheme");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = objc_msgSend(v65, "isEqualToString:", CFSTR("https"));

              if ((v66 & 1) == 0)
              {
                v113 = 0u;
                v114 = 0u;
                v111 = 0u;
                v112 = 0u;
                objc_msgSend(v100, "attributionApps");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v95 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v111, v148, 16);
                if (v95)
                {
                  v85 = v62;
                  v88 = v61;
                  v67 = *(_QWORD *)v112;
                  v92 = *(_QWORD *)v112;
                  while (2)
                  {
                    v68 = 0;
                    do
                    {
                      if (*(_QWORD *)v112 != v67)
                        objc_enumerationMutation(v19);
                      v46 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * v68);
                      v107 = 0u;
                      v108 = 0u;
                      v109 = 0u;
                      v110 = 0u;
                      objc_msgSend(v46, "handledSchemes");
                      v105 = (id)objc_claimAutoreleasedReturnValue();
                      v69 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v107, v147, 16);
                      if (v69)
                      {
                        v70 = v69;
                        v71 = *(_QWORD *)v108;
LABEL_91:
                        v72 = 0;
                        while (1)
                        {
                          if (*(_QWORD *)v108 != v71)
                            objc_enumerationMutation(v105);
                          v73 = *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * v72);
                          objc_msgSend(v18, "scheme");
                          v74 = (void *)objc_claimAutoreleasedReturnValue();
                          LOBYTE(v73) = objc_msgSend(v74, "isEqualToString:", v73);

                          if ((v73 & 1) != 0)
                            goto LABEL_102;
                          if (v70 == ++v72)
                          {
                            v70 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v107, v147, 16);
                            if (v70)
                              goto LABEL_91;
                            break;
                          }
                        }
                      }

                      ++v68;
                      v67 = v92;
                      v12 = v98;
                      v13 = v99;
                    }
                    while (v68 != v95);
                    v95 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v111, v148, 16);
                    if (v95)
                      continue;
                    break;
                  }
                  v62 = v85;
                  v61 = v88;
                  v63 = 0x1E0C99000;
                }
                goto LABEL_80;
              }
            }

            if (++v64 == v103)
            {
              v75 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v115, v149, 16);
              v103 = v75;
              if (!v75)
              {
                v11 = v100;
                goto LABEL_109;
              }
              continue;
            }
            goto LABEL_77;
          }
        }
        goto LABEL_67;
      }
    }

LABEL_104:
    objc_msgSend(v89, "sharedController");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setWebURL:", v18);

    v12 = v98;
    if (v98)
      v98[2](v98, v18, 0);
    +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "openURL:completionHandler:", v18, 0);

    +[MKMapService sharedService](MKMapService, "sharedService");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "absoluteString");
    v105 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "captureUserAction:onTarget:eventValue:", 6050, v96);
LABEL_107:
    v13 = v99;
    v11 = v100;
LABEL_108:

LABEL_109:
    v10 = v97;
  }

}

- (NSURL)webURL
{
  return self->webURL;
}

- (void)setWebURL:(id)a3
{
  objc_storeStrong((id *)&self->webURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->webURL, 0);
  objc_storeStrong((id *)&self->_webURLString, 0);
}

@end
