@implementation CRPunchoutCommand

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRPunchoutCommand;
  v5 = -[CRBasicPayloadCommand copyWithZone:](&v9, sel_copyWithZone_);
  -[CRPunchoutCommand punchout](self, "punchout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setPunchout:", v7);

  return v5;
}

- (SFPunchout)punchout
{
  return self->_punchout;
}

- (void)setPunchout:(id)a3
{
  objc_storeStrong((id *)&self->_punchout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_punchout, 0);
}

@end
