@implementation INSystemAppMapper

- (INSystemAppMapper)init
{
  INSystemAppMapper *v2;
  INSystemAppMapper *v3;
  uint64_t v4;
  uint64_t **p_mapping;
  char *v6;
  char *v7;
  char *v8;
  uint64_t **v9;
  uint64_t **v10;
  uint64_t **v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSDictionary *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  NSDictionary *bundleIdentifierGroupingForIntentExecution;
  INSystemAppMapper *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  INSystemAppMapper *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  void *__p[2];
  char v89;
  objc_super v90;
  _BYTE v91[128];
  void *v92;
  _QWORD v93[2];
  void *v94;
  void *v95;
  _QWORD v96[2];
  _QWORD v97[3];
  void *v98;
  _QWORD v99[4];
  void *v100;
  void *v101;
  _QWORD v102[2];
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  _QWORD v107[10];

  v107[8] = *MEMORY[0x1E0C80C00];
  v90.receiver = self;
  v90.super_class = (Class)INSystemAppMapper;
  v2 = -[INSystemAppMapper init](&v90, sel_init);
  v83 = v2;
  v3 = v2;
  if (v2)
  {
    v4 = 0;
    p_mapping = (uint64_t **)&v2->_mapping;
    do
    {
      v6 = (&INSystemAppsMapping)[v4];
      v7 = (&INSystemAppsMapping)[v4 + 1];
      v8 = (&INSystemAppsMapping)[v4 + 2];
      std::string::basic_string[abi:ne180100]<0>(__p, v6);
      v9 = std::__tree<std::__value_type<std::string,INSystemApp>,std::__map_value_compare<std::string,std::__value_type<std::string,INSystemApp>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,INSystemApp>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(p_mapping, __p, (uint64_t)__p);
      v9[7] = (uint64_t *)v6;
      v9[8] = (uint64_t *)v7;
      v9[9] = (uint64_t *)v8;
      if (v89 < 0)
        operator delete(__p[0]);
      std::string::basic_string[abi:ne180100]<0>(__p, v7);
      v10 = std::__tree<std::__value_type<std::string,INSystemApp>,std::__map_value_compare<std::string,std::__value_type<std::string,INSystemApp>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,INSystemApp>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(p_mapping, __p, (uint64_t)__p);
      v10[7] = (uint64_t *)v6;
      v10[8] = (uint64_t *)v7;
      v10[9] = (uint64_t *)v8;
      if (v89 < 0)
        operator delete(__p[0]);
      std::string::basic_string[abi:ne180100]<0>(__p, v8);
      v11 = std::__tree<std::__value_type<std::string,INSystemApp>,std::__map_value_compare<std::string,std::__value_type<std::string,INSystemApp>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,INSystemApp>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(p_mapping, __p, (uint64_t)__p);
      v11[7] = (uint64_t *)v6;
      v11[8] = (uint64_t *)v7;
      v11[9] = (uint64_t *)v8;
      if (v89 < 0)
        operator delete(__p[0]);
      v4 += 3;
    }
    while (v4 != 132);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.facetime");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.facetime");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v63;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v106, 1);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.FaceTime");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.NanoPhone");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = v62;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v105, 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    +[INSystemAppGrouping groupingForKey:iOS:macOS:watchOS:](INSystemAppGrouping, "groupingForKey:iOS:macOS:watchOS:", v82, v61, v81);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v107[0] = v59;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.InCallService");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.InCallService");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v58;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v104, 1);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.FaceTime");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.Carousel");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v57;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v103, 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    +[INSystemAppGrouping groupingForKey:iOS:macOS:watchOS:](INSystemAppGrouping, "groupingForKey:iOS:macOS:watchOS:", v80, v79, v78);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v107[1] = v55;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.mobilephone");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.mobilephone");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v102[0] = v54;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.InCallService");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v102[1] = v53;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 2);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.FaceTime");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.NanoPhone");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v52;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v101, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    +[INSystemAppGrouping groupingForKey:iOS:macOS:watchOS:](INSystemAppGrouping, "groupingForKey:iOS:macOS:watchOS:", v77, v76, v75);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v107[2] = v50;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.mobiletimer");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.mobiletimer");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = v49;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v100, 1);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.clock");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.NanoAlarm");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v99[0] = v48;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.NanoStopwatch");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v99[1] = v47;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.private.NanoTimer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v99[2] = v46;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.NanoWorldClock");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v99[3] = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 4);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    +[INSystemAppGrouping groupingForKey:iOS:macOS:watchOS:](INSystemAppGrouping, "groupingForKey:iOS:macOS:watchOS:", v74, v73, v72);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v107[3] = v43;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.findmy");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.findmy");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v98, 1);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.findmy");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.findmy.finddevices");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v97[0] = v41;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.findmy.finditems");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v97[1] = v40;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.findmy");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v97[2] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 3);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[INSystemAppGrouping groupingForKey:iOS:macOS:watchOS:](INSystemAppGrouping, "groupingForKey:iOS:macOS:watchOS:", v71, v70, v69);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v107[4] = v37;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.FaceTime");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.facetime");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v96[0] = v36;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.mobilephone");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v96[1] = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 2);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.FaceTime");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[INSystemAppGrouping groupingForKey:iOS:macOS:watchOS:](INSystemAppGrouping, "groupingForKey:iOS:macOS:watchOS:", v68, v67);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v107[5] = v33;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.Carousel");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.InCallService");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v95, 1);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.Carousel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v94, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[INSystemAppGrouping groupingForKey:iOS:macOS:watchOS:](INSystemAppGrouping, "groupingForKey:iOS:macOS:watchOS:", v66, v65, 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v107[6] = v13;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.NanoPhone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.facetime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v93[0] = v15;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.mobilephone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v93[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.NanoPhone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v92, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[INSystemAppGrouping groupingForKey:iOS:macOS:watchOS:](INSystemAppGrouping, "groupingForKey:iOS:macOS:watchOS:", v14, v17, 0, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v107[7] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 8);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v22 = v64;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v85;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v85 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
          objc_msgSend(v26, "key");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKey:](v21, "setObject:forKey:", v26, v27);

        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
      }
      while (v23);
    }

    bundleIdentifierGroupingForIntentExecution = v83->_bundleIdentifierGroupingForIntentExecution;
    v83->_bundleIdentifierGroupingForIntentExecution = v21;

    v29 = v83;
    v3 = v83;
  }

  return v83;
}

- (id)resolvedAppMatchingExtensionBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  INAppDescriptor *v12;
  INAppDescriptor *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  -[INSystemAppMapper extensionToLaunchableAppBundleIdentifierMapping](self, "extensionToLaunchableAppBundleIdentifierMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = objc_claimAutoreleasedReturnValue();

  -[INSystemAppMapper extensionToDisplayableAppBundleIdentifierMapping](self, "extensionToDisplayableAppBundleIdentifierMapping");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v4);
  v8 = objc_claimAutoreleasedReturnValue();

  if (v6 | v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0CA5870]);
    if (v6)
      v10 = v6;
    else
      v10 = v8;
    v11 = (void *)objc_msgSend(v9, "initWithBundleIdentifier:allowPlaceholder:error:", v10, 0, 0);
    if (!v11)
    {
      v12 = 0;
LABEL_15:

      goto LABEL_16;
    }
    if (!v6 || v8)
    {
      if (v6 || !v8)
        goto LABEL_14;
    }
    else
    {
      v8 = v6;
    }
    v6 = (uint64_t)(id)v8;
    v8 = v6;
LABEL_14:
    v13 = [INAppDescriptor alloc];
    objc_msgSend(v11, "localizedName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "in_counterpartIdentifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "teamIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "in_supportedIntents");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "in_documentTypes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[INAppDescriptor initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:](v13, "initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:", v20, v6, v4, v19, v18, v17, v14, v15);

    goto LABEL_15;
  }
  v12 = 0;
LABEL_16:

  return v12;
}

- (id)resolvedIntentMatchingExtensionBundleIdentifier:(id)a3 preferredCallProvider:(int64_t)a4 intentClassName:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  INIntentDescriptor *v22;
  void *v23;
  void *v24;
  void *v25;
  INIntentDescriptor *v26;
  id v28;

  v8 = a3;
  v28 = a5;
  -[INSystemAppMapper extensionToLaunchableAppBundleIdentifierMapping](self, "extensionToLaunchableAppBundleIdentifierMapping");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = objc_claimAutoreleasedReturnValue();

  -[INSystemAppMapper extensionToDisplayableAppBundleIdentifierMapping](self, "extensionToDisplayableAppBundleIdentifierMapping");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v8);
  v12 = objc_claimAutoreleasedReturnValue();

  if (v10 | v12)
  {
    if (a4 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.facetime");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[INSystemAppMapper matchForBundleIdentifier:](self, "matchForBundleIdentifier:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bundleIdentifierForCurrentPlatform");
      v15 = objc_claimAutoreleasedReturnValue();

      v12 = v15;
    }
    v16 = objc_alloc(MEMORY[0x1E0CA5870]);
    if (v10)
      v17 = v10;
    else
      v17 = v12;
    v18 = (void *)objc_msgSend(v16, "initWithBundleIdentifier:allowPlaceholder:error:", v17, 0, 0);
    objc_msgSend(v18, "localizedName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && (objc_msgSend((id)v10, "isEqualToString:", v12) & 1) == 0)
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v12, 0, 0);
      objc_msgSend(v20, "localizedName");
      v21 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v21;
    }
    v22 = [INIntentDescriptor alloc];
    objc_msgSend(v18, "in_counterpartIdentifiers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "teamIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "in_supportedIntents");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[INIntentDescriptor initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:](v22, "initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:", v28, v19, v10, v12, v8, 0, v23, v24, a4, v25, 0, 0);

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)resolvedIntentMatchingAppBundleIdentifier:(id)a3 preferredCallProvider:(int64_t)a4 intentClassName:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  INAppDescriptor *v20;
  INIntentDescriptor *v21;
  void *v23;
  void *v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v25[0] = CFSTR("com.apple.AccessibilityUtilities.AXSettingsShortcuts");
  v25[1] = CFSTR("com.apple.UniversalAccess.UASettingsShortcuts");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "containsObject:", v8))
  {
    -[INSystemAppMapper resolvedIntentForAccessibilityActionWithBundleIdentifier:intentClassName:](self, "resolvedIntentForAccessibilityActionWithBundleIdentifier:intentClassName:", v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.NanoSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.Bridge");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "objectForKey:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v15, 0, 0);
      v17 = v16;
      if (v16
        && (objc_msgSend(v16, "applicationState"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v19 = objc_msgSend(v18, "isInstalled"),
            v18,
            (v19 & 1) != 0))
      {
        v20 = -[INAppDescriptor initWithApplicationRecord:]([INAppDescriptor alloc], "initWithApplicationRecord:", v17);
        v21 = -[INIntentDescriptor initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:]([INIntentDescriptor alloc], "initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:", v9, 0, 0, 0, 0, 0, 0, 0, a4, 0, 0, 0);
        -[INIntentDescriptor descriptorWithAppDescriptor:](v21, "descriptorWithAppDescriptor:", v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (id)matchForBundleIdentifier:(id)a3
{
  id v4;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, INSystemApp>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, INSystemApp>, void *>>> *v6;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, INSystemApp>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, INSystemApp>, void *>>> *v8;
  _BOOL4 v9;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, INSystemApp>, void *>>> **v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *__p[2];
  char v25;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, INSystemApp>, void *>>> *)self->_mapping.__tree_.__pair1_.__value_.__left_;
    p_pair1 = &self->_mapping.__tree_.__pair1_;
    v6 = left;
    if (!left)
      goto LABEL_9;
    v8 = p_pair1;
    do
    {
      v9 = std::less<std::string>::operator()[abi:ne180100](&v6[4].__value_.__left_, __p);
      v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, INSystemApp>, void *>>> **)&v6[1];
      if (!v9)
      {
        v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, INSystemApp>, void *>>> **)v6;
        v8 = v6;
      }
      v6 = *v10;
    }
    while (*v10);
    if (v8 == p_pair1 || std::less<std::string>::operator()[abi:ne180100](__p, &v8[4].__value_.__left_))
    {
LABEL_9:
      v11 = 0;
    }
    else
    {
      v14 = v8[7].__value_.__left_;
      v13 = v8[8].__value_.__left_;
      v15 = v8[9].__value_.__left_;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "length"))
        v19 = v17;
      else
        v19 = 0;
      v20 = objc_msgSend(v16, "length");
      v21 = objc_msgSend(v18, "length");
      if (v20)
        v22 = v16;
      else
        v22 = 0;
      if (v21)
        v23 = v18;
      else
        v23 = 0;
      +[INSystemAppMatch matchWithiOSBundleIdentifier:macOSBundleIdentifier:watchOSBundleIdentifier:](INSystemAppMatch, "matchWithiOSBundleIdentifier:macOSBundleIdentifier:watchOSBundleIdentifier:", v19, v22, v23);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (v25 < 0)
      operator delete(__p[0]);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)matchForBundleIdentifier:(id)a3 intentName:(id)a4
{
  -[INSystemAppMapper matchForBundleIdentifier:](self, "matchForBundleIdentifier:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)bundleIdentifiersForIntentExecutionMatchingBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSDictionary objectForKey:](self->_bundleIdentifierGroupingForIntentExecution, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "iOS");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[INSystemAppMapper matchForBundleIdentifier:](self, "matchForBundleIdentifier:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifierForCurrentPlatform");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v11[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (id)extensionToLaunchableAppBundleIdentifierMapping
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[10];
  _QWORD v36[12];

  v36[10] = *MEMORY[0x1E0C80C00];
  v35[0] = CFSTR("com.apple.WorkflowKit.ShortcutsIntents");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.shortcuts");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSystemAppMapper matchForBundleIdentifier:](self, "matchForBundleIdentifier:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bundleIdentifierForCurrentPlatform");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v32;
  v35[1] = CFSTR("com.apple.TelephonyUtilities.PhoneIntentHandler");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.InCallService");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSystemAppMapper matchForBundleIdentifier:](self, "matchForBundleIdentifier:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bundleIdentifierForCurrentPlatform");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v29;
  v35[2] = CFSTR("com.apple.AccessibilityUtilities.AXSettingsShortcuts");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.Preferences");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSystemAppMapper matchForBundleIdentifier:](self, "matchForBundleIdentifier:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bundleIdentifierForCurrentPlatform");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v26;
  v35[3] = CFSTR("com.apple.ActionKit.BundledIntentHandler");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.shortcuts");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSystemAppMapper matchForBundleIdentifier:](self, "matchForBundleIdentifier:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bundleIdentifierForCurrentPlatform");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v23;
  v35[4] = CFSTR("com.apple.UniversalAccess.UASettingsShortcuts");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.systempreferences");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSystemAppMapper matchForBundleIdentifier:](self, "matchForBundleIdentifier:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bundleIdentifierForCurrentPlatform");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v20;
  v35[5] = CFSTR("com.apple.mobiletimer-framework.MobileTimerIntents");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.mobiletimer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSystemAppMapper matchForBundleIdentifier:](self, "matchForBundleIdentifier:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bundleIdentifierForCurrentPlatform");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36[5] = v17;
  v35[6] = CFSTR("com.apple.PBBridgeSupport.BridgeIntents");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.Bridge");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSystemAppMapper matchForBundleIdentifier:](self, "matchForBundleIdentifier:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundleIdentifierForCurrentPlatform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v36[6] = v3;
  v35[7] = CFSTR("com.apple.PassKit.PassKitIntentsExtension");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.MobileSMS");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSystemAppMapper matchForBundleIdentifier:](self, "matchForBundleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifierForCurrentPlatform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v36[7] = v6;
  v35[8] = CFSTR("com.apple.HomeKit.HomeKitIntentExtension");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.Home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSystemAppMapper matchForBundleIdentifier:](self, "matchForBundleIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifierForCurrentPlatform");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36[8] = v9;
  v35[9] = CFSTR("com.apple.DoNotDisturb.Intents");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.Preferences");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSystemAppMapper matchForBundleIdentifier:](self, "matchForBundleIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifierForCurrentPlatform");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36[9] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 10);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)extensionToDisplayableAppBundleIdentifierMapping
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[6];
  _QWORD v24[8];

  v24[6] = *MEMORY[0x1E0C80C00];
  v23[0] = CFSTR("com.apple.ActionKit.BundledIntentHandler");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.shortcuts");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSystemAppMapper matchForBundleIdentifier:](self, "matchForBundleIdentifier:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bundleIdentifierForCurrentPlatform");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v20;
  v23[1] = CFSTR("com.apple.TelephonyUtilities.PhoneIntentHandler");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.mobilephone");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSystemAppMapper matchForBundleIdentifier:](self, "matchForBundleIdentifier:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bundleIdentifierForCurrentPlatform");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v17;
  v23[2] = CFSTR("com.apple.PassKit.PassKitIntentsExtension");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.Passbook");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSystemAppMapper matchForBundleIdentifier:](self, "matchForBundleIdentifier:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundleIdentifierForCurrentPlatform");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v14;
  v23[3] = CFSTR("com.apple.HomeKit.HomeKitIntentExtension");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.Home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSystemAppMapper matchForBundleIdentifier:](self, "matchForBundleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifierForCurrentPlatform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v5;
  v23[4] = CFSTR("com.apple.DoNotDisturb.Intents");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.Preferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSystemAppMapper matchForBundleIdentifier:](self, "matchForBundleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifierForCurrentPlatform");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v8;
  v23[5] = CFSTR("com.apple.AccessibilityUtilities.AXSettingsShortcuts");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.Preferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSystemAppMapper matchForBundleIdentifier:](self, "matchForBundleIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifierForCurrentPlatform");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)resolvedIntentForAccessibilityActionWithBundleIdentifier:(id)a3 intentClassName:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  INIntentDescriptor *v11;
  void *v12;
  void *v13;
  void *v14;
  INIntentDescriptor *v15;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.Preferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSystemAppMapper matchForBundleIdentifier:](self, "matchForBundleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifierForCurrentPlatform");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByReplacingCharactersInRange:withString:", 0, 2, CFSTR("AX"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v8, 0, 0);
  v11 = [INIntentDescriptor alloc];
  objc_msgSend(v10, "localizedName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "teamIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[INIntentDescriptor initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:](v11, "initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:", v9, v12, v8, v8, CFSTR("com.apple.AccessibilityUtilities.AXSettingsShortcuts"), 0, 0, v13, 0, v14, 0, 0);

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifierGroupingForIntentExecution, 0);
  std::__tree<std::__value_type<std::string,INSystemApp>,std::__map_value_compare<std::string,std::__value_type<std::string,INSystemApp>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,INSystemApp>>>::destroy((char *)self->_mapping.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  return self;
}

+ (id)supportedIntentsOverridesForBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.NanoAlarm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("MTCreateAlarmIntent"), CFSTR("MTDeleteAlarmIntent"), CFSTR("MTDisableAlarmIntent"), CFSTR("MTEnableAlarmIntent"), CFSTR("MTGetAlarmsIntent"), CFSTR("MTToggleAlarmIntent"), CFSTR("MTUpdateAlarmIntent"), 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.private.NanoTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("INCreateTimerIntent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.NanoSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("DNDToggleDoNotDisturbIntent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v9;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.VoiceMemos");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("PlaybackVoiceMemoIntent"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKey:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
