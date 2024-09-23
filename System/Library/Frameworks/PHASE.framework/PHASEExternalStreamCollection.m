@implementation PHASEExternalStreamCollection

- (PHASEExternalStreamCollection)init
{
  -[PHASEExternalStreamCollection doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (id)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEExternalStreamCollection)initWithStreamType:(int64_t)a3 count:(unint64_t)a4
{
  PHASEExternalStreamCollection *v4;
  PHASEExternalStreamCollection *v7;
  PHASEExternalStreamCollection *v8;
  NSUUID *uuid;
  PHASEExternalStreamCollection *v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v4 = self;
  v20 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v13.receiver = self;
    v13.super_class = (Class)PHASEExternalStreamCollection;
    v7 = -[PHASEExternalStreamCollection init](&v13, sel_init);
    v8 = v7;
    if (v7)
    {
      v7->_streamType = a3;
      v7->_streamCount = a4;
      uuid = v7->_uuid;
      v7->_uuid = 0;

    }
    v4 = v8;
    v10 = v4;
  }
  else
  {
    v11 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 432));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v15 = "PHASEExternalStream.mm";
      v16 = 1024;
      v17 = 64;
      v18 = 2048;
      v19 = 0;
      _os_log_impl(&dword_2164CC000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: invalid stream count in collection, %lu", buf, 0x1Cu);
    }
    v10 = 0;
  }

  return v10;
}

- (NSUUID)uuid
{
  NSUUID *uuid;
  NSUUID *v4;
  NSUUID *v5;

  uuid = self->_uuid;
  if (!uuid)
  {
    v4 = (NSUUID *)objc_opt_new();
    v5 = self->_uuid;
    self->_uuid = v4;

    uuid = self->_uuid;
  }
  return uuid;
}

- (int64_t)streamType
{
  return self->_streamType;
}

- (unint64_t)streamCount
{
  return self->_streamCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
