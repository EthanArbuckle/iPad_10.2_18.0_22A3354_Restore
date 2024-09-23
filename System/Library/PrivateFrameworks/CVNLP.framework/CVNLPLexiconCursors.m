@implementation CVNLPLexiconCursors

- (CVNLPLexiconCursors)initWithSortedCursors:(void *)a3
{
  CVNLPLexiconCursors *v4;
  CVNLPLexiconCursors *v5;
  vector<const _LXCursor *, std::allocator<const _LXCursor *>> *p_sortedCursors;
  BOOL v7;
  char *v8;
  char *v9;
  int64_t v10;
  unint64_t v11;
  uint64_t value;
  _LXCursor **begin;
  uint64_t v14;
  unint64_t v15;
  _LXCursor **v16;
  _LXCursor ***p_end;
  _LXCursor **end;
  unint64_t v19;
  char *v20;
  _LXCursor **v21;
  char *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CVNLPLexiconCursors;
  v4 = -[CVNLPLexiconCursors init](&v24, sel_init);
  v5 = v4;
  p_sortedCursors = &v4->_sortedCursors;
  if (v4)
    v7 = p_sortedCursors == a3;
  else
    v7 = 1;
  if (!v7)
  {
    v8 = *(char **)a3;
    v9 = (char *)*((_QWORD *)a3 + 1);
    v10 = (int64_t)&v9[-*(_QWORD *)a3];
    v11 = v10 >> 3;
    value = (uint64_t)v4->_sortedCursors.__end_cap_.__value_;
    begin = v4->_sortedCursors.__begin_;
    if (v10 >> 3 > (unint64_t)((value - (uint64_t)begin) >> 3))
    {
      if (begin)
      {
        v4->_sortedCursors.__end_ = begin;
        operator delete(begin);
        value = 0;
        p_sortedCursors->__begin_ = 0;
        p_sortedCursors->__end_ = 0;
        p_sortedCursors->__end_cap_.__value_ = 0;
      }
      if (v10 < 0)
        goto LABEL_27;
      v14 = value >> 2;
      if (value >> 2 <= v11)
        v14 = v10 >> 3;
      v15 = (unint64_t)value >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v14;
      if (v15 >> 61)
LABEL_27:
        sub_1B02D7758();
      v16 = (_LXCursor **)operator new(8 * v15);
      begin = v16;
      v5->_sortedCursors.__end_ = v16;
      p_end = &v5->_sortedCursors.__end_;
      v5->_sortedCursors.__begin_ = v16;
      v5->_sortedCursors.__end_cap_.__value_ = &v16[v15];
      if (v9 != v8)
        memcpy(v16, v8, v10);
      goto LABEL_25;
    }
    p_end = &v4->_sortedCursors.__end_;
    end = v4->_sortedCursors.__end_;
    v19 = end - begin;
    if (v19 >= v11)
    {
      if (v9 == v8)
      {
LABEL_25:
        *p_end = (_LXCursor **)((char *)begin + v10);
        return v5;
      }
      v21 = v4->_sortedCursors.__begin_;
      v22 = v8;
    }
    else
    {
      v20 = &v8[8 * v19];
      if (end != begin)
      {
        memmove(v4->_sortedCursors.__begin_, v8, (char *)end - (char *)begin);
        begin = *p_end;
      }
      v10 = v9 - v20;
      if (v9 == v20)
        goto LABEL_25;
      v21 = begin;
      v22 = v20;
    }
    memmove(v21, v22, v10);
    goto LABEL_25;
  }
  return v5;
}

- (void)enumerateLexiconCursorsSortedByPriorityWithBlock:(id)a3
{
  void (**v4)(id, uint64_t, char *);
  _LXCursor **begin;
  _LXCursor **end;
  _LXCursor **v7;
  uint64_t v8;
  BOOL v9;
  char v10;

  v4 = (void (**)(id, uint64_t, char *))a3;
  begin = self->_sortedCursors.__begin_;
  end = self->_sortedCursors.__end_;
  if (begin != end)
  {
    v7 = begin + 1;
    do
    {
      v8 = (uint64_t)*(v7 - 1);
      v10 = 0;
      v4[2](v4, v8, &v10);
      if (v10)
        v9 = 1;
      else
        v9 = v7 == end;
      ++v7;
    }
    while (!v9);
  }

}

- (int64_t)count
{
  return self->_sortedCursors.__end_ - self->_sortedCursors.__begin_;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _LXCursor **begin;
  _LXCursor **end;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _BYTE *v15;
  uint64_t *v16;
  int64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  _OWORD *v22;
  __int128 *v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  CVNLPLexiconCursors *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  void *__p;
  char *v33;
  char *v34;

  __p = 0;
  v33 = 0;
  v34 = 0;
  begin = self->_sortedCursors.__begin_;
  end = self->_sortedCursors.__end_;
  if (begin != end)
  {
    while (1)
    {
      v6 = LXCursorCreateByAdvancing();
      v7 = v6;
      v8 = v33;
      if (v33 >= v34)
        break;
      *(_QWORD *)v33 = v6;
      v5 = (uint64_t)(v8 + 8);
LABEL_4:
      v33 = (char *)v5;
      if (++begin == end)
        goto LABEL_26;
    }
    v9 = __p;
    v10 = v33 - (_BYTE *)__p;
    v11 = (v33 - (_BYTE *)__p) >> 3;
    v12 = v11 + 1;
    if ((unint64_t)(v11 + 1) >> 61)
      sub_1B02D7758();
    v13 = v34 - (_BYTE *)__p;
    if ((v34 - (_BYTE *)__p) >> 2 > v12)
      v12 = v13 >> 2;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8)
      v14 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v14 = v12;
    if (v14)
    {
      if (v14 >> 61)
        sub_1B02D72AC();
      v15 = operator new(8 * v14);
      v16 = (uint64_t *)&v15[8 * v11];
      *v16 = v7;
      v5 = (uint64_t)(v16 + 1);
      v17 = v8 - v9;
      if (v8 == v9)
      {
LABEL_15:
        __p = v16;
        v34 = &v15[8 * v14];
        if (!v8)
          goto LABEL_4;
        goto LABEL_25;
      }
    }
    else
    {
      v15 = 0;
      v16 = (uint64_t *)(8 * v11);
      *(_QWORD *)(8 * v11) = v7;
      v5 = 8 * v11 + 8;
      v17 = v8 - v9;
      if (v8 == v9)
        goto LABEL_15;
    }
    v18 = v17 - 8;
    if (v18 < 0x58)
      goto LABEL_33;
    if ((unint64_t)(v8 - v15 - v10) < 0x20)
      goto LABEL_33;
    v19 = (v18 >> 3) + 1;
    v20 = 8 * (v19 & 0x3FFFFFFFFFFFFFFCLL);
    v21 = &v8[-v20];
    v16 = (uint64_t *)((char *)v16 - v20);
    v22 = &v15[8 * v11 - 16];
    v23 = (__int128 *)(v8 - 16);
    v24 = v19 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v25 = *v23;
      *(v22 - 1) = *(v23 - 1);
      *v22 = v25;
      v22 -= 2;
      v23 -= 2;
      v24 -= 4;
    }
    while (v24);
    v8 = v21;
    if (v19 != (v19 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_33:
      do
      {
        v26 = *((_QWORD *)v8 - 1);
        v8 -= 8;
        *--v16 = v26;
      }
      while (v8 != v9);
    }
    v8 = __p;
    __p = v16;
    v34 = &v15[8 * v14];
    if (!v8)
      goto LABEL_4;
LABEL_25:
    operator delete(v8);
    goto LABEL_4;
  }
LABEL_26:
  v27 = [CVNLPLexiconCursors alloc];
  v30 = (void *)objc_msgSend_initWithSortedCursors_(v27, v28, (uint64_t)&__p, v29);
  if (__p)
  {
    v33 = (char *)__p;
    operator delete(__p);
  }
  return v30;
}

- (void)dealloc
{
  _LXCursor **begin;
  _LXCursor **end;
  objc_super v5;

  begin = self->_sortedCursors.__begin_;
  end = self->_sortedCursors.__end_;
  while (begin != end)
  {
    if (*begin)
      CFRelease(*begin);
    ++begin;
  }
  v5.receiver = self;
  v5.super_class = (Class)CVNLPLexiconCursors;
  -[CVNLPLexiconCursors dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  _LXCursor **begin;

  begin = self->_sortedCursors.__begin_;
  if (begin)
  {
    self->_sortedCursors.__end_ = begin;
    operator delete(begin);
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
