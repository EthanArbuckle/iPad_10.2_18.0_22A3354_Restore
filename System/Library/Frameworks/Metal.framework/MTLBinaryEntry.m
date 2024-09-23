@implementation MTLBinaryEntry

- (OS_dispatch_data)reflectionBlock
{
  return self->_reflectionBlock;
}

- (OS_dispatch_data)data
{
  return self->_data;
}

- (MTLBinaryEntry)initWithData:(id)a3 binaryPosition:(unint64_t)a4
{
  MTLBinaryEntry *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTLBinaryEntry;
  v6 = -[MTLBinaryEntry init](&v9, sel_init);
  if (v6)
  {
    dispatch_retain((dispatch_object_t)a3);
    v6->_data = (OS_dispatch_data *)a3;
    v7 = (void *)MEMORY[0x1E0C9AA60];
    v6->_importedSymbols = (NSArray *)MEMORY[0x1E0C9AA60];
    v6->_importedLibraries = (NSArray *)v7;
    v6->_bitcode = 0;
    v6->_airScript = 0;
    v6->_binaryPosition = a4;
    v6->_linkedBitcodes = 0;
  }
  return v6;
}

- (MTLBinaryEntry)initWithData:(id)a3
{
  return -[MTLBinaryEntry initWithData:binaryPosition:](self, "initWithData:binaryPosition:", a3, 0xFFFFFFFFLL);
}

- (void)dealloc
{
  NSObject *bitcode;
  NSObject *airScript;
  NSObject *reflectionBlock;
  objc_super v6;

  dispatch_release((dispatch_object_t)self->_data);
  bitcode = self->_bitcode;
  if (bitcode)
    dispatch_release(bitcode);
  airScript = self->_airScript;
  if (airScript)
    dispatch_release(airScript);
  reflectionBlock = self->_reflectionBlock;
  if (reflectionBlock)
    dispatch_release(reflectionBlock);

  v6.receiver = self;
  v6.super_class = (Class)MTLBinaryEntry;
  -[MTLBinaryEntry dealloc](&v6, sel_dealloc);
}

- (MTLBinaryEntry)initWithData:(id)a3 importedSymbols:(id)a4 importedLibraries:(id)a5
{
  MTLBinaryEntry *v8;
  void *v9;
  id v10;
  id v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTLBinaryEntry;
  v8 = -[MTLBinaryEntry init](&v13, sel_init);
  if (v8)
  {
    dispatch_retain((dispatch_object_t)a3);
    v8->_data = (OS_dispatch_data *)a3;
    v9 = (void *)MEMORY[0x1E0C9AA60];
    if (a4)
      v10 = a4;
    else
      v10 = (id)MEMORY[0x1E0C9AA60];
    v8->_importedSymbols = (NSArray *)v10;
    if (a5)
      v11 = a5;
    else
      v11 = v9;
    v8->_importedLibraries = (NSArray *)v11;
    v8->_bitcode = 0;
    v8->_airScript = 0;
    v8->_linkedBitcodes = 0;
    v8->_binaryPosition = 0xFFFFFFFFLL;
  }
  return v8;
}

- (int)reflectionFlags
{
  return self->_reflectionFlags;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (MTLBinaryEntry)initWithData:(id)a3 reflectionBlock:(id)a4 binaryPosition:(unint64_t)a5
{
  MTLBinaryEntry *v8;
  MTLBinaryEntry *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTLBinaryEntry;
  v8 = -[MTLBinaryEntry init](&v11, sel_init);
  v9 = v8;
  if (v8)
    -[MTLBinaryEntry internalInitWithData:reflectionBlock:binaryPosition:](v8, "internalInitWithData:reflectionBlock:binaryPosition:", a3, a4, a5);
  return v9;
}

- (void)internalInitWithData:(id)a3 reflectionBlock:(id)a4 binaryPosition:(unint64_t)a5
{
  self->_reflectionFlags = 0;
  dispatch_retain((dispatch_object_t)a3);
  self->_data = (OS_dispatch_data *)a3;
  if (a4)
  {
    self->_reflectionBlock = (OS_dispatch_data *)a4;
    dispatch_retain((dispatch_object_t)a4);
    self->_reflectionFlags = MTLGetReflectionFlags(a4);
  }
  self->_binaryPosition = a5;
  *(_OWORD *)&self->_importedLibraries = 0u;
  *(_OWORD *)&self->_linkedBitcodes = 0u;
  self->_airScript = 0;
}

- (MTLBinaryEntry)initWithData:(id)a3 reflectionBlock:(id)a4
{
  MTLBinaryEntry *v6;
  MTLBinaryEntry *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTLBinaryEntry;
  v6 = -[MTLBinaryEntry init](&v9, sel_init);
  v7 = v6;
  if (v6)
    -[MTLBinaryEntry internalInitWithData:reflectionBlock:binaryPosition:](v6, "internalInitWithData:reflectionBlock:binaryPosition:", a3, a4, 0xFFFFFFFFLL);
  return v7;
}

- (void)addReflectionWithData:(id)a3 flag:(int)a4
{
  OS_dispatch_data *v5;
  NSObject *reflectionBlock;

  v5 = (OS_dispatch_data *)MTLNewReflectionBlock((dispatch_object_t)self->_reflectionBlock, (dispatch_object_t)a3, a4);
  reflectionBlock = self->_reflectionBlock;
  if (reflectionBlock)
    dispatch_release(reflectionBlock);
  self->_reflectionBlock = v5;
}

- (id)description
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLBinaryEntry;
  v3 = -[MTLBinaryEntry description](&v5, sel_description);
  return (id)objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" (%lu bytes)"), dispatch_data_get_size((dispatch_data_t)self->_data));
}

- (OS_dispatch_data)bitcode
{
  return self->_bitcode;
}

- (void)setBitcode:(id)a3
{
  NSObject *bitcode;

  bitcode = self->_bitcode;
  if (bitcode)
    dispatch_release(bitcode);
  self->_bitcode = (OS_dispatch_data *)a3;
  dispatch_retain((dispatch_object_t)a3);
}

- (OS_dispatch_data)airScript
{
  return self->_airScript;
}

- (void)setAirScript:(id)a3
{
  NSObject *airScript;

  airScript = self->_airScript;
  if (airScript)
    dispatch_release(airScript);
  self->_airScript = (OS_dispatch_data *)a3;
  dispatch_retain((dispatch_object_t)a3);
}

- (NSArray)linkedBitcodes
{
  return self->_linkedBitcodes;
}

- (void)setLinkedBitcodes:(id)a3
{
  NSArray *linkedBitcodes;
  id v5;
  id v6;

  linkedBitcodes = self->_linkedBitcodes;
  if (linkedBitcodes)
  {
    v6 = a3;

    a3 = v6;
  }
  self->_linkedBitcodes = (NSArray *)a3;
  v5 = a3;
}

- (unint64_t)binaryPosition
{
  return self->_binaryPosition;
}

- (NSArray)importedSymbols
{
  return self->_importedSymbols;
}

- (NSArray)importedLibraries
{
  return self->_importedLibraries;
}

- (unint64_t)index
{
  return self->_index;
}

@end
