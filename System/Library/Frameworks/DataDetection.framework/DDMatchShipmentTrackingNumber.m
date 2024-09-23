@implementation DDMatchShipmentTrackingNumber

- (DDMatchShipmentTrackingNumber)initWithDDScannerResult:(id)a3
{
  id v4;
  DDMatchShipmentTrackingNumber *v5;
  int v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v12;
  id v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DDMatchShipmentTrackingNumber;
  v5 = -[DDMatch initWithDDScannerResult:](&v14, sel_initWithDDScannerResult_, v4);
  if (v5)
  {
    v12 = 0;
    v13 = 0;
    v6 = objc_msgSend(v4, "getTrackingNumber:carrier:", &v13, &v12);
    v7 = v13;
    v8 = v13;
    v9 = v12;
    v10 = v12;
    if (v6)
    {
      objc_storeStrong((id *)&v5->_carrier, v9);
      objc_storeStrong((id *)&v5->_trackingNumber, v7);
    }

  }
  return v5;
}

- (NSString)carrier
{
  return self->_carrier;
}

- (NSString)trackingNumber
{
  return self->_trackingNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingNumber, 0);
  objc_storeStrong((id *)&self->_carrier, 0);
}

@end
