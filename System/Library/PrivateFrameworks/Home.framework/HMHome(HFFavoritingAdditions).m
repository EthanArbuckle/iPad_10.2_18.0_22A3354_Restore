@implementation HMHome(HFFavoritingAdditions)

- (uint64_t)hf_favoriteCameraCountExcludingHomeKitObjects:()HFFavoritingAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(a1, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__HMHome_HFFavoritingAdditions__hf_favoriteCameraCountExcludingHomeKitObjects___block_invoke;
  v10[3] = &unk_1EA727840;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_filter:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

@end
