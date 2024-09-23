@implementation GEORequestResponseLogResponse

void ___GEORequestResponseLogResponse_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  int v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if ((unint64_t)objc_msgSend(v2, "length") <= 0x7000)
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      protobufDataWithHeader(v3, v5);
      v6 = objc_claimAutoreleasedReturnValue();

      v7 = *(NSObject **)(a1 + 40);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v8 = *(_QWORD *)(a1 + 48);
        v9 = v7;
        *(_DWORD *)buf = 138412803;
        v38 = v8;
        v39 = 1040;
        v40 = -[NSObject length](v6, "length");
        v41 = 2097;
        v42 = -[NSObject bytes](objc_retainAutorelease(v6), "bytes");
        _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_DEBUG, "Response for task %@ : %{private,geo:requestresponseV3/pbcodable}.*P", buf, 0x1Cu);

      }
LABEL_20:

      goto LABEL_21;
    }
    if ((unint64_t)objc_msgSend(v3, "length") >> 12 > 0x22)
    {
      v26 = *(NSObject **)(a1 + 40);
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        goto LABEL_21;
      v27 = *(_QWORD *)(a1 + 48);
      v6 = v26;
      *(_DWORD *)buf = 138412802;
      v38 = v27;
      v39 = 1024;
      v40 = objc_msgSend(v3, "length");
      v41 = 1024;
      LODWORD(v42) = 143360;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "Response for task %@ of %u bytes was larger than max size %u, not logging", buf, 0x18u);
      goto LABEL_20;
    }
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v3;
    protobufDataParts(v3, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v33 != v18)
            objc_enumerationMutation(v15);
          v20 = *(NSObject **)(a1 + 40);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            v22 = *(_QWORD *)(a1 + 48);
            v23 = v20;
            v24 = objc_msgSend(v21, "length");
            v25 = objc_msgSend(objc_retainAutorelease(v21), "bytes");
            *(_DWORD *)buf = 138412803;
            v38 = v22;
            v39 = 1040;
            v40 = v24;
            v41 = 2097;
            v42 = v25;
            _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_DEBUG, "Response for task %@ : %{private,geo:requestresponseV3/pbcodable}.*P", buf, 0x1Cu);

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v17);
    }

    v3 = v31;
  }
  else
  {
    v10 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v38 = v11;
      _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_DEBUG, "Response for task %@ : nil", buf, 0xCu);
    }
  }
LABEL_21:
  rrPersister(*(void **)(a1 + 48));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "data");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "persistResponseTask:response:", v29, v30);

  }
}

@end
