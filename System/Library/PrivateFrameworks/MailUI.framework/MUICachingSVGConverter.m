@implementation MUICachingSVGConverter

- (MUICachingSVGConverter)init
{
  MUICachingSVGConverter *v2;
  NSCache *v3;
  NSCache *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUICachingSVGConverter;
  v2 = -[MUICachingSVGConverter init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    cache = v2->_cache;
    v2->_cache = v3;

  }
  return v2;
}

- (void)imageForSVGData:(id)a3 size:(CGSize)a4 scale:(double)a5 completionHandler:(id)a6
{
  double height;
  double width;
  id v11;
  void (**v12)(id, void *);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  MUICachingSVGConverter *v32;
  id v33;
  void (**v34)(id, void *);

  height = a4.height;
  width = a4.width;
  v11 = a3;
  v12 = (void (**)(id, void *))a6;
  +[MUICachingSVGConverter _keyForData:size:scale:](width, height, a5, (uint64_t)MUICachingSVGConverter, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUICachingSVGConverter cache](self, "cache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "UIImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v16);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "temporaryDirectory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "URLByAppendingPathComponent:", CFSTR("MailBrandIndicators"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "fileExistsAtPath:", v19);

    if ((v20 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v16, 1, 0, 0);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "ef_UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "URLByAppendingPathComponent:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "URLByAppendingPathExtension:", CFSTR("svg"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "writeToURL:atomically:", v24, 0);
    objc_msgSend(MEMORY[0x1E0CD32D0], "sharedGenerator");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD32C8]), "initWithFileAtURL:size:scale:representationTypes:", v24, 4, width, height, a5);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __71__MUICachingSVGConverter_imageForSVGData_size_scale_completionHandler___block_invoke;
    v29[3] = &unk_1E99E2810;
    v30 = v17;
    v31 = v24;
    v32 = self;
    v33 = v13;
    v34 = v12;
    v27 = v24;
    v28 = v17;
    objc_msgSend(v25, "generateBestRepresentationForRequest:completionHandler:", v26, v29);

  }
}

+ (id)_keyForData:(double)a3 size:(uint64_t)a4 scale:(void *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a5;
  objc_opt_self();
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v8, "ef_md5Digest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "ef_hexString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@.%f.%f.%f"), v11, *(_QWORD *)&a2, *(_QWORD *)&a1, *(_QWORD *)&a3);

  return v12;
}

void __71__MUICachingSVGConverter_imageForSVGData_size_scale_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "removeItemAtURL:error:", *(_QWORD *)(a1 + 40), 0);
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 48), "cache");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, *(_QWORD *)(a1 + 56));

  }
  v4 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v6, "UIImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

}

- (NSCache)cache
{
  return self->_cache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
