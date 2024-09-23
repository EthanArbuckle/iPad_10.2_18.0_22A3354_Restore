@implementation _ActivityRemoteDataGathererManager

+ (void)gatherDataWithActivitySummaryDataProvider:(id)a3 monthDateInterval:(id)a4 sixMonthDateInterval:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __130___ActivityRemoteDataGathererManager_gatherDataWithActivitySummaryDataProvider_monthDateInterval_sixMonthDateInterval_completion___block_invoke;
  v17[3] = &unk_1E9C40210;
  v18 = v9;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  v16 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v17);

}

@end
