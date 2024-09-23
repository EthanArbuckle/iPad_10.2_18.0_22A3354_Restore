@implementation GEORequestResponseLogRequest

void ___GEORequestResponseLogRequest_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  int v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  _BYTE v44[10];
  int v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
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
        v9 = *(_QWORD *)(a1 + 56);
        v10 = v7;
        *(_DWORD *)buf = 138413059;
        v42 = v8;
        v43 = 2113;
        *(_QWORD *)v44 = v9;
        *(_WORD *)&v44[8] = 1040;
        v45 = -[NSObject length](v6, "length");
        v46 = 2097;
        v47 = -[NSObject bytes](objc_retainAutorelease(v6), "bytes");
        _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_DEBUG, "Request with task %@, URL %{private}@ : %{private,geo:requestresponseV3/pbcodable}.*P", buf, 0x26u);

      }
LABEL_20:

      goto LABEL_21;
    }
    if ((unint64_t)objc_msgSend(v3, "length") >> 12 > 0x22)
    {
      v29 = *(NSObject **)(a1 + 40);
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        goto LABEL_21;
      v30 = *(_QWORD *)(a1 + 48);
      v6 = v29;
      *(_DWORD *)buf = 138412802;
      v42 = v30;
      v43 = 1024;
      *(_DWORD *)v44 = objc_msgSend(v3, "length");
      *(_WORD *)&v44[4] = 1024;
      *(_DWORD *)&v44[6] = 143360;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "Request with task %@ of %u bytes was larger than max size %u, not logging", buf, 0x18u);
      goto LABEL_20;
    }
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v3;
    protobufDataParts(v3, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v37 != v20)
            objc_enumerationMutation(v17);
          v22 = *(NSObject **)(a1 + 40);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            v23 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            v24 = *(_QWORD *)(a1 + 48);
            v25 = *(_QWORD *)(a1 + 56);
            v26 = v22;
            v27 = objc_msgSend(v23, "length");
            v28 = objc_msgSend(objc_retainAutorelease(v23), "bytes");
            *(_DWORD *)buf = 138413059;
            v42 = v24;
            v43 = 2113;
            *(_QWORD *)v44 = v25;
            *(_WORD *)&v44[8] = 1040;
            v45 = v27;
            v46 = 2097;
            v47 = v28;
            _os_log_impl(&dword_1885A9000, v26, OS_LOG_TYPE_DEBUG, "Request with task %@, URL %{private}@ : %{private,geo:requestresponseV3/pbcodable}.*P", buf, 0x26u);

          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v19);
    }

    v3 = v35;
  }
  else
  {
    v11 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = *(_QWORD *)(a1 + 48);
      v13 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412547;
      v42 = v12;
      v43 = 2113;
      *(_QWORD *)v44 = v13;
      _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_DEBUG, "Request with task %@, URL %{private}@ : nil", buf, 0x16u);
    }
  }
LABEL_21:
  rrPersister(*(void **)(a1 + 48));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = *(_QWORD *)(a1 + 48);
    v33 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "data");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "persistRequestTask:url:request:", v32, v33, v34);

  }
}

@end
