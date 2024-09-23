@implementation NEIKEv2Transport

- (NEIKEv2Transport)init
{
  NEIKEv2Transport *v2;
  NEIKEv2Transport *v3;
  NEIKEv2Transport *v4;
  NSObject *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NEIKEv2Transport;
  v2 = -[NEIKEv2Transport init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_19BD16000, v6, OS_LOG_TYPE_FAULT, "[super init] failed", v7, 2u);
    }

  }
  return v3;
}

- (void)dealloc
{
  NSObject *v3;
  SEL v4;
  const char *v5;
  NSObject *Property;
  SEL v7;
  objc_super v8;
  uint8_t buf[4];
  NEIKEv2Transport *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v10 = self;
    _os_log_debug_impl(&dword_19BD16000, v3, OS_LOG_TYPE_DEBUG, "deallocating %@", buf, 0xCu);
  }

  if (self)
  {
    self->_cancelled = 1;
    objc_storeWeak((id *)&self->_packetDelegate, 0);
    if (objc_getProperty(self, v4, 56, 1))
    {
      Property = objc_getProperty(self, v5, 56, 1);
      nw_connection_cancel(Property);
      objc_setProperty_atomic(self, v7, 0, 56);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)NEIKEv2Transport;
  -[NEIKEv2Transport dealloc](&v8, sel_dealloc);
}

- (NSString)description
{
  id v3;
  __CFString *v4;
  const char *v5;
  id WeakRetained;
  const char *v7;
  id v8;
  SEL v9;
  id v10;
  const char *v11;
  void *v12;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self)
  {
    +[NEIKEv2Transport stringForTransport:]((uint64_t)NEIKEv2Transport, self->_transportType);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_packetDelegate);
    if (WeakRetained)
      v7 = " PacketDelegate";
    else
      v7 = "";
    v8 = objc_getProperty(self, v5, 16, 1);
    v10 = objc_getProperty(self, v9, 24, 1);
    if (self->_cancelled)
      v11 = " (Closed)";
    else
      v11 = "";
  }
  else
  {
    objc_opt_self();
    v8 = 0;
    WeakRetained = 0;
    v10 = 0;
    v7 = "";
    v4 = CFSTR("UDP");
    v11 = "";
  }
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<NEIKEv2Transport> %@%s %@ -> %@%s"), v4, v7, v8, v10, v11);

  return (NSString *)v12;
}

- (void)receivePacketData:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  const char *v7;
  id WeakRetained;
  const char *v9;
  NSObject *Property;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  const char *v14;
  NSObject *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      goto LABEL_17;
    v16 = 136315138;
    v17 = "-[NEIKEv2Transport receivePacketData:]";
    v14 = "%s called with null data";
    goto LABEL_15;
  }
  if (!objc_msgSend(v4, "length"))
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      goto LABEL_17;
    v16 = 136315138;
    v17 = "-[NEIKEv2Transport receivePacketData:]";
    v14 = "%s called with null data.length";
    goto LABEL_15;
  }
  if (!self)
    goto LABEL_16;
  if (self->_cancelled)
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    LOWORD(v16) = 0;
    v13 = "Transport cancelled, ignoring";
LABEL_12:
    _os_log_debug_impl(&dword_19BD16000, v12, OS_LOG_TYPE_DEBUG, v13, (uint8_t *)&v16, 2u);
    goto LABEL_17;
  }
  if (!objc_msgSend(objc_getProperty(self, v6, 80, 1), "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_wildcardDelegate);

    if (!WeakRetained)
    {
LABEL_16:
      ne_log_obj();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        goto LABEL_17;
      LOWORD(v16) = 0;
      v13 = "Transport has no clients, ignoring";
      goto LABEL_12;
    }
  }
  if (!objc_getProperty(self, v7, 72, 1))
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      goto LABEL_17;
    v16 = 136315138;
    v17 = "-[NEIKEv2Transport receivePacketData:]";
    v14 = "%s called with null self.receiveQueue";
LABEL_15:
    _os_log_fault_impl(&dword_19BD16000, v12, OS_LOG_TYPE_FAULT, v14, (uint8_t *)&v16, 0xCu);
    goto LABEL_17;
  }
  Property = objc_getProperty(self, v9, 72, 1);
  dispatch_assert_queue_V2(Property);
  v11 = +[NEIKEv2Packet createPacketFromReceivedData:]((uint64_t)NEIKEv2Packet, v5);
  if (v11)
  {
    v12 = v11;
    -[NEIKEv2Transport receivePacket:]((id *)&self->super.isa, v11);
  }
  else
  {
    ne_log_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v16) = 0;
      _os_log_fault_impl(&dword_19BD16000, v15, OS_LOG_TYPE_FAULT, "[NEIKEv2Packet packetFromReceivedData] failed", (uint8_t *)&v16, 2u);
    }

    v12 = 0;
  }
LABEL_17:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationTimer, 0);
  objc_destroyWeak((id *)&self->_wildcardDelegate);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_receiveQueue, 0);
  objc_storeStrong((id *)&self->_connectedBlocks, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_packetDelegate);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_remote, 0);
  objc_storeStrong((id *)&self->_local, 0);
}

- (void)receivePacket:(id *)a1
{
  const char *v3;
  _BYTE *v4;
  id v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id *v11;
  id Property;
  const char *v13;
  id v14;
  ptrdiff_t v15;
  id v16;
  int v17;
  id WeakRetained;
  const char *v19;
  id v20;
  const char *v21;
  id v22;
  ptrdiff_t v23;
  id v24;
  int v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  id *v30;
  id v31;
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  _BYTE *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
  {
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v5 = (id)objc_msgSend(objc_getProperty(a1, v3, 80, 1), "copy");
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v6)
    {
      v8 = v6;
      v30 = a1;
      v31 = v5;
      v32 = 0;
      v9 = *(_QWORD *)v34;
      while (1)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v34 != v9)
            objc_enumerationMutation(v5);
          v11 = *(id **)(*((_QWORD *)&v33 + 1) + 8 * v10);
          if (v11)
            Property = objc_getProperty(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v10), v7, 8, 1);
          else
            Property = 0;
          v14 = Property;
          if ((v4[11] & 1) != 0)
            v15 = 40;
          else
            v15 = 32;
          v16 = objc_getProperty(v4, v13, v15, 1);
          v17 = objc_msgSend(v14, "isEqual:", v16);

          if (v17)
          {

            if (!v11)
              goto LABEL_26;
LABEL_14:
            WeakRetained = objc_loadWeakRetained(v11 + 3);
            if (!WeakRetained)
              goto LABEL_26;
            v16 = WeakRetained;
            objc_msgSend(WeakRetained, "receivePacket:", v4);
            v32 = 1;
LABEL_25:

            goto LABEL_26;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_25;
          if (v11)
            v20 = objc_getProperty(v11, v19, 16, 1);
          else
            v20 = 0;
          v22 = v20;
          if ((v4[11] & 1) != 0)
            v23 = 32;
          else
            v23 = 40;
          v24 = objc_getProperty(v4, v21, v23, 1);
          v25 = objc_msgSend(v22, "isEqual:", v24);

          if (v25)
          {
            v5 = v31;
            if (v11)
              goto LABEL_14;
          }
          else
          {
            v5 = v31;
          }
LABEL_26:
          ++v10;
        }
        while (v8 != v10);
        v26 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        v8 = v26;
        if (!v26)
        {

          a1 = v30;
          if ((v32 & 1) != 0)
            goto LABEL_43;
          goto LABEL_35;
        }
      }
    }

LABEL_35:
    v27 = objc_loadWeakRetained(a1 + 11);
    ne_log_obj();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v27)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v4;
        _os_log_impl(&dword_19BD16000, v29, OS_LOG_TYPE_INFO, "No matching clients, trying wildcard for %@", buf, 0xCu);
      }

      objc_msgSend(v27, "receivePacket:transport:", v4, a1);
    }
    else
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v4;
        _os_log_error_impl(&dword_19BD16000, v29, OS_LOG_TYPE_ERROR, "No matching clients, dropping %@", buf, 0xCu);
      }

    }
LABEL_43:

  }
}

+ (__CFString)stringForTransport:(uint64_t)a1
{
  __CFString *v3;

  objc_opt_self();
  if (a2 >= 4)
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown (%u)"), a2);
  else
    v3 = off_1E3CC1B48[a2];
  return v3;
}

- (void)startInvalidationTimer
{
  SEL v3;
  NSObject *Property;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  SEL v8;
  NSObject *v9;
  _QWORD handler[4];
  NSObject *v11;
  id v12;
  id location;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[NEIKEv2Transport cancelInvalidationTimer](a1, a2);
  Property = objc_getProperty(a1, v3, 72, 1);
  v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, Property);
  v6 = dispatch_time(0x8000000000000000, 5000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  objc_initWeak(&location, a1);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __42__NEIKEv2Transport_startInvalidationTimer__block_invoke;
  handler[3] = &unk_1E3CC1AB0;
  objc_copyWeak(&v12, &location);
  v7 = v5;
  v11 = v7;
  dispatch_source_set_event_handler(v7, handler);
  objc_setProperty_atomic(a1, v8, v7, 96);
  dispatch_activate(v7);
  ne_log_obj();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = a1;
    _os_log_impl(&dword_19BD16000, v9, OS_LOG_TYPE_INFO, "%@ started invalidation timer", buf, 0xCu);
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)cancelInvalidationTimer
{
  const char *v3;
  NSObject *Property;
  SEL v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (objc_getProperty(a1, a2, 96, 1))
  {
    Property = objc_getProperty(a1, v3, 96, 1);
    dispatch_source_cancel(Property);
    objc_setProperty_atomic(a1, v5, 0, 96);
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = a1;
      _os_log_impl(&dword_19BD16000, v6, OS_LOG_TYPE_INFO, "%@ cancelled invalidation timer", (uint8_t *)&v7, 0xCu);
    }

  }
}

void __42__NEIKEv2Transport_startInvalidationTimer__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  const char *v3;
  void *v4;
  const char *v5;
  NSObject *v6;
  const char *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained
    && (WeakRetained[9] & 1) == 0
    && !objc_msgSend(objc_getProperty(WeakRetained, v3, 80, 1), "count")
    && objc_getProperty(v4, v5, 96, 1) == *(id *)(a1 + 32))
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_19BD16000, v6, OS_LOG_TYPE_DEFAULT, "%@ has no clients after 5s, invalidating", (uint8_t *)&v8, 0xCu);
    }

    -[NEIKEv2Transport invalidate]((uint64_t)v4, v7);
  }

}

- (void)invalidate
{
  const char *v3;
  NSObject *Property;
  SEL v5;
  id WeakRetained;
  const char *v7;

  if (objc_getProperty((id)a1, a2, 56, 1))
  {
    Property = objc_getProperty((id)a1, v3, 56, 1);
    nw_connection_cancel(Property);
    objc_setProperty_atomic((id)a1, v5, 0, 56);
  }
  *(_BYTE *)(a1 + 9) = 1;
  objc_storeWeak((id *)(a1 + 48), 0);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  objc_msgSend(WeakRetained, "invalidatingTransport:", a1);

  objc_storeWeak((id *)(a1 + 88), 0);
  -[NEIKEv2Transport cancelInvalidationTimer]((void *)a1, v7);
  os_unfair_lock_lock((os_unfair_lock_t)&g_transport_lock);
  objc_msgSend((id)g_transports, "removeObject:", a1);
  os_unfair_lock_unlock((os_unfair_lock_t)&g_transport_lock);
}

- (void)addClient:(void *)a3 delegate:
{
  id v5;
  char *v6;
  NSObject *v7;
  NSObject *p_super;
  NEIKEv2TransportClient *v9;
  const char *v10;
  SEL v11;
  const char *v12;
  id v13;
  SEL v14;
  const char *v15;
  NSObject *v16;
  const char *v17;
  int v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (v5)
    {
      ne_log_obj();
      v7 = objc_claimAutoreleasedReturnValue();
      p_super = v7;
      if (v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 138412802;
          v19 = v6;
          v20 = 2112;
          v21 = v5;
          v22 = 2112;
          v23 = a1;
          _os_log_impl(&dword_19BD16000, p_super, OS_LOG_TYPE_DEFAULT, "NEIKEv2Transport: Adding client %@ with SPI %@ on %@", (uint8_t *)&v18, 0x20u);
        }

        v9 = objc_alloc_init(NEIKEv2TransportClient);
        if (v9)
        {
          p_super = &v9->super;
          objc_setProperty_atomic(v9, v10, v5, 8);
          objc_storeWeak((id *)&p_super[3].isa, v6);
          if (!objc_getProperty(a1, v11, 80, 1))
          {
            v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            objc_setProperty_atomic(a1, v14, v13, 80);

          }
          objc_msgSend(objc_getProperty(a1, v12, 80, 1), "addObject:", p_super);
          -[NEIKEv2Transport cancelInvalidationTimer](a1, v15);
        }
        else
        {
          ne_log_obj();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          {
            LOWORD(v18) = 0;
            _os_log_fault_impl(&dword_19BD16000, v16, OS_LOG_TYPE_FAULT, "[[NEIKEv2TransportClient alloc] init] failed", (uint8_t *)&v18, 2u);
          }

          p_super = 0;
        }
        goto LABEL_13;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        v18 = 136315138;
        v19 = "-[NEIKEv2Transport addClient:delegate:]";
        v17 = "%s called with null delegate";
        goto LABEL_19;
      }
    }
    else
    {
      ne_log_obj();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
      {
        v18 = 136315138;
        v19 = "-[NEIKEv2Transport addClient:delegate:]";
        v17 = "%s called with null clientSPI";
LABEL_19:
        _os_log_fault_impl(&dword_19BD16000, p_super, OS_LOG_TYPE_FAULT, v17, (uint8_t *)&v18, 0xCu);
      }
    }
LABEL_13:

  }
}

- (void)setWildcardDelegate:(char)a3 preventsInvalidation:
{
  char *v5;
  SEL v6;
  uint64_t v7;
  const char *v8;

  v5 = a2;
  if (a1)
  {
    v8 = v5;
    objc_storeWeak((id *)(a1 + 88), v5);
    *(_BYTE *)(a1 + 10) = a3;
    v7 = objc_msgSend(objc_getProperty((id)a1, v6, 80, 1), "count");
    v5 = (char *)v8;
    if (!v7)
    {
      if (v8)
      {
        if ((a3 & 1) != 0)
          -[NEIKEv2Transport cancelInvalidationTimer]((void *)a1, v8);
        else
          -[NEIKEv2Transport startInvalidationTimer]((void *)a1, v8);
      }
      else
      {
        -[NEIKEv2Transport invalidate](a1, 0);
      }
      v5 = (char *)v8;
    }
  }

}

- (void)setRemoteSPI:(void *)a3 forClient:
{
  id v5;
  const char *v6;
  id v7;
  id v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v7 = a3;
  if (a1)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = objc_getProperty(a1, v6, 80, 1);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (!v9)
      goto LABEL_19;
    v11 = v9;
    v12 = *(_QWORD *)v18;
    while (1)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
        if (v14)
        {
          if (!objc_msgSend(objc_getProperty(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), v10, 8, 1), "isEqual:", v7)|| objc_getProperty(v14, v10, 16, 1))
          {
            goto LABEL_14;
          }
          objc_setProperty_atomic(v14, v10, v5, 16);
        }
        else if ((objc_msgSend(0, "isEqual:", v7) & 1) == 0)
        {
          goto LABEL_14;
        }
        ne_log_obj();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v22 = v14;
          v23 = 2112;
          v24 = a1;
          _os_log_impl(&dword_19BD16000, v15, OS_LOG_TYPE_DEFAULT, "Set remote SPI for client %@ on %@", buf, 0x16u);
        }

LABEL_14:
        ++v13;
      }
      while (v11 != v13);
      v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      v11 = v16;
      if (!v16)
      {
LABEL_19:

        break;
      }
    }
  }

}

- (void)cancelClient:(int)a3 shouldInvalidate:
{
  const char *v5;
  id v6;
  NSObject *v7;
  const char *v8;
  SEL v9;
  id v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id Property;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  id v21;
  id WeakRetained;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  const char *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (a1)
  {
    if (a3)
      -[NEIKEv2Transport invalidate](a1, v5);
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = "";
      *(_DWORD *)buf = 136315650;
      if (a3)
        v8 = " and invalidating";
      v33 = (uint64_t)v8;
      v34 = 2112;
      v35 = (uint64_t)v6;
      v36 = 2112;
      v37 = a1;
      _os_log_impl(&dword_19BD16000, v7, OS_LOG_TYPE_DEFAULT, "Cancelling%s client %@ for %@", buf, 0x20u);
    }

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = objc_getProperty((id)a1, v9, 80, 1);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v11)
    {
      v13 = v11;
      v14 = *(_QWORD *)v28;
      while (2)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v15);
          if (v16)
            Property = objc_getProperty(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v15), v12, 8, 1);
          else
            Property = 0;
          if (objc_msgSend(Property, "isEqual:", v6, (_QWORD)v27))
          {
            ne_log_obj();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v33 = (uint64_t)v16;
              v34 = 2112;
              v35 = a1;
              _os_log_impl(&dword_19BD16000, v20, OS_LOG_TYPE_INFO, "Removing client %@ for %@", buf, 0x16u);
            }

            v21 = v16;
            if (v16)
            {
              objc_msgSend(objc_getProperty((id)a1, v19, 80, 1), "removeObject:", v21);
              goto LABEL_26;
            }
            goto LABEL_25;
          }
          ++v15;
        }
        while (v13 != v15);
        v18 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        v13 = v18;
        if (v18)
          continue;
        break;
      }
    }

LABEL_25:
    v21 = 0;
LABEL_26:
    if ((*(_BYTE *)(a1 + 9) & 1) == 0 && !objc_msgSend(objc_getProperty((id)a1, v19, 80, 1), "count"))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));

      if (WeakRetained)
      {
        if ((*(_BYTE *)(a1 + 10) & 1) == 0)
        {
          ne_log_obj();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v33 = a1;
            _os_log_impl(&dword_19BD16000, v23, OS_LOG_TYPE_DEFAULT, "%@ out of clients, starting invalidation timer", buf, 0xCu);
          }

          -[NEIKEv2Transport startInvalidationTimer]((void *)a1, v24);
        }
      }
      else
      {
        ne_log_obj();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v33 = a1;
          _os_log_impl(&dword_19BD16000, v25, OS_LOG_TYPE_DEFAULT, "%@ out of clients, invalidating", buf, 0xCu);
        }

        -[NEIKEv2Transport invalidate](a1, v26);
      }
    }

  }
}

- (void)port
{
  void *v2;
  const char *v3;

  if (result)
  {
    v2 = result;
    result = (void *)objc_msgSend(objc_getProperty(result, a2, 16, 1), "address");
    if (result)
      return (void *)(bswap32(*(unsigned __int16 *)(objc_msgSend(objc_getProperty(v2, v3, 16, 1), "address") + 2)) >> 16);
  }
  return result;
}

- (void)readOnConnection
{
  const char *v3;
  id WeakRetained;
  char v5;
  const char *v6;
  NSObject *Property;
  NSObject *v8;
  const char *v9;
  _QWORD completion[5];
  uint8_t buf[16];

  if (self)
  {
    if ((*((_BYTE *)self + 9) & 1) != 0)
    {
      ne_log_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        goto LABEL_17;
      *(_WORD *)buf = 0;
      v9 = "Transport cancelled, ignoring";
    }
    else
    {
      if (objc_getProperty(self, a2, 56, 1))
      {
        if (objc_msgSend(objc_getProperty(self, v3, 80, 1), "count")
          || (WeakRetained = objc_loadWeakRetained(self + 11), WeakRetained, WeakRetained))
        {
          os_unfair_lock_lock((os_unfair_lock_t)&g_transport_lock);
          v5 = objc_msgSend((id)g_transports, "containsObject:", self);
          os_unfair_lock_unlock((os_unfair_lock_t)&g_transport_lock);
          if ((v5 & 1) != 0)
          {
            Property = objc_getProperty(self, v6, 56, 1);
            completion[0] = MEMORY[0x1E0C809B0];
            completion[1] = 3221225472;
            completion[2] = __36__NEIKEv2Transport_readOnConnection__block_invoke;
            completion[3] = &unk_1E3CC1AD8;
            completion[4] = self;
            nw_connection_receive_message(Property, completion);
            return;
          }
          ne_log_obj();
          v8 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
            goto LABEL_17;
          *(_WORD *)buf = 0;
          v9 = "Transport not found in list, ignoring";
          goto LABEL_16;
        }
        ne_log_obj();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v9 = "Transport has no clients, ignoring";
          goto LABEL_16;
        }
LABEL_17:

        return;
      }
      ne_log_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        goto LABEL_17;
      *(_WORD *)buf = 0;
      v9 = "Transport connection invalid, ignoring";
    }
LABEL_16:
    _os_log_debug_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEBUG, v9, buf, 2u);
    goto LABEL_17;
  }
}

void __36__NEIKEv2Transport_readOnConnection__block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  int v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  _DWORD v22[2];
  __int16 v23;
  int v24;
  uint8_t buf[24];
  unsigned int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a5;
  if (v11)
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v20;
      _os_log_error_impl(&dword_19BD16000, v12, OS_LOG_TYPE_ERROR, "Connection receive error %@ for %@", buf, 0x16u);
    }

    -[NEIKEv2Transport reportConnectionError:](*(void **)(a1 + 32), v11);
    if (nw_error_get_error_code(v11) == 89)
      goto LABEL_23;
LABEL_22:
    -[NEIKEv2Transport readOnConnection](*(id *)(a1 + 32));
    goto LABEL_23;
  }
  if (!v9 || !a4)
    goto LABEL_22;
  v13 = v9;
  if (objc_msgSend(v13, "length") == 1)
  {
    LOBYTE(v22[0]) = 0;
    objc_msgSend(v13, "getBytes:length:", v22, 1);
    if (LOBYTE(v22[0]) == 255)
    {
      ne_log_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19BD16000, v14, OS_LOG_TYPE_INFO, "Ignoring keepalive packet", buf, 2u);
      }
      goto LABEL_21;
    }
  }
  memset(buf, 0, sizeof(buf));
  v26 = 0;
  if ((unint64_t)objc_msgSend(v13, "length") <= 0x1B)
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend(v13, "length");
      v22[0] = 67109376;
      v22[1] = v15;
      v23 = 1024;
      v24 = 28;
      v16 = "Packet shorter than header size (size: %u, minimum expected: %u)";
      v17 = v14;
      v18 = 14;
LABEL_16:
      _os_log_error_impl(&dword_19BD16000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)v22, v18);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  objc_msgSend(v13, "getBytes:length:", buf, 28);
  if (bswap32(v26) >= 0x10000)
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22[0]) = 0;
      v16 = "The length in the IKE header is too big";
      v17 = v14;
      v18 = 2;
      goto LABEL_16;
    }
LABEL_21:

    goto LABEL_22;
  }
  v19 = +[NEIKEv2Packet createPacketFromReceivedData:]((uint64_t)NEIKEv2Packet, v13);
  if (v19)
  {
    v14 = v19;
    -[NEIKEv2Transport receivePacket:](*(id **)(a1 + 32), v19);
    goto LABEL_21;
  }
  ne_log_obj();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v22[0]) = 0;
    _os_log_fault_impl(&dword_19BD16000, v21, OS_LOG_TYPE_FAULT, "[NEIKEv2Packet createPacketFromReceivedData] failed", (uint8_t *)v22, 2u);
  }

LABEL_23:
}

- (void)reportConnectionError:(void *)a1
{
  uint64_t error_code;
  SEL v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    error_code = nw_error_get_error_code(error);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = (id)objc_msgSend(objc_getProperty(a1, v4, 80, 1), "copy");
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
          if (v10)
          {
            WeakRetained = objc_loadWeakRetained((id *)(v10 + 24));
            if (WeakRetained)
            {
              v12 = WeakRetained;
              objc_msgSend(WeakRetained, "reportError:", error_code, (_QWORD)v13);

            }
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
}

- (void)callConnectedBlocks
{
  void *v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 64);
  if (v1)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = v1;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7));
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

    objc_msgSend(*(id *)(a1 + 64), "removeAllObjects", (_QWORD)v9);
    v8 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = 0;

  }
}

void __56__NEIKEv2Transport_createTransportWithConnection_queue___block_invoke(uint64_t a1, int a2, void *a3)
{
  -[NEIKEv2Transport handleConnectionEventWithState:error:](*(_BYTE **)(a1 + 32), a2, a3);
}

- (void)handleConnectionEventWithState:(void *)a3 error:
{
  const char *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  NSObject *v9;
  nw_endpoint_t v10;
  void *v11;
  SEL v12;
  NSObject *v13;
  void *v14;
  SEL v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  __int16 v21;
  _BYTE *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a1 && objc_getProperty(a1, v5, 56, 1))
  {
    if (a2 == 4)
    {
      a1[8] = 0;
      ne_log_obj();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = 138412546;
        v20 = v6;
        v21 = 2112;
        v22 = a1;
        _os_log_error_impl(&dword_19BD16000, v18, OS_LOG_TYPE_ERROR, "Connection failed with error %@ for %@", (uint8_t *)&v19, 0x16u);
      }

      -[NEIKEv2Transport reportConnectionError:](a1, v6);
      -[NEIKEv2Transport callConnectedBlocks]((uint64_t)a1);
    }
    else if (a2 == 3)
    {
      a1[8] = 1;
      objc_getProperty(a1, v7, 56, 1);
      v8 = nw_connection_copy_connected_path();
      v9 = v8;
      if (v8)
      {
        v10 = nw_path_copy_effective_local_endpoint(v8);
        if (v10)
        {
          objc_msgSend(MEMORY[0x1E0CCEC78], "endpointWithCEndpoint:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_setProperty_atomic(a1, v12, v11, 16);

        }
        v13 = nw_path_copy_interface();
        if (v13)
        {
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCEC88]), "initWithInterfaceIndex:", nw_interface_get_index(v13));
          objc_setProperty_atomic(a1, v15, v14, 32);

        }
      }
      ne_log_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412290;
        v20 = a1;
        _os_log_impl(&dword_19BD16000, v16, OS_LOG_TYPE_DEFAULT, "Connection ready for %@", (uint8_t *)&v19, 0xCu);
      }

      -[NEIKEv2Transport callConnectedBlocks]((uint64_t)a1);
      -[NEIKEv2Transport readOnConnection]((id *)a1, v17);

    }
  }

}

+ (NEIKEv2Transport)createTransport:(void *)a3 remote:(void *)a4 local:(unsigned int)a5 localPort:(void *)a6 boundInterface:(void *)a7 queue:(void *)a8 socketGetBlock:(void *)a9 packetDelegate:
{
  unint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  unint64_t v18;
  NSObject *v19;
  NEIKEv2Transport *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id WeakRetained;
  char v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  id v36;
  unint64_t v37;
  id v38;
  id Property;
  id v40;
  const char *v41;
  unsigned int v42;
  const char *v43;
  id v44;
  int v45;
  id v46;
  void *v47;
  unsigned int v48;
  id v49;
  id v50;
  const char *v51;
  id v52;
  SEL v53;
  void *v54;
  id v55;
  NSObject *v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v67;
  uint64_t v68;
  void *v69;
  NSObject *v70;
  NEIKEv2Transport *v71;
  NEIKEv2Transport *v72;
  const char *v73;
  const char *v74;
  const char *v75;
  __int16 v76;
  void *v77;
  SEL v78;
  void *v79;
  SEL v80;
  void (**v81)(void);
  SEL v82;
  const char *v83;
  void *v84;
  SEL v85;
  void *v86;
  NSObject *v87;
  NSObject *v88;
  NSObject *v89;
  NSObject *v90;
  void (**v91)(void);
  NSObject *v92;
  NSObject *v93;
  nw_connection_t v94;
  SEL v95;
  SEL v96;
  NSObject *v97;
  NEIKEv2Transport *v98;
  SEL v99;
  uint64_t v100;
  const char *v101;
  int v102;
  int v103;
  int v104;
  NSObject *v105;
  const char *v106;
  SEL v107;
  uint64_t v108;
  const char *v109;
  unint64_t v110;
  void *v111;
  SEL v112;
  void *v113;
  SEL v114;
  SEL v115;
  void *v116;
  SEL v117;
  SEL v118;
  int v119;
  NSObject *v120;
  NSObject *v121;
  id v122;
  NSObject *secure_udp;
  NSObject *v124;
  NSObject *v125;
  id v126;
  NSObject *options;
  SEL v128;
  const char *v129;
  void *v130;
  id v131;
  NSObject *v132;
  void *v133;
  SEL v134;
  SEL v135;
  SEL v136;
  NSObject *v137;
  SEL v138;
  id v139;
  NEIKEv2Transport *v140;
  SEL v141;
  NSObject *v142;
  NSObject *v143;
  void *v144;
  id v145;
  void *v146;
  NSObject *v148;
  const char *v149;
  id v150;
  NSObject *v151;
  int v152;
  const char *v153;
  id v154;
  unint64_t v155;
  id v156;
  NSObject *v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  void *v163;
  uint64_t v164;
  id v165;
  id v166;
  void *v167;
  void *v168;
  void *v169;
  id v170;
  NSObject *v171;
  nw_parameters_t secure_tcp;
  id v175;
  uint64_t v176;
  void *v177;
  void *v178;
  id v179;
  void (**v180)(void);
  _QWORD v181[4];
  NEIKEv2Transport *v182;
  _OWORD v183[4];
  uint8_t v184[8];
  int v185;
  int IKESocket;
  uint8_t v187[4];
  _BYTE v188[34];
  __int16 v189;
  id v190;
  _BYTE buf[12];
  __int16 v192;
  id v193;
  uint64_t v194;

  v194 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  objc_opt_self();
  ne_log_obj();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (NEIKEv2Transport *)v19;
  if (!(v13 | v18))
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v187 = 136315138;
      *(_QWORD *)v188 = "+[NEIKEv2Transport createTransport:remote:local:localPort:boundInterface:queue:socketGetBlock:packetDelegate:]";
      _os_log_fault_impl(&dword_19BD16000, &v20->super, OS_LOG_TYPE_FAULT, "%s called with null remote", v187, 0xCu);
    }
    goto LABEL_132;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    +[NEIKEv2Transport stringForTransport:]((uint64_t)NEIKEv2Transport, a2);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v187 = 138413314;
    *(_QWORD *)v188 = v69;
    *(_WORD *)&v188[8] = 2112;
    *(_QWORD *)&v188[10] = v14;
    *(_WORD *)&v188[18] = 1024;
    *(_DWORD *)&v188[20] = a5;
    *(_WORD *)&v188[24] = 2112;
    *(_QWORD *)&v188[26] = v13;
    v189 = 2112;
    v190 = v15;
    _os_log_debug_impl(&dword_19BD16000, &v20->super, OS_LOG_TYPE_DEBUG, "Creating %@ transport %@(%u) to %@ on \"%@\", v187, 0x30u);

  }
  v175 = (id)v13;
  v21 = v14;
  v22 = v15;
  v179 = (id)v18;
  objc_opt_self();
  if (!a5 && !v18)
  {
    v23 = 0;
    goto LABEL_101;
  }
  v177 = v22;
  v165 = v17;
  os_unfair_lock_lock((os_unfair_lock_t)&g_transport_lock);
  memset(v183, 0, sizeof(v183));
  v24 = (id)g_transports;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", v183, v187, 16);
  if (!v25)
  {
    v23 = 0;
    goto LABEL_100;
  }
  v26 = v25;
  v157 = v16;
  v158 = v14;
  v27 = **(_QWORD **)&v183[1];
  v28 = a2;
  v162 = v24;
  v167 = v21;
LABEL_9:
  v29 = 0;
  while (1)
  {
    if (**(_QWORD **)&v183[1] != v27)
      objc_enumerationMutation(v24);
    v30 = *(_QWORD *)(*((_QWORD *)&v183[0] + 1) + 8 * v29);
    if (v30)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v30 + 48));
      if (v18)
      {
        v32 = *(_BYTE *)(v30 + 9) & 1;
LABEL_15:
        if ((v32 & 1) == 0 && WeakRetained == v179)
          goto LABEL_98;
        goto LABEL_79;
      }
      if ((*(_BYTE *)(v30 + 9) & 1) != 0 || WeakRetained)
        goto LABEL_79;
      v33 = *(_QWORD *)(v30 + 40);
    }
    else
    {
      if (v18)
      {
        WeakRetained = 0;
        v32 = 0;
        v28 = a2;
        v24 = v162;
        goto LABEL_15;
      }
      v33 = 0;
      v18 = 0;
      v28 = a2;
      v24 = v162;
    }
    if (v33 != v28)
    {
      WeakRetained = 0;
      goto LABEL_79;
    }
    v35 = objc_msgSend(v177, "length");
    if (v35)
    {
      v36 = v30 ? objc_getProperty((id)v30, v34, 32, 1) : 0;
      v170 = v36;
      objc_msgSend(v170, "interfaceName");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v177, "isEqualToString:"))
      {
        v46 = v168;
        v47 = v170;
        goto LABEL_77;
      }
    }
    if (!v13)
      break;
    v37 = v13;
    v38 = v15;
    if (v30)
      Property = objc_getProperty((id)v30, v34, 24, 1);
    else
      Property = 0;
    v40 = Property;
    v163 = v40;
    if ((objc_msgSend(v175, "isEqual:", v40) & 1) != 0)
    {
      v42 = -[NEIKEv2Transport port]((void *)v30, v41);
      v44 = v21;
      v45 = v42 == a5;
      v15 = v38;
      v13 = v37;
      if (v44)
      {
        v24 = v162;
        if (v42 == a5)
        {
LABEL_37:
          if (v30)
            v50 = objc_getProperty((id)v30, v43, 16, 1);
          else
            v50 = 0;
          v45 = objc_msgSend(v167, "isEqual:", v50);
          if (!v13)
            goto LABEL_40;
        }
      }
      else
      {
        v24 = v162;
      }

      if (!v35)
        goto LABEL_71;
LABEL_41:

      if ((v45 & 1) == 0)
        goto LABEL_72;
      goto LABEL_42;
    }

    if (v35)
    {
      v46 = v168;
      v47 = v170;
      v15 = v38;
      v13 = v37;
      v24 = v162;
LABEL_77:

      WeakRetained = 0;
      goto LABEL_78;
    }
    WeakRetained = 0;
    v28 = a2;
    v15 = v38;
    v13 = v37;
    v24 = v162;
LABEL_79:

    if (++v29 == v26)
    {
      v68 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", v183, v187, 16);
      v26 = v68;
      if (!v68)
      {
        v23 = 0;
        goto LABEL_99;
      }
      goto LABEL_9;
    }
  }
  v48 = -[NEIKEv2Transport port]((void *)v30, v34);
  v49 = v21;
  v45 = v48 == a5;
  if (v49 && v48 == a5)
    goto LABEL_37;
LABEL_40:
  if (v35)
    goto LABEL_41;
LABEL_71:
  if (!v45)
  {
LABEL_72:
    WeakRetained = 0;
    v21 = v167;
LABEL_78:
    v28 = a2;
    goto LABEL_79;
  }
LABEL_42:
  v160 = v15;
  if (v30)
  {
    v156 = objc_getProperty((id)v30, v43, 16, 1);
    if (v156)
    {
      v155 = v13;
      v52 = objc_getProperty((id)v30, v51, 16, 1);
      objc_msgSend(objc_getProperty((id)v30, v53, 32, 1), "interfaceName");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v52;
      v46 = v54;
      objc_opt_self();
      ne_log_obj();
      v56 = objc_claimAutoreleasedReturnValue();
      v57 = v56;
      if (v55)
      {
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v55;
          v192 = 2112;
          v193 = v46;
          _os_log_impl(&dword_19BD16000, v57, OS_LOG_TYPE_INFO, "check address: address %@ interface %@", buf, 0x16u);
        }

        v58 = objc_msgSend(v55, "address");
        if (v58)
        {
          v59 = v58;
          *(_QWORD *)buf = 0;
          if (getifaddrs((ifaddrs **)buf))
          {
            v13 = v155;
          }
          else
          {
            v60 = *(_QWORD **)buf;
            if (*(_QWORD *)buf)
            {
              while (1)
              {
                if (!v46
                  || (v61 = (const char *)v60[1]) != 0
                  && !strncmp(v61, (const char *)objc_msgSend(objc_retainAutorelease(v46), "UTF8String"), 0x10uLL))
                {
                  if (v60[3] || (v62 = MEMORY[1], objc_msgSend(v55, "addressFamily") == v62))
                  {
                    if (objc_msgSend(v55, "addressFamily") == 2)
                    {
                      if (*(_DWORD *)(v60[3] + 4) == *(_DWORD *)(v59 + 4))
                        goto LABEL_96;
                    }
                    else if (objc_msgSend(v55, "addressFamily") == 30)
                    {
                      v63 = v60[3];
                      v65 = *(_QWORD *)(v63 + 8);
                      v64 = *(_QWORD *)(v63 + 16);
                      if (v65 == *(_QWORD *)(v59 + 8) && v64 == *(_QWORD *)(v59 + 16))
                      {
LABEL_96:
                        free(*(void **)buf);

                        v13 = v155;
                        v15 = v160;
                        v18 = 0;
                        goto LABEL_97;
                      }
                    }
                  }
                }
                v60 = (_QWORD *)*v60;
                if (!v60)
                {
                  v67 = *(void **)buf;
                  v13 = v155;
                  v15 = v160;
                  goto LABEL_74;
                }
              }
            }
            v67 = 0;
            v13 = v155;
LABEL_74:
            v18 = 0;
            free(v67);
          }
          v47 = v156;
          goto LABEL_76;
        }
        ne_log_obj();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "+[NEIKEv2Transport checkAddress:interface:]";
          _os_log_fault_impl(&dword_19BD16000, v57, OS_LOG_TYPE_FAULT, "%s called with null sa_compare", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "+[NEIKEv2Transport checkAddress:interface:]";
        _os_log_fault_impl(&dword_19BD16000, v57, OS_LOG_TYPE_FAULT, "%s called with null endpoint", buf, 0xCu);
      }
      v47 = v156;

      v13 = v155;
LABEL_76:

      v21 = v167;
      goto LABEL_77;
    }
  }
LABEL_97:
  v21 = v167;
LABEL_98:
  v23 = (id)v30;

LABEL_99:
  v16 = v157;
  v14 = v158;
LABEL_100:

  os_unfair_lock_unlock((os_unfair_lock_t)&g_transport_lock);
  v17 = v165;
  v22 = v177;
LABEL_101:

  if (v23)
  {
    ne_log_obj();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v187 = 138412290;
      *(_QWORD *)v188 = v23;
      _os_log_debug_impl(&dword_19BD16000, v70, OS_LOG_TYPE_DEBUG, "Found existing transport %@", v187, 0xCu);
    }

    v71 = (NEIKEv2Transport *)v23;
    goto LABEL_169;
  }
  v178 = v22;
  v72 = objc_alloc_init(NEIKEv2Transport);
  v20 = v72;
  if (!v72)
  {
LABEL_132:
    v98 = 0;
    goto LABEL_170;
  }
  v72->_transportType = a2;
  objc_setProperty_atomic(v72, v73, v175, 24);
  if (v21)
  {
    objc_setProperty_atomic(v20, v74, v21, 16);
    goto LABEL_113;
  }
  if (objc_msgSend(v175, "addressFamily") != 2)
  {
    if (objc_msgSend(v175, "addressFamily") == 30)
    {
      memset(v188, 0, 24);
      v76 = 7708;
      goto LABEL_112;
    }
    ne_log_obj();
    v97 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
    {
      v152 = objc_msgSend(v175, "addressFamily");
      *(_DWORD *)v187 = 67109120;
      *(_DWORD *)v188 = v152;
      _os_log_error_impl(&dword_19BD16000, v97, OS_LOG_TYPE_ERROR, "Invalid address family %u", v187, 8u);
    }

    goto LABEL_132;
  }
  *(_DWORD *)&v188[8] = 0;
  *(_QWORD *)v188 = 0;
  v76 = 528;
LABEL_112:
  *(_WORD *)v187 = v76;
  *(_WORD *)&v187[2] = __rev16(a5);
  objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithAddress:", v187);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setProperty_atomic(v20, v78, v77, 16);

LABEL_113:
  if (v178)
  {
    v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCEC88]), "initWithInterfaceName:", v178);
    objc_setProperty_atomic(v20, v80, v79, 32);

  }
  objc_setProperty_atomic(v20, v75, v16, 72);
  if (!v18)
  {
    v166 = v17;
    if (a2 <= 1)
    {
      secure_tcp = (nw_parameters_t)v175;
      v171 = v21;
      v81 = (void (**)(void))v17;
      IKESocket = -1;
      objc_msgSend(objc_getProperty(v20, v82, 32, 1), "interfaceName");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v180 = v81;
      v169 = v84;
      if (v81)
      {
        v176 = objc_msgSend(objc_getProperty(v20, v83, 16, 1), "address");
        v164 = objc_msgSend(objc_getProperty(v20, v85, 24, 1), "address");
        ((void (*)(void (**)(void), uint64_t, uint64_t, uint64_t, int *))v81[2])(v81, v176, v164, objc_msgSend(v84, "UTF8String"), &IKESocket);
      }
      else
      {
        objc_msgSend(objc_getProperty(v20, v83, 16, 1), "address");
        objc_msgSend(objc_getProperty(v20, v99, 24, 1), "address");
        objc_msgSend(v84, "UTF8String");
        getpid();
        IKESocket = NEHelperGetIKESocket();
      }
      v100 = -[NSObject addressFamily](secure_tcp, "addressFamily");
      v102 = IKESocket;
      if (v21)
      {
        v17 = v166;
      }
      else
      {
        v17 = v166;
        if (v100 == 2 && IKESocket < 0)
        {
          v185 = objc_msgSend(objc_getProperty(v20, v101, 32, 1), "interfaceIndex");
          *(_QWORD *)buf = 0;
          v103 = nw_nat64_copy_prefixes();
          if (v103 >= 1 && *(_QWORD *)buf)
          {
            v104 = v103;
            v159 = v14;
            v161 = v15;
            ne_log_obj();
            v105 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
            {
              if (v104 == 1)
                v153 = "";
              else
                v153 = "es";
              v154 = objc_getProperty(v20, v106, 32, 1);
              *(_DWORD *)v187 = 67109634;
              *(_DWORD *)v188 = v104;
              *(_WORD *)&v188[4] = 2080;
              *(_QWORD *)&v188[6] = v153;
              *(_WORD *)&v188[14] = 2112;
              *(_QWORD *)&v188[16] = v154;
              _os_log_debug_impl(&dword_19BD16000, v105, OS_LOG_TYPE_DEBUG, "IKEv2 found %u NAT64 prefix%s on interface %@", v187, 0x1Cu);
            }

            memset(v188, 0, 24);
            *(_WORD *)v187 = 7708;
            v108 = 0;
            *(_WORD *)&v187[2] = *(_WORD *)(objc_msgSend(objc_getProperty(v20, v107, 24, 1), "address") + 2);
            memset((char *)v183 + 4, 0, 24);
            LOWORD(v183[0]) = 7708;
            WORD1(v183[0]) = __rev16(a5);
            while (1)
            {
              objc_msgSend(objc_getProperty(v20, v109, 24, 1), "address");
              if ((nw_nat64_synthesize_v6() & 1) != 0)
              {
                v110 = v13;
                objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithAddress:", v187);
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                objc_setProperty_atomic(v20, v112, v111, 24);

                objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithAddress:", v183);
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                objc_setProperty_atomic(v20, v114, v113, 16);

                objc_msgSend(objc_getProperty(v20, v115, 32, 1), "interfaceName");
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(objc_getProperty(v20, v117, 16, 1), "address");
                objc_msgSend(objc_getProperty(v20, v118, 24, 1), "address");
                objc_msgSend(v116, "UTF8String");
                if (v180)
                {
                  v180[2]();
                  v119 = IKESocket;
                }
                else
                {
                  getpid();
                  v119 = NEHelperGetIKESocket();
                  IKESocket = v119;
                }

                v13 = v110;
                if ((v119 & 0x80000000) == 0)
                {
LABEL_154:
                  v14 = v159;
                  v15 = v161;
                  v17 = v166;
                  break;
                }
              }
              else
              {
                ne_log_obj();
                v120 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)v184 = 0;
                  _os_log_error_impl(&dword_19BD16000, v120, OS_LOG_TYPE_ERROR, "nw_nat64_synthesize_v6 failed", v184, 2u);
                }

              }
              if ((int)++v108 >= v104)
                goto LABEL_154;
            }
          }
          v102 = IKESocket;
        }
      }
      if (v102 < 0)
      {
        ne_log_obj();
        v148 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v187 = 0;
          _os_log_error_impl(&dword_19BD16000, v148, OS_LOG_TYPE_ERROR, "Failed to get IKE socket from NEHelper", v187, 2u);
        }

        v98 = 0;
      }
      else
      {
        v122 = v15;
        secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED20], (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED18]);
        v124 = nw_parameters_copy_default_protocol_stack(secure_udp);
        if (v20->_transportType == 1)
        {
          v125 = NEIKEv2TransportCopyNATTFramerDefinition();
          v126 = v14;
          options = nw_framer_create_options(v125);
          nw_protocol_stack_prepend_application_protocol(v124, options);

          v14 = v126;
        }
        nw_parameters_set_indefinite();
        if (objc_getProperty(v20, v128, 32, 1))
        {
          objc_msgSend(objc_getProperty(v20, v129, 32, 1), "interfaceName");
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v130, "UTF8String");
          v131 = v14;
          v132 = nw_interface_create_with_name();
          nw_parameters_require_interface(secure_udp, v132);

          v14 = v131;
        }
        v133 = (void *)nw_connection_create_with_connected_socket_and_parameters();
        objc_setProperty_atomic(v20, v134, v133, 56);

        if (objc_getProperty(v20, v135, 56, 1))
        {

          v15 = v122;
          v17 = v166;
          v18 = 0;
          goto LABEL_164;
        }
        v150 = v14;
        ne_log_obj();
        v151 = objc_claimAutoreleasedReturnValue();
        v17 = v166;
        if (os_log_type_enabled(v151, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v187 = 0;
          _os_log_fault_impl(&dword_19BD16000, v151, OS_LOG_TYPE_FAULT, "nw_connection_create_with_connected_socket failed", v187, 2u);
        }

        v98 = 0;
        v14 = v150;
        v15 = v122;
      }
      v18 = 0;
      goto LABEL_170;
    }
    if (a2 == 3)
      v86 = (void *)*MEMORY[0x1E0CCED18];
    else
      v86 = (void *)*MEMORY[0x1E0CCED20];
    secure_tcp = nw_parameters_create_secure_tcp(v86, (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED18]);
    v87 = nw_parameters_copy_default_protocol_stack(secure_tcp);
    v88 = NEIKEv2TransportCopyTCPFramerDefinition();
    v89 = nw_framer_create_options(v88);
    nw_protocol_stack_prepend_application_protocol(v87, v89);

    v171 = v87;
    v90 = nw_protocol_stack_copy_internet_protocol(v87);
    v91 = (void (**)(void))v90;
    if (v90)
      nw_ip_options_set_local_address_preference(v90, nw_ip_local_address_preference_stable);
    v180 = v91;
    nw_parameters_set_indefinite();
    if (v178)
    {
      objc_msgSend(v178, "UTF8String");
      v92 = nw_interface_create_with_name();
      nw_parameters_require_interface(secure_tcp, v92);

    }
    v93 = objc_msgSend(v175, "copyCEndpoint");
    v94 = nw_connection_create(v93, secure_tcp);
    objc_setProperty_atomic(v20, v95, v94, 56);

    if (!objc_getProperty(v20, v96, 56, 1))
    {
      ne_log_obj();
      v121 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v121, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v187 = 0;
        _os_log_fault_impl(&dword_19BD16000, v121, OS_LOG_TYPE_FAULT, "nw_connection_create failed", v187, 2u);
      }

      v98 = 0;
      v17 = v166;
      goto LABEL_170;
    }
    v17 = v166;
LABEL_164:

    v137 = objc_getProperty(v20, v136, 56, 1);
    nw_connection_set_queue(v137, v16);
    v139 = objc_getProperty(v20, v138, 56, 1);
    v181[0] = MEMORY[0x1E0C809B0];
    v181[1] = 3221225472;
    v181[2] = __110__NEIKEv2Transport_createTransport_remote_local_localPort_boundInterface_queue_socketGetBlock_packetDelegate___block_invoke;
    v181[3] = &unk_1E3CC1B00;
    v140 = v20;
    v182 = v140;
    MEMORY[0x1A1ACED54](v139, v181);
    v142 = objc_getProperty(v140, v141, 56, 1);
    nw_connection_start(v142);

    goto LABEL_165;
  }
  objc_msgSend(v179, "setPacketReceiver:", v20);
  objc_storeWeak((id *)&v20->_packetDelegate, v179);
  v20->_connected = 1;
LABEL_165:
  ne_log_obj();
  v143 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v143, OS_LOG_TYPE_DEBUG))
  {
    v149 = "";
    *(_DWORD *)v187 = 138412802;
    *(_QWORD *)v188 = v20;
    if (!v21)
      v149 = "out";
    *(_WORD *)&v188[8] = 2112;
    *(_QWORD *)&v188[10] = v178;
    *(_WORD *)&v188[18] = 2080;
    *(_QWORD *)&v188[20] = v149;
    _os_log_debug_impl(&dword_19BD16000, v143, OS_LOG_TYPE_DEBUG, "NEIKEv2Transport: Created %@ on interface %@ with%s local address", v187, 0x20u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&g_transport_lock);
  v144 = (void *)g_transports;
  if (!g_transports)
  {
    v145 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v146 = (void *)g_transports;
    g_transports = (uint64_t)v145;

    v144 = (void *)g_transports;
  }
  objc_msgSend(v144, "addObject:", v20);
  os_unfair_lock_unlock((os_unfair_lock_t)&g_transport_lock);
  v71 = v20;
LABEL_169:
  v20 = v71;
  v98 = v71;
LABEL_170:

  return v98;
}

void __110__NEIKEv2Transport_createTransport_remote_local_localPort_boundInterface_queue_socketGetBlock_packetDelegate___block_invoke(uint64_t a1, int a2, void *a3)
{
  -[NEIKEv2Transport handleConnectionEventWithState:error:](*(_BYTE **)(a1 + 32), a2, a3);
}

- (void)waitForTransport:(uint64_t)a1
{
  void (**v3)(_QWORD);
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *aBlock;

  v3 = a2;
  if (a1)
  {
    aBlock = v3;
    if ((*(_BYTE *)(a1 + 8) & 1) != 0)
    {
      v3[2](v3);
    }
    else
    {
      v4 = *(void **)(a1 + 64);
      if (!v4)
      {
        v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v6 = *(void **)(a1 + 64);
        *(_QWORD *)(a1 + 64) = v5;

        v4 = *(void **)(a1 + 64);
      }
      v7 = v4;
      v8 = _Block_copy(aBlock);
      objc_msgSend(v7, "addObject:", v8);

    }
    v3 = (void (**)(_QWORD))aBlock;
  }

}

- (uint64_t)sendData:(void *)a3 sendCompletionHandler:
{
  id v5;
  id v6;
  id WeakRetained;
  const char *v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  id *v14;
  const char *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  NSObject *Property;
  _QWORD v24[5];
  NSObject *v25;
  _QWORD v26[4];
  NSObject *v27;
  _QWORD block[4];
  id v29;
  char v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!a1)
    goto LABEL_20;
  if (!objc_msgSend(v5, "length"))
  {
    ne_log_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[NEIKEv2Transport sendData:sendCompletionHandler:]";
      _os_log_fault_impl(&dword_19BD16000, v10, OS_LOG_TYPE_FAULT, "%s called with null data.length", buf, 0xCu);
    }
    goto LABEL_19;
  }
  WeakRetained = objc_loadWeakRetained(a1 + 6);

  if (!WeakRetained)
  {
    if (objc_getProperty(a1, v8, 56, 1))
    {
      v12 = 1;
      v16 = objc_getProperty(a1, v15, 56, 1);
      v17 = objc_msgSend(v5, "_createDispatchData");
      v18 = *MEMORY[0x1E0CCECE8];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __51__NEIKEv2Transport_sendData_sendCompletionHandler___block_invoke_4;
      v24[3] = &unk_1E3CC1B28;
      v24[4] = a1;
      v25 = v6;
      nw_connection_send(v16, v17, v18, 1, v24);

      v10 = v25;
      goto LABEL_14;
    }
    if (v6)
    {
      Property = objc_getProperty(a1, v15, 72, 1);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __51__NEIKEv2Transport_sendData_sendCompletionHandler___block_invoke_3;
      v26[3] = &unk_1E3CC4720;
      v27 = v6;
      dispatch_async(Property, v26);
      v12 = 0;
      v10 = v27;
      goto LABEL_14;
    }
LABEL_20:
    v12 = 0;
    goto LABEL_15;
  }
  v9 = objc_loadWeakRetained(a1 + 6);
  v10 = v9;
  if (!v9)
  {
    ne_log_obj();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, v19, OS_LOG_TYPE_ERROR, "Packet delegate is no longer valid, cannot send", buf, 2u);
    }

    if (v6)
    {
      v21 = objc_getProperty(a1, v20, 72, 1);
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __51__NEIKEv2Transport_sendData_sendCompletionHandler___block_invoke;
      v31[3] = &unk_1E3CC4720;
      v14 = &v32;
      v32 = v6;
      dispatch_async(v21, v31);
      v12 = 0;
      goto LABEL_13;
    }
    v10 = 0;
LABEL_19:
    v12 = 0;
    goto LABEL_14;
  }
  v12 = -[NSObject sendPacketData:](v9, "sendPacketData:", v5);
  if (v6)
  {
    v13 = objc_getProperty(a1, v11, 72, 1);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__NEIKEv2Transport_sendData_sendCompletionHandler___block_invoke_2;
    block[3] = &unk_1E3CC3B30;
    v14 = &v29;
    v29 = v6;
    v30 = v12;
    dispatch_async(v13, block);
LABEL_13:

  }
LABEL_14:

LABEL_15:
  return v12;
}

uint64_t __51__NEIKEv2Transport_sendData_sendCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__NEIKEv2Transport_sendData_sendCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __51__NEIKEv2Transport_sendData_sendCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51__NEIKEv2Transport_sendData_sendCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, BOOL))(v4 + 16))(v4, v3 != 0);
  if (v3)
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412546;
      v8 = v3;
      v9 = 2112;
      v10 = v6;
      _os_log_error_impl(&dword_19BD16000, v5, OS_LOG_TYPE_ERROR, "Connection send error %@ for %@", (uint8_t *)&v7, 0x16u);
    }

    -[NEIKEv2Transport reportConnectionError:](*(void **)(a1 + 32), v3);
  }

}

@end
