@implementation INRideOption(WFRideOptionsLoader)

- (BOOL)wf_isAvailableForPartySize:()WFRideOptionsLoader
{
  void *v5;
  uint64_t v6;
  _BOOL8 v7;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  objc_msgSend(a1, "availablePartySizeOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = 1;
  if (a3 && v6)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    objc_msgSend(a1, "availablePartySizeOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __64__INRideOption_WFRideOptionsLoader__wf_isAvailableForPartySize___block_invoke;
    v10[3] = &unk_24F8B2BD8;
    v10[4] = &v11;
    v10[5] = a3;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

    v7 = *((_BYTE *)v12 + 24) != 0;
    _Block_object_dispose(&v11, 8);
  }
  return v7;
}

@end
