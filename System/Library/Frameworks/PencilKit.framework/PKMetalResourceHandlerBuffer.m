@implementation PKMetalResourceHandlerBuffer

- (id)initWithSize:(void *)a3 options:(void *)a4 device:(char)a5 purgeable:
{
  id v10;
  id *v11;
  uint64_t v12;
  id v13;
  char v14;
  char v15;
  _QWORD *v16;
  objc_super v18;

  v10 = a4;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)PKMetalResourceHandlerBuffer;
    v11 = (id *)objc_msgSendSuper2(&v18, sel_init);
    a1 = v11;
    if (v11)
    {
      v11[4] = a2;
      v11[5] = a3;
      objc_storeStrong(v11 + 1, a4);
      *((_BYTE *)a1 + 48) = a5;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 8);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = a1[7];
      a1[7] = (id)v12;

      v14 = 1;
      do
      {
        v15 = v14;
        v16 = -[PKMetalBuffer initWithDevice:length:bytes:options:]([PKMetalBuffer alloc], a1[1], (uint64_t)a1[4], 0, (uint64_t)a1[5]);
        objc_msgSend(a1[7], "addObject:", v16);

        v14 = 0;
      }
      while ((v15 & 1) != 0);
    }
  }

  return a1;
}

- (_QWORD)newBufferWithLength:(const void *)a3 bytes:(unint64_t *)a4 outOffset:(_QWORD *)a5 outReusableMetalBuffer:
{
  unint64_t v10;
  unint64_t v11;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;

  if (!a1)
    return 0;
  v10 = *(_QWORD *)(a1 + 32);
  if (v10 >= a2)
  {
    v11 = v10 - *(_QWORD *)(a1 + 24);
    if (a2 <= v10 >> 2 || v11 >= a2)
    {
      v13 = *(_QWORD **)(a1 + 16);
      if (v13 && v11 >= a2)
      {
        v14 = 0;
        if (!a3)
        {
LABEL_27:
          v15 = v13;
          v16 = *(_QWORD *)(a1 + 24);
          *(_QWORD *)(a1 + 24) = (unint64_t)((double)v16 + ceil((double)a2 * 0.0625) * 16.0);
          goto LABEL_28;
        }
LABEL_24:
        if (v13)
          v22 = (void *)v13[3];
        else
          v22 = 0;
        v23 = objc_retainAutorelease(v22);
        v24 = objc_msgSend(v23, "contents");

        memcpy((void *)(v24 + *(_QWORD *)(a1 + 24)), a3, a2);
        v13 = *(_QWORD **)(a1 + 16);
        goto LABEL_27;
      }
      if (*(_BYTE *)(a1 + 48))
      {
        objc_msgSend(v13, "unlock");
        v14 = *(void **)(a1 + 16);
        if (!v14)
          goto LABEL_16;
      }
      else
      {
        v14 = *(void **)(a1 + 16);
        if (!v13)
        {
LABEL_16:
          if (objc_msgSend(*(id *)(a1 + 56), "count"))
          {
            objc_msgSend(*(id *)(a1 + 56), "lastObject");
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = *(void **)(a1 + 16);
            *(_QWORD *)(a1 + 16) = v18;

            objc_msgSend(*(id *)(a1 + 56), "removeLastObject");
          }
          else
          {
            v20 = -[PKMetalBuffer initWithDevice:length:bytes:options:]([PKMetalBuffer alloc], *(void **)(a1 + 8), *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
            v21 = *(void **)(a1 + 16);
            *(_QWORD *)(a1 + 16) = v20;

          }
          if (*(_BYTE *)(a1 + 48))
            objc_msgSend(*(id *)(a1 + 16), "lock");
          *(_QWORD *)(a1 + 24) = 0;
          v13 = *(_QWORD **)(a1 + 16);
          if (!a3)
            goto LABEL_27;
          goto LABEL_24;
        }
      }
      v17 = v14;
      goto LABEL_16;
    }
  }
  v15 = -[PKMetalBuffer initWithDevice:length:bytes:options:]([PKMetalBuffer alloc], *(void **)(a1 + 8), a2, (uint64_t)a3, *(_QWORD *)(a1 + 40));
  v14 = 0;
  v16 = 0;
LABEL_28:
  *a4 = v16;
  if (a5)
    *a5 = objc_retainAutorelease(v14);

  return v15;
}

- (void)addReusableBuffer:(uint64_t)a1
{
  id v3;

  v3 = a2;
  if (a1 && (unint64_t)objc_msgSend(*(id *)(a1 + 56), "count") <= 7)
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reusableBuffers, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
