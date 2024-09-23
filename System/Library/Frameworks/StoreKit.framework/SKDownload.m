@implementation SKDownload

- (SKDownload)init
{
  SKDownload *v2;
  SKDownloadInternal *v3;
  id internal;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKDownload;
  v2 = -[SKDownload init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SKDownloadInternal);
    internal = v2->_internal;
    v2->_internal = v3;

    *((NSTimeInterval *)v2->_internal + 7) = SKDownloadTimeRemainingUnknown;
  }
  return v2;
}

- (NSNumber)_downloadID
{
  return (NSNumber *)*((id *)self->_internal + 1);
}

- (NSString)contentIdentifier
{
  return (NSString *)*((id *)self->_internal + 2);
}

- (SKDownloadState)state
{
  return *((_QWORD *)self->_internal + 3);
}

- (SKDownloadState)downloadState
{
  return *((_QWORD *)self->_internal + 3);
}

- (NSURL)contentURL
{
  return (NSURL *)*((id *)self->_internal + 6);
}

- (float)progress
{
  return *((float *)self->_internal + 8);
}

- (uint64_t)contentLength
{
  return objc_msgSend(*((id *)self->_internal + 8), "longLongValue");
}

- (uint64_t)expectedContentLength
{
  return objc_msgSend(*((id *)self->_internal + 8), "longLongValue");
}

- (NSString)contentVersion
{
  return (NSString *)*((id *)self->_internal + 9);
}

- (NSError)error
{
  return (NSError *)*((id *)self->_internal + 5);
}

- (NSTimeInterval)timeRemaining
{
  return *((double *)self->_internal + 7);
}

- (SKPaymentTransaction)transaction
{
  return (SKPaymentTransaction *)objc_loadWeakRetained((id *)self->_internal + 10);
}

- (void)_applyChangeset:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "contentLength");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[SKDownload _setContentLength:](self, "_setContentLength:", v4);
  objc_msgSend(v10, "contentURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[SKDownload _setContentURL:](self, "_setContentURL:", v5);
  objc_msgSend(v10, "downloadState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[SKDownload _setDownloadState:](self, "_setDownloadState:", objc_msgSend(v6, "integerValue"));
  objc_msgSend(v10, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[SKDownload _setError:](self, "_setError:", v7);
  objc_msgSend(v10, "progress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "floatValue");
    -[SKDownload _setProgress:](self, "_setProgress:");
  }
  objc_msgSend(v10, "timeRemaining");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "doubleValue");
    -[SKDownload _setTimeRemaining:](self, "_setTimeRemaining:");
  }

}

- (void)_setDownloadID:(id)a3
{
  uint64_t v4;
  _QWORD *internal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  internal = self->_internal;
  v6 = (void *)internal[1];
  internal[1] = v4;

}

- (void)_setContentIdentifier:(id)a3
{
  uint64_t v4;
  _QWORD *internal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  internal = self->_internal;
  v6 = (void *)internal[2];
  internal[2] = v4;

}

- (void)_setContentLength:(id)a3
{
  objc_storeStrong((id *)self->_internal + 8, a3);

}

- (void)_setContentURL:(id)a3
{
  uint64_t v4;
  _QWORD *internal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  internal = self->_internal;
  v6 = (void *)internal[6];
  internal[6] = v4;

}

- (void)_setDownloadState:(int64_t)a3
{
  *((_QWORD *)self->_internal + 3) = a3;
}

- (void)_setError:(id)a3
{
  uint64_t v4;
  _QWORD *internal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  internal = self->_internal;
  v6 = (void *)internal[5];
  internal[5] = v4;

}

- (void)_setProgress:(float)a3
{
  *((float *)self->_internal + 8) = a3;
}

- (void)_setTimeRemaining:(double)a3
{
  *((double *)self->_internal + 7) = a3;
}

- (void)_setTransaction:(id)a3
{
  id *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (id *)((char *)self->_internal + 80);
  v5 = a3;
  objc_storeWeak(v4, v5);
  objc_msgSend(v5, "payment");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "productIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKDownload _setContentIdentifier:](self, "_setContentIdentifier:", v6);

}

- (void)_setVersion:(id)a3
{
  uint64_t v4;
  _QWORD *internal;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  internal = self->_internal;
  v6 = (void *)internal[9];
  internal[9] = v4;

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[SKDownload _downloadID](self, "_downloadID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_downloadID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[SKDownload contentIdentifier](self, "contentIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (SKDownload)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SKDownload *v6;
  uint64_t v8;
  _QWORD *internal;
  void *v10;
  CFDictionaryRef v11;
  _QWORD *v12;
  void *v13;
  float v14;
  CFDictionaryRef v15;
  _QWORD *v16;
  void *v17;
  SKDownload *v18;
  double value;
  CFDictionaryRef v20;
  char isKindOfClass;
  void *v22;
  CFDictionaryRef v23;
  uint64_t v24;
  _QWORD *v25;
  void *v26;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1AF43BC3C](v4) == MEMORY[0x1E0C812F8])
  {
    v6 = -[SKDownload init](self, "init");
    if (!v6)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", xpc_dictionary_get_int64(v5, "0"));
    v8 = objc_claimAutoreleasedReturnValue();
    internal = v6->_internal;
    v10 = (void *)internal[8];
    internal[8] = v8;

    objc_opt_class();
    v11 = SKXPCDictionaryCopyCFObjectWithClass(v5, "2");
    v12 = v6->_internal;
    v13 = (void *)v12[1];
    v12[1] = v11;

    *((_QWORD *)v6->_internal + 3) = xpc_dictionary_get_int64(v5, "3");
    v14 = xpc_dictionary_get_double(v5, "5");
    *((float *)v6->_internal + 8) = v14;
    objc_opt_class();
    v15 = SKXPCDictionaryCopyCFObjectWithClass(v5, "7");
    v16 = v6->_internal;
    v17 = (void *)v16[9];
    v16[9] = v15;

    xpc_dictionary_get_value(v5, "6");
    v18 = (SKDownload *)objc_claimAutoreleasedReturnValue();
    self = v18;
    if (v18 && MEMORY[0x1AF43BC3C](v18) == MEMORY[0x1E0C81300])
      value = xpc_double_get_value(self);
    else
      value = SKDownloadTimeRemainingUnknown;
    *((double *)v6->_internal + 7) = value;
    objc_opt_class();
    v20 = SKXPCDictionaryCopyCFObjectWithClass(v5, "1");
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v20);
    else
      v22 = 0;
    objc_storeStrong((id *)v6->_internal + 6, v22);
    if ((isKindOfClass & 1) != 0)

    objc_opt_class();
    v23 = SKXPCDictionaryCopyCFObjectWithClass(v5, "4");

    if (v23)
    {
      SKGetErrorForData((uint64_t)v23);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v6->_internal;
      v26 = (void *)v25[5];
      v25[5] = v24;

    }
  }
  else
  {
    v6 = 0;
  }

LABEL_5:
  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  __CFString *v4;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "0", objc_msgSend(*((id *)self->_internal + 8), "longLongValue"));
  SKXPCDictionarySetCFObject(v3, "1", (__CFString *)objc_msgSend(*((id *)self->_internal + 6), "absoluteString"));
  SKXPCDictionarySetCFObject(v3, "2", *((__CFString **)self->_internal + 1));
  xpc_dictionary_set_int64(v3, "3", *((_QWORD *)self->_internal + 3));
  v4 = (__CFString *)SKGetDataForError(*((_QWORD *)self->_internal + 5));
  SKXPCDictionarySetCFObject(v3, "4", v4);
  xpc_dictionary_set_double(v3, "5", *((float *)self->_internal + 8));
  xpc_dictionary_set_double(v3, "6", *((double *)self->_internal + 7));
  SKXPCDictionarySetCFObject(v3, "7", *((__CFString **)self->_internal + 9));
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_internal, 0);
}

@end
