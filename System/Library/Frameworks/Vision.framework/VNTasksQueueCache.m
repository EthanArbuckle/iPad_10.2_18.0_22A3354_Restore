@implementation VNTasksQueueCache

- (id)_queueWithUniqueAppendix:(id)a3 queueClass:(Class)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a3;
  os_unfair_lock_lock(&self->_queueNameToTasksQueueDictionaryLock);
  objc_msgSend((id)objc_opt_class(), "queueLabelWithUniqueAppendix:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_queueNameToTasksQueueDictionary, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = (void *)objc_msgSend([a4 alloc], "initWithDispatchQueueLabel:maximumTasksCount:", v7, objc_msgSend((id)objc_opt_class(), "maximumAllowedTasksInTheQueue"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_queueNameToTasksQueueDictionary, "setObject:forKeyedSubscript:", v8, v7);
    VNValidatedLog(1, (uint64_t)CFSTR("Created new tasks queue: %@"), v9, v10, v11, v12, v13, v14, (uint64_t)v8);
  }

  os_unfair_lock_unlock(&self->_queueNameToTasksQueueDictionaryLock);
  return v8;
}

- (VNTasksQueueCache)init
{
  VNTasksQueueCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *queueNameToTasksQueueDictionary;
  VNTasksQueueCache *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNTasksQueueCache;
  v2 = -[VNTasksQueueCache init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    queueNameToTasksQueueDictionary = v2->_queueNameToTasksQueueDictionary;
    v2->_queueNameToTasksQueueDictionary = v3;

    v2->_queueNameToTasksQueueDictionaryLock._os_unfair_lock_opaque = 0;
    v2->_maximumTasksCount = objc_msgSend((id)objc_opt_class(), "maximumAllowedTasksInTheQueue");
    v5 = v2;
  }

  return v2;
}

- (id)queueWithUniqueAppendix:(id)a3
{
  +[VNError VNAssertClass:needsToOverrideMethod:](VNError, "VNAssertClass:needsToOverrideMethod:", objc_opt_class(), a2);
  return 0;
}

- (void)setMaximumTasksCount:(int64_t)a3
{
  NSMutableDictionary *queueNameToTasksQueueDictionary;
  id v6;
  _QWORD v7[5];

  if (a3 >= 1 && objc_msgSend((id)objc_opt_class(), "maximumAllowedTasksInTheQueue") >= a3)
  {
    os_unfair_lock_lock(&self->_queueNameToTasksQueueDictionaryLock);
    self->_maximumTasksCount = a3;
    queueNameToTasksQueueDictionary = self->_queueNameToTasksQueueDictionary;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__VNTasksQueueCache_setMaximumTasksCount___block_invoke;
    v7[3] = &unk_1E4544038;
    v7[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](queueNameToTasksQueueDictionary, "enumerateKeysAndObjectsUsingBlock:", v7);
    os_unfair_lock_unlock(&self->_queueNameToTasksQueueDictionaryLock);
  }
  else
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Maximum queue tasks count (%ld) is outside of the allowed range [1; %ld]"),
               a3,
               objc_msgSend((id)objc_opt_class(), "maximumAllowedTasksInTheQueue"));
    +[VNError VNAssert:log:](VNError, "VNAssert:log:", 0);

  }
}

- (int64_t)maximumTasksCount
{
  return self->_maximumTasksCount;
}

- (void)releaseQueueWithUniqueAppendix:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  os_unfair_lock_lock(&self->_queueNameToTasksQueueDictionaryLock);
  objc_msgSend((id)objc_opt_class(), "queueLabelWithUniqueAppendix:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_queueNameToTasksQueueDictionary, "removeObjectForKey:", v4);

  os_unfair_lock_unlock(&self->_queueNameToTasksQueueDictionaryLock);
}

- (void)releaseAllQueues
{
  os_unfair_lock_s *p_queueNameToTasksQueueDictionaryLock;
  NSMutableDictionary *v4;
  NSMutableDictionary *queueNameToTasksQueueDictionary;

  p_queueNameToTasksQueueDictionaryLock = &self->_queueNameToTasksQueueDictionaryLock;
  os_unfair_lock_lock(&self->_queueNameToTasksQueueDictionaryLock);
  v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  queueNameToTasksQueueDictionary = self->_queueNameToTasksQueueDictionary;
  self->_queueNameToTasksQueueDictionary = v4;

  os_unfair_lock_unlock(p_queueNameToTasksQueueDictionaryLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueNameToTasksQueueDictionary, 0);
}

uint64_t __42__VNTasksQueueCache_setMaximumTasksCount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setMaximumTasksCount:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

+ (id)queueLabelWithUniqueAppendix:(id)a3
{
  +[VNError VNAssertClass:needsToOverrideMethod:](VNError, "VNAssertClass:needsToOverrideMethod:", objc_opt_class(), a2);
  return 0;
}

@end
