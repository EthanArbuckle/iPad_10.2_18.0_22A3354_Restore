@implementation IDSCTPNRInfo

- (IDSCTPNRInfo)initWithIMSI:(id)a3 PLMN:(id)a4 PNRPhoneNumber:(id)a5 phoneBookNumber:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  IDSCTPNRInfo *v15;
  IDSCTPNRInfo *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IDSCTPNRInfo;
  v15 = -[IDSCTPNRInfo init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_IMSI, a3);
    objc_storeStrong((id *)&v16->_PLMN, a4);
    objc_storeStrong((id *)&v16->_PNRPhoneNumber, a5);
    objc_storeStrong((id *)&v16->_phoneBookNumber, a6);
  }

  return v16;
}

- (NSString)PLMN
{
  return self->_PLMN;
}

- (void)setPLMN:(id)a3
{
  objc_storeStrong((id *)&self->_PLMN, a3);
}

- (NSString)IMSI
{
  return self->_IMSI;
}

- (void)setIMSI:(id)a3
{
  objc_storeStrong((id *)&self->_IMSI, a3);
}

- (NSString)PNRPhoneNumber
{
  return self->_PNRPhoneNumber;
}

- (void)setPNRPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_PNRPhoneNumber, a3);
}

- (NSString)phoneBookNumber
{
  return self->_phoneBookNumber;
}

- (void)setPhoneBookNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneBookNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneBookNumber, 0);
  objc_storeStrong((id *)&self->_PNRPhoneNumber, 0);
  objc_storeStrong((id *)&self->_IMSI, 0);
  objc_storeStrong((id *)&self->_PLMN, 0);
}

@end
