@implementation CDInteractionsStatisticsConfig

void __63___CDInteractionsStatisticsConfig_computationBlockForStatName___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[19];
  _QWORD v3[20];

  v3[19] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("ConversationBundleId");
  v2[1] = CFSTR("RecipientListConversationId");
  v3[0] = &__block_literal_global_120;
  v3[1] = &__block_literal_global_121;
  v2[2] = CFSTR("timeSinceLastOutgoingInteraction");
  v2[3] = CFSTR("timeSinceOutgoingInteractionNumber10");
  v3[2] = &__block_literal_global_122_0;
  v3[3] = &__block_literal_global_123;
  v2[4] = CFSTR("timeSinceLastIncomingInteraction");
  v2[5] = CFSTR("numberOfSharesWithConversation");
  v3[4] = &__block_literal_global_124;
  v3[5] = &__block_literal_global_125;
  v2[6] = CFSTR("numberOfSharesFromCurrentAppWithConversation");
  v2[7] = CFSTR("numberOfSharesOfTopDomainURLWithConversation");
  v3[6] = &__block_literal_global_126;
  v3[7] = &__block_literal_global_127;
  v2[8] = CFSTR("numberOfSharesOfDetectedPeopleWithConversation");
  v2[9] = CFSTR("numberOfSharesOfPeopleInPhotoWithConversation");
  v3[8] = &__block_literal_global_128;
  v3[9] = &__block_literal_global_129;
  v2[10] = CFSTR("numberOfOutgoingInteractionsWithConversation");
  v2[11] = CFSTR("numberOfIncomingInteractionsWithConversation");
  v3[10] = &__block_literal_global_130;
  v3[11] = &__block_literal_global_131;
  v2[12] = CFSTR("numberOfInteractionsDuringTimePeriodWithConversation");
  v2[13] = CFSTR("hasEverSharePlayedWithConversation");
  v3[12] = &__block_literal_global_132;
  v3[13] = &__block_literal_global_133;
  v2[14] = CFSTR("numberOfEngagedSuggestionsWithConversation");
  v2[15] = CFSTR("numberOfEngagedSuggestionsFromCurrentAppWithConversation");
  v3[14] = &__block_literal_global_134;
  v3[15] = &__block_literal_global_135;
  v2[16] = CFSTR("numberOfEngagedSuggestionsOfTopDomainURLWithConversation");
  v2[17] = CFSTR("numberOfEngagedSuggestionsOfDetectedPeopleWithConversation");
  v3[16] = &__block_literal_global_136;
  v3[17] = &__block_literal_global_137;
  v2[18] = CFSTR("numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation");
  v3[18] = &__block_literal_global_138;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 19);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)computationBlockForStatName__statNameToComputationBlock;
  computationBlockForStatName__statNameToComputationBlock = v0;

}

void __63___CDInteractionsStatisticsConfig_computationBlockForStatName___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  -[_CDInteractionsStatisticsConfig computeConversationBundleIdForConversationId:interactionRecord:inInteractionsStatistics:](a2, a3, a4, a5);
}

void __63___CDInteractionsStatisticsConfig_computationBlockForStatName___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  -[_CDInteractionsStatisticsConfig computeRecipientListConversationIdForConversationId:interactionRecord:inInteractionsStatistics:](a2, a3, a4, a5);
}

void __63___CDInteractionsStatisticsConfig_computationBlockForStatName___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  -[_CDInteractionsStatisticsConfig computeTimeSinceLastOutgoingInteractionForConversationId:interactionRecord:inInteractionsStatistics:](a2, a3, a4, a5);
}

void __63___CDInteractionsStatisticsConfig_computationBlockForStatName___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  -[_CDInteractionsStatisticsConfig computeTimeSinceOutgoingInteractionNumber10ForConversationId:interactionRecord:inInteractionsStatistics:](a2, a3, a4, a5);
}

void __63___CDInteractionsStatisticsConfig_computationBlockForStatName___block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  -[_CDInteractionsStatisticsConfig computeTimeSinceLastIncomingInteractionForConversationId:interactionRecord:inInteractionsStatistics:](a2, a3, a4, a5);
}

void __63___CDInteractionsStatisticsConfig_computationBlockForStatName___block_invoke_7(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  -[_CDInteractionsStatisticsConfig computeNumberOfSharesWithConversationId:interactionRecord:inInteractionsStatistics:](a2, a3, a4, a5);
}

void __63___CDInteractionsStatisticsConfig_computationBlockForStatName___block_invoke_8(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  -[_CDInteractionsStatisticsConfig computeNumberOfSharesFromCurrentAppWithConversationForConversationId:interactionRecord:inInteractionsStatistics:](a2, a3, a4, a5);
}

void __63___CDInteractionsStatisticsConfig_computationBlockForStatName___block_invoke_9(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  -[_CDInteractionsStatisticsConfig computeNumberOfSharesOfTopDomainURLWithConversationForConversationId:interactionRecord:inInteractionsStatistics:](a2, a3, a4, a5);
}

void __63___CDInteractionsStatisticsConfig_computationBlockForStatName___block_invoke_10(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  -[_CDInteractionsStatisticsConfig computeNumberOfSharesOfDetectedPeopleWithConversationId:interactionRecord:inInteractionsStatistics:](a2, a3, a4, a5);
}

void __63___CDInteractionsStatisticsConfig_computationBlockForStatName___block_invoke_11(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  -[_CDInteractionsStatisticsConfig computePhotoFeaturesForConversationId:interactionRecord:inInteractionsStatistics:](a2, a3, a4, a5);
}

void __63___CDInteractionsStatisticsConfig_computationBlockForStatName___block_invoke_12(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  -[_CDInteractionsStatisticsConfig computeNumberOfOutgoingInteractionsWithConversationId:interactionRecord:inInteractionsStatistics:](a2, a3, a4, a5);
}

void __63___CDInteractionsStatisticsConfig_computationBlockForStatName___block_invoke_13(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  -[_CDInteractionsStatisticsConfig computeNumberOfIncomingInteractionsWithConversationId:interactionRecord:inInteractionsStatistics:](a2, a3, a4, a5);
}

void __63___CDInteractionsStatisticsConfig_computationBlockForStatName___block_invoke_14(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  -[_CDInteractionsStatisticsConfig computeNumberOfInteractionsDuringTimePeriodWithConversationForConversationId:interactionRecord:inInteractionsStatistics:](a2, a3, a4, a5);
}

void __63___CDInteractionsStatisticsConfig_computationBlockForStatName___block_invoke_15(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  -[_CDInteractionsStatisticsConfig computeHasEverSharePlayedWithConversationId:interactionRecord:inInteractionsStatistics:](a2, a3, a4, a5);
}

void __63___CDInteractionsStatisticsConfig_computationBlockForStatName___block_invoke_16(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  -[_CDInteractionsStatisticsConfig computeNumberOfEngagedSuggestionsWithConversationId:interactionRecord:inInteractionsStatistics:](a2, a3, a4, a5);
}

void __63___CDInteractionsStatisticsConfig_computationBlockForStatName___block_invoke_17(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  -[_CDInteractionsStatisticsConfig computeNumberOfEngagedSuggestionsFromCurrentAppWithConversationForConversationId:interactionRecord:inInteractionsStatistics:](a2, a3, a4, a5);
}

void __63___CDInteractionsStatisticsConfig_computationBlockForStatName___block_invoke_18(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  -[_CDInteractionsStatisticsConfig computeNumberOfEngagedSuggestionsOfTopDomainURLWithConversationForConversationId:interactionRecord:inInteractionsStatistics:](a2, a3, a4, a5);
}

void __63___CDInteractionsStatisticsConfig_computationBlockForStatName___block_invoke_19(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  -[_CDInteractionsStatisticsConfig computeNumberOfEngagedSuggestionsOfDetectedPeopleWithConversationId:interactionRecord:inInteractionsStatistics:](a2, a3, a4, a5);
}

void __63___CDInteractionsStatisticsConfig_computationBlockForStatName___block_invoke_20(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  -[_CDInteractionsStatisticsConfig computeNumberOfEngagedSuggestionsOfPhotoFeaturesForConversationId:interactionRecord:inInteractionsStatistics:](a2, a3, a4, a5);
}

void __51___CDInteractionsStatisticsConfig_isDateInWeekend___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x193FEE914]();
  objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)isDateInWeekend___pasExprOnceResult;
  isDateInWeekend___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
