@implementation MBDeviceTransferSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)MEMORY[0x1D8270CF0]();
  -[MBDeviceTransferSession fileTransferSession](self, "fileTransferSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MBDeviceTransferSession fileTransferSession](self, "fileTransferSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("fileTransferSession"));

  }
  objc_autoreleasePoolPop(v4);

}

- (MBDeviceTransferSession)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MBDeviceTransferSession *v6;
  void *v7;
  MBDeviceTransferSession *v8;
  objc_super v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D8270CF0]();
  v10.receiver = self;
  v10.super_class = (Class)MBDeviceTransferSession;
  v6 = -[MBDeviceTransferSession init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileTransferSession"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MBDeviceTransferSession setFileTransferSession:](v6, "setFileTransferSession:", v7);

  }
  v8 = v6;
  objc_autoreleasePoolPop(v5);

  return v8;
}

- (RPFileTransferSession)fileTransferSession
{
  return self->_fileTransferSession;
}

- (void)setFileTransferSession:(id)a3
{
  objc_storeStrong((id *)&self->_fileTransferSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileTransferSession, 0);
}

@end
