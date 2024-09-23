@implementation DYReplayController

- (id)profileBlockQueue
{
  return self->_profileBlockQueue;
}

- (id)profileBlockBackgroundQueue
{
  return self->_profileBlockBackgroundQueue;
}

- (DYReplayController)init
{
  DYReplayController *v2;
  DYReplayController *v3;
  void *v4;
  void *v5;
  id v6;
  dispatch_queue_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *messageLock;
  void *v14;
  void *v15;
  id v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *messageProcessingQueue;
  NSMutableArray *v19;
  NSMutableArray *messageQueue;
  uint64_t v21;
  DYReplayControllerQueue *profileBlockQueue;
  uint64_t v23;
  DYReplayControllerQueue *profileBlockBackgroundQueue;
  DYReplayController *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)DYReplayController;
  v2 = -[DYReplayController init](&v27, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", object_getClassName(v2));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("gputools.%@.%p"), v5, v3);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), 0);
    -[DYReplayController setQueue:](v3, "setQueue:", v7);

    v8 = objc_alloc_init(MEMORY[0x24BE38FF0]);
    -[DYReplayController setArchiveStack:](v3, "setArchiveStack:", v8);

    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", object_getClassName(v3));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("gputools.%@.%p.%@"), v10, v3, CFSTR("messageLock"));
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = dispatch_queue_create((const char *)objc_msgSend(v11, "UTF8String"), 0);
    messageLock = v3->_messageLock;
    v3->_messageLock = (OS_dispatch_queue *)v12;

    v14 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", object_getClassName(v3));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("gputools.%@.%p.%@"), v15, v3, CFSTR("messageProcessingQueue"));
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = dispatch_queue_create((const char *)objc_msgSend(v16, "UTF8String"), 0);
    messageProcessingQueue = v3->_messageProcessingQueue;
    v3->_messageProcessingQueue = (OS_dispatch_queue *)v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    messageQueue = v3->_messageQueue;
    v3->_messageQueue = v19;

    v21 = objc_opt_new();
    profileBlockQueue = v3->_profileBlockQueue;
    v3->_profileBlockQueue = (DYReplayControllerQueue *)v21;

    v23 = objc_opt_new();
    profileBlockBackgroundQueue = v3->_profileBlockBackgroundQueue;
    v3->_profileBlockBackgroundQueue = (DYReplayControllerQueue *)v23;

    v25 = v3;
  }

  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[DYReplayController origSourceMessageHandler](self, "origSourceMessageHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DYReplayController source](self, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMessageHandler:", v3);

  -[DYReplayController setQueue:](self, "setQueue:", 0);
  v5.receiver = self;
  v5.super_class = (Class)DYReplayController;
  -[DYReplayController dealloc](&v5, sel_dealloc);
}

+ (id)sharedController
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)initializeTransportWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  uint64_t v17;
  id v18;
  id location;

  v4 = a3;
  DYGetGlobalClientTransport();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DYReplayController setTransport:](self, "setTransport:", v5);

  -[DYReplayController transport](self, "transport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (DYGetGlobalTransportSource(),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        -[DYReplayController setSource:](self, "setSource:", v7),
        v7,
        -[DYReplayController source](self, "source"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    -[DYReplayController source](self, "source");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "suspend");

    -[DYReplayController source](self, "source");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "messageHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    -[DYReplayController setOrigSourceMessageHandler:](self, "setOrigSourceMessageHandler:", v12);

    objc_initWeak(&location, self);
    v17 = MEMORY[0x24BDAC760];
    objc_copyWeak(&v18, &location);
    -[DYReplayController source](self, "source", v17, 3221225472, __46__DYReplayController_initializeTransportWith___block_invoke, &unk_250D6FCB0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMessageHandler:", &v17);

    -[DYReplayController source](self, "source");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resume");

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    v15 = 1;
  }
  else
  {
    _DYOLog();
    v15 = 0;
  }

  return v15;
}

void __46__DYReplayController_initializeTransportWith___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_pushMessage:", v3);

}

- (BOOL)informReady
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  id v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v3 = DYGetInterposeVersion();
  v5 = v4;
  v6 = (void *)MEMORY[0x24BE39128];
  v17[0] = CFSTR("version");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *MEMORY[0x24BE39228]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  v17[1] = CFSTR("interpose-feature-version");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v8;
  v17[2] = CFSTR("interpose-patch-version");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageWithKind:attributes:", 4096, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[DYReplayController transport](self, "transport");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v13 = objc_msgSend(v12, "send:error:", v11, &v16);
  v14 = v16;

  if ((v13 & 1) == 0)
    _DYOLog();

  return v13;
}

- (BOOL)playbackArchive:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v6 = -[DYReplayController _loadArchives:error:](self, "_loadArchives:error:", v5, &v18);
  v7 = v18;

  if (v6)
  {
    -[DYReplayController archiveStack](self, "archiveStack");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DYReplayController _replayerControllerSupportForCaptureStore:](self, "_replayerControllerSupportForCaptureStore:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DYReplayController setReplayControllerSupport:](self, "setReplayControllerSupport:", v9);

    -[DYReplayController replayControllerSupport](self, "replayControllerSupport");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DYReplayController archiveStack](self, "archiveStack");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "createArchivePlaybackEngineWithCaptureStore:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DYReplayController setPlaybackEngine:](self, "setPlaybackEngine:", v12);

    -[DYReplayController _displayPlaybackEngine](self, "_displayPlaybackEngine");
    -[DYReplayController playbackEngine](self, "playbackEngine");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "playback");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[DYReplayController queue](self, "queue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __38__DYReplayController_playbackArchive___block_invoke;
    v17[3] = &unk_250D6F8D0;
    v17[4] = self;
    objc_msgSend(v14, "notifyOnQueue:handler:", v15, v17);

    objc_msgSend(v14, "waitUntilResolved");
  }

  return v6;
}

uint64_t __38__DYReplayController_playbackArchive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPlaybackEngine:", 0);
}

- (id)_popMessage
{
  NSObject *messageLock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  messageLock = self->_messageLock;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __33__DYReplayController__popMessage__block_invoke;
  v5[3] = &unk_250D6FCD8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(messageLock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __33__DYReplayController__popMessage__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "firstObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  if (result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectAtIndex:", 0);
  return result;
}

- (void)_pushMessage:(id)a3
{
  id v4;
  NSObject *messageLock;
  id v6;
  _QWORD v7[4];
  id v8;
  DYReplayController *v9;

  v4 = a3;
  messageLock = self->_messageLock;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__DYReplayController__pushMessage___block_invoke;
  v7[3] = &unk_250D6FD28;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(messageLock, v7);

}

void __35__DYReplayController__pushMessage___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v2 = objc_msgSend(*(id *)(a1 + 32), "kind");
  v3 = MEMORY[0x24BDAC760];
  if (v2 == 4106)
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 24);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __35__DYReplayController__pushMessage___block_invoke_2;
    v10[3] = &unk_250D6FD00;
    v10[4] = v4;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filterUsingPredicate:", v6);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "addObject:", *(_QWORD *)(a1 + 32));
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(NSObject **)(v7 + 16);
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __35__DYReplayController__pushMessage___block_invoke_3;
  v9[3] = &unk_250D6F8D0;
  v9[4] = v7;
  dispatch_async(v8, v9);
}

uint64_t __35__DYReplayController__pushMessage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  v4 = objc_msgSend(v3, "kind");
  switch(v4)
  {
    case 1026:
      objc_msgSend(*(id *)(a1 + 32), "transport");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE39128], "messageWithKind:attributes:payload:", 1026, 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "send:inReplyTo:error:", v6, v3, 0);
      break;
    case 4106:
      objc_msgSend(*(id *)(a1 + 32), "transport");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BE39128];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "messageWithKind:objectPayload:", 4105, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "send:inReplyTo:error:", v8, v3, 0);

      break;
    case 4121:
      objc_msgSend(*(id *)(a1 + 32), "transport");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE39128], "messageWithKind:attributes:payload:", 4121, 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "send:inReplyTo:error:", v6, v3, 0);
      break;
    default:
      v9 = 1;
      goto LABEL_9;
  }

  v9 = 0;
LABEL_9:

  return v9;
}

uint64_t __35__DYReplayController__pushMessage___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_messageLoop");
}

- (void)_messageLoop
{
  void *v3;
  DYReplayControllerQueue **p_profileBlockQueue;
  DYReplayControllerQueue **p_profileBlockBackgroundQueue;
  uint64_t v6;
  void *v7;
  DYReplayControllerQueue **v8;
  DYReplayControllerQueue *v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  uint64_t v13;

  -[DYReplayController _popMessage](self, "_popMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || -[DYReplayControllerQueue count](self->_profileBlockQueue, "count")
    || -[DYReplayControllerQueue count](self->_profileBlockBackgroundQueue, "count"))
  {
    p_profileBlockQueue = &self->_profileBlockQueue;
    p_profileBlockBackgroundQueue = &self->_profileBlockBackgroundQueue;
    v6 = 0xFFFFFFFFLL;
    while (1)
    {
      if (v3)
      {
        if ((_DWORD)v6 != -1)
        {
          -[DYReplayController playbackEngine](self, "playbackEngine");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "playbackToFunction:withLoops:", v6, 0);

        }
        -[DYReplayController _processMessage:](self, "_processMessage:", v3);
        v6 = 0xFFFFFFFFLL;
      }
      else
      {
        if (-[DYReplayControllerQueue count](*p_profileBlockQueue, "count"))
          v8 = &self->_profileBlockQueue;
        else
          v8 = &self->_profileBlockBackgroundQueue;
        v9 = *v8;
        -[DYReplayControllerQueue front](v9, "front");
        v10 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
        -[DYReplayControllerQueue dequeBlock](v9, "dequeBlock");
        if ((_DWORD)v6 == -1)
        {
          -[DYReplayController playbackEngine](self, "playbackEngine");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v11, "targetFunctionIndex");

        }
        v10[2](v10);
        if (!-[DYReplayControllerQueue count](*p_profileBlockQueue, "count")
          && !-[DYReplayControllerQueue count](*p_profileBlockBackgroundQueue, "count")
          && (_DWORD)v6 != -1)
        {
          -[DYReplayController playbackEngine](self, "playbackEngine");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "playbackToFunction:withLoops:", v6, 0);

          v6 = 0xFFFFFFFFLL;
        }

      }
      -[DYReplayController _popMessage](self, "_popMessage");
      v13 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v13;
      if (!v13)
      {
        v3 = 0;
        if (!-[DYReplayControllerQueue count](*p_profileBlockQueue, "count"))
        {
          v3 = 0;
          if (!-[DYReplayControllerQueue count](*p_profileBlockBackgroundQueue, "count"))
            break;
        }
      }
    }
  }
}

- (void)_processMessage:(id)a3
{
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  int v21;
  void (**v22)(_QWORD, _QWORD);
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  const __CFAllocator *v30;
  uint64_t i;
  void *v32;
  __CFString *v33;
  id v34;
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
  int v50;
  int v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
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
  uint64_t v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  int v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  unint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  _BOOL8 v129;
  id v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  void *v137;
  uint64_t v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  _BOOL4 v145;
  void *v146;
  void *v147;
  void *v148;
  id v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  DYReplayController *v154;
  id v155;
  id obj;
  id obja;
  void *v158;
  void *v159;
  _QWORD v160[5];
  id v161;
  _QWORD v162[5];
  id v163;
  _QWORD v164[5];
  id v165;
  _QWORD v166[5];
  id v167;
  id v168;
  id v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  id v174;
  _BYTE v175[128];
  uint64_t v176;

  v176 = *MEMORY[0x24BDAC8D0];
  v155 = a3;
  v4 = objc_msgSend(v155, "kind");
  if (v4 > 4097)
  {
    v154 = self;
    switch(v4)
    {
      case 4098:
        if (!-[DYReplayController _handleArchiveLoadingForPlaybackRequest:replyKind:](self, "_handleArchiveLoadingForPlaybackRequest:replyKind:", v155, 4100))goto LABEL_54;
        -[DYReplayController setReplayMessage:](self, "setReplayMessage:", v155);
        objc_msgSend(v155, "attributeForKey:", *MEMORY[0x24BE39268]);
        v5 = objc_claimAutoreleasedReturnValue();
        obj = (id)v5;
        if (v5)
        {
          v6 = (void *)MEMORY[0x24BE39120];
          v7 = (void *)MEMORY[0x24BDBCF20];
          v8 = objc_opt_class();
          objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v169 = 0;
          objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v9, v5, &v169);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v169;

          if (v10)
          {
            v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v10);
            -[DYReplayController setExperiments:](self, "setExperiments:", v12);

          }
        }
        else
        {
          v11 = 0;
        }
        v136 = *MEMORY[0x24BE396C8];
        objc_msgSend(v155, "attributeForKey:", *MEMORY[0x24BE396C8]);
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        v138 = *MEMORY[0x24BE396C0];
        objc_msgSend(v155, "attributeForKey:", *MEMORY[0x24BE396C0]);
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        v159 = v139;
        if (v137)
        {
          v140 = (void *)objc_opt_new();
          -[DYReplayController setProfileInfo:](self, "setProfileInfo:", v140);

          -[DYReplayController profileInfo](self, "profileInfo");
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v141, "setObject:forKey:", v137, v136);
        }
        else
        {
          if (!objc_msgSend(v139, "count"))
            goto LABEL_63;
          v142 = (void *)objc_opt_new();
          -[DYReplayController setProfileInfo:](self, "setProfileInfo:", v142);

          -[DYReplayController profileInfo](self, "profileInfo");
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v141, "setObject:forKey:", v159, v138);
        }

LABEL_63:
        -[DYReplayController _playbackCurrentArchiveAndExperiments](self, "_playbackCurrentArchiveAndExperiments");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v143, "waitUntilResolved");
        -[DYReplayController profileInfo](self, "profileInfo");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        v145 = v144 == 0;

        if (v145)
        {
          -[DYReplayController transport](self, "transport");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          v153 = (void *)MEMORY[0x24BE39128];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v153, "messageWithKind:objectPayload:", 4100, v150);
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          -[DYReplayController replayMessage](self, "replayMessage");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v148, "send:inReplyTo:error:", v151, v152, 0);
        }
        else
        {
          v146 = (void *)MEMORY[0x24BDD1618];
          objc_msgSend(v143, "result");
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          v168 = v11;
          objc_msgSend(v146, "archivedDataWithRootObject:requiringSecureCoding:error:", v147, 1, &v168);
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          v149 = v168;

          -[DYReplayController transport](self, "transport");
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE39128], "messageWithKind:objectPayload:", 4100, v148);
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          -[DYReplayController replayMessage](self, "replayMessage");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v150, "send:inReplyTo:error:", v151, v152, 0);
          v11 = v149;
        }

        -[DYReplayController setReplayMessage:](self, "setReplayMessage:", 0);
        -[DYReplayController setExperiments:](self, "setExperiments:", 0);
        -[DYReplayController setProfileInfo:](self, "setProfileInfo:", 0);

        goto LABEL_54;
      case 4099:
      case 4100:
      case 4101:
      case 4105:
      case 4113:
      case 4117:
      case 4118:
      case 4123:
      case 4124:
      case 4125:
        goto LABEL_49;
      case 4102:
        -[DYReplayController _deleteAllArchives](self, "_deleteAllArchives");
        -[DYReplayController transport](self, "transport");
        v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE39128], "messageWithKind:", 4102);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "send:inReplyTo:error:", v23, v155, 0);
        goto LABEL_52;
      case 4103:
        if (!-[DYReplayController _handleArchiveLoadingForPlaybackRequest:replyKind:](self, "_handleArchiveLoadingForPlaybackRequest:replyKind:", v155, 4105))goto LABEL_54;
        -[DYReplayController transport](self, "transport");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = (void *)MEMORY[0x24BE39128];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "messageWithKind:objectPayload:", 4105, v103);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "send:inReplyTo:error:", v104, v155, 0);

        -[DYReplayController _beginDebugArchive](self, "_beginDebugArchive");
        v82 = v155;
LABEL_44:
        -[DYReplayController setReplayMessage:](self, "setReplayMessage:", v82);
        goto LABEL_54;
      case 4104:
        -[DYReplayController _endPlayback](self, "_endPlayback");
        v82 = 0;
        goto LABEL_44;
      case 4106:
        -[DYReplayController replayControllerSupport](self, "replayControllerSupport");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        -[DYReplayController playbackEngine](self, "playbackEngine");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = objc_msgSend(v92, "isDebugPlaybackEngine:", v93);

        if (v94)
        {
          -[DYReplayController transport](self, "transport");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v96 = (void *)MEMORY[0x24BE39128];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "messageWithKind:objectPayload:", 4105, v97);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "send:inReplyTo:error:", v98, v155, 0);

          objc_msgSend(v155, "objectPayload");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v100 = objc_msgSend(v99, "unsignedLongLongValue");

          -[DYReplayController playbackEngine](self, "playbackEngine");
          v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "playbackToFunction:subCommandIndex:withLoops:", v100, HIDWORD(v100), 0);
          goto LABEL_53;
        }
        -[DYReplayController transport](self, "transport");
        v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v127 = (void *)MEMORY[0x24BE39128];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v127, "messageWithKind:objectPayload:", 4105, v23);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "send:inReplyTo:error:", v71, v155, 0);
        goto LABEL_51;
      case 4107:
        -[DYReplayController transport](self, "transport");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v114 = (void *)MEMORY[0x24BE39128];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "messageWithKind:objectPayload:", 4105, v115);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "send:inReplyTo:error:", v116, v155, 0);

        -[DYReplayController replayControllerSupport](self, "replayControllerSupport");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v155, "objectPayload");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = objc_msgSend(v118, "BOOLValue");
        -[DYReplayController playbackEngine](self, "playbackEngine");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "enableDebugWireframePresent:playbackEngine:", v119, v120);

        -[DYReplayController playbackEngine](self, "playbackEngine");
        v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        -[DYReplayController playbackEngine](self, "playbackEngine");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "playbackToFunction:withLoops:", objc_msgSend(v23, "targetFunctionIndex"), 0);
        goto LABEL_52;
      case 4108:
        -[DYReplayController transport](self, "transport");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = (void *)MEMORY[0x24BE39128];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "messageWithKind:objectPayload:", 4105, v107);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "send:inReplyTo:error:", v108, v155, 0);

        -[DYReplayController replayControllerSupport](self, "replayControllerSupport");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v155, "objectPayload");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = objc_msgSend(v110, "BOOLValue");
        -[DYReplayController playbackEngine](self, "playbackEngine");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "enableDebugDrawCallPresent:playbackEngine:", v111, v112);

        -[DYReplayController playbackEngine](self, "playbackEngine");
        v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        -[DYReplayController playbackEngine](self, "playbackEngine");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "playbackToFunction:withLoops:", objc_msgSend(v23, "targetFunctionIndex"), 0);
        goto LABEL_52;
      case 4109:
        -[DYReplayController transport](self, "transport");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)MEMORY[0x24BE39128];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "messageWithKind:objectPayload:", 4105, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "send:inReplyTo:error:", v47, v155, 0);

        -[DYReplayController replayControllerSupport](self, "replayControllerSupport");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v155, "objectPayload");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "floatValue");
        v51 = v50;
        -[DYReplayController playbackEngine](self, "playbackEngine");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v53) = v51;
        objc_msgSend(v48, "setDebugWireframeLineWidth:playbackEngine:", v52, v53);

        -[DYReplayController playbackEngine](self, "playbackEngine");
        v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        -[DYReplayController playbackEngine](self, "playbackEngine");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "playbackToFunction:withLoops:", objc_msgSend(v23, "targetFunctionIndex"), 0);
        goto LABEL_52;
      case 4110:
        -[DYReplayController transport](self, "transport");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = (void *)MEMORY[0x24BE39128];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "messageWithKind:objectPayload:", 4105, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "send:inReplyTo:error:", v57, v155, 0);

        -[DYReplayController replayControllerSupport](self, "replayControllerSupport");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v155, "objectPayload");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v59, "unsignedIntValue");
        -[DYReplayController playbackEngine](self, "playbackEngine");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setWireframeLineColor:playbackEngine:", v60, v61);

        -[DYReplayController playbackEngine](self, "playbackEngine");
        v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        -[DYReplayController playbackEngine](self, "playbackEngine");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "playbackToFunction:withLoops:", objc_msgSend(v23, "targetFunctionIndex"), 0);
        goto LABEL_52;
      case 4111:
        -[DYReplayController transport](self, "transport");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = (void *)MEMORY[0x24BE39128];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "messageWithKind:objectPayload:", 4105, v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "send:inReplyTo:error:", v65, v155, 0);

        -[DYReplayController replayControllerSupport](self, "replayControllerSupport");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v155, "objectPayload");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[DYReplayController playbackEngine](self, "playbackEngine");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "disableDebugFunctions:playbackEngine:", v67, v68);

        -[DYReplayController playbackEngine](self, "playbackEngine");
        v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        -[DYReplayController playbackEngine](self, "playbackEngine");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "playbackToFunction:withLoops:", objc_msgSend(v23, "targetFunctionIndex"), 0);
        goto LABEL_52;
      case 4112:
        -[DYReplayController transport](self, "transport");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = (void *)MEMORY[0x24BE39128];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "messageWithKind:objectPayload:", 4105, v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "send:inReplyTo:error:", v86, v155, 0);

        -[DYReplayController replayControllerSupport](self, "replayControllerSupport");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v155, "objectPayload");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        -[DYReplayController playbackEngine](self, "playbackEngine");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "enableDebugFunctions:playbackEngine:", v88, v89);

        -[DYReplayController playbackEngine](self, "playbackEngine");
        v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        -[DYReplayController playbackEngine](self, "playbackEngine");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "playbackToFunction:withLoops:", objc_msgSend(v23, "targetFunctionIndex"), 0);
        goto LABEL_52;
      case 4114:
        -[DYReplayController replayMessage](self, "replayMessage");
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v69)
        {
          objc_msgSend(v155, "plistPayload");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          v174 = 0;
          v129 = -[DYReplayController _loadArchives:error:](self, "_loadArchives:error:", v128, &v174);
          v130 = v174;

          -[DYReplayController transport](self, "transport");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          v132 = (void *)MEMORY[0x24BE39128];
          DYDictionaryFromError();
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v129);
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v132, "messageWithKind:attributes:objectPayload:", 4114, v133, v134);
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v131, "send:inReplyTo:error:", v135, v155, 0);

          goto LABEL_54;
        }
        objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 2048, 0);
        v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        -[DYReplayController transport](self, "transport");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = (void *)MEMORY[0x24BE39128];
        DYDictionaryFromError();
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "messageWithKind:attributes:objectPayload:", 4100, v71, v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "send:inReplyTo:error:", v73, v155, 0);

LABEL_51:
LABEL_52:

        break;
      case 4115:
        v158 = (void *)objc_opt_new();
        -[DYReplayController archiveStack](self, "archiveStack");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "allObjects");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v172 = 0u;
        v173 = 0u;
        v170 = 0u;
        v171 = 0u;
        obja = v27;
        v28 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v170, v175, 16);
        if (v28)
        {
          v29 = *(_QWORD *)v171;
          v30 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          do
          {
            for (i = 0; i != v28; ++i)
            {
              if (*(_QWORD *)v171 != v29)
                objc_enumerationMutation(obja);
              v32 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * i);
              v33 = (__CFString *)CFUUIDCreateString(v30, (CFUUIDRef)objc_msgSend(v32, "uuid"));
              if (!v33)
                __assert_rtn("-[DYReplayController _processMessage:]", ", 0, "uuidString");
              v34 = objc_alloc(MEMORY[0x24BDBCE70]);
              objc_msgSend(v32, "path");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "lastPathComponent");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = (void *)objc_msgSend(v34, "initWithObjectsAndKeys:", v36, CFSTR("filename"), v33, CFSTR("uuid"), 0);

              objc_msgSend(v158, "addObject:", v37);
            }
            v28 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v170, v175, 16);
          }
          while (v28);
        }

        -[DYReplayController transport](v154, "transport");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE39128], "messageWithKind:attributes:plistPayload:", 4115, 0, v158);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "send:inReplyTo:error:", v39, v155, 0);

        goto LABEL_54;
      case 4116:
        v90 = (void *)MEMORY[0x24BE39128];
        -[DYReplayController _archiveDirectory](self, "_archiveDirectory");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "messageWithKind:attributes:stringPayload:", 4116, 0, v91);
        v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

        -[DYReplayController transport](self, "transport");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "send:inReplyTo:error:", v22, v155, 0);
        goto LABEL_52;
      case 4119:
        -[DYReplayController replayControllerSupport](self, "replayControllerSupport");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[DYReplayController playbackEngine](self, "playbackEngine");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v166[0] = MEMORY[0x24BDAC760];
        v166[1] = 3221225472;
        v166[2] = __38__DYReplayController__processMessage___block_invoke;
        v166[3] = &unk_250D6FD50;
        v166[4] = self;
        v167 = v155;
        objc_msgSend(v42, "generateThumbnailsWithPlaybackEngine:forMessage:onReady:", v43, v167, v166);

        goto LABEL_54;
      case 4120:
        -[DYReplayController replayControllerSupport](self, "replayControllerSupport");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[DYReplayController playbackEngine](self, "playbackEngine");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v162[0] = MEMORY[0x24BDAC760];
        v162[1] = 3221225472;
        v162[2] = __38__DYReplayController__processMessage___block_invoke_3;
        v162[3] = &unk_250D6FD50;
        v162[4] = self;
        v163 = v155;
        objc_msgSend(v40, "generateDependencyGraphThumbnailsWithPlaybackEngine:forMessage:onReady:", v41, v163, v162);

        goto LABEL_54;
      case 4121:
        goto LABEL_11;
      case 4122:
        -[DYReplayController transport](self, "transport");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = (void *)MEMORY[0x24BE39128];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "messageWithKind:objectPayload:", 4105, v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "send:inReplyTo:error:", v77, v155, 0);

        -[DYReplayController replayControllerSupport](self, "replayControllerSupport");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v155, "objectPayload");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend(v79, "BOOLValue");
        -[DYReplayController playbackEngine](self, "playbackEngine");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "enableDebugOutlinePresent:playbackEngine:", v80, v81);

        -[DYReplayController playbackEngine](self, "playbackEngine");
        v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        -[DYReplayController playbackEngine](self, "playbackEngine");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "playbackToFunction:withLoops:", objc_msgSend(v23, "targetFunctionIndex"), 0);
        goto LABEL_52;
      case 4126:
        -[DYReplayController replayControllerSupport](self, "replayControllerSupport");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[DYReplayController playbackEngine](self, "playbackEngine");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v160[0] = MEMORY[0x24BDAC760];
        v160[1] = 3221225472;
        v160[2] = __38__DYReplayController__processMessage___block_invoke_4;
        v160[3] = &unk_250D6FD50;
        v160[4] = self;
        v161 = v155;
        objc_msgSend(v24, "generatePixelHistoryWithPlaybackEngine:forMessage:onReady:", v25, v161, v160);

        goto LABEL_54;
      default:
        if (v4 != 4611)
          goto LABEL_49;
        -[DYReplayController transport](self, "transport");
        v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE39128], "messageWithKind:", 4611);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "send:inReplyTo:error:", v23, v155, 0);
        goto LABEL_52;
    }
    goto LABEL_53;
  }
  if (v4 == 1026)
  {
LABEL_11:
    objc_msgSend(v155, "attributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x24BE396F8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "unsignedLongLongValue");

    if ((_DWORD)v17 != -1)
    {
      -[DYReplayController playbackEngine](self, "playbackEngine");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = HIDWORD(v17);
      if (objc_msgSend(v18, "currentFunctionIndex") == (_DWORD)v17)
      {
        -[DYReplayController playbackEngine](self, "playbackEngine");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "targetSubCommandIndex");

        if (v21 == HIDWORD(v17))
          goto LABEL_49;
      }
      else
      {

      }
      -[DYReplayController playbackEngine](self, "playbackEngine");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "setTargetFunctionIndex:", v17);

      -[DYReplayController playbackEngine](self, "playbackEngine");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "setTargetSubCommandIndex:", v19);

      -[DYReplayController playbackEngine](self, "playbackEngine");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      -[DYReplayController playbackEngine](self, "playbackEngine");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = objc_msgSend(v124, "targetFunctionIndex");
      -[DYReplayController playbackEngine](self, "playbackEngine");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "playbackToFunction:subCommandIndex:withLoops:", v125, objc_msgSend(v126, "targetSubCommandIndex"), 0);

    }
LABEL_49:
    -[DYReplayController origSourceMessageHandler](self, "origSourceMessageHandler");
    v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v22)[2](v22, v155);
LABEL_53:

    goto LABEL_54;
  }
  if (v4 != 1030)
    goto LABEL_49;
  -[DYReplayController replayControllerSupport](self, "replayControllerSupport");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DYReplayController playbackEngine](self, "playbackEngine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v164[0] = MEMORY[0x24BDAC760];
  v164[1] = 3221225472;
  v164[2] = __38__DYReplayController__processMessage___block_invoke_2;
  v164[3] = &unk_250D6FD50;
  v164[4] = self;
  v165 = v155;
  objc_msgSend(v13, "generateShaderDebuggerTraceForMessage:playbackEngine:onReady:", v165, v14, v164);

LABEL_54:
}

void __38__DYReplayController__processMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE39128], "messageWithKind:objectPayload:", 4119, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "send:inReplyTo:error:", v4, *(_QWORD *)(a1 + 40), 0);

}

void __38__DYReplayController__processMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE39128], "messageWithKind:objectPayload:", 1030, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "send:inReplyTo:error:", v4, *(_QWORD *)(a1 + 40), 0);

}

void __38__DYReplayController__processMessage___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE39128], "messageWithKind:objectPayload:", 4120, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "send:inReplyTo:error:", v4, *(_QWORD *)(a1 + 40), 0);

}

void __38__DYReplayController__processMessage___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE39128], "messageWithKind:objectPayload:", 4126, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "send:inReplyTo:error:", v4, *(_QWORD *)(a1 + 40), 0);

}

- (void)_displayPlaybackEngine
{
  -[DYReplayController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (id)_archiveDirectory
{
  -[DYReplayController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)_replayerControllerSupportForCaptureStore:(id)a3
{
  -[DYReplayController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)_loadArchives:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!v6)
    __assert_rtn("-[DYReplayController _loadArchives:error:]", ", 0, "filenames");
  -[DYReplayController archiveStack](self, "archiveStack");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "close");

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v20 = v6;
    v9 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v11, "isAbsolutePath", v20))
        {
          v12 = v11;
        }
        else
        {
          -[DYReplayController _archiveDirectory](self, "_archiveDirectory");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringByAppendingPathComponent:", v11);
          v12 = (id)objc_claimAutoreleasedReturnValue();

        }
        v14 = objc_alloc(MEMORY[0x24BE38FE8]);
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v14, "initWithURL:options:error:", v15, 0, a4);

        if (!v16)
        {

          v18 = 0;
          goto LABEL_15;
        }
        -[DYReplayController archiveStack](self, "archiveStack");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "push:", v16);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v8)
        continue;
      break;
    }
  }
  v18 = 1;
LABEL_15:

  return v18;
}

- (void)_deleteAllArchives
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  _BOOL4 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[DYReplayController replayMessage](self, "replayMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[DYReplayController archiveStack](self, "archiveStack");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "close");

  }
  v5 = (void *)objc_opt_new();
  v6 = (void *)MEMORY[0x24BDBCF48];
  -[DYReplayController _archiveDirectory](self, "_archiveDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v8, MEMORY[0x24BDBD1A8], 0, 0);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v13, "pathExtension", (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "caseInsensitiveCompare:", CFSTR("gputrace")) == 0;

        if (v15)
          objc_msgSend(v5, "removeItemAtURL:error:", v13, 0);
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

}

- (void)_endPlayback
{
  void *v3;

  -[DYReplayController replayControllerSupport](self, "replayControllerSupport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endPlayback");

  -[DYReplayController setPlaybackEngine:](self, "setPlaybackEngine:", 0);
}

- (BOOL)_handleArchiveLoadingForPlaybackRequest:(id)a3 replyKind:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[DYReplayController replayMessage](self, "replayMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v6, "stringPayload");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      v17 = -[DYReplayController _loadArchives:error:](self, "_loadArchives:error:", v16, &v30);
      v8 = v30;

      if (!v17)
      {
        v18 = (void *)MEMORY[0x24BE39128];
        DYDictionaryFromError();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "messageWithKind:attributes:objectPayload:", v4, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        -[DYReplayController transport](self, "transport");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "send:inReplyTo:error:", v21, v6, 0);
        goto LABEL_10;
      }
    }
    else
    {
      v8 = 0;
    }
    -[DYReplayController archiveStack](self, "archiveStack");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "size");

    if (v24)
    {
      v14 = 1;
LABEL_11:

      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 2049, 0);
    v25 = objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x24BE39128];
    DYDictionaryFromError();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "messageWithKind:attributes:objectPayload:", v4, v27, v28);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[DYReplayController transport](self, "transport");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "send:inReplyTo:error:", v21, v6, 0);
    v8 = (id)v25;
LABEL_10:

    v14 = 0;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 2048, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BE39128];
  DYDictionaryFromError();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messageWithKind:attributes:objectPayload:", v4, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[DYReplayController transport](self, "transport");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "send:inReplyTo:error:", v12, v6, 0);

  v14 = 0;
LABEL_12:

  return v14;
}

- (id)_playbackCurrentArchiveAndExperiments
{
  void *v3;
  void *v4;
  void *v5;

  -[DYReplayController archiveStack](self, "archiveStack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "empty"))
    __assert_rtn("-[DYReplayController _playbackCurrentArchiveAndExperiments]", ", 0, "![self.archiveStack empty]");

  objc_msgSend(MEMORY[0x24BE39110], "future");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DYReplayController experiments](self, "experiments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[DYReplayController _recursivePlaybackWithFuture:usingExperiment:withToplevelFuture:](self, "_recursivePlaybackWithFuture:usingExperiment:withToplevelFuture:", 0, 0, v4);
  else
    -[DYReplayController _playbackArchiveWithExperiment:passingFuture:resolvingFuture:](self, "_playbackArchiveWithExperiment:passingFuture:resolvingFuture:", 0, v4, 1);
  return v4;
}

- (void)_recursivePlaybackWithFuture:(id)a3 usingExperiment:(id)a4 withToplevelFuture:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    -[DYReplayController experiments](self, "experiments");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectAtIndex:", 0);

  }
  -[DYReplayController experiments](self, "experiments");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    -[DYReplayController experiments](self, "experiments");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", 0);
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v13;
  }
  else
  {
    v12 = v8;
    v14 = 0;
  }

  if (v17)
  {
    v15 = objc_msgSend(v17, "BOOLResult");
    if (!v14)
      goto LABEL_12;
  }
  else
  {
    v15 = 1;
    if (!v14)
    {
LABEL_12:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setResult:", v16);

      goto LABEL_13;
    }
  }
  if ((v15 & 1) == 0)
    goto LABEL_12;
  -[DYReplayController _playbackArchiveWithExperiment:passingFuture:resolvingFuture:](self, "_playbackArchiveWithExperiment:passingFuture:resolvingFuture:", v14, v9, 0);
LABEL_13:

}

- (void)_playbackArchiveWithExperiment:(id)a3 passingFuture:(id)a4 resolvingFuture:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  DYReplayController *v26;
  id v27;
  id v28;
  BOOL v29;
  _QWORD block[5];
  id v31;

  v8 = a3;
  v9 = a4;
  -[DYReplayController archiveStack](self, "archiveStack");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "empty"))
    __assert_rtn("-[DYReplayController _playbackArchiveWithExperiment:passingFuture:resolvingFuture:]", ", 0, "![self.archiveStack empty]");

  v11 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__DYReplayController__playbackArchiveWithExperiment_passingFuture_resolvingFuture___block_invoke;
  block[3] = &unk_250D6FD28;
  block[4] = self;
  v12 = v8;
  v31 = v12;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
  -[DYReplayController replayControllerSupport](self, "replayControllerSupport");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DYReplayController playbackEngine](self, "playbackEngine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "experimentResultsGeneratorForPlaybackEngine:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "begin");
  -[DYReplayController playbackEngine](self, "playbackEngine");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "playback");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[DYReplayController queue](self, "queue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v11;
  v23[1] = 3221225472;
  v23[2] = __83__DYReplayController__playbackArchiveWithExperiment_passingFuture_resolvingFuture___block_invoke_2;
  v23[3] = &unk_250D6FD78;
  v19 = v15;
  v24 = v19;
  v20 = v12;
  v25 = v20;
  v26 = self;
  v29 = a5;
  v21 = v9;
  v27 = v21;
  v22 = v17;
  v28 = v22;
  objc_msgSend(v22, "notifyOnQueue:handler:", v18, v23);

}

uint64_t __83__DYReplayController__playbackArchiveWithExperiment_passingFuture_resolvingFuture___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "archiveStack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_replayerControllerSupportForCaptureStore:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setReplayControllerSupport:", v4);

  objc_msgSend(*(id *)(a1 + 32), "replayControllerSupport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "archiveStack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createOverridingPlaybackEngineWithCaptureStore:experiment:", v6, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPlaybackEngine:", v7);

  return objc_msgSend(*(id *)(a1 + 32), "_displayPlaybackEngine");
}

uint64_t __83__DYReplayController__playbackArchiveWithExperiment_passingFuture_resolvingFuture___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "end");
    objc_msgSend(MEMORY[0x24BE39128], "messageWithKind:objectPayload:", 4099, *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      __assert_rtn("-[DYReplayController _playbackArchiveWithExperiment:passingFuture:resolvingFuture:]_block_invoke_2", ", 0, "result_message");
    objc_msgSend(*(id *)(a1 + 48), "replayMessage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      __assert_rtn("-[DYReplayController _playbackArchiveWithExperiment:passingFuture:resolvingFuture:]_block_invoke_2", ", 0, "self.replayMessage");

    objc_msgSend(*(id *)(a1 + 48), "transport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "replayMessage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "send:inReplyTo:error:", v3, v6, 0);

  }
  objc_msgSend(*(id *)(a1 + 48), "_endPlayback");
  if (*(_BYTE *)(a1 + 72))
    return objc_msgSend(*(id *)(a1 + 56), "resolveWithFuture:", *(_QWORD *)(a1 + 64));
  else
    return objc_msgSend(*(id *)(a1 + 48), "_recursivePlaybackWithFuture:usingExperiment:withToplevelFuture:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
}

- (void)_beginDebugArchive
{
  void *v3;
  _QWORD block[5];

  -[DYReplayController archiveStack](self, "archiveStack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "empty"))
    __assert_rtn("-[DYReplayController _beginDebugArchive]", ", 0, "![self.archiveStack empty]");

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__DYReplayController__beginDebugArchive__block_invoke;
  block[3] = &unk_250D6F8D0;
  block[4] = self;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
}

uint64_t __40__DYReplayController__beginDebugArchive__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "archiveStack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_replayerControllerSupportForCaptureStore:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setReplayControllerSupport:", v4);

  objc_msgSend(*(id *)(a1 + 32), "replayControllerSupport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "archiveStack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createDebugPlaybackEngineWithCaptureStore:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPlaybackEngine:", v7);

  return objc_msgSend(*(id *)(a1 + 32), "_displayPlaybackEngine");
}

- (OS_dispatch_queue)queue
{
  return self->queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->queue, a3);
}

- (DYTransport)transport
{
  return self->transport;
}

- (void)setTransport:(id)a3
{
  objc_storeStrong((id *)&self->transport, a3);
}

- (DYTransportSource)source
{
  return self->source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->source, a3);
}

- (DYTransportMessage)replayMessage
{
  return self->replayMessage;
}

- (void)setReplayMessage:(id)a3
{
  objc_storeStrong((id *)&self->replayMessage, a3);
}

- (id)origSourceMessageHandler
{
  return self->origSourceMessageHandler;
}

- (void)setOrigSourceMessageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (DYCaptureArchiveStack)archiveStack
{
  return self->archiveStack;
}

- (void)setArchiveStack:(id)a3
{
  objc_storeStrong((id *)&self->archiveStack, a3);
}

- (DYPlaybackEngine)playbackEngine
{
  return self->playbackEngine;
}

- (void)setPlaybackEngine:(id)a3
{
  objc_storeStrong((id *)&self->playbackEngine, a3);
}

- (DYReplayControllerSupport)replayControllerSupport
{
  return self->replayControllerSupport;
}

- (void)setReplayControllerSupport:(id)a3
{
  objc_storeStrong((id *)&self->replayControllerSupport, a3);
}

- (NSMutableArray)experiments
{
  return self->experiments;
}

- (void)setExperiments:(id)a3
{
  objc_storeStrong((id *)&self->experiments, a3);
}

- (NSMutableDictionary)profileInfo
{
  return self->profileInfo;
}

- (void)setProfileInfo:(id)a3
{
  objc_storeStrong((id *)&self->profileInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->profileInfo, 0);
  objc_storeStrong((id *)&self->experiments, 0);
  objc_storeStrong((id *)&self->replayControllerSupport, 0);
  objc_storeStrong((id *)&self->playbackEngine, 0);
  objc_storeStrong((id *)&self->archiveStack, 0);
  objc_storeStrong(&self->origSourceMessageHandler, 0);
  objc_storeStrong((id *)&self->replayMessage, 0);
  objc_storeStrong((id *)&self->source, 0);
  objc_storeStrong((id *)&self->transport, 0);
  objc_storeStrong((id *)&self->queue, 0);
  objc_storeStrong((id *)&self->_profileBlockBackgroundQueue, 0);
  objc_storeStrong((id *)&self->_profileBlockQueue, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_messageProcessingQueue, 0);
  objc_storeStrong((id *)&self->_messageLock, 0);
}

@end
