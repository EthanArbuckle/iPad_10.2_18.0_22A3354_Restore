@implementation CacheDeleteEnumerateRemovedFiles

double ___CacheDeleteEnumerateRemovedFiles_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  unint64_t v3;
  unint64_t v4;
  NSObject *v5;
  double result;
  uint8_t v7[8];
  mach_timebase_info info;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.CacheDeleteEnumerateRemovedFiles", v0);
  v2 = (void *)_MergedGlobals_6;
  _MergedGlobals_6 = (uint64_t)v1;

  info = 0;
  if (mach_timebase_info(&info))
  {
    CDGetLogHandle((uint64_t)"client");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1A3662000, v5, OS_LOG_TYPE_ERROR, "Failed to get timebase info\n", v7, 2u);
    }

  }
  else
  {
    LODWORD(v3) = info.numer;
    LODWORD(v4) = info.denom;
    result = (double)v3 / (double)v4;
    gTimebaseConversion = *(_QWORD *)&result;
  }
  return result;
}

void ___CacheDeleteEnumerateRemovedFiles_block_invoke_82(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  CDRemoveEventsConsumer *v21;
  FSEventStreamEventId v22;
  void *v23;
  NSObject *v24;
  char *v25;
  const __CFArray *v26;
  __FSEventStream *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  NSObject *p_super;
  char v48;
  NSObject *v49;
  const char *v50;
  NSObject *v51;
  NSObject *v52;
  int *v53;
  char *v54;
  id v55;
  NSObject *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  NSObject *v62;
  void *v63;
  void *v64;
  char v65;
  NSObject *v66;
  NSObject *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  NSObject *v71;
  NSObject *v72;
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
  void *v83;
  os_log_t log;
  NSObject *loga;
  os_log_t oslog;
  os_log_t osloga;
  id v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  _QWORD *v92;
  void *v93;
  NSObject *q;
  uint64_t v95;
  FSEventStreamEventId sinceWhen;
  id sinceWhena;
  id obj;
  _QWORD block[6];
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  uint8_t buf[4];
  uint64_t v109;
  __int16 v110;
  FSEventStreamEventId v111;
  __int16 v112;
  FSEventStreamEventId v113;
  __int16 v114;
  void *v115;
  char v116[128];
  char v117[8];
  char *v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  CDRemoveEventsConsumer *v122;
  __int128 v123;
  uint64_t v124;
  _BYTE v125[128];
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  q = dispatch_queue_create("com.apple.CacheDeleteFSEvents", v2);

  v3 = (void *)objc_opt_new();
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v95 = a1;
  sinceWhen = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v104, v125, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v105;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v105 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * i);
        bzero(v117, 0x400uLL);
        v9 = objc_retainAutorelease(v8);
        if (!realpath_DARWIN_EXTSN((const char *)objc_msgSend(v9, "UTF8String"), v117))
        {
          CDGetLogHandle((uint64_t)"client");
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            v17 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
            *(_DWORD *)buf = 136446210;
            v109 = v17;
            _os_log_error_impl(&dword_1A3662000, v10, OS_LOG_TYPE_ERROR, "_CacheDeleteEnumerateRemovedFiles: Unable to realpath \"%{public}s\", buf, 0xCu);
          }

        }
        normalizePath(v9, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          mapVolume(v11, 0);
          v13 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v3, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            v14 = (void *)objc_opt_new();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v13);
          }
          mapVolume(v9, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v15);

          CDGetLogHandle((uint64_t)"client");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v109 = (uint64_t)v9;
            v110 = 2114;
            v111 = (FSEventStreamEventId)v13;
            _os_log_impl(&dword_1A3662000, v16, OS_LOG_TYPE_DEFAULT, "_CacheDeleteEnumerateRemovedFiles: validated \"%{public}@\" on \"%{public}@\", buf, 0x16u);
          }

        }
        else
        {
          CDGetLogHandle((uint64_t)"client");
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v109 = (uint64_t)v9;
            _os_log_error_impl(&dword_1A3662000, v13, OS_LOG_TYPE_ERROR, "_CacheDeleteEnumerateRemovedFiles: unable to associate directory: \"%{public}@\" with a volume", buf, 0xCu);
          }
        }

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v104, v125, 16);
    }
    while (v5);
  }

  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  obj = v3;
  v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v116, 16);
  if (v91)
  {
    v90 = *(_QWORD *)v101;
    do
    {
      for (j = 0; j != v91; ++j)
      {
        if (*(_QWORD *)v101 != v90)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * j);
        objc_msgSend(obj, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[CDRemoveEventsConsumer initWithConsumer:identifier:]([CDRemoveEventsConsumer alloc], "initWithConsumer:identifier:", *(_QWORD *)(v95 + 32), *(_QWORD *)(v95 + 56));
        *(_QWORD *)v117 = 0;
        v118 = v117;
        v119 = 0x4810000000;
        v121 = 0;
        v123 = 0u;
        v124 = 0;
        v120 = &unk_1A369F492;
        v122 = v21;
        v22 = sinceWhen;
        if (sinceWhen)
        {
LABEL_26:
          sinceWhen = v22;
          if (v22 == -1)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_CacheDeleteEnumerateRemovedFiles: Invalid _since parameter: %llu (0x%032llx)"), -1, -1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            CDSimulateCrash(195890385, v23);

            sinceWhen = FSEventsGetCurrentEventId();
            CDGetLogHandle((uint64_t)"client");
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v109 = -1;
              v110 = 2048;
              v111 = sinceWhen;
              _os_log_error_impl(&dword_1A3662000, v24, OS_LOG_TYPE_ERROR, "_CacheDeleteEnumerateRemovedFiles: reset _since from %llu to current event id: %llu", buf, 0x16u);
            }

          }
          v25 = v118;
          objc_msgSend(v20, "allObjects");
          v26 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
          v27 = FSEventStreamCreate(0, (FSEventStreamCallback)fsEventStreamCallback, (FSEventStreamContext *)(v25 + 32), v26, sinceWhen, 0.0, 0x53u);

          if (v27)
          {
            if (q)
            {
              CDGetLogHandle((uint64_t)"client");
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A3662000, v28, OS_LOG_TYPE_DEFAULT, "_CacheDeleteEnumerateRemovedFiles: dispatching queue..", buf, 2u);
              }

            }
            FSEventStreamSetDispatchQueue(v27, q);
            -[CDRemoveEventsConsumer setSince:](v21, "setSince:", sinceWhen);
            CDGetLogHandle((uint64_t)"client");
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v20, "allObjects");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v109 = (uint64_t)v21;
              v110 = 2048;
              v111 = (FSEventStreamEventId)q;
              v112 = 2048;
              v113 = sinceWhen;
              v114 = 2112;
              v115 = v30;
              _os_log_impl(&dword_1A3662000, v29, OS_LOG_TYPE_DEFAULT, "_CacheDeleteEnumerateRemovedFiles: CDConsumer %@ consuming stream (queue: %p) from ID: %llu for dirs: %@", buf, 0x2Au);

            }
            -[CDRemoveEventsConsumer consumeStream:forVolume:](v21, "consumeStream:forVolume:", v27, v19);
          }
          else
          {
            CDGetLogHandle((uint64_t)"client");
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              v53 = __error();
              v54 = strerror(*v53);
              *(_DWORD *)buf = 138543618;
              v109 = (uint64_t)v19;
              v110 = 2080;
              v111 = (FSEventStreamEventId)v54;
              _os_log_error_impl(&dword_1A3662000, v46, OS_LOG_TYPE_ERROR, "_CacheDeleteEnumerateRemovedFiles: Unable to create FSEventsStream for volume \"%{public}@\": %s", buf, 0x16u);
            }

          }
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = ___CacheDeleteEnumerateRemovedFiles_block_invoke_94;
          block[3] = &unk_1E4A32E38;
          block[4] = v117;
          block[5] = v21;
          dispatch_sync(q, block);
          CDGetLogHandle((uint64_t)"client");
          p_super = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v109 = (uint64_t)v19;
            _os_log_impl(&dword_1A3662000, p_super, OS_LOG_TYPE_DEFAULT, "_CacheDeleteEnumerateRemovedFiles: Finished streaming events for %@", buf, 0xCu);
          }
          v48 = 0;
          goto LABEL_103;
        }
        v88 = *(id *)(v95 + 56);
        sinceWhena = v19;
        +[CacheDeleteVolume volumeWithPath:](CacheDeleteVolume, "volumeWithPath:");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          domain(v88);
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = objc_alloc_init(MEMORY[0x1E0C99EA0]);
          log = v33;
          if (v33)
          {
            -[NSObject objectForKey:](v33, "objectForKey:", v32);
            oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
            if (oslog)
            {
              objc_msgSend(v31, "uuid");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "UUIDString");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject objectForKeyedSubscript:](oslog, "objectForKeyedSubscript:", v35);
              v83 = (void *)objc_claimAutoreleasedReturnValue();

              if (v83)
              {
                objc_msgSend(v83, "objectAtIndexedSubscript:", 0);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "FSEventsUUID");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "UUIDString");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = objc_msgSend(v36, "isEqualToString:", v38);

                if ((v39 & 1) != 0)
                {
                  objc_msgSend(v83, "objectAtIndexedSubscript:", 0);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v40)
                  {
                    objc_msgSend(v83, "objectAtIndexedSubscript:", 1);
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    v92 = malloc_type_calloc(0x28uLL, 1uLL, 0xDCFE2FEAuLL);
                    v92[4] = objc_msgSend(v41, "unsignedLongLongValue");
                    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v40);
                    objc_msgSend(v42, "getUUIDBytes:", v92 + 2);

                    objc_msgSend(v31, "uuid");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "getUUIDBytes:", v92);

                    CDGetLogHandle((uint64_t)"client");
                    v44 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                    {
                      CDPurgeMarkerDescription((uint64_t)v92);
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      v109 = (uint64_t)v32;
                      v110 = 2114;
                      v111 = (FSEventStreamEventId)v45;
                      _os_log_impl(&dword_1A3662000, v44, OS_LOG_TYPE_DEFAULT, "copyPurgeMarker(%{public}@): returning %{public}@", buf, 0x16u);

                    }
                    goto LABEL_71;
                  }
                  CDGetLogHandle((uint64_t)"client");
                  v52 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543362;
                    v109 = (uint64_t)v83;
                    _os_log_error_impl(&dword_1A3662000, v52, OS_LOG_TYPE_ERROR, "copyPurgeMarker: Unable to get FSEventsUUISStr from: %{public}@", buf, 0xCu);
                  }
                }
                else
                {
                  CDGetLogHandle((uint64_t)"client");
                  v52 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v31, "FSEventsUUID");
                    v93 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v93, "UUIDString");
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v83, "objectAtIndexedSubscript:", 0);
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v31, "mountPoint");
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543874;
                    v109 = (uint64_t)v79;
                    v110 = 2114;
                    v111 = (FSEventStreamEventId)v80;
                    v112 = 2114;
                    v113 = (FSEventStreamEventId)v81;
                    _os_log_error_impl(&dword_1A3662000, v52, OS_LOG_TYPE_ERROR, "copyPurgeMarker: Current FSEventsUUID (%{public}@) does not match saved UUID (%{public}@) for volume %{public}@", buf, 0x20u);

                  }
                }

              }
              else
              {
                CDGetLogHandle((uint64_t)"client");
                v51 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v31, "mountPoint");
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "uuid");
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v77, "UUIDString");
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v109 = (uint64_t)v76;
                  v110 = 2114;
                  v111 = (FSEventStreamEventId)v78;
                  _os_log_error_impl(&dword_1A3662000, v51, OS_LOG_TYPE_ERROR, "copyPurgeMarker: Unable to get volume defaults for %{public}@ : %{public}@", buf, 0x16u);

                }
              }
LABEL_70:
              v92 = 0;
LABEL_71:

              goto LABEL_72;
            }
            CDGetLogHandle((uint64_t)"client");
            oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
              goto LABEL_70;
            *(_DWORD *)buf = 138543362;
            v109 = (uint64_t)v32;
            v49 = oslog;
            v50 = "copyPurgeMarker: Unable to get cacheDeleteAppDefaults for key: %{public}@";
          }
          else
          {
            CDGetLogHandle((uint64_t)"client");
            oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
              goto LABEL_70;
            *(_DWORD *)buf = 138543362;
            v109 = (uint64_t)v32;
            v49 = oslog;
            v50 = "copyPurgeMarker(%{public}@): Unable to create NSUserDefaults";
          }
          _os_log_error_impl(&dword_1A3662000, v49, OS_LOG_TYPE_ERROR, v50, buf, 0xCu);
          goto LABEL_70;
        }
        CDGetLogHandle((uint64_t)"client");
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v109 = (uint64_t)sinceWhena;
          _os_log_error_impl(&dword_1A3662000, v32, OS_LOG_TYPE_ERROR, "copyPurgeMarker: Unable to make CacheDeleteVolume from %{public}@", buf, 0xCu);
        }
        v92 = 0;
LABEL_72:

        if (v92)
        {
          v55 = sinceWhena;
          +[CacheDeleteVolume volumeWithPath:](CacheDeleteVolume, "volumeWithPath:", v55);
          v56 = objc_claimAutoreleasedReturnValue();
          v57 = v56;
          if (!v56)
          {
            CDGetLogHandle((uint64_t)"client");
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v109 = (uint64_t)v55;
              _os_log_error_impl(&dword_1A3662000, v57, OS_LOG_TYPE_ERROR, "verifyDirAndMarkerUUIDs: Unable to validate dir: %{public}@", buf, 0xCu);
            }
            goto LABEL_97;
          }
          -[NSObject uuid](v56, "uuid");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v58)
          {
            CDGetLogHandle((uint64_t)"client");
            v66 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            {
              -[NSObject mountPoint](v57, "mountPoint");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v109 = (uint64_t)v74;
              _os_log_error_impl(&dword_1A3662000, v66, OS_LOG_TYPE_ERROR, "verifyDirAndMarkerUUIDs: Unable to get volume UUID from %{public}@", buf, 0xCu);

            }
            goto LABEL_97;
          }
          v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v92);
          objc_msgSend(v89, "UUIDString");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "UUIDString");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend(v59, "isEqualToString:", v60);

          if ((v61 & 1) == 0)
          {
            CDGetLogHandle((uint64_t)"client");
            v67 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            {
              -[NSObject mountPoint](v57, "mountPoint");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v109 = (uint64_t)v75;
              _os_log_error_impl(&dword_1A3662000, v67, OS_LOG_TYPE_ERROR, "verifyDirAndMarkerUUIDs: Marker volume UUID does not match cdVolume: %{public}@", buf, 0xCu);

            }
            goto LABEL_97;
          }
          -[NSObject FSEventsUUID](v57, "FSEventsUUID");
          osloga = (os_log_t)objc_claimAutoreleasedReturnValue();
          if (!osloga)
          {
            CDGetLogHandle((uint64_t)"client");
            loga = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(loga, OS_LOG_TYPE_ERROR))
            {
              -[NSObject mountPoint](v57, "mountPoint");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v109 = (uint64_t)v68;
              _os_log_error_impl(&dword_1A3662000, loga, OS_LOG_TYPE_ERROR, "verifyDirAndMarkerUUIDs: Unable to get FSEventsUUID string from %{public}@", buf, 0xCu);

            }
            goto LABEL_96;
          }
          v62 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v92 + 2);
          loga = v62;
          if (!v62)
          {
            CDGetLogHandle((uint64_t)"client");
            v69 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
            {
              CDPurgeMarkerDescription((uint64_t)v92);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v109 = (uint64_t)v70;
              _os_log_error_impl(&dword_1A3662000, v69, OS_LOG_TYPE_ERROR, "verifyDirAndMarkerUUIDs: Unable to get UUID from %{public}@", buf, 0xCu);

            }
LABEL_95:

LABEL_96:
LABEL_97:

            CDGetLogHandle((uint64_t)"client");
            v71 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
            {
              CDPurgeMarkerDescription((uint64_t)v92);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v109 = (uint64_t)v55;
              v110 = 2114;
              v111 = (FSEventStreamEventId)v73;
              _os_log_error_impl(&dword_1A3662000, v71, OS_LOG_TYPE_ERROR, "_CacheDeleteEnumerateRemovedFiles: Unable to verify directory and marker, starting from zero. Directory: %{public}@, marker: %{public}@", buf, 0x16u);

            }
            free(v92);
            goto LABEL_100;
          }
          -[NSObject UUIDString](v62, "UUIDString");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject UUIDString](osloga, "UUIDString");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v63, "isEqualToString:", v64);

          if ((v65 & 1) == 0)
          {
            CDGetLogHandle((uint64_t)"client");
            v69 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
            {
              -[NSObject mountPoint](v57, "mountPoint");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v109 = (uint64_t)v82;
              _os_log_error_impl(&dword_1A3662000, v69, OS_LOG_TYPE_ERROR, "verifyDirAndMarkerUUIDs: Marker FSEventsUUID does not match cdVolume: %{public}@", buf, 0xCu);

            }
            goto LABEL_95;
          }

          v22 = v92[4];
          free(v92);
          if (v22)
            goto LABEL_26;
        }
LABEL_100:
        CDGetLogHandle((uint64_t)"client");
        v72 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1A3662000, v72, OS_LOG_TYPE_ERROR, "_CacheDeleteEnumerateRemovedFiles: Unable to get a purgeMarker, was CacheDeleteEnumerateRemovedFilesInDirectories() invoked before CacheDeleteInitPurgeMarker() ?", buf, 2u);
        }

        setPurgeMarker(*(void **)(v95 + 56), sinceWhena, 1, 0);
        (*(void (**)(void))(*(_QWORD *)(v95 + 32) + 16))();
        sinceWhen = 0;
        v48 = 1;
        p_super = &v21->super;
LABEL_103:

        _Block_object_dispose(v117, 8);
        if ((v48 & 1) != 0)
          goto LABEL_106;
      }
      v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v116, 16);
    }
    while (v91);
  }
LABEL_106:

}

void ___CacheDeleteEnumerateRemovedFiles_block_invoke_94(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = 0;

}

void __CacheDeleteEnumerateRemovedFiles_block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
