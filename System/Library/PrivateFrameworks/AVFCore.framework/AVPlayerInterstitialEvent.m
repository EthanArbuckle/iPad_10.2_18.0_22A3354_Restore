@implementation AVPlayerInterstitialEvent

+ (AVPlayerInterstitialEvent)interstitialEventWithPrimaryItem:(AVPlayerItem *)primaryItem identifier:(NSString *)identifier time:(CMTime *)time templateItems:(NSArray *)templateItems restrictions:(AVPlayerInterstitialEventRestrictions)restrictions resumptionOffset:(CMTime *)resumptionOffset playoutLimit:(CMTime *)playoutLimit userDefinedAttributes:(NSDictionary *)userDefinedAttributes
{
  id v16;
  void *v18;
  CMTime v19;
  CMTime v20;
  CMTime v21;

  if ((time->flags & 0x1D) != 1)
  {
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)identifier, (uint64_t)time, (uint64_t)templateItems, restrictions, (uint64_t)resumptionOffset, (uint64_t)"CMTIME_IS_NUMERIC(time)"), 0);
    objc_exception_throw(v18);
  }
  v16 = objc_alloc((Class)a1);
  v21 = *time;
  v20 = *resumptionOffset;
  v19 = *playoutLimit;
  return (AVPlayerInterstitialEvent *)(id)objc_msgSend(v16, "initWithPrimaryItem:identifier:time:date:templateItems:restrictions:resumptionOffset:playoutLimit:userDefinedAttributes:", primaryItem, identifier, &v21, 0, templateItems, restrictions, &v20, &v19, userDefinedAttributes);
}

+ (AVPlayerInterstitialEvent)interstitialEventWithPrimaryItem:(AVPlayerItem *)primaryItem identifier:(NSString *)identifier date:(NSDate *)date templateItems:(NSArray *)templateItems restrictions:(AVPlayerInterstitialEventRestrictions)restrictions resumptionOffset:(CMTime *)resumptionOffset playoutLimit:(CMTime *)playoutLimit userDefinedAttributes:(NSDictionary *)userDefinedAttributes
{
  id v16;
  void *v18;
  CMTime v19;
  CMTime v20;
  __int128 v21;
  uint64_t v22;

  if (!date)
  {
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)identifier, 0, (uint64_t)templateItems, restrictions, (uint64_t)resumptionOffset, (uint64_t)"date != nil"), 0);
    objc_exception_throw(v18);
  }
  v16 = objc_alloc((Class)a1);
  v21 = *MEMORY[0x1E0CA2E18];
  v22 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v20 = *resumptionOffset;
  v19 = *playoutLimit;
  return (AVPlayerInterstitialEvent *)(id)objc_msgSend(v16, "initWithPrimaryItem:identifier:time:date:templateItems:restrictions:resumptionOffset:playoutLimit:userDefinedAttributes:", primaryItem, identifier, &v21, date, templateItems, restrictions, &v20, &v19, userDefinedAttributes);
}

- (id)assetURLsReturningError:(id *)a3
{
  void *v5;
  NSObject *ivarAccessQueue;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD block[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  v23 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__AVPlayerInterstitialEvent_assetURLsReturningError___block_invoke;
  block[3] = &unk_1E302FD60;
  block[4] = self;
  block[5] = &v18;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (void *)v19[5];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v24, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "asset"), "_absoluteURL");
        if (!v11)
        {
          v5 = 0;
          if (a3)
            *a3 = (id)AVErrorForClientProgrammingError(objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Template items for interstitial events must employ assets that can be referenced by URL (AVURLAssets)"), 0));
          goto LABEL_12;
        }
        objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v24, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_12:

  _Block_object_dispose(&v18, 8);
  return v5;
}

uint64_t __53__AVPlayerInterstitialEvent_assetURLsReturningError___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

+ (id)newItemArrayWithCopiedItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(a3);
        objc_msgSend(v4, "addObject:", (id)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "copy"));
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v4;
}

- (AVPlayerInterstitialEvent)initWithPrimaryItem:(id)a3 identifier:(id)a4 time:(id *)a5 date:(id)a6 templateItems:(id)a7 restrictions:(unint64_t)a8 resumptionOffset:(id *)a9 playoutLimit:(id *)a10 userDefinedAttributes:(id)a11
{
  AVPlayerInterstitialEvent *v16;
  AVPlayerInterstitialEvent *v17;
  AVPlayerInterstitialEvent *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)AVPlayerInterstitialEvent;
  v16 = -[AVPlayerInterstitialEvent init](&v27, sel_init);
  v17 = v16;
  if (v16)
  {
    if (!a6 && (a5->var2 & 0x1D) != 1)
    {
      v19 = v16;
      v25 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v17, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v20, v21, v22, v23, v24, (uint64_t)"date != nil || CMTIME_IS_NUMERIC(time)"), 0);
      objc_exception_throw(v25);
    }
    v16->_ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avplayerinterstitialevent.ivars");
    objc_storeWeak((id *)&v17->_primaryItem, a3);
    v17->_templateItems = (NSArray *)+[AVPlayerInterstitialEvent newItemArrayWithCopiedItems:](AVPlayerInterstitialEvent, "newItemArrayWithCopiedItems:", a7);
    v26 = 0;
    if (-[AVPlayerInterstitialEvent assetURLsReturningError:](v17, "assetURLsReturningError:", &v26))
    {
      FigPlayerInterstitialEventCreate();
    }
    else
    {

      if (objc_msgSend(v26, "code") == -11999)
        objc_exception_throw((id)objc_msgSend((id)objc_msgSend(v26, "userInfo"), "objectForKey:", CFSTR("AVErrorExceptionKey")));
      return 0;
    }
  }
  return v17;
}

- (AVPlayerInterstitialEvent)initWithPrimaryItem:(id)a3 time:(id *)a4 date:(id)a5
{
  AVPlayerInterstitialEvent *v9;
  id *p_isa;
  AVPlayerInterstitialEvent *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)AVPlayerInterstitialEvent;
  v9 = -[AVPlayerInterstitialEvent init](&v19, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    if (!a5 && (a4->var2 & 0x1D) != 1)
    {
      v12 = v9;
      v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)p_isa, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v13, v14, v15, v16, v17, (uint64_t)"date != nil || CMTIME_IS_NUMERIC(time)"), 0);
      objc_exception_throw(v18);
    }
    v9->_ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avplayerinterstitialevent.ivars");
    objc_storeWeak(p_isa + 2, a3);
    FigPlayerInterstitialEventCreate();
  }
  return (AVPlayerInterstitialEvent *)p_isa;
}

+ (AVPlayerInterstitialEvent)interstitialEventWithPrimaryItem:(AVPlayerItem *)primaryItem time:(CMTime *)time
{
  id v6;
  CMTime v8;

  v6 = objc_alloc((Class)a1);
  v8 = *time;
  return (AVPlayerInterstitialEvent *)(id)objc_msgSend(v6, "initWithPrimaryItem:time:date:", primaryItem, &v8, 0);
}

+ (AVPlayerInterstitialEvent)interstitialEventWithPrimaryItem:(AVPlayerItem *)primaryItem date:(NSDate *)date
{
  id v6;
  __int128 v8;
  uint64_t v9;

  v6 = objc_alloc((Class)a1);
  v8 = *MEMORY[0x1E0CA2E18];
  v9 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  return (AVPlayerInterstitialEvent *)(id)objc_msgSend(v6, "initWithPrimaryItem:time:date:", primaryItem, &v8, date);
}

- (AVPlayerInterstitialEvent)initWithPrimaryItemAndFigEvent:(id)a3 templateItems:(id)a4 figEvent:(OpaqueFigPlayerInterstitialEvent *)a5
{
  AVPlayerInterstitialEvent *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVPlayerInterstitialEvent;
  v8 = -[AVPlayerInterstitialEvent init](&v10, sel_init);
  if (v8)
  {
    v8->_ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avplayerinterstitialevent.ivars");
    objc_storeWeak((id *)&v8->_primaryItem, a3);
    v8->_templateItems = (NSArray *)objc_msgSend(a4, "copy");
    v8->_figEvent = (OpaqueFigPlayerInterstitialEvent *)CFRetain(a5);
  }
  return v8;
}

- (void)dealloc
{
  OpaqueFigPlayerInterstitialEvent *figEvent;
  NSObject *ivarAccessQueue;
  objc_super v5;

  figEvent = self->_figEvent;
  if (figEvent)
    CFRelease(figEvent);

  ivarAccessQueue = self->_ivarAccessQueue;
  if (ivarAccessQueue)
    dispatch_release(ivarAccessQueue);
  v5.receiver = self;
  v5.super_class = (Class)AVPlayerInterstitialEvent;
  -[AVPlayerInterstitialEvent dealloc](&v5, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  const void *v5;
  NSObject *ivarAccessQueue;
  AVPlayerItem **p_primaryItem;
  AVPlayerInterstitialEvent *v8;
  id Weak;
  AVPlayerInterstitialEvent *v10;
  _QWORD block[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;

  v4 = FigPlayerInterstitialEventCopyAsDictionary();
  if (!v4)
    return 0;
  v5 = (const void *)v4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__6;
  v17 = __Block_byref_object_dispose__6;
  v18 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__AVPlayerInterstitialEvent_copyWithZone___block_invoke;
  block[3] = &unk_1E302FD60;
  block[4] = self;
  block[5] = &v13;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  p_primaryItem = &self->_primaryItem;
  objc_loadWeak((id *)p_primaryItem);
  FigPlayerInterstitialEventCreateFromDictionary();
  v8 = [AVPlayerInterstitialEvent alloc];
  Weak = objc_loadWeak((id *)p_primaryItem);
  v10 = -[AVPlayerInterstitialEvent initWithPrimaryItemAndFigEvent:templateItems:figEvent:](v8, "initWithPrimaryItemAndFigEvent:templateItems:figEvent:", Weak, v14[5], 0);
  CFRelease(v5);

  _Block_object_dispose(&v13, 8);
  return v10;
}

uint64_t __42__AVPlayerInterstitialEvent_copyWithZone___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)description
{
  NSObject *ivarAccessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__AVPlayerInterstitialEvent_description__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__AVPlayerInterstitialEvent_description__block_invoke(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  NSString *v4;
  uint64_t result;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  result = objc_msgSend((id)objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@: %p, primaryItem = %p, ctx = %p, templateItems = %p, id = %@>"), v4, *(_QWORD *)(a1 + 32), objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 16)), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), objc_msgSend(*(id *)(a1 + 32), "identifier")), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[AVPlayerItem isEqual:](-[AVPlayerInterstitialEvent primaryItem](self, "primaryItem"), "isEqual:", objc_msgSend(a3, "primaryItem"))&& FigCFEqual();
}

- (unint64_t)hash
{
  NSObject *ivarAccessQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__AVPlayerInterstitialEvent_hash__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__AVPlayerInterstitialEvent_hash__block_invoke(uint64_t a1)
{
  uint64_t v2;
  CFHashCode v3;
  uint64_t result;

  v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "primaryItem"), "hash");
  v3 = CFHash(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 24)) ^ v2;
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "hash");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3 ^ result;
  return result;
}

- (void)setImmutable
{
  FigPlayerInterstitialEventSetImmutable();
}

- (void)checkMutability
{
  if (FigPlayerInterstitialEventIsImmutable())
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("events returned by AVPlayerInterstitialEventMonitor are not mutable; modify a copy instead"),
                               0));
}

- (AVPlayerItem)primaryItem
{
  return (AVPlayerItem *)objc_loadWeak((id *)&self->_primaryItem);
}

- (void)setPrimaryItem:(AVPlayerItem *)primaryItem
{
  -[AVPlayerInterstitialEvent checkMutability](self, "checkMutability");
  objc_storeWeak((id *)&self->_primaryItem, primaryItem);
  FigPlayerInterstitialEventSetPrimaryItem();
}

- (NSString)identifier
{
  void *v2;
  NSString *v3;

  v2 = (void *)FigPlayerInterstitialEventCopyIdentifier();
  v3 = (NSString *)(id)objc_msgSend(v2, "copy");
  if (v2)
    CFRelease(v2);
  return v3;
}

- (void)setIdentifier:(NSString *)identifier
{
  id v4;

  -[AVPlayerInterstitialEvent checkMutability](self, "checkMutability");
  v4 = (id)-[NSString copy](identifier, "copy");
  FigPlayerInterstitialEventSetIdentifier();
}

- (CMTime)time
{
  return (CMTime *)FigPlayerInterstitialEventGetStartTime();
}

- (void)setTime:(CMTime *)time
{
  -[AVPlayerInterstitialEvent checkMutability](self, "checkMutability");
  FigPlayerInterstitialEventSetStartTime();
}

- (NSDate)date
{
  void *started;
  NSDate *v3;

  started = (void *)FigPlayerInterstitialEventCopyStartDate();
  v3 = (NSDate *)(id)objc_msgSend(started, "copy");
  if (started)
    CFRelease(started);
  return v3;
}

- (void)setDate:(NSDate *)date
{
  id v4;

  -[AVPlayerInterstitialEvent checkMutability](self, "checkMutability");
  v4 = (id)-[NSDate copy](date, "copy");
  FigPlayerInterstitialEventSetStartDate();
}

- (NSArray)templateItems
{
  NSObject *ivarAccessQueue;
  NSArray *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__AVPlayerInterstitialEvent_templateItems__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __42__AVPlayerInterstitialEvent_templateItems__block_invoke(uint64_t a1)
{
  id result;

  result = +[AVPlayerInterstitialEvent newItemArrayWithCopiedItems:](AVPlayerInterstitialEvent, "newItemArrayWithCopiedItems:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setTemplateItems:(NSArray *)templateItems
{
  id v5;
  NSObject *ivarAccessQueue;
  id v7;
  _QWORD block[6];

  -[AVPlayerInterstitialEvent checkMutability](self, "checkMutability");
  v5 = +[AVPlayerInterstitialEvent newItemArrayWithCopiedItems:](AVPlayerInterstitialEvent, "newItemArrayWithCopiedItems:", templateItems);
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__AVPlayerInterstitialEvent_setTemplateItems___block_invoke;
  block[3] = &unk_1E302FCE8;
  block[4] = self;
  block[5] = v5;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = 0;
  if (!-[AVPlayerInterstitialEvent assetURLsReturningError:](self, "assetURLsReturningError:", &v7)
    && objc_msgSend(v7, "code") == -11999)
  {
    objc_exception_throw((id)objc_msgSend((id)objc_msgSend(v7, "userInfo"), "objectForKey:", CFSTR("AVErrorExceptionKey")));
  }
  FigPlayerInterstitialEventSetInterstitialAssetURLs();
}

void __46__AVPlayerInterstitialEvent_setTemplateItems___block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = *(_QWORD *)(a1 + 40);
}

- (AVPlayerInterstitialEventRestrictions)restrictions
{
  return FigPlayerInterstitialEventGetRestrictions();
}

- (void)setRestrictions:(AVPlayerInterstitialEventRestrictions)restrictions
{
  -[AVPlayerInterstitialEvent checkMutability](self, "checkMutability");
  FigPlayerInterstitialEventSetRestrictions();
}

- (CMTime)resumptionOffset
{
  return (CMTime *)FigPlayerInterstitialEventGetResumptionOffset();
}

- (void)setResumptionOffset:(CMTime *)resumptionOffset
{
  -[AVPlayerInterstitialEvent checkMutability](self, "checkMutability");
  FigPlayerInterstitialEventSetResumptionOffset();
}

- (CMTime)playoutLimit
{
  return (CMTime *)FigPlayerInterstitialEventGetPlayoutLimit();
}

- (void)setPlayoutLimit:(CMTime *)playoutLimit
{
  -[AVPlayerInterstitialEvent checkMutability](self, "checkMutability");
  FigPlayerInterstitialEventSetPlayoutLimit();
}

- (BOOL)alignsStartWithPrimarySegmentBoundary
{
  return FigPlayerInterstitialEventGetSnapOptions() & 1;
}

- (void)setAlignsStartWithPrimarySegmentBoundary:(BOOL)alignsStartWithPrimarySegmentBoundary
{
  -[AVPlayerInterstitialEvent checkMutability](self, "checkMutability");
  FigPlayerInterstitialEventGetSnapOptions();
  FigPlayerInterstitialEventSetSnapOptions();
}

- (BOOL)alignsResumptionWithPrimarySegmentBoundary
{
  return (FigPlayerInterstitialEventGetSnapOptions() >> 1) & 1;
}

- (void)setAlignsResumptionWithPrimarySegmentBoundary:(BOOL)alignsResumptionWithPrimarySegmentBoundary
{
  -[AVPlayerInterstitialEvent checkMutability](self, "checkMutability");
  FigPlayerInterstitialEventGetSnapOptions();
  FigPlayerInterstitialEventSetSnapOptions();
}

- (AVPlayerInterstitialEventCue)cue
{
  if (FigPlayerInterstitialEventIsPreRoll())
    return (AVPlayerInterstitialEventCue)CFSTR("EventJoinCue");
  if (FigPlayerInterstitialEventIsPostRoll())
    return (AVPlayerInterstitialEventCue)CFSTR("EventLeaveCue");
  return (AVPlayerInterstitialEventCue)CFSTR("EventNoCue");
}

- (void)setCue:(AVPlayerInterstitialEventCue)cue
{
  -[AVPlayerInterstitialEvent checkMutability](self, "checkMutability");
  FigPlayerInterstitialEventSetIsPreRoll();
  FigPlayerInterstitialEventSetIsPostRoll();
}

- (BOOL)willPlayOnce
{
  return FigPlayerInterstitialEventCueOnce() != 0;
}

- (void)setWillPlayOnce:(BOOL)willPlayOnce
{
  -[AVPlayerInterstitialEvent checkMutability](self, "checkMutability");
  FigPlayerInterstitialEventSetCueOnce();
}

- (NSDictionary)userDefinedAttributes
{
  void *v2;
  NSDictionary *v3;

  v2 = (void *)FigPlayerInterstitialEventCopyExtraAttributes();
  v3 = (NSDictionary *)(id)objc_msgSend(v2, "copy");
  if (v2)
    CFRelease(v2);
  return v3;
}

- (void)setUserDefinedAttributes:(NSDictionary *)userDefinedAttributes
{
  id v4;

  -[AVPlayerInterstitialEvent checkMutability](self, "checkMutability");
  v4 = (id)-[NSDictionary copy](userDefinedAttributes, "copy");
  FigPlayerInterstitialEventSetExtraAttributes();
}

- (NSDictionary)assetListResponse
{
  void *v2;
  NSDictionary *v3;

  v2 = (void *)FigPlayerInterstitialEventCopyAssetListResponse();
  v3 = (NSDictionary *)(id)objc_msgSend(v2, "copy");
  if (v2)
    CFRelease(v2);
  return v3;
}

- (int64_t)timelineOccupancy
{
  return FigPlayerInterstitialEventGetTimelineOccupancy();
}

- (void)setTimelineOccupancy:(int64_t)a3
{
  -[AVPlayerInterstitialEvent checkMutability](self, "checkMutability");
  FigPlayerInterstitialEventSetTimelineOccupancy();
}

- (BOOL)supplementsPrimaryContent
{
  return FigPlayerInterstitialEventSupplementsPrimaryContent() != 0;
}

- (void)setSupplementsPrimaryContent:(BOOL)a3
{
  -[AVPlayerInterstitialEvent checkMutability](self, "checkMutability");
  FigPlayerInterstitialEventSetSupplementsPrimaryContent();
}

- (BOOL)contentMayVary
{
  return FigPlayerInterstitialEventContentMayVary() != 0;
}

- (void)setContentMayVary:(BOOL)a3
{
  -[AVPlayerInterstitialEvent checkMutability](self, "checkMutability");
  FigPlayerInterstitialEventSetContentMayVary();
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)plannedDuration
{
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)FigPlayerInterstitialEventGetStatedDuration();
}

- (void)setPlannedDuration:(id *)a3
{
  -[AVPlayerInterstitialEvent checkMutability](self, "checkMutability");
  FigPlayerInterstitialEventSetPlannedDuration();
}

- (OpaqueFigPlayerInterstitialEvent)figEvent
{
  return self->_figEvent;
}

- (id)_internalTemplateItems
{
  return (id)-[NSArray copy](self->_templateItems, "copy");
}

- (BOOL)validate:(int *)a3
{
  int v4;

  v4 = FigPlayerInterstitialEventValidate();
  if (a3)
    *a3 = v4;
  return v4 == 0;
}

- (BOOL)_participatesInCoordinatedPlayback
{
  int64_t v3;

  if (-[AVPlayerInterstitialEvent contentMayVary](self, "contentMayVary"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v3 = -[AVPlayerInterstitialEvent timelineOccupancy](self, "timelineOccupancy");
    if (v3)
      LOBYTE(v3) = -[AVPlayerInterstitialEvent cue](self, "cue") != (AVPlayerInterstitialEventCue)CFSTR("EventJoinCue");
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_primaryItem);
}

@end
