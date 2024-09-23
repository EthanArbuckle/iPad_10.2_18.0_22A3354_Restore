@implementation UploadRecord

- (id)outcomeTelemetryDictionary
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  -[UploadRecord dateUploaded](self, "dateUploaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UploadRecord dateLastProcessed](self, "dateLastProcessed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v8;

  }
  -[UploadRecord dateCreated](self, "dateCreated");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", v5);
  v11 = (uint64_t)v10;

  v12 = (-[UploadRecord size](self, "size") + 1023) >> 10;
  v21[0] = CFSTR("age");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11 / -3600);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v13;
  v21[1] = CFSTR("bundle_id");
  -[UploadRecord applicationIdentifier](self, "applicationIdentifier");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = &stru_1E68A3948;
  if (v14)
    v16 = (const __CFString *)v14;
  v22[1] = v16;
  v22[2] = &unk_1E68A6228;
  v21[2] = CFSTR("category");
  v21[3] = CFSTR("outcome");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[UploadRecord uploadStatus](self, "uploadStatus"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v17;
  v21[4] = CFSTR("size");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (NSString)uploadIdentifier
{
  return self->_uploadIdentifier;
}

- (void)setUploadIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)timestampReferenceIdentifier
{
  return self->_timestampReferenceIdentifier;
}

- (void)setTimestampReferenceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int)uploadStatus
{
  return self->_uploadStatus;
}

- (void)setUploadStatus:(int)a3
{
  self->_uploadStatus = a3;
}

- (unint64_t)processedAttempts
{
  return self->_processedAttempts;
}

- (void)setProcessedAttempts:(unint64_t)a3
{
  self->_processedAttempts = a3;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)dateLastProcessed
{
  return self->_dateLastProcessed;
}

- (void)setDateLastProcessed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)dateUploaded
{
  return self->_dateUploaded;
}

- (void)setDateUploaded:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_dateUploaded, 0);
  objc_storeStrong((id *)&self->_dateLastProcessed, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_timestampReferenceIdentifier, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_uploadIdentifier, 0);
}

@end
