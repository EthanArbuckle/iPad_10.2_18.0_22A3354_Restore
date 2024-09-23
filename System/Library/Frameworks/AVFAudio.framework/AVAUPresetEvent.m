@implementation AVAUPresetEvent

- (AVAUPresetEvent)initWithScope:(UInt32)scope element:(UInt32)element dictionary:(NSDictionary *)presetDictionary
{
  NSDictionary *v8;
  AVAUPresetEvent *v9;
  AVAUPresetEvent *v10;
  objc_super v12;

  v8 = presetDictionary;
  v12.receiver = self;
  v12.super_class = (Class)AVAUPresetEvent;
  v9 = -[AVAUPresetEvent init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_event.scope = scope;
    v9->_event.element = element;
    v9->_event.preset = (CFPropertyListRef)-[NSDictionary copy](v8, "copy");
  }

  return v10;
}

- (UInt32)scope
{
  return self->_event.scope;
}

- (void)setScope:(UInt32)scope
{
  self->_event.scope = scope;
}

- (UInt32)element
{
  return self->_event.element;
}

- (void)setElement:(UInt32)element
{
  self->_event.element = element;
}

- (NSDictionary)presetDictionary
{
  return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", self->_event.preset);
}

- (AVAUPresetEvent)initWithAUPresetEvent:(AUPresetEvent *)a3
{
  AVAUPresetEvent *v4;
  AVAUPresetEvent *v5;
  CFPropertyListRef preset;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVAUPresetEvent;
  v4 = -[AVAUPresetEvent init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    *(_QWORD *)&v4->_event.scope = *(_QWORD *)&a3->scope;
    preset = a3->preset;
    v5->_event.preset = preset;
    CFRetain(preset);
  }
  return v5;
}

- (void)dealloc
{
  CFPropertyListRef preset;
  objc_super v4;

  preset = self->_event.preset;
  if (preset)
    CFRelease(preset);
  v4.receiver = self;
  v4.super_class = (Class)AVAUPresetEvent;
  -[AVAUPresetEvent dealloc](&v4, sel_dealloc);
}

- (AUPresetEvent)event
{
  return &self->_event;
}

@end
