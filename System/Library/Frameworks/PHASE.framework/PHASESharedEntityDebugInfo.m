@implementation PHASESharedEntityDebugInfo

- (BOOL)isEqual:(id)a3
{
  id v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;

  v4 = a3;
  -[PHASESharedEntityDebugInfo transform](self, "transform");
  v15 = v6;
  v16 = v5;
  v18 = v7;
  v17 = v8;
  objc_msgSend(v4, "transform");
  LODWORD(self) = vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v16, v9), (int8x16_t)vceqq_f32(v15, v10)), vandq_s8((int8x16_t)vceqq_f32(v18, v11), (int8x16_t)vceqq_f32(v17, v12))));

  return self >> 31;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &self[1], 64);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("transform"));

  objc_msgSend(v5, "encodeInt:forKey:", self->_referenceCount, CFSTR("referenceCount"));
}

- (PHASESharedEntityDebugInfo)initWithCoder:(id)a3
{
  id v4;
  PHASESharedEntityDebugInfo *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  PHASESharedEntityDebugInfo v9;
  PHASESharedEntityDebugInfo v10;
  PHASESharedEntityDebugInfo v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PHASESharedEntityDebugInfo;
  v5 = -[PHASESharedEntityDebugInfo init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transform"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "getBytes:length:", &v5[1], 64);
    }
    else
    {
      v8 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0) + 1024));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "PHASESharedEntityDebug.mm";
        v16 = 1024;
        v17 = 32;
        _os_log_impl(&dword_2164CC000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d PHASESharedEntityDebugInfo does not have transform object", buf, 0x12u);
      }
      v10 = *(PHASESharedEntityDebugInfo *)(MEMORY[0x24BDAEE00] + 32);
      v9 = *(PHASESharedEntityDebugInfo *)(MEMORY[0x24BDAEE00] + 48);
      v11 = *(PHASESharedEntityDebugInfo *)(MEMORY[0x24BDAEE00] + 16);
      v5[1] = *(PHASESharedEntityDebugInfo *)MEMORY[0x24BDAEE00];
      v5[2] = v11;
      v5[3] = v10;
      v5[4] = v9;
    }
    v5->_referenceCount = objc_msgSend(v4, "decodeIntForKey:", CFSTR("referenceCount"));

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<PHASESharedEntityDebugInfo:%p position=[%0.1f, %0.1f, %0.1f], referenceCount=%d>"), self, *(float *)&self[4].super.isa, *((float *)&self[4].super.isa + 1), *(float *)&self[4]._referenceCount, self->_referenceCount);
}

- (__n128)setTransform:(__n128)a3
{
  result[1] = a2;
  result[2] = a3;
  result[3] = a4;
  result[4] = a5;
  return result;
}

- (void)setReferenceCount:(int)a3
{
  self->_referenceCount = a3;
}

- (__n128)transform
{
  return a1[1];
}

- (int)referenceCount
{
  return self->_referenceCount;
}

@end
