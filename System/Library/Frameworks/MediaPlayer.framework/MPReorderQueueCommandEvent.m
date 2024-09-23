@implementation MPReorderQueueCommandEvent

- (MPReorderQueueCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5;
  id v8;
  MPReorderQueueCommandEvent *v9;
  uint64_t v10;
  NSString *insertAfterContextItemID;
  uint64_t v12;
  NSString *insertBeforeContextItemID;
  void *v14;
  void *v15;
  uint64_t v16;
  objc_super v18;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MPReorderQueueCommandEvent;
  v9 = -[MPRemoteCommandEvent initWithCommand:mediaRemoteType:options:](&v18, sel_initWithCommand_mediaRemoteType_options_, a3, v5, v8);
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CC00]);
    v10 = objc_claimAutoreleasedReturnValue();
    insertAfterContextItemID = v9->_insertAfterContextItemID;
    v9->_insertAfterContextItemID = (NSString *)v10;

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CC08]);
    v12 = objc_claimAutoreleasedReturnValue();
    insertBeforeContextItemID = v9->_insertBeforeContextItemID;
    v9->_insertBeforeContextItemID = (NSString *)v12;

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D4CC30]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
      v16 = objc_msgSend(v14, "integerValue");
    else
      v16 = 0x7FFFFFFFFFFFFFFFLL;
    v9->_destinationOffset = v16;

  }
  return v9;
}

- (NSString)insertBeforeContextItemID
{
  return self->_insertBeforeContextItemID;
}

- (NSString)insertAfterContextItemID
{
  return self->_insertAfterContextItemID;
}

- (int64_t)destinationOffset
{
  return self->_destinationOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertAfterContextItemID, 0);
  objc_storeStrong((id *)&self->_insertBeforeContextItemID, 0);
}

@end
