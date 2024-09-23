@implementation IMDAttachmentDiagnosticInfo

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  objc_super v16;

  v15 = (void *)MEMORY[0x1E0CB3940];
  v16.receiver = self;
  v16.super_class = (Class)IMDAttachmentDiagnosticInfo;
  -[IMDAttachmentDiagnosticInfo description](&v16, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDAttachmentDiagnosticInfo guid](self, "guid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[IMDAttachmentDiagnosticInfo total_bytes](self, "total_bytes");
  -[IMDAttachmentDiagnosticInfo ck_sync_state](self, "ck_sync_state");
  IMStringFromCKSyncState();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDAttachmentDiagnosticInfo transfer_state](self, "transfer_state");
  IMStringFromTransferState();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDAttachmentDiagnosticInfo uti](self, "uti");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDAttachmentDiagnosticInfo filePath](self, "filePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IMDAttachmentDiagnosticInfo is_sticker](self, "is_sticker"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  -[IMDAttachmentDiagnosticInfo mime_type](self, "mime_type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDAttachmentDiagnosticInfo plugin_identifier](self, "plugin_identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: guid: %@, total_bytes: %lld, ck_sync_state: %@, transfer_state: %@, uti: %@, file path: %@, is_sticker: %@, mime_type: %@, plugin_identifier: %@"), v3, v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_storeStrong((id *)&self->_guid, a3);
}

- (NSString)originalGUID
{
  return self->_originalGUID;
}

- (void)setOriginalGUID:(id)a3
{
  objc_storeStrong((id *)&self->_originalGUID, a3);
}

- (NSString)uti
{
  return self->_uti;
}

- (void)setUti:(id)a3
{
  objc_storeStrong((id *)&self->_uti, a3);
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_filePath, a3);
}

- (unint64_t)total_bytes
{
  return self->_total_bytes;
}

- (void)setTotal_bytes:(unint64_t)a3
{
  self->_total_bytes = a3;
}

- (int64_t)ck_sync_state
{
  return self->_ck_sync_state;
}

- (void)setCk_sync_state:(int64_t)a3
{
  self->_ck_sync_state = a3;
}

- (int64_t)transfer_state
{
  return self->_transfer_state;
}

- (void)setTransfer_state:(int64_t)a3
{
  self->_transfer_state = a3;
}

- (unint64_t)hide_attachment
{
  return self->_hide_attachment;
}

- (void)setHide_attachment:(unint64_t)a3
{
  self->_hide_attachment = a3;
}

- (unint64_t)is_sticker
{
  return self->_is_sticker;
}

- (void)setIs_sticker:(unint64_t)a3
{
  self->_is_sticker = a3;
}

- (NSString)mime_type
{
  return self->_mime_type;
}

- (void)setMime_type:(id)a3
{
  objc_storeStrong((id *)&self->_mime_type, a3);
}

- (NSString)plugin_identifier
{
  return self->_plugin_identifier;
}

- (void)setPlugin_identifier:(id)a3
{
  objc_storeStrong((id *)&self->_plugin_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plugin_identifier, 0);
  objc_storeStrong((id *)&self->_mime_type, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_originalGUID, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end
