@implementation _ANERequest

- (NSArray)outputArray
{
  return self->_outputArray;
}

- (NSArray)inputArray
{
  return self->_inputArray;
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 88, 1);
}

- (NSNumber)transactionHandle
{
  return self->_transactionHandle;
}

- (_ANEIOSurfaceObject)weightsBuffer
{
  return self->_weightsBuffer;
}

- (BOOL)validate
{
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unint64_t v52;
  void *v53;
  void *v54;
  unint64_t v55;
  NSObject *v56;
  NSObject *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t v63[128];
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  _BYTE v67[30];
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  -[_ANERequest inputArray](self, "inputArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[_ANERequest outputArray](self, "outputArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v5 || !v7)
  {
    +[_ANELog framework](_ANELog, "framework");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[_ANERequest validate].cold.1();
    goto LABEL_36;
  }
  -[_ANERequest inputIndexArray](self, "inputIndexArray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  -[_ANERequest outputIndexArray](self, "outputIndexArray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v9 || !v11)
  {
    +[_ANELog framework](_ANELog, "framework");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[_ANERequest validate].cold.2();
    goto LABEL_36;
  }
  if (v5 > 0xFF || v7 >= 0x100)
  {
    +[_ANELog common](_ANELog, "common");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v65 = v23;
      v66 = 2048;
      *(_QWORD *)v67 = v5;
      *(_WORD *)&v67[8] = 2048;
      *(_QWORD *)&v67[10] = v7;
      *(_WORD *)&v67[18] = 1024;
      *(_DWORD *)&v67[20] = 255;
      v28 = "%@: Either inputArray[%lu] or outputArray[%lu] count is greater than kANEMaxBuffers=%d";
LABEL_24:
      _os_log_error_impl(&dword_1D3352000, v22, OS_LOG_TYPE_ERROR, v28, buf, 0x26u);
      goto LABEL_32;
    }
  }
  else if (v5 == v9)
  {
    if (v7 == v11)
    {
      v12 = 0;
      while (1)
      {
        -[_ANERequest inputIndexArray](self, "inputIndexArray");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "unsignedIntegerValue");

        if (v15 >= 0xFF)
          break;
        if (v5 <= ++v12)
        {
          v16 = 0;
          do
          {
            -[_ANERequest outputIndexArray](self, "outputIndexArray");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectAtIndexedSubscript:", v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "unsignedIntegerValue");

            if (v19 >= 0xFF)
            {
              +[_ANELog common](_ANELog, "common");
              v22 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                goto LABEL_36;
              NSStringFromSelector(a2);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[_ANERequest outputIndexArray](self, "outputIndexArray");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "objectAtIndexedSubscript:", v16);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              v65 = v23;
              v66 = 1024;
              *(_DWORD *)v67 = v16;
              *(_WORD *)&v67[4] = 2112;
              *(_QWORD *)&v67[6] = v29;
              *(_WORD *)&v67[14] = 2048;
              *(_QWORD *)&v67[16] = v19;
              *(_WORD *)&v67[24] = 1024;
              *(_DWORD *)&v67[26] = 254;
              v30 = "%@: outputIndexArray[%u]=%@ length=%lu exceeds kANERequestMaxSymbolIndex=%d";
              goto LABEL_65;
            }
            ++v16;
          }
          while (v7 > v16);
          -[_ANERequest procedureIndex](self, "procedureIndex");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "unsignedIntegerValue");

          if (v21 >= 0x81)
          {
            +[_ANELog common](_ANELog, "common");
            v22 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              goto LABEL_36;
            NSStringFromSelector(a2);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[_ANERequest procedureIndex](self, "procedureIndex");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v65 = v23;
            v66 = 2112;
            *(_QWORD *)v67 = v24;
            *(_WORD *)&v67[8] = 2048;
            *(_QWORD *)&v67[10] = v21;
            *(_WORD *)&v67[18] = 1024;
            *(_DWORD *)&v67[20] = 128;
            v25 = "%@: self.procedureIndex=%@ length=%lu exceeds kANEMaxProcedures=%d";
            v26 = v22;
            v27 = 38;
            goto LABEL_30;
          }
          -[_ANERequest perfStatsArray](self, "perfStatsArray");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "count");

          if (v33)
          {
            v22 = objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
            for (i = 0; i != v33; ++i)
            {
              -[_ANERequest perfStatsArray](self, "perfStatsArray");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "objectAtIndexedSubscript:", i);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v36, "statType");

              if (v37 >= 3)
              {
                +[_ANELog common](_ANELog, "common");
                v56 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                {
                  NSStringFromSelector(a2);
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138413314;
                  v65 = v58;
                  v66 = 2048;
                  *(_QWORD *)v67 = i;
                  *(_WORD *)&v67[8] = 2048;
                  *(_QWORD *)&v67[10] = v37;
                  *(_WORD *)&v67[18] = 2048;
                  *(_QWORD *)&v67[20] = 0;
                  *(_WORD *)&v67[28] = 2048;
                  v68 = 2;
                  _os_log_error_impl(&dword_1D3352000, v56, OS_LOG_TYPE_ERROR, "%@: self.perfStatsArray[%lu].statType=%ld is invalid. Expected: (%ld - %ld)", buf, 0x34u);

                }
                goto LABEL_36;
              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject objectForKey:](v22, "objectForKey:", v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v37);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              if (v39)
              {
                -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v40);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = objc_msgSend(v41, "longValue");

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v42 + 1);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v37);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v40, v43);

              }
              else
              {
                -[NSObject setObject:forKey:](v22, "setObject:forKey:", &unk_1E951E730, v40);
              }

            }
            v61 = 0u;
            v62 = 0u;
            v59 = 0u;
            v60 = 0u;
            v22 = v22;
            v44 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
            if (v44)
            {
              v45 = v44;
              v46 = *(_QWORD *)v60;
              while (2)
              {
                for (j = 0; j != v45; ++j)
                {
                  if (*(_QWORD *)v60 != v46)
                    objc_enumerationMutation(v22);
                  v48 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
                  -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v48, (_QWORD)v59);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v49, "longValue") >= 2)
                  {
                    +[_ANELog common](_ANELog, "common");
                    v57 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                      -[_ANERequest validate].cold.3(a2, v48, v57);

                    goto LABEL_36;
                  }

                }
                v45 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
                if (v45)
                  continue;
                break;
              }
            }

          }
          -[_ANERequest sharedEvents](self, "sharedEvents", (_QWORD)v59);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "signalEvents");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v51, "count");

          -[_ANERequest sharedEvents](self, "sharedEvents");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "waitEvents");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v54, "count");

          if (v52 <= 0x40 && v55 < 0x41)
            return 1;
          +[_ANELog common](_ANELog, "common");
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v65 = v23;
            v66 = 2048;
            *(_QWORD *)v67 = v52;
            *(_WORD *)&v67[8] = 2048;
            *(_QWORD *)&v67[10] = v55;
            *(_WORD *)&v67[18] = 1024;
            *(_DWORD *)&v67[20] = 64;
            v28 = "%@: Either signalEvents[%lu] or waitEvents[%lu] count exceeds kANEMaxEvents=%d";
            goto LABEL_24;
          }
          goto LABEL_36;
        }
      }
      +[_ANELog common](_ANELog, "common");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        goto LABEL_36;
      NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ANERequest inputIndexArray](self, "inputIndexArray");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", v12);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v65 = v23;
      v66 = 1024;
      *(_DWORD *)v67 = v12;
      *(_WORD *)&v67[4] = 2112;
      *(_QWORD *)&v67[6] = v29;
      *(_WORD *)&v67[14] = 2048;
      *(_QWORD *)&v67[16] = v15;
      *(_WORD *)&v67[24] = 1024;
      *(_DWORD *)&v67[26] = 254;
      v30 = "%@: inputIndexArray[%u]=%@ length=%lu exceeds kANERequestMaxSymbolIndex=%d";
LABEL_65:
      _os_log_error_impl(&dword_1D3352000, v22, OS_LOG_TYPE_ERROR, v30, buf, 0x2Cu);

      goto LABEL_31;
    }
    +[_ANELog framework](_ANELog, "framework");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      -[_ANERequest outputArray](self, "outputArray");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ANERequest outputIndexArray](self, "outputIndexArray");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v65 = v23;
      v66 = 2112;
      *(_QWORD *)v67 = v24;
      *(_WORD *)&v67[8] = 2048;
      *(_QWORD *)&v67[10] = v7;
      *(_WORD *)&v67[18] = 2048;
      *(_QWORD *)&v67[20] = v11;
      v25 = "outputArray and outputIndexArray size mismatch. outputArray = %@ : outputIndexArray = %@ outputArray.count ="
            " %lu : outputIndexArray.count = %lu";
LABEL_29:
      v26 = v22;
      v27 = 42;
LABEL_30:
      _os_log_error_impl(&dword_1D3352000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
LABEL_31:

LABEL_32:
    }
  }
  else
  {
    +[_ANELog framework](_ANELog, "framework");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      -[_ANERequest inputArray](self, "inputArray");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ANERequest inputIndexArray](self, "inputIndexArray");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v65 = v23;
      v66 = 2112;
      *(_QWORD *)v67 = v24;
      *(_WORD *)&v67[8] = 2048;
      *(_QWORD *)&v67[10] = v5;
      *(_WORD *)&v67[18] = 2048;
      *(_QWORD *)&v67[20] = v9;
      v25 = "inputArray and inputIndexArray size mismatch. inputArray = %@ : inputIndexArray = %@ inputArray.count = %lu "
            ": inputIndexArray.count = %lu";
      goto LABEL_29;
    }
  }
LABEL_36:

  return 0;
}

- (NSArray)outputIndexArray
{
  return self->_outputIndexArray;
}

- (_ANESharedEvents)sharedEvents
{
  return self->_sharedEvents;
}

- (NSArray)inputIndexArray
{
  return self->_inputIndexArray;
}

- (NSNumber)procedureIndex
{
  return self->_procedureIndex;
}

- (NSArray)perfStatsArray
{
  return self->_perfStatsArray;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_perfStatsArray, 0);
  objc_storeStrong((id *)&self->_perfStats, 0);
  objc_storeStrong((id *)&self->_procedureIndex, 0);
  objc_storeStrong((id *)&self->_transactionHandle, 0);
  objc_storeStrong((id *)&self->_sharedEvents, 0);
  objc_storeStrong((id *)&self->_weightsBuffer, 0);
  objc_storeStrong((id *)&self->_outputIndexArray, 0);
  objc_storeStrong((id *)&self->_outputArray, 0);
  objc_storeStrong((id *)&self->_inputIndexArray, 0);
  objc_storeStrong((id *)&self->_inputArray, 0);
}

+ (id)requestWithInputs:(id)a3 inputIndices:(id)a4 outputs:(id)a5 outputIndices:(id)a6 perfStats:(id)a7 procedureIndex:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInputs:inputIndices:outputs:outputIndices:weightsBuffer:perfStats:procedureIndex:sharedEvents:transactionHandle:", v19, v18, v17, v16, 0, v15, v14, 0, 0);

  return v20;
}

- (_ANERequest)initWithInputs:(id)a3 inputIndices:(id)a4 outputs:(id)a5 outputIndices:(id)a6 weightsBuffer:(id)a7 perfStats:(id)a8 procedureIndex:(id)a9 sharedEvents:(id)a10 transactionHandle:(id)a11
{
  id v18;
  _ANERequest *v19;
  _ANERequest *v20;
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
  v30.super_class = (Class)_ANERequest;
  v19 = -[_ANERequest init](&v30, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_inputArray, a3);
    objc_storeStrong((id *)&v20->_inputIndexArray, a4);
    objc_storeStrong((id *)&v20->_outputArray, a5);
    objc_storeStrong((id *)&v20->_outputIndexArray, a6);
    objc_storeStrong((id *)&v20->_weightsBuffer, a7);
    objc_storeStrong((id *)&v20->_perfStatsArray, a8);
    objc_storeStrong((id *)&v20->_procedureIndex, a9);
    objc_storeStrong((id *)&v20->_sharedEvents, a10);
    objc_storeStrong((id *)&v20->_transactionHandle, a11);
  }

  return v20;
}

- (_ANERequest)initWithVirtualModel:(void *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_ANERequest;
  return -[_ANERequest init](&v4, sel_init, a3);
}

+ (id)requestWithInputs:(id)a3 inputIndices:(id)a4 outputs:(id)a5 outputIndices:(id)a6 weightsBuffer:(id)a7 procedureIndex:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInputs:inputIndices:outputs:outputIndices:weightsBuffer:perfStats:procedureIndex:sharedEvents:transactionHandle:", v19, v18, v17, v16, v15, 0, v14, 0, 0);

  return v20;
}

+ (id)requestWithInputs:(id)a3 inputIndices:(id)a4 outputs:(id)a5 outputIndices:(id)a6 procedureIndex:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInputs:inputIndices:outputs:outputIndices:weightsBuffer:perfStats:procedureIndex:sharedEvents:transactionHandle:", v16, v15, v14, v13, 0, 0, v12, 0, 0);

  return v17;
}

+ (id)requestWithInputs:(id)a3 inputIndices:(id)a4 outputs:(id)a5 outputIndices:(id)a6 weightsBuffer:(id)a7 perfStats:(id)a8 procedureIndex:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v23 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInputs:inputIndices:outputs:outputIndices:weightsBuffer:perfStats:procedureIndex:sharedEvents:transactionHandle:", v22, v21, v20, v19, v18, v17, v16, 0, 0);

  return v23;
}

+ (id)requestWithInputs:(id)a3 inputIndices:(id)a4 outputs:(id)a5 outputIndices:(id)a6 weightsBuffer:(id)a7 perfStats:(id)a8 procedureIndex:(id)a9 sharedEvents:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;

  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  v25 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInputs:inputIndices:outputs:outputIndices:weightsBuffer:perfStats:procedureIndex:sharedEvents:transactionHandle:", v24, v23, v22, v21, v20, v19, v18, v17, 0);

  return v25;
}

+ (id)requestWithInputs:(id)a3 inputIndices:(id)a4 outputs:(id)a5 outputIndices:(id)a6 weightsBuffer:(id)a7 perfStats:(id)a8 procedureIndex:(id)a9 sharedEvents:(id)a10 transactionHandle:(id)a11
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
  v27 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInputs:inputIndices:outputs:outputIndices:weightsBuffer:perfStats:procedureIndex:sharedEvents:transactionHandle:", v26, v25, v24, v23, v22, v21, v20, v19, v18);

  return v27;
}

- (unint64_t)ioSurfacesCount
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;

  -[_ANERequest inputIndexArray](self, "inputIndexArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[_ANERequest outputIndexArray](self, "outputIndexArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") + v4;
  -[_ANERequest weightsBuffer](self, "weightsBuffer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = v6 + 1;
  else
    v8 = v6;

  return v8;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;

  v16 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANERequest inputArray](self, "inputArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANERequest inputIndexArray](self, "inputIndexArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANERequest outputArray](self, "outputArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANERequest outputIndexArray](self, "outputIndexArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANERequest weightsBuffer](self, "weightsBuffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANERequest procedureIndex](self, "procedureIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANERequest perfStatsArray](self, "perfStatsArray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANERequest sharedEvents](self, "sharedEvents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANERequest transactionHandle](self, "transactionHandle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: { inputArray=%@ ; inputIndexArray=%@ ; outputArray=%@ ; outputIndexArray=%@ ; weightsBuffer=%@ ; procedureIndex=%@ ; perfStatsArray=%@ ; sharedEvents=%@ ; transactionHandle=%@}"),
    v15,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11,
    v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)setSharedEvents:(id)a3
{
  objc_storeStrong((id *)&self->_sharedEvents, a3);
}

- (void)setTransactionHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (_ANEPerformanceStats)perfStats
{
  return self->_perfStats;
}

- (void)setPerfStats:(id)a3
{
  objc_storeStrong((id *)&self->_perfStats, a3);
}

- (void)validate
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2048;
  v10 = objc_msgSend(a2, "longValue");
  OUTLINED_FUNCTION_0_4(&dword_1D3352000, a3, v6, "%@: Multiple _ANEPerformanceStatsIOSurface of type %ld, only pne _ANEPerformanceStatsIOSurface of each type expected", (uint8_t *)&v7);

}

@end
