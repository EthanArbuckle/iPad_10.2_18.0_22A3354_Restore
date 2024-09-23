@implementation ARCoachingDotsRenderer

- (id)init:(id)a3 pixelFormat:(unint64_t)a4 metalLibrary:(id)a5 sampleCount:(int)a6
{
  id v10;
  id v11;
  ARCoachingDotsRenderer *v12;
  ARCoachingDotsRenderer *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  MTLRenderPipelineState *pipelineState;
  NSObject *v55;
  objc_class *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  unint64_t v67;
  id v68;
  id v69;
  id v70;
  objc_super v71;
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  ARCoachingDotsRenderer *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v71.receiver = self;
  v71.super_class = (Class)ARCoachingDotsRenderer;
  v12 = -[ARCoachingDotsRenderer init](&v71, sel_init);
  v13 = v12;
  if (v12)
  {
    v67 = a4;
    v12->_pixelFormat = a4;
    v14 = objc_alloc_init(MEMORY[0x1E0CC6B68]);
    v15 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
    v70 = 0;
    v16 = (void *)objc_msgSend(v11, "newFunctionWithName:constantValues:error:", CFSTR("DotsVertex"), v15, &v70);
    v17 = v70;
    objc_msgSend(v14, "setVertexFunction:", v16);

    if (v17)
    {
      _ARLogCoaching_4();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v62 = v10;
        v64 = v15;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedDescription");
        v21 = a6;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedFailureReason");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedRecoverySuggestion");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v73 = v20;
        v74 = 2048;
        v75 = v13;
        v76 = 2112;
        v77 = v22;
        v78 = 2112;
        v79 = v23;
        v80 = 2112;
        v81 = v24;
        _os_log_impl(&dword_1DCC73000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to load vertex function for coaching animation\n\tError: %@\n\tReason: %@\n\tSuggestion: %@", buf, 0x34u);

        a6 = v21;
        v10 = v62;
        v15 = v64;
      }

    }
    v69 = 0;
    v25 = (void *)objc_msgSend(v11, "newFunctionWithName:constantValues:error:", CFSTR("DotsFragment"), v15, &v69);
    v26 = v69;
    objc_msgSend(v14, "setFragmentFunction:", v25);

    if (v26)
    {
      _ARLogCoaching_4();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v63 = v10;
        v65 = v15;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "localizedDescription");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "localizedFailureReason");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "localizedRecoverySuggestion");
        v32 = a6;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v73 = v29;
        v74 = 2048;
        v75 = v13;
        v76 = 2112;
        v77 = v30;
        v78 = 2112;
        v79 = v31;
        v80 = 2112;
        v81 = v33;
        _os_log_impl(&dword_1DCC73000, v27, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to load fragment function for coaching animation\n\tError: %@\n\tReason: %@\n\tSuggestion: %@", buf, 0x34u);

        a6 = v32;
        v10 = v63;
        v15 = v65;
      }

    }
    objc_msgSend(v14, "colorAttachments");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setBlendingEnabled:", 1);

    objc_msgSend(v14, "colorAttachments");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setRgbBlendOperation:", 0);

    objc_msgSend(v14, "colorAttachments");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectAtIndexedSubscript:", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setAlphaBlendOperation:", 0);

    objc_msgSend(v14, "colorAttachments");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setSourceRGBBlendFactor:", 4);

    objc_msgSend(v14, "colorAttachments");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectAtIndexedSubscript:", 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setDestinationRGBBlendFactor:", 5);

    objc_msgSend(v14, "colorAttachments");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectAtIndexedSubscript:", 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setSourceAlphaBlendFactor:", 4);

    objc_msgSend(v14, "colorAttachments");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "objectAtIndexedSubscript:", 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setDestinationAlphaBlendFactor:", 5);

    objc_msgSend(v14, "colorAttachments");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectAtIndexedSubscript:", 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setPixelFormat:", v67);

    objc_msgSend(v14, "setRasterSampleCount:", a6);
    objc_msgSend(v14, "vertexFunction");
    v50 = objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      v51 = (void *)v50;
      objc_msgSend(v14, "fragmentFunction");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (v52)
      {

        v68 = 0;
        v53 = objc_msgSend(v10, "newRenderPipelineStateWithDescriptor:error:", v14, &v68);
        v26 = v68;
        pipelineState = v13->_pipelineState;
        v13->_pipelineState = (MTLRenderPipelineState *)v53;

        if (v26)
        {
          _ARLogCoaching_4();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            v56 = (objc_class *)objc_opt_class();
            NSStringFromClass(v56);
            v66 = v15;
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "localizedDescription");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "localizedFailureReason");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "localizedRecoverySuggestion");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v73 = v57;
            v74 = 2048;
            v75 = v13;
            v76 = 2112;
            v77 = v58;
            v78 = 2112;
            v79 = v59;
            v80 = 2112;
            v81 = v60;
            _os_log_impl(&dword_1DCC73000, v55, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create pipeline state for coaching animation\n\tError: %@\n\tReason: %@\n\tSuggestion: %@", buf, 0x34u);

            v15 = v66;
          }

        }
      }
    }

  }
  return v13;
}

- (void)encode:(__n128)a3 renderCommandEncoder:(__n128)a4 mvp:(__n128)a5 visibility:(float)a6 renderParams:(double)a7 time:(uint64_t)a8
{
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  float v20;
  float v21;
  uint64_t v22;
  float v23;
  float v24;
  void *v25;
  uint64_t v30;
  int v31;
  float v32;
  uint64_t v33;
  uint64_t v34;
  _OWORD v35[4];
  _OWORD v36[8];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v15 = *(_QWORD *)(a1 + 16);
  v16 = a10;
  v17 = a9;
  objc_msgSend(v16, "setRenderPipelineState:", v15);
  v35[0] = a2;
  v35[1] = a3;
  v35[2] = a4;
  v35[3] = a5;
  v18 = (void *)objc_msgSend(v17, "newBufferWithBytes:length:options:", v35, 64, 0);
  objc_msgSend(v16, "setVertexBuffer:offset:atIndex:", v18, 0, 0);
  v36[4] = xmmword_1DCCA1350;
  v36[5] = unk_1DCCA1360;
  v36[6] = xmmword_1DCCA1370;
  v36[7] = unk_1DCCA1380;
  v36[0] = xmmword_1DCCA1310;
  v36[1] = unk_1DCCA1320;
  v36[2] = xmmword_1DCCA1330;
  v36[3] = unk_1DCCA1340;
  v19 = (void *)objc_msgSend(v17, "newBufferWithBytes:length:options:", v36, 128, 0);
  objc_msgSend(v16, "setVertexBuffer:offset:atIndex:", v19, 0, 1);
  v20 = a11[5] + a7;
  v21 = cosf(v20);
  *(float *)&v22 = a11[2];
  v23 = (1.0 - (float)(a11[3] * v21)) * 0.5;
  *((float *)&v22 + 1) = v23;
  v34 = 0;
  v30 = *(_QWORD *)a11;
  v31 = 1048576000;
  v24 = fmax(a6, 0.0);
  v32 = v24;
  v33 = v22;
  *(float *)&v34 = a11[4];
  v25 = (void *)objc_msgSend(v17, "newBufferWithBytes:length:options:", &v30, 32, 0);

  objc_msgSend(v16, "setFragmentBuffer:offset:atIndex:", v25, 0, 0);
  objc_msgSend(v16, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineState, 0);
}

@end
