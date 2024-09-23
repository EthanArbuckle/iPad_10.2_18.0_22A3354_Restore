@implementation HMDCameraRecordingMetricUUIDUtilities

+ (id)UUIDRotationSalt
{
  if (UUIDRotationSalt_onceToken != -1)
    dispatch_once(&UUIDRotationSalt_onceToken, &__block_literal_global_80722);
  return (id)UUIDRotationSalt__UUIDRotationSalt;
}

+ (id)ephemeralUUIDWithUUID:(id)a3 forTimestamp:(unint64_t)a4 rotationSchedule:(unint64_t)a5
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  unint64_t v14;

  v14 = a4 / a5;
  v5 = (void *)MEMORY[0x1E0C99DF0];
  v6 = a3;
  objc_msgSend(v5, "dataWithBytes:length:", &v14, 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "UUIDRotationSalt");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendData:", v8);

  objc_msgSend(v6, "hm_convertToData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "appendData:", v9);
  v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v7, "hm_generateSHA1");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = (void *)objc_msgSend(v10, "initWithUUIDBytes:", objc_msgSend(v11, "bytes"));

  return v12;
}

+ (id)currentEphemeralUUIDWithUUID:(id)a3 rotationScheduleDays:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  double v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a3;
  objc_msgSend(v6, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(a1, "ephemeralUUIDWithUUID:forTimestamp:rotationScheduleDays:", v7, (unint64_t)(v9 * 1000.0), a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)ephemeralUUIDWithUUID:(id)a3 forTimestamp:(unint64_t)a4 rotationScheduleDays:(unint64_t)a5
{
  return (id)objc_msgSend(a1, "ephemeralUUIDWithUUID:forTimestamp:rotationSchedule:", a3, a4, 86400000 * a5);
}

void __57__HMDCameraRecordingMetricUUIDUtilities_UUIDRotationSalt__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0C99D50];
  objc_msgSend(CFSTR("4CB147FB-C2E8-40AA-913F-119C13110BD0"), "dataUsingEncoding:", 4);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v0, "dataWithBytes:length:", objc_msgSend(v3, "bytes"), objc_msgSend(CFSTR("4CB147FB-C2E8-40AA-913F-119C13110BD0"), "length"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)UUIDRotationSalt__UUIDRotationSalt;
  UUIDRotationSalt__UUIDRotationSalt = v1;

}

@end
