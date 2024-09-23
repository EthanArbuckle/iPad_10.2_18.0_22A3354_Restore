@implementation CDPCombinedWalrusStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)mismatchDetected
{
  return -[CDPCombinedWalrusStatus octagonWalrusStatus](self, "octagonWalrusStatus") == 2
      && -[CDPCombinedWalrusStatus pcsWalrusStatus](self, "pcsWalrusStatus") == 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t octagonWalrusStatus;
  id v5;

  octagonWalrusStatus = self->_octagonWalrusStatus;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", octagonWalrusStatus, CFSTR("_octagonWalrusStatus"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_pcsWalrusStatus, CFSTR("_pcsWalrusStatus"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_escrowWalrusStatus, CFSTR("_escrowWalrusStatus"));

}

- (CDPCombinedWalrusStatus)initWithCoder:(id)a3
{
  id v4;
  CDPCombinedWalrusStatus *v5;

  v4 = a3;
  v5 = -[CDPCombinedWalrusStatus init](self, "init");
  if (v5)
  {
    v5->_octagonWalrusStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_octagonWalrusStatus"));
    v5->_pcsWalrusStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_pcsWalrusStatus"));
    v5->_escrowWalrusStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_escrowWalrusStatus"));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init(CDPCombinedWalrusStatus);
  *((_QWORD *)result + 1) = self->_octagonWalrusStatus;
  *((_QWORD *)result + 2) = self->_pcsWalrusStatus;
  *((_QWORD *)result + 3) = self->_escrowWalrusStatus;
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_octagonWalrusStatus);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_pcsWalrusStatus);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_escrowWalrusStatus);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> Octagon: %@, PCS: %@, Escrow: %@"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)octagonWalrusStatus
{
  return self->_octagonWalrusStatus;
}

- (void)setOctagonWalrusStatus:(unint64_t)a3
{
  self->_octagonWalrusStatus = a3;
}

- (unint64_t)pcsWalrusStatus
{
  return self->_pcsWalrusStatus;
}

- (void)setPcsWalrusStatus:(unint64_t)a3
{
  self->_pcsWalrusStatus = a3;
}

- (unint64_t)escrowWalrusStatus
{
  return self->_escrowWalrusStatus;
}

- (void)setEscrowWalrusStatus:(unint64_t)a3
{
  self->_escrowWalrusStatus = a3;
}

@end
