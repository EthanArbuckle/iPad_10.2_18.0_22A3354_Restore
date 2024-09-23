@implementation HMHomePersonManagerSettings(HMD)

- (uint64_t)createHMIExternalPersonManagerSettings
{
  return 0;
}

- (id)createHMIHomePersonManagerSettings
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0D31A88]);
  objc_msgSend(v2, "setFaceClassificationEnabled:", objc_msgSend(a1, "isFaceClassificationEnabled"));
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (uint64_t)createHMPhotosPersonManagerSettings
{
  return 0;
}

@end
