@implementation MCMKernServerStart

void __MCMKernServerStart_block_invoke(uint64_t a1)
{
  kern_return_t v2;
  mach_error_t v3;
  NSObject *v4;
  char *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  mach_port_t sp;
  uint8_t buf[4];
  char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  sp = 0;
  v2 = bootstrap_check_in(*MEMORY[0x1E0C81720], "com.apple.containermanagerd.upcall", &sp);
  if (v2)
  {
    v3 = v2;
    container_log_handle_for_category();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = mach_error_string(v3);
      *(_DWORD *)buf = 136315138;
      v14 = v5;
      _os_log_error_impl(&dword_1CF807000, v4, OS_LOG_TYPE_ERROR, "bootstrap_check_in: %s", buf, 0xCu);
    }
  }
  else
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v6 = *(NSObject **)(a1 + 32);
    if (v6)
      v7 = dispatch_queue_create_with_target_V2("com.apple.containermanagerd.upcall", v4, v6);
    else
      v7 = dispatch_queue_create("com.apple.containermanagerd.upcall", v4);
    v8 = (void *)MCMKernServerStart_upcallQueue;
    MCMKernServerStart_upcallQueue = (uint64_t)v7;

    v9 = dispatch_mach_create();
    v10 = (void *)MCMKernServerStart_channel;
    MCMKernServerStart_channel = v9;

    container_log_handle_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CF807000, v11, OS_LOG_TYPE_DEFAULT, "Starting kernel upcall mach channel", buf, 2u);
    }

    dispatch_mach_connect();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

void __MCMKernServerStart_block_invoke_25(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  mach_msg_header_t *msg;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  mach_msg_id_t msgh_id;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  switch(a2)
  {
    case 1:
      container_log_handle_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1CF807000, v5, OS_LOG_TYPE_DEFAULT, "Mach channel connected", (uint8_t *)&v11, 2u);
      }
      goto LABEL_14;
    case 2:
      if ((dispatch_mach_mig_demux() & 1) == 0)
      {
        msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
        container_log_handle_for_category();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        {
          msgh_id = msg->msgh_id;
          v11 = 67109120;
          LODWORD(v12) = msgh_id;
          _os_log_fault_impl(&dword_1CF807000, v7, OS_LOG_TYPE_FAULT, "Got mach message we didn't understand; msgh_id = %d",
            (uint8_t *)&v11,
            8u);
        }

        mach_msg_destroy(msg);
      }
      goto LABEL_15;
    case 7:
      container_log_handle_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      LOWORD(v11) = 0;
      v9 = "Mach channel disconnected, this is probably very bad";
      break;
    case 8:
      container_log_handle_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      LOWORD(v11) = 0;
      v9 = "Mach channel canceled, this is probably very bad";
      break;
    default:
      container_log_handle_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v11 = 134217984;
        v12 = a2;
        _os_log_error_impl(&dword_1CF807000, v8, OS_LOG_TYPE_ERROR, "Unhandled message type; reason = %lu",
          (uint8_t *)&v11,
          0xCu);
      }

      goto LABEL_15;
  }
  _os_log_error_impl(&dword_1CF807000, v5, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v11, 2u);
LABEL_14:

LABEL_15:
}

@end
