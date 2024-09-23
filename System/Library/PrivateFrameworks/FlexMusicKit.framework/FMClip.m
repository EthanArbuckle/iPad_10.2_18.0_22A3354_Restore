@implementation FMClip

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v9 = objc_alloc_init((Class)objc_opt_class());
  if (v9)
  {
    v9[2] = objc_msgSend_position(self, v5, v6, v7, v8);
    objc_msgSend_url(self, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_copyWithZone_(v14, v15, (uint64_t)a3, v16, v17);
    v19 = (void *)v9[1];
    v9[1] = v18;

    v9[3] = objc_msgSend_offset(self, v20, v21, v22, v23);
    v9[4] = objc_msgSend_duration(self, v24, v25, v26, v27);
  }
  return v9;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (int64_t)position
{
  return self->_position;
}

- (void)setPosition:(int64_t)a3
{
  self->_position = a3;
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

- (int64_t)fadeInLength
{
  return self->_fadeInLength;
}

- (void)setFadeInLength:(int64_t)a3
{
  self->_fadeInLength = a3;
}

- (int64_t)fadeOutLength
{
  return self->_fadeOutLength;
}

- (void)setFadeOutLength:(int64_t)a3
{
  self->_fadeOutLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
