@implementation FTNetworkDescriptor

- (FTNetworkDescriptor)init
{
  FTNetworkDescriptor *v2;
  FTNetworkDescriptor *v3;
  FTNetworkDescriptor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FTNetworkDescriptor;
  v2 = -[FTNetworkDescriptor init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[FTNetworkDescriptor setOutputNames:](v2, "setOutputNames:", MEMORY[0x24BDBD1A8]);
    v4 = v3;
  }

  return v3;
}

- (id)onlyImageInput
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[FTNetworkDescriptor inputImages](self, "inputImages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 != 1)
    NSLog(CFSTR("Expected exactly one input image. Found: %zd instead."), v4);
  -[FTNetworkDescriptor inputImages](self, "inputImages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSArray)inputImages
{
  return self->_inputImages;
}

- (void)setInputImages:(id)a3
{
  objc_storeStrong((id *)&self->_inputImages, a3);
}

- (NSArray)inputReferences
{
  return self->_inputReferences;
}

- (void)setInputReferences:(id)a3
{
  objc_storeStrong((id *)&self->_inputReferences, a3);
}

- (NSArray)outputNames
{
  return self->_outputNames;
}

- (void)setOutputNames:(id)a3
{
  objc_storeStrong((id *)&self->_outputNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputNames, 0);
  objc_storeStrong((id *)&self->_inputReferences, 0);
  objc_storeStrong((id *)&self->_inputImages, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
