@implementation BKEvent

- (BKEvent)initWithEventOrCode:(unint64_t)a3
{
  BKEvent *v4;
  BKEvent *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKEvent;
  v4 = -[BKEvent init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_cls = BYTE4(a3);
    v4->_event = a3;
    -[BKEvent setProperties](v4, "setProperties");
  }
  return v5;
}

- (BKEvent)initWithEncodedEventOrCode:(unsigned int)a3
{
  BKEvent *v4;
  BKEvent *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKEvent;
  v4 = -[BKEvent init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_cls = HIBYTE(a3);
    v4->_event = a3 & 0x3FFFFF;
    v4->_isHigh = (a3 & 0x800000) != 0;
    v4->_isLow = (a3 & 0x400000) != 0;
    -[BKEvent setProperties](v4, "setProperties");
  }
  return v5;
}

- (void)setProperties
{
  signed int event;
  uint64_t v3;

  if (self->_cls == 1)
  {
    if (self->_event != 58)
      return;
    goto LABEL_9;
  }
  if (self->_cls)
    return;
  event = self->_event;
  if (event >= 655360)
  {
    if ((event - 655360) >= 2)
      goto LABEL_12;
    v3 = 12;
LABEL_14:
    *((_BYTE *)&self->super.isa + v3) = 1;
    return;
  }
  switch(event)
  {
    case 65538:
      goto LABEL_9;
    case 262144:
LABEL_13:
      v3 = 9;
      goto LABEL_14;
    case 262146:
LABEL_9:
      v3 = 10;
      goto LABEL_14;
  }
LABEL_12:
  if ((event - 393216) < 0x101)
    goto LABEL_13;
  if ((event - 0x80000) < 0x101)
  {
    v3 = 11;
    goto LABEL_14;
  }
}

- (id)description
{
  const char *v3;
  void *v4;
  void *v5;
  uint64_t v7;

  if (self->_isHigh)
  {
    v3 = "HI ";
  }
  else if (self->_isLow)
  {
    v3 = "LO ";
  }
  else
  {
    v3 = (const char *)&unk_21491C593;
  }
  if (self->_cls)
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("class %u code %s%u (%x)"), self->_cls, v3, self->_event, self->_event);
  else
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("code %s%u (%x)"), v3, self->_event, self->_event, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_isStart)
    objc_msgSend(v4, "appendFormat:", CFSTR(" (start)"));
  if (self->_isTerminal)
    objc_msgSend(v5, "appendFormat:", CFSTR(" (terminal)"));
  if (self->_isMetadata)
    objc_msgSend(v5, "appendFormat:", CFSTR(" (metadata)"));
  if (self->_isSmartKeyboard)
    objc_msgSend(v5, "appendFormat:", CFSTR(" (smart keyboard)"));
  return v5;
}

- (void)encodeEventValue:(unsigned int *)a3 secondValue:(unsigned int *)a4
{
  unsigned int event;
  int v5;
  unsigned int v6;

  event = self->_event;
  v5 = self->_cls << 24;
  if (event < 0x400000)
  {
    v6 = 0;
    *a3 = v5 | event;
  }
  else
  {
    *a3 = v5 | HIWORD(event) | 0x800000;
    v6 = LOWORD(self->_event) | (self->_cls << 24) | 0x400000;
  }
  *a4 = v6;
}

- (unsigned)cls
{
  return self->_cls;
}

- (unsigned)event
{
  return self->_event;
}

- (BOOL)isStart
{
  return self->_isStart;
}

- (BOOL)isTerminal
{
  return self->_isTerminal;
}

- (BOOL)isMetadata
{
  return self->_isMetadata;
}

- (BOOL)isSmartKeyboard
{
  return self->_isSmartKeyboard;
}

- (BOOL)isHigh
{
  return self->_isHigh;
}

- (BOOL)isLow
{
  return self->_isLow;
}

@end
