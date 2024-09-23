@implementation PKInputPointExtraLatencyFilter

- (void)addInputPoint:(id *)a3
{
  unint64_t numFramesExtraLatency;
  $78FB54F4A6B442EA15B736438C71FAD1 **p_inputPoints;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  unint64_t v9;
  $78FB54F4A6B442EA15B736438C71FAD1 *v10;
  int64_t v11;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  $9076B28992D74D3AA2059476C2B9E2A9 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  $9076B28992D74D3AA2059476C2B9E2A9 *v24;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v25;
  $9076B28992D74D3AA2059476C2B9E2A9 var0;
  $9076B28992D74D3AA2059476C2B9E2A9 v27;
  $9076B28992D74D3AA2059476C2B9E2A9 v28;
  $9076B28992D74D3AA2059476C2B9E2A9 v29;
  $9076B28992D74D3AA2059476C2B9E2A9 v30;
  $9076B28992D74D3AA2059476C2B9E2A9 v31;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v32;
  $78FB54F4A6B442EA15B736438C71FAD1 *v33;
  $9076B28992D74D3AA2059476C2B9E2A9 v34;
  $9076B28992D74D3AA2059476C2B9E2A9 v35;
  $9076B28992D74D3AA2059476C2B9E2A9 v36;
  $9076B28992D74D3AA2059476C2B9E2A9 v37;
  $9076B28992D74D3AA2059476C2B9E2A9 v38;
  $9076B28992D74D3AA2059476C2B9E2A9 v39;

  if (self)
  {
    ++self->super._numInputPoints;
    numFramesExtraLatency = self->_numFramesExtraLatency;
    if (numFramesExtraLatency)
    {
      p_inputPoints = ($78FB54F4A6B442EA15B736438C71FAD1 **)&self->_inputPoints;
      begin = self->_inputPoints.__begin_;
      end = self->_inputPoints.__end_;
      v9 = (end - begin) >> 7;
      if (v9 > numFramesExtraLatency)
      {
        v10 = ($78FB54F4A6B442EA15B736438C71FAD1 *)self->_inputPoints.__begin_;
        do
        {
          v11 = end - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 128);
          if (end != ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 128))
          {
            memmove(begin, (char *)begin + 128, end - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 128));
            v10 = *p_inputPoints;
          }
          end = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + v11);
          self->_inputPoints.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + v11);
          v9 = (($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + v11) - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v10) >> 7;
          begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v10;
        }
        while (v9 > self->_numFramesExtraLatency);
        begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v10;
      }
      value = self->_inputPoints.__end_cap_.__value_;
      if (end >= value)
      {
        v20 = v9 + 1;
        if ((v9 + 1) >> 57)
          std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
        v21 = value - begin;
        if (v21 >> 6 > v20)
          v20 = v21 >> 6;
        if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFF80)
          v22 = 0x1FFFFFFFFFFFFFFLL;
        else
          v22 = v20;
        if (v22)
          v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKInputPoint>>((uint64_t)&self->_inputPoints.__end_cap_, v22);
        else
          v23 = 0;
        v24 = ($9076B28992D74D3AA2059476C2B9E2A9 *)&v23[128 * v9];
        v25 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v23[128 * v22];
        var0 = a3->var0;
        v27 = *($9076B28992D74D3AA2059476C2B9E2A9 *)&a3->var1;
        v28 = *($9076B28992D74D3AA2059476C2B9E2A9 *)&a3->var5;
        v24[2] = *($9076B28992D74D3AA2059476C2B9E2A9 *)&a3->var3;
        v24[3] = v28;
        *v24 = var0;
        v24[1] = v27;
        v29 = *($9076B28992D74D3AA2059476C2B9E2A9 *)&a3->var7;
        v30 = *($9076B28992D74D3AA2059476C2B9E2A9 *)&a3->var9;
        v31 = *($9076B28992D74D3AA2059476C2B9E2A9 *)&a3->var13;
        v24[6] = *($9076B28992D74D3AA2059476C2B9E2A9 *)&a3->var11;
        v24[7] = v31;
        v24[4] = v29;
        v24[5] = v30;
        v19 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v24[8];
        v33 = *p_inputPoints;
        v32 = self->_inputPoints.__end_;
        if (v32 != ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)*p_inputPoints)
        {
          do
          {
            v34 = *(($9076B28992D74D3AA2059476C2B9E2A9 *)v32 - 8);
            v35 = *(($9076B28992D74D3AA2059476C2B9E2A9 *)v32 - 7);
            v36 = *(($9076B28992D74D3AA2059476C2B9E2A9 *)v32 - 5);
            v24[-6] = *(($9076B28992D74D3AA2059476C2B9E2A9 *)v32 - 6);
            v24[-5] = v36;
            v24[-8] = v34;
            v24[-7] = v35;
            v37 = *(($9076B28992D74D3AA2059476C2B9E2A9 *)v32 - 4);
            v38 = *(($9076B28992D74D3AA2059476C2B9E2A9 *)v32 - 3);
            v39 = *(($9076B28992D74D3AA2059476C2B9E2A9 *)v32 - 1);
            v24[-2] = *(($9076B28992D74D3AA2059476C2B9E2A9 *)v32 - 2);
            v24[-1] = v39;
            v24[-4] = v37;
            v24[-3] = v38;
            v24 -= 8;
            v32 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v32 - 128);
          }
          while (v32 != ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v33);
          v32 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)*p_inputPoints;
        }
        *p_inputPoints = ($78FB54F4A6B442EA15B736438C71FAD1 *)v24;
        self->_inputPoints.__end_ = v19;
        self->_inputPoints.__end_cap_.__value_ = v25;
        if (v32)
          operator delete(v32);
      }
      else
      {
        v13 = a3->var0;
        v14 = *(_OWORD *)&a3->var1;
        v15 = *(_OWORD *)&a3->var5;
        *((_OWORD *)end + 2) = *(_OWORD *)&a3->var3;
        *((_OWORD *)end + 3) = v15;
        *($9076B28992D74D3AA2059476C2B9E2A9 *)end = v13;
        *((_OWORD *)end + 1) = v14;
        v16 = *(_OWORD *)&a3->var7;
        v17 = *(_OWORD *)&a3->var9;
        v18 = *(_OWORD *)&a3->var13;
        *((_OWORD *)end + 6) = *(_OWORD *)&a3->var11;
        *((_OWORD *)end + 7) = v18;
        *((_OWORD *)end + 4) = v16;
        *((_OWORD *)end + 5) = v17;
        v19 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 128);
      }
      self->_inputPoints.__end_ = v19;
      a3 = *p_inputPoints;
    }
    memmove(&self->super._filteredPoint, a3, 0x80uLL);
  }
}

- (void).cxx_destruct
{
  vector<PKInputPoint, std::allocator<PKInputPoint>> *p_inputPoints;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  p_inputPoints = &self->_inputPoints;
  begin = self->_inputPoints.__begin_;
  if (begin)
  {
    p_inputPoints->__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 20) = 0;
  *((_QWORD *)self + 21) = 0;
  *((_QWORD *)self + 19) = 0;
  return self;
}

@end
