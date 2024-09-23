@implementation OSLogEventLocalStore

uint64_t __53__OSLogEventLocalStore_prepareWithCompletionHandler___block_invoke_2(int a1, void *a2, size_t a3)
{
  return munmap(a2, a3);
}

- (void)prepareWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  OSLogEventLocalStore *v10;
  void (**progressHandler)(id, _QWORD);
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  OSLogEventLocalStore *v17;
  void (**v18)(id, _QWORD);
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  OSLogEventLocalStore *v25;
  void (**v26)(id, _QWORD);
  void *v27;
  void *v28;
  int v29;
  FILE *v30;
  FILE *v31;
  int v32;
  void *v33;
  uint64_t v34;
  id v35;
  OSLogEventLocalStore *v36;
  void (**v37)(id, _QWORD);
  _OSLogEventStoreMetadata *v38;
  OSLogEventSource *v39;
  void *v40;
  OSLogEventLocalStore *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  int *v47;
  void *v48;
  void *v49;
  void (**v50)(_QWORD, _QWORD, double);
  double v51;
  double v52;
  void *v53;
  void *v54;
  char v55;
  id v56;
  OSLogEventLocalStore *v57;
  void (**v58)(id, _QWORD);
  _OSLogEventStoreMetadata *v59;
  uint64_t v60;
  _OSLogChunkMemory *v61;
  _OSLogChunkMemory *v62;
  _OSLogIndexFile *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  OSLogEventSource *v68;
  uint64_t v69;
  void *v70;
  void (**v71)(_QWORD, _QWORD, double);
  double v72;
  double v73;
  void *v74;
  id v75;
  OSLogEventLocalStore *v76;
  void (**v77)(id, _QWORD);
  void *v78;
  OSLogEventLocalStore *v79;
  OSLogEventLocalStore *v80;
  void *v81;
  FILE *v82;
  FILE *v83;
  OSLogEventSource *v84;
  _OSLogEventStoreMetadata *v85;
  unsigned int v86;
  void *v87;
  void *v88;
  id v89;
  char *v90;
  void *v91;
  uint64_t v92;
  id v93;

  v4 = (void (**)(id, _QWORD, void *))a3;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = 0;
  +[_OSLogCollectionReference localDBRefWithError:](_OSLogCollectionReference, "localDBRefWithError:", &v93);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v93;
  v8 = v7;
  if (!v6)
  {
    if (!v7)
    {
      _OSLogError(6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v4[2](v4, 0, v8);
    goto LABEL_37;
  }
  v9 = v5;
  v10 = self;
  objc_msgSend(v9, "setCompletedUnitCount:", objc_msgSend(v9, "completedUnitCount") + 1);
  progressHandler = (void (**)(id, _QWORD))v10->super._progressHandler;

  if (progressHandler)
  {
    objc_msgSend(v9, "fractionCompleted");
    progressHandler[2](progressHandler, 0);
  }

  objc_msgSend(v6, "timesyncReference");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "fileDescriptor");

  v14 = _timesync_db_openat(v13, ".");
  if (!v14)
  {
    v43 = *__error();
    v44 = 12;
LABEL_32:
    _OSLogPOSIXError(v44, v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v45);

    objc_msgSend(v6, "close");
    goto LABEL_37;
  }
  v15 = v14;
  v16 = v9;
  v17 = v10;
  objc_msgSend(v16, "setCompletedUnitCount:", objc_msgSend(v16, "completedUnitCount") + 1);
  v18 = (void (**)(id, _QWORD))v10->super._progressHandler;

  if (v18)
  {
    objc_msgSend(v16, "fractionCompleted");
    v18[2](v18, 0);
  }

  v92 = 0;
  objc_msgSend(v6, "diagnosticsDirectoryReference");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
LABEL_11:
    v24 = v16;
    v25 = v17;
    objc_msgSend(v24, "setCompletedUnitCount:", objc_msgSend(v24, "completedUnitCount") + 1);
    v26 = (void (**)(id, _QWORD))v10->super._progressHandler;

    if (v26)
    {
      objc_msgSend(v24, "fractionCompleted");
      v26[2](v26, 0);
    }

    NSTemporaryDirectory();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      v90 = 0;
      asprintf(&v90, "%slsfw-tmp-XXXXXXX.tracev3", (const char *)objc_msgSend(objc_retainAutorelease(v27), "UTF8String"));
      if (v90)
      {
        v88 = v19;
        v29 = mkstemps(v90, 8);
        if (v29 == -1)
        {
          free(v90);
          v19 = v88;
        }
        else
        {
          unlink(v90);
          v30 = fdopen(v29, "w+");
          free(v90);
          v31 = v30;
          v19 = v88;
          if (v31)
          {
            v81 = v28;
            v82 = v31;
            v32 = fileno(v31);
            -[OSLogEventStore _relativeFilePaths](v25, "_relativeFilePaths");
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (v33)
              v34 = 0;
            else
              v34 = 3;
            v86 = v32;
            if ((OSLogCaptureInflightBuffersToFile(v32, v34, 0) & 1) == 0)
            {
              fclose(v82);
              v86 = -1;
            }
            v35 = v24;
            v36 = v25;
            objc_msgSend(v35, "setCompletedUnitCount:", objc_msgSend(v35, "completedUnitCount") + 1);
            v37 = (void (**)(id, _QWORD))v10->super._progressHandler;
            v79 = v36;

            if (v37)
            {
              objc_msgSend(v35, "fractionCompleted");
              v37[2](v37, 0);
            }

            v38 = -[_OSLogEventStoreMetadata initWithCollection:localStorePlist:liveDataDescriptor:]([_OSLogEventStoreMetadata alloc], "initWithCollection:localStorePlist:liveDataDescriptor:", v6, v88, v86);
            v39 = -[OSLogEventSource initWithCollection:metadata:timesync:]([OSLogEventSource alloc], "initWithCollection:metadata:timesync:", v6, v38, v15);
            objc_msgSend(v35, "becomeCurrentWithPendingUnitCount:", 1);
            objc_msgSend(v6, "diagnosticsDirectoryReference");
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            v28 = v81;
            v84 = v39;
            v85 = v38;
            if (v40)
            {
              v41 = v79;
              -[OSLogEventStore _relativeFilePaths](v79, "_relativeFilePaths");
              v42 = (void *)objc_claimAutoreleasedReturnValue();

              if (v42)
              {
                -[OSLogEventStore addFilesToSource:forCollection:withProgress:](v79, "addFilesToSource:forCollection:withProgress:", v39, v6, v35);
              }
              else
              {
                -[OSLogEventStore _progressHandler](v79, "_progressHandler");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v55 = _enumerateArchiveIntoSource(v39, v6, v54, v4);

                if ((v55 & 1) == 0)
                {
                  fclose(v82);
                  v19 = v88;
                  v68 = v84;
                  v59 = v85;
LABEL_56:

                  goto LABEL_36;
                }
              }
            }
            else
            {
              v41 = v79;
              -[OSLogEventStore _progressHandler](v79, "_progressHandler");
              v49 = (void *)objc_claimAutoreleasedReturnValue();

              if (v49)
              {
                objc_msgSend(MEMORY[0x1E0CB38A8], "currentProgress");
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                -[OSLogEventStore _progressHandler](v79, "_progressHandler");
                v50 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "fractionCompleted");
                v52 = v51;
                _OSLogPOSIXError(18, 2);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                ((void (**)(_QWORD, void *, double))v50)[2](v50, v53, v52);

              }
            }
            objc_msgSend(v35, "resignCurrent");
            v56 = v35;
            v57 = v41;
            objc_msgSend(v56, "setCompletedUnitCount:", objc_msgSend(v56, "completedUnitCount"));
            v58 = (void (**)(id, _QWORD))v10->super._progressHandler;

            if (v58)
            {
              objc_msgSend(v56, "fractionCompleted");
              v58[2](v58, 0);
            }

            v59 = v85;
            if (v86 == -1)
            {
LABEL_53:
              v75 = v56;
              v76 = v57;
              objc_msgSend(v75, "setCompletedUnitCount:", objc_msgSend(v75, "completedUnitCount") + 1);
              v77 = (void (**)(id, _QWORD))v10->super._progressHandler;

              if (v77)
              {
                objc_msgSend(v75, "fractionCompleted");
                v77[2](v77, 0);
              }

              v68 = v84;
              ((void (**)(id, OSLogEventSource *, void *))v4)[2](v4, v84, 0);
              v19 = v88;
              goto LABEL_56;
            }
            v80 = v57;
            v60 = _os_trace_mmap();
            fclose(v82);
            v61 = [_OSLogChunkMemory alloc];
            v62 = -[_OSLogChunkMemory initWithBytes:size:deallocator:](v61, "initWithBytes:size:deallocator:", v60, v92, &__block_literal_global_161_3105);
            v89 = 0;
            v63 = -[_OSLogIndexFile initWithChunkStore:error:]([_OSLogIndexFile alloc], "initWithChunkStore:error:", v62, &v89);
            v64 = v89;
            v87 = v64;
            if (v63)
            {
              -[OSLogEventSource _insertIndexFile:](v84, "_insertIndexFile:", v63);
LABEL_52:

              v59 = v85;
              v57 = v80;
              goto LABEL_53;
            }
            v65 = v64;
            v83 = (FILE *)v62;
            objc_msgSend(v64, "domain");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = v66;
            if (v66 == (void *)*MEMORY[0x1E0CB2FE0])
            {
              v69 = objc_msgSend(v65, "code");

              v62 = (_OSLogChunkMemory *)v83;
              if (v69 == 34)
                goto LABEL_52;
            }
            else
            {

              v62 = (_OSLogChunkMemory *)v83;
            }
            -[OSLogEventStore _progressHandler](v80, "_progressHandler");
            v70 = (void *)objc_claimAutoreleasedReturnValue();

            if (v70)
            {
              -[OSLogEventStore _progressHandler](v80, "_progressHandler");
              v71 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "fractionCompleted");
              v73 = v72;
              _OSLogInternalError(17, v87);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, void *, double))v71)[2](v71, v74, v73);

              v62 = (_OSLogChunkMemory *)v83;
            }
            goto LABEL_52;
          }
        }
      }
    }
    v47 = __error();
    _OSLogPOSIXError(7, *v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v48);

    objc_msgSend(v6, "close");
LABEL_36:

    goto LABEL_37;
  }
  objc_msgSend(v6, "diagnosticsDirectoryReference");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "fileDescriptor");

  v21 = _os_trace_mmap_at();
  if (!v21)
  {
    v43 = *__error();
    v44 = 5;
    goto LABEL_32;
  }
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:deallocator:", v21, v92, &__block_literal_global_157);
  v91 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v22, 0, 0, &v91);
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v19 = (void *)v23;

    goto LABEL_11;
  }
  _OSLogInternalError(5, v91);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, 0, v46);

  objc_msgSend(v6, "close");
LABEL_37:

}

uint64_t __53__OSLogEventLocalStore_prepareWithCompletionHandler___block_invoke(int a1, void *a2, size_t a3)
{
  return munmap(a2, a3);
}

@end
