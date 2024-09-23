@implementation FSKitDiskArbHelper

+ (id)getFileProviderID
{
  return CFSTR("com.apple.filesystems.UserFS.FileProvider");
}

+ (id)waitForPreviousTasksToComplete:(id)a3 client:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  dispatch_time_t v12;
  id v13;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD aBlock[4];
  id v18;
  NSObject *v19;
  uint64_t *v20;
  _QWORD *v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  _QWORD v25[3];
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v5 = a3;
  v6 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__5;
  v37 = __Block_byref_object_dispose__5;
  v38 = (id)objc_opt_new();
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__5;
  v31 = __Block_byref_object_dispose__5;
  v32 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  v7 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __60__FSKitDiskArbHelper_waitForPreviousTasksToComplete_client___block_invoke;
  v22[3] = &unk_250C32410;
  v8 = v5;
  v23 = v8;
  v24 = &v33;
  objc_msgSend(v6, "currentTasksSync:", v22);
  if (objc_msgSend((id)v34[5], "count"))
  {
    v9 = dispatch_group_create();
    dispatch_group_enter(v9);
    aBlock[0] = v7;
    aBlock[1] = 3221225472;
    aBlock[2] = __60__FSKitDiskArbHelper_waitForPreviousTasksToComplete_client___block_invoke_3;
    aBlock[3] = &unk_250C33328;
    v18 = v8;
    v20 = &v33;
    v21 = v25;
    v10 = v9;
    v19 = v10;
    v11 = _Block_copy(aBlock);
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __60__FSKitDiskArbHelper_waitForPreviousTasksToComplete_client___block_invoke_5;
    v16[3] = &unk_250C32768;
    v16[4] = &v27;
    objc_msgSend(v6, "setTaskUpdateHandler:replyHandler:", v11, v16);
    v12 = dispatch_time(0, 5000000000);
    dispatch_group_wait(v10, v12);
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __60__FSKitDiskArbHelper_waitForPreviousTasksToComplete_client___block_invoke_6;
    v15[3] = &unk_250C32768;
    v15[4] = &v27;
    objc_msgSend(v6, "setTaskUpdateHandler:replyHandler:", 0, v15);
    v13 = (id)v28[5];

  }
  else
  {
    v13 = 0;
  }

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v13;
}

void __60__FSKitDiskArbHelper_waitForPreviousTasksToComplete_client___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__FSKitDiskArbHelper_waitForPreviousTasksToComplete_client___block_invoke_2;
  v6[3] = &unk_250C33300;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v6);

}

void __60__FSKitDiskArbHelper_waitForPreviousTasksToComplete_client___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "taskResource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getResourceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "getResourceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v7);

}

void __60__FSKitDiskArbHelper_waitForPreviousTasksToComplete_client___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t, _BYTE *);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "taskState") == 3)
  {
    objc_msgSend(v5, "taskResource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getResourceID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "getResourceID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (v10)
    {
      v19 = 0;
      v20 = &v19;
      v21 = 0x3032000000;
      v22 = __Block_byref_object_copy__5;
      v23 = __Block_byref_object_dispose__5;
      v24 = 0;
      v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v13 = MEMORY[0x24BDAC760];
      v14 = 3221225472;
      v15 = __60__FSKitDiskArbHelper_waitForPreviousTasksToComplete_client___block_invoke_4;
      v16 = &unk_250C33300;
      v17 = v5;
      v18 = &v19;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v13);
      if (v20[5])
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "removeObject:", v13, v14, v15, v16);

      _Block_object_dispose(&v19, 8);
    }
  }
  v12 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_sync_enter(v12);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
    && !objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  objc_sync_exit(v12);

}

void __60__FSKitDiskArbHelper_waitForPreviousTasksToComplete_client___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "taskID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "taskID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __60__FSKitDiskArbHelper_waitForPreviousTasksToComplete_client___block_invoke_5(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  id v6;

  v4 = a2;
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "description");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    NSLog(CFSTR("Error setting up update handler: '%s'"), objc_msgSend(v5, "UTF8String"));

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v6;
  }

}

void __60__FSKitDiskArbHelper_waitForPreviousTasksToComplete_client___block_invoke_6(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  id v6;

  v4 = a2;
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "description");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    NSLog(CFSTR("Error setting up update handler: '%s'"), objc_msgSend(v5, "UTF8String"));

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v6;
  }

}

+ (int)DAMountFSKitVolume:(id)a3 deviceName:(id)a4 mountPoint:(id)a5 volumeName:(id)a6 mountOptions:(id)a7
{
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  dispatch_time_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  dispatch_time_t v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  _QWORD v54[4];
  NSObject *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  _BYTE *v66;
  uint64_t *v67;
  int v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[4];
  NSObject *v74;
  _BYTE *v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  uint8_t v83[4];
  const char *v84;
  __int16 v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  __int16 v87;
  void *v88;
  __int16 v89;
  uint64_t v90;
  _BYTE buf[24];
  uint64_t (*v92)(uint64_t, uint64_t);
  _BYTE v93[20];
  __int16 v94;
  id v95;
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v53 = (uint64_t (*)(uint64_t, uint64_t))a4;
  v51 = a5;
  v50 = a6;
  v13 = a7;
  fskit_std_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316418;
    *(_QWORD *)&buf[4] = "+[FSKitDiskArbHelper DAMountFSKitVolume:deviceName:mountPoint:volumeName:mountOptions:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    v92 = v53;
    *(_WORD *)v93 = 2112;
    *(_QWORD *)&v93[2] = v51;
    *(_WORD *)&v93[10] = 2112;
    *(_QWORD *)&v93[12] = v50;
    v94 = 2112;
    v95 = v13;
    _os_log_debug_impl(&dword_23B2A6000, v14, OS_LOG_TYPE_DEBUG, "%s:start:fsShortName(%@):deviceName(%@):mountPoint(%@):volumeName(%@):mountOptionString(%@)", buf, 0x3Eu);
  }

  v15 = (void *)objc_opt_new();
  v52 = (void *)objc_opt_new();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v92 = __Block_byref_object_copy__5;
  *(_QWORD *)v93 = __Block_byref_object_dispose__5;
  *(_QWORD *)&v93[8] = 0;
  v16 = objc_msgSend(v13, "containsString:", CFSTR("rdonly"));
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("passthroughfs")))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v53);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[FSGenericURLResource secureResourceWithURL:readonly:](FSGenericURLResource, "secureResourceWithURL:readonly:", v17, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[FSBlockDeviceResource proxyResourceForBSDName:isWritable:](FSBlockDeviceResource, "proxyResourceForBSDName:isWritable:", v53, v16 ^ 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[FSKitDiskArbHelper waitForPreviousTasksToComplete:client:](FSKitDiskArbHelper, "waitForPreviousTasksToComplete:client:", v18, v15);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = *(void **)(*(_QWORD *)&buf[8] + 40);
  *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v19;

  v21 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (v21)
  {
    v22 = objc_msgSend(v21, "code");
  }
  else
  {
    v77 = 0;
    v78 = &v77;
    v79 = 0x3032000000;
    v80 = __Block_byref_object_copy__5;
    v81 = __Block_byref_object_dispose__5;
    v82 = 0;
    objc_msgSend(a1, "getFileProviderID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(MEMORY[0x24BE60450], "newClientForProvider:", v23);
    v25 = dispatch_group_create();
    dispatch_group_enter(v25);
    v26 = MEMORY[0x24BDAC760];
    v73[0] = MEMORY[0x24BDAC760];
    v73[1] = 3221225472;
    v73[2] = __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke;
    v73[3] = &unk_250C33350;
    v75 = buf;
    v76 = &v77;
    v27 = v25;
    v74 = v27;
    objc_msgSend(v15, "loadResource:shortName:options:replyHandler:", v18, v12, v52, v73);
    v28 = dispatch_time(0, 20000000000);
    if (dispatch_group_wait(v27, v28))
    {
      fs_errorForPOSIXError(60);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v29;

      fskit_std_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        +[FSKitDiskArbHelper DAMountFSKitVolume:deviceName:mountPoint:volumeName:mountOptions:].cold.1((uint64_t)v53, (uint64_t)&buf[8], v31);

    }
    v32 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v32)
    {
      v22 = objc_msgSend(v32, "code");
    }
    else
    {
      v69 = 0;
      v70 = &v69;
      v71 = 0x2020000000;
      v72 = 0;
      v33 = (void *)v78[5];
      v56[0] = v26;
      v56[1] = 3221225472;
      v56[2] = __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_23;
      v56[3] = &unk_250C333A0;
      v34 = v15;
      v57 = v34;
      v35 = v12;
      v58 = v35;
      v59 = v52;
      v66 = buf;
      v47 = v53;
      v60 = v47;
      v49 = v24;
      v61 = v24;
      v48 = v23;
      v62 = v23;
      v63 = 0;
      v64 = v51;
      v68 = 4096;
      v65 = v13;
      v67 = &v69;
      objc_msgSend(v33, "enumerateObjectsUsingBlock:", v56);
      if (!v70[3])
      {
        v36 = (void *)objc_opt_new();
        v37 = dispatch_group_create();
        dispatch_group_enter(v37);
        v54[0] = MEMORY[0x24BDAC760];
        v54[1] = 3221225472;
        v54[2] = __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_27;
        v54[3] = &unk_250C32150;
        v38 = v37;
        v55 = v38;
        objc_msgSend(v34, "unloadResource:shortName:options:replyHandler:", v18, v35, v36, v54);
        v39 = dispatch_time(0, 20000000000);
        if (dispatch_group_wait(v38, v39))
        {
          fs_errorForPOSIXError(60);
          v40 = objc_claimAutoreleasedReturnValue();
          v41 = *(void **)(*(_QWORD *)&buf[8] + 40);
          *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v40;

          fskit_std_log();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v18, "getResourceID");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
            *(_DWORD *)v83 = 136315906;
            v84 = "+[FSKitDiskArbHelper DAMountFSKitVolume:deviceName:mountPoint:volumeName:mountOptions:]";
            v85 = 2112;
            v86 = v47;
            v87 = 2112;
            v88 = v45;
            v89 = 2112;
            v90 = v46;
            _os_log_error_impl(&dword_23B2A6000, v42, OS_LOG_TYPE_ERROR, "%s: %@ failed to unloadResource (%@) error (%@)", v83, 0x2Au);

          }
        }

      }
      v43 = *(void **)(*(_QWORD *)&buf[8] + 40);
      if (v43)
        v22 = objc_msgSend(v43, "code");
      else
        v22 = 0;
      v23 = v48;
      v24 = v49;

      _Block_object_dispose(&v69, 8);
    }

    _Block_object_dispose(&v77, 8);
  }

  _Block_object_dispose(buf, 8);
  return v22;
}

void __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  if (v7)
  {
    fskit_std_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_cold_1();

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_23(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  dispatch_time_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  dispatch_time_t v38;
  intptr_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  _BYTE *v49;
  _QWORD v50[4];
  NSObject *v51;
  NSObject *v52;
  _QWORD v53[4];
  id v54;
  NSObject *v55;
  uint64_t v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  fskit_std_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_23_cold_3(v6, v7);

  v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v6, "volumeID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = a1 + 104;
  v11 = *(_QWORD *)(a1 + 104);
  v13 = MEMORY[0x24BDAC760];
  v14 = *(_QWORD *)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 48);
  v53[0] = MEMORY[0x24BDAC760];
  v53[1] = 3221225472;
  v53[2] = __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_24;
  v53[3] = &unk_250C33378;
  v56 = v11;
  v16 = v6;
  v54 = v16;
  v17 = v8;
  v55 = v17;
  objc_msgSend(v9, "activateVolume:shortName:options:replyHandler:", v10, v14, v15, v53);

  v18 = dispatch_time(0, 20000000000);
  if (dispatch_group_wait(v17, v18))
  {
    fs_errorForPOSIXError(60);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)v12 + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v12 + 8) + 40))
  {
    fskit_std_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_23_cold_2();

    *a4 = 1;
  }
  else
  {
    v49 = a4;
    objc_msgSend(v16, "volumeID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "description");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = *(void **)(a1 + 64);
    v26 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v16, "volumeName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "string");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "mountVolume:fileSystem:displayName:provider:domainError:on:how:options:", v24, v26, v28, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(int *)(a1 + 120), *(_QWORD *)(a1 + 96));
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
    v31 = *(void **)(v30 + 40);
    *(_QWORD *)(v30 + 40) = v29;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40))
    {
      v48 = v24;
      fskit_std_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_23_cold_1();

      dispatch_group_enter(v17);
      v33 = *(void **)(a1 + 32);
      objc_msgSend(v16, "volumeID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = *(_QWORD *)(a1 + 40);
      v50[0] = v13;
      v50[1] = 3221225472;
      v50[2] = __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_25;
      v50[3] = &unk_250C32008;
      v36 = v16;
      v51 = v36;
      v37 = v17;
      v52 = v37;
      objc_msgSend(v33, "deactivateVolume:shortName:numericOptions:replyHandler:", v34, v35, 2, v50);

      v38 = dispatch_time(0, 20000000000);
      v39 = dispatch_group_wait(v37, v38);
      v24 = v48;
      if (v39)
      {
        fs_errorForPOSIXError(60);
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = *(_QWORD *)(*(_QWORD *)v12 + 8);
        v42 = *(void **)(v41 + 40);
        *(_QWORD *)(v41 + 40) = v40;

        fskit_std_log();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v45 = *(void **)(a1 + 56);
          -[NSObject volumeID](v36, "volumeID");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
          *(_DWORD *)buf = 136315906;
          v58 = "+[FSKitDiskArbHelper DAMountFSKitVolume:deviceName:mountPoint:volumeName:mountOptions:]_block_invoke";
          v59 = 2112;
          v60 = v45;
          v61 = 2112;
          v62 = v46;
          v63 = 2112;
          v64 = v47;
          _os_log_error_impl(&dword_23B2A6000, v43, OS_LOG_TYPE_ERROR, "%s: %@ failed to deactivateVolume (%@) error (%@)", buf, 0x2Au);

          v24 = v48;
        }

      }
      *v49 = 1;

      v44 = v51;
    }
    else
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
      fskit_std_log();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v58 = "+[FSKitDiskArbHelper DAMountFSKitVolume:deviceName:mountPoint:volumeName:mountOptions:]_block_invoke";
        v59 = 2112;
        v60 = v24;
        _os_log_impl(&dword_23B2A6000, v44, OS_LOG_TYPE_INFO, "%s: Mounted %@ successfully.", buf, 0x16u);
      }
    }

  }
}

void __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_24(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  fskit_std_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
      __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_cold_1();
  }
  else if (v6)
  {
    __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_24_cold_1(a1, v5);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_25(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;

  v3 = a2;
  fskit_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_cold_1();
  }
  else if (v5)
  {
    __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_25_cold_1(a1, v4);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    fskit_std_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_cold_1();

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

+ (int)DAMountUserFSVolume:(id)a3 deviceName:(id)a4 mountPoint:(id)a5 volumeName:(id)a6 mountOptions:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  _OWORD v21[2];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  +[FSAuditToken token](FSAuditToken, "token");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
    objc_msgSend(v17, "audit_token");
  else
    memset(v21, 0, sizeof(v21));
  v19 = objc_msgSend(a1, "DAMountUserFSVolume:deviceName:mountPoint:volumeName:auditToken:mountOptions:", v12, v13, v14, v15, v21, v16);

  return v19;
}

+ (int)DAMountUserFSVolume:(id)a3 deviceName:(id)a4 mountPoint:(id)a5 volumeName:(id)a6 auditToken:(id *)a7 mountOptions:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  __int128 v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  id v48;
  uint64_t v49;
  id v50;
  id v51;
  id obj;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  id v56;
  id v57;
  uint64_t v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  _BYTE buf[32];
  __int16 v66;
  int v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  if (!objc_msgSend(v14, "hasSuffix:", CFSTR("_fskit")))
  {
    v50 = v18;
    v49 = MEMORY[0x23B861B50]();
    v21 = +[stolenUSBLocalStorageClient newManager](stolenUSBLocalStorageClient, "newManager");
    v59 = (void *)objc_msgSend(MEMORY[0x24BE60450], "newClientForProvider:", CFSTR("com.apple.filesystems.UserFS.FileProvider"));
    v64 = 0;
    v54 = v21;
    objc_msgSend(v21, "loadVolumes:ofType:withError:", v15, v14, &v64);
    a1 = (id)objc_claimAutoreleasedReturnValue();
    v22 = v64;
    v51 = a1;
    if (v22)
    {
      v23 = v22;
      fskit_std_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        +[FSKitDiskArbHelper DAMountUserFSVolume:deviceName:mountPoint:volumeName:auditToken:mountOptions:].cold.1((uint64_t)v15, (uint64_t)v23, v24);

      v25 = (void *)v49;
    }
    else
    {
      if (!a1)
      {
        v25 = (void *)v49;
        goto LABEL_8;
      }
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      obj = a1;
      v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
      if (v58)
      {
        v56 = v16;
        v57 = v14;
        v48 = v15;
        v27 = 0;
        v23 = 0;
        v55 = *(_QWORD *)v61;
        v53 = *MEMORY[0x24BDD1128];
        while (2)
        {
          for (i = 0; i != v58; ++i)
          {
            v29 = v23;
            v30 = v27;
            if (*(_QWORD *)v61 != v55)
              objc_enumerationMutation(obj);
            v27 = *(id *)(*((_QWORD *)&v60 + 1) + 8 * i);

            objc_msgSend(v27, "objectForKey:", CFSTR("UUID"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectForKey:", CFSTR("name"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17 && (objc_msgSend(v17, "isEqual:", v32) & 1) == 0)
            {
              fskit_std_log();
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)&buf[4] = v48;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v17;
                *(_WORD *)&buf[22] = 2112;
                *(_QWORD *)&buf[24] = v32;
                _os_log_impl(&dword_23B2A6000, v33, OS_LOG_TYPE_INFO, "%@: got 2 different names from probe and userfs: p->%@  u->%@", buf, 0x20u);
              }

              if (objc_msgSend(v32, "isEqual:", CFSTR("Untitled")))
              {
                v34 = v17;

                v32 = v34;
              }
            }
            objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("how"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "intValue");

            objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("errorForDomain"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            if (v37)
            {
              objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("errorForDomain"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v38, "integerValue");

              if (v39 != -1000)
              {
                fskit_std_log();
                v47 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134217984;
                  *(_QWORD *)&buf[4] = v39;
                  _os_log_error_impl(&dword_23B2A6000, v47, OS_LOG_TYPE_ERROR, "unsupported error code for domain: %ld", buf, 0xCu);
                }

                objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v53, 22, 0);
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                v46 = obj;
                obj = v27;
                goto LABEL_44;
              }
              objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v53, 80, 0);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v40 = 0;
            }
            fskit_std_log();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138413058;
              *(_QWORD *)&buf[4] = v31;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v32;
              *(_WORD *)&buf[22] = 2112;
              *(_QWORD *)&buf[24] = v40;
              v66 = 1024;
              v67 = v36;
              _os_log_impl(&dword_23B2A6000, v41, OS_LOG_TYPE_INFO, "%@ mounting with name %@, error %@, and how 0x%x.", buf, 0x26u);
            }

            v42 = *(_OWORD *)&a7->var0[4];
            *(_OWORD *)buf = *(_OWORD *)a7->var0;
            *(_OWORD *)&buf[16] = v42;
            objc_msgSend(v59, "mountVolume:fileSystem:displayName:provider:domainError:on:how:options:auditToken:", v31, v57, v32, CFSTR("com.apple.filesystems.UserFS.FileProvider"), v40, v56, v36, 0, buf);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            fskit_std_log();
            v43 = objc_claimAutoreleasedReturnValue();
            v44 = v43;
            if (v23)
            {
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v48;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v23;
                _os_log_error_impl(&dword_23B2A6000, v44, OS_LOG_TYPE_ERROR, "%@ mount failed with %@", buf, 0x16u);
              }

              objc_msgSend(v54, "forgetVolume:withFlags:", v31, 0);
              v44 = objc_claimAutoreleasedReturnValue();
              if (v44)
              {
                fskit_std_log();
                v45 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  *(_QWORD *)&buf[4] = v32;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v44;
                  _os_log_error_impl(&dword_23B2A6000, v45, OS_LOG_TYPE_ERROR, "unload for volume %@ failed with %@", buf, 0x16u);
                }

              }
            }
            else if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v31;
              _os_log_impl(&dword_23B2A6000, v44, OS_LOG_TYPE_INFO, "Mounted %@ successfully.", buf, 0xCu);
            }

          }
          v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
          if (v58)
            continue;
          break;
        }
        v46 = v27;
LABEL_44:
        v15 = v48;
        v25 = (void *)v49;
        v18 = v50;

        v16 = v56;
        v14 = v57;
      }
      else
      {
        v23 = 0;
        v25 = (void *)v49;
      }

      if (!v23)
      {
        LODWORD(a1) = 0;
        goto LABEL_8;
      }
    }
    LODWORD(a1) = objc_msgSend(v23, "code");

LABEL_8:
    objc_autoreleasePoolPop(v25);

    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("_"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "substringToIndex:", objc_msgSend(v14, "rangeOfCharacterFromSet:", v19));
  v20 = objc_claimAutoreleasedReturnValue();

  LODWORD(a1) = objc_msgSend(a1, "DAMountFSKitVolume:deviceName:mountPoint:volumeName:mountOptions:", v20, v15, v16, v17, v18);
  v14 = (id)v20;
LABEL_9:

  return (int)a1;
}

+ (void)DAMountFSKitVolume:(NSObject *)a3 deviceName:mountPoint:volumeName:mountOptions:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 136315650;
  *(_QWORD *)&v3[4] = "+[FSKitDiskArbHelper DAMountFSKitVolume:deviceName:mountPoint:volumeName:mountOptions:]";
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_2(&dword_23B2A6000, a2, a3, "%s: %@ failed to load resource (%@)", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *(_QWORD *)(*(_QWORD *)a2 + 40));
  OUTLINED_FUNCTION_8();
}

void __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, v0, v1, "%s:error:%@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

void __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_23_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  OUTLINED_FUNCTION_6_1(*MEMORY[0x24BDAC8D0]);
  v2 = 136315650;
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_2(&dword_23B2A6000, v0, v1, "%s: %@ mount failed with %@", v2);
  OUTLINED_FUNCTION_8();
}

void __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_23_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  OUTLINED_FUNCTION_6_1(*MEMORY[0x24BDAC8D0]);
  v2 = 136315650;
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_2(&dword_23B2A6000, v0, v1, "%s: %@ failed to activate volume (%@)", v2);
  OUTLINED_FUNCTION_8();
}

void __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_23_cold_3(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "volumeName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "volumeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136315650;
  v8 = "+[FSKitDiskArbHelper DAMountFSKitVolume:deviceName:mountPoint:volumeName:mountOptions:]_block_invoke";
  v9 = 2112;
  v10 = v4;
  v11 = 2112;
  v12 = v5;
  OUTLINED_FUNCTION_4_2(&dword_23B2A6000, a2, v6, "%s: Activating volumeName (%@) volumeID (%@)", (uint8_t *)&v7);

}

void __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_24_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "volumeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, a2, v4, "%s:done activating volume (%@)", (uint8_t *)v5);

  OUTLINED_FUNCTION_8();
}

void __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_25_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "volumeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, a2, v4, "%s:done deactivating volume (%@)", (uint8_t *)v5);

  OUTLINED_FUNCTION_8();
}

+ (void)DAMountUserFSVolume:(os_log_t)log deviceName:mountPoint:volumeName:auditToken:mountOptions:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_23B2A6000, log, OS_LOG_TYPE_ERROR, "%@ loadVolumes failed with %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
