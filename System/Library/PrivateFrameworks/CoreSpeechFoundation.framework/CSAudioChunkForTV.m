@implementation CSAudioChunkForTV

- (CSAudioChunkForTV)initWithXPCObject:(id)a3
{
  id v4;
  CSAudioChunkForTV *v5;
  float v6;
  float v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSArray *packets;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSAudioChunkForTV;
  v5 = -[CSAudioChunkForTV init](&v14, sel_init);
  if (v5)
  {
    v6 = xpc_dictionary_get_double(v4, "avgPower");
    v5->_avgPower = v6;
    v7 = xpc_dictionary_get_double(v4, "peakPower");
    v5->_peakPower = v7;
    v5->_timeStamp = xpc_dictionary_get_uint64(v4, "timeStamp");
    v5->_numChannels = xpc_dictionary_get_uint64(v4, "numChannels");
    v5->_audioFormat = xpc_dictionary_get_uint64(v4, "audioFormat");
    v5->_streamHandleID = xpc_dictionary_get_uint64(v4, "streamHandleID");
    xpc_dictionary_get_array(v4, "packets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_alloc(MEMORY[0x1E0C99D20]);
      objc_msgSend(v9, "_cs_initWithXPCObject:", v8);
      v10 = objc_claimAutoreleasedReturnValue();
      packets = v5->_packets;
      v5->_packets = (NSArray *)v10;

    }
    else
    {
      v12 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v16 = "-[CSAudioChunkForTV initWithXPCObject:]";
        _os_log_error_impl(&dword_1B502E000, v12, OS_LOG_TYPE_ERROR, "%s invalid packets", buf, 0xCu);
      }
    }

  }
  return v5;
}

- (id)xpcObject
{
  xpc_object_t v3;
  uint64_t i;
  xpc_object_t values[7];
  char *keys[8];

  keys[7] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = "packets";
  keys[1] = "avgPower";
  keys[2] = "peakPower";
  keys[3] = "timeStamp";
  keys[4] = "numChannels";
  keys[5] = "audioFormat";
  keys[6] = "streamHandleID";
  -[NSArray _cs_xpcObject](self->_packets, "_cs_xpcObject");
  values[0] = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  values[1] = xpc_double_create(self->_avgPower);
  values[2] = xpc_double_create(self->_peakPower);
  values[3] = xpc_uint64_create(self->_timeStamp);
  values[4] = xpc_uint64_create(self->_numChannels);
  values[5] = xpc_uint64_create(self->_audioFormat);
  values[6] = xpc_uint64_create(self->_streamHandleID);
  v3 = xpc_dictionary_create((const char *const *)keys, values, 7uLL);
  for (i = 6; i != -1; --i)

  return v3;
}

- (NSArray)packets
{
  return self->_packets;
}

- (void)setPackets:(id)a3
{
  objc_storeStrong((id *)&self->_packets, a3);
}

- (float)avgPower
{
  return self->_avgPower;
}

- (void)setAvgPower:(float)a3
{
  self->_avgPower = a3;
}

- (float)peakPower
{
  return self->_peakPower;
}

- (void)setPeakPower:(float)a3
{
  self->_peakPower = a3;
}

- (unint64_t)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(unint64_t)a3
{
  self->_timeStamp = a3;
}

- (unsigned)numChannels
{
  return self->_numChannels;
}

- (void)setNumChannels:(unsigned int)a3
{
  self->_numChannels = a3;
}

- (unsigned)audioFormat
{
  return self->_audioFormat;
}

- (void)setAudioFormat:(unsigned int)a3
{
  self->_audioFormat = a3;
}

- (unint64_t)streamHandleID
{
  return self->_streamHandleID;
}

- (void)setStreamHandleID:(unint64_t)a3
{
  self->_streamHandleID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packets, 0);
}

@end
