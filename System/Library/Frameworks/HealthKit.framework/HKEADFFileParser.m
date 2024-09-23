@implementation HKEADFFileParser

- (HKEADFFileParser)initWithData:(id)a3
{
  id v5;
  HKEADFFileParser *v6;
  HKEADFFileParser *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKEADFFileParser;
  v6 = -[HKEADFFileParser init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_data, a3);

  return v7;
}

- (void)_enumerateHeadersWithHandler:(id)a3
{
  unint64_t v3;
  void (**v5)(id, uint64_t, unint64_t, uint64_t, uint64_t, char *);
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  unsigned int v14;

  v5 = (void (**)(id, uint64_t, unint64_t, uint64_t, uint64_t, char *))a3;
  v6 = 0;
  do
  {
    v7 = v6 + 12;
    -[HKEADFFileParser data](self, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v6 + 12 > v9)
      break;
    v14 = 0;
    v13 = 0;
    -[HKEADFFileParser data](self, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "getBytes:range:", &v13, v6, 12);

    v11 = HIDWORD(v13);
    v12 = 0;
    v3 = v3 & 0xFFFFFFFF00000000 | v14;
    v5[2](v5, v13, v3, v7, 4 * HIDWORD(v13), &v12);
    v6 = v7 + 4 * v11;
  }
  while (!v12);

}

- (void)enumerateChannelsWithHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__HKEADFFileParser_enumerateChannelsWithHandler___block_invoke;
  v6[3] = &unk_1E37F2F28;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HKEADFFileParser _enumerateHeadersWithHandler:](self, "_enumerateHeadersWithHandler:", v6);

}

void __49__HKEADFFileParser_enumerateChannelsWithHandler___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  void *v5;
  id v6;

  if (*(float *)&a3 <= 0.0)
  {
    v6 = 0;
  }
  else
  {
    +[HKUnit hertzUnit](HKUnit, "hertzUnit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v5, *(float *)&a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)payloadInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;
  void *v6;

  length = a3.length;
  location = a3.location;
  -[HKEADFFileParser data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subdataWithRange:", location, length);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)newBuilderWithStartDate:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  _DWORD *v7;
  HKElectrocardiogramBuilder *v8;
  HKElectrocardiogramBuilder *v9;
  double v10;
  uint64_t v11;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__41;
  v25 = __Block_byref_object_dispose__41;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__41;
  v19 = __Block_byref_object_dispose__41;
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __44__HKEADFFileParser_newBuilderWithStartDate___block_invoke;
  v14[3] = &unk_1E37F2F50;
  v14[4] = &v21;
  v14[5] = &v15;
  -[HKEADFFileParser enumerateChannelsWithHandler:](self, "enumerateChannelsWithHandler:", v14);
  v5 = (void *)v22[5];
  if (v5 && v16[5])
  {
    v6 = objc_msgSend(v5, "length");
    v7 = (_DWORD *)((char *)&v14[-1] - ((4 * (v6 >> 2) + 15) & 0xFFFFFFFFFFFFFFF0));
    objc_msgSend((id)v22[5], "getBytes:length:", v7, v6 & 0xFFFFFFFFFFFFFFFCLL);
    v8 = [HKElectrocardiogramBuilder alloc];
    v9 = -[HKElectrocardiogramBuilder initWithStartDate:frequency:](v8, "initWithStartDate:frequency:", v4, v16[5]);
    if (v6 >= 4)
    {
      if (v6 >> 2 <= 1)
        v11 = 1;
      else
        v11 = v6 >> 2;
      do
      {
        LODWORD(v10) = *v7;
        -[HKElectrocardiogramBuilder addValue:lead:](v9, "addValue:lead:", 1, v10);
        ++v7;
        --v11;
      }
      while (v11);
    }
  }
  else
  {
    v9 = 0;
  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v9;
}

void __44__HKEADFFileParser_newBuilderWithStartDate___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v12 = a6;
  if (a3 == 503)
  {
    v16 = v12;
    objc_msgSend(a2, "payloadInRange:", a4, a5);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a6);
    v12 = v16;
  }

}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
