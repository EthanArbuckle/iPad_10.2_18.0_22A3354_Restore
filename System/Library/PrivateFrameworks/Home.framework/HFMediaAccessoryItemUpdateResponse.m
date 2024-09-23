@implementation HFMediaAccessoryItemUpdateResponse

- (HFMediaAccessoryItemUpdateResponse)initWithDisplayMetadata:(id)a3 standardResults:(id)a4
{
  id v7;
  id v8;
  HFMediaAccessoryItemUpdateResponse *v9;
  HFMediaAccessoryItemUpdateResponse *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFMediaAccessoryItemUpdateResponse;
  v9 = -[HFMediaAccessoryItemUpdateResponse init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_displayMetadata, a3);
    objc_storeStrong((id *)&v10->_standardResults, a4);
  }

  return v10;
}

- (HFCharacteristicValueDisplayMetadata)displayMetadata
{
  return self->_displayMetadata;
}

- (NSDictionary)standardResults
{
  return self->_standardResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standardResults, 0);
  objc_storeStrong((id *)&self->_displayMetadata, 0);
}

@end
