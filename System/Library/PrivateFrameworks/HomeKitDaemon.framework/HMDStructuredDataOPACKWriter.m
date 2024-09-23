@implementation HMDStructuredDataOPACKWriter

- (void)emitRootValue:(id)a3
{
  int v4;
  id v5;

  v4 = OPACKEncodeObject();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v4, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDStructuredDataFoundationWriter failWithError:](self, "failWithError:", v5);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_output, 0);
}

@end
