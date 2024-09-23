@implementation JSVMWrapperCache

+ (void)addWrapper:(id)a3 forJSContextGroupRef:(OpaqueJSContextGroup *)a4
{
  NSMapTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;

  if (__ldaxr(byte_1ECF5852C))
  {
    __clrex();
LABEL_3:
    WTF::LockAlgorithm<unsigned char,(unsigned char)1,(unsigned char)2,WTF::EmptyLockHooks<unsigned char>>::lockSlow((uint64_t)byte_1ECF5852C);
    goto LABEL_4;
  }
  if (__stxr(1u, byte_1ECF5852C))
    goto LABEL_3;
LABEL_4:
  v7 = (NSMapTable *)qword_1ECF58548;
  if (!qword_1ECF58548)
  {
    initWrapperCache();
    v7 = (NSMapTable *)qword_1ECF58548;
  }
  NSMapInsert(v7, a4, a3);
  v14 = __ldxr(byte_1ECF5852C);
  if (v14 != 1)
  {
    __clrex();
    goto LABEL_10;
  }
  if (__stlxr(0, byte_1ECF5852C))
LABEL_10:
    WTF::LockAlgorithm<unsigned char,(unsigned char)1,(unsigned char)2,WTF::EmptyLockHooks<unsigned char>>::unlockSlow(byte_1ECF5852C, 0, v8, v9, v10, v11, v12, v13);
}

+ (id)wrapperForJSContextGroupRef:(OpaqueJSContextGroup *)a3
{
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;

  if (__ldaxr(byte_1ECF5852C))
  {
    __clrex();
LABEL_3:
    WTF::LockAlgorithm<unsigned char,(unsigned char)1,(unsigned char)2,WTF::EmptyLockHooks<unsigned char>>::lockSlow((uint64_t)byte_1ECF5852C);
    goto LABEL_4;
  }
  if (__stxr(1u, byte_1ECF5852C))
    goto LABEL_3;
LABEL_4:
  v5 = (NSMapTable *)qword_1ECF58548;
  if (!qword_1ECF58548)
  {
    initWrapperCache();
    v5 = (NSMapTable *)qword_1ECF58548;
  }
  v12 = NSMapGet(v5, a3);
  v13 = __ldxr(byte_1ECF5852C);
  if (v13 == 1)
  {
    if (!__stlxr(0, byte_1ECF5852C))
      return v12;
  }
  else
  {
    __clrex();
  }
  WTF::LockAlgorithm<unsigned char,(unsigned char)1,(unsigned char)2,WTF::EmptyLockHooks<unsigned char>>::unlockSlow(byte_1ECF5852C, 0, v6, v7, v8, v9, v10, v11);
  return v12;
}

@end
