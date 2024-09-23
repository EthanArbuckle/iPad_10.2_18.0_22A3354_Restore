@implementation FlexSegmentAssemblyInfo

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
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;

  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_segment(self, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_barsUsed(self, v13, v14, v15, v16);
  objc_msgSend_segment(self, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_bars(v22, v23, v24, v25, v26);
  v32 = objc_msgSend_duration(self, v28, v29, v30, v31);
  objc_msgSend_stringWithFormat_(v6, v33, (uint64_t)CFSTR("segment: %@, barsUsed: %lu (%lu), duration: %1.2f"), v34, v35, v12, v17, v27, (float)((float)v32 / 48000.0));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
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
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v18 = (_QWORD *)objc_msgSend_init(v9, v10, v11, v12, v13);
  if (v18)
  {
    objc_msgSend_segment(self, v14, v15, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend_copyWithZone_(v19, v20, (uint64_t)a3, v21, v22);
    v24 = (void *)v18[1];
    v18[1] = v23;

    v18[2] = objc_msgSend_barsUsed(self, v25, v26, v27, v28);
    objc_msgSend_url(self, v29, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend_copyWithZone_(v33, v34, (uint64_t)a3, v35, v36);
    v38 = (void *)v18[3];
    v18[3] = v37;

    v18[4] = objc_msgSend_offset(self, v39, v40, v41, v42);
    v18[5] = objc_msgSend_duration(self, v43, v44, v45, v46);
  }
  return v18;
}

- (FlexSegment)segment
{
  return self->_segment;
}

- (void)setSegment:(id)a3
{
  objc_storeStrong((id *)&self->_segment, a3);
}

- (int64_t)barsUsed
{
  return self->_barsUsed;
}

- (void)setBarsUsed:(int64_t)a3
{
  self->_barsUsed = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (int64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(int64_t)a3
{
  self->_offset = a3;
}

- (int64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(int64_t)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_segment, 0);
}

@end
