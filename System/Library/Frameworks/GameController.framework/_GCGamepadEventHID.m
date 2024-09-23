@implementation _GCGamepadEventHID

- (_GCGamepadEventHID)initWithHIDEvent:(__IOHIDEvent *)a3
{
  _GCGamepadEventHID *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __IOHIDEvent *v10;
  uint64_t IntegerValue;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)_GCGamepadEventHID;
  v4 = -[_GCGamepadEventHID init](&v18, sel_init);
  if (v4)
  {
    v4->_event = (__IOHIDEvent *)CFRetain(a3);
    if (IOHIDEventGetType() == 35)
    {
      IOHIDEventGetChildren();
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v15;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v15 != v8)
              objc_enumerationMutation(v5);
            v10 = *(__IOHIDEvent **)(*((_QWORD *)&v14 + 1) + 8 * i);
            IntegerValue = IOHIDEventGetIntegerValue();
            v12 = IOHIDEventGetIntegerValue();
            if (IntegerValue == 65280 && v12 == 67)
            {
              v4->_extendedEvent = v10;
              goto LABEL_14;
            }
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
          if (v7)
            continue;
          break;
        }
      }
LABEL_14:

    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_extendedEvent = 0;
  CFRelease(self->_event);
  self->_event = 0;
  v3.receiver = self;
  v3.super_class = (Class)_GCGamepadEventHID;
  -[_GCGamepadEventHID dealloc](&v3, sel_dealloc);
}

- (unint64_t)timestamp
{
  return IOHIDEventGetTimeStamp();
}

- (BOOL)hasValidValueForElement:(int64_t)a3
{
  _BOOL8 v3;
  void *v6;

  if (self->_extendedEvent)
  {
    LOBYTE(v3) = 1;
  }
  else if ((unint64_t)a3 >= 0x2F)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCGamepadEventImpl.m"), 341, CFSTR("Unknown element"));

    LOBYTE(v3) = 0;
  }
  else
  {
    return (0x7E00003FFFFFuLL >> a3) & 1;
  }
  return v3;
}

- (float)floatValueForElement:(int64_t)a3
{
  uint64_t DataValue;
  float v7;
  double v8;
  float v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v16;

  if (self->_extendedEvent)
  {
    DataValue = IOHIDEventGetDataValue();
    if (a3 > 46)
    {
      unk_254DEC4F8(&off_254DEC660, "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCGamepadEventImpl.m"), 375, CFSTR("Unknown element"));

      return 0.0;
    }
    else
    {
      return *(float *)(DataValue + 4 * a3 + 8);
    }
  }
  else
  {
    v7 = 0.0;
    switch(a3)
    {
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 18:
      case 19:
      case 20:
      case 21:
      case 41:
      case 42:
      case 43:
      case 44:
      case 45:
      case 46:
        IOHIDEventGetFloatValue();
        return v14;
      case 10:
      case 11:
        IOHIDEventGetFloatValue();
        v9 = v8;
        if (a3 != 10)
          goto LABEL_9;
        goto LABEL_6;
      case 12:
      case 13:
        IOHIDEventGetFloatValue();
        v9 = v11;
        if (a3 != 13)
          goto LABEL_9;
        goto LABEL_6;
      case 14:
      case 15:
        IOHIDEventGetFloatValue();
        v9 = v12;
        if (a3 != 14)
          goto LABEL_9;
        goto LABEL_6;
      case 16:
      case 17:
        IOHIDEventGetFloatValue();
        v9 = v13;
        if (a3 == 17)
        {
LABEL_6:
          v7 = fmaxf(v9, 0.0);
        }
        else
        {
LABEL_9:
          if (v9 >= 0.0)
            v7 = 0.0;
          else
            v7 = -v9;
        }
        break;
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
        return v7;
      default:
        unk_254DEC4F8(&off_254DEC660, "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCGamepadEventImpl.m"), 490, CFSTR("Unknown element"));

        break;
    }
  }
  return v7;
}

- (__IOHIDEvent)event
{
  return self->_event;
}

@end
