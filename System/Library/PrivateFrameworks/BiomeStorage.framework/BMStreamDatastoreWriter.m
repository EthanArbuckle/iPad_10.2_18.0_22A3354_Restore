@implementation BMStreamDatastoreWriter

- (BOOL)writeEventWithEventBody:(id)a3 timestamp:(double)a4 outEventSize:(unint64_t *)a5
{
  return -[BMStreamDatastore writeEventWithEventBody:timestamp:outEventSize:](self->_inner, "writeEventWithEventBody:timestamp:outEventSize:", a3, a5, a4);
}

- (BOOL)isDataAccessible
{
  return -[BMStreamDatastore isDataAccessible](self->_inner, "isDataAccessible");
}

- (BMStreamDatastoreWriter)initWithStream:(id)a3 config:(id)a4 eventDataClass:(Class)a5
{
  id v8;
  id v9;
  BMStreamDatastoreWriter *v10;
  BMStreamDatastore *v11;
  uint64_t v12;
  BMStreamDatastore *inner;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BMStreamDatastoreWriter;
  v10 = -[BMStreamDatastoreWriter init](&v15, sel_init);
  if (v10)
  {
    v11 = [BMStreamDatastore alloc];
    v12 = -[BMStreamDatastore initWithStream:permission:config:includeTombstones:eventDataClass:useCase:](v11, "initWithStream:permission:config:includeTombstones:eventDataClass:useCase:", v8, 1, v9, 0, a5, *MEMORY[0x1E0D01CB8]);
    inner = v10->_inner;
    v10->_inner = (BMStreamDatastore *)v12;

  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inner, 0);
}

- (BOOL)writeEventWithEventBody:(id)a3
{
  return -[BMStreamDatastore writeEventWithEventBody:](self->_inner, "writeEventWithEventBody:", a3);
}

- (Class)eventBodyClass
{
  return -[BMStreamDatastore eventBodyClass](self->_inner, "eventBodyClass");
}

- (BOOL)writeEventBodyClass:(Class)a3
{
  return -[BMStreamDatastore updateMetadata:](self->_inner, "updateMetadata:", a3);
}

- (BMStreamDatastoreWriter)initWithStream:(id)a3 config:(id)a4
{
  return -[BMStreamDatastoreWriter initWithStream:config:eventDataClass:](self, "initWithStream:config:eventDataClass:", a3, a4, 0);
}

- (BOOL)_writeEventData:(id)a3 dataVersion:(unsigned int)a4 timestamp:(double)a5 outBookmark:(id *)a6
{
  return -[BMStreamDatastore writeEventData:dataVersion:timestamp:outBookmark:](self->_inner, "writeEventData:dataVersion:timestamp:outBookmark:", a3, *(_QWORD *)&a4, a6, a5);
}

- (id)streamIdentifier
{
  return -[BMStreamDatastore streamId](self->_inner, "streamId");
}

- (void)syncMappedFiles
{
  -[BMStreamDatastore syncMappedFiles](self->_inner, "syncMappedFiles");
}

- (BOOL)writeEventWithEventBody:(id)a3 timestamp:(double)a4
{
  return -[BMStreamDatastore writeEventWithEventBody:timestamp:outEventSize:](self->_inner, "writeEventWithEventBody:timestamp:outEventSize:", a3, 0, a4);
}

+ (id)outOfProcessWriterForStream:(id)a3 user:(unsigned int)a4 eventDataClass:(Class)a5
{
  uint64_t v6;
  id v7;
  BMStreamDatastoreOutOfProcessWriter *v8;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v8 = -[BMStreamDatastoreOutOfProcessWriter initWithStream:user:eventDataClass:]([BMStreamDatastoreOutOfProcessWriter alloc], "initWithStream:user:eventDataClass:", v7, v6, a5);

  return v8;
}

@end
