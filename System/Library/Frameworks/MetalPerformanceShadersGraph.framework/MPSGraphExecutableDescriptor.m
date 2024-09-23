@implementation MPSGraphExecutableDescriptor

- (MPSGraphExecutableDescriptor)init
{
  MPSGraphExecutableDescriptor *v2;
  uint64_t v3;
  MPSGraphCompilationDescriptor *compilationDescriptor;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPSGraphExecutableDescriptor;
  v2 = -[MPSGraphExecutableDescriptor init](&v6, sel_init);
  v3 = objc_opt_new();
  compilationDescriptor = v2->_compilationDescriptor;
  v2->_compilationDescriptor = (MPSGraphCompilationDescriptor *)v3;

  return v2;
}

- (void)setCompilerOptions:(unint64_t)a3
{
  -[MPSGraphCompilationDescriptor setCompilerOptions:](self->_compilationDescriptor, "setCompilerOptions:", a3);
}

- (unint64_t)compilerOptions
{
  return -[MPSGraphCompilationDescriptor compilerOptions](self->_compilationDescriptor, "compilerOptions");
}

- (id)variableFetchHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setVariableFetchHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (MPSGraphCompilationDescriptor)compilationDescriptor
{
  return (MPSGraphCompilationDescriptor *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCompilationDescriptor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compilationDescriptor, 0);
  objc_storeStrong(&self->_variableFetchHandler, 0);
}

@end
