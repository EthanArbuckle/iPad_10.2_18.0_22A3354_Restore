@implementation ADEspressoBufferHandle

- (ADEspressoBufferHandle)initWithName:(id)a3 buffer:(id *)a4
{
  id v7;
  ADEspressoBufferHandle *v8;
  ADEspressoBufferHandle *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *dimensions;
  ADEspressoBufferHandle *v16;
  objc_super v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (v7)
  {
    v18.receiver = self;
    v18.super_class = (Class)ADEspressoBufferHandle;
    v8 = -[ADEspressoBufferHandle init](&v18, sel_init);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_name, a3);
      v9->_rawData = a4->var0;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a4->var2[0]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v10;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a4->var2[1]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19[1] = v11;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a4->var2[2]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19[2] = v12;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a4->var2[3]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[3] = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 4);
      v14 = objc_claimAutoreleasedReturnValue();
      dimensions = v9->_dimensions;
      v9->_dimensions = (NSArray *)v14;

      v9->_width = a4->var4;
      v9->_height = a4->var5;
      v9->_channels = a4->var6;
      v9->_batches = a4->var7;
      v9->_sequences = a4->var8;
      v9->_size = a4->var8 * a4->var3[3];
      v9->_rowBytes = a4->var3[0];
      v9->_channelBytes = a4->var3[1];
      v9->_batchBytes = a4->var3[2];
      v9->_sequenceBytes = a4->var3[3];
    }
    self = v9;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (ADEspressoBufferHandle)initWithName:(id)a3 rawData:(void *)a4 dimensions:(id)a5 strides:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  ADEspressoBufferHandle *v15;
  uint64_t v16;
  ADEspressoBufferHandle *v17;
  ADEspressoBufferHandle *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  unsigned int v24;
  void *v25;
  unsigned int v26;
  void *v27;
  unsigned int v28;
  void *v29;
  unsigned int v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v39;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  v15 = 0;
  if (v11 && a4 && v12 && v13)
  {
    if (objc_msgSend(v12, "count") && (v16 = objc_msgSend(v12, "count"), v16 == objc_msgSend(v14, "count")))
    {
      v39.receiver = self;
      v39.super_class = (Class)ADEspressoBufferHandle;
      v17 = -[ADEspressoBufferHandle init](&v39, sel_init);
      v18 = v17;
      if (v17)
      {
        objc_storeStrong((id *)&v17->_name, a3);
        v18->_rawData = a4;
        objc_storeStrong((id *)&v18->_dimensions, a5);
        objc_msgSend(v12, "objectEnumerator");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "nextObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
          v22 = objc_msgSend(v20, "unsignedIntValue");
        else
          v22 = 1;
        v18->_width = v22;
        objc_msgSend(v19, "nextObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
          v24 = objc_msgSend(v23, "unsignedIntValue");
        else
          v24 = 1;
        v18->_height = v24;
        objc_msgSend(v19, "nextObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
          v26 = objc_msgSend(v25, "unsignedIntValue");
        else
          v26 = 1;
        v18->_channels = v26;
        objc_msgSend(v19, "nextObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
          v28 = objc_msgSend(v27, "unsignedIntValue");
        else
          v28 = 1;
        v18->_batches = v28;
        objc_msgSend(v19, "nextObject");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
          v30 = objc_msgSend(v29, "unsignedIntValue");
        else
          v30 = 1;
        v18->_sequences = v30;
        objc_msgSend(v14, "lastObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "unsignedIntValue");
        objc_msgSend(v12, "lastObject");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v18->_size = objc_msgSend(v33, "unsignedIntValue") * v32;

        if ((unint64_t)objc_msgSend(v14, "count") < 2)
        {
          v18->_rowBytes = v18->_size;
        }
        else
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v18->_rowBytes = objc_msgSend(v34, "unsignedLongValue");

        }
        if ((unint64_t)objc_msgSend(v14, "count") < 3)
        {
          v18->_channelBytes = v18->_size;
        }
        else
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v18->_channelBytes = objc_msgSend(v35, "unsignedLongValue");

        }
        if ((unint64_t)objc_msgSend(v14, "count") < 4)
        {
          v18->_batchBytes = v18->_size;
        }
        else
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", 3);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v18->_batchBytes = objc_msgSend(v36, "unsignedLongValue");

        }
        if ((unint64_t)objc_msgSend(v14, "count") < 5)
        {
          v18->_sequenceBytes = v18->_size;
        }
        else
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", 4);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v18->_sequenceBytes = objc_msgSend(v37, "unsignedLongValue");

        }
      }
      self = v18;
      v15 = self;
    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (void)data
{
  return self->_rawData;
}

- (NSArray)dimensions
{
  return self->_dimensions;
}

- (unint64_t)dimensionsProduct
{
  uint64_t v3;
  unsigned int v4;
  unint64_t v5;
  void *v6;

  if (!-[NSArray count](self->_dimensions, "count"))
    return 1;
  v3 = 0;
  v4 = 1;
  LODWORD(v5) = 1;
  do
  {
    -[NSArray objectAtIndexedSubscript:](self->_dimensions, "objectAtIndexedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "intValue") * v5;

    v3 = v4;
  }
  while (-[NSArray count](self->_dimensions, "count") > v4++);
  return v5;
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (unint64_t)channels
{
  return self->_channels;
}

- (unint64_t)batches
{
  return self->_batches;
}

- (void)clearBuffer
{
  void *rawData;

  rawData = self->_rawData;
  if (rawData)
    bzero(rawData, self->_size);
}

- (BOOL)writeToFile:(id)a3 atomically:(BOOL)a4
{
  id v5;
  unint64_t channels;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  FILE *v13;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v16 = xmmword_2507B24B0;
  v17 = *(_OWORD *)off_2507B24C0;
  v18 = CFSTR("rgba");
  channels = self->_channels;
  if (channels > 4)
    v7 = CFSTR("raw");
  else
    v7 = (__CFString *)*((_QWORD *)&v16 + channels);
  v8 = v7;
  -[NSString stringByReplacingOccurrencesOfString:withString:](self->_name, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v5, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%zux%zu.%@"), v9, self->_width, self->_height, v8, v16, v17, v18, v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = objc_retainAutorelease(v10);
  printf("Saving Espresso Buffer:\x1B[1m %s \x1B[22m\n", (const char *)objc_msgSend(v11, "UTF8String"));
  v12 = objc_retainAutorelease(v11);
  v13 = fopen((const char *)objc_msgSend(v12, "UTF8String"), "wb");
  if (v13)
    fwrite(self->_rawData, 1uLL, self->_size, v13);
  fclose(v13);

  for (i = 32; i != -8; i -= 8)
  return 1;
}

- (BOOL)copyTo:(id)a3
{
  size_t size;
  uint64_t v4;

  size = self->_size;
  v4 = *((_QWORD *)a3 + 13);
  if (size == v4)
    memcpy(*((void **)a3 + 2), self->_rawData, size);
  return size == v4;
}

- (unint64_t)rowBytes
{
  return self->_rowBytes;
}

- (unint64_t)channelBytes
{
  return self->_channelBytes;
}

- (unint64_t)sequences
{
  return self->_sequences;
}

- (unint64_t)batchBytes
{
  return self->_batchBytes;
}

- (unint64_t)sequenceBytes
{
  return self->_sequenceBytes;
}

- (unint64_t)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimensions, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
