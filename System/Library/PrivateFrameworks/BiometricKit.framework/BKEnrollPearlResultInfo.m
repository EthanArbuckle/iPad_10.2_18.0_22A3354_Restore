@implementation BKEnrollPearlResultInfo

- (BKEnrollPearlResultInfo)initWithServerIdentity:(id)a3 details:(id)a4 device:(id)a5
{
  id v8;
  BKEnrollPearlResultInfo *v9;
  BKEnrollPearlResultInfo *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKEnrollPearlResultInfo;
  v9 = -[BKEnrollResultInfo initWithServerIdentity:details:device:](&v14, sel_initWithServerIdentity_details_device_, a3, v8, a5);
  v10 = v9;
  if (v8 && v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BKEnrollDetailGlassesDetected"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      v10->_glassesDetected = objc_msgSend(v11, "BOOLValue");

  }
  return v10;
}

- (BOOL)glassesDetected
{
  return self->_glassesDetected;
}

@end
