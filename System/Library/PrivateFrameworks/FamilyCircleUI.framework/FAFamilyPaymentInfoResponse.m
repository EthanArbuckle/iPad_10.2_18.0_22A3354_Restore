@implementation FAFamilyPaymentInfoResponse

- (FAFamilyPaymentInfoResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  FAFamilyPaymentInfoResponse *v4;
  FAFamilyPaymentInfoResponse *v5;
  uint64_t v6;
  void *v7;
  FAFamilyCreditCard *v8;
  FAFamilyCreditCard *creditCard;
  FAFamilyCreditCard *v10;
  void *v11;
  FAFamilyCreditCard *v12;
  void *v13;
  FAFamilyCreditCard *v14;
  void *v15;
  FAFamilyCreditCard *v16;
  void *v17;
  FAFamilyCreditCard *v18;
  void *v19;
  void *v20;
  FAFamilyCreditCard *v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)FAFamilyPaymentInfoResponse;
  v4 = -[AAResponse initWithHTTPResponse:data:](&v24, sel_initWithHTTPResponse_data_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (int)*MEMORY[0x24BE04A98];
    objc_msgSend(*(id *)((char *)&v4->super.super.isa + v6), "objectForKeyedSubscript:", CFSTR("payment-type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("credit-card")))
    {
      v8 = objc_alloc_init(FAFamilyCreditCard);
      creditCard = v5->_creditCard;
      v5->_creditCard = v8;

      v10 = v5->_creditCard;
      objc_msgSend(*(id *)((char *)&v5->super.super.isa + v6), "objectForKeyedSubscript:", CFSTR("card-details"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[FAFamilyCreditCard setDetails:](v10, "setDetails:", v11);

      v12 = v5->_creditCard;
      objc_msgSend(*(id *)((char *)&v5->super.super.isa + v6), "objectForKeyedSubscript:", CFSTR("card-footer"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[FAFamilyCreditCard setFooter:](v12, "setFooter:", v13);

      v14 = v5->_creditCard;
      objc_msgSend(*(id *)((char *)&v5->super.super.isa + v6), "objectForKeyedSubscript:", CFSTR("payment-sub-label"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[FAFamilyCreditCard setProviderDescription:](v14, "setProviderDescription:", v15);

      v16 = v5->_creditCard;
      objc_msgSend(*(id *)((char *)&v5->super.super.isa + v6), "objectForKeyedSubscript:", CFSTR("credit-card-type"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[FAFamilyCreditCard setType:](v16, "setType:", v17);

      v18 = v5->_creditCard;
      objc_msgSend(*(id *)((char *)&v5->super.super.isa + v6), "objectForKeyedSubscript:", CFSTR("payment-description"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[FAFamilyCreditCard setUsageNotice:](v18, "setUsageNotice:", v19);

      objc_msgSend(*(id *)((char *)&v5->super.super.isa + v6), "objectForKeyedSubscript:", CFSTR("credit-card-image-url"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = v5->_creditCard;
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[FAFamilyCreditCard setImageURL:](v21, "setImageURL:", v22);

      }
    }

  }
  return v5;
}

- (FAFamilyCreditCard)creditCard
{
  return self->_creditCard;
}

- (void)setCreditCard:(id)a3
{
  objc_storeStrong((id *)&self->_creditCard, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creditCard, 0);
}

@end
