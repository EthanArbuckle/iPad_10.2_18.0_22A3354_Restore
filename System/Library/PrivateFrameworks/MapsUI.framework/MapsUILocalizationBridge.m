@implementation MapsUILocalizationBridge

+ (id)evChargingSectionHeaderAvailableNow
{
  return _MULocalizedStringFromThisBundle(CFSTR("Available Now [EV Charging Placecard section header]"));
}

+ (id)evChargingPlugDescriptionDelimiter
{
  return _MULocalizedStringFromThisBundle(CFSTR("Delimiter [Placecard EV Charging plug description]"));
}

+ (id)evChargingSpeedFast
{
  return _MULocalizedStringFromThisBundle(CFSTR("Fast [EV Charging Placecard]"));
}

+ (id)evChargingSpeedSlow
{
  return _MULocalizedStringFromThisBundle(CFSTR("Slow [EV Charging Placecard]"));
}

+ (id)evChargers
{
  return _MULocalizedStringFromThisBundle(CFSTR("Chargers [EV Charging]"));
}

+ (id)evChargingOtherChargers
{
  return _MULocalizedStringFromThisBundle(CFSTR("Other Chargers [EV Charging Placecard section header]"));
}

+ (id)evChargingOfflineChargers
{
  return _MULocalizedStringFromThisBundle(CFSTR("Offline Chargers [EV Charging Placecard section header]"));
}

+ (id)transitDeparturesSectionHeaderTitle
{
  return _MULocalizedStringFromThisBundle(CFSTR("Departures [Placecard]"));
}

+ (id)transitConnectionsSectionHeaderTitle
{
  return _MULocalizedStringFromThisBundle(CFSTR("Connections [Placecard]"));
}

+ (id)transitDeparturesCountdownFormatString
{
  return _MULocalizedStringFromThisBundle(CFSTR("%@ min [PlaceCard, Transit, Departures, Countdown]"));
}

+ (id)transitDeparturesCountdownUnitString
{
  return _MULocalizedStringFromThisBundle(CFSTR("min [PlaceCard, Transit, Departures, Countdown, Unit]"));
}

+ (id)transitDeparturesRowNowString
{
  return _MULocalizedStringFromThisBundle(CFSTR("TransitDeparture_Now"));
}

+ (id)commaDelimeter
{
  return _MULocalizedStringFromThisBundle(CFSTR(", [Comma delimeter MapsUI]"));
}

+ (id)interpunctDelimeter
{
  return _MULocalizedStringFromThisBundle(CFSTR(" · [Interpunct delimeter MapsUI]"));
}

+ (id)hoursSectionTitleString
{
  return _MULocalizedStringFromThisBundle(CFSTR("Hours [Placecard]"));
}

+ (id)addressSectionTitleString
{
  return _MULocalizedStringFromThisBundle(CFSTR("Address [Placecard]"));
}

+ (id)dropPinAtCurrentLocationTitle
{
  __CFString *v2;

  if (+[MULibraryUIUtilities isMyPlacesEnabled](MULibraryUIUtilities, "isMyPlacesEnabled"))
    v2 = CFSTR("Mark My Location [Place Card]");
  else
    v2 = CFSTR("Drop Pin [Place Card]");
  _MULocalizedStringFromThisBundle(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)removeDroppedPinTitle
{
  __CFString *v2;

  if (+[MULibraryUIUtilities isMyPlacesEnabled](MULibraryUIUtilities, "isMyPlacesEnabled"))
    v2 = CFSTR("Remove Marked Location [Place Card]");
  else
    v2 = CFSTR("Remove Dropped Pin [Place Card]");
  _MULocalizedStringFromThisBundle(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)phoneCallToActionTitle
{
  return _MULocalizedStringFromThisBundle(CFSTR("Call [Place Card]"));
}

+ (id)directionsTitleString
{
  return _MULocalizedStringFromThisBundle(CFSTR("Directions [Placecard]"));
}

+ (id)placeCardDistanceFactoidTitle
{
  return _MULocalizedStringFromThisBundle(CFSTR("Distance [Placecard]"));
}

+ (id)photoSliderTitle
{
  return _MULocalizedStringFromThisBundle(CFSTR("Photos [Placecard]"));
}

+ (id)amenitiesSectionTitle
{
  return _MULocalizedStringFromThisBundle(CFSTR("Good to Know [Placecard]"));
}

+ (id)textBlockMoreText
{
  return _MULocalizedStringFromThisBundle(CFSTR("More [See All Blurb View]"));
}

+ (id)placeDescriptionSectionTitle
{
  return _MULocalizedStringFromThisBundle(CFSTR("About [Placecard]"));
}

+ (id)noteSectionTitle
{
  return _MULocalizedStringFromThisBundle(CFSTR("Note [Placecard]"));
}

+ (id)forYourVehicleNameFormatString
{
  return _MULocalizedStringFromThisBundle(CFSTR("For Your car name [Placecard]"));
}

+ (id)forYourVehicleNameFormatStringTwoVehicles
{
  return _MULocalizedStringFromThisBundle(CFSTR("For Your car-name-1 and car-name-2 [Placecard]"));
}

+ (id)forYourVehicleNameFormatStringThreeVehicles
{
  return _MULocalizedStringFromThisBundle(CFSTR("For Your car-name-1, car-name-2, and car-name-3 [Placecard]"));
}

+ (id)forYourVehicles
{
  return _MULocalizedStringFromThisBundle(CFSTR("For Your Vehicles [Placecard]"));
}

+ (id)trails
{
  return _MULocalizedStringFromThisBundle(CFSTR("Trails [Place card]"));
}

+ (id)trailheads
{
  return _MULocalizedStringFromThisBundle(CFSTR("Trailheads [Place card]"));
}

+ (id)priceRangeRibbonTitle
{
  return _MULocalizedStringFromThisBundle(CFSTR("Cost [Placecard]"));
}

+ (id)ratingsRibbonTitle
{
  return _MULocalizedStringFromThisBundle(CFSTR("Ratings [Section Header]"));
}

+ (id)watchRatingAndUserScoreFormatString
{
  return _MULocalizedStringFromThisBundle(CFSTR("%@ (%@)"));
}

+ (id)watchThirdPartyRatingRowFormatString
{
  return _MULocalizedStringFromThisBundle(CFSTR("%@ \non %@"));
}

+ (id)loadingText
{
  return _MULocalizedStringFromThisBundle(CFSTR("Loading View"));
}

+ (id)moreLinesText
{
  return _MULocalizedStringFromThisBundle(CFSTR("More Lines [Transit Station]"));
}

+ (id)moreLinesButtonSubText
{
  return _MULocalizedStringFromThisBundle(CFSTR("+%@"));
}

+ (id)inlineMapAccessibilityLabel
{
  return _MULocalizedStringFromThisBundle(CFSTR("Inline Map [Accessibility]"));
}

+ (id)callAccessibilityLabel
{
  return _MULocalizedStringFromThisBundle(CFSTR("Call [Accessibility]"));
}

+ (id)transportTypeEtaAccessibilityLabelFormat
{
  return _MULocalizedStringFromThisBundle(CFSTR("Directions label [Accessibility]"));
}

+ (id)placeCardNoResultsErrorMessage
{
  return _MULocalizedStringFromThisBundle(CFSTR("Place card loading error message"));
}

+ (id)transitStationDeparturesFallbackErrorMessage
{
  return _MULocalizedStringFromThisBundle(CFSTR("Transit station departures fallback error message"));
}

+ (id)distanceAwayFormatString
{
  return _MULocalizedStringFromThisBundle(CFSTR("[distance] away"));
}

+ (id)moreButtonLabel
{
  return _MULocalizedStringFromThisBundle(CFSTR("More [Placecard]"));
}

+ (id)addANoteTitle
{
  return _MULocalizedStringFromThisBundle(CFSTR("Add a note title [Placecard]"));
}

+ (id)addANotePromptText
{
  return _MULocalizedStringFromThisBundle(CFSTR("Add a note prompt [Placecard]"));
}

+ (id)editNoteTitle
{
  return _MULocalizedStringFromThisBundle(CFSTR("Edit Note [Placecard]"));
}

+ (id)deleteNoteButtonLabel
{
  return _MULocalizedStringFromThisBundle(CFSTR("Delete Note [Placecard]"));
}

+ (id)placeCardNotePrivacyText
{
  return _MULocalizedStringFromThisBundle(CFSTR("Note Privacy [Placecard]"));
}

+ (id)developerPlaceCardOpenInMapsText
{
  return _MULocalizedStringFromThisBundle(CFSTR("[Developer Place Card] Open in Apple Maps"));
}

+ (id)developerPlaceCardCompactAttributionFormatString
{
  return _MULocalizedStringFromThisBundle(CFSTR("[Developer Place Card] Compact Attribution"));
}

@end
