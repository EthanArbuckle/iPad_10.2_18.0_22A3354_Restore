@implementation AVMIDISysexEvent

- (AVMIDISysexEvent)initWithData:(NSData *)data
{
  NSData *v4;
  AVMIDISysexEvent *v5;
  NSMutableData *v6;
  NSMutableData *sysexData;
  int v9;
  objc_super v10;

  v4 = data;
  v10.receiver = self;
  v10.super_class = (Class)AVMIDISysexEvent;
  v5 = -[AVMIDISysexEvent init](&v10, sel_init);
  if (v5)
  {
    v9 = -[NSData length](v4, "length");
    v6 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    sysexData = v5->_sysexData;
    v5->_sysexData = v6;

    -[NSMutableData appendBytes:length:](v5->_sysexData, "appendBytes:length:", &v9, 4);
    -[NSMutableData appendData:](v5->_sysexData, "appendData:", v4);
  }

  return v5;
}

- (UInt32)sizeInBytes
{
  return -[NSMutableData length](self->_sysexData, "length") - 4;
}

- (AVMIDISysexEvent)initWithMIDIRawData:(MIDIRawData *)a3
{
  AVMIDISysexEvent *v4;
  NSMutableData *v5;
  NSMutableData *sysexData;
  NSMutableData *v7;
  void *v8;
  UInt32 length;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVMIDISysexEvent;
  v4 = -[AVMIDISysexEvent init](&v11, sel_init);
  if (v4)
  {
    v5 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    sysexData = v4->_sysexData;
    v4->_sysexData = v5;

    length = a3->length;
    -[NSMutableData appendBytes:length:](v4->_sysexData, "appendBytes:length:", &length, 4);
    v7 = v4->_sysexData;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a3->data, length);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableData appendData:](v7, "appendData:", v8);

  }
  return v4;
}

- (MIDIRawData)rawData
{
  return (MIDIRawData *)-[NSMutableData bytes](self->_sysexData, "bytes");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sysexData, 0);
}

@end
