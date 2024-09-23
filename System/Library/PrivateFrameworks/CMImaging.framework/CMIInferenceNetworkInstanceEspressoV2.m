@implementation CMIInferenceNetworkInstanceEspressoV2

- (CMIInferenceNetworkInstanceEspressoV2)init
{
  CMIInferenceNetworkInstanceEspressoV2 *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMIInferenceNetworkInstanceEspressoV2;
  result = -[CMIInferenceNetworkInstanceEspressoV2 init](&v3, sel_init);
  if (result)
  {
    result->_esop = 0;
    result->_eventValue = 0;
  }
  return result;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  os_log_type_t type;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_esop && e5rt_execution_stream_operation_release()
    || self->_preEvent && e5rt_async_event_release())
  {
    v6 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v3 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
  else if (self->_postEvent)
  {
    e5rt_async_event_release();
  }
  v4.receiver = self;
  v4.super_class = (Class)CMIInferenceNetworkInstanceEspressoV2;
  -[CMIInferenceNetworkInstanceEspressoV2 dealloc](&v4, sel_dealloc);
}

- (int)_allocateTexturesWithDevice:(id)a3 ports:(id)a4 useTextureArrays:(BOOL)a5 outputTextureArray:(id)a6
{
  _BOOL4 v7;
  id v10;
  void *v11;
  e5rt_execution_stream_operation *esop;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  id obj;
  id v25;
  id v26;
  _OWORD v27[4];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v7 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v10 = a4;
  v25 = a6;
  v30 = 0;
  v31 = 0;
  v28 = 0;
  v29 = 0;
  memset(v27, 0, sizeof(v27));
  obj = v10;
  if (objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", v27, v32, 16))
  {
    v11 = (void *)**((_QWORD **)&v27[0] + 1);
    esop = self->_esop;
    objc_msgSend(**((id **)&v27[0] + 1), "name");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LODWORD(esop) = getIOPort(&v31, (uint64_t)esop, objc_msgSend(v13, "UTF8String"), objc_msgSend(v11, "isInput"));

    if (!(_DWORD)esop)
    {
      if (!e5rt_io_port_retain_tensor_desc()
        && !e5rt_tensor_desc_alloc_buffer_object()
        && !e5rt_buffer_object_get_iosurface()
        && v28)
      {
        v14 = (void *)objc_msgSend(v26, "newBufferWithIOSurface:");
        v15 = (void *)MEMORY[0x1E0CC6BB0];
        v16 = objc_msgSend(v11, "width");
        v17 = objc_msgSend(v11, "height");
        if (v7)
        {
          objc_msgSend(v15, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, v16, v17, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setTextureType:", 3);
          objc_msgSend(v18, "setArrayLength:", objc_msgSend(v11, "depth"));
          objc_msgSend(v18, "setUsage:", 3);
          if (!e5rt_tensor_desc_get_strides())
          {
LABEL_9:
            fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v21 = objc_claimAutoreleasedReturnValue();
            os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();

            v22 = 0;
LABEL_16:

            goto LABEL_17;
          }
        }
        else
        {
          objc_msgSend(v15, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, v16, objc_msgSend(v11, "depth") * v17, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setUsage:", 3);
          if (!e5rt_tensor_desc_get_strides())
            goto LABEL_9;
        }
        fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v20 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        v22 = -1;
        goto LABEL_16;
      }
      fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v19 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

    }
    v22 = -1;
  }
  else
  {
    v22 = 0;
  }
LABEL_17:

  return v22;
}

- (int)_createEventsWithDevice:(id)a3
{
  MTLSharedEventSPI *v4;
  MTLSharedEventSPI *sharedEvent;
  void *v6;
  int v7;
  void *v8;
  int v9;
  int result;
  NSObject *v11;

  v4 = (MTLSharedEventSPI *)objc_msgSend(a3, "newSharedEvent");
  sharedEvent = self->_sharedEvent;
  self->_sharedEvent = v4;

  -[MTLSharedEventSPI setSignaledValue:](self->_sharedEvent, "setSignaledValue:", 0);
  self->_eventValue = 0;
  -[MTLSharedEventSPI IOSurfaceSharedEvent](self->_sharedEvent, "IOSurfaceSharedEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = e5rt_async_event_create_from_iosurface_shared_event();

  if (v7
    || (-[MTLSharedEventSPI IOSurfaceSharedEvent](self->_sharedEvent, "IOSurfaceSharedEvent"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = e5rt_async_event_create_from_iosurface_shared_event(),
        v8,
        v9)
    || e5rt_execution_stream_operation_bind_dependent_events()
    || (result = e5rt_execution_stream_operation_bind_completion_event()) != 0)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v11 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    return -1;
  }
  else
  {
    self->_preEvent = 0;
    self->_postEvent = 0;
  }
  return result;
}

- (int)synchronizeNetworkWaitOnMetalSignal:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v8;

  v4 = a3;
  v5 = v4;
  if (!v4
    || objc_msgSend(v4, "status")
    || (++self->_eventValue,
        objc_msgSend(v5, "encodeSignalEvent:value:", self->_sharedEvent),
        e5rt_async_event_set_active_future_value()))
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v8 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v6 = -1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int)synchronizeMetalWaitOnNetworkSignal:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v8;

  v4 = a3;
  v5 = v4;
  if (!v4
    || objc_msgSend(v4, "status")
    || (++self->_eventValue, e5rt_async_event_set_active_future_value()))
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v8 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v6 = -1;
  }
  else
  {
    objc_msgSend(v5, "encodeWaitForEvent:value:", self->_sharedEvent, self->_eventValue);
    v6 = 0;
  }

  return v6;
}

- (CMIInferenceNetworkEspressoV2)parentNetwork
{
  return (CMIInferenceNetworkEspressoV2 *)objc_loadWeakRetained((id *)&self->_parentNetwork);
}

- (void)setParentNetwork:(id)a3
{
  objc_storeWeak((id *)&self->_parentNetwork, a3);
}

- (NSArray)inputTextures
{
  return self->_inputTextures;
}

- (void)setInputTextures:(id)a3
{
  objc_storeStrong((id *)&self->_inputTextures, a3);
}

- (NSArray)outputTextures
{
  return self->_outputTextures;
}

- (void)setOutputTextures:(id)a3
{
  objc_storeStrong((id *)&self->_outputTextures, a3);
}

- (e5rt_execution_stream_operation)esop
{
  return self->_esop;
}

- (void)setEsop:(e5rt_execution_stream_operation *)a3
{
  self->_esop = a3;
}

- (MTLSharedEventSPI)sharedEvent
{
  return self->_sharedEvent;
}

- (void)setSharedEvent:(id)a3
{
  objc_storeStrong((id *)&self->_sharedEvent, a3);
}

- (e5rt_async_event)preEvent
{
  return self->_preEvent;
}

- (void)setPreEvent:(e5rt_async_event *)a3
{
  self->_preEvent = a3;
}

- (e5rt_async_event)postEvent
{
  return self->_postEvent;
}

- (void)setPostEvent:(e5rt_async_event *)a3
{
  self->_postEvent = a3;
}

- (unint64_t)eventValue
{
  return self->_eventValue;
}

- (void)setEventValue:(unint64_t)a3
{
  self->_eventValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedEvent, 0);
  objc_storeStrong((id *)&self->_outputTextures, 0);
  objc_storeStrong((id *)&self->_inputTextures, 0);
  objc_destroyWeak((id *)&self->_parentNetwork);
}

@end
