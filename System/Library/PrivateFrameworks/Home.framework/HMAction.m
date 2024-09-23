@implementation HMAction

void __53__HMAction_HFAdditions__hf_affectedAccessoryProfiles__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED379AE8;
  qword_1ED379AE8 = v0;

}

id __54__HMAction_HFAdditions__hf_isServiceLikeItemInvolved___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __59__HMAction_HFAdditions__hf_affectedAccessoryRepresentables__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED379AF8;
  qword_1ED379AF8 = v0;

}

@end
