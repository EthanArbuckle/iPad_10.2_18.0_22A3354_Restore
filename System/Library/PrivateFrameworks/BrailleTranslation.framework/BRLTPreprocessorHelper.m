@implementation BRLTPreprocessorHelper

+ (id)mergeLocationMap:(id)a3 withLocationMap:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  unint64_t *v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t *v17;
  void *v18;
  uint64_t v20;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = objc_retainAutorelease(v6);
    v9 = (unint64_t *)objc_msgSend(v8, "bytes");
    v10 = objc_msgSend(v8, "length");
    v11 = objc_retainAutorelease(v5);
    v12 = objc_msgSend(v11, "bytes");
    v13 = objc_msgSend(v11, "length");
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", objc_msgSend(v8, "length"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 >= 8)
    {
      v15 = v13 >> 3;
      v16 = v10 >> 3;
      do
      {
        if (*v9 >= v15)
        {
          v18 = v14;
          v17 = v9;
        }
        else
        {
          v20 = *(_QWORD *)(v12 + 8 * *v9);
          v17 = (unint64_t *)&v20;
          v18 = v14;
        }
        objc_msgSend(v18, "appendBytes:length:", v17, 8);
        ++v9;
        --v16;
      }
      while (v16);
    }
  }
  else
  {
    v14 = v5;
  }

  return v14;
}

+ (void)mergePreprocessorOutputLocationMap:(id)a3 outputToPreprocessedMap:(int *)a4 outputLen:(int64_t)a5 outputToTextMap:(id *)a6
{
  id v9;
  int64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  id v15;

  v9 = a3;
  if (v9 && a4 && a6)
  {
    v10 = 8 * a5;
    v15 = v9;
    v11 = malloc_type_malloc(8 * a5, 0x535E06BDuLL);
    v12 = objc_msgSend(objc_retainAutorelease(v15), "bytes");
    if (a5 >= 1)
    {
      v13 = v11;
      do
      {
        v14 = *a4++;
        *v13++ = *(_QWORD *)(v12 + 8 * v14);
        --a5;
      }
      while (a5);
    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v11, v10);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    free(v11);
    v9 = v15;
  }

}

@end
