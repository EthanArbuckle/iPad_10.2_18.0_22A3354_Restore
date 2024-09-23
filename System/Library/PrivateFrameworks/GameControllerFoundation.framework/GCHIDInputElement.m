@implementation GCHIDInputElement

- (GCHIDInputElement)initWithElement:(id)a3
{
  HIDElement *v4;
  GCHIDInputElement *v5;
  HIDElement *element;
  objc_super v8;

  v4 = (HIDElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)GCHIDInputElement;
  v5 = -[GCHIDInputElement init](&v8, sel_init);
  element = v5->_element;
  v5->_element = v4;

  v5->_observers.tqh_first = 0;
  v5->_observers.tqh_last = &v5->_observers.tqh_first;
  return v5;
}

- (GCHIDInputElement)init
{
  -[GCHIDInputElement doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
{
  Observer *tqh_first;
  Observer *p_firstObserver;
  Observer **tqe_prev;
  Observer *tqe_next;
  _scaleType *handler;
  __IOHIDValue *value;
  objc_super v9;

  tqh_first = self->_observers.tqh_first;
  if (tqh_first)
  {
    p_firstObserver = &self->_firstObserver;
    do
    {
      tqe_next = tqh_first->pointers.tqe_next;
      tqe_prev = tqh_first->pointers.tqe_prev;
      if (tqe_next)
      {
        tqe_next->pointers.tqe_prev = tqe_prev;
        tqe_prev = tqh_first->pointers.tqe_prev;
      }
      else
      {
        self->_observers.tqh_last = tqe_prev;
      }
      *tqe_prev = tqe_next;
      handler = tqh_first->_handler;
      tqh_first->_handler = 0;

      tqh_first->var0 = 0x8000000000000000;
      if (tqh_first != p_firstObserver)
        free(tqh_first);
      tqh_first = tqe_next;
    }
    while (tqe_next);
  }
  value = self->_value;
  if (value)
  {
    CFRelease(value);
    self->_value = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)GCHIDInputElement;
  -[GCHIDInputElement dealloc](&v9, sel_dealloc);
}

- (double)scaledValue:(int64_t)a3
{
  void *v5;
  __IOHIDDevice *Device;
  IOHIDValueRef pValue;

  pValue = -[GCHIDInputElement value](self, "value");
  if (pValue
    || (-[GCHIDInputElement element](self, "element"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        Device = IOHIDElementGetDevice((IOHIDElementRef)v5),
        IOHIDDeviceGetValue(Device, (IOHIDElementRef)v5, &pValue),
        pValue))
  {
    __asm { BR              X10 }
  }
  return 0.0;
}

- (void)addValueChangedHandler:(id)a3
{
  id v4;
  id v5;

  v5 = _Block_copy(a3);
  v4 = PushValueChangedHandler(self, v5, 0x8000000000000000, 0);

}

- (void)addScaled:(int64_t)a3 valueChangedHandler:(id)a4
{
  id v6;
  id v7;

  v7 = _Block_copy(a4);
  v6 = PushValueChangedHandler(self, v7, a3, 0);

}

- (id)registerValueChangedHandler:(id)a3
{
  void *v4;
  void *v5;

  v4 = _Block_copy(a3);
  PushValueChangedHandler(self, v4, 0x8000000000000000, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)registerScaled:(int64_t)a3 valueChangedHandler:(id)a4
{
  void *v6;
  void *v7;

  v6 = _Block_copy(a4);
  PushValueChangedHandler(self, v6, a3, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)valueChanged:(_QWORD *)a1
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  CFIndex IntegerValue;
  __IOHIDElement *Element;
  CFIndex LogicalMin;
  __IOHIDElement *v12;
  CFIndex LogicalMax;
  uint64_t v14;

  if (a1)
  {
    objc_setProperty(a1, sel_valueChanged_, 16, newValue, 0, 0);
    v4 = (_QWORD *)a1[3];
    if (v4)
    {
      while (2)
      {
        v5 = v4;
        v4 = (_QWORD *)v4[2];
        v6 = v5[1];
        switch(v6)
        {
          case -3:
            IOHIDValueGetBytePtr((IOHIDValueRef)newValue);
            IOHIDValueGetLength((IOHIDValueRef)newValue);
            __memcpy_chk();
            v8 = *v5;
            v7.n128_f64[0] = (double)0;
            goto LABEL_16;
          case -2:
            v7.n128_f64[0] = (double)IOHIDValueGetIntegerValue((IOHIDValueRef)newValue);
            goto LABEL_15;
          case -1:
            IntegerValue = IOHIDValueGetIntegerValue((IOHIDValueRef)newValue);
            Element = IOHIDValueGetElement((IOHIDValueRef)newValue);
            LogicalMin = IOHIDElementGetLogicalMin(Element);
            v12 = IOHIDValueGetElement((IOHIDValueRef)newValue);
            LogicalMax = IOHIDElementGetLogicalMax(v12);
            if (LogicalMax >= IntegerValue)
              v14 = IntegerValue;
            else
              v14 = LogicalMax;
            if (LogicalMin > v14)
              v14 = LogicalMin;
            v7.n128_f64[0] = (double)v14;
            goto LABEL_15;
          case 0:
          case 1:
          case 2:
            v7.n128_f64[0] = IOHIDValueGetScaledValue((IOHIDValueRef)newValue, v6);
LABEL_15:
            v8 = *v5;
LABEL_16:
            (*(void (**)(uint64_t, _QWORD *, id, __n128))(v8 + 16))(v8, a1, newValue, v7);
            if (!v4)
              return;
            continue;
          default:
            (*(void (**)(void))(*v5 + 16))();
            if (v4)
              continue;
            return;
        }
      }
    }
  }
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[GCHIDInputElement element](self, "element");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  CFTypeID v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[GCHIDInputElement element](self, "element");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "element");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = CFGetTypeID(v4);
      if (v8 != IOHIDElementGetTypeID())
      {
        v7 = 0;
        goto LABEL_7;
      }
    }
    -[GCHIDInputElement element](self, "element");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v4);
  }

LABEL_7:
  return v7;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  __IOHIDElement *v5;
  uint64_t Cookie;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCHIDInputElement element](self, "element");
  v5 = (__IOHIDElement *)objc_claimAutoreleasedReturnValue();
  Cookie = IOHIDElementGetCookie(v5);
  -[GCHIDInputElement element](self, "element");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@; cookie: %u %@>"),
    v4,
    Cookie,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HIDElement)element
{
  return (HIDElement *)objc_getProperty(self, a2, 8, 1);
}

- (__IOHIDValue)value
{
  return self->_value;
}

- (void).cxx_destruct
{

  objc_storeStrong((id *)&self->_element, 0);
}

@end
