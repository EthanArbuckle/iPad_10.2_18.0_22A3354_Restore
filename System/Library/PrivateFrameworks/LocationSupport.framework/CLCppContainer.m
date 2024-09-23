@implementation CLCppContainer

- (unint64_t)sizeOfType
{
  return self->_sizeOfType;
}

- (unint64_t)binaryVersion
{
  return self->_binaryVersion;
}

- (const)cppObjectPtr
{
  return self->_cppObjectPtr;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_destructor, 0);
}

+ (id)containerWithObject:(void *)a3 destructor:(id)a4 binaryVersion:(unint64_t)a5 typeSize:(unint64_t)a6
{
  id v9;
  CLCppContainer *v10;

  v9 = a4;
  v10 = -[CLCppContainer initWithObject:destructor:binaryVersion:typeSize:]([CLCppContainer alloc], "initWithObject:destructor:binaryVersion:typeSize:", a3, v9, a5, a6);

  return v10;
}

- (void)dealloc
{
  void *v3;
  void (**v4)(void);
  objc_super v5;

  -[CLCppContainer destructor](self, "destructor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CLCppContainer destructor](self, "destructor");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
  -[CLCppContainer setDestructor:](self, "setDestructor:", 0);
  v5.receiver = self;
  v5.super_class = (Class)CLCppContainer;
  -[CLCppContainer dealloc](&v5, sel_dealloc);
}

- (id)destructor
{
  return self->_destructor;
}

- (CLCppContainer)initWithObject:(void *)a3 destructor:(id)a4 binaryVersion:(unint64_t)a5 typeSize:(unint64_t)a6
{
  id v10;
  CLCppContainer *v11;
  CLCppContainer *v12;
  objc_super v14;

  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CLCppContainer;
  v11 = -[CLCppContainer init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[CLCppContainer setCppObjectPtr:](v11, "setCppObjectPtr:", a3);
    -[CLCppContainer setDestructor:](v12, "setDestructor:", v10);
    v12->_binaryVersion = a5;
    v12->_sizeOfType = a6;
  }

  return v12;
}

- (void)setDestructor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setCppObjectPtr:(const void *)a3
{
  self->_cppObjectPtr = a3;
}

- (void)invalidate
{
  void *v3;
  void (**v4)(void);

  -[CLCppContainer destructor](self, "destructor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CLCppContainer destructor](self, "destructor");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
  -[CLCppContainer setDestructor:](self, "setDestructor:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (CLCppContainer)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLCppContainer;
  return -[CLCppContainer init](&v4, sel_init, a3);
}

@end
