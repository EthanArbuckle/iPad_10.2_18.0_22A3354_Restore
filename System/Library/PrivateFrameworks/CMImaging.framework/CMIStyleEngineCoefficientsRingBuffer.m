@implementation CMIStyleEngineCoefficientsRingBuffer

- (CMIStyleEngineCoefficientsRingBuffer)initWithCapacity:(unint64_t)a3
{
  CMIStyleEngineCoefficientsRingBuffer *v3;
  uint64_t v5;
  NSMutableArray *coefficientsDataArray;
  objc_super v8;

  v3 = self;
  if (a3 >= 0x400)
    goto LABEL_8;
  v8.receiver = self;
  v8.super_class = (Class)CMIStyleEngineCoefficientsRingBuffer;
  v3 = -[CMIStyleEngineCoefficientsRingBuffer init](&v8, sel_init);
  if (!v3)
  {
    FigDebugAssert3();
    return v3;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  coefficientsDataArray = v3->_coefficientsDataArray;
  v3->_coefficientsDataArray = (NSMutableArray *)v5;

  if (!v3->_coefficientsDataArray)
  {
LABEL_8:
    FigDebugAssert3();

    return 0;
  }
  v3->_ringBufferSize = a3;
  v3->_inputIndex = 0;
  return v3;
}

- (void)reset
{
  self->_inputIndex = 0;
  -[CMIStyleEngineCoefficientsRingBuffer releaseResources](self, "releaseResources");
}

- (id)getFramesDataWindowFrom:(double)a3 to:(double)a4 shouldRemoveOldData:(BOOL)a5
{
  _BOOL4 v5;
  CoefficientsDataWindow *v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  unsigned int inputIndex;
  double v20;

  v5 = a5;
  v9 = objc_alloc_init(CoefficientsDataWindow);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[NSMutableArray count](self->_coefficientsDataArray, "count"))
  {
    LODWORD(v11) = 0;
    do
    {
      v12 = (self->_inputIndex + v11);
      v13 = v12 % -[NSMutableArray count](self->_coefficientsDataArray, "count");
      -[NSMutableArray objectAtIndex:](self->_coefficientsDataArray, "objectAtIndex:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, "pts");
        if (v16 >= a3 && (objc_msgSend(v15, "pts"), v17 <= a4))
        {
          objc_msgSend(v10, "addObject:", v15);
        }
        else if (v5 && (objc_msgSend(v15, "pts"), v18 < a3))
        {
          -[NSMutableArray removeObjectAtIndex:](self->_coefficientsDataArray, "removeObjectAtIndex:", v13);
          inputIndex = self->_inputIndex;
          if (inputIndex > v13)
            inputIndex = (int)(inputIndex + self->_ringBufferSize - 1) % self->_ringBufferSize;
          self->_inputIndex = inputIndex;
          LODWORD(v11) = v11 - 1;
        }
        else
        {
          objc_msgSend(v15, "pts");
          if (v20 > a4)
          {

            break;
          }
        }
      }

      v11 = (v11 + 1);
    }
    while (-[NSMutableArray count](self->_coefficientsDataArray, "count") > v11);
  }
  -[CoefficientsDataWindow setWindow:](v9, "setWindow:", v10);

  return v9;
}

- (int)add:(id)a3
{
  -[NSMutableArray setObject:atIndexedSubscript:](self->_coefficientsDataArray, "setObject:atIndexedSubscript:", a3, self->_inputIndex);
  self->_inputIndex = (self->_inputIndex + 1) % self->_ringBufferSize;
  return 0;
}

- (int)getNumberOfElements
{
  return -[NSMutableArray count](self->_coefficientsDataArray, "count");
}

- (id)peek
{
  unint64_t inputIndex;
  void *v4;

  inputIndex = self->_inputIndex;
  if (-[NSMutableArray count](self->_coefficientsDataArray, "count") <= inputIndex)
  {
    v4 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_coefficientsDataArray, "objectAtIndexedSubscript:", self->_inputIndex);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)releaseResources
{
  unint64_t v3;
  void *v4;

  if (-[NSMutableArray count](self->_coefficientsDataArray, "count"))
  {
    v3 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_coefficientsDataArray, "objectAtIndexedSubscript:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "releaseResources");

      ++v3;
    }
    while (-[NSMutableArray count](self->_coefficientsDataArray, "count") > v3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coefficientsDataArray, 0);
}

@end
