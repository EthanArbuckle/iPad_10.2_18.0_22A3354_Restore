@implementation AXMoviesAssistantGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
}

void __54__AXMoviesAssistantGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_183, &__block_literal_global_234, 0, &__block_literal_global_240);

}

uint64_t __54__AXMoviesAssistantGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("SiriMoviesChevronButton"));
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriMoviesMovieListCellView"), CFSTR("_movieTitleLabel"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriMoviesMovieListCellView"), CFSTR("_showtimeLabel"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriMoviesMovieListCellView"), CFSTR("_ratingView"), "SiriUIBorderedLabelView");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriMoviesMovieListCellView"), CFSTR("_tomatoView"), "SiriMoviesRottenTomatoesRatingView");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriUIBorderedLabelView"), CFSTR("_ratingLabel"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriMoviesRottenTomatoesRatingView"), CFSTR("_percentageLabel"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriMoviesDetailView"), CFSTR("_watchTrailerButton"), "UIButton");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriMoviesDetailView"), CFSTR("_reviewsButton"), "SiriUIChevronButton");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriMoviesChevronButton"), CFSTR("primaryString"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriMoviesChevronButton"), CFSTR("secondaryString"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriMoviesChevronButton"), CFSTR("showtimeListView"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriMoviesShowtimeListView"), CFSTR("showtimes"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SAMovieShowtime"), CFSTR("showtime"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SACalendar"), CFSTR("date"), "@", 0);

  return 1;
}

uint64_t __54__AXMoviesAssistantGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Assistant Movies AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Assistant Movies"));

  return AXPerformValidationChecks();
}

void __54__AXMoviesAssistantGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SiriMoviesMovieListCellViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SiriUIBorderedLabelViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SiriMoviesRottenTomatoesRatingViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SiriMoviesDetailViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SiriMoviesChevronButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SiriMoviesMovieCreditsViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SiriMoviesChevronCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SiriMoviesAttributionCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SiriMoviesIndividualShowtimeViewAccessibility"), 1);

}

@end
