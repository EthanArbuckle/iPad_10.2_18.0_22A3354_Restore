@implementation EDAttachmentMetadata

- (EDAttachmentMetadata)initWithAttachmentID:(id)a3 attachmentHash:(id)a4 nameOnDisk:(id)a5 size:(id)a6 downloadDate:(id)a7 viewCount:(id)a8 lastViewed:(id)a9 viewCountByTapped:(id)a10
{
  id v17;
  EDAttachmentMetadata *v18;
  EDAttachmentMetadata *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v21 = a9;
  v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)EDAttachmentMetadata;
  v18 = -[EDAttachmentMetadata init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_attachmentID, a3);
    objc_storeStrong((id *)&v19->_attachmentHash, a4);
    objc_storeStrong((id *)&v19->_nameOnDisk, a5);
    objc_storeStrong((id *)&v19->_size, a6);
    objc_storeStrong((id *)&v19->_downloadDate, a7);
    objc_storeStrong((id *)&v19->_viewCount, a8);
    objc_storeStrong((id *)&v19->_lastViewed, a9);
    objc_storeStrong((id *)&v19->_viewCountByTapped, a10);
  }

  return v19;
}

- (EDAttachmentMetadata)initWithAttachmentHash:(id)a3 nameOnDisk:(id)a4 size:(id)a5 downloadDate:(id)a6
{
  return -[EDAttachmentMetadata initWithAttachmentID:attachmentHash:nameOnDisk:size:downloadDate:viewCount:lastViewed:viewCountByTapped:](self, "initWithAttachmentID:attachmentHash:nameOnDisk:size:downloadDate:viewCount:lastViewed:viewCountByTapped:", 0, a3, a4, a5, a6, 0, 0, 0);
}

- (EDAttachmentMetadata)initWithAttachmentID:(id)a3 nameOnDisk:(id)a4
{
  return -[EDAttachmentMetadata initWithAttachmentID:attachmentHash:nameOnDisk:size:downloadDate:viewCount:lastViewed:viewCountByTapped:](self, "initWithAttachmentID:attachmentHash:nameOnDisk:size:downloadDate:viewCount:lastViewed:viewCountByTapped:", a3, 0, a4, 0, 0, 0, 0, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[9];

  v30[8] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[EDAttachmentMetadata attachmentID](self, "attachmentID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("attachmentID: %@"), v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v28;
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[EDAttachmentMetadata attachmentHash](self, "attachmentHash");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("attachmentHash: %@"), v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v26;
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[EDAttachmentMetadata nameOnDisk](self, "nameOnDisk");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("nameOnDisk: %@"), v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v24;
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[EDAttachmentMetadata downloadDate](self, "downloadDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("downloadDate: %@"), v23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v7;
  v8 = (void *)MEMORY[0x1E0CB3940];
  -[EDAttachmentMetadata size](self, "size");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("size: %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v10;
  v11 = (void *)MEMORY[0x1E0CB3940];
  -[EDAttachmentMetadata viewCount](self, "viewCount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("viewCount: %@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v13;
  v14 = (void *)MEMORY[0x1E0CB3940];
  -[EDAttachmentMetadata lastViewed](self, "lastViewed");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("lastViewed: %@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v16;
  v17 = (void *)MEMORY[0x1E0CB3940];
  -[EDAttachmentMetadata viewCountByTapped](self, "viewCountByTapped");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("viewCountByTapped: %@"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[7] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (NSNumber)attachmentID
{
  return self->_attachmentID;
}

- (void)setAttachmentID:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentID, a3);
}

- (NSString)attachmentHash
{
  return self->_attachmentHash;
}

- (NSString)nameOnDisk
{
  return self->_nameOnDisk;
}

- (NSNumber)size
{
  return self->_size;
}

- (NSDate)downloadDate
{
  return self->_downloadDate;
}

- (NSNumber)viewCount
{
  return self->_viewCount;
}

- (NSDate)lastViewed
{
  return self->_lastViewed;
}

- (NSNumber)viewCountByTapped
{
  return self->_viewCountByTapped;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewCountByTapped, 0);
  objc_storeStrong((id *)&self->_lastViewed, 0);
  objc_storeStrong((id *)&self->_viewCount, 0);
  objc_storeStrong((id *)&self->_downloadDate, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_nameOnDisk, 0);
  objc_storeStrong((id *)&self->_attachmentHash, 0);
  objc_storeStrong((id *)&self->_attachmentID, 0);
}

@end
