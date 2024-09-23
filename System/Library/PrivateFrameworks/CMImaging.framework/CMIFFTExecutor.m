@implementation CMIFFTExecutor

- (CMIFFTExecutor)initWithContext:(id)a3
{
  id v5;
  CMIFFTExecutor *v6;
  CMIFFTExecutor *v7;
  CMIFFTExecutor *v8;
  CMIFFTEncode *v9;
  CMIFFTEncode *encode;
  uint64_t v11;
  NSArray *toDecrementFig;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CMIFFTExecutor;
  v6 = -[CMIFFTExecutor init](&v14, sel_init);
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v9 = -[CMIFFTEncode initWithContext:]([CMIFFTEncode alloc], "initWithContext:", v7->_context);
    encode = v7->_encode;
    v7->_encode = v9;

    if (v7->_encode
      && (v11 = objc_opt_new(),
          toDecrementFig = v7->_toDecrementFig,
          v7->_toDecrementFig = (NSArray *)v11,
          toDecrementFig,
          v7->_toDecrementFig))
    {
      v8 = v7;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)_allocateBuffer:(unint64_t)a3 label:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSArray *toDecrementFig;

  -[CMIFFTContext figMetalContext](self->_context, "figMetalContext", a3, a4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_5;
  v7 = (void *)v6;
  -[CMIFFTContext figMetalContext](self->_context, "figMetalContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allocator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)objc_opt_new();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "setLength:", a3);
      objc_msgSend(v11, "setLabel:", 0);
      -[CMIFFTContext figMetalContext](self->_context, "figMetalContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allocator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "newBufferWithDescriptor:", v11);

      -[NSArray arrayByAddingObject:](self->_toDecrementFig, "arrayByAddingObject:", v14);
      v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
      toDecrementFig = self->_toDecrementFig;
      self->_toDecrementFig = v15;

    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
LABEL_5:
    -[CMIFFTContext device](self->_context, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "newBufferWithLength:options:", a3, 0);
  }

  return v14;
}

- (int64_t)_allocateWorkingMemory:(id)a3 layout:(int64_t)a4 precision:(int64_t)a5 inputBuffer:(id)a6 batchSize:(unint64_t)a7
{
  int v7;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t i;
  int64_t v20;
  int v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v7 = a7;
  v34 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  v13 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v30;
    v18 = 1;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v14);
        v18 *= objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "size", (_QWORD)v29);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v16);
  }
  else
  {
    v18 = 1;
  }
  v20 = -73469;

  v21 = 2 * v7 * v18 * -[CMIFFTExecutor _getStrideForPrecisionType:](self, "_getStrideForPrecisionType:", a5);
  v22 = v21;
  if (objc_msgSend(v12, "length") == v21)
  {
    objc_msgSend(v13, "arrayByAddingObject:", v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CMIFFTExecutor _allocateBuffer:label:](self, "_allocateBuffer:label:", v21, CFSTR("workingBuffer0"));
    v24 = objc_claimAutoreleasedReturnValue();
    if (!v24)
      goto LABEL_16;
    v25 = (void *)v24;
    objc_msgSend(v13, "arrayByAddingObject:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v25;
  }

  -[CMIFFTExecutor _allocateBuffer:label:](self, "_allocateBuffer:label:", v22, CFSTR("workingBuffer1"));
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    objc_msgSend(v23, "arrayByAddingObject:", v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&self->_workingBuffers, v13);
    v20 = 0;
  }
  else
  {
    v13 = v23;
  }
LABEL_16:

  return v20;
}

- (int)_getMetalPrecisionType:(int64_t)a3
{
  int v3;

  if (a3)
    v3 = -1;
  else
    v3 = 0;
  if (a3 == 1)
    return 1;
  else
    return v3;
}

- (int)_getStrideForPrecisionType:(int64_t)a3
{
  int v3;

  if (a3)
    v3 = -1;
  else
    v3 = 4;
  if (a3 == 1)
    return 2;
  else
    return v3;
}

- (int)_getMetalLayoutType:(int64_t)a3
{
  int v3;

  if (a3 == 1)
    v3 = 0;
  else
    v3 = -1;
  if (a3)
    return v3;
  else
    return 2;
}

- (id)_getSizes:(id)a3 primeFactors:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v13, (_QWORD)v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14 && (int)objc_msgSend(v14, "intValue") >= 1)
        {
          v24[0] = CFSTR("Factor");
          v24[1] = CFSTR("Size");
          v25[0] = v13;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)pow((double)(int)objc_msgSend(v13, "intValue"), (double)(int)objc_msgSend(v15, "intValue")));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v25[1] = v16;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "arrayByAddingObject:", v17);
          v18 = objc_claimAutoreleasedReturnValue();

          v7 = (void *)v18;
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)_reorderBuffers:(id)a3 mostRecentBuffer:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void)_reorderWorkingBuffersFromBuffer:(id)a3
{
  NSArray *v4;
  NSArray *workingBuffers;

  -[CMIFFTExecutor _reorderBuffers:mostRecentBuffer:](self, "_reorderBuffers:mostRecentBuffer:", self->_workingBuffers, a3);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  workingBuffers = self->_workingBuffers;
  self->_workingBuffers = v4;

}

- (int64_t)copyBufferAToBufferB:(id)a3 bufferA:(id)a4 bufferB:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  int64_t v11;

  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "blitCommandEncoder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "length");
  if (v10 == objc_msgSend(v8, "length"))
  {
    objc_msgSend(v9, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v7, 0, v8, 0, objc_msgSend(v7, "length"));
    objc_msgSend(v9, "endEncoding");
    v11 = 0;
  }
  else
  {
    v11 = -1;
  }

  return v11;
}

- (id)_execute1DTwoRadix:(id)a3 dimension:(id)a4 layout:(int64_t)a5 precision:(int64_t)a6 direction:(int64_t)a7 primeFactors:(id)a8 batchSize:(unint64_t)a9
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  int v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  CMIFFTEncode *encode;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  CMIFFTEncode *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  CMIFFTEncode *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  CMIFFTEncode *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v57;
  unsigned int v58;
  uint64_t v59;
  void *v60;
  id v61;
  int v62;
  int v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  _BYTE v67[24];
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  int v74;
  uint64_t v75;

  v58 = a7;
  v61 = a3;
  v14 = a4;
  v15 = a8;
  +[CMIFFTPrime getSupportedPrimeFactors](CMIFFTPrime, "getSupportedPrimeFactors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMIFFTExecutor _getSizes:primeFactors:](self, "_getSizes:primeFactors:", v16, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "sortedArrayUsingComparator:", &__block_literal_global);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Size"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "intValue");

  v60 = v18;
  objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Size"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "intValue");

  v25 = v14;
  if (objc_msgSend(v14, "size") != v24 * v21
    || (v26 = -[CMIFFTExecutor _getMetalLayoutType:](self, "_getMetalLayoutType:", a5), v26 < 0)
    || (v27 = v26, v62 = -[CMIFFTExecutor _getMetalPrecisionType:](self, "_getMetalPrecisionType:", a6), v62 < 0))
  {
    v43 = 0;
    v55 = 0;
    v42 = v61;
    goto LABEL_10;
  }
  v57 = v16;
  v71 = 0;
  v72 = 0;
  v28 = v24;
  v73 = 0;
  v29 = v14;
  v30 = objc_msgSend(v14, "size");
  encode = self->_encode;
  -[NSArray objectAtIndexedSubscript:](self->_workingBuffers, "objectAtIndexedSubscript:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->_workingBuffers, "objectAtIndexedSubscript:", 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v62;
  v64 = 2;
  v65 = 1;
  v66 = v28;
  *(_OWORD *)v67 = xmmword_1D3305260;
  *(_QWORD *)&v67[16] = v21;
  v68 = 0;
  v69 = v28;
  v70 = v21;
  v74 = v27;
  v75 = v30;
  -[CMIFFTEncode encodeTransposeBuffer2D:inputBuffer:outputBuffer:bufferOffset:batchSize:config:](encode, "encodeTransposeBuffer2D:inputBuffer:outputBuffer:bufferOffset:batchSize:config:", v61, v32, v33, 0, a9, &v63);

  -[NSArray objectAtIndexedSubscript:](self->_workingBuffers, "objectAtIndexedSubscript:", 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMIFFTExecutor _reorderWorkingBuffersFromBuffer:](self, "_reorderWorkingBuffersFromBuffer:", v34);

  objc_msgSend(v60, "objectAtIndexedSubscript:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Factor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (int)objc_msgSend(v36, "intValue");

  v38 = objc_msgSend(v29, "size");
  v39 = self->_encode;
  -[NSArray objectAtIndexedSubscript:](self->_workingBuffers, "objectAtIndexedSubscript:", 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->_workingBuffers, "objectAtIndexedSubscript:", 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v62;
  v64 = 0;
  v65 = v21;
  v66 = v37;
  *(_QWORD *)v67 = v58;
  *(_OWORD *)&v67[8] = xmmword_1D3305260;
  v59 = v21;
  v68 = v21;
  v69 = v38;
  v42 = v61;
  -[CMIFFTEncode encode1DTransform:inputBuffer:scratchBuffer:batchSize:depthBatchSize:bufferOffset:config:](v39, "encode1DTransform:inputBuffer:scratchBuffer:batchSize:depthBatchSize:bufferOffset:config:", v61, v40, v41, v28, a9, 0, &v63);
  v43 = (id)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    -[CMIFFTExecutor _reorderWorkingBuffersFromBuffer:](self, "_reorderWorkingBuffersFromBuffer:", v43);
    v25 = v29;
    v44 = objc_msgSend(v29, "size");
    v45 = self->_encode;
    -[NSArray objectAtIndexedSubscript:](self->_workingBuffers, "objectAtIndexedSubscript:", 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v62;
    v64 = v27;
    v65 = v44;
    v66 = v58;
    v47 = -[CMIFFTEncode encodeApplyTwiddles:inputBuffer:config:N1:N2:bufferOffset:batchSize:](v45, "encodeApplyTwiddles:inputBuffer:config:N1:N2:bufferOffset:batchSize:", v61, v46, &v63, v59, v28, 0, a9);

    if (v47)
    {
      v55 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v60, "objectAtIndexedSubscript:", 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("Factor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (int)objc_msgSend(v49, "intValue");

    v51 = objc_msgSend(v29, "size");
    v52 = self->_encode;
    -[NSArray objectAtIndexedSubscript:](self->_workingBuffers, "objectAtIndexedSubscript:", 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](self->_workingBuffers, "objectAtIndexedSubscript:", 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v62;
    v64 = 0;
    v65 = v28;
    v66 = v50;
    *(_OWORD *)v67 = v58;
    *(_QWORD *)&v67[16] = v59;
    v68 = 1;
    v69 = v51;
    v42 = v61;
    -[CMIFFTEncode encode1DTransform:inputBuffer:scratchBuffer:batchSize:depthBatchSize:bufferOffset:config:](v52, "encode1DTransform:inputBuffer:scratchBuffer:batchSize:depthBatchSize:bufferOffset:config:", v61, v53, v54, &v63);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55)
    {
      v43 = v55;
      v55 = v43;
    }
    else
    {
      v43 = 0;
    }
  }
  else
  {
    v55 = 0;
  }
  v25 = v29;
LABEL_9:
  v16 = v57;
LABEL_10:

  return v55;
}

BOOL __97__CMIFFTExecutor__execute1DTwoRadix_dimension_layout_precision_direction_primeFactors_batchSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  int v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("Size"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Size"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "intValue");
  return (int)v4 > v6;
}

- (id)_execute1DMixedRadix:(id)a3 dimension:(id)a4 layout:(int64_t)a5 precision:(int64_t)a6 direction:(int64_t)a7 primeFactors:(id)a8 batchSize:(unint64_t)a9
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t i;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  CMIFFTEncode *encode;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  CMIFFTEncode *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  CMIFFTEncode *v45;
  CMIFFTEncode *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  int v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  uint64_t v55;
  int v56;
  void *v57;
  void *v58;
  CMIFFTExecutor *v59;
  uint64_t v60;
  int v61;
  int v62;
  BOOL v63;
  void *v64;
  int v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  int v70;
  CMIFFTEncode *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  unint64_t v81;
  CMIFFTEncode *v82;
  uint64_t v83;
  CMIFFTEncode *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  CMIFFTEncode *v91;
  uint64_t v92;
  uint64_t j;
  uint64_t v94;
  void *v95;
  void *v96;
  int v97;
  uint64_t v98;
  int v99;
  int v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  unint64_t v105;
  void *v106;
  void *v107;
  unint64_t v108;
  CMIFFTEncode *v109;
  void *v110;
  void *v111;
  CMIFFTEncode *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v117;
  void *v118;
  void *v119;
  int v120;
  int v121;
  int v122;
  int v123;
  BOOL v124;
  int v125;
  unsigned int v127;
  unint64_t v128;
  unint64_t v129;
  void *v130;
  int v131;
  int v132;
  int v133;
  int v134;
  void *v135;
  int v136;
  CMIFFTExecutor *v137;
  id v138;
  int v139;
  int v140;
  unint64_t v141;
  unint64_t v142;
  _BYTE v143[24];
  unint64_t v144;
  unint64_t v145;
  unint64_t v146;
  __int128 v147;
  int v148;
  int v149;
  unint64_t v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  _QWORD v155[2];
  _QWORD v156[2];
  uint64_t v157;
  void *v158;
  __int128 v159;
  int v160;
  _BYTE v161[128];
  uint64_t v162;

  v127 = a7;
  v162 = *MEMORY[0x1E0C80C00];
  v138 = a3;
  v13 = a4;
  v14 = a8;
  +[CMIFFTPrime getSupportedPrimeFactors](CMIFFTPrime, "getSupportedPrimeFactors");
  v137 = self;
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = v14;
  -[CMIFFTExecutor _getSizes:primeFactors:](self, "_getSizes:primeFactors:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortedArrayUsingComparator:", &__block_literal_global_37);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v120 = objc_msgSend(v16, "count");
  v151 = 0u;
  v152 = 0u;
  v153 = 0u;
  v154 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v151, v161, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v152;
    v21 = 1;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v152 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v151 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("Size"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "intValue");

        v21 *= v24;
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v151, v161, 16);
    }
    while (v19);
  }
  else
  {
    v21 = 1;
  }

  v119 = v13;
  if (objc_msgSend(v13, "size") != v21)
    goto LABEL_54;
  objc_msgSend(v17, "objectAtIndexedSubscript:", v120 - 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("Size"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = objc_msgSend(v26, "intValue");

  if (v120 < 2)
  {
    v28 = 1;
  }
  else
  {
    v27 = 0;
    v28 = 1;
    do
    {
      objc_msgSend(v17, "objectAtIndexedSubscript:", v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("Size"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v28 *= objc_msgSend(v30, "intValue");

      ++v27;
    }
    while (v120 - 1 != v27);
  }
  v121 = v28;
  v136 = -[CMIFFTExecutor _getMetalPrecisionType:](v137, "_getMetalPrecisionType:", a6);
  if (v136 < 0 || (v31 = -[CMIFFTExecutor _getMetalLayoutType:](v137, "_getMetalLayoutType:", a5), v31 < 0))
  {
LABEL_54:
    v104 = 0;
    goto LABEL_55;
  }
  v32 = v31;
  v130 = v17;
  v125 = v21;
  v159 = 0uLL;
  v160 = 0;
  encode = v137->_encode;
  -[NSArray objectAtIndexedSubscript:](v137->_workingBuffers, "objectAtIndexedSubscript:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](v137->_workingBuffers, "objectAtIndexedSubscript:", 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = v136;
  v140 = 2;
  v141 = 1;
  v142 = v28;
  *(_OWORD *)v143 = xmmword_1D3305260;
  *(_QWORD *)&v143[16] = v132;
  v144 = 0;
  v145 = v28;
  v146 = v132;
  v147 = 0uLL;
  v148 = 0;
  v131 = v32;
  v149 = v32;
  v128 = v21;
  v150 = v21;
  v36 = -[CMIFFTEncode encodeTransposeBuffer2D:inputBuffer:outputBuffer:bufferOffset:batchSize:config:](encode, "encodeTransposeBuffer2D:inputBuffer:outputBuffer:bufferOffset:batchSize:config:", v138, v34, v35, 0, a9, &v139);

  if (v36)
    goto LABEL_56;
  -[NSArray objectAtIndexedSubscript:](v137->_workingBuffers, "objectAtIndexedSubscript:", 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMIFFTExecutor _reorderWorkingBuffersFromBuffer:](v137, "_reorderWorkingBuffersFromBuffer:", v37);

  objc_msgSend(v130, "objectAtIndexedSubscript:", v120 - 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("Factor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (int)objc_msgSend(v39, "intValue");

  v41 = v137->_encode;
  -[NSArray objectAtIndexedSubscript:](v137->_workingBuffers, "objectAtIndexedSubscript:", 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](v137->_workingBuffers, "objectAtIndexedSubscript:", 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = v136;
  v140 = 0;
  v141 = v132;
  v142 = v40;
  *(_QWORD *)v143 = v127;
  *(_OWORD *)&v143[8] = xmmword_1D3305260;
  v144 = v132;
  v145 = v21;
  -[CMIFFTEncode encode1DTransform:inputBuffer:scratchBuffer:batchSize:depthBatchSize:bufferOffset:config:](v41, "encode1DTransform:inputBuffer:scratchBuffer:batchSize:depthBatchSize:bufferOffset:config:", v138, v42, v43, v28, a9, 0, &v139);
  v44 = objc_claimAutoreleasedReturnValue();

  if (!v44)
  {
LABEL_56:
    v104 = 0;
    v103 = 0;
    v17 = v130;
    goto LABEL_53;
  }
  v45 = v137->_encode;
  v139 = v136;
  v140 = v32;
  v141 = v21;
  v142 = v127;
  if (-[CMIFFTEncode encodeApplyTwiddles:inputBuffer:config:N1:N2:bufferOffset:batchSize:](v45, "encodeApplyTwiddles:inputBuffer:config:N1:N2:bufferOffset:batchSize:", v138, v44, &v139, v132, v28, 0, a9))
  {
    v103 = 0;
    v17 = v130;
    v104 = (void *)v44;
    goto LABEL_53;
  }
  v135 = (void *)v44;
  -[CMIFFTExecutor _reorderWorkingBuffersFromBuffer:](v137, "_reorderWorkingBuffersFromBuffer:", v44);
  v46 = v137->_encode;
  -[NSArray objectAtIndexedSubscript:](v137->_workingBuffers, "objectAtIndexedSubscript:", 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](v137->_workingBuffers, "objectAtIndexedSubscript:", 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = v136;
  v140 = 2;
  v141 = 1;
  v142 = v132;
  *(_OWORD *)v143 = xmmword_1D3305260;
  *(_QWORD *)&v143[16] = v28;
  v144 = 0;
  v145 = v132;
  v146 = v28;
  v147 = 0uLL;
  v148 = 0;
  v149 = v32;
  v150 = v21;
  v49 = -[CMIFFTEncode encodeTransposeBuffer2D:inputBuffer:outputBuffer:bufferOffset:batchSize:config:](v46, "encodeTransposeBuffer2D:inputBuffer:outputBuffer:bufferOffset:batchSize:config:", v138, v47, v48, 0, a9, &v139);

  if (!v49)
  {
    v50 = v136;
    -[NSArray objectAtIndexedSubscript:](v137->_workingBuffers, "objectAtIndexedSubscript:", 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMIFFTExecutor _reorderWorkingBuffersFromBuffer:](v137, "_reorderWorkingBuffersFromBuffer:", v51);

    v52 = v120 - 2;
    v123 = v121;
    v17 = v130;
    while (v52 >= 1)
    {
      objc_msgSend(v17, "objectAtIndexedSubscript:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("Size"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v122 = objc_msgSend(v54, "intValue");

      v55 = 0;
      v56 = 1;
      do
      {
        objc_msgSend(v17, "objectAtIndexedSubscript:", v55);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("Size"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v56 *= objc_msgSend(v58, "intValue");

        ++v55;
      }
      while (v52 != v55);
      v59 = v137;
      -[NSArray objectAtIndexedSubscript:](v137->_workingBuffers, "objectAtIndexedSubscript:", 0);
      v157 = objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](v137->_workingBuffers, "objectAtIndexedSubscript:", 1);
      v60 = objc_claimAutoreleasedReturnValue();
      v158 = (void *)v60;
      if (v132 < 1)
      {
        v92 = v60;
        v63 = 0;
LABEL_35:
        -[CMIFFTExecutor _reorderWorkingBuffersFromBuffer:](v59, "_reorderWorkingBuffersFromBuffer:", v92);
        v132 *= v122;
        --v52;
        v123 /= v122;
      }
      else
      {
        v61 = 0;
        v62 = 0;
        v129 = v56;
        v63 = 1;
        v64 = v135;
        v65 = v131;
        while (1)
        {
          v135 = v64;
          v134 = v62;
          -[NSArray objectAtIndexedSubscript:](v59->_workingBuffers, "objectAtIndexedSubscript:", 0);
          v66 = objc_claimAutoreleasedReturnValue();
          v67 = (void *)v157;
          v157 = v66;

          -[NSArray objectAtIndexedSubscript:](v59->_workingBuffers, "objectAtIndexedSubscript:", 1);
          v68 = objc_claimAutoreleasedReturnValue();
          v69 = v158;
          v158 = (void *)v68;

          v70 = -[CMIFFTExecutor _getStrideForPrecisionType:](v59, "_getStrideForPrecisionType:", a6);
          v71 = v59->_encode;
          v72 = v61 * v70;
          v139 = v50;
          v140 = 2;
          v141 = 1;
          v142 = v129;
          *(_OWORD *)v143 = xmmword_1D3305260;
          *(_QWORD *)&v143[16] = v122;
          v144 = 0;
          v145 = v129;
          v146 = v122;
          v147 = v159;
          v148 = v160;
          v149 = v65;
          v150 = v128;
          if (-[CMIFFTEncode encodeTransposeBuffer2D:inputBuffer:outputBuffer:bufferOffset:batchSize:config:](v71, "encodeTransposeBuffer2D:inputBuffer:outputBuffer:bufferOffset:batchSize:config:", v138, v157, v158, v72, a9, &v139))
          {
            v50 = v136;
            goto LABEL_36;
          }
          v133 = v61;
          v124 = v63;
          v156[0] = v157;
          v156[1] = v158;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v156, 2);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          -[CMIFFTExecutor _reorderBuffers:mostRecentBuffer:](v137, "_reorderBuffers:mostRecentBuffer:", v73, v158);
          v74 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v74, "objectAtIndexedSubscript:", 0);
          v75 = objc_claimAutoreleasedReturnValue();
          v76 = (void *)v157;
          v157 = v75;

          objc_msgSend(v74, "objectAtIndexedSubscript:", 1);
          v77 = objc_claimAutoreleasedReturnValue();
          v78 = v158;
          v158 = (void *)v77;

          objc_msgSend(v17, "objectAtIndexedSubscript:", v52);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("Factor"));
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = (int)objc_msgSend(v80, "intValue");

          v82 = v137->_encode;
          v139 = v136;
          v140 = 0;
          v141 = v122;
          v142 = v81;
          *(_QWORD *)v143 = v127;
          *(_OWORD *)&v143[8] = xmmword_1D3305260;
          v144 = v122;
          v145 = v128;
          -[CMIFFTEncode encode1DTransform:inputBuffer:scratchBuffer:batchSize:depthBatchSize:bufferOffset:config:](v82, "encode1DTransform:inputBuffer:scratchBuffer:batchSize:depthBatchSize:bufferOffset:config:", v138, v157, v158, v129, a9, v72, &v139);
          v83 = objc_claimAutoreleasedReturnValue();

          if (!v83
            || (v84 = v137->_encode,
                v139 = v136,
                v65 = v131,
                v140 = v131,
                v141 = v128,
                v142 = v127,
                -[CMIFFTEncode encodeApplyTwiddles:inputBuffer:config:N1:N2:bufferOffset:batchSize:](v84, "encodeApplyTwiddles:inputBuffer:config:N1:N2:bufferOffset:batchSize:", v138, v83, &v139, v122, v129, v72, a9)))
          {
            v135 = (void *)v83;
            v17 = v130;
            v21 = v125;
            v50 = v136;
            v86 = v74;
            goto LABEL_43;
          }
          v155[0] = v157;
          v155[1] = v158;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v155, 2);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          -[CMIFFTExecutor _reorderBuffers:mostRecentBuffer:](v137, "_reorderBuffers:mostRecentBuffer:", v85, v83);
          v86 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v86, "objectAtIndexedSubscript:", 0);
          v87 = objc_claimAutoreleasedReturnValue();
          v88 = (void *)v157;
          v157 = v87;

          objc_msgSend(v86, "objectAtIndexedSubscript:", 1);
          v89 = objc_claimAutoreleasedReturnValue();
          v90 = v158;
          v158 = (void *)v89;

          v91 = v137->_encode;
          v50 = v136;
          v139 = v136;
          v140 = 2;
          v141 = 1;
          v142 = v122;
          *(_OWORD *)v143 = xmmword_1D3305260;
          *(_QWORD *)&v143[16] = v129;
          v144 = 0;
          v145 = v122;
          v146 = v129;
          v147 = v159;
          v148 = v160;
          v149 = v131;
          v150 = v128;
          v17 = v130;
          if (-[CMIFFTEncode encodeTransposeBuffer2D:inputBuffer:outputBuffer:bufferOffset:batchSize:config:](v91, "encodeTransposeBuffer2D:inputBuffer:outputBuffer:bufferOffset:batchSize:config:", v138, v157, v158, v72, a9, &v139))
          {
            break;
          }

          v62 = v134 + 1;
          v63 = v134 + 1 < v132;
          v61 = v133 + 2 * v123;
          v64 = (void *)v83;
          v59 = v137;
          v21 = v125;
          if (v132 == v134 + 1)
          {
            v135 = (void *)v83;
            v92 = (uint64_t)v158;
            goto LABEL_35;
          }
        }
        v135 = (void *)v83;
        v21 = v125;
LABEL_43:

        v63 = v124;
      }
LABEL_36:
      for (j = 8; j != -8; j -= 8)

      if (v63)
      {
        v103 = 0;
        goto LABEL_48;
      }
    }
    v94 = v52;
    objc_msgSend(v17, "objectAtIndexedSubscript:", v52);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("Size"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v96, "intValue");

    if (v52 + 1 >= v120)
    {
      v100 = 1;
    }
    else
    {
      v98 = v52 + 1;
      v99 = ~v52 + v120;
      v100 = 1;
      do
      {
        objc_msgSend(v17, "objectAtIndexedSubscript:", v98);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("Size"));
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        v100 *= objc_msgSend(v102, "intValue");

        v17 = v130;
        ++v98;
        --v99;
      }
      while (v99);
    }
    v105 = v97;
    objc_msgSend(v17, "objectAtIndexedSubscript:", v94);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("Factor"));
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = (int)objc_msgSend(v107, "intValue");

    v109 = v137->_encode;
    -[NSArray objectAtIndexedSubscript:](v137->_workingBuffers, "objectAtIndexedSubscript:", 0);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](v137->_workingBuffers, "objectAtIndexedSubscript:", 1);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = v136;
    v140 = 0;
    v141 = v105;
    v142 = v108;
    *(_QWORD *)v143 = v127;
    *(_OWORD *)&v143[8] = xmmword_1D3305260;
    v144 = v105;
    v145 = v128;
    -[CMIFFTEncode encode1DTransform:inputBuffer:scratchBuffer:batchSize:depthBatchSize:bufferOffset:config:](v109, "encode1DTransform:inputBuffer:scratchBuffer:batchSize:depthBatchSize:bufferOffset:config:", v138, v110, v111, v100, a9, 0, &v139);
    v104 = (void *)objc_claimAutoreleasedReturnValue();

    if (v104)
    {
      -[CMIFFTExecutor _reorderWorkingBuffersFromBuffer:](v137, "_reorderWorkingBuffersFromBuffer:", v104);
      v112 = v137->_encode;
      -[NSArray objectAtIndexedSubscript:](v137->_workingBuffers, "objectAtIndexedSubscript:", 0);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](v137->_workingBuffers, "objectAtIndexedSubscript:", 1);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = v136;
      v140 = v131;
      v141 = __PAIR64__(v121, v21);
      v142 = __PAIR64__(v120, v100);
      *(_QWORD *)v143 = v128;
      v115 = -[CMIFFTEncode encodeUnscrambleMixedRadix:inputBuffer:outputBuffer:config:sizes:bufferoffset:batchSize:](v112, "encodeUnscrambleMixedRadix:inputBuffer:outputBuffer:config:sizes:bufferoffset:batchSize:", v138, v113, v114, &v139, v17, 0, a9);

      if (!v115)
      {
        -[NSArray objectAtIndexedSubscript:](v137->_workingBuffers, "objectAtIndexedSubscript:", 1);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_53;
      }
    }
LABEL_55:
    v103 = 0;
    goto LABEL_53;
  }
  v103 = 0;
  v17 = v130;
LABEL_48:
  v104 = v135;
LABEL_53:

  return v103;
}

BOOL __99__CMIFFTExecutor__execute1DMixedRadix_dimension_layout_precision_direction_primeFactors_batchSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  int v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("Size"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Size"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "intValue");
  return (int)v4 < v6;
}

- (id)_execute1DSingleRadix:(id)a3 dimension:(id)a4 layout:(int64_t)a5 precision:(int64_t)a6 direction:(int64_t)a7 radix:(unint64_t)a8 batchSize:(unint64_t)a9
{
  int v10;
  id v14;
  id v15;
  int v16;
  int v17;
  uint64_t v18;
  CMIFFTEncode *encode;
  void *v20;
  void *v21;
  void *v22;
  _DWORD v24[2];
  uint64_t v25;
  unint64_t v26;
  int v27;
  int v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;

  v10 = a7;
  v14 = a3;
  v15 = a4;
  v16 = -[CMIFFTExecutor _getMetalPrecisionType:](self, "_getMetalPrecisionType:", a6);
  if (v16 < 0)
  {
    v22 = 0;
  }
  else
  {
    v17 = v16;
    v18 = objc_msgSend(v15, "size");
    encode = self->_encode;
    -[NSArray objectAtIndexedSubscript:](self->_workingBuffers, "objectAtIndexedSubscript:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](self->_workingBuffers, "objectAtIndexedSubscript:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v17;
    v24[1] = 0;
    v25 = v18;
    v26 = a8;
    v27 = v10;
    v28 = 0;
    v29 = xmmword_1D3305260;
    v30 = v18;
    v31 = 0;
    -[CMIFFTEncode encode1DTransform:inputBuffer:scratchBuffer:batchSize:depthBatchSize:bufferOffset:config:](encode, "encode1DTransform:inputBuffer:scratchBuffer:batchSize:depthBatchSize:bufferOffset:config:", v14, v20, v21, a9, 1, 0, v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v22;
}

- (int64_t)_execute1DTransform:(id)a3 dimensions:(id)a4 layout:(int64_t)a5 precision:(int64_t)a6 direction:(int64_t)a7 batchSize:(unint64_t)a8
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int64_t v23;
  CMIFFTExecutor *v24;
  int v25;
  int v26;
  int v27;
  int v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  void *v33;
  void *v34;
  MTLBuffer *v35;
  void *v36;
  uint64_t v37;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  CMIFFTEncode *encode;
  id v44;
  void *v48;
  _OWORD v50[2];
  _DWORD v51[2];
  uint64_t v52;
  uint64_t v53;
  int64x2_t v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v44 = a4;
  objc_msgSend(v44, "objectAtIndexedSubscript:", 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "primeFactors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMIFFTPrime getSupportedPrimeFactors](CMIFFTPrime, "getSupportedPrimeFactors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v58 != v17)
          objc_enumerationMutation(v13);
        v19 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20 && (int)objc_msgSend(v20, "intValue") >= 1)
        {
          objc_msgSend(v12, "arrayByAddingObject:", v19);
          v22 = objc_claimAutoreleasedReturnValue();

          ++v16;
          v12 = (void *)v22;
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    }
    while (v15);
  }
  else
  {
    v16 = 0;
  }
  v23 = -73471;

  v24 = self;
  if (a5 == 1)
  {
    v25 = -[CMIFFTExecutor _getMetalPrecisionType:](self, "_getMetalPrecisionType:", a6);
    if (v25 < 0)
      goto LABEL_30;
    v26 = v25;
    v27 = -[CMIFFTExecutor _getMetalLayoutType:](self, "_getMetalLayoutType:", 1);
    if (v27 < 0)
      goto LABEL_30;
    v28 = v27;
    v41 = objc_msgSend(v48, "size");
    v39 = 2 * objc_msgSend(v48, "size");
    encode = self->_encode;
    -[NSArray objectAtIndexedSubscript:](self->_workingBuffers, "objectAtIndexedSubscript:", 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](self->_workingBuffers, "objectAtIndexedSubscript:", 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v30 = objc_msgSend(v48, "size");
    *((_QWORD *)&v30 + 1) = a8;
    *(_QWORD *)&v31 = 1;
    v51[0] = v26;
    v51[1] = v28;
    v52 = 1;
    v53 = v41;
    v54 = vdupq_n_s64(1uLL);
    v55 = v39;
    v56 = 1;
    v50[0] = v30;
    v50[1] = v31;
    v23 = -[CMIFFTEncode encodeRealToComplexShim:inputBuffer:outputBuffer:config:sizes:](encode, "encodeRealToComplexShim:inputBuffer:outputBuffer:config:sizes:", v9, v40, v29, v51, v50);

    if (v23)
      goto LABEL_30;
    -[NSArray objectAtIndexedSubscript:](self->_workingBuffers, "objectAtIndexedSubscript:", 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMIFFTExecutor _reorderWorkingBuffersFromBuffer:](self, "_reorderWorkingBuffersFromBuffer:", v32);

    v24 = self;
    v23 = -73471;
  }
  if (v16 == 2)
  {
    v34 = v48;
    -[CMIFFTExecutor _execute1DTwoRadix:dimension:layout:precision:direction:primeFactors:batchSize:](v24, "_execute1DTwoRadix:dimension:layout:precision:direction:primeFactors:batchSize:", v9, v48, a5, a6, a7, v10, a8);
    v37 = objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  if (v16 != 1)
  {
    if (v16 >= 3)
    {
      v34 = v48;
      -[CMIFFTExecutor _execute1DMixedRadix:dimension:layout:precision:direction:primeFactors:batchSize:](v24, "_execute1DMixedRadix:dimension:layout:precision:direction:primeFactors:batchSize:", v9, v48, a5, a6, a7, v10, a8);
      v37 = objc_claimAutoreleasedReturnValue();
LABEL_25:
      v35 = (MTLBuffer *)v37;
      v36 = v44;
      if (!v37)
        goto LABEL_21;
      goto LABEL_26;
    }
LABEL_30:
    v35 = 0;
    v36 = v44;
    v34 = v48;
    goto LABEL_29;
  }
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v48;
  -[CMIFFTExecutor _execute1DSingleRadix:dimension:layout:precision:direction:radix:batchSize:](v24, "_execute1DSingleRadix:dimension:layout:precision:direction:radix:batchSize:", v9, v48, a5, a6, a7, (int)objc_msgSend(v33, "intValue"), a8);
  v35 = (MTLBuffer *)objc_claimAutoreleasedReturnValue();

  v36 = v44;
  if (!v35)
  {
LABEL_21:
    v23 = -73470;
    goto LABEL_29;
  }
LABEL_26:
  if (v35 != v24->_inputBuffer)
    -[CMIFFTExecutor copyBufferAToBufferB:bufferA:bufferB:](v24, "copyBufferAToBufferB:bufferA:bufferB:", v9, v35);
  v23 = 0;
LABEL_29:

  return v23;
}

- (int64_t)_execute2DTransform:(id)a3 dimensions:(id)a4 layout:(int64_t)a5 precision:(int64_t)a6 direction:(int64_t)a7
{
  int64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  CMIFFTEncode *encode;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  CMIFFTEncode *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  uint64_t v46;
  CMIFFTExecutor *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  CMIFFTEncode *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  uint64_t j;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  int v71;
  void *v72;
  uint64_t v73;
  CMIFFTExecutor *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  MTLBuffer *v83;
  MTLBuffer *inputBuffer;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  int64_t v92;
  int v94;
  int v95;
  uint64_t v96;
  CMIFFTExecutor *v97;
  uint64_t v98;
  id v99;
  void *v100;
  CMIFFTEncode *v102;
  void *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  int v108;
  int v109;
  uint64_t v110;
  uint64_t v111;
  int64x2_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  __int128 v117;
  int v118;
  int v119;
  uint64_t v120;
  _OWORD v121[2];
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _BYTE v126[128];
  __int128 v127;
  int v128;
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  v10 = -73471;
  v11 = a3;
  v12 = a4;
  +[CMIFFTPrime getSupportedPrimeFactors](CMIFFTPrime, "getSupportedPrimeFactors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") != 2)
  {
    v20 = 0;
    v103 = 0;
    v18 = 0;
    v51 = 0;
    goto LABEL_49;
  }
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = objc_msgSend(v14, "size");

  objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "size");

  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "primeFactors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "primeFactors");
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  v95 = -[CMIFFTExecutor _getMetalPrecisionType:](self, "_getMetalPrecisionType:", a6);
  if (v95 < 0 || (v94 = -[CMIFFTExecutor _getMetalLayoutType:](self, "_getMetalLayoutType:", a5), v94 < 0))
  {
    v20 = 0;
    v51 = 0;
    v10 = 0;
    goto LABEL_49;
  }
  v92 = a6;
  v97 = self;
  v98 = v16;
  v86 = -73471;
  v99 = v11;
  v100 = v12;
  v20 = (void *)objc_opt_new();
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v91 = v13;
  v21 = v13;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v122, v129, 16);
  if (v22)
  {
    v23 = v22;
    v24 = 0;
    v25 = *(_QWORD *)v123;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v123 != v25)
          objc_enumerationMutation(v21);
        v27 = *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * i);
        objc_msgSend(v18, "objectForKeyedSubscript:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v28 && (int)objc_msgSend(v28, "intValue") >= 1)
        {
          objc_msgSend(v20, "arrayByAddingObject:", v27);
          v30 = objc_claimAutoreleasedReturnValue();

          ++v24;
          v20 = (void *)v30;
        }

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v122, v129, 16);
    }
    while (v23);
  }
  else
  {
    v24 = 0;
  }

  v12 = v100;
  if (a5 == 1)
  {
    objc_msgSend(v100, "objectAtIndexedSubscript:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v31, "size");

    objc_msgSend(v100, "objectAtIndexedSubscript:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 2 * objc_msgSend(v32, "size");

    encode = v97->_encode;
    -[NSArray objectAtIndexedSubscript:](v97->_workingBuffers, "objectAtIndexedSubscript:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](v97->_workingBuffers, "objectAtIndexedSubscript:", 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v37 = v96;
    *((_QWORD *)&v37 + 1) = v98;
    *(_QWORD *)&v38 = 1;
    v108 = v95;
    v109 = v94;
    v110 = 1;
    v111 = v88;
    v112 = vdupq_n_s64(1uLL);
    v113 = v33;
    v114 = 1;
    v121[0] = v37;
    v121[1] = v38;
    v39 = encode;
    v40 = v99;
    v41 = -[CMIFFTEncode encodeRealToComplexShim:inputBuffer:outputBuffer:config:sizes:](v39, "encodeRealToComplexShim:inputBuffer:outputBuffer:config:sizes:", v99, v35, v36, &v108, v121);

    if (v41)
    {
      v51 = 0;
      v10 = v41;
      v12 = v100;
      v13 = v91;
      goto LABEL_52;
    }
    -[NSArray objectAtIndexedSubscript:](v97->_workingBuffers, "objectAtIndexedSubscript:", 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMIFFTExecutor _reorderWorkingBuffersFromBuffer:](v97, "_reorderWorkingBuffersFromBuffer:", v42);

    v12 = v100;
  }
  if (v24 != 1)
  {
    v48 = v98;
    v11 = v99;
    if (v24 < 2)
    {
      v51 = 0;
      v13 = v91;
      goto LABEL_48;
    }
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v49 = v99;
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "primeFactors");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v97;
    -[CMIFFTExecutor _execute1DMixedRadix:dimension:layout:precision:direction:primeFactors:batchSize:](v97, "_execute1DMixedRadix:dimension:layout:precision:direction:primeFactors:batchSize:", v99, v89, a5, v92, a7, v53, v98);
    v50 = objc_claimAutoreleasedReturnValue();

    if (!v50)
      goto LABEL_21;
LABEL_24:
    v90 = (void *)v50;
    -[CMIFFTExecutor _reorderWorkingBuffersFromBuffer:](v47, "_reorderWorkingBuffersFromBuffer:", v50);
    v127 = 0uLL;
    v128 = 0;
    v54 = v47->_encode;
    -[NSArray objectAtIndexedSubscript:](v47->_workingBuffers, "objectAtIndexedSubscript:", 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](v47->_workingBuffers, "objectAtIndexedSubscript:", 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = v95;
    v109 = 2;
    v110 = 1;
    v111 = v96;
    v112 = (int64x2_t)xmmword_1D3305260;
    v113 = v48;
    v114 = 0;
    v115 = v96;
    v116 = v48;
    v117 = 0uLL;
    v118 = 0;
    v119 = v94;
    v120 = 0;
    v57 = v49;
    v58 = -[CMIFFTEncode encodeTransposeBuffer2D:inputBuffer:outputBuffer:bufferOffset:batchSize:config:](v54, "encodeTransposeBuffer2D:inputBuffer:outputBuffer:bufferOffset:batchSize:config:", v49, v55, v56, 0, 1, &v108);

    if (v58)
    {
      v10 = v58;
      v51 = v90;
      v13 = v91;
      goto LABEL_38;
    }
    -[NSArray objectAtIndexedSubscript:](v47->_workingBuffers, "objectAtIndexedSubscript:", 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMIFFTExecutor _reorderWorkingBuffersFromBuffer:](v47, "_reorderWorkingBuffersFromBuffer:", v59);

    v20 = (void *)objc_opt_new();
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v60 = v21;
    v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v104, v126, 16);
    if (!v61)
    {
      v13 = v91;
      v11 = v57;
LABEL_46:
      v51 = v90;

      v10 = v86;
      goto LABEL_49;
    }
    v62 = v61;
    v63 = 0;
    v64 = *(_QWORD *)v105;
    do
    {
      for (j = 0; j != v62; ++j)
      {
        if (*(_QWORD *)v105 != v64)
          objc_enumerationMutation(v60);
        v66 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * j);
        objc_msgSend(v103, "objectForKeyedSubscript:", v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = v67;
        if (v67 && (int)objc_msgSend(v67, "intValue") >= 1)
        {
          objc_msgSend(v20, "arrayByAddingObject:", v66);
          v69 = objc_claimAutoreleasedReturnValue();

          ++v63;
          v20 = (void *)v69;
        }

      }
      v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v104, v126, 16);
    }
    while (v62);

    if (v63 == 1)
    {
      objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v70, "intValue");

      v12 = v100;
      objc_msgSend(v100, "objectAtIndexedSubscript:", 1);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v96;
      v74 = v97;
      v57 = v99;
      -[CMIFFTExecutor _execute1DSingleRadix:dimension:layout:precision:direction:radix:batchSize:](v97, "_execute1DSingleRadix:dimension:layout:precision:direction:radix:batchSize:", v99, v72, a5, v92, a7, v71, v96);
      v75 = objc_claimAutoreleasedReturnValue();

      v76 = (void *)v75;
      v77 = v98;
      if (!v75)
      {
LABEL_37:
        v51 = 0;
        v10 = -73470;
        v13 = v91;
LABEL_38:
        v11 = v57;
        goto LABEL_49;
      }
      goto LABEL_43;
    }
    v11 = v99;
    v12 = v100;
    v77 = v98;
    if (v63 >= 2)
    {
      objc_msgSend(v100, "objectAtIndexedSubscript:", 1);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "objectAtIndexedSubscript:", 1);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "primeFactors");
      v57 = v99;
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v96;
      v74 = v97;
      -[CMIFFTExecutor _execute1DMixedRadix:dimension:layout:precision:direction:primeFactors:batchSize:](v97, "_execute1DMixedRadix:dimension:layout:precision:direction:primeFactors:batchSize:", v99, v87, a5, v92, a7, v79, v96);
      v80 = objc_claimAutoreleasedReturnValue();

      v76 = (void *)v80;
      if (!v80)
        goto LABEL_37;
LABEL_43:
      v90 = v76;
      -[CMIFFTExecutor _reorderWorkingBuffersFromBuffer:](v74, "_reorderWorkingBuffersFromBuffer:");
      v102 = v74->_encode;
      -[NSArray objectAtIndexedSubscript:](v74->_workingBuffers, "objectAtIndexedSubscript:", 0);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](v74->_workingBuffers, "objectAtIndexedSubscript:", 1);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = v95;
      v109 = 2;
      v110 = 1;
      v111 = v77;
      v112 = (int64x2_t)xmmword_1D3305260;
      v113 = v73;
      v114 = 0;
      v115 = v77;
      v116 = v73;
      v117 = v127;
      v118 = v128;
      v119 = v94;
      v120 = 0;
      v40 = v57;
      v10 = -[CMIFFTEncode encodeTransposeBuffer2D:inputBuffer:outputBuffer:bufferOffset:batchSize:config:](v102, "encodeTransposeBuffer2D:inputBuffer:outputBuffer:bufferOffset:batchSize:config:", v57, v81, v82, 0, 1, &v108);

      if (!v10)
      {
        -[NSArray objectAtIndexedSubscript:](v74->_workingBuffers, "objectAtIndexedSubscript:", 1);
        v83 = (MTLBuffer *)objc_claimAutoreleasedReturnValue();
        inputBuffer = v74->_inputBuffer;

        if (v83 != inputBuffer)
        {
          -[NSArray objectAtIndexedSubscript:](v74->_workingBuffers, "objectAtIndexedSubscript:", 1);
          v60 = (id)objc_claimAutoreleasedReturnValue();
          v11 = v57;
          -[CMIFFTExecutor copyBufferAToBufferB:bufferA:bufferB:](v74, "copyBufferAToBufferB:bufferA:bufferB:", v57, v60, v74->_inputBuffer);
          v86 = 0;
          v13 = v91;
          goto LABEL_46;
        }
        v10 = 0;
      }
      v51 = v90;
      v13 = v91;
LABEL_52:
      v11 = v40;
      goto LABEL_49;
    }
    v51 = v90;
    v13 = v91;
LABEL_48:
    v10 = -73471;
    goto LABEL_49;
  }
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "intValue");

  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v44;
  v47 = v97;
  v48 = v98;
  v49 = v99;
  -[CMIFFTExecutor _execute1DSingleRadix:dimension:layout:precision:direction:radix:batchSize:](v97, "_execute1DSingleRadix:dimension:layout:precision:direction:radix:batchSize:", v99, v45, a5, v92, a7, v46, v98);
  v50 = objc_claimAutoreleasedReturnValue();

  if (v50)
    goto LABEL_24;
LABEL_21:
  v51 = 0;
  v10 = -73470;
  v13 = v91;
  v11 = v49;
LABEL_49:

  return v10;
}

- (int64_t)executeTransform:(id)a3 dimensions:(id)a4 inputBuffer:(id)a5 layout:(int64_t)a6 precision:(int64_t)a7 direction:(int64_t)a8 batchSize:(unint64_t)a9
{
  id v15;
  id v16;
  id v17;
  int64_t v18;
  uint64_t v19;
  unint64_t v20;
  int64_t v21;
  id v23;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  objc_storeStrong((id *)&self->_inputBuffer, a5);
  v18 = -[CMIFFTExecutor _allocateWorkingMemory:layout:precision:inputBuffer:batchSize:](self, "_allocateWorkingMemory:layout:precision:inputBuffer:batchSize:", v16, a6, a7, v17, a9);
  if (v18)
    goto LABEL_12;
  v19 = objc_msgSend(v16, "count");
  if (v19 != 2)
  {
    if (v19 == 1)
    {
      v18 = -[CMIFFTExecutor _execute1DTransform:dimensions:layout:precision:direction:batchSize:](self, "_execute1DTransform:dimensions:layout:precision:direction:batchSize:", v15, v16, a6, a7, a8, a9);
      if (!v18)
        goto LABEL_5;
LABEL_12:
      v21 = v18;
      goto LABEL_14;
    }
LABEL_13:
    v21 = -1;
    goto LABEL_14;
  }
  if (a9 != 1)
    goto LABEL_13;
  v18 = -[CMIFFTExecutor _execute2DTransform:dimensions:layout:precision:direction:](self, "_execute2DTransform:dimensions:layout:precision:direction:", v15, v16, a6, a7, a8);
  if (v18)
    goto LABEL_12;
LABEL_5:
  if (-[NSArray count](self->_toDecrementFig, "count") && -[NSArray count](self->_toDecrementFig, "count"))
  {
    v20 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_toDecrementFig, "objectAtIndexedSubscript:", v20);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      FigMetalDecRef(&v23);

      ++v20;
    }
    while (-[NSArray count](self->_toDecrementFig, "count") > v20);
  }
  v21 = 0;
LABEL_14:

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toDecrementFig, 0);
  objc_storeStrong((id *)&self->_encode, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_workingBuffers, 0);
  objc_storeStrong((id *)&self->_inputBuffer, 0);
}

@end
