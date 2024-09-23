@implementation FMTimedMetadataItem

- (FMTimedMetadataItem)initWithIdentifier:(id)a3 name:(id)a4 timeRange:(id *)a5 values:(id)a6
{
  id v11;
  id v12;
  id v13;
  FMTimedMetadataItem *v14;
  FMTimedMetadataItem *v15;
  __int128 v16;
  __int128 v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)FMTimedMetadataItem;
  v14 = -[FMTimedMetadataItem init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_identifier, a3);
    objc_storeStrong((id *)&v15->_name, a4);
    v16 = *(_OWORD *)&a5->var0.var0;
    v17 = *(_OWORD *)&a5->var1.var1;
    *(_OWORD *)&v15->_timeRange.start.epoch = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)&v15->_timeRange.duration.timescale = v17;
    *(_OWORD *)&v15->_timeRange.start.value = v16;
    objc_storeStrong((id *)&v15->_values, a6);
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v14 = objc_msgSend_init(v9, v10, v11, v12, v13);
  objc_msgSend_identifier(self, v15, v16, v17, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = *(void **)(v14 + 8);
  *(_QWORD *)(v14 + 8) = v19;

  objc_msgSend_name(self, v21, v22, v23, v24);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = *(void **)(v14 + 16);
  *(_QWORD *)(v14 + 16) = v25;

  objc_msgSend_timeRange(self, v27, v28, v29, v30);
  v32 = v41;
  v31 = v42;
  *(_OWORD *)(v14 + 32) = v40;
  *(_OWORD *)(v14 + 48) = v32;
  *(_OWORD *)(v14 + 64) = v31;
  objc_msgSend_values(self, v33, v34, v35, v36);
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = *(void **)(v14 + 24);
  *(_QWORD *)(v14 + 24) = v37;

  return (id)v14;
}

- (void)adjustDurationTo:(id *)a3
{
  __int128 v4;
  CMTime v5;
  CMTime start;
  CMTimeRange v7;

  start = (CMTime)self->_timeRange.start;
  v5 = *(CMTime *)a3;
  CMTimeRangeMake(&v7, &start, &v5);
  v4 = *(_OWORD *)&v7.start.epoch;
  *(_OWORD *)&self->_timeRange.start.value = *(_OWORD *)&v7.start.value;
  *(_OWORD *)&self->_timeRange.start.epoch = v4;
  *(_OWORD *)&self->_timeRange.duration.timescale = *(_OWORD *)&v7.duration.timescale;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  Float64 Seconds;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  CMTime v28;
  CMTime time;

  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_name(self, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeRange(self, v8, v9, v10, v11);
  time = v28;
  Seconds = CMTimeGetSeconds(&time);
  objc_msgSend_values(self, v13, v14, v15, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend_values(self, v17, v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v6, v23, (uint64_t)CFSTR("%@ (%1.2f) - %@"), v24, v25, v7, *(_QWORD *)&Seconds, v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_stringWithFormat_(v6, v17, (uint64_t)CFSTR("%@ (%1.2f) - %@"), v19, v20, v7, *(_QWORD *)&Seconds, &stru_24C5F0F80);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v26;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- ($8FD227B00C0D8A9415DDD8F6F23225DE)timeRange
{
  $8FD227B00C0D8A9415DDD8F6F23225DE *result;

  objc_copyStruct(retstr, &self->_timeRange, 48, 1, 0);
  return result;
}

- (NSDictionary)values
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
