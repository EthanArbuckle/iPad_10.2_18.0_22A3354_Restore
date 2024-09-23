@implementation AppleIDVClient

+ (unsigned)requireDoublePressOnACL:(id)a3 intoACL:(id *)a4
{
  id v6;
  uint64_t v7;
  const void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v15;

  v6 = a3;
  v15 = 0;
  if (a4)
  {
    *a4 = 0;
    v7 = SecAccessControlCreateFromData();
    if (v7)
    {
      v8 = (const void *)v7;
      SecAccessControlGetConstraints();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = -[NSObject mutableCopy](v9, "mutableCopy");
      -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("osgn"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "mutableCopy");

      objc_msgSend(v12, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("cbtn"));
      if (v12)
        objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("od"));
      objc_msgSend(a1, "prepareUnboundACLForBinding:withConstraints:", v8, v10);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      CFRelease(v8);

      v13 = 0;
    }
    else
    {
      APPLEIDV_LOG_CLIENT();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[AppleIDVClient requireDoublePressOnACL:intoACL:].cold.1((uint64_t)v6, &v15);
      v13 = 13;
    }

  }
  else
  {
    v13 = 5;
  }

  return v13;
}

+ (unsigned)getUUIDsFromACL:(id)a3 intoArray:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  const void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  id v19;
  unsigned int v20;
  NSObject *v21;
  id v22;
  void *v24;

  v5 = a3;
  v24 = 0;
  v6 = (void *)objc_opt_new();
  if (a4)
  {
    v7 = SecAccessControlCreateFromData();
    if (v7)
    {
      v8 = (const void *)v7;
      SecAccessControlGetConstraints();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("osgn"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("cbio"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("osgn"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("cbio"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("pbiou"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v15 = objc_retainAutorelease(v14);
          v16 = objc_msgSend(v15, "bytes");
          if (objc_msgSend(v15, "length"))
          {
            v17 = 0;
            do
            {
              v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v16 + v17);
              objc_msgSend(v6, "addObject:", v18);

              v17 += 16;
            }
            while (objc_msgSend(v15, "length") > v17);
          }
          v19 = objc_retainAutorelease(v6);

          v20 = 0;
          goto LABEL_15;
        }
        v20 = 14;
      }
      else
      {
        v20 = 0;
      }
      v22 = objc_retainAutorelease(v6);
LABEL_15:
      *a4 = v6;
      CFRelease(v8);

      goto LABEL_16;
    }
    APPLEIDV_LOG_CLIENT();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      +[AppleIDVClient getUUIDsFromACL:intoArray:].cold.1((uint64_t)v5, &v24);

    v20 = 13;
  }
  else
  {
    v20 = 5;
  }
  *a4 = objc_retainAutorelease(v6);
LABEL_16:

  return v20;
}

+ (unsigned)prepareACL:(id *)a3 aclType:(unsigned int)a4 forAclUsage:(unsigned int)a5 forBioUUID:(id)a6
{
  uint64_t v7;
  id v9;
  void *v10;
  unsigned int v11;
  id *v12;
  uint64_t v13;
  id v14;
  unsigned int v15;
  id *v16;
  uint64_t v17;
  uint64_t v18;
  id *v19;
  uint64_t v20;

  v7 = *(_QWORD *)&a4;
  v9 = a6;
  v10 = v9;
  switch(a5)
  {
    case 2u:
      if ((v7 - 2) >= 2)
      {
        if ((_DWORD)v7 != 1 && ((_DWORD)v7 || !v9))
          break;
        v12 = a3;
        v13 = v7;
        v14 = v9;
LABEL_14:
        v11 = +[AppleIDVClient prepareACLForPhoneDecryption:withSubType:forBioUUID:](AppleIDVClient, "prepareACLForPhoneDecryption:withSubType:forBioUUID:", v12, v13, v14);
LABEL_23:
        v15 = v11;
        goto LABEL_24;
      }
      v16 = a3;
      v17 = v7;
      v18 = 2;
LABEL_18:
      v11 = +[AppleIDVClient prepareACLForWatchDecryption:withSubType:forAclUsage:](AppleIDVClient, "prepareACLForWatchDecryption:withSubType:forAclUsage:", v16, v17, v18);
      goto LABEL_23;
    case 1u:
      if ((v7 - 2) >= 2)
      {
        if (v7 > 1)
          break;
        v12 = a3;
        v13 = v7;
        v14 = 0;
        goto LABEL_14;
      }
      v16 = a3;
      v17 = v7;
      v18 = 1;
      goto LABEL_18;
    case 0u:
      switch((int)v7)
      {
        case 0:
          v11 = +[AppleIDVClient prepareUnboundACLForBioBinding:](AppleIDVClient, "prepareUnboundACLForBioBinding:", a3);
          goto LABEL_23;
        case 1:
          v11 = +[AppleIDVClient prepareUnboundACLForPasscodeBinding:](AppleIDVClient, "prepareUnboundACLForPasscodeBinding:", a3);
          goto LABEL_23;
        case 2:
          v19 = a3;
          v20 = 0;
          break;
        case 3:
          v19 = a3;
          v20 = 1;
          break;
        default:
          goto LABEL_15;
      }
      v11 = +[AppleIDVClient prepareUnboundACLForWatch:withAccessibilityEnabled:](AppleIDVClient, "prepareUnboundACLForWatch:withAccessibilityEnabled:", v19, v20);
      goto LABEL_23;
  }
LABEL_15:
  v15 = 1;
LABEL_24:

  return v15;
}

+ (unsigned)prepareACLForPhoneDecryption:(id *)a3 withSubType:(unsigned int)a4 forBioUUID:(id)a5
{
  id v7;
  SecAccessControlCreateFlags v8;
  SecAccessControlRef v9;
  SecAccessControlRef v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  unsigned int v20;
  NSObject *v21;
  id v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  CFErrorRef error;

  v7 = a5;
  error = 0;
  if (a4)
    v8 = 16;
  else
    v8 = 2;
  v9 = SecAccessControlCreateWithFlags((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFTypeRef)*MEMORY[0x1E0CD68B0], v8, &error);
  if (v9)
  {
    v10 = v9;
    SecAccessControlGetConstraints();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      APPLEIDV_LOG_CLIENT();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[AppleIDVClient prepareACLForPhoneDecryption:withSubType:forBioUUID:].cold.2();
      v20 = 15;
      goto LABEL_27;
    }
    v12 = v11;
    if (v7)
    {
      -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("od"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "mutableCopy");

      if (!v14)
      {
        APPLEIDV_LOG_CLIENT();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          +[AppleIDVClient prepareACLForPhoneDecryption:withSubType:forBioUUID:].cold.4();

        v20 = 17;
        goto LABEL_27;
      }
      -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("od"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("cbio"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        APPLEIDV_LOG_CLIENT();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          +[AppleIDVClient prepareACLForPhoneDecryption:withSubType:forBioUUID:].cold.5();

        v20 = 18;
        goto LABEL_27;
      }
      objc_msgSend(v16, "setObject:forKey:", v7, CFSTR("pbiou"));
      objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("cbio"));
      v17 = -[NSObject mutableCopy](v12, "mutableCopy");
      objc_msgSend(v17, "setObject:forKey:", v14, CFSTR("od"));
      v18 = v17;

      v12 = v18;
    }
    else
    {
      v16 = 0;
      v14 = 0;
      v18 = 0;
    }
    v21 = v12;
    v22 = -[NSObject mutableCopy](v12, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", v23, CFSTR("ock"));

    v12 = v22;
    APPLEIDV_LOG_CLIENT();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      +[AppleIDVClient prepareACLForPhoneDecryption:withSubType:forBioUUID:].cold.3();

    SecAccessControlSetConstraints();
    *a3 = (id)SecAccessControlCopyData();

    v20 = 0;
LABEL_27:

    CFRelease(v10);
    goto LABEL_28;
  }
  APPLEIDV_LOG_CLIENT();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    +[AppleIDVClient prepareACLForPhoneDecryption:withSubType:forBioUUID:].cold.1();

  v20 = 13;
LABEL_28:

  return v20;
}

+ (unsigned)prepareACLForWatchDecryption:(id *)a3 withSubType:(unsigned int)a4 forAclUsage:(unsigned int)a5
{
  uint64_t v8;
  const void *v9;
  NSObject *v10;
  unsigned int v11;
  NSObject *v12;
  NSObject *v13;

  v8 = SecAccessControlCreate();
  if (v8)
  {
    v9 = (const void *)v8;
    if ((SecAccessControlSetProtection() & 1) != 0)
    {
      if (a4 == 2 && a5 == 1 || a4 == 3 && a5 == 1 || a4 == 2 && a5 == 2 || a4 == 3 && a5 == 2)
      {
        APPLEIDV_LOG_CLIENT();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          +[AppleIDVClient prepareACLForWatchDecryption:withSubType:forAclUsage:].cold.2();

        SecAccessControlSetConstraints();
        v11 = 0;
        *a3 = (id)SecAccessControlCopyData();
        goto LABEL_21;
      }
      APPLEIDV_LOG_CLIENT();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[AppleIDVClient prepareACLForWatchDecryption:withSubType:forAclUsage:].cold.3(a5, a4, v12);
    }
    else
    {
      APPLEIDV_LOG_CLIENT();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[AppleIDVClient prepareACLForWatchDecryption:withSubType:forAclUsage:].cold.4();
    }

    v11 = 13;
LABEL_21:
    CFRelease(v9);
    return v11;
  }
  APPLEIDV_LOG_CLIENT();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    +[AppleIDVClient prepareACLForWatchDecryption:withSubType:forAclUsage:].cold.1();

  return 13;
}

+ (unsigned)prepareUnboundACLForBioBinding:(id *)a3
{
  void *v5;
  SecAccessControlRef v6;
  SecAccessControlRef v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  id v25;
  CFErrorRef error;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  error = 0;
  v27 = 0;
  v28 = 0;
  v5 = (void *)objc_opt_new();
  v6 = SecAccessControlCreateWithFlags((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFTypeRef)*MEMORY[0x1E0CD68B0], 2uLL, &error);
  if (v6)
  {
    v7 = v6;
    SecAccessControlGetConstraints();
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      v25 = 0;
      objc_msgSend(v5, "evaluateAccessControl:operation:options:error:", v7, 0, 0, &v25);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v25;

      if (v10)
      {
        SecAccessControlGetConstraints();
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("od"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v13, "mutableCopy");

        if (v14)
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("od"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("cbio"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v27 = -1;
            v28 = -1;
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v27, 16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("pbiou"));

            objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("cbio"));
            v18 = (void *)objc_msgSend(v12, "mutableCopy");
            objc_msgSend(v18, "setObject:forKey:", v14, CFSTR("od"));
            SecAccessControlSetConstraints();
            objc_msgSend(a1, "prepareUnboundACLForBinding:withConstraints:", v7, v18);
            *a3 = (id)objc_claimAutoreleasedReturnValue();

            v19 = 0;
          }
          else
          {
            APPLEIDV_LOG_CLIENT();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              +[AppleIDVClient prepareUnboundACLForBioBinding:].cold.5();

            v19 = 18;
          }
        }
        else
        {
          APPLEIDV_LOG_CLIENT();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            +[AppleIDVClient prepareUnboundACLForBioBinding:].cold.4();

          v19 = 17;
        }
      }
      else
      {
        APPLEIDV_LOG_CLIENT();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          +[AppleIDVClient prepareUnboundACLForBioBinding:].cold.3();

        v19 = 16;
      }
    }
    else
    {
      APPLEIDV_LOG_CLIENT();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[AppleIDVClient prepareUnboundACLForBioBinding:].cold.2();
      v19 = 15;
    }

    CFRelease(v7);
  }
  else
  {
    APPLEIDV_LOG_CLIENT();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      +[AppleIDVClient prepareUnboundACLForBioBinding:].cold.1();

    v19 = 13;
  }

  return v19;
}

+ (unsigned)prepareUnboundACLForPasscodeBinding:(id *)a3
{
  void *v5;
  SecAccessControlRef v6;
  SecAccessControlRef v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  id v23;
  CFErrorRef error;

  error = 0;
  v5 = (void *)objc_opt_new();
  v6 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x1E0CD68B0], 0x10uLL, &error);
  if (v6)
  {
    v7 = v6;
    SecAccessControlGetConstraints();
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      v23 = 0;
      objc_msgSend(v5, "evaluateAccessControl:operation:options:error:", v7, 0, 0, &v23);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v23;

      if (v10)
      {
        SecAccessControlGetConstraints();
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("od"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v13, "mutableCopy");

        if (v14)
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("od"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("cup"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(a1, "prepareUnboundACLForBinding:withConstraints:", v7, v12);
            *a3 = (id)objc_claimAutoreleasedReturnValue();

            v17 = 0;
          }
          else
          {
            APPLEIDV_LOG_CLIENT();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              +[AppleIDVClient prepareUnboundACLForPasscodeBinding:].cold.5();

            v17 = 19;
          }
        }
        else
        {
          APPLEIDV_LOG_CLIENT();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            +[AppleIDVClient prepareUnboundACLForPasscodeBinding:].cold.4();

          v17 = 17;
        }
      }
      else
      {
        APPLEIDV_LOG_CLIENT();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          +[AppleIDVClient prepareUnboundACLForPasscodeBinding:].cold.3();

        v17 = 16;
      }
    }
    else
    {
      APPLEIDV_LOG_CLIENT();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[AppleIDVClient prepareUnboundACLForPasscodeBinding:].cold.2();
      v17 = 15;
    }

    CFRelease(v7);
  }
  else
  {
    APPLEIDV_LOG_CLIENT();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      +[AppleIDVClient prepareUnboundACLForPasscodeBinding:].cold.1();

    v17 = 13;
  }

  return v17;
}

+ (id)prepareUnboundACLForBinding:(__SecAccessControl *)a3 withConstraints:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a4;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("od"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("osgn"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("od"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("oe"));
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("odel"));
  SecAccessControlSetConstraints();
  v8 = (void *)SecAccessControlCopyData();

  return v8;
}

+ (unsigned)appleIDVGetStatus:(int64_t *)a3 andVersion:(id *)a4
{
  unsigned int v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v11;
  id v12;

  if (a4)
  {
    v11 = 0;
    v12 = 0;
    v5 = +[AppleIDVClient appleIDVGetStatus:andSIDVVersion:andAppleIDVVersion:](AppleIDVClient, "appleIDVGetStatus:andSIDVVersion:andAppleIDVVersion:", a3, &v12, &v11);
    v6 = v12;
    v7 = v11;
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", objc_msgSend(v6, "length") + objc_msgSend(v7, "length") + 3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendData:", v6);
      objc_msgSend(CFSTR(" - "), "dataUsingEncoding:", 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendData:", v9);

      objc_msgSend(v8, "appendData:", v7);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v8);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v5 = 0;
    }
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v5 = 5;
  }

  return v5;
}

+ (unsigned)appleIDVGetStatus:(int64_t *)a3 andSIDVVersion:(id *)a4 andAppleIDVVersion:(id *)a5
{
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  unsigned int v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  uint8_t v23[16];
  uint8_t buf[8];
  size_t v25;

  DIV_LOG_KEXT();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  DIV_LOG_KEXT();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF917000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "appleIDV.getStatus", "enableTelemetry=YES", buf, 2u);
  }

  v12 = 5;
  if (a3 && a4 && a5)
  {
    v25 = 256;
    v13 = (unsigned __int8 *)malloc_type_malloc(0x100uLL, 0x100004077774924uLL);
    if (v13)
    {
      v14 = v13;
      v15 = GenericAppleIDVCall(0, 0, 0, v13, &v25);
      APPLEIDV_LOG_CLIENT();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        +[AppleIDVClient appleIDVGetStatus:andSIDVVersion:andAppleIDVVersion:].cold.2();

      if (!v15)
      {
        if (v25 < 4 || (v17 = *v14, v17 + 1 >= v25) || v17 + 2 >= v25)
        {
          v15 = 5;
        }
        else
        {
          v18 = v17 + 6;
          v15 = 5;
          if (v17 + 6 < v25 && (unint64_t)v14[v17 + 1] - 4 + v18 <= v25)
          {
            *a3 = *(unsigned int *)&v14[v17 + 2];
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v14[v18]);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v14 + 1, v17);
            v15 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
      }
      free(v14);
    }
    else
    {
      v15 = 9;
    }
    APPLEIDV_LOG_CLIENT();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      +[AppleIDVClient appleIDVGetStatus:andSIDVVersion:andAppleIDVVersion:].cold.1();

    if (v15)
    {
      if (v15 == -536870208)
        v12 = 11;
      else
        v12 = v15;
    }
    else
    {
      v12 = 0;
    }
  }
  DIV_LOG_KEXT();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)v23 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF917000, v21, OS_SIGNPOST_INTERVAL_END, v9, "appleIDV.getStatus", ", v23, 2u);
  }

  return v12;
}

+ (unsigned)appleIDVAuthorizePresentment:(id)a3 withLAContextData:(id)a4 onSESlot:(int64_t)a5 andPayloadDigest:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  unsigned int v21;
  unsigned int v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  uint8_t v27[16];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void *v31[2];
  __int128 v32;
  __int128 v33;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  *(_OWORD *)v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  DIV_LOG_KEXT();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);

  DIV_LOG_KEXT();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)v27 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF917000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "appleIDV.authorizePresentment", "enableTelemetry=YES", v27, 2u);
  }

  if (v9)
  {
    v16 = objc_retainAutorelease(v9);
    *(_QWORD *)&v28 = objc_msgSend(v16, "bytes");
    v17 = objc_msgSend(v16, "length");
    v31[0] = 0;
    v31[1] = 0;
    *((_QWORD *)&v28 + 1) = v17;
    APPLEIDV_LOG_CLIENT();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      +[AppleIDVClient appleIDVAuthorizePresentment:withLAContextData:onSESlot:andPayloadDigest:].cold.2((uint64_t)v16, v18, v19);

    v20 = objc_retainAutorelease(v10);
    *((_QWORD *)&v29 + 1) = objc_msgSend(v20, "bytes");
    *(_QWORD *)&v30 = objc_msgSend(v20, "length");
    if ((unint64_t)v30 >> 31)
    {
      v22 = 10;
    }
    else
    {
      *((_QWORD *)&v30 + 1) = a5;
      v21 = buildMetadataBuffer(&v28, v11, 1);
      if (v21)
      {
        v22 = v21;
      }
      else
      {
        v22 = AuthorizePresentmentFromAppleIDV(&v28);
        APPLEIDV_LOG_CLIENT();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          +[AppleIDVClient appleIDVAuthorizePresentment:withLAContextData:onSESlot:andPayloadDigest:].cold.1();

        if (v22 == -536870208)
          v22 = 11;
      }
    }
  }
  else
  {
    v22 = 5;
  }
  DIV_LOG_KEXT();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)v27 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF917000, v25, OS_SIGNPOST_INTERVAL_END, v13, "appleIDV.authorizePresentment", ", v27, 2u);
  }

  if (v31[0])
    free(v31[0]);

  return v22;
}

+ (unsigned)appleIDVAuthorizePresentment:(id)a3 withLAContextData:(id)a4 onSESlot:(int64_t)a5 andPublicKey:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  unsigned int v21;
  unsigned int v22;
  NSObject *v23;
  unsigned int v24;
  NSObject *v25;
  NSObject *v26;
  uint8_t v28[16];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32[2];
  __int128 v33;
  __int128 v34;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  *(_OWORD *)v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  DIV_LOG_KEXT();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);

  DIV_LOG_KEXT();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)v28 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF917000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "appleIDV.authorizePresentment", "enableTelemetry=YES", v28, 2u);
  }

  if (v9)
  {
    v16 = objc_retainAutorelease(v9);
    *(_QWORD *)&v29 = objc_msgSend(v16, "bytes");
    v17 = objc_msgSend(v16, "length");
    v32[0] = 0;
    v32[1] = 0;
    *((_QWORD *)&v29 + 1) = v17;
    APPLEIDV_LOG_CLIENT();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      +[AppleIDVClient appleIDVAuthorizePresentment:withLAContextData:onSESlot:andPayloadDigest:].cold.2((uint64_t)v16, v18, v19);

    v20 = objc_retainAutorelease(v10);
    *((_QWORD *)&v30 + 1) = objc_msgSend(v20, "bytes");
    *(_QWORD *)&v31 = objc_msgSend(v20, "length");
    if ((unint64_t)v31 >> 31)
    {
      v24 = 10;
    }
    else
    {
      v21 = buildMetadataBuffer(&v29, v11, 2);
      if (v21)
      {
        v24 = v21;
      }
      else
      {
        *((_QWORD *)&v31 + 1) = a5;
        v22 = AuthorizePresentmentFromAppleIDV(&v29);
        APPLEIDV_LOG_CLIENT();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          +[AppleIDVClient appleIDVAuthorizePresentment:withLAContextData:onSESlot:andPublicKey:].cold.1();

        if (v22)
        {
          if (v22 == -536870208)
            v24 = 11;
          else
            v24 = v22;
        }
        else
        {
          v24 = 0;
        }
      }
    }
  }
  else
  {
    v24 = 5;
  }
  DIV_LOG_KEXT();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)v28 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF917000, v26, OS_SIGNPOST_INTERVAL_END, v13, "appleIDV.authorizePresentment", ", v28, 2u);
  }

  if (v32[0])
    free(v32[0]);

  return v24;
}

+ (unsigned)appleIDVPersistACLBlob:(id)a3 intoBlob:(id *)a4 returnBioUUIDs:(id *)a5
{
  return +[AppleIDVClient appleIDVPersistACLBlob:intoBlob:returnBioUUIDs:andRequireDoublePress:](AppleIDVClient, "appleIDVPersistACLBlob:intoBlob:returnBioUUIDs:andRequireDoublePress:", a3, a4, a5, 0);
}

+ (unsigned)appleIDVPersistACLBlob:(id)a3 intoBlob:(id *)a4 returnBioUUIDs:(id *)a5 andRequireDoublePress:(unsigned __int8)a6
{
  int v6;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  unint64_t v14;
  id v15;
  unsigned int v16;
  id v17;
  unsigned int v18;
  unsigned int v19;
  id v20;
  uint64_t v21;
  size_t v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  int v27;
  id *v28;
  NSObject *v29;
  _BOOL4 v30;
  int v31;
  NSObject *v32;
  int v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  os_signpost_id_t spid;
  void *v42;
  unint64_t v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint8_t buf[16];

  v6 = a6;
  v9 = a3;
  v51 = 0;
  DIV_LOG_KEXT();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  DIV_LOG_KEXT();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v14 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF917000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "appleIDV.persistACLBlob", "enableTelemetry=YES", buf, 2u);
  }
  spid = v11;

  v15 = 0;
  v16 = 5;
  v17 = 0;
  if (v9 && a4)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 0x4000);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v17, "length");
    v18 = +[AppleIDVClient getUUIDsFromACL:intoArray:](AppleIDVClient, "getUUIDsFromACL:intoArray:", v9, a5);
    if (v18)
    {
      v16 = v18;
      v15 = 0;
      goto LABEL_40;
    }
    v50 = 0;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v45 = 0u;
    if (v6)
    {
      v44 = 0;
      v16 = +[AppleIDVClient requireDoublePressOnACL:intoACL:](AppleIDVClient, "requireDoublePressOnACL:intoACL:", v9, &v44);
      v15 = v44;
      if (v16)
        goto LABEL_40;
    }
    else
    {
      v15 = v9;
    }
    v15 = objc_retainAutorelease(v15);
    *(_QWORD *)&v45 = objc_msgSend(v15, "bytes");
    *((_QWORD *)&v45 + 1) = objc_msgSend(v15, "length");
    v19 = extractACLForSCRD(v45, *((uint64_t *)&v45 + 1), &v46, (_QWORD *)&v46 + 1);
    if (v19
      || (v20 = objc_retainAutorelease(v9),
          *(_QWORD *)&v47 = objc_msgSend(v20, "bytes"),
          *((_QWORD *)&v47 + 1) = objc_msgSend(v20, "length"),
          (v19 = extractACLForSCRD(v47, *((uint64_t *)&v47 + 1), &v48, (_QWORD *)&v48 + 1)) != 0))
    {
      v16 = v19;
      goto LABEL_40;
    }
    v50 = 0;
    v49 = 0xFFuLL;
    v17 = objc_retainAutorelease(v17);
    v21 = objc_msgSend(v17, "mutableBytes");
    *(_QWORD *)buf = 0;
    v42 = (void *)v21;
    v43 = v14;
    if ((_QWORD)v45)
    {
      if (*((_QWORD *)&v45 + 1) > 0xFFFFFFFEuLL)
        goto LABEL_47;
      if ((_QWORD)v47)
      {
        if (*((_QWORD *)&v47 + 1) <= 0xFFFFFFFEuLL)
        {
          v22 = 4096;
          v23 = malloc_type_malloc(0x1000uLL, 0x319BD72CuLL);
          v24 = v23;
          if (v23)
          {
            v22 = 4096;
            v52 = 4096;
            v25 = tlvEncodeWithCheck((uint64_t)v23, 32, (const void *)v45, DWORD2(v45), &v52, buf);
            if (v25)
            {
              v31 = v25;
            }
            else
            {
              v26 = tlvEncodeWithCheck((uint64_t)v24 + *(_QWORD *)buf, 33, &v46, 8u, &v52, buf);
              if (!v26)
              {
                v26 = tlvEncodeWithCheck((uint64_t)v24 + *(_QWORD *)buf, 34, (char *)&v46 + 8, 8u, &v52, buf);
                if (!v26)
                {
                  v26 = tlvEncodeWithCheck((uint64_t)v24 + *(_QWORD *)buf, 35, (const void *)v47, DWORD2(v47), &v52, buf);
                  if (!v26)
                  {
                    v26 = tlvEncodeWithCheck((uint64_t)v24 + *(_QWORD *)buf, 36, &v48, 8u, &v52, buf);
                    if (!v26)
                    {
                      v26 = tlvEncodeWithCheck((uint64_t)v24 + *(_QWORD *)buf, 37, (char *)&v48 + 8, 8u, &v52, buf);
                      if (!v26)
                      {
                        v27 = tlvEncodeWithCheck((uint64_t)v24 + *(_QWORD *)buf, 31, &v49, 8u, &v52, buf);
                        v28 = a4;
                        if (v27)
                        {
                          v31 = v27;
                          v22 = 4096;
                        }
                        else
                        {
                          APPLEIDV_LOG_CLIENT();
                          v29 = objc_claimAutoreleasedReturnValue();
                          v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
                          v22 = *(_QWORD *)buf;
                          if (v30)
                            +[AppleIDVClient appleIDVPersistACLBlob:intoBlob:returnBioUUIDs:andRequireDoublePress:].cold.4();

                          v31 = 0;
                        }
                        goto LABEL_28;
                      }
                    }
                  }
                }
              }
              v31 = v26;
              v22 = 4096;
            }
          }
          else
          {
            v31 = 9;
          }
LABEL_51:
          v28 = a4;
LABEL_28:
          APPLEIDV_LOG_CLIENT();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            +[AppleIDVClient appleIDVPersistACLBlob:intoBlob:returnBioUUIDs:andRequireDoublePress:].cold.3();

          if (v31)
            v33 = 5;
          else
            v33 = GenericAppleIDVCall(1u, v24, v22, v42, (size_t *)&v51);
          v14 = v43;
          if (v24)
            free(v24);
          APPLEIDV_LOG_CLIENT();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            +[AppleIDVClient appleIDVPersistACLBlob:intoBlob:returnBioUUIDs:andRequireDoublePress:].cold.2();

          APPLEIDV_LOG_CLIENT();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            +[AppleIDVClient appleIDVPersistACLBlob:intoBlob:returnBioUUIDs:andRequireDoublePress:].cold.1();

          if (v33)
          {
            if (v33 == -536870208)
              v16 = 11;
            else
              v16 = v33;
          }
          else
          {
            v36 = (void *)MEMORY[0x1E0C99D50];
            v17 = objc_retainAutorelease(v17);
            v37 = objc_msgSend(v17, "mutableBytes");
            objc_msgSend(v36, "dataWithBytes:length:", v37, v51);
            v16 = 0;
            *v28 = (id)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_40;
        }
LABEL_47:
        v24 = 0;
        v22 = 0;
        v31 = -75;
        goto LABEL_51;
      }
    }
    v24 = 0;
    v22 = 0;
    v31 = -6;
    goto LABEL_51;
  }
LABEL_40:
  DIV_LOG_KEXT();
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF917000, v39, OS_SIGNPOST_INTERVAL_END, spid, "appleIDV.persistACLBlob", ", buf, 2u);
  }

  return v16;
}

+ (unsigned)appleIDVRecoverPersistedACLBlob:(id)a3 intoBlob:(id *)a4
{
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  unsigned int v10;
  void *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  char *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v26;
  size_t v27;
  uint8_t buf[16];

  v5 = a3;
  DIV_LOG_KEXT();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  DIV_LOG_KEXT();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF917000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "appleIDV.recoverPersistedACL", "enableTelemetry=YES", buf, 2u);
  }

  v10 = 5;
  if (v5 && a4)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 0x4000);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_retainAutorelease(v5);
    v13 = objc_msgSend(v12, "bytes");
    v14 = objc_msgSend(v12, "length");
    v15 = objc_retainAutorelease(v11);
    v16 = objc_msgSend(v15, "mutableBytes");
    v26 = v16;
    v27 = 0x4000;
    if (v16)
    {
      v10 = 5;
      if (v13)
      {
        if (v14 <= 0xFFFFFFFE)
        {
          v17 = (void *)v16;
          v18 = (char *)malloc_type_malloc(0x1000uLL, 0x433BA0B3uLL);
          if (v18)
          {
            v19 = v18;
            *v18 = 60;
            *(_WORD *)(v18 + 1) = v14;
            v18[3] = BYTE2(v14);
            v18[4] = BYTE3(v14);
            __memcpy_chk();
            v10 = GenericAppleIDVCall(2u, v19, (v14 + 5), v17, &v27);
            free(v19);
          }
        }
      }
    }
    else
    {
      v10 = 18;
    }
    APPLEIDV_LOG_CLIENT();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      +[AppleIDVClient appleIDVRecoverPersistedACLBlob:intoBlob:].cold.3();

    APPLEIDV_LOG_CLIENT();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      +[AppleIDVClient appleIDVRecoverPersistedACLBlob:intoBlob:].cold.2();

    APPLEIDV_LOG_CLIENT();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      +[AppleIDVClient appleIDVRecoverPersistedACLBlob:intoBlob:].cold.1();

    if (v10)
    {
      if (v10 == -536870208)
        v10 = 11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v26, v27);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  DIV_LOG_KEXT();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF917000, v24, OS_SIGNPOST_INTERVAL_END, v7, "appleIDV.recoverPersistedACL", ", buf, 2u);
  }

  return v10;
}

+ (unsigned)appleIDVPersistModifiedSESlot:(int64_t)a3 withReferenceBlob:(id)a4 withLAContextData:(id)a5 intoBlob:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t v15;
  unsigned int v16;
  void *v17;
  id v18;
  const void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  const void *v24;
  unint64_t v25;
  unsigned int v26;
  size_t v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  int v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  os_signpost_id_t spid;
  id *v40;
  unint64_t v41;
  _QWORD v42[3];
  void *v43;
  size_t v44[3];
  uint64_t v45;
  uint8_t buf[16];

  v9 = a4;
  v10 = a5;
  DIV_LOG_KEXT();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  DIV_LOG_KEXT();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF917000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "appleIDV.persistModifiedSESlot", "enableTelemetry=YES", buf, 2u);
  }

  v16 = 5;
  spid = v12;
  if (v9 && v10 && a6)
  {
    v40 = a6;
    v41 = v12 - 1;
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 0x4000);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_retainAutorelease(v9);
    v19 = (const void *)objc_msgSend(v18, "bytes");
    v42[1] = v19;
    v20 = objc_msgSend(v18, "length");
    v42[2] = v20;
    v21 = objc_retainAutorelease(v17);
    v22 = (void *)objc_msgSend(v21, "mutableBytes");
    v43 = v22;
    v44[0] = 0x4000;
    v23 = objc_retainAutorelease(v10);
    v24 = (const void *)objc_msgSend(v23, "bytes");
    v44[1] = (size_t)v24;
    v25 = objc_msgSend(v23, "length");
    v44[2] = v25;
    v42[0] = a3;
    if (!v22)
    {
      v16 = 18;
      v15 = v41;
LABEL_25:
      APPLEIDV_LOG_CLIENT();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        +[AppleIDVClient appleIDVPersistModifiedSESlot:withReferenceBlob:withLAContextData:intoBlob:].cold.2();

      APPLEIDV_LOG_CLIENT();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        +[AppleIDVClient appleIDVPersistModifiedSESlot:withReferenceBlob:withLAContextData:intoBlob:].cold.1();

      if (v16)
      {
        if (v16 == -536870208)
          v16 = 11;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v43, v44[0]);
        *v40 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_32;
    }
    *(_QWORD *)buf = 0;
    if (v19)
    {
      if (!v20)
      {
LABEL_37:
        v29 = 0;
        v27 = 0;
        v32 = -75;
        goto LABEL_18;
      }
      if (v24)
      {
        v26 = v25;
        if (v25 <= 0xFFFFFFFE)
        {
          v27 = 4096;
          v28 = malloc_type_malloc(0x1000uLL, 0x83722CF8uLL);
          v29 = v28;
          if (v28)
          {
            v27 = 4096;
            v45 = 4096;
            v30 = tlvEncodeWithCheck((uint64_t)v28, 21, v24, v26, &v45, buf);
            if (v30)
            {
              v32 = v30;
            }
            else
            {
              v31 = tlvEncodeWithCheck((uint64_t)v29 + *(_QWORD *)buf, 70, v19, v20, &v45, buf);
              if (v31)
              {
                v32 = v31;
                v27 = 4096;
              }
              else
              {
                v32 = tlvEncodeWithCheck((uint64_t)v29 + *(_QWORD *)buf, 31, v42, 8u, &v45, buf);
                if (v32)
                  v27 = 4096;
                else
                  v27 = *(_QWORD *)buf;
              }
            }
          }
          else
          {
            v32 = 9;
          }
          goto LABEL_18;
        }
        goto LABEL_37;
      }
    }
    v29 = 0;
    v27 = 0;
    v32 = -6;
LABEL_18:
    APPLEIDV_LOG_CLIENT();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      +[AppleIDVClient appleIDVPersistModifiedSESlot:withReferenceBlob:withLAContextData:intoBlob:].cold.3();

    if (v32)
      v16 = 5;
    else
      v16 = GenericAppleIDVCall(0xBu, v29, v27, v22, v44);
    v15 = v41;
    if (v29)
      free(v29);
    goto LABEL_25;
  }
LABEL_32:
  DIV_LOG_KEXT();
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF917000, v37, OS_SIGNPOST_INTERVAL_END, spid, "appleIDV.persistModifiedSESlot", ", buf, 2u);
  }

  return v16;
}

+ (unsigned)appleIDVPersistModifiedACLBlob:(id)a3 withReferenceACLBlob:(id)a4 withLAContextData:(id)a5 intoBlob:(id *)a6 returnBioUUIDs:(id *)a7
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  unint64_t v18;
  id v19;
  unsigned int v20;
  unsigned int v21;
  id v22;
  unsigned int v23;
  id v24;
  id v25;
  unint64_t v26;
  void *v27;
  int v28;
  size_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  const void *v37;
  unsigned int v38;
  uint64_t v39;
  char *v40;
  const void *v41;
  unsigned int v42;
  int v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  unint64_t v50;
  os_signpost_id_t v51;
  uint64_t v52;
  unint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  unint64_t v58;
  uint8_t buf[16];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  DIV_LOG_KEXT();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_signpost_id_generate(v14);

  DIV_LOG_KEXT();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  v18 = v15 - 1;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF917000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "appleIDV.persistModifiedACL", "enableTelemetry=YES", buf, 2u);
  }

  v19 = 0;
  v20 = 5;
  if (v11 && v12 && v13 && a6 && a7)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 0x4000);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v21 = +[AppleIDVClient getUUIDsFromACL:intoArray:](AppleIDVClient, "getUUIDsFromACL:intoArray:", v11, a7);
    if (v21)
    {
      v20 = v21;
      goto LABEL_34;
    }
    v51 = v15;
    v58 = 0;
    v57 = 0u;
    v56 = 0u;
    v55 = 0u;
    v54 = 0u;
    v22 = objc_retainAutorelease(v11);
    v52 = objc_msgSend(v22, "bytes");
    v53 = objc_msgSend(v22, "length");
    v23 = extractACLForSCRD(v52, v53, &v54, (_QWORD *)&v54 + 1);
    if (v23)
    {
      v20 = v23;
      goto LABEL_34;
    }
    v50 = v15 - 1;
    v24 = objc_retainAutorelease(v12);
    *((_QWORD *)&v55 + 1) = objc_msgSend(v24, "bytes");
    *(_QWORD *)&v56 = objc_msgSend(v24, "length");
    v19 = objc_retainAutorelease(v19);
    *((_QWORD *)&v56 + 1) = objc_msgSend(v19, "mutableBytes");
    *(_QWORD *)&v57 = 0x4000;
    v25 = objc_retainAutorelease(v13);
    *((_QWORD *)&v57 + 1) = objc_msgSend(v25, "bytes");
    v26 = objc_msgSend(v25, "length");
    v58 = v26;
    v27 = (void *)*((_QWORD *)&v56 + 1);
    v28 = 18;
    if (!*((_QWORD *)&v56 + 1) || (unint64_t)v57 < 0x4000)
      goto LABEL_27;
    if (!*((_QWORD *)&v55 + 1))
      goto LABEL_38;
    if ((unint64_t)v56 <= 0xFFFFFFFE)
    {
      if (!v52)
        goto LABEL_38;
      if (v53 <= 0xFFFFFFFE)
      {
        if (*((_QWORD *)&v57 + 1))
        {
          if (v26 <= 0xFFFFFFFE)
          {
            v29 = 4096;
            v30 = (char *)malloc_type_malloc(0x1000uLL, 0x2A400C96uLL);
            v31 = v30;
            if (v30)
            {
              *v30 = 20;
              *(_DWORD *)(v30 + 1) = v53;
              __memcpy_chk();
              v32 = (v53 + 5);
              v33 = &v31[v32];
              *(_DWORD *)v33 = 2112;
              v33[4] = 0;
              v34 = *((_QWORD *)&v54 + 1);
              *(_QWORD *)(v33 + 5) = v54;
              *(_DWORD *)(v33 + 13) = 2113;
              v33[17] = 0;
              *(_QWORD *)(v33 + 18) = v34;
              v35 = v32 + 26;
              v36 = &v31[v32 + 26];
              v37 = (const void *)*((_QWORD *)&v57 + 1);
              v38 = v58;
              *v36 = 21;
              *(_DWORD *)(v36 + 1) = v38;
              memcpy(v36 + 5, v37, v38);
              v39 = v38 + 5 + v35;
              v40 = &v31[v39];
              v41 = (const void *)*((_QWORD *)&v55 + 1);
              v42 = v56;
              *v40 = 70;
              *(_DWORD *)(v40 + 1) = v42;
              memcpy(&v31[v39 + 5], v41, v42);
              v29 = v42 + 5 + v39;
              v43 = 1;
            }
            else
            {
              v43 = 0;
            }
            goto LABEL_21;
          }
          goto LABEL_39;
        }
LABEL_38:
        v31 = 0;
        v29 = 0;
        v43 = 0;
LABEL_21:
        APPLEIDV_LOG_CLIENT();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          +[AppleIDVClient appleIDVPersistModifiedACLBlob:withReferenceACLBlob:withLAContextData:intoBlob:returnBioUUIDs:].cold.3();

        if (v43)
          v28 = GenericAppleIDVCall(4u, v31, v29, v27, (size_t *)&v57);
        else
          v28 = 5;
        v15 = v51;
        if (v31)
          free(v31);
LABEL_27:
        APPLEIDV_LOG_CLIENT();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          +[AppleIDVClient appleIDVPersistModifiedACLBlob:withReferenceACLBlob:withLAContextData:intoBlob:returnBioUUIDs:].cold.2();

        APPLEIDV_LOG_CLIENT();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          +[AppleIDVClient appleIDVPersistModifiedACLBlob:withReferenceACLBlob:withLAContextData:intoBlob:returnBioUUIDs:].cold.1();

        if (v28)
        {
          if (v28 == -536870208)
            v20 = 11;
          else
            v20 = v28;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *((_QWORD *)&v56 + 1), (_QWORD)v57);
          v20 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        v18 = v50;
        goto LABEL_34;
      }
    }
LABEL_39:
    v31 = 0;
    v29 = 0;
    v43 = 0;
    goto LABEL_21;
  }
LABEL_34:
  DIV_LOG_KEXT();
  v47 = objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF917000, v48, OS_SIGNPOST_INTERVAL_END, v15, "appleIDV.persistModifiedACL", ", buf, 2u);
  }

  return v20;
}

+ (unsigned)appleIDVGeneratePrearmTrustKeyForWatchAndCopyPrivateKey:(id)a3 progenitorPublicKey:(id)a4 encryptedPrivateKey:(id *)a5 attestation:(id *)a6 publicKey:(id *)a7 keyBlob:(id *)a8
{
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  unint64_t v24;
  unsigned int v25;
  id v26;
  const void *v27;
  unint64_t v28;
  id v29;
  const void *v30;
  unsigned int v31;
  unsigned int v32;
  void *v33;
  void *v34;
  NSObject *v35;
  _BOOL4 v36;
  size_t v37;
  int v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned int v44;
  BOOL v45;
  BOOL v46;
  unsigned int v47;
  char v48;
  _BYTE *v49;
  NSObject *v50;
  NSObject *v51;
  os_signpost_id_t spid;
  _QWORD *v54;
  id v55;
  __int128 v56;
  uint64_t v57;
  uint8_t v58[16];
  uint8_t buf[4];
  unsigned int v60;
  unsigned int v61;
  _BYTE v62[4084];
  uint64_t v63;

  MEMORY[0x1E0C80A78](a1, a2, a3, a4, a5, a6, a7, a8);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v63 = *MEMORY[0x1E0C80C00];
  v19 = v18;
  v55 = v17;
  v56 = 0u;
  DIV_LOG_KEXT();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_signpost_id_generate(v20);

  DIV_LOG_KEXT();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  v24 = v21 - 1;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF917000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "appleIDV.generateTrustKey", "enableTelemetry=YES", buf, 2u);
  }

  v25 = 5;
  spid = v21;
  if (v19)
  {
    if (v15)
    {
      if (v13)
      {
        v54 = v9;
        if (v11)
        {
          v26 = objc_retainAutorelease(v19);
          v27 = (const void *)objc_msgSend(v26, "bytes");
          v28 = objc_msgSend(v26, "length");
          v29 = objc_retainAutorelease(v55);
          v30 = (const void *)objc_msgSend(v29, "bytes");
          v31 = objc_msgSend(v29, "length");
          *(_QWORD *)&v56 = buf;
          *((_QWORD *)&v56 + 1) = 4096;
          *(_QWORD *)v58 = 0;
          if (v27 && v28 <= 0xFFFFFFFE && (v32 = v31, (v33 = malloc_type_malloc(0x1000uLL, 0xDD85F511uLL)) != 0))
          {
            v34 = v33;
            v57 = 4096;
            if (tlvEncodeWithCheck((uint64_t)v33, 130, v27, v28, &v57, v58)
              || tlvEncodeWithCheck((uint64_t)v34 + *(_QWORD *)v58, 131, v30, v32, &v57, v58))
            {
              v38 = 5;
            }
            else
            {
              APPLEIDV_LOG_CLIENT();
              v35 = objc_claimAutoreleasedReturnValue();
              v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG);
              v37 = *(_QWORD *)v58;
              if (v36)
                +[AppleIDVClient appleIDVGeneratePrearmTrustKeyForWatchAndCopyPrivateKey:progenitorPublicKey:encryptedPrivateKey:attestation:publicKey:keyBlob:].cold.3();

              v38 = GenericAppleIDVCall(6u, v34, v37, buf, (size_t *)&v56 + 1);
            }
            free(v34);
          }
          else
          {
            v38 = 5;
          }
          APPLEIDV_LOG_CLIENT();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
            +[AppleIDVClient appleIDVGeneratePrearmTrustKeyForWatchAndCopyPrivateKey:progenitorPublicKey:encryptedPrivateKey:attestation:publicKey:keyBlob:].cold.2();

          APPLEIDV_LOG_CLIENT();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            +[AppleIDVClient appleIDVGeneratePrearmTrustKeyForWatchAndCopyPrivateKey:progenitorPublicKey:encryptedPrivateKey:attestation:publicKey:keyBlob:].cold.1();

          if (v38)
          {
            if (v38 == -536870208)
              v25 = 11;
            else
              v25 = v38;
          }
          else
          {
            v41 = *(unsigned int *)buf;
            v42 = v60;
            v43 = v61;
            v44 = *(_DWORD *)buf + v60;
            v45 = __CFADD__(*(_DWORD *)buf, v60);
            v46 = __CFADD__(v61, v44);
            v47 = v61 + v44;
            v48 = v46;
            v25 = 2;
            if (!v45 && (v48 & 1) == 0 && v47 <= 0xFF4)
            {
              objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v56);
              *v54 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v62, v41);
              *v15 = (id)objc_claimAutoreleasedReturnValue();
              v49 = &v62[v41];
              objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v49, v42);
              *v13 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v49[v42], v43);
              v25 = 0;
              *v11 = (id)objc_claimAutoreleasedReturnValue();
            }
          }
        }
      }
    }
  }
  DIV_LOG_KEXT();
  v50 = objc_claimAutoreleasedReturnValue();
  v51 = v50;
  if (v24 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
  {
    *(_WORD *)v58 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF917000, v51, OS_SIGNPOST_INTERVAL_END, spid, "appleIDV.generateTrustKey", ", v58, 2u);
  }

  return v25;
}

+ (unsigned)appleIDVUpdatePrearmTrustKeyForWatch:(id)a3 progenitorPublicKey:(id)a4 encryptedPrivateKey:(id *)a5 attestation:(id *)a6 publicKey:(id *)a7 keyBlob:(id *)a8
{
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  unint64_t v24;
  unsigned int v25;
  id v26;
  const void *v27;
  unint64_t v28;
  id v29;
  const void *v30;
  unint64_t v31;
  unsigned int v32;
  void *v33;
  void *v34;
  NSObject *v35;
  _BOOL4 v36;
  size_t v37;
  int v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned int v44;
  BOOL v45;
  BOOL v46;
  unsigned int v47;
  char v48;
  NSObject *v49;
  NSObject *v50;
  os_signpost_id_t spid;
  _QWORD *v53;
  id v54;
  __int128 v55;
  uint64_t v56;
  uint8_t v57[16];
  uint8_t buf[4];
  unsigned int v59;
  unsigned int v60;
  _BYTE v61[4084];
  uint64_t v62;

  MEMORY[0x1E0C80A78](a1, a2, a3, a4, a5, a6, a7, a8);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v62 = *MEMORY[0x1E0C80C00];
  v19 = v18;
  v54 = v17;
  v55 = 0u;
  DIV_LOG_KEXT();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_signpost_id_generate(v20);

  DIV_LOG_KEXT();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  v24 = v21 - 1;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF917000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "appleIDV.updateTrustKey", "enableTelemetry=YES", buf, 2u);
  }

  v25 = 5;
  spid = v21;
  if (v19)
  {
    if (v15)
    {
      if (v13)
      {
        if (v11)
        {
          v53 = v11;
          if (v9)
          {
            v26 = objc_retainAutorelease(v19);
            v27 = (const void *)objc_msgSend(v26, "bytes");
            v28 = objc_msgSend(v26, "length");
            v29 = objc_retainAutorelease(v54);
            v30 = (const void *)objc_msgSend(v29, "bytes");
            v31 = objc_msgSend(v29, "length");
            *(_QWORD *)&v55 = buf;
            *((_QWORD *)&v55 + 1) = 4096;
            *(_QWORD *)v57 = 0;
            if (v27
              && v28 <= 0xFFFFFFFE
              && v30
              && (v32 = v31, v31 <= 0xFFFFFFFE)
              && (v33 = malloc_type_malloc(0x1000uLL, 0x56575402uLL)) != 0)
            {
              v34 = v33;
              v56 = 4096;
              if (tlvEncodeWithCheck((uint64_t)v33, 132, v27, v28, &v56, v57)
                || tlvEncodeWithCheck((uint64_t)v34 + *(_QWORD *)v57, 133, v30, v32, &v56, v57))
              {
                v38 = 5;
              }
              else
              {
                APPLEIDV_LOG_CLIENT();
                v35 = objc_claimAutoreleasedReturnValue();
                v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG);
                v37 = *(_QWORD *)v57;
                if (v36)
                  +[AppleIDVClient appleIDVUpdatePrearmTrustKeyForWatch:progenitorPublicKey:encryptedPrivateKey:attestation:publicKey:keyBlob:].cold.3();

                v38 = GenericAppleIDVCall(0xCu, v34, v37, buf, (size_t *)&v55 + 1);
              }
              free(v34);
            }
            else
            {
              v38 = 5;
            }
            APPLEIDV_LOG_CLIENT();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
              +[AppleIDVClient appleIDVUpdatePrearmTrustKeyForWatch:progenitorPublicKey:encryptedPrivateKey:attestation:publicKey:keyBlob:].cold.2();

            APPLEIDV_LOG_CLIENT();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
              +[AppleIDVClient appleIDVUpdatePrearmTrustKeyForWatch:progenitorPublicKey:encryptedPrivateKey:attestation:publicKey:keyBlob:].cold.1();

            if (v38)
            {
              if (v38 == -536870208)
                v25 = 11;
              else
                v25 = v38;
            }
            else
            {
              v42 = *(unsigned int *)buf;
              v41 = v59;
              v43 = v60;
              v44 = *(_DWORD *)buf + v59;
              v45 = __CFADD__(*(_DWORD *)buf, v59);
              v46 = __CFADD__(v60, v44);
              v47 = v60 + v44;
              v48 = v46;
              v25 = 2;
              if (!v45 && (v48 & 1) == 0 && v47 <= 0xFF4)
              {
                objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v55);
                *v9 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v61, v42);
                *v15 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v61[v42], v41);
                *v13 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v61[v42 + v41], v43);
                v25 = 0;
                *v53 = (id)objc_claimAutoreleasedReturnValue();
              }
            }
          }
        }
      }
    }
  }
  DIV_LOG_KEXT();
  v49 = objc_claimAutoreleasedReturnValue();
  v50 = v49;
  if (v24 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
  {
    *(_WORD *)v57 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF917000, v50, OS_SIGNPOST_INTERVAL_END, spid, "appleIDV.updateTrustKey", ", v57, 2u);
  }

  return v25;
}

+ (unsigned)appleIDVGeneratePhoneTokenWithNonce:(id)a3 withReferenceACLBlob:(id)a4 keyBlob:(id)a5 keyAttestation:(id)a6 casdCertificate:(id)a7 phoneToken:(id *)a8
{
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  os_signpost_id_t v25;
  NSObject *v26;
  NSObject *v27;
  unint64_t v28;
  unsigned int v29;
  unint64_t v30;
  id v31;
  const void *v32;
  unint64_t v33;
  id v34;
  const void *v35;
  unint64_t v36;
  id v37;
  const void *v38;
  unint64_t v39;
  id v40;
  id v41;
  BOOL v42;
  void *v43;
  void *v44;
  size_t v45;
  NSObject *v46;
  int v47;
  _QWORD *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  os_signpost_id_t spid;
  const void *v56;
  const void *v57;
  void *v58;
  unint64_t v59;
  _QWORD *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  const void *v67;
  __int128 v68;
  uint64_t v69;
  uint8_t v70[16];
  uint8_t buf[4096];
  uint64_t v72;

  MEMORY[0x1E0C80A78](a1, a2, a3, a4, a5, a6, a7, a8);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v72 = *MEMORY[0x1E0C80C00];
  v19 = v18;
  v20 = v17;
  v21 = v15;
  v22 = v13;
  v23 = v11;
  v68 = 0u;
  DIV_LOG_KEXT();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = os_signpost_id_generate(v24);

  DIV_LOG_KEXT();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v26;
  spid = v25;
  v28 = v25 - 1;
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF917000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "appleIDV.generatePhoneToken", "enableTelemetry=YES", buf, 2u);
  }

  v29 = 5;
  if (v19 && v20 && v21 && v9)
  {
    if ((v22 == 0) != (v23 == 0))
    {
      v29 = 1;
    }
    else
    {
      v59 = v25 - 1;
      v60 = v9;
      v58 = (void *)objc_opt_new();
      objc_msgSend(v58, "externalizedContext");
      *(_QWORD *)&v68 = buf;
      *((_QWORD *)&v68 + 1) = 4096;
      v66 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v67 = (const void *)objc_msgSend(v66, "bytes");
      v30 = objc_msgSend(v66, "length");
      v64 = v20;
      v31 = objc_retainAutorelease(v20);
      v32 = (const void *)objc_msgSend(v31, "bytes");
      v33 = objc_msgSend(v31, "length");
      v65 = v19;
      v34 = objc_retainAutorelease(v19);
      v35 = (const void *)objc_msgSend(v34, "bytes");
      v36 = objc_msgSend(v34, "length");
      v63 = v21;
      v37 = objc_retainAutorelease(v21);
      v38 = (const void *)objc_msgSend(v37, "bytes");
      v39 = objc_msgSend(v37, "length");
      v62 = v22;
      if (v22)
      {
        v40 = objc_retainAutorelease(v22);
        v57 = (const void *)objc_msgSend(v40, "bytes");
        v22 = (id)objc_msgSend(v40, "length");
      }
      else
      {
        v57 = 0;
      }
      v61 = v23;
      if (v23)
      {
        v41 = objc_retainAutorelease(v23);
        v56 = (const void *)objc_msgSend(v41, "bytes");
        v23 = (id)objc_msgSend(v41, "length");
      }
      else
      {
        v56 = 0;
      }
      *(_QWORD *)v70 = 0;
      if (v35
        && (!v32 ? (v42 = v33 == 0) : (v42 = 1),
            v42
         && v67
         && v38
         && v33 <= 0xFFFFFFFE
         && v36 <= 0xFFFFFFFE
         && v30 <= 0xFFFFFFFE
         && v39 <= 0xFFFFFFFE
         && (unint64_t)v22 <= 0xFFFFFFFE
         && (unint64_t)v23 <= 0xFFFFFFFE
         && (v43 = malloc_type_malloc(0x1000uLL, 0xCE483C7DuLL)) != 0))
      {
        v44 = v43;
        v69 = 4096;
        if (tlvEncodeWithCheck((uint64_t)v43, 100, v35, v36, &v69, v70)
          || tlvEncodeWithCheck((uint64_t)v44 + *(_QWORD *)v70, 101, v32, v33, &v69, v70)
          || tlvEncodeWithCheck((uint64_t)v44 + *(_QWORD *)v70, 102, v67, v30, &v69, v70)
          || tlvEncodeWithCheck((uint64_t)v44 + *(_QWORD *)v70, 103, v38, v39, &v69, v70)
          || tlvEncodeWithCheck((uint64_t)v44 + *(_QWORD *)v70, 105, v57, v22, &v69, v70)
          || tlvEncodeWithCheck((uint64_t)v44 + *(_QWORD *)v70, 106, v56, v23, &v69, v70))
        {
          v47 = 5;
        }
        else
        {
          v45 = *(_QWORD *)v70;
          APPLEIDV_LOG_CLIENT();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            +[AppleIDVClient appleIDVGeneratePhoneTokenWithNonce:withReferenceACLBlob:keyBlob:keyAttestation:casdCertificate:phoneToken:].cold.3(v46);

          v47 = GenericAppleIDVCall(5u, v44, v45, buf, (size_t *)&v68 + 1);
        }
        v19 = v65;
        v22 = v62;
        v21 = v63;
        v48 = v60;
        v23 = v61;
        v49 = v58;
        v28 = v59;
        free(v44);
        v20 = v64;
      }
      else
      {
        v47 = 5;
        v20 = v64;
        v19 = v65;
        v22 = v62;
        v21 = v63;
        v48 = v60;
        v23 = v61;
        v49 = v58;
        v28 = v59;
      }
      APPLEIDV_LOG_CLIENT();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        +[AppleIDVClient appleIDVGeneratePhoneTokenWithNonce:withReferenceACLBlob:keyBlob:keyAttestation:casdCertificate:phoneToken:].cold.2();

      APPLEIDV_LOG_CLIENT();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        +[AppleIDVClient appleIDVGeneratePhoneTokenWithNonce:withReferenceACLBlob:keyBlob:keyAttestation:casdCertificate:phoneToken:].cold.1();

      if (v47)
      {
        if (v47 == -536870208)
          v29 = 11;
        else
          v29 = v47;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v68);
        v29 = 0;
        *v48 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
  }
  DIV_LOG_KEXT();
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = v52;
  if (v28 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
  {
    *(_WORD *)v70 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF917000, v53, OS_SIGNPOST_INTERVAL_END, spid, "appleIDV.generatePhoneToken", ", v70, 2u);
  }

  return v29;
}

+ (unsigned)appleIDVEstablishPrearmTrustWithCertificate:(id)a3 protectedPublicKey:(id *)a4
{
  _QWORD *v4;
  _QWORD *v5;
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  unsigned int v12;
  id v13;
  const void *v14;
  unint64_t v15;
  unsigned int v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  size_t v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  __int128 v28;
  uint64_t v29;
  uint8_t v30[16];
  uint8_t buf[4104];
  uint64_t v32;

  ((void (*)(id, SEL, id, id *))MEMORY[0x1E0C80A78])(a1, a2, a3, a4);
  v5 = v4;
  v32 = *MEMORY[0x1E0C80C00];
  v7 = v6;
  v28 = 0u;
  DIV_LOG_KEXT();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  DIV_LOG_KEXT();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF917000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "appleIDV.establishPrearmTrust", "enableTelemetry=YES", buf, 2u);
  }

  v12 = 5;
  if (v7 && v5)
  {
    *(_QWORD *)&v28 = buf;
    *((_QWORD *)&v28 + 1) = 4096;
    v13 = objc_retainAutorelease(v7);
    v14 = (const void *)objc_msgSend(v13, "bytes", 0, 0);
    v15 = objc_msgSend(v13, "length", v14);
    *(_QWORD *)v30 = 0;
    if (v14 && (v16 = v15, v15 <= 0xFFFFFFFE) && (v17 = malloc_type_malloc(0x1000uLL, 0xF28AF4D6uLL)) != 0)
    {
      v18 = v17;
      v29 = 4096;
      if (tlvEncodeWithCheck((uint64_t)v17, 90, v14, v16, &v29, v30))
      {
        v22 = 5;
      }
      else
      {
        APPLEIDV_LOG_CLIENT();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
        v21 = *(_QWORD *)v30;
        if (v20)
          +[AppleIDVClient appleIDVEstablishPrearmTrustWithCertificate:protectedPublicKey:].cold.3();

        v22 = GenericAppleIDVCall(0xAu, v18, v21, buf, (size_t *)&v28 + 1);
      }
      free(v18);
    }
    else
    {
      v22 = 5;
    }
    APPLEIDV_LOG_CLIENT();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      +[AppleIDVClient appleIDVEstablishPrearmTrustWithCertificate:protectedPublicKey:].cold.2();

    APPLEIDV_LOG_CLIENT();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      +[AppleIDVClient appleIDVEstablishPrearmTrustWithCertificate:protectedPublicKey:].cold.1();

    if (v22)
    {
      if (v22 == -536870208)
        v12 = 11;
      else
        v12 = v22;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v28);
      v12 = 0;
      *v5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  DIV_LOG_KEXT();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)v30 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF917000, v26, OS_SIGNPOST_INTERVAL_END, v9, "appleIDV.establishPrearmTrust", ", v30, 2u);
  }

  return v12;
}

+ (unsigned)appleIDVGenerateNonceOnWatch:(id *)a3
{
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  unsigned int v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v14[8];
  size_t v15;
  uint8_t buf[40];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15 = 32;
  DIV_LOG_KEXT();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_generate(v4);

  DIV_LOG_KEXT();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF917000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "appleIDV.establishPrearmTrust", "enableTelemetry=YES", buf, 2u);
  }

  if (a3)
  {
    v8 = GenericAppleIDVCall(7u, 0, 0, buf, &v15);
    APPLEIDV_LOG_CLIENT();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      +[AppleIDVClient appleIDVGenerateNonceOnWatch:].cold.2();

    APPLEIDV_LOG_CLIENT();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      +[AppleIDVClient appleIDVGenerateNonceOnWatch:].cold.1();

    if (v8)
    {
      if (v8 == -536870208)
        v8 = 11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buf, v15);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v8 = 5;
  }
  DIV_LOG_KEXT();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF917000, v12, OS_SIGNPOST_INTERVAL_END, v5, "appleIDV.establishPrearmTrust", ", v14, 2u);
  }

  return v8;
}

+ (unsigned)appleIDVPrearmCredentialWithAuthorizationToken:(id)a3 protectedPublicKey:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  const void *v12;
  unint64_t v13;
  id v14;
  const void *v15;
  unint64_t v16;
  unsigned int v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  size_t v22;
  int v23;
  NSObject *v24;
  NSObject *v25;
  unsigned int v26;
  NSObject *v27;
  NSObject *v28;
  size_t v30;
  uint64_t v31;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  DIV_LOG_KEXT();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  DIV_LOG_KEXT();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF917000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "appleIDV.prearmCredential", "enableTelemetry=YES", buf, 2u);
  }

  if (v5)
  {
    v11 = objc_retainAutorelease(v5);
    v12 = (const void *)objc_msgSend(v11, "bytes");
    v13 = objc_msgSend(v11, "length");
    v14 = objc_retainAutorelease(v6);
    v15 = (const void *)objc_msgSend(v14, "bytes");
    v16 = objc_msgSend(v14, "length");
    v30 = 0;
    *(_QWORD *)buf = 0;
    if (v12
      && v13 <= 0xFFFFFFFE
      && v15
      && (v17 = v16, v16 <= 0xFFFFFFFE)
      && (v18 = malloc_type_malloc(0x1000uLL, 0xCF638DD2uLL)) != 0)
    {
      v19 = v18;
      v31 = 4096;
      if (tlvEncodeWithCheck((uint64_t)v18, 80, v12, v13, &v31, buf)
        || tlvEncodeWithCheck((uint64_t)v19 + *(_QWORD *)buf, 81, v15, v17, &v31, buf))
      {
        v23 = 5;
      }
      else
      {
        APPLEIDV_LOG_CLIENT();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
        v22 = *(_QWORD *)buf;
        if (v21)
          +[AppleIDVClient appleIDVPrearmCredentialWithAuthorizationToken:protectedPublicKey:].cold.3();

        v23 = GenericAppleIDVCall(8u, v19, v22, buf, &v30);
      }
      free(v19);
    }
    else
    {
      v23 = 5;
    }
    APPLEIDV_LOG_CLIENT();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      +[AppleIDVClient appleIDVPrearmCredentialWithAuthorizationToken:protectedPublicKey:].cold.2();

    APPLEIDV_LOG_CLIENT();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      +[AppleIDVClient appleIDVPrearmCredentialWithAuthorizationToken:protectedPublicKey:].cold.1();

    if (v23)
    {
      if (v23 == -536870208)
        v26 = 11;
      else
        v26 = v23;
    }
    else
    {
      v26 = 0;
    }
  }
  else
  {
    v26 = 5;
  }
  DIV_LOG_KEXT();
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF917000, v28, OS_SIGNPOST_INTERVAL_END, v8, "appleIDV.prearmCredential", ", buf, 2u);
  }

  return v26;
}

+ (unsigned)appleIDVRevokeCredentialAuthorizationToken
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  NSObject *v7;
  int v8;
  unsigned int v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v13[16];
  uint8_t buf[16];
  size_t v15;
  char v16;

  DIV_LOG_KEXT();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  DIV_LOG_KEXT();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF917000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "appleIDV.revokeCredential", "enableTelemetry=YES", buf, 2u);
  }

  v15 = 0;
  v6 = GenericAppleIDVCall(9u, 0, 0, &v16, &v15);
  APPLEIDV_LOG_CLIENT();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[AppleIDVClient appleIDVRevokeCredentialAuthorizationToken].cold.1();

  if (v6 == -536870208)
    v8 = 11;
  else
    v8 = v6;
  if (v6)
    v9 = v8;
  else
    v9 = 0;
  DIV_LOG_KEXT();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF917000, v11, OS_SIGNPOST_INTERVAL_END, v3, "appleIDV.revokeCredential", ", v13, 2u);
  }

  return v9;
}

+ (unsigned)prepareUnboundACLForWatch:(id *)a3 withAccessibilityEnabled:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  SecAccessControlRef v10;
  SecAccessControlRef v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  unsigned int v16;
  NSObject *v17;
  NSObject *v18;
  id v20;
  CFErrorRef error;
  _QWORD v22[2];
  _QWORD v23[2];
  const __CFString *v24;
  _QWORD v25[2];

  v4 = a4;
  v25[1] = *MEMORY[0x1E0C80C00];
  error = 0;
  v6 = (void *)objc_opt_new();
  v24 = CFSTR("osgn");
  v22[0] = CFSTR("cpo");
  v22[1] = CFSTR("pidvaccess");
  v7 = MEMORY[0x1E0C9AAA0];
  if (v4)
    v7 = MEMORY[0x1E0C9AAB0];
  v23[0] = CFSTR("IDVPolicy");
  v23[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    v10 = SecAccessControlCreateWithFlags((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFTypeRef)*MEMORY[0x1E0CD68B0], 0x10uLL, &error);
    if (v10)
    {
      v11 = v10;
      v20 = 0;
      objc_msgSend(v6, "evaluateAccessControl:operation:options:error:", v10, 0, 0, &v20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v20;

      if (v12)
      {
        SecAccessControlSetConstraints();
        v14 = (void *)SecAccessControlCopyData();
        if (v14)
        {
          v15 = objc_retainAutorelease(v14);
          v16 = 0;
          *a3 = v15;
        }
        else
        {
          APPLEIDV_LOG_CLIENT();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            +[AppleIDVClient prepareUnboundACLForWatch:withAccessibilityEnabled:].cold.3();

          v15 = 0;
          v16 = 13;
        }
      }
      else
      {
        APPLEIDV_LOG_CLIENT();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          +[AppleIDVClient prepareUnboundACLForWatch:withAccessibilityEnabled:].cold.2();

        v15 = 0;
        v16 = 16;
      }
      CFRelease(v11);

    }
    else
    {
      APPLEIDV_LOG_CLIENT();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[AppleIDVClient prepareUnboundACLForWatch:withAccessibilityEnabled:].cold.1();
      v16 = 13;
    }

  }
  else
  {
    v16 = 5;
  }

  return v16;
}

+ (unsigned)appleIDVCredentialAuthenticationTokenStatus
{
  void *v2;
  SecAccessControlRef v3;
  SecAccessControlRef v4;
  void *v5;
  NSObject *v6;
  unsigned int v7;
  NSObject *v8;
  id v10;
  CFErrorRef error;

  error = 0;
  v2 = (void *)objc_opt_new();
  v3 = SecAccessControlCreateWithFlags((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFTypeRef)*MEMORY[0x1E0CD68B0], 0x40000000uLL, &error);
  if (v3)
  {
    v4 = v3;
    SecAccessControlSetConstraints();
    v10 = 0;
    objc_msgSend(v2, "evaluateAccessControl:operation:options:error:", v4, 3, 0, &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;

    if (v5)
    {
      v7 = 0;
    }
    else
    {
      APPLEIDV_LOG_CLIENT();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[AppleIDVClient appleIDVCredentialAuthenticationTokenStatus].cold.2();

      v7 = 21;
    }
    CFRelease(v4);
  }
  else
  {
    APPLEIDV_LOG_CLIENT();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[AppleIDVClient appleIDVCredentialAuthenticationTokenStatus].cold.1();
    v7 = 13;
  }

  return v7;
}

+ (void)requireDoublePressOnACL:(uint64_t)a1 intoACL:(void *)a2 .cold.1(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  os_log_t v4;
  int v5;

  v2 = *a2;
  v5 = 136315906;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_19(&dword_1CF917000, v3, v4, "%s:%d, failed to create ACL from input %@, error: (%@)", v5);

  OUTLINED_FUNCTION_10();
}

+ (void)getUUIDsFromACL:(uint64_t)a1 intoArray:(void *)a2 .cold.1(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  os_log_t v4;
  int v5;

  v2 = *a2;
  v5 = 136315906;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_19(&dword_1CF917000, v3, v4, "%s:%d, failed to create ACL from input %@, error: %@", v5);

  OUTLINED_FUNCTION_10();
}

+ (void)prepareACLForPhoneDecryption:withSubType:forBioUUID:.cold.1()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_17(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1CF917000, v1, v2, "%s:%d, failed to create ACL (%@)", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_10();
}

+ (void)prepareACLForPhoneDecryption:withSubType:forBioUUID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1CF917000, v0, v1, "%s:%d, failed to get constraints", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

+ (void)prepareACLForPhoneDecryption:withSubType:forBioUUID:.cold.3()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315906;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_12(&dword_1CF917000, v0, (uint64_t)v0, "%s:%d, ACL is %@, constraints are %@", (uint8_t *)v1);
  OUTLINED_FUNCTION_11();
}

+ (void)prepareACLForPhoneDecryption:withSubType:forBioUUID:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1CF917000, v0, v1, "%s:%d, could not find 'od' constraint", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

+ (void)prepareACLForPhoneDecryption:withSubType:forBioUUID:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1CF917000, v0, v1, "%s:%d, could not find 'cbio' attribute", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

+ (void)prepareACLForWatchDecryption:withSubType:forAclUsage:.cold.1()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_17(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1CF917000, v1, v2, "%s:%d, failed to create ACL (%@)", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_10();
}

+ (void)prepareACLForWatchDecryption:withSubType:forAclUsage:.cold.2()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315906;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_12(&dword_1CF917000, v0, (uint64_t)v0, "%s:%d, ACL is %@, constraints are %@", (uint8_t *)v1);
  OUTLINED_FUNCTION_11();
}

+ (void)prepareACLForWatchDecryption:(int)a1 withSubType:(int)a2 forAclUsage:(os_log_t)log .cold.3(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl(&dword_1CF917000, log, OS_LOG_TYPE_ERROR, "Unsupported use case %d / %d", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_3();
}

+ (void)prepareACLForWatchDecryption:withSubType:forAclUsage:.cold.4()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_17(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1CF917000, v1, v2, "%s:%d, failed to create ACL (%@)", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_10();
}

+ (void)prepareUnboundACLForBioBinding:.cold.1()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_17(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1CF917000, v1, v2, "%s:%d, failed to create ACL (%@)", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_10();
}

+ (void)prepareUnboundACLForBioBinding:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1CF917000, v0, v1, "%s:%d, failed to get constraints", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

+ (void)prepareUnboundACLForBioBinding:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4(&dword_1CF917000, v0, v1, "%s:%d, failed to prepare ACL for item creation (%@)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_11();
}

+ (void)prepareUnboundACLForBioBinding:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1CF917000, v0, v1, "%s:%d, could not find 'od' constraint", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

+ (void)prepareUnboundACLForBioBinding:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1CF917000, v0, v1, "%s:%d, could not find 'cbio' attribute", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

+ (void)prepareUnboundACLForPasscodeBinding:.cold.1()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_17(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1CF917000, v1, v2, "%s:%d, failed to create ACL (%@)", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_10();
}

+ (void)prepareUnboundACLForPasscodeBinding:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1CF917000, v0, v1, "%s:%d, failed to get constraints", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

+ (void)prepareUnboundACLForPasscodeBinding:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4(&dword_1CF917000, v0, v1, "%s:%d, failed to prepare ACL for item creation (%@)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_11();
}

+ (void)prepareUnboundACLForPasscodeBinding:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1CF917000, v0, v1, "%s:%d, could not find 'od' constraint", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

+ (void)prepareUnboundACLForPasscodeBinding:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1CF917000, v0, v1, "%s:%d, could not find 'cup' attribute", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVGetStatus:andSIDVVersion:andAppleIDVVersion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CF917000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVGetStatus:andSIDVVersion:andAppleIDVVersion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CF917000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVAuthorizePresentment:withLAContextData:onSESlot:andPayloadDigest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CF917000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVAuthorizePresentment:(uint64_t)a3 withLAContextData:onSESlot:andPayloadDigest:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_18(&dword_1CF917000, a2, a3, "ACL Blob produced : %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVAuthorizePresentment:withLAContextData:onSESlot:andPublicKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CF917000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVPersistACLBlob:intoBlob:returnBioUUIDs:andRequireDoublePress:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CF917000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVPersistACLBlob:intoBlob:returnBioUUIDs:andRequireDoublePress:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CF917000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVPersistACLBlob:intoBlob:returnBioUUIDs:andRequireDoublePress:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15(&dword_1CF917000, v0, v1, "[%d] err = %d", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVPersistACLBlob:intoBlob:returnBioUUIDs:andRequireDoublePress:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315906;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_12(&dword_1CF917000, v0, v1, "[%s:%d] allocated %zu and used %zu", (uint8_t *)v2);
  OUTLINED_FUNCTION_11();
}

+ (void)appleIDVRecoverPersistedACLBlob:intoBlob:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CF917000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVRecoverPersistedACLBlob:intoBlob:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1CF917000, v0, v1, "At %s:%d, res=%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVRecoverPersistedACLBlob:intoBlob:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_13(&dword_1CF917000, v0, v1, "[line %d] kret = %d %x", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVPersistModifiedSESlot:withReferenceBlob:withLAContextData:intoBlob:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CF917000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVPersistModifiedSESlot:withReferenceBlob:withLAContextData:intoBlob:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CF917000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVPersistModifiedSESlot:withReferenceBlob:withLAContextData:intoBlob:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15(&dword_1CF917000, v0, v1, "[%d] err = %d", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVPersistModifiedACLBlob:withReferenceACLBlob:withLAContextData:intoBlob:returnBioUUIDs:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_13(&dword_1CF917000, v0, v1, "[line %d] kret = %d %x", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVPersistModifiedACLBlob:withReferenceACLBlob:withLAContextData:intoBlob:returnBioUUIDs:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CF917000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVPersistModifiedACLBlob:withReferenceACLBlob:withLAContextData:intoBlob:returnBioUUIDs:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15(&dword_1CF917000, v0, v1, "[%d] err = %d", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVGeneratePrearmTrustKeyForWatchAndCopyPrivateKey:progenitorPublicKey:encryptedPrivateKey:attestation:publicKey:keyBlob:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_13(&dword_1CF917000, v0, v1, "[line %d] kret = %d %x", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVGeneratePrearmTrustKeyForWatchAndCopyPrivateKey:progenitorPublicKey:encryptedPrivateKey:attestation:publicKey:keyBlob:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CF917000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVGeneratePrearmTrustKeyForWatchAndCopyPrivateKey:progenitorPublicKey:encryptedPrivateKey:attestation:publicKey:keyBlob:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315906;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_12(&dword_1CF917000, v0, v1, "[%s:%d] allocated %zu and used %zu", (uint8_t *)v2);
  OUTLINED_FUNCTION_11();
}

+ (void)appleIDVUpdatePrearmTrustKeyForWatch:progenitorPublicKey:encryptedPrivateKey:attestation:publicKey:keyBlob:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_13(&dword_1CF917000, v0, v1, "[line %d] kret = %d %x", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVUpdatePrearmTrustKeyForWatch:progenitorPublicKey:encryptedPrivateKey:attestation:publicKey:keyBlob:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CF917000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVUpdatePrearmTrustKeyForWatch:progenitorPublicKey:encryptedPrivateKey:attestation:publicKey:keyBlob:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315906;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_12(&dword_1CF917000, v0, v1, "[%s:%d] allocated %zu and used %zu", (uint8_t *)v2);
  OUTLINED_FUNCTION_11();
}

+ (void)appleIDVGeneratePhoneTokenWithNonce:withReferenceACLBlob:keyBlob:keyAttestation:casdCertificate:phoneToken:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CF917000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVGeneratePhoneTokenWithNonce:withReferenceACLBlob:keyBlob:keyAttestation:casdCertificate:phoneToken:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CF917000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVGeneratePhoneTokenWithNonce:(os_log_t)log withReferenceACLBlob:keyBlob:keyAttestation:casdCertificate:phoneToken:.cold.3(os_log_t log)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = 634;
  _os_log_debug_impl(&dword_1CF917000, log, OS_LOG_TYPE_DEBUG, "[line %d] serialized", (uint8_t *)v1, 8u);
}

+ (void)appleIDVEstablishPrearmTrustWithCertificate:protectedPublicKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CF917000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVEstablishPrearmTrustWithCertificate:protectedPublicKey:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CF917000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVEstablishPrearmTrustWithCertificate:protectedPublicKey:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315906;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_12(&dword_1CF917000, v0, v1, "[%s:%d] allocated %zu and used %zu", (uint8_t *)v2);
  OUTLINED_FUNCTION_11();
}

+ (void)appleIDVGenerateNonceOnWatch:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CF917000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVGenerateNonceOnWatch:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CF917000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVPrearmCredentialWithAuthorizationToken:protectedPublicKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CF917000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVPrearmCredentialWithAuthorizationToken:protectedPublicKey:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CF917000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)appleIDVPrearmCredentialWithAuthorizationToken:protectedPublicKey:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315906;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_12(&dword_1CF917000, v0, v1, "[%s:%d] allocated %zu and used %zu", (uint8_t *)v2);
  OUTLINED_FUNCTION_11();
}

+ (void)appleIDVRevokeCredentialAuthorizationToken
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_13(&dword_1CF917000, v0, v1, "[line %d] kret = %d %x", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_3();
}

+ (void)prepareUnboundACLForWatch:withAccessibilityEnabled:.cold.1()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_17(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1CF917000, v1, v2, "%s:%d, failed to create ACL (%@)", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_10();
}

+ (void)prepareUnboundACLForWatch:withAccessibilityEnabled:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4(&dword_1CF917000, v0, v1, "%s:%d, failed to prepare ACL for item creation (%@)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_11();
}

+ (void)prepareUnboundACLForWatch:withAccessibilityEnabled:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4(&dword_1CF917000, v0, v1, "%s:%d, failed to copy acl data from acl %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_11();
}

+ (void)appleIDVCredentialAuthenticationTokenStatus
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4(&dword_1CF917000, v0, v1, "%s:%d, Failed to retrieve credential authentication token, this is a non-fatal error (%@)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_11();
}

@end
