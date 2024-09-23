@implementation SYDeletedObject

- (SYDeletedObject)initWithSyncId:(id)a3
{
  id v4;
  SYDeletedObject *v5;
  uint64_t v6;
  NSString *syncId;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SYDeletedObject;
  v5 = -[SYDeletedObject init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    syncId = v5->_syncId;
    v5->_syncId = (NSString *)v6;

  }
  return v5;
}

- (SYDeletedObject)initWithObjectID:(id)a3 sequencer:(id)a4
{
  id v6;
  SYDeletedObject *v7;
  uint64_t v8;
  NSString *sequencer;
  SYDeletedObject *v10;

  v6 = a4;
  v7 = -[SYDeletedObject initWithSyncId:](self, "initWithSyncId:", a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    sequencer = v7->_sequencer;
    v7->_sequencer = (NSString *)v8;

    v10 = v7;
  }

  return v7;
}

- (int64_t)changeType
{
  return 3;
}

- (NSString)sequencer
{
  return self->_sequencer;
}

- (NSString)syncId
{
  return self->_syncId;
}

- (void)setSyncId:(id)a3
{
  objc_storeStrong((id *)&self->_syncId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncId, 0);
  objc_storeStrong((id *)&self->_sequencer, 0);
}

@end
