@implementation MLTrackImportChapter

- (void)normalizeProperties
{
  NSString *title;
  void *v4;
  NSString *v5;
  NSString *v6;
  NSString *urlTitle;
  NSString *v8;
  NSString *v9;
  id v10;

  title = self->_title;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByTrimmingCharactersInSet:](title, "stringByTrimmingCharactersInSet:", v4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = self->_title;
  self->_title = v5;

  urlTitle = self->_urlTitle;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NSString stringByTrimmingCharactersInSet:](urlTitle, "stringByTrimmingCharactersInSet:", v10);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = self->_urlTitle;
  self->_urlTitle = v8;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  void *v34;

  v3 = (void *)MEMORY[0x1AF43CC0C](self, a2);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", &stru_1E5B66908);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("startMS=%7lu"), -[MLTrackImportChapter startTimeInMilliseconds](self, "startTimeInMilliseconds"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithObjects:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLTrackImportChapter title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    objc_msgSend(v4, "appendString:", CFSTR("t|"));
    v10 = (void *)MEMORY[0x1E0CB3940];
    -[MLTrackImportChapter title](self, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("title='%@'"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v12);

  }
  else
  {
    objc_msgSend(v4, "appendString:", CFSTR(" |"));
  }
  -[MLTrackImportChapter imageData](self, "imageData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v4, "appendString:", CFSTR("i|"));
    v14 = (void *)MEMORY[0x1E0CB3940];
    -[MLTrackImportChapter imageData](self, "imageData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("image=%p"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v16);

  }
  else
  {
    objc_msgSend(v4, "appendString:", CFSTR(" |"));
  }
  -[MLTrackImportChapter imageCacheKey](self, "imageCacheKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v4, "appendString:", CFSTR("ik|"));
    v18 = (void *)MEMORY[0x1E0CB3940];
    -[MLTrackImportChapter imageCacheKey](self, "imageCacheKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("imageKey=%@"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v20);

  }
  else
  {
    objc_msgSend(v4, "appendString:", CFSTR("  |"));
  }
  -[MLTrackImportChapter URL](self, "URL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v4, "appendString:", CFSTR("u|"));
    v22 = (void *)MEMORY[0x1E0CB3940];
    -[MLTrackImportChapter URL](self, "URL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("url=%@"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v24);

  }
  else
  {
    objc_msgSend(v4, "appendString:", CFSTR(" |"));
  }
  -[MLTrackImportChapter URLTitle](self, "URLTitle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "length");

  if (v26)
  {
    objc_msgSend(v4, "appendString:", CFSTR("ut"));
    v27 = (void *)MEMORY[0x1E0CB3940];
    -[MLTrackImportChapter URLTitle](self, "URLTitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("urlTitle='%@'"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v29);

  }
  else
  {
    objc_msgSend(v4, "appendString:", CFSTR("  "));
  }
  v30 = (void *)MEMORY[0x1E0CB3940];
  v31 = (objc_class *)objc_opt_class();
  NSStringFromClass(v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringWithFormat:", CFSTR("<%@: %p - [%@] %@>"), v32, self, v4, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v34;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = -[NSString copy](self->_title, "copy");
  v6 = (void *)*((_QWORD *)v4 + 4);
  *((_QWORD *)v4 + 4) = v5;

  *((_QWORD *)v4 + 3) = self->_startTimeInMilliseconds;
  objc_storeStrong((id *)v4 + 5, self->_url);
  v7 = -[NSString copy](self->_urlTitle, "copy");
  v8 = (void *)*((_QWORD *)v4 + 6);
  *((_QWORD *)v4 + 6) = v7;

  objc_storeStrong((id *)v4 + 1, self->_imageData);
  v9 = -[NSString copy](self->_imageCacheKey, "copy");
  v10 = (void *)*((_QWORD *)v4 + 2);
  *((_QWORD *)v4 + 2) = v9;

  return v4;
}

- (int64_t)compare:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = -[MLTrackImportChapter startTimeInMilliseconds](self, "startTimeInMilliseconds");
  v6 = objc_msgSend(v4, "startTimeInMilliseconds");

  if (v5 < v6)
    return -1;
  else
    return v5 > v6;
}

- (BOOL)isEqualIgnoringTimesAndTitle:(id)a3
{
  id v4;
  NSURL *v5;
  NSString *v6;
  NSString *v7;
  NSURL *url;
  NSString *imageCacheKey;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "URL");
    v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLTitle");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageCacheKey");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    url = self->_url;
    if ((url == v5 || -[NSURL isEqual:](url, "isEqual:", v5))
      && (self->_urlTitle == v6 || -[NSURL isEqual:](self->_url, "isEqual:", v6)))
    {
      imageCacheKey = self->_imageCacheKey;
      if (imageCacheKey == v7)
        v10 = 1;
      else
        v10 = -[NSString isEqual:](imageCacheKey, "isEqual:", v7);
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

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)startTimeInMilliseconds
{
  return self->_startTimeInMilliseconds;
}

- (void)setStartTimeInMilliseconds:(unint64_t)a3
{
  self->_startTimeInMilliseconds = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)URL
{
  return self->_url;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)URLTitle
{
  return self->_urlTitle;
}

- (void)setURLTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)imageCacheKey
{
  return self->_imageCacheKey;
}

- (void)setImageCacheKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlTitle, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_imageCacheKey, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end
