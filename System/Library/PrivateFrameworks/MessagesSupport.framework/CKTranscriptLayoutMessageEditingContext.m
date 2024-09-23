@implementation CKTranscriptLayoutMessageEditingContext

- (CKTranscriptLayoutMessageEditingContext)initWithEditedMessageGuid:(id)a3 editedMessageHeight:(double)a4
{
  id v6;
  CKTranscriptLayoutMessageEditingContext *v7;
  uint64_t v8;
  NSString *editedMessageGuid;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKTranscriptLayoutMessageEditingContext;
  v7 = -[CKTranscriptLayoutMessageEditingContext init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    editedMessageGuid = v7->_editedMessageGuid;
    v7->_editedMessageGuid = (NSString *)v8;

    v7->_editedMessageHeight = a4;
  }

  return v7;
}

- (BOOL)isEqualToContext:(id)a3
{
  id v4;
  void *v5;
  NSString *editedMessageGuid;
  void *v7;
  double editedMessageHeight;
  double v9;
  BOOL v10;

  v4 = a3;
  v5 = v4;
  if (v4
    && (editedMessageGuid = self->_editedMessageGuid,
        objc_msgSend(v4, "editedMessageGuid"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(editedMessageGuid) = -[NSString isEqualToString:](editedMessageGuid, "isEqualToString:", v7),
        v7,
        (_DWORD)editedMessageGuid))
  {
    editedMessageHeight = self->_editedMessageHeight;
    objc_msgSend(v5, "editedMessageHeight");
    v10 = vabdd_f64(editedMessageHeight, v9) <= 0.001;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)editedMessageGuid
{
  return self->_editedMessageGuid;
}

- (void)setEditedMessageGuid:(id)a3
{
  objc_storeStrong((id *)&self->_editedMessageGuid, a3);
}

- (double)editedMessageHeight
{
  return self->_editedMessageHeight;
}

- (void)setEditedMessageHeight:(double)a3
{
  self->_editedMessageHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editedMessageGuid, 0);
}

@end
