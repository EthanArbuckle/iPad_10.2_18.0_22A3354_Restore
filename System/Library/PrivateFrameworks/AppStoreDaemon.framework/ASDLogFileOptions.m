@implementation ASDLogFileOptions

- (ASDLogFileOptions)init
{
  ASDLogFileOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASDLogFileOptions;
  result = -[ASDLogFileOptions init](&v3, sel_init);
  if (result)
    *(_OWORD *)&result->_maxSizeInBytes = xmmword_19A0BDEE0;
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ASDLogFileOptions;
  -[ASDLogFileOptions dealloc](&v2, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_directoryPath, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_fileName, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v5[4] = self->_maxNumberOfLogFiles;
  v5[3] = self->_maxSizeInBytes;
  return v5;
}

- (NSString)logDirectoryPath
{
  return self->_directoryPath;
}

- (void)setLogDirectoryPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)logFileBaseName
{
  return self->_fileName;
}

- (void)setLogFileBaseName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)maxLogFileSize
{
  return self->_maxSizeInBytes;
}

- (void)setMaxLogFileSize:(unint64_t)a3
{
  self->_maxSizeInBytes = a3;
}

- (int64_t)maxNumberOfLogFiles
{
  return self->_maxNumberOfLogFiles;
}

- (void)setMaxNumberOfLogFiles:(int64_t)a3
{
  self->_maxNumberOfLogFiles = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_directoryPath, 0);
}

@end
