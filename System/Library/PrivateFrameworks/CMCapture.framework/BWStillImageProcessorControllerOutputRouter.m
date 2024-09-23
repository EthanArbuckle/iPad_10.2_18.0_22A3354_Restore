@implementation BWStillImageProcessorControllerOutputRouter

- (BWStillImageProcessorControllerOutputRouter)initWithOutputSampleBufferRouter:(id)a3
{
  BWStillImageProcessorControllerOutputRouter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWStillImageProcessorControllerOutputRouter;
  v4 = -[BWStillImageProcessorControllerOutputRouter init](&v6, sel_init);
  if (v4)
    v4->_outputSampleBufferRouter = (id)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageProcessorControllerOutputRouter;
  -[BWStillImageProcessorControllerOutputRouter dealloc](&v3, sel_dealloc);
}

- (void)addBypassedProcessorType:(unint64_t)a3
{
  NSMutableArray *bypassedProcessorTypes;

  bypassedProcessorTypes = self->_bypassedProcessorTypes;
  if (!bypassedProcessorTypes)
  {
    bypassedProcessorTypes = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_bypassedProcessorTypes = bypassedProcessorTypes;
  }
  -[NSMutableArray addObject:](bypassedProcessorTypes, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3));
}

- (NSArray)bypassedProcessorsTypes
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_bypassedProcessorTypes, "copy");
}

- (id)outputSampleBufferRouter
{
  return self->_outputSampleBufferRouter;
}

@end
