@implementation HMCameraActivityZone

id __66__HMCameraActivityZone_HMI__createHMIActivityZoneWithIsInclusion___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v2 = (objc_class *)MEMORY[0x1E0D31AA0];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "point");
  v6 = v5;
  v8 = v7;

  return (id)objc_msgSend(v4, "initWithPoint:", v6, v8);
}

@end
