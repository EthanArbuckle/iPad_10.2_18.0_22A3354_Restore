@implementation MTRReadClientContainer

- (void)cleanup
{
  void (***readClientPtr)(void *, SEL);
  AttributePathParams *pathParams;
  EventPathParams *eventPathParams;
  void *callback;
  void *v7;

  readClientPtr = (void (***)(void *, SEL))self->_readClientPtr;
  if (readClientPtr)
  {
    (**readClientPtr)(self->_readClientPtr, a2);
    j__free(readClientPtr);
    self->_readClientPtr = 0;
  }
  pathParams = self->_pathParams;
  if (pathParams)
  {
    j__free(pathParams);
    self->_pathParams = 0;
  }
  eventPathParams = self->_eventPathParams;
  if (eventPathParams)
  {
    j__free(eventPathParams);
    self->_eventPathParams = 0;
  }
  callback = self->_callback;
  if (callback)
  {
    v7 = (void *)sub_233CF1F38((uint64_t)callback);
    j__free(v7);
    self->_callback = 0;
  }
}

- (void)onDone
{
  uint64_t v2;
  const char *v4;
  unint64_t deviceID;
  const char *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t ClientPtr;
  id v19;

  objc_msgSend_cleanup(self, a2, v2);
  deviceID = self->_deviceID;
  if (qword_2561591E0 != -1)
    dispatch_once(&qword_2561591E0, &unk_2504F0720);
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v4, deviceID);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock((void *)qword_2561591D0, v6, v7);
  objc_msgSend_objectForKeyedSubscript_((void *)qword_2561591D8, v8, (uint64_t)v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  while (v12 < objc_msgSend_count(v11, v9, v10))
  {
    objc_msgSend_objectAtIndexedSubscript_(v11, v13, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ClientPtr = objc_msgSend_readClientPtr(v15, v16, v17);

    if (ClientPtr)
      ++v12;
    else
      objc_msgSend_removeObjectAtIndex_(v11, v9, v12);
  }
  objc_msgSend_unlock((void *)qword_2561591D0, v13, v14);

}

- (void)readClientPtr
{
  return self->_readClientPtr;
}

- (void)setReadClientPtr:(void *)a3
{
  self->_readClientPtr = a3;
}

- (void)callback
{
  return self->_callback;
}

- (void)setCallback:(void *)a3
{
  self->_callback = a3;
}

- (AttributePathParams)pathParams
{
  return self->_pathParams;
}

- (void)setPathParams:(AttributePathParams *)a3
{
  self->_pathParams = a3;
}

- (EventPathParams)eventPathParams
{
  return self->_eventPathParams;
}

- (void)setEventPathParams:(EventPathParams *)a3
{
  self->_eventPathParams = a3;
}

- (unint64_t)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(unint64_t)a3
{
  self->_deviceID = a3;
}

@end
