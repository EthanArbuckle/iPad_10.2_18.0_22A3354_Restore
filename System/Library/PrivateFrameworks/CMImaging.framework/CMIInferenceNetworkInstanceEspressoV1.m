@implementation CMIInferenceNetworkInstanceEspressoV1

- (int)_allocateTexturesWithDevice:(id)a3 firstInstance:(id)a4 ports:(id)a5 useTextureArrays:(BOOL)a6 outputTextureArray:(id)a7
{
  id *v11;
  id v12;
  void *v13;
  id WeakRetained;
  id v15;
  NSArray *v16;
  NSArray **p_bindings;
  NSArray *bindings;
  uint64_t v19;
  uint64_t v20;
  const __CFAllocator *v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  __CVBuffer *v28;
  __IOSurface *IOSurface;
  __IOSurface *v30;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  OSType PixelFormatType;
  CVReturn v34;
  IOSurfaceRef v35;
  __IOSurface *v36;
  id v37;
  int v38;
  CVReturn v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  size_t BytesPerRowOfPlane;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  int v48;
  NSObject *v49;
  unsigned int v50;
  unsigned int v51;
  NSObject *v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  NSObject *v57;
  unsigned int v58;
  unsigned int v59;
  unsigned int v60;
  unsigned int v61;
  NSObject *v62;
  unsigned int v63;
  unsigned int v64;
  NSObject *v65;
  unsigned int v66;
  unsigned int v67;
  NSObject *v68;
  NSObject *v69;
  NSObject *v71;
  id *location;
  id v73;
  id obj;
  uint64_t v75;
  uint64_t v76;
  id *v77;
  uint64_t v78;
  _BOOL4 v79;
  id v80;
  id v81;
  id v82;
  CVPixelBufferRef pixelBufferOut;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  uint64_t v89;
  unsigned int v90;
  int v91;
  const char *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint64_t v103;
  _BYTE v104[128];
  uint64_t v105;

  v79 = a6;
  v105 = *MEMORY[0x1E0C80C00];
  v81 = a3;
  v11 = (id *)a4;
  v12 = a5;
  v80 = a7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentNetwork);

  if (!WeakRetained)
  {
    v90 = 0;
    LOBYTE(pixelBufferOut) = 0;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v71 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v48 = -1;
    goto LABEL_77;
  }
  v15 = objc_loadWeakRetained((id *)&self->_parentNetwork);
  objc_msgSend(v15, "network");

  bindings = self->_bindings;
  p_bindings = &self->_bindings;
  v16 = bindings;
  v82 = v13;
  location = (id *)p_bindings;
  if (bindings)
  {
    v76 = -[NSArray count](v16, "count");
    objc_msgSend(v13, "addObjectsFromArray:", *p_bindings);
  }
  else
  {
    v76 = 0;
  }
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v73 = v12;
  obj = v12;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v104, 16);
  if (!v19)
    goto LABEL_27;
  v20 = v19;
  v78 = *(_QWORD *)v85;
  v21 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v75 = *MEMORY[0x1E0CA8FF0];
  v77 = v11;
  while (2)
  {
    for (i = 0; i != v20; ++i)
    {
      if (*(_QWORD *)v85 != v78)
        objc_enumerationMutation(obj);
      v23 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
      pixelBufferOut = 0;
      objc_msgSend(v23, "isInput");
      if (v11)
      {
        objc_msgSend(v11[1], "objectAtIndexedSubscript:", v76 + i);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "name");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "name");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v25, "isEqualToString:", v26);

        if ((v27 & 1) != 0)
        {
          v28 = (__CVBuffer *)objc_msgSend(v24, "pixelBuffer");
          IOSurface = CVPixelBufferGetIOSurface(v28);
          if (IOSurface)
          {
            v30 = IOSurface;
            WidthOfPlane = IOSurfaceGetWidthOfPlane(IOSurface, 0);
            HeightOfPlane = IOSurfaceGetHeightOfPlane(v30, 0);
            PixelFormatType = CVPixelBufferGetPixelFormatType(v28);
            v88 = v75;
            v89 = MEMORY[0x1E0C9AA70];
            v34 = CVPixelBufferCreate(v21, WidthOfPlane, HeightOfPlane, PixelFormatType, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1), &pixelBufferOut);
            if (v34)
            {
              v48 = v34;
              v90 = 0;
              fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              v57 = objc_claimAutoreleasedReturnValue();
              v58 = v90;
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
                v59 = v58;
              else
                v59 = v58 & 0xFFFFFFFE;
              if (v59)
              {
                v91 = 136315138;
                v92 = "-[CMIInferenceNetworkInstanceEspressoV1 _allocateTexturesWithDevice:firstInstance:ports:useTexture"
                      "Arrays:outputTextureArray:]";
                _os_log_send_and_compose_impl();
              }
              v11 = v77;
              v12 = v73;
              v13 = v82;
              fig_log_call_emit_and_clean_up_after_send_and_compose();

              goto LABEL_71;
            }
            v35 = CVPixelBufferGetIOSurface(pixelBufferOut);
            if (v35)
            {
              v36 = v35;

              goto LABEL_19;
            }
            v90 = 0;
            fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v52 = objc_claimAutoreleasedReturnValue();
            v60 = v90;
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
              v61 = v60;
            else
              v61 = v60 & 0xFFFFFFFE;
            if (v61)
            {
              v91 = 136315138;
              v92 = "-[CMIInferenceNetworkInstanceEspressoV1 _allocateTexturesWithDevice:firstInstance:ports:useTextureAr"
                    "rays:outputTextureArray:]";
              _os_log_send_and_compose_impl();
            }
            v11 = v77;
LABEL_70:
            v12 = v73;
            v13 = v82;
            fig_log_call_emit_and_clean_up_after_send_and_compose();

            v48 = -1;
LABEL_71:

            goto LABEL_76;
          }
          v90 = 0;
          fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v52 = objc_claimAutoreleasedReturnValue();
          v55 = v90;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            v56 = v55;
          else
            v56 = v55 & 0xFFFFFFFE;
          if (!v56)
            goto LABEL_70;
          v91 = 136315138;
          v92 = "-[CMIInferenceNetworkInstanceEspressoV1 _allocateTexturesWithDevice:firstInstance:ports:useTextureArrays"
                ":outputTextureArray:]";
        }
        else
        {
          v90 = 0;
          fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v52 = objc_claimAutoreleasedReturnValue();
          v53 = v90;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            v54 = v53;
          else
            v54 = v53 & 0xFFFFFFFE;
          if (!v54)
            goto LABEL_70;
          v91 = 136315138;
          v92 = "-[CMIInferenceNetworkInstanceEspressoV1 _allocateTexturesWithDevice:firstInstance:ports:useTextureArrays"
                ":outputTextureArray:]";
        }
        _os_log_send_and_compose_impl();
        goto LABEL_70;
      }
      v103 = 0;
      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      v93 = 0u;
      v94 = 0u;
      objc_msgSend(v23, "name");
      v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v37, "UTF8String");
      v38 = espresso_network_bind_buffer();

      if (v38)
      {
        fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v68 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT);
        v12 = v73;
        v13 = v82;
        fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_75:
        v48 = -1;
        goto LABEL_76;
      }
      v36 = (__IOSurface *)v93;
      v39 = CVPixelBufferCreateWithIOSurface(v21, (IOSurfaceRef)v93, 0, &pixelBufferOut);
      if (v39)
      {
        v48 = v39;
        fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v69 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT);
        v12 = v73;
        v13 = v82;
        fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_76:
        goto LABEL_77;
      }
      WidthOfPlane = IOSurfaceGetWidthOfPlane(v36, 0);
      HeightOfPlane = IOSurfaceGetHeightOfPlane(v36, 0);
LABEL_19:
      v40 = (void *)objc_opt_new();
      objc_msgSend(v23, "name");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setName:", v41);

      objc_msgSend(v40, "setPixelBuffer:", pixelBufferOut);
      objc_msgSend(v82, "addObject:", v40);
      if (!v36)
      {
        v90 = 0;
        fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = v90;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          v51 = v50;
        else
          v51 = v50 & 0xFFFFFFFE;
        if (v51)
        {
          v91 = 136315138;
          v92 = "-[CMIInferenceNetworkInstanceEspressoV1 _allocateTexturesWithDevice:firstInstance:ports:useTextureArrays"
                ":outputTextureArray:]";
          _os_log_send_and_compose_impl();
        }
        v11 = v77;
        v12 = v73;
        v13 = v82;
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        goto LABEL_74;
      }
      if (v79)
      {
        v42 = (void *)objc_msgSend(v81, "newBufferWithIOSurface:", v36);
        objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, objc_msgSend(v23, "width"), objc_msgSend(v23, "height"), 0);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setTextureType:", 3);
        objc_msgSend(v43, "setArrayLength:", objc_msgSend(v23, "depth"));
        objc_msgSend(v43, "setUsage:", 3);
        BytesPerRowOfPlane = IOSurfaceGetBytesPerRowOfPlane(v36, 0);
        v45 = objc_msgSend(v42, "newLinearTextureWithDescriptor:offset:bytesPerRow:bytesPerImage:", v43, 0, BytesPerRowOfPlane, objc_msgSend(v23, "height") * BytesPerRowOfPlane);
        if (v45)
        {
          v46 = (void *)v45;

          goto LABEL_25;
        }
        v90 = 0;
        fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v62 = objc_claimAutoreleasedReturnValue();
        v63 = v90;
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          v64 = v63;
        else
          v64 = v63 & 0xFFFFFFFE;
        if (v64)
        {
          v91 = 136315138;
          v92 = "-[CMIInferenceNetworkInstanceEspressoV1 _allocateTexturesWithDevice:firstInstance:ports:useTextureArrays"
                ":outputTextureArray:]";
          _os_log_send_and_compose_impl();
        }
        v12 = v73;
        v13 = v82;
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        v11 = v77;
        goto LABEL_74;
      }
      objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, WidthOfPlane, HeightOfPlane, 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setUsage:", 3);
      v47 = objc_msgSend(v81, "newTextureWithDescriptor:iosurface:plane:", v42, v36, 0);
      if (!v47)
      {
        v90 = 0;
        fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v65 = objc_claimAutoreleasedReturnValue();
        v66 = v90;
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          v67 = v66;
        else
          v67 = v66 & 0xFFFFFFFE;
        v11 = v77;
        if (v67)
        {
          v91 = 136315138;
          v92 = "-[CMIInferenceNetworkInstanceEspressoV1 _allocateTexturesWithDevice:firstInstance:ports:useTextureArrays"
                ":outputTextureArray:]";
          _os_log_send_and_compose_impl();
        }
        v12 = v73;
        v13 = v82;
        fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_74:
        goto LABEL_75;
      }
      v46 = (void *)v47;
LABEL_25:
      v11 = v77;

      objc_msgSend(v80, "addObject:", v46);
    }
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v104, 16);
    v76 += i;
    if (v20)
      continue;
    break;
  }
LABEL_27:

  v13 = v82;
  objc_storeStrong(location, v82);
  v48 = 0;
  v12 = v73;
LABEL_77:

  return v48;
}

- (int)_bindPixelBuffersToNetwork
{
  CMIInferenceNetworkEspressoV1 **p_parentNetwork;
  id WeakRetained;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  int v13;
  NSObject *v14;
  unsigned int v15;
  unsigned int v16;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  os_log_type_t type;
  unsigned int v24;
  _BYTE v25[128];
  int v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  p_parentNetwork = &self->_parentNetwork;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentNetwork);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_parentNetwork);
    objc_msgSend(v5, "network");

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = self->_bindings;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v11, "name");
          v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v12, "UTF8String");
          objc_msgSend(v11, "pixelBuffer");
          LODWORD(v11) = espresso_network_bind_direct_cvpixelbuffer();

          if ((_DWORD)v11)
          {
            v24 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v14 = objc_claimAutoreleasedReturnValue();
            v15 = v24;
            if (os_log_type_enabled(v14, type))
              v16 = v15;
            else
              v16 = v15 & 0xFFFFFFFE;
            if (v16)
            {
              v26 = 136315138;
              v27 = "-[CMIInferenceNetworkInstanceEspressoV1 _bindPixelBuffersToNetwork]";
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();

            v13 = -1;
            goto LABEL_17;
          }
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
        if (v8)
          continue;
        break;
      }
    }
    v13 = 0;
LABEL_17:

  }
  else
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v18 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    return -1;
  }
  return v13;
}

- (int)synchronizeNetworkWaitOnMetalSignal:(id)a3
{
  id v4;
  void *v5;
  int v6;
  CMIInferenceNetworkEspressoV1 **p_parentNetwork;
  id WeakRetained;
  id v9;
  int v10;
  NSObject *v12;
  NSObject *v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_10;
  if ((unint64_t)objc_msgSend(v4, "status") <= 1)
    objc_msgSend(v5, "commit");
  if ((unint64_t)objc_msgSend(v5, "status") <= 2)
    objc_msgSend(v5, "waitUntilScheduled");
  v6 = -[CMIInferenceNetworkInstanceEspressoV1 _bindPixelBuffersToNetwork](self, "_bindPixelBuffersToNetwork");
  if (v6)
  {
    v10 = v6;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v13 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
LABEL_14:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_9;
  }
  p_parentNetwork = &self->_parentNetwork;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentNetwork);

  if (!WeakRetained)
  {
LABEL_10:
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v12 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v10 = -1;
    goto LABEL_9;
  }
  v9 = objc_loadWeakRetained((id *)p_parentNetwork);
  v10 = objc_msgSend(v9, "_planSubmit");

  if (v10)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v13 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    goto LABEL_14;
  }
LABEL_9:

  return v10;
}

- (int)synchronizeMetalWaitOnNetworkSignal:(id)a3
{
  return 0;
}

- (CMIInferenceNetworkEspressoV1)parentNetwork
{
  return (CMIInferenceNetworkEspressoV1 *)objc_loadWeakRetained((id *)&self->_parentNetwork);
}

- (void)setParentNetwork:(id)a3
{
  objc_storeWeak((id *)&self->_parentNetwork, a3);
}

- (unint64_t)instanceId
{
  return self->_instanceId;
}

- (void)setInstanceId:(unint64_t)a3
{
  self->_instanceId = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputTextures, 0);
  objc_storeStrong((id *)&self->_inputTextures, 0);
  objc_destroyWeak((id *)&self->_parentNetwork);
  objc_storeStrong((id *)&self->_bindings, 0);
}

@end
