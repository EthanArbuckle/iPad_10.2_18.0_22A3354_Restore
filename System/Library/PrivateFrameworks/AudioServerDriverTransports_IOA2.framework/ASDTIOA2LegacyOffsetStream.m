@implementation ASDTIOA2LegacyOffsetStream

- (id)readInputBlock
{
  void *v3;
  double v4;
  void *v5;
  _QWORD v7[6];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ASDTIOA2LegacyOffsetStream;
  -[ASDTStream readInputBlock](&v8, sel_readInputBlock);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double)-[ASDTIOA2LegacyOffsetStream sampleTimeOffset](self, "sampleTimeOffset");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    -[ASDTIOA2LegacyOffsetStream readInputBlock].cold.1(v4);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__ASDTIOA2LegacyOffsetStream_readInputBlock__block_invoke;
  v7[3] = &unk_25084BCC0;
  *(double *)&v7[5] = v4;
  v7[4] = v3;
  v5 = (void *)MEMORY[0x23B8030C8](v7);

  return v5;
}

uint64_t __44__ASDTIOA2LegacyOffsetStream_readInputBlock__block_invoke(uint64_t a1, uint64_t a2, _OWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v8 = a3[11];
  v22 = a3[10];
  v23 = v8;
  v9 = a3[13];
  v24 = a3[12];
  v25 = v9;
  v10 = a3[7];
  v18 = a3[6];
  v19 = v10;
  v11 = a3[9];
  v20 = a3[8];
  v21 = v11;
  v12 = a3[3];
  v16[2] = a3[2];
  v16[3] = v12;
  v13 = a3[5];
  v16[4] = a3[4];
  v17 = v13;
  v14 = a3[1];
  v16[0] = *a3;
  v16[1] = v14;
  *(double *)&v17 = *(double *)&v17 - *(double *)(a1 + 40);
  return (*(uint64_t (**)(_QWORD, uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, v16, a4, a5, a6, a7, a8);
}

- (int64_t)sampleTimeOffset
{
  return self->_sampleTimeOffset;
}

- (void)setSampleTimeOffset:(int64_t)a3
{
  self->_sampleTimeOffset = a3;
}

- (void)readInputBlock
{
  int v1;
  double v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 134217984;
  v2 = a1;
  _os_log_debug_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Stream samples offset frames: %1.0lf", (uint8_t *)&v1, 0xCu);
}

@end
