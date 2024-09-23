@implementation PearlFramesDecompressionController

- (BOOL)preCheck
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  int v14;
  const char *v15;

  v2 = handleForCategory(0, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315138;
    v15 = "-[PearlFramesDecompressionController preCheck]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v14, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = objc_msgSend(v4, "fileExistsAtPath:", CFSTR("/private/var/hardware/FactoryData"));

  if ((v5 & 1) == 0)
  {
    v12 = handleForCategory(0, v6);
    v11 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100002BB0(v11);
    goto LABEL_9;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v8 = objc_msgSend(v7, "fileExistsAtPath:", CFSTR("/private/var/hardware/Pearl"));

  if (v8)
  {
    v10 = handleForCategory(0, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = CFSTR("/private/var/hardware/Pearl");
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ is existed before decompression", (uint8_t *)&v14, 0xCu);
    }
LABEL_9:

  }
  return v5;
}

- (id)decompressPearlFrames
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  void *v5;
  dispatch_semaphore_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  dispatch_time_t v10;
  id CRError;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  NSObject *v18;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v2 = handleForCategory(0, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[PearlFramesDecompressionController decompressPearlFrames]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v21 = 0x3032000000;
  v22 = sub_1000017C8;
  v23 = sub_1000017D8;
  v24 = 0;
  v4 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", CFSTR("com.apple.corerepair"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CoreRepairHelperProtocol));
  objc_msgSend(v4, "setRemoteObjectInterface:", v5);

  objc_msgSend(v4, "resume");
  v6 = dispatch_semaphore_create(0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteObjectProxy"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000017E0;
  v16[3] = &unk_1000041B8;
  p_buf = &buf;
  v8 = v4;
  v17 = v8;
  v9 = v6;
  v18 = v9;
  objc_msgSend(v7, "decompressPearlFramesWithReply:", v16);

  v10 = dispatch_time(0, 120000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    CRError = createCRError((void *)0xFFFFFFFFFFFFFFF6, CFSTR("Get response timeout from corerepaird for Pearl frames decompression"), 0);
    v12 = objc_claimAutoreleasedReturnValue(CRError);
    v13 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v12;

  }
  v14 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v14;
}

- (id)updateSavageDATFirmware
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  void *v5;
  dispatch_semaphore_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  dispatch_time_t v10;
  id CRError;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  NSObject *v18;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v2 = handleForCategory(0, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[PearlFramesDecompressionController updateSavageDATFirmware]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v21 = 0x3032000000;
  v22 = sub_1000017C8;
  v23 = sub_1000017D8;
  v24 = 0;
  v4 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", CFSTR("com.apple.corerepair"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CoreRepairHelperProtocol));
  objc_msgSend(v4, "setRemoteObjectInterface:", v5);

  objc_msgSend(v4, "resume");
  v6 = dispatch_semaphore_create(0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteObjectProxy"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100001B24;
  v16[3] = &unk_1000041B8;
  p_buf = &buf;
  v8 = v4;
  v17 = v8;
  v9 = v6;
  v18 = v9;
  objc_msgSend(v7, "updateSavageDATFirmwareWithReply:", v16);

  v10 = dispatch_time(0, 120000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    CRError = createCRError((void *)0xFFFFFFFFFFFFFFF6, CFSTR("Get response timeout from corerepaird for Savage update"), 0);
    v12 = objc_claimAutoreleasedReturnValue(CRError);
    v13 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v12;

  }
  v14 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v14;
}

- (id)updateBrunorDATFirmware
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  void *v5;
  dispatch_semaphore_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  dispatch_time_t v10;
  id CRError;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  NSObject *v18;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v2 = handleForCategory(0, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[PearlFramesDecompressionController updateBrunorDATFirmware]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v21 = 0x3032000000;
  v22 = sub_1000017C8;
  v23 = sub_1000017D8;
  v24 = 0;
  v4 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", CFSTR("com.apple.corerepair"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CoreRepairHelperProtocol));
  objc_msgSend(v4, "setRemoteObjectInterface:", v5);

  objc_msgSend(v4, "resume");
  v6 = dispatch_semaphore_create(0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteObjectProxy"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100001E68;
  v16[3] = &unk_1000041B8;
  p_buf = &buf;
  v8 = v4;
  v17 = v8;
  v9 = v6;
  v18 = v9;
  objc_msgSend(v7, "updateBrunorDATFirmwareWithReply:", v16);

  v10 = dispatch_time(0, 120000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    CRError = createCRError((void *)0xFFFFFFFFFFFFFFF6, CFSTR("Get response timeout from corerepaird for Brunor update"), 0);
    v12 = objc_claimAutoreleasedReturnValue(CRError);
    v13 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v12;

  }
  v14 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v14;
}

- (id)verifyPSD3
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  void *v5;
  dispatch_semaphore_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  dispatch_time_t v10;
  id CRError;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  NSObject *v18;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v2 = handleForCategory(0, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[PearlFramesDecompressionController verifyPSD3]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v21 = 0x3032000000;
  v22 = sub_1000017C8;
  v23 = sub_1000017D8;
  v24 = 0;
  v4 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", CFSTR("com.apple.corerepair"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CoreRepairHelperProtocol));
  objc_msgSend(v4, "setRemoteObjectInterface:", v5);

  objc_msgSend(v4, "resume");
  v6 = dispatch_semaphore_create(0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteObjectProxy"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000021AC;
  v16[3] = &unk_1000041B8;
  p_buf = &buf;
  v8 = v4;
  v17 = v8;
  v9 = v6;
  v18 = v9;
  objc_msgSend(v7, "verifyPSD3WithReply:", v16);

  v10 = dispatch_time(0, 120000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    CRError = createCRError((void *)0xFFFFFFFFFFFFFFF6, CFSTR("Get response timeout from corerepaird for verify PSD3"), 0);
    v12 = objc_claimAutoreleasedReturnValue(CRError);
    v13 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v12;

  }
  v14 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v14;
}

- (void)start
{
  uint64_t v3;
  NSObject *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  unsigned int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  char *v41;
  char *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  uint64_t v46;
  id CRError;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  PearlFramesDecompressionController *v58;
  char v59;
  void *v60;
  _QWORD v61[3];
  _QWORD v62[3];
  uint8_t buf[4];
  const char *v64;

  v3 = handleForCategory(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v64 = "-[PearlFramesDecompressionController start]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v60 = 0;
  AMSupportLogSetHandler(&_logHandler);
  v5 = (char *)AMFDRSealingMapCopyInstanceForClass(CFSTR("prf1"), 0);
  v7 = handleForCategory(0, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v64 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Savage SN from sealing map: %@", buf, 0xCu);
  }

  v9 = AMFDRSealingManifestCopyInstanceForClass(CFSTR("prf1"), 0, &v60);
  v11 = handleForCategory(0, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v64 = (const char *)v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Savage SN from sealing manifest: %@", buf, 0xCu);
  }

  v13 = v60;
  v56 = v9;
  v58 = self;
  if (!v9 || v60)
  {
    CRError = createCRError((void *)0xFFFFFFFFFFFFFFD6, CFSTR("Failed to get Savage SN from sealing manifest"), v60);
    v35 = (void *)objc_claimAutoreleasedReturnValue(CRError);

    goto LABEL_53;
  }
  if (v5 && (objc_msgSend(v5, "isEqualToString:", v9, v9) & 1) != 0)
  {
    if (-[PearlFramesDecompressionController preCheck](self, "preCheck"))
    {
      v15 = handleForCategory(0, v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Start to decompress Pearl frames ...", buf, 2u);
      }

      v17 = objc_claimAutoreleasedReturnValue(-[PearlFramesDecompressionController decompressPearlFrames](self, "decompressPearlFrames"));
      if (!v17)
      {
        v18 = +[CRFDRUtils isDataClassSupported:](CRFDRUtils, "isDataClassSupported:", CFSTR("psd3"));
        v20 = handleForCategory(0, v19);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
        if (v18)
        {
          if (v22)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Start to update Brunor/Yonkers firmware ...", buf, 2u);
          }

          v17 = objc_claimAutoreleasedReturnValue(-[PearlFramesDecompressionController updateBrunorDATFirmware](self, "updateBrunorDATFirmware"));
          if (!v17)
          {
            v24 = handleForCategory(0, v23);
            v25 = objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Update Brunor/Yonkers firmware successfully", buf, 2u);
            }

            v17 = objc_claimAutoreleasedReturnValue(-[PearlFramesDecompressionController verifyPSD3](self, "verifyPSD3"));
            if (!v17)
            {
              v27 = handleForCategory(0, v26);
              v28 = objc_claimAutoreleasedReturnValue(v27);
              if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                goto LABEL_30;
              *(_WORD *)buf = 0;
              v29 = "Verify PSD3 successfully";
              goto LABEL_29;
            }
          }
        }
        else
        {
          if (v22)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Start to update Savage/Yonkers firmware ...", buf, 2u);
          }

          v17 = objc_claimAutoreleasedReturnValue(-[PearlFramesDecompressionController updateSavageDATFirmware](self, "updateSavageDATFirmware"));
          if (!v17)
          {
            v31 = handleForCategory(0, v30);
            v28 = objc_claimAutoreleasedReturnValue(v31);
            if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              goto LABEL_30;
            *(_WORD *)buf = 0;
            v29 = "Update Savage/Yonkers firmware successfully";
LABEL_29:
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 2u);
LABEL_30:

            v59 = 0;
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
            v33 = objc_msgSend(v32, "fileExistsAtPath:isDirectory:", CFSTR("/private/var/hardware/Pearl"), &v59);

            if (v33 && v59)
              goto LABEL_32;
            v45 = CFSTR("Pearl frames have been decompressed, but the folder is not found");
            v46 = -1;
            goto LABEL_52;
          }
        }
      }
      v35 = (void *)v17;
      goto LABEL_54;
    }
    v45 = CFSTR("Failed to mount hardware partition");
    v46 = -2;
  }
  else
  {
    v45 = CFSTR("Sealing map and sealing manifest Savage SN mismatch");
    v46 = -8;
  }
LABEL_52:
  v48 = createCRError((void *)v46, v45, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v48);
LABEL_53:
  if (!v35)
  {
LABEL_32:
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[PearlFramesDecompressionController result](self, "result", v56));
    objc_msgSend(v34, "setStatusCode:", &off_1000043F8);

    v35 = 0;
    v36 = 0;
LABEL_33:
    v61[0] = CFSTR("PearlFramesDecompressionErrorCode");
LABEL_34:
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v38 = 0;
    v39 = 1;
    goto LABEL_35;
  }
LABEL_54:
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v35, "code", v56)));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[PearlFramesDecompressionController result](self, "result"));
  objc_msgSend(v50, "setStatusCode:", v49);

  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "userInfo"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "description"));

  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "userInfo"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

  if (!v53)
    goto LABEL_33;
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "userInfo"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v55, "code")));
  v61[0] = CFSTR("PearlFramesDecompressionErrorCode");
  if (!v38)
    goto LABEL_34;
  v39 = 0;
  v37 = v38;
LABEL_35:
  v62[0] = v37;
  v61[1] = CFSTR("PearlFramesDecompressionErrorDescription");
  v40 = v36;
  if (!v36)
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v62[1] = v40;
  v61[2] = CFSTR("PearlFramesDecompressionSensorSerialNumber");
  v41 = v5;
  v42 = v5;
  if (!v5)
    v41 = (char *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v62[2] = v41;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v62, v61, 3));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[PearlFramesDecompressionController result](v58, "result"));
  objc_msgSend(v44, "setData:", v43);

  if (v42)
  {
    if (v36)
      goto LABEL_41;
LABEL_45:

    if (!v39)
      goto LABEL_43;
    goto LABEL_42;
  }

  if (!v36)
    goto LABEL_45;
LABEL_41:
  if (v39)
LABEL_42:

LABEL_43:
  -[PearlFramesDecompressionController setFinished:](v58, "setFinished:", 1);

}

- (void)cancel
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  const char *v5;

  v2 = handleForCategory(0, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[PearlFramesDecompressionController cancel]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

}

- (void)teardown
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  const char *v5;

  v2 = handleForCategory(0, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[PearlFramesDecompressionController teardown]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->prebootPath, 0);
}

@end
