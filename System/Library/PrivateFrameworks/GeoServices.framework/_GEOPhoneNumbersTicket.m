@implementation _GEOPhoneNumbersTicket

- (_GEOPhoneNumbersTicket)initWithPhoneNumbers:(id)a3 allowCellularDataForLookup:(BOOL)a4 traits:(id)a5
{
  id v8;
  _GEOPhoneNumbersTicket *v9;
  uint64_t v10;
  NSArray *phoneNumbers;
  _GEOPhoneNumbersTicket *v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_GEOPhoneNumbersTicket;
  v9 = -[GEOAbstractTicket initWithTraits:](&v14, sel_initWithTraits_, a5);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    phoneNumbers = v9->_phoneNumbers;
    v9->_phoneNumbers = (NSArray *)v10;

    v9->_allowCellularDataForLookup = a4;
    v12 = v9;
  }

  return v9;
}

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSArray *phoneNumbers;
  _BOOL8 allowCellularDataForLookup;
  GEOMapServiceTraits *traits;
  GEODataRequestThrottlerToken *throttlerToken;
  id v17;
  _QWORD v18[5];
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (v9)
  {
    +[GEOPlaceCardRequester sharedRequester](GEOPlaceCardRequester, "sharedRequester");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    phoneNumbers = self->_phoneNumbers;
    allowCellularDataForLookup = self->_allowCellularDataForLookup;
    traits = self->super.super._traits;
    throttlerToken = self->super.super._throttlerToken;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __79___GEOPhoneNumbersTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke;
    v18[3] = &unk_1E1C069B8;
    v18[4] = self;
    v19 = v9;
    v17 = (id)objc_msgSend(v12, "requestPhoneNumbers:allowCellularDataForLookup:traits:auditToken:throttleToken:networkActivity:requesterHandler:", phoneNumbers, allowCellularDataForLookup, traits, v10, throttlerToken, v11, v18);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)_GEOPhoneNumbersTicket;
  -[GEOAbstractTicket description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ phonenumbers: %@"), v4, self->_phoneNumbers);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKind
{
  int v2;
  $C4D369C9F02205611300857CFD58F739 v3;

  v2 = -[GEOMapServiceTraits requestPriority](self->super.super._traits, "requestPriority");
  v3 = ($C4D369C9F02205611300857CFD58F739)0x1700000500;
  if (v2 != 1)
    v3 = ($C4D369C9F02205611300857CFD58F739)0x1700000300;
  if (v2 == 2)
    return ($C4D369C9F02205611300857CFD58F739)0x1700000700;
  else
    return v3;
}

@end
