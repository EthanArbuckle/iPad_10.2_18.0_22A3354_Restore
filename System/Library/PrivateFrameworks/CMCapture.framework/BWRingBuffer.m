@implementation BWRingBuffer

- (uint64_t)lastElement
{
  int v1;
  int v2;

  if (result)
  {
    v2 = *(_DWORD *)(result + 20);
    v1 = *(_DWORD *)(result + 24);
    if ((v2 + v1 - *(_DWORD *)(result + 16)) % v1 < 1)
      return 0;
    else
      return *(_QWORD *)(result + 8) + *(_QWORD *)(result + 32) * ((v1 + v2 - 1) % v1);
  }
  return result;
}

- (_QWORD)appendElement:(_QWORD *)result
{
  _QWORD *v2;
  uint64_t v3;

  if (result)
  {
    v2 = result;
    v3 = *((int *)result + 5);
    if (((int)v3 + *((_DWORD *)result + 6) - *((_DWORD *)result + 4)) % *((_DWORD *)result + 6) < *((_DWORD *)result + 6)
                                                                                                 - 1)
    {
      result = memcpy((void *)(result[1] + result[4] * v3), a2, result[4]);
      *((_DWORD *)v2 + 5) = (*((_DWORD *)v2 + 5) + 1) % *((_DWORD *)v2 + 6);
    }
  }
  return result;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t outputIndex;
  unint64_t v6;

  if (a3->var0)
  {
    outputIndex = a3->var3[0];
  }
  else
  {
    a3->var2 = (unint64_t *)self;
    if (self)
      outputIndex = self->_outputIndex;
    else
      outputIndex = 0;
    a3->var3[0] = outputIndex;
    a3->var0 = 1;
  }
  v6 = 0;
  if (!self)
    goto LABEL_13;
  while ((_DWORD)outputIndex != self->_inputIndex && v6 < a5)
  {
    a4[v6] = (char *)self->_ringBuffer + self->_typeSize * (int)outputIndex;
    LODWORD(outputIndex) = ((int)outputIndex + 1) % self->_length;
    while (1)
    {
      ++v6;
      if (self)
        break;
LABEL_13:
      if (!(_DWORD)outputIndex || v6 >= a5)
        goto LABEL_16;
      a4[v6] = 0;
    }
  }
LABEL_16:
  a3->var3[0] = (int)outputIndex;
  a3->var1 = a4;
  return v6;
}

- (_QWORD)initWithLength:(uint64_t)a3 dataTypeSize:
{
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  objc_super v9;

  if (!a1)
    return 0;
  v9.receiver = a1;
  v9.super_class = (Class)BWRingBuffer;
  v5 = objc_msgSendSuper2(&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    *((_DWORD *)v5 + 6) = a2 + 1;
    v5[4] = a3;
    v5[2] = 0;
    v7 = malloc_type_malloc((a2 + 1) * a3, 0x7814A57AuLL);
    v6[1] = v7;
    if (!v7)
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_ringBuffer);
  v3.receiver = self;
  v3.super_class = (Class)BWRingBuffer;
  -[BWRingBuffer dealloc](&v3, sel_dealloc);
}

@end
