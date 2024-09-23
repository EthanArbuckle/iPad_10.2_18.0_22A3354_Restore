@implementation _ANEChainingRequest

- (_ANEChainingRequest)initWithInputs:(id)a3 outputs:(id)a4 lbInputSymbolId:(id)a5 lbOutputSymbolId:(id)a6 procedureIndex:(id)a7 signalEvents:(id)a8 transactionHandle:(id)a9 fwEnqueueDelay:(id)a10 memoryPoolId:(id)a11
{
  id v18;
  _ANEChainingRequest *v19;
  _ANEChainingRequest *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v28 = a4;
  v27 = a5;
  v26 = a6;
  v25 = a7;
  v24 = a8;
  v23 = a9;
  v22 = a10;
  v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)_ANEChainingRequest;
  v19 = -[_ANEChainingRequest init](&v30, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_inputBuffer, a3);
    objc_storeStrong((id *)&v20->_outputSets, a4);
    objc_storeStrong((id *)&v20->_loopbackInputSymbolIndex, a5);
    objc_storeStrong((id *)&v20->_loopbackOutputSymbolIndex, a6);
    objc_storeStrong((id *)&v20->_procedureIndex, a7);
    objc_storeStrong((id *)&v20->_signalEvents, a8);
    objc_storeStrong((id *)&v20->_transactionHandle, a9);
    objc_storeStrong((id *)&v20->_fwEnqueueDelay, a10);
    objc_storeStrong((id *)&v20->_memoryPoolId, a11);
  }

  return v20;
}

+ (id)chainingRequestWithInputs:(id)a3 outputSets:(id)a4 lbInputSymbolId:(id)a5 lbOutputSymbolId:(id)a6 procedureIndex:(id)a7 signalEvents:(id)a8 transactionHandle:(id)a9 fwEnqueueDelay:(id)a10 memoryPoolId:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;

  v18 = a11;
  v19 = a10;
  v20 = a9;
  v21 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a5;
  v25 = a4;
  v26 = a3;
  v27 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInputs:outputs:lbInputSymbolId:lbOutputSymbolId:procedureIndex:signalEvents:transactionHandle:fwEnqueueDelay:memoryPoolId:", v26, v25, v24, v23, v22, v21, v20, v19, v18);

  return v27;
}

- (BOOL)validate
{
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  const char *v38;
  NSObject *v39;
  uint32_t v40;
  void *v41;
  unint64_t v42;
  void *v43;
  unint64_t v44;
  const char *aSelector;
  unsigned int v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  _BYTE v50[30];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  -[_ANEChainingRequest inputBuffer](self, "inputBuffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[_ANEChainingRequest outputSets](self, "outputSets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 && v7)
  {
    if (v5 > 0xFF)
    {
      +[_ANELog common](_ANELog, "common");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[_ANEChainingRequest validate].cold.2();
      goto LABEL_15;
    }
    aSelector = a2;
    v46 = v7;
    v9 = 0;
    do
    {
      -[_ANEChainingRequest inputBuffer](self, "inputBuffer", aSelector);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "symbolIndex");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "unsignedIntegerValue");

      if (v13 >= 0xFF)
      {
        +[_ANELog common](_ANELog, "common");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          goto LABEL_15;
        NSStringFromSelector(aSelector);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[_ANEChainingRequest inputBuffer](self, "inputBuffer");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectAtIndexedSubscript:", v9);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v48 = v33;
        v49 = 1024;
        *(_DWORD *)v50 = v9;
        *(_WORD *)&v50[4] = 2112;
        *(_QWORD *)&v50[6] = v35;
        *(_WORD *)&v50[14] = 2048;
        *(_QWORD *)&v50[16] = v13;
        *(_WORD *)&v50[24] = 1024;
        *(_DWORD *)&v50[26] = 254;
        _os_log_error_impl(&dword_1D3352000, v8, OS_LOG_TYPE_ERROR, "%@: inputBuffer[%u]=%@ symbolIndex=%lu exceeds kANERequestMaxSymbolIndex=%d", buf, 0x2Cu);
LABEL_34:

LABEL_35:
        goto LABEL_15;
      }
      ++v9;
    }
    while (v9 < v5);
    if (v7 > 0xC)
    {
      +[_ANELog common](_ANELog, "common");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[_ANEChainingRequest validate].cold.3();
      goto LABEL_15;
    }
    v15 = 0;
    while (2)
    {
      -[_ANEChainingRequest outputSets](self, "outputSets");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "outputBuffer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (v19)
      {
        if (v19 > 0x100)
        {
          +[_ANELog common](_ANELog, "common");
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            -[_ANEChainingRequest validate].cold.5();
        }
        else
        {
          v20 = 0;
          do
          {
            -[_ANEChainingRequest outputSets](self, "outputSets");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectAtIndexedSubscript:", v15);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v22)
            {
              +[_ANELog common](_ANELog, "common");
              v8 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                -[_ANEChainingRequest validate].cold.6(aSelector, v20, v8);
              goto LABEL_15;
            }
            -[_ANEChainingRequest outputSets](self, "outputSets");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectAtIndexedSubscript:", v15);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "outputBuffer");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectAtIndexedSubscript:", v20);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "symbolIndex");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "unsignedIntegerValue");

            if (v28 >= 0xFF)
            {
              +[_ANELog common](_ANELog, "common");
              v8 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                goto LABEL_15;
              NSStringFromSelector(aSelector);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[_ANEChainingRequest outputSets](self, "outputSets");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "objectAtIndexedSubscript:", v15);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "outputBuffer");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "objectAtIndexedSubscript:", v20);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              v48 = v33;
              v49 = 1024;
              *(_DWORD *)v50 = v15;
              *(_WORD *)&v50[4] = 2112;
              *(_QWORD *)&v50[6] = v37;
              *(_WORD *)&v50[14] = 2048;
              *(_QWORD *)&v50[16] = v28;
              *(_WORD *)&v50[24] = 1024;
              *(_DWORD *)&v50[26] = 254;
              _os_log_error_impl(&dword_1D3352000, v8, OS_LOG_TYPE_ERROR, "%@: outputIndexArray[%u]=%@ symbolIndex=%lu exceeds kANERequestMaxSymbolIndex=%d", buf, 0x2Cu);

              goto LABEL_34;
            }
            ++v20;
          }
          while (v20 < v19);
          v15 = (v15 + 1);
          if (v15 < v46)
            continue;
          -[_ANEChainingRequest loopbackInputSymbolIndex](self, "loopbackInputSymbolIndex");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "count");

          -[_ANEChainingRequest loopbackOutputSymbolIndex](self, "loopbackOutputSymbolIndex");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "count");

          if (v30 != v32)
          {
            +[_ANELog framework](_ANELog, "framework");
            v8 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
              break;
            -[_ANEChainingRequest loopbackInputSymbolIndex](self, "loopbackInputSymbolIndex");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[_ANEChainingRequest loopbackInputSymbolIndex](self, "loopbackInputSymbolIndex");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v48 = v33;
            v49 = 2112;
            *(_QWORD *)v50 = v34;
            *(_WORD *)&v50[8] = 2048;
            *(_QWORD *)&v50[10] = v30;
            *(_WORD *)&v50[18] = 2048;
            *(_QWORD *)&v50[20] = v32;
            v38 = "loopbackInputSymbolIndexCount and loopbackOutputSymbolIndexCount size mismatch. loopbackInputSymbolInd"
                  "ex = %@ : loopbackOutputSymbolIndex = %@ loopbackInputSymbolIndex.count = %lu : loopbackOutputSymbolIndex.count = %lu";
            v39 = v8;
            v40 = 42;
            goto LABEL_42;
          }
          if (v30 >= 0x101)
          {
            +[_ANELog common](_ANELog, "common");
            v8 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
              -[_ANEChainingRequest validate].cold.7();
            break;
          }
          -[_ANEChainingRequest procedureIndex](self, "procedureIndex");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "unsignedIntegerValue");

          if (v42 >= 0x81)
          {
            +[_ANELog common](_ANELog, "common");
            v8 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
              break;
            NSStringFromSelector(aSelector);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[_ANEChainingRequest procedureIndex](self, "procedureIndex");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v48 = v33;
            v49 = 2112;
            *(_QWORD *)v50 = v34;
            *(_WORD *)&v50[8] = 2048;
            *(_QWORD *)&v50[10] = v42;
            *(_WORD *)&v50[18] = 1024;
            *(_DWORD *)&v50[20] = 128;
            v38 = "%@: self.procedureIndex=%@ length=%lu exceeds kANEMaxProcedures=%d";
            v39 = v8;
            v40 = 38;
LABEL_42:
            _os_log_error_impl(&dword_1D3352000, v39, OS_LOG_TYPE_ERROR, v38, buf, v40);
            goto LABEL_35;
          }
          -[_ANEChainingRequest signalEvents](self, "signalEvents");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "count");

          if (v44 < 0x101)
            return 1;
          +[_ANELog common](_ANELog, "common");
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            -[_ANEChainingRequest validate].cold.8();
        }
      }
      else
      {
        +[_ANELog framework](_ANELog, "framework");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[_ANEChainingRequest validate].cold.4(v8);
      }
      break;
    }
  }
  else
  {
    +[_ANELog framework](_ANELog, "framework");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_ANEChainingRequest validate].cold.1(v5, v7, v8);
  }
LABEL_15:

  return 0;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANEChainingRequest inputBuffer](self, "inputBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANEChainingRequest outputSets](self, "outputSets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANEChainingRequest transactionHandle](self, "transactionHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANEChainingRequest procedureIndex](self, "procedureIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { inputBuffer=%@ ; outputSets=%@ ; transactionHandle=%@ ; procedureIndex=%@ }"),
    v5,
    v6,
    v7,
    v8,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[_ANEChainingRequest inputBuffer](self, "inputBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("inputs"));

  -[_ANEChainingRequest outputSets](self, "outputSets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("outputs"));

  -[_ANEChainingRequest loopbackInputSymbolIndex](self, "loopbackInputSymbolIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("loopbackInputs"));

  -[_ANEChainingRequest loopbackOutputSymbolIndex](self, "loopbackOutputSymbolIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("loopbackOutputs"));

  -[_ANEChainingRequest procedureIndex](self, "procedureIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("procedureIndex"));

  -[_ANEChainingRequest signalEvents](self, "signalEvents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("signalEvents"));

  -[_ANEChainingRequest transactionHandle](self, "transactionHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("transactionHandle"));

  -[_ANEChainingRequest fwEnqueueDelay](self, "fwEnqueueDelay");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("fwEnqueueDelay"));

  -[_ANEChainingRequest memoryPoolId](self, "memoryPoolId");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("memoryPoolId"));

}

- (_ANEChainingRequest)initWithCoder:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _ANEChainingRequest *v18;
  _QWORD v19[7];

  v19[6] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  v19[2] = objc_opt_class();
  v19[3] = objc_opt_class();
  v19[4] = objc_opt_class();
  v19[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("inputs"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("outputs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("loopbackInputs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("loopbackOutputs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("signalEvents"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("procedureIndex"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionHandle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fwEnqueueDelay"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("memoryPoolId"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[_ANEChainingRequest initWithInputs:outputs:lbInputSymbolId:lbOutputSymbolId:procedureIndex:signalEvents:transactionHandle:fwEnqueueDelay:memoryPoolId:](self, "initWithInputs:outputs:lbInputSymbolId:lbOutputSymbolId:procedureIndex:signalEvents:transactionHandle:fwEnqueueDelay:memoryPoolId:", v16, v7, v8, v9, v11, v10, v12, v13, v14);
  return v18;
}

- (NSArray)inputBuffer
{
  return self->_inputBuffer;
}

- (NSArray)outputSets
{
  return self->_outputSets;
}

- (NSArray)loopbackInputSymbolIndex
{
  return self->_loopbackInputSymbolIndex;
}

- (NSArray)loopbackOutputSymbolIndex
{
  return self->_loopbackOutputSymbolIndex;
}

- (NSArray)signalEvents
{
  return self->_signalEvents;
}

- (NSNumber)transactionHandle
{
  return self->_transactionHandle;
}

- (NSNumber)procedureIndex
{
  return self->_procedureIndex;
}

- (NSNumber)fwEnqueueDelay
{
  return self->_fwEnqueueDelay;
}

- (NSNumber)memoryPoolId
{
  return self->_memoryPoolId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryPoolId, 0);
  objc_storeStrong((id *)&self->_fwEnqueueDelay, 0);
  objc_storeStrong((id *)&self->_procedureIndex, 0);
  objc_storeStrong((id *)&self->_transactionHandle, 0);
  objc_storeStrong((id *)&self->_signalEvents, 0);
  objc_storeStrong((id *)&self->_loopbackOutputSymbolIndex, 0);
  objc_storeStrong((id *)&self->_loopbackInputSymbolIndex, 0);
  objc_storeStrong((id *)&self->_outputSets, 0);
  objc_storeStrong((id *)&self->_inputBuffer, 0);
}

- (void)validate
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_1D3352000, v2, v3, "%@: SignalEvents[%lu] count exceeds kANEMaxEvents=%d", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_3();
}

@end
