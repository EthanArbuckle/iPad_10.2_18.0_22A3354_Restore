@implementation CRKIfaddrsEnumerator

+ (id)enumeratorWithError:(id *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithError:", a3);
}

+ (id)internetInterfaceEnumeratorWithError:(id *)a3
{
  void *v3;
  CRKFilteredEnumerator *v4;

  objc_msgSend(a1, "enumeratorWithError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[CRKFilteredEnumerator initWithEnumerator:filterBlock:]([CRKFilteredEnumerator alloc], "initWithEnumerator:filterBlock:", v3, &__block_literal_global_89);
  else
    v4 = 0;

  return v4;
}

uint64_t __61__CRKIfaddrsEnumerator_internetInterfaceEnumeratorWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isInternetInterface");
}

- (void)dealloc
{
  ifaddrs *mInterfaces;
  objc_super v4;

  mInterfaces = self->mInterfaces;
  if (mInterfaces)
    MEMORY[0x219A223C4](mInterfaces, a2);
  v4.receiver = self;
  v4.super_class = (Class)CRKIfaddrsEnumerator;
  -[CRKIfaddrsEnumerator dealloc](&v4, sel_dealloc);
}

- (CRKIfaddrsEnumerator)init
{
  return -[CRKIfaddrsEnumerator initWithError:](self, "initWithError:", 0);
}

- (CRKIfaddrsEnumerator)initWithError:(id *)a3
{
  int v5;
  CRKIfaddrsEnumerator *v6;
  ifaddrs *v8;

  v8 = 0;
  v5 = getifaddrs(&v8);
  if (v5)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v5, 0);
      v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    self = -[CRKIfaddrsEnumerator initWithInterfaces:](self, "initWithInterfaces:", v8);
    v6 = self;
  }

  return v6;
}

- (CRKIfaddrsEnumerator)initWithInterfaces:(ifaddrs *)a3
{
  CRKIfaddrsEnumerator *v4;
  CRKIfaddrsEnumerator *v5;
  CRKIfaddrs *v6;
  CRKIfaddrs *mCurrentInterface;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRKIfaddrsEnumerator;
  v4 = -[CRKIfaddrsEnumerator init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->mInterfaces = a3;
    if (a3)
    {
      v6 = -[CRKIfaddrs initWithIfaddrs:]([CRKIfaddrs alloc], "initWithIfaddrs:", v4->mInterfaces);
      mCurrentInterface = v5->mCurrentInterface;
      v5->mCurrentInterface = v6;

    }
  }
  return v5;
}

- (id)nextObject
{
  CRKIfaddrs *mCurrentInterface;
  CRKIfaddrs *v4;
  CRKIfaddrs *v5;
  CRKIfaddrs *v6;

  mCurrentInterface = self->mCurrentInterface;
  if (mCurrentInterface)
  {
    v4 = mCurrentInterface;
    -[CRKIfaddrs next](self->mCurrentInterface, "next");
    v5 = (CRKIfaddrs *)objc_claimAutoreleasedReturnValue();
    v6 = self->mCurrentInterface;
    self->mCurrentInterface = v5;

  }
  return mCurrentInterface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCurrentInterface, 0);
}

@end
