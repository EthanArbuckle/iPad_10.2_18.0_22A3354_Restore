@implementation DECompressUtil

+ (void)initZStream:(z_stream_s *)a3
{
  if (a3)
  {
    a3->next_in = 0;
    a3->avail_in = 0;
    a3->next_out = 0;
    a3->avail_out = 0;
    a3->zfree = 0;
    a3->opaque = 0;
    a3->zalloc = 0;
  }
}

+ (BOOL)advanceZStream:(z_stream_s *)a3 function:(void *)a4 input:(id)a5 output:(id)a6 flush:(int)a7 streamEnded:(BOOL *)a8
{
  uint64_t v9;
  id v13;
  id v14;
  void *v15;
  BOOL v16;
  id v17;
  uLong total_out;
  int i;
  uLong v20;
  id v21;

  v9 = *(_QWORD *)&a7;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  v16 = 0;
  if (a3 && v13 && v14 && a8)
  {
    a3->avail_in = objc_msgSend(v13, "length");
    a3->next_in = (Bytef *)objc_msgSend(objc_retainAutorelease(v13), "bytes");
    v17 = objc_retainAutorelease(v15);
    a3->next_out = (Bytef *)objc_msgSend(v17, "mutableBytes");
    a3->avail_out = objc_msgSend(v17, "length");
    total_out = a3->total_out;
    for (i = ((uint64_t (*)(z_stream_s *, uint64_t))a4)(a3, v9);
          ;
          i = ((uint64_t (*)(z_stream_s *, uint64_t))a4)(a3, v9))
    {
      v16 = i == -5;
      if (i != -5)
      {
        if (i)
          break;
      }
      v20 = a3->total_out - total_out;
      if (i == -5)
      {
        if (a3->avail_out)
          goto LABEL_14;
        objc_msgSend(v17, "setLength:", 2 * objc_msgSend(v17, "length"));
      }
      v21 = objc_retainAutorelease(v17);
      a3->next_out = (Bytef *)(objc_msgSend(v21, "mutableBytes") + v20);
      a3->avail_out = objc_msgSend(v21, "length") - v20;
    }
    if (i == 1)
    {
      *a8 = 1;
      v20 = a3->total_out - total_out;
LABEL_14:
      objc_msgSend(v17, "setLength:", v20);
      v16 = 1;
      goto LABEL_16;
    }
    +[DELogging error:](DELogging, "error:", CFSTR("Unexpected inflate status"));
  }
LABEL_16:

  return v16;
}

@end
