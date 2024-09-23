@implementation MKPUTRouter

- (MKPUTRouter)init
{
  MKPUTRouter *v2;
  MKDevice *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v32.receiver = self;
  v32.super_class = (Class)MKPUTRouter;
  v2 = -[MKPUTRouter init](&v32, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MKDevice);
    v4 = -[MKDevice type](v3, "type");

    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    if (v4 == 1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 6);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("application/vnd.com.apple.migrationkit.placeholder.v1.1+json"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("application/vnd.com.apple.migrationkit.call.history+json"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("application/vnd.com.apple.migrationkit.container.v1.1"));

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("application/vnd.com.apple.migrationkit.account+json"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("application/vnd.com.apple.migrationkit.message+json"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("application/vnd.com.apple.migrationkit.bookmark+json"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("application/vnd.com.apple.migrationkit.application+json"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("application/vnd.com.apple.migrationkit.setting.accessibility+json"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("application/vnd.com.apple.migrationkit.setting.display+json"));

    if (+[MKSIMMigrator isSupported](MKSIMMigrator, "isSupported"))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v15, CFSTR("application/vnd.com.apple.migrationkit.sim+json"));

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v16, CFSTR("application/vnd.com.apple.migrationkit.diagnostics"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v17, CFSTR("application/vnd.com.apple.migrationkit.performance+json"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v18, CFSTR("text/vcard"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v19, CFSTR("text/calendar"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v20, CFSTR("application/octet-stream"));

    objc_storeStrong((id *)&v2->_routing, v5);
    v21 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[MKPUTRouter setSupportedContentTypes:](v2, "setSupportedContentTypes:", v21);

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v5, "allKeys", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v29;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v29 != v25)
            objc_enumerationMutation(v22);
          -[NSMutableArray addObject:](v2->_supportedContentTypes, "addObject:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v26++));
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v24);
    }

    -[NSMutableArray addObject:](v2->_supportedContentTypes, "addObject:", CFSTR("image/*"));
    -[NSMutableArray addObject:](v2->_supportedContentTypes, "addObject:", CFSTR("video/*"));
    -[NSMutableArray addObject:](v2->_supportedContentTypes, "addObject:", CFSTR("audio/*"));
    -[NSMutableArray addObject:](v2->_supportedContentTypes, "addObject:", CFSTR("application/*"));
    -[NSMutableArray addObject:](v2->_supportedContentTypes, "addObject:", CFSTR("multipart/mixed"));
    -[MKPUTRouter setSupportedTransferEncodings:](v2, "setSupportedTransferEncodings:", &unk_24E36C638);

  }
  return v2;
}

- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  MKTime *v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v16 = objc_alloc_init(MKTime);
  -[MKPUTRouter _server:didReceiveRequest:response:](self, "_server:didReceiveRequest:response:", v10, v9, v8);

  objc_msgSend(v8, "headers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "serverTiming");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTime elapsedTimeInSeconds](v16, "elapsedTimeInSeconds");
  v14 = v13;
  objc_msgSend(v12, "import");
  objc_msgSend(v12, "setImport:", v14 + v15);

}

- (void)_server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  MKPUTRouter *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  id WeakRetained;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  char v40;
  id v41;
  id v42;
  char v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint8_t buf[4];
  MKPUTRouter *v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(v6, "body");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "headers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKLog log](MKLog, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v58 = self;
    v59 = 2112;
    v60 = (uint64_t)v9;
    _os_log_impl(&dword_21EC08000, v10, OS_LOG_TYPE_INFO, "%@ received a data. content_type=%@", buf, 0x16u);
  }

  if (v9)
  {
    v11 = v9;
    v12 = v7;
    objc_msgSend(v8, "contentDisposition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentRange");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "proxyAuthorization");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentPayload");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void *)objc_msgSend(v16, "copy");

    objc_msgSend(v13, "filename");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)objc_msgSend(v17, "copy");

    objc_msgSend(v13, "folder");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v18, "copy");

    v50 = v13;
    objc_msgSend(v13, "originalFilename");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)objc_msgSend(v19, "copy");

    v20 = objc_msgSend(v14, "offset");
    v21 = objc_msgSend(v14, "length");
    v47 = v14;
    v22 = objc_msgSend(v14, "total");
    v48 = v15;
    objc_msgSend(v15, "date");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chunk");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v6, "chunkedTransferCompleted");
    if (v23)
    {
      v7 = v23;

      v45 = objc_msgSend(v6, "chunkOffset");
      v21 = objc_msgSend(v7, "length");
      v46 = 0;
    }
    else
    {
      v45 = v20;
      v46 = v22;
      v7 = v12;
    }
    v24 = self;
    v9 = v11;
    if (-[MKPUTRouter isAllowedPath:](self, "isAllowedPath:", v56)
      && -[MKPUTRouter isAllowedPath:](self, "isAllowedPath:", v55)
      && -[MKPUTRouter isAllowedPath:](self, "isAllowedPath:", v54))
    {
      -[NSDictionary objectForKey:](self->_routing, "objectForKey:", v11);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25)
      {
        v27 = v49;
        switch(-[NSObject integerValue](v25, "integerValue"))
        {
          case 0:
            WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
            objc_msgSend(WeakRetained, "router:didReceiveAccountEncodedInJSON:", v24, v7);
            goto LABEL_30;
          case 1:
            WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
            objc_msgSend(WeakRetained, "router:didReceiveMessageEncodedInJSON:", v24, v7);
            goto LABEL_30;
          case 2:
            WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
            objc_msgSend(WeakRetained, "router:didReceiveBookmarkEncodedInJSON:", v24, v7);
            goto LABEL_30;
          case 3:
            WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
            objc_msgSend(WeakRetained, "router:didReceiveApplicationEncodedInJSON:", v24, v7);
            goto LABEL_30;
          case 4:
            WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
            objc_msgSend(WeakRetained, "router:didReceiveAccessibilitySettingEncodedInJSON:", v24, v7);
            goto LABEL_30;
          case 5:
            WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
            objc_msgSend(WeakRetained, "router:didReceiveDisplaySettingEncodedInJSON:", v24, v7);
            goto LABEL_30;
          case 6:
            WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
            objc_msgSend(WeakRetained, "router:didReceivePlaceholderEncodedInJSON:", v24, v7);
            goto LABEL_30;
          case 7:
            WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
            objc_msgSend(WeakRetained, "router:didReceiveSIMEncodedInJSON:", v24, v7);
            goto LABEL_30;
          case 8:
            WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
            objc_msgSend(WeakRetained, "router:didReceiveCallHistoryEncodedInJSON:", v24, v7);
            goto LABEL_30;
          case 9:
            WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
            objc_msgSend(WeakRetained, "router:didReceiveVCard:", v24, v7);
            goto LABEL_30;
          case 10:
            WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
            objc_msgSend(WeakRetained, "router:didReceiveICal:", v24, v7);
            goto LABEL_30;
          case 11:
            v42 = v56;
            WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
            LOBYTE(v33) = v44;
            objc_msgSend(WeakRetained, "router:didReceiveFileChunk:filename:offset:length:total:complete:", v24, v7, v42, v45, v21, v46, v33);

            goto LABEL_30;
          case 12:
            v43 = objc_msgSend(v51, "isRequired");
            v40 = objc_msgSend(v51, "isExcludedFromBackup");
            v41 = v56;
            objc_msgSend(v49, "identifier");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            WeakRetained = (id)objc_msgSend(v38, "copy");

            objc_msgSend(v49, "signature");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = (void *)objc_msgSend(v36, "copy");

            v37 = objc_loadWeakRetained((id *)&v24->_delegate);
            BYTE2(v34) = v44;
            BYTE1(v34) = v40;
            LOBYTE(v34) = v43;
            objc_msgSend(v37, "router:didReceiveContainer:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:", v24, WeakRetained, v39, v7, v41, v45, v21, v46, v34);

            goto LABEL_30;
          case 13:
            WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
            objc_msgSend(WeakRetained, "router:didReceiveDiagnosticsFile:filename:", v24, v7, v55);
            goto LABEL_30;
          case 14:
            WeakRetained = objc_loadWeakRetained((id *)&v24->_delegate);
            objc_msgSend(WeakRetained, "router:didReceivePerformanceMetrics:", v24, v7);
            goto LABEL_30;
          default:
            goto LABEL_16;
        }
      }
      if (objc_msgSend(v11, "hasPrefix:", CFSTR("image/")))
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        LOBYTE(v35) = v44;
        objc_msgSend(WeakRetained, "router:didReceiveImageChunk:identifier:offset:length:total:filename:collection:originalFilename:complete:", self, v7, v56, v45, v21, v46, v55, v53, v54, v35);
LABEL_29:
        v27 = v49;
LABEL_30:
        v29 = v47;

        v30 = v48;
LABEL_17:

        goto LABEL_18;
      }
      if (objc_msgSend(v11, "hasPrefix:", CFSTR("video/")))
      {
        +[MKLog log](MKLog, "log");
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218496;
          v58 = (MKPUTRouter *)v45;
          v59 = 2048;
          v60 = v21;
          v61 = 2048;
          v62 = v46;
          _os_log_impl(&dword_21EC08000, v31, OS_LOG_TYPE_INFO, "offset=%lld, length=%lld, total=%lld", buf, 0x20u);
        }

        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        LOBYTE(v35) = v44;
        objc_msgSend(WeakRetained, "router:didReceiveVideoChunk:identifier:offset:length:total:filename:collection:originalFilename:complete:", self, v7, v56, v45, v21, v46, v55, v53, v54, v35);
        goto LABEL_29;
      }
      if (objc_msgSend(v11, "hasPrefix:", CFSTR("audio/")))
      {
        +[MKLog log](MKLog, "log");
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218754;
          v58 = (MKPUTRouter *)v45;
          v59 = 2048;
          v60 = v21;
          v61 = 2048;
          v62 = v46;
          v63 = 2112;
          v64 = v52;
          _os_log_impl(&dword_21EC08000, v32, OS_LOG_TYPE_INFO, "offset=%lld, length=%lld, total=%lld, date_added=%@", buf, 0x2Au);
        }

        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        LOBYTE(v35) = v44;
        objc_msgSend(WeakRetained, "router:didReceiveAudioChunk:identifier:offset:length:total:filename:originalFilename:dateAdded:complete:", self, v7, v56, v45, v21, v46, v55, v54, v52, v35);
        goto LABEL_29;
      }
    }
    else
    {
      +[MKLog log](MKLog, "log");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v58 = self;
        v59 = 2112;
        v60 = (uint64_t)v56;
        v61 = 2112;
        v62 = (uint64_t)v55;
        _os_log_error_impl(&dword_21EC08000, v26, OS_LOG_TYPE_ERROR, "%@ tried to access but access is denied. path=%@, filename=%@", buf, 0x20u);
      }
    }
    v27 = v49;
LABEL_16:
    v29 = v47;
    v30 = v48;
    goto LABEL_17;
  }
LABEL_18:

}

- (BOOL)isAllowedPath:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "pathComponents");
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if ((objc_msgSend(v9, "isEqualToString:", CFSTR(".."), (_QWORD)v12) & 1) != 0
            || (objc_msgSend(v9, "isEqualToString:", CFSTR("~")) & 1) != 0)
          {
            v10 = 0;
            goto LABEL_15;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        v10 = 1;
        if (v6)
          continue;
        break;
      }
    }
    else
    {
      v10 = 1;
    }
LABEL_15:

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (MKPUTRouterDelegate)delegate
{
  return (MKPUTRouterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)supportedContentTypes
{
  return self->_supportedContentTypes;
}

- (void)setSupportedContentTypes:(id)a3
{
  objc_storeStrong((id *)&self->_supportedContentTypes, a3);
}

- (NSArray)supportedTransferEncodings
{
  return self->_supportedTransferEncodings;
}

- (void)setSupportedTransferEncodings:(id)a3
{
  objc_storeStrong((id *)&self->_supportedTransferEncodings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedTransferEncodings, 0);
  objc_storeStrong((id *)&self->_supportedContentTypes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_routing, 0);
}

@end
