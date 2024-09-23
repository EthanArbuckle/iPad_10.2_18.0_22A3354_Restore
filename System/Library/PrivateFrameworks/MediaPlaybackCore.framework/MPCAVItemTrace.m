@implementation MPCAVItemTrace

- (void)dealloc
{
  objc_super v3;

  -[MPCAVItemTrace cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)MPCAVItemTrace;
  -[MPCAVItemTrace dealloc](&v3, sel_dealloc);
}

- (void)endInterval
{
  double v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  double v9;
  double v10;
  double v11;
  int v12;
  void *v13;
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  double v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[MPCAVItemTrace ended](self, "ended");
  if (v3 == 0.0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    -[MPCAVItemTrace setEnded:](self, "setEnded:");
    -[MPCAVItemTrace item](self, "item");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCAVItemTrace endEvent](self, "endEvent");
    objc_msgSend(v4, "type");
    objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "networkType");
    kdebug_trace();

    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[MPCAVItemTrace name](self, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[MPCAVItemTrace endEvent](self, "endEvent");
      -[MPCAVItemTrace ended](self, "ended");
      v10 = v9;
      -[MPCAVItemTrace started](self, "started");
      v12 = 138413058;
      v13 = v7;
      v14 = 1024;
      v15 = v8;
      v16 = 2048;
      v17 = v10 - v11;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_DEBUG, "%@_END (%x): %.3fs %@", (uint8_t *)&v12, 0x26u);

    }
  }
}

- (void)cancel
{
  double v3;
  void *v4;
  NSObject *v5;
  void *v6;
  unsigned int v7;
  double v8;
  double v9;
  double v10;
  int v11;
  void *v12;
  __int16 v13;
  unsigned int v14;
  __int16 v15;
  double v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[MPCAVItemTrace ended](self, "ended");
  if (v3 == 0.0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    -[MPCAVItemTrace setEnded:](self, "setEnded:");
    -[MPCAVItemTrace item](self, "item");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[MPCAVItemTrace name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[MPCAVItemTrace endEvent](self, "endEvent");
      -[MPCAVItemTrace ended](self, "ended");
      v9 = v8;
      -[MPCAVItemTrace started](self, "started");
      v11 = 138413058;
      v12 = v6;
      v13 = 1024;
      v14 = v7;
      v15 = 2048;
      v16 = v9 - v10;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEBUG, "%@_END (%x) CANCELLED: %.3fs %@", (uint8_t *)&v11, 0x26u);

    }
  }
}

- (MPAVItem)item
{
  return (MPAVItem *)objc_loadWeakRetained((id *)&self->_item);
}

- (void)setItem:(id)a3
{
  objc_storeWeak((id *)&self->_item, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (unsigned)endEvent
{
  return self->_endEvent;
}

- (void)setEndEvent:(unsigned int)a3
{
  self->_endEvent = a3;
}

- (double)started
{
  return self->_started;
}

- (void)setStarted:(double)a3
{
  self->_started = a3;
}

- (double)ended
{
  return self->_ended;
}

- (void)setEnded:(double)a3
{
  self->_ended = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_item);
}

+ (MPCAVItemTrace)traceWithName:(id)a3 item:(id)a4 event:(unsigned int)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  MPCAVItemTrace *result;
  int v12;
  id v13;
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "type");
  objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "networkType");
  kdebug_trace();

  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138412802;
    v13 = v7;
    v14 = 1024;
    v15 = a5;
    v16 = 2112;
    v17 = a4;
    _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEBUG, "%@ (%x): %@", (uint8_t *)&v12, 0x1Cu);
  }

  return result;
}

+ (id)traceIntervalWithName:(id)a3 item:(id)a4 beginEvent:(unsigned int)a5 endEvent:(unsigned int)a6
{
  uint64_t v6;
  id v9;
  id v10;
  MPCAVItemTrace *v11;
  void *v12;
  NSObject *v13;
  int v15;
  id v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v6 = *(_QWORD *)&a6;
  v21 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = objc_alloc_init(MPCAVItemTrace);
  -[MPCAVItemTrace setName:](v11, "setName:", v9);
  -[MPCAVItemTrace setItem:](v11, "setItem:", v10);
  -[MPCAVItemTrace setEndEvent:](v11, "setEndEvent:", v6);
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  -[MPCAVItemTrace setStarted:](v11, "setStarted:");
  objc_msgSend(v10, "type");
  objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "networkType");
  kdebug_trace();

  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v15 = 138412802;
    v16 = v9;
    v17 = 1024;
    v18 = a5;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEBUG, "%@_BEGIN (%x): %@", (uint8_t *)&v15, 0x1Cu);
  }

  return v11;
}

@end
