@implementation CMFileInterface

- (id)initReaderWithFileURL:(id)a3
{
  id v4;
  CMFileInterface *v5;
  CMFileInterface *v6;
  void *v7;
  uint64_t v8;
  CMDataContainer *cmDataContainer;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CMFileInterface;
  v5 = -[CMFileInterface init](&v11, sel_init);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v4);
  v6 = (CMFileInterface *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[CMDataContainer classes](CMDataContainer, "classes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CVAMetadataWrapper decodeNSCoderObject:classes:](CVAMetadataWrapper, "decodeNSCoderObject:classes:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    cmDataContainer = v5->_cmDataContainer;
    v5->_cmDataContainer = (CMDataContainer *)v8;

LABEL_4:
    v6 = v5;
  }

  return v6;
}

- (void)resetReader
{
  -[CMDataContainer resetReader](self->_cmDataContainer, "resetReader");
}

- (id)grabNextRecvData
{
  return (id)MEMORY[0x24BEDD108](self->_cmDataContainer, sel_grabNextDataRecv);
}

- (id)grabNextSentData
{
  return (id)MEMORY[0x24BEDD108](self->_cmDataContainer, sel_grabNextDataSent);
}

- (id)grabNextRecvMessage
{
  return (id)MEMORY[0x24BEDD108](self->_cmDataContainer, sel_grabNextMessageRecv);
}

- (id)grabNextSentMessage
{
  return (id)MEMORY[0x24BEDD108](self->_cmDataContainer, sel_grabNextMessageSent);
}

- (id)grabNextEvent
{
  return (id)MEMORY[0x24BEDD108](self->_cmDataContainer, sel_grabNextEvent);
}

- (id)version
{
  return -[CMDataContainer version](self->_cmDataContainer, "version");
}

- (id)cv3dVersion
{
  return -[CMDataContainer cv3dVersion](self->_cmDataContainer, "cv3dVersion");
}

- (id)iOSVersion
{
  return -[CMDataContainer iOSVersion](self->_cmDataContainer, "iOSVersion");
}

- (id)macOSVersion
{
  return -[CMDataContainer macOSVersion](self->_cmDataContainer, "macOSVersion");
}

- (id)cvPlayerVersion
{
  return -[CMDataContainer cvPlayerVersion](self->_cmDataContainer, "cvPlayerVersion");
}

- (id)deviceString
{
  return -[CMDataContainer deviceString](self->_cmDataContainer, "deviceString");
}

- (id)sessionID
{
  return -[CMDataContainer sessionID](self->_cmDataContainer, "sessionID");
}

- (id)initWriter
{
  CMFileInterface *v2;
  CMDataContainer *v3;
  CMDataContainer *cmDataContainer;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMFileInterface;
  v2 = -[CMFileInterface init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CMDataContainer);
    cmDataContainer = v2->_cmDataContainer;
    v2->_cmDataContainer = v3;

    -[CMDataContainer setIOSVersion:](v2->_cmDataContainer, "setIOSVersion:", CFCopySystemVersionString());
    +[MOVWriterInterface makeDeviceString](MOVWriterInterface, "makeDeviceString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMDataContainer setDeviceString:](v2->_cmDataContainer, "setDeviceString:", v5);

  }
  return v2;
}

- (void)updateCV3DVersion:(id)a3
{
  MEMORY[0x24BEDD108](CMFileInterface, sel_updateCV3DVersion_container_);
}

- (void)updateCVPlayerVersion:(id)a3
{
  MEMORY[0x24BEDD108](CMFileInterface, sel_updateCVPlayerVersion_container_);
}

- (void)updateSessionID:(id)a3
{
  MEMORY[0x24BEDD108](CMFileInterface, sel_updateSessionID_container_);
}

- (void)processCMData:(id)a3
{
  CMDataContainer *cmDataContainer;
  id v4;

  cmDataContainer = self->_cmDataContainer;
  v4 = a3;
  -[CMDataContainer appendCMData:sending:](cmDataContainer, "appendCMData:sending:", v4, objc_msgSend(v4, "isSent"));

}

- (void)processCMData:(id)a3 sending:(BOOL)a4
{
  -[CMDataContainer appendCMData:sending:](self->_cmDataContainer, "appendCMData:sending:", a3, a4);
}

- (BOOL)saveToFileURL:(id)a3
{
  return MEMORY[0x24BEDD108](CMFileInterface, sel_writeContainerToFileURL_container_);
}

+ (BOOL)writeContainerToFileURL:(id)a3 container:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;

  v5 = a3;
  +[CVAMetadataWrapper encodeNSCoderObject:](CVAMetadataWrapper, "encodeNSCoderObject:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "writeToURL:atomically:", v5, 1);
  else
    v8 = 1;

  return v8;
}

+ (void)updateCV3DVersion:(id)a3 container:(id)a4
{
  objc_msgSend(a4, "setCv3dVersion:", a3);
}

+ (void)updateCVPlayerVersion:(id)a3 container:(id)a4
{
  objc_msgSend(a4, "setCvPlayerVersion:", a3);
}

+ (void)updateSessionID:(id)a3 container:(id)a4
{
  objc_msgSend(a4, "setSessionID:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cmDataContainer, 0);
}

@end
