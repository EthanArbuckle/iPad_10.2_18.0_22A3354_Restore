@implementation MTLToolsIOCommandBuffer

- (NSString)label
{
  return (NSString *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "label");
}

- (void)setLabel:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setLabel:", a3);
}

- (NSError)error
{
  return (NSError *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "error");
}

- (void)pushDebugGroup:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "pushDebugGroup:", a3);
}

- (void)popDebugGroup
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "popDebugGroup");
}

- (MTLToolsIOCommandBuffer)initWithBaseObject:(id)a3 parent:(id)a4
{
  MTLToolsIOCommandBuffer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLToolsIOCommandBuffer;
  result = -[MTLToolsObject initWithBaseObject:parent:](&v5, sel_initWithBaseObject_parent_, a3, a4);
  if (result)
    *((_DWORD *)result + 9) = 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  if (!*((_BYTE *)self + 64))
    -[MTLToolsIOCommandBuffer invokeCompletedHandlers](self, "invokeCompletedHandlers");
  v3.receiver = self;
  v3.super_class = (Class)MTLToolsIOCommandBuffer;
  -[MTLToolsObject dealloc](&v3, sel_dealloc);
}

- (BOOL)isCommitted
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isCommitted");
}

- (void)addCompletedHandler:(id)a3
{
  void *v5;
  os_unfair_lock_s *v6;
  void **v7;
  _QWORD *v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;

  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addCompletedHandler:", &__block_literal_global_4);
  v5 = _Block_copy(a3);
  v6 = (os_unfair_lock_s *)((char *)self + 36);
  os_unfair_lock_lock((os_unfair_lock_t)self + 9);
  v7 = (void **)((char *)self + 40);
  v8 = v7[1];
  v9 = (unint64_t)v7[2];
  if ((unint64_t)v8 >= v9)
  {
    v11 = ((char *)v8 - (_BYTE *)*v7) >> 3;
    if ((unint64_t)(v11 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v12 = v9 - (_QWORD)*v7;
    v13 = v12 >> 2;
    if (v12 >> 2 <= (unint64_t)(v11 + 1))
      v13 = v11 + 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
      v14 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v14 = v13;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v7 + 2), v14);
    else
      v15 = 0;
    v16 = &v15[8 * v11];
    v17 = &v15[8 * v14];
    *(_QWORD *)v16 = v5;
    v10 = v16 + 8;
    v19 = (char *)*v7;
    v18 = (char *)v7[1];
    if (v18 != *v7)
    {
      do
      {
        v20 = *((_QWORD *)v18 - 1);
        v18 -= 8;
        *((_QWORD *)v16 - 1) = v20;
        v16 -= 8;
      }
      while (v18 != v19);
      v18 = (char *)*v7;
    }
    *v7 = v16;
    v7[1] = v10;
    v7[2] = v17;
    if (v18)
      operator delete(v18);
  }
  else
  {
    *v8 = v5;
    v10 = v8 + 1;
  }
  v7[1] = v10;
  os_unfair_lock_unlock(v6);
}

- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "encodeWaitForEvent:value:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "encodeSignalEvent:value:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)waitForEvent:(id)a3 value:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "encodeWaitForEvent:value:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)signalEvent:(id)a3 value:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "encodeSignalEvent:value:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)loadBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5 handle:(id)a6 handleOffset:(unint64_t)a7
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "loadBuffer:offset:size:sourceHandle:sourceHandleOffset:", objc_msgSend(a3, "baseObject"), a4, a5, objc_msgSend(a6, "baseObject"), a7);
}

- (void)loadBytes:(void *)a3 size:(unint64_t)a4 sourceHandle:(id)a5 sourceHandleOffset:(unint64_t)a6
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "loadBytes:size:sourceHandle:sourceHandleOffset:", a3, a4, a5, a6);
}

- (void)loadBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5 sourceHandle:(id)a6 sourceHandleOffset:(unint64_t)a7
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "loadBuffer:offset:size:sourceHandle:sourceHandleOffset:", objc_msgSend(a3, "baseObject"), a4, a5, objc_msgSend(a6, "baseObject"), a7);
}

- (void)loadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 sourceBytesPerRow:(unint64_t)a7 sourceBytesPerImage:(unint64_t)a8 destinationOrigin:(id *)a9 sourceHandle:(id)a10 sourceHandleOffset:(unint64_t)a11
{
  id v17;
  uint64_t v18;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v19;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v20;

  v17 = -[MTLToolsObject baseObject](self, "baseObject");
  v18 = objc_msgSend(a3, "baseObject");
  v20 = *a6;
  v19 = *a9;
  objc_msgSend(v17, "loadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:", v18, a4, a5, &v20, a7, a8, &v19, objc_msgSend(a10, "baseObject"), a11);
}

- (void)loadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8 dstOrigin:(id *)a9 handle:(id)a10 handleOffset:(unint64_t)a11
{
  id v17;
  uint64_t v18;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v19;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v20;

  v17 = -[MTLToolsObject baseObject](self, "baseObject");
  v18 = objc_msgSend(a3, "baseObject");
  v20 = *a6;
  v19 = *a9;
  objc_msgSend(v17, "loadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:", v18, a4, a5, &v20, a7, a8, &v19, objc_msgSend(a10, "baseObject"), a11);
}

- (void)copyStatusToBuffer:(id)a3 offset:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "copyStatusToBuffer:offset:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)commit
{
  -[MTLToolsIOCommandBuffer preCommit](self, "preCommit");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commit");
}

- (void)waitUntilCompleted
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "waitUntilCompleted");
}

- (void)tryCancel
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "tryCancel");
}

- (void)barrier
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addBarrier");
}

- (void)addBarrier
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addBarrier");
}

- (void)enqueue
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "enqueue");
}

- (int64_t)status
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "status");
}

- (unint64_t)globalTraceObjectID
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "globalTraceObjectID");
}

- (void)invokeCompletedHandlers
{
  os_unfair_lock_s *v3;
  void (***v4)(_QWORD, _QWORD);
  void (***v5)(_QWORD, _QWORD);
  void (**v6)(_QWORD, _QWORD);

  *((_BYTE *)self + 64) = 1;
  v3 = (os_unfair_lock_s *)((char *)self + 36);
  os_unfair_lock_lock((os_unfair_lock_t)self + 9);
  v4 = (void (***)(_QWORD, _QWORD))*((_QWORD *)self + 5);
  v5 = (void (***)(_QWORD, _QWORD))*((_QWORD *)self + 6);
  if (v4 != v5)
  {
    do
    {
      v6 = *v4++;
      ((void (**)(_QWORD, MTLToolsIOCommandBuffer *))v6)[2](v6, self);
      _Block_release(v6);
    }
    while (v4 != v5);
    v4 = (void (***)(_QWORD, _QWORD))*((_QWORD *)self + 5);
  }
  *((_QWORD *)self + 6) = v4;
  os_unfair_lock_unlock(v3);
}

- (void)preCommit
{
  void *v2;
  _QWORD v3[5];

  v2 = (void *)*((_QWORD *)self + 2);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __36__MTLToolsIOCommandBuffer_preCommit__block_invoke;
  v3[3] = &unk_24F795AF0;
  v3[4] = self;
  objc_msgSend(v2, "addCompletedHandler:", v3);
}

uint64_t __36__MTLToolsIOCommandBuffer_preCommit__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeCompletedHandlers");
}

- (void).cxx_destruct
{
  char *v2;
  void *v3;

  v2 = (char *)self + 40;
  v3 = (void *)*((_QWORD *)self + 5);
  if (v3)
  {
    *((_QWORD *)v2 + 1) = v3;
    operator delete(v3);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end
