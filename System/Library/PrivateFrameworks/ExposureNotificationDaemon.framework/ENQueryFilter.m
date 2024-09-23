@implementation ENQueryFilter

- (ENQueryFilter)init
{
  return -[ENQueryFilter initWithBufferSize:hashCount:](self, "initWithBufferSize:hashCount:", 0x100000, 3);
}

- (ENQueryFilter)initWithBufferSize:(unint64_t)a3 hashCount:(unint64_t)a4
{
  void *v7;
  int v8;
  objc_class *v9;
  ENQueryFilter *v10;
  ENQueryFilter *v11;
  char *v12;
  unint64_t *v13;
  unint64_t v14;
  ENQueryFilter *v15;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  objc_super v20;

  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSensitiveLoggingAllowed");

  if (v8
    && gLogCategory_ENQueryFilter <= 50
    && (gLogCategory_ENQueryFilter != -1 || _LogCategory_Initialize()))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v18 = a3;
    v19 = a4;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  v20.receiver = self;
  v20.super_class = (Class)ENQueryFilter;
  v10 = -[ENQueryFilter init](&v20, sel_init, v17, v18, v19);
  v11 = v10;
  if (!v10)
    goto LABEL_12;
  v10->_bufferSize = a3;
  v12 = (char *)malloc_type_calloc(a3, 1uLL, 0x2F186909uLL);
  v11->_filterBuffer = v12;
  if (!v12)
  {
    if (gLogCategory__ENQueryFilter > 90
      || gLogCategory__ENQueryFilter == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_22;
    }
LABEL_18:
    LogPrintF_safe();
LABEL_22:
    v15 = 0;
    goto LABEL_23;
  }
  v11->_hashCount = a4;
  v13 = (unint64_t *)malloc_type_malloc(8 * a4, 0x100004000313F17uLL);
  v11->_hashSalts = v13;
  if (!v13)
  {
    if (gLogCategory__ENQueryFilter > 90
      || gLogCategory__ENQueryFilter == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_22;
    }
    goto LABEL_18;
  }
  if (v11->_hashCount)
  {
    v14 = 0;
    do
      v11->_hashSalts[v14++] = arc4random();
    while (v14 < v11->_hashCount);
  }
LABEL_12:
  v15 = v11;
LABEL_23:

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_filterBuffer);
  free(self->_hashSalts);
  v3.receiver = self;
  v3.super_class = (Class)ENQueryFilter;
  -[ENQueryFilter dealloc](&v3, sel_dealloc);
}

- (void)addPossibleRPI:(const void *)a3
{
  unint64_t v3;
  unint64_t v4;

  if (self->_hashCount)
  {
    v3 = 0;
    do
    {
      v4 = (*(_QWORD *)a3 ^ *((_QWORD *)a3 + 1) ^ self->_hashSalts[v3]) % (8 * self->_bufferSize);
      self->_filterBuffer[v4 >> 3] |= 1 << (v4 & 7);
      ++v3;
    }
    while (v3 < self->_hashCount);
  }
}

- (BOOL)shouldIgnoreRPI:(const void *)a3
{
  unint64_t hashCount;
  unint64_t *hashSalts;
  unint64_t v5;
  char *filterBuffer;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  hashCount = self->_hashCount;
  if (!hashCount)
    return 0;
  hashSalts = self->_hashSalts;
  v5 = 8 * self->_bufferSize;
  filterBuffer = self->_filterBuffer;
  v7 = *(_QWORD *)a3 ^ *((_QWORD *)a3 + 1);
  if (((filterBuffer[((v7 ^ *hashSalts) % v5) >> 3] >> (((v7 ^ *hashSalts) % v5) & 7)) & 1) == 0)
    return 1;
  v8 = 1;
  do
  {
    v9 = v8;
    if (hashCount == v8)
      break;
    v10 = ((v7 ^ hashSalts[v8++]) % v5) & 7;
  }
  while (((filterBuffer[((v7 ^ hashSalts[v9]) % v5) >> 3] >> v10) & 1) != 0);
  return v9 < hashCount;
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

- (unint64_t)hashCount
{
  return self->_hashCount;
}

@end
