@implementation AVPlayerQueueModificationDescription

+ (id)modificationForInsertingItem:(id)a3 afterItem:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithModificationType:item:afterItem:", 0, a3, a4);
}

- (AVPlayerQueueModificationDescription)initWithModificationType:(int64_t)a3 item:(id)a4 afterItem:(id)a5
{
  AVPlayerQueueModificationDescription *v8;
  AVPlayerQueueModificationDescription *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVPlayerQueueModificationDescription;
  v8 = -[AVPlayerQueueModificationDescription init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_modificationType = a3;
    v8->_item = (AVPlayerItem *)a4;
    v9->_afterItem = (AVPlayerItem *)a5;
  }
  return v9;
}

- (AVPlayerItem)item
{
  return self->_item;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVPlayerQueueModificationDescription;
  -[AVPlayerQueueModificationDescription dealloc](&v3, sel_dealloc);
}

+ (id)modificationForRemovingItem:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithModificationType:item:afterItem:", 1, a3, 0);
}

- (AVPlayerQueueModificationDescription)init
{
  void *v4;
  uint64_t v5;
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  v6 = NSStringFromSelector(sel_modificationForInsertingItem_afterItem_);
  NSStringFromSelector(sel_modificationForRemovingItem_);
  v12 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Not available.  Use %@ or %@ instead"), v7, v8, v9, v10, v11, (uint64_t)v6), 0);
  objc_exception_throw(v12);
}

- (int64_t)modificationType
{
  return self->_modificationType;
}

- (AVPlayerItem)afterItem
{
  return self->_afterItem;
}

@end
