@implementation MBDigestSHA256

- (MBDigestSHA256)init
{
  MBDigestSHA256 *v2;
  MBDigestSHA256 *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MBDigestSHA256;
  v2 = -[MBDigestSHA256 init](&v5, sel_init);
  v3 = v2;
  if (v2)
    CC_SHA256_Init(&v2->_context);
  return v3;
}

- (void)updateWithBytes:(const void *)a3 length:(unint64_t)a4
{
  unint64_t v6;
  CC_SHA256_CTX *p_context;
  unint64_t v8;
  unint64_t v9;
  CC_LONG v10;

  if (a4)
  {
    v6 = 0;
    p_context = &self->_context;
    v8 = a4;
    do
    {
      v9 = v8 - 0x4000;
      if (v8 >= 0x4000)
        v10 = 0x4000;
      else
        v10 = v8;
      CC_SHA256_Update(p_context, (char *)a3 + v6, v10);
      v6 += 0x4000;
      v8 = v9;
    }
    while (v6 < a4);
  }
}

- (void)finalWithBytes:(void *)a3 length:(unint64_t)a4
{
  if (a4 != 32)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDigest.m"), 327, CFSTR("Incorrect SHA256 digest length"));
  CC_SHA256_Final((unsigned __int8 *)a3, &self->_context);
}

- (id)final
{
  _BYTE v3[32];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[MBDigestSHA256 finalWithBytes:length:](self, "finalWithBytes:length:", v3, 32);
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v3, 32);
}

@end
