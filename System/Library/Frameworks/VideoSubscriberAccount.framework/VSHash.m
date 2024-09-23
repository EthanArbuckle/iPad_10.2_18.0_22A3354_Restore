@implementation VSHash

- (VSHash)init
{
  VSHash *v2;
  VSHash *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VSHash;
  v2 = -[VSHash init](&v5, sel_init);
  v3 = v2;
  if (v2)
    CC_SHA256_Init(&v2->_ctx);
  return v3;
}

- (void)dealloc
{
  id v3;
  objc_super v4;

  if (!self->_finalized)
    v3 = -[VSHash finalData](self, "finalData");
  v4.receiver = self;
  v4.super_class = (Class)VSHash;
  -[VSHash dealloc](&v4, sel_dealloc);
}

- (void)updateWithData:(id)a3
{
  id v4;
  id v5;
  const void *v6;
  CC_LONG v7;

  v4 = a3;
  if (-[VSHash isFinalized](self, "isFinalized"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Cannot update a hash that has been finalized."));
  v5 = objc_retainAutorelease(v4);
  v6 = (const void *)objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");

  CC_SHA256_Update(&self->_ctx, v6, v7);
}

- (NSData)finalData
{
  NSData *v3;
  NSData *finalData;
  unsigned __int8 md[32];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!-[VSHash isFinalized](self, "isFinalized"))
  {
    -[VSHash setFinalized:](self, "setFinalized:", 1);
    CC_SHA256_Final(md, &self->_ctx);
    v3 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", md, 32);
    finalData = self->_finalData;
    self->_finalData = v3;

  }
  return self->_finalData;
}

- (BOOL)isFinalized
{
  return self->_finalized;
}

- (void)setFinalized:(BOOL)a3
{
  self->_finalized = a3;
}

- (CC_SHA256state_st)ctx
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&self->wbuf[8];
  v4 = *(_OWORD *)self[1].count;
  *(_OWORD *)&retstr->wbuf[6] = *(_OWORD *)&self->wbuf[12];
  *(_OWORD *)&retstr->wbuf[10] = v4;
  *(_QWORD *)&retstr->wbuf[14] = *(_QWORD *)&self[1].hash[2];
  v5 = *(_OWORD *)self->wbuf;
  *(_OWORD *)retstr->count = *(_OWORD *)&self->hash[4];
  *(_OWORD *)&retstr->hash[2] = v5;
  *(_OWORD *)&retstr->hash[6] = *(_OWORD *)&self->wbuf[4];
  *(_OWORD *)&retstr->wbuf[2] = v3;
  return self;
}

- (void)setCtx:(CC_SHA256state_st *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = *(_OWORD *)a3->count;
  v4 = *(_OWORD *)&a3->hash[2];
  *(_OWORD *)&self->_ctx.hash[6] = *(_OWORD *)&a3->hash[6];
  *(_OWORD *)&self->_ctx.hash[2] = v4;
  *(_OWORD *)self->_ctx.count = v3;
  v5 = *(_OWORD *)&a3->wbuf[2];
  v6 = *(_OWORD *)&a3->wbuf[6];
  v7 = *(_OWORD *)&a3->wbuf[10];
  *(_QWORD *)&self->_ctx.wbuf[14] = *(_QWORD *)&a3->wbuf[14];
  *(_OWORD *)&self->_ctx.wbuf[10] = v7;
  *(_OWORD *)&self->_ctx.wbuf[6] = v6;
  *(_OWORD *)&self->_ctx.wbuf[2] = v5;
}

- (void)setFinalData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalData, 0);
}

- (void)updateWithString:(id)a3
{
  const char *v4;
  id v5;

  v4 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  if (v4)
  {
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v4, strlen(v4));
    -[VSHash updateWithData:](self, "updateWithData:", v5);

  }
}

- (void)updateWithDate:(id)a3
{
  uint64_t v4;
  id v5;

  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f"), v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VSHash updateWithString:](self, "updateWithString:", v5);

}

- (void)updateWithInteger:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[VSHash updateWithString:](self, "updateWithString:", v4);

}

- (void)updateWithUUID:(id)a3
{
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = 0;
  v5[1] = 0;
  objc_msgSend(a3, "getUUIDBytes:", v5);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v5, 16);
  -[VSHash updateWithData:](self, "updateWithData:", v4);

}

@end
