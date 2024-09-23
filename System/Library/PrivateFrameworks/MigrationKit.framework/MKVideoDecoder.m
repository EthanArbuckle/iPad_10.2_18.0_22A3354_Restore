@implementation MKVideoDecoder

- (MKVideoDecoder)init
{
  MKVideoDecoder *v2;
  MKVideoDecoder *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKVideoDecoder;
  v2 = -[MKVideoDecoder init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MKVideoDecoder setMediaType:](v2, "setMediaType:", *MEMORY[0x24BDB1D50]);
  return v3;
}

- (id)extractFormatOfAsset:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  dispatch_semaphore_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  NSObject *v18;
  objc_super v19;
  _QWORD v20[4];
  NSObject *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v4 = a3;
  if (!v4)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_7;
  v6 = (void *)v5;
  objc_msgSend(MEMORY[0x24BDB26C8], "URLAssetWithURL:options:", v5, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {

LABEL_7:
    v12 = 0;
    v15 = &stru_24E35A3B8;
    goto LABEL_8;
  }
  v8 = (void *)v7;
  v9 = dispatch_semaphore_create(0);
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  -[MKVideoDecoder mediaType](self, "mediaType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __39__MKVideoDecoder_extractFormatOfAsset___block_invoke;
  v20[3] = &unk_24E3592C8;
  v22 = &v24;
  v23 = &v30;
  v11 = v9;
  v21 = v11;
  objc_msgSend(v8, "loadTracksWithMediaType:completionHandler:", v10, v20);

  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  v12 = (id)v25[5];
  if (objc_msgSend((id)v31[5], "count"))
  {
    objc_msgSend((id)v31[5], "objectAtIndex:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "formatDescriptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKVideoDecoder mediaFormatWithFormatDescriptions:](self, "mediaFormatWithFormatDescriptions:", v14);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = &stru_24E35A3B8;
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  if (v12)
  {
    +[MKLog log](MKLog, "log");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[MKVideoDecoder extractFormatOfAsset:].cold.1((uint64_t)v4, v12, v18);

  }
LABEL_8:
  if (!-[__CFString length](v15, "length"))
  {
    v19.receiver = self;
    v19.super_class = (Class)MKVideoDecoder;
    -[MKFileDecoder extractFormatOfAsset:](&v19, sel_extractFormatOfAsset_, v4);
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (__CFString *)v16;
  }

  return v15;
}

void __39__MKVideoDecoder_extractFormatOfAsset___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)mediaFormatWithFormatDescriptions:(id)a3
{
  id v3;
  id v4;
  unint64_t v5;
  void *v6;
  CMMediaType MediaType;
  void *v8;
  FourCharCode MediaSubType;
  void *v10;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  if (objc_msgSend(v3, "count"))
  {
    v5 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      MediaType = CMFormatDescriptionGetMediaType((CMFormatDescriptionRef)v6);
      FourCCString(MediaType);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)v6);
      FourCCString(MediaSubType);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR("%@/%@"), v8, v10);
      if (objc_msgSend(v3, "count") - 1 > v5)
        objc_msgSend(v4, "appendString:", CFSTR(","));

      ++v5;
    }
    while (objc_msgSend(v3, "count") > v5);
  }

  return v4;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
  self->_mediaType = (NSString *)a3;
}

- (void)extractFormatOfAsset:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_21EC08000, a3, OS_LOG_TYPE_ERROR, "could not extract a format of asset. path=%@, error=%@", (uint8_t *)&v6, 0x16u);

}

@end
