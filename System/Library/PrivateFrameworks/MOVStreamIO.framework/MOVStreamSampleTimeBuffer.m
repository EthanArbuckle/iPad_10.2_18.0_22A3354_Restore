@implementation MOVStreamSampleTimeBuffer

- (MOVStreamSampleTimeBuffer)initWithCapacity:(unint64_t)a3
{
  MOVStreamSampleTimeBuffer *v4;
  MOVStreamSampleTimeBuffer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MOVStreamSampleTimeBuffer;
  v4 = -[MOVStreamSampleTimeBuffer init](&v7, sel_init);
  v5 = v4;
  if (v4)
    std::vector<CMTime>::reserve((void **)&v4->_times.__begin_, 100 * (a3 / 0x64) + 100);
  return v5;
}

- (MOVStreamSampleTimeBuffer)init
{
  return -[MOVStreamSampleTimeBuffer initWithCapacity:](self, "initWithCapacity:", 100);
}

- (id)description
{
  void *v3;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  unint64_t v6;
  CMTimeEpoch v7;
  void *v8;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CMTime time;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", 4);
  begin = self->_times.__begin_;
  end = self->_times.__end_;
  if (begin == end)
  {
    v9 = self->_times.__begin_;
  }
  else
  {
    v6 = 1;
    do
    {
      if (v6 != 1)
      {
        objc_msgSend(v3, "appendString:", CFSTR(", "));
        if (v6 > 4)
          break;
      }
      v7 = *((_QWORD *)begin + 2);
      *(_OWORD *)&time.value = *(_OWORD *)begin;
      time.epoch = v7;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CMTimeGetSeconds(&time));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v8);

      begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 24);
      ++v6;
    }
    while (begin != end);
    begin = self->_times.__begin_;
    v9 = self->_times.__end_;
  }
  -[MOVStreamSampleTimeBuffer name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    -[MOVStreamSampleTimeBuffer name](self, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR(" name=%@"), v12);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = &stru_24CA45E28;
  }

  v14 = (void *)MEMORY[0x24BDD16A8];
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0xAAAAAAAAAAAAAAABLL * ((v9 - begin) >> 3);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: %p%@ sampleCount=%@ samples=[%@"), v16, self, v13, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17 < 5)
  {
    objc_msgSend(v20, "appendString:", CFSTR("]>"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v17 - 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "appendFormat:", CFSTR("... and %@ more]>"), v21);

  }
  v22 = (void *)objc_msgSend(v20, "copy");

  return v22;
}

- (void)appendTime:(id *)a3
{
  __compressed_pair<CMTime *, std::allocator<CMTime>> *p_end_cap;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v6;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v8;
  __int128 v9;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **p_value;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v19;
  __int128 v20;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  __int128 v23;

  value = self->_times.__end_cap_.__value_;
  p_end_cap = &self->_times.__end_cap_;
  v6 = value;
  v8 = p_end_cap[-1].__value_;
  if (v8 >= value)
  {
    p_value = &p_end_cap[-2].__value_;
    v12 = p_end_cap[-2].__value_;
    v13 = 0xAAAAAAAAAAAAAAABLL * ((v8 - v12) >> 3);
    v14 = v13 + 1;
    if (v13 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<CMTime>::__throw_length_error[abi:ne180100]();
    v15 = 0xAAAAAAAAAAAAAAABLL * ((v6 - v12) >> 3);
    if (2 * v15 > v14)
      v14 = 2 * v15;
    if (v15 >= 0x555555555555555)
      v16 = 0xAAAAAAAAAAAAAAALL;
    else
      v16 = v14;
    if (v16)
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CMTime>>((uint64_t)p_end_cap, v16);
    else
      v17 = 0;
    v18 = &v17[24 * v13];
    v19 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v17[24 * v16];
    v20 = *(_OWORD *)&a3->var0;
    *((_QWORD *)v18 + 2) = a3->var3;
    *(_OWORD *)v18 = v20;
    v10 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v18 + 24);
    begin = self->_times.__begin_;
    end = self->_times.__end_;
    if (end != begin)
    {
      do
      {
        v23 = *(_OWORD *)((char *)end - 24);
        *((_QWORD *)v18 - 1) = *((_QWORD *)end - 1);
        *(_OWORD *)(v18 - 24) = v23;
        v18 -= 24;
        end = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end - 24);
      }
      while (end != begin);
      end = *p_value;
    }
    self->_times.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v18;
    self->_times.__end_ = v10;
    self->_times.__end_cap_.__value_ = v19;
    if (end)
      operator delete(end);
  }
  else
  {
    v9 = *(_OWORD *)&a3->var0;
    *((_QWORD *)v8 + 2) = a3->var3;
    *(_OWORD *)v8 = v9;
    v10 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v8 + 24);
  }
  self->_times.__end_ = v10;
}

- (id)timeline
{
  return -[MOVStreamSampleTimeList initWithTimes:]([MOVStreamSampleTimeList alloc], "initWithTimes:", &self->_times);
}

- (BOOL)isEmpty
{
  return self->_times.__begin_ == self->_times.__end_;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  objc_storeStrong((id *)&self->_name, 0);
  begin = self->_times.__begin_;
  if (begin)
  {
    self->_times.__end_ = begin;
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
