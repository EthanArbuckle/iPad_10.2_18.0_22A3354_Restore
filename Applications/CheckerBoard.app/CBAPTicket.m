@implementation CBAPTicket

+ (id)sharedInstance
{
  if (qword_10008BD70 != -1)
    dispatch_once(&qword_10008BD70, &stru_100075DC0);
  return (id)qword_10008BD68;
}

- (CBAPTicket)init
{
  CBAPTicket *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSData *apTicket;
  unsigned __int8 v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  _BOOL4 isValid;
  objc_super v13;
  uint8_t buf[4];
  _BOOL4 v15;
  __int16 v16;
  _BOOL4 v17;

  v13.receiver = self;
  v13.super_class = (Class)CBAPTicket;
  v2 = -[CBAPTicket init](&v13, "init");
  if (v2)
  {
    v3 = CheckerBoardLogHandleForCategory(1);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Loading APTicket...", buf, 2u);
    }

    v5 = objc_claimAutoreleasedReturnValue(-[CBAPTicket _loadAPTicket](v2, "_loadAPTicket"));
    apTicket = v2->_apTicket;
    v2->_apTicket = (NSData *)v5;

    if (v2->_apTicket)
      v7 = -[CBAPTicket _verifyAPTicketDigest:](v2, "_verifyAPTicketDigest:");
    else
      v7 = 0;
    v2->_isValid = v7;
    v8 = CheckerBoardLogHandleForCategory(1);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v2->_apTicket != 0;
      isValid = v2->_isValid;
      *(_DWORD *)buf = 67109376;
      v15 = v10;
      v16 = 1024;
      v17 = isValid;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "APTicket is loaded: (%d) and valid: (%d)", buf, 0xEu);
    }

  }
  return v2;
}

- (BOOL)isEntitledForTag:(unint64_t)a3
{
  uint64_t v5;
  NSObject *v6;

  if (-[CBAPTicket isValid](self, "isValid"))
    return -[CBAPTicket _hasEntitlementBoolForTag:](self, "_hasEntitlementBoolForTag:", a3);
  v5 = CheckerBoardLogHandleForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_100045664(v6);

  return 0;
}

- (id)_loadAPTicket
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSUDataAccessor sharedDataAccessor](MSUDataAccessor, "sharedDataAccessor"));
  v14 = 0;
  v3 = objc_msgSend(v2, "copyPathForPersonalizedData:error:", 2, &v14);
  v4 = v14;

  if (!v3)
  {
    v11 = CheckerBoardLogHandleForCategory(4);
    v10 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000456A4((uint64_t)v4, v10);
    v7 = 0;
    goto LABEL_11;
  }
  v5 = CheckerBoardLogHandleForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "APTicket path is %@", buf, 0xCu);
  }

  v13 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v3, 0, &v13));
  v8 = v13;

  if (!v7)
  {
    v9 = CheckerBoardLogHandleForCategory(1);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100045714((uint64_t)v3, (uint64_t)v8, v10);
    v4 = v8;
LABEL_11:

    v8 = v4;
  }

  return v7;
}

- (BOOL)_verifyAPTicketDigest:(id)a3
{
  id v3;
  const __CFData *v4;
  const __CFString *v5;
  const __CFString *v6;
  CFComparisonResult v7;
  id v8;
  id v9;
  id v10;
  int v11;
  size_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  _BOOL4 v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  const UInt8 *BytePtr;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  int v29;
  const char *v30;
  uint8_t buf[4];
  const __CFString *v32;

  v3 = a3;
  v4 = (const __CFData *)MGCopyAnswer(CFSTR("BootManifestHash"), 0);
  if (!v4)
  {
    v15 = CheckerBoardLogHandleForCategory(1);
    v14 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = CFSTR("BootManifestHash");
      v16 = "Failed to query MobileGestalt for %@";
      v17 = v14;
      v18 = 12;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
    }
LABEL_12:
    v6 = 0;
    goto LABEL_13;
  }
  v5 = (const __CFString *)MGCopyAnswer(CFSTR("Image4CryptoHashMethod"), 0);
  if (!v5)
  {
    v19 = CheckerBoardLogHandleForCategory(1);
    v14 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v16 = "MobileGestalt returned NULL for Image4CryptoHashMethod";
      v17 = v14;
      v18 = 2;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v6 = v5;
  v7 = CFStringCompare(v5, CFSTR("sha2-384"), 1uLL);
  v8 = objc_retainAutorelease(v3);
  v9 = objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");
  if (v7)
  {
    v11 = AMSupportDigestSha1(v9, v10, buf);
    v12 = 20;
    if (v11)
      goto LABEL_5;
  }
  else
  {
    v11 = AMSupportDigestSha384(v9, v10, buf);
    v12 = 48;
    if (v11)
    {
LABEL_5:
      v13 = CheckerBoardLogHandleForCategory(1);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_100045794(v11, v12, v14);
      goto LABEL_13;
    }
  }
  if (CFDataGetLength(v4) != v12)
  {
    v28 = CheckerBoardLogHandleForCategory(1);
    v14 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      v27 = "Digest length differs from the boot manifest hash";
      goto LABEL_26;
    }
LABEL_13:

    v20 = 0;
    goto LABEL_14;
  }
  BytePtr = CFDataGetBytePtr(v4);
  if (memcmp(buf, BytePtr, v12))
  {
    v26 = CheckerBoardLogHandleForCategory(1);
    v14 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      v27 = "Digest of provided ticket does not match boot manifest hash";
LABEL_26:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v27, (uint8_t *)&v29, 2u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  v20 = 1;
LABEL_14:
  v21 = CheckerBoardLogHandleForCategory(1);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = "un";
    if (v20)
      v23 = "";
    v29 = 136315138;
    v30 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Digest verified %ssuccessfully", (uint8_t *)&v29, 0xCu);
  }

  AMSupportSafeRelease(v4);
  AMSupportSafeRelease(v6);

  return v20;
}

- (BOOL)_hasEntitlementBoolForTag:(unint64_t)a3
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  int BooleanFromSection;
  int v15;
  uint64_t v16;
  NSObject *v17;
  char v18;
  uint8_t buf[4];
  int v20;
  _OWORD v21[28];
  uint64_t v22;

  v18 = 0;
  v22 = 0;
  memset(v21, 0, sizeof(v21));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBAPTicket apTicket](self, "apTicket"));

  if (!v5)
  {
    v12 = CheckerBoardLogHandleForCategory(1);
    v10 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = "AP Ticket is not loaded";
      goto LABEL_7;
    }
LABEL_8:

    return 0;
  }
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[CBAPTicket apTicket](self, "apTicket")));
  v7 = objc_msgSend(v6, "bytes");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBAPTicket apTicket](self, "apTicket"));
  LODWORD(v7) = Img4DecodeInitManifest(v7, objc_msgSend(v8, "length"), v21);

  if ((_DWORD)v7)
  {
    v9 = CheckerBoardLogHandleForCategory(1);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = "failed to parse AP ticket as Img4 manifest\n";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  BooleanFromSection = Img4DecodeGetBooleanFromSection(v21, 0, a3, &v18);
  if (BooleanFromSection)
  {
    v15 = BooleanFromSection;
    v18 = 0;
    v16 = CheckerBoardLogHandleForCategory(1);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v20 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "the result is %i", buf, 8u);
    }

  }
  return v18 != 0;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (NSData)apTicket
{
  return self->_apTicket;
}

- (void)setApTicket:(id)a3
{
  objc_storeStrong((id *)&self->_apTicket, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apTicket, 0);
}

@end
