@implementation MLComputeBatchDataSource

- (MLComputeBatchDataSource)initWithBatchProvider:(id)a3 batchSize:(unint64_t)a4 forPrediction:(BOOL)a5 neuralNetworkEngine:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  MLComputeBatchDataSource *v14;
  MLComputeBatchDataSource *v15;
  objc_super v17;

  v12 = a3;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MLComputeBatchDataSource;
  v14 = -[MLComputeBatchDataSource init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_batchProvider, a3);
    objc_storeStrong((id *)&v15->_nnEngine, a6);
    v15->_useForPrediction = a5;
    v15->_batchSize = a4;
  }

  return v15;
}

- (id)batchAtIndex:(unint64_t)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t k;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  char isKindOfClass;
  void *v26;
  void *v27;
  MLMultiArray *v28;
  void *v29;
  void *v30;
  char v31;
  MLMultiArray *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  MLMultiArray *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  unint64_t v42;
  size_t v43;
  void *v44;
  void *v45;
  void *v46;
  objc_class *v47;
  void *v49;
  unint64_t v50;
  uint64_t v51;
  id v54;
  unint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  v49 = 0;
  v50 = -[MLComputeBatchDataSource batchSize](self, "batchSize") * a3;
  while (1)
  {
    if (v55 >= -[MLComputeBatchDataSource batchSize](self, "batchSize")
      || (-[MLComputeBatchDataSource batchProvider](self, "batchProvider"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = v55 + v50 < objc_msgSend(v6, "count"),
          v6,
          !v7))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v54 = (id)objc_claimAutoreleasedReturnValue();
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v19 = v5;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
      if (!v20)
        goto LABEL_38;
      v56 = *(_QWORD *)v62;
      v51 = *MEMORY[0x1E0C99768];
      while (1)
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v62 != v56)
            objc_enumerationMutation(v19);
          v22 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
          objc_msgSend(v19, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v19, "objectForKeyedSubscript:", v22);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            +[MLMultiArray multiArrayByConcatenatingMultiArrays:alongAxis:dataType:](MLMultiArray, "multiArrayByConcatenatingMultiArrays:alongAxis:dataType:", v26, 0, 65568);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v27, "isContiguousInOrder:", 0))
            {
              v28 = v27;
            }
            else
            {
              v38 = [MLMultiArray alloc];
              objc_msgSend(v27, "shape");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = -[MLMultiArray initWithShape:dataType:error:](v38, "initWithShape:dataType:error:", v39, objc_msgSend(v27, "dataType"), a4);

              objc_msgSend(v27, "vectorizeIntoMultiArray:storageOrder:error:", v28, 0, a4);
            }
            -[MLMultiArray shape](v28, "shape");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = +[MLDataConversionUtils sizeFromShape:](MLDataConversionUtils, "sizeFromShape:", v40);
            v42 = +[MLDataConversionUtils mlComputeDataTypeSize:](MLDataConversionUtils, "mlComputeDataTypeSize:", 65568);

            v43 = v42 * v41;
            v44 = malloc_type_malloc(v42 * v41, 0x24C764D7uLL);
            v32 = objc_retainAutorelease(v28);
            memcpy(v44, -[MLMultiArray bytes](v32, "bytes"), v43);
            objc_msgSend(MEMORY[0x1E0CC1400], "dataWithBytesNoCopy:length:freeWhenDone:", v44, v43, 1);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "setObject:forKeyedSubscript:", v45, v22);
            goto LABEL_35;
          }
          objc_msgSend(v19, "objectForKeyedSubscript:", v22);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v31 = objc_opt_isKindOfClass();

          if ((v31 & 1) == 0)
          {
            v46 = (void *)MEMORY[0x1E0C99DA0];
            objc_msgSend(v19, "objectForKeyedSubscript:", v22);
            v32 = (MLMultiArray *)objc_claimAutoreleasedReturnValue();
            -[MLMultiArray objectAtIndexedSubscript:](v32, "objectAtIndexedSubscript:", 0);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = (objc_class *)objc_opt_class();
            NSStringFromClass(v47);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "raise:format:", v51, CFSTR("MLComputeDataSource has unexpected element type: %@"), v45);
LABEL_35:

            goto LABEL_36;
          }
          objc_msgSend(MEMORY[0x1E0C99DF0], "data");
          v32 = (MLMultiArray *)objc_claimAutoreleasedReturnValue();
          v59 = 0u;
          v60 = 0u;
          v57 = 0u;
          v58 = 0u;
          objc_msgSend(v19, "objectForKeyedSubscript:", v22);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
          if (v34)
          {
            v35 = *(_QWORD *)v58;
            do
            {
              for (j = 0; j != v34; ++j)
              {
                if (*(_QWORD *)v58 != v35)
                  objc_enumerationMutation(v33);
                -[MLMultiArray appendData:](v32, "appendData:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j));
              }
              v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
            }
            while (v34);
          }

          v37 = malloc_type_malloc(-[MLMultiArray length](v32, "length"), 0xB8CC4EAuLL);
          -[MLMultiArray getBytes:length:](v32, "getBytes:length:", v37, -[MLMultiArray length](v32, "length"));
          objc_msgSend(MEMORY[0x1E0CC1400], "dataWithBytesNoCopy:length:freeWhenDone:", v37, -[MLMultiArray length](v32, "length"), 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "setObject:forKeyedSubscript:", v27, v22);
LABEL_36:

        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
        if (!v20)
        {
LABEL_38:

          v10 = v49;
          goto LABEL_42;
        }
      }
    }
    v8 = (void *)MEMORY[0x1A1AD6ED8]();
    v69 = v49;
    -[MLComputeBatchDataSource mlcDataSourceAtIndex:error:](self, "mlcDataSourceAtIndex:error:", v55 + v50, &v69);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v69;

    objc_autoreleasePoolPop(v8);
    if (!v9)
      break;
    objc_msgSend(v9, "dataDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v66;
      do
      {
        for (k = 0; k != v13; ++k)
        {
          if (*(_QWORD *)v66 != v14)
            objc_enumerationMutation(v12);
          v16 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * k);
          objc_msgSend(v5, "objectForKeyedSubscript:", v16);
          v17 = (id)objc_claimAutoreleasedReturnValue();
          if (!v17)
          {
            v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, v16);
          }
          objc_msgSend(v12, "objectForKeyedSubscript:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v18);

        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
      }
      while (v13);
    }

    ++v55;
    v49 = v10;
  }
  if (a4)
  {
    v10 = objc_retainAutorelease(v10);
    v54 = 0;
    *a4 = v10;
  }
  else
  {
    v54 = 0;
  }
LABEL_42:

  return v54;
}

- (id)mlcDataSourceAtIndex:(int64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  MLComputeDataSource *v9;
  _BOOL8 v10;
  void *v11;
  MLComputeDataSource *v12;
  id v13;
  MLComputeDataSource *v14;
  id v16;

  -[MLComputeBatchDataSource batchProvider](self, "batchProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "featuresAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [MLComputeDataSource alloc];
  v10 = -[MLComputeBatchDataSource useForPrediction](self, "useForPrediction");
  -[MLComputeBatchDataSource nnEngine](self, "nnEngine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v12 = -[MLComputeDataSource initWithFeatureProvider:forPrediction:neuralNetworkEngine:error:](v9, "initWithFeatureProvider:forPrediction:neuralNetworkEngine:error:", v8, v10, v11, &v16);
  v13 = v16;

  if (v12)
  {
    v14 = v12;
  }
  else if (a4)
  {
    +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6, v13, CFSTR("Error in getting feature at index %lu "), a3);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (unint64_t)sizeOfBatchAtIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[MLComputeBatchDataSource batchProvider](self, "batchProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = v6 - -[MLComputeBatchDataSource batchSize](self, "batchSize") * a3;

  if (v7 >= -[MLComputeBatchDataSource batchSize](self, "batchSize"))
    return -[MLComputeBatchDataSource batchSize](self, "batchSize");
  else
    return v7;
}

- (unint64_t)numberOfBatches
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  if (!-[MLComputeBatchDataSource batchSize](self, "batchSize"))
    return 0;
  -[MLComputeBatchDataSource batchProvider](self, "batchProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = -[MLComputeBatchDataSource batchSize](self, "batchSize");
  v6 = (v4 + v5 - 1) / -[MLComputeBatchDataSource batchSize](self, "batchSize");

  return v6;
}

- (MLBatchProvider)batchProvider
{
  return self->_batchProvider;
}

- (MLNeuralNetworkEngine)nnEngine
{
  return self->_nnEngine;
}

- (BOOL)useForPrediction
{
  return self->_useForPrediction;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nnEngine, 0);
  objc_storeStrong((id *)&self->_batchProvider, 0);
}

@end
