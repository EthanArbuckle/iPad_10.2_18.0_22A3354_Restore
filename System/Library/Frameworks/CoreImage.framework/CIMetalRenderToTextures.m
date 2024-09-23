@implementation CIMetalRenderToTextures

void __CIMetalRenderToTextures_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  double v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  unsigned int v12;
  __int16 v13;
  unsigned int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (CI_KDEBUG())
    kdebug_trace();
  if (CI_VERBOSE_SIGNPOSTS())
  {
    v4 = ci_signpost_log_render();
    v5 = *(int *)(a1 + 56) | (*(_QWORD *)(a1 + 48) << 32);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v6 = v4;
      if (os_signpost_enabled(v4))
      {
        v7 = *(double *)(a1 + 40);
        v8 = *(double *)(a1 + 32);
        v9 = 134218496;
        v10 = a2;
        v11 = 1024;
        v12 = v8;
        v13 = 1024;
        v14 = v7;
        _os_signpost_emit_with_name_impl(&dword_1921E4000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v5, "gpu_compute", "cb:%p [%u, %u]", (uint8_t *)&v9, 0x18u);
      }
    }
  }
}

void __CIMetalRenderToTextures_block_invoke_57(uint64_t a1, void *a2)
{
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  double v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __IOSurface *v18;
  const __CFString *v19;
  const __CFString *v20;
  OSType PixelFormat;
  NSObject *v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  uint32_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  id object;
  unsigned int v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  const __CFString *v45;
  uint8_t v46[4];
  _BYTE v47[44];
  uint8_t buf[32];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  if (CI_KDEBUG())
    kdebug_trace();
  if (CI_VERBOSE_SIGNPOSTS())
  {
    v4 = ci_signpost_log_render();
    v5 = *(int *)(a1 + 72) | (*(_QWORD *)(a1 + 64) << 32);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v6 = v4;
      if (os_signpost_enabled(v4))
      {
        v7 = *(double *)(a1 + 56);
        v8 = *(double *)(a1 + 48);
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)&buf[4] = a2;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v8;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v7;
        _os_signpost_emit_with_name_impl(&dword_1921E4000, v6, OS_SIGNPOST_INTERVAL_END, v5, "gpu_compute", "cb:%p [%u, %u]", buf, 0x18u);
      }
    }
  }
  v37 = a1;
  object = a2;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v9 = *(void **)(a1 + 32);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v63, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v41;
    v14 = (const __CFString *)*MEMORY[0x1E0CBC048];
    v15 = *MEMORY[0x1E0CB2D50];
    for (i = *(_QWORD *)v41; ; i = *(_QWORD *)v41)
    {
      if (i != v13)
        objc_enumerationMutation(v9);
      v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v12);
      if (objc_msgSend(v17, "iosurface"))
      {
        if (SurfaceIsVolatile((__IOSurface *)objc_msgSend(v17, "iosurface")))
          break;
      }
LABEL_25:
      if (++v12 >= v11)
      {
        v32 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v63, 16);
        if (!v32)
          goto LABEL_31;
        v11 = v32;
        v12 = 0;
      }
    }
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    memset(buf, 0, sizeof(buf));
    v18 = (__IOSurface *)objc_msgSend(v17, "iosurface");
    v19 = (const __CFString *)IOSurfaceCopyValue(v18, v14);
    if (v19)
    {
      v20 = v19;
      CFStringGetCString(v19, (char *)buf, 256, 0x8000100u);
      CFAutorelease(v20);
    }
    PixelFormat = IOSurfaceGetPixelFormat(v18);
    v39 = bswap32(PixelFormat);
    v22 = ci_logger_render();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (PixelFormat < 0x29)
    {
      if (v23)
      {
        v36 = v39;
        v33 = objc_msgSend(v17, "width");
        v34 = objc_msgSend(v17, "height");
        *(_DWORD *)v46 = 134218754;
        *(_QWORD *)v47 = v36;
        *(_WORD *)&v47[8] = 2048;
        *(_QWORD *)&v47[10] = v33;
        *(_WORD *)&v47[18] = 2048;
        *(_QWORD *)&v47[20] = v34;
        *(_WORD *)&v47[28] = 2082;
        *(_QWORD *)&v47[30] = buf;
        v26 = v22;
        v27 = "Internal error: Input texture: (%ld: %lu x %lu) has volatile backing (%{public}s) surface";
        v28 = 42;
        goto LABEL_30;
      }
    }
    else if (v23)
    {
      v24 = objc_msgSend(v17, "width");
      v25 = objc_msgSend(v17, "height");
      *(_DWORD *)v46 = 68158722;
      *(_DWORD *)v47 = 4;
      *(_WORD *)&v47[4] = 2080;
      *(_QWORD *)&v47[6] = &v39;
      *(_WORD *)&v47[14] = 2048;
      *(_QWORD *)&v47[16] = v24;
      *(_WORD *)&v47[24] = 2048;
      *(_QWORD *)&v47[26] = v25;
      *(_WORD *)&v47[34] = 2082;
      *(_QWORD *)&v47[36] = buf;
      v26 = v22;
      v27 = "Internal error: Input texture: (%.4s: %lu x %lu) has volatile backing (%{public}s) surface";
      v28 = 48;
LABEL_30:
      _os_log_error_impl(&dword_1921E4000, v26, OS_LOG_TYPE_ERROR, v27, v46, v28);
    }
    if (isImageConversionServiceProcess_onceToken != -1)
      dispatch_once(&isImageConversionServiceProcess_onceToken, &__block_literal_global_51);
    if (isImageConversionServiceProcess_isICS)
    {
      v35 = ci_logger_render();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        __CIMetalRenderToTextures_block_invoke_57_cold_1();
      abort();
    }
    v29 = (void *)MEMORY[0x194026220]();
    v44 = v15;
    v45 = CFSTR("Input texture has volatile backing surface");
    v30 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v31 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreimage"), 1, v30);
    if (v31)
      objc_setAssociatedObject(object, setInternalError, v31, (void *)0x301);
    objc_autoreleasePoolPop(v29);
    goto LABEL_25;
  }
LABEL_31:

}

void __CIMetalRenderToTextures_block_invoke_57_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_9(&dword_1921E4000, v0, v1, "Calling abort() because a volatile surface was detected", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

@end
