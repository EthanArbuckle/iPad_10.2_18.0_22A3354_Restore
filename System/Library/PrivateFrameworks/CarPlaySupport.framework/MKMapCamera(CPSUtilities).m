@implementation MKMapCamera(CPSUtilities)

+ (id)_CPS_cameraForRegion:()CPSUtilities withSize:
{
  double v8;
  double v9;
  double v10;
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;

  v22 = a3;
  v23 = a4.n128_u64[0];
  v24 = a5.n128_u64[0];
  v25 = a6.n128_u64[0];
  v20 = a7;
  v21 = a8;
  v19 = a1;
  v18 = a2;
  v14 = MEMORY[0x2207AE3A8]((__n128)*(unint64_t *)&a3, a4, a5, a6);
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v13 = (id)objc_msgSend(MEMORY[0x24BDDB0D0], "_cameraLookingAtMapRect:forViewSize:", v14, v8, v9, v10, v20, v21);
  v12 = v13;
  objc_storeStrong(&v13, 0);
  return v12;
}

@end
