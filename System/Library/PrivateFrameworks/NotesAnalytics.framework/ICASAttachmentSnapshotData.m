@implementation ICASAttachmentSnapshotData

- (ICASAttachmentSnapshotData)initWithAttachmentSnapshotSummary:(id)a3 docScanSnapshotSummary:(id)a4 drawingSnapshotSummary:(id)a5 tableSnapshotSummary:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ICASAttachmentSnapshotData *v15;
  ICASAttachmentSnapshotData *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICASAttachmentSnapshotData;
  v15 = -[ICASAttachmentSnapshotData init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_attachmentSnapshotSummary, a3);
    objc_storeStrong((id *)&v16->_docScanSnapshotSummary, a4);
    objc_storeStrong((id *)&v16->_drawingSnapshotSummary, a5);
    objc_storeStrong((id *)&v16->_tableSnapshotSummary, a6);
  }

  return v16;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("AttachmentSnapshotData");
}

- (id)toDict
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("attachmentSnapshotSummary");
  -[ICASAttachmentSnapshotData attachmentSnapshotSummary](self, "attachmentSnapshotSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICASAttachmentSnapshotData attachmentSnapshotSummary](self, "attachmentSnapshotSummary");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v18[0] = v4;
  v17[1] = CFSTR("docScanSnapshotSummary");
  -[ICASAttachmentSnapshotData docScanSnapshotSummary](self, "docScanSnapshotSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ICASAttachmentSnapshotData docScanSnapshotSummary](self, "docScanSnapshotSummary");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v18[1] = v7;
  v17[2] = CFSTR("drawingSnapshotSummary");
  -[ICASAttachmentSnapshotData drawingSnapshotSummary](self, "drawingSnapshotSummary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[ICASAttachmentSnapshotData drawingSnapshotSummary](self, "drawingSnapshotSummary");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_opt_new();
  }
  v11 = (void *)v10;
  v18[2] = v10;
  v17[3] = CFSTR("tableSnapshotSummary");
  -[ICASAttachmentSnapshotData tableSnapshotSummary](self, "tableSnapshotSummary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[ICASAttachmentSnapshotData tableSnapshotSummary](self, "tableSnapshotSummary");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_opt_new();
  }
  v14 = (void *)v13;
  v18[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSArray)attachmentSnapshotSummary
{
  return self->_attachmentSnapshotSummary;
}

- (NSArray)docScanSnapshotSummary
{
  return self->_docScanSnapshotSummary;
}

- (NSArray)drawingSnapshotSummary
{
  return self->_drawingSnapshotSummary;
}

- (NSArray)tableSnapshotSummary
{
  return self->_tableSnapshotSummary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableSnapshotSummary, 0);
  objc_storeStrong((id *)&self->_drawingSnapshotSummary, 0);
  objc_storeStrong((id *)&self->_docScanSnapshotSummary, 0);
  objc_storeStrong((id *)&self->_attachmentSnapshotSummary, 0);
}

@end
