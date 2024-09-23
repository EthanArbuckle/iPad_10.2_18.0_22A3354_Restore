@implementation AVMusicUserEvent

- (AVMusicUserEvent)initWithData:(NSData *)data
{
  NSData *v4;
  AVMusicUserEvent *v5;
  NSMutableData *v6;
  NSMutableData *userData;
  int v9;
  objc_super v10;

  v4 = data;
  v10.receiver = self;
  v10.super_class = (Class)AVMusicUserEvent;
  v5 = -[AVMusicUserEvent init](&v10, sel_init);
  if (v5)
  {
    v9 = -[NSData length](v4, "length");
    v6 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    userData = v5->_userData;
    v5->_userData = v6;

    -[NSMutableData appendBytes:length:](v5->_userData, "appendBytes:length:", &v9, 4);
    -[NSMutableData appendData:](v5->_userData, "appendData:", v4);
  }

  return v5;
}

- (UInt32)sizeInBytes
{
  return -[NSMutableData length](self->_userData, "length") - 4;
}

- (AVMusicUserEvent)initWithUserData:(MusicEventUserData *)a3
{
  AVMusicUserEvent *v4;
  NSMutableData *v5;
  NSMutableData *userData;
  NSMutableData *v7;
  void *v8;
  UInt32 length;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVMusicUserEvent;
  v4 = -[AVMusicUserEvent init](&v11, sel_init);
  if (v4)
  {
    length = a3->length;
    v5 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    userData = v4->_userData;
    v4->_userData = v5;

    -[NSMutableData appendBytes:length:](v4->_userData, "appendBytes:length:", &length, 4);
    v7 = v4->_userData;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a3->data, a3->length);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableData appendData:](v7, "appendData:", v8);

  }
  return v4;
}

- (MusicEventUserData)userData
{
  return (MusicEventUserData *)-[NSMutableData bytes](self->_userData, "bytes");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
}

@end
