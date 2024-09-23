@implementation HMDBufferingStructureDataFilter

- (HMDBufferingStructureDataFilter)initWithUnderlyingWriter:(id)a3 block:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMDBufferingStructureDataFilter *v10;
  HMDBufferingStructureDataFilter *v11;
  void *v12;
  id block;
  HMDBufferingStructureDataFilter *v15;
  SEL v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v15 = (HMDBufferingStructureDataFilter *)_HMFPreconditionFailure();
    return (HMDBufferingStructureDataFilter *)-[HMDBufferingStructureDataFilter error](v15, v16);
  }
  v17.receiver = self;
  v17.super_class = (Class)HMDBufferingStructureDataFilter;
  v10 = -[HMDStructuredDataFoundationWriter initWithMutableContainers:](&v17, sel_initWithMutableContainers_, 1);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_writer, a3);
    v12 = _Block_copy(v9);
    block = v11->_block;
    v11->_block = v12;

  }
  return v11;
}

- (id)error
{
  return -[HMDStructuredWriter error](self->_writer, "error");
}

- (void)failWithError:(id)a3
{
  -[HMDStructuredWriter failWithError:](self->_writer, "failWithError:", a3);
}

- (void)emitRootValue:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  HMDStructuredWriter *writer;
  void *v8;

  (*((void (**)(void))self->_block + 2))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = v5;
  writer = self->_writer;
  if (v4)
  {
    -[HMDStructuredWriter writeLogicalValue:](writer, "writeLogicalValue:", v4);
  }
  else if (v5)
  {
    -[HMDStructuredWriter failWithError:](writer, "failWithError:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDStructuredWriter failWithError:](writer, "failWithError:", v8);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_writer, 0);
}

@end
