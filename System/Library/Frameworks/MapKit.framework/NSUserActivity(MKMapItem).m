@implementation NSUserActivity(MKMapItem)

- (id)mapItem
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;

  objc_msgSend(a1, "_internalUserActivity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForIdentifier:", CFSTR("UAMKMapItemPayload"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(v1, "payloadForIdentifier:", CFSTR("UAMKMapItemPayload"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v6 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 0, 0, &v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        +[MKMapItem mapItemWithDictionary:](MKMapItem, "mapItemWithDictionary:", v4);
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v2)
          NSLog(CFSTR("Failed to initialize map item from encoded data."));
        objc_msgSend(v1, "setPayload:object:identifier:", v3, v2, CFSTR("UAMKMapItemPayload"));
      }
      else
      {
        NSLog(CFSTR("Failed to deserialize map item: %@"), v6);
        v2 = 0;
      }

    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

- (void)setMapItem:()MKMapItem
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(a1, "_internalUserActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForIdentifier:", CFSTR("UAMKMapItemPayload"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v7)
  {
    objc_msgSend(v4, "setPayloadIdentifier:object:withBlock:", CFSTR("UAMKMapItemPayload"), v7, &__block_literal_global_100);
    objc_msgSend(a1, "_mapkit_populateFieldsForDonationOfMapItem:", v7);
  }
  else
  {
    if (v5)
      objc_msgSend(v4, "setPayloadIdentifier:object:withBlock:", CFSTR("UAMKMapItemPayload"), 0, 0);
    objc_msgSend(a1, "_mapkit_clearMapItemDonationFields");
  }

}

@end
