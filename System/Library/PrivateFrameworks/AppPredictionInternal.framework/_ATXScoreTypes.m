@implementation _ATXScoreTypes

+ (id)stringForScoreInput:(unint64_t)a3
{
  id result;

  result = CFSTR("_ATXScoreInputAppInFolder");
  switch(a3)
  {
    case 0uLL:
      result = CFSTR("_ATXScoreInputInstallAge");
      break;
    case 1uLL:
      result = CFSTR("_ATXScoreInputLastSpotlightLaunchAge");
      break;
    case 2uLL:
      result = CFSTR("_ATXScoreInputLastLaunchAge");
      break;
    case 3uLL:
      result = CFSTR("_ATXScoreInputMedianSecondsBetweenLaunches");
      break;
    case 4uLL:
      result = CFSTR("_ATXScoreInputAverageSecondsBetweenLaunches");
      break;
    case 5uLL:
      result = CFSTR("_ATXScoreInputUnlockTime");
      break;
    case 6uLL:
      return result;
    case 7uLL:
      result = CFSTR("_ATXScoreInputFolderPage");
      break;
    case 8uLL:
      result = CFSTR("_ATXScoreInputHasSpringBoardPage");
      break;
    case 9uLL:
      result = CFSTR("_ATXScoreInputSpringBoardPage");
      break;
    case 0xAuLL:
      result = CFSTR("_ATXScoreInputOnSpringBoardDock");
      break;
    case 0xBuLL:
      result = CFSTR("_ATXScoreInputFeedback");
      break;
    case 0xCuLL:
      result = CFSTR("_ATXScoreInputFeedbackConfirms");
      break;
    case 0xDuLL:
      result = CFSTR("_ATXScoreInputFeedbackRejects");
      break;
    case 0xEuLL:
      result = CFSTR("_ATXScoreInputAPRExplicitConfirmRatio");
      break;
    case 0xFuLL:
      result = CFSTR("_ATXScoreInputAPRExplicitRejectRatio");
      break;
    case 0x10uLL:
      result = CFSTR("_ATXScoreInputAPRImplicitConfirmRatio");
      break;
    case 0x11uLL:
      result = CFSTR("_ATXScoreInputAPRImplicitRejectRatio");
      break;
    case 0x12uLL:
      result = CFSTR("_ATXScoreInputAPRSiriKitIntentsRatio");
      break;
    case 0x13uLL:
      result = CFSTR("_ATXScoreInputAPRNonSiriKitIntentsRatio");
      break;
    case 0x14uLL:
      result = CFSTR("_ATXScoreInputAPRTotalExplicitConfirms");
      break;
    case 0x15uLL:
      result = CFSTR("_ATXScoreInputAPRTotalExplicitRejects");
      break;
    case 0x16uLL:
      result = CFSTR("_ATXScoreInputAPRTotalImplicitConfirms");
      break;
    case 0x17uLL:
      result = CFSTR("_ATXScoreInputAPRTotalImplicitRejects");
      break;
    case 0x18uLL:
      result = CFSTR("_ATXScoreInputAPRSiriKitTotalIntents");
      break;
    case 0x19uLL:
      result = CFSTR("_ATXScoreInputAPRNonSiriKitTotalIntents");
      break;
    case 0x1AuLL:
      result = CFSTR("_ATXScoreInputLaunchTimePopularity");
      break;
    case 0x1BuLL:
      result = CFSTR("_ATXScoreInputTimeOfDayPopularity");
      break;
    case 0x1CuLL:
      result = CFSTR("_ATXScoreInputCoarseTimeOfDayPopularity");
      break;
    case 0x1DuLL:
      result = CFSTR("_ATXScoreInputLaunchPopularity");
      break;
    case 0x1EuLL:
      result = CFSTR("_ATXScoreInputSpotlightLaunchTimePopularity");
      break;
    case 0x1FuLL:
      result = CFSTR("_ATXScoreInputSpotlightTimeOfDayPopularity");
      break;
    case 0x20uLL:
      result = CFSTR("_ATXScoreInputSpotlightLaunchPopularity");
      break;
    case 0x21uLL:
      result = CFSTR("_ATXScoreInputDayZeroPoints");
      break;
    case 0x22uLL:
      result = CFSTR("_ATXScoreInputStaticAppPoints");
      break;
    case 0x23uLL:
      result = CFSTR("_ATXScoreInputLaunchDayOfWeekPopularity");
      break;
    case 0x24uLL:
      result = CFSTR("_ATXScoreInputDayOfWeekPopularity");
      break;
    case 0x25uLL:
      result = CFSTR("_ATXScoreInputLaunchSequencePopularity");
      break;
    case 0x26uLL:
      result = CFSTR("_ATXScoreInputLaunchLocationPopularity");
      break;
    case 0x27uLL:
      result = CFSTR("_ATXScoreInputAppLaunchMicroLocationPopularity");
      break;
    case 0x28uLL:
      result = CFSTR("_ATXScoreInputEntropyLaunchPopularity");
      break;
    case 0x29uLL:
      result = CFSTR("_ATXScoreInputEntropyDayOfWeekPopularity");
      break;
    case 0x2AuLL:
      result = CFSTR("_ATXScoreInputEntropyDayOfWeekPopularityByDay");
      break;
    case 0x2BuLL:
      result = CFSTR("_ATXScoreInputEntropyDayOfWeekPopularityByApp");
      break;
    case 0x2CuLL:
      result = CFSTR("_ATXScoreInputDistanceDayOfWeekToLaunchPopularity");
      break;
    case 0x2DuLL:
      result = CFSTR("_ATXScoreInputEntropyTrendingPopularity");
      break;
    case 0x2EuLL:
      result = CFSTR("_ATXScoreInputDistanceTrendingToLaunchPopularity");
      break;
    case 0x2FuLL:
      result = CFSTR("_ATXScoreInputEntropySSIDPopularity");
      break;
    case 0x30uLL:
      result = CFSTR("_ATXScoreInputEntropySSIDPopularityBySSID");
      break;
    case 0x31uLL:
      result = CFSTR("_ATXScoreInputEntropySSIDPopularityByApp");
      break;
    case 0x32uLL:
      result = CFSTR("_ATXScoreInputDistanceSSIDToLaunchPopularity");
      break;
    case 0x33uLL:
      result = CFSTR("_ATXScoreInputAppCount");
      break;
    case 0x34uLL:
      result = CFSTR("_ATXScoreInputDistanceToExplicitLaunchPrediction");
      break;
    case 0x35uLL:
      result = CFSTR("_ATXScoreInputSiriKitIntentParzen");
      break;
    case 0x36uLL:
      result = CFSTR("_ATXScoreInputNonSiriKitIntentParzen");
      break;
    case 0x37uLL:
      result = CFSTR("_ATXScoreInputAppDailyDose");
      break;
    case 0x38uLL:
      result = CFSTR("_ATXScoreInputCurrentDose");
      break;
    case 0x39uLL:
      result = CFSTR("_ATXScoreInputAppDailyDoseRemaining");
      break;
    case 0x3AuLL:
      result = CFSTR("_ATXScoreInputAppDailyDoseSmoothedError");
      break;
    case 0x3BuLL:
      result = CFSTR("_ATXScoreInputTotalNumberOfLaunches");
      break;
    case 0x3CuLL:
      result = CFSTR("_ATXScoreInputTotalNumberOfSpotlightLaunches");
      break;
    case 0x3DuLL:
      result = CFSTR("_ATXScoreInputAirplaneModePopularity");
      break;
    case 0x3EuLL:
      result = CFSTR("_ATXScoreInputTotalNumberOfAirplaneModeLaunches");
      break;
    case 0x3FuLL:
      result = CFSTR("_ATXScoreInputTrendingPopularity");
      break;
    case 0x40uLL:
      result = CFSTR("_ATXScoreInputTotalNumberOfTrendingLaunches");
      break;
    case 0x41uLL:
      result = CFSTR("_ATXScoreInputSSIDPopularity");
      break;
    case 0x42uLL:
      result = CFSTR("_ATXScoreInputTotalNumberOfSSIDLaunches");
      break;
    case 0x43uLL:
      result = CFSTR("_ATXScoreInputOnWifi");
      break;
    case 0x44uLL:
      result = CFSTR("_ATXScoreInputCoreMotionPopularity");
      break;
    case 0x45uLL:
      result = CFSTR("_ATXScoreInputTotalNumberOfCoreMotionLaunches");
      break;
    case 0x46uLL:
      result = CFSTR("_ATXScoreInputMagicalMomentsConfidence");
      break;
    case 0x47uLL:
      result = CFSTR("_ATXScoreInputMagicalMomentsPredictionReason");
      break;
    case 0x48uLL:
      result = CFSTR("_ATXScoreInputMagicalMomentsAnchor");
      break;
    case 0x49uLL:
      result = CFSTR("_ATXScoreInputHeroAppConfidence");
      break;
    case 0x4AuLL:
      result = CFSTR("_ATXScoreInputHeroAppPredictionReason");
      break;
    case 0x4BuLL:
      result = CFSTR("_ATXScoreInputMagicalMomentsHeroAppPredictionIndex");
      break;
    case 0x4CuLL:
      result = CFSTR("_ATXScoreInputMagicalMomentsHeroAppPredictionTotalPredictions");
      break;
    case 0x4DuLL:
      result = CFSTR("_ATXScoreInputMostRecentNotificationAge");
      break;
    case 0x4EuLL:
      result = CFSTR("_ATXScoreInputAppPreferenceBundleBoost");
      break;
    case 0x4FuLL:
      result = CFSTR("_ATXScoreInputAppIntentPartOfWeekPopularity");
      break;
    case 0x50uLL:
      result = CFSTR("_ATXScoreInputAppIntentLaunchPartOfWeekPopularity");
      break;
    case 0x51uLL:
      result = CFSTR("_ATXScoreInputGenreTimeOfDayPopularity");
      break;
    case 0x52uLL:
      result = CFSTR("_ATXScoreInputGenreSequencePopularity");
      break;
    case 0x53uLL:
      result = CFSTR("_ATXScoreInputGenreDayOfWeekPopularity");
      break;
    case 0x54uLL:
      result = CFSTR("_ATXScoreInputGenreSpotlightLaunchPopularity");
      break;
    case 0x55uLL:
      result = CFSTR("_ATXScoreInputTrendingGenrePopularity");
      break;
    case 0x56uLL:
      result = CFSTR("_ATXScoreInputGenreAirplaneModePopularity");
      break;
    case 0x57uLL:
      result = CFSTR("_ATXScoreInputGenreDailyDoseRemaining");
      break;
    case 0x58uLL:
      result = CFSTR("_ATXScoreInputGenreLocationPopularity");
      break;
    case 0x59uLL:
      result = CFSTR("_ATXScoreInputGenreSSIDPopularity");
      break;
    case 0x5AuLL:
      result = CFSTR("_ATXScoreInputApp2VecClusterTimeOfDayPopularity");
      break;
    case 0x5BuLL:
      result = CFSTR("_ATXScoreInputApp2VecClusterSequencePopularity");
      break;
    case 0x5CuLL:
      result = CFSTR("_ATXScoreInputApp2VecClusterDayOfWeekPopularity");
      break;
    case 0x5DuLL:
      result = CFSTR("_ATXScoreInputApp2VecClusterTrendingPopularity");
      break;
    case 0x5EuLL:
      result = CFSTR("_ATXScoreInputApp2VecClusterLocationPopularity");
      break;
    case 0x5FuLL:
      result = CFSTR("_ATXScoreInputApp2VecClusterCount");
      break;
    case 0x60uLL:
      result = CFSTR("_ATXScoreInputSupportsMedia");
      break;
    case 0x61uLL:
      result = CFSTR("_ATXScoreInputAppTimeAndDayOfWeekPopularity");
      break;
    case 0x62uLL:
      result = CFSTR("_ATXScoreInputAppPopularityGivenTimeAndDayOfWeek");
      break;
    case 0x63uLL:
      result = CFSTR("_ATXScoreInputAppPopularityOfTimeAndDayOfWeekGivenApp");
      break;
    case 0x64uLL:
      result = CFSTR("_ATXScoreInputAppTotalNumberOfTimeAndDayOfWeekLaunches");
      break;
    case 0x65uLL:
      result = CFSTR("_ATXScoreInputAppIntentCount");
      break;
    case 0x66uLL:
      result = CFSTR("_ATXScoreInputAppIntentSlotCountForAllAppActions");
      break;
    case 0x67uLL:
      result = CFSTR("_ATXScoreInputAppIntentTotalNumberOfLaunches");
      break;
    case 0x68uLL:
      result = CFSTR("_ATXScoreInputAppIntentTotalNumberOfAirplaneModeLaunches");
      break;
    case 0x69uLL:
      result = CFSTR("_ATXScoreInputAppIntentTotalNumberOfSSIDLaunches");
      break;
    case 0x6AuLL:
      result = CFSTR("_ATXScoreInputAppIntentTotalNumberOfCoreMotionLaunches");
      break;
    case 0x6BuLL:
      result = CFSTR("_ATXScoreInputAppIntentTotalNumberOfTrendingLaunches");
      break;
    case 0x6CuLL:
      result = CFSTR("_ATXScoreInputDayOfWeekBucket");
      break;
    case 0x6DuLL:
      result = CFSTR("_ATXScoreInputTimeOfDayBucket");
      break;
    case 0x6EuLL:
      result = CFSTR("_ATXScoreInputIsDateInWeekendOnDevice");
      break;
    case 0x6FuLL:
      result = CFSTR("_ATXScoreInputAppIntentLaunchPopularity");
      break;
    case 0x70uLL:
      result = CFSTR("_ATXScoreInputAppIntentTrendingPopularity");
      break;
    case 0x71uLL:
      result = CFSTR("_ATXScoreInputAppIntentTimeOfDayPopularity");
      break;
    case 0x72uLL:
      result = CFSTR("_ATXScoreInputAppIntentCoarseTimeOfDayPopularity");
      break;
    case 0x73uLL:
      result = CFSTR("_ATXScoreInputAppIntentDayOfWeekPopularity");
      break;
    case 0x74uLL:
      result = CFSTR("_ATXScoreInputAppIntentUnlockTime");
      break;
    case 0x75uLL:
      result = CFSTR("_ATXScoreInputAppIntentSSIDPopularity");
      break;
    case 0x76uLL:
      result = CFSTR("_ATXScoreInputAppIntentCoreMotionPopularity");
      break;
    case 0x77uLL:
      result = CFSTR("_ATXScoreInputAppIntentAirplaneModePopularity");
      break;
    case 0x78uLL:
      result = CFSTR("_ATXScoreInputAppIntentLaunchLocationPopularity");
      break;
    case 0x79uLL:
      result = CFSTR("_ATXScoreInputAppIntentLaunchMicroLocationPopularity");
      break;
    case 0x7AuLL:
      result = CFSTR("_ATXScoreInputAppIntentLaunchSequencePopularity");
      break;
    case 0x7BuLL:
      result = CFSTR("_ATXScoreInputAppIntentAppLaunchSequencePopularity");
      break;
    case 0x7CuLL:
      result = CFSTR("_ATXScoreInputAppIntentLaunchTimePopularity");
      break;
    case 0x7DuLL:
      result = CFSTR("_ATXScoreInputAppIntentLaunchDayOfWeekPopularity");
      break;
    case 0x7EuLL:
      result = CFSTR("_ATXScoreInputAppIntentLastLaunchAge");
      break;
    case 0x7FuLL:
      result = CFSTR("_ATXScoreInputAppIntentAverageSecondsBetweenAppActions");
      break;
    case 0x80uLL:
      result = CFSTR("_ATXScoreInputAppIntentMedianSecondsBetweenAppActions");
      break;
    case 0x81uLL:
      result = CFSTR("_ATXScoreInputAppIntentDayZeroPoints");
      break;
    case 0x82uLL:
      result = CFSTR("_ATXScoreInputAppIntentStaticPoints");
      break;
    case 0x83uLL:
      result = CFSTR("_ATXScoreInputAppIntentValueScore");
      break;
    case 0x84uLL:
      result = CFSTR("_ATXScoreInputAppCategory");
      break;
    case 0x85uLL:
      result = CFSTR("_ATXScoreInputIntentCategory");
      break;
    case 0x86uLL:
      result = CFSTR("_ATXScoreInputActionKeyCategory");
      break;
    case 0x87uLL:
      result = CFSTR("_ATXScoreInputIntentCategoryFromIntentDefinition");
      break;
    case 0x88uLL:
      result = CFSTR("_ATXScoreInputAppIntentEntropyLaunchPopularity");
      break;
    case 0x89uLL:
      result = CFSTR("_ATXScoreInputAppIntentEntropyDayOfWeekPopularity");
      break;
    case 0x8AuLL:
      result = CFSTR("_ATXScoreInputAppIntentEntropyDayOfWeekPopularityByDay");
      break;
    case 0x8BuLL:
      result = CFSTR("_ATXScoreInputAppIntentEntropyDayOfWeekPopularityByAppIntent");
      break;
    case 0x8CuLL:
      result = CFSTR("_ATXScoreInputAppIntentEntropyTrendingPopularity");
      break;
    case 0x8DuLL:
      result = CFSTR("_ATXScoreInputAppIntentEntropySSIDPopularity");
      break;
    case 0x8EuLL:
      result = CFSTR("_ATXScoreInputAppIntentEntropySSIDPopularityBySSID");
      break;
    case 0x8FuLL:
      result = CFSTR("_ATXScoreInputAppIntentEntropySSIDPopularityByAppIntent");
      break;
    case 0x90uLL:
      result = CFSTR("_ATXScoreInputAppIntentDistanceDayOfWeekToLaunchPopularity");
      break;
    case 0x91uLL:
      result = CFSTR("_ATXScoreInputAppIntentDistanceTrendingToLaunchPopularity");
      break;
    case 0x92uLL:
      result = CFSTR("_ATXScoreInputAppIntentDistanceSSIDToLaunchPopularity");
      break;
    case 0x93uLL:
      result = CFSTR("_ATXScoreInputAppActionConfirmEvents");
      break;
    case 0x94uLL:
      result = CFSTR("_ATXScoreInputAppActionRejectEvents");
      break;
    case 0x95uLL:
      result = CFSTR("_ATXScoreInputTotalAppActionConfirmEvents");
      break;
    case 0x96uLL:
      result = CFSTR("_ATXScoreInputTotalAppActionRejectEvents");
      break;
    case 0x97uLL:
      result = CFSTR("_ATXScoreInputAppForAllIntentsCount");
      break;
    case 0x98uLL:
      result = CFSTR("_ATXScoreInputAppForAllIntentsTotalNumberOfLaunches");
      break;
    case 0x99uLL:
      result = CFSTR("_ATXScoreInputAppForAllIntentsTotalNumberOfAirplaneModeLaunches");
      break;
    case 0x9AuLL:
      result = CFSTR("_ATXScoreInputAppForAllIntentsTotalNumberOfSSIDLaunches");
      break;
    case 0x9BuLL:
      result = CFSTR("_ATXScoreInputAppForAllIntentsTotalNumberOfCoreMotionLaunches");
      break;
    case 0x9CuLL:
      result = CFSTR("_ATXScoreInputAppForAllIntentsTotalNumberOfTrendingLaunches");
      break;
    case 0x9DuLL:
      result = CFSTR("_ATXScoreInputAppForAllIntentsLaunchPopularity");
      break;
    case 0x9EuLL:
      result = CFSTR("_ATXScoreInputAppForAllIntentsTimeOfDayPopularity");
      break;
    case 0x9FuLL:
      result = CFSTR("_ATXScoreInputAppForAllIntentsDayOfWeekPopularity");
      break;
    case 0xA0uLL:
      result = CFSTR("_ATXScoreInputAppForAllIntentsCoarseTimeOfDayPopularity");
      break;
    case 0xA1uLL:
      result = CFSTR("_ATXScoreInputAppForAllIntentsUnlockTime");
      break;
    case 0xA2uLL:
      result = CFSTR("_ATXScoreInputAppForAllIntentsAirplaneModePopularity");
      break;
    case 0xA3uLL:
      result = CFSTR("_ATXScoreInputAppForAllIntentsSSIDPopularity");
      break;
    case 0xA4uLL:
      result = CFSTR("_ATXScoreInputAppForAllIntentsCoreMotionPopularity");
      break;
    case 0xA5uLL:
      result = CFSTR("_ATXScoreInputAppForAllIntentsTrendingPopularity");
      break;
    case 0xA6uLL:
      result = CFSTR("_ATXScoreInputAppForAllIntentsLaunchLocationPopularity");
      break;
    case 0xA7uLL:
      result = CFSTR("_ATXScoreInputAppForAllIntentsLaunchTimePopularity");
      break;
    case 0xA8uLL:
      result = CFSTR("_ATXScoreInputAppForAllIntentsLaunchDayOfWeekPopularity");
      break;
    case 0xA9uLL:
      result = CFSTR("_ATXScoreInputAppForAllIntentsEntropyLaunchPopularity");
      break;
    case 0xAAuLL:
      result = CFSTR("_ATXScoreInputAppForAllIntentsEntropyDayOfWeekPopularity");
      break;
    case 0xABuLL:
      result = CFSTR("_ATXScoreInputAppForAllIntentsEntropyDayOfWeekPopularityByDay");
      break;
    case 0xACuLL:
      result = CFSTR("_ATXScoreInputAppForAllIntentsEntropyDayOfWeekPopularityByApp");
      break;
    case 0xADuLL:
      result = CFSTR("_ATXScoreInputAppForAllIntentsEntropyTrendingPopularity");
      break;
    case 0xAEuLL:
      result = CFSTR("_ATXScoreInputAppForAllIntentsEntropySSIDPopularity");
      break;
    case 0xAFuLL:
      result = CFSTR("_ATXScoreInputAppForAllIntentsEntropySSIDPopularityBySSID");
      break;
    case 0xB0uLL:
      result = CFSTR("_ATXScoreInputAppForAllIntentsEntropySSIDPopularityByApp");
      break;
    case 0xB1uLL:
      result = CFSTR("_ATXScoreInputAppForAllIntentsDistanceSSIDToLaunchPopularity");
      break;
    case 0xB2uLL:
      result = CFSTR("_ATXScoreInputAppForAllIntentsDistanceDayOfWeekToLaunchPopularity");
      break;
    case 0xB3uLL:
      result = CFSTR("_ATXScoreInputAppForAllIntentsDistanceTrendingToLaunchPopularity");
      break;
    case 0xB4uLL:
      result = CFSTR("_ATXScoreInputAppForAllActionsConfirmEvents");
      break;
    case 0xB5uLL:
      result = CFSTR("_ATXScoreInputAppForAllActionsRejectEvents");
      break;
    case 0xB6uLL:
      result = CFSTR("_ATXScoreInputTotalAppForAllActionsConfirmEvents");
      break;
    case 0xB7uLL:
      result = CFSTR("_ATXScoreInputTotalAppForAllActionsRejectEvents");
      break;
    case 0xB8uLL:
      result = CFSTR("_ATXScoreInputSlotCount");
      break;
    case 0xB9uLL:
      result = CFSTR("_ATXScoreInputSlotTotalNumberOfLaunches");
      break;
    case 0xBAuLL:
      result = CFSTR("_ATXScoreInputSlotTotalNumberOfUniqueDaysLaunched");
      break;
    case 0xBBuLL:
      result = CFSTR("_ATXScoreInputSlotLaunchPopularity");
      break;
    case 0xBCuLL:
      result = CFSTR("_ATXScoreInputSlotTimeOfDayPopularity");
      break;
    case 0xBDuLL:
      result = CFSTR("_ATXScoreInputSlotTimeOfDayWithThirtyMinuteWindowPopularity");
      break;
    case 0xBEuLL:
      result = CFSTR("_ATXScoreInputSlotTimeOfDayWithHourWindowPopularity");
      break;
    case 0xBFuLL:
      result = CFSTR("_ATXScoreInputSlotTimeOfDayWithEightHourWindowPopularity");
      break;
    case 0xC0uLL:
      result = CFSTR("_ATXScoreInputSlotDayOfWeekPopularity");
      break;
    case 0xC1uLL:
      result = CFSTR("_ATXScoreInputSlotPartOfWeekPopularity");
      break;
    case 0xC2uLL:
      result = CFSTR("_ATXScoreInputSlotPartOfWeekAndLocationPopularity");
      break;
    case 0xC3uLL:
      result = CFSTR("_ATXScoreInputSlotCoarseTimeOfDayPopularity");
      break;
    case 0xC4uLL:
      result = CFSTR("_ATXScoreInputSlotLocationPopularity");
      break;
    case 0xC5uLL:
      result = CFSTR("_ATXScoreInputSlotCoreMotionPopularity");
      break;
    case 0xC6uLL:
      result = CFSTR("_ATXScoreInputSlotPreviousLocationPopularity");
      break;
    case 0xC7uLL:
      result = CFSTR("_ATXScoreInputSlotTimeAndDayPopularity");
      break;
    case 0xC8uLL:
      result = CFSTR("_ATXScoreInputSlotTimeAndLocationPopularity");
      break;
    case 0xC9uLL:
      result = CFSTR("_ATXScoreInputSlotDayAndLocationPopularity");
      break;
    case 0xCAuLL:
      result = CFSTR("_ATXScoreInputSlotTimeAndDayAndLocationPopularity");
      break;
    case 0xCBuLL:
      result = CFSTR("_ATXScoreInputSlotPreviousLocationAndCoreMotionPopularity");
      break;
    case 0xCCuLL:
      result = CFSTR("_ATXScoreInputSlotPreviousLocationAndLocationPopularity");
      break;
    case 0xCDuLL:
      result = CFSTR("_ATXScoreInputSlotTimeAndPreviousLocationPopularity");
      break;
    case 0xCEuLL:
      result = CFSTR("_ATXScoreInputSlotDayAndPreviousLocationPopularity");
      break;
    case 0xCFuLL:
      result = CFSTR("_ATXScoreInputSlotPartOfWeekAndTimePopularity");
      break;
    case 0xD0uLL:
      result = CFSTR("_ATXScoreInputSlotLaunchTimePopularity");
      break;
    case 0xD1uLL:
      result = CFSTR("_ATXScoreInputSlotLaunchCoarseTimePopularity");
      break;
    case 0xD2uLL:
      result = CFSTR("_ATXScoreInputSlotLaunchDayOfWeekPopularity");
      break;
    case 0xD3uLL:
      result = CFSTR("_ATXScoreInputSlotLaunchPartOfWeekPopularity");
      break;
    case 0xD4uLL:
      result = CFSTR("_ATXScoreInputSlotLaunchPartOfWeekAndLocationPopularity");
      break;
    case 0xD5uLL:
      result = CFSTR("_ATXScoreInputSlotLaunchLocationPopularity");
      break;
    case 0xD6uLL:
      result = CFSTR("_ATXScoreInputSlotLaunchCoreMotionPopularity");
      break;
    case 0xD7uLL:
      result = CFSTR("_ATXScoreInputSlotLaunchPreviousLocationPopularity");
      break;
    case 0xD8uLL:
      result = CFSTR("_ATXScoreInputSlotLaunchTimeAndDayPopularity");
      break;
    case 0xD9uLL:
      result = CFSTR("_ATXScoreInputSlotLaunchTimeAndLocationPopularity");
      break;
    case 0xDAuLL:
      result = CFSTR("_ATXScoreInputSlotLaunchDayAndLocationPopularity");
      break;
    case 0xDBuLL:
      result = CFSTR("_ATXScoreInputSlotLaunchTimeAndDayAndLocationPopularity");
      break;
    case 0xDCuLL:
      result = CFSTR("_ATXScoreInputSlotLaunchPreviousLocationAndCoreMotionPopularity");
      break;
    case 0xDDuLL:
      result = CFSTR("_ATXScoreInputSlotLaunchPreviousLocationAndLocationPopularity");
      break;
    case 0xDEuLL:
      result = CFSTR("_ATXScoreInputSlotLaunchTimeAndPreviousLocationPopularity");
      break;
    case 0xDFuLL:
      result = CFSTR("_ATXScoreInputSlotLaunchDayAndPreviousLocationPopularity");
      break;
    case 0xE0uLL:
      result = CFSTR("_ATXScoreInputSlotLaunchPartOfWeekAndTimePopularity");
      break;
    case 0xE1uLL:
      result = CFSTR("_ATXScoreInputSlotLaunchTimeCount");
      break;
    case 0xE2uLL:
      result = CFSTR("_ATXScoreInputSlotLaunchDayOfWeekCount");
      break;
    case 0xE3uLL:
      result = CFSTR("_ATXScoreInputSlotLaunchPartOfWeekCount");
      break;
    case 0xE4uLL:
      result = CFSTR("_ATXScoreInputSlotLaunchCoarseTimeCount");
      break;
    case 0xE5uLL:
      result = CFSTR("_ATXScoreInputSlotLaunchTimeWithThirtyMinuteWindowCount");
      break;
    case 0xE6uLL:
      result = CFSTR("_ATXScoreInputSlotLaunchTimeWithHourWindowCount");
      break;
    case 0xE7uLL:
      result = CFSTR("_ATXScoreInputSlotLaunchTimeWithEightHourWindowCount");
      break;
    case 0xE8uLL:
      result = CFSTR("_ATXScoreInputSlotLaunchLocationCount");
      break;
    case 0xE9uLL:
      result = CFSTR("_ATXScoreInputSlotLaunchCoreMotionCount");
      break;
    case 0xEAuLL:
      result = CFSTR("_ATXScoreInputSlotLaunchPreviousLocationCount");
      break;
    case 0xEBuLL:
      result = CFSTR("_ATXScoreInputSlotTotalLaunchesForSlotUsingTimeDecay");
      break;
    case 0xECuLL:
      result = CFSTR("_ATXScoreInputSlotTotalLaunchesForSlotUsingDayOfWeekDecay");
      break;
    case 0xEDuLL:
      result = CFSTR("_ATXScoreInputSlotTotalLaunchesForSlotUsingLocationDecay");
      break;
    case 0xEEuLL:
      result = CFSTR("_ATXScoreInputSlotTotalLaunchesForSlotUsingCoreMotionDecay");
      break;
    case 0xEFuLL:
      result = CFSTR("_ATXScoreInputSlotTotalLaunchesForSlotUsingPreviousLocationDecay");
      break;
    case 0xF0uLL:
      result = CFSTR("_ATXScoreInputSlotTotalLaunchesForSlotUsingPartOfWeekDecay");
      break;
    case 0xF1uLL:
      result = CFSTR("_ATXScoreInputSlotTotalLaunchesForSlotUsingTimeAndDayDecay");
      break;
    case 0xF2uLL:
      result = CFSTR("_ATXScoreInputSlotTotalLaunchesForSlotUsingTimeAndLocationDecay");
      break;
    case 0xF3uLL:
      result = CFSTR("_ATXScoreInputSlotTotalLaunchesForSlotUsingDayAndLocationDecay");
      break;
    case 0xF4uLL:
      result = CFSTR("_ATXScoreInputSlotTotalLaunchesForSlotUsingTimeAndDayAndLocationDecay");
      break;
    case 0xF5uLL:
      result = CFSTR("_ATXScoreInputSlotTotalLaunchesForSlotUsingPreviousLocationAndLocationDecay");
      break;
    case 0xF6uLL:
      result = CFSTR("_ATXScoreInputSlotTotalLaunchesForSlotUsingPreviousLocationAndCoreMotionDecay");
      break;
    case 0xF7uLL:
      result = CFSTR("_ATXScoreInputSlotTotalLaunchesForSlotUsingTimeAndPreviousLocationDecay");
      break;
    case 0xF8uLL:
      result = CFSTR("_ATXScoreInputSlotTotalLaunchesForSlotUsingDayAndPreviousLocationDecay");
      break;
    case 0xF9uLL:
      result = CFSTR("_ATXScoreInputSlotTotalLaunchesForSlotUsingPartOfWeekAndLocationDecay");
      break;
    case 0xFAuLL:
      result = CFSTR("_ATXScoreInputSlotTotalLaunchesForSlotUsingPartOfWeekAndTimeDecay");
      break;
    case 0xFBuLL:
      result = CFSTR("_ATXScoreInputSlotSecondsSinceLastSlot");
      break;
    case 0xFCuLL:
      result = CFSTR("_ATXScoreInputSlotOnlyLaunchedWithinShortTimeSpan");
      break;
    case 0xFDuLL:
      result = CFSTR("_ATXScoreInputSlotTotalNumberOfUndecayedLaunchesForSlot");
      break;
    case 0xFEuLL:
      result = CFSTR("_ATXScoreInputSlotNumberOfUniqueDaysLaunchedForSlot");
      break;
    case 0xFFuLL:
      result = CFSTR("_ATXScoreInputSlotTotalNumberOfLaunchesForSlot");
      break;
    case 0x100uLL:
      result = CFSTR("_ATXScoreInputSlotLOIBoost");
      break;
    case 0x101uLL:
      result = CFSTR("_ATXScoreInputSlotNumberOfParameters");
      break;
    case 0x102uLL:
      result = CFSTR("_ATXScoreInputSlotNumSessionStartsForRootOfApp");
      break;
    case 0x103uLL:
      result = CFSTR("_ATXScoreInputSlotTotalNumSessionsForRootOfApp");
      break;
    case 0x104uLL:
      result = CFSTR("_ATXScoreInputSlotNumDocFreqForRootOfApp");
      break;
    case 0x105uLL:
      result = CFSTR("_ATXScoreInputSlotEntropyForSlotSet");
      break;
    case 0x106uLL:
      result = CFSTR("_ATXScoreInputSlotTotalNumberOfLaunchesForSlotSet");
      break;
    case 0x107uLL:
      result = CFSTR("_ATXScoreInputSlotTimeOfDayBudgetMeanForSlot");
      break;
    case 0x108uLL:
      result = CFSTR("_ATXScoreInputSlotTimeOfDayBudgetStdDevForSlot");
      break;
    case 0x109uLL:
      result = CFSTR("_ATXScoreInputSlotTodaysTimeOfDayBudgetForSlot");
      break;
    case 0x10AuLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackTotalConfirmsForSlot");
      break;
    case 0x10BuLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackTotalRejectsForSlot");
      break;
    case 0x10CuLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackTotalExplicitRejectsForSlotNoDecay");
      break;
    case 0x10DuLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackTotalConfirmsForAllSlots");
      break;
    case 0x10EuLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackTotalRejectsForAllSlots");
      break;
    case 0x10FuLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackTotalExplicitRejectsForAllSlotsNoDecay");
      break;
    case 0x110uLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackConfirmRatio");
      break;
    case 0x111uLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackConfirmRatioStdDev");
      break;
    case 0x112uLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackConfirmRatioMean");
      break;
    case 0x113uLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackConfirmRatioCount");
      break;
    case 0x114uLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackMinutesSinceLastExplicitRejectInHomeScreen");
      break;
    case 0x115uLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackMinutesSinceLastConfirmInSpotlight");
      break;
    case 0x116uLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackMinutesSinceLastExplicitRejectInSpotlight");
      break;
    case 0x117uLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackTotalConfirmsForSlotInLastHourInSpotlight");
      break;
    case 0x118uLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackTotalRejectsForSlotInLastHourInSpotlight");
      break;
    case 0x119uLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackTotalConfirmsForSlotInLastTwoHoursInSpotlight");
      break;
    case 0x11AuLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackTotalRejectsForSlotInLastTwoHoursInSpotlight");
      break;
    case 0x11BuLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackTotalConfirmsForSlotTodayInSpotlight");
      break;
    case 0x11CuLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackTotalRejectsForSlotTodayInSpotlight");
      break;
    case 0x11DuLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackTotalConfirmsForSlotInSpotlight");
      break;
    case 0x11EuLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackTotalRejectsForSlotInSpotlight");
      break;
    case 0x11FuLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackConfirmsPartOfWeekCountInSpotlight");
      break;
    case 0x120uLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackConfirmsDayCountInSpotlight");
      break;
    case 0x121uLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackConfirmsTimeOfDayCountInSpotlight");
      break;
    case 0x122uLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackConfirmsCoarseTimeOfDayCountInSpotlight");
      break;
    case 0x123uLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackTotalConfirmsInSpotlightForAllSlots");
      break;
    case 0x124uLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackTotalRejectsInSpotlightForAllSlots");
      break;
    case 0x125uLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackTotalConfirmsForSlotTodayInLockscreen");
      break;
    case 0x126uLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackTotalRejectsForSlotTodayInLockscreen");
      break;
    case 0x127uLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackMinutesSinceLastConfirmInLockscreen");
      break;
    case 0x128uLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackMinutesSinceLastRejectInLockscreen");
      break;
    case 0x129uLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackMinutesSinceLastExplicitRejectInLockscreen");
      break;
    case 0x12AuLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackTotalConfirmsForSlotInLockscreen");
      break;
    case 0x12BuLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackTotalRejectsForSlotInLockscreen");
      break;
    case 0x12CuLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackConfirmsPartOfWeekCountInLockscreen");
      break;
    case 0x12DuLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackConfirmsDayCountInLockscreen");
      break;
    case 0x12EuLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackConfirmsTimeOfDayCountInLockscreen");
      break;
    case 0x12FuLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackConfirmsCoarseTimeOfDayCountInLockscreen");
      break;
    case 0x130uLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackTotalConfirmsTodayInLockscreenForAllSlots");
      break;
    case 0x131uLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackTotalRejectsTodayInLockscreenForAllSlots");
      break;
    case 0x132uLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackTotalConfirmsInLockscreenForAllSlots");
      break;
    case 0x133uLL:
      result = CFSTR("_ATXScoreInputSlotFeedbackTotalRejectsInLockscreenForAllSlots");
      break;
    case 0x134uLL:
      result = CFSTR("_ATXScoreInputActionFeedbackTotalConfirmsInSpotlight");
      break;
    case 0x135uLL:
      result = CFSTR("_ATXScoreInputActionFeedbackTotalRejectsInSpotlight");
      break;
    case 0x136uLL:
      result = CFSTR("_ATXScoreInputActionFeedbackTotalConfirmsTodayInLockscreen");
      break;
    case 0x137uLL:
      result = CFSTR("_ATXScoreInputActionFeedbackTotalRejectsTodayInLockscreen");
      break;
    case 0x138uLL:
      result = CFSTR("_ATXScoreInputActionFeedbackTotalConfirmsInLockscreen");
      break;
    case 0x139uLL:
      result = CFSTR("_ATXScoreInputActionFeedbackTotalRejectsInLockscreen");
      break;
    case 0x13AuLL:
      result = CFSTR("_ATXScoreInputActionFeedbackMeanNumberOfSpotlightLaunchesPerDay");
      break;
    case 0x13BuLL:
      result = CFSTR("_ATXScoreInputActionFeedbackMeanNumberOfSpotlightConfirmsPerDay");
      break;
    case 0x13CuLL:
      result = CFSTR("_ATXScoreInputActionLaunchPopularity");
      break;
    case 0x13DuLL:
      result = CFSTR("_ATXScoreInputActionTimeOfDayPopularity");
      break;
    case 0x13EuLL:
      result = CFSTR("_ATXScoreInputActionTimeOfDayWithThirtyMinuteWindowPopularity");
      break;
    case 0x13FuLL:
      result = CFSTR("_ATXScoreInputActionTimeOfDayWithHourWindowPopularity");
      break;
    case 0x140uLL:
      result = CFSTR("_ATXScoreInputActionTimeOfDayWithEightHourWindowPopularity");
      break;
    case 0x141uLL:
      result = CFSTR("_ATXScoreInputActionCoarseTimeOfDayPopularity");
      break;
    case 0x142uLL:
      result = CFSTR("_ATXScoreInputActionDayOfWeekPopularity");
      break;
    case 0x143uLL:
      result = CFSTR("_ATXScoreInputActionPartOfWeekPopularity");
      break;
    case 0x144uLL:
      result = CFSTR("_ATXScoreInputActionPartOfWeekAndLocationPopularity");
      break;
    case 0x145uLL:
      result = CFSTR("_ATXScoreInputActionLocationPopularity");
      break;
    case 0x146uLL:
      result = CFSTR("_ATXScoreInputActionCoreMotionPopularity");
      break;
    case 0x147uLL:
      result = CFSTR("_ATXScoreInputActionPreviousLocationPopularity");
      break;
    case 0x148uLL:
      result = CFSTR("_ATXScoreInputActionPreviousLocationAndCoreMotionPopularity");
      break;
    case 0x149uLL:
      result = CFSTR("_ATXScoreInputActionPreviousLocationAndLocationPopularity");
      break;
    case 0x14AuLL:
      result = CFSTR("_ATXScoreInputActionTimeAndPreviousLocationPopularity");
      break;
    case 0x14BuLL:
      result = CFSTR("_ATXScoreInputActionDayAndPreviousLocationPopularity");
      break;
    case 0x14CuLL:
      result = CFSTR("_ATXScoreInputActionTimeAndDayPopularity");
      break;
    case 0x14DuLL:
      result = CFSTR("_ATXScoreInputActionTimeAndLocationPopularity");
      break;
    case 0x14EuLL:
      result = CFSTR("_ATXScoreInputActionDayAndLocationPopularity");
      break;
    case 0x14FuLL:
      result = CFSTR("_ATXScoreInputActionTimeAndDayAndLocationPopularity");
      break;
    case 0x150uLL:
      result = CFSTR("_ATXScoreInputActionPartOfWeekAndTimePopularity");
      break;
    case 0x151uLL:
      result = CFSTR("_ATXScoreInputActionTotalLaunchesForAllActionsUsingTimeDecay");
      break;
    case 0x152uLL:
      result = CFSTR("_ATXScoreInputActionTotalLaunchesForAllActionsUsingDayOfWeekDecay");
      break;
    case 0x153uLL:
      result = CFSTR("_ATXScoreInputActionTotalLaunchesForAllActionsUsingLocationDecay");
      break;
    case 0x154uLL:
      result = CFSTR("_ATXScoreInputActionTotalLaunchesForAllActionsUsingCoreMotionDecay");
      break;
    case 0x155uLL:
      result = CFSTR("_ATXScoreInputActionTotalLaunchesForAllActionsUsingPreviousLocationDecay");
      break;
    case 0x156uLL:
      result = CFSTR("_ATXScoreInputActionTotalLaunchesForAllActionsUsingPartOfWeekDecay");
      break;
    case 0x157uLL:
      result = CFSTR("_ATXScoreInputActionTotalLaunchesForAllActionsUsingPreviousLocationAndCoreMotionDecay");
      break;
    case 0x158uLL:
      result = CFSTR("_ATXScoreInputActionTotalLaunchesForAllActionsUsingPreviousLocationAndLocationDecay");
      break;
    case 0x159uLL:
      result = CFSTR("_ATXScoreInputActionTotalLaunchesForAllActionsUsingTimeAndPreviousLocationDecay");
      break;
    case 0x15AuLL:
      result = CFSTR("_ATXScoreInputActionTotalLaunchesForAllActionsUsingDayAndPreviousLocationDecay");
      break;
    case 0x15BuLL:
      result = CFSTR("_ATXScoreInputActionTotalLaunchesForAllActionsUsingTimeAndDayDecay");
      break;
    case 0x15CuLL:
      result = CFSTR("_ATXScoreInputActionTotalLaunchesForAllActionsUsingTimeAndLocationDecay");
      break;
    case 0x15DuLL:
      result = CFSTR("_ATXScoreInputActionTotalLaunchesForAllActionsUsingDayAndLocationDecay");
      break;
    case 0x15EuLL:
      result = CFSTR("_ATXScoreInputActionTotalLaunchesForAllActionsUsingTimeAndDayAndLocationDecay");
      break;
    case 0x15FuLL:
      result = CFSTR("_ATXScoreInputActionTotalLaunchesForAllActionsUsingPartOfWeekAndLocationDecay");
      break;
    case 0x160uLL:
      result = CFSTR("_ATXScoreInputActionTotalLaunchesForAllActionsUsingPartOfWeekAndTimeDecay");
      break;
    case 0x161uLL:
      result = CFSTR("_ATXScoreInputRandomSessionValue");
      break;
    case 0x162uLL:
      result = CFSTR("_ATXScoreInputRandomScore");
      break;
    case 0x163uLL:
      result = CFSTR("_ATXScoreInputActionTotalConfirms");
      break;
    case 0x164uLL:
      result = CFSTR("_ATXScoreInputActionTotalRejects");
      break;
    case 0x165uLL:
      result = CFSTR("_ATXScoreInputActionTotalExplicitRejectsNoDecay");
      break;
    case 0x166uLL:
      result = CFSTR("_ATXScoreInputAppSpecificAlpha");
      break;
    case 0x167uLL:
      result = CFSTR("_ATXScoreInputAppSpecificBeta");
      break;
    case 0x168uLL:
      result = CFSTR("_ATXScoreInputGlobalScoreGivenTimeDayLocationAndLastApp");
      break;
    case 0x169uLL:
      result = CFSTR("_ATXScoreInputAppGlobalScoreGivenTimeDayAndLocation");
      break;
    case 0x16AuLL:
      result = CFSTR("_ATXScoreInputAppLOITypeLaunches");
      break;
    case 0x16BuLL:
      result = CFSTR("_ATXScoreInputAppLastAppLaunches");
      break;
    case 0x16CuLL:
      result = CFSTR("_ATXScoreInputAppTimeOfDayLaunches");
      break;
    case 0x16DuLL:
      result = CFSTR("_ATXScoreInputAppDayOfWeekLaunches");
      break;
    case 0x16EuLL:
      result = CFSTR("_ATXScoreInputAppBlendedLOITypePopularity");
      break;
    case 0x16FuLL:
      result = CFSTR("_ATXScoreInputAppBlendedLastAppPopularity");
      break;
    case 0x170uLL:
      result = CFSTR("_ATXScoreInputAppBlendedTimeOfDayPopularity");
      break;
    case 0x171uLL:
      result = CFSTR("_ATXScoreInputAppBlendedDayOfWeekPopularity");
      break;
    case 0x172uLL:
      result = CFSTR("_ATXScoreInputAppBlendedLOITypeSampledPopularity");
      break;
    case 0x173uLL:
      result = CFSTR("_ATXScoreInputAppBlendedLastAppSampledPopularity");
      break;
    case 0x174uLL:
      result = CFSTR("_ATXScoreInputAppBlendedTimeOfDaySampledPopularity");
      break;
    case 0x175uLL:
      result = CFSTR("_ATXScoreInputAppBlendedDayOfWeekSampledPopularity");
      break;
    case 0x176uLL:
      result = CFSTR("_ATXScoreInputActionIsFutureMedia");
      break;
    case 0x177uLL:
      result = CFSTR("_ATXScoreInputActionIsBackgroundExecutable");
      break;
    case 0x178uLL:
      result = CFSTR("_ATXScoreInputActionMotionType");
      break;
    case 0x179uLL:
      result = CFSTR("_ATXScoreInputActionLOIType");
      break;
    case 0x17AuLL:
      result = CFSTR("_ATXScoreInputSlotIsSiriKitIntent");
      break;
    case 0x17BuLL:
      result = CFSTR("_ATXScoreInputSlotIsCustomIntent");
      break;
    case 0x17CuLL:
      result = CFSTR("_ATXScoreInputSlotIsNSUserActivity");
      break;
    case 0x17DuLL:
      result = CFSTR("_ATXScoreInputAppActionScore");
      break;
    case 0x17EuLL:
      result = CFSTR("_ATXScoreInputAppActionLogProbability");
      break;
    case 0x17FuLL:
      result = CFSTR("_ATXScoreInputSlotScore");
      break;
    case 0x180uLL:
      result = CFSTR("_ATXScoreInputSlotLogProbability");
      break;
    case 0x181uLL:
      result = CFSTR("_ATXScoreInputActionHeuristicConfirmEvents");
      break;
    case 0x182uLL:
      result = CFSTR("_ATXScoreInputActionHeuristicConfirmRatio");
      break;
    case 0x183uLL:
      result = CFSTR("_ATXScoreInputTotalActionHeuristicConfirmEvents");
      break;
    case 0x184uLL:
      result = CFSTR("_ATXScoreInputTotalActionHeuristicRejectEvents");
      break;
    case 0x185uLL:
      result = CFSTR("_ATXScoreInputAmbientLightTypePopularity");
      break;
    case 0x186uLL:
      result = CFSTR("_ATXScoreInputAmbientLightTypeLaunchPopularity");
      break;
    case 0x187uLL:
      result = CFSTR("_ATXScoreInputAppIntentAmbientLightTypePopularity");
      break;
    case 0x188uLL:
      result = CFSTR("_ATXScoreInputAppIntentAmbientLightTypeLaunchPopularity");
      break;
    case 0x189uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesCoarseTimePowLocationForAppInContext");
      break;
    case 0x18AuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesCoarseTimePowLocationInContext");
      break;
    case 0x18BuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesCoarseTimePowLocationForApp");
      break;
    case 0x18CuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesCoarseTimePowLocationForAllAppsAndContexts");
      break;
    case 0x18DuLL:
      result = CFSTR("_ATXScoreInputAppConfirmsCoarseTimePowLocationForAppInContext");
      break;
    case 0x18EuLL:
      result = CFSTR("_ATXScoreInputAppConfirmsCoarseTimePowLocationInContext");
      break;
    case 0x18FuLL:
      result = CFSTR("_ATXScoreInputAppConfirmsCoarseTimePowLocationForApp");
      break;
    case 0x190uLL:
      result = CFSTR("_ATXScoreInputAppConfirmsCoarseTimePowLocationForAllAppsAndContexts");
      break;
    case 0x191uLL:
      result = CFSTR("_ATXScoreInputAppRejectsCoarseTimePowLocationForAppInContext");
      break;
    case 0x192uLL:
      result = CFSTR("_ATXScoreInputAppRejectsCoarseTimePowLocationInContext");
      break;
    case 0x193uLL:
      result = CFSTR("_ATXScoreInputAppRejectsCoarseTimePowLocationForApp");
      break;
    case 0x194uLL:
      result = CFSTR("_ATXScoreInputAppRejectsCoarseTimePowLocationForAllAppsAndContexts");
      break;
    case 0x195uLL:
      result = CFSTR("_ATXScoreInputAppExplicitRejectsCoarseTimePowLocationForAppInContext");
      break;
    case 0x196uLL:
      result = CFSTR("_ATXScoreInputAppExplicitRejectsCoarseTimePowLocationInContext");
      break;
    case 0x197uLL:
      result = CFSTR("_ATXScoreInputAppExplicitRejectsCoarseTimePowLocationForApp");
      break;
    case 0x198uLL:
      result = CFSTR("_ATXScoreInputAppExplicitRejectsCoarseTimePowLocationForAllAppsAndContexts");
      break;
    case 0x199uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesSpecificTimeDowLocationForAppInContext");
      break;
    case 0x19AuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesSpecificTimeDowLocationInContext");
      break;
    case 0x19BuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesSpecificTimeDowLocationForApp");
      break;
    case 0x19CuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesSpecificTimeDowLocationForAllAppsAndContexts");
      break;
    case 0x19DuLL:
      result = CFSTR("_ATXScoreInputAppConfirmsSpecificTimeDowLocationForAppInContext");
      break;
    case 0x19EuLL:
      result = CFSTR("_ATXScoreInputAppConfirmsSpecificTimeDowLocationInContext");
      break;
    case 0x19FuLL:
      result = CFSTR("_ATXScoreInputAppConfirmsSpecificTimeDowLocationForApp");
      break;
    case 0x1A0uLL:
      result = CFSTR("_ATXScoreInputAppConfirmsSpecificTimeDowLocationForAllAppsAndContexts");
      break;
    case 0x1A1uLL:
      result = CFSTR("_ATXScoreInputAppRejectsSpecificTimeDowLocationForAppInContext");
      break;
    case 0x1A2uLL:
      result = CFSTR("_ATXScoreInputAppRejectsSpecificTimeDowLocationInContext");
      break;
    case 0x1A3uLL:
      result = CFSTR("_ATXScoreInputAppRejectsSpecificTimeDowLocationForApp");
      break;
    case 0x1A4uLL:
      result = CFSTR("_ATXScoreInputAppRejectsSpecificTimeDowLocationForAllAppsAndContexts");
      break;
    case 0x1A5uLL:
      result = CFSTR("_ATXScoreInputActionsCoarseTimePowLocationForActionInContext");
      break;
    case 0x1A6uLL:
      result = CFSTR("_ATXScoreInputActionsCoarseTimePowLocationInContext");
      break;
    case 0x1A7uLL:
      result = CFSTR("_ATXScoreInputActionsCoarseTimePowLocationForAction");
      break;
    case 0x1A8uLL:
      result = CFSTR("_ATXScoreInputActionsCoarseTimePowLocationForAllActionsAndContexts");
      break;
    case 0x1A9uLL:
      result = CFSTR("_ATXScoreInputActionConfirmsCoarseTimePowLocationForActionInContext");
      break;
    case 0x1AAuLL:
      result = CFSTR("_ATXScoreInputActionConfirmsCoarseTimePowLocationInContext");
      break;
    case 0x1ABuLL:
      result = CFSTR("_ATXScoreInputActionConfirmsCoarseTimePowLocationForAction");
      break;
    case 0x1ACuLL:
      result = CFSTR("_ATXScoreInputActionConfirmsCoarseTimePowLocationForAllActionsAndContexts");
      break;
    case 0x1ADuLL:
      result = CFSTR("_ATXScoreInputActionRejectsCoarseTimePowLocationForActionInContext");
      break;
    case 0x1AEuLL:
      result = CFSTR("_ATXScoreInputActionRejectsCoarseTimePowLocationInContext");
      break;
    case 0x1AFuLL:
      result = CFSTR("_ATXScoreInputActionRejectsCoarseTimePowLocationForAction");
      break;
    case 0x1B0uLL:
      result = CFSTR("_ATXScoreInputActionRejectsCoarseTimePowLocationForAllActionsAndContexts");
      break;
    case 0x1B1uLL:
      result = CFSTR("_ATXScoreInputActionsSpecificTimeDowLocationForActionInContext");
      break;
    case 0x1B2uLL:
      result = CFSTR("_ATXScoreInputActionsSpecificTimeDowLocationInContext");
      break;
    case 0x1B3uLL:
      result = CFSTR("_ATXScoreInputActionsSpecificTimeDowLocationForAction");
      break;
    case 0x1B4uLL:
      result = CFSTR("_ATXScoreInputActionsSpecificTimeDowLocationForAllActionsAndContexts");
      break;
    case 0x1B5uLL:
      result = CFSTR("_ATXScoreInputActionConfirmsSpecificTimeDowLocationForActionInContext");
      break;
    case 0x1B6uLL:
      result = CFSTR("_ATXScoreInputActionConfirmsSpecificTimeDowLocationInContext");
      break;
    case 0x1B7uLL:
      result = CFSTR("_ATXScoreInputActionConfirmsSpecificTimeDowLocationForAction");
      break;
    case 0x1B8uLL:
      result = CFSTR("_ATXScoreInputActionConfirmsSpecificTimeDowLocationForAllActionsAndContexts");
      break;
    case 0x1B9uLL:
      result = CFSTR("_ATXScoreInputActionRejectsSpecificTimeDowLocationForActionInContext");
      break;
    case 0x1BAuLL:
      result = CFSTR("_ATXScoreInputActionRejectsSpecificTimeDowLocationInContext");
      break;
    case 0x1BBuLL:
      result = CFSTR("_ATXScoreInputActionRejectsSpecificTimeDowLocationForAction");
      break;
    case 0x1BCuLL:
      result = CFSTR("_ATXScoreInputActionRejectsSpecificTimeDowLocationForAllActionsAndContexts");
      break;
    case 0x1BDuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesInTimeBucket0ForApp");
      break;
    case 0x1BEuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesInTimeBucket1ForApp");
      break;
    case 0x1BFuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesInTimeBucket2ForApp");
      break;
    case 0x1C0uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesInTimeBucket3ForApp");
      break;
    case 0x1C1uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesInTimeBucket4ForApp");
      break;
    case 0x1C2uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesInTimeBucket5ForApp");
      break;
    case 0x1C3uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesInTimeBucket6ForApp");
      break;
    case 0x1C4uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesInTimeBucket7ForApp");
      break;
    case 0x1C5uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesInTimeBucket8ForApp");
      break;
    case 0x1C6uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesInTimeBucket9ForApp");
      break;
    case 0x1C7uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesInTimeBucket10ForApp");
      break;
    case 0x1C8uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesInTimeBucket11ForApp");
      break;
    case 0x1C9uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesInTimeBucket12ForApp");
      break;
    case 0x1CAuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesInTimeBucket13ForApp");
      break;
    case 0x1CBuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesInTimeBucket14ForApp");
      break;
    case 0x1CCuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesInTimeBucket15ForApp");
      break;
    case 0x1CDuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesInTimeBucket16ForApp");
      break;
    case 0x1CEuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesInTimeBucket17ForApp");
      break;
    case 0x1CFuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesInTimeBucket18ForApp");
      break;
    case 0x1D0uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesInTimeBucket19ForApp");
      break;
    case 0x1D1uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesInTimeBucket20ForApp");
      break;
    case 0x1D2uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesInTimeBucket21ForApp");
      break;
    case 0x1D3uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesInTimeBucket22ForApp");
      break;
    case 0x1D4uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesInTimeBucket23ForApp");
      break;
    case 0x1D5uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesInTimeBucket24ForApp");
      break;
    case 0x1D6uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesOnDayOfWeekSundayForApp");
      break;
    case 0x1D7uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesOnDayOfWeekMondayForApp");
      break;
    case 0x1D8uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesOnDayOfWeekTuesdayForApp");
      break;
    case 0x1D9uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesOnDayOfWeekWednesdayForApp");
      break;
    case 0x1DAuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesOnDayOfWeekThursdayForApp");
      break;
    case 0x1DBuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesOnDayOfWeekFridayForApp");
      break;
    case 0x1DCuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesOnDayOfWeekSaturdayForApp");
      break;
    case 0x1DDuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtCoarseGeoHash0ForApp");
      break;
    case 0x1DEuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtCoarseGeoHash1ForApp");
      break;
    case 0x1DFuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtCoarseGeoHash2ForApp");
      break;
    case 0x1E0uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtCoarseGeoHash3ForApp");
      break;
    case 0x1E1uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtCoarseGeoHash4ForApp");
      break;
    case 0x1E2uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtCoarseGeoHash5ForApp");
      break;
    case 0x1E3uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtCoarseGeoHash6ForApp");
      break;
    case 0x1E4uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtCoarseGeoHash7ForApp");
      break;
    case 0x1E5uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtCoarseGeoHash8ForApp");
      break;
    case 0x1E6uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtCoarseGeoHash9ForApp");
      break;
    case 0x1E7uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtSpecificGeoHash0ForApp");
      break;
    case 0x1E8uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtSpecificGeoHash1ForApp");
      break;
    case 0x1E9uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtSpecificGeoHash2ForApp");
      break;
    case 0x1EAuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtSpecificGeoHash3ForApp");
      break;
    case 0x1EBuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtSpecificGeoHash4ForApp");
      break;
    case 0x1ECuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtSpecificGeoHash5ForApp");
      break;
    case 0x1EDuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtSpecificGeoHash6ForApp");
      break;
    case 0x1EEuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtSpecificGeoHash7ForApp");
      break;
    case 0x1EFuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtSpecificGeoHash8ForApp");
      break;
    case 0x1F0uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtSpecificGeoHash9ForApp");
      break;
    case 0x1F1uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtSpecificGeoHash10ForApp");
      break;
    case 0x1F2uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtSpecificGeoHash11ForApp");
      break;
    case 0x1F3uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtSpecificGeoHash12ForApp");
      break;
    case 0x1F4uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtSpecificGeoHash13ForApp");
      break;
    case 0x1F5uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtSpecificGeoHash14ForApp");
      break;
    case 0x1F6uLL:
      result = CFSTR("_ATXScoreInputAppNumberOfSpecificGeohashesForApp");
      break;
    case 0x1F7uLL:
      result = CFSTR("_ATXScoreInputAppNumberOfCoarseGeohashesForApp");
      break;
    case 0x1F8uLL:
      result = CFSTR("_ATXScoreInputAppEntropyForTimeBuckets");
      break;
    case 0x1F9uLL:
      result = CFSTR("_ATXScoreInputAppEntropyForSpecificGeoHash");
      break;
    case 0x1FAuLL:
      result = CFSTR("_ATXScoreInputAppEntropyForCoarseGeoHash");
      break;
    case 0x1FBuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtSpecificGeoHashForAppInContext");
      break;
    case 0x1FCuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtCoarseGeoHashForAppInContext");
      break;
    case 0x1FDuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtDayOfWeekInContext");
      break;
    case 0x1FEuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtDayOfWeekForApp");
      break;
    case 0x1FFuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtTimeAndDayForAppInContext");
      break;
    case 0x200uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtTimeAndDayInContext");
      break;
    case 0x201uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtTimeAndDayForApp");
      break;
    case 0x202uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtCoarseGeoHashInContext");
      break;
    case 0x203uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtCoarseGeoHashForApp");
      break;
    case 0x204uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtSpecificGeoHashInContext");
      break;
    case 0x205uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtSpecificGeoHashForApp");
      break;
    case 0x206uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesForAllAppsAndContextsDecayedAtCoarseContextRate");
      break;
    case 0x207uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesForAllAppsAndContextsDecayedAtSpecificContextRate");
      break;
    case 0x208uLL:
      result = CFSTR("_ATXScoreInputIsLocationServicesDisabled");
      break;
    case 0x209uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesInTwoHourTimeBucketForAppInContext");
      break;
    case 0x20AuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesInTwoHourTimeBucketInContext");
      break;
    case 0x20BuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesInTwoHourTimeBucketForApp");
      break;
    case 0x20CuLL:
      result = CFSTR("_ATXScoreInputAppConfirmsInTwoHourTimeBucketForAppInContext");
      break;
    case 0x20DuLL:
      result = CFSTR("_ATXScoreInputAppConfirmsInTwoHourTimeBucketInContext");
      break;
    case 0x20EuLL:
      result = CFSTR("_ATXScoreInputAppConfirmsInTwoHourTimeBucketForApp");
      break;
    case 0x20FuLL:
      result = CFSTR("_ATXScoreInputAppRejectsInTwoHourTimeBucketForAppInContext");
      break;
    case 0x210uLL:
      result = CFSTR("_ATXScoreInputAppRejectsInTwoHourTimeBucketInContext");
      break;
    case 0x211uLL:
      result = CFSTR("_ATXScoreInputAppRejectsInTwoHourTimeBucketForApp");
      break;
    case 0x212uLL:
      result = CFSTR("_ATXScoreInputAppConfirmsAtDayOfWeekForAppInContext");
      break;
    case 0x213uLL:
      result = CFSTR("_ATXScoreInputAppConfirmsAtDayOfWeekInContext");
      break;
    case 0x214uLL:
      result = CFSTR("_ATXScoreInputAppConfirmsAtDayOfWeekForApp");
      break;
    case 0x215uLL:
      result = CFSTR("_ATXScoreInputAppRejectsAtDayOfWeekForAppInContext");
      break;
    case 0x216uLL:
      result = CFSTR("_ATXScoreInputAppRejectsAtDayOfWeekInContext");
      break;
    case 0x217uLL:
      result = CFSTR("_ATXScoreInputAppRejectsAtDayOfWeekForApp");
      break;
    case 0x218uLL:
      result = CFSTR("_ATXScoreInputAppConfirmsAtCoarseGeoHashForAppInContext");
      break;
    case 0x219uLL:
      result = CFSTR("_ATXScoreInputAppConfirmsAtCoarseGeoHashInContext");
      break;
    case 0x21AuLL:
      result = CFSTR("_ATXScoreInputAppConfirmsAtCoarseGeoHashForApp");
      break;
    case 0x21BuLL:
      result = CFSTR("_ATXScoreInputAppRejectsAtCoarseGeoHashForAppInContext");
      break;
    case 0x21CuLL:
      result = CFSTR("_ATXScoreInputAppRejectsAtCoarseGeoHashInContext");
      break;
    case 0x21DuLL:
      result = CFSTR("_ATXScoreInputAppRejectsAtCoarseGeoHashForApp");
      break;
    case 0x21EuLL:
      result = CFSTR("_ATXScoreInputAppConfirmsAtSpecificGeoHashForAppInContext");
      break;
    case 0x21FuLL:
      result = CFSTR("_ATXScoreInputAppConfirmsAtSpecificGeoHashInContext");
      break;
    case 0x220uLL:
      result = CFSTR("_ATXScoreInputAppConfirmsAtSpecificGeoHashForApp");
      break;
    case 0x221uLL:
      result = CFSTR("_ATXScoreInputAppRejectsAtSpecificGeoHashForAppInContext");
      break;
    case 0x222uLL:
      result = CFSTR("_ATXScoreInputAppRejectsAtSpecificGeoHashInContext");
      break;
    case 0x223uLL:
      result = CFSTR("_ATXScoreInputAppRejectsAtSpecificGeoHashForApp");
      break;
    case 0x224uLL:
      result = CFSTR("_ATXScoreInputAppConfirmsForAllAppsAndContextsDecayedAtCoarseContextRate");
      break;
    case 0x225uLL:
      result = CFSTR("_ATXScoreInputAppConfirmsForAllAppsAndContextsDecayedAtSpecificContextRate");
      break;
    case 0x226uLL:
      result = CFSTR("_ATXScoreInputAppRejectsForAllAppsAndContextsDecayedAtCoarseContextRate");
      break;
    case 0x227uLL:
      result = CFSTR("_ATXScoreInputAppRejectsForAllAppsAndContextsDecayedAtSpecificContextRate");
      break;
    case 0x228uLL:
      result = CFSTR("_ATXScoreInputCurrentTimeBucketFromZeroToTwentyFour");
      break;
    case 0x229uLL:
      result = CFSTR("_ATXScoreInputActionsAtDayOfWeekForActionInContext");
      break;
    case 0x22AuLL:
      result = CFSTR("_ATXScoreInputActionsAtDayOfWeekInContext");
      break;
    case 0x22BuLL:
      result = CFSTR("_ATXScoreInputActionsAtDayOfWeekForAction");
      break;
    case 0x22CuLL:
      result = CFSTR("_ATXScoreInputActionsAtCoarseGeoHashForActionInContext");
      break;
    case 0x22DuLL:
      result = CFSTR("_ATXScoreInputActionsAtCoarseGeoHashInContext");
      break;
    case 0x22EuLL:
      result = CFSTR("_ATXScoreInputActionsAtCoarseGeoHashForAction");
      break;
    case 0x22FuLL:
      result = CFSTR("_ATXScoreInputActionsAtSpecificGeoHashForActionInContext");
      break;
    case 0x230uLL:
      result = CFSTR("_ATXScoreInputActionsAtSpecificGeoHashInContext");
      break;
    case 0x231uLL:
      result = CFSTR("_ATXScoreInputActionsAtSpecificGeoHashForAction");
      break;
    case 0x232uLL:
      result = CFSTR("_ATXScoreInputActionsAtTimeOfDayForActionInContext");
      break;
    case 0x233uLL:
      result = CFSTR("_ATXScoreInputActionsAtTimeOfDayInContext");
      break;
    case 0x234uLL:
      result = CFSTR("_ATXScoreInputActionsAtTimeOfDayForAction");
      break;
    case 0x235uLL:
      result = CFSTR("_ATXScoreInputActionConfirmsAtTimeOfDayForActionInContext");
      break;
    case 0x236uLL:
      result = CFSTR("_ATXScoreInputActionConfirmsAtTimeOfDayInContext");
      break;
    case 0x237uLL:
      result = CFSTR("_ATXScoreInputActionConfirmsAtTimeOfDayForAction");
      break;
    case 0x238uLL:
      result = CFSTR("_ATXScoreInputActionRejectsAtTimeOfDayForActionInContext");
      break;
    case 0x239uLL:
      result = CFSTR("_ATXScoreInputActionRejectsAtTimeOfDayInContext");
      break;
    case 0x23AuLL:
      result = CFSTR("_ATXScoreInputActionRejectsAtTimeOfDayForAction");
      break;
    case 0x23BuLL:
      result = CFSTR("_ATXScoreInputActionConfirmsAtDayOfWeekForActionInContext");
      break;
    case 0x23CuLL:
      result = CFSTR("_ATXScoreInputActionConfirmsAtDayOfWeekInContext");
      break;
    case 0x23DuLL:
      result = CFSTR("_ATXScoreInputActionConfirmsAtDayOfWeekForAction");
      break;
    case 0x23EuLL:
      result = CFSTR("_ATXScoreInputActionRejectsAtDayOfWeekForActionInContext");
      break;
    case 0x23FuLL:
      result = CFSTR("_ATXScoreInputActionRejectsAtDayOfWeekInContext");
      break;
    case 0x240uLL:
      result = CFSTR("_ATXScoreInputActionRejectsAtDayOfWeekForAction");
      break;
    case 0x241uLL:
      result = CFSTR("_ATXScoreInputActionConfirmsAtCoarseGeoHashForActionInContext");
      break;
    case 0x242uLL:
      result = CFSTR("_ATXScoreInputActionConfirmsAtCoarseGeoHashInContext");
      break;
    case 0x243uLL:
      result = CFSTR("_ATXScoreInputActionConfirmsAtCoarseGeoHashForAction");
      break;
    case 0x244uLL:
      result = CFSTR("_ATXScoreInputActionRejectsAtCoarseGeoHashForActionInContext");
      break;
    case 0x245uLL:
      result = CFSTR("_ATXScoreInputActionRejectsAtCoarseGeoHashInContext");
      break;
    case 0x246uLL:
      result = CFSTR("_ATXScoreInputActionRejectsAtCoarseGeoHashForAction");
      break;
    case 0x247uLL:
      result = CFSTR("_ATXScoreInputActionConfirmsAtSpecificGeoHashForActionInContext");
      break;
    case 0x248uLL:
      result = CFSTR("_ATXScoreInputActionConfirmsAtSpecificGeoHashInContext");
      break;
    case 0x249uLL:
      result = CFSTR("_ATXScoreInputActionConfirmsAtSpecificGeoHashForAction");
      break;
    case 0x24AuLL:
      result = CFSTR("_ATXScoreInputActionRejectsAtSpecificGeoHashForActionInContext");
      break;
    case 0x24BuLL:
      result = CFSTR("_ATXScoreInputActionRejectsAtSpecificGeoHashInContext");
      break;
    case 0x24CuLL:
      result = CFSTR("_ATXScoreInputActionRejectsAtSpecificGeoHashForAction");
      break;
    case 0x24DuLL:
      result = CFSTR("_ATXScoreInputActionsInTimeBucket0ForAction");
      break;
    case 0x24EuLL:
      result = CFSTR("_ATXScoreInputActionsInTimeBucket1ForAction");
      break;
    case 0x24FuLL:
      result = CFSTR("_ATXScoreInputActionsInTimeBucket2ForAction");
      break;
    case 0x250uLL:
      result = CFSTR("_ATXScoreInputActionsInTimeBucket3ForAction");
      break;
    case 0x251uLL:
      result = CFSTR("_ATXScoreInputActionsInTimeBucket4ForAction");
      break;
    case 0x252uLL:
      result = CFSTR("_ATXScoreInputActionsInTimeBucket5ForAction");
      break;
    case 0x253uLL:
      result = CFSTR("_ATXScoreInputActionsInTimeBucket6ForAction");
      break;
    case 0x254uLL:
      result = CFSTR("_ATXScoreInputActionsInTimeBucket7ForAction");
      break;
    case 0x255uLL:
      result = CFSTR("_ATXScoreInputActionsInTimeBucket8ForAction");
      break;
    case 0x256uLL:
      result = CFSTR("_ATXScoreInputActionsInTimeBucket9ForAction");
      break;
    case 0x257uLL:
      result = CFSTR("_ATXScoreInputActionsInTimeBucket10ForAction");
      break;
    case 0x258uLL:
      result = CFSTR("_ATXScoreInputActionsInTimeBucket11ForAction");
      break;
    case 0x259uLL:
      result = CFSTR("_ATXScoreInputActionsInTimeBucket12ForAction");
      break;
    case 0x25AuLL:
      result = CFSTR("_ATXScoreInputActionsInTimeBucket13ForAction");
      break;
    case 0x25BuLL:
      result = CFSTR("_ATXScoreInputActionsInTimeBucket14ForAction");
      break;
    case 0x25CuLL:
      result = CFSTR("_ATXScoreInputActionsInTimeBucket15ForAction");
      break;
    case 0x25DuLL:
      result = CFSTR("_ATXScoreInputActionsInTimeBucket16ForAction");
      break;
    case 0x25EuLL:
      result = CFSTR("_ATXScoreInputActionsInTimeBucket17ForAction");
      break;
    case 0x25FuLL:
      result = CFSTR("_ATXScoreInputActionsInTimeBucket18ForAction");
      break;
    case 0x260uLL:
      result = CFSTR("_ATXScoreInputActionsInTimeBucket19ForAction");
      break;
    case 0x261uLL:
      result = CFSTR("_ATXScoreInputActionsInTimeBucket20ForAction");
      break;
    case 0x262uLL:
      result = CFSTR("_ATXScoreInputActionsInTimeBucket21ForAction");
      break;
    case 0x263uLL:
      result = CFSTR("_ATXScoreInputActionsInTimeBucket22ForAction");
      break;
    case 0x264uLL:
      result = CFSTR("_ATXScoreInputActionsInTimeBucket23ForAction");
      break;
    case 0x265uLL:
      result = CFSTR("_ATXScoreInputActionsInTimeBucket24ForAction");
      break;
    case 0x266uLL:
      result = CFSTR("_ATXScoreInputActionsOnDayOfWeekSundayForAction");
      break;
    case 0x267uLL:
      result = CFSTR("_ATXScoreInputActionsOnDayOfWeekMondayForAction");
      break;
    case 0x268uLL:
      result = CFSTR("_ATXScoreInputActionsOnDayOfWeekTuesdayForAction");
      break;
    case 0x269uLL:
      result = CFSTR("_ATXScoreInputActionsOnDayOfWeekWednesdayForAction");
      break;
    case 0x26AuLL:
      result = CFSTR("_ATXScoreInputActionsOnDayOfWeekThursdayForAction");
      break;
    case 0x26BuLL:
      result = CFSTR("_ATXScoreInputActionsOnDayOfWeekFridayForAction");
      break;
    case 0x26CuLL:
      result = CFSTR("_ATXScoreInputActionsOnDayOfWeekSaturdayForAction");
      break;
    case 0x26DuLL:
      result = CFSTR("_ATXScoreInputActionsAtCoarseGeoHash0ForAction");
      break;
    case 0x26EuLL:
      result = CFSTR("_ATXScoreInputActionsAtCoarseGeoHash1ForAction");
      break;
    case 0x26FuLL:
      result = CFSTR("_ATXScoreInputActionsAtCoarseGeoHash2ForAction");
      break;
    case 0x270uLL:
      result = CFSTR("_ATXScoreInputActionsAtCoarseGeoHash3ForAction");
      break;
    case 0x271uLL:
      result = CFSTR("_ATXScoreInputActionsAtCoarseGeoHash4ForAction");
      break;
    case 0x272uLL:
      result = CFSTR("_ATXScoreInputActionsAtCoarseGeoHash5ForAction");
      break;
    case 0x273uLL:
      result = CFSTR("_ATXScoreInputActionsAtCoarseGeoHash6ForAction");
      break;
    case 0x274uLL:
      result = CFSTR("_ATXScoreInputActionsAtCoarseGeoHash7ForAction");
      break;
    case 0x275uLL:
      result = CFSTR("_ATXScoreInputActionsAtCoarseGeoHash8ForAction");
      break;
    case 0x276uLL:
      result = CFSTR("_ATXScoreInputActionsAtCoarseGeoHash9ForAction");
      break;
    case 0x277uLL:
      result = CFSTR("_ATXScoreInputActionsAtSpecificGeoHash0ForAction");
      break;
    case 0x278uLL:
      result = CFSTR("_ATXScoreInputActionsAtSpecificGeoHash1ForAction");
      break;
    case 0x279uLL:
      result = CFSTR("_ATXScoreInputActionsAtSpecificGeoHash2ForAction");
      break;
    case 0x27AuLL:
      result = CFSTR("_ATXScoreInputActionsAtSpecificGeoHash3ForAction");
      break;
    case 0x27BuLL:
      result = CFSTR("_ATXScoreInputActionsAtSpecificGeoHash4ForAction");
      break;
    case 0x27CuLL:
      result = CFSTR("_ATXScoreInputActionsAtSpecificGeoHash5ForAction");
      break;
    case 0x27DuLL:
      result = CFSTR("_ATXScoreInputActionsAtSpecificGeoHash6ForAction");
      break;
    case 0x27EuLL:
      result = CFSTR("_ATXScoreInputActionsAtSpecificGeoHash7ForAction");
      break;
    case 0x27FuLL:
      result = CFSTR("_ATXScoreInputActionsAtSpecificGeoHash8ForAction");
      break;
    case 0x280uLL:
      result = CFSTR("_ATXScoreInputActionsAtSpecificGeoHash9ForAction");
      break;
    case 0x281uLL:
      result = CFSTR("_ATXScoreInputActionsAtSpecificGeoHash10ForAction");
      break;
    case 0x282uLL:
      result = CFSTR("_ATXScoreInputActionsAtSpecificGeoHash11ForAction");
      break;
    case 0x283uLL:
      result = CFSTR("_ATXScoreInputActionsAtSpecificGeoHash12ForAction");
      break;
    case 0x284uLL:
      result = CFSTR("_ATXScoreInputActionsAtSpecificGeoHash13ForAction");
      break;
    case 0x285uLL:
      result = CFSTR("_ATXScoreInputActionsAtSpecificGeoHash14ForAction");
      break;
    case 0x286uLL:
      result = CFSTR("_ATXScoreInputActionEntropyForTimeOfDay");
      break;
    case 0x287uLL:
      result = CFSTR("_ATXScoreInputActionEntropyForDayOfWeek");
      break;
    case 0x288uLL:
      result = CFSTR("_ATXScoreInputActionEntropyForCoarseGeoHash");
      break;
    case 0x289uLL:
      result = CFSTR("_ATXScoreInputActionEntropyForSpecificGeoHash");
      break;
    case 0x28AuLL:
      result = CFSTR("_ATXScoreInputActionNumberOfSpecificGeohashesForAction");
      break;
    case 0x28BuLL:
      result = CFSTR("_ATXScoreInputActionNumberOfCoarseGeohashesForAction");
      break;
    case 0x28CuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtZoom7GeoHashForAppInContext");
      break;
    case 0x28DuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtZoom7GeoHashInContext");
      break;
    case 0x28EuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtZoom7GeoHashForApp");
      break;
    case 0x28FuLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtZoom7GeoHash0ForApp");
      break;
    case 0x290uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtZoom7GeoHash1ForApp");
      break;
    case 0x291uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtZoom7GeoHash2ForApp");
      break;
    case 0x292uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtZoom7GeoHash3ForApp");
      break;
    case 0x293uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtZoom7GeoHash4ForApp");
      break;
    case 0x294uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtZoom7GeoHash5ForApp");
      break;
    case 0x295uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtZoom7GeoHash6ForApp");
      break;
    case 0x296uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtZoom7GeoHash7ForApp");
      break;
    case 0x297uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtZoom7GeoHash8ForApp");
      break;
    case 0x298uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtZoom7GeoHash9ForApp");
      break;
    case 0x299uLL:
      result = CFSTR("_ATXScoreInputAppEntropyForZoom7GeoHash");
      break;
    case 0x29AuLL:
      result = CFSTR("_ATXScoreInputAppNumberOfZoom7GeohashesForApp");
      break;
    case 0x29BuLL:
      result = CFSTR("_ATXScoreInputAppGeoAssociationScoreAtZoom7");
      break;
    case 0x29CuLL:
      result = CFSTR("_ATXScoreInputAppGeoAssociationScoreAtZoom13");
      break;
    case 0x29DuLL:
      result = CFSTR("_ATXScoreInputAppGeoAssociationScoreAtZoom16");
      break;
    case 0x29EuLL:
      result = CFSTR("_ATXScoreInputAppPartOfWeekAssociationScore");
      break;
    case 0x29FuLL:
      result = CFSTR("_ATXScoreInputAppCoarseTimeAssociationScore");
      break;
    case 0x2A0uLL:
      result = CFSTR("_ATXScoreInputAppLOITypeAssociationScore");
      break;
    case 0x2A1uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtSSIDForAppInContext");
      break;
    case 0x2A2uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtSSIDForApp");
      break;
    case 0x2A3uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesForCoreMotionForAppInContext");
      break;
    case 0x2A4uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesInAirplaneModeForAppInContext");
      break;
    case 0x2A5uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppConfirmsOnDayOfWeekForAppInContext");
      break;
    case 0x2A6uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppConfirmsOnDayOfWeekInContext");
      break;
    case 0x2A7uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppConfirmsOnDayOfWeekForApp");
      break;
    case 0x2A8uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppRejectsOnDayOfWeekForAppInContext");
      break;
    case 0x2A9uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppRejectsOnDayOfWeekInContext");
      break;
    case 0x2AAuLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppRejectsOnDayOfWeekForApp");
      break;
    case 0x2ABuLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppConfirmsInTwoHourTimeIntervalForAppInContext");
      break;
    case 0x2ACuLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppConfirmsInTwoHourTimeIntervalInContext");
      break;
    case 0x2ADuLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppConfirmsInTwoHourTimeIntervalForApp");
      break;
    case 0x2AEuLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppRejectsInTwoHourTimeIntervalForAppInContext");
      break;
    case 0x2AFuLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppRejectsInTwoHourTimeIntervalInContext");
      break;
    case 0x2B0uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppRejectsInTwoHourTimeIntervalForApp");
      break;
    case 0x2B1uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppConfirmsAtCoarseGeohashForAppInContext");
      break;
    case 0x2B2uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppConfirmsAtCoarseGeohashInContext");
      break;
    case 0x2B3uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppConfirmsAtCoarseGeohashForApp");
      break;
    case 0x2B4uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppRejectsAtCoarseGeohashForAppInContext");
      break;
    case 0x2B5uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppRejectsAtCoarseGeohashInContext");
      break;
    case 0x2B6uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppRejectsAtCoarseGeohashForApp");
      break;
    case 0x2B7uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppConfirmsAtSpecificGeohashForAppInContext");
      break;
    case 0x2B8uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppConfirmsAtSpecificGeohashInContext");
      break;
    case 0x2B9uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppConfirmsAtSpecificGeohashForApp");
      break;
    case 0x2BAuLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppRejectsAtSpecificGeohashForAppInContext");
      break;
    case 0x2BBuLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppRejectsAtSpecificGeohashInContext");
      break;
    case 0x2BCuLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppRejectsAtSpecificGeohashForApp");
      break;
    case 0x2BDuLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppConfirmsAtCoarseTimePOWLocationForAppInContext");
      break;
    case 0x2BEuLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppConfirmsAtCoarseTimePOWLocationInContext");
      break;
    case 0x2BFuLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppConfirmsAtCoarseTimePOWLocationForApp");
      break;
    case 0x2C0uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppRejectsAtCoarseTimePOWLocationForAppInContext");
      break;
    case 0x2C1uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppRejectsAtCoarseTimePOWLocationInContext");
      break;
    case 0x2C2uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppRejectsAtCoarseTimePOWLocationForApp");
      break;
    case 0x2C3uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppExplicitRejectsAtCoarseTimePOWLocationForAppInContext");
      break;
    case 0x2C4uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppExplicitRejectsAtCoarseTimePOWLocationInContext");
      break;
    case 0x2C5uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppExplicitRejectsAtCoarseTimePOWLocationForApp");
      break;
    case 0x2C6uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppConfirmsAtSpecificTimeDOWLocationForAppInContext");
      break;
    case 0x2C7uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppConfirmsAtSpecificTimeDOWLocationInContext");
      break;
    case 0x2C8uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppConfirmsAtSpecificTimeDOWLocationForApp");
      break;
    case 0x2C9uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppRejectsAtSpecificTimeDOWLocationForAppInContext");
      break;
    case 0x2CAuLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppRejectsAtSpecificTimeDOWLocationInContext");
      break;
    case 0x2CBuLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppRejectsAtSpecificTimeDOWLocationForApp");
      break;
    case 0x2CCuLL:
      result = CFSTR("_ATXScoreInputHomeScreenTotalLaunchesForApp");
      break;
    case 0x2CDuLL:
      result = CFSTR("_ATXScoreInputHomeScreenTotalLaunchesForAllApps");
      break;
    case 0x2CEuLL:
      result = CFSTR("_ATXScoreInputAppDirectoryTotalLaunchesForApp");
      break;
    case 0x2CFuLL:
      result = CFSTR("_ATXScoreInputAppDirectoryTotalLaunchesForAllApps");
      break;
    case 0x2D0uLL:
      result = CFSTR("_ATXScoreInputAppDirectoryConfirmsOnDayOfWeekForAppInContext");
      break;
    case 0x2D1uLL:
      result = CFSTR("_ATXScoreInputAppDirectoryConfirmsOnDayOfWeekInContext");
      break;
    case 0x2D2uLL:
      result = CFSTR("_ATXScoreInputAppDirectoryConfirmsOnDayOfWeekForApp");
      break;
    case 0x2D3uLL:
      result = CFSTR("_ATXScoreInputAppDirectoryRejectsOnDayOfWeekForAppInContext");
      break;
    case 0x2D4uLL:
      result = CFSTR("_ATXScoreInputAppDirectoryRejectsOnDayOfWeekInContext");
      break;
    case 0x2D5uLL:
      result = CFSTR("_ATXScoreInputAppDirectoryRejectsOnDayOfWeekForApp");
      break;
    case 0x2D6uLL:
      result = CFSTR("_ATXScoreInputAppDirectoryConfirmsInTwoHourTimeIntervalForAppInContext");
      break;
    case 0x2D7uLL:
      result = CFSTR("_ATXScoreInputAppDirectoryConfirmsInTwoHourTimeIntervalInContext");
      break;
    case 0x2D8uLL:
      result = CFSTR("_ATXScoreInputAppDirectoryConfirmsInTwoHourTimeIntervalForApp");
      break;
    case 0x2D9uLL:
      result = CFSTR("_ATXScoreInputAppDirectoryRejectsInTwoHourTimeIntervalForAppInContext");
      break;
    case 0x2DAuLL:
      result = CFSTR("_ATXScoreInputAppDirectoryRejectsInTwoHourTimeIntervalInContext");
      break;
    case 0x2DBuLL:
      result = CFSTR("_ATXScoreInputAppDirectoryRejectsInTwoHourTimeIntervalForApp");
      break;
    case 0x2DCuLL:
      result = CFSTR("_ATXScoreInputAppDirectoryConfirmsAtCoarseGeohashForAppInContext");
      break;
    case 0x2DDuLL:
      result = CFSTR("_ATXScoreInputAppDirectoryConfirmsAtCoarseGeohashInContext");
      break;
    case 0x2DEuLL:
      result = CFSTR("_ATXScoreInputAppDirectoryConfirmsAtCoarseGeohashForApp");
      break;
    case 0x2DFuLL:
      result = CFSTR("_ATXScoreInputAppDirectoryRejectsAtCoarseGeohashForAppInContext");
      break;
    case 0x2E0uLL:
      result = CFSTR("_ATXScoreInputAppDirectoryRejectsAtCoarseGeohashInContext");
      break;
    case 0x2E1uLL:
      result = CFSTR("_ATXScoreInputAppDirectoryRejectsAtCoarseGeohashForApp");
      break;
    case 0x2E2uLL:
      result = CFSTR("_ATXScoreInputAppDirectoryConfirmsAtSpecificGeohashForAppInContext");
      break;
    case 0x2E3uLL:
      result = CFSTR("_ATXScoreInputAppDirectoryConfirmsAtSpecificGeohashInContext");
      break;
    case 0x2E4uLL:
      result = CFSTR("_ATXScoreInputAppDirectoryConfirmsAtSpecificGeohashForApp");
      break;
    case 0x2E5uLL:
      result = CFSTR("_ATXScoreInputAppDirectoryRejectsAtSpecificGeohashForAppInContext");
      break;
    case 0x2E6uLL:
      result = CFSTR("_ATXScoreInputAppDirectoryRejectsAtSpecificGeohashInContext");
      break;
    case 0x2E7uLL:
      result = CFSTR("_ATXScoreInputAppDirectoryRejectsAtSpecificGeohashForApp");
      break;
    case 0x2E8uLL:
      result = CFSTR("_ATXScoreInputAppDirectoryConfirmsAtCoarseTimePOWLocationForAppInContext");
      break;
    case 0x2E9uLL:
      result = CFSTR("_ATXScoreInputAppDirectoryConfirmsAtCoarseTimePOWLocationInContext");
      break;
    case 0x2EAuLL:
      result = CFSTR("_ATXScoreInputAppDirectoryConfirmsAtCoarseTimePOWLocationForApp");
      break;
    case 0x2EBuLL:
      result = CFSTR("_ATXScoreInputAppDirectoryRejectsAtCoarseTimePOWLocationForAppInContext");
      break;
    case 0x2ECuLL:
      result = CFSTR("_ATXScoreInputAppDirectoryRejectsAtCoarseTimePOWLocationInContext");
      break;
    case 0x2EDuLL:
      result = CFSTR("_ATXScoreInputAppDirectoryRejectsAtCoarseTimePOWLocationForApp");
      break;
    case 0x2EEuLL:
      result = CFSTR("_ATXScoreInputAppDirectoryExplicitRejectsAtCoarseTimePOWLocationForAppInContext");
      break;
    case 0x2EFuLL:
      result = CFSTR("_ATXScoreInputAppDirectoryExplicitRejectsAtCoarseTimePOWLocationInContext");
      break;
    case 0x2F0uLL:
      result = CFSTR("_ATXScoreInputAppDirectoryExplicitRejectsAtCoarseTimePOWLocationForApp");
      break;
    case 0x2F1uLL:
      result = CFSTR("_ATXScoreInputAppDirectoryConfirmsAtSpecificTimeDOWLocationForAppInContext");
      break;
    case 0x2F2uLL:
      result = CFSTR("_ATXScoreInputAppDirectoryConfirmsAtSpecificTimeDOWLocationInContext");
      break;
    case 0x2F3uLL:
      result = CFSTR("_ATXScoreInputAppDirectoryConfirmsAtSpecificTimeDOWLocationForApp");
      break;
    case 0x2F4uLL:
      result = CFSTR("_ATXScoreInputAppDirectoryRejectsAtSpecificTimeDOWLocationForAppInContext");
      break;
    case 0x2F5uLL:
      result = CFSTR("_ATXScoreInputAppDirectoryRejectsAtSpecificTimeDOWLocationInContext");
      break;
    case 0x2F6uLL:
      result = CFSTR("_ATXScoreInputAppDirectoryRejectsAtSpecificTimeDOWLocationForApp");
      break;
    case 0x2F7uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppConfirmsForAllAppsAndContextsDecayedAtCoarseContextRate");
      break;
    case 0x2F8uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppConfirmsForAllAppsAndContextsDecayedAtSpecificContextRate");
      break;
    case 0x2F9uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppRejectsForAllAppsAndContextsDecayedAtCoarseContextRate");
      break;
    case 0x2FAuLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppRejectsForAllAppsAndContextsDecayedAtSpecificContextRate");
      break;
    case 0x2FBuLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppExplicitRejectsForAllAppsAndContextsDecayedAtCoarseContextRate");
      break;
    case 0x2FCuLL:
      result = CFSTR("_ATXScoreInputAppDirectoryConfirmsForAllAppsAndContextsDecayedAtCoarseContextRate");
      break;
    case 0x2FDuLL:
      result = CFSTR("_ATXScoreInputAppDirectoryConfirmsForAllAppsAndContextsDecayedAtSpecificContextRate");
      break;
    case 0x2FEuLL:
      result = CFSTR("_ATXScoreInputAppDirectoryRejectsForAllAppsAndContextsDecayedAtCoarseContextRate");
      break;
    case 0x2FFuLL:
      result = CFSTR("_ATXScoreInputAppDirectoryRejectsForAllAppsAndContextsDecayedAtSpecificContextRate");
      break;
    case 0x300uLL:
      result = CFSTR("_ATXScoreInputAppDirectoryExplicitRejectsForAllAppsAndContextsDecayedAtCoarseContextRate");
      break;
    case 0x301uLL:
      result = CFSTR("_ATXScoreInputIsAppClip");
      break;
    case 0x302uLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionConfirmsOnDayOfWeekForActionInContext");
      break;
    case 0x303uLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionConfirmsOnDayOfWeekInContext");
      break;
    case 0x304uLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionConfirmsOnDayOfWeekForAction");
      break;
    case 0x305uLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionConfirmsAtTimeOfDayForActionInContext");
      break;
    case 0x306uLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionConfirmsAtTimeOfDayInContext");
      break;
    case 0x307uLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionConfirmsAtTimeOfDayForAction");
      break;
    case 0x308uLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionConfirmsAtCoarseGeohashForActionInContext");
      break;
    case 0x309uLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionConfirmsAtCoarseGeohashInContext");
      break;
    case 0x30AuLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionConfirmsAtCoarseGeohashForAction");
      break;
    case 0x30BuLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionConfirmsAtSpecificGeohashForActionInContext");
      break;
    case 0x30CuLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionConfirmsAtSpecificGeohashInContext");
      break;
    case 0x30DuLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionConfirmsAtSpecificGeohashForAction");
      break;
    case 0x30EuLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionConfirmsAtCoarseTimePOWLocationForActionInContext");
      break;
    case 0x30FuLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionConfirmsAtCoarseTimePOWLocationInContext");
      break;
    case 0x310uLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionConfirmsAtCoarseTimePOWLocationForAction");
      break;
    case 0x311uLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionConfirmsAtSpecificTimeDOWLocationForActionInContext");
      break;
    case 0x312uLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionConfirmsAtSpecificTimeDOWLocationInContext");
      break;
    case 0x313uLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionConfirmsAtSpecificTimeDOWLocationForAction");
      break;
    case 0x314uLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionRejectsOnDayOfWeekForActionInContext");
      break;
    case 0x315uLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionRejectsOnDayOfWeekInContext");
      break;
    case 0x316uLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionRejectsOnDayOfWeekForAction");
      break;
    case 0x317uLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionRejectsAtTimeOfDayForActionInContext");
      break;
    case 0x318uLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionRejectsAtTimeOfDayInContext");
      break;
    case 0x319uLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionRejectsAtTimeOfDayForAction");
      break;
    case 0x31AuLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionRejectsAtCoarseGeohashForActionInContext");
      break;
    case 0x31BuLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionRejectsAtCoarseGeohashInContext");
      break;
    case 0x31CuLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionRejectsAtCoarseGeohashForAction");
      break;
    case 0x31DuLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionRejectsAtSpecificGeohashForActionInContext");
      break;
    case 0x31EuLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionRejectsAtSpecificGeohashInContext");
      break;
    case 0x31FuLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionRejectsAtSpecificGeohashForAction");
      break;
    case 0x320uLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionRejectsAtCoarseTimePOWLocationForActionInContext");
      break;
    case 0x321uLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionRejectsAtCoarseTimePOWLocationInContext");
      break;
    case 0x322uLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionRejectsAtCoarseTimePOWLocationForAction");
      break;
    case 0x323uLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionRejectsAtSpecificTimeDOWLocationForActionInContext");
      break;
    case 0x324uLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionRejectsAtSpecificTimeDOWLocationInContext");
      break;
    case 0x325uLL:
      result = CFSTR("_ATXScoreInputHomeScreenActionRejectsAtSpecificTimeDOWLocationForAction");
      break;
    case 0x326uLL:
      result = CFSTR("_ATXScoreInputPOIPopularityForAppInContext");
      break;
    case 0x327uLL:
      result = CFSTR("_ATXScoreInputAppLaunchPopularityAtPOIForAppInContext");
      break;
    case 0x328uLL:
      result = CFSTR("_ATXScoreInputPOICategory");
      break;
    case 0x329uLL:
      result = CFSTR("_ATXScoreInputAppLaunchesAtPOIForAppInContext");
      break;
    case 0x32AuLL:
      result = CFSTR("_ATXScoreInputAppCategoryScore");
      break;
    case 0x32BuLL:
      result = CFSTR("_ATXScoreInputPosteriorProbabilityOfAppGivenMode");
      break;
    case 0x32CuLL:
      result = CFSTR("_ATXScoreInputClassConditionalProbabilityOfModeGivenApp");
      break;
    case 0x32DuLL:
      result = CFSTR("_ATXScoreInputUniqueOccurrencesOfAppInMode");
      break;
    case 0x32EuLL:
      result = CFSTR("_ATXScoreInputLocalOccurrencesOfAppInMode");
      break;
    case 0x32FuLL:
      result = CFSTR("_ATXScoreInputGlobalOccurrencesOfAppInMode");
      break;
    case 0x330uLL:
      result = CFSTR("_ATXScoreInputAppModeEntityScore");
      break;
    case 0x331uLL:
      result = CFSTR("_ATXScoreInputMax");
      break;
    default:
      if (a3 != 0xFFFFFFFF)
        +[_ATXScoreTypes stringForScoreInput:].cold.1((uint64_t)a2, (uint64_t)CFSTR("_ATXScoreInputAppInFolder"));
      result = CFSTR("<Undefined Score Input>");
      break;
  }
  return result;
}

+ (unint64_t)scoreInputForString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = a3;
  if (scoreInputForString__onceToken != -1)
    dispatch_once(&scoreInputForString__onceToken, &__block_literal_global_4);
  objc_msgSend((id)scoreInputForString__scoreInputMap, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "integerValue");
  else
    v6 = 0xFFFFFFFFLL;

  return v6;
}

+ (id)aggdStringForScoreInput:(unint64_t)a3
{
  id result;

  result = CFSTR("AppInFolder");
  switch(a3)
  {
    case 0uLL:
      result = CFSTR("InstallAge");
      break;
    case 1uLL:
      result = CFSTR("LastSpotlightLaunchAge");
      break;
    case 2uLL:
      result = CFSTR("LastLaunchAge");
      break;
    case 3uLL:
      result = CFSTR("MedianSecondsBetweenLaunches");
      break;
    case 4uLL:
      result = CFSTR("AverageSecondsBetweenLaunches");
      break;
    case 5uLL:
      result = CFSTR("UnlockTime");
      break;
    case 6uLL:
      return result;
    case 7uLL:
      result = CFSTR("FolderPage");
      break;
    case 8uLL:
      result = CFSTR("HasSpringBoardPage");
      break;
    case 9uLL:
      result = CFSTR("SpringBoardPage");
      break;
    case 0xAuLL:
      result = CFSTR("OnSpringBoardDock");
      break;
    case 0xBuLL:
      result = CFSTR("Feedback");
      break;
    case 0xCuLL:
      result = CFSTR("FeedbackConfirms");
      break;
    case 0xDuLL:
      result = CFSTR("FeedbackRejects");
      break;
    case 0xEuLL:
      result = CFSTR("APRExplicitConfirmRatio");
      break;
    case 0xFuLL:
      result = CFSTR("APRExplicitRejectRatio");
      break;
    case 0x10uLL:
      result = CFSTR("APRImplicitConfirmRatio");
      break;
    case 0x11uLL:
      result = CFSTR("APRImplicitRejectRatio");
      break;
    case 0x12uLL:
      result = CFSTR("APRSiriKitIntentsRatio");
      break;
    case 0x13uLL:
      result = CFSTR("APRNonSiriKitIntentsRatio");
      break;
    case 0x14uLL:
      result = CFSTR("APRTotalExplicitConfirms");
      break;
    case 0x15uLL:
      result = CFSTR("APRTotalExplicitRejects");
      break;
    case 0x16uLL:
      result = CFSTR("APRTotalImplicitConfirms");
      break;
    case 0x17uLL:
      result = CFSTR("APRTotalImplicitRejects");
      break;
    case 0x18uLL:
      result = CFSTR("ScoreInputAPRTotalSiriKitIntents");
      break;
    case 0x19uLL:
      result = CFSTR("ScoreInputAPRTotalNonSiriKitIntents");
      break;
    case 0x1AuLL:
      result = CFSTR("LaunchTimePopularity");
      break;
    case 0x1BuLL:
      result = CFSTR("TimeOfDayPopularity");
      break;
    case 0x1CuLL:
      result = CFSTR("CoarseTimeOfDayPopularity");
      break;
    case 0x1DuLL:
      result = CFSTR("LaunchPopularity");
      break;
    case 0x1EuLL:
      result = CFSTR("SpotlightLaunchTimePopularity");
      break;
    case 0x1FuLL:
      result = CFSTR("SpotlightTimeOfDayPopularity");
      break;
    case 0x20uLL:
      result = CFSTR("SpotlightLaunchPopularity");
      break;
    case 0x21uLL:
      result = CFSTR("DayZeroPoints");
      break;
    case 0x22uLL:
      result = CFSTR("StaticAppPoints");
      break;
    case 0x23uLL:
      result = CFSTR("LaunchDayOfWeekPopularity");
      break;
    case 0x24uLL:
      result = CFSTR("DayOfWeekPopularity");
      break;
    case 0x25uLL:
      result = CFSTR("LaunchSequencePopularity");
      break;
    case 0x26uLL:
      result = CFSTR("LaunchLocationPopularity");
      break;
    case 0x27uLL:
      result = CFSTR("AppLaunchMicroLocationPopularity");
      break;
    case 0x28uLL:
      result = CFSTR("EntropyLaunchPopularity");
      break;
    case 0x29uLL:
      result = CFSTR("EntropyDayOfWeekPopularity");
      break;
    case 0x2AuLL:
      result = CFSTR("EntropyDayOfWeekPopularityByDay");
      break;
    case 0x2BuLL:
      result = CFSTR("EntropyDayOfWeekPopularityByApp");
      break;
    case 0x2CuLL:
      result = CFSTR("DistanceDayOfWeekToLaunchPopularity");
      break;
    case 0x2DuLL:
      result = CFSTR("EntropyTrendingPopularity");
      break;
    case 0x2EuLL:
      result = CFSTR("DistanceTrendingToLaunchPopularity");
      break;
    case 0x2FuLL:
      result = CFSTR("EntropySSIDPopularity");
      break;
    case 0x30uLL:
      result = CFSTR("EntropySSIDPopularityBySSID");
      break;
    case 0x31uLL:
      result = CFSTR("EntropySSIDPopularityByApp");
      break;
    case 0x32uLL:
      result = CFSTR("DistanceSSIDToLaunchPopularity");
      break;
    case 0x33uLL:
      result = CFSTR("AppCount");
      break;
    case 0x34uLL:
      result = CFSTR("DistanceToExplicitLaunchPrediction");
      break;
    case 0x35uLL:
      result = CFSTR("SiriKitIntentParzen");
      break;
    case 0x36uLL:
      result = CFSTR("NonSiriKitIntentParzen");
      break;
    case 0x37uLL:
      result = CFSTR("AppDailyDose");
      break;
    case 0x38uLL:
      result = CFSTR("AppCurrentDose");
      break;
    case 0x39uLL:
      result = CFSTR("AppDailyDoseRemaining");
      break;
    case 0x3AuLL:
      result = CFSTR("AppDailyDoseSmoothedError");
      break;
    case 0x3BuLL:
      result = CFSTR("TotalAppNumberOfLaunches");
      break;
    case 0x3CuLL:
      result = CFSTR("TotalAppNumberOfSpotlightLaunches");
      break;
    case 0x3DuLL:
      result = CFSTR("AirplaneModePopularity");
      break;
    case 0x3EuLL:
      result = CFSTR("TotalNumberOfAirplaneModeAppLaunches");
      break;
    case 0x3FuLL:
      result = CFSTR("TrendingPopularity");
      break;
    case 0x40uLL:
      result = CFSTR("TotalNumberOfTrendingAppLaunches");
      break;
    case 0x41uLL:
      result = CFSTR("SSIDPopularity");
      break;
    case 0x42uLL:
      result = CFSTR("TotalNumberOfSSIDAppLaunches");
      break;
    case 0x43uLL:
      result = CFSTR("OnWifi");
      break;
    case 0x44uLL:
      result = CFSTR("CoreMotionPopularity");
      break;
    case 0x45uLL:
      result = CFSTR("TotalNumberOfCoreMotionLaunches");
      break;
    case 0x46uLL:
      result = CFSTR("MagicalMomentsConfidence");
      break;
    case 0x47uLL:
      result = CFSTR("MagicalMomentsPredictionReason");
      break;
    case 0x48uLL:
      result = CFSTR("MagicalMomentsAnchor");
      break;
    case 0x49uLL:
      result = CFSTR("HeroAppConfidence");
      break;
    case 0x4AuLL:
      result = CFSTR("HeroAppPredictionReason");
      break;
    case 0x4BuLL:
      result = CFSTR("MagicalMomentsHeroAppPredictionIndex");
      break;
    case 0x4CuLL:
      result = CFSTR("MagicalMomentsHeroAppPredictionTotalPredictions");
      break;
    case 0x4DuLL:
      result = CFSTR("MostRecentNotificationAge");
      break;
    case 0x4EuLL:
      result = CFSTR("AppPreferenceBundleBoost");
      break;
    case 0x4FuLL:
      result = CFSTR("AppIntentPartOfWeekPopularity");
      break;
    case 0x50uLL:
      result = CFSTR("AppIntentLaunchPartOfWeekPopularity");
      break;
    case 0x51uLL:
      result = CFSTR("GenreTimeOfDayPopularity");
      break;
    case 0x52uLL:
      result = CFSTR("GenreSequencePopularity");
      break;
    case 0x53uLL:
      result = CFSTR("GenreDayOfWeekPopularity");
      break;
    case 0x54uLL:
      result = CFSTR("GenreSpotlightLaunchPopularity");
      break;
    case 0x55uLL:
      result = CFSTR("TrendingGenrePopularity");
      break;
    case 0x56uLL:
      result = CFSTR("GenreAirplaneModePopularity");
      break;
    case 0x57uLL:
      result = CFSTR("GenreDailyDoseRemaining");
      break;
    case 0x58uLL:
      result = CFSTR("GenreLocationPopularity");
      break;
    case 0x59uLL:
      result = CFSTR("GenreSSIDPopularity");
      break;
    case 0x5AuLL:
      result = CFSTR("App2VecClusterTimeOfDayPopularity");
      break;
    case 0x5BuLL:
      result = CFSTR("App2VecClusterSequencePopularity");
      break;
    case 0x5CuLL:
      result = CFSTR("App2VecClusterDayOfWeekPopularity");
      break;
    case 0x5DuLL:
      result = CFSTR("App2VecTrendingPopularity");
      break;
    case 0x5EuLL:
      result = CFSTR("App2VecLocationPopularity");
      break;
    case 0x5FuLL:
      result = CFSTR("App2VecClusterCount");
      break;
    case 0x60uLL:
      result = CFSTR("SupportsMedia");
      break;
    case 0x61uLL:
      result = CFSTR("AppTimeAndDayOfWeekPopularity");
      break;
    case 0x62uLL:
      result = CFSTR("AppPopularityGivenTimeAndDayOfWeek");
      break;
    case 0x63uLL:
      result = CFSTR("AppPopularityOfTimeAndDayOfWeekGivenApp");
      break;
    case 0x64uLL:
      result = CFSTR("AppTotalNumberOfTimeAndDayOfWeekLaunches");
      break;
    case 0x65uLL:
      result = CFSTR("AppIntentCount");
      break;
    case 0x66uLL:
      result = CFSTR("AppIntentSlotCountForAllAppActions");
      break;
    case 0x67uLL:
      result = CFSTR("AppIntentTotalNumberOfLaunches");
      break;
    case 0x68uLL:
      result = CFSTR("AppIntentTotalNumberOfAirplaneModeLaunches");
      break;
    case 0x69uLL:
      result = CFSTR("AppIntentTotalNumberOfSSIDLaunches");
      break;
    case 0x6AuLL:
      result = CFSTR("AppIntentTotalNumberOfCoreMotionLaunches");
      break;
    case 0x6BuLL:
      result = CFSTR("AppIntentTotalNumberOfTrendingLaunches");
      break;
    case 0x6CuLL:
      result = CFSTR("DayOfWeekBucket");
      break;
    case 0x6DuLL:
      result = CFSTR("TimeOfDayBucket");
      break;
    case 0x6EuLL:
      result = CFSTR("IsDateInWeekendOnDevice");
      break;
    case 0x6FuLL:
      result = CFSTR("AppIntentLaunchPopularity");
      break;
    case 0x70uLL:
      result = CFSTR("AppIntentTrendingPopularity");
      break;
    case 0x71uLL:
      result = CFSTR("AppIntentTimeOfDayPopularity");
      break;
    case 0x72uLL:
      result = CFSTR("AppIntentCoarseTimeOfDayPopularity");
      break;
    case 0x73uLL:
      result = CFSTR("AppIntentDayOfWeekPopularity");
      break;
    case 0x74uLL:
      result = CFSTR("AppIntentUnlockTime");
      break;
    case 0x75uLL:
      result = CFSTR("AppIntentSSIDPopularity");
      break;
    case 0x76uLL:
      result = CFSTR("AppIntentCoreMotionPopularity");
      break;
    case 0x77uLL:
      result = CFSTR("AppIntentAirplaneModePopularity");
      break;
    case 0x78uLL:
      result = CFSTR("AppIntentLaunchLocationPopularity");
      break;
    case 0x79uLL:
      result = CFSTR("AppIntentLaunchMicroLocationPopularity");
      break;
    case 0x7AuLL:
      result = CFSTR("AppIntentLaunchSequencePopularity");
      break;
    case 0x7BuLL:
      result = CFSTR("AppIntentAppLaunchSequencePopularity");
      break;
    case 0x7CuLL:
      result = CFSTR("AppIntentLaunchTimePopularity");
      break;
    case 0x7DuLL:
      result = CFSTR("AppIntentLaunchDayOfWeekPopularity");
      break;
    case 0x7EuLL:
      result = CFSTR("AppIntentLastLaunchAge");
      break;
    case 0x7FuLL:
      result = CFSTR("AppIntentAverageSecondsBetweenAppActions");
      break;
    case 0x80uLL:
      result = CFSTR("AppIntentMedianSecondsBetweenAppActions");
      break;
    case 0x81uLL:
      result = CFSTR("AppIntentDayZeroPoints");
      break;
    case 0x82uLL:
      result = CFSTR("AppIntentStaticAppPoints");
      break;
    case 0x83uLL:
      result = CFSTR("AppIntentStaticValueScore");
      break;
    case 0x84uLL:
      result = CFSTR("AppCategory");
      break;
    case 0x85uLL:
      result = CFSTR("IntentCategory");
      break;
    case 0x86uLL:
      result = CFSTR("ActionKeyCategory");
      break;
    case 0x87uLL:
      result = CFSTR("IntentCategoryFromIntentDefinition");
      break;
    case 0x88uLL:
      result = CFSTR("AppIntentEntropyLaunchPopularity");
      break;
    case 0x89uLL:
      result = CFSTR("AppIntentEntropyDayOfWeekPopularity");
      break;
    case 0x8AuLL:
      result = CFSTR("AppIntentEntropyDayOfWeekPopularityByDay");
      break;
    case 0x8BuLL:
      result = CFSTR("AppIntentEntropyDayOfWeekPopularityByAppIntent");
      break;
    case 0x8CuLL:
      result = CFSTR("AppIntentEntropyTrendingPopularity");
      break;
    case 0x8DuLL:
      result = CFSTR("AppIntentEntropySSIDPopularity");
      break;
    case 0x8EuLL:
      result = CFSTR("AppIntentEntropySSIDPopularityBySSID");
      break;
    case 0x8FuLL:
      result = CFSTR("AppIntentEntropySSIDPopularityByAppIntent");
      break;
    case 0x90uLL:
      result = CFSTR("AppIntentDistanceDayOfWeekToLaunchPopularity");
      break;
    case 0x91uLL:
      result = CFSTR("AppIntentDistanceTrendingToLaunchPopularity");
      break;
    case 0x92uLL:
      result = CFSTR("AppIntentDistanceSSIDToLaunchPopularity");
      break;
    case 0x93uLL:
      result = CFSTR("AppActionConfirmEvents");
      break;
    case 0x94uLL:
      result = CFSTR("AppActionRejectEvents");
      break;
    case 0x95uLL:
      result = CFSTR("TotalAppActionConfirmEvents");
      break;
    case 0x96uLL:
      result = CFSTR("TotalAppActionRejectEvents");
      break;
    case 0x97uLL:
      result = CFSTR("AppForAllIntentsCount");
      break;
    case 0x98uLL:
      result = CFSTR("AppForAllIntentsTotalNumberOfLaunches");
      break;
    case 0x99uLL:
      result = CFSTR("AppForAllIntentsTotalNumberOfAirplaneModeLaunches");
      break;
    case 0x9AuLL:
      result = CFSTR("AppForAllIntentsTotalNumberOfSSIDLaunches");
      break;
    case 0x9BuLL:
      result = CFSTR("AppForAllIntentsTotalNumberOfCoreMotionLaunches");
      break;
    case 0x9CuLL:
      result = CFSTR("AppForAllIntentsTotalNumberOfTrendingLaunches");
      break;
    case 0x9DuLL:
      result = CFSTR("AppForAllIntentsLaunchPopularity");
      break;
    case 0x9EuLL:
      result = CFSTR("AppForAllIntentsTimeOfDayPopularity");
      break;
    case 0x9FuLL:
      result = CFSTR("AppForAllIntentsDayOfWeekPopularity");
      break;
    case 0xA0uLL:
      result = CFSTR("AppForAllIntentsCoarseTimeOfDayPopularity");
      break;
    case 0xA1uLL:
      result = CFSTR("AppForAllIntentsUnlockTime");
      break;
    case 0xA2uLL:
      result = CFSTR("AppForAllIntentsAirplaneModePopularity");
      break;
    case 0xA3uLL:
      result = CFSTR("AppForAllIntentsSSIDPopularity");
      break;
    case 0xA4uLL:
      result = CFSTR("AppForAllIntentsCoreMotionPopularity");
      break;
    case 0xA5uLL:
      result = CFSTR("AppForAllIntentsTrendingPopularity");
      break;
    case 0xA6uLL:
      result = CFSTR("AppForAllIntentsLaunchLocationPopularity");
      break;
    case 0xA7uLL:
      result = CFSTR("AppForAllIntentsLaunchTimePopularity");
      break;
    case 0xA8uLL:
      result = CFSTR("AppForAllIntentsLaunchDayOfWeekPopularity");
      break;
    case 0xA9uLL:
      result = CFSTR("AppForAllIntentsEntropyLaunchPopularity");
      break;
    case 0xAAuLL:
      result = CFSTR("AppForAllIntentsEntropyDayOfWeekPopularity");
      break;
    case 0xABuLL:
      result = CFSTR("AppForAllIntentsEntropyDayOfWeekPopularityByDay");
      break;
    case 0xACuLL:
      result = CFSTR("AppForAllIntentsEntropyDayOfWeekPopularityByApp");
      break;
    case 0xADuLL:
      result = CFSTR("AppForAllIntentsEntropyTrendingPopularity");
      break;
    case 0xAEuLL:
      result = CFSTR("AppForAllIntentsEntropySSIDPopularity");
      break;
    case 0xAFuLL:
      result = CFSTR("AppForAllIntentsEntropySSIDPopularityBySSID");
      break;
    case 0xB0uLL:
      result = CFSTR("AppForAllIntentsEntropySSIDPopularityByApp");
      break;
    case 0xB1uLL:
      result = CFSTR("AppForAllIntentsDistanceSSIDToLaunchPopularity");
      break;
    case 0xB2uLL:
      result = CFSTR("AppForAllIntentsDistanceDayOfWeekToLaunchPopularity");
      break;
    case 0xB3uLL:
      result = CFSTR("AppForAllIntentsDistanceTrendingToLaunchPopularity");
      break;
    case 0xB4uLL:
      result = CFSTR("AppForAllActionsConfirmEvents");
      break;
    case 0xB5uLL:
      result = CFSTR("AppForAllActionsRejectEvents");
      break;
    case 0xB6uLL:
      result = CFSTR("TotalAppForAllActionsConfirmEvents");
      break;
    case 0xB7uLL:
      result = CFSTR("TotalAppForAllActionsRejectEvents");
      break;
    case 0xB8uLL:
      result = CFSTR("SlotCount");
      break;
    case 0xB9uLL:
      result = CFSTR("SlotTotalNumberOfLaunches");
      break;
    case 0xBAuLL:
      result = CFSTR("SlotTotalNumberOfUniqueDaysLaunched");
      break;
    case 0xBBuLL:
      result = CFSTR("SlotLaunchPopularity");
      break;
    case 0xBCuLL:
      result = CFSTR("SlotTimeOfDayPopularity");
      break;
    case 0xBDuLL:
      result = CFSTR("SlotTimeOfDayWithThirtyMinuteWindowPopularity");
      break;
    case 0xBEuLL:
      result = CFSTR("SlotTimeOfDayWithHourWindowPopularity");
      break;
    case 0xBFuLL:
      result = CFSTR("SlotTimeOfDayWithEightHourWindowPopularity");
      break;
    case 0xC0uLL:
      result = CFSTR("SlotDayOfWeekPopularity");
      break;
    case 0xC1uLL:
      result = CFSTR("SlotPartOfWeekPopularity");
      break;
    case 0xC2uLL:
      result = CFSTR("SlotPartOfWeekAndLocationPopularity");
      break;
    case 0xC3uLL:
      result = CFSTR("SlotCoarseTimeOfDayPopularity");
      break;
    case 0xC4uLL:
      result = CFSTR("ScoreInputSlotLocationPopularity");
      break;
    case 0xC5uLL:
      result = CFSTR("SlotCoreMotionPopularity");
      break;
    case 0xC6uLL:
      result = CFSTR("SlotPreviousLocationPopularity");
      break;
    case 0xC7uLL:
      result = CFSTR("SlotTimeAndDayPopularity");
      break;
    case 0xC8uLL:
      result = CFSTR("SlotTimeAndLocationPopularity");
      break;
    case 0xC9uLL:
      result = CFSTR("SlotDayAndLocationPopularity");
      break;
    case 0xCAuLL:
      result = CFSTR("SlotTimeAndDayAndLocationPopularity");
      break;
    case 0xCBuLL:
      result = CFSTR("SlotPreviousLocationAndCoreMotionPopularity");
      break;
    case 0xCCuLL:
      result = CFSTR("SlotPreviousLocationAndLocationPopularity");
      break;
    case 0xCDuLL:
      result = CFSTR("SlotTimeAndPreviousLocationPopularity");
      break;
    case 0xCEuLL:
      result = CFSTR("SlotDayAndPreviousLocationPopularity");
      break;
    case 0xCFuLL:
      result = CFSTR("SlotPartOfWeekAndTimePopularity");
      break;
    case 0xD0uLL:
      result = CFSTR("SlotLaunchTimePopularity");
      break;
    case 0xD1uLL:
      result = CFSTR("SlotLaunchCoarseTimePopularity");
      break;
    case 0xD2uLL:
      result = CFSTR("SlotLaunchDayOfWeekPopularity");
      break;
    case 0xD3uLL:
      result = CFSTR("SlotLaunchPartOfWeekPopularity");
      break;
    case 0xD4uLL:
      result = CFSTR("SlotLaunchPartOfWeekAndLocationPopularity");
      break;
    case 0xD5uLL:
      result = CFSTR("SlotLaunchLocationPopularity");
      break;
    case 0xD6uLL:
      result = CFSTR("SlotLaunchCoreMotionPopularity");
      break;
    case 0xD7uLL:
      result = CFSTR("SlotLaunchPreviousLocationPopularity");
      break;
    case 0xD8uLL:
      result = CFSTR("SlotLaunchTimeAndDayPopularity");
      break;
    case 0xD9uLL:
      result = CFSTR("SlotLaunchTimeAndLocationPopularity");
      break;
    case 0xDAuLL:
      result = CFSTR("SlotLaunchDayAndLocationPopularity");
      break;
    case 0xDBuLL:
      result = CFSTR("SlotLaunchTimeAndDayAndLocationPopularity");
      break;
    case 0xDCuLL:
      result = CFSTR("SlotLaunchPreviousLocationAndCoreMotionPopularity");
      break;
    case 0xDDuLL:
      result = CFSTR("SlotLaunchPreviousLocationAndLocationPopularity");
      break;
    case 0xDEuLL:
      result = CFSTR("SlotLaunchTimeAndPreviousLocationPopularity");
      break;
    case 0xDFuLL:
      result = CFSTR("SlotLaunchDayAndPreviousLocationPopularity");
      break;
    case 0xE0uLL:
      result = CFSTR("SlotLaunchPartOfWeekAndTimePopularity");
      break;
    case 0xE1uLL:
      result = CFSTR("SlotLaunchTimeCount");
      break;
    case 0xE2uLL:
      result = CFSTR("SlotLaunchDayOfWeekCount");
      break;
    case 0xE3uLL:
      result = CFSTR("SlotLaunchPartOfWeekCount");
      break;
    case 0xE4uLL:
      result = CFSTR("SlotLaunchCoarseTimeCount");
      break;
    case 0xE5uLL:
      result = CFSTR("SlotLaunchTimeWithThirtyMinuteWindowCount");
      break;
    case 0xE6uLL:
      result = CFSTR("SlotLaunchTimeWithHourWindowCount");
      break;
    case 0xE7uLL:
      result = CFSTR("SlotLaunchTimeWithEightHourWindowCount");
      break;
    case 0xE8uLL:
      result = CFSTR("SlotLaunchLocationCount");
      break;
    case 0xE9uLL:
      result = CFSTR("SlotLaunchCoreMotionCount");
      break;
    case 0xEAuLL:
      result = CFSTR("SlotLaunchPreviousLocationCount");
      break;
    case 0xEBuLL:
      result = CFSTR("SlotTotalLaunchesForSlotUsingTimeDecay");
      break;
    case 0xECuLL:
      result = CFSTR("SlotTotalLaunchesForSlotUsingDayOfWeekDecay");
      break;
    case 0xEDuLL:
      result = CFSTR("SlotTotalLaunchesForSlotUsingLocationDecay");
      break;
    case 0xEEuLL:
      result = CFSTR("SlotTotalLaunchesForSlotUsingCoreMotionDecay");
      break;
    case 0xEFuLL:
      result = CFSTR("SlotTotalLaunchesForSlotUsingPreviousLocationDecay");
      break;
    case 0xF0uLL:
      result = CFSTR("SlotTotalLaunchesForSlotUsingPartOfWeekDecay");
      break;
    case 0xF1uLL:
      result = CFSTR("SlotTotalLaunchesForSlotUsingTimeAndDayDecay");
      break;
    case 0xF2uLL:
      result = CFSTR("SlotTotalLaunchesForSlotUsingTimeAndLocationDecay");
      break;
    case 0xF3uLL:
      result = CFSTR("SlotTotalLaunchesForSlotUsingDayAndLocationDecay");
      break;
    case 0xF4uLL:
      result = CFSTR("SlotTotalLaunchesForSlotUsingTimeAndDayAndLocationDecay");
      break;
    case 0xF5uLL:
      result = CFSTR("SlotTotalLaunchesForSlotUsingPreviousLocationAndLocationDecay");
      break;
    case 0xF6uLL:
      result = CFSTR("SlotTotalLaunchesForSlotUsingPreviousLocationAndCoreMotionDecay");
      break;
    case 0xF7uLL:
      result = CFSTR("SlotTotalLaunchesForSlotUsingTimeAndPreviousLocationDecay");
      break;
    case 0xF8uLL:
      result = CFSTR("SlotTotalLaunchesForSlotUsingDayAndPreviousLocationDecay");
      break;
    case 0xF9uLL:
      result = CFSTR("SlotTotalLaunchesForSlotUsingPartOfWeekAndLocationDecay");
      break;
    case 0xFAuLL:
      result = CFSTR("SlotTotalLaunchesForSlotUsingPartOfWeekAndTimeDecay");
      break;
    case 0xFBuLL:
      result = CFSTR("SlotSecondsSinceLastSlot");
      break;
    case 0xFCuLL:
      result = CFSTR("SlotOnlyLaunchedWithinShortTimeSpan");
      break;
    case 0xFDuLL:
      result = CFSTR("SlotTotalNumberOfUndecayedLaunchesForSlot");
      break;
    case 0xFEuLL:
      result = CFSTR("SlotNumberOfUniqueDaysLaunchedForSlot");
      break;
    case 0xFFuLL:
      result = CFSTR("SlotTotalNumberOfLaunchesForSlot");
      break;
    case 0x100uLL:
      result = CFSTR("SlotLOIBoost");
      break;
    case 0x101uLL:
      result = CFSTR("SlotNumberOfParameters");
      break;
    case 0x102uLL:
      result = CFSTR("SlotNumSessionStartsForRootOfApp");
      break;
    case 0x103uLL:
      result = CFSTR("SlotTotalNumSessionsForRootOfApp");
      break;
    case 0x104uLL:
      result = CFSTR("SlotNumDocFreqForRootOfApp");
      break;
    case 0x105uLL:
      result = CFSTR("SlotEntropyForSlotSet");
      break;
    case 0x106uLL:
      result = CFSTR("SlotTotalNumberOfLaunchesForSlotSet");
      break;
    case 0x107uLL:
      result = CFSTR("SlotTimeOfDayBudgetMeanForSlot");
      break;
    case 0x108uLL:
      result = CFSTR("SlotTimeOfDayBudgetStdDevForSlot");
      break;
    case 0x109uLL:
      result = CFSTR("SlotTodaysTimeOfDayBudgetForSlot");
      break;
    case 0x10AuLL:
      result = CFSTR("SlotFeedbackTotalConfirmsForSlot");
      break;
    case 0x10BuLL:
      result = CFSTR("SlotFeedbackTotalRejectsForSlot");
      break;
    case 0x10CuLL:
      result = CFSTR("SlotFeedbackTotalExplicitRejectsForSlotNoDecay");
      break;
    case 0x10DuLL:
      result = CFSTR("SlotFeedbackTotalConfirmsForAllSlots");
      break;
    case 0x10EuLL:
      result = CFSTR("SlotFeedbackTotalRejectsForAllSlots");
      break;
    case 0x10FuLL:
      result = CFSTR("SlotFeedbackTotalExplicitRejectsForAllSlotsNoDecay");
      break;
    case 0x110uLL:
      result = CFSTR("SlotFeedbackConfirmRatio");
      break;
    case 0x111uLL:
      result = CFSTR("SlotFeedbackConfirmRatioStdDev");
      break;
    case 0x112uLL:
      result = CFSTR("SlotFeedbackConfirmRatioMean");
      break;
    case 0x113uLL:
      result = CFSTR("SlotFeedbackConfirmRatioCount");
      break;
    case 0x114uLL:
      result = CFSTR("SlotFeedbackMinutesSinceLastExplicitRejectInHomeScreen");
      break;
    case 0x115uLL:
      result = CFSTR("SlotFeedbackMinutesSinceLastConfirmInSpotlight");
      break;
    case 0x116uLL:
      result = CFSTR("SlotFeedbackMinutesSinceLastExplicitRejectInSpotlight");
      break;
    case 0x117uLL:
      result = CFSTR("SlotFeedbackTotalConfirmsForSlotInLastHourInSpotlight");
      break;
    case 0x118uLL:
      result = CFSTR("SlotFeedbackTotalRejectsForSlotInLastHourInSpotlight");
      break;
    case 0x119uLL:
      result = CFSTR("SlotFeedbackTotalConfirmsForSlotInLastTwoHoursInSpotlight");
      break;
    case 0x11AuLL:
      result = CFSTR("SlotFeedbackTotalRejectsForSlotInLastTwoHoursInSpotlight");
      break;
    case 0x11BuLL:
      result = CFSTR("SlotFeedbackTotalConfirmsForSlotTodayInSpotlight");
      break;
    case 0x11CuLL:
      result = CFSTR("SlotFeedbackTotalRejectsForSlotTodayInSpotlight");
      break;
    case 0x11DuLL:
      result = CFSTR("SlotFeedbackTotalConfirmsForSlotInSpotlight");
      break;
    case 0x11EuLL:
      result = CFSTR("SlotFeedbackTotalRejectsForSlotInSpotlight");
      break;
    case 0x11FuLL:
      result = CFSTR("SlotFeedbackConfirmsPartOfWeekCountInSpotlight");
      break;
    case 0x120uLL:
      result = CFSTR("SlotFeedbackConfirmsDayCountInSpotlight");
      break;
    case 0x121uLL:
      result = CFSTR("SlotFeedbackConfirmsTimeOfDayCountInSpotlight");
      break;
    case 0x122uLL:
      result = CFSTR("SlotFeedbackConfirmsCoarseTimeOfDayCountInSpotlight");
      break;
    case 0x123uLL:
      result = CFSTR("SlotFeedbackTotalConfirmsInSpotlightForAllSlots");
      break;
    case 0x124uLL:
      result = CFSTR("SlotFeedbackTotalRejectsInSpotlightForAllSlots");
      break;
    case 0x125uLL:
      result = CFSTR("SlotFeedbackTotalConfirmsForSlotTodayInLockscreen");
      break;
    case 0x126uLL:
      result = CFSTR("SlotFeedbackTotalRejectsForSlotTodayInLockscreen");
      break;
    case 0x127uLL:
      result = CFSTR("SlotFeedbackMinutesSinceLastConfirmInLockscreen");
      break;
    case 0x128uLL:
      result = CFSTR("SlotFeedbackMinutesSinceLastRejectInLockscreen");
      break;
    case 0x129uLL:
      result = CFSTR("SlotFeedbackMinutesSinceLastExplicitRejectInLockscreen");
      break;
    case 0x12AuLL:
      result = CFSTR("SlotFeedbackTotalConfirmsForSlotInLockscreen");
      break;
    case 0x12BuLL:
      result = CFSTR("SlotFeedbackTotalRejectsForSlotInLockscreen");
      break;
    case 0x12CuLL:
      result = CFSTR("SlotFeedbackConfirmsPartOfWeekCountInLockscreen");
      break;
    case 0x12DuLL:
      result = CFSTR("SlotFeedbackConfirmsDayCountInLockscreen");
      break;
    case 0x12EuLL:
      result = CFSTR("SlotFeedbackConfirmsTimeOfDayCountInLockscreen");
      break;
    case 0x12FuLL:
      result = CFSTR("SlotFeedbackConfirmsCoarseTimeOfDayCountInLockscreen");
      break;
    case 0x130uLL:
      result = CFSTR("SlotFeedbackTotalConfirmsTodayInLockscreenForAllSlots");
      break;
    case 0x131uLL:
      result = CFSTR("SlotFeedbackTotalRejectsTodayInLockscreenForAllSlots");
      break;
    case 0x132uLL:
      result = CFSTR("SlotFeedbackTotalConfirmsInLockscreenForAllSlots");
      break;
    case 0x133uLL:
      result = CFSTR("SlotFeedbackTotalRejectsInLockscreenForAllSlots");
      break;
    case 0x134uLL:
      result = CFSTR("ActionFeedbackTotalConfirmsInSpotlight");
      break;
    case 0x135uLL:
      result = CFSTR("ActionFeedbackTotalRejectsInSpotlight");
      break;
    case 0x136uLL:
      result = CFSTR("ActionFeedbackTotalConfirmsTodayInLockscreen");
      break;
    case 0x137uLL:
      result = CFSTR("ActionFeedbackTotalRejectsTodayInLockscreen");
      break;
    case 0x138uLL:
      result = CFSTR("ActionFeedbackTotalConfirmsInLockscreen");
      break;
    case 0x139uLL:
      result = CFSTR("ActionFeedbackTotalRejectsInLockscreen");
      break;
    case 0x13AuLL:
      result = CFSTR("ActionFeedbackMeanNumberOfSpotlightLaunchesPerDay");
      break;
    case 0x13BuLL:
      result = CFSTR("ActionFeedbackMeanNumberOfSpotlightConfirmsPerDay");
      break;
    case 0x13CuLL:
      result = CFSTR("ActionLaunchPopularity");
      break;
    case 0x13DuLL:
      result = CFSTR("ActionTimeOfDayPopularity");
      break;
    case 0x13EuLL:
      result = CFSTR("ActionTimeOfDayWithThirtyMinuteWindowPopularity");
      break;
    case 0x13FuLL:
      result = CFSTR("ActionTimeOfDayWithHourWindowPopularity");
      break;
    case 0x140uLL:
      result = CFSTR("ActionTimeOfDayWithEightHourWindowPopularity");
      break;
    case 0x141uLL:
      result = CFSTR("ActionCoarseTimeOfDayPopularity");
      break;
    case 0x142uLL:
      result = CFSTR("ActionDayOfWeekPopularity");
      break;
    case 0x143uLL:
      result = CFSTR("ActionPartOfWeekPopularity");
      break;
    case 0x144uLL:
      result = CFSTR("ActionPartOfWeekAndLocationPopularity");
      break;
    case 0x145uLL:
      result = CFSTR("ActionLocationPopularity");
      break;
    case 0x146uLL:
      result = CFSTR("ActionCoreMotionPopularity");
      break;
    case 0x147uLL:
      result = CFSTR("ActionPreviousLocationPopularity");
      break;
    case 0x148uLL:
      result = CFSTR("ActionPreviousLocationAndCoreMotionPopularity");
      break;
    case 0x149uLL:
      result = CFSTR("ActionPreviousLocationAndLocationPopularity");
      break;
    case 0x14AuLL:
      result = CFSTR("ActionTimeAndPreviousLocationPopularity");
      break;
    case 0x14BuLL:
      result = CFSTR("ActionDayAndPreviousLocationPopularity");
      break;
    case 0x14CuLL:
      result = CFSTR("ActionTimeAndDayPopularity");
      break;
    case 0x14DuLL:
      result = CFSTR("ActionTimeAndLocationPopularity");
      break;
    case 0x14EuLL:
      result = CFSTR("ActionDayAndLocationPopularity");
      break;
    case 0x14FuLL:
      result = CFSTR("ActionTimeAndDayAndLocationPopularity");
      break;
    case 0x150uLL:
      result = CFSTR("ActionPartOfWeekAndTimePopularity");
      break;
    case 0x151uLL:
      result = CFSTR("ActionTotalLaunchesForAllActionsUsingTimeDecay");
      break;
    case 0x152uLL:
      result = CFSTR("ActionTotalLaunchesForAllActionsUsingDayOfWeekDecay");
      break;
    case 0x153uLL:
      result = CFSTR("ActionTotalLaunchesForAllActionsUsingLocationDecay");
      break;
    case 0x154uLL:
      result = CFSTR("ActionTotalLaunchesForAllActionsUsingCoreMotionDecay");
      break;
    case 0x155uLL:
      result = CFSTR("ActionTotalLaunchesForAllActionsUsingPreviousLocationDecay");
      break;
    case 0x156uLL:
      result = CFSTR("ActionTotalLaunchesForAllActionsUsingPartOfWeekDecay");
      break;
    case 0x157uLL:
      result = CFSTR("ActionTotalLaunchesForAllActionsUsingPreviousLocationAndCoreMotionDecay");
      break;
    case 0x158uLL:
      result = CFSTR("ActionTotalLaunchesForAllActionsUsingPreviousLocationAndLocationDecay");
      break;
    case 0x159uLL:
      result = CFSTR("ActionTotalLaunchesForAllActionsUsingTimeAndPreviousLocationDecay");
      break;
    case 0x15AuLL:
      result = CFSTR("ActionTotalLaunchesForAllActionsUsingDayAndPreviousLocationDecay");
      break;
    case 0x15BuLL:
      result = CFSTR("ActionTotalLaunchesForAllActionsUsingTimeAndDayDecay");
      break;
    case 0x15CuLL:
      result = CFSTR("ActionTotalLaunchesForAllActionsUsingTimeAndLocationDecay");
      break;
    case 0x15DuLL:
      result = CFSTR("ActionTotalLaunchesForAllActionsUsingDayAndLocationDecay");
      break;
    case 0x15EuLL:
      result = CFSTR("ActionTotalLaunchesForAllActionsUsingTimeAndDayAndLocationDecay");
      break;
    case 0x15FuLL:
      result = CFSTR("ActionTotalLaunchesForAllActionsUsingPartOfWeekAndLocationDecay");
      break;
    case 0x160uLL:
      result = CFSTR("ActionTotalLaunchesForAllActionsUsingPartOfWeekAndTimeDecay");
      break;
    case 0x161uLL:
      result = CFSTR("RandomSessionValue");
      break;
    case 0x162uLL:
      result = CFSTR("RandomScore");
      break;
    case 0x163uLL:
      result = CFSTR("ActionTotalConfirms");
      break;
    case 0x164uLL:
      result = CFSTR("ActionTotalRejects");
      break;
    case 0x165uLL:
      result = CFSTR("_ATXScoreInputActionTotalExplicitRejectsNoDecay");
      break;
    case 0x166uLL:
      result = CFSTR("AppSpecificAlpha");
      break;
    case 0x167uLL:
      result = CFSTR("AppSpecificBeta");
      break;
    case 0x168uLL:
      result = CFSTR("GlobalScoreGivenTimeDayLocationAndLastApp");
      break;
    case 0x169uLL:
      result = CFSTR("AppGlobalScoreGivenTimeDayAndLocation");
      break;
    case 0x16AuLL:
      result = CFSTR("AppLOITypeLaunches");
      break;
    case 0x16BuLL:
      result = CFSTR("AppLastAppLaunches");
      break;
    case 0x16CuLL:
      result = CFSTR("AppTimeOfDayLaunches");
      break;
    case 0x16DuLL:
      result = CFSTR("AppDayOfWeekLaunches");
      break;
    case 0x16EuLL:
      result = CFSTR("AppBlendedLOITypePopularity");
      break;
    case 0x16FuLL:
      result = CFSTR("AppBlendedLastAppPopularity");
      break;
    case 0x170uLL:
      result = CFSTR("AppBlendedTimeOfDayPopularity");
      break;
    case 0x171uLL:
      result = CFSTR("AppBlendedDayOfWeekPopularity");
      break;
    case 0x172uLL:
      result = CFSTR("AppBlendedLOITypeSampledPopularity");
      break;
    case 0x173uLL:
      result = CFSTR("AppBlendedLastAppSampledPopularity");
      break;
    case 0x174uLL:
      result = CFSTR("AppBlendedTimeOfDaySampledPopularity");
      break;
    case 0x175uLL:
      result = CFSTR("AppBlendedDayOfWeekSampledPopularity");
      break;
    case 0x176uLL:
      result = CFSTR("ActionIsFutureMedia");
      break;
    case 0x177uLL:
      result = CFSTR("ActionIsBackgroundExecutable");
      break;
    case 0x178uLL:
      result = CFSTR("ActionMotionType");
      break;
    case 0x179uLL:
      result = CFSTR("ActionLOIType");
      break;
    case 0x17AuLL:
      result = CFSTR("SlotIsSiriKitIntent");
      break;
    case 0x17BuLL:
      result = CFSTR("SlotIsCustomIntent");
      break;
    case 0x17CuLL:
      result = CFSTR("SlotIsNSUserActivity");
      break;
    case 0x17DuLL:
      result = CFSTR("AppActionScore");
      break;
    case 0x17EuLL:
      result = CFSTR("AppActionLogProbability");
      break;
    case 0x17FuLL:
      result = CFSTR("SlotScore");
      break;
    case 0x180uLL:
      result = CFSTR("SlotLogProbability");
      break;
    case 0x181uLL:
      result = CFSTR("ActionHeuristicConfirmEvents");
      break;
    case 0x182uLL:
      result = CFSTR("ActionHeuristicRejectEvents");
      break;
    case 0x183uLL:
      result = CFSTR("TotalActionHeuristicConfirmEvents");
      break;
    case 0x184uLL:
      result = CFSTR("TotalActionHeuristicRejectEvents");
      break;
    case 0x185uLL:
      result = CFSTR("AmbientLightTypePopularity");
      break;
    case 0x186uLL:
      result = CFSTR("AmbientLightTypeLaunchPopularity");
      break;
    case 0x187uLL:
      result = CFSTR("AppIntentAmbientLightTypePopularity");
      break;
    case 0x188uLL:
      result = CFSTR("AppIntentAmbientLightTypeLaunchPopularity");
      break;
    case 0x189uLL:
      result = CFSTR("AppLaunchesCoarseTimePowLocationForAppInContext");
      break;
    case 0x18AuLL:
      result = CFSTR("AppLaunchesCoarseTimePowLocationInContext");
      break;
    case 0x18BuLL:
      result = CFSTR("AppLaunchesCoarseTimePowLocationForApp");
      break;
    case 0x18CuLL:
      result = CFSTR("AppLaunchesCoarseTimePowLocationForAllAppsAndContexts");
      break;
    case 0x18DuLL:
      result = CFSTR("AppConfirmsCoarseTimePowLocationForAppInContext");
      break;
    case 0x18EuLL:
      result = CFSTR("AppConfirmsCoarseTimePowLocationInContext");
      break;
    case 0x18FuLL:
      result = CFSTR("AppConfirmsCoarseTimePowLocationForApp");
      break;
    case 0x190uLL:
      result = CFSTR("AppConfirmsCoarseTimePowLocationForAllAppsAndContexts");
      break;
    case 0x191uLL:
      result = CFSTR("AppRejectsCoarseTimePowLocationForAppInContext");
      break;
    case 0x192uLL:
      result = CFSTR("AppRejectsCoarseTimePowLocationInContext");
      break;
    case 0x193uLL:
      result = CFSTR("AppRejectsCoarseTimePowLocationForApp");
      break;
    case 0x194uLL:
      result = CFSTR("AppRejectsCoarseTimePowLocationForAllAppsAndContexts");
      break;
    case 0x195uLL:
      result = CFSTR("_ATXScoreInputAppExplicitRejectsCoarseTimePowLocationForAppInContext");
      break;
    case 0x196uLL:
      result = CFSTR("_ATXScoreInputAppExplicitRejectsCoarseTimePowLocationInContext");
      break;
    case 0x197uLL:
      result = CFSTR("_ATXScoreInputAppExplicitRejectsCoarseTimePowLocationForApp");
      break;
    case 0x198uLL:
      result = CFSTR("_ATXScoreInputAppExplicitRejectsCoarseTimePowLocationForAllAppsAndContexts");
      break;
    case 0x199uLL:
      result = CFSTR("AppLaunchesSpecificTimeDowLocationForAppInContext");
      break;
    case 0x19AuLL:
      result = CFSTR("AppLaunchesSpecificTimeDowLocationInContext");
      break;
    case 0x19BuLL:
      result = CFSTR("AppLaunchesSpecificTimeDowLocationForApp");
      break;
    case 0x19CuLL:
      result = CFSTR("AppLaunchesSpecificTimeDowLocationForAllAppsAndContexts");
      break;
    case 0x19DuLL:
      result = CFSTR("AppConfirmsSpecificTimeDowLocationForAppInContext");
      break;
    case 0x19EuLL:
      result = CFSTR("AppConfirmsSpecificTimeDowLocationInContext");
      break;
    case 0x19FuLL:
      result = CFSTR("AppConfirmsSpecificTimeDowLocationForApp");
      break;
    case 0x1A0uLL:
      result = CFSTR("AppConfirmsSpecificTimeDowLocationForAllAppsAndContexts");
      break;
    case 0x1A1uLL:
      result = CFSTR("AppRejectsSpecificTimeDowLocationForAppInContext");
      break;
    case 0x1A2uLL:
      result = CFSTR("AppRejectsSpecificTimeDowLocationInContext");
      break;
    case 0x1A3uLL:
      result = CFSTR("AppRejectsSpecificTimeDowLocationForApp");
      break;
    case 0x1A4uLL:
      result = CFSTR("AppRejectsSpecificTimeDowLocationForAllAppsAndContexts");
      break;
    case 0x1A5uLL:
      result = CFSTR("ActionsCoarseTimePowLocationForActionInContext");
      break;
    case 0x1A6uLL:
      result = CFSTR("ActionsCoarseTimePowLocationInContext");
      break;
    case 0x1A7uLL:
      result = CFSTR("ActionsCoarseTimePowLocationForAction");
      break;
    case 0x1A8uLL:
      result = CFSTR("ActionsCoarseTimePowLocationForAllActionsAndContexts");
      break;
    case 0x1A9uLL:
      result = CFSTR("ActionConfirmsCoarseTimePowLocationForActionInContext");
      break;
    case 0x1AAuLL:
      result = CFSTR("ActionConfirmsCoarseTimePowLocationInContext");
      break;
    case 0x1ABuLL:
      result = CFSTR("ActionConfirmsCoarseTimePowLocationForAction");
      break;
    case 0x1ACuLL:
      result = CFSTR("ActionConfirmsCoarseTimePowLocationForAllActionsAndContexts");
      break;
    case 0x1ADuLL:
      result = CFSTR("ActionRejectsCoarseTimePowLocationForActionInContext");
      break;
    case 0x1AEuLL:
      result = CFSTR("ActionRejectsCoarseTimePowLocationInContext");
      break;
    case 0x1AFuLL:
      result = CFSTR("ActionRejectsCoarseTimePowLocationForAction");
      break;
    case 0x1B0uLL:
      result = CFSTR("ActionRejectsCoarseTimePowLocationForAllActionsAndContexts");
      break;
    case 0x1B1uLL:
      result = CFSTR("ActionsSpecificTimeDowLocationForActionInContext");
      break;
    case 0x1B2uLL:
      result = CFSTR("ActionsSpecificTimeDowLocationInContext");
      break;
    case 0x1B3uLL:
      result = CFSTR("ActionsSpecificTimeDowLocationForAction");
      break;
    case 0x1B4uLL:
      result = CFSTR("ActionsSpecificTimeDowLocationForAllActionsAndContexts");
      break;
    case 0x1B5uLL:
      result = CFSTR("ActionConfirmsSpecificTimeDowLocationForActionInContext");
      break;
    case 0x1B6uLL:
      result = CFSTR("ActionConfirmsSpecificTimeDowLocationInContext");
      break;
    case 0x1B7uLL:
      result = CFSTR("ActionConfirmsSpecificTimeDowLocationForAction");
      break;
    case 0x1B8uLL:
      result = CFSTR("ActionConfirmsSpecificTimeDowLocationForAllActionsAndContexts");
      break;
    case 0x1B9uLL:
      result = CFSTR("ActionRejectsSpecificTimeDowLocationForActionInContext");
      break;
    case 0x1BAuLL:
      result = CFSTR("ActionRejectsSpecificTimeDowLocationInContext");
      break;
    case 0x1BBuLL:
      result = CFSTR("ActionRejectsSpecificTimeDowLocationForAction");
      break;
    case 0x1BCuLL:
      result = CFSTR("ActionRejectsSpecificTimeDowLocationForAllActionsAndContexts");
      break;
    case 0x1BDuLL:
      result = CFSTR("AppLaunchesInTimeBucket0ForApp");
      break;
    case 0x1BEuLL:
      result = CFSTR("AppLaunchesInTimeBucket1ForApp");
      break;
    case 0x1BFuLL:
      result = CFSTR("AppLaunchesInTimeBucket2ForApp");
      break;
    case 0x1C0uLL:
      result = CFSTR("AppLaunchesInTimeBucket3ForApp");
      break;
    case 0x1C1uLL:
      result = CFSTR("AppLaunchesInTimeBucket4ForApp");
      break;
    case 0x1C2uLL:
      result = CFSTR("AppLaunchesInTimeBucket5ForApp");
      break;
    case 0x1C3uLL:
      result = CFSTR("AppLaunchesInTimeBucket6ForApp");
      break;
    case 0x1C4uLL:
      result = CFSTR("AppLaunchesInTimeBucket7ForApp");
      break;
    case 0x1C5uLL:
      result = CFSTR("AppLaunchesInTimeBucket8ForApp");
      break;
    case 0x1C6uLL:
      result = CFSTR("AppLaunchesInTimeBucket9ForApp");
      break;
    case 0x1C7uLL:
      result = CFSTR("AppLaunchesInTimeBucket10ForApp");
      break;
    case 0x1C8uLL:
      result = CFSTR("AppLaunchesInTimeBucket11ForApp");
      break;
    case 0x1C9uLL:
      result = CFSTR("AppLaunchesInTimeBucket12ForApp");
      break;
    case 0x1CAuLL:
      result = CFSTR("AppLaunchesInTimeBucket13ForApp");
      break;
    case 0x1CBuLL:
      result = CFSTR("AppLaunchesInTimeBucket14ForApp");
      break;
    case 0x1CCuLL:
      result = CFSTR("AppLaunchesInTimeBucket15ForApp");
      break;
    case 0x1CDuLL:
      result = CFSTR("AppLaunchesInTimeBucket16ForApp");
      break;
    case 0x1CEuLL:
      result = CFSTR("AppLaunchesInTimeBucket17ForApp");
      break;
    case 0x1CFuLL:
      result = CFSTR("AppLaunchesInTimeBucket18ForApp");
      break;
    case 0x1D0uLL:
      result = CFSTR("AppLaunchesInTimeBucket19ForApp");
      break;
    case 0x1D1uLL:
      result = CFSTR("AppLaunchesInTimeBucket20ForApp");
      break;
    case 0x1D2uLL:
      result = CFSTR("AppLaunchesInTimeBucket21ForApp");
      break;
    case 0x1D3uLL:
      result = CFSTR("AppLaunchesInTimeBucket22ForApp");
      break;
    case 0x1D4uLL:
      result = CFSTR("AppLaunchesInTimeBucket23ForApp");
      break;
    case 0x1D5uLL:
      result = CFSTR("AppLaunchesInTimeBucket24ForApp");
      break;
    case 0x1D6uLL:
      result = CFSTR("AppLaunchesOnDayOfWeekSundayForApp");
      break;
    case 0x1D7uLL:
      result = CFSTR("AppLaunchesOnDayOfWeekMondayForApp");
      break;
    case 0x1D8uLL:
      result = CFSTR("AppLaunchesOnDayOfWeekTuesdayForApp");
      break;
    case 0x1D9uLL:
      result = CFSTR("AppLaunchesOnDayOfWeekWednesdayForApp");
      break;
    case 0x1DAuLL:
      result = CFSTR("AppLaunchesOnDayOfWeekThursdayForApp");
      break;
    case 0x1DBuLL:
      result = CFSTR("AppLaunchesOnDayOfWeekFridayForApp");
      break;
    case 0x1DCuLL:
      result = CFSTR("AppLaunchesOnDayOfWeekSaturdayForApp");
      break;
    case 0x1DDuLL:
      result = CFSTR("AppLaunchesAtCoarseGeoHash0ForApp");
      break;
    case 0x1DEuLL:
      result = CFSTR("AppLaunchesAtCoarseGeoHash1ForApp");
      break;
    case 0x1DFuLL:
      result = CFSTR("AppLaunchesAtCoarseGeoHash2ForApp");
      break;
    case 0x1E0uLL:
      result = CFSTR("AppLaunchesAtCoarseGeoHash3ForApp");
      break;
    case 0x1E1uLL:
      result = CFSTR("AppLaunchesAtCoarseGeoHash4ForApp");
      break;
    case 0x1E2uLL:
      result = CFSTR("AppLaunchesAtCoarseGeoHash5ForApp");
      break;
    case 0x1E3uLL:
      result = CFSTR("AppLaunchesAtCoarseGeoHash6ForApp");
      break;
    case 0x1E4uLL:
      result = CFSTR("AppLaunchesAtCoarseGeoHash7ForApp");
      break;
    case 0x1E5uLL:
      result = CFSTR("AppLaunchesAtCoarseGeoHash8ForApp");
      break;
    case 0x1E6uLL:
      result = CFSTR("AppLaunchesAtCoarseGeoHash9ForApp");
      break;
    case 0x1E7uLL:
      result = CFSTR("AppLaunchesAtSpecificGeoHash0ForApp");
      break;
    case 0x1E8uLL:
      result = CFSTR("AppLaunchesAtSpecificGeoHash1ForApp");
      break;
    case 0x1E9uLL:
      result = CFSTR("AppLaunchesAtSpecificGeoHash2ForApp");
      break;
    case 0x1EAuLL:
      result = CFSTR("AppLaunchesAtSpecificGeoHash3ForApp");
      break;
    case 0x1EBuLL:
      result = CFSTR("AppLaunchesAtSpecificGeoHash4ForApp");
      break;
    case 0x1ECuLL:
      result = CFSTR("AppLaunchesAtSpecificGeoHash5ForApp");
      break;
    case 0x1EDuLL:
      result = CFSTR("AppLaunchesAtSpecificGeoHash6ForApp");
      break;
    case 0x1EEuLL:
      result = CFSTR("AppLaunchesAtSpecificGeoHash7ForApp");
      break;
    case 0x1EFuLL:
      result = CFSTR("AppLaunchesAtSpecificGeoHash8ForApp");
      break;
    case 0x1F0uLL:
      result = CFSTR("AppLaunchesAtSpecificGeoHash9ForApp");
      break;
    case 0x1F1uLL:
      result = CFSTR("AppLaunchesAtSpecificGeoHash10ForApp");
      break;
    case 0x1F2uLL:
      result = CFSTR("AppLaunchesAtSpecificGeoHash11ForApp");
      break;
    case 0x1F3uLL:
      result = CFSTR("AppLaunchesAtSpecificGeoHash12ForApp");
      break;
    case 0x1F4uLL:
      result = CFSTR("AppLaunchesAtSpecificGeoHash13ForApp");
      break;
    case 0x1F5uLL:
      result = CFSTR("AppLaunchesAtSpecificGeoHash14ForApp");
      break;
    case 0x1F6uLL:
      result = CFSTR("AppNumberOfSpecificGeohashesForApp");
      break;
    case 0x1F7uLL:
      result = CFSTR("AppNumberOfCoarseGeohashesForApp");
      break;
    case 0x1F8uLL:
      result = CFSTR("AppEntropyForTimeBuckets");
      break;
    case 0x1F9uLL:
      result = CFSTR("AppEntropyForSpecificGeoHash");
      break;
    case 0x1FAuLL:
      result = CFSTR("AppEntropyForCoarseGeoHash");
      break;
    case 0x1FBuLL:
      result = CFSTR("AppLaunchesAtSpecificGeoHashForAppInContext");
      break;
    case 0x1FCuLL:
      result = CFSTR("AppLaunchesAtCoarseGeoHashForAppInContext");
      break;
    case 0x1FDuLL:
      result = CFSTR("AppLaunchesAtDayOfWeekInContext");
      break;
    case 0x1FEuLL:
      result = CFSTR("AppLaunchesAtDayOfWeekForApp");
      break;
    case 0x1FFuLL:
      result = CFSTR("AppLaunchesAtTimeAndDayForAppInContext");
      break;
    case 0x200uLL:
      result = CFSTR("AppLaunchesAtTimeAndDayInContext");
      break;
    case 0x201uLL:
      result = CFSTR("AppLaunchesAtTimeAndDayForApp");
      break;
    case 0x202uLL:
      result = CFSTR("AppLaunchesAtCoarseGeoHashInContext");
      break;
    case 0x203uLL:
      result = CFSTR("AppLaunchesAtCoarseGeoHashForApp");
      break;
    case 0x204uLL:
      result = CFSTR("AppLaunchesAtSpecificGeoHashInContext");
      break;
    case 0x205uLL:
      result = CFSTR("AppLaunchesAtSpecificGeoHashForApp");
      break;
    case 0x206uLL:
      result = CFSTR("AppLaunchesForAllAppsAndContextsDecayedAtCoarseContextRate");
      break;
    case 0x207uLL:
      result = CFSTR("AppLaunchesForAllAppsAndContextsDecayedAtSpecificContextRate");
      break;
    case 0x208uLL:
      result = CFSTR("IsLocationServicesDisabled");
      break;
    case 0x209uLL:
      result = CFSTR("AppLaunchesInTwoHourTimeBucketForAppInContext");
      break;
    case 0x20AuLL:
      result = CFSTR("AppLaunchesInTwoHourTimeBucketInContext");
      break;
    case 0x20BuLL:
      result = CFSTR("AppLaunchesInTwoHourTimeBucketForApp");
      break;
    case 0x20CuLL:
      result = CFSTR("AppConfirmsInTwoHourTimeBucketForAppInContext");
      break;
    case 0x20DuLL:
      result = CFSTR("AppConfirmsInTwoHourTimeBucketInContext");
      break;
    case 0x20EuLL:
      result = CFSTR("AppConfirmsInTwoHourTimeBucketForApp");
      break;
    case 0x20FuLL:
      result = CFSTR("AppRejectsInTwoHourTimeBucketForAppInContext");
      break;
    case 0x210uLL:
      result = CFSTR("AppRejectsInTwoHourTimeBucketInContext");
      break;
    case 0x211uLL:
      result = CFSTR("AppRejectsInTwoHourTimeBucketForApp");
      break;
    case 0x212uLL:
      result = CFSTR("AppConfirmsAtDayOfWeekForAppInContext");
      break;
    case 0x213uLL:
      result = CFSTR("AppConfirmsAtDayOfWeekInContext");
      break;
    case 0x214uLL:
      result = CFSTR("AppConfirmsAtDayOfWeekForApp");
      break;
    case 0x215uLL:
      result = CFSTR("AppRejectsAtDayOfWeekForAppInContext");
      break;
    case 0x216uLL:
      result = CFSTR("AppRejectsAtDayOfWeekInContext");
      break;
    case 0x217uLL:
      result = CFSTR("AppRejectsAtDayOfWeekForApp");
      break;
    case 0x218uLL:
      result = CFSTR("AppConfirmsAtCoarseGeoHashForAppInContext");
      break;
    case 0x219uLL:
      result = CFSTR("AppConfirmsAtCoarseGeoHashInContext");
      break;
    case 0x21AuLL:
      result = CFSTR("AppConfirmsAtCoarseGeoHashForApp");
      break;
    case 0x21BuLL:
      result = CFSTR("AppRejectsAtCoarseGeoHashForAppInContext");
      break;
    case 0x21CuLL:
      result = CFSTR("AppRejectsAtCoarseGeoHashInContext");
      break;
    case 0x21DuLL:
      result = CFSTR("AppRejectsAtCoarseGeoHashForApp");
      break;
    case 0x21EuLL:
      result = CFSTR("AppConfirmsAtSpecificGeoHashForAppInContext");
      break;
    case 0x21FuLL:
      result = CFSTR("AppConfirmsAtSpecificGeoHashInContext");
      break;
    case 0x220uLL:
      result = CFSTR("AppConfirmsAtSpecificGeoHashForApp");
      break;
    case 0x221uLL:
      result = CFSTR("AppRejectsAtSpecificGeoHashForAppInContext");
      break;
    case 0x222uLL:
      result = CFSTR("AppRejectsAtSpecificGeoHashInContext");
      break;
    case 0x223uLL:
      result = CFSTR("AppRejectsAtSpecificGeoHashForApp");
      break;
    case 0x224uLL:
      result = CFSTR("AppConfirmsForAllAppsAndContextsDecayedAtCoarseContextRate");
      break;
    case 0x225uLL:
      result = CFSTR("AppConfirmsForAllAppsAndContextsDecayedAtSpecificContextRate");
      break;
    case 0x226uLL:
      result = CFSTR("AppRejectsForAllAppsAndContextsDecayedAtCoarseContextRate");
      break;
    case 0x227uLL:
      result = CFSTR("AppRejectsForAllAppsAndContextsDecayedAtSpecificContextRate");
      break;
    case 0x228uLL:
      result = CFSTR("CurrentTimeBucketFromZeroToTwentyFour");
      break;
    case 0x229uLL:
      result = CFSTR("ActionsAtDayOfWeekForActionInContext");
      break;
    case 0x22AuLL:
      result = CFSTR("ActionsAtDayOfWeekInContext");
      break;
    case 0x22BuLL:
      result = CFSTR("ActionsAtDayOfWeekForAction");
      break;
    case 0x22CuLL:
      result = CFSTR("ActionsAtCoarseGeoHashForActionInContext");
      break;
    case 0x22DuLL:
      result = CFSTR("ActionsAtCoarseGeoHashInContext");
      break;
    case 0x22EuLL:
      result = CFSTR("ActionsAtCoarseGeoHashForAction");
      break;
    case 0x22FuLL:
      result = CFSTR("ActionsAtSpecificGeoHashForActionInContext");
      break;
    case 0x230uLL:
      result = CFSTR("ActionsAtSpecificGeoHashInContext");
      break;
    case 0x231uLL:
      result = CFSTR("ActionsAtSpecificGeoHashForAction");
      break;
    case 0x232uLL:
      result = CFSTR("ActionsAtTimeOfDayForActionInContext");
      break;
    case 0x233uLL:
      result = CFSTR("ActionsAtTimeOfDayInContext");
      break;
    case 0x234uLL:
      result = CFSTR("ActionsAtTimeOfDayForAction");
      break;
    case 0x235uLL:
      result = CFSTR("ActionConfirmsAtTimeOfDayForActionInContext");
      break;
    case 0x236uLL:
      result = CFSTR("ActionConfirmsAtTimeOfDayInContext");
      break;
    case 0x237uLL:
      result = CFSTR("ActionConfirmsAtTimeOfDayForAction");
      break;
    case 0x238uLL:
      result = CFSTR("ActionRejectsAtTimeOfDayForActionInContext");
      break;
    case 0x239uLL:
      result = CFSTR("ActionRejectsAtTimeOfDayInContext");
      break;
    case 0x23AuLL:
      result = CFSTR("ActionRejectsAtTimeOfDayForAction");
      break;
    case 0x23BuLL:
      result = CFSTR("ActionConfirmsAtDayOfWeekForActionInContext");
      break;
    case 0x23CuLL:
      result = CFSTR("ActionConfirmsAtDayOfWeekInContext");
      break;
    case 0x23DuLL:
      result = CFSTR("ActionConfirmsAtDayOfWeekForAction");
      break;
    case 0x23EuLL:
      result = CFSTR("ActionRejectsAtDayOfWeekForActionInContext");
      break;
    case 0x23FuLL:
      result = CFSTR("ActionRejectsAtDayOfWeekInContext");
      break;
    case 0x240uLL:
      result = CFSTR("ActionRejectsAtDayOfWeekForAction");
      break;
    case 0x241uLL:
      result = CFSTR("ActionConfirmsAtCoarseGeoHashForActionInContext");
      break;
    case 0x242uLL:
      result = CFSTR("ActionConfirmsAtCoarseGeoHashInContext");
      break;
    case 0x243uLL:
      result = CFSTR("ActionConfirmsAtCoarseGeoHashForAction");
      break;
    case 0x244uLL:
      result = CFSTR("ActionRejectsAtCoarseGeoHashForActionInContext");
      break;
    case 0x245uLL:
      result = CFSTR("ActionRejectsAtCoarseGeoHashInContext");
      break;
    case 0x246uLL:
      result = CFSTR("ActionRejectsAtCoarseGeoHashForAction");
      break;
    case 0x247uLL:
      result = CFSTR("ActionConfirmsAtSpecificGeoHashForActionInContext");
      break;
    case 0x248uLL:
      result = CFSTR("ActionConfirmsAtSpecificGeoHashInContext");
      break;
    case 0x249uLL:
      result = CFSTR("ActionConfirmsAtSpecificGeoHashForAction");
      break;
    case 0x24AuLL:
      result = CFSTR("ActionRejectsAtSpecificGeoHashForActionInContext");
      break;
    case 0x24BuLL:
      result = CFSTR("ActionRejectsAtSpecificGeoHashInContext");
      break;
    case 0x24CuLL:
      result = CFSTR("ActionRejectsAtSpecificGeoHashForAction");
      break;
    case 0x24DuLL:
      result = CFSTR("ActionsInTimeBucket0ForAction");
      break;
    case 0x24EuLL:
      result = CFSTR("ActionsInTimeBucket1ForAction");
      break;
    case 0x24FuLL:
      result = CFSTR("ActionsInTimeBucket2ForAction");
      break;
    case 0x250uLL:
      result = CFSTR("ActionsInTimeBucket3ForAction");
      break;
    case 0x251uLL:
      result = CFSTR("ActionsInTimeBucket4ForAction");
      break;
    case 0x252uLL:
      result = CFSTR("ActionsInTimeBucket5ForAction");
      break;
    case 0x253uLL:
      result = CFSTR("ActionsInTimeBucket6ForAction");
      break;
    case 0x254uLL:
      result = CFSTR("ActionsInTimeBucket7ForAction");
      break;
    case 0x255uLL:
      result = CFSTR("ActionsInTimeBucket8ForAction");
      break;
    case 0x256uLL:
      result = CFSTR("ActionsInTimeBucket9ForAction");
      break;
    case 0x257uLL:
      result = CFSTR("ActionsInTimeBucket10ForAction");
      break;
    case 0x258uLL:
      result = CFSTR("ActionsInTimeBucket11ForAction");
      break;
    case 0x259uLL:
      result = CFSTR("ActionsInTimeBucket12ForAction");
      break;
    case 0x25AuLL:
      result = CFSTR("ActionsInTimeBucket13ForAction");
      break;
    case 0x25BuLL:
      result = CFSTR("ActionsInTimeBucket14ForAction");
      break;
    case 0x25CuLL:
      result = CFSTR("ActionsInTimeBucket15ForAction");
      break;
    case 0x25DuLL:
      result = CFSTR("ActionsInTimeBucket16ForAction");
      break;
    case 0x25EuLL:
      result = CFSTR("ActionsInTimeBucket17ForAction");
      break;
    case 0x25FuLL:
      result = CFSTR("ActionsInTimeBucket18ForAction");
      break;
    case 0x260uLL:
      result = CFSTR("ActionsInTimeBucket19ForAction");
      break;
    case 0x261uLL:
      result = CFSTR("ActionsInTimeBucket20ForAction");
      break;
    case 0x262uLL:
      result = CFSTR("ActionsInTimeBucket21ForAction");
      break;
    case 0x263uLL:
      result = CFSTR("ActionsInTimeBucket22ForAction");
      break;
    case 0x264uLL:
      result = CFSTR("ActionsInTimeBucket23ForAction");
      break;
    case 0x265uLL:
      result = CFSTR("ActionsInTimeBucket24ForAction");
      break;
    case 0x266uLL:
      result = CFSTR("ActionsOnDayOfWeekSundayForAction");
      break;
    case 0x267uLL:
      result = CFSTR("ActionsOnDayOfWeekMondayForAction");
      break;
    case 0x268uLL:
      result = CFSTR("ActionsOnDayOfWeekTuesdayForAction");
      break;
    case 0x269uLL:
      result = CFSTR("ActionsOnDayOfWeekWednesdayForAction");
      break;
    case 0x26AuLL:
      result = CFSTR("ActionsOnDayOfWeekThursdayForAction");
      break;
    case 0x26BuLL:
      result = CFSTR("ActionsOnDayOfWeekFridayForAction");
      break;
    case 0x26CuLL:
      result = CFSTR("ActionsOnDayOfWeekSaturdayForAction");
      break;
    case 0x26DuLL:
      result = CFSTR("ActionsAtCoarseGeoHash0ForAction");
      break;
    case 0x26EuLL:
      result = CFSTR("ActionsAtCoarseGeoHash1ForAction");
      break;
    case 0x26FuLL:
      result = CFSTR("ActionsAtCoarseGeoHash2ForAction");
      break;
    case 0x270uLL:
      result = CFSTR("ActionsAtCoarseGeoHash3ForAction");
      break;
    case 0x271uLL:
      result = CFSTR("ActionsAtCoarseGeoHash4ForAction");
      break;
    case 0x272uLL:
      result = CFSTR("ActionsAtCoarseGeoHash5ForAction");
      break;
    case 0x273uLL:
      result = CFSTR("ActionsAtCoarseGeoHash6ForAction");
      break;
    case 0x274uLL:
      result = CFSTR("ActionsAtCoarseGeoHash7ForAction");
      break;
    case 0x275uLL:
      result = CFSTR("ActionsAtCoarseGeoHash8ForAction");
      break;
    case 0x276uLL:
      result = CFSTR("ActionsAtCoarseGeoHash9ForAction");
      break;
    case 0x277uLL:
      result = CFSTR("ActionsAtSpecificGeoHash0ForAction");
      break;
    case 0x278uLL:
      result = CFSTR("ActionsAtSpecificGeoHash1ForAction");
      break;
    case 0x279uLL:
      result = CFSTR("ActionsAtSpecificGeoHash2ForAction");
      break;
    case 0x27AuLL:
      result = CFSTR("ActionsAtSpecificGeoHash3ForAction");
      break;
    case 0x27BuLL:
      result = CFSTR("ActionsAtSpecificGeoHash4ForAction");
      break;
    case 0x27CuLL:
      result = CFSTR("ActionsAtSpecificGeoHash5ForAction");
      break;
    case 0x27DuLL:
      result = CFSTR("ActionsAtSpecificGeoHash6ForAction");
      break;
    case 0x27EuLL:
      result = CFSTR("ActionsAtSpecificGeoHash7ForAction");
      break;
    case 0x27FuLL:
      result = CFSTR("ActionsAtSpecificGeoHash8ForAction");
      break;
    case 0x280uLL:
      result = CFSTR("ActionsAtSpecificGeoHash9ForAction");
      break;
    case 0x281uLL:
      result = CFSTR("ActionsAtSpecificGeoHash10ForAction");
      break;
    case 0x282uLL:
      result = CFSTR("ActionsAtSpecificGeoHash11ForAction");
      break;
    case 0x283uLL:
      result = CFSTR("ActionsAtSpecificGeoHash12ForAction");
      break;
    case 0x284uLL:
      result = CFSTR("ActionsAtSpecificGeoHash13ForAction");
      break;
    case 0x285uLL:
      result = CFSTR("ActionsAtSpecificGeoHash14ForAction");
      break;
    case 0x286uLL:
      result = CFSTR("ActionEntropyForTimeOfDay");
      break;
    case 0x287uLL:
      result = CFSTR("ActionEntropyForDayOfWeek");
      break;
    case 0x288uLL:
      result = CFSTR("ActionEntropyForCoarseGeoHash");
      break;
    case 0x289uLL:
      result = CFSTR("ActionEntropyForSpecificGeoHash");
      break;
    case 0x28AuLL:
      result = CFSTR("ActionNumberOfSpecificGeohashesForAction");
      break;
    case 0x28BuLL:
      result = CFSTR("ActionNumberOfCoarseGeohashesForAction");
      break;
    case 0x28CuLL:
      result = CFSTR("AppLaunchesAtZoom7GeoHashForAppInContext");
      break;
    case 0x28DuLL:
      result = CFSTR("AppLaunchesAtZoom7GeoHashInContext");
      break;
    case 0x28EuLL:
      result = CFSTR("AppLaunchesAtZoom7GeoHashForApp");
      break;
    case 0x28FuLL:
      result = CFSTR("AppLaunchesAtZoom7GeoHash0ForApp");
      break;
    case 0x290uLL:
      result = CFSTR("AppLaunchesAtZoom7GeoHash1ForApp");
      break;
    case 0x291uLL:
      result = CFSTR("AppLaunchesAtZoom7GeoHash2ForApp");
      break;
    case 0x292uLL:
      result = CFSTR("AppLaunchesAtZoom7GeoHash3ForApp");
      break;
    case 0x293uLL:
      result = CFSTR("AppLaunchesAtZoom7GeoHash4ForApp");
      break;
    case 0x294uLL:
      result = CFSTR("AppLaunchesAtZoom7GeoHash5ForApp");
      break;
    case 0x295uLL:
      result = CFSTR("AppLaunchesAtZoom7GeoHash6ForApp");
      break;
    case 0x296uLL:
      result = CFSTR("AppLaunchesAtZoom7GeoHash7ForApp");
      break;
    case 0x297uLL:
      result = CFSTR("AppLaunchesAtZoom7GeoHash8ForApp");
      break;
    case 0x298uLL:
      result = CFSTR("AppLaunchesAtZoom7GeoHash9ForApp");
      break;
    case 0x299uLL:
      result = CFSTR("AppEntropyForZoom7GeoHash");
      break;
    case 0x29AuLL:
      result = CFSTR("AppNumberOfZoom7GeohashesForApp");
      break;
    case 0x29BuLL:
      result = CFSTR("AppGeoAssociationScoreAtZoom7");
      break;
    case 0x29CuLL:
      result = CFSTR("AppGeoAssociationScoreAtZoom13");
      break;
    case 0x29DuLL:
      result = CFSTR("AppGeoAssociationScoreAtZoom16");
      break;
    case 0x29EuLL:
      result = CFSTR("AppPartOfWeekAssociationScore");
      break;
    case 0x29FuLL:
      result = CFSTR("AppCoarseTimeAssociationScore");
      break;
    case 0x2A0uLL:
      result = CFSTR("AppLOITypeAssociationScore");
      break;
    case 0x2A1uLL:
      result = CFSTR("AppLaunchesAtSSIDForAppInContext");
      break;
    case 0x2A2uLL:
      result = CFSTR("AppLaunchesAtSSIDForApp");
      break;
    case 0x2A3uLL:
      result = CFSTR("AppLaunchesForCoreMotionForAppInContext");
      break;
    case 0x2A4uLL:
      result = CFSTR("AppLaunchesInAirplaneModeForAppInContext");
      break;
    case 0x2A5uLL:
      result = CFSTR("HomeScreenAppConfirmsOnDayOfWeekForAppInContext");
      break;
    case 0x2A6uLL:
      result = CFSTR("HomeScreenAppConfirmsOnDayOfWeekInContext");
      break;
    case 0x2A7uLL:
      result = CFSTR("HomeScreenAppConfirmsOnDayOfWeekForApp");
      break;
    case 0x2A8uLL:
      result = CFSTR("HomeScreenAppRejectsOnDayOfWeekForAppInContext");
      break;
    case 0x2A9uLL:
      result = CFSTR("HomeScreenAppRejectsOnDayOfWeekInContext");
      break;
    case 0x2AAuLL:
      result = CFSTR("HomeScreenAppRejectsOnDayOfWeekForApp");
      break;
    case 0x2ABuLL:
      result = CFSTR("HomeScreenAppConfirmsInTwoHourTimeIntervalForAppInContext");
      break;
    case 0x2ACuLL:
      result = CFSTR("HomeScreenAppConfirmsInTwoHourTimeIntervalInContext");
      break;
    case 0x2ADuLL:
      result = CFSTR("HomeScreenAppConfirmsInTwoHourTimeIntervalForApp");
      break;
    case 0x2AEuLL:
      result = CFSTR("HomeScreenAppRejectsInTwoHourTimeIntervalForAppInContext");
      break;
    case 0x2AFuLL:
      result = CFSTR("HomeScreenAppRejectsInTwoHourTimeIntervalInContext");
      break;
    case 0x2B0uLL:
      result = CFSTR("HomeScreenAppRejectsInTwoHourTimeIntervalForApp");
      break;
    case 0x2B1uLL:
      result = CFSTR("HomeScreenAppConfirmsAtCoarseGeohashForAppInContext");
      break;
    case 0x2B2uLL:
      result = CFSTR("HomeScreenAppConfirmsAtCoarseGeohashInContext");
      break;
    case 0x2B3uLL:
      result = CFSTR("HomeScreenAppConfirmsAtCoarseGeohashForApp");
      break;
    case 0x2B4uLL:
      result = CFSTR("HomeScreenAppRejectsAtCoarseGeohashForAppInContext");
      break;
    case 0x2B5uLL:
      result = CFSTR("HomeScreenAppRejectsAtCoarseGeohashInContext");
      break;
    case 0x2B6uLL:
      result = CFSTR("HomeScreenAppRejectsAtCoarseGeohashForApp");
      break;
    case 0x2B7uLL:
      result = CFSTR("HomeScreenAppConfirmsAtSpecificGeohashForAppInContext");
      break;
    case 0x2B8uLL:
      result = CFSTR("HomeScreenAppConfirmsAtSpecificGeohashInContext");
      break;
    case 0x2B9uLL:
      result = CFSTR("HomeScreenAppConfirmsAtSpecificGeohashForApp");
      break;
    case 0x2BAuLL:
      result = CFSTR("HomeScreenAppRejectsAtSpecificGeohashForAppInContext");
      break;
    case 0x2BBuLL:
      result = CFSTR("HomeScreenAppRejectsAtSpecificGeohashInContext");
      break;
    case 0x2BCuLL:
      result = CFSTR("HomeScreenAppRejectsAtSpecificGeohashForApp");
      break;
    case 0x2BDuLL:
      result = CFSTR("HomeScreenAppConfirmsAtCoarseTimePOWLocationForAppInContext");
      break;
    case 0x2BEuLL:
      result = CFSTR("HomeScreenAppConfirmsAtCoarseTimePOWLocationInContext");
      break;
    case 0x2BFuLL:
      result = CFSTR("HomeScreenAppConfirmsAtCoarseTimePOWLocationForApp");
      break;
    case 0x2C0uLL:
      result = CFSTR("HomeScreenAppRejectsAtCoarseTimePOWLocationForAppInContext");
      break;
    case 0x2C1uLL:
      result = CFSTR("HomeScreenAppRejectsAtCoarseTimePOWLocationInContext");
      break;
    case 0x2C2uLL:
      result = CFSTR("HomeScreenAppRejectsAtCoarseTimePOWLocationForApp");
      break;
    case 0x2C3uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppExplicitRejectsAtCoarseTimePOWLocationForAppInContext");
      break;
    case 0x2C4uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppExplicitRejectsAtCoarseTimePOWLocationInContext");
      break;
    case 0x2C5uLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppExplicitRejectsAtCoarseTimePOWLocationForApp");
      break;
    case 0x2C6uLL:
      result = CFSTR("HomeScreenAppConfirmsAtSpecificTimeDOWLocationForAppInContext");
      break;
    case 0x2C7uLL:
      result = CFSTR("HomeScreenAppConfirmsAtSpecificTimeDOWLocationInContext");
      break;
    case 0x2C8uLL:
      result = CFSTR("HomeScreenAppConfirmsAtSpecificTimeDOWLocationForApp");
      break;
    case 0x2C9uLL:
      result = CFSTR("HomeScreenAppRejectsAtSpecificTimeDOWLocationForAppInContext");
      break;
    case 0x2CAuLL:
      result = CFSTR("HomeScreenAppRejectsAtSpecificTimeDOWLocationInContext");
      break;
    case 0x2CBuLL:
      result = CFSTR("HomeScreenAppRejectsAtSpecificTimeDOWLocationForApp");
      break;
    case 0x2CCuLL:
      result = CFSTR("HomeScreenTotalLaunchesForApp");
      break;
    case 0x2CDuLL:
      result = CFSTR("HomeScreenTotalLaunchesForAllApps");
      break;
    case 0x2CEuLL:
      result = CFSTR("AppDirectoryTotalLaunchesForApp");
      break;
    case 0x2CFuLL:
      result = CFSTR("AppDirectoryTotalLaunchesForAllApps");
      break;
    case 0x2D0uLL:
      result = CFSTR("AppDirectoryConfirmsOnDayOfWeekForAppInContext");
      break;
    case 0x2D1uLL:
      result = CFSTR("AppDirectoryConfirmsOnDayOfWeekInContext");
      break;
    case 0x2D2uLL:
      result = CFSTR("AppDirectoryConfirmsOnDayOfWeekForApp");
      break;
    case 0x2D3uLL:
      result = CFSTR("AppDirectoryRejectsOnDayOfWeekForAppInContext");
      break;
    case 0x2D4uLL:
      result = CFSTR("AppDirectoryRejectsOnDayOfWeekInContext");
      break;
    case 0x2D5uLL:
      result = CFSTR("AppDirectoryRejectsOnDayOfWeekForApp");
      break;
    case 0x2D6uLL:
      result = CFSTR("AppDirectoryConfirmsInTwoHourTimeIntervalForAppInContext");
      break;
    case 0x2D7uLL:
      result = CFSTR("AppDirectoryConfirmsInTwoHourTimeIntervalInContext");
      break;
    case 0x2D8uLL:
      result = CFSTR("AppDirectoryConfirmsInTwoHourTimeIntervalForApp");
      break;
    case 0x2D9uLL:
      result = CFSTR("AppDirectoryRejectsInTwoHourTimeIntervalForAppInContext");
      break;
    case 0x2DAuLL:
      result = CFSTR("AppDirectoryRejectsInTwoHourTimeIntervalInContext");
      break;
    case 0x2DBuLL:
      result = CFSTR("AppDirectoryRejectsInTwoHourTimeIntervalForApp");
      break;
    case 0x2DCuLL:
      result = CFSTR("AppDirectoryConfirmsAtCoarseGeohashForAppInContext");
      break;
    case 0x2DDuLL:
      result = CFSTR("AppDirectoryConfirmsAtCoarseGeohashInContext");
      break;
    case 0x2DEuLL:
      result = CFSTR("AppDirectoryConfirmsAtCoarseGeohashForApp");
      break;
    case 0x2DFuLL:
      result = CFSTR("AppDirectoryRejectsAtCoarseGeohashForAppInContext");
      break;
    case 0x2E0uLL:
      result = CFSTR("AppDirectoryRejectsAtCoarseGeohashInContext");
      break;
    case 0x2E1uLL:
      result = CFSTR("AppDirectoryRejectsAtCoarseGeohashForApp");
      break;
    case 0x2E2uLL:
      result = CFSTR("AppDirectoryConfirmsAtSpecificGeohashForAppInContext");
      break;
    case 0x2E3uLL:
      result = CFSTR("AppDirectoryConfirmsAtSpecificGeohashInContext");
      break;
    case 0x2E4uLL:
      result = CFSTR("AppDirectoryConfirmsAtSpecificGeohashForApp");
      break;
    case 0x2E5uLL:
      result = CFSTR("AppDirectoryRejectsAtSpecificGeohashForAppInContext");
      break;
    case 0x2E6uLL:
      result = CFSTR("AppDirectoryRejectsAtSpecificGeohashInContext");
      break;
    case 0x2E7uLL:
      result = CFSTR("AppDirectoryRejectsAtSpecificGeohashForApp");
      break;
    case 0x2E8uLL:
      result = CFSTR("AppDirectoryConfirmsAtCoarseTimePOWLocationForAppInContext");
      break;
    case 0x2E9uLL:
      result = CFSTR("AppDirectoryConfirmsAtCoarseTimePOWLocationInContext");
      break;
    case 0x2EAuLL:
      result = CFSTR("AppDirectoryConfirmsAtCoarseTimePOWLocationForApp");
      break;
    case 0x2EBuLL:
      result = CFSTR("AppDirectoryRejectsAtCoarseTimePOWLocationForAppInContext");
      break;
    case 0x2ECuLL:
      result = CFSTR("AppDirectoryRejectsAtCoarseTimePOWLocationInContext");
      break;
    case 0x2EDuLL:
      result = CFSTR("AppDirectoryRejectsAtCoarseTimePOWLocationForApp");
      break;
    case 0x2EEuLL:
      result = CFSTR("AppDirectoryExplicitRejectsAtCoarseTimePOWLocationForAppInContext");
      break;
    case 0x2EFuLL:
      result = CFSTR("AppDirectoryExplicitRejectsAtCoarseTimePOWLocationInContext");
      break;
    case 0x2F0uLL:
      result = CFSTR("AppDirectoryExplicitRejectsAtCoarseTimePOWLocationForApp");
      break;
    case 0x2F1uLL:
      result = CFSTR("AppDirectoryConfirmsAtSpecificTimeDOWLocationForAppInContext");
      break;
    case 0x2F2uLL:
      result = CFSTR("AppDirectoryConfirmsAtSpecificTimeDOWLocationInContext");
      break;
    case 0x2F3uLL:
      result = CFSTR("AppDirectoryConfirmsAtSpecificTimeDOWLocationForApp");
      break;
    case 0x2F4uLL:
      result = CFSTR("AppDirectoryRejectsAtSpecificTimeDOWLocationForAppInContext");
      break;
    case 0x2F5uLL:
      result = CFSTR("AppDirectoryRejectsAtSpecificTimeDOWLocationInContext");
      break;
    case 0x2F6uLL:
      result = CFSTR("AppDirectoryRejectsAtSpecificTimeDOWLocationForApp");
      break;
    case 0x2F7uLL:
      result = CFSTR("HomeScreenAppConfirmsForAllAppsAndContextsDecayedAtCoarseContextRate");
      break;
    case 0x2F8uLL:
      result = CFSTR("HomeScreenAppConfirmsForAllAppsAndContextsDecayedAtSpecificContextRate");
      break;
    case 0x2F9uLL:
      result = CFSTR("HomeScreenAppRejectsForAllAppsAndContextsDecayedAtCoarseContextRate");
      break;
    case 0x2FAuLL:
      result = CFSTR("HomeScreenAppRejectsForAllAppsAndContextsDecayedAtSpecificContextRate");
      break;
    case 0x2FBuLL:
      result = CFSTR("_ATXScoreInputHomeScreenAppExplicitRejectsForAllAppsAndContextsDecayedAtCoarseContextRate");
      break;
    case 0x2FCuLL:
      result = CFSTR("AppDirectoryConfirmsForAllAppsAndContextsDecayedAtCoarseContextRate");
      break;
    case 0x2FDuLL:
      result = CFSTR("AppDirectoryConfirmsForAllAppsAndContextsDecayedAtSpecificContextRate");
      break;
    case 0x2FEuLL:
      result = CFSTR("AppDirectoryRejectsForAllAppsAndContextsDecayedAtCoarseContextRate");
      break;
    case 0x2FFuLL:
      result = CFSTR("AppDirectoryRejectsForAllAppsAndContextsDecayedAtSpecificContextRate");
      break;
    case 0x300uLL:
      result = CFSTR("AppDirectoryExplicitRejectsForAllAppsAndContextsDecayedAtCoarseContextRate");
      break;
    case 0x301uLL:
      result = CFSTR("IsAppClip");
      break;
    case 0x302uLL:
      result = CFSTR("HomeScreenActionConfirmsOnDayOfWeekForActionInContext");
      break;
    case 0x303uLL:
      result = CFSTR("HomeScreenActionConfirmsOnDayOfWeekInContext");
      break;
    case 0x304uLL:
      result = CFSTR("HomeScreenActionConfirmsOnDayOfWeekForAction");
      break;
    case 0x305uLL:
      result = CFSTR("HomeScreenActionConfirmsAtTimeOfDayForActionInContext");
      break;
    case 0x306uLL:
      result = CFSTR("HomeScreenActionConfirmsAtTimeOfDayInContext");
      break;
    case 0x307uLL:
      result = CFSTR("HomeScreenActionConfirmsAtTimeOfDayForAction");
      break;
    case 0x308uLL:
      result = CFSTR("HomeScreenActionConfirmsAtCoarseGeohashForActionInContext");
      break;
    case 0x309uLL:
      result = CFSTR("HomeScreenActionConfirmsAtCoarseGeohashInContext");
      break;
    case 0x30AuLL:
      result = CFSTR("HomeScreenActionConfirmsAtCoarseGeohashForAction");
      break;
    case 0x30BuLL:
      result = CFSTR("HomeScreenActionConfirmsAtSpecificGeohashForActionInContext");
      break;
    case 0x30CuLL:
      result = CFSTR("HomeScreenActionConfirmsAtSpecificGeohashInContext");
      break;
    case 0x30DuLL:
      result = CFSTR("HomeScreenActionConfirmsAtSpecificGeohashForAction");
      break;
    case 0x30EuLL:
      result = CFSTR("HomeScreenActionConfirmsAtCoarseTimePOWLocationForActionInContext");
      break;
    case 0x30FuLL:
      result = CFSTR("HomeScreenActionConfirmsAtCoarseTimePOWLocationInContext");
      break;
    case 0x310uLL:
      result = CFSTR("HomeScreenActionConfirmsAtCoarseTimePOWLocationForAction");
      break;
    case 0x311uLL:
      result = CFSTR("HomeScreenActionConfirmsAtSpecificTimeDOWLocationForActionInContext");
      break;
    case 0x312uLL:
      result = CFSTR("HomeScreenActionConfirmsAtSpecificTimeDOWLocationInContext");
      break;
    case 0x313uLL:
      result = CFSTR("HomeScreenActionConfirmsAtSpecificTimeDOWLocationForAction");
      break;
    case 0x314uLL:
      result = CFSTR("HomeScreenActionRejectsOnDayOfWeekForActionInContext");
      break;
    case 0x315uLL:
      result = CFSTR("HomeScreenActionRejectsOnDayOfWeekInContext");
      break;
    case 0x316uLL:
      result = CFSTR("HomeScreenActionRejectsOnDayOfWeekForAction");
      break;
    case 0x317uLL:
      result = CFSTR("HomeScreenActionRejectsAtTimeOfDayForActionInContext");
      break;
    case 0x318uLL:
      result = CFSTR("HomeScreenActionRejectsAtTimeOfDayInContext");
      break;
    case 0x319uLL:
      result = CFSTR("HomeScreenActionRejectsAtTimeOfDayForAction");
      break;
    case 0x31AuLL:
      result = CFSTR("HomeScreenActionRejectsAtCoarseGeohashForActionInContext");
      break;
    case 0x31BuLL:
      result = CFSTR("HomeScreenActionRejectsAtCoarseGeohashInContext");
      break;
    case 0x31CuLL:
      result = CFSTR("HomeScreenActionRejectsAtCoarseGeohashForAction");
      break;
    case 0x31DuLL:
      result = CFSTR("HomeScreenActionRejectsAtSpecificGeohashForActionInContext");
      break;
    case 0x31EuLL:
      result = CFSTR("HomeScreenActionRejectsAtSpecificGeohashInContext");
      break;
    case 0x31FuLL:
      result = CFSTR("HomeScreenActionRejectsAtSpecificGeohashForAction");
      break;
    case 0x320uLL:
      result = CFSTR("HomeScreenActionRejectsAtCoarseTimePOWLocationForActionInContext");
      break;
    case 0x321uLL:
      result = CFSTR("HomeScreenActionRejectsAtCoarseTimePOWLocationInContext");
      break;
    case 0x322uLL:
      result = CFSTR("HomeScreenActionRejectsAtCoarseTimePOWLocationForAction");
      break;
    case 0x323uLL:
      result = CFSTR("HomeScreenActionRejectsAtSpecificTimeDOWLocationForActionInContext");
      break;
    case 0x324uLL:
      result = CFSTR("HomeScreenActionRejectsAtSpecificTimeDOWLocationInContext");
      break;
    case 0x325uLL:
      result = CFSTR("HomeScreenActionRejectsAtSpecificTimeDOWLocationForAction");
      break;
    case 0x326uLL:
      result = CFSTR("POIPopularityForAppInContext");
      break;
    case 0x327uLL:
      result = CFSTR("AppLaunchPopularityAtPOIForAppInContext");
      break;
    case 0x328uLL:
      result = CFSTR("POICategory");
      break;
    case 0x329uLL:
      result = CFSTR("AppLaunchesAtPOIForAppInContext");
      break;
    case 0x32AuLL:
      result = CFSTR("AppCategoryScore");
      break;
    case 0x32BuLL:
      result = CFSTR("PosteriorProbabilityOfAppGivenMode");
      break;
    case 0x32CuLL:
      result = CFSTR("ClassConditionalProbabilityOfModeGivenApp");
      break;
    case 0x32DuLL:
      result = CFSTR("UniqueOccurrencesOfAppInMode");
      break;
    case 0x32EuLL:
      result = CFSTR("LocalOccurrencesOfAppInMode");
      break;
    case 0x32FuLL:
      result = CFSTR("GlobalOccurrencesOfAppInMode");
      break;
    case 0x330uLL:
      result = CFSTR("AppModeEntityScore");
      break;
    case 0x331uLL:
      result = CFSTR("Max");
      break;
    default:
      if (a3 != 0xFFFFFFFF)
        +[_ATXScoreTypes aggdStringForScoreInput:].cold.1((uint64_t)a2, (uint64_t)CFSTR("AppInFolder"));
      result = CFSTR("Undefined");
      break;
  }
  return result;
}

+ (id)scoreInputsToNames
{
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 817);
  for (i = 0; i != 817; ++i)
  {
    objc_msgSend(a1, "aggdStringForScoreInput:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v6);

  }
  return v3;
}

+ (void)iterScoreInputsWithBlock:(id)a3
{
  void (**v3)(id, uint64_t, unsigned __int8 *);
  uint64_t v4;
  void *v5;
  int v6;
  unsigned __int8 v8;

  v3 = (void (**)(id, uint64_t, unsigned __int8 *))a3;
  v4 = 0;
  v8 = 0;
  do
  {
    v5 = (void *)MEMORY[0x1CAA48B6C]();
    v3[2](v3, v4, &v8);
    v6 = v8;
    objc_autoreleasePoolPop(v5);
    if (v6)
      break;
  }
  while (v4++ != 816);

}

+ (unint64_t)mappingForTopRankedGeoHashSignalsWithResolution:(unint64_t)a3 withRank:(unint64_t)a4 forScoreInputCategory:(unint64_t)a5
{
  if (a3 == 2)
    return +[_ATXScoreTypes mappingForTopRankedZoom7GeoHashSignals:](_ATXScoreTypes, "mappingForTopRankedZoom7GeoHashSignals:", a4);
  if (a3 == 1)
    return +[_ATXScoreTypes mappingForTopRankedCoarseGeoHashSignals:forScoreInputCategory:](_ATXScoreTypes, "mappingForTopRankedCoarseGeoHashSignals:forScoreInputCategory:", a4, a5);
  if (a3)
    return 0xFFFFFFFFLL;
  return +[_ATXScoreTypes mappingForTopRankedSpecificGeoHashSignals:forScoreInputCategory:](_ATXScoreTypes, "mappingForTopRankedSpecificGeoHashSignals:forScoreInputCategory:", a4, a5);
}

+ (unint64_t)mappingForTimeOfDayDistributionSignals:(unint64_t)a3 forScoreInputCategory:(unint64_t)a4
{
  void *v8;
  void *v9;

  if (a4 == 1)
  {
    if (a3 >= 0x19)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_ATXScoreTypes.m"), 3487, CFSTR("timeOfDay parameter had value %lu. It must be in the 0-%d range."), a3, 25);

    }
    return a3 + 589;
  }
  else if (a4)
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    if (a3 >= 0x19)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_ATXScoreTypes.m"), 3483, CFSTR("timeOfDay parameter had value %lu. It must be in the 0-24 range (using 25 time buckets)."), a3);

    }
    return a3 + 445;
  }
}

+ (unint64_t)mappingForDayOfWeekDistributionSignals:(unint64_t)a3 forScoreInputCategory:(unint64_t)a4
{
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v16;
  _QWORD v17[7];
  _QWORD v18[7];
  _QWORD v19[7];
  _QWORD v20[8];

  v20[7] = *MEMORY[0x1E0C80C00];
  if (a3 >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_ATXScoreTypes.m"), 3498, CFSTR("dayOfWeek parameter had value %lu. It must be in the 0-6 range."), a3);

  }
  if (a4 == 1)
  {
    v17[0] = &unk_1E83CB290;
    v17[1] = &unk_1E83CB2C0;
    v18[0] = &unk_1E83CB3E0;
    v18[1] = &unk_1E83CB3F8;
    v17[2] = &unk_1E83CB2F0;
    v17[3] = &unk_1E83CB320;
    v18[2] = &unk_1E83CB410;
    v18[3] = &unk_1E83CB428;
    v17[4] = &unk_1E83CB350;
    v17[5] = &unk_1E83CB380;
    v18[4] = &unk_1E83CB440;
    v18[5] = &unk_1E83CB458;
    v17[6] = &unk_1E83CB3B0;
    v18[6] = &unk_1E83CB470;
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = v18;
    v8 = v17;
  }
  else
  {
    if (a4)
      return 0xFFFFFFFFLL;
    v19[0] = &unk_1E83CB290;
    v19[1] = &unk_1E83CB2C0;
    v20[0] = &unk_1E83CB2A8;
    v20[1] = &unk_1E83CB2D8;
    v19[2] = &unk_1E83CB2F0;
    v19[3] = &unk_1E83CB320;
    v20[2] = &unk_1E83CB308;
    v20[3] = &unk_1E83CB338;
    v19[4] = &unk_1E83CB350;
    v19[5] = &unk_1E83CB380;
    v20[4] = &unk_1E83CB368;
    v20[5] = &unk_1E83CB398;
    v19[6] = &unk_1E83CB3B0;
    v20[6] = &unk_1E83CB3C8;
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = v20;
    v8 = v19;
  }
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v7, v8, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (int)objc_msgSend(v11, "intValue");

  return v12;
}

+ (unint64_t)mappingForTopRankedSpecificGeoHashSignals:(unint64_t)a3 forScoreInputCategory:(unint64_t)a4
{
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v15;
  void *v16;
  _QWORD v17[15];
  _QWORD v18[15];
  _QWORD v19[15];
  _QWORD v20[16];

  v20[15] = *MEMORY[0x1E0C80C00];
  if (a4 == 1)
  {
    if (a3 >= 0xF)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_ATXScoreTypes.m"), 3555, CFSTR("Specific GeoHash rank value %lu outside of expected range (Action Prediction): 0-%d."), a3, 15);

    }
    v17[0] = &unk_1E83CB290;
    v17[1] = &unk_1E83CB2C0;
    v18[0] = &unk_1E83CB6B0;
    v18[1] = &unk_1E83CB6C8;
    v17[2] = &unk_1E83CB2F0;
    v17[3] = &unk_1E83CB320;
    v18[2] = &unk_1E83CB6E0;
    v18[3] = &unk_1E83CB6F8;
    v17[4] = &unk_1E83CB350;
    v17[5] = &unk_1E83CB380;
    v18[4] = &unk_1E83CB710;
    v18[5] = &unk_1E83CB728;
    v17[6] = &unk_1E83CB3B0;
    v17[7] = &unk_1E83CB530;
    v18[6] = &unk_1E83CB740;
    v18[7] = &unk_1E83CB758;
    v17[8] = &unk_1E83CB560;
    v17[9] = &unk_1E83CB590;
    v18[8] = &unk_1E83CB770;
    v18[9] = &unk_1E83CB788;
    v17[10] = &unk_1E83CB5C0;
    v17[11] = &unk_1E83CB5F0;
    v18[10] = &unk_1E83CB7A0;
    v18[11] = &unk_1E83CB7B8;
    v17[12] = &unk_1E83CB620;
    v17[13] = &unk_1E83CB650;
    v18[12] = &unk_1E83CB7D0;
    v18[13] = &unk_1E83CB7E8;
    v17[14] = &unk_1E83CB680;
    v18[14] = &unk_1E83CB800;
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = v18;
    v9 = v17;
  }
  else
  {
    if (a4)
      return 0xFFFFFFFFLL;
    if (a3 >= 0xF)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_ATXScoreTypes.m"), 3534, CFSTR("Specific GeoHash rank value %lu outside of expected range (App Prediction): 0-%d."), a3, 15);

    }
    v19[0] = &unk_1E83CB290;
    v19[1] = &unk_1E83CB2C0;
    v20[0] = &unk_1E83CB488;
    v20[1] = &unk_1E83CB4A0;
    v19[2] = &unk_1E83CB2F0;
    v19[3] = &unk_1E83CB320;
    v20[2] = &unk_1E83CB4B8;
    v20[3] = &unk_1E83CB4D0;
    v19[4] = &unk_1E83CB350;
    v19[5] = &unk_1E83CB380;
    v20[4] = &unk_1E83CB4E8;
    v20[5] = &unk_1E83CB500;
    v19[6] = &unk_1E83CB3B0;
    v19[7] = &unk_1E83CB530;
    v20[6] = &unk_1E83CB518;
    v20[7] = &unk_1E83CB548;
    v19[8] = &unk_1E83CB560;
    v19[9] = &unk_1E83CB590;
    v20[8] = &unk_1E83CB578;
    v20[9] = &unk_1E83CB5A8;
    v19[10] = &unk_1E83CB5C0;
    v19[11] = &unk_1E83CB5F0;
    v20[10] = &unk_1E83CB5D8;
    v20[11] = &unk_1E83CB608;
    v19[12] = &unk_1E83CB620;
    v19[13] = &unk_1E83CB650;
    v20[12] = &unk_1E83CB638;
    v20[13] = &unk_1E83CB668;
    v19[14] = &unk_1E83CB680;
    v20[14] = &unk_1E83CB698;
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = v20;
    v9 = v19;
  }
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v8, v9, 15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (int)objc_msgSend(v12, "intValue");

  return v13;
}

+ (unint64_t)mappingForTopRankedCoarseGeoHashSignals:(unint64_t)a3 forScoreInputCategory:(unint64_t)a4
{
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v15;
  void *v16;
  _QWORD v17[10];
  _QWORD v18[10];
  _QWORD v19[10];
  _QWORD v20[11];

  v20[10] = *MEMORY[0x1E0C80C00];
  if (a4 == 1)
  {
    if (a3 >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_ATXScoreTypes.m"), 3601, CFSTR("Coarse GeoHash rank value %lu outside of expected range (Action Prediction): 0-%d."), a3, 10);

    }
    v17[0] = &unk_1E83CB290;
    v17[1] = &unk_1E83CB2C0;
    v18[0] = &unk_1E83CB908;
    v18[1] = &unk_1E83CB920;
    v17[2] = &unk_1E83CB2F0;
    v17[3] = &unk_1E83CB320;
    v18[2] = &unk_1E83CB938;
    v18[3] = &unk_1E83CB950;
    v17[4] = &unk_1E83CB350;
    v17[5] = &unk_1E83CB380;
    v18[4] = &unk_1E83CB968;
    v18[5] = &unk_1E83CB980;
    v17[6] = &unk_1E83CB3B0;
    v17[7] = &unk_1E83CB530;
    v18[6] = &unk_1E83CB998;
    v18[7] = &unk_1E83CB9B0;
    v17[8] = &unk_1E83CB560;
    v17[9] = &unk_1E83CB590;
    v18[8] = &unk_1E83CB9C8;
    v18[9] = &unk_1E83CB9E0;
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = v18;
    v9 = v17;
  }
  else
  {
    if (a4)
      return 0xFFFFFFFFLL;
    if (a3 >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_ATXScoreTypes.m"), 3585, CFSTR("Coarse GeoHash rank value %lu outside of expected range (App Prediction): 0-%d."), a3, 10);

    }
    v19[0] = &unk_1E83CB290;
    v19[1] = &unk_1E83CB2C0;
    v20[0] = &unk_1E83CB818;
    v20[1] = &unk_1E83CB830;
    v19[2] = &unk_1E83CB2F0;
    v19[3] = &unk_1E83CB320;
    v20[2] = &unk_1E83CB848;
    v20[3] = &unk_1E83CB860;
    v19[4] = &unk_1E83CB350;
    v19[5] = &unk_1E83CB380;
    v20[4] = &unk_1E83CB878;
    v20[5] = &unk_1E83CB890;
    v19[6] = &unk_1E83CB3B0;
    v19[7] = &unk_1E83CB530;
    v20[6] = &unk_1E83CB8A8;
    v20[7] = &unk_1E83CB8C0;
    v19[8] = &unk_1E83CB560;
    v19[9] = &unk_1E83CB590;
    v20[8] = &unk_1E83CB8D8;
    v20[9] = &unk_1E83CB8F0;
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = v20;
    v9 = v19;
  }
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v8, v9, 10);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (int)objc_msgSend(v12, "intValue");

  return v13;
}

+ (unint64_t)mappingForTopRankedZoom7GeoHashSignals:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v11;
  _QWORD v12[10];
  _QWORD v13[11];

  v13[10] = *MEMORY[0x1E0C80C00];
  if (a3 >= 0xA)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_ATXScoreTypes.m"), 3624, CFSTR("Coarse GeoHash rank value %lu outside of expected range (App Prediction): 0-%d."), a3, 10);

  }
  v12[0] = &unk_1E83CB290;
  v12[1] = &unk_1E83CB2C0;
  v13[0] = &unk_1E83CB9F8;
  v13[1] = &unk_1E83CBA10;
  v12[2] = &unk_1E83CB2F0;
  v12[3] = &unk_1E83CB320;
  v13[2] = &unk_1E83CBA28;
  v13[3] = &unk_1E83CBA40;
  v12[4] = &unk_1E83CB350;
  v12[5] = &unk_1E83CB380;
  v13[4] = &unk_1E83CBA58;
  v13[5] = &unk_1E83CBA70;
  v12[6] = &unk_1E83CB3B0;
  v12[7] = &unk_1E83CB530;
  v13[6] = &unk_1E83CBA88;
  v13[7] = &unk_1E83CBAA0;
  v12[8] = &unk_1E83CB560;
  v12[9] = &unk_1E83CB590;
  v13[8] = &unk_1E83CBAB8;
  v13[9] = &unk_1E83CBAD0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  return v7;
}

+ (void)stringForScoreInput:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a1, a2, CFSTR("_ATXScoreTypes.m"), 1711, CFSTR("ATXScoreInput out of range"));

  __break(1u);
}

+ (void)aggdStringForScoreInput:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a1, a2, CFSTR("_ATXScoreTypes.m"), 3441, CFSTR("Score input out of range"));

  __break(1u);
}

@end
