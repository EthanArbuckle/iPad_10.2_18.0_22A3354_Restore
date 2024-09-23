@implementation HIDEvent

- (void)dealloc
{
  IOHIDEventData *eventData;
  __CFArray *children;
  CFIndex Count;
  CFIndex v6;
  CFIndex i;
  _QWORD *ValueAtIndex;
  char *attributeData;
  void *sender;
  __CFDictionary *attachments;
  objc_super v12;

  eventData = self->_event.eventData;
  if (eventData)
    free(eventData);
  children = self->_event.children;
  if (children)
  {
    Count = CFArrayGetCount(children);
    if (Count >= 1)
    {
      v6 = Count;
      for (i = 0; i != v6; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(self->_event.children, i);
        if (ValueAtIndex)
          ValueAtIndex[10] = 0;
      }
    }
    CFRelease(self->_event.children);
  }
  attributeData = self->_event.attributeData;
  if (attributeData)
    free(attributeData);
  sender = self->_event.sender;
  if (sender)
    CFRelease(sender);
  attachments = self->_event.attachments;
  if (attachments)
    CFRelease(attachments);
  v12.receiver = self;
  v12.super_class = (Class)HIDEvent;
  -[HIDEvent dealloc](&v12, sel_dealloc);
}

- (HIDEvent)initWithSize:(unint64_t)a3 type:(unsigned int)a4 timestamp:(unint64_t)a5 options:(unsigned int)a6
{
  HIDEvent *v10;
  HIDEvent *result;
  IOHIDEventData *eventData;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HIDEvent;
  v10 = -[HIDEvent init](&v13, sel_init);
  result = 0;
  if (a3 >= 0x10 && v10)
  {
    result = (HIDEvent *)malloc_type_malloc(a3, 0xDB656780uLL);
    v10->_event.eventData = (IOHIDEventData *)result;
    if (result)
    {
      bzero(result, a3);
      v10->_event.timeStamp = a5;
      v10->_event.options = a6;
      v10->_event.typeMask = 1 << a4;
      eventData = v10->_event.eventData;
      *(_DWORD *)eventData = a3;
      *((_DWORD *)eventData + 1) = a4;
      *((_DWORD *)eventData + 2) = a6;
      return v10;
    }
  }
  return result;
}

- (id)description
{
  return IOHIDEventCopyDescription((uint64_t)self);
}

@end
