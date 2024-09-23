@implementation HKEmergencyContact

void __60___HKEmergencyContact_emergencyContactWithContact_property___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;

  v7 = *(void **)(a1 + 32);
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "setPhoneNumber:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setPhoneNumberContactIdentifier:", v8);

  objc_msgSend(*(id *)(a1 + 32), "setPhoneNumberLabel:", v9);
}

@end
