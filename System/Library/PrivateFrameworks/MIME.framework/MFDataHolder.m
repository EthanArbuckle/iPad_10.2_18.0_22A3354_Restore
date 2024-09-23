@implementation MFDataHolder

- (MFDataHolder)init
{
  MFDataHolder *v2;
  uint64_t v3;
  NSMutableArray *datas;
  MFDataHolder *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFDataHolder;
  v2 = -[MFDataHolder init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    datas = v2->_datas;
    v2->_datas = (NSMutableArray *)v3;

    v5 = v2;
  }

  return v2;
}

+ (id)dataHolder
{
  return (id)objc_opt_new();
}

+ (id)dataHolderWithData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithData:", v4);

  return v5;
}

- (MFDataHolder)initWithData:(id)a3
{
  id v4;
  MFDataHolder *v5;
  MFDataHolder *v6;

  v4 = a3;
  v5 = -[MFDataHolder init](self, "init");
  v6 = v5;
  if (v5)
    -[MFDataHolder addData:](v5, "addData:", v4);

  return v6;
}

- (void)addData:(id)a3
{
  id v4;

  v4 = a3;
  -[NSMutableArray addObject:](self->_datas, "addObject:");
  self->_length += objc_msgSend(v4, "length");

}

- (id)data
{
  void *v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[5];
  int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_datas, "count") == 1)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_datas, "objectAtIndexedSubscript:", 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (-[MFDataHolder length](self, "length") <= 0x20000)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", -[MFDataHolder length](self, "length"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = self->_datas;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v7);
          objc_msgSend(v10, "appendData:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
      }
      while (v11);
    }
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MFDataGetDataPath();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mf_makeUniqueFileInDirectory:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_retainAutorelease(v6);
  v8 = open((const char *)-[NSMutableArray fileSystemRepresentation](v7, "fileSystemRepresentation"), 1537, 438);
  v9 = v8;
  if (v8 == -1)
    goto LABEL_17;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  MFProtectFileDescriptor(v8, 3);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __20__MFDataHolder_data__block_invoke;
  v18[3] = &unk_1E5AA1508;
  v18[4] = &v20;
  v19 = v9;
  -[MFDataHolder enumerateByteRangesUsingBlock:](self, "enumerateByteRangesUsingBlock:", v18);
  close(v9);
  if (!*((_BYTE *)v21 + 24))
  {
    _Block_object_dispose(&v20, 8);
LABEL_17:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Could not create cache file at %@ (%d)."), v7, *__error());
    v10 = 0;
    goto LABEL_18;
  }
  +[MFData dataWithContentsOfFile:](MFData, "dataWithContentsOfFile:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v20, 8);
  if (!v10)
    goto LABEL_17;
LABEL_18:

  return v10;
}

ssize_t __20__MFDataHolder_data__block_invoke(uint64_t a1, const void *a2, int a3, size_t __nbyte, _BYTE *a5)
{
  ssize_t result;

  result = write(*(_DWORD *)(a1 + 40), a2, __nbyte);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result == __nbyte;
  *a5 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) ^ 1;
  return result;
}

- (void)enumerateDatasUsingBlock:(id)a3
{
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_datas, "enumerateObjectsUsingBlock:", a3);
}

- (void)enumerateByteRangesUsingBlock:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_datas;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "enumerateByteRangesUsingBlock:", v4, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (unint64_t)numberOfNewlinesNeedingConversion:(BOOL)a3
{
  unint64_t v3;
  _QWORD v5[6];
  BOOL v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[3];
  char v12;

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__MFDataHolder_numberOfNewlinesNeedingConversion___block_invoke;
  v5[3] = &unk_1E5AA1530;
  v5[4] = &v7;
  v5[5] = v11;
  v6 = a3;
  -[MFDataHolder enumerateConvertingNewlinesUsingBlock:](self, "enumerateConvertingNewlinesUsingBlock:", v5);
  v3 = v8[3];
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(v11, 8);
  return v3;
}

uint64_t __50__MFDataHolder_numberOfNewlinesNeedingConversion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a4)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      if (*(_BYTE *)(a1 + 48))
        return 0;
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3 == 0;
  return 1;
}

- (void)enumerateConvertingNewlinesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD v11[3];
  char v12;
  _QWORD v13[4];
  _QWORD v14[3];
  char v15;

  v4 = a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = -86;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__MFDataHolder_enumerateConvertingNewlinesUsingBlock___block_invoke;
  v6[3] = &unk_1E5AA1580;
  v8 = v13;
  v9 = v14;
  v10 = v11;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MFDataHolder enumerateDatasUsingBlock:](self, "enumerateDatasUsingBlock:", v6);

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v14, 8);
}

void __54__MFDataHolder_enumerateConvertingNewlinesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  __int128 v8;
  _QWORD v9[5];
  __int128 v10;
  __int128 v11;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__MFDataHolder_enumerateConvertingNewlinesUsingBlock___block_invoke_2;
  v9[3] = &unk_1E5AA1558;
  v9[4] = *(_QWORD *)(a1 + 32);
  v11 = *(_OWORD *)(a1 + 56);
  v8 = *(_OWORD *)(a1 + 40);
  v7 = (id)v8;
  v10 = v8;
  objc_msgSend(a2, "enumerateByteRangesUsingBlock:", v9);
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) ^ 1;

}

uint64_t __54__MFDataHolder_enumerateConvertingNewlinesUsingBlock___block_invoke_2(uint64_t a1, char *a2, uint64_t a3, unint64_t a4, _BYTE *a5)
{
  unint64_t v8;
  uint64_t result;
  uint64_t v10;
  char *v11;
  char *v12;
  BOOL v13;
  BOOL v14;
  char *v15;
  char *v16;
  uint64_t (*v17)(void);
  int v18;
  BOOL v19;

  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) + a4;
  result = objc_msgSend(*(id *)(a1 + 32), "length");
  v10 = result;
  v11 = a2;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v11 = a2;
    if (*a2 == 10)
    {
      result = (*(uint64_t (**)(_QWORD, void *, uint64_t, _QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), &CRLF, 2, 0, a4 < 2);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = result;
      v11 = a2 + 1;
    }
  }
  v12 = &a2[a4];
  v13 = v8 != v10 && *(v12 - 1) == 13;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v13;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    v14 = v11 >= v12;
  else
    v14 = 1;
  if (!v14)
  {
    while (1)
    {
      v15 = (char *)memchr(v11, 10, v12 - v11);
      if (!v15)
      {
        result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = result;
        goto LABEL_25;
      }
      v16 = v15;
      if (v11 < v15 && *(v15 - 1) == 13)
        break;
      v18 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      result = 0;
      if (v18)
      {
        v17 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
        goto LABEL_17;
      }
LABEL_18:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = result;
      v11 = v16 + 1;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        v19 = v11 >= v12;
      else
        v19 = 1;
      if (v19)
        goto LABEL_25;
    }
    v17 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_17:
    result = v17();
    goto LABEL_18;
  }
LABEL_25:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += a4;
  *a5 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) ^ 1;
  return result;
}

- (unint64_t)length
{
  return self->_length;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datas, 0);
}

@end
