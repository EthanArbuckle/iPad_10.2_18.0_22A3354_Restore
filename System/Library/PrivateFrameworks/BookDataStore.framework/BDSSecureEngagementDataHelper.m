@implementation BDSSecureEngagementDataHelper

+ (id)mergedTimeSliceDataLocal:(id)a3 remote:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  v7 = sub_227E5F1E0();
  v9 = v8;

  v10 = sub_227E5F1E0();
  v12 = v11;

  swift_getObjCClassMetadata();
  v13 = static SecureEngagementDataHelper.mergedTimeSliceData(local:remote:)(v7, v9, v10, v12);
  v15 = v14;
  sub_227DD1FD4(v10, v12);
  sub_227DD1FD4(v7, v9);
  if (v15 >> 60 == 15)
  {
    v16 = 0;
  }
  else
  {
    v16 = (void *)sub_227E5F1D4();
    sub_227DD7918(v13, v15);
  }
  return v16;
}

+ (BOOL)isEngagementTimeSliceDataEmpty:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = a3;
  v4 = sub_227E5F1E0();
  v6 = v5;

  LOBYTE(v3) = _s13BookDataStore016SecureEngagementB6HelperC7isEmpty9timeSliceSb10Foundation0B0V_tFZ_0(v4, v6);
  sub_227DD1FD4(v4, v6);
  return v3 & 1;
}

- (BDSSecureEngagementDataHelper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SecureEngagementDataHelper();
  return -[BDSSecureEngagementDataHelper init](&v3, sel_init);
}

@end
