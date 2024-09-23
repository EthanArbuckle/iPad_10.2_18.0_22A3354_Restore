@implementation DVTDataBlockStream

- (id)createNextStream:(id *)a3
{
  return objc_alloc_init(DVTDataBlockStream);
}

- (id)read:(unint64_t)a3 error:(id *)a4
{
  char *v4;
  id v5;

  if (*((_QWORD *)self + 3))
  {
    v4 = (char *)self + 8;
    v5 = *(id *)(*((_QWORD *)self + 2) + 16);
    sub_222B7B06C((uint64_t)v4);
    return v5;
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (id)peek:(unint64_t)a3 error:(id *)a4
{
  if (*((_QWORD *)self + 3))
    return *(id *)(*((_QWORD *)self + 2) + 16);
  __break(1u);
  return self;
}

- (BOOL)hasData
{
  return self->_records.__size_alloc_.__value_ != 0;
}

- (BOOL)hasSpace
{
  return 1;
}

- (int64_t)write:(id)a3 error:(id *)a4
{
  int64_t v5;
  id v7;

  v7 = a3;
  sub_222B7B14C((uint64_t *)&self->_records, &v7);
  v5 = objc_msgSend(v7, "length");

  return v5;
}

- (BOOL)supportsPeek
{
  return 1;
}

- (void).cxx_destruct
{
  sub_222B7B1C8((uint64_t *)&self->_records);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = (char *)self + 8;
  *((_QWORD *)self + 2) = (char *)self + 8;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
