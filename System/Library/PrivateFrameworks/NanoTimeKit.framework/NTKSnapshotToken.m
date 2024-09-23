@implementation NTKSnapshotToken

- (NTKSnapshotToken)initWithPriority:(unint64_t)a3 callback:(id)a4
{
  id v6;
  NTKSnapshotToken *v7;
  NTKSnapshotToken *v8;
  NTKSnapshotRequest *request;
  void *v10;
  id callback;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NTKSnapshotToken;
  v7 = -[NTKSnapshotToken init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    request = v7->_request;
    v7->_request = 0;

    v8->_lock._os_unfair_lock_opaque = 0;
    v8->_lock_priority = a3;
    v10 = _Block_copy(v6);
    callback = v8->_callback;
    v8->_callback = v10;

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[NTKSnapshotRequest updatePriority](self->_request, "updatePriority");
  v3.receiver = self;
  v3.super_class = (Class)NTKSnapshotToken;
  -[NTKSnapshotToken dealloc](&v3, sel_dealloc);
}

- (unint64_t)priority
{
  os_unfair_lock_s *p_lock;
  unint64_t lock_priority;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_priority = self->_lock_priority;
  os_unfair_lock_unlock(p_lock);
  return lock_priority;
}

- (void)setPriority:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_priority = a3;
  os_unfair_lock_unlock(p_lock);
  -[NTKSnapshotRequest updatePriority](self->_request, "updatePriority");
}

- (void)setRequest:(id)a3
{
  NTKSnapshotRequest *v4;
  NTKSnapshotRequest *request;

  v4 = (NTKSnapshotRequest *)a3;
  os_unfair_lock_lock(&self->_lock);
  request = self->_request;
  self->_request = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)callback
{
  return _Block_copy(self->_callback);
}

- (void)stopObservingCallbacks
{
  -[NTKSnapshotRequest stopObservingChanges:](self->_request, "stopObservingChanges:", self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_callback, 0);
}

@end
