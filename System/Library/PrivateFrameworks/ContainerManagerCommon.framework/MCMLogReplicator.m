@implementation MCMLogReplicator

- (MCMLogReplicator)initWithWorkloop:(id)a3
{
  NSObject *v4;
  MCMLogReplicator *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCMLogReplicator;
  v5 = -[MCMLogReplicator init](&v11, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INTERACTIVE, 0);
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = dispatch_queue_create_with_target_V2("com.apple.containermanagerd.log_diverter", v7, v4);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

  }
  return v5;
}

- (id)volumeChangedDispatchQueue
{
  return -[MCMLogReplicator queue](self, "queue");
}

- (void)volumeChangedWithEvents:(unint64_t)a3 newVolumeState:(unint64_t)a4
{
  id v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((a4 & 3) != 0)
  {
    container_internal_get_first_boot_uuid();
    v4 = containermanager_copy_global_configuration();
    objc_msgSend(v4, "defaultUser", 0, v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UID");
    container_log_replication_enable_to_uid_relative_path();

  }
  else
  {
    container_log_replication_disable();
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
