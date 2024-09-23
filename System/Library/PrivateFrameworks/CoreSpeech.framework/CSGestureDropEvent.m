@implementation CSGestureDropEvent

- (CSGestureDropEvent)initWithDroppingPrediction:(double)a3 droppedPrediction:(double)a4 timestamp:(double)a5
{
  CSGestureDropEvent *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSGestureDropEvent;
  result = -[CSGestureDropEvent init](&v9, sel_init);
  if (result)
  {
    result->_droppingPrediction = a3;
    result->_droppedPrediction = a4;
    result->_timestamp = a5;
  }
  return result;
}

- (CSGestureDropEvent)initWithXPCObject:(id)a3
{
  id v4;
  CSGestureDropEvent *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CSGestureDropEvent;
  v5 = -[CSGestureDropEvent init](&v7, sel_init);
  if (v5)
  {
    v5->_droppingPrediction = xpc_dictionary_get_double(v4, "droppingPrediction");
    v5->_droppedPrediction = xpc_dictionary_get_double(v4, "droppedPrediction");
    v5->_timestamp = xpc_dictionary_get_double(v4, "timestamp");
  }

  return v5;
}

- (OS_xpc_object)xpcObject
{
  xpc_object_t v3;
  uint64_t i;
  xpc_object_t values[3];
  char *keys[4];

  keys[3] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = "droppingPrediction";
  keys[1] = "droppedPrediction";
  keys[2] = "timestamp";
  values[0] = xpc_double_create(self->_droppingPrediction);
  values[1] = xpc_double_create(self->_droppedPrediction);
  values[2] = xpc_double_create(self->_timestamp);
  v3 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
  for (i = 2; i != -1; --i)

  return (OS_xpc_object *)v3;
}

- (id)toString
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Dpg:%.3f Dpd:%.3f T:%.3f"), *(_QWORD *)&self->_droppingPrediction, *(_QWORD *)&self->_droppedPrediction, *(_QWORD *)&self->_timestamp);
}

- (double)droppingPrediction
{
  return self->_droppingPrediction;
}

- (double)droppedPrediction
{
  return self->_droppedPrediction;
}

- (double)timestamp
{
  return self->_timestamp;
}

@end
