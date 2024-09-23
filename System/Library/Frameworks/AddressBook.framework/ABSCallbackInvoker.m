@implementation ABSCallbackInvoker

+ (void)invokeOnThread:(id)a3 callback:(void *)a4 withAddressBook:(void *)a5 context:(void *)a6
{
  id v9;
  id v10;
  _BOOL8 v11;
  ABSCallbackInvoker *v12;

  v9 = a3;
  v12 = objc_alloc_init(ABSCallbackInvoker);
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v10 == v9;

  CFRetain(a5);
  v12->addressBook = a5;
  v12->callback = a4;
  v12->context = a6;
  -[ABSCallbackInvoker performSelector:onThread:withObject:waitUntilDone:](v12, "performSelector:onThread:withObject:waitUntilDone:", sel_invoke, v9, 0, v11);

}

- (void)invoke
{
  void *callback;
  void *v4;
  id v5;

  objc_msgSend(self->addressBook, "changeCallbacks");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  callback = self->callback;
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(callback) = objc_msgSend(v5, "hasExternalCallback:onThread:withContext:", callback, v4, self->context);

  if ((_DWORD)callback)
    ((void (*)(void *, _QWORD, void *))self->callback)(self->addressBook, 0, self->context);
  CFRelease(self->addressBook);

}

@end
