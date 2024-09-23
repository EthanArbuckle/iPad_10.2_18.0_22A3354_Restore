@implementation PCPrintJob

- (id)initJob:(id)a3
{
  id v4;
  id v5;
  void *v6;
  PCPrintJob *v7;
  objc_super v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "localJobID");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "updatableState"));

  v9.receiver = self;
  v9.super_class = (Class)PCPrintJob;
  v7 = -[PCPrintJob initWithJobID:updateState:](&v9, "initWithJobID:updateState:", v5, v6);

  return v7;
}

+ (id)jobs
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___PCPrintJob;
  v4 = objc_msgSendSuper2(&v16, "jobs");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = -[PCPrintJob initJob:]([PCPrintJob alloc], "initJob:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9));
        if (v10)
          objc_msgSend(v3, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v7);
  }

  return v3;
}

- (NSDictionary)jobInfo
{
  return self->_jobInfo;
}

- (void)setJobInfo:(id)a3
{
  objc_storeStrong((id *)&self->_jobInfo, a3);
}

- (NSData)thumbnailImageData
{
  return self->_thumbnailImageData;
}

- (void)setThumbnailImageData:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailImageData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImageData, 0);
  objc_storeStrong((id *)&self->_jobInfo, 0);
}

@end
