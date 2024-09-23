@implementation ICSession

- (ICSession)initWithConnection:(id)a3
{
  id v4;
  ICSession *v5;
  ICSession *v6;
  NSMutableArray *v7;
  NSMutableArray *notifications;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICSession;
  v5 = -[ICSession init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[ICSession setConnection:](v5, "setConnection:", v4);
    -[ICSession setOpenSession:](v6, "setOpenSession:", 0);
    -[ICSession setObjectHandle:](v6, "setObjectHandle:", 0);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    notifications = v6->_notifications;
    v6->_notifications = v7;

    v6->_resourceLock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (int)pid
{
  NSXPCConnection *connection;

  connection = self->_connection;
  if (connection)
    return -[NSXPCConnection processIdentifier](connection, "processIdentifier");
  else
    return -1;
}

- (void)dealloc
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  objc_super v5;

  connection = self->_connection;
  if (connection)
  {
    -[NSXPCConnection invalidate](connection, "invalidate");
    v4 = self->_connection;
    self->_connection = 0;

  }
  self->_objectHandle = 0;
  v5.receiver = self;
  v5.super_class = (Class)ICSession;
  -[ICSession dealloc](&v5, sel_dealloc);
}

- (BOOL)interestedInNotification:(id)a3
{
  ICSession *v3;
  os_unfair_lock_s *p_resourceLock;
  id v5;

  v3 = self;
  p_resourceLock = &self->_resourceLock;
  v5 = a3;
  os_unfair_lock_lock(p_resourceLock);
  LOBYTE(v3) = -[NSMutableArray containsObject:](v3->_notifications, "containsObject:", v5);

  os_unfair_lock_unlock(p_resourceLock);
  return (char)v3;
}

- (void)addNotifications:(id)a3
{
  os_unfair_lock_s *p_resourceLock;
  id v5;

  p_resourceLock = &self->_resourceLock;
  v5 = a3;
  os_unfair_lock_lock(p_resourceLock);
  -[NSMutableArray addObjectsFromArray:](self->_notifications, "addObjectsFromArray:", v5);

  os_unfair_lock_unlock(p_resourceLock);
}

- (void)remNotifications:(id)a3
{
  os_unfair_lock_s *p_resourceLock;
  id v5;

  p_resourceLock = &self->_resourceLock;
  v5 = a3;
  os_unfair_lock_lock(p_resourceLock);
  -[NSMutableArray removeObjectsInArray:](self->_notifications, "removeObjectsInArray:", v5);

  os_unfair_lock_unlock(p_resourceLock);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSMutableArray)notifications
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)openSession
{
  return self->_openSession;
}

- (void)setOpenSession:(BOOL)a3
{
  self->_openSession = a3;
}

- (unint64_t)objectHandle
{
  return self->_objectHandle;
}

- (void)setObjectHandle:(unint64_t)a3
{
  self->_objectHandle = a3;
}

- (BOOL)forwardPTPEvents
{
  return self->_forwardPTPEvents;
}

- (void)setForwardPTPEvents:(BOOL)a3
{
  self->_forwardPTPEvents = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
