@implementation NWURLSessionDelegateQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__dispatchQueue, 0);
  objc_storeStrong((id *)&self->__operationQueue, 0);
}

void __42__NWURLSessionDelegateQueue_delegateQueue__block_invoke(uint64_t a1, const char *a2)
{
  void *v3;
  const char *v4;
  id v5;
  void *v6;
  const char *v7;
  id Property;
  _QWORD *v9;
  const char *v10;
  id v11;
  _QWORD *v12;

  v3 = *(void **)(a1 + 32);
  if (!v3 || !objc_getProperty(v3, a2, 16, 1))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    v6 = *(void **)(a1 + 32);
    if (v6)
      objc_setProperty_atomic(v6, v4, v5, 16);

    Property = *(id *)(a1 + 32);
    if (Property)
      Property = objc_getProperty(Property, v7, 16, 1);
    objc_msgSend(Property, "setMaxConcurrentOperationCount:", 1);
    v9 = *(_QWORD **)(a1 + 32);
    if (v9)
      v9 = (_QWORD *)v9[3];
    v12 = v9;
    v11 = *(id *)(a1 + 32);
    if (v11)
      v11 = objc_getProperty(v11, v10, 16, 1);
    objc_msgSend(v11, "setUnderlyingQueue:", v12);

  }
}

- (void)runDelegateBlock:(_QWORD *)a1
{
  id v3;
  NSObject *v4;
  dispatch_block_t block;

  v3 = a2;
  if (a1)
  {
    v4 = a1[3];
    block = v3;
    if (v4)
      dispatch_async(v4, v3);
    else
      objc_msgSend(objc_getProperty(a1, (SEL)v3, 16, 1), "addOperationWithBlock:", v3);
    v3 = block;
  }

}

@end
