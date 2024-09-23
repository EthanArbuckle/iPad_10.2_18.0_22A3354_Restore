@implementation RAWOpcodeMapTable

- (RAWOpcodeMapTable)initWithArguments:(id)a3
{
  id v4;
  RAWOpcodeMapTable *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  RAWOpcodeMapTable *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RAWOpcodeMapTable;
  v5 = -[RAWOpcodeMapTable init](&v11, sel_init);
  v9 = v5;
  if (v5)
    objc_msgSend_setArguments_(v5, v6, (uint64_t)v4, v7, v8);

  return v9;
}

- (id)outputImage
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_kernelWithString_(MEMORY[0x1E0C9DD88], a2, (uint64_t)CFSTR("kernel vec4 rc_map_table (__sample c) { return c; }"),
    v2,
    v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputImage(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(v10, v11, v12, v13, v14);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v31[0] = self->inputImage;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v23, (uint64_t)v31, 1, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applyWithExtent_arguments_(v5, v26, (uint64_t)v25, v27, v28, v16, v18, v20, v22);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSDictionary)arguments
{
  return self->arguments;
}

- (void)setArguments:(id)a3
{
  objc_storeStrong((id *)&self->arguments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->arguments, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
