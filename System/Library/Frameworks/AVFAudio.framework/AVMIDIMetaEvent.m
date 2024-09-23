@implementation AVMIDIMetaEvent

- (AVMIDIMetaEvent)initWithType:(AVMIDIMetaEventType)type data:(NSData *)data
{
  char v4;
  NSData *v6;
  AVMIDIMetaEvent *v7;
  unsigned int v8;
  char *v9;
  objc_super v11;

  v4 = type;
  v6 = data;
  v11.receiver = self;
  v11.super_class = (Class)AVMIDIMetaEvent;
  v7 = -[AVMIDIMetaEvent init](&v11, sel_init);
  if (v7)
  {
    v8 = -[NSData length](v6, "length");
    v9 = (char *)malloc_type_malloc(v8 + 11, 0x8113B206uLL);
    *v9 = v4;
    v9[3] = 0;
    *(_WORD *)(v9 + 1) = 0;
    *((_DWORD *)v9 + 1) = v8;
    memcpy(v9 + 8, -[NSData bytes](objc_retainAutorelease(v6), "bytes"), v8);
    v7->_event = (MIDIMetaEvent *)v9;
  }

  return v7;
}

- (AVMIDIMetaEventType)type
{
  return (unint64_t)self->_event->metaEventType;
}

- (AVMIDIMetaEvent)initWithMetaEvent:(MIDIMetaEvent *)a3
{
  AVMIDIMetaEvent *v4;
  char *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVMIDIMetaEvent;
  v4 = -[AVMIDIMetaEvent init](&v7, sel_init);
  if (v4)
  {
    v5 = (char *)malloc_type_malloc(a3->dataLength + 11, 0x85DD1E1FuLL);
    *v5 = a3->metaEventType;
    v5[3] = 0;
    *(_WORD *)(v5 + 1) = 0;
    *((_DWORD *)v5 + 1) = a3->dataLength;
    memcpy(v5 + 8, a3->data, a3->dataLength);
    v4->_event = (MIDIMetaEvent *)v5;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_event);
  v3.receiver = self;
  v3.super_class = (Class)AVMIDIMetaEvent;
  -[AVMIDIMetaEvent dealloc](&v3, sel_dealloc);
}

- (MIDIMetaEvent)metaEvent
{
  return self->_event;
}

@end
