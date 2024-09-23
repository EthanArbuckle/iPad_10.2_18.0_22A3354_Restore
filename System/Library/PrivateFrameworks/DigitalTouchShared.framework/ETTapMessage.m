@implementation ETTapMessage

+ (unsigned)messageType
{
  return 0;
}

- (ETTapMessage)init
{
  ETTapMessage *v2;
  ETTapMessage *v3;
  SKScene *preVisualizeScene;
  uint64_t v5;
  NSMutableArray *colors;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ETTapMessage;
  v2 = -[ETMessage init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    preVisualizeScene = v2->_preVisualizeScene;
    v2->_preVisualizeScene = 0;

    v3->_baseTime = -1.0;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = objc_claimAutoreleasedReturnValue();
  colors = v3->_colors;
  v3->_colors = (NSMutableArray *)v5;

  return v3;
}

- (ETTapMessage)initWithArchiveData:(id)a3
{
  ETTapMessage *v3;
  ETTapMessage *v4;
  ETPTap *v5;
  ETPTap *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  __int128 v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSMutableArray *colors;
  unint64_t v17;
  void **p_begin;
  unsigned __int16 *v19;
  unsigned int v20;
  unsigned int v21;
  unint64_t value;
  double *end;
  double v24;
  double *v25;
  double *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  double *v32;
  uint64_t v33;
  double v34;
  double v35;
  void **v36;
  double *p_x;
  unint64_t v38;
  double *v39;
  double *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;
  double *v46;
  double *v47;
  NSMutableArray *v48;
  void *v49;
  ETTapMessage *v50;
  unint64_t v52;
  ETPTap *v53;
  id v54;
  id v55;
  unint64_t v56;
  id v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  objc_super v64;
  uint8_t buf[4];
  unint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v64.receiver = self;
  v64.super_class = (Class)ETTapMessage;
  v62 = a3;
  v3 = -[ETMessage initWithArchiveData:](&v64, sel_initWithArchiveData_);
  v4 = v3;
  if (!v3)
    goto LABEL_57;
  v3->_noiseFieldLock._os_unfair_lock_opaque = 0;
  v5 = -[ETPTap initWithData:]([ETPTap alloc], "initWithData:", v62);
  v6 = v5;
  if (!v5)
    goto LABEL_58;
  v53 = v5;
  -[ETPTap timeDeltas](v5, "timeDeltas");
  v60 = (id)objc_claimAutoreleasedReturnValue();
  -[ETPTap points](v6, "points");
  v54 = (id)objc_claimAutoreleasedReturnValue();
  -[ETPTap colors](v6, "colors");
  v55 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v60, "length");
  v8 = objc_msgSend(v54, "length");
  v9 = objc_msgSend(v55, "length");
  v59 = objc_retainAutorelease(v60);
  v63 = objc_msgSend(v59, "bytes");
  v58 = objc_retainAutorelease(v54);
  v10 = objc_msgSend(v58, "bytes");
  v57 = objc_retainAutorelease(v55);
  v61 = objc_msgSend(v57, "bytes");
  v56 = v7 >> 1;
  v52 = v8 >> 2;
  if (v7 >> 1 == v8 >> 2)
  {
    if (v7 < 0x2A)
    {
      v13 = v7 >> 1;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v66 = v56;
          _os_log_impl(&dword_22C68B000, v12, OS_LOG_TYPE_INFO, "itemCount (%zu) higher than the limit", buf, 0xCu);
        }

      }
      v13 = 20;
    }
    if (v9 >= 8 && !v4->_colors)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v15 = objc_claimAutoreleasedReturnValue();
      colors = v4->_colors;
      v4->_colors = (NSMutableArray *)v15;

    }
    if (v13)
    {
      v17 = 0;
      p_begin = (void **)&v4->_times.__begin_;
      do
      {
        v19 = (unsigned __int16 *)(v10 + 4 * v17);
        v20 = *v19;
        LOWORD(v11) = *(_WORD *)(v63 + 2 * v17);
        v21 = v19[1];
        end = v4->_times.__end_;
        value = (unint64_t)v4->_times.__end_cap_.__value_;
        v24 = (double)(unint64_t)v11 / 1000.0;
        if ((unint64_t)end >= value)
        {
          v26 = (double *)*p_begin;
          v27 = ((char *)end - (_BYTE *)*p_begin) >> 3;
          v28 = v27 + 1;
          if ((unint64_t)(v27 + 1) >> 61)
            _ZNKSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE20__throw_length_errorB8ne180100Ev();
          v29 = value - (_QWORD)v26;
          if (v29 >> 2 > v28)
            v28 = v29 >> 2;
          if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8)
            v30 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v30 = v28;
          if (v30)
          {
            v31 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v4->_times.__end_cap_, v30);
            v26 = (double *)*p_begin;
            end = v4->_times.__end_;
          }
          else
          {
            v31 = 0;
          }
          v32 = (double *)&v31[8 * v27];
          *v32 = v24;
          v25 = v32 + 1;
          while (end != v26)
          {
            v33 = *((_QWORD *)end-- - 1);
            *((_QWORD *)v32-- - 1) = v33;
          }
          *p_begin = v32;
          v4->_times.__end_ = v25;
          v4->_times.__end_cap_.__value_ = (double *)&v31[8 * v30];
          if (v26)
            operator delete(v26);
        }
        else
        {
          *end = v24;
          v25 = end + 1;
        }
        v4->_times.__end_ = v25;
        v34 = (double)v20 / 32767.0 + -1.0;
        *(double *)&v11 = (double)v21 / 32767.0;
        v35 = *(double *)&v11 + -1.0;
        v36 = (void **)&v4->_points.__begin_;
        p_x = &v4->_points.__end_->x;
        v38 = (unint64_t)v4->_points.__end_cap_.__value_;
        if ((unint64_t)p_x >= v38)
        {
          v40 = (double *)*v36;
          v41 = ((char *)p_x - (_BYTE *)*v36) >> 4;
          v42 = v41 + 1;
          if ((unint64_t)(v41 + 1) >> 60)
            _ZNKSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE20__throw_length_errorB8ne180100Ev();
          v43 = v38 - (_QWORD)v40;
          if (v43 >> 3 > v42)
            v42 = v43 >> 3;
          if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFF0)
            v44 = 0xFFFFFFFFFFFFFFFLL;
          else
            v44 = v42;
          if (v44)
          {
            v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v4->_points.__end_cap_, v44);
            v40 = (double *)*v36;
            p_x = &v4->_points.__end_->x;
          }
          else
          {
            v45 = 0;
          }
          v46 = (double *)&v45[16 * v41];
          *v46 = v34;
          v46[1] = v35;
          v47 = v46;
          if (p_x != v40)
          {
            do
            {
              v11 = *((_OWORD *)p_x - 1);
              *((_OWORD *)v47 - 1) = v11;
              v47 -= 2;
              p_x -= 2;
            }
            while (p_x != v40);
            v40 = (double *)*v36;
          }
          v39 = v46 + 2;
          *v36 = v47;
          v4->_points.__end_ = (CGPoint *)(v46 + 2);
          v4->_points.__end_cap_.__value_ = (CGPoint *)&v45[16 * v44];
          if (v40)
            operator delete(v40);
        }
        else
        {
          *p_x = v34;
          p_x[1] = v35;
          v39 = p_x + 2;
        }
        v4->_points.__end_ = (CGPoint *)v39;
        if (v9 >= 8 && v17 < v9 >> 2)
        {
          v48 = v4->_colors;
          objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", (double)*(_DWORD *)(v61 + 4 * v17) / 255.0, (double)BYTE1(*(_DWORD *)(v61 + 4 * v17)) / 255.0, (double)BYTE2(*(_DWORD *)(v61 + 4 * v17)) / 255.0, (double)HIBYTE(*(_DWORD *)(v61 + 4 * v17)) / 255.0);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v48, "addObject:", v49);

        }
        ++v17;
      }
      while (v17 != v13);
    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C68B000, v14, OS_LOG_TYPE_INFO, "Corrupt tap message encountered", buf, 2u);
    }

  }
  if (v56 == v52)
LABEL_57:
    v50 = v4;
  else
LABEL_58:
    v50 = 0;

  return v50;
}

- (id)archiveData
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  CGPoint *v13;
  double y;
  float v15;
  float v16;
  _WORD *v17;
  void *v18;
  float v19;
  unsigned int v20;
  float v21;
  unsigned int v22;
  float v23;
  unsigned int v24;
  float v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  ETPTap *v32;
  unint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;

  v32 = objc_alloc_init(ETPTap);
  v33 = -[ETTapMessage tapCount](self, "tapCount");
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setLength:", 2 * v33, v3);
  objc_msgSend(v28, "setLength:", 4 * v33);
  objc_msgSend(v3, "setLength:", 4 * v33);
  v4 = objc_retainAutorelease(v29);
  v5 = objc_msgSend(v4, "mutableBytes");
  v6 = objc_retainAutorelease(v28);
  v7 = objc_msgSend(v6, "mutableBytes");
  v8 = objc_retainAutorelease(v3);
  v9 = objc_msgSend(v8, "mutableBytes");
  v30 = v8;
  v31 = v4;
  if (v33)
  {
    v10 = v9;
    v11 = 0;
    for (i = 0; i != v33; ++i)
    {
      *(_WORD *)(v5 + 2 * i) = llround(self->_times.__begin_[i] * 1000.0);
      v13 = &self->_points.__begin_[v11];
      y = v13->y;
      v15 = (v13->x + 1.0) * 32767.0;
      LOWORD(v13) = llroundf(v15);
      v16 = (y + 1.0) * 32767.0;
      v17 = (_WORD *)(v7 + 1 * v11);
      *v17 = (_WORD)v13;
      v17[1] = llroundf(v16);
      -[NSMutableArray objectAtIndexedSubscript:](self->_colors, "objectAtIndexedSubscript:", i);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0.0;
      v37 = 0.0;
      v34 = 0.0;
      v35 = 0.0;
      objc_msgSend(v18, "getRed:green:blue:alpha:", &v37, &v36, &v35, &v34);
      v19 = v37 * 255.0;
      v20 = llroundf(v19);
      v21 = v36 * 255.0;
      v22 = llroundf(v21);
      v23 = v35 * 255.0;
      v24 = llroundf(v23);
      v25 = v34 * 255.0;
      *(_DWORD *)(v10 + 4 * i) = (v24 << 16) | (llroundf(v25) << 24) | (v22 << 8) | v20;

      ++v11;
    }
  }
  -[ETPTap setTimeDeltas:](v32, "setTimeDeltas:", v31);
  -[ETPTap setPoints:](v32, "setPoints:", v6);
  -[ETPTap setColors:](v32, "setColors:", v30);
  -[ETPTap data](v32, "data");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (unint64_t)tapCount
{
  int64_t v2;
  CGPoint *end;

  v2 = (char *)self->_times.__end_ - (char *)self->_times.__begin_;
  end = self->_points.__end_;
  if (end - self->_points.__begin_ >= (unint64_t)(v2 >> 3))
    return v2 >> 3;
  else
    return end - self->_points.__begin_;
}

- (CGPoint)pointAtIndex:(unint64_t)a3
{
  CGPoint *v5;
  double x;
  double y;
  id v8;
  CGPoint result;

  if (-[ETTapMessage tapCount](self, "tapCount") < a3)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("tapIndex > number of taps"), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  v5 = &self->_points.__begin_[a3];
  x = v5->x;
  y = v5->y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)timeDeltaAtIndex:(unint64_t)a3
{
  id v6;

  if (-[ETTapMessage tapCount](self, "tapCount") < a3)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("tapIndex > number of taps"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  return self->_times.__begin_[a3];
}

- (void)addTapAtPoint:(CGPoint)a3 time:(double)a4 color:(id)a5
{
  double y;
  double x;
  id v9;
  double baseTime;
  double v11;
  vector<CGPoint, std::allocator<CGPoint>> *p_points;
  CGPoint *end;
  CGPoint *value;
  CGPoint *v15;
  CGPoint *begin;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  CGPoint *v22;
  CGPoint *v23;
  vector<double, std::allocator<double>> *p_times;
  double *v25;
  double *v26;
  double *v27;
  double *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  double *v34;
  double *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;

  y = a3.y;
  x = a3.x;
  v42 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  -[ETMessage setColor:](self, "setColor:", v9);
  baseTime = self->_baseTime;
  if (baseTime >= 0.0)
    v11 = a4 - baseTime;
  else
    v11 = 0.0;
  self->_baseTime = a4;
  p_points = &self->_points;
  end = self->_points.__end_;
  value = self->_points.__end_cap_.__value_;
  if (end >= value)
  {
    begin = p_points->__begin_;
    v17 = end - p_points->__begin_;
    v18 = v17 + 1;
    if ((unint64_t)(v17 + 1) >> 60)
      _ZNKSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE20__throw_length_errorB8ne180100Ev();
    v19 = (char *)value - (char *)begin;
    if (v19 >> 3 > v18)
      v18 = v19 >> 3;
    if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0)
      v20 = 0xFFFFFFFFFFFFFFFLL;
    else
      v20 = v18;
    if (v20)
    {
      v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&self->_points.__end_cap_, v20);
      begin = p_points->__begin_;
      end = self->_points.__end_;
    }
    else
    {
      v21 = 0;
    }
    v22 = (CGPoint *)&v21[16 * v17];
    v23 = (CGPoint *)&v21[16 * v20];
    v22->x = x;
    v22->y = y;
    v15 = v22 + 1;
    if (end != begin)
    {
      do
      {
        v22[-1] = end[-1];
        --v22;
        --end;
      }
      while (end != begin);
      begin = p_points->__begin_;
    }
    p_points->__begin_ = v22;
    self->_points.__end_ = v15;
    self->_points.__end_cap_.__value_ = v23;
    if (begin)
      operator delete(begin);
  }
  else
  {
    end->x = x;
    end->y = y;
    v15 = end + 1;
  }
  self->_points.__end_ = v15;
  p_times = &self->_times;
  v25 = self->_times.__end_;
  v26 = self->_times.__end_cap_.__value_;
  if (v25 >= v26)
  {
    v28 = p_times->__begin_;
    v29 = v25 - p_times->__begin_;
    v30 = v29 + 1;
    if ((unint64_t)(v29 + 1) >> 61)
      _ZNKSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE20__throw_length_errorB8ne180100Ev();
    v31 = (char *)v26 - (char *)v28;
    if (v31 >> 2 > v30)
      v30 = v31 >> 2;
    if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFF8)
      v32 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v32 = v30;
    if (v32)
    {
      v33 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&self->_times.__end_cap_, v32);
      v28 = p_times->__begin_;
      v25 = self->_times.__end_;
    }
    else
    {
      v33 = 0;
    }
    v34 = (double *)&v33[8 * v29];
    v35 = (double *)&v33[8 * v32];
    *v34 = v11;
    v27 = v34 + 1;
    while (v25 != v28)
    {
      v36 = *((_QWORD *)v25-- - 1);
      *((_QWORD *)v34-- - 1) = v36;
    }
    p_times->__begin_ = v34;
    self->_times.__end_ = v27;
    self->_times.__end_cap_.__value_ = v35;
    if (v28)
      operator delete(v28);
  }
  else
  {
    *v25 = v11;
    v27 = v25 + 1;
  }
  self->_times.__end_ = v27;
  -[NSMutableArray addObject:](self->_colors, "addObject:", v9);
  if (self->_preVisualizeScene)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        +[ETUtility dateFormatWithMilliseconds:](ETUtility, "dateFormatWithMilliseconds:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 138412290;
        v41 = v39;
        _os_log_impl(&dword_22C68B000, v37, OS_LOG_TYPE_INFO, "(%@) ETTapMessage playing tap haptic", (uint8_t *)&v40, 0xCu);

      }
    }
    -[ETTapMessage _displayInScene:point:color:filled:withWisp:](self, "_displayInScene:point:color:filled:withWisp:", self->_preVisualizeScene, v9, 0, 1, x, y);
  }

}

- (BOOL)reachedSizeLimit
{
  return -[ETTapMessage tapCount](self, "tapCount") > 0x13;
}

- (id)messageTypeAsString
{
  return CFSTR("Tap");
}

- (void)preVisualizeInScene:(id)a3
{
  objc_storeStrong((id *)&self->_preVisualizeScene, a3);
}

- (void)displayInScene:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableArray *colors;
  uint64_t v15;
  id WeakRetained;
  _BOOL8 v17;
  void *v18;
  id SKActionClass;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id from;
  _QWORD v34[5];
  id v35;
  id v36[4];
  int v37;
  id location[2];

  v28 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, v28);
  v5 = -[NSMutableArray count](self->_colors, "count");
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    -[ETMessage color](self, "color");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  for (i = 0; -[ETTapMessage tapCount](self, "tapCount") > i; ++i)
  {
    -[ETTapMessage pointAtIndex:](self, "pointAtIndex:", i);
    v9 = v8;
    v11 = v10;
    -[ETTapMessage timeDeltaAtIndex:](self, "timeDeltaAtIndex:", i);
    v13 = v12;
    if (v5)
    {
      colors = self->_colors;
      if (v5 <= i)
        -[NSMutableArray objectAtIndexedSubscript:](colors, "objectAtIndexedSubscript:", v5 - 1);
      else
        -[NSMutableArray objectAtIndexedSubscript:](colors, "objectAtIndexedSubscript:", i);
      v15 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v15;
    }
    if (-[ETMessage isRenderingOffscreen](self, "isRenderingOffscreen"))
    {
      WeakRetained = objc_loadWeakRetained(location);
      v17 = *(double *)&v13 > 0.5 || i == -[ETTapMessage tapCount](self, "tapCount") - 1;
      -[ETTapMessage _displayInScene:point:color:filled:withWisp:](self, "_displayInScene:point:color:filled:withWisp:", WeakRetained, v6, 1, v17, *(double *)&v9, *(double *)&v11);

    }
    else
    {
      objc_msgSend(getSKActionClass(), "waitForDuration:", *(double *)&v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v18);

      SKActionClass = getSKActionClass();
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __31__ETTapMessage_displayInScene___block_invoke;
      v34[3] = &unk_24F6E6FA8;
      v34[4] = self;
      objc_copyWeak(v36, location);
      v36[1] = v9;
      v36[2] = v11;
      v35 = v6;
      v36[3] = v13;
      v37 = i;
      objc_msgSend(SKActionClass, "runBlock:", v34);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v20);

      objc_destroyWeak(v36);
    }
  }
  if (!-[ETMessage isRenderingOffscreen](self, "isRenderingOffscreen"))
  {
    objc_initWeak(&from, self);
    objc_msgSend(getSKActionClass(), "waitForDuration:", 1.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v21);

    v22 = getSKActionClass();
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __31__ETTapMessage_displayInScene___block_invoke_12;
    v31[3] = &unk_24F6E6FD0;
    objc_copyWeak(&v32, &from);
    objc_msgSend(v22, "runBlock:queue:", v31, MEMORY[0x24BDAC9B8]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v23);

    objc_msgSend(getSKActionClass(), "waitForDuration:", 1.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v24);

    v25 = getSKActionClass();
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __31__ETTapMessage_displayInScene___block_invoke_2;
    v29[3] = &unk_24F6E6FD0;
    objc_copyWeak(&v30, &from);
    objc_msgSend(v25, "runBlock:queue:", v29, MEMORY[0x24BDAC9B8]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v26);

    objc_msgSend(getSKActionClass(), "sequence:", v4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "runAction:", v27);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&from);
  }

  objc_destroyWeak(location);
}

void __31__ETTapMessage_displayInScene___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  double v7;
  double v8;
  uint64_t v9;
  _BOOL8 v10;
  uint64_t v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      +[ETUtility dateFormatWithMilliseconds:](ETUtility, "dateFormatWithMilliseconds:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_22C68B000, v2, OS_LOG_TYPE_INFO, "(%@) ETTapMessage playing tap haptic", (uint8_t *)&v12, 0xCu);

    }
  }
  v5 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = *(double *)(a1 + 56);
  v8 = *(double *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 40);
  if (*(double *)(a1 + 72) <= 0.5)
  {
    v11 = *(int *)(a1 + 80);
    v10 = objc_msgSend(*(id *)(a1 + 32), "tapCount") - 1 == v11;
  }
  else
  {
    v10 = 1;
  }
  objc_msgSend(v5, "_displayInScene:point:color:filled:withWisp:", WeakRetained, v9, 1, v10, v7, v8);

}

void __31__ETTapMessage_displayInScene___block_invoke_12(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "messageWillStopPlaying:", v3);

}

void __31__ETTapMessage_displayInScene___block_invoke_2(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "messageDidStopPlaying:", v3);

}

- (id)_animateCircleInner0:(double)a3 inner1:(double)a4 outer0:(double)a5 outer1:(double)a6 duration:(double)a7
{
  float v10;
  float v11;
  id SKActionClass;
  _QWORD v14[7];
  float v15;
  float v16;

  v10 = a4 - a3;
  v11 = a6 - a5;
  SKActionClass = getSKActionClass();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __67__ETTapMessage__animateCircleInner0_inner1_outer0_outer1_duration___block_invoke;
  v14[3] = &__block_descriptor_64_e19_v24__0__SKNode_8d16l;
  *(double *)&v14[4] = a7;
  *(double *)&v14[5] = a5;
  v15 = v11;
  v16 = v10;
  *(double *)&v14[6] = a3;
  objc_msgSend(SKActionClass, "customActionWithDuration:actionBlock:", v14, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __67__ETTapMessage__animateCircleInner0_inner1_outer0_outer1_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5;
  double v6;
  CGPath *CirclePath;
  id v8;

  v5 = a2;
  v6 = a3 / *(double *)(a1 + 32);
  v8 = v5;
  CirclePath = createCirclePath(*(double *)(a1 + 40) + *(float *)(a1 + 56) * v6, *(double *)(a1 + 48) + *(float *)(a1 + 60) * v6);
  objc_msgSend(v8, "setPath:", CirclePath);
  CGPathRelease(CirclePath);

}

- (void)_displayInScene:(id)a3 point:(CGPoint)a4 color:(id)a5 filled:(BOOL)a6 withWisp:(BOOL)a7
{
  double y;
  double x;
  double baseTime;
  NSObject *v13;
  void *v14;
  void *v15;
  SKFieldNode *noiseField;
  uint64_t v17;
  void *v18;
  id v19;
  SKFieldNode *v20;
  SKFieldNode *v21;
  double v22;
  void *v23;
  _BOOL4 v24;
  SKFieldNode *v25;
  id SKActionClass;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  NSBundle *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  unint64_t i;
  void *v51;
  void *v52;
  float v53;
  float v54;
  float v55;
  uint64_t v56;
  void *v57;
  void *v58;
  NSBundle *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t j;
  void *v69;
  void *v70;
  CGPath *CirclePath;
  id v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  CGPath *v95;
  id v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  int v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  BOOL v131;
  void *v132;
  _BOOL4 v133;
  void *v134;
  id v135;
  void *v136;
  id v137;
  id v138;
  void *v139;
  _QWORD v140[7];
  BOOL v141;
  _QWORD v142[4];
  double v143;
  double *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  _QWORD v158[3];
  _QWORD v159[3];
  _QWORD v160[4];
  _QWORD v161[2];
  _QWORD v162[2];
  _QWORD v163[2];
  _QWORD v164[3];
  _QWORD v165[3];
  _QWORD v166[4];
  _QWORD v167[2];
  void *v168;
  _QWORD v169[2];
  __int128 buf;
  uint64_t v171;
  void *v172;
  double *v173;
  uint64_t v174;

  v133 = a6;
  y = a4.y;
  x = a4.x;
  v174 = *MEMORY[0x24BDAC8D0];
  v138 = a3;
  v137 = a5;
  v142[0] = 0;
  v142[1] = v142;
  baseTime = self->_baseTime;
  v142[2] = 0x2020000000;
  *(double *)&v142[3] = baseTime;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[ETUtility dateFormatWithMilliseconds:](ETUtility, "dateFormatWithMilliseconds:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_22C68B000, v13, OS_LOG_TYPE_INFO, "(%@) ETTapMessage displaying tap in scene", (uint8_t *)&buf, 0xCu);

    }
  }
  os_unfair_lock_lock(&self->_noiseFieldLock);
  noiseField = self->_noiseField;
  v17 = MEMORY[0x24BDAC760];
  if (!noiseField)
  {
    v143 = 0.0;
    v144 = &v143;
    v145 = 0x2050000000;
    v18 = (void *)getSKFieldNodeClass(void)::softClass;
    v146 = getSKFieldNodeClass(void)::softClass;
    if (!getSKFieldNodeClass(void)::softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x24BDAC760];
      *((_QWORD *)&buf + 1) = 3221225472;
      v171 = (uint64_t)___ZL19getSKFieldNodeClassv_block_invoke;
      v172 = &unk_24F6E7080;
      v173 = &v143;
      ___ZL19getSKFieldNodeClassv_block_invoke((uint64_t)&buf);
      v18 = (void *)*((_QWORD *)v144 + 3);
    }
    v19 = objc_retainAutorelease(v18);
    _Block_object_dispose(&v143, 8);
    objc_msgSend(v19, "noiseFieldWithSmoothness:animationSpeed:", drand48() * 0.1 + 0.5, 60.0);
    v20 = (SKFieldNode *)objc_claimAutoreleasedReturnValue();
    v21 = self->_noiseField;
    self->_noiseField = v20;

    LODWORD(v22) = 1.0;
    -[SKFieldNode setStrength:](self->_noiseField, "setStrength:", v22);
    -[SKFieldNode setCategoryBitMask:](self->_noiseField, "setCategoryBitMask:", 2);
    noiseField = self->_noiseField;
  }
  -[SKFieldNode parent](noiseField, "parent");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23 == 0;

  if (v24)
    objc_msgSend(v138, "addChild:", self->_noiseField);
  v131 = -[ETMessage isRenderingOffscreen](self, "isRenderingOffscreen");
  if (!v131)
  {
    v25 = self->_noiseField;
    SKActionClass = getSKActionClass();
    objc_msgSend(getSKActionClass(), "waitForDuration:", 3.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v169[0] = v27;
    objc_msgSend(getSKActionClass(), "removeFromParent");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v169[1] = v28;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v169, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(SKActionClass, "sequence:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKFieldNode runAction:withKey:](v25, "runAction:withKey:", v30, CFSTR("removal"));

  }
  os_unfair_lock_unlock(&self->_noiseFieldLock);
  objc_msgSend(v138, "size");
  v32 = fmax(v31 / 156.0, 1.0);
  if (v32 <= 3.0)
    v33 = v32;
  else
    v33 = 3.0;
  objc_msgSend(getSKNodeClass(), "node");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "frame");
  v36 = v35;
  objc_msgSend(v138, "frame");
  objc_msgSend(v34, "setPosition:", x * v36 * 0.5, y * v37 * 0.5);
  objc_msgSend(v34, "setScale:", v33);
  objc_msgSend(v138, "addChild:", v34);
  objc_msgSend(getSKNodeClass(), "node");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addChild:", v136);
  v143 = 0.0;
  v144 = &v143;
  v145 = 0x2050000000;
  v38 = (void *)getSKShapeNodeClass(void)::softClass;
  v146 = getSKShapeNodeClass(void)::softClass;
  if (!getSKShapeNodeClass(void)::softClass)
  {
    *(_QWORD *)&buf = v17;
    *((_QWORD *)&buf + 1) = 3221225472;
    v171 = (uint64_t)___ZL19getSKShapeNodeClassv_block_invoke;
    v172 = &unk_24F6E7080;
    v173 = &v143;
    ___ZL19getSKShapeNodeClassv_block_invoke((uint64_t)&buf);
    v38 = (void *)*((_QWORD *)v144 + 3);
  }
  v39 = objc_retainAutorelease(v38);
  _Block_object_dispose(&v143, 8);
  objc_msgSend(v39, "node");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFillColor:", v137);
  objc_msgSend(v40, "setStrokeColor:", v137);
  objc_msgSend(v40, "setZPosition:", 1.0);
  objc_msgSend(v34, "addChild:", v40);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v171 = 0x2020000000;
  LODWORD(v172) = 0;
  v140[0] = v17;
  v140[1] = 3221225472;
  v140[2] = __60__ETTapMessage__displayInScene_point_color_filled_withWisp___block_invoke;
  v140[3] = &unk_24F6E7018;
  v140[4] = self;
  v140[5] = v142;
  v141 = a7;
  v140[6] = &buf;
  objc_msgSend(getSKActionClass(), "customActionWithDuration:actionBlock:", v140, 0.200000003);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getSKActionClass(), "customActionWithDuration:actionBlock:", &__block_literal_global_5, 0.0);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)_dots;
  if (!_dots)
  {
    ETFrameworkBundle();
    v42 = (NSBundle *)objc_claimAutoreleasedReturnValue();
    ET_SKSetResourceBundle(v42);

    objc_msgSend(getSKEmitterNodeClass(), "nodeWithFileNamed:", CFSTR("doodle_wisp_stroke"));
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = (void *)_dots;
    _dots = v43;

    v45 = (void *)objc_msgSend(objc_alloc((Class)getSKKeyframeSequenceClass()), "initWithKeyframeValues:times:", &unk_24F6F1210, &unk_24F6F1228);
    objc_msgSend(v45, "setInterpolationMode:", 2);
    objc_msgSend(v45, "setRepeatMode:", 1);
    objc_msgSend((id)_dots, "setParticleScaleSequence:", v45);
    objc_msgSend((id)_dots, "setZPosition:", -1.0);
    objc_msgSend((id)_dots, "setParticleSpeedRange:", 6.0);
    objc_msgSend((id)_dots, "setParticleSpeed:", 10.0);
    objc_msgSend((id)_dots, "setYAcceleration:", 0.0);
    objc_msgSend((id)_dots, "setXAcceleration:", 0.0);
    objc_msgSend((id)_dots, "setParticleLifetime:", 1.5);
    objc_msgSend((id)_dots, "setParticleLifetimeRange:", 0.5);
    objc_msgSend((id)_dots, "setDensityBased:", 0);
    objc_msgSend((id)_dots, "setParticleBirthRate:", 0.0);
    objc_msgSend((id)_dots, "setParticleDensity:", 1.0);
    objc_msgSend((id)_dots, "setEmissionAngleRange:", 6.28318531);
    objc_msgSend((id)_dots, "setEmissionDistance:", 29.75);
    objc_msgSend((id)_dots, "setEmissionDistanceRange:", 2.0);
    objc_msgSend((id)_dots, "setFieldBitMask:", 2);
    v46 = (void *)objc_msgSend(objc_alloc((Class)getSKKeyframeSequenceClass()), "initWithKeyframeValues:times:", &unk_24F6F1240, &unk_24F6F1258);
    objc_msgSend(v46, "setInterpolationMode:", 1);
    objc_msgSend((id)_dots, "setFieldInfluenceSequence:", v46);
    objc_msgSend((id)_dots, "setPosition:", 0.0, 0.0);

    v41 = (void *)_dots;
  }
  v47 = (id)objc_msgSend(v41, "copy");
  v48 = v137;
  v143 = 0.0;
  v156 = 0.0;
  v157 = 0.0;
  v155 = 0.0;
  v139 = v47;
  objc_msgSend(v48, "getRed:green:blue:alpha:", &v143, &v157, &v156, &v155);
  objc_msgSend(v47, "particleColorSequence");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    for (i = 0; objc_msgSend(v49, "count") > i; ++i)
    {
      objc_msgSend(v49, "getKeyframeValueForIndex:", i);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v153 = 0.0;
      v154 = 0.0;
      v151 = 0.0;
      v152 = 0.0;
      v149 = 0.0;
      v150 = 0.0;
      v147 = 0;
      v148 = 0.0;
      objc_msgSend(v51, "getRed:green:blue:alpha:", &v154, &v153, &v152, &v151);
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", v143, v157, v156, v151);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "getHue:saturation:brightness:alpha:", &v150, &v149, &v148, &v147);
      v53 = v150 + (v154 + -0.5) * 2.0;
      v54 = v149 + (v153 + -0.5) * 2.0;
      v149 = fmaxf(fminf(v54, 1.0), 0.0);
      v150 = fmaxf(fminf(v53, 1.0), 0.0);
      v55 = v148 + (v152 + -0.5) * 2.0;
      v148 = fmaxf(fminf(v55, 1.0), 0.0);
      if (v143 == v157 && v157 == v156)
      {
        objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", v143, v157, v156, v151);
        v56 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDF6950], "colorWithHue:saturation:brightness:alpha:");
        v56 = objc_claimAutoreleasedReturnValue();
      }
      v57 = (void *)v56;
      objc_msgSend(v49, "setKeyframeValue:forIndex:", v56, i);

    }
    objc_msgSend(v139, "setParticleColorSequence:", v49);
  }
  else
  {
    objc_msgSend(v47, "setParticleColor:", v48);
  }

  objc_msgSend(v139, "setTargetNode:", v136);
  objc_msgSend(v34, "addChild:", v139);
  v58 = (void *)_smoke;
  if (!_smoke)
  {
    ETFrameworkBundle();
    v59 = (NSBundle *)objc_claimAutoreleasedReturnValue();
    ET_SKSetResourceBundle(v59);

    objc_msgSend(getSKEmitterNodeClass(), "nodeWithFileNamed:", CFSTR("doodle_wisp_dots"));
    v60 = objc_claimAutoreleasedReturnValue();
    v61 = (void *)_smoke;
    _smoke = v60;

    v62 = (void *)objc_msgSend(objc_alloc((Class)getSKKeyframeSequenceClass()), "initWithKeyframeValues:times:", &unk_24F6F1270, &unk_24F6F1288);
    objc_msgSend(v62, "setInterpolationMode:", 2);
    objc_msgSend(v62, "setRepeatMode:", 1);
    objc_msgSend((id)_smoke, "setParticleScaleSequence:", v62);
    objc_msgSend((id)_smoke, "setZPosition:", -2.0);
    objc_msgSend((id)_smoke, "setParticleSpeedRange:", 6.0);
    objc_msgSend((id)_smoke, "setParticleSpeed:", 10.0);
    objc_msgSend((id)_smoke, "setYAcceleration:", 0.0);
    objc_msgSend((id)_smoke, "setXAcceleration:", 0.0);
    objc_msgSend((id)_smoke, "setParticleLifetime:", 1.5);
    objc_msgSend((id)_smoke, "setParticleLifetimeRange:", 0.5);
    objc_msgSend((id)_smoke, "setDensityBased:", 0);
    objc_msgSend((id)_smoke, "setParticleBirthRate:", 0.0);
    objc_msgSend((id)_smoke, "setParticleDensity:", 0.6);
    objc_msgSend((id)_smoke, "setEmissionAngleRange:", 6.28318531);
    objc_msgSend((id)_smoke, "setEmissionDistance:", 29.75);
    objc_msgSend((id)_smoke, "setEmissionDistanceRange:", 2.0);
    objc_msgSend((id)_smoke, "setFieldBitMask:", 2);
    v63 = (void *)objc_msgSend(objc_alloc((Class)getSKKeyframeSequenceClass()), "initWithKeyframeValues:times:", &unk_24F6F12A0, &unk_24F6F12B8);
    objc_msgSend(v63, "setInterpolationMode:", 1);
    objc_msgSend((id)_smoke, "setFieldInfluenceSequence:", v63);
    objc_msgSend((id)_smoke, "setPosition:", 0.0, 0.0);

    v58 = (void *)_smoke;
  }
  v64 = (id)objc_msgSend(v58, "copy");
  v135 = v48;
  objc_msgSend(v64, "particleColorSequence");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v65;
  if (v65)
  {
    v67 = objc_msgSend(v65, "count");
    v143 = 0.0;
    v156 = 0.0;
    v157 = 0.0;
    v155 = 0.0;
    objc_msgSend(v135, "getHue:saturation:brightness:alpha:", &v143, &v157, &v156, &v155);
    if (v67)
    {
      for (j = 0; j != v67; ++j)
      {
        objc_msgSend(v66, "getKeyframeValueForIndex:", j);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v153 = 0.0;
        v154 = 0.0;
        v151 = 0.0;
        v152 = 0.0;
        objc_msgSend(v69, "getHue:saturation:brightness:alpha:", &v154, &v153, &v152, &v151);
        objc_msgSend(MEMORY[0x24BDF6950], "colorWithHue:saturation:brightness:alpha:", v143, v157, v152, v151 * v155);
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v66, "setKeyframeValue:forIndex:", v70, j);
      }
    }
    objc_msgSend(v64, "setParticleColorSequence:", v66);
  }
  else
  {
    objc_msgSend(v64, "setParticleColor:", v135);
  }

  objc_msgSend(v64, "setTargetNode:", v136);
  objc_msgSend(v34, "addChild:", v64);
  if (v133)
  {
    CirclePath = createCirclePath(32.5, 37.5);
    objc_msgSend(v40, "setPath:", CirclePath);
    CGPathRelease(CirclePath);
    -[ETTapMessage _animateCircleInner0:inner1:outer0:outer1:duration:](self, "_animateCircleInner0:inner1:outer0:outer1:duration:", 0.0, 35.0, 35.0, 35.0, 0.649999976);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "setTimingMode:", 1);
    objc_msgSend(v40, "runAction:", v134);
    objc_msgSend(v40, "setScale:", 0.0);
    objc_msgSend(getSKActionClass(), "scaleTo:duration:", 1.0, 0.649999976);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setTimingMode:", 3);
    v72 = getSKActionClass();
    v168 = v132;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v168, 1);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "sequence:", v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "runAction:", v74);

    if (v131)
      goto LABEL_45;
    v75 = getSKActionClass();
    objc_msgSend(getSKActionClass(), "waitForDuration:", 0.649999976);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v167[0] = v76;
    objc_msgSend(getSKActionClass(), "fadeOutWithDuration:", 0.227499992);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v167[1] = v77;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v167, 2);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "sequence:", v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "runAction:", v79);

    objc_msgSend(v34, "setAlpha:", 0.0);
    v80 = getSKActionClass();
    objc_msgSend(getSKActionClass(), "fadeInWithDuration:", 0.3);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v166[0] = v81;
    objc_msgSend(getSKActionClass(), "waitForDuration:", 1.8);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v166[1] = v82;
    objc_msgSend(getSKActionClass(), "fadeOutWithDuration:", 0.5);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v166[2] = v83;
    objc_msgSend(getSKActionClass(), "removeFromParent");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v166[3] = v84;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v166, 4);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "sequence:", v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "runAction:", v86);

    *(_DWORD *)(*((_QWORD *)&buf + 1) + 24) = 1065353216;
    v87 = getSKActionClass();
    objc_msgSend(getSKActionClass(), "waitForDuration:", 0.454999983);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v165[0] = v88;
    v165[1] = v129;
    v165[2] = v130;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v165, 3);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "sequence:", v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "runAction:", v90);

    v91 = getSKActionClass();
    objc_msgSend(getSKActionClass(), "waitForDuration:", 0.454999983);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v164[0] = v92;
    v164[1] = v129;
    v164[2] = v130;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v164, 3);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "sequence:", v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "runAction:", v94);
    goto LABEL_43;
  }
  v95 = createCirclePath(32.5, 37.5);
  objc_msgSend(v40, "setPath:", v95);
  CGPathRelease(v95);
  -[ETTapMessage _animateCircleInner0:inner1:outer0:outer1:duration:](self, "_animateCircleInner0:inner1:outer0:outer1:duration:", 51.0, 32.5, 54.0, 37.5, 0.324999988);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETTapMessage _animateCircleInner0:inner1:outer0:outer1:duration:](self, "_animateCircleInner0:inner1:outer0:outer1:duration:", 32.5, 35.0, 37.5, 35.0, 0.649999976);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "setTimingMode:", 2);
  objc_msgSend(v132, "setTimingMode:", 1);
  v96 = getSKActionClass();
  v163[0] = v134;
  v163[1] = v132;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v163, 2);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "sequence:", v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "runAction:", v98);

  objc_msgSend(v40, "setScale:", 1.0);
  objc_msgSend(getSKActionClass(), "scaleTo:duration:", 0.8, 0.649999976);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setTimingMode:", 3);
  v99 = getSKActionClass();
  objc_msgSend(getSKActionClass(), "waitForDuration:", 0.129999995);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v162[0] = v100;
  v162[1] = v92;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v162, 2);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "sequence:", v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "runAction:", v102);

  if (!v131)
  {
    v103 = getSKActionClass();
    objc_msgSend(getSKActionClass(), "waitForDuration:", 0.649999976);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v161[0] = v104;
    objc_msgSend(getSKActionClass(), "fadeOutWithDuration:", 0.227499992);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v161[1] = v105;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v161, 2);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "sequence:", v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "runAction:", v107);

    objc_msgSend(v34, "setAlpha:", 0.0);
    v108 = getSKActionClass();
    objc_msgSend(getSKActionClass(), "fadeInWithDuration:", 0.3);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v160[0] = v109;
    objc_msgSend(getSKActionClass(), "waitForDuration:", 1.8);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v160[1] = v110;
    objc_msgSend(getSKActionClass(), "fadeOutWithDuration:", 0.5);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v160[2] = v111;
    objc_msgSend(getSKActionClass(), "removeFromParent");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v160[3] = v112;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v160, 4);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "sequence:", v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "runAction:", v114);

    *(_DWORD *)(*((_QWORD *)&buf + 1) + 24) = -1082130432;
    v115 = getSKActionClass();
    objc_msgSend(getSKActionClass(), "waitForDuration:", 0.454999983);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v159[0] = v116;
    v159[1] = v129;
    v159[2] = v130;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v159, 3);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "sequence:", v117);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "runAction:", v118);

    v119 = getSKActionClass();
    objc_msgSend(getSKActionClass(), "waitForDuration:", 0.454999983);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v158[0] = v93;
    v158[1] = v129;
    v158[2] = v130;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v158, 3);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "sequence:", v94);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "runAction:", v120);

LABEL_43:
  }

LABEL_45:
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "persistentDomainForName:", CFSTR("com.apple.ET"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "objectForKey:", CFSTR("ETSceneLoggingEnabled"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = objc_msgSend(v123, "BOOLValue");

  if (v124)
  {
    v125 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "stringWithFormat:", CFSTR("/tmp/ETTapMessage-%@.sks"), v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v138, 1, 0);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "writeToFile:atomically:", v127, 1);

  }
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(v142, 8);
}

void __60__ETTapMessage__displayInScene_point_color_filled_withWisp___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (*(double *)(*(_QWORD *)(a1 + 32) + 168) == *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
    && *(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v3, "setParticleSpeed:", (float)(*(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) * 10.0));
    objc_msgSend(v4, "setDensityBased:", 0);
    objc_msgSend(v4, "setParticleBirthRate:", 1000.0);
  }
  else
  {
    objc_msgSend(v3, "resetSimulation");
  }

}

void __60__ETTapMessage__displayInScene_point_color_filled_withWisp___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setDensityBased:", 0);
  objc_msgSend(v2, "setParticleBirthRate:", 0.0);

}

- (double)messageDuration
{
  double *begin;
  double *end;
  double v4;
  double v5;

  begin = self->_times.__begin_;
  end = self->_times.__end_;
  if (begin == end)
    return 1.3;
  v4 = 0.0;
  do
  {
    v5 = *begin++;
    v4 = v4 + v5;
  }
  while (begin != end);
  return v4 + 1.3;
}

- (void).cxx_destruct
{
  double *begin;
  CGPoint *v4;

  objc_storeStrong((id *)&self->_soundTimer, 0);
  objc_storeStrong((id *)&self->_colors, 0);
  begin = self->_times.__begin_;
  if (begin)
  {
    self->_times.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_points.__begin_;
  if (v4)
  {
    self->_points.__end_ = v4;
    operator delete(v4);
  }
  objc_storeStrong((id *)&self->_noiseField, 0);
  objc_storeStrong((id *)&self->_preVisualizeScene, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 19) = 0;
  *((_QWORD *)self + 17) = 0;
  return self;
}

@end
