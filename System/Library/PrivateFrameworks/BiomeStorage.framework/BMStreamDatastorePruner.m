@implementation BMStreamDatastorePruner

- (BMStreamDatastorePruner)initWithStream:(id)a3 config:(id)a4 eventDataClass:(Class)a5
{
  id v8;
  id v9;
  BMStreamDatastorePruner *v10;
  BMStreamDatastore *v11;
  uint64_t v12;
  BMStreamDatastore *inner;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BMStreamDatastorePruner;
  v10 = -[BMStreamDatastorePruner init](&v15, sel_init);
  if (v10)
  {
    v11 = [BMStreamDatastore alloc];
    v12 = -[BMStreamDatastore initWithStream:permission:config:includeTombstones:eventDataClass:useCase:](v11, "initWithStream:permission:config:includeTombstones:eventDataClass:useCase:", v8, 2, v9, 1, a5, *MEMORY[0x1E0D01CA8]);
    inner = v10->_inner;
    v10->_inner = (BMStreamDatastore *)v12;

  }
  return v10;
}

- (BMStreamDatastorePruner)initWithStream:(id)a3 config:(id)a4
{
  return -[BMStreamDatastorePruner initWithStream:config:eventDataClass:](self, "initWithStream:config:eventDataClass:", a3, a4, 0);
}

- (BOOL)isDataAccessible
{
  return -[BMStreamDatastore isDataAccessible](self->_inner, "isDataAccessible");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inner, 0);
}

- (void)eventsFrom:(double)a3 to:(double)a4 reason:(unint64_t)a5 shouldDeleteUsingBlock:(id)a6
{
  -[BMStreamDatastorePruner eventsFrom:to:reason:policyID:shouldDeleteUsingBlock:](self, "eventsFrom:to:reason:policyID:shouldDeleteUsingBlock:", a5, 0, a6, a3, a4);
}

- (void)removeEventsFrom:(double)a3 to:(double)a4 reason:(unint64_t)a5 usingBlock:(id)a6
{
  void *v10;
  void *v11;
  int v12;
  id v13;

  v13 = a6;
  objc_msgSend(MEMORY[0x1E0D01D20], "streamIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMStreamDatastore streamId](self->_inner, "streamId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "containsObject:", v11);

  if (v12)
    -[BMStreamDatastore pruneStreamToMaxStreamSizeInBytes:](self->_inner, "pruneStreamToMaxStreamSizeInBytes:", 52428800);
  -[BMStreamDatastore removeEventsFrom:to:reason:pruneFutureEvents:usingBlock:](self->_inner, "removeEventsFrom:to:reason:pruneFutureEvents:usingBlock:", a5, 1, v13, a3, a4);

}

- (void)setDelegate:(id)a3
{
  -[BMStreamDatastore setDelegate:](self->_inner, "setDelegate:", a3);
}

- (id)fetchEventsFrom:(double)a3 to:(double)a4
{
  return -[BMStreamDatastore fetchEventsFrom:to:](self->_inner, "fetchEventsFrom:to:", a3, a4);
}

- (BOOL)deleteEventAtBookmark:(id)a3 outTombstoneBookmark:(id *)a4
{
  return -[BMStreamDatastore deleteEventAtBookmark:outTombstoneBookmark:](self->_inner, "deleteEventAtBookmark:outTombstoneBookmark:", a3, a4);
}

- (void)eventsFrom:(double)a3 to:(double)a4 reason:(unint64_t)a5 policyID:(id)a6 shouldDeleteUsingBlock:(id)a7
{
  id v12;
  void *v13;
  void *v14;
  int v15;
  id v16;

  v16 = a6;
  v12 = a7;
  objc_msgSend(MEMORY[0x1E0D01D20], "streamIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMStreamDatastore streamId](self->_inner, "streamId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "containsObject:", v14);

  if (v15)
    -[BMStreamDatastore pruneStreamToMaxStreamSizeInBytes:](self->_inner, "pruneStreamToMaxStreamSizeInBytes:", 52428800);
  -[BMStreamDatastore removeEventsFrom:to:reason:policyID:shouldDeleteUsingBlock:](self->_inner, "removeEventsFrom:to:reason:policyID:shouldDeleteUsingBlock:", a5, v16, v12, a3, a4);

}

- (id)newEnumeratorFromStartTime:(double)a3
{
  return -[BMStreamDatastore newEnumeratorFromStartTime:](self->_inner, "newEnumeratorFromStartTime:", a3);
}

- (id)newEnumeratorFromBookmark:(id)a3
{
  return -[BMStreamDatastore newEnumeratorFromBookmark:](self->_inner, "newEnumeratorFromBookmark:", a3);
}

- (void)syncMappedFiles
{
  -[BMStreamDatastore syncMappedFiles](self->_inner, "syncMappedFiles");
}

- (Class)eventBodyClass
{
  return -[BMStreamDatastore eventBodyClass](self->_inner, "eventBodyClass");
}

- (id)streamIdentifier
{
  return -[BMStreamDatastore streamId](self->_inner, "streamId");
}

- (BMStreamDatastorePruningDelegate)delegate
{
  return -[BMStreamDatastore delegate](self->_inner, "delegate");
}

@end
