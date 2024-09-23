@implementation MTLDebugFunction

- (id)formattedDescription:(unint64_t)a3
{
  return &stru_24F795D30;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLDebugFunction;
  -[MTLToolsFunction dealloc](&v3, sel_dealloc);
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3
{
  return (id)newArgumentEncoder(self, a3, 0, 0, 0);
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 pipelineLibrary:(id)a4
{
  return (id)newArgumentEncoder(self, a3, 0, a4, 0);
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4
{
  return (id)newArgumentEncoder(self, a3, a4, 0, 0);
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 pipelineLibrary:(id)a5
{
  return (id)newArgumentEncoder(self, a3, a4, a5, 0);
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 binaryArchives:(id)a5
{
  return (id)newArgumentEncoder(self, a3, a4, 0, a5);
}

- (id)importedSymbols
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "importedSymbols");
}

- (id)importedLibraries
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "importedLibraries");
}

- (id)bitcodeData
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "bitcodeData");
}

- (MTLFunctionConstantValues)constantValues
{
  return (MTLFunctionConstantValues *)objc_getProperty(self, a2, 48, 1);
}

- (void)setConstantValues:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

@end
