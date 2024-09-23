@implementation NSURL(HealthKit)

- (id)hk_valueForFirstInstanceOfParameterNamed:()HealthKit
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v5, "queryItems", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if ((v12 & 1) != 0)
        {
          objc_msgSend(v10, "value");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (uint64_t)hk_isValidSafariViewControllerURL
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("http"));

  return v3;
}

- (uint64_t)hk_isRewrittenHealthCardQRCodeURL
{
  void *v1;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v8;
  void *v9;

  objc_msgSend(a1, "pathComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("https")))
  {
    objc_msgSend(a1, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("redirect.health.apple.com")))
    {
LABEL_4:
      v5 = 0;
LABEL_5:

      goto LABEL_6;
    }
    v8 = objc_msgSend(v3, "count");
    if (v8 > 2)
      goto LABEL_10;
    if (objc_msgSend(v3, "count") != 2)
      goto LABEL_4;
    objc_msgSend(a1, "fragment");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (v1)
    {
LABEL_10:
      objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v9, "isEqualToString:", CFSTR("SMARTHealthCard"));

      if (v8 > 2)
        goto LABEL_5;
    }
    else
    {
      v5 = 0;
    }

    goto LABEL_5;
  }
  v5 = 0;
LABEL_6:

  return v5;
}

- (uint64_t)hk_isRewrittenEUDigitalCOVIDCertificateQRCodeURL
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "pathComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("https")))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(a1, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("redirect.health.apple.com"))
      || objc_msgSend(v2, "count") != 2)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(a1, "fragment");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v7, "isEqualToString:", CFSTR("EU-DCC"));

      }
      else
      {
        v4 = 0;
      }

    }
  }

  return v4;
}

- (id)hk_fileSizeWithError:()HealthKit
{
  id v6;
  int *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int *v14;
  char *v15;
  void *v17;
  stat v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSURL+HealthKit.m"), 158, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.isFileURL"));

  }
  memset(&v18, 0, sizeof(v18));
  v6 = objc_retainAutorelease(a1);
  if (stat((const char *)objc_msgSend(v6, "fileSystemRepresentation"), &v18))
  {
    v7 = __error();
    v8 = (void *)MEMORY[0x1E0CB35C8];
    if (*v7 == 2)
    {
      v9 = *MEMORY[0x1E0CB28A8];
      v19 = *MEMORY[0x1E0CB3308];
      v20[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 4, v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v11);
        else
          _HKLogDroppedError(v11);
      }

    }
    else
    {
      v14 = __error();
      v15 = strerror(*v14);
      objc_msgSend(v8, "hk_assignError:code:format:", a3, 102, CFSTR("Failed to retrieve size for file at '%@': %s"), v6, v15, *(_QWORD *)&v18.st_dev, v18.st_ino, *(_QWORD *)&v18.st_uid, *(_QWORD *)&v18.st_rdev, v18.st_atimespec.tv_sec, v18.st_atimespec.tv_nsec, v18.st_mtimespec.tv_sec, v18.st_mtimespec.tv_nsec, v18.st_ctimespec.tv_sec, v18.st_ctimespec.tv_nsec, v18.st_birthtimespec.tv_sec, v18.st_birthtimespec.tv_nsec);
    }
    v13 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v18.st_size);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v13;
}

+ (id)hk_safeURLWithString:()HealthKit
{
  if (!a3)
    return 0;
  objc_msgSend(a1, "URLWithString:");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)hk_tapToHealthRadarURLWithTitle:()HealthKit description:classification:reproducibility:keywords:autoDiagnostics:attachments:
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "hk_tapToRadarURLForBundleID:component:title:description:classification:reproducibility:keywords:autoDiagnostics:attachments:", CFSTR("com.apple.Health"), 0, a3, a4, a5, a6, a7, a8, a9);
}

+ (uint64_t)hk_tapToHealthRadarURLForComponent:()HealthKit title:description:classification:reproducibility:keywords:autoDiagnostics:attachments:
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "hk_tapToRadarURLForBundleID:component:title:description:classification:reproducibility:keywords:autoDiagnostics:attachments:", 0, a3, a4, a5, a6, a7, a8, a9, a10);
}

+ (uint64_t)hk_tapToHealthRadarURLForComponent:()HealthKit title:description:classification:reproducibility:keywords:autoDiagnostics:attachments:collaborationContactHandles:
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "hk_tapToRadarURLForBundleID:component:title:description:classification:reproducibility:keywords:autoDiagnostics:attachments:collaborationContactHandles:", 0, a3, a4, a5, a6, a7, a8, a9, a10);
}

+ (uint64_t)hk_tapToRadarURLForBundleID:()HealthKit component:title:description:classification:reproducibility:keywords:autoDiagnostics:attachments:
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "hk_tapToRadarURLForBundleID:component:title:description:classification:reproducibility:keywords:autoDiagnostics:attachments:collaborationContactHandles:", a9, a10, 0);
}

+ (uint64_t)hk_tapToRadarURLForBundleID:()HealthKit component:title:description:classification:reproducibility:keywords:autoDiagnostics:attachments:collaborationContactHandles:
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "hk_tapToRadarURLForBundleID:component:title:description:classification:reproducibility:keywords:autoDiagnostics:attachments:collaborationContactHandles:diagnosticExtensionOptions:", a9, a10, a11, 0);
}

+ (id)hk_tapToRadarURLForBundleID:()HealthKit component:title:description:classification:reproducibility:keywords:autoDiagnostics:attachments:collaborationContactHandles:diagnosticExtensionOptions:
{
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  __CFString *v33;
  __CFString *v34;
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
  __CFString *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v59;
  id v60;
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;

  v18 = a3;
  v19 = a5;
  v20 = a6;
  v21 = a9;
  v63 = a11;
  v64 = a12;
  if ((v18 || !a4) && (!v18 || a4))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSURL+HealthKit.m"), 302, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(bundleID == nil && componentID > 0) || (bundleID != nil && componentID == 0)"));

  }
  objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "mutableCopy");

  objc_msgSend(v23, "removeCharactersInString:", CFSTR("=,&"));
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("tap-to-radar://new"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isiPad");

    if (v26)
    {
      objc_msgSend(&unk_1E3894690, "stringValue");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringByAddingPercentEncodingWithAllowedCharacters:", v23);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "appendFormat:", CFSTR("?ComponentID=%@"), v28);

      objc_msgSend(CFSTR("Health App"), "stringByAddingPercentEncodingWithAllowedCharacters:", v23);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "appendFormat:", CFSTR("&ComponentName=%@"), v29);

      objc_msgSend(CFSTR("Stanley LiveOn"), "stringByAddingPercentEncodingWithAllowedCharacters:", v23);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "appendFormat:", CFSTR("&ComponentVersion=%@"), v30);
    }
    else
    {
      objc_msgSend(v18, "stringByAddingPercentEncodingWithAllowedCharacters:", v23);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "appendFormat:", CFSTR("?BundleID=%@"), v30);
    }

  }
  if (a4)
  {
    v60 = v18;
    if (a4 > 1330751)
    {
      if (a4 <= 1495801)
      {
        switch(a4)
        {
          case 1330752:
            v31 = v20;
            v32 = v19;
            v33 = CFSTR("Secure Dropbox");
            break;
          case 1332846:
            v31 = v20;
            v32 = v19;
            v33 = CFSTR("Stanley");
            goto LABEL_45;
          case 1397974:
            v31 = v20;
            v32 = v19;
            v33 = CFSTR("iOS");
            break;
          default:
            goto LABEL_49;
        }
        v34 = CFSTR("Health Medications");
        goto LABEL_48;
      }
      if (a4 > 1633563)
      {
        if (a4 == 1633564)
        {
          v31 = v20;
          v32 = v19;
          v33 = CFSTR("Data");
        }
        else
        {
          if (a4 != 1634542)
            goto LABEL_49;
          v31 = v20;
          v32 = v19;
          v33 = CFSTR("All Bugs");
        }
        v34 = CFSTR("Lavender Live On");
        goto LABEL_48;
      }
      if (a4 == 1495802)
      {
        v31 = v20;
        v32 = v19;
        v33 = CFSTR("LiveOn");
        v34 = CFSTR("Health Chamomile");
        goto LABEL_48;
      }
      if (a4 != 1609569)
        goto LABEL_49;
      v31 = v20;
      v32 = v19;
      v33 = CFSTR("Stanley LiveOn");
    }
    else
    {
      if (a4 <= 1076586)
      {
        if (a4 != 616513)
        {
          if (a4 == 748570)
          {
            v31 = v20;
            v32 = v19;
            v33 = CFSTR("Restricted");
            v34 = CFSTR("Health");
          }
          else
          {
            if (a4 != 938492)
              goto LABEL_49;
            v31 = v20;
            v32 = v19;
            v33 = CFSTR("Dropbox");
            v34 = CFSTR("Health Medical Records");
          }
          goto LABEL_48;
        }
        v31 = v20;
        v32 = v19;
        v33 = CFSTR("All");
        goto LABEL_39;
      }
      if (a4 <= 1259111)
      {
        if (a4 != 1076587)
        {
          if (a4 != 1109271)
            goto LABEL_49;
          v31 = v20;
          v32 = v19;
          v33 = CFSTR("watchOS");
LABEL_39:
          v34 = CFSTR("Health Medical ID");
          goto LABEL_48;
        }
        v31 = v20;
        v32 = v19;
        v33 = CFSTR("All");
        v34 = CFSTR("Health Sleep");
LABEL_48:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringValue");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringByAddingPercentEncodingWithAllowedCharacters:", v23);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "appendFormat:", CFSTR("?ComponentID=%@"), v37);

        -[__CFString stringByAddingPercentEncodingWithAllowedCharacters:](v34, "stringByAddingPercentEncodingWithAllowedCharacters:", v23);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "appendFormat:", CFSTR("&ComponentName=%@"), v38);

        -[__CFString stringByAddingPercentEncodingWithAllowedCharacters:](v33, "stringByAddingPercentEncodingWithAllowedCharacters:", v23);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "appendFormat:", CFSTR("&ComponentVersion=%@"), v39);

        v19 = v32;
        v20 = v31;
        v18 = v60;
        goto LABEL_49;
      }
      if (a4 != 1259112)
      {
        if (a4 != 1318138)
          goto LABEL_49;
        v31 = v20;
        v32 = v19;
        v33 = CFSTR("All");
        v34 = CFSTR("Health Cardio Recovery");
        goto LABEL_48;
      }
      v31 = v20;
      v32 = v19;
      v33 = CFSTR("Sharing");
    }
LABEL_45:
    v34 = CFSTR("Health App");
    goto LABEL_48;
  }
LABEL_49:
  objc_msgSend(v19, "stringByAddingPercentEncodingWithAllowedCharacters:", v23);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "appendFormat:", CFSTR("&Title=%@"), v40);

  if (v20)
  {
    objc_msgSend(v20, "stringByAddingPercentEncodingWithAllowedCharacters:", v23);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "appendFormat:", CFSTR("&Description=%@"), v41);

  }
  if ((unint64_t)(a7 - 1) <= 9)
  {
    -[__CFString stringByAddingPercentEncodingWithAllowedCharacters:](*(&off_1E37EC9D0 + a7 - 1), "stringByAddingPercentEncodingWithAllowedCharacters:", v23);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "appendFormat:", CFSTR("&Classification=%@"), v42);

  }
  if ((unint64_t)(a8 - 1) <= 5)
  {
    -[__CFString stringByAddingPercentEncodingWithAllowedCharacters:](*(&off_1E37ECA20 + a8 - 1), "stringByAddingPercentEncodingWithAllowedCharacters:", v23);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "appendFormat:", CFSTR("&Reproducibility=%@"), v43);

  }
  if (v21 && objc_msgSend(v21, "count"))
  {
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __199__NSURL_HealthKit__hk_tapToRadarURLForBundleID_component_title_description_classification_reproducibility_keywords_autoDiagnostics_attachments_collaborationContactHandles_diagnosticExtensionOptions___block_invoke;
    v65[3] = &unk_1E37E9E20;
    v66 = v23;
    objc_msgSend(v21, "hk_map:", v65);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "componentsJoinedByString:", CFSTR(","));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "appendFormat:", CFSTR("&Keywords=%@"), v45);

  }
  if ((unint64_t)(a10 - 1) > 2)
    v46 = CFSTR("-1");
  else
    v46 = *(&off_1E37ECA50 + a10 - 1);
  -[__CFString stringByAddingPercentEncodingWithAllowedCharacters:](v46, "stringByAddingPercentEncodingWithAllowedCharacters:", v23);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "appendFormat:", CFSTR("&AutoDiagnostics=%@"), v47);

  v48 = v63;
  v49 = v48;
  v50 = v48;
  if (!v48)
    goto LABEL_65;
  v50 = v48;
  if (!objc_msgSend(v48, "count"))
    goto LABEL_65;
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E37FD4C0);
  objc_msgSend(v50, "hk_appendComponentsJoinedByString:container:componentGenerator:", CFSTR(","), v49, &__block_literal_global_38);

  if (v50)
  {
    objc_msgSend(v50, "stringByAddingPercentEncodingWithAllowedCharacters:", v23);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "appendFormat:", CFSTR("&Attachments=%@"), v51);

LABEL_65:
  }
  v52 = v64;
  v53 = v52;
  v54 = v52;
  if (v52)
  {
    v54 = v52;
    if (objc_msgSend(v52, "count"))
    {
      v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E37FD4C0);
      objc_msgSend(v54, "hk_appendComponentsJoinedByString:container:componentGenerator:", CFSTR(","), v53, &__block_literal_global_170);

      if (!v54)
        goto LABEL_71;
      objc_msgSend(v54, "stringByAddingPercentEncodingWithAllowedCharacters:", v23);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "appendFormat:", CFSTR("&CollaborationContactHandles=%@"), v55);

    }
  }

LABEL_71:
  if ((a13 & 1) != 0)
  {
    objc_msgSend(CFSTR("com.apple.HealthKit.HealthDiagnosticExtension"), "stringByAddingPercentEncodingWithAllowedCharacters:", v23);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "appendFormat:", CFSTR("&ExtensionIdentifiers=%@"), v56);

  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v24);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  return v57;
}

@end
