@implementation FKAddressBook

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  return (id)sharedInstance__sharedFKAddressBook;
}

void __31__FKAddressBook_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance__sharedFKAddressBook;
  sharedInstance__sharedFKAddressBook = v0;

}

- (FKAddressBook)init
{
  FKAddressBook *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *operationQueue;
  NSObject *v6;
  _QWORD v8[4];
  FKAddressBook *v9;
  _QWORD *v10;
  _QWORD v11[4];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FKAddressBook;
  v2 = -[FKAddressBook init](&v12, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("FriendKitAddressBookQueue", v3);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = (OS_dispatch_queue *)v4;

    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v11[3] = 0;
    v6 = v2->_operationQueue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __21__FKAddressBook_init__block_invoke;
    v8[3] = &unk_24CCDFF28;
    v10 = v11;
    v9 = v2;
    dispatch_sync(v6, v8);

    _Block_object_dispose(v11, 8);
  }
  return v2;
}

void __21__FKAddressBook_init__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  CFErrorRef error;

  error = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = ABAddressBookCreateWithOptions(0, &error);
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (!v2)
  {
    _FKGetLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __21__FKAddressBook_init__block_invoke_cold_1((uint64_t *)&error, v3);

    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = v2;
}

- (void)dealloc
{
  void *addressBook;
  objc_super v4;

  addressBook = self->_addressBook;
  if (addressBook)
    CFRelease(addressBook);
  v4.receiver = self;
  v4.super_class = (Class)FKAddressBook;
  -[FKAddressBook dealloc](&v4, sel_dealloc);
}

+ (void)performBlock:(id)a3
{
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;

  v6 = a3;
  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "operationQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __30__FKAddressBook_performBlock___block_invoke;
    block[3] = &unk_24CCDFF50;
    v8 = v3;
    v9 = v6;
    v5 = v3;
    dispatch_sync(v4, block);

  }
}

uint64_t __30__FKAddressBook_performBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "addressBook"));
}

- (void)addressBook
{
  return self->_addressBook;
}

- (void)setAddressBook:(void *)a3
{
  self->_addressBook = a3;
}

- (OS_dispatch_queue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

void __21__FKAddressBook_init__block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 136315650;
  v4 = "-[FKAddressBook init]_block_invoke";
  v5 = 1024;
  v6 = 44;
  v7 = 2112;
  v8 = v2;
  _os_log_error_impl(&dword_211A80000, a2, OS_LOG_TYPE_ERROR, "%s (%d) \"FriendKit failed to create an address book instance: %@\", (uint8_t *)&v3, 0x1Cu);
}

@end
