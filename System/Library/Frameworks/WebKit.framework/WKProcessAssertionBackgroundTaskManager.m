@implementation WKProcessAssertionBackgroundTaskManager

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_BYTE *)self + 16) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_BYTE *)self + 40) = 0;
  *((_QWORD *)self + 7) = 0;
  return self;
}

- (void)addAssertionNeedingBackgroundTask:(void *)a3
{
  Lock *p_m_lock;
  void *v7;
  unsigned __int8 *v8;
  uint64_t *p_assertionsNeedingBackgroundTask;
  unsigned int m_maxOperationCountWithoutCleanup;
  unsigned int v11;
  _DWORD *m_tableForLLDB;
  int v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  _QWORD *v17;
  char *v18;
  unsigned __int8 **v19;
  WTF::ThreadSafeWeakPtrControlBlock *v20;
  unsigned __int8 *v21;
  uint64_t v22;
  int v23;
  unsigned int v24;
  unsigned int v26;
  int v27;
  int v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unsigned int v32;
  char *v33;
  void *v34;
  char *v35;
  int v36;
  unsigned __int8 *v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  unint64_t v43;
  int v44;
  uint64_t *v45;

  if (!WTF::ThreadSafeWeakPtrControlBlock::objectHasStartedDeletion(*((WTF::ThreadSafeWeakPtrControlBlock **)a3 + 1)))
  {
    p_m_lock = &self->_assertionsNeedingBackgroundTask.m_lock;
    if (__ldaxr(&self->_assertionsNeedingBackgroundTask.m_lock.m_byte.value.__a_.__a_value))
    {
      __clrex();
    }
    else if (!__stxr(1u, &p_m_lock->m_byte.value.__a_.__a_value))
    {
      goto LABEL_6;
    }
    MEMORY[0x19AEABB3C](&self->_assertionsNeedingBackgroundTask.m_lock);
LABEL_6:
    v8 = (unsigned __int8 *)WTF::ThreadSafeWeakPtrControlBlock::weakRef(*((WTF::ThreadSafeWeakPtrControlBlock **)a3 + 1));
    if (!v8)
      goto LABEL_58;
    p_assertionsNeedingBackgroundTask = (uint64_t *)&self->_assertionsNeedingBackgroundTask;
    m_maxOperationCountWithoutCleanup = self->_assertionsNeedingBackgroundTask.m_maxOperationCountWithoutCleanup;
    v11 = self->_assertionsNeedingBackgroundTask.m_operationCountSinceLastCleanup + 1;
    self->_assertionsNeedingBackgroundTask.m_operationCountSinceLastCleanup = v11;
    m_tableForLLDB = self->_assertionsNeedingBackgroundTask.m_map.m_impl.var0.m_tableForLLDB;
    if (v11 <= m_maxOperationCountWithoutCleanup)
    {
LABEL_35:
      if (m_tableForLLDB
        || (WTF::HashTable<WebKit::ProcessAndUIAssertion const*,WTF::KeyValuePair<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>>,WTF::DefaultHash<WebKit::ProcessAndUIAssertion const*>,WTF::HashMap<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>,WTF::DefaultHash<WebKit::ProcessAndUIAssertion const*>,WTF::HashTraits<WebKit::ProcessAndUIAssertion const*>,WTF::HashTraits<WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WebKit::ProcessAndUIAssertion const*>>::expand(p_assertionsNeedingBackgroundTask),
            (m_tableForLLDB = (_DWORD *)*p_assertionsNeedingBackgroundTask) != 0))
      {
        v28 = *(m_tableForLLDB - 2);
      }
      else
      {
        v28 = 0;
      }
      v29 = ((unint64_t)a3 + ~((_QWORD)a3 << 32)) ^ (((unint64_t)a3 + ~((_QWORD)a3 << 32)) >> 22);
      v30 = 9 * ((v29 + ~(v29 << 13)) ^ ((v29 + ~(v29 << 13)) >> 8));
      v31 = (v30 ^ (v30 >> 15)) + ~((v30 ^ (v30 >> 15)) << 27);
      v32 = v28 & ((v31 >> 31) ^ v31);
      v33 = (char *)&m_tableForLLDB[4 * v32];
      v34 = *(void **)v33;
      if (*(_QWORD *)v33)
      {
        v35 = 0;
        v36 = 1;
        do
        {
          if (v34 == a3)
          {
            WTF::ThreadSafeWeakPtrControlBlock::weakDeref(v8, v7);
            goto LABEL_58;
          }
          if (v34 == (void *)-1)
            v35 = v33;
          v32 = (v32 + v36) & v28;
          v33 = (char *)&m_tableForLLDB[4 * v32];
          v34 = *(void **)v33;
          ++v36;
        }
        while (*(_QWORD *)v33);
        if (v35)
        {
          *(_QWORD *)v35 = 0;
          *((_QWORD *)v35 + 1) = 0;
          --*(_DWORD *)(*p_assertionsNeedingBackgroundTask - 16);
          v33 = v35;
        }
      }
      v37 = (unsigned __int8 *)*((_QWORD *)v33 + 1);
      *(_QWORD *)v33 = a3;
      *((_QWORD *)v33 + 1) = v8;
      if (v37)
        WTF::ThreadSafeWeakPtrControlBlock::weakDeref(v37, v7);
      v38 = *p_assertionsNeedingBackgroundTask;
      if (*p_assertionsNeedingBackgroundTask)
        v39 = *(_DWORD *)(v38 - 12) + 1;
      else
        v39 = 1;
      *(_DWORD *)(v38 - 12) = v39;
      v40 = *p_assertionsNeedingBackgroundTask;
      if (*p_assertionsNeedingBackgroundTask)
        v41 = *(_DWORD *)(v40 - 12);
      else
        v41 = 0;
      v42 = (*(_DWORD *)(v40 - 16) + v41);
      v43 = *(unsigned int *)(v40 - 4);
      if (v43 > 0x400)
      {
        if (v43 > 2 * v42)
        {
LABEL_58:
          v44 = __ldxr(&p_m_lock->m_byte.value.__a_.__a_value);
          if (v44 == 1)
          {
            if (!__stlxr(0, &p_m_lock->m_byte.value.__a_.__a_value))
              goto LABEL_63;
          }
          else
          {
            __clrex();
          }
          WTF::Lock::unlockSlow((WTF::Lock *)&self->_assertionsNeedingBackgroundTask.m_lock);
LABEL_63:
          -[WKProcessAssertionBackgroundTaskManager _updateBackgroundTask](self, "_updateBackgroundTask");
          return;
        }
      }
      else if (3 * v43 > 4 * v42)
      {
        goto LABEL_58;
      }
      WTF::HashTable<WebKit::ProcessAndUIAssertion const*,WTF::KeyValuePair<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>>,WTF::DefaultHash<WebKit::ProcessAndUIAssertion const*>,WTF::HashMap<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>,WTF::DefaultHash<WebKit::ProcessAndUIAssertion const*>,WTF::HashTraits<WebKit::ProcessAndUIAssertion const*>,WTF::HashTraits<WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WebKit::ProcessAndUIAssertion const*>>::expand(p_assertionsNeedingBackgroundTask);
      goto LABEL_58;
    }
    if (m_tableForLLDB)
    {
      v13 = *(m_tableForLLDB - 1);
      if (!v13)
        goto LABEL_29;
      v45 = (uint64_t *)&self->_assertionsNeedingBackgroundTask;
      v14 = 0;
      v15 = v13 - 1;
      do
      {
        v16 = v15;
        v17 = &m_tableForLLDB[4 * v15];
        if ((unint64_t)(*v17 + 1) >= 2)
        {
          v18 = (char *)&m_tableForLLDB[4 * v15];
          v20 = (WTF::ThreadSafeWeakPtrControlBlock *)*((_QWORD *)v18 + 1);
          v19 = (unsigned __int8 **)(v18 + 8);
          if (WTF::ThreadSafeWeakPtrControlBlock::objectHasStartedDeletion(v20))
          {
            *v17 = -1;
            v21 = *v19;
            *v19 = 0;
            if (v21)
              WTF::ThreadSafeWeakPtrControlBlock::weakDeref(v21, v7);
            ++v14;
          }
        }
        --v15;
      }
      while (v16);
      p_assertionsNeedingBackgroundTask = (uint64_t *)&self->_assertionsNeedingBackgroundTask;
      m_tableForLLDB = (_DWORD *)*v45;
      if (v14)
      {
        *(m_tableForLLDB - 4) += v14;
        v22 = *v45;
        if (*v45)
          v23 = *(_DWORD *)(v22 - 12);
        else
          v23 = 0;
        *(_DWORD *)(v22 - 12) = v23 - v14;
        m_tableForLLDB = (_DWORD *)*v45;
      }
      if (m_tableForLLDB)
      {
        v24 = *(m_tableForLLDB - 1);
        if (v24 >= 9 && 6 * *(m_tableForLLDB - 3) < v24)
        {
          WTF::HashTable<WebKit::ProcessAndUIAssertion const*,WTF::KeyValuePair<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>>,WTF::DefaultHash<WebKit::ProcessAndUIAssertion const*>,WTF::HashMap<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>,WTF::DefaultHash<WebKit::ProcessAndUIAssertion const*>,WTF::HashTraits<WebKit::ProcessAndUIAssertion const*>,WTF::HashTraits<WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WebKit::ProcessAndUIAssertion const*>>::shrinkToBestSize(v45);
          m_tableForLLDB = self->_assertionsNeedingBackgroundTask.m_map.m_impl.var0.m_tableForLLDB;
          self->_assertionsNeedingBackgroundTask.m_operationCountSinceLastCleanup = 0;
          if (!m_tableForLLDB)
          {
            v26 = 0;
            goto LABEL_33;
          }
LABEL_30:
          v26 = *(m_tableForLLDB - 3);
          v27 = 0x7FFFFFFF;
          if (v26 >= 0x7FFFFFFF)
            goto LABEL_34;
          goto LABEL_33;
        }
LABEL_29:
        self->_assertionsNeedingBackgroundTask.m_operationCountSinceLastCleanup = 0;
        goto LABEL_30;
      }
    }
    m_tableForLLDB = 0;
    v26 = 0;
    self->_assertionsNeedingBackgroundTask.m_operationCountSinceLastCleanup = 0;
LABEL_33:
    v27 = v26;
LABEL_34:
    self->_assertionsNeedingBackgroundTask.m_maxOperationCountWithoutCleanup = 2 * v27;
    goto LABEL_35;
  }
  __break(0xC471u);
}

- (void)_updateBackgroundTask
{
  ThreadSafeWeakHashSet<WebKit::ProcessAndUIAssertion> *p_assertionsNeedingBackgroundTask;
  _BOOL8 isEmptyIgnoringNullReferences;
  _QWORD *v5;
  uint64_t v6;
  unsigned __int8 v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *m_ptr;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[24];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_assertionsNeedingBackgroundTask = &self->_assertionsNeedingBackgroundTask;
  if (WTF::ThreadSafeWeakHashSet<WebKit::ProcessAndUIAssertion>::isEmptyIgnoringNullReferences((uint64_t)&self->_assertionsNeedingBackgroundTask)
    || -[WKProcessAssertionBackgroundTaskManager _hasBackgroundTask](self, "_hasBackgroundTask")
    && (v7 = atomic_load((unsigned __int8 *)&self->_backgroundTaskWasInvalidated), (v7 & 1) == 0))
  {
    isEmptyIgnoringNullReferences = WTF::ThreadSafeWeakHashSet<WebKit::ProcessAndUIAssertion>::isEmptyIgnoringNullReferences((uint64_t)p_assertionsNeedingBackgroundTask);
    if (isEmptyIgnoringNullReferences)
    {
      WTF::RunLoop::main((WTF::RunLoop *)isEmptyIgnoringNullReferences);
      if (self)
        CFRetain(self);
      v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
      *v5 = &off_1E34C9978;
      v5[1] = self;
      v5[2] = self;
      *(_QWORD *)buf = v5;
      WTF::RunLoop::dispatch();
      v6 = *(_QWORD *)buf;
      *(_QWORD *)buf = 0;
      if (v6)
        (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess"), "activeLimitations"), "runTime");
    v9 = v8;
    v10 = *MEMORY[0x1E0D87E30];
    v11 = qword_1ECE71640;
    v12 = os_log_type_enabled((os_log_t)qword_1ECE71640, OS_LOG_TYPE_DEFAULT);
    if (v9 != v10)
    {
      if (!v12)
        return;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = self;
      v13 = "%p - WKProcessAssertionBackgroundTaskManager: Ignored request to start a new background task because Running"
            "Board has already started the expiration timer";
      v14 = v11;
      v15 = 12;
      goto LABEL_18;
    }
    if (v12)
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_196BCC000, v11, OS_LOG_TYPE_DEFAULT, "%p - WKProcessAssertionBackgroundTaskManager: beginBackgroundTaskWithName", buf, 0xCu);
    }
    v16 = objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
    v17 = objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("FinishTaskInterruptable"));
    v18 = objc_alloc(MEMORY[0x1E0D87C98]);
    v22 = v17;
    v19 = (void *)objc_msgSend(v18, "initWithExplanation:target:attributes:", CFSTR("WebKit UIProcess background task"), v16, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1));
    m_ptr = self->_backgroundTask.m_ptr;
    self->_backgroundTask.m_ptr = v19;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      v19 = self->_backgroundTask.m_ptr;
    }
    objc_msgSend(v19, "addObserver:", self);
    atomic_store(0, (unsigned __int8 *)&self->_backgroundTaskWasInvalidated);
    objc_msgSend(self->_backgroundTask.m_ptr, "acquireWithInvalidationHandler:", 0);
    v21 = qword_1ECE71640;
    if (os_log_type_enabled((os_log_t)qword_1ECE71640, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "WKProcessAssertionBackgroundTaskManager: Took a FinishTaskInterruptable assertion for own process";
      v14 = v21;
      v15 = 2;
LABEL_18:
      _os_log_impl(&dword_196BCC000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
    }
  }
}

- (BOOL)_hasBackgroundTask
{
  return self->_backgroundTask.m_ptr != 0;
}

+ (id)shared
{
  id result;

  if (_MergedGlobals_108 == 1)
    return (id)qword_1EE3417A8;
  result = (id)objc_opt_new();
  qword_1EE3417A8 = (uint64_t)result;
  _MergedGlobals_108 = 1;
  return result;
}

- (WKProcessAssertionBackgroundTaskManager)init
{
  WKProcessAssertionBackgroundTaskManager *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[5];
  _QWORD v11[5];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WKProcessAssertionBackgroundTaskManager;
  v2 = -[WKProcessAssertionBackgroundTaskManager init](&v12, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = *MEMORY[0x1E0CEB350];
    v5 = objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __47__WKProcessAssertionBackgroundTaskManager_init__block_invoke;
    v11[3] = &unk_1E34C90A0;
    v11[4] = v2;
    objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, v5, 0, v11);
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = *MEMORY[0x1E0CEB288];
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __47__WKProcessAssertionBackgroundTaskManager_init__block_invoke_2;
    v10[3] = &unk_1E34C90A0;
    v10[4] = v2;
    objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", v8, objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), 0, v10);
  }
  return v2;
}

uint64_t __47__WKProcessAssertionBackgroundTaskManager_init__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_cancelPendingReleaseTask");
  return objc_msgSend(*(id *)(a1 + 32), "_updateBackgroundTask");
}

uint64_t __47__WKProcessAssertionBackgroundTaskManager_init__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_hasBackgroundTask");
  if ((result & 1) == 0)
    return WebKit::WebProcessPool::notifyProcessPoolsApplicationIsAboutToSuspend((WebKit::WebProcessPool *)result);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[WKProcessAssertionBackgroundTaskManager _releaseBackgroundTask](self, "_releaseBackgroundTask");
  v3.receiver = self;
  v3.super_class = (Class)WKProcessAssertionBackgroundTaskManager;
  -[WKProcessAssertionBackgroundTaskManager dealloc](&v3, sel_dealloc);
}

- (void)removeAssertionNeedingBackgroundTask:(void *)a3
{
  Lock *p_m_lock;
  uint64_t *p_assertionsNeedingBackgroundTask;
  unsigned int m_maxOperationCountWithoutCleanup;
  unsigned int v9;
  _DWORD *m_tableForLLDB;
  int v11;
  int v12;
  unsigned int v13;
  uint64_t v14;
  _QWORD *v15;
  char *v16;
  unsigned __int8 **v17;
  WTF::ThreadSafeWeakPtrControlBlock *v18;
  unsigned __int8 *v19;
  uint64_t v20;
  int v21;
  unsigned int v22;
  unsigned int v24;
  int v25;
  unsigned int v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  int v32;
  uint64_t v33;
  _QWORD *v34;
  WTF::ThreadSafeWeakPtrControlBlock *v35;
  unsigned __int8 **v36;
  _QWORD *v37;
  unsigned __int8 *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  unsigned int v42;
  unsigned int v43;
  int v45;
  uint64_t *v46;

  p_m_lock = &self->_assertionsNeedingBackgroundTask.m_lock;
  if (__ldaxr(&self->_assertionsNeedingBackgroundTask.m_lock.m_byte.value.__a_.__a_value))
  {
    __clrex();
  }
  else if (!__stxr(1u, &p_m_lock->m_byte.value.__a_.__a_value))
  {
    goto LABEL_5;
  }
  MEMORY[0x19AEABB3C](&self->_assertionsNeedingBackgroundTask.m_lock, a2);
LABEL_5:
  p_assertionsNeedingBackgroundTask = (uint64_t *)&self->_assertionsNeedingBackgroundTask;
  m_maxOperationCountWithoutCleanup = self->_assertionsNeedingBackgroundTask.m_maxOperationCountWithoutCleanup;
  v9 = self->_assertionsNeedingBackgroundTask.m_operationCountSinceLastCleanup + 1;
  self->_assertionsNeedingBackgroundTask.m_operationCountSinceLastCleanup = v9;
  m_tableForLLDB = self->_assertionsNeedingBackgroundTask.m_map.m_impl.var0.m_tableForLLDB;
  if (v9 > m_maxOperationCountWithoutCleanup)
  {
    if (m_tableForLLDB)
    {
      v11 = *(m_tableForLLDB - 1);
      if (!v11)
        goto LABEL_27;
      v46 = (uint64_t *)&self->_assertionsNeedingBackgroundTask;
      v12 = 0;
      v13 = v11 - 1;
      do
      {
        v14 = v13;
        v15 = &m_tableForLLDB[4 * v13];
        if ((unint64_t)(*v15 + 1) >= 2)
        {
          v16 = (char *)&m_tableForLLDB[4 * v13];
          v18 = (WTF::ThreadSafeWeakPtrControlBlock *)*((_QWORD *)v16 + 1);
          v17 = (unsigned __int8 **)(v16 + 8);
          if (WTF::ThreadSafeWeakPtrControlBlock::objectHasStartedDeletion(v18))
          {
            *v15 = -1;
            v19 = *v17;
            *v17 = 0;
            if (v19)
              WTF::ThreadSafeWeakPtrControlBlock::weakDeref(v19, (void *)a2);
            ++v12;
          }
        }
        --v13;
      }
      while (v14);
      p_assertionsNeedingBackgroundTask = (uint64_t *)&self->_assertionsNeedingBackgroundTask;
      m_tableForLLDB = (_DWORD *)*v46;
      if (v12)
      {
        *(m_tableForLLDB - 4) += v12;
        v20 = *v46;
        if (*v46)
          v21 = *(_DWORD *)(v20 - 12);
        else
          v21 = 0;
        *(_DWORD *)(v20 - 12) = v21 - v12;
        m_tableForLLDB = (_DWORD *)*v46;
      }
      if (m_tableForLLDB)
      {
        v22 = *(m_tableForLLDB - 1);
        if (v22 >= 9 && 6 * *(m_tableForLLDB - 3) < v22)
        {
          WTF::HashTable<WebKit::ProcessAndUIAssertion const*,WTF::KeyValuePair<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>>,WTF::DefaultHash<WebKit::ProcessAndUIAssertion const*>,WTF::HashMap<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>,WTF::DefaultHash<WebKit::ProcessAndUIAssertion const*>,WTF::HashTraits<WebKit::ProcessAndUIAssertion const*>,WTF::HashTraits<WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WebKit::ProcessAndUIAssertion const*>>::shrinkToBestSize(v46);
          m_tableForLLDB = self->_assertionsNeedingBackgroundTask.m_map.m_impl.var0.m_tableForLLDB;
          self->_assertionsNeedingBackgroundTask.m_operationCountSinceLastCleanup = 0;
          if (!m_tableForLLDB)
          {
            v24 = 0;
            goto LABEL_31;
          }
LABEL_28:
          v24 = *(m_tableForLLDB - 3);
          v25 = 0x7FFFFFFF;
          if (v24 >= 0x7FFFFFFF)
            goto LABEL_32;
          goto LABEL_31;
        }
LABEL_27:
        self->_assertionsNeedingBackgroundTask.m_operationCountSinceLastCleanup = 0;
        goto LABEL_28;
      }
    }
    m_tableForLLDB = 0;
    v24 = 0;
    self->_assertionsNeedingBackgroundTask.m_operationCountSinceLastCleanup = 0;
LABEL_31:
    v25 = v24;
LABEL_32:
    self->_assertionsNeedingBackgroundTask.m_maxOperationCountWithoutCleanup = 2 * v25;
  }
  if (m_tableForLLDB)
  {
    v26 = *(m_tableForLLDB - 2);
    v27 = ((unint64_t)a3 + ~((_QWORD)a3 << 32)) ^ (((unint64_t)a3 + ~((_QWORD)a3 << 32)) >> 22);
    v28 = 9 * ((v27 + ~(v27 << 13)) ^ ((v27 + ~(v27 << 13)) >> 8));
    v29 = (v28 ^ (v28 >> 15)) + ~((v28 ^ (v28 >> 15)) << 27);
    v30 = v26 & ((v29 >> 31) ^ v29);
    v31 = *(void **)&m_tableForLLDB[4 * v30];
    if (v31 != a3)
    {
      v32 = 1;
      while (v31)
      {
        v30 = ((_DWORD)v30 + v32) & v26;
        v31 = *(void **)&m_tableForLLDB[4 * v30];
        ++v32;
        if (v31 == a3)
          goto LABEL_40;
      }
      v30 = *(m_tableForLLDB - 1);
    }
LABEL_40:
    v33 = *(m_tableForLLDB - 1);
    if (v30 != v33)
    {
      v34 = &m_tableForLLDB[4 * v30];
      v36 = (unsigned __int8 **)(v34 + 1);
      v35 = (WTF::ThreadSafeWeakPtrControlBlock *)v34[1];
      if (v35)
      {
        WTF::ThreadSafeWeakPtrControlBlock::objectHasStartedDeletion(v35);
        m_tableForLLDB = (_DWORD *)*p_assertionsNeedingBackgroundTask;
        if (!*p_assertionsNeedingBackgroundTask)
        {
          v37 = 0;
LABEL_47:
          if (v37 != v34)
          {
            *v34 = -1;
            v38 = *v36;
            *v36 = 0;
            if (v38)
              WTF::ThreadSafeWeakPtrControlBlock::weakDeref(v38, (void *)a2);
            ++*(_DWORD *)(*p_assertionsNeedingBackgroundTask - 16);
            v39 = *p_assertionsNeedingBackgroundTask;
            if (*p_assertionsNeedingBackgroundTask)
              v40 = *(_DWORD *)(v39 - 12) - 1;
            else
              v40 = -1;
            *(_DWORD *)(v39 - 12) = v40;
            v41 = *p_assertionsNeedingBackgroundTask;
            if (*p_assertionsNeedingBackgroundTask)
            {
              v42 = 6 * *(_DWORD *)(v41 - 12);
              v43 = *(_DWORD *)(v41 - 4);
              if (v42 < v43 && v43 >= 9)
                WTF::HashTable<WebKit::ProcessAndUIAssertion const*,WTF::KeyValuePair<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>>,WTF::DefaultHash<WebKit::ProcessAndUIAssertion const*>,WTF::HashMap<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>,WTF::DefaultHash<WebKit::ProcessAndUIAssertion const*>,WTF::HashTraits<WebKit::ProcessAndUIAssertion const*>,WTF::HashTraits<WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WebKit::ProcessAndUIAssertion const*>>::rehash(p_assertionsNeedingBackgroundTask, v43 >> 1);
            }
          }
          goto LABEL_62;
        }
        v33 = *(m_tableForLLDB - 1);
      }
      v37 = &m_tableForLLDB[4 * v33];
      if (v37 == v34)
        goto LABEL_62;
      goto LABEL_47;
    }
  }
LABEL_62:
  v45 = __ldxr(&p_m_lock->m_byte.value.__a_.__a_value);
  if (v45 != 1)
  {
    __clrex();
    goto LABEL_66;
  }
  if (__stlxr(0, &p_m_lock->m_byte.value.__a_.__a_value))
LABEL_66:
    WTF::Lock::unlockSlow((WTF::Lock *)p_m_lock);
}

- (void)_notifyAssertionsOfImminentSuspension
{
  Lock *p_m_lock;
  ThreadSafeWeakHashSet<WebKit::ProcessAndUIAssertion> *p_assertionsNeedingBackgroundTask;
  unsigned int *m_tableForLLDB;
  uint64_t v7;
  WTF *v8;
  char *m_table;
  const char *v10;
  SEL v11;
  SEL v12;
  const char *v13;
  int v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  WTF *v19;
  uint64_t v20;
  WTF *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _DWORD *v25;
  int v26;
  int v27;
  unsigned int v28;
  uint64_t v29;
  _QWORD *v30;
  char *v31;
  unsigned __int8 **v32;
  WTF::ThreadSafeWeakPtrControlBlock *v33;
  unsigned __int8 *v34;
  _DWORD *v35;
  int v36;
  unsigned int v37;
  unsigned int v39;
  int v40;
  int v41;
  WTF *v42;
  uint64_t v43;
  uint64_t v44;
  WTF *v45;
  uint64_t v46;
  WTF *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v45 = 0;
  v46 = 0;
  p_m_lock = &self->_assertionsNeedingBackgroundTask.m_lock;
  if (__ldaxr(&self->_assertionsNeedingBackgroundTask.m_lock.m_byte.value.__a_.__a_value))
  {
    __clrex();
LABEL_4:
    MEMORY[0x19AEABB3C](&self->_assertionsNeedingBackgroundTask.m_lock, a2);
    goto LABEL_5;
  }
  if (__stxr(1u, &p_m_lock->m_byte.value.__a_.__a_value))
    goto LABEL_4;
LABEL_5:
  p_assertionsNeedingBackgroundTask = &self->_assertionsNeedingBackgroundTask;
  v47 = 0;
  v48 = 0;
  m_tableForLLDB = self->_assertionsNeedingBackgroundTask.m_map.m_impl.var0.m_tableForLLDB;
  if (!m_tableForLLDB || (v7 = *(m_tableForLLDB - 3), !(_DWORD)v7))
  {
    v14 = 0;
    goto LABEL_32;
  }
  if (v7 >> 29)
  {
    __break(0xC471u);
    return;
  }
  v8 = (WTF *)WTF::fastMalloc((WTF *)(8 * v7));
  LODWORD(v48) = v7;
  v47 = v8;
  m_table = (char *)p_assertionsNeedingBackgroundTask->m_map.m_impl.var0.m_table;
  v10 = (const char *)WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Ref<WebKit::SimulatedInputSource,WTF::RawPtrTraits<WebKit::SimulatedInputSource>,WTF::DefaultRefDerefTraits<WebKit::SimulatedInputSource>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Ref<WebKit::SimulatedInputSource,WTF::RawPtrTraits<WebKit::SimulatedInputSource>,WTF::DefaultRefDerefTraits<WebKit::SimulatedInputSource>>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Ref<WebKit::SimulatedInputSource,WTF::RawPtrTraits<WebKit::SimulatedInputSource>,WTF::DefaultRefDerefTraits<WebKit::SimulatedInputSource>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WebKit::SimulatedInputSource,WTF::RawPtrTraits<WebKit::SimulatedInputSource>,WTF::DefaultRefDerefTraits<WebKit::SimulatedInputSource>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::begin(p_assertionsNeedingBackgroundTask->m_map.m_impl.var0.m_table);
  v11 = v10;
  v12 = a2;
  if (m_table)
  {
    v13 = &m_table[16 * *((unsigned int *)m_table - 1)];
    if (v13 == v10)
      goto LABEL_30;
  }
  else
  {
    if (!v10)
    {
LABEL_30:
      v14 = 0;
LABEL_31:
      v47 = 0;
      LODWORD(v48) = 0;
      WTF::fastFree(v8, (void *)a2);
      goto LABEL_32;
    }
    v13 = 0;
  }
  v14 = 0;
  LODWORD(v15) = 0;
  do
  {
    WTF::ThreadSafeWeakPtrControlBlock::makeStrongReferenceIfPossible<WebKit::LibWebRTCCodecsProxy>(&v50, *((WTF::Lock **)v11 + 1), *(_QWORD *)v11);
    if (v50)
    {
      v49 = v50;
      if ((_DWORD)v15 == (_DWORD)v48)
      {
        v16 = (uint64_t *)WTF::Vector<WTF::Ref<WebCore::ApplePayError,WTF::RawPtrTraits<WebCore::ApplePayError>,WTF::DefaultRefDerefTraits<WebCore::ApplePayError>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v47, v15 + 1, (unint64_t)&v49);
        v15 = HIDWORD(v48);
        v8 = v47;
        v17 = *v16;
        *v16 = 0;
        *((_QWORD *)v8 + v15) = v17;
      }
      else
      {
        v49 = 0;
        *((_QWORD *)v8 + v15) = v50;
      }
      LODWORD(v15) = v15 + 1;
      HIDWORD(v48) = v15;
      v18 = v49;
      v49 = 0;
      if (v18)
        WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaSessionHelper,(WTF::DestructionThread)0>(*(unsigned __int8 **)(v18 + 8), (void *)a2);
    }
    else
    {
      v14 = 1;
    }
    while (1)
    {
      v11 += 16;
      if (v11 == v12)
        break;
      if ((unint64_t)(*(_QWORD *)v11 + 1) > 1)
        goto LABEL_26;
    }
    v11 = v12;
LABEL_26:
    ;
  }
  while (v11 != v13);
  if (v48 > v15)
  {
    if ((_DWORD)v15)
    {
      LODWORD(v48) = v15;
      v47 = (WTF *)WTF::fastRealloc(v8, (void *)(8 * v15));
      goto LABEL_32;
    }
    if (v8)
      goto LABEL_31;
  }
LABEL_32:
  v19 = v45;
  if (HIDWORD(v46))
  {
    v20 = 8 * HIDWORD(v46);
    v21 = v45;
    do
    {
      v22 = *(_QWORD *)v21;
      *(_QWORD *)v21 = 0;
      if (v22)
        WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaSessionHelper,(WTF::DestructionThread)0>(*(unsigned __int8 **)(v22 + 8), (void *)a2);
      v21 = (WTF *)((char *)v21 + 8);
      v20 -= 8;
    }
    while (v20);
  }
  if (v19)
  {
    v45 = 0;
    LODWORD(v46) = 0;
    WTF::fastFree(v19, (void *)a2);
  }
  v45 = v47;
  v23 = v48;
  v47 = 0;
  v48 = 0;
  v46 = v23;
  WTF::Vector<WTF::Ref<WebKit::ProcessAndUIAssertion,WTF::RawPtrTraits<WebKit::ProcessAndUIAssertion>,WTF::DefaultRefDerefTraits<WebKit::ProcessAndUIAssertion>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v47, (void *)a2);
  v25 = p_assertionsNeedingBackgroundTask->m_map.m_impl.var0.m_table;
  if (v14)
  {
    if (v25)
    {
      v26 = *(v25 - 1);
      if (!v26)
        goto LABEL_61;
      v27 = 0;
      v28 = v26 - 1;
      do
      {
        v29 = v28;
        v30 = &v25[4 * v28];
        if ((unint64_t)(*v30 + 1) >= 2)
        {
          v31 = (char *)&v25[4 * v28];
          v33 = (WTF::ThreadSafeWeakPtrControlBlock *)*((_QWORD *)v31 + 1);
          v32 = (unsigned __int8 **)(v31 + 8);
          if (WTF::ThreadSafeWeakPtrControlBlock::objectHasStartedDeletion(v33))
          {
            *v30 = -1;
            v34 = *v32;
            *v32 = 0;
            if (v34)
              WTF::ThreadSafeWeakPtrControlBlock::weakDeref(v34, v24);
            ++v27;
          }
        }
        --v28;
      }
      while (v29);
      v25 = p_assertionsNeedingBackgroundTask->m_map.m_impl.var0.m_table;
      if (v27)
      {
        *(v25 - 4) += v27;
        v35 = p_assertionsNeedingBackgroundTask->m_map.m_impl.var0.m_table;
        if (p_assertionsNeedingBackgroundTask->m_map.m_impl.var0.m_table)
          v36 = *(v35 - 3);
        else
          v36 = 0;
        *(v35 - 3) = v36 - v27;
        v25 = p_assertionsNeedingBackgroundTask->m_map.m_impl.var0.m_table;
      }
      if (v25)
      {
        v37 = *(v25 - 1);
        if (v37 >= 9 && 6 * *(v25 - 3) < v37)
        {
          WTF::HashTable<WebKit::ProcessAndUIAssertion const*,WTF::KeyValuePair<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>>,WTF::DefaultHash<WebKit::ProcessAndUIAssertion const*>,WTF::HashMap<WebKit::ProcessAndUIAssertion const*,WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>,WTF::DefaultHash<WebKit::ProcessAndUIAssertion const*>,WTF::HashTraits<WebKit::ProcessAndUIAssertion const*>,WTF::HashTraits<WTF::RefPtr<WTF::ThreadSafeWeakPtrControlBlock,WTF::RawPtrTraits<WTF::ThreadSafeWeakPtrControlBlock>,WTF::ThreadSafeWeakPtrControlBlockRefDerefTraits>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WebKit::ProcessAndUIAssertion const*>>::shrinkToBestSize((uint64_t *)&self->_assertionsNeedingBackgroundTask);
          v25 = p_assertionsNeedingBackgroundTask->m_map.m_impl.var0.m_table;
          goto LABEL_63;
        }
LABEL_61:
        self->_assertionsNeedingBackgroundTask.m_operationCountSinceLastCleanup = 0;
        goto LABEL_64;
      }
    }
    v39 = 0;
    self->_assertionsNeedingBackgroundTask.m_operationCountSinceLastCleanup = 0;
LABEL_67:
    v40 = v39;
    goto LABEL_68;
  }
LABEL_63:
  self->_assertionsNeedingBackgroundTask.m_operationCountSinceLastCleanup = 0;
  if (!v25)
  {
    v39 = 0;
    goto LABEL_67;
  }
LABEL_64:
  v39 = *(v25 - 3);
  v40 = 0x7FFFFFFF;
  if (v39 < 0x7FFFFFFF)
    goto LABEL_67;
LABEL_68:
  self->_assertionsNeedingBackgroundTask.m_maxOperationCountWithoutCleanup = 2 * v40;
  v41 = __ldxr(&p_m_lock->m_byte.value.__a_.__a_value);
  if (v41 == 1)
  {
    if (!__stlxr(0, &p_m_lock->m_byte.value.__a_.__a_value))
      goto LABEL_73;
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)p_m_lock);
LABEL_73:
  if (HIDWORD(v46))
  {
    v42 = v45;
    v43 = 8 * HIDWORD(v46);
    do
    {
      v44 = *(_QWORD *)(*(_QWORD *)v42 + 176);
      if (v44)
        (*(void (**)(uint64_t))(*(_QWORD *)v44 + 16))(v44);
      v42 = (WTF *)((char *)v42 + 8);
      v43 -= 8;
    }
    while (v43);
  }
  WTF::Vector<WTF::Ref<WebKit::ProcessAndUIAssertion,WTF::RawPtrTraits<WebKit::ProcessAndUIAssertion>,WTF::DefaultRefDerefTraits<WebKit::ProcessAndUIAssertion>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v45, v24);
}

- (void)_scheduleReleaseTask
{
  NSObject *v3;
  _BOOL8 v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_pendingTaskReleaseTask)
  {
    v3 = qword_1ECE71640;
    v4 = os_log_type_enabled((os_log_t)qword_1ECE71640, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      *(_DWORD *)v8 = 134217984;
      *(_QWORD *)&v8[4] = self;
      _os_log_impl(&dword_196BCC000, v3, OS_LOG_TYPE_DEFAULT, "%p - WKProcessAssertionBackgroundTaskManager: _scheduleReleaseTask because the expiration handler has been called", v8, 0xCu);
    }
    v5 = WTF::WorkQueue::main((WTF::WorkQueue *)v4);
    CFRetain(self);
    v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
    *v6 = &off_1E34C9950;
    v6[1] = self;
    v6[2] = self;
    *(_QWORD *)v8 = v6;
    (*(void (**)(uint64_t, uint8_t *, double))(*(_QWORD *)v5 + 16))(v5, v8, 2.0);
    v7 = *(_QWORD *)v8;
    *(_QWORD *)v8 = 0;
    if (v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  }
}

- (void)_cancelPendingReleaseTask
{
  id pendingTaskReleaseTask;
  NSObject *v4;
  int v5;
  WKProcessAssertionBackgroundTaskManager *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  pendingTaskReleaseTask = self->_pendingTaskReleaseTask;
  if (pendingTaskReleaseTask)
  {
    v4 = qword_1ECE71640;
    if (os_log_type_enabled((os_log_t)qword_1ECE71640, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 134217984;
      v6 = self;
      _os_log_impl(&dword_196BCC000, v4, OS_LOG_TYPE_DEFAULT, "%p - WKProcessAssertionBackgroundTaskManager: _cancelPendingReleaseTask because the application is foreground again", (uint8_t *)&v5, 0xCu);
      pendingTaskReleaseTask = self->_pendingTaskReleaseTask;
    }
    dispatch_block_cancel(pendingTaskReleaseTask);
    self->_pendingTaskReleaseTask = 0;
  }
}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = qword_1ECE71640;
  if (os_log_type_enabled((os_log_t)qword_1ECE71640, OS_LOG_TYPE_ERROR))
  {
    v7 = 138543362;
    v8 = a4;
    _os_log_error_impl(&dword_196BCC000, v6, OS_LOG_TYPE_ERROR, "WKProcessAssertionBackgroundTaskManager: FinishTaskInterruptable assertion was invalidated, error: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  atomic_store(1u, (unsigned __int8 *)&self->_backgroundTaskWasInvalidated);
}

- (void)_handleBackgroundTaskExpiration
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL8 v6;
  WTF::RunLoop *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess"), "activeLimitations"), "runTime");
  v4 = v3;
  v5 = qword_1ECE71640;
  v6 = os_log_type_enabled((os_log_t)qword_1ECE71640, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    v7 = (WTF::RunLoop *)WTF::RunLoop::main((WTF::RunLoop *)v6);
    LODWORD(v10) = 67109376;
    HIDWORD(v10) = WTF::RunLoop::isCurrent(v7);
    v11 = 2048;
    v12 = v4;
    _os_log_impl(&dword_196BCC000, v5, OS_LOG_TYPE_DEFAULT, "WKProcessAssertionBackgroundTaskManager: Background task expired while holding WebKit ProcessAssertion (isMainThread=%d, remainingTime=%g).", (uint8_t *)&v10, 0x12u);
  }
  v8 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v8 = off_1E34C99A0;
  v8[1] = self;
  v10 = v8;
  WTF::callOnMainRunLoopAndWait();
  v9 = v10;
  v10 = 0;
  if (v9)
    (*(void (**)(_QWORD *))(*v9 + 8))(v9);
}

- (void)_handleBackgroundTaskExpirationOnMainThread
{
  double v3;
  double v4;
  NSObject *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess"), "activeLimitations"), "runTime");
  v4 = v3;
  v5 = qword_1ECE71640;
  if (os_log_type_enabled((os_log_t)qword_1ECE71640, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v8[0]) = 134217984;
    *(double *)((char *)v8 + 4) = v4;
    _os_log_impl(&dword_196BCC000, v5, OS_LOG_TYPE_DEFAULT, "WKProcessAssertionBackgroundTaskManager: _handleBackgroundTaskExpirationOnMainThread (remainingTime=%g).", (uint8_t *)v8, 0xCu);
  }
  if (v4 == *MEMORY[0x1E0D87E30])
  {
    WTF::RunLoop::main((WTF::RunLoop *)-[WKProcessAssertionBackgroundTaskManager _releaseBackgroundTask](self, "_releaseBackgroundTask"));
    if (self)
      CFRetain(self);
    v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
    *v6 = &off_1E34C99C8;
    v6[1] = self;
    v6[2] = self;
    v8[0] = v6;
    WTF::RunLoop::dispatch();
    v7 = v8[0];
    v8[0] = 0;
    if (v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  }
  else
  {
    -[WKProcessAssertionBackgroundTaskManager _notifyAssertionsOfImminentSuspension](self, "_notifyAssertionsOfImminentSuspension");
    -[WKProcessAssertionBackgroundTaskManager _scheduleReleaseTask](self, "_scheduleReleaseTask");
  }
}

- (void)_releaseBackgroundTask
{
  NSObject *v3;
  WebKit::WebProcessPool *v4;
  double v5;
  ProcessStateMonitor *value;
  void *m_ptr;
  int v8;
  WKProcessAssertionBackgroundTaskManager *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[WKProcessAssertionBackgroundTaskManager _hasBackgroundTask](self, "_hasBackgroundTask"))
  {
    v3 = qword_1ECE71640;
    if (os_log_type_enabled((os_log_t)qword_1ECE71640, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134217984;
      v9 = self;
      _os_log_impl(&dword_196BCC000, v3, OS_LOG_TYPE_DEFAULT, "%p - WKProcessAssertionBackgroundTaskManager: endBackgroundTask", (uint8_t *)&v8, 0xCu);
    }
    v4 = (WebKit::WebProcessPool *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess"), "activeLimitations"), "runTime");
    if (v5 != *MEMORY[0x1E0D87E30])
    {
      WebKit::WebProcessPool::notifyProcessPoolsApplicationIsAboutToSuspend(v4);
      value = self->m_processStateMonitor.__ptr_.__value_;
      if (value)
        WebKit::ProcessStateMonitor::processWillBeSuspendedImmediately((uint64_t)value);
    }
    objc_msgSend(self->_backgroundTask.m_ptr, "removeObserver:", self);
    objc_msgSend(self->_backgroundTask.m_ptr, "invalidate");
    m_ptr = self->_backgroundTask.m_ptr;
    self->_backgroundTask.m_ptr = 0;
    if (m_ptr)
      CFRelease(m_ptr);
  }
}

- (void)setProcessStateMonitorEnabled:(BOOL)a3
{
  id **p_m_processStateMonitor;
  id *v4;
  _QWORD *v5;
  _QWORD *v6;

  p_m_processStateMonitor = (id **)&self->m_processStateMonitor;
  if (a3)
  {
    if (!*p_m_processStateMonitor)
    {
      v4 = (id *)WTF::fastMalloc((WTF *)0x40);
      v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v5 = off_1E34C9550;
      v6 = v5;
      WebKit::ProcessStateMonitor::ProcessStateMonitor((uint64_t)v4, (uint64_t *)&v6);
      if (v6)
        (*(void (**)(_QWORD *))(*v6 + 8))(v6);
      std::unique_ptr<WebKit::ProcessStateMonitor>::reset[abi:sn180100](p_m_processStateMonitor, v4);
    }
  }
  else
  {
    std::unique_ptr<WebKit::ProcessStateMonitor>::reset[abi:sn180100]((id **)&self->m_processStateMonitor, 0);
  }
}

- (void).cxx_destruct
{
  void *v3;
  unsigned int *m_tableForLLDB;
  uint64_t v5;
  unsigned __int8 **v6;
  unsigned __int8 *v7;
  void *m_ptr;

  std::unique_ptr<WebKit::ProcessStateMonitor>::reset[abi:sn180100]((id **)&self->m_processStateMonitor, 0);
  m_tableForLLDB = self->_assertionsNeedingBackgroundTask.m_map.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB)
  {
    v5 = *(m_tableForLLDB - 1);
    if ((_DWORD)v5)
    {
      v6 = (unsigned __int8 **)(m_tableForLLDB + 2);
      do
      {
        if (*(v6 - 1) != (unsigned __int8 *)-1)
        {
          v7 = *v6;
          *v6 = 0;
          if (v7)
            WTF::ThreadSafeWeakPtrControlBlock::weakDeref(v7, v3);
        }
        v6 += 2;
        --v5;
      }
      while (v5);
    }
    WTF::fastFree((WTF *)(m_tableForLLDB - 4), v3);
  }
  m_ptr = self->_backgroundTask.m_ptr;
  self->_backgroundTask.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (uint64_t)setProcessStateMonitorEnabled:(uint64_t)a1
{
  void *v3;
  uint64_t ***v4;
  uint64_t v5;
  uint64_t ***v7;
  unsigned int v8;

  WebKit::WebProcessPool::allProcessPools((uint64_t)&v7);
  if (v8)
  {
    v4 = v7;
    v5 = 8 * v8;
    do
    {
      WebKit::WebProcessPool::setProcessesShouldSuspend(*v4++, a2);
      v5 -= 8;
    }
    while (v5);
  }
  return WTF::Vector<WTF::Ref<WebKit::WebProcessPool,WTF::RawPtrTraits<WebKit::WebProcessPool>,WTF::DefaultRefDerefTraits<WebKit::WebProcessPool>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v7, v3);
}

- (_QWORD)_scheduleReleaseTask
{
  const void *v2;

  *a1 = &off_1E34C9950;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)_scheduleReleaseTask
{
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 48) = 0;
  return objc_msgSend(*(id *)(a1 + 8), "_releaseBackgroundTask");
}

- (_QWORD)_updateBackgroundTask
{
  const void *v2;

  *a1 = &off_1E34C9978;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)_updateBackgroundTask
{
  uint64_t result;

  result = WTF::ThreadSafeWeakHashSet<WebKit::ProcessAndUIAssertion>::isEmptyIgnoringNullReferences(*(_QWORD *)(a1 + 8) + 24);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 8), "_releaseBackgroundTask");
  return result;
}

- (uint64_t)_handleBackgroundTaskExpiration
{
  return objc_msgSend(*(id *)(a1 + 8), "_handleBackgroundTaskExpirationOnMainThread");
}

- (_QWORD)_handleBackgroundTaskExpirationOnMainThread
{
  const void *v2;

  *a1 = &off_1E34C99C8;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)_handleBackgroundTaskExpirationOnMainThread
{
  return objc_msgSend(*(id *)(a1 + 8), "_updateBackgroundTask");
}

@end
