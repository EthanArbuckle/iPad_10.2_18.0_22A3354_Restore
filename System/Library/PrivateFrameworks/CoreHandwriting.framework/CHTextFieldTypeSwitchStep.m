@implementation CHTextFieldTypeSwitchStep

- (id)initProcessorDefault:(id)a3 processorDigits:(id)a4 processorPhone:(id)a5 processorUsername:(id)a6 processorEmail:(id)a7 processorURL:(id)a8 processorASCII:(id)a9 processorEquation:(id)a10
{
  id v17;
  CHTextFieldTypeSwitchStep *v18;
  id *p_isa;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v17 = a3;
  v27 = a4;
  v26 = a5;
  v25 = a6;
  v24 = a7;
  v23 = a8;
  v22 = a9;
  v21 = a10;
  v28.receiver = self;
  v28.super_class = (Class)CHTextFieldTypeSwitchStep;
  v18 = -[CHTextFieldTypeSwitchStep init](&v28, sel_init);
  p_isa = (id *)&v18->super.super.super.isa;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_defaultProcessor, a3);
    objc_storeStrong(p_isa + 1, a4);
    objc_storeStrong(p_isa + 2, a5);
    objc_storeStrong(p_isa + 3, a6);
    objc_storeStrong(p_isa + 4, a7);
    objc_storeStrong(p_isa + 5, a8);
    objc_storeStrong(p_isa + 6, a9);
    objc_storeStrong(p_isa + 7, a10);
  }

  return p_isa;
}

- (id)process:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  CHPostProcessingManager *digitProcessor;

  v6 = a3;
  v7 = a4;
  switch(objc_msgSend_contentType(v6, v8, v9, v10, v11, v12))
  {
    case 0u:
      objc_msgSend_defaultProcessor(self, v13, v14, v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1BE8A3A04(self, v6, v18, v7);
      self = (CHTextFieldTypeSwitchStep *)objc_claimAutoreleasedReturnValue();

      break;
    case 1u:
      if (self)
        digitProcessor = self->_digitProcessor;
      else
        digitProcessor = 0;
      goto LABEL_17;
    case 2u:
      if (self)
        digitProcessor = self->_phoneProcessor;
      else
        digitProcessor = 0;
      goto LABEL_17;
    case 3u:
      if (self)
        digitProcessor = self->_usernameProcessor;
      else
        digitProcessor = 0;
      goto LABEL_17;
    case 4u:
      if (self)
        digitProcessor = self->_emailProcessor;
      else
        digitProcessor = 0;
      goto LABEL_17;
    case 5u:
      if (self)
        digitProcessor = self->_urlProcessor;
      else
        digitProcessor = 0;
      goto LABEL_17;
    case 6u:
      if (self)
        digitProcessor = self->_asciiProcessor;
      else
        digitProcessor = 0;
      goto LABEL_17;
    case 7u:
      if (self)
        digitProcessor = self->_equationProcessor;
      else
        digitProcessor = 0;
LABEL_17:
      sub_1BE8A3A04(self, v6, digitProcessor, v7);
      self = (CHTextFieldTypeSwitchStep *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }

  return self;
}

- (CHPostProcessingManager)defaultProcessor
{
  return self->_defaultProcessor;
}

- (void)setDefaultProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_defaultProcessor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultProcessor, 0);
  objc_storeStrong((id *)&self->_equationProcessor, 0);
  objc_storeStrong((id *)&self->_asciiProcessor, 0);
  objc_storeStrong((id *)&self->_urlProcessor, 0);
  objc_storeStrong((id *)&self->_emailProcessor, 0);
  objc_storeStrong((id *)&self->_usernameProcessor, 0);
  objc_storeStrong((id *)&self->_phoneProcessor, 0);
  objc_storeStrong((id *)&self->_digitProcessor, 0);
}

@end
