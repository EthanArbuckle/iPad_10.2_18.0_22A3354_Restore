@implementation NEFilterPacketInterpose

- (void)dealloc
{
  NSObject *v3;
  NEFilterPacketContext *context;
  objc_super v5;
  uint8_t buf[4];
  NEFilterPacketInterpose *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_debug_impl(&dword_19BD16000, v3, OS_LOG_TYPE_DEBUG, "%@: dealloc", buf, 0xCu);
  }

  -[NEFilterPacketInterpose close:]((os_unfair_lock_s *)self, 0);
  context = self->_context;
  self->_context = 0;

  v5.receiver = self;
  v5.super_class = (Class)NEFilterPacketInterpose;
  -[NEFilterPacketInterpose dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  const char *name;
  SEL v5;
  NSObject *interface;
  __CFString *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (self->_channel)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    name = nw_interface_get_name((nw_interface_t)self->_interface);
    objc_msgSend(v3, "stringWithFormat:", CFSTR("NEFilterPacketInterpose: %s - [%@:%d - fd %d]"), name, objc_getProperty(self, v5, 176, 1), self->_nexusPort, self->_channel_fd);
  }
  else
  {
    interface = self->_interface;
    if (!interface)
    {
      v7 = CFSTR("NEFilterPacketInterpose");
      return v7;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NEFilterPacketInterpose: %s"), nw_interface_get_name(interface), v9, v10, v11);
  }
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nexusInstance, 0);
  objc_storeStrong((id *)&self->_flowId, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

- (void)close:(os_unfair_lock_s *)a1
{
  os_unfair_lock_s *v4;

  if (a1)
  {
    v4 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    -[NEFilterPacketInterpose close_nolock:]((uint64_t)a1, a2);
    os_unfair_lock_unlock(v4);
  }
}

- (void)close_nolock:(uint64_t)a1
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  SEL v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412546;
    v11 = a1;
    v12 = 1024;
    v13 = a2;
    _os_log_debug_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEBUG, "%@: close: StopInputOnly %d", (uint8_t *)&v10, 0x12u);
  }

  if ((*(_BYTE *)(a1 + 152) & 1) != 0)
  {
    *(_BYTE *)(a1 + 153) = 1;
  }
  else
  {
    *(_BYTE *)(a1 + 153) = 0;
    if (*(_QWORD *)(a1 + 192))
    {
      ne_log_obj();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v10 = 138412290;
        v11 = a1;
        _os_log_debug_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEBUG, "%@: close channel: cancel input", (uint8_t *)&v10, 0xCu);
      }

      nw_queue_cancel_source();
      *(_QWORD *)(a1 + 192) = 0;
      *(_BYTE *)(a1 + 152) = 0;
    }
    if ((a2 & 1) == 0 && *(_QWORD *)(a1 + 16))
    {
      ne_log_obj();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v10 = 138412290;
        v11 = a1;
        _os_log_debug_impl(&dword_19BD16000, v6, OS_LOG_TYPE_DEBUG, "%@: close channel: cancel channel", (uint8_t *)&v10, 0xCu);
      }

      os_channel_destroy();
      *(_QWORD *)(a1 + 16) = 0;
      *(_DWORD *)(a1 + 32) = -1;
      objc_setProperty_atomic((id)a1, v7, 0, 176);
      *(_QWORD *)(a1 + 184) = 0;
      *(_DWORD *)(a1 + 156) = 0;
      *(_DWORD *)(a1 + 160) = 0;
      *(_OWORD *)(a1 + 96) = 0u;
      *(_OWORD *)(a1 + 112) = 0u;
      if (*(_QWORD *)(a1 + 24))
      {
        os_channel_attr_destroy();
        *(_QWORD *)(a1 + 24) = 0;
      }
      *(_QWORD *)(a1 + 88) = 0;
      v8 = *(void **)(a1 + 128);
      *(_QWORD *)(a1 + 128) = 0;

      v9 = *(void **)(a1 + 136);
      *(_QWORD *)(a1 + 136) = 0;

    }
  }
}

- (void)close
{
  os_unfair_lock_s *v2;

  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    -[NEFilterPacketInterpose close_nolock:]((uint64_t)a1, 1);
    os_unfair_lock_unlock(v2);
  }
}

- (BOOL)matchFlow:(const unsigned __int8 *)a3 flowId:
{
  SEL v6;
  unsigned __int8 v8[8];
  uint64_t v9;
  unsigned __int8 uu1[8];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)uu1 = 0;
  v11 = 0;
  *(_QWORD *)v8 = 0;
  v9 = 0;
  objc_msgSend(objc_getProperty(a1, a2, 176, 1), "getUUIDBytes:", uu1);
  objc_msgSend(objc_getProperty(a1, v6, 168, 1), "getUUIDBytes:", v8);
  return !uuid_compare(uu1, (const unsigned __int8 *)a2) && uuid_compare(v8, a3) == 0;
}

void __40__NEFilterPacketInterpose_createChannel__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BYTE *v3;
  char *v4;
  os_unfair_lock_s *v5;
  int v6;
  int v7;
  char v8;
  char v9;
  uint64_t v10;
  int v11;
  int v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t next_slot;
  uint64_t v19;
  uint64_t packet;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  int v25;
  uint64_t next_buflet;
  uint64_t v27;
  uint64_t object_address;
  uint64_t v29;
  uint64_t data_length;
  NSObject *v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  uint64_t (**v40)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v41;
  const char *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  const char *v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  unsigned int data_offset;
  os_unfair_lock_s *lock;
  const char *v59;
  char v60;
  uint8_t buf[4];
  char *v62;
  __int16 v63;
  _BYTE v64[18];
  uint8_t v65[32];
  __int128 v66;
  __int128 v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v51 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)v65 = 138412290;
    *(_QWORD *)&v65[4] = v51;
    _os_log_debug_impl(&dword_19BD16000, v2, OS_LOG_TYPE_DEBUG, "%@: INPUT SOURCE: READ EVENT", v65, 0xCu);
  }

  v3 = *(_BYTE **)(a1 + 32);
  if (!v3)
  {
LABEL_6:
    nw_queue_suspend_source();
    v4 = (char *)*(id *)(a1 + 32);
    if (!v4)
      goto LABEL_100;
    goto LABEL_9;
  }
  if ((v3[152] & 1) == 0)
  {
    v3[152] = 1;
    goto LABEL_6;
  }
  v4 = v3;
LABEL_9:
  v52 = a1;
  v5 = (os_unfair_lock_s *)(v4 + 8);
  os_unfair_lock_lock((os_unfair_lock_t)v4 + 2);
  v6 = 0;
  v7 = 0;
  v8 = 1;
  lock = (os_unfair_lock_s *)(v4 + 8);
  do
  {
    v9 = v8;
    if ((v8 & 1) != 0)
      v10 = 96;
    else
      v10 = 112;
    if (*(_QWORD *)&v4[v10])
    {
      v60 = v8;
      v11 = os_channel_available_slot_count();
      if (v11)
      {
        v12 = v11;
        v56 = v7;
        ne_log_obj();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v65 = 138412802;
          v47 = "INGRESS";
          if ((v60 & 1) == 0)
            v47 = "EGRESS";
          *(_QWORD *)&v65[4] = v4;
          *(_WORD *)&v65[12] = 2080;
          v59 = v47;
          *(_QWORD *)&v65[14] = v47;
          *(_WORD *)&v65[22] = 1024;
          *(_DWORD *)&v65[24] = v12;
          v9 = v60;
          _os_log_debug_impl(&dword_19BD16000, v13, OS_LOG_TYPE_DEBUG, "%@: receiveFramesfromRings: %s: avail slots %d", v65, 0x1Cu);
        }
        else
        {
          v9 = v60;
          v14 = "EGRESS";
          if ((v60 & 1) != 0)
            v14 = "INGRESS";
          v59 = v14;
        }

        if ((v9 & 1) != 0)
          v15 = 1;
        else
          v15 = 2;
        v16 = 120;
        if ((v9 & 1) != 0)
          v16 = 104;
        v54 = v16;
        v55 = v15;
        while (1)
        {
          v17 = v4;
          v66 = 0u;
          v67 = 0u;
          memset(v65, 0, sizeof(v65));
          if (!*(_QWORD *)&v4[v10])
          {
            ne_log_obj();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v62 = v4;
              v63 = 2080;
              *(_QWORD *)v64 = v59;
              *(_WORD *)&v64[8] = 2112;
              *(_QWORD *)&v64[10] = CFSTR("Bad rx ring");
              v24 = v23;
              goto LABEL_42;
            }
            goto LABEL_43;
          }
          next_slot = os_channel_get_next_slot();
          if (!next_slot)
          {
            ne_log_obj();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v62 = v4;
              v63 = 2080;
              *(_QWORD *)v64 = v59;
              *(_WORD *)&v64[8] = 2112;
              *(_QWORD *)&v64[10] = CFSTR("NULL next slot");
              v24 = v23;
              goto LABEL_42;
            }
            goto LABEL_43;
          }
          if (!*(_QWORD *)&v65[16])
          {
            ne_log_obj();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v62 = v4;
              v63 = 2080;
              *(_QWORD *)v64 = v59;
              *(_WORD *)&v64[8] = 2112;
              *(_QWORD *)&v64[10] = CFSTR("NULL prop buf");
              v24 = v23;
              goto LABEL_42;
            }
LABEL_43:

            if (!*((_QWORD *)v4 + 2))
              goto LABEL_46;
            goto LABEL_44;
          }
          v19 = next_slot;
          *((_QWORD *)v4 + 5) = next_slot;
          packet = os_channel_slot_get_packet();
          if (!packet)
          {
            ne_log_obj();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v62 = v4;
              v63 = 2080;
              *(_QWORD *)v64 = v59;
              *(_WORD *)&v64[8] = 2112;
              *(_QWORD *)&v64[10] = CFSTR("Bad ptr");
              v24 = v23;
LABEL_42:
              _os_log_error_impl(&dword_19BD16000, v24, OS_LOG_TYPE_ERROR, "%@: %s - %@", buf, 0x20u);
            }
            goto LABEL_43;
          }
          v21 = packet;
          if (!os_channel_slot_detach_packet())
            break;
          ne_log_obj();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v62 = v4;
            v63 = 2080;
            *(_QWORD *)v64 = v59;
            *(_WORD *)&v64[8] = 2112;
            *(_QWORD *)&v64[10] = CFSTR("Bad detach");
            _os_log_error_impl(&dword_19BD16000, v22, OS_LOG_TYPE_ERROR, "%@: %s - %@", buf, 0x20u);
          }

          if (!*((_QWORD *)v4 + 2))
            goto LABEL_46;
LABEL_63:
          os_channel_packet_free();
LABEL_44:
          if (os_channel_is_defunct())
            goto LABEL_45;
LABEL_46:
          v25 = 0;
LABEL_47:

          v6 += v25;
          if (!os_channel_available_slot_count())
            goto LABEL_89;
        }
        next_buflet = os_packet_get_next_buflet();
        if (next_buflet)
        {
          v27 = next_buflet;
          data_offset = os_buflet_get_data_offset();
          object_address = os_buflet_get_object_address();
          if (object_address)
          {
            v29 = object_address;
            data_length = (unsigned __int16)os_packet_get_data_length();
            ne_log_obj();
            v31 = objc_claimAutoreleasedReturnValue();
            v53 = data_length;
            if (!(_DWORD)data_length)
            {
              v37 = v31;
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                v62 = v4;
                v63 = 2080;
                *(_QWORD *)v64 = v59;
                *(_WORD *)&v64[8] = 2112;
                *(_QWORD *)&v64[10] = CFSTR("Bad frame length");
                _os_log_error_impl(&dword_19BD16000, v37, OS_LOG_TYPE_ERROR, "%@: %s - %@", buf, 0x20u);
              }

              v5 = (os_unfair_lock_s *)(v4 + 8);
              if (!*((_QWORD *)v4 + 2))
              {
LABEL_80:
                v25 = 0;
                v9 = v60;
                goto LABEL_47;
              }
              os_channel_packet_free();
              v9 = v60;
              if (!os_channel_is_defunct())
                goto LABEL_46;
LABEL_45:
              os_unfair_lock_lock(v5);
              -[NEFilterPacketInterpose close_nolock:]((uint64_t)v17, 1);
              os_unfair_lock_unlock(v5);
              goto LABEL_46;
            }
            v32 = v31;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              v62 = v4;
              v63 = 1024;
              *(_DWORD *)v64 = v53;
              *(_WORD *)&v64[4] = 2080;
              *(_QWORD *)&v64[6] = v59;
              _os_log_debug_impl(&dword_19BD16000, v32, OS_LOG_TYPE_DEBUG, "%@: receiveDatafromRing: read %u bytes on %s rx ring", buf, 0x1Cu);
            }

            *((_QWORD *)v4 + 5) = v19;
            if (!os_channel_advance_slot())
            {
              v38 = v29 + data_offset;
              v4[48] = v56;
              *((_QWORD *)v4 + 7) = v38;
              *((_DWORD *)v4 + 16) = v53;
              *((_QWORD *)v4 + 9) = v21;
              *((_QWORD *)v4 + 10) = v27;
              *((_QWORD *)v4 + 11) = v4 + 48;
              v39 = (void *)*((_QWORD *)v4 + 18);
              if (v39)
                objc_setProperty_atomic(v39, v33, v17, 8);
              os_unfair_lock_unlock(lock);
              objc_msgSend(*((id *)v4 + 16), "packetHandler");
              v40 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              v41 = v40[2](v40, *((_QWORD *)v4 + 18), *((_QWORD *)v4 + 17), v55, v38, v53);

              v5 = (os_unfair_lock_s *)(v4 + 8);
              os_unfair_lock_lock(lock);
              v43 = (void *)*((_QWORD *)v4 + 18);
              if (v43)
                objc_setProperty_atomic(v43, v42, 0, 8);
              if (!*((_QWORD *)v4 + 2))
                goto LABEL_80;
              ne_log_obj();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v62 = v4;
                v63 = 2048;
                *(_QWORD *)v64 = v41;
                _os_log_debug_impl(&dword_19BD16000, v44, OS_LOG_TYPE_DEBUG, "%@: receiveDatafromRing: verdict %ld", buf, 0x16u);
              }

              if (v41 != 2)
              {
                v9 = v60;
                if (!v41)
                {
                  v45 = *(_QWORD *)&v4[v54];
                  if (v45)
                  {
                    sendDataOnRing(v17, v45, v56);
                    v25 = 1;
                    goto LABEL_47;
                  }
                }
                goto LABEL_85;
              }
              v9 = v60;
              if (*((_QWORD *)v4 + 11))
              {
                ne_log_obj();
                v46 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v62 = v4;
                  _os_log_error_impl(&dword_19BD16000, v46, OS_LOG_TYPE_ERROR, "%@: receiveDatafromRing: returned Delay verdict but packet hasn't been delayed", buf, 0xCu);
                }

                *((_QWORD *)v4 + 11) = 0;
LABEL_85:
                if (*((_QWORD *)v4 + 2))
                  os_channel_packet_free();
                goto LABEL_46;
              }
              goto LABEL_46;
            }
            ne_log_obj();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v62 = v4;
              v63 = 2080;
              *(_QWORD *)v64 = v59;
              *(_WORD *)&v64[8] = 2112;
              *(_QWORD *)&v64[10] = CFSTR("Failed to advance slot");
              _os_log_error_impl(&dword_19BD16000, v34, OS_LOG_TYPE_ERROR, "%@: %s - %@", buf, 0x20u);
            }

            v5 = (os_unfair_lock_s *)(v4 + 8);
            v9 = v60;
            if (!*((_QWORD *)v4 + 2))
              goto LABEL_46;
            goto LABEL_63;
          }
          ne_log_obj();
          v35 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            goto LABEL_62;
          *(_DWORD *)buf = 138412802;
          v62 = v4;
          v63 = 2080;
          *(_QWORD *)v64 = v59;
          *(_WORD *)&v64[8] = 2112;
          *(_QWORD *)&v64[10] = CFSTR("Bad address");
          v36 = v35;
        }
        else
        {
          ne_log_obj();
          v35 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            goto LABEL_62;
          *(_DWORD *)buf = 138412802;
          v62 = v4;
          v63 = 2080;
          *(_QWORD *)v64 = v59;
          *(_WORD *)&v64[8] = 2112;
          *(_QWORD *)&v64[10] = CFSTR("Bad buflet");
          v36 = v35;
        }
        _os_log_error_impl(&dword_19BD16000, v36, OS_LOG_TYPE_ERROR, "%@: %s - %@", buf, 0x20u);
LABEL_62:

        v5 = (os_unfair_lock_s *)(v4 + 8);
        if (!*((_QWORD *)v4 + 2))
          goto LABEL_46;
        goto LABEL_63;
      }
    }
LABEL_89:
    v8 = 0;
    v7 = 1;
  }
  while ((v9 & 1) != 0);
  if (v6 && os_channel_sync())
  {
    ne_log_obj();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v65 = 138412290;
      *(_QWORD *)&v65[4] = v4;
      _os_log_error_impl(&dword_19BD16000, v48, OS_LOG_TYPE_ERROR, "%@: receiveFramesfromRings: failed to sync channel TX", v65, 0xCu);
    }

  }
  os_unfair_lock_unlock(v5);

  a1 = v52;
LABEL_100:
  v49 = *(_QWORD *)(a1 + 32);
  if (v49 && (*(_BYTE *)(v49 + 152) & 1) != 0)
  {
    *(_BYTE *)(v49 + 152) = 0;
    nw_queue_resume_source();
    v49 = *(_QWORD *)(a1 + 32);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v49 + 8));
  v50 = *(_QWORD *)(a1 + 32);
  if (v50 && *(_BYTE *)(v50 + 153))
  {
    -[NEFilterPacketInterpose close_nolock:](v50, 1);
    v50 = *(_QWORD *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v50 + 8));
}

- (void)freePacket:(os_unfair_lock_s *)a1
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  int v8;
  os_unfair_lock_s *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (v3)
    {
      v5 = v3[5];
      if (v5)
      {
        os_unfair_lock_lock(a1 + 2);
        ne_log_obj();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          v7 = *(_DWORD *)(v5 + 16);
          v8 = 138412546;
          v9 = a1;
          v10 = 1024;
          v11 = v7;
          _os_log_debug_impl(&dword_19BD16000, v6, OS_LOG_TYPE_DEBUG, "%@: freePacket: %d bytes", (uint8_t *)&v8, 0x12u);
        }

        -[NEFilterPacketInterpose deallocateFrame:]((uint64_t)a1, (_QWORD *)v5);
        v4[5] = 0;
        os_unfair_lock_unlock(a1 + 2);
      }
    }
  }

}

- (void)deallocateFrame:(uint64_t)a1
{
  if (*(_QWORD *)(a1 + 16) && ptr[3])
    os_channel_packet_free();
  ptr[1] = 0;
  ptr[3] = 0;
  ptr[4] = 0;
  CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], ptr);
}

@end
