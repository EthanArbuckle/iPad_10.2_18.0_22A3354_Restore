@implementation ENSecKey

- (ENSecKey)initWithKeyRef:(__SecKey *)a3
{
  ENSecKey *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ENSecKey;
  v4 = -[ENSecKey init](&v6, sel_init);
  if (v4)
  {
    CFRetain(a3);
    v4->_keyRef = a3;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_keyRef);
  v3.receiver = self;
  v3.super_class = (Class)ENSecKey;
  -[ENSecKey dealloc](&v3, sel_dealloc);
}

+ (id)keyFromBase64String:(id)a3 keyClass:(__CFString *)a4 error:(id *)a5
{
  id v6;
  const void *v7;
  const void *v8;
  ENSecKey *v9;

  v6 = a3;
  if (!v6)
  {
    if (a5)
    {
      ENErrorF();
      v9 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
LABEL_7:
    v9 = 0;
    goto LABEL_4;
  }
  v7 = (const void *)ENCopyPublicKeyFromBase64String();
  if (!v7)
    goto LABEL_7;
  v8 = v7;
  CFAutorelease(v7);
  v9 = -[ENSecKey initWithKeyRef:]([ENSecKey alloc], "initWithKeyRef:", v8);
LABEL_4:

  return v9;
}

- (__SecKey)keyRef
{
  return self->_keyRef;
}

@end
