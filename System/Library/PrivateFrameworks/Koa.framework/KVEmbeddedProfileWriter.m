@implementation KVEmbeddedProfileWriter

- (KVEmbeddedProfileWriter)initWithOutputStream:(id)a3
{
  id v5;
  KVEmbeddedProfileWriter *v6;
  KVEmbeddedProfileWriter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KVEmbeddedProfileWriter;
  v6 = -[KVEmbeddedProfileWriter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_stream, a3);

  return v7;
}

- (BOOL)startProfile:(id)a3 error:(id *)a4
{
  objc_storeStrong((id *)&self->_profileInfo, a3);
  return 1;
}

- (BOOL)startDataset:(id)a3 error:(id *)a4
{
  objc_storeStrong((id *)&self->_datasetInfo, a3);
  return 1;
}

- (BOOL)addItem:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const void *v24;
  unsigned int v25;
  char *buf;
  char *cur;
  unint64_t reserved;
  int v29;
  int v30;
  char *value;
  char *end;
  void *v33;
  char *begin;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  char *v40;
  int v41;
  _BYTE *v43;
  _BYTE *v44;
  uint64_t v45;

  v5 = a3;
  objc_msgSend_buffer(v5, v6, v7, v8);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = (const void *)objc_msgSend_bytes(v9, v10, v11, v12);
  v14 = objc_retainAutorelease(v9);
  v18 = objc_msgSend_bytes(v14, v15, v16, v17);
  v22 = objc_msgSend_length(v14, v19, v20, v21);
  v43 = 0;
  v44 = 0;
  v45 = 0;
  sub_1B7106F0C(&v43, v13, v18 + v22, v18 + v22 - (_QWORD)v13);
  v23 = v43;
  if (v44 == v43)
    v24 = &unk_1EF151F58;
  else
    v24 = v43;
  v25 = sub_1B7106FA8((uint64_t *)&self->_fbb, v24, v44 - v43);
  if (v23)
    operator delete(v23);
  sub_1B70EB144((uint64_t)&self->_fbb);
  self->_fbb.nested = 1;
  buf = self->_fbb.buf_.buf_;
  cur = self->_fbb.buf_.cur_;
  reserved = self->_fbb.buf_.reserved_;
  sub_1B7107010(&self->_fbb, v25);
  v29 = sub_1B70EBC9C((uint64_t)&self->_fbb, (int)reserved - (int)cur + (int)buf);
  v30 = v29;
  end = (char *)self->_items.__end_;
  value = (char *)self->_items.__end_cap_.__value_;
  if (end >= value)
  {
    begin = (char *)self->_items.__begin_;
    v35 = (end - begin) >> 2;
    v36 = v35 + 1;
    if ((unint64_t)(v35 + 1) >> 62)
      sub_1B70F2EF4();
    v37 = value - begin;
    if (v37 >> 1 > v36)
      v36 = v37 >> 1;
    if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFFCLL)
      v38 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v38 = v36;
    if (v38)
    {
      if (v38 >> 62)
        sub_1B70F2F3C();
      v39 = (char *)operator new(4 * v38);
    }
    else
    {
      v39 = 0;
    }
    v40 = &v39[4 * v35];
    *(_DWORD *)v40 = v30;
    v33 = v40 + 4;
    while (end != begin)
    {
      v41 = *((_DWORD *)end - 1);
      end -= 4;
      *((_DWORD *)v40 - 1) = v41;
      v40 -= 4;
    }
    self->_items.__begin_ = v40;
    self->_items.__end_ = v33;
    self->_items.__end_cap_.__value_ = &v39[4 * v38];
    if (begin)
      operator delete(begin);
  }
  else
  {
    *(_DWORD *)end = v29;
    v33 = end + 4;
  }
  self->_items.__end_ = v33;

  return 1;
}

- (BOOL)finishDataset:(id *)a3
{
  uint64_t v3;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const void *v20;
  unsigned int v21;
  _BYTE *begin;
  _BYTE *end;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  int v29;
  unsigned int v30;
  int reserved;
  int cur;
  int buf;
  int v34;
  int v35;
  int v36;
  char *value;
  char *v38;
  void *v39;
  char *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;
  char *v46;
  int v47;
  _BYTE *v49;
  _BYTE *v50;
  uint64_t v51;

  objc_msgSend_buffer(self->_datasetInfo, a2, (uint64_t)a3, v3);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (const void *)objc_msgSend_bytes(v5, v6, v7, v8);
  v10 = objc_retainAutorelease(v5);
  v14 = objc_msgSend_bytes(v10, v11, v12, v13);
  v18 = objc_msgSend_length(v10, v15, v16, v17);
  v49 = 0;
  v50 = 0;
  v51 = 0;
  sub_1B7106F0C(&v49, v9, v14 + v18, v14 + v18 - (_QWORD)v9);
  v19 = v49;
  if (v50 == v49)
    v20 = &unk_1EF151F58;
  else
    v20 = v49;
  v21 = sub_1B7106FA8((uint64_t *)&self->_fbb, v20, v50 - v49);
  if (v19)
    operator delete(v19);
  begin = self->_items.__begin_;
  end = self->_items.__end_;
  v24 = end - begin;
  if (end == begin)
    v25 = (char *)&unk_1B7111A4C;
  else
    v25 = (char *)self->_items.__begin_;
  v26 = v24 >> 2;
  sub_1B70EBFE0((uint64_t)&self->_fbb, v24 >> 2, 4uLL);
  if (begin == end)
  {
    LODWORD(v26) = 0;
  }
  else
  {
    v27 = v25 - 4;
    v28 = v26;
    do
    {
      v29 = sub_1B70EB1A4(&self->_fbb, *(_DWORD *)&v27[4 * v28]);
      sub_1B70EB210((uint64_t)&self->_fbb, v29);
      --v28;
    }
    while (v28);
  }
  v30 = sub_1B70EC098((uint64_t)&self->_fbb, v26);
  self->_items.__end_ = self->_items.__begin_;
  sub_1B70EB144((uint64_t)&self->_fbb);
  self->_fbb.nested = 1;
  reserved = self->_fbb.buf_.reserved_;
  cur = (int)self->_fbb.buf_.cur_;
  buf = (int)self->_fbb.buf_.buf_;
  sub_1B7107010(&self->_fbb, v21);
  if (v30)
  {
    v34 = sub_1B70EB1A4(&self->_fbb, v30);
    sub_1B70EB018((unint64_t)&self->_fbb, 6, v34);
  }
  v35 = sub_1B70EBC9C((uint64_t)&self->_fbb, reserved - cur + buf);
  v36 = v35;
  v38 = (char *)self->_datasets.__end_;
  value = (char *)self->_datasets.__end_cap_.__value_;
  if (v38 >= value)
  {
    v40 = (char *)self->_datasets.__begin_;
    v41 = (v38 - v40) >> 2;
    v42 = v41 + 1;
    if ((unint64_t)(v41 + 1) >> 62)
      sub_1B70F2EF4();
    v43 = value - v40;
    if (v43 >> 1 > v42)
      v42 = v43 >> 1;
    if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFFCLL)
      v44 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v44 = v42;
    if (v44)
    {
      if (v44 >> 62)
        sub_1B70F2F3C();
      v45 = (char *)operator new(4 * v44);
    }
    else
    {
      v45 = 0;
    }
    v46 = &v45[4 * v41];
    *(_DWORD *)v46 = v36;
    v39 = v46 + 4;
    while (v38 != v40)
    {
      v47 = *((_DWORD *)v38 - 1);
      v38 -= 4;
      *((_DWORD *)v46 - 1) = v47;
      v46 -= 4;
    }
    self->_datasets.__begin_ = v46;
    self->_datasets.__end_ = v39;
    self->_datasets.__end_cap_.__value_ = &v45[4 * v44];
    if (v40)
      operator delete(v40);
  }
  else
  {
    *(_DWORD *)v38 = v35;
    v39 = v38 + 4;
  }
  self->_datasets.__end_ = v39;

  return 1;
}

- (BOOL)finishProfile:(id *)a3
{
  FlatBufferBuilder *p_fbb;
  _BYTE *begin;
  _BYTE *end;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSOutputStream *stream;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  unsigned int v34;

  p_fbb = &self->_fbb;
  begin = self->_datasets.__begin_;
  end = self->_datasets.__end_;
  v8 = (end - begin) >> 2;
  sub_1B70EBFE0((uint64_t)&self->_fbb, v8, 4uLL);
  if (end == begin)
  {
    LODWORD(v8) = 0;
  }
  else
  {
    v9 = begin - 4;
    v10 = v8;
    do
    {
      v11 = v10 - 1;
      v12 = sub_1B70EB1A4(p_fbb, *(_DWORD *)&v9[4 * v10]);
      sub_1B70EB210((uint64_t)p_fbb, v12);
      v10 = v11;
    }
    while (v11);
  }
  v34 = sub_1B70EC098((uint64_t)p_fbb, v8);
  self->_datasets.__end_ = self->_datasets.__begin_;
  sub_1B7106BCC((unint64_t)p_fbb, self->_profileInfo, &v34, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_length(v13, v14, v15, v16);
  stream = self->_stream;
  v19 = objc_retainAutorelease(v13);
  v23 = objc_msgSend_bytes(v19, v20, v21, v22);
  v27 = objc_msgSend_length(v19, v24, v25, v26);
  v31 = objc_msgSend_write_maxLength_(stream, v28, v23, v27);
  if (v17 != v31)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v29, (uint64_t)CFSTR("profile: %@"), v30, v19);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B7106D8C(a3, v32, self->_stream, 1u);

  }
  return v17 == v31;
}

- (void).cxx_destruct
{
  void *begin;
  void *v4;

  begin = self->_items.__begin_;
  if (begin)
  {
    self->_items.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_datasets.__begin_;
  if (v4)
  {
    self->_datasets.__end_ = v4;
    operator delete(v4);
  }
  sub_1B70ED4B4(&self->_fbb.buf_.allocator_);
  objc_storeStrong((id *)&self->_datasetInfo, 0);
  objc_storeStrong((id *)&self->_profileInfo, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_BYTE *)self + 40) = 0;
  *((_OWORD *)self + 3) = xmmword_1B7111340;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 1;
  *((_WORD *)self + 56) = 256;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *((_QWORD *)self + 21) = 0;
  return self;
}

@end
