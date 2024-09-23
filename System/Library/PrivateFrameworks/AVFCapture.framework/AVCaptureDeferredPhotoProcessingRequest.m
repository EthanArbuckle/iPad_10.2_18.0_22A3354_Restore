@implementation AVCaptureDeferredPhotoProcessingRequest

- (AVCaptureDeferredPhotoProcessingRequest)initWithPhotoProxy:(id)a3 delegate:(id)a4 delegateQueue:(id)a5 qosClass:(unsigned int)a6
{
  AVCaptureDeferredPhotoProcessingRequest *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AVCaptureDeferredPhotoProcessingRequest;
  v10 = -[AVCaptureDeferredPhotoProcessingRequest init](&v13, sel_init);
  if (v10)
  {
    v10->_delegatesStorage = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10->_delegateQueue = (OS_dispatch_queue *)a5;
    -[AVCaptureDeferredPhotoProcessingRequest addDelegate:](v10, "addDelegate:", a4);
    v10->_photoProxies = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", a3, 0);
    v10->_expectedPhotoCount = 1;
    v10->_originalDeferredPhotoIdentifier = (NSString *)objc_msgSend((id)objc_msgSend(a3, "deferredPhotoIdentifier"), "copy");
    v10->_qosClass = a6;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("AVCaptureDeferredPhotoProcessor-%@"), objc_msgSend(a3, "deferredPhotoIdentifier"));
    objc_msgSend(v11, "cStringUsingEncoding:", 4);
    v10->_transaction = (OS_os_transaction *)FigOSTransactionCreate();

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureDeferredPhotoProcessingRequest;
  -[AVCaptureDeferredPhotoProcessingRequest dealloc](&v3, sel_dealloc);
}

- (void)addDelegate:(id)a3
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0CF2D58]);
  objc_msgSend(v5, "setDelegate:queue:", a3, self->_delegateQueue);
  -[NSMutableArray addObject:](self->_delegatesStorage, "addObject:", v5);

}

- (void)addProxy:(id)a3
{
  NSMutableArray *photoProxies;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  photoProxies = self->_photoProxies;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](photoProxies, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v8)
        objc_enumerationMutation(photoProxies);
      if ((objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9), "deferredPhotoIdentifier"), "isEqual:", objc_msgSend(a3, "deferredPhotoIdentifier")) & 1) != 0)break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](photoProxies, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    -[NSMutableArray addObject:](self->_photoProxies, "addObject:", a3);
    ++self->_expectedPhotoCount;
  }
}

- (id)description
{
  void *v3;
  unint64_t v4;
  void *v5;
  objc_class *v6;
  NSString *v7;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("proxies: "));
  if (-[NSMutableArray count](self->_photoProxies, "count"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(v3, "appendFormat:", CFSTR("%@"), objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_photoProxies, "objectAtIndexedSubscript:", v4), "deferredPhotoIdentifier"));
      if (-[NSMutableArray count](self->_photoProxies, "count") - 1 > v4)
        objc_msgSend(v3, "appendString:", CFSTR(", "));
      ++v4;
    }
    while (-[NSMutableArray count](self->_photoProxies, "count") > v4);
  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p %@ %@>"), v7, self, v3, AVCaptureQOSClassToString(self->_qosClass));
}

- (NSArray)delegatesStorage
{
  return &self->_delegatesStorage->super;
}

- (NSMutableArray)photoProxies
{
  return self->_photoProxies;
}

- (unsigned)firedCallbackFlags
{
  return self->_firedCallbackFlags;
}

- (void)setFiredCallbackFlags:(unsigned int)a3
{
  self->_firedCallbackFlags = a3;
}

- (int)expectedPhotoCount
{
  return self->_expectedPhotoCount;
}

- (void)setExpectedPhotoCount:(int)a3
{
  self->_expectedPhotoCount = a3;
}

- (int)firedPhotoCallbacksCount
{
  return self->_firedPhotoCallbacksCount;
}

- (void)setFiredPhotoCallbacksCount:(int)a3
{
  self->_firedPhotoCallbacksCount = a3;
}

- (NSString)originalDeferredPhotoIdentifier
{
  return self->_originalDeferredPhotoIdentifier;
}

- (void)setOriginalDeferredPhotoIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unsigned)qosClass
{
  return self->_qosClass;
}

- (void)setQosClass:(unsigned int)a3
{
  self->_qosClass = a3;
}

@end
