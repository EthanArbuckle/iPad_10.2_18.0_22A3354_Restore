@implementation CPLRecordStatus

- (BOOL)isUnknown
{
  return *(_WORD *)&self->_status.status & 1;
}

- (void)setUnknown:(BOOL)a3
{
  *(_WORD *)&self->_status.status = *(_WORD *)&self->_status.status & 0xFFFE | a3;
}

- (BOOL)isQuarantined
{
  return (LOWORD(self->_status.packedStatus) >> 1) & 1;
}

- (void)setQuarantined:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_status.status = *(_WORD *)&self->_status.status & 0xFFFD | v3;
}

- (BOOL)isResetting
{
  return (LOWORD(self->_status.packedStatus) >> 2) & 1;
}

- (void)setResetting:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_status.status = *(_WORD *)&self->_status.status & 0xFFFB | v3;
}

- (BOOL)isUploaded
{
  return (LOWORD(self->_status.packedStatus) >> 3) & 1;
}

- (void)setUploaded:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_status.status = *(_WORD *)&self->_status.status & 0xFFF7 | v3;
}

- (BOOL)isWaitingForUpload
{
  return (LOWORD(self->_status.packedStatus) >> 4) & 1;
}

- (void)setWaitingForUpload:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_status.status = *(_WORD *)&self->_status.status & 0xFFEF | v3;
}

- (BOOL)isUploading
{
  return (LOWORD(self->_status.packedStatus) >> 5) & 1;
}

- (void)setUploading:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_status.status = *(_WORD *)&self->_status.status & 0xFFDF | v3;
}

- (BOOL)isWaitingForUpdate
{
  return (LOWORD(self->_status.packedStatus) >> 6) & 1;
}

- (void)setWaitingForUpdate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_status.status = *(_WORD *)&self->_status.status & 0xFFBF | v3;
}

- (BOOL)isUpdating
{
  return (LOWORD(self->_status.packedStatus) >> 7) & 1;
}

- (void)setUpdating:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_status.status = *(_WORD *)&self->_status.status & 0xFF7F | v3;
}

- (BOOL)isConfirmed
{
  return HIBYTE(LOWORD(self->_status.packedStatus)) & 1;
}

- (void)setConfirmed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_status.status = *(_WORD *)&self->_status.status & 0xFEFF | v3;
}

- (BOOL)isShared
{
  return (LOWORD(self->_status.packedStatus) >> 9) & 1;
}

- (void)setShared:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_status.status = *(_WORD *)&self->_status.status & 0xFDFF | v3;
}

- (CPLRecordStatus)initWithRecord:(id)a3 generation:(unint64_t)a4
{
  id v7;
  CPLRecordStatus *v8;
  CPLRecordStatus *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLRecordStatus;
  v8 = -[CPLRecordStatus init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_record, a3);
    v9->_generation = a4;
  }

  return v9;
}

- (CPLRecordStatus)initWithCoder:(id)a3
{
  id v4;
  CPLRecordStatus *v5;
  NSString *v6;
  NSString *v7;
  Class v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CPLRecordChange *record;
  CPLRecordStatus *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CPLRecordStatus;
  v5 = -[CPLRecordStatus init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rClass"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = NSClassFromString(v6);
    else
      v8 = 0;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("r"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v8 || !v9)
    {

      v13 = 0;
      goto LABEL_10;
    }
    v11 = -[objc_class newRecordWithScopedIdentifier:](v8, "newRecordWithScopedIdentifier:", v9);
    record = v5->_record;
    v5->_record = (CPLRecordChange *)v11;

    v5->_generation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("g"));
    v5->_status.packedStatus = objc_msgSend(v4, "decodeIntForKey:", CFSTR("pS"));

  }
  v13 = v5;
LABEL_10:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("rClass"));

  -[CPLRecordChange scopedIdentifier](self->_record, "scopedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("r"));

  objc_msgSend(v7, "encodeInteger:forKey:", self->_generation, CFSTR("g"));
  objc_msgSend(v7, "encodeInt:forKey:", self->_status.packedStatus, CFSTR("pS"));

}

- (NSString)statusDescription
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  _BOOL4 v9;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = objc_opt_class();
  -[CPLRecordChange scopedIdentifier](self->_record, "scopedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %@:"), v4, v5);

  v7 = -[CPLRecordStatus isUnknown](self, "isUnknown");
  if (v7)
    objc_msgSend(v6, "appendString:", CFSTR(" unknown"));
  if (-[CPLRecordStatus isResetting](self, "isResetting"))
  {
    objc_msgSend(v6, "appendString:", CFSTR(" resetting"));
    v7 = 1;
  }
  if (-[CPLRecordStatus isQuarantined](self, "isQuarantined"))
  {
    objc_msgSend(v6, "appendString:", CFSTR(" quarantined"));
    v7 = 1;
  }
  if (-[CPLRecordStatus isUploaded](self, "isUploaded"))
  {
    objc_msgSend(v6, "appendString:", CFSTR(" uploaded"));
    v7 = 1;
  }
  if (-[CPLRecordStatus isWaitingForUpload](self, "isWaitingForUpload"))
  {
    objc_msgSend(v6, "appendString:", CFSTR(" waitingForUpload"));
    v7 = 1;
  }
  if (-[CPLRecordStatus isUploading](self, "isUploading"))
  {
    objc_msgSend(v6, "appendString:", CFSTR(" uploading"));
    v7 = 1;
  }
  if (-[CPLRecordStatus isWaitingForUpdate](self, "isWaitingForUpdate"))
  {
    objc_msgSend(v6, "appendString:", CFSTR(" waitingForUpdate"));
    v7 = 1;
  }
  if (-[CPLRecordStatus isUpdating](self, "isUpdating"))
  {
    objc_msgSend(v6, "appendString:", CFSTR(" updating"));
    v7 = 1;
  }
  if (-[CPLRecordStatus isConfirmed](self, "isConfirmed"))
  {
    objc_msgSend(v6, "appendString:", CFSTR(" confirmed"));
    if (-[CPLRecordStatus isShared](self, "isShared"))
    {
      v8 = CFSTR(" shared");
LABEL_25:
      objc_msgSend(v6, "appendString:", v8);
    }
  }
  else
  {
    v9 = -[CPLRecordStatus isShared](self, "isShared");
    if (v9)
      v8 = CFSTR(" shared");
    else
      v8 = CFSTR(" no status");
    if (v9 || !v7)
      goto LABEL_25;
  }
  return (NSString *)v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t generation;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  generation = self->_generation;
  -[CPLRecordStatus statusDescription](self, "statusDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ (%lu) for %@>"), v4, generation, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CPLRecordChange)record
{
  return self->_record;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
