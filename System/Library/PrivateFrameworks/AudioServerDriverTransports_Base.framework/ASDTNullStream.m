@implementation ASDTNullStream

- (char)ioBuffer
{
  id v2;
  char *v3;

  -[ASDTNullStream streamBuffer](self, "streamBuffer");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (char *)objc_msgSend(v2, "mutableBytes");

  return v3;
}

- (unsigned)ioBufferSize
{
  void *v2;
  unsigned int v3;

  -[ASDTNullStream streamBuffer](self, "streamBuffer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (id)updateClientPositionBlock
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__ASDTNullStream_updateClientPositionBlock__block_invoke;
  aBlock[3] = &__block_descriptor_40_e8_v16__0Q8l;
  aBlock[4] = &self->_clientPosition;
  return _Block_copy(aBlock);
}

uint64_t __43__ASDTNullStream_updateClientPositionBlock__block_invoke(uint64_t result, uint64_t a2)
{
  **(_QWORD **)(result + 32) = a2;
  return result;
}

- (void)configureStreamBuffer
{
  double v3;
  void *v4;
  int v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  -[ASDTNullStream setStreamBuffer:](self, "setStreamBuffer:", 0);
  -[ASDStream physicalFormat](self, "physicalFormat");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sampleRate");
  if (v3 != 0.0)
  {
    -[ASDStream physicalFormat](self, "physicalFormat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "bytesPerFrame");

    if (!v5)
      return;
    -[ASDStream physicalFormat](self, "physicalFormat");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sampleRate");
    v7 = v6;
    -[ASDStream physicalFormat](self, "physicalFormat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "bytesPerFrame") * (v7 * 300.0 / 1000.0);

    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[ASDTNullStream setStreamBuffer:](self, "setStreamBuffer:");
  }

}

- (BOOL)changePhysicalFormat:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  -[ASDStream physicalFormat](self, "physicalFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    objc_initWeak(&location, self);
    -[ASDTStream device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __39__ASDTNullStream_changePhysicalFormat___block_invoke;
    v9[3] = &unk_250841FD8;
    objc_copyWeak(&v11, &location);
    v10 = v4;
    objc_msgSend(v7, "requestConfigurationChange:", v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return 1;
}

void __39__ASDTNullStream_changePhysicalFormat___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id WeakRetained;
  id v13;
  id v14;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setPhysicalFormat:", v2);

  v13 = objc_loadWeakRetained(v3);
  objc_msgSend(v13, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "samplingRate");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "sampleRate");
  v8 = v7;

  if (v6 != v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "sampleRate");
    v10 = v9;
    v14 = objc_loadWeakRetained(v3);
    objc_msgSend(v14, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSamplingRate:", v10);

  }
}

- (void)setPhysicalFormat:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ASDTNullStream;
  -[ASDTStream setPhysicalFormat:](&v5, sel_setPhysicalFormat_, v4);
  -[ASDTNullStream configureStreamBuffer](self, "configureStreamBuffer");

}

- (void)startStream
{
  objc_super v3;

  -[ASDTStream clearBuffer](self, "clearBuffer");
  v3.receiver = self;
  v3.super_class = (Class)ASDTNullStream;
  -[ASDStream startStream](&v3, sel_startStream);
  -[ASDStream setIsActive:](self, "setIsActive:", 1);
}

- (void)stopStream
{
  objc_super v3;

  -[ASDStream setIsActive:](self, "setIsActive:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ASDTNullStream;
  -[ASDStream stopStream](&v3, sel_stopStream);
}

- (NSMutableData)streamBuffer
{
  return self->_streamBuffer;
}

- (void)setStreamBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_streamBuffer, a3);
}

- (unint64_t)clientPosition
{
  return self->_clientPosition;
}

- (void)setClientPosition:(unint64_t)a3
{
  self->_clientPosition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamBuffer, 0);
}

@end
