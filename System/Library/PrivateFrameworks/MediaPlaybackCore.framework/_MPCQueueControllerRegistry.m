@implementation _MPCQueueControllerRegistry

+ (_MPCQueueControllerRegistry)shared
{
  if (shared_onceToken[0] != -1)
    dispatch_once(shared_onceToken, &__block_literal_global_636);
  return (_MPCQueueControllerRegistry *)(id)shared___shared;
}

- (NSMapTable)transportableExtensions
{
  return self->_transportableExtensions;
}

- (MPCQueueControllerPublisher)publisherProxy
{
  return self->_publisherProxy;
}

- (_MPCQueueControllerRegistry)init
{
  _MPCQueueControllerRegistry *v2;
  uint64_t v3;
  MPCQueueControllerPublisher *publisherProxy;
  uint64_t v5;
  NSMapTable *transportableExtensions;
  char *v7;
  id v8;
  id v9;
  void *v10;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_MPCQueueControllerRegistry;
  v2 = -[_MPCQueueControllerRegistry init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDDCB38], "proxyForObjects:protocol:", MEMORY[0x24BDBD1A8], &unk_254AA2938);
    v3 = objc_claimAutoreleasedReturnValue();
    publisherProxy = v2->_publisherProxy;
    v2->_publisherProxy = (MPCQueueControllerPublisher *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 1282, 0, 6);
    transportableExtensions = v2->_transportableExtensions;
    v2->_transportableExtensions = (NSMapTable *)v5;

    v7 = 0;
    do
    {
      switch((unint64_t)v7)
      {
        case 0uLL:
        case 1uLL:
        case 2uLL:
        case 3uLL:
        case 4uLL:
          objc_opt_class();
          v9 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_6;
        case 5uLL:
          v9 = (id)__testBehaviorClass;
LABEL_6:
          v8 = v9;
          break;
        default:
          v8 = 0;
          break;
      }
      if (objc_msgSend(v8, "conformsToProtocol:", &unk_254A98DC8))
      {
        objc_msgSend(v8, "makeExtensionWithInvalidatable:", v2->_publisherProxy);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v2, CFSTR("MPCQueueController.m"), 1779, CFSTR("Behavior conforms to MPCQueueControllerBehaviorTransportableImplementation, but failed to provide transportable extension"));

        }
        NSMapInsert(v2->_transportableExtensions, v7, v10);

      }
      ++v7;
    }
    while (v7 != (char *)6);
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportableExtensions, 0);
  objc_storeStrong((id *)&self->_publisherProxy, 0);
}

@end
