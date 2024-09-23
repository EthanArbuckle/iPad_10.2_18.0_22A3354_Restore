@implementation MRAudioDataBlock

- (MRAudioDataBlock)initWithData:(id)a3
{
  id v4;
  _MRAudioDataBlockProtobuf *v5;
  MRAudioDataBlock *v6;

  v4 = a3;
  v5 = -[_MRAudioDataBlockProtobuf initWithData:]([_MRAudioDataBlockProtobuf alloc], "initWithData:", v4);

  v6 = -[MRAudioDataBlock initWithProtobuf:](self, "initWithProtobuf:", v5);
  return v6;
}

- (MRAudioDataBlock)initWithProtobuf:(id)a3
{
  id v4;
  MRAudioDataBlock *v5;
  MRAudioDataBlock *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MRAudioDataBlock;
  v5 = -[MRAudioDataBlock init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[MRAudioDataBlock _parseBuffer:](v5, "_parseBuffer:", v4);
    -[MRAudioDataBlock _parseTimestamp:](v6, "_parseTimestamp:", v4);
    -[MRAudioDataBlock _parseGain:](v6, "_parseGain:", v4);
  }

  return v6;
}

- (_MRAudioDataBlockProtobuf)protobuf
{
  _MRAudioFormatSettingsProtobuf *v3;
  void *v4;
  void *v5;
  void *v6;
  _MRAudioBufferProtobuf *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _MRAudioStreamPacketDescriptionProtobuf *v26;
  void *v27;
  _MRAudioTimeProtobuf *v28;
  _MRAudioDataBlockProtobuf *v29;

  v3 = objc_alloc_init(_MRAudioFormatSettingsProtobuf);
  v4 = (void *)MEMORY[0x1E0CB38B0];
  -[MRAudioBuffer formatSettings](self->_buffer, "formatSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithPropertyList:format:options:error:", v5, 200, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAudioFormatSettingsProtobuf setFormatSettingsPlistData:](v3, "setFormatSettingsPlistData:", v6);

  v7 = objc_alloc_init(_MRAudioBufferProtobuf);
  -[_MRAudioBufferProtobuf setFormatSettings:](v7, "setFormatSettings:", v3);
  -[MRAudioBuffer buffer](self->_buffer, "buffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAudioBufferProtobuf setPacketCapacity:](v7, "setPacketCapacity:", objc_msgSend(v8, "packetCapacity"));

  -[MRAudioBuffer buffer](self->_buffer, "buffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAudioBufferProtobuf setMaximumPacketSize:](v7, "setMaximumPacketSize:", objc_msgSend(v9, "maximumPacketSize"));

  -[MRAudioBuffer buffer](self->_buffer, "buffer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAudioBufferProtobuf setPacketCount:](v7, "setPacketCount:", objc_msgSend(v10, "packetCount"));

  v11 = (void *)MEMORY[0x1E0C99D50];
  -[MRAudioBuffer buffer](self->_buffer, "buffer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "data");
  -[MRAudioBuffer buffer](self->_buffer, "buffer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "packetCapacity");
  -[MRAudioBuffer buffer](self->_buffer, "buffer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataWithBytes:length:", v13, objc_msgSend(v16, "maximumPacketSize") * v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAudioBufferProtobuf setContents:](v7, "setContents:", v17);

  -[MRAudioBuffer buffer](self->_buffer, "buffer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = objc_msgSend(v18, "packetCapacity");

  if ((_DWORD)v17)
  {
    v19 = 0;
    v20 = 0;
    do
    {
      -[MRAudioBuffer buffer](self->_buffer, "buffer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "packetDescriptions");
      v23 = *(_QWORD *)(v22 + v19);
      v24 = *(unsigned int *)(v22 + v19 + 8);
      v25 = *(unsigned int *)(v22 + v19 + 12);

      v26 = objc_alloc_init(_MRAudioStreamPacketDescriptionProtobuf);
      -[_MRAudioStreamPacketDescriptionProtobuf setStartOffset:](v26, "setStartOffset:", v23);
      -[_MRAudioStreamPacketDescriptionProtobuf setVariableFramesInPacket:](v26, "setVariableFramesInPacket:", v24);
      -[_MRAudioStreamPacketDescriptionProtobuf setDataByteSize:](v26, "setDataByteSize:", v25);
      -[_MRAudioBufferProtobuf addPacketDescriptions:](v7, "addPacketDescriptions:", v26);

      ++v20;
      -[MRAudioBuffer buffer](self->_buffer, "buffer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v23) = objc_msgSend(v27, "packetCapacity");

      v19 += 16;
    }
    while (v20 < v23);
  }
  v28 = objc_alloc_init(_MRAudioTimeProtobuf);
  -[_MRAudioTimeProtobuf setTimestamp:](v28, "setTimestamp:", self->_time.timestamp);
  -[_MRAudioTimeProtobuf setSampleRate:](v28, "setSampleRate:", self->_time.sampleRate);
  v29 = objc_alloc_init(_MRAudioDataBlockProtobuf);
  -[_MRAudioDataBlockProtobuf setBuffer:](v29, "setBuffer:", v7);
  -[_MRAudioDataBlockProtobuf setTime:](v29, "setTime:", v28);
  -[_MRAudioDataBlockProtobuf setGain:](v29, "setGain:", self->_gain);

  return v29;
}

- (NSData)data
{
  void *v2;
  void *v3;

  -[MRAudioDataBlock protobuf](self, "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MRAudioDataBlock _copyWithZone:usingConcreteClass:](self, "_copyWithZone:usingConcreteClass:", a3, objc_opt_class());
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[MRAudioDataBlock _copyWithZone:usingConcreteClass:](self, "_copyWithZone:usingConcreteClass:", a3, objc_opt_class());
}

- (id)_copyWithZone:(_NSZone *)a3 usingConcreteClass:(Class)a4
{
  id *v5;

  v5 = (id *)objc_alloc_init(a4);
  objc_storeStrong(v5 + 1, self->_buffer);
  *((_OWORD *)v5 + 1) = self->_time;
  *((_DWORD *)v5 + 8) = LODWORD(self->_gain);
  return v5;
}

- (void)_parseBuffer:(id)a3
{
  MRAudioBuffer *buffer;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MRAudioBuffer *v11;
  MRAudioBuffer *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  unint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  unsigned int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v33 = a3;
  buffer = self->_buffer;
  if (buffer)
  {
    self->_buffer = 0;

  }
  objc_msgSend(v33, "buffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB38B0];
  objc_msgSend(v6, "formatSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "formatSettingsPlistData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "propertyListWithData:options:format:error:", v9, 0, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[MRAudioBuffer initWithFormatSettings:packetCapacity:maximumPacketSize:]([MRAudioBuffer alloc], "initWithFormatSettings:packetCapacity:maximumPacketSize:", v10, objc_msgSend(v6, "packetCapacity"), objc_msgSend(v6, "maximumPacketSize"));
  v12 = self->_buffer;
  self->_buffer = v11;

  objc_msgSend(v6, "contents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");
  v15 = objc_msgSend(v6, "packetCapacity");
  if (v14 > objc_msgSend(v6, "maximumPacketSize") * v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRAudioDataBlock.m"), 120, CFSTR("invalid buffer size for decoding voice input message (%lu > (%lu * %lu))"), objc_msgSend(v13, "length"), objc_msgSend(v6, "packetCapacity"), objc_msgSend(v6, "maximumPacketSize"));

  }
  -[MRAudioBuffer buffer](self->_buffer, "buffer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "packetCapacity");
  v18 = objc_msgSend(v6, "packetDescriptionsCount");

  if (v18 < v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRAudioBuffer buffer](self->_buffer, "buffer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRAudioDataBlock.m"), 123, CFSTR("packet descriptions exceed maximum packet capacity (%lu > %lu)"), objc_msgSend(v32, "packetCapacity"), objc_msgSend(v6, "packetDescriptionsCount"));

  }
  -[MRAudioBuffer buffer](self->_buffer, "buffer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "data");
  v21 = objc_retainAutorelease(v13);
  memcpy(v20, (const void *)objc_msgSend(v21, "bytes"), objc_msgSend(v21, "length"));

  v22 = objc_msgSend(v6, "packetCount");
  -[MRAudioBuffer buffer](self->_buffer, "buffer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setPacketCount:", v22);

  if (objc_msgSend(v6, "packetDescriptionsCount"))
  {
    v24 = 0;
    v25 = 1;
    do
    {
      objc_msgSend(v6, "packetDescriptionsAtIndex:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRAudioBuffer buffer](self->_buffer, "buffer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "packetDescriptions") + 16 * v24;

      *(_DWORD *)(v28 + 12) = objc_msgSend(v26, "dataByteSize");
      *(_QWORD *)v28 = objc_msgSend(v26, "startOffset");
      *(_DWORD *)(v28 + 8) = objc_msgSend(v26, "variableFramesInPacket");

      v24 = v25;
    }
    while (objc_msgSend(v6, "packetDescriptionsCount") > (unint64_t)v25++);
  }

}

- (void)_parseTimestamp:(id)a3
{
  double v4;
  double v5;
  id v6;

  objc_msgSend(a3, "time");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timestamp");
  self->_time.timestamp = v4;
  objc_msgSend(v6, "sampleRate");
  self->_time.sampleRate = v5;

}

- (void)_parseGain:(id)a3
{
  double v4;

  objc_msgSend(a3, "gain");
  *(float *)&v4 = v4;
  self->_gain = *(float *)&v4;
}

- (MRAudioBuffer)buffer
{
  return self->_buffer;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)time
{
  double timestamp;
  double sampleRate;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  timestamp = self->_time.timestamp;
  sampleRate = self->_time.sampleRate;
  result.var1 = sampleRate;
  result.var0 = timestamp;
  return result;
}

- (float)gain
{
  return self->_gain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
