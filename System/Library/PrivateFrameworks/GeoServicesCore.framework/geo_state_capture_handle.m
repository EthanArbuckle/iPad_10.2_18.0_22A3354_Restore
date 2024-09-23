@implementation geo_state_capture_handle

- (geo_state_capture_handle)init
{
  uint64_t v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)geo_state_capture_handle;
  -[geo_state_capture_handle self](&v6, sel_self);
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    *(_QWORD *)(v3 + 32) = 0;
    *(_DWORD *)(v3 + 40) = 0;
    *(_QWORD *)(v3 + 48) = 0;
    v4 = (id)v3;
  }

  return (geo_state_capture_handle *)v3;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_stateCaptureHandle)
    os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)geo_state_capture_handle;
  -[geo_state_capture_handle dealloc](&v3, sel_dealloc);
}

- (os_state_data_s)_capturePlistState:(const os_state_hints_s *)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  unsigned int var2;
  double v11;
  double v12;
  NSObject *v13;
  NSObject *v14;
  unsigned int v15;
  const char *v16;
  NSObject *queue;
  uint64_t v18;
  NSObject *v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  const void *v23;
  size_t v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t frequency;
  const char *v32;
  uint64_t v33;
  const char *v34;
  _QWORD block[7];
  uint8_t v37[4];
  unint64_t v38;
  _BYTE buf[24];
  uint64_t (*v40)(uint64_t, uint64_t);
  __int128 v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  GEOGetStateCaptureLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  GEOGetStateCaptureLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D51BA000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CapturePlistState", ", buf, 2u);
  }

  if (self->_lastCaptureTime > 0.0)
  {
    var2 = a3->var2;
    switch(var2)
    {
      case 1u:
        if (self->_frequency <= 1)
        {
          GEOGetStateCaptureLog();
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = v29;
          if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
          {
            frequency = (int)self->_frequency;
            if (frequency > 2)
              v32 = "INVALID";
            else
              v32 = off_1E994C040[frequency];
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)&buf[4] = v32;
            _os_signpost_emit_with_name_impl(&dword_1D51BA000, v30, OS_SIGNPOST_INTERVAL_END, v6, "CapturePlistState", "Skipped: ERROR & %s < OFTEN", buf, 0xCu);
          }

          return 0;
        }
        v11 = 45.0;
        break;
      case 2u:
        v11 = dbl_1D51BE1A0[self->_frequency > 1];
        break;
      case 3u:
        v11 = 0.5;
        break;
      default:
        v11 = 0.0;
        break;
    }
    v12 = (double)clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 1000000000.0 - self->_lastCaptureTime;
    if (v12 < v11)
    {
      GEOGetStateCaptureLog();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
      {
        v15 = a3->var2 - 1;
        if (v15 > 2)
          v16 = "INVALID";
        else
          v16 = off_1E994C028[v15];
        v33 = (int)self->_frequency;
        if (v33 > 2)
          v34 = "INVALID";
        else
          v34 = off_1E994C040[v33];
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v16;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = v34;
        *(_WORD *)&buf[22] = 2048;
        v40 = *(uint64_t (**)(uint64_t, uint64_t))&v12;
        LOWORD(v41) = 2048;
        *(double *)((char *)&v41 + 2) = v11;
        _os_signpost_emit_with_name_impl(&dword_1D51BA000, v14, OS_SIGNPOST_INTERVAL_END, v6, "CapturePlistState", "Skipped: %s & %s delta(%f) < minDelta(%f)", buf, 0x2Au);
      }

      return 0;
    }
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v40 = __Block_byref_object_copy_;
  *(_QWORD *)&v41 = __Block_byref_object_dispose_;
  *((_QWORD *)&v41 + 1) = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__geo_state_capture_handle__capturePlistState___block_invoke;
  block[3] = &unk_1E994BFC0;
  block[4] = self;
  block[5] = buf;
  block[6] = a3;
  dispatch_async_and_wait(queue, block);
  v18 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v18, 200, 0, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = -[NSObject length](v19, "length");
    if (v19 && (v21 = v20, v20 <= 0xFFFFFFFE))
    {
      v22 = (char *)malloc_type_malloc(v20 + 200, 0x93E54006uLL);
      *(_DWORD *)v22 = 1;
      *(_OWORD *)(v22 + 136) = 0u;
      *(_OWORD *)(v22 + 152) = 0u;
      *(_OWORD *)(v22 + 168) = 0u;
      *(_OWORD *)(v22 + 184) = 0u;
      v23 = -[NSData bytes](self->_description, "bytes");
      if (-[NSData length](self->_description, "length") > 0x3F)
        v24 = 64;
      else
        v24 = -[NSData length](self->_description, "length");
      memcpy(v22 + 136, v23, v24);
      *((_DWORD *)v22 + 1) = v21;
      -[NSObject getBytes:length:](v19, "getBytes:length:", v22 + 200, v21);
      self->_lastCaptureTime = (double)clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 1000000000.0;
      GEOGetStateCaptureLog();
      v28 = objc_claimAutoreleasedReturnValue();
      v27 = v28;
      if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        *(_DWORD *)v37 = 134217984;
        v38 = v21;
        _os_signpost_emit_with_name_impl(&dword_1D51BA000, v27, OS_SIGNPOST_INTERVAL_END, v6, "CapturePlistState", "Captured %zu bytes", v37, 0xCu);
      }
    }
    else
    {
      GEOGetStateCaptureLog();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)v37 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D51BA000, v27, OS_SIGNPOST_INTERVAL_END, v6, "CapturePlistState", "Failed: serialization", v37, 2u);
      }
      v22 = 0;
    }

  }
  else
  {
    GEOGetStateCaptureLog();
    v25 = objc_claimAutoreleasedReturnValue();
    v19 = v25;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)v37 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D51BA000, v19, OS_SIGNPOST_INTERVAL_END, v6, "CapturePlistState", "Failed: nil plist", v37, 2u);
    }
    v22 = 0;
  }

  _Block_object_dispose(buf, 8);
  return (os_state_data_s *)v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_weakStateCapturing);
}

@end
