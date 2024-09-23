@implementation MTLCountersTraceCommandBuffer

- (id)init:(BOOL)a3
{
  _BOOL4 v3;
  MTLCountersTraceCommandBuffer *v4;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MTLCountersTraceCommandBuffer;
  v4 = -[MTLCountersTraceCommandBuffer init](&v6, sel_init);
  if (v4)
  {
    v4->_encoders = (NSMutableArray *)objc_opt_new();
    v4->_flags |= v3;
    v4->_timestamp = mach_absolute_time();
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLCountersTraceCommandBuffer;
  -[MTLCountersTraceCommandBuffer dealloc](&v3, sel_dealloc);
}

- (id)blitCommandEncoder
{
  id v3;

  v3 = -[MTLCountersTraceBlitCommandEncoder init:]([MTLCountersTraceBlitCommandEncoder alloc], "init:", &self->_commands);
  -[NSMutableArray addObject:](self->_encoders, "addObject:", v3);
  return v3;
}

- (id)computeCommandEncoder
{
  id v3;

  v3 = -[MTLCountersTraceComputeCommandEncoder init:]([MTLCountersTraceComputeCommandEncoder alloc], "init:", &self->_commands);
  -[NSMutableArray addObject:](self->_encoders, "addObject:", v3);
  return v3;
}

- (id)renderCommandEncoder
{
  id v3;

  v3 = -[MTLCountersTraceRenderCommandEncoder init:]([MTLCountersTraceRenderCommandEncoder alloc], "init:", &self->_commands);
  -[NSMutableArray addObject:](self->_encoders, "addObject:", v3);
  return v3;
}

- (id)resourceStateCommandEncoder
{
  id v3;

  v3 = -[MTLCountersTraceResourceStateCommandEncoder init:]([MTLCountersTraceResourceStateCommandEncoder alloc], "init:", &self->_commands);
  -[NSMutableArray addObject:](self->_encoders, "addObject:", v3);
  return v3;
}

- (void)waitUntilScheduled
{
  self->_flags |= 2uLL;
}

- (void)waitUntilCompleted
{
  self->_flags |= 4uLL;
}

- (void)presentDrawable:(id)a3
{
  self->_flags |= 8uLL;
}

- (void)presentDrawable:(id)a3 atTime:(double)a4
{
  self->_flags |= 8uLL;
}

- (void)appendSamples:(const void *)a3 length:(unint64_t)a4
{
  (*((void (**)(AppendBuffer *, const void *, unint64_t))self->_samples._vptr$AppendBuffer + 1))(&self->_samples, a3, a4);
}

- (void)saveCommandBuffer:(const void *)a3 queue:(id)a4 profilingResults:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t i;
  uint64_t j;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  MTLCountersTraceCommandBuffer *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const void *v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  id v35;
  uint64_t v36;
  const void *v37[2];
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  AppendBuffer v43;
  uint64_t v44;
  unsigned __int8 v45;
  id v46;
  const void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v46 = a4;
  v47 = a3;
  v45 = 0;
  v44 = 0;
  memset(&v43.stream, 0, sizeof(v43.stream));
  v43._vptr$AppendBuffer = (void **)&off_24F794340;
  AppendBuffer::WriteBytes(&v43, &v43.stream, "{", 1uLL);
  StringBuffer::Append<char [12],char [6],char [2]>(&v43, "\"version\":\", "0.908", "\");
  StringBuffer::Append<char [12],void const*,char [2]>(&v43, ",\"handle\":\", &v47, "\");
  AppendBuffer::WriteBytes(&v43, &v43.stream, ",\"device\":{", 0xBuLL);
  v37[0] = (const void *)objc_msgSend(a4, "device");
  StringBuffer::Append<char [12],void const*,char [2]>(&v43, "\"handle\":\", v37, "\");
  v37[0] = (const void *)objc_msgSend((id)objc_msgSend(a4, "device"), "name");
  StringBuffer::Append<char [10],NSString *,char [2]>(&v43, ",\"name\":\", (id *)v37, "\");
  AppendBuffer::WriteBytes(&v43, &v43.stream, "}", 1uLL);
  AppendBuffer::WriteBytes(&v43, &v43.stream, ",\"queue\":{", 0xAuLL);
  StringBuffer::Append<char [12],void const*,char [2]>(&v43, "\"handle\":\", (const void **)&v46, "\");
  AppendBuffer::WriteBytes(&v43, &v43.stream, "}", 1uLL);
  if (a5)
  {
    AppendBuffer::WriteBytes(&v43, &v43.stream, ",\"events\":{", 0xBuLL);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v8 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v40;
      v11 = 1;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v40 != v10)
            objc_enumerationMutation(a5);
          v37[0] = 0;
          v37[0] = *(const void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          if ((v11 & 1) == 0)
            AppendBuffer::WriteBytes(&v43, &v43.stream, ",", 1uLL);
          v35 = (id)objc_msgSend((id)objc_msgSend(a5, "objectForKey:"), "unsignedIntegerValue");
          StringBuffer::Append<char [2],NSString const*,char [3],unsigned long>(&v43, "\", (id *)v37, "\":", &v35);
          v11 = 0;
        }
        v9 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
        v11 = 0;
      }
      while (v9);
    }
    AppendBuffer::WriteBytes(&v43, &v43.stream, "}", 1uLL);
  }
  v38 = (*((uint64_t (**)(BinaryBuffer *, unsigned __int8 *, uint64_t *))self->_commands._vptr$AppendBuffer + 3))(&self->_commands, &v45, &v44);
  if (v44)
  {
    AppendBuffer::WriteBytes(&v43, &v43.stream, ",\"methods\":[", 0xCuLL);
    for (j = 0; j != 274; j += 2)
    {
      if (j * 8)
        v14 = ",";
      else
        v14 = "";
      v37[0] = v14;
      StringBuffer::Append<char const*,char [14],char const*,char [2]>(&v43, (const char **)v37, "{\"selector\":\", (const char **)&(&methods)[j], "\");
      if ((&methods)[j + 1])
        StringBuffer::Append<char [10],unsigned long long>(&v43, ",\"flags\":", &(&methods)[j + 1]);
      AppendBuffer::WriteBytes(&v43, &v43.stream, "}", 1uLL);
    }
    AppendBuffer::WriteBytes(&v43, &v43.stream, "]", 1uLL);
    StringBuffer::Append<char [14],NSData *,char [2]>(&v43, ",\"commands\":\", (id *)&v38, "\");
    StringBuffer::Append<char [10],unsigned long long>(&v43, ",\"commandBufferLength\":", &v44);
    self->_flags |= 16 * v45;
  }
  if (-[NSMutableArray count](self->_encoders, "count"))
  {
    AppendBuffer::WriteBytes(&v43, &v43.stream, ",\"encoders\":[", 0xDuLL);
    v15 = -[NSMutableArray count](self->_encoders, "count");
    if (v15)
    {
      v16 = v15;
      for (k = 0; k != v16; ++k)
      {
        v18 = self;
        v19 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_encoders, "objectAtIndexedSubscript:", k);
        if (k)
          v20 = ",";
        else
          v20 = "";
        AppendBuffer::WriteBytes(&v43, &v43.stream, v20, k != 0);
        v37[0] = (const void *)objc_msgSend(v19, "flags");
        StringBuffer::Append<char [10],unsigned long long>(&v43, "{\"flags\":", v37);
        objc_msgSend(v19, "segment");
        if (v21)
        {
          v37[0] = (const void *)objc_msgSend(v19, "segment");
          v37[1] = v22;
          v35 = (id)objc_msgSend(v19, "segment");
          v36 = v23;
          StringBuffer::Append<char [24],unsigned long,char [11],unsigned long,char [2]>(&v43, ",\"segment\":{\"location\":", v37, ",\"length\":", &v36, "}");
        }
        AppendBuffer::WriteBytes(&v43, &v43.stream, "}", 1uLL);
        self = v18;
      }
    }
    AppendBuffer::WriteBytes(&v43, &v43.stream, "]", 1uLL);
  }
  v37[0] = (const void *)(*((uint64_t (**)(AppendBuffer *, unsigned __int8 *, uint64_t *))self->_samples._vptr$AppendBuffer
                          + 3))(&self->_samples, &v45, &v44);
  if (v44)
  {
    v24 = objc_msgSend(v46, "getStatLocations");
    v35 = (id)(v45 | (2 * ((~v24 & 0xF300) == 0)));
    v25 = (void *)objc_msgSend(v46, "getRequestedCounters");
    StringBuffer::Append<char [24],unsigned long long,char [14]>(&v43, ",\"statistics\":{\"flags\":", &v35, ",\"counters\":[");
    v26 = objc_msgSend(v25, "count");
    if (v26)
    {
      v27 = v26;
      for (m = 0; m != v27; ++m)
      {
        if (m)
          v29 = ",";
        else
          v29 = "";
        v34 = v29;
        v33 = objc_msgSend(v25, "objectAtIndexedSubscript:", m);
        StringBuffer::Append<char const*,char [10],NSString *,char [3]>(&v43, &v34, "{\"name\":\", (id *)&v33, "\"}");
      }
    }
    StringBuffer::Append<char [14],NSData *,char [2]>(&v43, "],\"samples\":\", (id *)v37, "\");
    StringBuffer::Append<char [24],unsigned long long,char [14]>(&v43, ",\"sampleBufferLength\":", &v44, "}");
  }
  StringBuffer::Append<char [10],unsigned long long>(&v43, ",\"flags\":", &self->_flags);
  AppendBuffer::WriteBytes(&v43, &v43.stream, "}", 1uLL);
  v30 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("cb_%llu.json"), self->_timestamp);
  v31 = objc_msgSend((id)objc_msgSend(v46, "tracePath"), "stringByAppendingPathComponent:", v30);
  v35 = 0;
  v32 = (void *)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v43.stream.bytes, v43.stream.pWrite - v43.stream.bytes, 1);
  memset(&v43.stream, 0, sizeof(v43.stream));
  if ((objc_msgSend(v32, "writeToFile:options:error:", v31, 0, &v35) & 1) == 0)
    NSLog(CFSTR("Error saving file '%@' (%@)"), v31, objc_msgSend(v35, "localizedDescription"));
}

- (id).cxx_construct
{
  self->_commands.stream.pWrite = 0;
  self->_commands.stream.pEnd = 0;
  self->_commands._vptr$AppendBuffer = (void **)&off_24F794310;
  self->_commands.stream.bytes = 0;
  mach_timebase_info(&self->_commands._timebase);
  self->_samples._vptr$AppendBuffer = (void **)&off_24F7942E0;
  self->_samples.stream.bytes = 0;
  self->_samples.stream.pWrite = 0;
  self->_samples.stream.pEnd = 0;
  return self;
}

@end
