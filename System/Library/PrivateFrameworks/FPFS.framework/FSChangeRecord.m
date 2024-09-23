@implementation FSChangeRecord

- (unsigned)flags
{
  _BOOL4 v3;
  unsigned int rawFlags;

  v3 = -[FSChangeRecord isBarrier](self, "isBarrier");
  rawFlags = self->_rawFlags;
  if ((rawFlags & 0x9000) != 0 || v3)
    return rawFlags & 0xFFF7FFFF;
  else
    return self->_rawFlags;
}

- (FSChangeRecord)initWithPath:(id)a3 fileID:(unint64_t)a4 flags:(unsigned int)a5 eventID:(unint64_t)a6
{
  id v11;
  FSChangeRecord *v12;
  FSChangeRecord *v13;
  uint64_t v14;
  NSUUID *barrierUUID;
  void *v16;
  uint64_t v17;
  NSString *path;
  objc_super v20;

  v11 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FSChangeRecord;
  v12 = -[FSChangeRecord init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_path, a3);
    v13->_fileID = a4;
    v13->_rawFlags = a5;
    v13->_eventID = a6;
    objc_msgSend(v11, "fpfs_extractFSEventsBarrierUUID");
    v14 = objc_claimAutoreleasedReturnValue();
    barrierUUID = v13->_barrierUUID;
    v13->_barrierUUID = (NSUUID *)v14;

    objc_msgSend(v11, "fpfs_extractFSEventsNotifyUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v13->_isNotification = 1;
      objc_msgSend(v11, "stringByDeletingLastPathComponent");
      v17 = objc_claimAutoreleasedReturnValue();
      path = v13->_path;
      v13->_path = (NSString *)v17;

    }
  }

  return v13;
}

- (BOOL)isBarrier
{
  return self->_barrierUUID != 0;
}

- (unsigned)additionalDebugFlagsForHistoricalStream:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unsigned int v6;
  const __CFString *v8;

  v3 = a3;
  if (!os_variant_has_internal_content()
    || (self->_rawFlags & 0x80000) != 0
    || !-[NSString hasSuffix:](self->_path, "hasSuffix:", CFSTR("-fail-with-dropped")))
  {
    return 0;
  }
  -[NSString lastPathComponent](self->_path, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsString:", CFSTR("kernel")) & 1) != 0)
  {
    v6 = 4;
  }
  else
  {
    if (v3)
      v8 = CFSTR("historical");
    else
      v8 = CFSTR("live");
    if ((objc_msgSend(v5, "containsString:", v8) & 1) != 0)
      v6 = 2;
    else
      v6 = 0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t eventID;
  unint64_t fileID;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  eventID = self->_eventID;
  fileID = self->_fileID;
  objc_msgSend(MEMORY[0x24BDD17C8], "fpfs_initWithFSEventsFlags:", self->_rawFlags);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString fp_prettyPath](self->_path, "fp_prettyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ #%llu fileID:%llu flags:%@ path:'%@'>"), v4, eventID, fileID, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (unsigned)rawFlags
{
  return self->_rawFlags;
}

- (unint64_t)eventID
{
  return self->_eventID;
}

- (NSUUID)barrierUUID
{
  return self->_barrierUUID;
}

- (BOOL)isNotification
{
  return self->_isNotification;
}

- (unint64_t)fileID
{
  return self->_fileID;
}

- (unsigned)additionalDebugFlags
{
  return self->_additionalDebugFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barrierUUID, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
