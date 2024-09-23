@implementation VSDataCompressionValueTransformer

- (id)_dataByPerformingOperation:(int)a3 onData:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v10;
  id v11;
  uint8_t *v12;
  uint8_t *v13;
  _BOOL4 v14;
  uint64_t v15;
  compression_status v16;
  NSObject *v17;
  compression_stream v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  memset(&v18, 0, sizeof(v18));
  if (compression_stream_init(&v18, (compression_stream_operation)a3, COMPRESSION_ZLIB))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], *__error(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    VSErrorLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[VSDataCompressionValueTransformer _dataByPerformingOperation:onData:].cold.1((uint64_t)v6, v7);

  }
  else
  {
    v10 = objc_retainAutorelease(v5);
    v18.src_ptr = (const uint8_t *)objc_msgSend(v10, "bytes");
    v18.src_size = objc_msgSend(v10, "length");
    v11 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    v12 = (uint8_t *)malloc_type_malloc(0x1000uLL, 0x49199746uLL);
    if (v12)
    {
      v13 = v12;
      v14 = a3 == 0;
      v18.dst_ptr = v12;
      v18.dst_size = 4096;
      v15 = *MEMORY[0x1E0CB2F90];
      while (1)
      {
        v16 = compression_stream_process(&v18, v14);
        if (v16)
          break;
        if (!v18.dst_size)
        {
          objc_msgSend(v11, "appendBytes:length:", v13, 4096, v18.dst_ptr);
          v18.dst_ptr = v13;
          v18.dst_size = 4096;
        }
      }
      if (v16 == COMPRESSION_STATUS_ERROR)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v15, *__error(), 0, v18.dst_ptr);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        VSErrorLogObject();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v6;
          _os_log_error_impl(&dword_1D2419000, v17, OS_LOG_TYPE_ERROR, "Error processing stream: %@", buf, 0xCu);
        }

        v11 = 0;
      }
      else
      {
        if (v16 == COMPRESSION_STATUS_END && v18.dst_size != 4096)
          objc_msgSend(v11, "appendBytes:length:", v13, 4096 - v18.dst_size, v18.dst_ptr);
        v6 = 0;
      }
      free(v13);
    }
    else
    {
      v6 = 0;
    }
    compression_stream_destroy(&v18);
    if (v11)
    {
      +[VSFailable failableWithObject:](VSFailable, "failableWithObject:", v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The errorOrNil parameter must not be nil."));
  +[VSFailable failableWithError:](VSFailable, "failableWithError:", v6, v18.dst_ptr);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
LABEL_8:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The result parameter must not be nil."), v18.dst_ptr);
LABEL_9:

  return v8;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v4 = a3;
  v26 = v4;
  v5 = (void *)v22[5];
  if (!v5)
    goto LABEL_11;
  v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1E0C99DA0];
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unexpectedly, inputValue was %@, instead of VSFailable."), v9);

    }
    v10 = v6;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __54__VSDataCompressionValueTransformer_transformedValue___block_invoke;
    v20[3] = &unk_1E939F458;
    v20[4] = &v21;
    objc_msgSend(v10, "unwrapObject:error:", v20, &__block_literal_global_6);

  }
  v11 = (void *)v22[5];
  if (v11)
  {
    v12 = v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v13 = (void *)MEMORY[0x1E0C99DA0];
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unexpectedly, inputValue was %@, instead of NSData."), v15);

      }
      v16 = v12;
      v17 = (void *)objc_msgSend(v16, "copy");
      -[VSDataCompressionValueTransformer _dataByPerformingOperation:onData:](self, "_dataByPerformingOperation:onData:", 0, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
LABEL_11:
    v18 = 0;
  }
  _Block_object_dispose(&v21, 8);

  return v18;
}

void __54__VSDataCompressionValueTransformer_transformedValue___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)reverseTransformedValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v4 = a3;
  v26 = v4;
  v5 = (void *)v22[5];
  if (!v5)
    goto LABEL_11;
  v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1E0C99DA0];
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unexpectedly, inputValue was %@, instead of VSFailable."), v9);

    }
    v10 = v6;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __61__VSDataCompressionValueTransformer_reverseTransformedValue___block_invoke;
    v20[3] = &unk_1E939F458;
    v20[4] = &v21;
    objc_msgSend(v10, "unwrapObject:error:", v20, &__block_literal_global_19);

  }
  v11 = (void *)v22[5];
  if (v11)
  {
    v12 = v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v13 = (void *)MEMORY[0x1E0C99DA0];
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unexpectedly, inputValue was %@, instead of NSData."), v15);

      }
      v16 = v12;
      v17 = (void *)objc_msgSend(v16, "copy");
      -[VSDataCompressionValueTransformer _dataByPerformingOperation:onData:](self, "_dataByPerformingOperation:onData:", 1, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
LABEL_11:
    v18 = 0;
  }
  _Block_object_dispose(&v21, 8);

  return v18;
}

void __61__VSDataCompressionValueTransformer_reverseTransformedValue___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)_dataByPerformingOperation:(uint64_t)a1 onData:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D2419000, a2, OS_LOG_TYPE_ERROR, "Error creating stream: %@", (uint8_t *)&v2, 0xCu);
}

@end
