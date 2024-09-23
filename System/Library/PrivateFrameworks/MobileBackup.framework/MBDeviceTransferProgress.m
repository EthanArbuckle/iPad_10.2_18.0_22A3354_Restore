@implementation MBDeviceTransferProgress

- (MBDeviceTransferProgress)init
{
  MBDeviceTransferProgress *v2;
  MBDeviceTransferProgress *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MBDeviceTransferProgress;
  v2 = -[MBDeviceTransferProgress init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MBDeviceTransferProgress setProgress:](v2, "setProgress:", 0.0);
    -[MBDeviceTransferProgress setMinutesRemaining:](v3, "setMinutesRemaining:", -1);
    -[MBDeviceTransferProgress setFilesTransferred:](v3, "setFilesTransferred:", 0);
    -[MBDeviceTransferProgress setBytesTransferred:](v3, "setBytesTransferred:", 0);
    -[MBDeviceTransferProgress setTotalByteCount:](v3, "setTotalByteCount:", 0);
    -[MBDeviceTransferProgress setTotalFileCount:](v3, "setTotalFileCount:", 0);
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MBDeviceTransferProgress)initWithCoder:(id)a3
{
  id v4;
  MBDeviceTransferProgress *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MBDeviceTransferProgress;
  v5 = -[MBDeviceTransferProgress init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phaseDescription"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MBDeviceTransferProgress setPhaseDescription:](v5, "setPhaseDescription:", v6);

    -[MBDeviceTransferProgress setPhase:](v5, "setPhase:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("phase")));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("progress"));
    -[MBDeviceTransferProgress setProgress:](v5, "setProgress:");
    -[MBDeviceTransferProgress setMinutesRemaining:](v5, "setMinutesRemaining:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minutesRemaining")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileTransferStartDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MBDeviceTransferProgress setFileTransferStartDate:](v5, "setFileTransferStartDate:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("restoreStartDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MBDeviceTransferProgress setRestoreStartDate:](v5, "setRestoreStartDate:", v8);

    -[MBDeviceTransferProgress setFilesTransferred:](v5, "setFilesTransferred:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("filesTransferred")));
    -[MBDeviceTransferProgress setBytesTransferred:](v5, "setBytesTransferred:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("bytesTransferred")));
    -[MBDeviceTransferProgress setTotalByteCount:](v5, "setTotalByteCount:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("totalByteCount")));
    -[MBDeviceTransferProgress setTotalFileCount:](v5, "setTotalFileCount:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("totalFileCount")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MBDeviceTransferProgress phaseDescription](self, "phaseDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("phaseDescription"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[MBDeviceTransferProgress phase](self, "phase"), CFSTR("phase"));
  -[MBDeviceTransferProgress progress](self, "progress");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("progress"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[MBDeviceTransferProgress minutesRemaining](self, "minutesRemaining"), CFSTR("minutesRemaining"));
  -[MBDeviceTransferProgress fileTransferStartDate](self, "fileTransferStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("fileTransferStartDate"));

  -[MBDeviceTransferProgress restoreStartDate](self, "restoreStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("restoreStartDate"));

  objc_msgSend(v7, "encodeInt64:forKey:", -[MBDeviceTransferProgress filesTransferred](self, "filesTransferred"), CFSTR("filesTransferred"));
  objc_msgSend(v7, "encodeInt64:forKey:", -[MBDeviceTransferProgress bytesTransferred](self, "bytesTransferred"), CFSTR("bytesTransferred"));
  objc_msgSend(v7, "encodeInt64:forKey:", -[MBDeviceTransferProgress totalByteCount](self, "totalByteCount"), CFSTR("totalByteCount"));
  objc_msgSend(v7, "encodeInt64:forKey:", -[MBDeviceTransferProgress totalFileCount](self, "totalFileCount"), CFSTR("totalFileCount"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[MBDeviceTransferProgress phaseDescription](self, "phaseDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setPhaseDescription:", v6);

  objc_msgSend(v4, "setPhase:", -[MBDeviceTransferProgress phase](self, "phase"));
  -[MBDeviceTransferProgress progress](self, "progress");
  objc_msgSend(v4, "setProgress:");
  objc_msgSend(v4, "setMinutesRemaining:", -[MBDeviceTransferProgress minutesRemaining](self, "minutesRemaining"));
  -[MBDeviceTransferProgress fileTransferStartDate](self, "fileTransferStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFileTransferStartDate:", v7);

  -[MBDeviceTransferProgress restoreStartDate](self, "restoreStartDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRestoreStartDate:", v8);

  objc_msgSend(v4, "setFilesTransferred:", -[MBDeviceTransferProgress filesTransferred](self, "filesTransferred"));
  objc_msgSend(v4, "setBytesTransferred:", -[MBDeviceTransferProgress bytesTransferred](self, "bytesTransferred"));
  objc_msgSend(v4, "setTotalByteCount:", -[MBDeviceTransferProgress totalByteCount](self, "totalByteCount"));
  objc_msgSend(v4, "setTotalFileCount:", -[MBDeviceTransferProgress totalFileCount](self, "totalFileCount"));
  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  const char *Name;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  -[MBDeviceTransferProgress progress](self, "progress");
  v7 = v6;
  v8 = -[MBDeviceTransferProgress minutesRemaining](self, "minutesRemaining");
  v9 = -[MBDeviceTransferProgress filesTransferred](self, "filesTransferred");
  v10 = -[MBDeviceTransferProgress bytesTransferred](self, "bytesTransferred");
  v11 = -[MBDeviceTransferProgress totalByteCount](self, "totalByteCount");
  v12 = -[MBDeviceTransferProgress totalFileCount](self, "totalFileCount");
  -[MBDeviceTransferProgress phaseDescription](self, "phaseDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%s: %p; progress=%.2f, minutesRemaining=%ld, filesTransferred=%llu, bytesTransferred=%llu, totalByteCount=%llu, totalFileCount=%llu, phase=\"%@\">"),
    Name,
    self,
    v7,
    v8,
    v9,
    v10,
    v11,
    v12,
    v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSString)phaseDescription
{
  return self->_phaseDescription;
}

- (void)setPhaseDescription:(id)a3
{
  objc_storeStrong((id *)&self->_phaseDescription, a3);
}

- (unint64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(unint64_t)a3
{
  self->_phase = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (int64_t)minutesRemaining
{
  return self->_minutesRemaining;
}

- (void)setMinutesRemaining:(int64_t)a3
{
  self->_minutesRemaining = a3;
}

- (NSDate)fileTransferStartDate
{
  return self->_fileTransferStartDate;
}

- (void)setFileTransferStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_fileTransferStartDate, a3);
}

- (NSDate)restoreStartDate
{
  return self->_restoreStartDate;
}

- (void)setRestoreStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_restoreStartDate, a3);
}

- (unint64_t)filesTransferred
{
  return self->_filesTransferred;
}

- (void)setFilesTransferred:(unint64_t)a3
{
  self->_filesTransferred = a3;
}

- (unint64_t)bytesTransferred
{
  return self->_bytesTransferred;
}

- (void)setBytesTransferred:(unint64_t)a3
{
  self->_bytesTransferred = a3;
}

- (unint64_t)totalByteCount
{
  return self->_totalByteCount;
}

- (void)setTotalByteCount:(unint64_t)a3
{
  self->_totalByteCount = a3;
}

- (unint64_t)totalFileCount
{
  return self->_totalFileCount;
}

- (void)setTotalFileCount:(unint64_t)a3
{
  self->_totalFileCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restoreStartDate, 0);
  objc_storeStrong((id *)&self->_fileTransferStartDate, 0);
  objc_storeStrong((id *)&self->_phaseDescription, 0);
}

@end
