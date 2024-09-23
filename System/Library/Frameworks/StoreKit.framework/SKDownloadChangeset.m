@implementation SKDownloadChangeset

+ (id)changesetWithDownloadID:(id)a3 state:(int64_t)a4
{
  id v5;
  SKDownloadChangeset *v6;
  void *v7;

  v5 = a3;
  v6 = objc_alloc_init(SKDownloadChangeset);
  -[SKDownloadChangeset setDownloadID:](v6, "setDownloadID:", v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKDownloadChangeset setDownloadState:](v6, "setDownloadState:", v7);

  return v6;
}

- (SKDownloadChangeset)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SKDownloadChangeset *v6;
  CFDictionaryRef v8;
  uint64_t v9;
  NSURL *contentURL;
  CFDictionaryRef v11;
  CFDictionaryRef v12;
  uint64_t v13;
  NSError *error;
  CFDictionaryRef v15;
  NSNumber *contentLength;
  CFDictionaryRef v17;
  NSNumber *downloadID;
  CFDictionaryRef v19;
  NSNumber *downloadState;
  CFDictionaryRef v21;
  NSNumber *progress;
  CFDictionaryRef v23;
  NSNumber *timeRemaining;
  objc_super v25;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1AF43BC3C](v4) == MEMORY[0x1E0C812F8])
  {
    v25.receiver = self;
    v25.super_class = (Class)SKDownloadChangeset;
    v6 = -[SKDownloadChangeset init](&v25, sel_init);
    if (v6)
    {
      objc_opt_class();
      v8 = SKXPCDictionaryCopyCFObjectWithClass(v5, "1");
      if (v8)
      {
        v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v8);
        contentURL = v6->_contentURL;
        v6->_contentURL = (NSURL *)v9;
      }
      else
      {
        contentURL = v6->_contentURL;
        v6->_contentURL = 0;
      }

      objc_opt_class();
      v11 = SKXPCDictionaryCopyCFObjectWithClass(v5, "4");
      v12 = v11;
      if (v11)
      {
        SKGetErrorForData((uint64_t)v11);
        v13 = objc_claimAutoreleasedReturnValue();
        error = v6->_error;
        v6->_error = (NSError *)v13;

      }
      objc_opt_class();
      v15 = SKXPCDictionaryCopyCFObjectWithClass(v5, "0");
      contentLength = v6->_contentLength;
      v6->_contentLength = (NSNumber *)v15;

      objc_opt_class();
      v17 = SKXPCDictionaryCopyCFObjectWithClass(v5, "2");
      downloadID = v6->_downloadID;
      v6->_downloadID = (NSNumber *)v17;

      objc_opt_class();
      v19 = SKXPCDictionaryCopyCFObjectWithClass(v5, "3");
      downloadState = v6->_downloadState;
      v6->_downloadState = (NSNumber *)v19;

      objc_opt_class();
      v21 = SKXPCDictionaryCopyCFObjectWithClass(v5, "5");
      progress = v6->_progress;
      v6->_progress = (NSNumber *)v21;

      objc_opt_class();
      v23 = SKXPCDictionaryCopyCFObjectWithClass(v5, "6");
      timeRemaining = v6->_timeRemaining;
      v6->_timeRemaining = (NSNumber *)v23;

    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  __CFString *v4;

  v3 = xpc_dictionary_create(0, 0, 0);
  SKXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_contentLength);
  SKXPCDictionarySetCFObject(v3, "1", (__CFString *)-[NSURL absoluteString](self->_contentURL, "absoluteString"));
  SKXPCDictionarySetCFObject(v3, "2", (__CFString *)self->_downloadID);
  SKXPCDictionarySetCFObject(v3, "3", (__CFString *)self->_downloadState);
  v4 = (__CFString *)SKGetDataForError((uint64_t)self->_error);
  SKXPCDictionarySetCFObject(v3, "4", v4);
  SKXPCDictionarySetCFObject(v3, "5", (__CFString *)self->_progress);
  SKXPCDictionarySetCFObject(v3, "6", (__CFString *)self->_timeRemaining);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSNumber copyWithZone:](self->_contentLength, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSURL copyWithZone:](self->_contentURL, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSNumber copyWithZone:](self->_downloadID, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSNumber copyWithZone:](self->_downloadState, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[NSError copyWithZone:](self->_error, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  v16 = -[NSNumber copyWithZone:](self->_progress, "copyWithZone:", a3);
  v17 = (void *)v5[6];
  v5[6] = v16;

  v18 = -[NSNumber copyWithZone:](self->_timeRemaining, "copyWithZone:", a3);
  v19 = (void *)v5[7];
  v5[7] = v18;

  return v5;
}

- (NSNumber)contentLength
{
  return self->_contentLength;
}

- (void)setContentLength:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (void)setContentURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)downloadID
{
  return self->_downloadID;
}

- (void)setDownloadID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)downloadState
{
  return self->_downloadState;
}

- (void)setDownloadState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)timeRemaining
{
  return self->_timeRemaining;
}

- (void)setTimeRemaining:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRemaining, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_downloadState, 0);
  objc_storeStrong((id *)&self->_downloadID, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_contentLength, 0);
}

@end
