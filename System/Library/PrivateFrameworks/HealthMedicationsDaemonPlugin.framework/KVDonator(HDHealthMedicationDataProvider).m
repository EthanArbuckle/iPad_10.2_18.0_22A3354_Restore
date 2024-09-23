@implementation KVDonator(HDHealthMedicationDataProvider)

- (void)donateWithOptions:()HDHealthMedicationDataProvider usingDataStream:
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__KVDonator_HDHealthMedicationDataProvider__donateWithOptions_usingDataStream___block_invoke;
  v8[3] = &unk_1E6E00C88;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "donateWithOptions:usingStream:", a3, v8);

}

@end
