@implementation GKSessionGlobals

- (GKSessionGlobals)init
{
  GKSessionGlobals *v2;
  GKSessionGlobals *v3;
  objc_super v5;
  pthread_mutexattr_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v5.receiver = self;
  v5.super_class = (Class)GKSessionGlobals;
  v2 = -[GKSessionGlobals init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_activePIDList = 0;
    v2->_activePIDListSize = 0;
    v2->_activePIDListCount = 0;
    v6.__sig = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)v6.__opaque = 0xAAAAAAAAAAAAAAAALL;
    pthread_mutexattr_init(&v6);
    pthread_mutexattr_settype(&v6, 2);
    pthread_mutex_init(&v3->_lock, &v6);
    pthread_mutexattr_destroy(&v6);
  }
  return v3;
}

- (void)registerPID:(unsigned int)a3
{
  unint64_t activePIDListCount;
  unint64_t v6;
  unsigned int *activePIDList;

  activePIDListCount = self->_activePIDListCount;
  if (activePIDListCount == self->_activePIDListSize)
  {
    v6 = activePIDListCount + 5;
    activePIDList = (unsigned int *)malloc_type_realloc(self->_activePIDList, 4 * (activePIDListCount + 5), 0x100004052888210uLL);
    if (!activePIDList)
      return;
    self->_activePIDList = activePIDList;
    self->_activePIDListSize = v6;
    activePIDListCount = self->_activePIDListCount;
  }
  else
  {
    activePIDList = self->_activePIDList;
  }
  self->_activePIDListCount = activePIDListCount + 1;
  activePIDList[activePIDListCount] = a3;
}

- (void)unregisterPID:(unsigned int)a3
{
  unint64_t activePIDListCount;
  unsigned int *activePIDList;
  unint64_t v6;
  unsigned int *i;
  unint64_t v8;

  activePIDListCount = self->_activePIDListCount;
  if (!activePIDListCount)
    goto LABEL_7;
  activePIDList = self->_activePIDList;
  v6 = self->_activePIDListCount;
  for (i = activePIDList; *i != a3; ++i)
  {
    if (!--v6)
      return;
  }
  v8 = activePIDListCount - 1;
  self->_activePIDListCount = v8;
  *i = activePIDList[v8];
  if (!v8)
  {
LABEL_7:
    free(self->_activePIDList);
    self->_activePIDList = 0;
    self->_activePIDListSize = 0;
  }
}

- (BOOL)hasActivePID:(unsigned int)a3
{
  unint64_t activePIDListCount;
  unsigned int *activePIDList;
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;

  activePIDListCount = self->_activePIDListCount;
  if (!activePIDListCount)
    return 0;
  activePIDList = self->_activePIDList;
  if (*activePIDList == a3)
    return 1;
  v6 = 1;
  do
  {
    v7 = v6;
    if (activePIDListCount == v6)
      break;
    v8 = activePIDList[v6++];
  }
  while (v8 != a3);
  return v7 < activePIDListCount;
}

- (void)lock
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_10_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_11(&dword_215C5C000, v0, v1, " [%s] %s:%d GKGlobals[%p] lock error: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_20();
}

- (void)unlock
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_10_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_11(&dword_215C5C000, v0, v1, " [%s] %s:%d GKGlobals[%p] unlock error: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_20();
}

@end
