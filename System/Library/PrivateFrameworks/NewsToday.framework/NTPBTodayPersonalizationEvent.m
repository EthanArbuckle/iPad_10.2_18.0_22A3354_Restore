@implementation NTPBTodayPersonalizationEvent

void __157__NTPBTodayPersonalizationEvent_FTAdditions__ft_eventWithDate_action_headline_section_headlineIndexInSection_precedingHeadlinesCount_precedingSectionsCount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  int v8;
  double v9;
  id v10;

  v5 = a3;
  v6 = a2;
  v10 = (id)objc_opt_new();
  objc_msgSend(v10, "setTagId:", v6);

  objc_msgSend(v5, "floatValue");
  v8 = v7;

  LODWORD(v9) = v8;
  objc_msgSend(v10, "setScore:", v9);
  objc_msgSend(*(id *)(a1 + 32), "addHeadlineTopics:", v10);

}

@end
