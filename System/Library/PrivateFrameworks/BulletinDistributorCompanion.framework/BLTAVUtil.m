@implementation BLTAVUtil

+ (void)transcodeURL:(id)a3 outURL:(id)a4 maxBytes:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  NSObject *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDB21C0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB26C8]), "initWithURL:options:", v10, v13);
  objc_msgSend(v14, "tracksWithMediaType:", *MEMORY[0x24BDB1D50]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  objc_msgSend(v14, "tracksWithMediaType:", *MEMORY[0x24BDB1CF0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  blt_general_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v26 = v14;
    v27 = 2112;
    v28 = v10;
    v29 = 1024;
    v30 = v16;
    v31 = 1024;
    v32 = v18;
    _os_log_impl(&dword_2173D9000, v19, OS_LOG_TYPE_DEFAULT, "Transcoding: created asset %@ from URL: %@ with %d video tracks, %d audio tracks", buf, 0x22u);
  }

  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __53__BLTAVUtil_transcodeURL_outURL_maxBytes_completion___block_invoke;
  v22[3] = &unk_24D7626B0;
  v23 = v11;
  v24 = v12;
  v20 = v12;
  v21 = v11;
  objc_msgSend(a1, "_transcodeVideoAsync:outURL:maxBytes:completionHandler:", v14, v21, a5, v22);

}

void __53__BLTAVUtil_transcodeURL_outURL_maxBytes_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "absoluteURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v4, "attributesOfItemAtPath:error:", v6, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  v9 = objc_msgSend(v7, "fileSize");

  blt_general_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v15 = v11;
    v16 = 2048;
    v17 = v9;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_2173D9000, v10, OS_LOG_TYPE_DEFAULT, "Transcoding: File %@ has size %llu with error %@", buf, 0x20u);
  }

  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v3);

}

+ (void)_transcodeVideoAsync:(id)a3 outURL:(id)a4 maxBytes:(unint64_t)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  id v27;
  NSObject *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v9, "tracksWithMediaType:", *MEMORY[0x24BDB1D50]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  objc_msgSend(v9, "tracksWithMediaType:", *MEMORY[0x24BDB1CF0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  v16 = (id)*MEMORY[0x24BDB19C8];
  if (v13)
    goto LABEL_4;
  if (v15)
  {
    v17 = (id)*MEMORY[0x24BDB19D0];

    v16 = v17;
LABEL_4:
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB23A8]), "initWithAsset:presetName:", v9, v16);
    blt_general_log();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v20)
      {
        objc_msgSend(v18, "supportedFileTypes");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v33 = v21;
        _os_log_impl(&dword_2173D9000, v19, OS_LOG_TYPE_DEFAULT, "Transcoding: Supported file types: %@", buf, 0xCu);

      }
      objc_msgSend(v18, "supportedFileTypes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndex:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      blt_general_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v23;
        _os_log_impl(&dword_2173D9000, v24, OS_LOG_TYPE_DEFAULT, "Transcoding:   outputFileType: %@", buf, 0xCu);
      }

      if (v23)
      {
        objc_msgSend(v18, "setOutputFileType:", v23);
        objc_msgSend(v18, "setFileLengthLimit:", a5);
        objc_msgSend(v18, "setOutputURL:", v10);
        blt_general_log();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v18, "outputURL");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v33 = v16;
          v34 = 2112;
          v35 = v26;
          _os_log_impl(&dword_2173D9000, v25, OS_LOG_TYPE_DEFAULT, "Transcoding:     Preset name: %@, outputURL: %@", buf, 0x16u);

        }
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __68__BLTAVUtil__transcodeVideoAsync_outURL_maxBytes_completionHandler___block_invoke;
        v29[3] = &unk_24D762270;
        v30 = v18;
        v31 = v11;
        objc_msgSend(v30, "exportAsynchronouslyWithCompletionHandler:", v29);

        v27 = v30;
      }
      else
      {
        blt_general_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2173D9000, v28, OS_LOG_TYPE_DEFAULT, "Transcoding: Could not find a valid outputType for Message presets", buf, 2u);
        }

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.bulletindistributor.avutil"), 3, 0);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        if (v11)
          (*((void (**)(id, id))v11 + 2))(v11, v27);
      }

    }
    else
    {
      if (v20)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2173D9000, v19, OS_LOG_TYPE_DEFAULT, "Transcoding: Could not create export session with Message presets", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.bulletindistributor.avutil"), 3, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        (*((void (**)(id, void *))v11 + 2))(v11, v23);
    }

    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.bulletindistributor.avutil"), 1, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    (*((void (**)(id, void *))v11 + 2))(v11, v18);
LABEL_23:

}

void __68__BLTAVUtil__transcodeVideoAsync_outURL_maxBytes_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "status");
  if (v2 == 5)
  {
    blt_general_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_2173D9000, v7, OS_LOG_TYPE_DEFAULT, "Transcoding: Export canceled", (uint8_t *)&v11, 2u);
    }

    v5 = (void *)MEMORY[0x24BDD1540];
    v6 = 2;
    goto LABEL_9;
  }
  if (v2 == 4)
  {
    blt_general_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "error");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_2173D9000, v3, OS_LOG_TYPE_DEFAULT, "Transcoding: Export failed: %@", (uint8_t *)&v11, 0xCu);

    }
    v5 = (void *)MEMORY[0x24BDD1540];
    v6 = 3;
LABEL_9:
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.bulletindistributor.avutil"), v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  blt_general_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_2173D9000, v9, OS_LOG_TYPE_DEFAULT, "Transcoding: Export succeeded!", (uint8_t *)&v11, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "outputURL");
  v8 = 0;
LABEL_13:
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v8);

}

@end
