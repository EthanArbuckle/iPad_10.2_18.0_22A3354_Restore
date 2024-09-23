@implementation HFServiceLikeItemUpdateResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standardResults, 0);
  objc_storeStrong((id *)&self->_readResponse, 0);
  objc_storeStrong((id *)&self->_displayMetadata, 0);
}

- (HFServiceLikeItemUpdateResponse)initWithDisplayMetadata:(id)a3 readResponse:(id)a4 standardResults:(id)a5
{
  id v9;
  id v10;
  id v11;
  HFServiceLikeItemUpdateResponse *v12;
  HFServiceLikeItemUpdateResponse *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HFServiceLikeItemUpdateResponse;
  v12 = -[HFServiceLikeItemUpdateResponse init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_displayMetadata, a3);
    objc_storeStrong((id *)&v13->_readResponse, a4);
    objc_storeStrong((id *)&v13->_standardResults, a5);
  }

  return v13;
}

- (HFCharacteristicBatchReadResponse)readResponse
{
  return self->_readResponse;
}

- (HFCharacteristicValueDisplayMetadata)displayMetadata
{
  return self->_displayMetadata;
}

- (NSDictionary)standardResults
{
  return self->_standardResults;
}

@end
