@implementation CKXSchema

- (CKXSchema)init
{
  CKXSchema *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKXSchema;
  result = -[CKXSchema init](&v3, sel_init);
  if (result)
    result->_nextIdentifier = 1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKXSchema *v4;
  const char *v5;
  uint64_t v6;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v8;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  size_t v10;
  unint64_t v11;
  unint64_t value;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v16;
  unint64_t v17;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v18;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v19;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v20;
  char *v21;
  void **p_begin;
  _BYTE *v23;
  _BYTE *v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  char *v36;
  void *v37;
  void *v38;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v39;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v40;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v41;
  size_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  void **p_end;
  uint64_t v49;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v50;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v51;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v52;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v53;

  v4 = objc_alloc_init(CKXSchema);
  v4->_nextIdentifier = objc_msgSend_nextIdentifier(self, v5, v6);
  if (v4 != self)
  {
    sub_1D4BB5FC4((char *)&v4->structTokens, (char *)self->structTokens.__begin_, (uint64_t)self->structTokens.__end_, self->structTokens.__end_ - self->structTokens.__begin_);
    begin = v4->structTokenToStructProperties.__begin_;
    v8 = self->structTokenToStructProperties.__begin_;
    end = self->structTokenToStructProperties.__end_;
    v10 = end - v8;
    v11 = (end - v8) >> 1;
    value = (unint64_t)v4->structTokenToStructProperties.__end_cap_.__value_;
    if (v11 <= (uint64_t)(value - (_QWORD)begin) >> 1)
    {
      v16 = v4->structTokenToStructProperties.__end_;
      v17 = (v16 - begin) >> 1;
      if (v17 < v11)
      {
        v18 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v8 + 2 * v17);
        if (v16 != begin)
        {
          memmove(v4->structTokenToStructProperties.__begin_, self->structTokenToStructProperties.__begin_, v16 - begin);
          begin = v4->structTokenToStructProperties.__end_;
        }
        v10 = end - v18;
        if (end == v18)
        {
LABEL_22:
          p_begin = &v4->structTokenToFieldTokens.__begin_;
          v21 = (char *)v4->structTokenToFieldTokens.__begin_;
          v4->structTokenToStructProperties.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + v10);
          v24 = self->structTokenToFieldTokens.__begin_;
          v23 = self->structTokenToFieldTokens.__end_;
          v25 = 0xAAAAAAAAAAAAAAABLL * ((v23 - v24) >> 3);
          v26 = (uint64_t)v4->structTokenToFieldTokens.__end_cap_.__value_;
          if (0xAAAAAAAAAAAAAAABLL * ((v26 - (uint64_t)v21) >> 3) >= v25)
          {
            if (0xAAAAAAAAAAAAAAABLL * (((char *)v4->structTokenToFieldTokens.__end_ - (char *)v21) >> 3) >= v25)
            {
              v34 = sub_1D4BB6268((uint64_t)self->structTokenToFieldTokens.__begin_, (uint64_t)self->structTokenToFieldTokens.__end_, v21);
              v35 = (char *)v4->structTokenToFieldTokens.__end_;
              if (v35 != v34)
              {
                v36 = (char *)v4->structTokenToFieldTokens.__end_;
                do
                {
                  v38 = (void *)*((_QWORD *)v36 - 3);
                  v36 -= 24;
                  v37 = v38;
                  if (v38)
                  {
                    *((_QWORD *)v35 - 2) = v37;
                    operator delete(v37);
                  }
                  v35 = v36;
                }
                while (v36 != v34);
              }
              v4->structTokenToFieldTokens.__end_ = v34;
LABEL_42:
              v39 = v4->fieldTokenToFieldProperties.__begin_;
              v40 = self->fieldTokenToFieldProperties.__begin_;
              v41 = self->fieldTokenToFieldProperties.__end_;
              v42 = v41 - v40;
              v43 = 0x6DB6DB6DB6DB6DB7 * ((v41 - v40) >> 3);
              v44 = (uint64_t)v4->fieldTokenToFieldProperties.__end_cap_.__value_;
              if (0x6DB6DB6DB6DB6DB7 * ((v44 - (uint64_t)v39) >> 3) >= v43)
              {
                p_end = (void **)&v4->fieldTokenToFieldProperties.__end_;
                v50 = v4->fieldTokenToFieldProperties.__end_;
                if (0x6DB6DB6DB6DB6DB7 * ((v50 - v39) >> 3) < v43)
                {
                  v51 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v40 + 8 * ((v50 - v39) >> 3));
                  if (v50 != v39)
                  {
                    memmove(v4->fieldTokenToFieldProperties.__begin_, v40, v50 - v39);
                    v39 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)*p_end;
                  }
                  v42 = v41 - v51;
                  if (v41 == v51)
                    goto LABEL_61;
                  v52 = v39;
                  v53 = v51;
                  goto LABEL_60;
                }
              }
              else
              {
                if (v39)
                {
                  v4->fieldTokenToFieldProperties.__end_ = v39;
                  operator delete(v39);
                  v44 = 0;
                  v4->fieldTokenToFieldProperties.__begin_ = 0;
                  v4->fieldTokenToFieldProperties.__end_ = 0;
                  v4->fieldTokenToFieldProperties.__end_cap_.__value_ = 0;
                }
                if (v43 > 0x492492492492492)
                  goto LABEL_65;
                v45 = 0x6DB6DB6DB6DB6DB7 * (v44 >> 3);
                v46 = 2 * v45;
                if (2 * v45 <= v43)
                  v46 = 0x6DB6DB6DB6DB6DB7 * ((v41 - v40) >> 3);
                v47 = v45 >= 0x249249249249249 ? 0x492492492492492 : v46;
                if (v47 > 0x492492492492492)
LABEL_65:
                  sub_1D4BB60CC();
                v39 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)sub_1D4BB6310(v47);
                v4->fieldTokenToFieldProperties.__end_ = v39;
                p_end = (void **)&v4->fieldTokenToFieldProperties.__end_;
                v4->fieldTokenToFieldProperties.__begin_ = v39;
                v4->fieldTokenToFieldProperties.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v39 + 56 * v49);
              }
              if (v41 == v40)
              {
LABEL_61:
                *p_end = (char *)v39 + v42;
                return v4;
              }
              v52 = v39;
              v53 = v40;
LABEL_60:
              memmove(v52, v53, v42);
              goto LABEL_61;
            }
            v33 = (uint64_t)&v24[8 * (((char *)v4->structTokenToFieldTokens.__end_ - (char *)v21) >> 3)];
            sub_1D4BB6268((uint64_t)self->structTokenToFieldTokens.__begin_, v33, v21);
            v32 = sub_1D4BB6110((uint64_t)&v4->structTokenToFieldTokens.__end_cap_, v33, (uint64_t)v23, (_QWORD *)v4->structTokenToFieldTokens.__end_);
          }
          else
          {
            if (v21)
            {
              sub_1D4B28B58((uint64_t *)&v4->structTokenToFieldTokens);
              operator delete(*p_begin);
              v26 = 0;
              *p_begin = 0;
              v4->structTokenToFieldTokens.__end_ = 0;
              v4->structTokenToFieldTokens.__end_cap_.__value_ = 0;
            }
            if (v25 > 0xAAAAAAAAAAAAAAALL)
              goto LABEL_64;
            v27 = 0xAAAAAAAAAAAAAAABLL * (v26 >> 3);
            v28 = 2 * v27;
            if (2 * v27 <= v25)
              v28 = 0xAAAAAAAAAAAAAAABLL * ((v23 - v24) >> 3);
            v29 = v27 >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v28;
            if (v29 > 0xAAAAAAAAAAAAAAALL)
LABEL_64:
              sub_1D4BB60CC();
            v30 = sub_1D4BB62CC(v29);
            v4->structTokenToFieldTokens.__begin_ = v30;
            v4->structTokenToFieldTokens.__end_ = v30;
            v4->structTokenToFieldTokens.__end_cap_.__value_ = &v30[3 * v31];
            v32 = sub_1D4BB6110((uint64_t)&v4->structTokenToFieldTokens.__end_cap_, (uint64_t)v24, (uint64_t)v23, v30);
          }
          v4->structTokenToFieldTokens.__end_ = v32;
          goto LABEL_42;
        }
        v19 = begin;
        v20 = v18;
LABEL_21:
        memmove(v19, v20, v10);
        goto LABEL_22;
      }
    }
    else
    {
      if (begin)
      {
        v4->structTokenToStructProperties.__end_ = begin;
        operator delete(begin);
        value = 0;
        v4->structTokenToStructProperties.__begin_ = 0;
        v4->structTokenToStructProperties.__end_ = 0;
        v4->structTokenToStructProperties.__end_cap_.__value_ = 0;
      }
      if ((v10 & 0x8000000000000000) != 0
        || (value <= v11 ? (v13 = (end - v8) >> 1) : (v13 = value),
            value >= 0x7FFFFFFFFFFFFFFELL ? (v14 = 0x7FFFFFFFFFFFFFFFLL) : (v14 = v13),
            v14 < 0))
      {
        sub_1D4BB60CC();
      }
      begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)sub_1D4BB60E0(v14);
      v4->structTokenToStructProperties.__begin_ = begin;
      v4->structTokenToStructProperties.__end_ = begin;
      v4->structTokenToStructProperties.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin
                                                                                                  + 2 * v15);
    }
    if (end == v8)
      goto LABEL_22;
    v19 = begin;
    v20 = v8;
    goto LABEL_21;
  }
  return v4;
}

- (int64_t)newIdentifier
{
  uint64_t v2;
  int64_t Identifier;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;

  Identifier = objc_msgSend_nextIdentifier(self, a2, v2);
  v7 = objc_msgSend_nextIdentifier(self, v5, v6);
  objc_msgSend_setNextIdentifier_(self, v8, v7 + 1);
  return Identifier;
}

- (unint64_t)defineFieldForStruct:(unint64_t)a3
{
  uint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t *v8;
  uint64_t **v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  unint64_t *v18;
  char *v19;
  unint64_t v20;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  unint64_t v28;
  unint64_t v29;
  char *v30;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v31;
  uint64_t v32;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v33;
  size_t v34;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v35;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v36;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  size_t v41;

  v5 = objc_msgSend_newIdentifier(self, a2, a3);
  v6 = v5;
  v7 = (char *)self->structTokenToFieldTokens.__begin_ + 24 * a3;
  v9 = (uint64_t **)(v7 + 8);
  v8 = (uint64_t *)*((_QWORD *)v7 + 1);
  v10 = *((_QWORD *)v7 + 2);
  if ((unint64_t)v8 >= v10)
  {
    v12 = *(uint64_t **)v7;
    v13 = ((uint64_t)v8 - *(_QWORD *)v7) >> 3;
    v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 61)
      sub_1D4B182AC();
    v15 = v10 - (_QWORD)v12;
    if (v15 >> 2 > v14)
      v14 = v15 >> 2;
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8)
      v16 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v16 = v14;
    if (v16)
    {
      v17 = (char *)sub_1D4B182C0((uint64_t)(v7 + 16), v16);
      v8 = *v9;
      v12 = *(uint64_t **)v7;
    }
    else
    {
      v17 = 0;
    }
    v18 = (unint64_t *)&v17[8 * v13];
    v19 = &v17[8 * v16];
    *v18 = v6;
    v11 = (uint64_t *)(v18 + 1);
    while (v8 != v12)
    {
      v20 = *--v8;
      *--v18 = v20;
    }
    *(_QWORD *)v7 = v18;
    *v9 = v11;
    *((_QWORD *)v7 + 2) = v19;
    if (v12)
      operator delete(v12);
  }
  else
  {
    *v8 = v5;
    v11 = v8 + 1;
  }
  *v9 = v11;
  begin = self->fieldTokenToFieldProperties.__begin_;
  end = self->fieldTokenToFieldProperties.__end_;
  v23 = (end - begin) >> 3;
  v24 = 0x6DB6DB6DB6DB6DB7 * v23;
  if (v6 + 1 > 0x6DB6DB6DB6DB6DB7 * v23)
    v25 = v6 + 1;
  else
    v25 = 0x6DB6DB6DB6DB6DB7 * v23;
  if (v24 < v6 + 1)
  {
    v26 = v25 - v24;
    value = self->fieldTokenToFieldProperties.__end_cap_.__value_;
    if (0x6DB6DB6DB6DB6DB7 * ((value - end) >> 3) >= v25 - v24)
    {
      v41 = 56 * ((56 * v26 - 56) / 0x38) + 56;
      bzero(self->fieldTokenToFieldProperties.__end_, v41);
      self->fieldTokenToFieldProperties.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + v41);
    }
    else
    {
      if (v25 > 0x492492492492492)
        sub_1D4BB60CC();
      v28 = 0x6DB6DB6DB6DB6DB7 * ((value - begin) >> 3);
      if (2 * v28 > v25)
        v25 = 2 * v28;
      if (v28 >= 0x249249249249249)
        v29 = 0x492492492492492;
      else
        v29 = v25;
      v30 = (char *)sub_1D4BB6310(v29);
      v31 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v30[56 * v24];
      v33 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v30[56 * v32];
      v34 = 56 * ((56 * v26 - 56) / 0x38) + 56;
      bzero(v31, v34);
      v35 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v31 + v34);
      v37 = self->fieldTokenToFieldProperties.__begin_;
      v36 = self->fieldTokenToFieldProperties.__end_;
      if (v36 != v37)
      {
        do
        {
          v38 = *(_OWORD *)((char *)v36 - 56);
          v39 = *(_OWORD *)((char *)v36 - 40);
          v40 = *(_OWORD *)((char *)v36 - 24);
          *((_QWORD *)v31 - 1) = *((_QWORD *)v36 - 1);
          *(_OWORD *)((char *)v31 - 24) = v40;
          *(_OWORD *)((char *)v31 - 40) = v39;
          *(_OWORD *)((char *)v31 - 56) = v38;
          v31 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v31 - 56);
          v36 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v36 - 56);
        }
        while (v36 != v37);
        v36 = self->fieldTokenToFieldProperties.__begin_;
      }
      self->fieldTokenToFieldProperties.__begin_ = v31;
      self->fieldTokenToFieldProperties.__end_ = v35;
      self->fieldTokenToFieldProperties.__end_cap_.__value_ = v33;
      if (v36)
        operator delete(v36);
    }
  }
  *((_BYTE *)self->fieldTokenToFieldProperties.__begin_ + 56 * v6) = 1;
  return v6;
}

- (unint64_t)nextIdentifier
{
  return self->_nextIdentifier;
}

- (void)setNextIdentifier:(unint64_t)a3
{
  self->_nextIdentifier = a3;
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v4;
  unint64_t *v5;

  begin = self->fieldTokenToFieldProperties.__begin_;
  if (begin)
  {
    self->fieldTokenToFieldProperties.__end_ = begin;
    operator delete(begin);
  }
  if (self->structTokenToFieldTokens.__begin_)
  {
    sub_1D4B28B58((uint64_t *)&self->structTokenToFieldTokens);
    operator delete(self->structTokenToFieldTokens.__begin_);
  }
  v4 = self->structTokenToStructProperties.__begin_;
  if (v4)
  {
    self->structTokenToStructProperties.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->structTokens.__begin_;
  if (v5)
  {
    self->structTokens.__end_ = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
