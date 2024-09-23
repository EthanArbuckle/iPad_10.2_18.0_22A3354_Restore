@implementation _GCDevicePhysicalInputFacade

- (_GCDevicePhysicalInputFacade)initWithParameters:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_GCDevicePhysicalInputFacade;
  return -[_GCDevicePhysicalInputView initWithParameters:](&v4, sel_initWithParameters_, a3);
}

- (_GCDevicePhysicalInputFacade)initWithTemplate:(id)a3 context:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_GCDevicePhysicalInputFacade;
  return -[_GCDevicePhysicalInputView initWithTemplate:context:](&v5, sel_initWithTemplate_context_, a3, a4);
}

- (id)alternatePhysicalInputWithAttribute:(id)a3
{
  id result;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  if (!a3)
    objc_msgSend((id)unk_254DEC4F8(&off_254DEC660, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCDevicePhysicalInputFacade.m"), 32, CFSTR("Invalid parameter not satisfying: %s"), "attribute");
  result = (id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
  if (result)
  {
    v6 = result;
    v7 = objc_msgSend((id)-[_GCDevicePhysicalInputBase attributes]((uint64_t)result), "setByAddingObject:", a3);
    objc_msgSend(v6, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "physicalInputWithAttributes:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)-[_GCDevicePhysicalInputBase facade]((uint64_t)v9);

    return v10;
  }
  return result;
}

- (GCDevice)device
{
  return (GCDevice *)objc_msgSend((id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self), "device");
}

- (double)lastEventTimestamp
{
  double result;

  objc_msgSend((id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self), "lastEventTimestamp");
  return result;
}

- (double)lastEventLatency
{
  double result;

  objc_msgSend((id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self), "lastEventLatency");
  return result;
}

- (id)_elementsForProtocol:(id *)result
{
  id *v3;

  if (result)
  {
    v3 = (id *)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)result);
    if (v3)
      return -[_GCDevicePhysicalInputBase elementsForProtocol:](v3, a2);
    else
      return (id *)+[GCPhysicalInputElementCollection collection]();
  }
  return result;
}

- (GCPhysicalInputElementCollection)elements
{
  return (GCPhysicalInputElementCollection *)-[_GCDevicePhysicalInputFacade _elementsForProtocol:]((id *)&self->super.super.isa, 0);
}

- (GCPhysicalInputElementCollection)buttons
{
  return (GCPhysicalInputElementCollection *)-[_GCDevicePhysicalInputFacade _elementsForProtocol:]((id *)&self->super.super.isa, &unk_254DC7778);
}

- (GCPhysicalInputElementCollection)axes
{
  return (GCPhysicalInputElementCollection *)-[_GCDevicePhysicalInputFacade _elementsForProtocol:]((id *)&self->super.super.isa, &unk_254DCC488);
}

- (GCPhysicalInputElementCollection)switches
{
  return (GCPhysicalInputElementCollection *)-[_GCDevicePhysicalInputFacade _elementsForProtocol:]((id *)&self->super.super.isa, &unk_254DC7038);
}

- (GCPhysicalInputElementCollection)dpads
{
  return (GCPhysicalInputElementCollection *)-[_GCDevicePhysicalInputFacade _elementsForProtocol:]((id *)&self->super.super.isa, &unk_254DC76F8);
}

- (id)objectForKeyedSubscript:(id)a3
{
  id *v4;

  v4 = (id *)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
  return (id)objc_msgSend(-[_GCDevicePhysicalInputBase elementsForProtocol:](v4, 0), "elementForAlias:", a3);
}

+ (BOOL)automaticallyNotifiesObserversOfQueue
{
  return 0;
}

- (OS_dispatch_queue)queue
{
  void *v3;

  if ((objc_msgSend((id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self), "isSnapshot") & 1) != 0)
    return 0;
  v3 = (void *)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
  return (OS_dispatch_queue *)-[_GCDevicePhysicalInput queue](v3);
}

- (void)setQueue:(id)a3
{
  void *v5;
  NSObject *GCRuntimeIssuesLogger;

  if (objc_msgSend((id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self), "isSnapshot"))
  {
    GCRuntimeIssuesLogger = getGCRuntimeIssuesLogger();
    if (os_log_type_enabled(GCRuntimeIssuesLogger, OS_LOG_TYPE_FAULT))
      -[_GCDevicePhysicalInputFacade setQueue:].cold.1();
  }
  else
  {
    v5 = (void *)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
    -[_GCDevicePhysicalInput setQueue:](v5, a3);
  }
}

- (id)elementValueDidChangeHandler
{
  void *v3;
  const char *v4;

  if ((objc_msgSend((id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self), "isSnapshot") & 1) != 0)
    return 0;
  v3 = (void *)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
  return -[_GCDevicePhysicalInput elementValueDidChangeHandler](v3, v4);
}

- (void)setElementValueDidChangeHandler:(id)a3
{
  void *v5;
  NSObject *GCRuntimeIssuesLogger;

  if (objc_msgSend((id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self), "isSnapshot"))
  {
    GCRuntimeIssuesLogger = getGCRuntimeIssuesLogger();
    if (os_log_type_enabled(GCRuntimeIssuesLogger, OS_LOG_TYPE_FAULT))
      -[_GCDevicePhysicalInputFacade setElementValueDidChangeHandler:].cold.1();
  }
  else
  {
    v5 = (void *)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
    -[_GCDevicePhysicalInput setElementValueDidChangeHandler:](v5, (char *)a3);
  }
}

- (id)capture
{
  _QWORD *v4;
  uint64_t v5;

  if ((objc_msgSend((id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self), "isSnapshot") & 1) != 0)
    return self;
  v4 = (_QWORD *)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
  v5 = -[_GCDevicePhysicalInput currentTransaction](v4);
  return (id)-[_GCDevicePhysicalInputBase facade](v5);
}

- (id)inputStateAvailableHandler
{
  void *v3;
  const char *v4;

  if ((objc_msgSend((id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self), "isSnapshot") & 1) != 0)
    return 0;
  v3 = (void *)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
  return -[_GCDevicePhysicalInput inputStateAvailableHandler](v3, v4);
}

- (void)setInputStateAvailableHandler:(id)a3
{
  void *v5;
  NSObject *GCRuntimeIssuesLogger;

  if (objc_msgSend((id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self), "isSnapshot"))
  {
    GCRuntimeIssuesLogger = getGCRuntimeIssuesLogger();
    if (os_log_type_enabled(GCRuntimeIssuesLogger, OS_LOG_TYPE_FAULT))
      -[_GCDevicePhysicalInputFacade setInputStateAvailableHandler:].cold.1();
  }
  else
  {
    v5 = (void *)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
    -[_GCDevicePhysicalInput setInputStateAvailableHandler:](v5, (char *)a3);
  }
}

- (int64_t)inputStateQueueDepth
{
  _QWORD *v3;

  if ((objc_msgSend((id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self), "isSnapshot") & 1) != 0)
    return 0;
  v3 = (_QWORD *)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
  return -[_GCDevicePhysicalInput transactionQueueDepth](v3);
}

- (void)setInputStateQueueDepth:(int64_t)a3
{
  _QWORD *v6;
  NSObject *GCRuntimeIssuesLogger;

  if (objc_msgSend((id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self), "isSnapshot"))
  {
    GCRuntimeIssuesLogger = getGCRuntimeIssuesLogger();
    if (os_log_type_enabled(GCRuntimeIssuesLogger, OS_LOG_TYPE_FAULT))
      -[_GCDevicePhysicalInputFacade setInputStateQueueDepth:].cold.1();
  }
  else
  {
    if (a3 <= 0)
      objc_msgSend((id)unk_254DEC4F8(&off_254DEC660, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_GCDevicePhysicalInputFacade.m"), 156, CFSTR("*** Input state queue depth must be >= 1.  %zd is invalid."), a3);
    v6 = (_QWORD *)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
    -[_GCDevicePhysicalInput setTransactionQueueDepth:](v6, a3);
  }
}

- (id)nextInputState
{
  void *v3;
  id v4;

  if ((objc_msgSend((id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self), "isSnapshot") & 1) != 0)
    return 0;
  v3 = (void *)objc_msgSend((id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self), "popTransaction");
  v4 = (id)-[_GCDevicePhysicalInputBase facade]((uint64_t)v3);

  return v4;
}

- (int64_t)changeForElement:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;

  if (!-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self))
    return -1;
  if ((objc_msgSend((id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self), "isSnapshot") & 1) == 0)
    -[_GCDevicePhysicalInputFacade doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  v6 = -[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
  v7 = objc_msgSend((id)-[_GCDevicePhysicalInputBase elements](v6), "indexOfObject:", a3);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    return -1;
  v8 = v7;
  v9 = -[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
  if (!-[_GCDevicePhysicalInputTransaction updateContextIsValidForElementAtIndex:](v9))
    return -1;
  v10 = (void *)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
  return -[_GCDevicePhysicalInputTransaction updateContextForElementAtIndex:size:onlyIfChanged:](v10, v8, 0, 1) != 0;
}

- (id)changedElements
{
  id result;
  _GCDevicePhysicalInputChangedElementsEnumerator *v5;

  result = (id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
  if (result)
  {
    if ((objc_msgSend((id)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self), "isSnapshot") & 1) == 0)
      -[_GCDevicePhysicalInputFacade doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
    v5 = (_GCDevicePhysicalInputChangedElementsEnumerator *)-[_GCDevicePhysicalInputView physicalInput]((uint64_t)self);
    return -[_GCDevicePhysicalInputTransaction changedElements](v5);
  }
  return result;
}

- (void)setQueue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_10(&dword_215181000, v0, v1, "Setting a 'queue' on a snapshot is ignored.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_9();
}

- (void)setElementValueDidChangeHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_10(&dword_215181000, v0, v1, "Setting a 'elementValueDidChangeHandler' on a snapshot is ignored.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_9();
}

- (void)setInputStateAvailableHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_10(&dword_215181000, v0, v1, "Setting a 'inputStateAvailableHandler' on a snapshot is ignored.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_9();
}

- (void)setInputStateQueueDepth:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_0_10(&dword_215181000, v0, v1, "Setting 'inputStateQueueDepth' on a snapshot is ignored.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_9();
}

@end
