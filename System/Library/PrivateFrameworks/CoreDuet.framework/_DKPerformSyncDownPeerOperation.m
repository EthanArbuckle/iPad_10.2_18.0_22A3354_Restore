@implementation _DKPerformSyncDownPeerOperation

- (id)initWithParent:(void *)a3 localStorage:(void *)a4 transport:(void *)a5 peer:(void *)a6 policy:(void *)a7 type:
{
  id v14;
  id v15;
  id v16;
  id *v17;
  id *v18;
  uint64_t v19;
  id v20;
  id v22;
  id v23;
  objc_super v24;

  v14 = a3;
  v23 = a4;
  v15 = a5;
  v22 = a6;
  v16 = a7;
  if (a1)
  {
    v24.receiver = a1;
    v24.super_class = (Class)_DKPerformSyncDownPeerOperation;
    v17 = (id *)objc_msgSendSuper2(&v24, sel_initWithParent_, a2);
    v18 = v17;
    if (v17)
    {
      objc_storeStrong(v17 + 37, a3);
      objc_storeStrong(v18 + 38, a4);
      objc_storeStrong(v18 + 39, a5);
      objc_storeStrong(v18 + 40, a6);
      objc_storeStrong(v18 + 41, a7);
      v19 = objc_opt_new();
      v20 = v18[42];
      v18[42] = (id)v19;

    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  uint64_t v3;

  v3 = objc_opt_class();
  if (+[_DKSync2Coordinator shouldDeferSyncOperationWithClass:syncType:transport:peer:policy:]((uint64_t)_DKSync2Coordinator, v3, self->_type, self->_transport, self->_peer, self->_policy))-[_DKPerformSyncDownPeerOperation endOperation](self, "endOperation");
  else
    -[_DKPerformSyncDownPeerOperation performSyncDownPeer]((id *)&self->super.super.super.super.isa);
}

- (void)performSyncDownPeer
{
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  void *v39;
  __CFString *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *log;

  OUTLINED_FUNCTION_6_0();
  a30 = v31;
  a31 = v32;
  log = v33;
  v35 = v34;
  objc_msgSend((id)OUTLINED_FUNCTION_7_3(), "description");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(v35 + 336), "count"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(v35 + 304), "transportType") == 8)
    v38 = "up to";
  else
    v38 = "down from";
  v39 = &OBJC_IVAR____CDMemoryUsageInterval__startingLifetimeMaxMemoryUsage;
  v40 = &stru_1E26E9728;
  if (objc_msgSend((id)OUTLINED_FUNCTION_8_3(), "me"))
    v41 = CFSTR("pseudo ");
  else
    v41 = &stru_1E26E9728;
  objc_msgSend((id)OUTLINED_FUNCTION_8_3(), "identifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_3(), "model");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)OUTLINED_FUNCTION_8_3(), "model");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "stringWithFormat:", CFSTR(" (%@)"));
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(v35 + 304), "name");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(buf) = 138544898;
  *(_QWORD *)((char *)&buf + 4) = v36;
  WORD6(buf) = 2112;
  *(_QWORD *)((char *)&buf + 14) = v37;
  a14 = 2082;
  a15 = v38;
  LOWORD(a16) = 2114;
  *(_QWORD *)((char *)&a16 + 2) = v41;
  WORD5(a16) = 2114;
  *(_QWORD *)((char *)&a16 + 12) = v42;
  WORD2(a17) = 2114;
  *(_QWORD *)((char *)&a17 + 6) = v40;
  HIWORD(a17) = 2114;
  a18 = v45;
  _os_log_debug_impl(&dword_18DDBE000, log, OS_LOG_TYPE_DEBUG, "%{public}@: Done queuing %@ subordinate operation for sync %{public}s %{public}@peer %{public}@%{public}@ on transport %{public}@", (uint8_t *)&buf, 0x48u);

  if (v43)
  {

  }
  OUTLINED_FUNCTION_1_0();
}

+ (void)_updateEventStatsWithTransportType:(uint64_t)a1
{
  __CFString *v3;

  objc_opt_self();
  if (_updateEventStatsWithTransportType__rapportVsCloudOptimizationCounterInitialized != -1)
    dispatch_once(&_updateEventStatsWithTransportType__rapportVsCloudOptimizationCounterInitialized, &__block_literal_global_17);
  if (a2 == 1)
    v3 = CFSTR("Rapport");
  else
    v3 = CFSTR("Cloud");
  -[_DKEventTypeStatsCounter incrementCountByNumber:typeValue:](_updateEventStatsWithTransportType__rapportVsCloudOptimizationCounter, 1, v3);
}

- (void)addSyncDownPeerAdditionsOperation
{
  void *v2;
  id *v3;

  if (a1)
  {
    v3 = -[_DKPerformSyncDownPeerAdditionsOperation initWithParent:localStorage:transport:peer:policy:type:]([_DKPerformSyncDownPeerAdditionsOperation alloc], (uint64_t)a1, a1[37], a1[38], a1[39], a1[40], a1[41]);
    if (objc_msgSend(a1[42], "count"))
    {
      objc_msgSend(a1[42], "lastObject");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addDependency:", v2);

    }
    objc_msgSend(a1[42], "addObject:", v3);

  }
}

- (void)addSyncDownPeerDeletionsOperation
{
  void *v2;
  id *v3;

  if (a1)
  {
    v3 = -[_DKPerformSyncDownPeerDeletionsOperation initWithParent:localStorage:transport:peer:policy:type:]([_DKPerformSyncDownPeerDeletionsOperation alloc], (uint64_t)a1, a1[37], a1[38], a1[39], a1[40], a1[41]);
    if (objc_msgSend(a1[42], "count"))
    {
      objc_msgSend(a1[42], "lastObject");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addDependency:", v2);

    }
    objc_msgSend(a1[42], "addObject:", v3);

  }
}

- (void)endOperation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_DKPerformSyncDownPeerOperation;
  -[_DKSyncCompositeOperation endOperation](&v2, sel_endOperation);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_peer, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_localStorage, 0);
}

@end
