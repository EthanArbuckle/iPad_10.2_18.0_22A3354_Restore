@implementation CLSContextProviderServiceFinder

- (CLSContextProviderServiceFinder)init
{

  return 0;
}

- (CLSContextProviderServiceFinder)initWithDelegate:(id)a3
{
  id v4;
  CLSContextProviderServiceFinder *v5;
  CLSContextProviderServiceFinder *v6;
  const char *v7;
  uint64_t v8;
  NSDictionary *extensionAttributes;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *mutableAvailableServices;
  NSObject *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *servicesQueue;
  objc_super v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CLSContextProviderServiceFinder;
  v5 = -[CLSContextProviderServiceFinder init](&v19, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v20 = *MEMORY[0x1E0CB2A28];
    v21[0] = 0x1E974D580;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v7, (uint64_t)v21, &v20, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    extensionAttributes = v6->_extensionAttributes;
    v6->_extensionAttributes = (NSDictionary *)v8;

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    mutableAvailableServices = v6->_mutableAvailableServices;
    v6->_mutableAvailableServices = (NSMutableArray *)v12;

    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_USER_INITIATED, 0);
    v15 = objc_claimAutoreleasedReturnValue();

    v16 = dispatch_queue_create("com.apple.ClassKit.CLSContextProviderServiceFinder", v15);
    servicesQueue = v6->_servicesQueue;
    v6->_servicesQueue = (OS_dispatch_queue *)v16;

  }
  return v6;
}

- (void)start
{
  CLSContextProviderServiceFinder *v2;
  const char *v3;
  uint64_t extensionAttributes;
  uint64_t v5;
  id extensionsFinderContext;
  _QWORD v7[5];

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_extensionsFinderContext)
  {
    extensionAttributes = (uint64_t)v2->_extensionAttributes;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_1D4083BF0;
    v7[3] = &unk_1E974A938;
    v7[4] = v2;
    objc_msgSend_beginMatchingExtensionsWithAttributes_completion_(MEMORY[0x1E0CB35D8], v3, extensionAttributes, v7);
    v5 = objc_claimAutoreleasedReturnValue();
    extensionsFinderContext = v2->_extensionsFinderContext;
    v2->_extensionsFinderContext = (id)v5;

  }
  objc_sync_exit(v2);

}

- (void)stop
{
  CLSContextProviderServiceFinder *v2;
  const char *v3;
  uint64_t extensionsFinderContext;
  id v5;
  NSObject *servicesQueue;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  extensionsFinderContext = (uint64_t)v2->_extensionsFinderContext;
  if (extensionsFinderContext)
  {
    objc_msgSend_endMatchingExtensions_(MEMORY[0x1E0CB35D8], v3, extensionsFinderContext);
    v5 = v2->_extensionsFinderContext;
    v2->_extensionsFinderContext = 0;

    servicesQueue = v2->_servicesQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1D40840D4;
    block[3] = &unk_1E974A658;
    block[4] = v2;
    dispatch_barrier_async(servicesQueue, block);
  }
  objc_sync_exit(v2);

}

- (NSArray)availableServices
{
  NSObject *servicesQueue;
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
  v9 = sub_1D4084194;
  v10 = sub_1D40841A4;
  v11 = 0;
  servicesQueue = self->_servicesQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1D40841AC;
  v5[3] = &unk_1E974A960;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(servicesQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableAvailableServices, 0);
  objc_storeStrong((id *)&self->_extensionAttributes, 0);
  objc_storeStrong((id *)&self->_servicesQueue, 0);
  objc_storeStrong(&self->_extensionsFinderContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
