@implementation _MFMessageCollector

- (BOOL)shouldCancel
{
  MFActivityMonitor *monitor;
  MFActivityMonitor *v4;
  MFActivityMonitor *v5;

  monitor = self->_monitor;
  if (!monitor)
  {
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v4 = (MFActivityMonitor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_monitor;
    self->_monitor = v4;

    monitor = self->_monitor;
  }
  return -[MFActivityMonitor shouldCancel](monitor, "shouldCancel");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transmogrifier, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_messages, 0);
}

- (_MFMessageCollector)init
{
  _MFMessageCollector *v2;
  NSMutableArray *v3;
  NSMutableArray *messages;
  _MFMessageCollector *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MFMessageCollector;
  v2 = -[_MFMessageCollector init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    messages = v2->_messages;
    v2->_messages = v3;

    v5 = v2;
  }

  return v2;
}

- (id)messages
{
  return self->_messages;
}

- (id)copyMessages
{
  return self->_messages;
}

- (void)newMessagesAvailable:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_transmogrifier)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v6);
          (*((void (**)(id))self->_transmogrifier + 2))(self->_transmogrifier);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            -[NSMutableArray addObject:](self->_messages, "addObject:", v10, (_QWORD)v11);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
  else
  {
    -[NSMutableArray addObjectsFromArray:](self->_messages, "addObjectsFromArray:", v4);
  }

}

- (id)transmogrifier
{
  return self->_transmogrifier;
}

- (void)setTransmogrifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
