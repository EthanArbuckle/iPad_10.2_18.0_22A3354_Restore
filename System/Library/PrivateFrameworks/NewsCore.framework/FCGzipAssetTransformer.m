@implementation FCGzipAssetTransformer

+ (id)sharedInstance
{
  if (qword_1ED0F88F0 != -1)
    dispatch_once(&qword_1ED0F88F0, &__block_literal_global_178);
  return (id)_MergedGlobals_221;
}

void __40__FCGzipAssetTransformer_sharedInstance__block_invoke()
{
  FCGzipAssetTransformer *v0;
  void *v1;

  v0 = objc_alloc_init(FCGzipAssetTransformer);
  v1 = (void *)_MergedGlobals_221;
  _MergedGlobals_221 = (uint64_t)v0;

}

- (BOOL)transformAssetDataFromFilePath:(id)a3 toFilePath:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  BOOL v19;
  int v21;
  id v22;
  uint64_t v23;
  Bytef *next_out;
  id v25;
  uInt *p_avail_out;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  z_stream v33;

  v8 = (void *)MEMORY[0x1E0C99DB0];
  v9 = a4;
  objc_msgSend(v8, "inputStreamWithFileAtPath:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E48], "outputStreamToFileAtPath:append:", v9, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "open");
  objc_msgSend(v11, "open");
  v12 = v10;
  v13 = v11;
  if (self)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 0x2000);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 0x2000);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&v33.avail_in, 0, 104);
    v16 = objc_retainAutorelease(v14);
    v33.next_in = (Bytef *)objc_msgSend(v16, "bytes");
    v17 = objc_retainAutorelease(v15);
    v33.next_out = (Bytef *)objc_msgSend(v17, "bytes", v33.next_in);
    v33.avail_out = objc_msgSend(v17, "length");
    if (inflateInit2_(&v33, 47, "1.2.12", 112))
    {
LABEL_3:
      v18 = 0;
    }
    else
    {
      do
      {
        while (1)
        {
          v21 = inflate(&v33, 0);
          if (v21 != -5)
            break;
          if (v33.avail_in)
          {
            v22 = objc_retainAutorelease(v17);
            v23 = objc_msgSend(v22, "bytes");
            next_out = v33.next_out;
            v25 = objc_retainAutorelease(v22);
            if (objc_msgSend(v13, "write:maxLength:", v23, &next_out[-objc_msgSend(v25, "bytes")]) == -1)
            {
              v32 = v13;
              goto LABEL_26;
            }
            v18 = objc_retainAutorelease(v25);
            v33.next_out = (Bytef *)objc_msgSend(v18, "bytes");
            LODWORD(v18) = objc_msgSend(v18, "length");
            p_avail_out = &v33.avail_out;
          }
          else
          {
            v27 = objc_retainAutorelease(v16);
            v28 = objc_msgSend(v12, "read:maxLength:", objc_msgSend(v27, "mutableBytes"), objc_msgSend(v27, "length"));
            if (v28 == -1)
            {
              v32 = v12;
              goto LABEL_26;
            }
            v18 = (id)v28;
            if (!v28)
              goto LABEL_4;
            v33.next_in = (Bytef *)objc_msgSend(objc_retainAutorelease(v27), "bytes");
            p_avail_out = &v33.avail_in;
          }
          *p_avail_out = v18;
        }
      }
      while (!v21);
      if (v21 != 1)
        goto LABEL_3;
      v29 = objc_retainAutorelease(v17);
      v30 = objc_msgSend(v29, "bytes");
      v31 = objc_msgSend(v13, "write:maxLength:", v30, &v33.next_out[-objc_msgSend(objc_retainAutorelease(v29), "bytes")]);
      v32 = v13;
      if (v31 != -1)
      {
        v18 = 0;
        v19 = 1;
        goto LABEL_5;
      }
LABEL_26:
      objc_msgSend(v32, "streamError", v33.next_in);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_4:
    v19 = 0;
LABEL_5:
    if (inflateEnd(&v33))
      v19 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v18);

  }
  else
  {
    v19 = 0;
  }

  objc_msgSend(v12, "close");
  objc_msgSend(v13, "close");

  return v19;
}

@end
