@implementation GTMTLReplayService

- (GTMTLReplayService)initWithContext:(GTMTLReplayClient *)a3
{
  GTMTLReplayService *v4;
  uint64_t v5;
  GTMTLReplayService *v6;
  uint64_t v7;
  GTObservableService *observers;
  apr_pool_t *var0;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GTMTLReplayService;
  v4 = -[GTMTLReplayService init](&v11, "init");
  v6 = v4;
  if (v4)
  {
    v4->_clientContext = a3;
    v7 = objc_opt_new(GTObservableService, v5);
    observers = v6->_observers;
    v6->_observers = (GTObservableService *)v7;

    var0 = a3->var0;
    control = (uint64_t)apr_palloc(var0, 0x48uLL);
    pthread_mutex_init((pthread_mutex_t *)(control + 8), 0);
    *(_QWORD *)control = apr_hash_make(var0);
  }
  return v6;
}

- (BOOL)load:(id)a3 error:(id *)a4
{
  id v6;
  GTMTLReplayClient *clientContext;
  id var0;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  GTMTLReplayClient *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  clientContext = self->_clientContext;
  objc_storeStrong((id *)&self->_gputrace, a3);
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  var0 = clientContext->var7.var0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __33__GTMTLReplayService_load_error___block_invoke;
  v11[3] = &unk_726918;
  v13 = &v15;
  v14 = clientContext;
  v9 = v6;
  v12 = v9;
  objc_msgSend(var0, "addOperationWithBlock:", v11);
  objc_msgSend(clientContext->var7.var0, "waitUntilAllOperationsAreFinished");
  LOBYTE(var0) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)var0;
}

- (void)terminateProcess
{
  GTMTLReplayClient *clientContext;

  clientContext = self->_clientContext;
  if (clientContext && clientContext->var0)
    apr_pool_destroy(clientContext->var0);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &__block_literal_global_26);
}

- (unint64_t)registerObserver:(id)a3
{
  return (unint64_t)-[GTObservableService registerObserver:](self->_observers, "registerObserver:", a3);
}

- (void)deregisterObserver:(unint64_t)a3
{
  -[GTObservableService deregisterObserver:](self->_observers, "deregisterObserver:", a3);
}

- (void)deregisterObserversForConnection:(id)a3 path:(id)a4
{
  -[GTObservableService deregisterObserversForConnection:path:](self->_observers, "deregisterObserversForConnection:path:", a3, a4);
}

- (void)broadcastDisconnect:(id)a3 path:(id)a4
{
  OS_xpc_object *v6;
  OS_xpc_object *v7;
  int v8;
  id v9;

  v9 = a4;
  v6 = (OS_xpc_object *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "connection"));
  v7 = v6;
  if (v6 == self->_terminateConnection)
  {
    v8 = MessagePathEndsWith(self->_terminatePath, v9);

    if (v8)
      -[GTMTLReplayService terminateProcess](self, "terminateProcess");
  }
  else
  {

  }
}

- (void)notifyError:(id)a3
{
  id v4;
  GTObservableService *observers;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  observers = self->_observers;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __34__GTMTLReplayService_notifyError___block_invoke;
  v7[3] = &unk_724A20;
  v8 = v4;
  v6 = v4;
  -[GTObservableService notifyAll:](observers, "notifyAll:", v7);

}

- (id)query:(id)a3
{
  id v4;
  GTReplayerOperationBatch *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  unint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  GTReplayerOperation *v27;
  GTReplayerOperation *v28;
  NSURL *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  unint64_t v33;
  id v34;
  GTReplayerOperation *v35;
  GTReplayerOperation *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  GTReplayerOperation *v40;
  GTReplayerOperation *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  GTReplayerOperation *v45;
  GTReplayerOperation *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  GTReplayerOperation *v50;
  GTReplayerOperation *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  NSURL *v58;
  NSURL *v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  GTReplayerOperation *v63;
  GTReplayerOperation *v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  NSURL *v68;
  GTReplayerOperation *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  GTReplayerOperation *v75;
  id v76;
  id v77;
  NSObject *v78;
  GTReplayerOperation *v79;
  id v81;
  GTMTLReplayService *v82;
  id v83;
  NSObject *group;
  unsigned int v85;
  id v86;
  GTReplayerOperation *v87;
  GTMTLReplayClient *clientContext;
  void *v89;
  _QWORD v90[4];
  NSObject *v91;
  id v92;
  id v93;
  id v94;
  _QWORD v95[4];
  NSURL *v96;
  id v97;
  id v98;
  int v99;
  _QWORD v100[4];
  NSURL *v101;
  id v102;
  int v103;
  _QWORD v104[4];
  NSURL *v105;
  id v106;
  NSObject *v107;
  id v108;
  id v109;
  int v110;
  _QWORD v111[4];
  NSURL *v112;
  GTMTLReplayClient *v113;
  id v114;
  int v115;
  _QWORD v116[4];
  NSURL *v117;
  GTMTLReplayClient *v118;
  id v119;
  int v120;
  _QWORD v121[4];
  NSURL *v122;
  id v123;
  int v124;
  _QWORD v125[4];
  NSURL *v126;
  id v127;
  GTMTLReplayClient *v128;
  unsigned int v129;
  int v130;
  int v131;
  _QWORD v132[4];
  NSURL *v133;
  GTMTLReplayClient *v134;
  id v135;
  id v136;
  int v137;
  NSErrorUserInfoKey v138;
  const __CFString *v139;
  _QWORD v140[4];
  _QWORD v141[4];

  v4 = a3;
  v82 = self;
  clientContext = self->_clientContext;
  v83 = objc_msgSend(v4, "requestID");
  v5 = -[GTReplayerOperationBatch initWithRequestID:]([GTReplayerOperationBatch alloc], "initWithRequestID:", v83);
  group = dispatch_group_create();
  v6 = objc_alloc((Class)NSMutableArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requests"));
  v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requests"));
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v12 = 0;
    do
    {
      v13 = (void *)objc_opt_new(GTReplayResponse, v11);
      objc_msgSend(v8, "setObject:atIndexedSubscript:", v13, v12);

      ++v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requests"));
      v15 = objc_msgSend(v14, "count");

    }
    while ((unint64_t)v15 > v12);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requests"));
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    v18 = 0;
    do
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requests"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", v18));

      v22 = objc_opt_class(GTReplayQueryRasterMap, v21);
      v89 = v20;
      if ((objc_opt_isKindOfClass(v20, v22) & 1) != 0)
      {
        v24 = v20;
        objc_msgSend(v24, "dispatchUID");
        objc_msgSend(v24, "dispatchUID");
        v25 = objc_msgSend(v24, "streamRef");
        v26 = objc_msgSend(v24, "requestID");

        v27 = [GTReplayerOperation alloc];
        v132[0] = _NSConcreteStackBlock;
        v132[1] = 3221225472;
        v132[2] = __28__GTMTLReplayService_query___block_invoke;
        v132[3] = &unk_724A48;
        v134 = clientContext;
        v135 = v25;
        v136 = v26;
        v133 = (NSURL *)v8;
        v137 = v18;
        v28 = -[GTReplayerOperation initWithBatch:withBlock:](v27, "initWithBatch:withBlock:", v5, v132);
        -[GTReplayerOperationBatch addOperation:](v5, "addOperation:", v28);

        v29 = v133;
      }
      else
      {
        v30 = objc_opt_class(GTReplayQueryResourceUsage, v23);
        if ((objc_opt_isKindOfClass(v20, v30) & 1) != 0)
        {
          v32 = v20;
          v85 = objc_msgSend(v32, "dispatchUID");
          v33 = (unint64_t)objc_msgSend(v32, "dispatchUID") >> 32;
          v34 = objc_msgSend(v32, "requestID");

          v35 = [GTReplayerOperation alloc];
          v125[0] = _NSConcreteStackBlock;
          v125[1] = 3221225472;
          v125[2] = __28__GTMTLReplayService_query___block_invoke_2;
          v125[3] = &unk_724A48;
          v127 = v34;
          v128 = clientContext;
          v129 = v85;
          v130 = v33;
          v126 = (NSURL *)v8;
          v131 = v18;
          v36 = -[GTReplayerOperation initWithBatch:withBlock:](v35, "initWithBatch:withBlock:", v5, v125);
          -[GTReplayerOperationBatch addOperation:](v5, "addOperation:", v36);

          v29 = v126;
        }
        else
        {
          v37 = objc_opt_class(GTReplayQueryDeviceCapabilities, v31);
          if ((objc_opt_isKindOfClass(v20, v37) & 1) != 0)
          {
            v39 = objc_msgSend(v20, "requestID");
            v40 = [GTReplayerOperation alloc];
            v121[0] = _NSConcreteStackBlock;
            v121[1] = 3221225472;
            v121[2] = __28__GTMTLReplayService_query___block_invoke_3;
            v121[3] = &unk_724A70;
            v123 = v39;
            v122 = (NSURL *)v8;
            v124 = v18;
            v41 = -[GTReplayerOperation initWithBatch:withBlock:](v40, "initWithBatch:withBlock:", v5, v121);
            -[GTReplayerOperationBatch addOperation:](v5, "addOperation:", v41);

            v29 = v122;
          }
          else
          {
            v42 = objc_opt_class(GTReplayQueryDerivedCounters, v38);
            if ((objc_opt_isKindOfClass(v20, v42) & 1) != 0)
            {
              v44 = objc_msgSend(v20, "requestID");
              v45 = [GTReplayerOperation alloc];
              v116[0] = _NSConcreteStackBlock;
              v116[1] = 3221225472;
              v116[2] = __28__GTMTLReplayService_query___block_invoke_4;
              v116[3] = &unk_724A98;
              v118 = clientContext;
              v119 = v44;
              v117 = (NSURL *)v8;
              v120 = v18;
              v46 = -[GTReplayerOperation initWithBatch:withBlock:](v45, "initWithBatch:withBlock:", v5, v116);
              -[GTReplayerOperationBatch addOperation:](v5, "addOperation:", v46);

              v29 = v117;
            }
            else
            {
              v47 = objc_opt_class(GTReplayQueryPerformanceState, v43);
              if ((objc_opt_isKindOfClass(v20, v47) & 1) != 0)
              {
                v49 = objc_msgSend(v20, "requestID");
                v50 = [GTReplayerOperation alloc];
                v111[0] = _NSConcreteStackBlock;
                v111[1] = 3221225472;
                v111[2] = __28__GTMTLReplayService_query___block_invoke_5;
                v111[3] = &unk_724A98;
                v113 = clientContext;
                v114 = v49;
                v112 = (NSURL *)v8;
                v115 = v18;
                v51 = -[GTReplayerOperation initWithBatch:withBlock:](v50, "initWithBatch:withBlock:", v5, v111);
                -[GTReplayerOperationBatch addOperation:](v5, "addOperation:", v51);

                v29 = v112;
              }
              else
              {
                v52 = objc_opt_class(GTReplayQueryICBTranslation, v48);
                if ((objc_opt_isKindOfClass(v20, v52) & 1) != 0)
                {
                  v54 = v20;
                  v81 = objc_msgSend(v54, "requestID");
                  v86 = objc_msgSend(v54, "dispatchUID");
                  v140[0] = CFSTR("requestID");
                  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v81));
                  v141[0] = v55;
                  v140[1] = CFSTR("functionIndex");
                  v56 = objc_msgSend(v54, "dispatchUID");

                  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v56));
                  v141[1] = v57;
                  v141[2] = &off_7397F0;
                  v140[2] = CFSTR("object");
                  v140[3] = CFSTR("type");
                  v141[3] = &off_739808;
                  v58 = (NSURL *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v141, v140, 4));

                  dispatch_group_enter(group);
                  v104[0] = _NSConcreteStackBlock;
                  v104[1] = 3221225472;
                  v104[2] = __28__GTMTLReplayService_query___block_invoke_61;
                  v104[3] = &unk_724AE0;
                  v105 = v58;
                  v108 = v81;
                  v109 = v86;
                  v106 = v8;
                  v110 = v18;
                  v107 = group;
                  v29 = v58;
                  FetchResourceObject((id *)&clientContext->var0, v29, v104);

                  v59 = v105;
                }
                else
                {
                  v60 = objc_opt_class(GTReplayQueryConfiguration, v53);
                  if ((objc_opt_isKindOfClass(v20, v60) & 1) != 0)
                  {
                    v62 = objc_msgSend(v20, "requestID");
                    v63 = [GTReplayerOperation alloc];
                    v100[0] = _NSConcreteStackBlock;
                    v100[1] = 3221225472;
                    v100[2] = __28__GTMTLReplayService_query___block_invoke_3_73;
                    v100[3] = &unk_724A70;
                    v102 = v62;
                    v101 = (NSURL *)v8;
                    v103 = v18;
                    v64 = -[GTReplayerOperation initWithBatch:withBlock:](v63, "initWithBatch:withBlock:", v5, v100);
                    -[GTReplayerOperationBatch addOperation:](v5, "addOperation:", v64);

                    v29 = v101;
                    goto LABEL_24;
                  }
                  v65 = objc_opt_class(GTReplayQuerySessionInfo, v61);
                  if ((objc_opt_isKindOfClass(v20, v65) & 1) == 0)
                  {
                    v29 = (NSURL *)objc_opt_new(GTReplayResponse, v66);
                    -[NSURL setRequestID:](v29, "setRequestID:", objc_msgSend(v20, "requestID"));
                    v70 = objc_alloc((Class)NSError);
                    v138 = NSLocalizedDescriptionKey;
                    v139 = CFSTR("unknown request");
                    v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v139, &v138, 1));
                    v72 = objc_msgSend(v70, "initWithDomain:code:userInfo:", NSCocoaErrorDomain, 1, v71);
                    -[NSURL setError:](v29, "setError:", v72);

                    objc_msgSend(v8, "setObject:atIndexedSubscript:", v29, v18);
                    goto LABEL_24;
                  }
                  v67 = objc_msgSend(v20, "requestID");
                  v68 = v82->_gputrace;
                  v87 = [GTReplayerOperation alloc];
                  v95[0] = _NSConcreteStackBlock;
                  v95[1] = 3221225472;
                  v95[2] = __28__GTMTLReplayService_query___block_invoke_4_76;
                  v95[3] = &unk_724B08;
                  v96 = v68;
                  v98 = v67;
                  v97 = v8;
                  v99 = v18;
                  v29 = v68;
                  v69 = -[GTReplayerOperation initWithBatch:withBlock:](v87, "initWithBatch:withBlock:", v5, v95);
                  -[GTReplayerOperationBatch addOperation:](v5, "addOperation:", v69);

                  v59 = v96;
                }

              }
            }
          }
        }
      }
LABEL_24:

      ++v18;
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requests"));
      v74 = objc_msgSend(v73, "count");

    }
    while ((unint64_t)v74 > v18);
  }
  v75 = [GTReplayerOperation alloc];
  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472;
  v90[2] = __28__GTMTLReplayService_query___block_invoke_5_80;
  v90[3] = &unk_724B30;
  v91 = group;
  v92 = v8;
  v93 = v4;
  v94 = v83;
  v76 = v4;
  v77 = v8;
  v78 = group;
  v79 = -[GTReplayerOperation initWithBatch:withBlock:](v75, "initWithBatch:withBlock:", v5, v90);
  -[GTReplayerOperationBatch addOperation:](v5, "addOperation:", v79);
  -[GTReplayerOperationBatch finish:](v5, "finish:", clientContext->var7.var0);

  return 0;
}

- (id)fetch:(id)a3
{
  uint64_t v4;
  id v5;
  GTMTLReplayController *var1;
  GTMTLReplayDataSource *var0;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  unsigned int v21;
  unint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  unsigned int v30;
  unint64_t v31;
  _QWORD *Object;
  _QWORD *entry;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  unsigned int v39;
  unint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  unsigned int v49;
  unint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  id v59;
  unsigned int v60;
  unint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  unsigned __int16 *v71;
  int v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  unsigned int v83;
  unint64_t v84;
  unsigned int v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  id v102;
  void *v103;
  id v104;
  id v105;
  void *v106;
  id v107;
  id v108;
  void (**v109)(id, void *);
  void *v110;
  id v111;
  void *v112;
  id v113;
  GTMTLReplayClient *clientContext;
  void *v116;
  void *v117;
  GTMTLReplayDataSource *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  id v126;
  id v127;
  void *v128;
  id v129;
  id obj;
  uint64_t v131;
  _QWORD v132[4];
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  uint64_t v138;
  uint64_t v139;
  id v140;
  uint64_t v141;
  uint64_t v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  NSErrorUserInfoKey v147;
  const __CFString *v148;
  _QWORD v149[4];
  _QWORD v150[4];
  _QWORD v151[4];
  _QWORD v152[4];
  _QWORD v153[5];
  _QWORD v154[5];
  _QWORD v155[5];
  _QWORD v156[5];
  _QWORD v157[7];
  _QWORD v158[7];
  _QWORD v159[3];
  _QWORD v160[3];
  _QWORD v161[11];
  _QWORD v162[11];
  _BYTE v163[128];
  NSErrorUserInfoKey v164;
  const __CFString *v165;

  v5 = a3;
  var1 = self->_clientContext->var1;
  if (!var1 || (var0 = var1->var0) == 0)
  {
    v110 = (void *)objc_opt_new(GTReplayResponse, v4);
    objc_msgSend(v110, "setRequestID:", objc_msgSend(v5, "requestID"));
    v111 = objc_alloc((Class)NSError);
    v164 = NSLocalizedDescriptionKey;
    v165 = CFSTR("Fetch request happened before replayer data source is loaded");
    v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v165, &v164, 1));
    v113 = objc_msgSend(v111, "initWithDomain:code:userInfo:", CFSTR("com.apple.gputools.MTLReplayer"), 104, v112);
    objc_msgSend(v110, "setError:", v113);

    v109 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "completionHandler"));
    v109[2](v109, v110);
    goto LABEL_58;
  }
  clientContext = self->_clientContext;
  v8 = objc_alloc((Class)NSMutableDictionary);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "requests"));
  v127 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  v128 = (void *)objc_opt_new(NSMutableArray, v10);
  v117 = (void *)objc_opt_new(NSMutableArray, v11);
  v143 = 0u;
  v144 = 0u;
  v145 = 0u;
  v146 = 0u;
  v116 = v5;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "requests"));
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v143, v163, 16);
  if (!v12)
    goto LABEL_56;
  v14 = v12;
  v131 = *(_QWORD *)v144;
  v118 = var0;
  do
  {
    v15 = 0;
    v129 = v14;
    do
    {
      if (*(_QWORD *)v144 != v131)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * (_QWORD)v15);
      v17 = objc_opt_class(GTReplayFetchTexture, v13);
      if ((objc_opt_isKindOfClass(v16, v17) & 1) == 0)
      {
        v27 = objc_opt_class(GTReplayFetchBuffer, v18);
        if ((objc_opt_isKindOfClass(v16, v27) & 1) != 0)
        {
          v19 = v16;
          v29 = objc_msgSend(v19, "requestID");
          v140 = 0;
          v140 = objc_msgSend(v19, "streamRef");
          v30 = objc_msgSend(v19, "dispatchUID");
          v31 = (unint64_t)objc_msgSend(v19, "dispatchUID");
          Object = GTMTLSMContext_getObject(*(_QWORD *)var0->var5, (uint64_t)objc_msgSend(v19, "streamRef"), var0->var9.var0.var0 + v30);
          if (Object && *(_DWORD *)Object == 22)
          {
            entry = find_entry((uint64_t)var0->var1, &v140, 8uLL, 0);
            if (*entry)
              v34 = *(_QWORD *)(*entry + 32);
            else
              v34 = 0;
            v90 = v30;
            v157[0] = CFSTR("requestID");
            v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v29, clientContext));
            v158[0] = v91;
            v157[1] = CFSTR("functionIndex");
            v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v31 & 0xFFFFFFFF00000000 | v90));
            v158[1] = v92;
            v157[2] = CFSTR("streamref");
            v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v140));
            v158[2] = v93;
            v157[3] = CFSTR("object");
            v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)(v34 + 8)));
            v158[3] = v94;
            v158[4] = &off_739808;
            v157[4] = CFSTR("type");
            v157[5] = CFSTR("range.location");
            v126 = v29;
            v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v19, "range")));
            v158[5] = v95;
            v157[6] = CFSTR("range.length");
            objc_msgSend(v19, "range");
            v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v96));
            v158[6] = v97;
            v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v158, v157, 7));

            objc_msgSend(v128, "addObject:", v98);
            v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v126));
            objc_msgSend(v127, "setObject:forKeyedSubscript:", v98, v99);

            goto LABEL_47;
          }
          goto LABEL_49;
        }
        v35 = objc_opt_class(GTReplayFetchWireframe, v28);
        if ((objc_opt_isKindOfClass(v16, v35) & 1) != 0)
        {
          v37 = v16;
          v38 = objc_msgSend(v37, "requestID");
          v39 = objc_msgSend(v37, "dispatchUID");
          v40 = (unint64_t)objc_msgSend(v37, "dispatchUID");
          if (objc_msgSend(v37, "solid"))
            v41 = -3;
          else
            v41 = -1;
          v155[0] = CFSTR("requestID");
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v38, clientContext));
          v156[0] = v42;
          v155[1] = CFSTR("functionIndex");
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v40 & 0xFFFFFFFF00000000 | v39));
          v156[1] = v43;
          v155[2] = CFSTR("object");
          v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v41));
          v156[2] = v44;
          v156[3] = &off_739820;
          v155[3] = CFSTR("type");
          v155[4] = CFSTR("resolution");
          v156[4] = &off_738FA0;
          v45 = v156;
          v46 = v155;
LABEL_25:
          v19 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v45, v46, 5, clientContext));

          v14 = v129;
          objc_msgSend(v128, "addObject:", v19);
          v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v38));
          v53 = v127;
          v54 = v19;
          v55 = v52;
        }
        else
        {
          v47 = objc_opt_class(GTReplayFetchImageBlock, v36);
          if ((objc_opt_isKindOfClass(v16, v47) & 1) != 0)
          {
            v37 = v16;
            v38 = objc_msgSend(v37, "requestID");
            v49 = objc_msgSend(v37, "dispatchUID");
            v50 = (unint64_t)objc_msgSend(v37, "dispatchUID");
            v51 = objc_msgSend(v37, "index") - 513;
            v153[0] = CFSTR("requestID");
            v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v38));
            v154[0] = v42;
            v153[1] = CFSTR("functionIndex");
            v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v50 & 0xFFFFFFFF00000000 | v49));
            v154[1] = v43;
            v153[2] = CFSTR("object");
            v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v51));
            v154[2] = v44;
            v154[3] = &off_739820;
            v153[3] = CFSTR("type");
            v153[4] = CFSTR("resolution");
            v154[4] = &off_738FC8;
            v45 = v154;
            v46 = v153;
            goto LABEL_25;
          }
          v56 = objc_opt_class(GTReplayFetchThreadgroup, v48);
          if ((objc_opt_isKindOfClass(v16, v56) & 1) != 0)
          {
            v58 = v16;
            v59 = objc_msgSend(v58, "requestID");
            v60 = objc_msgSend(v58, "dispatchUID");
            v61 = (unint64_t)objc_msgSend(v58, "dispatchUID");
            v62 = objc_msgSend(v58, "index") - 1025;
            v151[0] = CFSTR("requestID");
            v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v59));
            v152[0] = v63;
            v151[1] = CFSTR("functionIndex");
            v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v61 & 0xFFFFFFFF00000000 | v60));
            v152[1] = v64;
            v151[2] = CFSTR("object");
            v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v62));
            v151[3] = CFSTR("type");
            v152[2] = v65;
            v152[3] = &off_739868;
            v19 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v152, v151, 4));

            objc_msgSend(v128, "addObject:", v19);
            v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v59));
            objc_msgSend(v127, "setObject:forKeyedSubscript:", v19, v66);

            goto LABEL_48;
          }
          v80 = objc_opt_class(GTReplayFetchPostVertex, v57);
          if ((objc_opt_isKindOfClass(v16, v80) & 1) == 0)
          {
            v19 = (id)objc_opt_new(GTReplayResponse, v81);
            objc_msgSend(v19, "setRequestID:", objc_msgSend(v16, "requestID", clientContext));
            v100 = objc_alloc((Class)NSError);
            v147 = NSLocalizedDescriptionKey;
            v148 = CFSTR("unknown request");
            v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1));
            v102 = objc_msgSend(v100, "initWithDomain:code:userInfo:", NSCocoaErrorDomain, 1, v101);
            objc_msgSend(v19, "setError:", v102);

            objc_msgSend(v117, "addObject:", v19);
            goto LABEL_48;
          }
          v19 = v16;
          v82 = objc_msgSend(v19, "requestID");
          v83 = objc_msgSend(v19, "dispatchUID");
          v84 = (unint64_t)objc_msgSend(v19, "dispatchUID");
          v85 = objc_msgSend(v19, "objectShaderThreadgroupBoundsPresent");
          v149[0] = CFSTR("requestID");
          v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v82));
          v150[0] = v86;
          v149[1] = CFSTR("functionIndex");
          v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v84 & 0xFFFFFFFF00000000 | v83));
          v150[1] = v87;
          v149[2] = CFSTR("object");
          v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -1026));
          v149[3] = CFSTR("type");
          v150[2] = v88;
          v150[3] = &off_739808;
          v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v150, v149, 4));
          v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v89));

          var0 = v118;
          v14 = v129;
          if (v85)
          {
            v140 = 0;
            v141 = 0;
            v142 = 0;
            if (v19)
            {
              objc_msgSend(v19, "objectShaderThreadgroupBeginBounds");
              v137 = 0;
              v138 = 0;
              v139 = 0;
              objc_msgSend(v19, "objectShaderThreadgroupEndBounds");
            }
            else
            {
              v137 = 0;
              v138 = 0;
              v139 = 0;
            }
            v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data", clientContext));
            objc_msgSend(v103, "appendBytes:length:", &v140, 12);
            objc_msgSend(v103, "appendBytes:length:", &v137, 12);
            v104 = objc_msgSend(v103, "copy");
            objc_msgSend(v52, "setObject:forKeyedSubscript:", v104, CFSTR("objectThreadgroupRange"));

          }
          objc_msgSend(v128, "addObject:", v52, clientContext);
          v37 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v82));
          v53 = v127;
          v54 = v52;
          v55 = v37;
        }
        objc_msgSend(v53, "setObject:forKeyedSubscript:", v54, v55);

        goto LABEL_49;
      }
      v19 = v16;
      v20 = objc_msgSend(v19, "requestID");
      v137 = 0;
      v137 = objc_msgSend(v19, "streamRef");
      v21 = objc_msgSend(v19, "dispatchUID");
      v22 = (unint64_t)objc_msgSend(v19, "dispatchUID");
      v23 = GTMTLSMContext_getObject(*(_QWORD *)var0->var5, (uint64_t)objc_msgSend(v19, "streamRef"), var0->var9.var0.var0 + v21);
      if (v23)
      {
        v24 = v23;
        if (*(_DWORD *)v23 == 80)
        {
          v25 = find_entry((uint64_t)var0->var1, &v137, 8uLL, 0);
          if (*v25)
            v26 = *(_QWORD *)(*v25 + 32);
          else
            v26 = 0;
          v140 = 0;
          v141 = 0;
          v142 = 0;
          if (v19)
            objc_msgSend(v19, "size");
          v161[0] = CFSTR("requestID");
          v125 = v20;
          v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v20, clientContext));
          v162[0] = v124;
          v161[1] = CFSTR("functionIndex");
          v123 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v22 & 0xFFFFFFFF00000000 | v21));
          v162[1] = v123;
          v161[2] = CFSTR("streamref");
          v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v137));
          v162[2] = v122;
          v161[3] = CFSTR("object");
          v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)(v26 + 8)));
          v162[3] = v121;
          v162[4] = &off_739820;
          v161[4] = CFSTR("type");
          v161[5] = CFSTR("DependencyGraphRequestedTextureLevel");
          v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v19, "level")));
          v162[5] = v120;
          v161[6] = CFSTR("DependencyGraphRequestedTextureSlice");
          v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v19, "slice")));
          v162[6] = v119;
          v161[7] = CFSTR("DependencyGraphRequestedTextureDepthPlane");
          v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v19, "depth")));
          v162[7] = v67;
          v161[8] = CFSTR("DependencyGraphRequestedTextureAttachmentIndex");
          v68 = objc_msgSend(v19, "plane");
          v69 = (uint64_t)v68;
          v70 = v24[13];
          if (v70)
            v71 = (unsigned __int16 *)(v70 + 34);
          else
            v71 = (unsigned __int16 *)(v24 + 19);
          v72 = *v71;
          if (v72 == 260 || v72 == 255)
          {
            if ((_DWORD)v68)
              v69 = 9;
            else
              v69 = 8;
          }
          v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v69));
          v162[8] = v73;
          v161[9] = CFSTR("resolveMultisampleTexture");
          v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v19, "resolveMultisampleTexture")));
          v162[9] = v74;
          v161[10] = CFSTR("resolution");
          v159[0] = CFSTR("width");
          v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v140));
          v160[0] = v75;
          v159[1] = CFSTR("height");
          v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v141));
          v159[2] = CFSTR("format");
          v160[1] = v76;
          v160[2] = &off_739838;
          v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v160, v159, 3));
          v162[10] = v77;
          v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v162, v161, 11));

          objc_msgSend(v128, "addObject:", v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v125));
          objc_msgSend(v127, "setObject:forKeyedSubscript:", v78, v79);

LABEL_47:
          var0 = v118;
LABEL_48:
          v14 = v129;
        }
      }
LABEL_49:

      v15 = (char *)v15 + 1;
    }
    while (v14 != v15);
    v105 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v143, v163, 16);
    v14 = v105;
  }
  while (v105);
LABEL_56:

  v5 = v116;
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "completionHandler"));
  v132[0] = _NSConcreteStackBlock;
  v132[1] = 3221225472;
  v132[2] = __28__GTMTLReplayService_fetch___block_invoke;
  v132[3] = &unk_724B58;
  v133 = v116;
  v134 = v127;
  v135 = v117;
  v136 = v106;
  v107 = v117;
  v108 = v127;
  v109 = v106;
  v110 = v128;
  FetchResourceObjectBatch((uint64_t)clientContext, v128, 0, v132);

LABEL_58:
  return 0;
}

- (void)display:(id)a3
{
  id v4;
  void *v5;
  GTMTLReplayClient *clientContext;
  id var0;
  _QWORD v8[4];
  id v9;
  GTMTLReplayClient *v10;

  v4 = a3;
  v5 = v4;
  clientContext = self->_clientContext;
  if (clientContext->var9 && (dword_75313C & 0x20) == 0 && clientContext->var1)
  {
    var0 = clientContext->var7.var0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __30__GTMTLReplayService_display___block_invoke;
    v8[3] = &unk_726378;
    v10 = clientContext;
    v9 = v4;
    objc_msgSend(var0, "addOperationWithBlock:", v8);

  }
}

- (id)update:(id)a3
{
  uint64_t v4;
  id v5;
  void **p_var0;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  GTMTLReplayController *var1;
  id *p_var6;
  NSObject *var6;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  GTReplayerOperation *v43;
  GTReplayerOperation *v44;
  uint64_t v45;
  uint64_t v46;
  GTReplayerOperation *v47;
  GTReplayerOperation *v48;
  id v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  void *v55;
  BOOL v56;
  GTReplayerOperation *v57;
  id v58;
  id v59;
  GTReplayerOperation *v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  _BOOL4 v68;
  uint64_t v69;
  OS_xpc_object *terminateConnection;
  OS_xpc_object *v71;
  OS_xpc_object *terminatePath;
  uint64_t v73;
  uint64_t v74;
  OS_xpc_object *v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  void *v82;
  id v83;
  uint64_t v84;
  GTReplayerOperation *v85;
  id v86;
  id v87;
  GTReplayerOperation *v88;
  void *v90;
  GTMTLReplayService *val;
  void *v92;
  GTReplayerOperationBatch *v93;
  void *v94;
  GTMTLReplayClient *clientContext;
  _QWORD v96[4];
  id v97;
  id v98;
  _QWORD v99[4];
  id v100;
  id v101;
  id v102;
  int v103;
  BOOL v104;
  _QWORD v105[4];
  id v106;
  id v107;
  id v108[3];
  int v109;
  id location;
  _QWORD v111[4];
  id v112;
  id v113;
  id v114;
  void *v115;
  GTMTLReplayClient *v116;
  int v117;
  id v118;
  NSErrorUserInfoKey v119;
  const __CFString *v120;
  NSErrorUserInfoKey v121;
  const __CFString *v122;
  NSErrorUserInfoKey v123;
  const __CFString *v124;
  NSErrorUserInfoKey v125;
  const __CFString *v126;

  v5 = a3;
  val = self;
  clientContext = self->_clientContext;
  p_var0 = (void **)&clientContext->var1->var0;
  if (p_var0)
    v92 = *p_var0;
  else
    v92 = 0;
  v90 = (void *)objc_opt_new(NSMutableArray, v4);
  v93 = -[GTReplayerOperationBatch initWithRequestID:]([GTReplayerOperationBatch alloc], "initWithRequestID:", objc_msgSend(v5, "requestID"));
  v94 = (void *)objc_opt_new(NSMutableDictionary, v7);
  v8 = objc_alloc((Class)NSMutableArray);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "requests"));
  v10 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "requests"));
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v14 = 0;
    do
    {
      v15 = (void *)objc_opt_new(GTReplayResponse, v13);
      objc_msgSend(v10, "setObject:atIndexedSubscript:", v15, v14);

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "requests"));
      ++v14;
      v17 = objc_msgSend(v16, "count");

    }
    while ((unint64_t)v17 > v14);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "requests"));
  v19 = objc_msgSend(v18, "count");

  if (v19)
  {
    v20 = 0;
    while (1)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "requests"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", v20));

      v24 = objc_opt_class(GTReplayUpdateAccelerationStructureSession, v23);
      if ((objc_opt_isKindOfClass(v22, v24) & 1) == 0)
      {
        v38 = objc_opt_class(GTReplayUpdateLibraryCache, v25);
        if ((objc_opt_isKindOfClass(v22, v38) & 1) != 0)
        {
          v40 = v22;
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "data"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "uuid"));
          objc_msgSend(v94, "setObject:forKeyedSubscript:", v41, v42);

          if (objc_msgSend(v94, "count") == (char *)&dword_0 + 1)
          {
            v43 = [GTReplayerOperation alloc];
            v111[0] = _NSConcreteStackBlock;
            v111[1] = 3221225472;
            v111[2] = __29__GTMTLReplayService_update___block_invoke;
            v111[3] = &unk_724B80;
            v115 = v92;
            v112 = v94;
            v116 = clientContext;
            v113 = v40;
            v114 = v10;
            v117 = v20;
            v44 = -[GTReplayerOperation initWithBatch:withBlock:](v43, "initWithBatch:withBlock:", v93, v111);
            -[GTReplayerOperationBatch addOperation:](v93, "addOperation:", v44);

          }
        }
        else
        {
          v45 = objc_opt_class(GTReplayUpdateLibrary, v39);
          if ((objc_opt_isKindOfClass(v22, v45) & 1) != 0)
          {
            if (v92)
            {
              objc_initWeak(&location, val);
              v47 = [GTReplayerOperation alloc];
              v105[0] = _NSConcreteStackBlock;
              v105[1] = 3221225472;
              v105[2] = __29__GTMTLReplayService_update___block_invoke_2;
              v105[3] = &unk_724BA8;
              objc_copyWeak(v108, &location);
              v106 = v22;
              v108[1] = v92;
              v108[2] = clientContext;
              v107 = v10;
              v109 = v20;
              v48 = -[GTReplayerOperation initWithBatch:withBlock:](v47, "initWithBatch:withBlock:", v93, v105);
              -[GTReplayerOperationBatch addOperation:](v93, "addOperation:", v48);

              objc_destroyWeak(v108);
              objc_destroyWeak(&location);
            }
            else
            {
              v76 = (void *)objc_opt_new(GTReplayResponse, v46);
              objc_msgSend(v76, "setRequestID:", objc_msgSend(v22, "requestID"));
              v77 = objc_alloc((Class)NSError);
              v121 = NSLocalizedDescriptionKey;
              v122 = CFSTR("Update request happened before replayer data source is loaded");
              v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v122, &v121, 1));
              v79 = objc_msgSend(v77, "initWithDomain:code:userInfo:", CFSTR("com.apple.gputools.MTLReplayer"), 104, v78);
              objc_msgSend(v76, "setError:", v79);

              objc_msgSend(v10, "setObject:atIndexedSubscript:", v76, v20);
            }
          }
          else
          {
            v52 = objc_opt_class(GTReplayUpdateConfiguration, v46);
            if ((objc_opt_isKindOfClass(v22, v52) & 1) != 0)
            {
              v54 = v22;
              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "configuration"));
              objc_msgSend(v54, "requestID");
              v56 = val->_gputrace != 0;
              v57 = [GTReplayerOperation alloc];
              v99[0] = _NSConcreteStackBlock;
              v99[1] = 3221225472;
              v99[2] = __29__GTMTLReplayService_update___block_invoke_3;
              v99[3] = &unk_724BD0;
              v104 = v56;
              v100 = v55;
              v101 = v54;
              v102 = v10;
              v103 = v20;
              v58 = v54;
              v59 = v55;
              v60 = -[GTReplayerOperation initWithBatch:withBlock:](v57, "initWithBatch:withBlock:", v93, v99);
              -[GTReplayerOperationBatch addOperation:](v93, "addOperation:", v60);

            }
            else
            {
              v65 = objc_opt_class(GTReplayUpdateTermination, v53);
              if ((objc_opt_isKindOfClass(v22, v65) & 1) != 0)
              {
                v67 = v22;
                v68 = val->_terminateConnection == 0;
                v69 = objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "connection"));
                terminateConnection = val->_terminateConnection;
                val->_terminateConnection = (OS_xpc_object *)v69;

                if (v68)
                {
                  v84 = objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "path"));
                  terminatePath = val->_terminatePath;
                  val->_terminatePath = (OS_xpc_object *)v84;
                }
                else
                {
                  v71 = val->_terminatePath;
                  terminatePath = (OS_xpc_object *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "path"));
                  v73 = MessagePathMerge(v71, terminatePath);
                  v74 = objc_claimAutoreleasedReturnValue(v73);
                  v75 = val->_terminatePath;
                  val->_terminatePath = (OS_xpc_object *)v74;

                }
              }
              else
              {
                v80 = (void *)objc_opt_new(GTReplayResponse, v66);
                objc_msgSend(v80, "setRequestID:", objc_msgSend(v22, "requestID"));
                v81 = objc_alloc((Class)NSError);
                v119 = NSLocalizedDescriptionKey;
                v120 = CFSTR("unknown request");
                v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1));
                v83 = objc_msgSend(v81, "initWithDomain:code:userInfo:", NSCocoaErrorDomain, 1, v82);
                objc_msgSend(v80, "setError:", v83);

                objc_msgSend(v10, "setObject:atIndexedSubscript:", v80, v20);
              }
            }
          }
        }
        goto LABEL_25;
      }
      v26 = v22;
      v28 = (void *)objc_opt_new(GTReplayResponse, v27);
      objc_msgSend(v28, "setRequestID:", objc_msgSend(v26, "requestID"));
      var1 = clientContext->var1;
      if (!var1)
        break;
      var6 = var1->var6;
      p_var6 = &var1->var6;
      dispatch_semaphore_wait(var6, 0xFFFFFFFFFFFFFFFFLL);
      v32 = p_var6[1];
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v26, "sessionsID")));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKey:", v33));

      dispatch_semaphore_signal((dispatch_semaphore_t)*p_var6);
      if (!v34)
      {
        v61 = objc_alloc((Class)NSError);
        v123 = NSLocalizedDescriptionKey;
        v124 = CFSTR("ASV viewer session does not exist");
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1));
        v51 = objc_msgSend(v61, "initWithDomain:code:userInfo:", NSCocoaErrorDomain, 1, v50);
        goto LABEL_24;
      }
      v118 = 0;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", &__kCFBooleanTrue, 1, &v118));
      v36 = v118;
      objc_msgSend(v28, "setData:", v35);

      objc_msgSend(v28, "setError:", v36);
      objc_msgSend(v10, "setObject:atIndexedSubscript:", v28, v20);
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "data"));

      objc_msgSend(v34, "receiveData:", v37);
LABEL_25:

      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "requests"));
      v64 = objc_msgSend(v63, "count");

      if ((unint64_t)v64 <= ++v20)
        goto LABEL_34;
    }
    v49 = objc_alloc((Class)NSError);
    v125 = NSLocalizedDescriptionKey;
    v126 = CFSTR("Update request happened before replayer data source is loaded");
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1));
    v51 = objc_msgSend(v49, "initWithDomain:code:userInfo:", CFSTR("com.apple.gputools.MTLReplayer"), 104, v50);
LABEL_24:
    v62 = v51;
    objc_msgSend(v28, "setError:", v51);

    objc_msgSend(v10, "setObject:atIndexedSubscript:", v28, v20);
    goto LABEL_25;
  }
LABEL_34:
  v85 = [GTReplayerOperation alloc];
  v96[0] = _NSConcreteStackBlock;
  v96[1] = 3221225472;
  v96[2] = __29__GTMTLReplayService_update___block_invoke_4;
  v96[3] = &unk_724BF8;
  v97 = v10;
  v98 = v5;
  v86 = v5;
  v87 = v10;
  v88 = -[GTReplayerOperation initWithBatch:withBlock:](v85, "initWithBatch:withBlock:", v93, v96);
  -[GTReplayerOperationBatch addOperation:](v93, "addOperation:", v88);
  -[GTReplayerOperationBatch finish:](v93, "finish:", clientContext->var7.var0);

  return 0;
}

- (id)decode:(id)a3
{
  uint64_t v4;
  id v5;
  GTMTLReplayController *var1;
  uint64_t v7;
  id v8;
  id v9;
  const CATransform3D **v10;
  const CATransform3D **v11;
  uint64_t v12;
  const CATransform3D **v13;
  void *i;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  unsigned int v21;
  unint64_t v22;
  _QWORD *Object;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  unint64_t v32;
  unsigned __int16 v33;
  unint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  void (**v44)(id, void *);
  void *v45;
  id v46;
  void *v47;
  id v48;
  GTMTLReplayClient *clientContext;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id obj;
  GTMTLReplayDataSource *var0;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  NSErrorUserInfoKey v65;
  const __CFString *v66;
  _QWORD v67[4];
  _QWORD v68[4];
  _QWORD v69[4];
  _QWORD v70[4];
  _BYTE v71[128];
  NSErrorUserInfoKey v72;
  const __CFString *v73;

  v5 = a3;
  var1 = self->_clientContext->var1;
  if (var1)
  {
    clientContext = self->_clientContext;
    var0 = var1->var0;
    v53 = (void *)objc_opt_new(NSMutableArray, v4);
    v54 = (void *)objc_opt_new(NSMutableArray, v7);
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v51 = v5;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "requests"));
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
    if (v8)
    {
      v9 = v8;
      v10 = &CATransform3DIdentity_ptr;
      v11 = &CATransform3DIdentity_ptr;
      v12 = *(_QWORD *)v62;
      v13 = &CATransform3DIdentity_ptr;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v62 != v12)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
          v16 = objc_alloc_init((Class)v10[283]);
          v18 = objc_opt_class(v11[155], v17);
          if ((objc_opt_isKindOfClass(v15, v18) & 1) != 0)
          {
            v20 = v15;
            v60 = 0;
            v60 = objc_msgSend(v20, "streamRef");
            v21 = objc_msgSend(v20, "dispatchUID");
            v22 = (unint64_t)objc_msgSend(v20, "dispatchUID");
            Object = GTMTLSMContext_getObject(*(_QWORD *)var0->var5, (uint64_t)v60, var0->var9.var0.var0 + v21);
            if (Object && *(_DWORD *)Object == 57)
            {
              v24 = v21;
              find_entry((uint64_t)var0->var1, &v60, 8uLL, 0);
              v69[0] = CFSTR("requestID");
              v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v20, "requestID")));
              v70[0] = v25;
              v69[1] = CFSTR("functionIndex");
              v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v22 & 0xFFFFFFFF00000000 | v24));
              v70[1] = v26;
              v69[2] = CFSTR("streamref");
              v13 = &CATransform3DIdentity_ptr;
              v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v60));
              v69[3] = CFSTR("type");
              v70[2] = v27;
              v70[3] = &off_739880;
              v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v70, v69, 4));
              objc_msgSend(v53, "addObject:", v28);

              v11 = &CATransform3DIdentity_ptr;
              v10 = &CATransform3DIdentity_ptr;

            }
          }
          else
          {
            v29 = objc_opt_class(v13[154], v19);
            if ((objc_opt_isKindOfClass(v15, v29) & 1) != 0)
            {
              v20 = v15;
              v31 = objc_msgSend(v20, "dispatchUID");
              v32 = (unint64_t)objc_msgSend(v20, "dispatchUID");
              v33 = (unsigned __int16)objc_msgSend(v20, "type") - 1;
              if (v33 <= 7u && ((0xC7u >> v33) & 1) != 0)
              {
                v34 = v32 & 0xFFFFFFFF00000000;
                v35 = qword_4A8598[v33];
                v52 = v35 + objc_msgSend(v20, "index");
                v67[0] = CFSTR("requestID");
                v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v20, "requestID")));
                v68[0] = v36;
                v67[1] = CFSTR("functionIndex");
                v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v34 | v31));
                v68[1] = v37;
                v67[2] = CFSTR("object");
                v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v52));
                v67[3] = CFSTR("type");
                v68[2] = v38;
                v68[3] = &off_739808;
                v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v68, v67, 4));
                v13 = &CATransform3DIdentity_ptr;
                objc_msgSend(v53, "addObject:", v39);

                v10 = &CATransform3DIdentity_ptr;
                v11 = &CATransform3DIdentity_ptr;

              }
            }
            else
            {
              v20 = (id)objc_opt_new(GTReplayResponse, v30);
              objc_msgSend(v20, "setRequestID:", objc_msgSend(v15, "requestID", clientContext));
              v40 = objc_alloc((Class)NSError);
              v65 = NSLocalizedDescriptionKey;
              v66 = CFSTR("unknown request");
              v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1));
              v42 = objc_msgSend(v40, "initWithDomain:code:userInfo:", NSCocoaErrorDomain, 1, v41);
              objc_msgSend(v20, "setError:", v42);

              v10 = &CATransform3DIdentity_ptr;
              v11 = &CATransform3DIdentity_ptr;
              objc_msgSend(v54, "addObject:", v20);
            }
          }

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
      }
      while (v9);
    }

    v5 = v51;
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = __29__GTMTLReplayService_decode___block_invoke;
    v57[3] = &unk_724C20;
    v58 = v54;
    v59 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "completionHandler"));
    v43 = v59;
    v44 = v54;
    FetchResourceObjectBatch((uint64_t)clientContext, v53, 0, v57);

  }
  else
  {
    v45 = (void *)objc_opt_new(GTReplayResponse, v4);
    objc_msgSend(v45, "setRequestID:", objc_msgSend(v5, "requestID"));
    v46 = objc_alloc((Class)NSError);
    v72 = NSLocalizedDescriptionKey;
    v73 = CFSTR("Decode request happened before replayer data source is loaded");
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1));
    v48 = objc_msgSend(v46, "initWithDomain:code:userInfo:", CFSTR("com.apple.gputools.MTLReplayer"), 104, v47);
    objc_msgSend(v45, "setError:", v48);

    v44 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "completionHandler"));
    v53 = v45;
    v44[2](v44, v45);
  }

  return 0;
}

- (BOOL)cancel:(unint64_t)a3
{
  uint64_t Operation;

  Operation = GTCoreOperationControl_getOperation(a3);
  if (Operation)
    *(_BYTE *)(Operation + 24) = 1;
  return Operation != 0;
}

- (BOOL)pause:(unint64_t)a3
{
  uint64_t Operation;
  void (*v4)(void);

  Operation = GTCoreOperationControl_getOperation(a3);
  if (Operation)
  {
    v4 = *(void (**)(void))(Operation + 8);
    if (v4)
    {
      v4();
      LOBYTE(Operation) = 1;
    }
    else
    {
      LOBYTE(Operation) = 0;
    }
  }
  return Operation;
}

- (BOOL)resume:(unint64_t)a3
{
  uint64_t Operation;
  void (*v4)(void);

  Operation = GTCoreOperationControl_getOperation(a3);
  if (Operation)
  {
    v4 = *(void (**)(void))(Operation + 16);
    if (v4)
    {
      v4();
      LOBYTE(Operation) = 1;
    }
    else
    {
      LOBYTE(Operation) = 0;
    }
  }
  return Operation;
}

- (id)profile:(id)a3
{
  id v4;
  id v5;
  GTReplayerOperationBatch *v6;
  void *v7;
  id v8;
  void *v9;
  io_registry_entry_t v10;
  id MetalPluginName;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSSet *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  char isAGX;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  GTReplayerOperation *v42;
  GTReplayerOperation *v43;
  _QWORD *v44;
  GTReplayerOperation *v45;
  uint64_t v46;
  uint64_t v47;
  GTReplayerOperation *v48;
  GTReplayerOperation *v49;
  GTReplayerOperation *v50;
  GTReplayerOperation *v51;
  id *v52;
  id *v53;
  uint64_t v55;
  GTReplayerOperation *v56;
  id *v57;
  id *v58;
  GTReplayerOperation *v59;
  _QWORD *v60;
  GTReplayerOperation *v61;
  GTReplayerOperation *v62;
  GTReplayerOperation *v63;
  uint64_t Operation;
  uint64_t v65;
  void *v66;
  GTMTLReplayClient *clientContext;
  GTReplayerOperationBatch *v68;
  _QWORD v69[4];
  id v70;
  id v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[2];
  _QWORD v75[4];
  GTReplayerOperation *v76;
  id v77;
  GTMTLReplayClient *v78;
  char v79;
  _QWORD v80[9];
  _QWORD v81[8];
  _QWORD v82[7];
  _QWORD v83[7];
  id v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  int v91[3];

  v4 = a3;
  v5 = objc_msgSend(v4, "requestID");
  v6 = -[GTReplayerOperationBatch initWithRequestID:]([GTReplayerOperationBatch alloc], "initWithRequestID:", v5);
  clientContext = self->_clientContext;
  v68 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(clientContext->var1->var1, "defaultDevice"));
  v8 = DEVICEOBJECT(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_msgSend(v9, "acceleratorPort");

  v91[0] = 0x7FFFFFFF;
  v85 = 0;
  v86 = &v85;
  v87 = 0x3032000000;
  v88 = __Block_byref_object_copy__706;
  v89 = __Block_byref_object_dispose__707;
  MetalPluginName = GetMetalPluginName(v10, v91);
  v90 = (id)objc_claimAutoreleasedReturnValue(MetalPluginName);
  IsAGXMetalPlugin((void *)v86[5], v12);
  v65 = (uint64_t)v5;
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "streamHandler"));
  v14 = objc_opt_class(NSNumber, v13);
  v16 = objc_opt_class(NSString, v15);
  v18 = objc_opt_class(NSArray, v17);
  v20 = objc_opt_class(NSMutableArray, v19);
  v22 = objc_opt_class(NSDictionary, v21);
  v24 = objc_opt_class(NSMutableDictionary, v23);
  v26 = objc_opt_class(NSData, v25);
  v28 = objc_opt_class(NSSet, v27);
  v30 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, v16, v18, v20, v22, v24, v26, v28, objc_opt_class(NSMutableSet, v29), 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "profileData"));
  v84 = 0;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v31, v32, &v84));
  v34 = v84;

  objc_msgSend(v33, "setObject:forKeyedSubscript:", v86[5], CFSTR("MetalPluginName"));
  if (v91[0] != 0x7FFFFFFF)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v35, CFSTR("gpuTarget"));

  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(clientContext->var1->var1, "defaultDevice"));
  v37 = GTDeviceCapabilities_fromDevice();

  isAGX = GTDeviceCapabilities_isAGX(v37);
  v40 = objc_opt_class(GTReplayProfileTimeline, v39);
  if ((objc_opt_isKindOfClass(v4, v40) & 1) != 0)
  {
    v42 = (GTReplayerOperation *)v4;
    if ((isAGX & 1) != 0)
    {
      if ((GTDeviceCapabilities_isAGX1(v37) & 1) != 0 || GTDeviceCapabilities_isAGX2(v37))
      {
        if ((-[GTReplayerOperation shaderProfiling](v42, "shaderProfiling") & 1) != 0
          || GTDeviceCapabilities_isAGX1(v37))
        {
          v43 = [GTReplayerOperation alloc];
          v82[0] = _NSConcreteStackBlock;
          v82[1] = 3221225472;
          v82[2] = __30__GTMTLReplayService_profile___block_invoke_2;
          v82[3] = &unk_724C48;
          v82[6] = clientContext;
          v44 = v82;
          v82[4] = v33;
          v82[5] = v66;
          v45 = -[GTReplayerOperation initWithBatch:withBlock:](v43, "initWithBatch:withBlock:", v68, v82);
LABEL_13:
          v51 = v45;
          v52 = (id *)(v44 + 4);
          v53 = (id *)(v44 + 5);
LABEL_14:

LABEL_15:
          -[GTReplayerOperationBatch addOperation:](v68, "addOperation:", v51);

          goto LABEL_16;
        }
        v62 = [GTReplayerOperation alloc];
        v81[0] = _NSConcreteStackBlock;
        v81[1] = 3221225472;
        v81[2] = __30__GTMTLReplayService_profile___block_invoke_4;
        v81[3] = &unk_724C70;
        v81[6] = v65;
        v60 = v81;
        v81[5] = v66;
        v81[7] = clientContext;
        v81[4] = v33;
        v61 = -[GTReplayerOperation initWithBatch:withBlock:](v62, "initWithBatch:withBlock:", v68, v81);
      }
      else
      {
        if (!GTDeviceCapabilities_isAGX3(v37))
        {
          v51 = 0;
          goto LABEL_15;
        }
        v59 = [GTReplayerOperation alloc];
        v80[0] = _NSConcreteStackBlock;
        v80[1] = 3221225472;
        v80[2] = __30__GTMTLReplayService_profile___block_invoke_6;
        v80[3] = &unk_724C98;
        v80[7] = v65;
        v60 = v80;
        v80[5] = v66;
        v80[8] = clientContext;
        v80[4] = v33;
        v80[6] = &v85;
        v61 = -[GTReplayerOperation initWithBatch:withBlock:](v59, "initWithBatch:withBlock:", v68, v80);
      }
      v51 = v61;
      v52 = (id *)(v60 + 5);
      v53 = (id *)(v60 + 4);
      goto LABEL_14;
    }
    v50 = [GTReplayerOperation alloc];
    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472;
    v83[2] = __30__GTMTLReplayService_profile___block_invoke;
    v83[3] = &unk_724C48;
    v83[6] = clientContext;
    v44 = v83;
    v83[4] = v33;
    v83[5] = v66;
    v45 = -[GTReplayerOperation initWithBatch:withBlock:](v50, "initWithBatch:withBlock:", v68, v83);
    goto LABEL_13;
  }
  v46 = objc_opt_class(GTReplayProfileDerivedCounters, v41);
  if ((objc_opt_isKindOfClass(v4, v46) & 1) != 0)
  {
    v48 = [GTReplayerOperation alloc];
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = __30__GTMTLReplayService_profile___block_invoke_8;
    v75[3] = &unk_724CC0;
    v79 = isAGX;
    v78 = clientContext;
    v76 = v33;
    v77 = v66;
    v49 = -[GTReplayerOperation initWithBatch:withBlock:](v48, "initWithBatch:withBlock:", v68, v75);
    -[GTReplayerOperationBatch addOperation:](v68, "addOperation:", v49);

    v42 = v76;
  }
  else
  {
    v55 = objc_opt_class(GTReplayProfileBatchFilteredCounters, v47);
    if ((objc_opt_isKindOfClass(v4, v55) & 1) == 0)
      goto LABEL_17;
    if (objc_msgSend(v4, "priority"))
    {
      v56 = [GTReplayerOperation alloc];
      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472;
      v69[2] = __30__GTMTLReplayService_profile___block_invoke_11;
      v69[3] = &unk_724D10;
      v70 = v33;
      v71 = v66;
      v42 = -[GTReplayerOperation initWithBatch:withBlock:](v56, "initWithBatch:withBlock:", v68, v69);
      v57 = &v70;
      v58 = &v71;
    }
    else
    {
      v63 = [GTReplayerOperation alloc];
      v72[0] = _NSConcreteStackBlock;
      v72[1] = 3221225472;
      v72[2] = __30__GTMTLReplayService_profile___block_invoke_9;
      v72[3] = &unk_724C48;
      v74[1] = clientContext;
      v73 = v33;
      v74[0] = v66;
      v42 = -[GTReplayerOperation initWithBatch:withBlock:](v63, "initWithBatch:withBlock:", v68, v72);
      Operation = GTCoreOperationControl_getOperation(v65);
      v57 = &v73;
      v58 = (id *)v74;
      *(_QWORD *)(Operation + 8) = BatchFilteredPause;
      *(_QWORD *)(Operation + 16) = BatchFilteredResume;
    }

    -[GTReplayerOperationBatch addOperation:](v68, "addOperation:", v42);
  }
LABEL_16:

LABEL_17:
  -[GTReplayerOperationBatch flush:](v68, "flush:", clientContext->var7.var1);

  _Block_object_dispose(&v85, 8);
  return 0;
}

- (id)shaderdebug:(id)a3
{
  id v4;
  GTMTLReplayClient *clientContext;
  id var0;
  id v7;
  _QWORD v9[4];
  id v10;
  GTMTLReplayClient *v11;

  v4 = a3;
  clientContext = self->_clientContext;
  var0 = clientContext->var7.var0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __34__GTMTLReplayService_shaderdebug___block_invoke;
  v9[3] = &unk_726378;
  v10 = v4;
  v11 = clientContext;
  v7 = v4;
  objc_msgSend(var0, "addOperationWithBlock:", v9);

  return 0;
}

- (id)raytrace:(id)a3
{
  GTMTLReplayClient *clientContext;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id var0;
  id v10;
  _QWORD v12[4];
  id v13;
  GTMTLReplayClient *v14;
  id v15;
  id v16;
  id v17;

  clientContext = self->_clientContext;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "streamHandler"));
  v6 = objc_msgSend(v4, "dispatchUID");
  v7 = objc_msgSend(v4, "streamRef");
  v8 = objc_msgSend(v4, "requestID");

  var0 = clientContext->var7.var0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __31__GTMTLReplayService_raytrace___block_invoke;
  v12[3] = &unk_724D88;
  v15 = v6;
  v16 = v8;
  v13 = v5;
  v14 = clientContext;
  v17 = v7;
  v10 = v5;
  objc_msgSend(var0, "addOperationWithBlock:", v12);

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_terminateConnection, 0);
  objc_storeStrong((id *)&self->_terminatePath, 0);
  objc_storeStrong((id *)&self->_gputrace, 0);
}

void __31__GTMTLReplayService_raytrace___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t v17;

  GTMTLReplayController_debugSubCommandStop(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), *(_DWORD *)(a1 + 48), 0);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(unsigned int *)(a1 + 48);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56)));
  v14[2] = __31__GTMTLReplayService_raytrace___block_invoke_2;
  v14[3] = &unk_724D38;
  v6 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 56);
  v17 = v5;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v15 = v6;
  v7 = *(_QWORD *)(a1 + 64);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __31__GTMTLReplayService_raytrace___block_invoke_3;
  v10[3] = &unk_724D60;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v11 = v8;
  v12 = v9;
  v13 = *(_QWORD *)(a1 + 56);
  +[GTAccelerationStructureServerSession sessionWithReplayClient:functionIndex:requestID:transport:dataHandler:accelerationStructureKey:completionHandler:](GTAccelerationStructureServerSession, "sessionWithReplayClient:functionIndex:requestID:transport:dataHandler:accelerationStructureKey:completionHandler:", v2, v3, v4, 0, v14, v7, v10);

}

void __31__GTMTLReplayService_raytrace___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  uint64_t Operation;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  Operation = GTCoreOperationControl_getOperation(a1[5]);
  if (Operation && *(_BYTE *)(Operation + 24))
  {
    v9 = *(_QWORD *)(a1[6] + 8);
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v9 + 48), 0xFFFFFFFFFFFFFFFFLL);
    if (GTCoreOperationControl_getOperation(a1[5]))
    {
      v10 = objc_autoreleasePoolPush();
      v11 = *(void **)(v9 + 56);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a1[5]));
      objc_msgSend(v11, "removeObjectForKey:", v12);

      GTCoreOperationControl_removeOperation(a1[5]);
      v13 = a1[4];
      v14 = objc_msgSend(objc_alloc((Class)GTReplayResponseStream), "initWithState:", 2);
      (*(void (**)(uint64_t, id))(v13 + 16))(v13, v14);

      objc_autoreleasePoolPop(v10);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v9 + 48));
  }
  else
  {
    v15 = (void *)objc_opt_new(GTReplayResponseStream, v8);
    objc_msgSend(v15, "setData:", v20);
    if (v6)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
      v17 = objc_msgSend(v6, "code");
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v16, v17, v18));
      objc_msgSend(v15, "setError:", v19);

    }
    else
    {
      objc_msgSend(v15, "setError:", 0);
    }
    (*(void (**)(void))(a1[4] + 16))();

  }
}

void __31__GTMTLReplayService_raytrace___block_invoke_3(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  if (v15)
  {
    v6 = *(_QWORD *)(a1[5] + 8);
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v6 + 48), 0xFFFFFFFFFFFFFFFFLL);
    v7 = *(void **)(v6 + 56);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a1[6]));
    objc_msgSend(v7, "setObject:forKey:", v15, v8);

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v6 + 48));
    objc_msgSend(v15, "setSessionID:", a1[6]);
    GTCoreOperationControl_addOperation(a1[6]);
    v9 = a1[4];
    v10 = objc_msgSend(objc_alloc((Class)GTReplayResponseStream), "initWithState:", 1);
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);
  }
  else
  {
    v10 = objc_msgSend(objc_alloc((Class)GTReplayResponseStream), "initWithState:", 2);
    if (v5)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
      v12 = objc_msgSend(v5, "code");
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v11, v12, v13));
      objc_msgSend(v10, "setError:", v14);

    }
    (*(void (**)(_QWORD, id))(a1[4] + 16))(a1[4], v10);
  }

}

void __34__GTMTLReplayService_shaderdebug___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char isKindOfClass;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  void *v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSSet *v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  uint64_t *v65;
  id v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  id v72;
  void (**v73)(_QWORD, _QWORD);
  uint64_t v74;
  char v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  id v99;
  id v100[3];
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  NSErrorUserInfoKey v162;
  const __CFString *v163;
  _QWORD v164[8];
  _QWORD v165[8];
  _QWORD v166[4];
  _QWORD v167[4];
  _QWORD v168[4];
  _QWORD v169[4];
  _QWORD v170[11];
  _QWORD v171[11];
  _QWORD v172[7];
  _QWORD v173[7];
  _QWORD v174[7];
  _QWORD v175[7];

  v3 = *(_QWORD *)(a1 + 32);
  v4 = objc_opt_class(GTReplayShaderDebugKernel, a2);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    v8 = v7;
    v9 = v8;
    v175[0] = &off_739898;
    v174[0] = CFSTR("Type");
    v174[1] = CFSTR("MinPositionX");
    if (v8)
    {
      objc_msgSend(v8, "minThreadPositionInGrid");
      v10 = v159;
    }
    else
    {
      v10 = 0;
      v160 = 0;
      v159 = 0;
      v161 = 0;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v10));
    v175[1] = v21;
    v174[2] = CFSTR("MinPositionY");
    if (v9)
    {
      objc_msgSend(v9, "minThreadPositionInGrid");
      v23 = v157;
    }
    else
    {
      v23 = 0;
      v157 = 0;
      v156 = 0;
      v158 = 0;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v23));
    v175[2] = v24;
    v174[3] = CFSTR("MinPositionZ");
    if (v9)
    {
      objc_msgSend(v9, "minThreadPositionInGrid");
      v25 = v155;
    }
    else
    {
      v25 = 0;
      v154 = 0;
      v153 = 0;
      v155 = 0;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v25));
    v175[3] = v26;
    v174[4] = CFSTR("MaxPositionX");
    if (v9)
    {
      objc_msgSend(v9, "maxThreadPositionInGrid");
      v27 = v150;
    }
    else
    {
      v27 = 0;
      v150 = 0;
      v151 = 0;
      v152 = 0;
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v27));
    v175[4] = v28;
    v174[5] = CFSTR("MaxPositionY");
    if (v9)
    {
      objc_msgSend(v9, "maxThreadPositionInGrid");
      v29 = v148;
    }
    else
    {
      v29 = 0;
      v147 = 0;
      v148 = 0;
      v149 = 0;
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v29));
    v175[5] = v30;
    v174[6] = CFSTR("MaxPositionZ");
    if (v9)
    {
      objc_msgSend(v9, "maxThreadPositionInGrid");
      v31 = v146;
    }
    else
    {
      v31 = 0;
      v144 = 0;
      v145 = 0;
      v146 = 0;
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v31));
    v175[6] = v32;
    v33 = v175;
    v34 = v174;
LABEL_46:
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v34, 7));
LABEL_47:

LABEL_48:
    goto LABEL_49;
  }
  v11 = objc_opt_class(GTReplayShaderDebugObject, v6);
  v12 = objc_opt_isKindOfClass(v7, v11);
  v14 = *(void **)(a1 + 32);
  if ((v12 & 1) != 0)
  {
    v15 = v14;
    v9 = v15;
    v173[0] = &off_7398B0;
    v172[0] = CFSTR("Type");
    v172[1] = CFSTR("MinPositionX");
    if (v15)
    {
      objc_msgSend(v15, "minThreadPositionInGrid");
      v16 = v141;
    }
    else
    {
      v16 = 0;
      v141 = 0;
      v142 = 0;
      v143 = 0;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v16));
    v173[1] = v21;
    v172[2] = CFSTR("MinPositionY");
    if (v9)
    {
      objc_msgSend(v9, "minThreadPositionInGrid");
      v41 = v139;
    }
    else
    {
      v41 = 0;
      v138 = 0;
      v139 = 0;
      v140 = 0;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v41));
    v173[2] = v24;
    v172[3] = CFSTR("MinPositionZ");
    if (v9)
    {
      objc_msgSend(v9, "minThreadPositionInGrid");
      v42 = v137;
    }
    else
    {
      v42 = 0;
      v135 = 0;
      v136 = 0;
      v137 = 0;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v42));
    v173[3] = v26;
    v172[4] = CFSTR("MaxPositionX");
    if (v9)
    {
      objc_msgSend(v9, "maxThreadPositionInGrid");
      v43 = v132;
    }
    else
    {
      v43 = 0;
      v132 = 0;
      v133 = 0;
      v134 = 0;
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v43));
    v173[4] = v28;
    v172[5] = CFSTR("MaxPositionY");
    if (v9)
    {
      objc_msgSend(v9, "maxThreadPositionInGrid");
      v44 = v130;
    }
    else
    {
      v44 = 0;
      v129 = 0;
      v130 = 0;
      v131 = 0;
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v44));
    v173[5] = v30;
    v172[6] = CFSTR("MaxPositionZ");
    if (v9)
    {
      objc_msgSend(v9, "maxThreadPositionInGrid");
      v45 = v128;
    }
    else
    {
      v45 = 0;
      v126 = 0;
      v127 = 0;
      v128 = 0;
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v45));
    v173[6] = v32;
    v33 = v173;
    v34 = v172;
    goto LABEL_46;
  }
  v17 = objc_opt_class(GTReplayShaderDebugMesh, v13);
  v18 = objc_opt_isKindOfClass(v14, v17);
  v20 = *(void **)(a1 + 32);
  if ((v18 & 1) != 0)
  {
    v9 = v20;
    v171[0] = &off_7398C8;
    v170[0] = CFSTR("Type");
    v170[1] = CFSTR("AmplificationID");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "amplificationID")));
    v171[1] = v21;
    v170[2] = CFSTR("MinPositionX");
    if (v9)
    {
      objc_msgSend(v9, "minThreadPositionInGrid");
      v22 = v123;
    }
    else
    {
      v22 = 0;
      v123 = 0;
      v124 = 0;
      v125 = 0;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v22));
    v171[2] = v24;
    v170[3] = CFSTR("MinPositionY");
    if (v9)
    {
      objc_msgSend(v9, "minThreadPositionInGrid");
      v78 = v121;
    }
    else
    {
      v78 = 0;
      v120 = 0;
      v121 = 0;
      v122 = 0;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v78));
    v171[3] = v26;
    v170[4] = CFSTR("MinPositionZ");
    if (v9)
    {
      objc_msgSend(v9, "minThreadPositionInGrid");
      v79 = v119;
    }
    else
    {
      v79 = 0;
      v117 = 0;
      v118 = 0;
      v119 = 0;
    }
    v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v79));
    v171[4] = v97;
    v170[5] = CFSTR("MaxPositionX");
    if (v9)
    {
      objc_msgSend(v9, "maxThreadPositionInGrid");
      v80 = v114;
    }
    else
    {
      v80 = 0;
      v114 = 0;
      v115 = 0;
      v116 = 0;
    }
    v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v80));
    v171[5] = v96;
    v170[6] = CFSTR("MaxPositionY");
    if (v9)
    {
      objc_msgSend(v9, "maxThreadPositionInGrid");
      v81 = v112;
    }
    else
    {
      v81 = 0;
      v111 = 0;
      v112 = 0;
      v113 = 0;
    }
    v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v81));
    v171[6] = v95;
    v170[7] = CFSTR("MaxPositionZ");
    if (v9)
    {
      objc_msgSend(v9, "maxThreadPositionInGrid");
      v82 = v110;
    }
    else
    {
      v82 = 0;
      v108 = 0;
      v109 = 0;
      v110 = 0;
    }
    v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v82));
    v171[7] = v83;
    v170[8] = CFSTR("ObjectThreadgroupPosX");
    if (v9)
    {
      objc_msgSend(v9, "objectThreadgroupPositionInGrid");
      v84 = v105;
    }
    else
    {
      v84 = 0;
      v105 = 0;
      v106 = 0;
      v107 = 0;
    }
    v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v84));
    v171[8] = v85;
    v170[9] = CFSTR("ObjectThreadgroupPosY");
    if (v9)
    {
      objc_msgSend(v9, "objectThreadgroupPositionInGrid");
      v86 = v103;
    }
    else
    {
      v86 = 0;
      v102 = 0;
      v103 = 0;
      v104 = 0;
    }
    v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v86));
    v171[9] = v87;
    v170[10] = CFSTR("ObjectThreadgroupPosZ");
    if (v9)
    {
      objc_msgSend(v9, "objectThreadgroupPositionInGrid");
      v88 = v101;
    }
    else
    {
      v88 = 0;
      v100[1] = 0;
      v100[2] = 0;
      v101 = 0;
    }
    v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v88));
    v171[10] = v89;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v171, v170, 11));

    goto LABEL_48;
  }
  v35 = objc_opt_class(GTReplayShaderDebugVertex, v19);
  v36 = objc_opt_isKindOfClass(v20, v35);
  v38 = *(void **)(a1 + 32);
  if ((v36 & 1) != 0)
  {
    v169[0] = &off_739820;
    v168[0] = CFSTR("Type");
    v168[1] = CFSTR("InstanceID");
    v9 = v38;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "instanceID")));
    v169[1] = v21;
    v168[2] = CFSTR("AmplificationID");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "amplificationID")));
    v169[2] = v24;
    v168[3] = CFSTR("VertexIDs");
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "vertexIDs"));
    v169[3] = v26;
    v39 = v169;
    v40 = v168;
LABEL_58:
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v40, 4));
    goto LABEL_48;
  }
  v74 = objc_opt_class(GTReplayShaderDebugPostTessellationVertex, v37);
  v75 = objc_opt_isKindOfClass(v38, v74);
  v77 = *(void **)(a1 + 32);
  if ((v75 & 1) != 0)
  {
    v167[0] = &off_7398E0;
    v166[0] = CFSTR("Type");
    v166[1] = CFSTR("InstanceID");
    v9 = v77;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "instanceID")));
    v167[1] = v21;
    v166[2] = CFSTR("AmplificationID");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "amplificationID")));
    v167[2] = v24;
    v166[3] = CFSTR("PatchIDs");
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "patchIDs"));
    v167[3] = v26;
    v39 = v167;
    v40 = v166;
    goto LABEL_58;
  }
  v90 = objc_opt_class(GTReplayShaderDebugFragment, v76);
  if ((objc_opt_isKindOfClass(v77, v90) & 1) != 0)
  {
    v91 = *(void **)(a1 + 32);
    v165[0] = &off_739808;
    v164[0] = CFSTR("Type");
    v164[1] = CFSTR("MinPositionX");
    v9 = v91;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "minPixelPosition")));
    v165[1] = v21;
    v164[2] = CFSTR("MinPositionY");
    objc_msgSend(v9, "minPixelPosition");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v92));
    v165[2] = v24;
    v164[3] = CFSTR("MaxPositionX");
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "maxPixelPosition")));
    v165[3] = v26;
    v164[4] = CFSTR("MaxPositionY");
    objc_msgSend(v9, "maxPixelPosition");
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v93));
    v165[4] = v28;
    v164[5] = CFSTR("MinSampleID");
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "minSampleID")));
    v165[5] = v30;
    v164[6] = CFSTR("MaxSampleID");
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "maxSampleID")));
    v165[6] = v32;
    v164[7] = CFSTR("RenderTargetArrayIndex");
    v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "renderTargetArrayIndex")));
    v165[7] = v94;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v165, v164, 8));

    goto LABEL_47;
  }
  v46 = 0;
LABEL_49:
  v47 = objc_alloc_init((Class)GTReplayResponse);
  objc_msgSend(v47, "setRequestID:", objc_msgSend(*(id *)(a1 + 32), "requestID"));
  if (v46)
  {
    v49 = objc_opt_class(NSNumber, v48);
    v51 = objc_opt_class(NSString, v50);
    v53 = objc_opt_class(NSArray, v52);
    v55 = objc_opt_class(NSDictionary, v54);
    v57 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v49, v51, v53, v55, objc_opt_class(NSData, v56), 0);
    v58 = (id)objc_claimAutoreleasedReturnValue(v57);
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "programData"));
    v100[0] = 0;
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v58, v59, v100));
    v61 = v100[0];
    v62 = objc_msgSend(v60, "mutableCopy");

    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 32), "dispatchUID")));
    objc_msgSend(v62, "setObject:forKeyedSubscript:", v63, CFSTR("FunctionIndex"));

    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "dispatchUID") >> 32));
    objc_msgSend(v62, "setObject:forKeyedSubscript:", v64, CFSTR("SubCommandIndex"));

    objc_msgSend(v62, "setObject:forKeyedSubscript:", v46, CFSTR("ROI"));
    v65 = *(uint64_t **)(*(_QWORD *)(a1 + 40) + 8);
    v66 = objc_msgSend(v62, "copy");
    v99 = v61;
    v67 = GTMTLShaderDebugger_generateTrace(v65, v66, &v99);
    v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
    v69 = v99;

    if (v68)
    {
      v98 = v69;
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v68, 1, &v98));
      v71 = v98;

      objc_msgSend(v47, "setData:", v70);
      v69 = v71;
    }
    else
    {
      objc_msgSend(v47, "setData:", 0);
    }
    objc_msgSend(v47, "setError:", v69);

  }
  else
  {
    objc_msgSend(v47, "setData:", 0);
    v72 = objc_alloc((Class)NSError);
    v162 = NSLocalizedDescriptionKey;
    v163 = CFSTR("Invalid request");
    v69 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v163, &v162, 1));
    v58 = objc_msgSend(v72, "initWithDomain:code:userInfo:", CFSTR("GTReplayerRequestDomain"), 300, v69);
    objc_msgSend(v47, "setError:", v58);
  }

  v73 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "completionHandler"));
  ((void (**)(_QWORD, id))v73)[2](v73, v47);

}

void __30__GTMTLReplayService_profile___block_invoke(uint64_t a1, uint64_t a2)
{
  id ShaderInfo;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  if (!*(_BYTE *)(a2 + 24))
  {
    ShaderInfo = GTMTLReplayClient_queryShaderInfo(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8), (id *)(*(_QWORD *)(a1 + 48) + 256), *(void **)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue(ShaderInfo);
    v5 = objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("isLegacy"));
    v7 = (void *)objc_opt_new(GTReplayResponse, v6);
    v8 = objc_msgSend(v5, "copy");
    v11 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v11));
    v10 = v11;
    objc_msgSend(v7, "setData:", v9);

    objc_msgSend(v7, "setError:", v10);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __30__GTMTLReplayService_profile___block_invoke_2(uint64_t a1, uint64_t a2)
{
  _UNKNOWN **ShaderInfo;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  dispatch_semaphore_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  id v19;

  if (!*(_BYTE *)(a2 + 24))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 256), "waitUntilAllOperationsAreFinished");
    ShaderInfo = GTMTLReplayClient_embeddedQueryShaderInfo(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8), (id *)(*(_QWORD *)(a1 + 48) + 256), *(void **)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue(ShaderInfo);
    v6 = (void *)objc_opt_new(GTReplayResponse, v5);
    v19 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v19));
    v8 = v19;
    objc_msgSend(v6, "setData:", v7);

    objc_msgSend(v6, "setError:", v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    v9 = dispatch_semaphore_create(0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Streaming Shader Profiling Data")));

    if (v10)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 256), "waitUntilAllOperationsAreFinished");
      v11 = *(_QWORD *)(a1 + 48);
      v12 = *(_QWORD *)(v11 + 8);
      v13 = (id *)(v11 + 256);
      v14 = *(void **)(a1 + 32);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = __30__GTMTLReplayService_profile___block_invoke_3;
      v16[3] = &unk_724CE8;
      v15 = v9;
      v17 = v15;
      v18 = *(id *)(a1 + 40);
      GTMTLReplayClient_streamShaderProfilingData(v12, v13, v14, v16);
      dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);

    }
  }
}

void __30__GTMTLReplayService_profile___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  dispatch_semaphore_t v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  dispatch_semaphore_t v13;
  id v14;
  id v15;

  if (!*(_BYTE *)(a2 + 24))
  {
    v3 = (void *)objc_opt_new(GTReplayResponse, a2);
    objc_msgSend(v3, "setRequestID:", *(_QWORD *)(a1 + 48));
    v15 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", &off_738FF0, 1, &v15));
    v5 = v15;
    objc_msgSend(v3, "setData:", v4);

    objc_msgSend(v3, "setError:", v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    v6 = dispatch_semaphore_create(0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 256), "waitUntilAllOperationsAreFinished");
    v7 = *(_QWORD *)(a1 + 56);
    v8 = *(_QWORD *)(v7 + 8);
    v9 = (id *)(v7 + 256);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __30__GTMTLReplayService_profile___block_invoke_5;
    v12[3] = &unk_724CE8;
    v13 = v6;
    v10 = *(void **)(a1 + 32);
    v14 = *(id *)(a1 + 40);
    v11 = v6;
    GTMTLReplayClient_collectGPUShaderTimelineData(v8, v9, v10, v12);
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);

  }
}

void __30__GTMTLReplayService_profile___block_invoke_6(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  apr_allocator_t *v9;
  id v10;
  void *v11;
  dispatch_semaphore_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  dispatch_queue_t v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  NSObject *v39;
  id v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD v43[3];
  char v44;
  _QWORD v45[3];
  char v46;
  id v47;
  const __CFString *v48;
  uint64_t v49;
  const __CFString *v50;
  void *v51;

  if (!*(_BYTE *)(a2 + 24))
  {
    v34 = dispatch_queue_create("gputools.apsreply", 0);
    v4 = (void *)objc_opt_new(GTReplayResponse, v3);
    objc_msgSend(v4, "setRequestID:", *(_QWORD *)(a1 + 56));
    v47 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", &off_739018, 1, &v47));
    v6 = v47;
    objc_msgSend(v4, "setData:", v5);

    objc_msgSend(v4, "setError:", v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 256), "waitUntilAllOperationsAreFinished");
    v10 = GTShaderProfilerStreamDataFromReplayDataSource(**(uint64_t ****)(*(_QWORD *)(a1 + 64) + 8), v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = dispatch_semaphore_create(0);
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x2020000000;
    v46 = 0;
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x2020000000;
    v44 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("SupportsFileFormatV2")));
    objc_msgSend(v11, "setSupportsFileFormatV2:", objc_msgSend(v13, "BOOLValue"));

    v14 = *(_QWORD *)(a1 + 64);
    v15 = *(_QWORD *)(v14 + 8);
    v16 = (id *)(v14 + 256);
    v17 = *(void **)(a1 + 32);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = __30__GTMTLReplayService_profile___block_invoke_7;
    v38[3] = &unk_725FC0;
    v18 = v12;
    v39 = v18;
    v41 = v45;
    v19 = v11;
    v40 = v19;
    v42 = v43;
    GTMTLReplayClient_collectAPSData(v15, v16, v17, v38);
    dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend(v19, "setMetalPluginName:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v37 = 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "encode:error:", 0, &v37));
    v21 = v37;
    if (v21)
    {
      v23 = v21;
      v24 = (void *)objc_opt_new(GTReplayResponse, v22);
      objc_msgSend(v24, "setError:", v23);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      if (objc_msgSend(v19, "supportsFileFormatV2"))
      {
        v24 = (void *)objc_opt_new(GTReplayResponse, v25);
        v50 = CFSTR("Profiler Raw URL");
        v51 = v20;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1));
        v36 = 0;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v26, 1, &v36));
        v23 = v36;
        objc_msgSend(v24, "setData:", v27);

        objc_msgSend(v24, "setError:", v23);
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }
      else
      {
        v24 = (void *)objc_opt_new(GTReplayResponse, v25);
        v28 = objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v20, 8, 0));
        v26 = (void *)v28;
        if (v28)
        {
          v48 = CFSTR("Profiler Raw");
          v49 = v28;
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));
        }
        else
        {
          v29 = &__NSDictionary0__struct;
        }
        v35 = 0;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v29, 1, &v35));
        v23 = v35;
        objc_msgSend(v24, "setData:", v30);

        objc_msgSend(v24, "setError:", v23);
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        v31 = *(_QWORD *)(a1 + 40);
        v33 = (void *)objc_opt_new(GTReplayResponse, v32);
        (*(void (**)(uint64_t, void *))(v31 + 16))(v31, v33);

      }
    }

    _Block_object_dispose(v43, 8);
    _Block_object_dispose(v45, 8);

  }
}

void __30__GTMTLReplayService_profile___block_invoke_8(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  id *v5;
  id *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  if (!*(_BYTE *)(a2 + 24))
  {
    v3 = *(unsigned __int8 *)(a1 + 56);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(id **)(v4 + 8);
    v6 = (id *)(v4 + 256);
    v7 = *(void **)(a1 + 32);
    if (v3)
      GTMTLReplayClient_embeddedDerivedCounterData((uint64_t)v5, (uint64_t)v6, v7);
    v8 = GTMTLReplayClient_derivedCounterData(v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v11 = (void *)objc_opt_new(GTReplayResponse, v10);
    v17 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v17));
    v13 = v17;
    objc_msgSend(v11, "setData:", v12);

    objc_msgSend(v11, "setError:", v13);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v14 = *(_QWORD *)(a1 + 40);
    v16 = (void *)objc_opt_new(GTReplayResponse, v15);
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v16);

  }
}

void __30__GTMTLReplayService_profile___block_invoke_9(uint64_t a1, uint64_t a2)
{
  dispatch_semaphore_t v3;
  uint64_t v4;
  uint64_t v5;
  id *v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  dispatch_semaphore_t v19;
  id v20;
  const __CFString *v21;
  void *v22;

  if (!*(_BYTE *)(a2 + 24))
  {
    v3 = dispatch_semaphore_create(0);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(v4 + 8);
    v6 = (id *)(v4 + 256);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __30__GTMTLReplayService_profile___block_invoke_10;
    v18[3] = &unk_724CE8;
    v7 = *(void **)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    v19 = v3;
    v20 = v8;
    v9 = v3;
    v10 = GTMTLReplayClient_streamBatchFilteredData(v5, v6, v7, v18);
    v21 = CFSTR("Batch Filtering Started");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v10));
    v22 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));

    v14 = (void *)objc_opt_new(GTReplayResponse, v13);
    v17 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, &v17));
    v16 = v17;
    objc_msgSend(v14, "setData:", v15);

    objc_msgSend(v14, "setError:", v16);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __30__GTMTLReplayService_profile___block_invoke_11(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  if (!*(_BYTE *)(a2 + 24))
  {
    GTMTLReplayClient_addBatchFilteringRequest(*(void **)(a1 + 32));
    v3 = *(_QWORD *)(a1 + 40);
    v5 = (id)objc_opt_new(GTReplayResponse, v4);
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);

  }
}

void __30__GTMTLReplayService_profile___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v3 = a2;
  v5 = (void *)objc_opt_new(GTReplayResponse, v4);
  v6 = v5;
  if (v3)
  {
    v9 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v9));
    v8 = v9;
    objc_msgSend(v6, "setData:", v7);

  }
  else
  {
    objc_msgSend(v5, "setData:", 0);
    v8 = 0;
  }
  objc_msgSend(v6, "setError:", v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (!v3)
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __30__GTMTLReplayService_profile___block_invoke_7(uint64_t a1, void *a2)
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
  id v12;

  v3 = a2;
  v12 = v3;
  if (v3)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
      || (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Streaming APS Counters"))),
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4 != 0,
          v4,
          v3 = v12,
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)))
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        goto LABEL_8;
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Streaming APS Profiling")));
      if (v5)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

      v3 = v12;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      {
LABEL_8:
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Remove APS Timeline")));

        v7 = *(void **)(a1 + 40);
        if (v6)
          objc_msgSend(v7, "removeAPSTimelineData");
        else
          objc_msgSend(v7, "addAPSTimelineData:", v12);
      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Remove APS Counters")));

        v11 = *(void **)(a1 + 40);
        if (v10)
          objc_msgSend(v11, "removeAPSCounterData");
        else
          objc_msgSend(v11, "addAPSCounterData:", v12);
      }
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Remove APS Data")));

      v9 = *(void **)(a1 + 40);
      if (v8)
        objc_msgSend(v9, "removeAPSData");
      else
        objc_msgSend(v9, "addAPSData:", v12);
    }
  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

}

void __30__GTMTLReplayService_profile___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = a2;
  v5 = (void *)objc_opt_new(GTReplayResponse, v4);
  if (v3)
  {
    v8 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v8));
    v7 = v8;
    objc_msgSend(v5, "setData:", v6);

    objc_msgSend(v5, "setError:", v7);
  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    v7 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __30__GTMTLReplayService_profile___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = a2;
  v5 = (void *)objc_opt_new(GTReplayResponse, v4);
  if (v3)
  {
    v8 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v8));
    v7 = v8;
    objc_msgSend(v5, "setData:", v6);

    objc_msgSend(v5, "setError:", v7);
  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    v7 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __29__GTMTLReplayService_decode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSSet *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSSet *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t *v28;
  void *v29;
  id v30;
  memory_object_size_t v31;
  void *v32;
  dispatch_data_t concat;
  id v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  size_t v45;
  dispatch_data_t v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  memory_object_size_t v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  _QWORD destructor[6];
  _OWORD v65[3];
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  id v72;
  id v73;
  _BYTE v74[128];

  v4 = a2;
  v59 = a3;
  v6 = objc_opt_class(NSDictionary, v5);
  v8 = objc_opt_class(NSData, v7);
  v10 = objc_opt_class(NSString, v9);
  v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v8, v10, objc_opt_class(NSNumber, v11), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v73 = 0;
  v60 = v4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v13, v4, &v73));
  v15 = v73;

  v17 = objc_opt_class(NSDictionary, v16);
  v19 = objc_opt_class(NSArray, v18);
  v21 = objc_opt_class(NSData, v20);
  v23 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, v19, v21, objc_opt_class(NSString, v22), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v57 = v14;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("object")));
  v72 = v15;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v24, v25, &v72));
  v56 = v72;

  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("object")));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("requestID")));
  v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("functionIndex"))));
  v28 = (uint64_t *)objc_msgSend(v27, "bytes");
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("stream")));
  v30 = objc_msgSend(v29, "count");

  v71 = 0;
  v31 = 1280 * (_QWORD)v30;
  v32 = (void *)GTCoreAlloc(v31);
  bzero(v32, v31);
  concat = (dispatch_data_t)&_dispatch_data_empty;
  v34 = &_dispatch_data_empty;
  v55 = objc_alloc_init((Class)NSMutableDictionary);
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("stream")));
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
  if (v36)
  {
    v37 = v36;
    v52 = v31;
    v53 = v27;
    v54 = v26;
    v38 = *(_QWORD *)v68;
    do
    {
      v39 = 0;
      v40 = concat;
      do
      {
        if (*(_QWORD *)v68 != v38)
          objc_enumerationMutation(v35);
        v41 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)v39);
        v65[0] = GTMTLTextureDescriptorDefaults;
        v65[1] = xmmword_4A9D40;
        v65[2] = xmmword_4A9D50;
        v66 = 512;
        v42 = *v28++;
        v43 = NewResourceData(v41, v62, v61, 0, (uint64_t)v65, (uint64_t)v32, &v71, v42, v40);
        v44 = objc_claimAutoreleasedReturnValue(v43);
        concat = dispatch_data_create_concat(v40, v44);

        v39 = (char *)v39 + 1;
        v40 = concat;
      }
      while (v37 != v39);
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
    }
    while (v37);
    v45 = 80 * v71;
    v27 = v53;
    v26 = v54;
    v31 = v52;
  }
  else
  {
    v45 = 0;
  }

  destructor[0] = _NSConcreteStackBlock;
  destructor[1] = 3221225472;
  destructor[2] = __29__GTMTLReplayService_decode___block_invoke_2;
  destructor[3] = &__block_descriptor_48_e5_v8__0l;
  destructor[4] = v32;
  destructor[5] = v31;
  v46 = dispatch_data_create(v32, v45, 0, destructor);
  objc_msgSend(v55, "setObject:forKey:", v46, CFSTR("info"));
  objc_msgSend(v55, "setObject:forKey:", concat, CFSTR("data"));
  v47 = objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v55, "setObject:forKey:", v47, CFSTR("unknown"));

  v49 = (void *)objc_opt_new(GTReplayResponse, v48);
  v63 = 0;
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v55, 1, &v63));
  v51 = v63;
  objc_msgSend(v49, "setData:", v50);

  objc_msgSend(v49, "setError:", v51);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __29__GTMTLReplayService_decode___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = vm_deallocate(mach_task_self_, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  *(_QWORD *)(a1 + 32) = 0;
  return result;
}

void __29__GTMTLReplayService_update___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  v3 = (void *)objc_opt_new(GTReplayResponse, a2);
  v4 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v8 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v8));
  v6 = v8;
  objc_msgSend(v3, "setData:", v5);

  objc_msgSend(v3, "setError:", v6);
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "completionHandler"));

  ((void (**)(_QWORD, void *))v7)[2](v7, v3);
}

void __29__GTMTLReplayService_update___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  _QWORD v25[3];
  char v26;
  id v27;

  if (!*(_BYTE *)(a2 + 24))
  {
    v3 = *(void **)(a1 + 32);
    if (*(_QWORD *)(a1 + 56))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v5 = *(void **)(v4 + 128);
      v6 = *(void **)(v4 + 136);
      v7 = GTTransportArchiveDirectory();
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      UpdateDebugFileCache(v3, v5, v6, v8);

    }
    else
    {
      v10 = GTTransportArchiveDirectory();
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = v3;
      v13 = v11;
      if (v12)
      {
        v14 = objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithPath:isDirectory:", v13, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v27 = 0;
        objc_msgSend(v15, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v14, 1, 0, &v27);
        v16 = v27;

        v25[0] = 0;
        v25[1] = v25;
        v25[2] = 0x2020000000;
        v26 = 1;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = __StoreDebugFileCache_block_invoke;
        v22[3] = &unk_724DB0;
        v17 = v14;
        v23 = v17;
        v24 = v25;
        objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v22);

        _Block_object_dispose(v25, 8);
      }

    }
    v18 = (void *)objc_opt_new(GTReplayResponse, v9);
    objc_msgSend(v18, "setRequestID:", objc_msgSend(*(id *)(a1 + 40), "requestID"));
    v21 = 0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", &__kCFBooleanTrue, 1, &v21));
    v20 = v21;
    objc_msgSend(v18, "setData:", v19);

    objc_msgSend(v18, "setError:", v20);
    objc_msgSend(*(id *)(a1 + 48), "setObject:atIndexedSubscript:", v18, *(int *)(a1 + 72));

  }
}

void __29__GTMTLReplayService_update___block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD **WeakRetained;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  apr_pool_t *v11;
  const void *v12;
  apr_status_t (__cdecl *v13)(void *);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  _QWORD *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  const __CFString *v37;
  void *v38;

  WeakRetained = (_QWORD **)objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained || *(_BYTE *)(a2 + 24))
    goto LABEL_17;
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "streamRef");
  objc_msgSend(v6, "dispatchUID");
  objc_msgSend(v6, "dispatchUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shaderURL"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shaderURL"));
    v10 = objc_msgSend(v9, "startAccessingSecurityScopedResource");

    if (v10)
    {
      v11 = (apr_pool_t *)*WeakRetained[1];
      v12 = (const void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shaderURL"));
      apr_pool_cleanup_register(v11, v12, (apr_status_t (__cdecl *)(void *))CleanupSandboxExtensionURL_765, v13);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shaderURL"));
    v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 128);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v7));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

    v37 = CFSTR("streamref");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "streamRef")));
    v38 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shaderURL"));
    goto LABEL_13;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shaderIR"));

  if (v21)
  {
    v35[0] = CFSTR("streamref");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "streamRef")));
    v35[1] = CFSTR("IR");
    v36[0] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shaderIR"));
    v36[1] = v23;
    v24 = v36;
    v25 = v35;
LABEL_11:
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v25, 2));

    goto LABEL_12;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shaderSource"));

  if (v18)
  {
    v33[0] = CFSTR("streamref");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "streamRef")));
    v33[1] = CFSTR("source");
    v34[0] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shaderSource"));
    v34[1] = v23;
    v24 = v34;
    v25 = v33;
    goto LABEL_11;
  }
LABEL_12:
  v20 = 0;
LABEL_13:
  v26 = (void *)objc_opt_new(GTReplayResponse, v19);
  objc_msgSend(v26, "setRequestID:", objc_msgSend(*(id *)(a1 + 32), "requestID"));
  if (UpdateLibraryResource(*(id **)(*(_QWORD *)(a1 + 64) + 8), v18, v5, v20))
  {
    v31 = v5;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("updatedPipelines")));
    v28 = objc_msgSend(v27, "copy");
    v32 = 0;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v28, 1, &v32));
    v30 = v32;
    objc_msgSend(v26, "setData:", v29);

    v5 = v31;
  }
  else
  {
    v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("error")));
  }
  objc_msgSend(v26, "setError:", v30);

  objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", v26, *(int *)(a1 + 72));
LABEL_17:

}

void __29__GTMTLReplayService_update___block_invoke_3(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  if (!*(_BYTE *)(a2 + 24))
  {
    if (*(_BYTE *)(a1 + 60))
    {
      objc_msgSend(*(id *)(a1 + 32), "setForceLoadUnusedResources:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setEnableReplayFromOtherPlatforms:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setEnableCapture:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setEnableHUD:", 0);
    }
    v3 = objc_msgSend(*(id *)(a1 + 32), "forceLoadActionClear");
    dword_75313C = dword_75313C & 0xFFFFFFFE | v3;
    if (objc_msgSend(*(id *)(a1 + 32), "forceLoadUnusedResources"))
      v4 = 1024;
    else
      v4 = 0;
    dword_75313C = dword_75313C & 0xFFFFFBFF | v4;
    if (objc_msgSend(*(id *)(a1 + 32), "forceWaitUntilCompleted"))
      v5 = 2;
    else
      v5 = 0;
    dword_75313C = dword_75313C & 0xFFFFFFFD | v5;
    if (objc_msgSend(*(id *)(a1 + 32), "disableOptimizeRestores"))
      v6 = 16;
    else
      v6 = 0;
    dword_75313C = dword_75313C & 0xFFFFFFEF | v6;
    if (objc_msgSend(*(id *)(a1 + 32), "enableDisplayOnDevice"))
      v7 = 0;
    else
      v7 = 32;
    dword_75313C = dword_75313C & 0xFFFFFFDF | v7;
    if (objc_msgSend(*(id *)(a1 + 32), "disableHeapTextureCompression"))
      v8 = 0x2000;
    else
      v8 = 0;
    dword_75313C = dword_75313C & 0xFFFFDFFF | v8;
    if (objc_msgSend(*(id *)(a1 + 32), "enableReplayFromOtherPlatforms"))
      v9 = 0x80000;
    else
      v9 = 0;
    dword_75313C = dword_75313C & 0xFFF7FFFF | v9;
    if (objc_msgSend(*(id *)(a1 + 32), "enableCapture"))
      v10 = 0x1000000;
    else
      v10 = 0;
    dword_75313C = dword_75313C & 0xFEFFFFFF | v10;
    if (objc_msgSend(*(id *)(a1 + 32), "enableHUD"))
      v12 = 0x2000000;
    else
      v12 = 0;
    dword_75313C = dword_75313C & 0xFDFFFFFF | v12;
    v13 = (void *)objc_opt_new(GTReplayResponse, v11);
    objc_msgSend(v13, "setRequestID:", objc_msgSend(*(id *)(a1 + 40), "requestID"));
    v16 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", &__kCFBooleanTrue, 1, &v16));
    v15 = v16;
    objc_msgSend(v13, "setData:", v14);

    objc_msgSend(v13, "setError:", v15);
    objc_msgSend(*(id *)(a1 + 48), "setObject:atIndexedSubscript:", v13, *(int *)(a1 + 56));

  }
}

void __30__GTMTLReplayService_display___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  unsigned int v4;
  unint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *Object;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id TexturesForResize;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  GTMTLTextureRenderEncoder *v28;
  void *v29;
  GTMTLTextureRenderEncoder *v30;
  apr_array_header_t *v31;
  uint64_t v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  GTMTLTextureRenderEncoder *v51;
  _QWORD *v52;
  void *v53;
  uint64_t v54;
  _QWORD v55[4];
  GTMTLTextureRenderEncoder *v56;
  uint64_t v57;
  _OWORD v58[8];
  void *v59;
  void *v60;
  _QWORD v61[6];
  _QWORD v62[6];

  v2 = **(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v3 = objc_msgSend(*(id *)(a1 + 32), "streamRef");
  v4 = objc_msgSend(*(id *)(a1 + 32), "dispatchUID");
  v5 = (unint64_t)objc_msgSend(*(id *)(a1 + 32), "dispatchUID") >> 32;
  v6 = *(_QWORD *)(v2 + 80);
  v7 = objc_msgSend(*(id *)(a1 + 32), "filters");
  if ((v7 & 1) != 0)
  {
    *(_QWORD *)&v58[0] = 0x400FF00FFLL;
    BYTE8(v58[0]) = 0;
    BYTE9(v58[0]) = (v7 & 2) != 0;
    BYTE10(v58[0]) = (v7 & 4) != 0;
    BYTE11(v58[0]) = 0;
    GTMTLReplayClient_displayAttachment(*(_QWORD *)(a1 + 40), (uint64_t)v58, v4, v5);
  }
  else
  {
    v8 = v6 + v4;
    v54 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(v54 + 8);
    GTMTLReplayController_debugSubCommandStop(v9, v8, v5);
    v10 = *(_QWORD *)(*(_QWORD *)v9 + 40);
    Object = GTMTLSMContext_getObject(*(_QWORD *)v10, (uint64_t)v3, v8);
    if (Object)
    {
      v52 = Object;
      v62[0] = &off_7397A8;
      v61[0] = CFSTR("type");
      v61[1] = CFSTR("object");
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v3));
      v62[1] = v12;
      v61[2] = CFSTR("DependencyGraphRequestedTextureLevel");
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 0));
      v62[2] = v13;
      v61[3] = CFSTR("DependencyGraphRequestedTextureSlice");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 0));
      v62[3] = v14;
      v61[4] = CFSTR("DependencyGraphRequestedTextureAttachmentIndex");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 0));
      v62[4] = v15;
      v61[5] = CFSTR("DependencyGraphRequestedTextureDepthPlane");
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 0));
      v62[5] = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v62, v61, 6));

      v18 = *(void **)(v9 + 40);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v3));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v19));

      if (!v20)
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v9 + 8), "textureForKey:", v3));
      v60 = v17;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v60, 1));
      v59 = v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v59, 1));

      GTMTLReplayClient_waitForUntrackedWritesToComplete(v9, v22);
      v53 = v21;
      TexturesForResize = GTMTLReplayClient_retrieveTexturesForResize((id *)v9, v21, v22, 1, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue(TexturesForResize);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v9 + 8), "defaultCommandQueue"));
      v26 = InternalCommandBuffer(v25, CFSTR("DisplayTexture"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

      v28 = [GTMTLTextureRenderEncoder alloc];
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v9 + 8), "defaultDevice"));
      v30 = -[GTMTLTextureRenderEncoder initWithDevice:](v28, "initWithDevice:", v29);

      if (v52[24])
      {
        v31 = apr_array_make(*(apr_pool_t **)v54, 16, 8);
        GTMTLSMContext_getObjects(*(_DWORD **)(v10 + 240), v8, v31);
        if (v31->nelts >= 1)
        {
          v32 = 0;
          do
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v9 + 8), "layerForKey:", *(_QWORD *)(*(_QWORD *)&v31->elts[8 * v32] + 40)));
            objc_msgSend(v33, "drawableSize");
            v35 = v34;
            v37 = v36;
            if (v33)
              objc_msgSend(v33, "transform");
            else
              memset(v58, 0, sizeof(v58));
            -[GTMTLTextureRenderEncoder setTransform:](v30, "setTransform:", v58);
            objc_msgSend(v33, "bounds");
            v39 = v38;
            v41 = v40;
            v43 = v42;
            v45 = v44;
            objc_msgSend(v33, "contentsScale");
            -[GTMTLTextureRenderEncoder setBounds:contentsScale:](v30, "setBounds:contentsScale:", v39, v41, v43, v45, v46);
            objc_msgSend(v33, "anchorPoint");
            -[GTMTLTextureRenderEncoder setAnchor:](v30, "setAnchor:");
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", v32));
            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", v32));
            EncodeAttachment(v54, v27, v30, v47, v48, 0, 0, (unint64_t)v35, (unint64_t)v37, 0);

            ++v32;
          }
          while (v32 < v31->nelts);
        }
      }
      else
      {
        -[GTMTLTextureRenderEncoder setBounds:contentsScale:](v30, "setBounds:contentsScale:", 0.0, 0.0, (double)*(unint64_t *)(v9 + 22464), (double)*(unint64_t *)(v9 + 22472), 1.0);
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", 0));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", 0));
        EncodeAttachment(v54, v27, v30, v49, v50, 0, 0, *(_QWORD *)(v9 + 22464), *(_QWORD *)(v9 + 22472), 1u);

      }
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = __GTMTLReplayClient_displayTexture_block_invoke;
      v55[3] = &unk_726840;
      v56 = v30;
      v57 = v54;
      v51 = v30;
      objc_msgSend(v27, "addCompletedHandler:", v55);
      GTMTLReplay_commitCommandBuffer(v27);

    }
  }
}

void __28__GTMTLReplayService_fetch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSSet *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSSet *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  dispatch_data_t concat;
  id v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  NSObject *v50;
  size_t v51;
  void *v52;
  void *v53;
  dispatch_data_t v54;
  id v55;
  uint64_t v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  uint64_t v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  uint64_t v70;
  id v71;
  _QWORD destructor[6];
  _OWORD v73[3];
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  id v80;
  id v81;
  _BYTE v82[128];

  v5 = a2;
  v6 = a3;
  v8 = v6;
  if (v5)
  {
    v70 = a1;
    v66 = v6;
    v9 = objc_opt_class(NSDictionary, v7);
    v11 = objc_opt_class(NSData, v10);
    v13 = objc_opt_class(NSString, v12);
    v15 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, v11, v13, objc_opt_class(NSNumber, v14), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v81 = 0;
    v67 = v5;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v16, v5, &v81));
    v18 = v81;

    v20 = objc_opt_class(NSDictionary, v19);
    v22 = objc_opt_class(NSArray, v21);
    v24 = objc_opt_class(NSData, v23);
    v26 = objc_opt_class(NSString, v25);
    v28 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v20, v22, v24, v26, objc_opt_class(NSNumber, v27), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v65 = v17;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("object")));
    v80 = v18;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v29, v30, &v80));
    v32 = v80;

    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("object")));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("requestID")));
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("functionIndex"))));
    v34 = (uint64_t *)objc_msgSend(v33, "bytes");
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("stream")));
    v36 = objc_msgSend(v35, "count");

    v79 = 0;
    v37 = 1280 * (_QWORD)v36;
    v38 = (void *)GTCoreAlloc(1280 * (_QWORD)v36);
    bzero(v38, 1280 * (_QWORD)v36);
    concat = (dispatch_data_t)&_dispatch_data_empty;
    v40 = &_dispatch_data_empty;
    v64 = objc_alloc_init((Class)NSMutableDictionary);
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("stream")));
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v75, v82, 16);
    if (v42)
    {
      v43 = v42;
      v61 = 1280 * (_QWORD)v36;
      v62 = v32;
      v63 = v31;
      v44 = *(_QWORD *)v76;
      do
      {
        v45 = 0;
        v46 = concat;
        do
        {
          if (*(_QWORD *)v76 != v44)
            objc_enumerationMutation(v41);
          v47 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)v45);
          v73[0] = GTMTLTextureDescriptorDefaults;
          v73[1] = xmmword_4A9D40;
          v73[2] = xmmword_4A9D50;
          v74 = 512;
          v48 = *v34++;
          v49 = NewResourceData(v47, v69, v68, *(void **)(v70 + 40), (uint64_t)v73, (uint64_t)v38, &v79, v48, v46);
          v50 = objc_claimAutoreleasedReturnValue(v49);
          concat = dispatch_data_create_concat(v46, v50);

          v45 = (char *)v45 + 1;
          v46 = concat;
        }
        while (v43 != v45);
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v75, v82, 16);
      }
      while (v43);
      v51 = 80 * v79;
      v31 = v63;
      v37 = v61;
      v52 = v62;
    }
    else
    {
      v51 = 0;
      v52 = v32;
    }

    destructor[0] = _NSConcreteStackBlock;
    destructor[1] = 3221225472;
    destructor[2] = __28__GTMTLReplayService_fetch___block_invoke_2;
    destructor[3] = &__block_descriptor_48_e5_v8__0l;
    destructor[4] = v38;
    destructor[5] = v37;
    v54 = dispatch_data_create(v38, v51, 0, destructor);
    objc_msgSend(v64, "setObject:forKey:", v54, CFSTR("info"));
    objc_msgSend(v64, "setObject:forKey:", concat, CFSTR("data"));
    v55 = objc_msgSend(*(id *)(v70 + 48), "copy");
    objc_msgSend(v64, "setObject:forKey:", v55, CFSTR("unknown"));

    v57 = (void *)objc_opt_new(GTReplayResponse, v56);
    objc_msgSend(v57, "setRequestID:", objc_msgSend(*(id *)(v70 + 32), "requestID"));
    v58 = objc_msgSend(v64, "copy");
    v71 = 0;
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v58, 1, &v71));
    v60 = v71;
    objc_msgSend(v57, "setData:", v59);

    objc_msgSend(v57, "setError:", v60);
    (*(void (**)(void))(*(_QWORD *)(v70 + 56) + 16))();

    v8 = v66;
    v5 = v67;
  }
  else
  {
    v53 = (void *)objc_opt_new(GTReplayResponse, v7);
    objc_msgSend(v53, "setRequestID:", objc_msgSend(*(id *)(a1 + 32), "requestID"));
    objc_msgSend(v53, "setData:", 0);
    objc_msgSend(v53, "setError:", v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

uint64_t __28__GTMTLReplayService_fetch___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = vm_deallocate(mach_task_self_, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  *(_QWORD *)(a1 + 32) = 0;
  return result;
}

void __28__GTMTLReplayService_query___block_invoke_5_80(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  v3 = (void *)objc_opt_new(GTReplayResponse, v2);
  v4 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v8 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v8));
  v6 = v8;
  objc_msgSend(v3, "setData:", v5);

  objc_msgSend(v3, "setError:", v6);
  objc_msgSend(v3, "setRequestID:", *(_QWORD *)(a1 + 56));
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "completionHandler"));

  ((void (**)(_QWORD, void *))v7)[2](v7, v3);
}

void __28__GTMTLReplayService_query___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  GTMTLReplayRasterMapQuery *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSErrorUserInfoKey v14;
  const __CFString *v15;

  if (!*(_BYTE *)(a2 + 24))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (v3)
    {
      v4 = *(_QWORD *)(a1 + 48);
      v13 = 0;
      v5 = GTMTLReplayClient_queryRasterMap(v3, v4, &v13);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      v7 = v13;
    }
    else
    {
      v8 = objc_alloc((Class)NSError);
      v14 = NSLocalizedDescriptionKey;
      v15 = CFSTR("Query request happened before replayer data source is loaded");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
      v7 = objc_msgSend(v8, "initWithDomain:code:userInfo:", CFSTR("com.apple.gputools.MTLReplayer"), 104, v9);

      v6 = 0;
    }
    v10 = objc_alloc_init((Class)GTReplayResponse);
    objc_msgSend(v10, "setRequestID:", *(_QWORD *)(a1 + 56));
    if (v7)
    {
      objc_msgSend(v10, "setData:", 0);
    }
    else
    {
      v12 = 0;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v12));
      v7 = v12;
      objc_msgSend(v10, "setData:", v11);

    }
    objc_msgSend(v10, "setError:", v7);
    objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v10, *(int *)(a1 + 64));

  }
}

void __28__GTMTLReplayService_query___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;
  unsigned int *v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  NSErrorUserInfoKey v19;
  const __CFString *v20;
  _QWORD v21[2];
  _QWORD v22[2];

  if (!*(_BYTE *)(a2 + 24))
  {
    v3 = objc_alloc_init((Class)GTReplayResponse);
    objc_msgSend(v3, "setRequestID:", *(_QWORD *)(a1 + 40));
    v4 = *(unsigned int **)(*(_QWORD *)(a1 + 48) + 8);
    if (v4)
    {
      v5 = *(unsigned int *)(a1 + 56);
      v6 = *(unsigned int *)(a1 + 60);
      v18 = 0;
      v7 = GTMTLReplayClient_generateFunctionResourceUsageInfoV2(v4, v5, v6, &v18);
      v8 = v18;
      if (v7)
      {
        v17 = 0;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v17));
        v10 = v17;
        objc_msgSend(v3, "setData:", v9);

        objc_msgSend(v3, "setError:", v10);
      }
      else
      {
        v14 = objc_alloc((Class)NSError);
        v21[0] = NSLocalizedDescriptionKey;
        v21[1] = NSLocalizedRecoverySuggestionErrorKey;
        v22[0] = CFSTR("resource usage error");
        v22[1] = CFSTR("query again?");
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));
        v16 = objc_msgSend(v14, "initWithDomain:code:userInfo:", NSCocoaErrorDomain, 1, v15);
        objc_msgSend(v3, "setError:", v16);

        v10 = 0;
      }
    }
    else
    {
      v11 = objc_alloc((Class)NSError);
      v19 = NSLocalizedDescriptionKey;
      v20 = CFSTR("Query request happened before replayer data source is loaded");
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
      v13 = objc_msgSend(v11, "initWithDomain:code:userInfo:", CFSTR("com.apple.gputools.MTLReplayer"), 104, v12);
      objc_msgSend(v3, "setError:", v13);

      v10 = 0;
      v8 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v3, *(int *)(a1 + 64));

  }
}

void __28__GTMTLReplayService_query___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSData *v4;
  void *v5;
  id v6;

  if (!*(_BYTE *)(a2 + 24))
  {
    v3 = GTMTLDeviceCapabilitiesQuery();
    v6 = objc_alloc_init((Class)GTReplayResponse);
    v4 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v3, GTMTLDeviceCapabilitiesSize(objc_msgSend(v6, "setRequestID:", *(_QWORD *)(a1 + 40))), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    objc_msgSend(v6, "setData:", v5);

    objc_msgSend(v6, "setError:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v6, *(int *)(a1 + 48));

  }
}

void __28__GTMTLReplayService_query___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id Analysis;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSErrorUserInfoKey v14;
  const __CFString *v15;

  if (!*(_BYTE *)(a2 + 24))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v3 + 8), "defaultDevice"));
      Analysis = DYMTLReplayFrameProfiler_loadAnalysis(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue(Analysis);

      v8 = 0;
    }
    else
    {
      v9 = objc_alloc((Class)NSError);
      v14 = NSLocalizedDescriptionKey;
      v15 = CFSTR("Query request happened before replayer data source is loaded");
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
      v8 = objc_msgSend(v9, "initWithDomain:code:userInfo:", CFSTR("com.apple.gputools.MTLReplayer"), 104, v10);

      v6 = 0;
    }
    v11 = (void *)objc_opt_new(GTReplayResponse, v7);
    objc_msgSend(v11, "setRequestID:", *(_QWORD *)(a1 + 48));
    if (v8)
    {
      objc_msgSend(v11, "setData:", 0);
    }
    else
    {
      v13 = 0;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v13));
      v8 = v13;
      objc_msgSend(v11, "setData:", v12);

    }
    objc_msgSend(v11, "setError:", v8);
    objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v11, *(int *)(a1 + 56));

  }
}

void __28__GTMTLReplayService_query___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unsigned int *v6;
  NSNumber *v7;
  void *v8;
  _UNKNOWN **v9;
  _UNKNOWN **v10;
  void *v11;
  _UNKNOWN **v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  _UNKNOWN **v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSErrorUserInfoKey v24;
  const __CFString *v25;
  _QWORD v26[3];
  id v27;
  void *v28;
  void *v29;

  if (*(_BYTE *)(a2 + 24))
    return;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v3 + 8), "defaultDevice"));
    v5 = GTDeviceCapabilities_fromDevice();

    if (!GTDeviceCapabilities_isAGX(v5))
    {
      v7 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v3 + 8), "defaultDevice"));
      if ((objc_opt_respondsToSelector(v7, "currentPerformanceState") & 1) != 0)
      {
        v18 = -[NSNumber currentPerformanceState](v7, "currentPerformanceState");
        v26[0] = CFSTR("enabled");
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v18 != 0));
        v27 = v19;
        v28 = &__kCFBooleanTrue;
        v26[1] = CFSTR("supported");
        v26[2] = CFSTR("PerformanceStateAssertion");
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v18));
        v29 = v20;
        v17 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, v26, 3));

      }
      else
      {
        v17 = &off_739428;
      }
      goto LABEL_15;
    }
    v6 = ExpectedState(v3);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue(v6);
    v29 = 0;
    LOBYTE(v28) = 0;
    v27 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v3 + 8), "defaultDevice"));
    GTAGXPerfStateControl::InitWithDevice((uint64_t)&v27, v8);

    v9 = GTAGXPerfStateControl::ConsistentGPUPerfStateLevel((GTAGXPerfStateControl *)&v27, v7);
    v10 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v9);
    if (GTDeviceCapabilities_isAGX3(v5))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v10));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", &off_739D00, CFSTR("gen"));
      v12 = (_UNKNOWN **)objc_msgSend(v11, "copy");
    }
    else
    {
      if (!GTDeviceCapabilities_isAGX2(v5))
      {
        v17 = v10;
        goto LABEL_14;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v10));
      objc_msgSend(v11, "setObject:forKeyedSubscript:", &off_739D18, CFSTR("gen"));
      v12 = (_UNKNOWN **)objc_msgSend(v11, "copy");
    }
    v17 = v12;

LABEL_14:
    GTAGXPerfStateControl::~GTAGXPerfStateControl(&v27);
LABEL_15:

    v15 = 0;
    goto LABEL_16;
  }
  v13 = objc_alloc((Class)NSError);
  v24 = NSLocalizedDescriptionKey;
  v25 = CFSTR("Query request happened before replayer data source is loaded");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
  v15 = objc_msgSend(v13, "initWithDomain:code:userInfo:", CFSTR("com.apple.gputools.MTLReplayer"), 104, v14);

  v17 = 0;
LABEL_16:
  v21 = (void *)objc_opt_new(GTReplayResponse, v16);
  objc_msgSend(v21, "setRequestID:", *(_QWORD *)(a1 + 48));
  if (v15)
  {
    objc_msgSend(v21, "setData:", 0);
  }
  else
  {
    v23 = 0;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v17, 1, &v23));
    v15 = v23;
    objc_msgSend(v21, "setData:", v22);

  }
  objc_msgSend(v21, "setError:", v15);
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v21, *(int *)(a1 + 56));

}

void __28__GTMTLReplayService_query___block_invoke_61(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  dispatch_data_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  _OWORD buffer[5];
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const __CFString *v25;
  void *v26;

  v22 = 0;
  memset(buffer, 0, sizeof(buffer));
  v25 = CFSTR("MTLBuffer-0xfffffffffffffabd-Fetch");
  v5 = *(_QWORD *)(a1 + 56);
  v6 = a3;
  v7 = a2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v5));
  v26 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56)));
  v23 = v10;
  v24 = *(_QWORD *)(a1 + 32);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
  v12 = NewResourceData(v7, v6, v9, v11, 0, (uint64_t)buffer, &v22, *(_QWORD *)(a1 + 64), &_dispatch_data_empty);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = dispatch_data_create(buffer, 0x50uLL, 0, &__block_literal_global_65);
  v15 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v15, "setObject:forKey:", v14, CFSTR("info"));
  objc_msgSend(v15, "setObject:forKey:", v13, CFSTR("data"));
  v16 = objc_alloc_init((Class)GTReplayResponse);
  objc_msgSend(v16, "setRequestID:", *(_QWORD *)(a1 + 56));
  v17 = objc_msgSend(v15, "copy");
  v20 = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v17, 1, &v20));
  v19 = v20;
  objc_msgSend(v16, "setData:", v18);

  objc_msgSend(v16, "setError:", v19);
  objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", v16, *(int *)(a1 + 72));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __28__GTMTLReplayService_query___block_invoke_3_73(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  if (!*(_BYTE *)(a2 + 24))
  {
    v3 = objc_alloc_init((Class)GTReplayConfiguration);
    objc_msgSend(v3, "setForceLoadActionClear:", dword_75313C & 1);
    objc_msgSend(v3, "setForceLoadUnusedResources:", (dword_75313C >> 10) & 1);
    objc_msgSend(v3, "setForceWaitUntilCompleted:", (dword_75313C >> 1) & 1);
    objc_msgSend(v3, "setDisableOptimizeRestores:", (dword_75313C >> 4) & 1);
    objc_msgSend(v3, "setEnableDisplayOnDevice:", (dword_75313C & 0x20) == 0);
    objc_msgSend(v3, "setDisableHeapTextureCompression:", (dword_75313C >> 13) & 1);
    objc_msgSend(v3, "setEnableReplayFromOtherPlatforms:", (dword_75313C >> 19) & 1);
    objc_msgSend(v3, "setEnableCapture:", HIBYTE(dword_75313C) & 1);
    objc_msgSend(v3, "setEnableHUD:", (dword_75313C >> 25) & 1);
    v5 = (void *)objc_opt_new(GTReplayResponse, v4);
    objc_msgSend(v5, "setRequestID:", *(_QWORD *)(a1 + 40));
    v8 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v8));
    v7 = v8;
    objc_msgSend(v5, "setData:", v6);

    objc_msgSend(v5, "setError:", v7);
    objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v5, *(int *)(a1 + 48));

  }
}

void __28__GTMTLReplayService_query___block_invoke_4_76(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  if (!*(_BYTE *)(a2 + 24))
  {
    v3 = (void *)objc_opt_new(GTReplaySessionInfo, a2);
    objc_msgSend(v3, "setGputraceURL:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "setShaderDebuggerVersion:", 3);
    objc_msgSend(v3, "setShaderProfilerVersion:", 4);
    objc_msgSend(v3, "setAccelerationViewerVersion:", 11);
    v5 = (void *)objc_opt_new(GTReplayResponse, v4);
    objc_msgSend(v5, "setRequestID:", *(_QWORD *)(a1 + 48));
    v8 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v8));
    v7 = v8;
    objc_msgSend(v5, "setData:", v6);

    objc_msgSend(v5, "setError:", v7);
    objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", v5, *(int *)(a1 + 56));

  }
}

id __34__GTMTLReplayService_notifyError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "notifyError:", *(_QWORD *)(a1 + 32));
}

void __38__GTMTLReplayService_terminateProcess__block_invoke(id a1)
{
  exit(0);
}

void __33__GTMTLReplayService_load_error___block_invoke(_QWORD *a1)
{
  apr_pool_t **v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  Block_layout *v7;
  void *v8;
  unsigned int v9;
  apr_pool_t *v10;
  id v11;
  apr_status_t (__cdecl *v12)(void *);
  void *v13;
  BOOL v14;
  id v15;

  v2 = (apr_pool_t **)a1[6];
  v3 = (void *)a1[4];
  v4 = GTTransportArchiveDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v3;
  v15 = v5;
  v7 = &__block_literal_global_817;
  if (v6
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scheme")),
        v9 = objc_msgSend(v8, "isEqualToString:", NSURLFileScheme),
        v8,
        v9))
  {
    if (objc_msgSend(v6, "startAccessingSecurityScopedResource"))
    {
      v10 = *v2;
      v11 = v6;
      apr_pool_cleanup_register(v10, v11, (apr_status_t (__cdecl *)(void *))CleanupSandboxExtensionURL, v12);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
    v14 = BeginDebugArchivePath(v2, v13, v15, 0, &__block_literal_global_817);

  }
  else
  {
    v14 = 0;
  }

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v14;
}

@end
