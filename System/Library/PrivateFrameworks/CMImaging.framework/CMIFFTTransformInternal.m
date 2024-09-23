@implementation CMIFFTTransformInternal

- (CMIFFTTransformInternal)initWithContext:(id)a3 nDim:(int)a4 sizes:(id)a5 istrides:(id)a6 ostrides:(id)a7 layout:(int64_t)a8 precision:(int64_t)a9 batchsize:(unint64_t)a10
{
  id v17;
  id v18;
  id v19;
  CMIFFTTransformInternal *v20;
  CMIFFTTransformInternal *v21;
  CMIFFTTransformInternal *v22;
  CMIFFTExecutor *v23;
  CMIFFTExecutor *executor;
  id v26;
  objc_super v27;

  v17 = a3;
  v26 = a5;
  v18 = a6;
  v19 = a7;
  v27.receiver = self;
  v27.super_class = (Class)CMIFFTTransformInternal;
  v20 = -[CMIFFTTransformInternal init](&v27, sel_init);
  v21 = v20;
  if (!v20)
    goto LABEL_11;
  v20->_nDim = a4;
  if (a4 < 1)
    goto LABEL_11;
  objc_storeStrong((id *)&v20->_sizes, a5);
  if (!v21->_sizes)
    goto LABEL_11;
  objc_storeStrong((id *)&v21->_iStrides, a6);
  if (!v21->_iStrides)
    goto LABEL_11;
  objc_storeStrong((id *)&v21->_oStrides, a7);
  v22 = 0;
  if (v17 && v21->_oStrides)
  {
    objc_storeStrong((id *)&v21->_context, a3);
    v23 = -[CMIFFTExecutor initWithContext:]([CMIFFTExecutor alloc], "initWithContext:", v21->_context);
    executor = v21->_executor;
    v21->_executor = v23;

    if (v21->_executor)
    {
      v21->_layout = a8;
      v21->_precision = a9;
      v21->_batchSize = a10;
      if (!-[CMIFFTTransformInternal planTransform](v21, "planTransform"))
      {
        v22 = v21;
        goto LABEL_10;
      }
    }
LABEL_11:
    v22 = 0;
  }
LABEL_10:

  return v22;
}

- (int)planTransform
{
  void *v3;
  int v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  CMIFFTDimension *v16;
  uint64_t v17;
  NSArray *v18;
  int v19;
  NSArray *dimensions;
  NSArray *obj;
  uint64_t v23;
  CMIFFTTransformInternal *v24;
  uint64_t v25;
  uint64_t v26;
  CMIFFTDimension *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v24 = self;
  obj = self->_sizes;
  v25 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v25)
  {
    v4 = 0;
    v23 = *(_QWORD *)v29;
    v5 = 0x1E94E9000uLL;
LABEL_3:
    v6 = 0;
    v26 = v4;
    while (1)
    {
      if (*(_QWORD *)v29 != v23)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v6);
      objc_msgSend(*(id *)(v5 + 3520), "decomposeIntoPrimeFactors:", objc_msgSend(v7, "intValue"));
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
        break;
      v9 = (void *)v8;
      v10 = v5;
      objc_msgSend(*(id *)(v5 + 3520), "collectPrimeFactorsIntoBins:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = [CMIFFTDimension alloc];
      v12 = (int)objc_msgSend(v7, "intValue");
      -[NSArray objectAtIndexedSubscript:](v24->_iStrides, "objectAtIndexedSubscript:", v26 + v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (int)objc_msgSend(v13, "intValue");
      -[NSArray objectAtIndexedSubscript:](v24->_oStrides, "objectAtIndexedSubscript:", v26 + v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[CMIFFTDimension initWithSize:iStride:oStride:primeFactors:](v27, "initWithSize:iStride:oStride:primeFactors:", v12, v14, (int)objc_msgSend(v15, "intValue"), v11);

      if (!v16)
      {
        v19 = -73469;

        goto LABEL_13;
      }
      objc_msgSend(v3, "addObject:", v16);

      ++v6;
      v5 = v10;
      if (v25 == v6)
      {
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        v4 = v26 + v6;
        v25 = v17;
        if (v17)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    v19 = -73466;
LABEL_13:
    dimensions = obj;
    goto LABEL_14;
  }
LABEL_10:

  v18 = v3;
  v19 = 0;
  dimensions = v24->_dimensions;
  v24->_dimensions = v18;
LABEL_14:

  return v19;
}

- (int64_t)encodeToCommandBuffer:(id)a3 inputBuffer:(id)a4 direction:(int64_t)a5
{
  return -[CMIFFTExecutor executeTransform:dimensions:inputBuffer:layout:precision:direction:batchSize:](self->_executor, "executeTransform:dimensions:inputBuffer:layout:precision:direction:batchSize:", a3, self->_dimensions, a4, self->_layout, self->_precision, a5, self->_batchSize);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimensions, 0);
  objc_storeStrong((id *)&self->_oStrides, 0);
  objc_storeStrong((id *)&self->_iStrides, 0);
  objc_storeStrong((id *)&self->_sizes, 0);
  objc_storeStrong((id *)&self->_executor, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
