@implementation BMStreamDatastoreReader

- (id)newEnumeratorFromBookmark:(id)a3
{
  return -[BMStreamDatastore newEnumeratorFromBookmark:options:](self->_inner, "newEnumeratorFromBookmark:options:", a3, 0);
}

- (id)newEnumeratorFromStartTime:(double)a3 endTime:(double)a4 maxEvents:(unint64_t)a5 lastN:(unint64_t)a6 options:(unint64_t)a7
{
  return -[BMStreamDatastore newEnumeratorFromStartTime:endTime:maxEvents:lastN:options:](self->_inner, "newEnumeratorFromStartTime:endTime:maxEvents:lastN:options:", a5, a6, a7, a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inner, 0);
}

- (BMStreamDatastoreReader)initWithStream:(id)a3 config:(id)a4 eventDataClass:(Class)a5 useCase:(id)a6
{
  id v10;
  id v11;
  id v12;
  BMStreamDatastoreReader *v13;
  BMStreamDatastore *v14;
  BMStreamDatastore *inner;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BMStreamDatastoreReader;
  v13 = -[BMStreamDatastoreReader init](&v17, sel_init);
  if (v13)
  {
    v14 = -[BMStreamDatastore initWithStream:streamPath:permission:config:eventDataClass:useCase:]([BMStreamDatastore alloc], "initWithStream:streamPath:permission:config:eventDataClass:useCase:", v10, 0, 0, v11, a5, v12);
    inner = v13->_inner;
    v13->_inner = v14;

  }
  return v13;
}

- (BMStreamDatastoreReader)initWithStream:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  BMStreamDatastoreReader *v8;
  BMStreamDatastore *v9;
  BMStreamDatastore *inner;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMStreamDatastoreReader;
  v8 = -[BMStreamDatastoreReader init](&v12, sel_init);
  if (v8)
  {
    v9 = -[BMStreamDatastore initWithStream:permission:config:includeTombstones:]([BMStreamDatastore alloc], "initWithStream:permission:config:includeTombstones:", v6, 0, v7, 0);
    inner = v8->_inner;
    v8->_inner = v9;

  }
  return v8;
}

- (id)fetchEventsFrom:(double)a3 to:(double)a4
{
  return -[BMStreamDatastore fetchEventsFrom:to:options:](self->_inner, "fetchEventsFrom:to:options:", 0, a3, a4);
}

- (id)fetchEventsFrom:(double)a3 to:(double)a4 options:(unint64_t)a5
{
  return -[BMStreamDatastore fetchEventsFrom:to:options:](self->_inner, "fetchEventsFrom:to:options:", a5, a3, a4);
}

- (id)newEnumeratorFromStartTime:(double)a3
{
  return -[BMStreamDatastore newEnumeratorFromStartTime:options:](self->_inner, "newEnumeratorFromStartTime:options:", 0, a3);
}

- (id)newEnumeratorFromStartTime:(double)a3 options:(unint64_t)a4
{
  BMStreamDatastore *inner;
  void *v7;
  double v8;
  id v9;

  inner = self->_inner;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v9 = -[BMStreamDatastore newEnumeratorFromStartTime:endTime:options:](inner, "newEnumeratorFromStartTime:endTime:options:", a4, a3, v8);

  return v9;
}

- (id)newEnumeratorFromStartTime:(double)a3 endTime:(double)a4 maxEvents:(unint64_t)a5 options:(unint64_t)a6
{
  return -[BMStreamDatastore newEnumeratorFromStartTime:endTime:maxEvents:options:](self->_inner, "newEnumeratorFromStartTime:endTime:maxEvents:options:", a5, a6, a3, a4);
}

- (id)newEnumeratorFromBookmarkEnumerator:(id)a3 error:(id *)a4
{
  return -[BMStreamDatastore newEnumeratorFromBookmarkEnumerator:error:](self->_inner, "newEnumeratorFromBookmarkEnumerator:error:", a3, a4);
}

- (id)newEnumeratorFromBookmark:(id)a3 options:(unint64_t)a4
{
  return -[BMStreamDatastore newEnumeratorFromBookmark:options:](self->_inner, "newEnumeratorFromBookmark:options:", a3, a4);
}

- (Class)eventBodyClass
{
  return -[BMStreamDatastore eventBodyClass](self->_inner, "eventBodyClass");
}

- (id)streamIdentifier
{
  return -[BMStreamDatastore streamId](self->_inner, "streamId");
}

- (BOOL)isDataAccessible
{
  return -[BMStreamDatastore isDataAccessible](self->_inner, "isDataAccessible");
}

- (BMStreamDatastore)inner
{
  return self->_inner;
}

@end
