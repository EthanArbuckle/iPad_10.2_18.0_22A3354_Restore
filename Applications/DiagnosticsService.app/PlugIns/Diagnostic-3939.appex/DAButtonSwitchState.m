@implementation DAButtonSwitchState

- (DAButtonSwitchState)initWithIdentifier:(id)a3
{
  NSString *v4;
  DAButtonSwitchState *v5;
  DAButtonSwitchState *v6;
  uint64_t v7;
  objc_super v9;

  v4 = (NSString *)a3;
  v9.receiver = self;
  v9.super_class = (Class)DAButtonSwitchState;
  v5 = -[DAButtonSwitchState init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    v5->_identifier = v4;
    if (-[NSString isEqualToString:](v4, "isEqualToString:", CFSTR("Home")))
    {
      v7 = 1;
LABEL_20:
      v6->_expectedEvent = v7;
      goto LABEL_21;
    }
    if (-[NSString isEqualToString:](v6->_identifier, "isEqualToString:", CFSTR("RingerButton")))
    {
      v7 = 0x10000000;
      goto LABEL_20;
    }
    if (-[NSString isEqualToString:](v6->_identifier, "isEqualToString:", CFSTR("Ringer")))
    {
      v7 = 4;
      goto LABEL_20;
    }
    if (-[NSString isEqualToString:](v6->_identifier, "isEqualToString:", CFSTR("Sleep")))
    {
      v7 = 16;
      goto LABEL_20;
    }
    if (-[NSString isEqualToString:](v6->_identifier, "isEqualToString:", CFSTR("VolumeIncrement")))
    {
      v7 = 64;
      goto LABEL_20;
    }
    if (-[NSString isEqualToString:](v6->_identifier, "isEqualToString:", CFSTR("VolumeDecrement")))
    {
      v7 = 256;
      goto LABEL_20;
    }
    if (-[NSString isEqualToString:](v6->_identifier, "isEqualToString:", CFSTR("DigitalCrown")))
    {
      v7 = 1024;
      goto LABEL_20;
    }
    if (-[NSString isEqualToString:](v6->_identifier, "isEqualToString:", CFSTR("Side")))
    {
      v7 = 4096;
      goto LABEL_20;
    }
    if (-[NSString isEqualToString:](v6->_identifier, "isEqualToString:", CFSTR("App")))
    {
      v7 = 0x4000000;
      goto LABEL_20;
    }
  }
LABEL_21:

  return v6;
}

- (DAButtonSwitchState)initWithIdentifier:(id)a3 startingState:(int)a4
{
  DAButtonSwitchState *result;
  unint64_t v6;

  result = -[DAButtonSwitchState initWithIdentifier:](self, "initWithIdentifier:", a3);
  if (result)
  {
    if (a4 == 1)
    {
      v6 = 8;
    }
    else
    {
      if (a4)
        return result;
      v6 = 4;
    }
    result->_expectedEvent = v6;
  }
  return result;
}

- (BOOL)isEventAcceptable:(unint64_t)a3 type:(id *)a4 eventType:(id *)a5
{
  unint64_t v7;

  -[DAButtonSwitchState getTypeForEvent:type:eventType:](self, "getTypeForEvent:type:eventType:", a3, a4, a5);
  v7 = -[DAButtonSwitchState expectedEvent](self, "expectedEvent");
  if (v7 == a3)
    -[DAButtonSwitchState getNextEvent](self, "getNextEvent");
  return v7 == a3;
}

- (void)getNextEvent
{
  if ((id)-[DAButtonSwitchState expectedEvent](self, "expectedEvent") == (id)1)
  {
    -[DAButtonSwitchState setExpectedEvent:](self, "setExpectedEvent:", 2);
  }
  else if ((id)-[DAButtonSwitchState expectedEvent](self, "expectedEvent") == (id)2)
  {
    -[DAButtonSwitchState setExpectedEvent:](self, "setExpectedEvent:", 1);
  }
  else if ((id)-[DAButtonSwitchState expectedEvent](self, "expectedEvent") == (id)0x10000000)
  {
    -[DAButtonSwitchState setExpectedEvent:](self, "setExpectedEvent:", 0x20000000);
  }
  else if ((id)-[DAButtonSwitchState expectedEvent](self, "expectedEvent") == (id)0x20000000)
  {
    -[DAButtonSwitchState setExpectedEvent:](self, "setExpectedEvent:", 0x10000000);
  }
  else if ((id)-[DAButtonSwitchState expectedEvent](self, "expectedEvent") == (id)4)
  {
    -[DAButtonSwitchState setExpectedEvent:](self, "setExpectedEvent:", 8);
  }
  else if ((id)-[DAButtonSwitchState expectedEvent](self, "expectedEvent") == (id)8)
  {
    -[DAButtonSwitchState setExpectedEvent:](self, "setExpectedEvent:", 4);
  }
  else if ((id)-[DAButtonSwitchState expectedEvent](self, "expectedEvent") == (id)16)
  {
    -[DAButtonSwitchState setExpectedEvent:](self, "setExpectedEvent:", 32);
  }
  else if ((id)-[DAButtonSwitchState expectedEvent](self, "expectedEvent") == (id)32)
  {
    -[DAButtonSwitchState setExpectedEvent:](self, "setExpectedEvent:", 16);
  }
  else if ((id)-[DAButtonSwitchState expectedEvent](self, "expectedEvent") == (id)64)
  {
    -[DAButtonSwitchState setExpectedEvent:](self, "setExpectedEvent:", 128);
  }
  else if ((id)-[DAButtonSwitchState expectedEvent](self, "expectedEvent") == (id)128)
  {
    -[DAButtonSwitchState setExpectedEvent:](self, "setExpectedEvent:", 64);
  }
  else if ((id)-[DAButtonSwitchState expectedEvent](self, "expectedEvent") == (id)512)
  {
    -[DAButtonSwitchState setExpectedEvent:](self, "setExpectedEvent:", 256);
  }
  else if ((id)-[DAButtonSwitchState expectedEvent](self, "expectedEvent") == (id)256)
  {
    -[DAButtonSwitchState setExpectedEvent:](self, "setExpectedEvent:", 512);
  }
  else if ((id)-[DAButtonSwitchState expectedEvent](self, "expectedEvent") == (id)2048)
  {
    -[DAButtonSwitchState setExpectedEvent:](self, "setExpectedEvent:", 1024);
  }
  else if ((id)-[DAButtonSwitchState expectedEvent](self, "expectedEvent") == (id)1024)
  {
    -[DAButtonSwitchState setExpectedEvent:](self, "setExpectedEvent:", 2048);
  }
  else if ((id)-[DAButtonSwitchState expectedEvent](self, "expectedEvent") == (id)4096)
  {
    -[DAButtonSwitchState setExpectedEvent:](self, "setExpectedEvent:", 0x2000);
  }
  else if ((id)-[DAButtonSwitchState expectedEvent](self, "expectedEvent") == (id)0x2000)
  {
    -[DAButtonSwitchState setExpectedEvent:](self, "setExpectedEvent:", 4096);
  }
  else if ((id)-[DAButtonSwitchState expectedEvent](self, "expectedEvent") == (id)0x8000000)
  {
    -[DAButtonSwitchState setExpectedEvent:](self, "setExpectedEvent:", 0x4000000);
  }
  else if ((id)-[DAButtonSwitchState expectedEvent](self, "expectedEvent") == (id)0x4000000)
  {
    -[DAButtonSwitchState setExpectedEvent:](self, "setExpectedEvent:", 0x8000000);
  }
}

- (void)getTypeForEvent:(unint64_t)a3 type:(id *)a4 eventType:(id *)a5
{
  __CFString *v8;

  *a4 = objc_retainAutorelease(CFSTR("Button"));
  v8 = CFSTR("KeyDown");
  if ((uint64_t)a3 > 511)
  {
    if ((uint64_t)a3 < 0x2000)
    {
      if ((uint64_t)a3 > 2047)
      {
        if (a3 == 2048)
          goto LABEL_28;
        if (a3 != 4096)
          return;
      }
      else
      {
        if (a3 == 512)
          goto LABEL_28;
        if (a3 != 1024)
          return;
      }
    }
    else
    {
      if ((uint64_t)a3 > 0x7FFFFFF)
      {
        if (a3 != 0x8000000)
        {
          if (a3 == 0x10000000)
            goto LABEL_29;
          if (a3 != 0x20000000)
            return;
        }
        goto LABEL_28;
      }
      if (a3 == 0x2000)
        goto LABEL_28;
      if (a3 != 0x4000000)
        return;
    }
LABEL_29:
    *a5 = v8;
    return;
  }
  if ((uint64_t)a3 > 31)
  {
    if ((uint64_t)a3 <= 127)
    {
      if (a3 != 32)
      {
        if (a3 != 64)
          return;
        goto LABEL_29;
      }
LABEL_28:
      v8 = CFSTR("KeyUp");
      goto LABEL_29;
    }
    if (a3 == 128)
      goto LABEL_28;
    if (a3 != 256)
      return;
    goto LABEL_29;
  }
  switch(a3)
  {
    case 1uLL:
      goto LABEL_29;
    case 2uLL:
      goto LABEL_28;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      return;
    case 4uLL:
      *a4 = objc_retainAutorelease(CFSTR("Switch"));
      v8 = CFSTR("StateTone");
      goto LABEL_29;
    case 8uLL:
      *a4 = objc_retainAutorelease(CFSTR("Switch"));
      v8 = CFSTR("StateSilent");
      goto LABEL_29;
    default:
      if (a3 == 16)
        goto LABEL_29;
      break;
  }
}

- (unint64_t)expectedEvent
{
  return self->_expectedEvent;
}

- (void)setExpectedEvent:(unint64_t)a3
{
  self->_expectedEvent = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  self->_identifier = (NSString *)a3;
}

@end
