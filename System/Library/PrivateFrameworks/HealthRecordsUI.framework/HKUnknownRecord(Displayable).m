@implementation HKUnknownRecord(Displayable)

- (uint64_t)title
{
  return HRLocalizedString(CFSTR("UNKNOWN_DETAIL_TITLE"));
}

- (uint64_t)titleDisplayStringForDetailViewController
{
  return HRLocalizedString(CFSTR("RECORD_DETAIL_UNKNOWN_RECORD_TITLE"));
}

- (const)meaningfulDateString
{
  return &stru_1E74EA150;
}

- (void)fetchDetailItemsWithHealthRecordsStore:()Displayable conceptStore:completion:
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v7 = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __95__HKUnknownRecord_Displayable__fetchDetailItemsWithHealthRecordsStore_conceptStore_completion___block_invoke;
  v9[3] = &unk_1E74D17B8;
  v9[4] = a1;
  v10 = v7;
  v8 = v7;
  objc_msgSend(a3, "stringifyExtractionFailureReasonsForRecord:completion:", a1, v9);

}

@end
