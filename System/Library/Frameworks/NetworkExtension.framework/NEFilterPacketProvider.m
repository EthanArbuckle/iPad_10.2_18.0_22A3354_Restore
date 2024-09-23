@implementation NEFilterPacketProvider

- (NEPacket)delayCurrentPacket:(NEFilterPacketContext *)context
{
  NEFilterPacketContext *v3;
  const char *v4;
  NEFilterPacketContext *v5;
  const char *v6;
  os_unfair_lock_s *Property;
  os_unfair_lock_s *v8;
  os_unfair_lock_s *v9;
  __int128 *v10;
  _BYTE *v11;
  _BYTE *v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  NEPacket *v16;
  uint64_t v17;
  id v18;
  os_unfair_lock_s *v19;
  NEFilterPacketProvider *v20;
  NSObject *v21;
  NEPacket *v22;
  NSObject *v23;
  const char *v24;
  objc_super v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = context;
  v5 = v3;
  if (!v3)
    goto LABEL_21;
  if (!objc_getProperty(v3, v4, 8, 1))
    goto LABEL_21;
  Property = (os_unfair_lock_s *)objc_getProperty(v5, v6, 8, 1);
  if (!Property)
    goto LABEL_21;
  v8 = Property;
  v9 = Property + 2;
  os_unfair_lock_lock(Property + 2);
  if (!*(_QWORD *)&v8[4]._os_unfair_lock_opaque)
  {
    ne_log_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
LABEL_20:

      os_unfair_lock_unlock(v9);
LABEL_21:
      v22 = 0;
      goto LABEL_22;
    }
    LODWORD(v26.receiver) = 138412290;
    *(id *)((char *)&v26.receiver + 4) = v8;
    v24 = "%@: delayCurrentPacket: no channel / input_queue";
LABEL_24:
    _os_log_error_impl(&dword_19BD16000, v23, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v26, 0xCu);
    goto LABEL_20;
  }
  v10 = *(__int128 **)&v8[22]._os_unfair_lock_opaque;
  if (!v10)
  {
    ne_log_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    LODWORD(v26.receiver) = 138412290;
    *(id *)((char *)&v26.receiver + 4) = v8;
    v24 = "%@: delayCurrentPacket: no current frame";
    goto LABEL_24;
  }
  v11 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 40, 0);
  v12 = v11;
  if (v11)
  {
    v13 = *v10;
    v14 = v10[1];
    *((_QWORD *)v11 + 4) = *((_QWORD *)v10 + 4);
    *(_OWORD *)v11 = v13;
    *((_OWORD *)v11 + 1) = v14;
  }
  *(_QWORD *)&v8[22]._os_unfair_lock_opaque = 0;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", *((_QWORD *)v11 + 1), *((unsigned int *)v11 + 4), 0);
  v16 = [NEPacket alloc];
  if (*v12)
    v17 = 2;
  else
    v17 = 1;
  v18 = v15;
  v19 = v8;
  if (v16)
  {
    v26.receiver = v16;
    v26.super_class = (Class)NEPacket;
    v20 = -[NEProvider init](&v26, sel_init);
    v16 = (NEPacket *)v20;
    if (v20)
    {
      objc_storeStrong((id *)&v20->super.super._defaultPathEvaluator, v15);
      v16->_direction = v17;
      v16->_context = v12;
      objc_storeStrong((id *)&v16->_interpose, v8);
    }
  }

  ne_log_obj();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v26.receiver) = 138412290;
    *(id *)((char *)&v26.receiver + 4) = v19;
    _os_log_debug_impl(&dword_19BD16000, v21, OS_LOG_TYPE_DEBUG, "%@: delayCurrentPacket: retained packet", (uint8_t *)&v26, 0xCu);
  }

  os_unfair_lock_unlock(v9);
  v22 = v16;

LABEL_22:
  return v22;
}

- (void)allowPacket:(NEPacket *)packet
{
  NEPacket *v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  NEPacket *v8;
  NEPacket *v9;
  unsigned __int8 *context;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  NEPacket *selfa;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = packet;
  if (v3)
  {
    selfa = v3;
    objc_getProperty(v3, v4, 48, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = selfa;
    if (v5)
    {
      objc_getProperty(selfa, v6, 48, 1);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = selfa;
      v9 = v8;
      if (v7)
      {
        context = (unsigned __int8 *)v8->_context;
        if (context)
        {
          os_unfair_lock_lock((os_unfair_lock_t)(v7 + 8));
          v11 = *(_QWORD *)(v7 + 16);
          ne_log_obj();
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v11)
          {
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              v19 = *((_DWORD *)context + 4);
              *(_DWORD *)buf = 138412546;
              v22 = v7;
              v23 = 1024;
              v24 = v19;
              _os_log_debug_impl(&dword_19BD16000, v13, OS_LOG_TYPE_DEBUG, "%@: allowPacket: %d bytes", buf, 0x12u);
            }

            v14 = (char *)(id)v7;
            v15 = v14;
            v16 = 120;
            if (!*context)
              v16 = 104;
            if (*((_QWORD *)context + 3))
            {
              v17 = *(_QWORD *)&v14[v16];
              if (v17)
              {
                sendDataOnRing(v14, v17, *context);
                if (os_channel_sync())
                {
                  ne_log_obj();
                  v18 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v22 = (uint64_t)v15;
                    _os_log_error_impl(&dword_19BD16000, v18, OS_LOG_TYPE_ERROR, "%@: allowPacket: failed to sync channel TX", buf, 0xCu);
                  }

                }
                *((_QWORD *)context + 3) = 0;
              }
            }
            -[NEFilterPacketInterpose deallocateFrame:]((uint64_t)v15, context);
            v9->_context = 0;
            os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 8));

          }
          else
          {
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v22 = v7;
              _os_log_error_impl(&dword_19BD16000, v13, OS_LOG_TYPE_ERROR, "%@: allowPacket: no channel", buf, 0xCu);
            }

            -[NEFilterPacketInterpose freePacket:]((os_unfair_lock_s *)v7, v9);
            os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 8));
          }
        }
      }

      v3 = selfa;
    }
  }

}

- (NEFilterPacketHandler)packetHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setPacketHandler:(NEFilterPacketHandler)packetHandler
{
  objc_setProperty_atomic_copy(self, a2, packetHandler, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_packetHandler, 0);
}

@end
