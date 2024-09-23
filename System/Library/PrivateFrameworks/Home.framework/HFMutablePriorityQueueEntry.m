@implementation HFMutablePriorityQueueEntry

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

- (unint64_t)priority
{
  return self->_priority;
}

- (HFMutablePriorityQueueEntry)initWithValue:(id)a3 priority:(int64_t)a4
{
  id v7;
  HFMutablePriorityQueueEntry *v8;
  HFMutablePriorityQueueEntry *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFMutablePriorityQueueEntry;
  v8 = -[HFMutablePriorityQueueEntry init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_value, a3);
    v9->_priority = a4;
  }

  return v9;
}

- (HFMutablePriorityQueueEntry)initWithValue:(id)a3
{
  return -[HFMutablePriorityQueueEntry initWithValue:priority:](self, "initWithValue:priority:", a3, 0);
}

- (id)value
{
  return self->_value;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

@end
