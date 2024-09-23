@implementation HKActivityRingViewSizingDirective

void __63___HKActivityRingViewSizingDirective_sortedRingRatioDirectives__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[13];

  v14[12] = *MEMORY[0x24BDAC8D0];
  +[_HKActivityRingViewSizingDirective activityRingSizingDirectiveWithIdentifier:width:outerRingOffset:ringThickness:ringInterspacing:](_HKActivityRingViewSizingDirective, "activityRingSizingDirectiveWithIdentifier:width:outerRingOffset:ringThickness:ringInterspacing:", CFSTR("Lower sentinel"), 0.0, 0.0, 1.0, 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v13;
  +[_HKActivityRingViewSizingDirective activityRingSizingDirectiveWithIdentifier:width:outerRingOffset:ringThickness:ringInterspacing:](_HKActivityRingViewSizingDirective, "activityRingSizingDirectiveWithIdentifier:width:outerRingOffset:ringThickness:ringInterspacing:", CFSTR("NLSessionSummaryTableViewController small"), 20.0, 0.0, 2.0, 1.5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v12;
  +[_HKActivityRingViewSizingDirective activityRingSizingDirectiveWithIdentifier:width:outerRingOffset:ringThickness:ringInterspacing:](_HKActivityRingViewSizingDirective, "activityRingSizingDirectiveWithIdentifier:width:outerRingOffset:ringThickness:ringInterspacing:", CFSTR("NLSessionSummaryTableViewController large"), 22.0, 0.0, 2.5, 1.5);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v0;
  +[_HKActivityRingViewSizingDirective activityRingSizingDirectiveWithIdentifier:width:outerRingOffset:ringThickness:ringInterspacing:](_HKActivityRingViewSizingDirective, "activityRingSizingDirectiveWithIdentifier:width:outerRingOffset:ringThickness:ringInterspacing:", CFSTR("Interactive Chart Annotation"), 25.0, 0.0, 2.0, 2.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v1;
  +[_HKActivityRingViewSizingDirective activityRingSizingDirectiveWithIdentifier:width:outerRingOffset:ringThickness:ringInterspacing:](_HKActivityRingViewSizingDirective, "activityRingSizingDirectiveWithIdentifier:width:outerRingOffset:ringThickness:ringInterspacing:", CFSTR("Phone Social Friend List small"), 41.0, 1.0, 5.0, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v2;
  +[_HKActivityRingViewSizingDirective activityRingSizingDirectiveWithIdentifier:width:outerRingOffset:ringThickness:ringInterspacing:](_HKActivityRingViewSizingDirective, "activityRingSizingDirectiveWithIdentifier:width:outerRingOffset:ringThickness:ringInterspacing:", CFSTR("Phone Social Friend List medium"), 48.0, 1.0, 5.5, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v3;
  +[_HKActivityRingViewSizingDirective activityRingSizingDirectiveWithIdentifier:width:outerRingOffset:ringThickness:ringInterspacing:](_HKActivityRingViewSizingDirective, "activityRingSizingDirectiveWithIdentifier:width:outerRingOffset:ringThickness:ringInterspacing:", CFSTR("Phone Social Friend List large"), 52.0, 1.0, 6.0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v4;
  +[_HKActivityRingViewSizingDirective activityRingSizingDirectiveWithIdentifier:width:outerRingOffset:ringThickness:ringInterspacing:](_HKActivityRingViewSizingDirective, "activityRingSizingDirectiveWithIdentifier:width:outerRingOffset:ringThickness:ringInterspacing:", CFSTR("Watch Social Friends View"), 62.0, 0.0, 6.0, 3.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[7] = v5;
  +[_HKActivityRingViewSizingDirective activityRingSizingDirectiveWithIdentifier:width:outerRingOffset:ringThickness:ringInterspacing:](_HKActivityRingViewSizingDirective, "activityRingSizingDirectiveWithIdentifier:width:outerRingOffset:ringThickness:ringInterspacing:", CFSTR("Phone Social Friends View"), 128.0, 0.0, 13.0, 1.5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[8] = v6;
  +[_HKActivityRingViewSizingDirective activityRingSizingDirectiveWithIdentifier:width:outerRingOffset:ringThickness:ringInterspacing:](_HKActivityRingViewSizingDirective, "activityRingSizingDirectiveWithIdentifier:width:outerRingOffset:ringThickness:ringInterspacing:", CFSTR("There's no directives here so this value make them look better"), 200.0, 0.0, 18.0, 3.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[9] = v7;
  +[_HKActivityRingViewSizingDirective activityRingSizingDirectiveWithIdentifier:width:outerRingOffset:ringThickness:ringInterspacing:](_HKActivityRingViewSizingDirective, "activityRingSizingDirectiveWithIdentifier:width:outerRingOffset:ringThickness:ringInterspacing:", CFSTR("CHSharingRingImageForActivitySummaryDateWheelchairUser"), 816.0, 0.0, 111.0, 6.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[10] = v8;
  +[_HKActivityRingViewSizingDirective activityRingSizingDirectiveWithIdentifier:width:outerRingOffset:ringThickness:ringInterspacing:](_HKActivityRingViewSizingDirective, "activityRingSizingDirectiveWithIdentifier:width:outerRingOffset:ringThickness:ringInterspacing:", CFSTR("Upper sentinel"), 2000.0, 0.0, 200.0, 16.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[11] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 12);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)sortedRingRatioDirectives_sortedRingRatioDirectives;
  sortedRingRatioDirectives_sortedRingRatioDirectives = v10;

}

@end
