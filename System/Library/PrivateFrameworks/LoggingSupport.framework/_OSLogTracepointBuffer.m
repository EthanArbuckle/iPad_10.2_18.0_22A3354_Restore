@implementation _OSLogTracepointBuffer

- (void)insertTracepoints:(tracev3_chunk_s *)a3 chunkOffset:(int64_t)a4 chunkSetStartAddr:(void *)a5 subchunk:(id)a6 options:(unsigned int)a7
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  int v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  $50621B071C59F2DFF7E12E16168F5878 *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  char *var2;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  id v38;
  __int16 v39;
  id v40;
  __int128 v41;
  __int128 v42;
  catalog_procinfo_s *v43;

  v39 = a7;
  v40 = a6;
  v43 = 0;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v40, "catalog");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v40, "oldestTime");
  v34 = objc_msgSend(v40, "endTime");
  v38 = objc_retainAutorelease(v9);
  if (_OSLogEventUnpackChunk((int *)a3, objc_msgSend(v38, "catalog"), (uint64_t)&v41))
  {
    v11 = *((_QWORD *)&v41 + 1) + 16;
    v10 = (unsigned __int16)**((_WORD **)&v41 + 1);
    v33 = *((_QWORD *)&v41 + 1);
    if (v10 > 0x1000)
      v12 = *((_QWORD *)&v41 + 1) + 16;
    else
      v12 = *((_QWORD *)&v41 + 1) + v10;
    while (v11 + 24 < v12)
    {
      v13 = (char *)v11;
      v14 = *(_QWORD *)(v11 + 16);
      v15 = HIWORD(v14);
      if (!HIWORD(v14) || v15 > (uint64_t)(v12 - (v11 + 24)))
        break;
      v17 = v15 + 24;
      v18 = (HIWORD(v14) & 0xFFF8) + 32;
      if ((v14 & 0x7000000000000) == 0)
        v18 = v17;
      v11 += v18;
      if (*(_QWORD *)v13)
      {
        switch(*(_QWORD *)v13)
        {
          case 2u:
            if ((v39 & 0x80) == 0)
              goto LABEL_27;
            break;
          case 3u:
            if ((v39 & 0x100) == 0)
              goto LABEL_27;
            break;
          case 4u:
            if ((v39 & 0x200) == 0)
            {
              v19 = BYTE1(*(_QWORD *)v13);
              if (v19 == 2)
              {
                if ((v39 & 2) != 0)
                  goto LABEL_27;
              }
              else if (v19 != 1 || (v39 & 4) != 0)
              {
                goto LABEL_27;
              }
            }
            break;
          case 6u:
            if ((v39 & 0x20) != 0)
              goto LABEL_27;
            break;
          case 7u:
            if ((v39 & 0x40) != 0)
              goto LABEL_27;
            break;
          default:
LABEL_27:
            v20 = (v14 & 0xFFFFFFFFFFFFLL) + *(_QWORD *)(v33 + 8);
            if (v20 <= v35)
              v20 = v35;
            if (v20 >= v34)
              v21 = v34;
            else
              v21 = v20;
            _oltb_allocate_row(self);
            v23 = v22;
            v24 = &self->_events[v22];
            v25 = objc_retainAutorelease(v38);
            v26 = objc_msgSend(v25, "fileHeader");
            v27 = objc_msgSend(objc_retainAutorelease(v25), "catalog");
            *(_QWORD *)&v24->var0 = 3;
            v24->var1 = v21;
            bzero(v24->var2, 0x400uLL);
            v24->var3 = a4;
            v24->var4 = v13 - (_BYTE *)a5;
            v24->var5.var0.var0 = (tracev3_chunk_s *)v26;
            v24->var5.var0.var1 = (catalog_s *)v27;
            v28 = v42;
            *(_OWORD *)&v24->var5.var2.var1 = v41;
            *((_OWORD *)&v24->var5.var2 + 2) = v28;
            v24->var5.var0.var2.var3 = v43;
            v24->var5.var0.var3 = (_firehose_unaligned_tracepoint_s *)v13;
            var2 = self->_events[v23].var2;
            objc_msgSend(v40, "catalog");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "store");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "fileName");
            v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            snprintf(var2, 0x400uLL, "%s", (const char *)objc_msgSend(v32, "UTF8String"));

            break;
        }
      }
    }
  }

}

- (void)finishedInsertingTracepointsWithNextMajorTime:(unint64_t)a3 options:(unsigned int)a4
{
  char v4;
  unint64_t cursor;
  unint64_t count;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  $50621B071C59F2DFF7E12E16168F5878 *v14;
  unint64_t v15;
  unint64_t *p_var1;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  $50621B071C59F2DFF7E12E16168F5878 *events;
  unint64_t v21;
  unint64_t v22;
  $50621B071C59F2DFF7E12E16168F5878 *v23;
  _QWORD v24[5];
  _BYTE __dst[1120];
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  _oltb_consolidate(self);
  cursor = self->_cursor;
  count = self->_count;
  if ((v4 & 8) != 0)
  {
    v9 = 0xFFFFFFFF00000001;
    while (1)
    {
      if (cursor < count)
      {
        p_var1 = &self->_events[cursor].var1;
        while (*p_var1 >= a3)
        {
          p_var1 += 140;
          if (count == ++cursor)
          {
            cursor = count;
            break;
          }
        }
      }
      v17 = cursor >= count ? count : cursor;
      v18 = 1120 * count - 1112;
      while (count > cursor)
      {
        --count;
        v19 = *(_QWORD *)((char *)&self->_events->var0 + v18);
        v18 -= 1120;
        if (v19 >= a3)
        {
          v17 = count + 1;
          break;
        }
      }
      if (cursor == v17)
        break;
      events = self->_events;
      memcpy(__dst, &events[cursor], sizeof(__dst));
      count = v17 - 1;
      v21 = v17 - 1;
      memcpy(&events[cursor], &events[v21], sizeof($50621B071C59F2DFF7E12E16168F5878));
      memcpy(&self->_events[v21], __dst, sizeof(self->_events[v21]));
      ++cursor;
    }
  }
  else
  {
    v9 = 0x1FFFFFFFFLL;
    while (1)
    {
      if (cursor < count)
      {
        v10 = &self->_events[cursor].var1;
        while (*v10 <= a3)
        {
          v10 += 140;
          if (count == ++cursor)
          {
            cursor = count;
            break;
          }
        }
      }
      v11 = cursor >= count ? count : cursor;
      v12 = 1120 * count - 1112;
      while (count > cursor)
      {
        --count;
        v13 = *(_QWORD *)((char *)&self->_events->var0 + v12);
        v12 -= 1120;
        if (v13 <= a3)
        {
          v11 = count + 1;
          break;
        }
      }
      if (cursor == v11)
        break;
      v14 = self->_events;
      memcpy(__dst, &v14[cursor], sizeof(__dst));
      count = v11 - 1;
      v15 = v11 - 1;
      memcpy(&v14[cursor], &v14[v15], sizeof($50621B071C59F2DFF7E12E16168F5878));
      memcpy(&self->_events[v15], __dst, sizeof(self->_events[v15]));
      ++cursor;
    }
  }
  v22 = self->_cursor;
  v23 = &self->_events[v22];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __80___OSLogTracepointBuffer_finishedInsertingTracepointsWithNextMajorTime_options___block_invoke;
  v24[3] = &__block_descriptor_40_e15_i24__0r_v8r_v16l;
  v24[4] = v9;
  mergesort_b(v23, cursor - v22, 0x460uLL, v24);
  self->_mutable = 0;
}

- (void)beginInsertingTracepointsClippingFromTime:(unint64_t)a3
{
  _OSLogTracepointBuffer *v5;
  unint64_t cursor;
  _OSLogTracepointBuffer *v7;
  unint64_t count;
  unint64_t *p_var1;
  unint64_t v10;
  _OSLogTracepointBuffer *v11;

  self->_mutable = 1;
  v5 = self;
  cursor = v5->_cursor;
  v7 = v5;
  if (self->_mutable)
  {
    v11 = v7;

    count = v11->_count;
    if (cursor < count)
    {
      p_var1 = &v11->_events[cursor].var1;
      v10 = cursor;
      while (*p_var1 < a3)
      {
        p_var1 += 140;
        if (count == ++v10)
          goto LABEL_8;
      }
      cursor = v10;
    }
LABEL_8:
    v5->_cursor = cursor;

  }
  else
  {
    qword_1EE52EA58 = (uint64_t)"BUG IN LIBTRACE: oltb maniplation while immutable";
    __break(1u);
  }
}

- (void)enumerateEventsFromTime:(unint64_t)a3 to:(unint64_t)a4 options:(unsigned int)a5 usingBlock:(id)a6
{
  char v6;
  _OSLogTracepointBuffer *v10;
  _OSLogTracepointBuffer *v11;
  unint64_t count;
  unint64_t cursor;
  uint64_t v14;
  $50621B071C59F2DFF7E12E16168F5878 *events;
  unint64_t var1;
  unsigned int (**v17)(id, _QWORD);

  v6 = a5;
  v17 = (unsigned int (**)(id, _QWORD))a6;
  v10 = self;
  if (v10->_mutable)
  {
    qword_1EE52EA58 = (uint64_t)"BUG IN LIBTRACE: oltb iteration while mutable";
    __break(1u);
  }
  else
  {
    v11 = v10;

    cursor = v11->_cursor;
    count = v11->_count;
    if (cursor < count)
    {
      v14 = cursor;
      do
      {
        events = v11->_events;
        var1 = events[v14].var1;
        if (var1 == a4)
          break;
        if ((v6 & 8) != 0)
        {
          if (var1 <= a4)
            break;
          ++v11->_cursor;
          if (var1 <= a3)
          {
LABEL_11:
            if (!((unsigned int (**)(id, $50621B071C59F2DFF7E12E16168F5878 *))v17)[2](v17, &events[v14]))
              break;
            count = v11->_count;
          }
        }
        else
        {
          if (var1 >= a4)
            break;
          ++v11->_cursor;
          if (var1 >= a3)
            goto LABEL_11;
        }
        ++cursor;
        ++v14;
      }
      while (cursor < count);
    }

  }
}

- (void)insertTimesyncPoints:(_os_timesync_db_s *)a3 forBoot:(unsigned __int8)a4[16] oldestContinuousTime:(unint64_t)a5
{
  _QWORD v7[2];
  uint64_t (*v8)(uint64_t, __int128 *);
  void *v9;
  _OSLogTracepointBuffer *v10;
  unint64_t v11;
  _os_timesync_db_s *v12;
  unsigned __int8 *__attribute__((__org_arrdim(0,16))) v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v8 = __76___OSLogTracepointBuffer_insertTimesyncPoints_forBoot_oldestContinuousTime___block_invoke;
  v9 = &unk_1E4156B88;
  v10 = self;
  v11 = a5;
  v12 = a3;
  v13 = a4;
  _timesync_reset((uint64_t)a3);
  while (*(_QWORD *)a4 != *((_QWORD *)a3 + 8) || *((_QWORD *)a4 + 1) != *((_QWORD *)a3 + 9))
  {
    if (_timesync_advance_boot(a3) == -1)
      return;
  }
  if (__76___OSLogTracepointBuffer_insertTimesyncPoints_forBoot_oldestContinuousTime___block_invoke((uint64_t)v7, (__int128 *)((char *)a3 + 104)))
  {
    do
    {
      if (!*((_QWORD *)a3 + 6))
        break;
      _timesync_advance((uint64_t)a3);
      if (*(_QWORD *)a4 != *((_QWORD *)a3 + 8))
        break;
    }
    while (*((_QWORD *)a4 + 1) == *((_QWORD *)a3 + 9) && (v8((uint64_t)v7, (__int128 *)((char *)a3 + 104)) & 1) != 0);
  }
}

- (void)insertNonsparsePoint:(unint64_t)a3 uuid:(unsigned __int8)a4[16] ttl:(unsigned __int8)a5 inMemory:(BOOL)a6
{
  uint64_t v11;
  uint64_t v12;
  $50621B071C59F2DFF7E12E16168F5878 *v13;

  _oltb_allocate_row(self);
  v12 = v11;
  v13 = &self->_events[v11];
  v13->var0 = 2;
  v13->var1 = a3;
  memcpy(v13->var2, "nonsparse", sizeof(v13->var2));
  *(int64x2_t *)&v13->var3 = vdupq_n_s64(0xDEADBEEFuLL);
  *(_OWORD *)&v13->var5.var0.var0 = 0u;
  v13->var5.var2.var1 = a5;
  v13->var5.var2.var2 = a6;
  *(_OWORD *)(&v13->var5.var2 + 1) = 0u;
  *(_OWORD *)((char *)&v13->var5.var2 + 34) = 0u;
  *((_OWORD *)&v13->var5.var2 + 3) = 0u;
  *(_OWORD *)&self->_events[v12].var5.var0.var0 = *(_OWORD *)a4;
}

- (_OSLogTracepointBuffer)init
{
  _OSLogTracepointBuffer *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_OSLogTracepointBuffer;
  result = -[_OSLogTracepointBuffer init](&v3, sel_init);
  if (result)
  {
    result->_mutable = 0;
    *(_OWORD *)&result->_count = 0u;
    *(_OWORD *)&result->_events = 0u;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_events);
  v3.receiver = self;
  v3.super_class = (Class)_OSLogTracepointBuffer;
  -[_OSLogTracepointBuffer dealloc](&v3, sel_dealloc);
}

- (BOOL)_isEmpty
{
  return !self->_size || self->_cursor == self->_count;
}

- (void)insertChunk:(tracev3_chunk_s *)a3 chunkOffset:(int64_t)a4 chunkSetStartAddr:(void *)a5 timestamp:(unint64_t)a6 subchunk:(id)a7
{
  unint64_t v12;
  unint64_t v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  $50621B071C59F2DFF7E12E16168F5878 *v19;
  int64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  char *var2;
  void *v26;
  void *v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  catalog_procinfo_s *v32;

  v29 = a7;
  v12 = objc_msgSend(v29, "oldestTime");
  v13 = objc_msgSend(v29, "endTime");
  v32 = 0;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v29, "catalog");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if (_OSLogEventUnpackChunk((int *)a3, objc_msgSend(v14, "catalog"), (uint64_t)&v30))
  {
    if (v12 <= a6)
      v15 = a6;
    else
      v15 = v12;
    if (v15 >= v13)
      v16 = v13;
    else
      v16 = v15;
    _oltb_allocate_row(self);
    v18 = v17;
    v19 = &self->_events[v17];
    v20 = (char *)a3 - (_BYTE *)a5;
    v21 = objc_retainAutorelease(v14);
    v22 = objc_msgSend(v21, "fileHeader");
    v23 = objc_msgSend(objc_retainAutorelease(v21), "catalog");
    *(_QWORD *)&v19->var0 = 3;
    v19->var1 = v16;
    bzero(v19->var2, 0x400uLL);
    v19->var3 = a4;
    v19->var4 = v20;
    v19->var5.var0.var0 = (tracev3_chunk_s *)v22;
    v19->var5.var0.var1 = (catalog_s *)v23;
    v24 = v31;
    *(_OWORD *)&v19->var5.var2.var1 = v30;
    *((_OWORD *)&v19->var5.var2 + 2) = v24;
    v19->var5.var0.var2.var3 = v32;
    v19->var5.var0.var3 = 0;
    var2 = self->_events[v18].var2;
    objc_msgSend(v29, "catalog");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "store");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "fileName");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    snprintf(var2, 0x400uLL, "%s", (const char *)objc_msgSend(v28, "UTF8String"));

  }
}

- (void)insertSimpleChunk:(tracev3_chunk_s *)a3 chunkOffset:(int64_t)a4 chunkSetStartAddr:(void *)a5 subchunk:(id)a6 options:(unsigned int)a7
{
  __int16 v7;
  id v12;
  int v13;
  id v14;

  v7 = a7;
  v12 = a6;
  if ((v7 & 0x200) == 0)
  {
    v13 = a3->var1.var3.var3[0];
    if (v13 == 2)
    {
      if ((v7 & 2) == 0)
        goto LABEL_8;
    }
    else if (v13 == 1 && (v7 & 4) == 0)
    {
      goto LABEL_8;
    }
    v14 = v12;
    -[_OSLogTracepointBuffer insertChunk:chunkOffset:chunkSetStartAddr:timestamp:subchunk:](self, "insertChunk:chunkOffset:chunkSetStartAddr:timestamp:subchunk:", a3, a4, a5, a3->var1.var0.var2, v12);
    v12 = v14;
  }
LABEL_8:

}

- (void)insertStatedumpChunk:(tracev3_chunk_s *)a3 chunkOffset:(int64_t)a4 chunkSetStartAddr:(void *)a5 subchunk:(id)a6
{
  -[_OSLogTracepointBuffer insertChunk:chunkOffset:chunkSetStartAddr:timestamp:subchunk:](self, "insertChunk:chunkOffset:chunkSetStartAddr:timestamp:subchunk:", a3, a4, a5, a3->var1.var0.var2, a6);
}

@end
