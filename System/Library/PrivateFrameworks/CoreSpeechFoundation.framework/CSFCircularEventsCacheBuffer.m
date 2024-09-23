@implementation CSFCircularEventsCacheBuffer

- (CSFCircularEventsCacheBuffer)init
{
  CSFCircularEventsCacheBuffer *v2;
  CSFCircularEventsCacheBuffer *v3;
  uint64_t v4;
  NSMutableArray *eventsArray;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSFCircularEventsCacheBuffer;
  v2 = -[CSFCircularEventsCacheBuffer init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lastEventIndex = -1;
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 20);
    eventsArray = v3->_eventsArray;
    v3->_eventsArray = (NSMutableArray *)v4;

  }
  return v3;
}

- (void)addEventToCacheBuffer:(id)a3
{
  if (a3)
    -[NSMutableArray insertObject:atIndex:](self->_eventsArray, "insertObject:atIndex:", a3, (self->_lastEventIndex + 1) % 0x14uLL);
}

- (void)clearBuffer
{
  -[NSMutableArray removeAllObjects](self->_eventsArray, "removeAllObjects");
  self->_lastEventIndex = -1;
}

- (NSMutableArray)eventsArray
{
  return self->_eventsArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventsArray, 0);
}

@end
