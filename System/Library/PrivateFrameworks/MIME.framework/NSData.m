@implementation NSData

- (NSData)_uudecoded_small
{
  NSData *v1;
  __int128 v2;
  unint64_t v3;
  uint64_t v4;
  char v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD v11[3];
  _OWORD v12[2];
  _QWORD v13[3];
  _QWORD *v14;
  _QWORD v15[3];
  _QWORD *v16;
  uint64_t v17;

  v1 = a1;
  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return v1;
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v12[0] = v2;
  v12[1] = v2;
  v3 = vcvtpd_u64_f64((double)-[NSData length](a1, "length") * 0.74 + 100.0);
  if (v3 <= 0x64)
    v4 = 100;
  else
    v4 = v3;
  OutputBuffer::OutputBuffer((OutputBuffer *)v12, v4);
  memset(v11, 170, sizeof(v11));
  DecodeBuffer::DecodeBuffer((DecodeBuffer *)v11, v1);
  v15[0] = &off_1E5AA0FA0;
  v15[1] = v12;
  v16 = v15;
  v13[0] = &off_1E5AA0FF8;
  v13[1] = v12;
  v14 = v13;
  v5 = DecodeBuffer::parse((DecodeBuffer *)v11, (uint64_t)v15, (uint64_t)v13);
  v6 = v14;
  if (v14 == v13)
  {
    v7 = 4;
    v6 = v13;
  }
  else
  {
    if (!v14)
      goto LABEL_10;
    v7 = 5;
  }
  (*(void (**)(void))(*v6 + 8 * v7))();
LABEL_10:
  v8 = v16;
  if (v16 == v15)
  {
    v9 = 4;
    v8 = v15;
    goto LABEL_14;
  }
  if (v16)
  {
    v9 = 5;
LABEL_14:
    (*(void (**)(void))(*v8 + 8 * v9))();
  }
  if ((v5 & 1) != 0)
  {
    objc_msgSend(*((id *)&v12[0] + 1), "setLength:", *(_QWORD *)&v12[0]);
    v1 = (NSData *)*((id *)&v12[0] + 1);
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

- (NSData)_uudecoded_large
{
  NSData *v1;
  __int128 v2;
  FILE *v3;
  char v6;
  char v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD v12[3];
  __int128 v13;
  FILE *v14[2];
  _QWORD v15[3];
  _QWORD *v16;
  _QWORD v17[3];
  _QWORD *v18;
  uint64_t v19;

  v1 = a1;
  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v13 = v2;
    *(_OWORD *)v14 = v2;
    TemporaryFile::TemporaryFile((TemporaryFile *)&v13);
    v3 = v14[0];
    if ((int)v13 < 1 || v14[0] == 0)
    {
      v1 = 0;
      if (!v14[0])
      {
LABEL_9:

        return v1;
      }
LABEL_8:
      fclose(v3);
      goto LABEL_9;
    }
    memset(v12, 170, sizeof(v12));
    DecodeBuffer::DecodeBuffer((DecodeBuffer *)v12, v1);
    v17[0] = &off_1E5AA0EF0;
    v17[1] = &v13;
    v18 = v17;
    v15[0] = &off_1E5AA0F48;
    v15[1] = &v13;
    v16 = v15;
    v6 = DecodeBuffer::parse((DecodeBuffer *)v12, (uint64_t)v17, (uint64_t)v15);
    v7 = v6;
    v8 = v16;
    if (v16 == v15)
    {
      v9 = 4;
      v8 = v15;
    }
    else
    {
      if (!v16)
        goto LABEL_16;
      v9 = 5;
    }
    (*(void (**)(void))(*v8 + 8 * v9))();
LABEL_16:
    v10 = v18;
    if (v18 == v17)
    {
      v11 = 4;
      v10 = v17;
    }
    else
    {
      if (!v18)
        goto LABEL_21;
      v11 = 5;
    }
    (*(void (**)(void))(*v10 + 8 * v11))();
LABEL_21:
    if ((v7 & 1) != 0)
    {
      TemporaryFile::mappedData((TemporaryFile *)&v13);
      v1 = (NSData *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v1 = 0;
    }
    v3 = v14[0];
    if (!v14[0])
      goto LABEL_9;
    goto LABEL_8;
  }
  return v1;
}

@end
