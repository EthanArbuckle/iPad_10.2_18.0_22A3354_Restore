@implementation CMIRangeAllocator

- (int)allocateWithSize:(unint64_t)a3 alignment:(unsigned int)a4 outputOffset:(unint64_t *)a5 allocationHint:(int)a6
{
  int strategyType;
  int BestFit;

  strategyType = self->_strategyType;
  if (strategyType == 1)
  {
    BestFit = CMIRangeAllocatorListAllocateBestFit((uint64_t)&self->_rangeAllocator, a3, a5, a4, a6);
  }
  else if (strategyType)
  {
    BestFit = 0;
  }
  else
  {
    BestFit = CMIRangeAllocatorListAllocateFirstFit((uint64_t)&self->_rangeAllocator, a3, (uint64_t *)a5, a4, a6);
  }
  return BestFit - 1;
}

- (void)freeRangeWithOffset:(unint64_t)a3 size:(unint64_t)a4
{
  CMIRangeAllocatorList *p_rangeAllocator;
  unint64_t v6;
  unint64_t v7;
  uint64_t numElements;
  unint64_t *elements;
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t *v16;
  unint64_t *v17;
  unint64_t *v18;
  unint64_t v19;

  if (a4 + a3 > self->_memSize)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return;
  }
  p_rangeAllocator = &self->_rangeAllocator;
  v6 = ((self->_rangeAllocator.defaultAlignmentMask + a4) & ~self->_rangeAllocator.defaultAlignmentMask) + a3;
  v7 = v6 - 1;
  numElements = self->_rangeAllocator.numElements;
  if (!(_DWORD)numElements)
    goto LABEL_13;
  elements = (unint64_t *)p_rangeAllocator->elements;
  v10 = *(_QWORD *)p_rangeAllocator->elements;
  if (v10 >= a3)
  {
    if (v6 < v10)
    {
      LODWORD(numElements) = 0;
      goto LABEL_13;
    }
    LODWORD(v11) = 0;
LABEL_16:
    v16 = &elements[2 * v11];
    if (*v16 > a3)
      *v16 = a3;
    return;
  }
  v11 = 0;
  v12 = numElements - 1;
  v13 = elements + 1;
  do
  {
    if (numElements - 1 == v11)
    {
      if (*v13 + 1 < a3)
        goto LABEL_13;
LABEL_20:
      v17 = &elements[2 * v12];
      v19 = v17[1];
      v18 = v17 + 1;
      if (v7 > v19)
        *v18 = v7;
      return;
    }
    v14 = v13[1];
    v13 += 2;
    ++v11;
  }
  while (v14 < a3);
  if (*(v13 - 2) + 1 >= a3)
  {
    if (v6 >= v14)
    {
      *(v13 - 2) = *v13;
      self->_rangeAllocator.numElements = v12;
      memmove(v13 - 1, v13 + 1, 16 * (v12 - v11));
      return;
    }
    v12 = v11 - 1;
    goto LABEL_20;
  }
  if (v6 >= v14)
    goto LABEL_16;
  LODWORD(numElements) = v11;
LABEL_13:
  if (allocElement((uint64_t)&self->_rangeAllocator, numElements))
  {
    v15 = (unint64_t *)((char *)p_rangeAllocator->elements + 16 * numElements);
    *v15 = a3;
    v15[1] = v7;
  }
}

- (void)reset
{
  CMIRangeAllocatorListElement *elements;
  CMIRangeAllocatorList *p_rangeAllocator;
  unint64_t memSize;
  uint64_t v6;
  CMIRangeAllocatorListElement *v7;

  p_rangeAllocator = &self->_rangeAllocator;
  elements = self->_rangeAllocator.elements;
  if (elements)
    free(elements);
  memSize = self->_memSize;
  LODWORD(v6) = self->_defaultAlignment;
  if (v6 <= 1)
    v6 = 1;
  else
    v6 = v6;
  *(_OWORD *)&self->_rangeAllocator.capacity = xmmword_1D3307450;
  self->_rangeAllocator.numElements = 0;
  self->_rangeAllocator.elements = 0;
  self->_rangeAllocator.defaultAlignmentMask = v6 - 1;
  if (allocElement((uint64_t)p_rangeAllocator, 0))
  {
    v7 = p_rangeAllocator->elements;
    *(_QWORD *)v7 = 0;
    *((_QWORD *)v7 + 1) = memSize - 1;
  }
}

- (CMIRangeAllocator)init
{
  CMIRangeAllocator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMIRangeAllocator;
  result = -[CMIRangeAllocator init](&v3, sel_init);
  if (result)
  {
    result->_rangeAllocator.defaultAlignmentMask = 0;
    *(_OWORD *)&result->_rangeAllocator.capacity = 0u;
    *(_OWORD *)&result->_rangeAllocator.elements = 0u;
    result->_memSize = 0;
    result->_defaultAlignment = 0;
    result->_strategyType = 0;
  }
  return result;
}

- (int)setupWithMemSize:(unint64_t)a3 alignment:(unsigned int)defaultAlignment strategyType:(int)a5
{
  unint64_t memSize;
  CMIRangeAllocatorListElement *elements;
  CMIRangeAllocatorList *p_rangeAllocator;
  uint64_t v9;
  int v10;
  int result;
  CMIRangeAllocatorListElement *v12;

  if (a5 >= 2)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -1;
  }
  else
  {
    memSize = a3;
    p_rangeAllocator = &self->_rangeAllocator;
    elements = self->_rangeAllocator.elements;
    LODWORD(p_rangeAllocator[1].capacity) = a5;
    *(_QWORD *)&p_rangeAllocator[1].numElements = a3;
    LODWORD(p_rangeAllocator[1].elements) = defaultAlignment;
    if (elements)
    {
      free(elements);
      memSize = self->_memSize;
      defaultAlignment = self->_defaultAlignment;
    }
    if (defaultAlignment <= 1)
      v9 = 1;
    else
      v9 = defaultAlignment;
    *(_OWORD *)&self->_rangeAllocator.capacity = xmmword_1D3307450;
    self->_rangeAllocator.numElements = 0;
    self->_rangeAllocator.elements = 0;
    self->_rangeAllocator.defaultAlignmentMask = v9 - 1;
    v10 = allocElement((uint64_t)p_rangeAllocator, 0);
    result = 0;
    if (v10)
    {
      result = 0;
      v12 = p_rangeAllocator->elements;
      *(_QWORD *)v12 = 0;
      *((_QWORD *)v12 + 1) = memSize - 1;
    }
  }
  return result;
}

- (void)dealloc
{
  CMIRangeAllocatorListElement *elements;
  objc_super v4;

  elements = self->_rangeAllocator.elements;
  if (elements)
    free(elements);
  v4.receiver = self;
  v4.super_class = (Class)CMIRangeAllocator;
  -[CMIRangeAllocator dealloc](&v4, sel_dealloc);
}

- (int)allocateWithSize:(unint64_t)a3 alignment:(unsigned int)a4 outputOffset:(unint64_t *)a5
{
  int strategyType;
  int BestFit;

  strategyType = self->_strategyType;
  if (strategyType == 1)
  {
    BestFit = CMIRangeAllocatorListAllocateBestFit((uint64_t)&self->_rangeAllocator, a3, a5, a4, 0);
  }
  else if (strategyType)
  {
    BestFit = 0;
  }
  else
  {
    BestFit = CMIRangeAllocatorListAllocateFirstFit((uint64_t)&self->_rangeAllocator, a3, (uint64_t *)a5, a4, 0);
  }
  return BestFit - 1;
}

- (int)allocateWithSize:(unint64_t)a3 outputOffset:(unint64_t *)a4
{
  return -[CMIRangeAllocator allocateWithSize:alignment:outputOffset:](self, "allocateWithSize:alignment:outputOffset:", a3, self->_defaultAlignment, a4);
}

- (unsigned)getFragmentCount
{
  return self->_rangeAllocator.numElements;
}

- (unint64_t)getMaxFreeSize
{
  return -[CMIRangeAllocator getMaxFreeSizeWithAlignment:](self, "getMaxFreeSizeWithAlignment:", self->_defaultAlignment);
}

- (unint64_t)getMaxFreeSizeWithAlignment:(unsigned int)a3
{
  uint64_t numElements;
  unint64_t result;
  uint64_t *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  numElements = self->_rangeAllocator.numElements;
  if (!(_DWORD)numElements)
    return 0;
  result = 0;
  v6 = (uint64_t *)((char *)self->_rangeAllocator.elements + 8);
  do
  {
    v7 = *(v6 - 1);
    if (a3)
    {
      if (v7 % a3)
        v8 = a3 - v7 % a3;
      else
        v8 = 0;
      v7 += v8;
    }
    v9 = *v6;
    v6 += 2;
    v10 = v9 + 1;
    v11 = v9 + 1 - v7;
    if (v11 <= result)
      v11 = result;
    if (v10 > v7)
      result = v11;
    --numElements;
  }
  while (numElements);
  return result;
}

- (unint64_t)getTotalFreeMemorySize
{
  uint64_t v2;
  unint64_t v3;
  _DWORD *v4;

  v2 = *(unsigned int *)(self + 16);
  if (!(_DWORD)v2)
    return 0;
  v3 = self;
  LODWORD(self) = 0;
  v4 = (_DWORD *)(*(_QWORD *)(v3 + 8) + 8);
  do
  {
    self = (self + *v4 - *(v4 - 2) + 1);
    v4 += 4;
    --v2;
  }
  while (v2);
  return self;
}

@end
