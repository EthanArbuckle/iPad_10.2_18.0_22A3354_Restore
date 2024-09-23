@implementation PHASETriangleSet

- (PHASETriangleSet)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHASETriangleSet;
  return -[PHASETriangleSet init](&v3, sel_init);
}

- (PHASETriangleSet)initWithTriangleData:(id)a3 color:
{
  __int128 v3;
  id v5;
  char *v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  unint64_t v14;
  __int128 v16;
  objc_super v17;

  v16 = v3;
  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PHASETriangleSet;
  v6 = -[PHASETriangleSet init](&v17, sel_init);
  v7 = objc_msgSend(v5, "length");
  v8 = v7 / 0x24;
  v9 = v6 + 8;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)(v6 + 8), 3 * (v7 / 0x24));
  v10 = objc_retainAutorelease(v5);
  v11 = objc_msgSend(v10, "bytes");
  if (v7 >= 0x24)
  {
    v13 = 0;
    if (v8 <= 1)
      v14 = 1;
    else
      v14 = v7 / 0x24;
    do
    {
      *(_QWORD *)&v12 = *(_QWORD *)v11;
      DWORD2(v12) = *(_DWORD *)(v11 + 8);
      *(_OWORD *)(*v9 + v13) = v12;
      *(_QWORD *)&v12 = *(_QWORD *)(v11 + 12);
      DWORD2(v12) = *(_DWORD *)(v11 + 20);
      *(_OWORD *)(*v9 + v13 + 16) = v12;
      *(_QWORD *)&v12 = *(_QWORD *)(v11 + 24);
      DWORD2(v12) = *(_DWORD *)(v11 + 32);
      *(_OWORD *)(*v9 + v13 + 32) = v12;
      v13 += 48;
      v11 += 36;
      --v14;
    }
    while (v14);
  }
  *((_QWORD *)v6 + 4) = v8;
  *((_OWORD *)v6 + 3) = v16;

  return (PHASETriangleSet *)v6;
}

- (__n128)pointAtIndex:(int)a3 vertexIndex:(int)a4
{
  return *(__n128 *)(*(_QWORD *)(a1 + 8) + 16 * (3 * a3 + a4));
}

- (int64_t)size
{
  return self->_size;
}

- (__n128)color
{
  return a1[3];
}

- (void).cxx_destruct
{
  void *v3;

  v3 = *(void **)self->_anon_8;
  if (v3)
  {
    *(_QWORD *)&self->_anon_8[8] = v3;
    operator delete(v3);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
