@implementation CPLEngineResourceDownloadQueue

- (CPLEngineResourceDownloadQueue)initWithEngineStore:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *downloadLock;
  CPLActiveDownloadQueue *v12;
  CPLActiveDownloadQueue *v13;
  CPLActiveDownloadQueue *v14;
  CPLActiveDownloadQueue *v15;
  CPLActiveDownloadQueue *v16;
  CPLActiveDownloadQueue *v17;
  uint64_t v18;
  NSArray *allHighPriorityQueues;
  uint64_t v20;
  NSArray *bestCancellableHighPriorityQueues;
  CPLActiveDownloadQueue *v22;
  CPLActiveDownloadQueue *v23;
  CPLActiveDownloadQueue *v24;
  CPLActiveDownloadQueue *v25;
  CPLActiveDownloadQueue *v26;
  CPLActiveDownloadQueue *v27;
  CPLActiveDownloadQueue *v28;
  CPLActiveDownloadQueue *v29;
  uint64_t v30;
  id highPriorityQueuePerResourceTypeAndTransferIntent;
  CPLActiveDownloadQueue *v32;
  CPLActiveDownloadQueue *v33;
  CPLActiveDownloadQueue *v34;
  CPLActiveDownloadQueue *v35;
  CPLActiveDownloadQueue *v36;
  CPLActiveDownloadQueue *v37;
  CPLActiveDownloadQueue *v38;
  uint64_t v39;
  NSArray *allLowPriorityQueues;
  uint64_t v41;
  NSArray *bestCancellableLowPriorityQueues;
  uint64_t v43;
  CPLActiveDownloadQueue *v44;
  CPLActiveDownloadQueue *v45;
  CPLActiveDownloadQueue *v46;
  CPLActiveDownloadQueue *v47;
  CPLActiveDownloadQueue *v48;
  CPLActiveDownloadQueue *v49;
  CPLActiveDownloadQueue *v50;
  uint64_t v51;
  id lowPriorityQueuePerResourceTypeAndTransferIntent;
  uint64_t v53;
  NSArray *allQueues;
  NSObject *v56;
  void *v57;
  void *v58;
  SEL v59;
  id v60;
  id v61;
  CPLActiveDownloadQueue *v62;
  CPLActiveDownloadQueue *v63;
  CPLActiveDownloadQueue *v64;
  CPLActiveDownloadQueue *v65;
  CPLActiveDownloadQueue *v66;
  CPLActiveDownloadQueue *v67;
  CPLActiveDownloadQueue *v68;
  CPLActiveDownloadQueue *v69;
  CPLActiveDownloadQueue *v70;
  CPLActiveDownloadQueue *v71;
  CPLActiveDownloadQueue *v72;
  CPLActiveDownloadQueue *v73;
  CPLActiveDownloadQueue *v74;
  CPLActiveDownloadQueue *v75;
  CPLActiveDownloadQueue *v76;
  CPLActiveDownloadQueue *v77;
  CPLActiveDownloadQueue *v78;
  CPLActiveDownloadQueue *v79;
  CPLActiveDownloadQueue *v80;
  CPLActiveDownloadQueue *v81;
  CPLActiveDownloadQueue *v82;
  CPLActiveDownloadQueue *v83;
  CPLActiveDownloadQueue *v84;
  CPLEngineResourceDownloadQueue *v85;
  _QWORD v86[4];
  CPLActiveDownloadQueue *v87;
  CPLActiveDownloadQueue *v88;
  CPLActiveDownloadQueue *v89;
  CPLActiveDownloadQueue *v90;
  CPLActiveDownloadQueue *v91;
  CPLActiveDownloadQueue *v92;
  CPLActiveDownloadQueue *v93;
  CPLActiveDownloadQueue *v94;
  uint8_t buf[8];
  _QWORD v96[4];
  CPLActiveDownloadQueue *v97;
  CPLActiveDownloadQueue *v98;
  CPLActiveDownloadQueue *v99;
  CPLActiveDownloadQueue *v100;
  CPLActiveDownloadQueue *v101;
  CPLActiveDownloadQueue *v102;
  CPLActiveDownloadQueue *v103;
  CPLActiveDownloadQueue *v104;
  CPLActiveDownloadQueue *v105;
  CPLActiveDownloadQueue *v106;
  CPLActiveDownloadQueue *v107;
  CPLActiveDownloadQueue *v108;
  CPLActiveDownloadQueue *v109;
  CPLActiveDownloadQueue *v110;
  CPLActiveDownloadQueue *v111;
  CPLActiveDownloadQueue *v112;
  objc_super v113;
  _QWORD v114[8];
  _QWORD v115[8];
  _QWORD v116[9];
  _QWORD v117[18];

  v117[16] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v113.receiver = self;
  v113.super_class = (Class)CPLEngineResourceDownloadQueue;
  v85 = -[CPLEngineStorage initWithEngineStore:name:](&v113, sel_initWithEngineStore_name_, v7, v8);
  if (v85)
  {
    v59 = a2;
    v60 = v8;
    v61 = v7;
    CPLCopyDefaultSerialQueueAttributes();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.cpl.resourceDownloadQueue", v9);
    downloadLock = v85->_downloadLock;
    v85->_downloadLock = (OS_dispatch_queue *)v10;

    v73 = -[CPLActiveDownloadQueue initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:]([CPLActiveDownloadQueue alloc], "initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:", CFSTR("High Priority"), 1, 0, 10485760, 4, 0, &__block_literal_global_6840);
    v79 = -[CPLActiveDownloadQueue initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:]([CPLActiveDownloadQueue alloc], "initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:", CFSTR("Widget High Priority"), 2, 0, 10485760, 4, 0, &__block_literal_global_5);
    v82 = -[CPLActiveDownloadQueue initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:]([CPLActiveDownloadQueue alloc], "initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:", CFSTR("Thumbnails"), 1, 0, 10485760, 2, 500000000, &__block_literal_global_8_6843);
    v12 = -[CPLActiveDownloadQueue initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:]([CPLActiveDownloadQueue alloc], "initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:", CFSTR("Grid High Priority"), 1, 0, 10485760, 4, 0, &__block_literal_global_11_6845);
    v76 = -[CPLActiveDownloadQueue initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:]([CPLActiveDownloadQueue alloc], "initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:", CFSTR("1-Up High Priority"), 1, 0, 10485760, 4, 0, &__block_literal_global_14);
    v78 = -[CPLActiveDownloadQueue initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:]([CPLActiveDownloadQueue alloc], "initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:", CFSTR("Wallpaper Shuffle High Priority"), 1, 0, 10485760, 4, 0, &__block_literal_global_17);
    v80 = -[CPLActiveDownloadQueue initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:]([CPLActiveDownloadQueue alloc], "initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:", CFSTR("Edit High Priority"), 1, 0, 10485760, 4, 0, &__block_literal_global_20_6849);
    v62 = -[CPLActiveDownloadQueue initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:]([CPLActiveDownloadQueue alloc], "initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:", CFSTR("Memory Playback High Priority"), 1, 0, 10485760, 4, 0, &__block_literal_global_23_6851);
    v63 = -[CPLActiveDownloadQueue initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:]([CPLActiveDownloadQueue alloc], "initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:", CFSTR("Memory Preload High Priority"), 1, 0, 10485760, 4, 0, &__block_literal_global_26_6853);
    v65 = -[CPLActiveDownloadQueue initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:]([CPLActiveDownloadQueue alloc], "initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:", CFSTR("Memory Prefetch High Priority"), 2, 1, 10485760, 1, 1000000000, &__block_literal_global_29_6855);
    v13 = -[CPLActiveDownloadQueue initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:]([CPLActiveDownloadQueue alloc], "initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:", CFSTR("Memory Inline Playback High Priority"), 2, 0, 10485760, 4, 0, &__block_literal_global_32_6857);
    v14 = -[CPLActiveDownloadQueue initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:]([CPLActiveDownloadQueue alloc], "initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:", CFSTR("Memory Inline Preload High Priority"), 2, 0, 10485760, 4, 0, &__block_literal_global_35_6859);
    v15 = -[CPLActiveDownloadQueue initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:]([CPLActiveDownloadQueue alloc], "initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:", CFSTR("Analysis Download High Priority"), 2, 1, 10485760, 4, 1000000000, &__block_literal_global_38_6861);
    v71 = -[CPLActiveDownloadQueue initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:]([CPLActiveDownloadQueue alloc], "initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:", CFSTR("Watch Sync Download High Priority"), 2, 1, 10485760, 1, 1000000000, &__block_literal_global_41_6863);
    v16 = -[CPLActiveDownloadQueue initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:]([CPLActiveDownloadQueue alloc], "initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:", CFSTR("Wallpaper Suggestion High Priority"), 2, 1, 10485760, 1, 1000000000, &__block_literal_global_44);
    v17 = -[CPLActiveDownloadQueue initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:]([CPLActiveDownloadQueue alloc], "initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:", CFSTR("Wallpaper Live Photo High Priority"), 2, 1, 10485760, 1, 1000000000, &__block_literal_global_47);
    v117[0] = v73;
    v117[1] = v82;
    v117[2] = v12;
    v117[3] = v76;
    v117[4] = v80;
    v117[5] = v62;
    v117[6] = v63;
    v117[7] = v13;
    v117[8] = v14;
    v117[9] = v79;
    v117[10] = v65;
    v117[11] = v15;
    v117[12] = v71;
    v117[13] = v16;
    v117[14] = v78;
    v117[15] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 16);
    v18 = objc_claimAutoreleasedReturnValue();
    allHighPriorityQueues = v85->_allHighPriorityQueues;
    v85->_allHighPriorityQueues = (NSArray *)v18;

    v116[0] = v65;
    v116[1] = v79;
    v116[2] = v15;
    v116[3] = v71;
    v116[4] = v16;
    v116[5] = v17;
    v116[6] = v78;
    v116[7] = v14;
    v116[8] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 9);
    v20 = objc_claimAutoreleasedReturnValue();
    bestCancellableHighPriorityQueues = v85->_bestCancellableHighPriorityQueues;
    v85->_bestCancellableHighPriorityQueues = (NSArray *)v20;

    v96[0] = MEMORY[0x1E0C809B0];
    v96[1] = 3221225472;
    v96[2] = __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_17;
    v96[3] = &unk_1E60D8EB0;
    v97 = v79;
    v98 = v82;
    v99 = v12;
    v100 = v76;
    v101 = v80;
    v102 = v78;
    v103 = v62;
    v104 = v63;
    v105 = v65;
    v106 = v13;
    v107 = v14;
    v108 = v15;
    v109 = v16;
    v110 = v17;
    v111 = v71;
    v112 = v73;
    v74 = v73;
    v72 = v71;
    v70 = v17;
    v69 = v16;
    v68 = v15;
    v22 = v14;
    v67 = v106;
    v66 = v65;
    v64 = v63;
    v23 = v62;
    v24 = v78;
    v25 = v80;
    v26 = v76;
    v27 = v99;
    v28 = v82;
    v29 = v79;
    v30 = MEMORY[0x1B5E08DC4](v96);
    highPriorityQueuePerResourceTypeAndTransferIntent = v85->_highPriorityQueuePerResourceTypeAndTransferIntent;
    v85->_highPriorityQueuePerResourceTypeAndTransferIntent = (id)v30;

    v83 = -[CPLActiveDownloadQueue initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:]([CPLActiveDownloadQueue alloc], "initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:", CFSTR("Derivatives Low Priority"), 0, 1, 104857600, 3, 1000000000, &__block_literal_global_53);
    v32 = -[CPLActiveDownloadQueue initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:]([CPLActiveDownloadQueue alloc], "initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:", CFSTR("Thumbmails Low Priority"), 0, 1, 104857600, 3, 1000000000, &__block_literal_global_56);
    v33 = -[CPLActiveDownloadQueue initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:]([CPLActiveDownloadQueue alloc], "initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:", CFSTR("Non-Derivatives Low Priority"), 0, 1, 104857600, 3, 1000000000, &__block_literal_global_59);
    v81 = -[CPLActiveDownloadQueue initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:]([CPLActiveDownloadQueue alloc], "initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:", CFSTR("Keep-Originals Low Priority"), 0, 1, 104857600, 3, 1000000000, &__block_literal_global_62);
    v34 = -[CPLActiveDownloadQueue initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:]([CPLActiveDownloadQueue alloc], "initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:", CFSTR("Optimize-Originals Low Priority"), 0, 1, 104857600, 3, 1000000000, &__block_literal_global_65);
    v35 = -[CPLActiveDownloadQueue initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:]([CPLActiveDownloadQueue alloc], "initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:", CFSTR("Widget Low Priority"), 0, 1, 104857600, 3, 1000000000, &__block_literal_global_68);
    v36 = -[CPLActiveDownloadQueue initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:]([CPLActiveDownloadQueue alloc], "initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:", CFSTR("Recovery Low Priority"), 0, 1, 104857600, 3, 1000000000, &__block_literal_global_71_6874);
    v37 = -[CPLActiveDownloadQueue initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:]([CPLActiveDownloadQueue alloc], "initWithName:type:FIFOQueue:maximumBatchSize:maximumConcurrentTransportTasks:coalescingInterval:groupConstructor:", CFSTR("Background Edit Suggestion Low Priority"), 0, 1, 104857600, 3, 1000000000, &__block_literal_global_74);
    v115[0] = v32;
    v115[1] = v81;
    v115[2] = v34;
    v115[3] = v35;
    v38 = v35;
    v115[4] = v33;
    v115[5] = v36;
    v115[6] = v83;
    v115[7] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 8);
    v39 = objc_claimAutoreleasedReturnValue();
    allLowPriorityQueues = v85->_allLowPriorityQueues;
    v85->_allLowPriorityQueues = (NSArray *)v39;

    v75 = v37;
    v77 = v36;
    v114[0] = v37;
    v114[1] = v32;
    v114[2] = v83;
    v114[3] = v36;
    v114[4] = v33;
    v114[5] = v35;
    v114[6] = v34;
    v114[7] = v81;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 8);
    v41 = objc_claimAutoreleasedReturnValue();
    bestCancellableLowPriorityQueues = v85->_bestCancellableLowPriorityQueues;
    v85->_bestCancellableLowPriorityQueues = (NSArray *)v41;

    v43 = -[NSArray count](v85->_bestCancellableLowPriorityQueues, "count");
    if (v43 != -[NSArray count](v85->_allLowPriorityQueues, "count"))
    {
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_6732();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B03C2000, v56, OS_LOG_TYPE_ERROR, "Incorrect array of active download queues", buf, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineResourceDownloadQueue.m");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", v59, v85, v58, 409, CFSTR("Incorrect array of active download queues"));

      abort();
    }
    v86[0] = MEMORY[0x1E0C809B0];
    v86[1] = 3221225472;
    v86[2] = __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_80;
    v86[3] = &unk_1E60D8F58;
    v87 = v37;
    v88 = v35;
    v89 = v36;
    v90 = v32;
    v91 = v81;
    v92 = v34;
    v93 = v33;
    v94 = v83;
    v84 = v83;
    v44 = v33;
    v45 = v34;
    v46 = v81;
    v47 = v32;
    v48 = v77;
    v49 = v38;
    v50 = v75;
    v51 = MEMORY[0x1B5E08DC4](v86);
    lowPriorityQueuePerResourceTypeAndTransferIntent = v85->_lowPriorityQueuePerResourceTypeAndTransferIntent;
    v85->_lowPriorityQueuePerResourceTypeAndTransferIntent = (id)v51;

    -[NSArray arrayByAddingObjectsFromArray:](v85->_allHighPriorityQueues, "arrayByAddingObjectsFromArray:", v85->_allLowPriorityQueues);
    v53 = objc_claimAutoreleasedReturnValue();
    allQueues = v85->_allQueues;
    v85->_allQueues = (NSArray *)v53;

    v8 = v60;
    v7 = v61;
  }

  return v85;
}

- (unint64_t)scopeType
{
  return 1;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  void *v10;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v10, "deleteRecordsForScopeIndex:maxCount:deletedCount:error:", a3, a4, a5, a6);

  return (char)a6;
}

- (id)cloudResourceForLocalResource:(id *)a3 cloudRecord:(id *)a4 target:(id *)a5 shouldNotTrustCaches:(BOOL *)a6 allowUnsafeClientCache:(BOOL)a7 transportScopeMapping:(id)a8 error:(id *)a9
{
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  void *v22;
  int v23;
  NSObject *v24;
  id v25;
  void *v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  _BOOL4 v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  char v48;
  id v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  id *v57;
  id v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  NSObject *v69;
  NSObject *v71;
  void *v72;
  void *v73;
  const __CFString *v74;
  void *v75;
  SEL v76;
  CPLEngineResourceDownloadQueue *v77;
  void *v78;
  uint64_t v79;
  NSObject *v80;
  char v81;
  id v82;
  id v83;
  CPLEngineResourceDownloadQueue *v84;
  id v85;
  id v86;
  _BOOL4 v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  id v93;
  SEL v94;
  void *v96;
  uint64_t v97;
  _BOOL4 v98;
  void *v99;
  void *v100;
  void *v102;
  void *v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  uint8_t buf[4];
  id v110;
  uint64_t v111;

  v98 = a7;
  v111 = *MEMORY[0x1E0C80C00];
  v13 = a8;
  *a6 = 0;
  -[CPLEngineStorage engineStore](self, "engineStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scopes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*a3, "identity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a3, "itemScopedIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");

  if (!v18)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_6732();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = *a3;
        *(_DWORD *)buf = 138412290;
        v110 = v20;
        _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_ERROR, "Client is asking to download %@ but did not provide an item identifier", buf, 0xCu);
      }

    }
    if (a9)
    {
      +[CPLErrors incorrectParametersErrorForParameter:](CPLErrors, "incorrectParametersErrorForParameter:", CFSTR("itemScopedIdentifier"));
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(v18, "scopeIdentifier");
  v21 = objc_claimAutoreleasedReturnValue();
  v102 = (void *)v21;
  v94 = a2;
  if (!v21)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_6732();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = *a3;
        *(_DWORD *)buf = 138412290;
        v110 = v25;
        _os_log_impl(&dword_1B03C2000, v24, OS_LOG_TYPE_ERROR, "Client is asking to download %@ with an invalid scope identifier", buf, 0xCu);
      }

    }
    if (a9)
    {
      +[CPLErrors incorrectParametersErrorForParameter:](CPLErrors, "incorrectParametersErrorForParameter:", CFSTR("itemScopedIdentifier"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:
      v103 = 0;
      v23 = 0;
      *a9 = v26;
LABEL_26:
      v97 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_27;
    }
LABEL_25:
    v103 = 0;
    v23 = 0;
    goto LABEL_26;
  }
  if (!v18)
    goto LABEL_25;
  objc_msgSend(v15, "scopeWithIdentifier:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_6732();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = *a3;
        *(_DWORD *)buf = 138412290;
        v110 = v28;
        _os_log_impl(&dword_1B03C2000, v27, OS_LOG_TYPE_ERROR, "Client is asking to download %@ but scope is unknown", buf, 0xCu);
      }

    }
    if (a9)
    {
      +[CPLErrors invalidScopeErrorWithScopedIdentifier:](CPLErrors, "invalidScopeErrorWithScopedIdentifier:", v18);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  v103 = v22;
  v97 = objc_msgSend(v22, "localIndex");
  v23 = 1;
LABEL_27:
  objc_msgSend(v16, "fingerPrint");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v23 && !v29)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_6732();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = *a3;
        *(_DWORD *)buf = 138412290;
        v110 = v32;
        _os_log_impl(&dword_1B03C2000, v31, OS_LOG_TYPE_ERROR, "Client asked to download %@ without specifying a finger print", buf, 0xCu);
      }

    }
    if (a9)
    {
      +[CPLErrors incorrectParametersErrorForParameter:](CPLErrors, "incorrectParametersErrorForParameter:", CFSTR("identity.fingerPrint"));
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "fileURL");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_44;
  }
  objc_msgSend(v16, "fileURL");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v90 = v33;
    v84 = self;
    -[CPLEngineStorage engineStore](self, "engineStore");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "idMapping");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v34;
    objc_msgSend(v34, "transactionClientCacheView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(*a3, "resourceType");
    if (a4)
      v37 = &v108;
    else
      v37 = 0;
    if (a4)
      v108 = 0;
    v107 = 0;
    objc_msgSend(v35, "resourceOfType:forRecordWithScopedIdentifier:record:error:", v36, v18, v37, &v107);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = v15;
    if (a4)
      v88 = v108;
    else
      v88 = 0;
    v93 = v107;
    v43 = (id)objc_msgSend(v38, "copy");

    v44 = 0;
    v45 = 0;
    if (!v43 && v98)
    {
      if (!objc_msgSend(v93, "isCPLErrorWithCode:", 25))
      {
        v44 = 0;
        v45 = 0;
        goto LABEL_61;
      }
      buf[0] = 0;
      objc_msgSend(v91, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v18, buf);
      v45 = objc_claimAutoreleasedReturnValue();
      v44 = v45 == 0;
      if (v45 || (objc_msgSend(v92, "hasFinishedInitialSyncForScope:", v103) & 1) == 0)
      {
        v43 = (id)objc_msgSend(*a3, "copy");
        *a6 = 1;
      }
      else
      {
        v44 = 0;
        v43 = 0;
      }
    }
    if (v43)
    {
      v99 = (void *)v45;
      v87 = v44;
      v83 = v13;
      v85 = (id)v30;
      objc_msgSend(v43, "identity");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "fingerPrint");
      v47 = objc_claimAutoreleasedReturnValue();

      if (v30 && v47)
      {
        v48 = objc_msgSend(v85, "isEqual:", v47);

        if ((v48 & 1) == 0)
        {
LABEL_58:
          if (a9)
          {
            v49 = *a3;
            objc_msgSend(v43, "identity");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "fingerPrint");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 27, CFSTR("%@ is stale (client cache fingerprint is %@)"), v49, v51);
            *a9 = (id)objc_claimAutoreleasedReturnValue();

          }
          v39 = 0;
          v52 = 0;
          v40 = 0;
          v13 = v83;
          goto LABEL_95;
        }
      }
      else
      {

        if (v30 | v47)
          goto LABEL_58;
      }
      objc_msgSend(v43, "_setBackgroundDownloadTaskIdentifier:", objc_msgSend(*a3, "_backgroundDownloadTaskIdentifier"));
      v43 = objc_retainAutorelease(v43);
      *a3 = v43;
      objc_msgSend(v43, "identity");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setFileURL:", v90);

      v54 = (uint64_t)v99;
      if (!v99)
      {
        buf[0] = 0;
        objc_msgSend(v91, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v18, buf);
        v54 = objc_claimAutoreleasedReturnValue();
        if (!v54)
        {
          v54 = objc_msgSend(v18, "copy");
          *a6 = 1;
        }
      }
      objc_msgSend(v89, "cloudCache");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(*a3, "resourceType");
      if (a4)
        v57 = &v106;
      else
        v57 = 0;
      if (a4)
        v106 = 0;
      v105 = 0;
      v99 = (void *)v54;
      objc_msgSend(v55, "resourceOfType:forRecordWithScopedIdentifier:record:target:error:", v56, v54, v57, a5, &v105);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4)
        v39 = v106;
      else
        v39 = 0;
      v58 = v105;

      v96 = v58;
      if (!v40)
      {
        if (!objc_msgSend(v58, "isCPLErrorWithCode:", 25)
          || (v40 = (void *)objc_msgSend(*a3, "copy"), objc_msgSend(v40, "setItemScopedIdentifier:", v99), !v40))
        {
          if (a9)
          {
            v40 = 0;
            v52 = 0;
            *a9 = objc_retainAutorelease(v58);
            goto LABEL_93;
          }
          v40 = 0;
LABEL_92:
          v52 = 0;
          goto LABEL_93;
        }
      }
      v86 = v85;
      objc_msgSend(v40, "identity");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "fingerPrint");
      v60 = objc_claimAutoreleasedReturnValue();

      if (v30 && v60)
      {
        v81 = objc_msgSend(v86, "isEqual:", v60);

        if ((v81 & 1) == 0)
          goto LABEL_80;
      }
      else
      {

        if (v30 | v60)
        {
LABEL_80:
          if (a9)
          {
            v82 = *a3;
            objc_msgSend(v40, "identity");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "fingerPrint");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 27, CFSTR("%@ is stale (cloud cache fingerprint is %@)"), v82, v62);
            *a9 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_92;
        }
      }
      objc_msgSend(v40, "identity");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setFileURL:", v90);

      v52 = 1;
      if (a4)
      {
        v13 = v83;
        if (!v39 && v88)
        {
          objc_msgSend(v88, "translateToCloudRecordUsingIDMapping:", v91);
          v39 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_94;
      }
LABEL_93:
      v13 = v83;
LABEL_94:

      goto LABEL_95;
    }
LABEL_61:
    v99 = (void *)v45;
    v87 = v44;
    v43 = 0;
    v39 = 0;
    v52 = 0;
    v40 = 0;
    if (a9)
      *a9 = objc_retainAutorelease(v93);
LABEL_95:

    if (v52 && !v40)
    {
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_6732();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B03C2000, v71, OS_LOG_TYPE_ERROR, "We should have a cloud resource here", buf, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineResourceDownloadQueue.m");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = CFSTR("We should have a cloud resource here");
      v75 = v72;
      v76 = v94;
      v77 = v84;
      v78 = v73;
      v79 = 586;
    }
    else
    {
      if (!v52)
      {
        v41 = 0;
        v15 = v92;
        v42 = v102;
LABEL_112:
        v33 = v90;
        goto LABEL_113;
      }
      if (v103)
      {
        v64 = objc_msgSend(v103, "cloudIndex");
        objc_msgSend(*a3, "itemScopedIdentifier");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "setScopeIndex:", v97);

        objc_msgSend(v40, "itemScopedIdentifier");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setScopeIndex:", v64);

        objc_msgSend(v40, "itemScopedIdentifier");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "scopeIdentifier");
        v100 = (void *)objc_claimAutoreleasedReturnValue();

        v104 = 0;
        LODWORD(v67) = objc_msgSend(v13, "addTransportScopeForScope:scopes:allowsTentativeTransportScope:useStagingScopeIfNecessary:error:", v103, v92, v87, 1, &v104);
        v68 = v104;
        if ((_DWORD)v67)
        {
          objc_msgSend(v40, "_setBackgroundDownloadTaskIdentifier:", objc_msgSend(*a3, "_backgroundDownloadTaskIdentifier"));
          v42 = v102;
          if (a4)
            *a4 = objc_retainAutorelease(v39);
          v41 = v40;
        }
        else
        {
          if (!_CPLSilentLogging)
          {
            __CPLStorageOSLogDomain_6732();
            v69 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v110 = v100;
              _os_log_impl(&dword_1B03C2000, v69, OS_LOG_TYPE_ERROR, "Can't find a transport scope for %@", buf, 0xCu);
            }

          }
          v41 = 0;
          if (a9)
            *a9 = objc_retainAutorelease(v68);
          v42 = v102;
        }

        v15 = v92;
        goto LABEL_112;
      }
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_6732();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B03C2000, v80, OS_LOG_TYPE_ERROR, "We should have a scope here", buf, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineResourceDownloadQueue.m");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = CFSTR("We should have a scope here");
      v75 = v72;
      v76 = v94;
      v77 = v84;
      v78 = v73;
      v79 = 589;
    }
    objc_msgSend(v75, "handleFailureInMethod:object:file:lineNumber:description:", v76, v77, v78, v79, v74);

    abort();
  }
LABEL_44:
  v39 = 0;
  v40 = 0;
  v41 = 0;
  v42 = v102;
LABEL_113:

  return v41;
}

- (id)downloadTaskForLocalResource:(id)a3 clientBundleID:(id)a4 options:(id)a5 proposedTaskIdentifier:(id)a6 didStartHandler:(id)a7 progressHandler:(id)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *downloadLock;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v41;
  id v42;
  id v43;
  _QWORD v44[5];
  id v45;
  _QWORD block[5];
  uint8_t buf[4];
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v43 = a7;
  v42 = a8;
  v19 = a9;
  if (v17)
  {
    if (v18)
      goto LABEL_3;
  }
  else
  {
    +[CPLResourceTransferTaskOptions defaultOptions](CPLResourceTransferTaskOptions, "defaultOptions");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "UUIDString");
  v18 = (id)objc_claimAutoreleasedReturnValue();

LABEL_3:
  downloadLock = self->_downloadLock;
  v21 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __159__CPLEngineResourceDownloadQueue_downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke;
  block[3] = &unk_1E60D65B8;
  block[4] = self;
  dispatch_async(downloadLock, block);
  v44[0] = v21;
  v44[1] = 3221225472;
  v44[2] = __159__CPLEngineResourceDownloadQueue_downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_3;
  v44[3] = &unk_1E60D8F80;
  v44[4] = self;
  v22 = v19;
  v45 = v22;
  v23 = (void *)MEMORY[0x1B5E08DC4](v44);
  objc_msgSend(v15, "identity");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "fileURL");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v41 = v16;
    -[CPLEngineStorage engineStore](self, "engineStore");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "engineLibrary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "systemMonitor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "diskPressureState");

    if (v29 == 2)
    {
      +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 1005, CFSTR("Disk space is very low"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPLEngineResourceDownloadQueue _failedTaskWithCompletionHandler:error:resource:taskIdentifier:options:](self, "_failedTaskWithCompletionHandler:error:resource:taskIdentifier:options:", v23, v30, v15, v18, v17);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v41;
      goto LABEL_23;
    }
    objc_msgSend(v15, "itemScopedIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "scopeIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
      +[CPLErrors incorrectParametersErrorForParameter:](CPLErrors, "incorrectParametersErrorForParameter:", CFSTR("itemScopedIdentifier"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPLEngineResourceDownloadQueue _failedTaskWithCompletionHandler:error:resource:taskIdentifier:options:](self, "_failedTaskWithCompletionHandler:error:resource:taskIdentifier:options:", v23, v36, v15, v18, v17);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v41;
LABEL_22:

      goto LABEL_23;
    }
    -[CPLEngineStorage engineStore](self, "engineStore");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "scopes");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "scopeWithIdentifier:", v30);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v41;
    if (v37)
    {
      if (!objc_msgSend(v36, "valueForFlag:forScope:", 0x40000, v37))
      {
        -[CPLEngineResourceDownloadQueue _downloadTaskForLocalResource:clientBundleID:options:proposedTaskIdentifier:didStartHandler:progressHandler:completionHandler:](self, "_downloadTaskForLocalResource:clientBundleID:options:proposedTaskIdentifier:didStartHandler:progressHandler:completionHandler:", v15, v41, v17, v18, v43, v42, v23);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 1002, CFSTR("Feature for %@ is disabled"), v30);
      v38 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[CPLErrors invalidScopeErrorWithScopeIdentifier:](CPLErrors, "invalidScopeErrorWithScopeIdentifier:", v30);
      v38 = objc_claimAutoreleasedReturnValue();
    }
    v39 = (void *)v38;
    -[CPLEngineResourceDownloadQueue _failedTaskWithCompletionHandler:error:resource:taskIdentifier:options:](self, "_failedTaskWithCompletionHandler:error:resource:taskIdentifier:options:", v23, v38, v15, v18, v17);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v41;
LABEL_21:

    goto LABEL_22;
  }
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_6732();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v15;
      _os_log_impl(&dword_1B03C2000, v33, OS_LOG_TYPE_ERROR, "Client asked to download %@ without specifying a destination URL", buf, 0xCu);
    }

  }
  +[CPLErrors incorrectParametersErrorForParameter:](CPLErrors, "incorrectParametersErrorForParameter:", CFSTR("identity.fileURL"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineResourceDownloadQueue _failedTaskWithCompletionHandler:error:resource:taskIdentifier:options:](self, "_failedTaskWithCompletionHandler:error:resource:taskIdentifier:options:", v23, v30, v15, v18, v17);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v31;
}

- (id)_downloadTaskForLocalResource:(id)a3 clientBundleID:(id)a4 options:(id)a5 proposedTaskIdentifier:(id)a6 didStartHandler:(id)a7 progressHandler:(id)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  BOOL v30;
  id v31;
  char v32;
  NSObject *v33;
  id v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  CPLEngineResourceDownloadQueue *v47;
  id v48;
  _QWORD *v49;
  BOOL v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  _QWORD *v55;
  _QWORD v56[3];
  char v57;
  id v58;
  id v59;
  id v60;
  id v61;
  char v62;
  uint8_t buf[4];
  id v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v38 = a4;
  v16 = a5;
  v42 = a6;
  v39 = a7;
  v40 = a8;
  v41 = a9;
  v62 = 0;
  v17 = v15;
  -[CPLEngineStorage engineStore](self, "engineStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "transactionTransportScopeMapping");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = 0;
  v61 = v17;
  v59 = 0;
  v58 = 0;
  -[CPLEngineResourceDownloadQueue cloudResourceForLocalResource:cloudRecord:target:shouldNotTrustCaches:allowUnsafeClientCache:transportScopeMapping:error:](self, "cloudResourceForLocalResource:cloudRecord:target:shouldNotTrustCaches:allowUnsafeClientCache:transportScopeMapping:error:", &v61, &v60, &v59, &v62, objc_msgSend(v16, "isHighPriority"), v19, &v58);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v61;

  v22 = v60;
  v23 = v59;
  v24 = v58;
  v37 = v24;
  if (v20)
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = 0;
    v56[1] = v56;
    v56[2] = 0x2020000000;
    v57 = 0;
    if (objc_msgSend(v16, "isHighPriority"))
    {
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __160__CPLEngineResourceDownloadQueue__downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke;
      v52[3] = &unk_1E60D8FA8;
      v55 = v56;
      v53 = v20;
      v54 = v41;
      v25 = (void *)objc_msgSend(v52, "copy");

      v26 = v53;
    }
    else
    {
      if (objc_msgSend(v16, "hasValidTimeRange"))
      {
        +[CPLErrors incorrectParametersErrorForParameter:](CPLErrors, "incorrectParametersErrorForParameter:", CFSTR("timeRange"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!_CPLSilentLogging)
        {
          __CPLStorageOSLogDomain_6732();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v64 = v42;
            v65 = 2112;
            v66 = v16;
            _os_log_impl(&dword_1B03C2000, v28, OS_LOG_TYPE_ERROR, "Cannot download resource for task %@ with options: %@: a timeRange cannot be specified for this task", buf, 0x16u);
          }

        }
        -[CPLEngineResourceDownloadQueue _failedTaskWithCompletionHandler:error:resource:taskIdentifier:options:](self, "_failedTaskWithCompletionHandler:error:resource:taskIdentifier:options:", v41, v25, v17, v42, v16);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      -[CPLEngineStorage platformObject](self, "platformObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_setBackgroundDownloadTaskIdentifier:", objc_msgSend(v29, "newTaskIdentifier"));

      objc_msgSend(v20, "_setBackgroundDownloadTaskIdentifier:", objc_msgSend(v21, "_backgroundDownloadTaskIdentifier"));
      v51 = 0;
      v30 = -[CPLEngineResourceDownloadQueue enqueueBackgroundDownloadTaskForResource:intent:downloading:error:](self, "enqueueBackgroundDownloadTaskForResource:intent:downloading:error:", v21, objc_msgSend(v16, "intent"), 1, &v51);
      v31 = v51;
      if (_CPLSilentLogging)
        v32 = 1;
      else
        v32 = v30;
      if ((v32 & 1) == 0)
      {
        v35 = v31;
        __CPLStorageOSLogDomain_6732();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v64 = v21;
          _os_log_impl(&dword_1B03C2000, v33, OS_LOG_TYPE_ERROR, "Failed to enqueue low priority request for %@", buf, 0xCu);
        }

        v31 = v35;
      }
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __160__CPLEngineResourceDownloadQueue__downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_109;
      v43[3] = &unk_1E60D8FD0;
      v49 = v56;
      v50 = v30;
      v26 = v31;
      v44 = v26;
      v45 = v21;
      v46 = v36;
      v47 = self;
      v48 = v41;
      v25 = (void *)objc_msgSend(v43, "copy");

    }
    if ((objc_msgSend(v16, "hasValidTimeRange") & 1) != 0
      || (-[CPLEngineResourceDownloadQueue _resourceStorageCopyTaskForResource:taskIdentifier:cloudResource:ofRecord:target:didStartHandler:progressHandler:completionHandler:](self, "_resourceStorageCopyTaskForResource:taskIdentifier:cloudResource:ofRecord:target:didStartHandler:progressHandler:completionHandler:", v21, v42, v20, v22, v23, v39, v40, v25), (v27 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[CPLEngineResourceDownloadQueue _realDownloadTaskForLocalResource:taskIdentifier:cloudResource:ofRecord:target:didStartHandler:progressHandler:completionHandler:](self, "_realDownloadTaskForLocalResource:taskIdentifier:cloudResource:ofRecord:target:didStartHandler:progressHandler:completionHandler:", v21, v42, v20, v22, v23, v39, v40, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v27, "setClientBundleID:", v38);
    objc_msgSend(v27, "associateCloudResource:ofRecord:", v20, v22);
    objc_msgSend(v27, "setTransportScopeMapping:", v19);
    objc_msgSend(v27, "setOptions:", v16);
LABEL_23:

    _Block_object_dispose(v56, 8);
    goto LABEL_24;
  }
  -[CPLEngineResourceDownloadQueue _failedTaskWithCompletionHandler:error:resource:taskIdentifier:options:](self, "_failedTaskWithCompletionHandler:error:resource:taskIdentifier:options:", v41, v24, v17, v42, v16);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:

  return v27;
}

- (id)_failedTaskWithCompletionHandler:(id)a3 error:(id)a4 resource:(id)a5 taskIdentifier:(id)a6 options:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  CPLRecordTarget *v16;
  void *v17;
  CPLRecordTarget *v18;
  CPLEngineResourceDownloadTask *v19;
  id v20;
  id v21;
  CPLEngineResourceDownloadTask *v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;

  v11 = a3;
  v12 = a4;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = [CPLRecordTarget alloc];
  objc_msgSend(v15, "itemScopedIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[CPLRecordTarget initWithScopedIdentifier:](v16, "initWithScopedIdentifier:", v17);

  v19 = [CPLEngineResourceDownloadTask alloc];
  v25 = v11;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __105__CPLEngineResourceDownloadQueue__failedTaskWithCompletionHandler_error_resource_taskIdentifier_options___block_invoke;
  v26[3] = &unk_1E60D8FF8;
  v27 = v12;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __105__CPLEngineResourceDownloadQueue__failedTaskWithCompletionHandler_error_resource_taskIdentifier_options___block_invoke_3;
  v24[3] = &unk_1E60D96D8;
  v20 = v11;
  v21 = v12;
  v22 = -[CPLEngineResourceDownloadTask initWithResource:taskIdentifier:target:launchHandler:cancelHandler:didStartHandler:progressHandler:completionHandler:](v19, "initWithResource:taskIdentifier:target:launchHandler:cancelHandler:didStartHandler:progressHandler:completionHandler:", v15, v14, v18, v26, &__block_literal_global_123_6796, 0, 0, v24);

  -[CPLResourceTransferTask setOptions:](v22, "setOptions:", v13);
  return v22;
}

- (id)_resourceStorageCopyTaskForResource:(id)a3 taskIdentifier:(id)a4 cloudResource:(id)a5 ofRecord:(id)a6 target:(id)a7 didStartHandler:(id)a8 progressHandler:(id)a9 completionHandler:(id)a10
{
  id v17;
  id v18;
  void *v19;
  void *v20;
  id *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  CPLEngineResourceDownloadTask *v31;
  id v32;
  NSObject *v34;
  void *v35;
  void *v36;
  CPLEngineResourceDownloadTask *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  _QWORD v45[5];
  id v46;
  id v47;
  _BYTE *v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[5];
  id v52;
  id v53;
  _BYTE *v54;
  _QWORD v55[4];
  id v56;
  id v57;
  NSObject *v58;
  id v59;
  id v60;
  id v61;
  CPLEngineResourceDownloadQueue *v62;
  id v63;
  uint64_t *v64;
  _BYTE *v65;
  id v66;
  uint64_t v67;
  id *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  _BYTE buf[24];
  char v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v38 = a4;
  v39 = a5;
  v40 = a6;
  v41 = a7;
  v42 = a8;
  v17 = a9;
  v18 = a10;
  v67 = 0;
  v68 = (id *)&v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__6773;
  v71 = __Block_byref_object_dispose__6774;
  v72 = 0;
  -[CPLEngineStorage engineStore](self, "engineStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "resourceStorage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v68;
  v66 = v68[5];
  v22 = v43;
  objc_msgSend(v20, "retainFileURLForResource:error:", v43, &v66);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v21 + 5, v66);
  if (v44)
  {
    objc_msgSend(v43, "identity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "fileURL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_6732();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v43;
          _os_log_impl(&dword_1B03C2000, v34, OS_LOG_TYPE_ERROR, "Resource %@ should have a destination URL by now", buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineResourceDownloadQueue.m");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v36, 876, CFSTR("Resource %@ should have a destination URL by now"), v43);

      abort();
    }
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_6732();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v43;
        _os_log_impl(&dword_1B03C2000, v25, OS_LOG_TYPE_DEBUG, "Will link resource %@ from resource storage", buf, 0xCu);
      }

    }
    v26 = v19;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v74 = 0;
    v37 = [CPLEngineResourceDownloadTask alloc];
    v27 = v17;
    v28 = MEMORY[0x1E0C809B0];
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke;
    v55[3] = &unk_1E60D9090;
    v56 = v26;
    v57 = v43;
    v29 = v24;
    v58 = v29;
    v59 = v44;
    v60 = v20;
    v64 = &v67;
    v30 = v39;
    v61 = v30;
    v62 = self;
    v63 = v18;
    v65 = buf;
    v51[0] = v28;
    v51[1] = 3221225472;
    v51[2] = __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_133;
    v51[3] = &unk_1E60D90B8;
    v51[4] = self;
    v54 = buf;
    v52 = v57;
    v53 = v63;
    v49[0] = v28;
    v49[1] = 3221225472;
    v49[2] = __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_135;
    v49[3] = &unk_1E60D9688;
    v50 = v42;
    v45[0] = v28;
    v17 = v27;
    v45[1] = 3221225472;
    v45[2] = __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_2_136;
    v45[3] = &unk_1E60D90E0;
    v45[4] = self;
    v48 = buf;
    v46 = v52;
    v22 = v43;
    v47 = v53;
    v31 = -[CPLEngineResourceDownloadTask initWithResource:taskIdentifier:target:launchHandler:cancelHandler:didStartHandler:progressHandler:completionHandler:](v37, "initWithResource:taskIdentifier:target:launchHandler:cancelHandler:didStartHandler:progressHandler:completionHandler:", v46, v38, v41, v55, v51, v49, v27, v45);
    -[CPLEngineResourceDownloadTask associateCloudResource:ofRecord:](v31, "associateCloudResource:ofRecord:", v30, v40);

    v19 = v26;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (_CPLSilentLogging)
    {
      v31 = 0;
      goto LABEL_13;
    }
    __CPLStorageOSLogDomain_6732();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      v32 = v68[5];
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v43;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v32;
      _os_log_impl(&dword_1B03C2000, v29, OS_LOG_TYPE_DEBUG, "Can't access file in cache for %@: %@", buf, 0x16u);
    }
    v31 = 0;
  }

LABEL_13:
  _Block_object_dispose(&v67, 8);

  return v31;
}

- (id)_realDownloadTaskForLocalResource:(id)a3 taskIdentifier:(id)a4 cloudResource:(id)a5 ofRecord:(id)a6 target:(id)a7 didStartHandler:(id)a8 progressHandler:(id)a9 completionHandler:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  CPLEngineResourceDownloadTask *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  CPLEngineResourceDownloadTask *v31;
  id v33;
  id v34;
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[5];
  id v43;
  id v44;
  _QWORD v45[5];
  id v46;
  uint8_t buf[4];
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v35 = a4;
  v34 = a5;
  v33 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_6732();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v16;
      _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_DEBUG, "Enqueuing download for cloud resource %@", buf, 0xCu);
    }

  }
  -[CPLEngineStorage engineStore](self, "engineStore");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "engineLibrary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "scheduler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = [CPLEngineResourceDownloadTask alloc];
  v26 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __163__CPLEngineResourceDownloadQueue__realDownloadTaskForLocalResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke;
  v45[3] = &unk_1E60D9108;
  v45[4] = self;
  v46 = v16;
  v42[0] = v26;
  v42[1] = 3221225472;
  v42[2] = __163__CPLEngineResourceDownloadQueue__realDownloadTaskForLocalResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_137;
  v42[3] = &unk_1E60D9130;
  v42[4] = self;
  v43 = v46;
  v44 = v20;
  v38 = v44;
  v39[0] = v26;
  v39[1] = 3221225472;
  v39[2] = __163__CPLEngineResourceDownloadQueue__realDownloadTaskForLocalResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_139;
  v39[3] = &unk_1E60D9158;
  v40 = v24;
  v41 = v18;
  v36[0] = v26;
  v36[1] = 3221225472;
  v36[2] = __163__CPLEngineResourceDownloadQueue__realDownloadTaskForLocalResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_2_140;
  v36[3] = &unk_1E60D9180;
  v36[4] = self;
  v37 = v43;
  v27 = v44;
  v28 = v43;
  v29 = v18;
  v30 = v24;
  v31 = -[CPLEngineResourceDownloadTask initWithResource:taskIdentifier:target:launchHandler:cancelHandler:didStartHandler:progressHandler:completionHandler:](v25, "initWithResource:taskIdentifier:target:launchHandler:cancelHandler:didStartHandler:progressHandler:completionHandler:", v28, v35, v17, v45, v42, v39, v19, v36);
  -[CPLEngineResourceDownloadTask associateCloudResource:ofRecord:](v31, "associateCloudResource:ofRecord:", v34, v33);

  return v31;
}

- (BOOL)_shouldTryLowPriorityDownloadWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  id v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  id v17;

  -[CPLEngineStorage engineStore](self, "engineStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "engineLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isClientInForeground") & 1) == 0)
  {
    if (a3)
    {
      +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 10, CFSTR("Client is in background. Will download resource in background"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v9 = 0;
      goto LABEL_7;
    }
    v9 = 0;
LABEL_13:
    v11 = 0;
    goto LABEL_24;
  }
  v17 = 0;
  v8 = objc_msgSend(v7, "isSynchronizationDisabledWithReasonError:", &v17);
  v9 = v17;
  if (!v8)
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "engineLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "systemMonitor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "isOnCellularOrUnknown")
      && objc_msgSend(v14, "isDataBudgetOverriden"))
    {
      if (a3)
      {
        v15 = CFSTR("On cellular with Data override. Will download resource in background");
LABEL_20:
        +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 10, v15);
        v11 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

        goto LABEL_24;
      }
    }
    else if (objc_msgSend(v14, "isNetworkConstrained"))
    {
      if (a3)
      {
        v15 = CFSTR("On constrained network. Will download resource in background");
        goto LABEL_20;
      }
    }
    else
    {
      if (!objc_msgSend(v14, "diskPressureState"))
      {
        v11 = 1;
        goto LABEL_23;
      }
      if (a3)
      {
        v15 = CFSTR("Low disk space. Will download resource in background");
        goto LABEL_20;
      }
    }
    v11 = 0;
    goto LABEL_23;
  }
  if (!a3)
    goto LABEL_13;
  +[CPLErrors cplErrorWithCode:underlyingError:description:](CPLErrors, "cplErrorWithCode:underlyingError:description:", 10, v9, CFSTR("Synchronization is disabled. Will download resource in background"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v11 = 0;
  *a3 = v10;
LABEL_24:

  return v11;
}

- (unint64_t)_transportTaskCount
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_downloadLock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_allQueues;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "countOfTransportTasks", (_QWORD)v10);
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_bestQueueWithCancellableTransportTasks
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = self->_bestCancellableLowPriorityQueues;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
      if (objc_msgSend(v8, "countOfTransportTasks"))
        goto LABEL_18;
      if (v5 == ++v7)
      {
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_bestCancellableHighPriorityQueues;
  v9 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
LABEL_11:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v10)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
      if (objc_msgSend(v8, "countOfTransportTasks", (_QWORD)v13))
        break;
      if (v9 == (id)++v11)
      {
        v9 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
        if (v9)
          goto LABEL_11;
        goto LABEL_19;
      }
    }
LABEL_18:
    v9 = v8;
  }
LABEL_19:

  return v9;
}

- (BOOL)_canScheduleBackgroundDownloads
{
  BOOL v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[CPLEngineResourceDownloadQueue _transportTaskCount](self, "_transportTaskCount"))
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_allQueues;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "countOfTransferTasks", (_QWORD)v10))
        {
          v3 = 0;
          goto LABEL_13;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
  v3 = 1;
LABEL_13:

  return v3;
}

- (BOOL)_launchTransportTaskForQueue:(id)a3
{
  id v4;
  int v5;
  BOOL v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void (**v38)(_QWORD, _QWORD, _QWORD);
  BOOL v39;
  void (**v41)(_QWORD, _QWORD);
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[5];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint8_t v60[128];
  uint8_t buf[24];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "countOfTransferTasks"))
  {
    v5 = objc_msgSend(v4, "isHighPriority");
    if ((v5 & 1) == 0)
    {
      v57 = 0;
      v6 = -[CPLEngineResourceDownloadQueue _shouldTryLowPriorityDownloadWithError:](self, "_shouldTryLowPriorityDownloadWithError:", &v57);
      v7 = v57;
      v8 = v7;
      if (!v6)
      {
        if (!_CPLSilentLogging)
        {
          __CPLStorageOSLogDomain_6732();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            v31 = objc_msgSend(v4, "countOfTransferTasks");
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v31;
            _os_log_impl(&dword_1B03C2000, v30, OS_LOG_TYPE_DEFAULT, "Enqueuing %lu background downloads", buf, 0xCu);
          }

        }
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        objc_msgSend(v4, "allTransferTasks");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v54;
          do
          {
            for (i = 0; i != v34; ++i)
            {
              if (*(_QWORD *)v54 != v35)
                objc_enumerationMutation(v32);
              v37 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
              objc_msgSend(v37, "completionHandler");
              v38 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, void *, void *))v38)[2](v38, v37, v8);

            }
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
          }
          while (v34);
        }

        objc_msgSend(v4, "removeAllTransferTasks");
        -[CPLEngineResourceDownloadQueue _scheduleBackgroundDownloadsIfNecessary](self, "_scheduleBackgroundDownloadsIfNecessary");

        goto LABEL_42;
      }

    }
    v9 = objc_msgSend(v4, "maximumConcurrentTransportTasks");
    if (objc_msgSend(v4, "countOfTransportTasks") < v9)
    {
      if (-[CPLEngineResourceDownloadQueue _transportTaskCount](self, "_transportTaskCount") >= 8)
      {
        if (!v5)
          goto LABEL_42;
        -[CPLEngineResourceDownloadQueue _bestQueueWithCancellableTransportTasks](self, "_bestQueueWithCancellableTransportTasks");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
          goto LABEL_42;
        v11 = v10;
        objc_msgSend(v10, "dequeueLastTransportTask");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        objc_msgSend(v12, "downloadTasks");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v50;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v50 != v16)
                objc_enumerationMutation(v13);
              objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "setCancelledByEngine:", 1);
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
          }
          while (v15);
        }

        objc_msgSend(v12, "cancel");
      }
      *(_QWORD *)buf = 0;
      objc_msgSend(v4, "dequeueBatchOfTransferTasksDequeuedSize:", buf);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "count"))
      {
        -[CPLEngineStorage engineStore](self, "engineStore");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "engineLibrary");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "transport");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __63__CPLEngineResourceDownloadQueue__launchTransportTaskForQueue___block_invoke;
        v47[3] = &unk_1E60D91A8;
        v47[4] = self;
        v22 = v4;
        v48 = v22;
        objc_msgSend(v21, "resourcesDownloadTaskWithCompletionHandler:", v47);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v24 = v18;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v58, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v44;
          do
          {
            for (k = 0; k != v26; ++k)
            {
              if (*(_QWORD *)v44 != v27)
                objc_enumerationMutation(v24);
              objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * k), "setTransportTask:", v23, (_QWORD)v43);
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v58, 16);
          }
          while (v26);
        }

        objc_msgSend(v23, "setDownloadTasks:", v24);
        v29 = objc_msgSend(v22, "type");
        if (v29 != 2)
        {
          if (v29 != 1)
          {
            if (!v29)
              objc_msgSend(v23, "setBackgroundTask:", 1);
            goto LABEL_46;
          }
          objc_msgSend(v23, "setForcedTask:", 1);
        }
        objc_msgSend(v23, "setForeground:", 1, (_QWORD)v43);
LABEL_46:
        objc_msgSend(v22, "groupConstructor", (_QWORD)v43);
        v41 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v41)[2](v41, v21);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v42, "setRoughCPLRecordCount:", objc_msgSend(v24, "count"));
        objc_msgSend(v42, "setRoughCPLDownloadEstimatedSize:", *(_QWORD *)buf);
        objc_msgSend(v23, "setTransportGroup:", v42);
        objc_msgSend(v22, "addTransportTask:", v23);
        objc_msgSend(v23, "runWithNoSyncSession");

        v39 = 1;
        goto LABEL_43;
      }

    }
  }
LABEL_42:
  v39 = 0;
LABEL_43:

  return v39;
}

- (void)_dispatchTransportTasksIfNecessary
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_downloadLock);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = self->_allHighPriorityQueues;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v7);
        while (-[CPLEngineResourceDownloadQueue _launchTransportTaskForQueue:](self, "_launchTransportTaskForQueue:", v8));
        ++v7;
      }
      while (v7 != v5);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = self->_allLowPriorityQueues;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13);
        while (-[CPLEngineResourceDownloadQueue _launchTransportTaskForQueue:](self, "_launchTransportTaskForQueue:", v14, (_QWORD)v15));
        ++v13;
      }
      while (v13 != v11);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v11);
  }

  if (-[CPLEngineResourceDownloadQueue _canScheduleBackgroundDownloads](self, "_canScheduleBackgroundDownloads"))
    -[CPLEngineResourceDownloadQueue _scheduleBackgroundDownloadsIfNecessary](self, "_scheduleBackgroundDownloadsIfNecessary");
}

- (id)_activeQueueForTransferTask:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "resource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "resourceType");

  objc_msgSend(v4, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isHighPriority");

  if (v8)
    v9 = 88;
  else
    v9 = 96;
  v10 = *(uint64_t *)((char *)&self->super.super.isa + v9);
  objc_msgSend(v4, "options");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, uint64_t, void *))(v10 + 16))(v10, v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)createGroupForBackgroundDownloadsOfResourceType:(unint64_t)a3 transferIntent:(unint64_t)a4 transport:(id)a5
{
  id v7;
  CPLResourceTransferTaskOptions *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;

  v7 = a5;
  v8 = -[CPLResourceTransferTaskOptions initWithIntent:priority:]([CPLResourceTransferTaskOptions alloc], "initWithIntent:priority:", a4, 2);
  (*((void (**)(void))self->_lowPriorityQueuePerResourceTypeAndTransferIntent + 2))();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "groupConstructor");
  v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v10)[2](v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_enqueueTransferTaskInActiveQueue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  OS_dispatch_queue *downloadLock;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  dispatch_block_t v12;
  void *v13;
  dispatch_time_t v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD block[4];
  id v21;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_downloadLock);
  if (objc_msgSend(v4, "willGenerateReport"))
  {
    -[CPLEngineResourceDownloadQueue _queuesStatus](self, "_queuesStatus");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "noteActiveQueuesStatusAtEnqueingTime:", v5);

  }
  -[CPLEngineResourceDownloadQueue _activeQueueForTransferTask:](self, "_activeQueueForTransferTask:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTransferTask:", v4);
  v7 = objc_msgSend(v6, "coalescingInterval");
  if (v7 < 1)
  {
    -[CPLEngineResourceDownloadQueue _launchTransportTaskForQueue:](self, "_launchTransportTaskForQueue:", v6);
  }
  else
  {
    if (__CPLEngineResourceDownloadQueueRequestBackgroundDownloadQueueImmediately)
    {
      downloadLock = self->_downloadLock;
      v9 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __68__CPLEngineResourceDownloadQueue__enqueueTransferTaskInActiveQueue___block_invoke;
      v18[3] = &unk_1E60D6F88;
      v18[4] = self;
      v19 = v6;
      v10 = v18;
      block[0] = v9;
      block[1] = 3221225472;
      block[2] = __cpl_dispatch_async_block_invoke_6746;
      block[3] = &unk_1E60D71F8;
      v21 = v10;
      v11 = downloadLock;
      v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      dispatch_async(v11, v12);

      v13 = v19;
    }
    else
    {
      v14 = dispatch_time(0, v7);
      v15 = self->_downloadLock;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __68__CPLEngineResourceDownloadQueue__enqueueTransferTaskInActiveQueue___block_invoke_2;
      v16[3] = &unk_1E60D6F88;
      v16[4] = self;
      v17 = v6;
      dispatch_after(v14, v15, v16);
      v13 = v17;
    }

  }
}

- (void)_dequeueTransferTaskInActiveQueue:(id)a3
{
  NSObject *downloadLock;
  id v5;
  id v6;

  downloadLock = self->_downloadLock;
  v5 = a3;
  dispatch_assert_queue_V2(downloadLock);
  -[CPLEngineResourceDownloadQueue _activeQueueForTransferTask:](self, "_activeQueueForTransferTask:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeTransferTask:", v5);

  -[CPLEngineResourceDownloadQueue _scheduleBackgroundDownloadsIfNecessary](self, "_scheduleBackgroundDownloadsIfNecessary");
}

- (void)_scheduleBackgroundDownloadsIfNecessary
{
  uint64_t v3;
  void *v4;
  NSObject *v6;
  dispatch_time_t v7;
  uint8_t v8[8];
  _QWORD v9[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_downloadLock);
  if (self->_shouldRequestABackgroundDownloadSyncPhase)
  {
    if (-[CPLEngineResourceDownloadQueue _canScheduleBackgroundDownloads](self, "_canScheduleBackgroundDownloads"))
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __73__CPLEngineResourceDownloadQueue__scheduleBackgroundDownloadsIfNecessary__block_invoke;
      v9[3] = &unk_1E60D65B8;
      v9[4] = self;
      v3 = MEMORY[0x1B5E08DC4](v9);
      v4 = (void *)v3;
      if (__CPLEngineResourceDownloadQueueRequestBackgroundDownloadQueueImmediately)
      {
        (*(void (**)(uint64_t))(v3 + 16))(v3);
      }
      else
      {
        v7 = dispatch_time(0, 2000000000);
        dispatch_after(v7, (dispatch_queue_t)self->_downloadLock, v4);
      }

    }
    else if (self->_shouldRequestABackgroundDownloadSyncPhase && _CPLSilentLogging == 0)
    {
      __CPLStorageOSLogDomain_6732();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEFAULT, "Engine needs to download resources in background but there still are active download tasks", v8, 2u);
      }

    }
  }
}

- (void)_requestBackgroundDownloads
{
  OS_dispatch_queue *downloadLock;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  downloadLock = self->_downloadLock;
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__CPLEngineResourceDownloadQueue__requestBackgroundDownloads__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6746;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = downloadLock;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (void)_unscheduleBackgroundDownloads
{
  OS_dispatch_queue *downloadLock;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_block_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  downloadLock = self->_downloadLock;
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__CPLEngineResourceDownloadQueue__unscheduleBackgroundDownloads__block_invoke;
  v7[3] = &unk_1E60D65B8;
  v7[4] = self;
  v4 = v7;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6746;
  block[3] = &unk_1E60D71F8;
  v9 = v4;
  v5 = downloadLock;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);

}

- (BOOL)enqueueBackgroundDownloadTaskForResource:(id)a3 intent:(unint64_t)a4 downloading:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  NSObject *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v7 = a5;
  v22 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_6732();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v10;
      _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEBUG, "Enqueuing background download task: %@", buf, 0xCu);
    }

  }
  -[CPLEngineStorage platformObject](self, "platformObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v13 = objc_msgSend(v12, "enqueueBackgroundDownloadTaskForResource:intent:downloading:error:", v10, a4, v7, &v17);
  v14 = v17;

  if ((v13 & 1) != 0)
  {
    if (!v7)
      -[CPLEngineResourceDownloadQueue _requestBackgroundDownloads](self, "_requestBackgroundDownloads");
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_6732();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v19 = v10;
        v20 = 2112;
        v21 = v14;
        _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_ERROR, "Unable to enqueue background task for %@: %@", buf, 0x16u);
      }

    }
    if (a6)
      *a6 = objc_retainAutorelease(v14);
  }

  return v13;
}

- (BOOL)reenqueueBackgroundDownloadTaskForResource:(id)a3 bumpRetryCount:(BOOL)a4 didDiscard:(BOOL *)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v8 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v12 = objc_msgSend(v11, "reenqueueBackgroundDownloadTaskForResource:taskIdentifier:bumpRetryCount:didDiscard:error:", v10, objc_msgSend(v10, "_backgroundDownloadTaskIdentifier"), v8, a5, &v16);
  v13 = v16;

  if ((v12 & 1) != 0)
  {
    if (!*a5)
      -[CPLEngineResourceDownloadQueue _requestBackgroundDownloads](self, "_requestBackgroundDownloads");
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_6732();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v18 = v10;
        v19 = 2112;
        v20 = v13;
        _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_ERROR, "Unable to reenqueue background task for %@: %@", buf, 0x16u);
      }

    }
    if (a6)
      *a6 = objc_retainAutorelease(v13);
  }

  return v12;
}

- (BOOL)removeBackgroundDownloadTaskForResource:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v8 = objc_msgSend(v7, "removeBackgroundDownloadTaskForResource:taskIdentifier:error:", v6, objc_msgSend(v6, "_backgroundDownloadTaskIdentifier"), &v12);
  v9 = v12;

  if ((v8 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_6732();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v14 = v6;
        v15 = 2112;
        v16 = v9;
        _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Unable to remove background task for %@: %@", buf, 0x16u);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v9);
  }

  return v8;
}

- (BOOL)markBackgroundDownloadTaskForResourceAsSuceeded:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v8 = objc_msgSend(v7, "markBackgroundDownloadTaskForResourceAsSuceeded:taskIdentifier:error:", v6, objc_msgSend(v6, "_backgroundDownloadTaskIdentifier"), &v12);
  v9 = v12;

  if ((v8 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_6732();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v14 = v6;
        v15 = 2112;
        v16 = v9;
        _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Unable to mark background task for %@ as succeeded: %@", buf, 0x16u);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v9);
  }

  return v8;
}

- (id)dequeueNextBackgroundDownloadTasksForResourceType:(unint64_t)a3 andIntent:(unint64_t)a4 maximumSize:(unint64_t)a5 maximumCount:(unint64_t)a6 error:(id *)a7
{
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[CPLEngineStorage platformObject](self, "platformObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v12, "dequeueNextBackgroundDownloadTasksForResourceType:andIntent:maximumSize:maximumCount:error:", a3, a4, a5, a6, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v17;

  if (!v13)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_6732();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v14;
        _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_ERROR, "Unable to dequeue next background tasks: %@", buf, 0xCu);
      }

    }
    if (a7)
      *a7 = objc_retainAutorelease(v14);
  }

  return v13;
}

- (BOOL)resetDequeuedBackgroundDownloadTasksWithError:(id *)a3
{
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[CPLEngineStorage platformObject](self, "platformObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = objc_msgSend(v4, "resetDequeuedBackgroundDownloadTasksWithError:", &v9);
  v6 = v9;

  if ((v5 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_6732();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v6;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "Unable to reset dequeued background tasks: %@", buf, 0xCu);
      }

    }
    if (a3)
      *a3 = objc_retainAutorelease(v6);
  }

  return v5;
}

- (BOOL)removeAllBackgroundDownloadTasksForItemWithScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v8 = objc_msgSend(v7, "removeAllBackgroundDownloadTasksForItemWithScopedIdentifier:error:", v6, &v12);
  v9 = v12;

  if ((v8 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_6732();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v14 = v6;
        v15 = 2112;
        v16 = v9;
        _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Unable to remove all background tasks for %@: %@", buf, 0x16u);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v9);
  }

  return v8;
}

- (id)enumeratorForDownloadedResources
{
  void *v2;
  void *v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumeratorForDownloadedResources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)countOfQueuedDownloadTasks
{
  void *v2;
  unint64_t v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countOfQueuedDownloadTasks");

  return v3;
}

- (BOOL)hasActiveOrQueuedBackgroundDownloadOperations
{
  void *v2;
  char v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasActiveOrQueuedBackgroundDownloadOperations");

  return v3;
}

- (id)_queuesStatus
{
  NSArray *v2;
  void *v3;
  NSArray *v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_allQueues;
  v3 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = 0;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "status", (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          if (!v4)
            v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          -[NSArray addObject:](v4, "addObject:", v7);
        }

      }
      v3 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v3);

    if (!v4)
    {
      v3 = 0;
      return v3;
    }
    -[NSArray componentsJoinedByString:](v4, "componentsJoinedByString:", CFSTR("\n"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v4;
  }

  return v3;
}

- (id)status
{
  void *v3;
  void *v4;
  NSObject *downloadLock;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CPLEngineResourceDownloadQueue;
  -[CPLEngineStorage status](&v12, sel_status);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  downloadLock = self->_downloadLock;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__CPLEngineResourceDownloadQueue_status__block_invoke;
  v10[3] = &unk_1E60D6F88;
  v10[4] = self;
  v6 = v4;
  v11 = v6;
  dispatch_sync(downloadLock, v10);
  v7 = v11;
  v8 = v6;

  return v8;
}

- (void)barrier
{
  dispatch_sync((dispatch_queue_t)self->_downloadLock, &__block_literal_global_168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTransferTaskBurstDate, 0);
  objc_storeStrong(&self->_lowPriorityQueuePerResourceTypeAndTransferIntent, 0);
  objc_storeStrong(&self->_highPriorityQueuePerResourceTypeAndTransferIntent, 0);
  objc_storeStrong((id *)&self->_bestCancellableLowPriorityQueues, 0);
  objc_storeStrong((id *)&self->_bestCancellableHighPriorityQueues, 0);
  objc_storeStrong((id *)&self->_allLowPriorityQueues, 0);
  objc_storeStrong((id *)&self->_allHighPriorityQueues, 0);
  objc_storeStrong((id *)&self->_allQueues, 0);
  objc_storeStrong((id *)&self->_downloadLock, 0);
}

void __40__CPLEngineResourceDownloadQueue_status__block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_queuesStatus");
  v2 = objc_claimAutoreleasedReturnValue();
  v9 = (id)v2;
  if (v2)
    objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("\n%@"), v2);
  v3 = *(_QWORD **)(a1 + 32);
  if (v3[13])
  {
    objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("\nInflight transfer tasks: %lu"), v3[13]);
    v3 = *(_QWORD **)(a1 + 32);
  }
  if (v3[14])
  {
    objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("\nLast requests: %lu resources just now"), v3[14]);
  }
  else
  {
    v4 = v3[15];
    if (v4)
    {
      v5 = *(void **)(a1 + 40);
      v6 = v3[16];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("\nLast requests: %lu resources, %@"), v4, v8);

    }
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 136))
    objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR("\nSome resources need to be downloaded in background"));

}

uint64_t __64__CPLEngineResourceDownloadQueue__unscheduleBackgroundDownloads__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 136) = 0;
  return result;
}

uint64_t __61__CPLEngineResourceDownloadQueue__requestBackgroundDownloads__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 136))
  {
    v2 = result;
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_6732();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEFAULT, "Will need to download some resources in background", v4, 2u);
      }

      v1 = *(_QWORD *)(v2 + 32);
    }
    *(_BYTE *)(v1 + 136) = 1;
    return objc_msgSend(*(id *)(v2 + 32), "_scheduleBackgroundDownloadsIfNecessary");
  }
  return result;
}

void __73__CPLEngineResourceDownloadQueue__scheduleBackgroundDownloadsIfNecessary__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[136])
  {
    if (objc_msgSend(v2, "_canScheduleBackgroundDownloads"))
    {
      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_6732();
        v3 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B03C2000, v3, OS_LOG_TYPE_DEBUG, "We have some background downloads in the queue. Telling the scheduler.", buf, 2u);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "engineStore");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "engineLibrary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "scheduler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "noteResourceDownloadQueueIsFull");

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 136) = 0;
    }
    else
    {
      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 136))
        v7 = _CPLSilentLogging == 0;
      else
        v7 = 0;
      if (v7)
      {
        __CPLStorageOSLogDomain_6732();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEFAULT, "Engine needs to download resources in background but there still are active download tasks", v9, 2u);
        }

      }
    }
  }
}

uint64_t __68__CPLEngineResourceDownloadQueue__enqueueTransferTaskInActiveQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_launchTransportTaskForQueue:", *(_QWORD *)(a1 + 40));
}

uint64_t __68__CPLEngineResourceDownloadQueue__enqueueTransferTaskInActiveQueue___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_launchTransportTaskForQueue:", *(_QWORD *)(a1 + 40));
}

void __63__CPLEngineResourceDownloadQueue__launchTransportTaskForQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  dispatch_block_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  _QWORD block[4];
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v11[2] = __63__CPLEngineResourceDownloadQueue__launchTransportTaskForQueue___block_invoke_2;
  v11[3] = &unk_1E60D6EC0;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v12 = v4;
  v13 = v3;
  v14 = *(_QWORD *)(a1 + 32);
  v7 = v11;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6746;
  block[3] = &unk_1E60D71F8;
  v16 = v7;
  v8 = v5;
  v9 = v3;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);

}

uint64_t __63__CPLEngineResourceDownloadQueue__launchTransportTaskForQueue___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeTransportTask:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "_dispatchTransportTasksIfNecessary");
}

void __163__CPLEngineResourceDownloadQueue__realDownloadTaskForLocalResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  dispatch_block_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  _QWORD block[4];
  id v19;

  v3 = a2;
  objc_msgSend(v3, "isHighPriority");
  objc_msgSend(v3, "resource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceType");
  objc_msgSend(v3, "hash");
  kdebug_trace();

  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v14[2] = __163__CPLEngineResourceDownloadQueue__realDownloadTaskForLocalResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_2;
  v14[3] = &unk_1E60D6EC0;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v15 = v3;
  v8 = v5;
  v9 = *(_QWORD *)(a1 + 32);
  v16 = v8;
  v17 = v9;
  v10 = v14;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6746;
  block[3] = &unk_1E60D71F8;
  v19 = v10;
  v11 = v6;
  v12 = v3;
  v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v13);

}

void __163__CPLEngineResourceDownloadQueue__realDownloadTaskForLocalResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_137(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  NSObject *v10;
  id v11;
  dispatch_block_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD block[4];
  id v19;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v13[2] = __163__CPLEngineResourceDownloadQueue__realDownloadTaskForLocalResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_2_138;
  v13[3] = &unk_1E60D6CD0;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v14 = v3;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v15 = v7;
  v16 = v8;
  v17 = *(id *)(a1 + 48);
  v9 = v13;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6746;
  block[3] = &unk_1E60D71F8;
  v19 = v9;
  v10 = v5;
  v11 = v3;
  v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v12);

}

void __163__CPLEngineResourceDownloadQueue__realDownloadTaskForLocalResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_139(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "isHighPriority");
  objc_msgSend(v6, "resource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resourceType");
  objc_msgSend(v6, "hash");
  kdebug_trace();

  objc_msgSend(v6, "isHighPriority");
  objc_msgSend(v6, "resource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceType");
  objc_msgSend(v6, "hash");
  kdebug_trace();

  objc_msgSend(*(id *)(a1 + 32), "willRunEngineElement:", CPLEngineElementDownloadResource);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

}

void __163__CPLEngineResourceDownloadQueue__realDownloadTaskForLocalResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_2_140(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v15[2] = __163__CPLEngineResourceDownloadQueue__realDownloadTaskForLocalResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_3;
  v15[3] = &unk_1E60D6CD0;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v16 = v5;
  v17 = v7;
  v18 = v6;
  v19 = *(id *)(a1 + 48);
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6746;
  block[3] = &unk_1E60D71F8;
  v21 = v10;
  v11 = v8;
  v12 = v6;
  v13 = v5;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

uint64_t __163__CPLEngineResourceDownloadQueue__realDownloadTaskForLocalResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_6732();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(_QWORD *)(a1 + 48);
      v8 = 138412802;
      v9 = v3;
      v10 = 2112;
      v11 = v4;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ for %@ did finish with error %@", (uint8_t *)&v8, 0x20u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "isHighPriority");
  objc_msgSend(*(id *)(a1 + 32), "resource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resourceType");
  objc_msgSend(*(id *)(a1 + 32), "hash");
  kdebug_trace();

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __163__CPLEngineResourceDownloadQueue__realDownloadTaskForLocalResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_2_138(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_6732();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      v11 = 138412546;
      v12 = v3;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "Cancelling %@ for %@", (uint8_t *)&v11, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "transportTask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "cancelDownloadTask:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "_dequeueTransferTaskInActiveQueue:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "isHighPriority");
    objc_msgSend(*(id *)(a1 + 32), "resource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resourceType");
    objc_msgSend(*(id *)(a1 + 32), "hash");
    kdebug_trace();

    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 32);
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, v9, v10);

  }
}

uint64_t __163__CPLEngineResourceDownloadQueue__realDownloadTaskForLocalResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_6732();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      v6 = 138412546;
      v7 = v3;
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "Enqueuing %@ for %@", (uint8_t *)&v6, 0x16u);
    }

  }
  return objc_msgSend(*(id *)(a1 + 48), "_enqueueTransferTaskInActiveQueue:", *(_QWORD *)(a1 + 32));
}

void __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD v31[3];
  char v32;

  v3 = a2;
  objc_msgSend(v3, "isHighPriority");
  objc_msgSend(v3, "resource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceType");
  objc_msgSend(v3, "hash");
  kdebug_trace();

  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v32 = 1;
  v5 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_2;
  v23[3] = &unk_1E60D9040;
  v6 = *(void **)(a1 + 32);
  v24 = *(id *)(a1 + 40);
  v25 = v3;
  v29 = v31;
  v26 = *(id *)(a1 + 48);
  v27 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 96);
  v28 = v7;
  v30 = v8;
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_129;
  v15[3] = &unk_1E60D9068;
  v16 = *(id *)(a1 + 72);
  v9 = *(id *)(a1 + 48);
  v21 = v31;
  v10 = *(_QWORD *)(a1 + 80);
  v17 = v9;
  v18 = v10;
  v11 = v25;
  v19 = v11;
  v12 = *(id *)(a1 + 88);
  v13 = *(_QWORD *)(a1 + 104);
  v20 = v12;
  v22 = v13;
  v14 = (id)objc_msgSend(v6, "performWriteTransactionWithBlock:completionHandler:", v23, v15);

  _Block_object_dispose(v31, 8);
}

void __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_133(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  NSObject *v10;
  id v11;
  dispatch_block_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD block[4];
  id v20;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_2_134;
  v13[3] = &unk_1E60DBAD8;
  v18 = *(_QWORD *)(a1 + 56);
  v14 = v3;
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 32);
  v15 = v7;
  v16 = v8;
  v17 = *(id *)(a1 + 48);
  v9 = v13;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6746;
  block[3] = &unk_1E60D71F8;
  v20 = v9;
  v10 = v5;
  v11 = v3;
  v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v12);

}

void __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_135(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "isHighPriority");
  objc_msgSend(v6, "resource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resourceType");
  objc_msgSend(v6, "hash");
  kdebug_trace();

  objc_msgSend(v6, "isHighPriority");
  objc_msgSend(v6, "resource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceType");
  objc_msgSend(v6, "hash");
  kdebug_trace();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

}

void __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_2_136(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  _QWORD block[4];
  id v22;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_3;
  v15[3] = &unk_1E60DBAD8;
  v20 = *(_QWORD *)(a1 + 56);
  v16 = v5;
  v17 = v7;
  v18 = v6;
  v19 = *(id *)(a1 + 48);
  v10 = v15;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_6746;
  block[3] = &unk_1E60D71F8;
  v22 = v10;
  v11 = v8;
  v12 = v6;
  v13 = v5;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);

}

uint64_t __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_3(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 24))
  {
    v1 = result;
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_6732();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        v3 = *(_QWORD *)(v1 + 32);
        v4 = *(_QWORD *)(v1 + 40);
        v5 = *(_QWORD *)(v1 + 48);
        v7 = 138412802;
        v8 = v3;
        v9 = 2112;
        v10 = v4;
        v11 = 2112;
        v12 = v5;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ for %@ did finish with error %@", (uint8_t *)&v7, 0x20u);
      }

    }
    objc_msgSend(*(id *)(v1 + 32), "isHighPriority");
    objc_msgSend(*(id *)(v1 + 32), "resource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resourceType");
    objc_msgSend(*(id *)(v1 + 32), "hash");
    kdebug_trace();

    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 56) + 16))();
  }
  return result;
}

void __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_2_134(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_6732();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        v3 = *(_QWORD *)(a1 + 32);
        v4 = *(_QWORD *)(a1 + 40);
        v11 = 138412546;
        v12 = v3;
        v13 = 2112;
        v14 = v4;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "Cancelling %@ for %@", (uint8_t *)&v11, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "transportTask");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "cancelDownloadTask:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "_dequeueTransferTaskInActiveQueue:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "isHighPriority");
      objc_msgSend(*(id *)(a1 + 32), "resource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "resourceType");
      objc_msgSend(*(id *)(a1 + 32), "hash");
      kdebug_trace();

      v8 = *(_QWORD *)(a1 + 56);
      v9 = *(_QWORD *)(a1 + 32);
      +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, v9, v10);

    }
  }
}

void __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id obj;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_6732();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v22 = v5;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Linking %@ from resource storage", buf, 0xCu);
    }

  }
  if (objc_msgSend(*(id *)(a1 + 40), "isCancelled"))
  {
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setError:", v6);

  }
  objc_msgSend(v3, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
  }
  else
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_126;
    v17[3] = &unk_1E60DD160;
    v18 = *(id *)(a1 + 48);
    v19 = *(id *)(a1 + 32);
    v20 = *(id *)(a1 + 56);
    objc_msgSend(v3, "do:", v17);

  }
  v9 = *(_QWORD *)(a1 + 56);
  v8 = *(void **)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  obj = *(id *)(v11 + 40);
  v12 = objc_msgSend(v8, "releaseFileURL:forResource:error:", v9, v10, &obj);
  objc_storeStrong((id *)(v11 + 40), obj);
  if ((v12 & 1) == 0 && !_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_6732();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 56), "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v22 = v14;
      v23 = 2112;
      v24 = v15;
      _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_DEBUG, "Failed to release cached URL %@: %@", buf, 0x16u);

    }
  }

}

void __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_129(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  NSObject *v17;
  dispatch_block_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  _BYTE buf[24];
  void *v35;
  id v36[4];

  v36[3] = *(id *)MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_6732();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "path");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "error");
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
          v10 = " - will fallback on transport";
        else
          v10 = "";
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v7;
        *(_WORD *)&buf[22] = 2112;
        v35 = (void *)v8;
        LOWORD(v36[0]) = 2080;
        *(id *)((char *)v36 + 2) = (id)v10;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEFAULT, "Failed to link cached resource %@ to %@. Error: %@%s", buf, 0x2Au);

      }
    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      v11 = *(void **)(a1 + 56);
      v12 = *(void **)(*(_QWORD *)(a1 + 48) + 40);
      v13 = MEMORY[0x1E0C809B0];
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_132;
      v28[3] = &unk_1E60DBAD8;
      v29 = v11;
      v30 = *(id *)(a1 + 32);
      v14 = *(id *)(a1 + 64);
      v15 = *(_QWORD *)(a1 + 80);
      v32 = v14;
      v33 = v15;
      v31 = *(_QWORD *)(a1 + 48);
      v16 = v28;
      *(_QWORD *)buf = v13;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __cpl_dispatch_async_block_invoke_6746;
      v35 = &unk_1E60D71F8;
      v36[0] = v16;
      v17 = v12;
      v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
      dispatch_async(v17, v18);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "isHighPriority");
      objc_msgSend(*(id *)(a1 + 56), "resource");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "resourceType");
      objc_msgSend(*(id *)(a1 + 56), "hash");
      kdebug_trace();

      v26 = a1 + 56;
      v24 = *(_QWORD *)(a1 + 56);
      v25 = *(_QWORD *)(v26 + 8);
      objc_msgSend(v3, "error");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v25 + 16))(v25, v24, v27);

    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_6732();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v20 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "path");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v21;
        _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_DEBUG, "Linked cached resource %@ to %@", buf, 0x16u);

      }
    }
    objc_msgSend(*(id *)(a1 + 56), "isHighPriority");
    objc_msgSend(*(id *)(a1 + 56), "resource");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "resourceType");
    objc_msgSend(*(id *)(a1 + 56), "hash");
    kdebug_trace();

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_132(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_6732();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        v3 = *(_QWORD *)(a1 + 32);
        v4 = *(_QWORD *)(a1 + 40);
        v11 = 138412546;
        v12 = v3;
        v13 = 2112;
        v14 = v4;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@ for %@ was cancelled before it had a chance to be enqueued", (uint8_t *)&v11, 0x16u);
      }

    }
    v5 = *(_QWORD *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 32);
    +[CPLErrors operationCancelledError](CPLErrors, "operationCancelledError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, v6, v7);

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_6732();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v10 = *(_QWORD *)(a1 + 40);
        v11 = 138412546;
        v12 = v9;
        v13 = 2112;
        v14 = v10;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEBUG, "Enqueuing %@ for %@", (uint8_t *)&v11, 0x16u);
      }

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 48), "_enqueueTransferTaskInActiveQueue:", *(_QWORD *)(a1 + 32));
  }
}

uint64_t __165__CPLEngineResourceDownloadQueue__resourceStorageCopyTaskForResource_taskIdentifier_cloudResource_ofRecord_target_didStartHandler_progressHandler_completionHandler___block_invoke_126(void **a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v17;
  _BYTE buf[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "cplFileExistsAtURL:", a1[4]))
  {
    objc_msgSend(a1[5], "identity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fingerPrint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      +[CPLFingerprintScheme fingerprintSchemeForFingerprint:](CPLFingerprintScheme, "fingerprintSchemeForFingerprint:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = a1[4];
      v17 = 0;
      objc_msgSend(v7, "fingerPrintForFileAtURL:error:", v8, &v17);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v17;

      if (v9)
      {
        if ((objc_msgSend(v9, "isEqual:", v6) & 1) != 0)
        {
          if (!_CPLSilentLogging)
          {
            __CPLStorageOSLogDomain_6732();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              v12 = a1[5];
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v12;
              _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_DEFAULT, "Asked to download cloud resource %@ while file is already present on disk", buf, 0xCu);
            }

          }
          goto LABEL_20;
        }

      }
    }
    else
    {
      v10 = 0;
    }
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_6732();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = a1[5];
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v14;
        _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_DEFAULT, "Asked to overwrite already present cloud resource %@", buf, 0xCu);
      }

    }
  }
  if (!objc_msgSend(v4, "cplCopyItemAtURL:toURL:error:", a1[6], a1[4], a2))
  {
    v15 = 0;
    goto LABEL_22;
  }
  *(_QWORD *)buf = 0;
  if (CPLGetDynamicVersionForDownloadResource(a1[6], buf, 0))
    CPLMarkDownloadedResourceWithDynamicVersion(a1[4], *(uint64_t *)buf, 0);
LABEL_20:
  v15 = 1;
LABEL_22:

  return v15;
}

void __105__CPLEngineResourceDownloadQueue__failedTaskWithCompletionHandler_error_resource_taskIdentifier_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(id, id, _QWORD);

  v3 = a2;
  objc_msgSend(v3, "completionHandler");
  v4 = (void (**)(id, id, _QWORD))objc_claimAutoreleasedReturnValue();
  v4[2](v4, v3, *(_QWORD *)(a1 + 32));

}

uint64_t __105__CPLEngineResourceDownloadQueue__failedTaskWithCompletionHandler_error_resource_taskIdentifier_options___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __160__CPLEngineResourceDownloadQueue__downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = *(_QWORD *)(a1[6] + 8);
  if (*(_BYTE *)(v8 + 24))
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_6732();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412290;
        v15 = v5;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "Completion handler for %@ has been called twice", (uint8_t *)&v14, 0xCu);
      }

    }
  }
  else
  {
    *(_BYTE *)(v8 + 24) = 1;
    if (v6 && (objc_msgSend(v6, "isCPLOperationCancelledError") & 1) == 0 && !_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_6732();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "taskIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = a1[4];
        v14 = 138412802;
        v15 = v11;
        v16 = 2112;
        v17 = v12;
        v18 = 2112;
        v19 = v7;
        _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Failed to download high priority task %@ for cloud resource %@: %@", (uint8_t *)&v14, 0x20u);

      }
    }
    v13 = a1[5];
    if (v13)
      (*(void (**)(uint64_t, id, void *))(v13 + 16))(v13, v5, v7);
  }

}

void __160__CPLEngineResourceDownloadQueue__downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_109(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  __CFString *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  __CFString *v28;
  uint64_t v29;
  id v30;
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  if (*(_BYTE *)(v8 + 24))
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_6732();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v5;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "Completion handler for %@ has been called twice", buf, 0xCu);
      }

    }
  }
  else
  {
    *(_BYTE *)(v8 + 24) = 1;
    if (v6)
    {
      if (!*(_BYTE *)(a1 + 80))
      {
        if (objc_msgSend(v6, "isCPLErrorWithCode:", 10))
        {
          v10 = *(void **)(a1 + 32);
          if (v10)
          {
            v11 = v10;

            v7 = v11;
          }
        }
      }
    }
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_6732();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        if (*(_BYTE *)(a1 + 80))
          v13 = CFSTR("enqueued ");
        else
          v13 = &stru_1E60DF6B8;
        +[CPLResource descriptionForResourceType:](CPLResource, "descriptionForResourceType:", objc_msgSend(*(id *)(a1 + 40), "resourceType"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "itemScopedIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(*(id *)(a1 + 40), "_backgroundDownloadTaskIdentifier");
        *(_DWORD *)buf = 138413314;
        v32 = v13;
        v33 = 2112;
        v34 = v14;
        v35 = 2112;
        v36 = v15;
        v37 = 2048;
        v38 = v16;
        v39 = 2112;
        v40 = v7;
        _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEBUG, "Low priority %@download for %@ %@ (%lu) has finished with error %@", buf, 0x34u);

      }
    }
    if (*(_BYTE *)(a1 + 80))
    {
      v17 = *(void **)(a1 + 48);
      v18 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __160__CPLEngineResourceDownloadQueue__downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_114;
      v26[3] = &unk_1E60DBED0;
      v27 = v7;
      v19 = v5;
      v20 = *(_QWORD *)(a1 + 56);
      v28 = v19;
      v29 = v20;
      v30 = *(id *)(a1 + 40);
      v22[0] = v18;
      v22[1] = 3221225472;
      v22[2] = __160__CPLEngineResourceDownloadQueue__downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_119;
      v22[3] = &unk_1E60DCA60;
      v25 = *(id *)(a1 + 64);
      v23 = v19;
      v7 = v27;
      v24 = v7;
      objc_msgSend(v17, "performBatchedWriteTransactionWithBlock:completionHandler:", v26, v22);

    }
    else
    {
      v21 = *(_QWORD *)(a1 + 64);
      if (v21)
        (*(void (**)(uint64_t, __CFString *, id))(v21 + 16))(v21, v5, v7);
    }
  }

}

void __160__CPLEngineResourceDownloadQueue__downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_114(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[6];

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7 = v3;
  if (v4)
  {
    if ((!objc_msgSend(v4, "isCPLOperationCancelledError")
       || objc_msgSend(*(id *)(a1 + 40), "isCancelledByEngine"))
      && (v5 = (_QWORD *)(a1 + 48),
          objc_msgSend((id)objc_opt_class(), "shouldRetryDownloadOnError:", *(_QWORD *)(a1 + 32))))
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __160__CPLEngineResourceDownloadQueue__downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_2;
      v10[3] = &unk_1E60DDA30;
      v10[4] = *(id *)(a1 + 56);
      v6 = v10;
    }
    else
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __160__CPLEngineResourceDownloadQueue__downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_116;
      v9[3] = &unk_1E60DDA30;
      v9[4] = *(id *)(a1 + 56);
      v5 = (_QWORD *)(a1 + 48);
      v6 = v9;
    }
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __160__CPLEngineResourceDownloadQueue__downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_117;
    v8[3] = &unk_1E60DDA30;
    v8[4] = *(id *)(a1 + 56);
    v5 = (_QWORD *)(a1 + 48);
    v6 = v8;
  }
  v6[5] = *v5;
  objc_msgSend(v7, "do:", v6);

}

void __160__CPLEngineResourceDownloadQueue__downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_119(_QWORD *a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v2 = a1[6];
  if (v2)
  {
    v4 = a1[4];
    objc_msgSend(a2, "error");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (id)v5;
    if (!v5)
      v5 = a1[5];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v2, v4, v5);

  }
}

uint64_t __160__CPLEngineResourceDownloadQueue__downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_6732();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      +[CPLResource descriptionForResourceType:](CPLResource, "descriptionForResourceType:", objc_msgSend(*(id *)(a1 + 32), "resourceType"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "itemScopedIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(*(id *)(a1 + 32), "_backgroundDownloadTaskIdentifier");
      *(_DWORD *)buf = 138412802;
      v11 = v5;
      v12 = 2112;
      v13 = v6;
      v14 = 2048;
      v15 = v7;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Will retry background download for %@ %@ (%lu)", buf, 0x20u);

    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "reenqueueBackgroundDownloadTaskForResource:bumpRetryCount:didDiscard:error:", *(_QWORD *)(a1 + 32), 0, &v9, a2);
}

uint64_t __160__CPLEngineResourceDownloadQueue__downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_116(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_6732();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      +[CPLResource descriptionForResourceType:](CPLResource, "descriptionForResourceType:", objc_msgSend(*(id *)(a1 + 32), "resourceType"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "itemScopedIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(*(id *)(a1 + 32), "_backgroundDownloadTaskIdentifier");
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      v13 = 2048;
      v14 = v7;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Removing background download for %@ %@ (%lu) - no retry", (uint8_t *)&v9, 0x20u);

    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "removeBackgroundDownloadTaskForResource:error:", *(_QWORD *)(a1 + 32), a2);
}

uint64_t __160__CPLEngineResourceDownloadQueue__downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_117(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_6732();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      +[CPLResource descriptionForResourceType:](CPLResource, "descriptionForResourceType:", objc_msgSend(*(id *)(a1 + 32), "resourceType"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "itemScopedIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(*(id *)(a1 + 32), "_backgroundDownloadTaskIdentifier");
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      v13 = 2048;
      v14 = v7;
      _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_DEBUG, "Removing background download for %@ %@ (%lu) - success", (uint8_t *)&v9, 0x20u);

    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "removeBackgroundDownloadTaskForResource:error:", *(_QWORD *)(a1 + 32), a2);
}

void __159__CPLEngineResourceDownloadQueue_downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  dispatch_time_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[6];

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
  v2 = ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
  v3 = dispatch_time(0, 5000000000);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __159__CPLEngineResourceDownloadQueue_downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_2;
  v6[3] = &unk_1E60D6DF8;
  v6[4] = v4;
  v6[5] = v2;
  dispatch_after(v3, v5, v6);
}

void __159__CPLEngineResourceDownloadQueue_downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD block[5];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __159__CPLEngineResourceDownloadQueue_downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_4;
  block[3] = &unk_1E60D65B8;
  block[4] = v7;
  dispatch_async(v8, block);
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

uint64_t __159__CPLEngineResourceDownloadQueue_downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_4(uint64_t result)
{
  --*(_QWORD *)(*(_QWORD *)(result + 32) + 104);
  return result;
}

void __159__CPLEngineResourceDownloadQueue_downloadTaskForLocalResource_clientBundleID_options_proposedTaskIdentifier_didStartHandler_progressHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  if (v1 == *(_QWORD *)(v2 + 112))
  {
    *(_QWORD *)(v2 + 120) = v1;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 128);
    *(_QWORD *)(v5 + 128) = v4;

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = 0;
  }
}

id *__59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_17(id *a1, uint64_t a2, void *a3)
{
  id v5;
  id *v6;
  uint64_t v8;
  uint64_t v9;

  v5 = a3;
  switch(objc_msgSend(v5, "intent"))
  {
    case 0:
    case 1:
    case 2:
    case 4:
    case 5:
    case 15:
      v6 = a1 + 19;
      if (a2 == 5)
        v6 = a1 + 5;
      goto LABEL_4;
    case 3:
      v8 = objc_msgSend(v5, "priority");
      if (v8 == 2)
      {
        v6 = a1 + 12;
      }
      else if (v8 == 1)
      {
        v6 = a1 + 11;
      }
      else if (v8)
      {
LABEL_10:
        v9 = objc_msgSend(v5, "priority");
        if ((unint64_t)(v9 - 1) >= 2)
        {
          if (v9)
LABEL_24:
            v6 = a1 + 15;
          else
            v6 = a1 + 13;
        }
        else
        {
          v6 = a1 + 14;
        }
      }
      else
      {
        v6 = a1 + 10;
      }
LABEL_4:
      a1 = (id *)*v6;
LABEL_5:

      return a1;
    case 6:
      v6 = a1 + 4;
      goto LABEL_4;
    case 7:
      v6 = a1 + 5;
      if (a2 != 5)
        v6 = a1 + 6;
      goto LABEL_4;
    case 8:
      v6 = a1 + 7;
      goto LABEL_4;
    case 9:
      v6 = a1 + 8;
      goto LABEL_4;
    case 10:
      goto LABEL_24;
    case 11:
      v6 = a1 + 18;
      goto LABEL_4;
    case 12:
      v6 = a1 + 16;
      goto LABEL_4;
    case 13:
      v6 = a1 + 9;
      goto LABEL_4;
    case 14:
      v6 = a1 + 17;
      goto LABEL_4;
    case 16:
      goto LABEL_10;
    default:
      goto LABEL_5;
  }
}

id __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_80(id *a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  id v9;

  v5 = a3;
  v6 = objc_msgSend(v5, "intent");
  switch(v6)
  {
    case 4:
      v7 = a1 + 6;
      break;
    case 6:
      v7 = a1 + 5;
      break;
    case 15:
      v7 = a1 + 4;
      break;
    default:
      if (a2 == 5)
      {
        v7 = a1 + 7;
      }
      else if (+[CPLResource isNonDerivativeResourceType:](CPLResource, "isNonDerivativeResourceType:", a2))
      {
        if (objc_msgSend(v5, "intent") == 2)
        {
          v7 = a1 + 8;
        }
        else
        {
          v8 = objc_msgSend(v5, "intent");
          v7 = a1 + 10;
          if (v8 == 5)
            v7 = a1 + 9;
        }
      }
      else
      {
        v7 = a1 + 11;
      }
      break;
  }
  v9 = *v7;

  return v9;
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_25(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createGroupForDownloadWithIntent:priority:", 15, 2);
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_24(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createGroupForDownloadWithIntent:priority:", 4, 2);
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_23(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createGroupForDownloadWithIntent:priority:", 6, 2);
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_22(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createGroupForDownloadWithIntent:priority:", 5, 2);
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_21(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createGroupForDownloadWithIntent:priority:", 2, 2);
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_20(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createGroupForDownloadWithIntent:priority:", 1, 2);
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_19(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createGroupForThumbnailPrefetch");
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_18(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createGroupForDownloadWithIntent:priority:", 0, 2);
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_16(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createGroupForDownloadWithIntent:priority:", 14, 0);
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_15(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createGroupForDownloadWithIntent:priority:", 12, 0);
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_14(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createGroupForDownloadWithIntent:priority:", 11, 0);
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_13(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createGroupForDownloadWithIntent:priority:", 10, 0);
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_12(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createGroupForDownloadWithIntent:priority:", 16, 1);
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_11(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createGroupForDownloadWithIntent:priority:", 16, 0);
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_10(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createGroupForDownloadWithIntent:priority:", 3, 2);
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createGroupForDownloadWithIntent:priority:", 3, 1);
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createGroupForDownloadWithIntent:priority:", 3, 0);
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createGroupForDownloadWithIntent:priority:", 9, 0);
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createGroupForDownloadWithIntent:priority:", 13, 0);
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createGroupForDownloadWithIntent:priority:", 8, 0);
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createGroupForDownloadWithIntent:priority:", 7, 0);
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createGroupForThumbnailsDownload");
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createGroupForDownloadWithIntent:priority:", 6, 0);
}

uint64_t __59__CPLEngineResourceDownloadQueue_initWithEngineStore_name___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createGroupForDownloadWithIntent:priority:", 0, 0);
}

+ (BOOL)shouldRetryDownloadOnError:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isCPLErrorWithCode:", 25) & 1) != 0
    || (objc_msgSend(v3, "isCPLErrorWithCode:", 26) & 1) != 0
    || (objc_msgSend(v3, "isCPLErrorWithCode:", 27) & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = objc_msgSend(v3, "isCPLErrorWithCode:", 51) ^ 1;
  }

  return v4;
}

@end
